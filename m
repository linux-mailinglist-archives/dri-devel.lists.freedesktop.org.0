Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E04DA4E97EA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 15:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B3E10EA14;
	Mon, 28 Mar 2022 13:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB9010E91B;
 Mon, 28 Mar 2022 13:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648473657; x=1680009657;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=hQbVk32fxS7+iFd8ykV9cIZgnUbgW0E9CQ+k6Emh+IA=;
 b=M3rI2+P4Ti2Bw7BeuKCvQn9GEuhNo3agaXN3Fb1crVhhid2m/Iv+Y7Ip
 YWu2Os9sMKrofnr29sPN2oUsrMStm1vQy79zUSK0erMb4h9WXLP8UoWxs
 xedajseO+uf6vPQTaUJeQGnjct6+sQKXaUMoelLXhs13C2gEsgbTw0uR2
 Ci9H1rYdHo1GRbFdfg4wI+Vhnt7BRJR2ReNJtqQTwAzgxQJVXXkooOoh8
 ks9tMYBXHg1pn5ZzCsob3g+bYzvmZdrX8zl5kUkGJwMLEogtCaGCZhCvf
 eG25yF4BZ3RHRONHlpg4nWIWdVFZmpQtNj2qP1PfdfwJpLatJc+eyIeo8 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="257823103"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="257823103"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 06:20:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="563651318"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 06:20:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 03/11] drm/edid: slightly restructure
 timing and non-timing descriptor structs
In-Reply-To: <202203281926.AthxJpnK-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <04c8140a780dc02155a16d8acc64dbce756739bb.1648458971.git.jani.nikula@intel.com>
 <202203281926.AthxJpnK-lkp@intel.com>
Date: Mon, 28 Mar 2022 16:20:44 +0300
Message-ID: <87ee2mdxhv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: kbuild-all@lists.01.org, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


I think I'm just going to revert back to my original plan of leaving the
struct restructuring to another time in the future.

BR,
Jani.


On Mon, 28 Mar 2022, kernel test robot <lkp@intel.com> wrote:
> Hi Jani,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on drm/drm-next]
> [also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip v5.1=
7 next-20220328]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-ed=
id-constify-EDID-parsing-with-some-fixes/20220328-171858
> base:   git://anongit.freedesktop.org/drm/drm drm-next
> config: x86_64-randconfig-a003-20220328 (https://download.01.org/0day-ci/=
archive/20220328/202203281926.AthxJpnK-lkp@intel.com/config)
> compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
> reproduce (this is a W=3D1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/f538c9296c54ce8f8=
78432153584a68939ffc111
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Jani-Nikula/drm-edid-constify-ED=
ID-parsing-with-some-fixes/20220328-171858
>         git checkout f538c9296c54ce8f878432153584a68939ffc111
>         # save the config file to linux build tree
>         mkdir build_dir
>         make W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/=
gpu/drm/tiny/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    drivers/gpu/drm/tiny/gm12u320.c:478:4: error: 'struct detailed_timing'=
 has no member named 'pixel_clock'
>      478 |   .pixel_clock =3D 3383,
>          |    ^~~~~~~~~~~
>>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around =
initializer [-Wmissing-braces]
>      464 | static struct edid gm12u320_edid =3D {
>          |                                    ^
>    ......
>      478 |   .pixel_clock =3D 3383,
>          |                  {{  }}
>      479 |   /* hactive =3D 848, hblank =3D 256 */
>      480 |   .data.pixel_data.hactive_lo =3D 0x50,
>          |                                     }}
>      481 |   .data.pixel_data.hblank_lo =3D 0x00,
>          |                                    }}
>      482 |   .data.pixel_data.hactive_hblank_hi =3D 0x31,
>          |                                            }}
>      483 |   /* vactive =3D 480, vblank =3D 28 */
>      484 |   .data.pixel_data.vactive_lo =3D 0xe0,
>          |                                     }}
>      485 |   .data.pixel_data.vblank_lo =3D 0x1c,
>          |                                    }}
>      486 |   .data.pixel_data.vactive_vblank_hi =3D 0x10,
>          |                                            }}
>      487 |   /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
>      488 |   .data.pixel_data.hsync_offset_lo =3D 0x28,
>          |                                          }}
>      489 |   .data.pixel_data.hsync_pulse_width_lo =3D 0x80,
>          |                                               }}
>      490 |   .data.pixel_data.vsync_offset_pulse_width_lo =3D 0x14,
>          |                                                      }}
>      491 |   .data.pixel_data.hsync_vsync_offset_pulse_width_hi =3D 0x00,
>          |                                                            }}
>    ......
>      494 |  }, {
>          |  }}
>    drivers/gpu/drm/tiny/gm12u320.c:495:4: error: 'struct detailed_timing'=
 has no member named 'pixel_clock'
>      495 |   .pixel_clock =3D 0,
>          |    ^~~~~~~~~~~
>    drivers/gpu/drm/tiny/gm12u320.c:496:9: error: 'union <anonymous>' has =
no member named 'other_data'
>      496 |   .data.other_data.type =3D 0xfd, /* Monitor ranges */
>          |         ^~~~~~~~~~
>    drivers/gpu/drm/tiny/gm12u320.c:496:27: warning: initialized field ove=
rwritten [-Woverride-init]
>      496 |   .data.other_data.type =3D 0xfd, /* Monitor ranges */
>          |                           ^~~~
>    drivers/gpu/drm/tiny/gm12u320.c:496:27: note: (near initialization for=
 'gm12u320_edid.detailed_timings[1].data.pixel_data.pixel_clock')
>    drivers/gpu/drm/tiny/gm12u320.c:497:9: error: 'union <anonymous>' has =
no member named 'other_data'
>      497 |   .data.other_data.data.range.min_vfreq =3D 59,
>          |         ^~~~~~~~~~
>    drivers/gpu/drm/tiny/gm12u320.c:497:43: warning: initialized field ove=
rwritten [-Woverride-init]
>      497 |   .data.other_data.data.range.min_vfreq =3D 59,
>          |                                           ^~
>    drivers/gpu/drm/tiny/gm12u320.c:497:43: note: (near initialization for=
 'gm12u320_edid.detailed_timings[1].data.pixel_data.pixel_clock')
>    drivers/gpu/drm/tiny/gm12u320.c:498:9: error: 'union <anonymous>' has =
no member named 'other_data'
>      498 |   .data.other_data.data.range.max_vfreq =3D 61,
>          |         ^~~~~~~~~~
>    drivers/gpu/drm/tiny/gm12u320.c:498:43: warning: initialized field ove=
rwritten [-Woverride-init]
>      498 |   .data.other_data.data.range.max_vfreq =3D 61,
>          |                                           ^~
>    drivers/gpu/drm/tiny/gm12u320.c:498:43: note: (near initialization for=
 'gm12u320_edid.detailed_timings[1].data.pixel_data.pixel_clock')
>    drivers/gpu/drm/tiny/gm12u320.c:499:9: error: 'union <anonymous>' has =
no member named 'other_data'
>      499 |   .data.other_data.data.range.min_hfreq_khz =3D 29,
>          |         ^~~~~~~~~~
>    drivers/gpu/drm/tiny/gm12u320.c:499:47: warning: initialized field ove=
rwritten [-Woverride-init]
>      499 |   .data.other_data.data.range.min_hfreq_khz =3D 29,
>          |                                               ^~
>    drivers/gpu/drm/tiny/gm12u320.c:499:47: note: (near initialization for=
 'gm12u320_edid.detailed_timings[1].data.pixel_data.pixel_clock')
>    drivers/gpu/drm/tiny/gm12u320.c:500:9: error: 'union <anonymous>' has =
no member named 'other_data'
>      500 |   .data.other_data.data.range.max_hfreq_khz =3D 32,
>          |         ^~~~~~~~~~
>    drivers/gpu/drm/tiny/gm12u320.c:500:47: warning: initialized field ove=
rwritten [-Woverride-init]
>      500 |   .data.other_data.data.range.max_hfreq_khz =3D 32,
>          |                                               ^~
>    drivers/gpu/drm/tiny/gm12u320.c:500:47: note: (near initialization for=
 'gm12u320_edid.detailed_timings[1].data.pixel_data.pixel_clock')
>    drivers/gpu/drm/tiny/gm12u320.c:501:9: error: 'union <anonymous>' has =
no member named 'other_data'
>      501 |   .data.other_data.data.range.pixel_clock_mhz =3D 4, /* 40 MHz=
 */
>          |         ^~~~~~~~~~
>    drivers/gpu/drm/tiny/gm12u320.c:501:49: warning: initialized field ove=
rwritten [-Woverride-init]
>      501 |   .data.other_data.data.range.pixel_clock_mhz =3D 4, /* 40 MHz=
 */
>          |                                                 ^
>    drivers/gpu/drm/tiny/gm12u320.c:501:49: note: (near initialization for=
 'gm12u320_edid.detailed_timings[1].data.pixel_data.pixel_clock')
>    drivers/gpu/drm/tiny/gm12u320.c:502:9: error: 'union <anonymous>' has =
no member named 'other_data'
>      502 |   .data.other_data.data.range.flags =3D 0,
>          |         ^~~~~~~~~~
>    drivers/gpu/drm/tiny/gm12u320.c:502:39: warning: initialized field ove=
rwritten [-Woverride-init]
>      502 |   .data.other_data.data.range.flags =3D 0,
>          |                                       ^
>    drivers/gpu/drm/tiny/gm12u320.c:502:39: note: (near initialization for=
 'gm12u320_edid.detailed_timings[1].data.pixel_data.pixel_clock')
>    drivers/gpu/drm/tiny/gm12u320.c:503:9: error: 'union <anonymous>' has =
no member named 'other_data'
>      503 |   .data.other_data.data.range.formula.cvt =3D {
>          |         ^~~~~~~~~~
>>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around =
initializer [-Wmissing-braces]
>      464 | static struct edid gm12u320_edid =3D {
>          |                                    ^
>    ......
>      478 |   .pixel_clock =3D 3383,
>          |                  {{  }}
>      479 |   /* hactive =3D 848, hblank =3D 256 */
>      480 |   .data.pixel_data.hactive_lo =3D 0x50,
>          |                                     }}
>      481 |   .data.pixel_data.hblank_lo =3D 0x00,
>          |                                    }}
>      482 |   .data.pixel_data.hactive_hblank_hi =3D 0x31,
>          |                                            }}
>      483 |   /* vactive =3D 480, vblank =3D 28 */
>      484 |   .data.pixel_data.vactive_lo =3D 0xe0,
>          |                                     }}
>      485 |   .data.pixel_data.vblank_lo =3D 0x1c,
>          |                                    }}
>      486 |   .data.pixel_data.vactive_vblank_hi =3D 0x10,
>          |                                            }}
>      487 |   /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
>      488 |   .data.pixel_data.hsync_offset_lo =3D 0x28,
>          |                                          }}
>      489 |   .data.pixel_data.hsync_pulse_width_lo =3D 0x80,
>          |                                               }}
>      490 |   .data.pixel_data.vsync_offset_pulse_width_lo =3D 0x14,
>          |                                                      }}
>      491 |   .data.pixel_data.hsync_vsync_offset_pulse_width_hi =3D 0x00,
>          |                                                            }}
>    ......
>      494 |  }, {
>          |  }}
>      495 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      496 |   .data.other_data.type =3D 0xfd, /* Monitor ranges */
>          |                           {   }}
>      497 |   .data.other_data.data.range.min_vfreq =3D 59,
>          |                                           { }}
>      498 |   .data.other_data.data.range.max_vfreq =3D 61,
>          |                                           { }}
>      499 |   .data.other_data.data.range.min_hfreq_khz =3D 29,
>          |                                               { }}
>      500 |   .data.other_data.data.range.max_hfreq_khz =3D 32,
>          |                                               { }}
>      501 |   .data.other_data.data.range.pixel_clock_mhz =3D 4, /* 40 MHz=
 */
>          |                                                 {}}
>      502 |   .data.other_data.data.range.flags =3D 0,
>          |                                       {}}
>    drivers/gpu/drm/tiny/gm12u320.c:503:45: warning: initialized field ove=
rwritten [-Woverride-init]
>      503 |   .data.other_data.data.range.formula.cvt =3D {
>          |                                             ^
>    drivers/gpu/drm/tiny/gm12u320.c:503:45: note: (near initialization for=
 'gm12u320_edid.detailed_timings[1].data.pixel_data')
>>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around =
initializer [-Wmissing-braces]
>      464 | static struct edid gm12u320_edid =3D {
>          |                                    ^
>    ......
>      478 |   .pixel_clock =3D 3383,
>          |                  {{  }}
>      479 |   /* hactive =3D 848, hblank =3D 256 */
>      480 |   .data.pixel_data.hactive_lo =3D 0x50,
>          |                                     }}
>      481 |   .data.pixel_data.hblank_lo =3D 0x00,
>          |                                    }}
>      482 |   .data.pixel_data.hactive_hblank_hi =3D 0x31,
>          |                                            }}
>      483 |   /* vactive =3D 480, vblank =3D 28 */
>      484 |   .data.pixel_data.vactive_lo =3D 0xe0,
>          |                                     }}
>      485 |   .data.pixel_data.vblank_lo =3D 0x1c,
>          |                                    }}
>      486 |   .data.pixel_data.vactive_vblank_hi =3D 0x10,
>          |                                            }}
>      487 |   /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
>      488 |   .data.pixel_data.hsync_offset_lo =3D 0x28,
>          |                                          }}
>      489 |   .data.pixel_data.hsync_pulse_width_lo =3D 0x80,
>          |                                               }}
>      490 |   .data.pixel_data.vsync_offset_pulse_width_lo =3D 0x14,
>          |                                                      }}
>      491 |   .data.pixel_data.hsync_vsync_offset_pulse_width_hi =3D 0x00,
>          |                                                            }}
>    ......
>      494 |  }, {
>          |  }}
>      495 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      496 |   .data.other_data.type =3D 0xfd, /* Monitor ranges */
>          |                           {   }}
>      497 |   .data.other_data.data.range.min_vfreq =3D 59,
>          |                                           { }}
>      498 |   .data.other_data.data.range.max_vfreq =3D 61,
>          |                                           { }}
>      499 |   .data.other_data.data.range.min_hfreq_khz =3D 29,
>          |                                               { }}
>      500 |   .data.other_data.data.range.max_hfreq_khz =3D 32,
>          |                                               { }}
>      501 |   .data.other_data.data.range.pixel_clock_mhz =3D 4, /* 40 MHz=
 */
>          |                                                 {}}
>      502 |   .data.other_data.data.range.flags =3D 0,
>          |                                       {}}
>    ......
>      505 |  }, {
>          |  }
>    drivers/gpu/drm/tiny/gm12u320.c:506:4: error: 'struct detailed_timing'=
 has no member named 'pixel_clock'
>      506 |   .pixel_clock =3D 0,
>          |    ^~~~~~~~~~~
>    drivers/gpu/drm/tiny/gm12u320.c:507:9: error: 'union <anonymous>' has =
no member named 'other_data'
>      507 |   .data.other_data.type =3D 0xfc, /* Model string */
>          |         ^~~~~~~~~~
>    drivers/gpu/drm/tiny/gm12u320.c:507:27: warning: initialized field ove=
rwritten [-Woverride-init]
>      507 |   .data.other_data.type =3D 0xfc, /* Model string */
>          |                           ^~~~
>    drivers/gpu/drm/tiny/gm12u320.c:507:27: note: (near initialization for=
 'gm12u320_edid.detailed_timings[2].data.pixel_data.pixel_clock')
>    drivers/gpu/drm/tiny/gm12u320.c:508:9: error: 'union <anonymous>' has =
no member named 'other_data'
>      508 |   .data.other_data.data.str.str =3D {
>          |         ^~~~~~~~~~
>>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around =
initializer [-Wmissing-braces]
>      464 | static struct edid gm12u320_edid =3D {
>          |                                    ^
>    ......
>      478 |   .pixel_clock =3D 3383,
>          |                  {{  }}
>      479 |   /* hactive =3D 848, hblank =3D 256 */
>      480 |   .data.pixel_data.hactive_lo =3D 0x50,
>          |                                     }}
>      481 |   .data.pixel_data.hblank_lo =3D 0x00,
>          |                                    }}
>      482 |   .data.pixel_data.hactive_hblank_hi =3D 0x31,
>          |                                            }}
>      483 |   /* vactive =3D 480, vblank =3D 28 */
>      484 |   .data.pixel_data.vactive_lo =3D 0xe0,
>          |                                     }}
>      485 |   .data.pixel_data.vblank_lo =3D 0x1c,
>          |                                    }}
>      486 |   .data.pixel_data.vactive_vblank_hi =3D 0x10,
>          |                                            }}
>      487 |   /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
>      488 |   .data.pixel_data.hsync_offset_lo =3D 0x28,
>          |                                          }}
>      489 |   .data.pixel_data.hsync_pulse_width_lo =3D 0x80,
>          |                                               }}
>      490 |   .data.pixel_data.vsync_offset_pulse_width_lo =3D 0x14,
>          |                                                      }}
>      491 |   .data.pixel_data.hsync_vsync_offset_pulse_width_hi =3D 0x00,
>          |                                                            }}
>    ......
>      494 |  }, {
>          |  }}
>      495 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      496 |   .data.other_data.type =3D 0xfd, /* Monitor ranges */
>          |                           {   }}
>      497 |   .data.other_data.data.range.min_vfreq =3D 59,
>          |                                           { }}
>      498 |   .data.other_data.data.range.max_vfreq =3D 61,
>          |                                           { }}
>      499 |   .data.other_data.data.range.min_hfreq_khz =3D 29,
>          |                                               { }}
>      500 |   .data.other_data.data.range.max_hfreq_khz =3D 32,
>          |                                               { }}
>      501 |   .data.other_data.data.range.pixel_clock_mhz =3D 4, /* 40 MHz=
 */
>          |                                                 {}}
>      502 |   .data.other_data.data.range.flags =3D 0,
>          |                                       {}}
>    ......
>      505 |  }, {
>          |  }
>      506 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      507 |   .data.other_data.type =3D 0xfc, /* Model string */
>          |                           {   }}
>    drivers/gpu/drm/tiny/gm12u320.c:508:35: warning: initialized field ove=
rwritten [-Woverride-init]
>      508 |   .data.other_data.data.str.str =3D {
>          |                                   ^
>    drivers/gpu/drm/tiny/gm12u320.c:508:35: note: (near initialization for=
 'gm12u320_edid.detailed_timings[2].data.pixel_data')
>>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around =
initializer [-Wmissing-braces]
>      464 | static struct edid gm12u320_edid =3D {
>          |                                    ^
>    ......
>      478 |   .pixel_clock =3D 3383,
>          |                  {{  }}
>      479 |   /* hactive =3D 848, hblank =3D 256 */
>      480 |   .data.pixel_data.hactive_lo =3D 0x50,
>          |                                     }}
>      481 |   .data.pixel_data.hblank_lo =3D 0x00,
>          |                                    }}
>      482 |   .data.pixel_data.hactive_hblank_hi =3D 0x31,
>          |                                            }}
>      483 |   /* vactive =3D 480, vblank =3D 28 */
>      484 |   .data.pixel_data.vactive_lo =3D 0xe0,
>          |                                     }}
>      485 |   .data.pixel_data.vblank_lo =3D 0x1c,
>          |                                    }}
>      486 |   .data.pixel_data.vactive_vblank_hi =3D 0x10,
>          |                                            }}
>      487 |   /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
>      488 |   .data.pixel_data.hsync_offset_lo =3D 0x28,
>          |                                          }}
>      489 |   .data.pixel_data.hsync_pulse_width_lo =3D 0x80,
>          |                                               }}
>      490 |   .data.pixel_data.vsync_offset_pulse_width_lo =3D 0x14,
>          |                                                      }}
>      491 |   .data.pixel_data.hsync_vsync_offset_pulse_width_hi =3D 0x00,
>          |                                                            }}
>    ......
>      494 |  }, {
>          |  }}
>      495 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      496 |   .data.other_data.type =3D 0xfd, /* Monitor ranges */
>          |                           {   }}
>      497 |   .data.other_data.data.range.min_vfreq =3D 59,
>          |                                           { }}
>      498 |   .data.other_data.data.range.max_vfreq =3D 61,
>          |                                           { }}
>      499 |   .data.other_data.data.range.min_hfreq_khz =3D 29,
>          |                                               { }}
>      500 |   .data.other_data.data.range.max_hfreq_khz =3D 32,
>          |                                               { }}
>      501 |   .data.other_data.data.range.pixel_clock_mhz =3D 4, /* 40 MHz=
 */
>          |                                                 {}}
>      502 |   .data.other_data.data.range.flags =3D 0,
>          |                                       {}}
>    ......
>      505 |  }, {
>          |  }
>      506 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      507 |   .data.other_data.type =3D 0xfc, /* Model string */
>          |                           {   }}
>    ......
>      511 |  }, {
>          |  }
>    drivers/gpu/drm/tiny/gm12u320.c:512:4: error: 'struct detailed_timing'=
 has no member named 'pixel_clock'
>      512 |   .pixel_clock =3D 0,
>          |    ^~~~~~~~~~~
>    drivers/gpu/drm/tiny/gm12u320.c:513:9: error: 'union <anonymous>' has =
no member named 'other_data'
>      513 |   .data.other_data.type =3D 0xfe, /* Unspecified text / paddin=
g */
>          |         ^~~~~~~~~~
>    drivers/gpu/drm/tiny/gm12u320.c:513:27: warning: initialized field ove=
rwritten [-Woverride-init]
>      513 |   .data.other_data.type =3D 0xfe, /* Unspecified text / paddin=
g */
>          |                           ^~~~
>    drivers/gpu/drm/tiny/gm12u320.c:513:27: note: (near initialization for=
 'gm12u320_edid.detailed_timings[3].data.pixel_data.pixel_clock')
>    drivers/gpu/drm/tiny/gm12u320.c:514:9: error: 'union <anonymous>' has =
no member named 'other_data'
>      514 |   .data.other_data.data.str.str =3D {
>          |         ^~~~~~~~~~
>>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around =
initializer [-Wmissing-braces]
>      464 | static struct edid gm12u320_edid =3D {
>          |                                    ^
>    ......
>      478 |   .pixel_clock =3D 3383,
>          |                  {{  }}
>      479 |   /* hactive =3D 848, hblank =3D 256 */
>      480 |   .data.pixel_data.hactive_lo =3D 0x50,
>          |                                     }}
>      481 |   .data.pixel_data.hblank_lo =3D 0x00,
>          |                                    }}
>      482 |   .data.pixel_data.hactive_hblank_hi =3D 0x31,
>          |                                            }}
>      483 |   /* vactive =3D 480, vblank =3D 28 */
>      484 |   .data.pixel_data.vactive_lo =3D 0xe0,
>          |                                     }}
>      485 |   .data.pixel_data.vblank_lo =3D 0x1c,
>          |                                    }}
>      486 |   .data.pixel_data.vactive_vblank_hi =3D 0x10,
>          |                                            }}
>      487 |   /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
>      488 |   .data.pixel_data.hsync_offset_lo =3D 0x28,
>          |                                          }}
>      489 |   .data.pixel_data.hsync_pulse_width_lo =3D 0x80,
>          |                                               }}
>      490 |   .data.pixel_data.vsync_offset_pulse_width_lo =3D 0x14,
>          |                                                      }}
>      491 |   .data.pixel_data.hsync_vsync_offset_pulse_width_hi =3D 0x00,
>          |                                                            }}
>    ......
>      494 |  }, {
>          |  }}
>      495 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      496 |   .data.other_data.type =3D 0xfd, /* Monitor ranges */
>          |                           {   }}
>      497 |   .data.other_data.data.range.min_vfreq =3D 59,
>          |                                           { }}
>      498 |   .data.other_data.data.range.max_vfreq =3D 61,
>          |                                           { }}
>      499 |   .data.other_data.data.range.min_hfreq_khz =3D 29,
>          |                                               { }}
>      500 |   .data.other_data.data.range.max_hfreq_khz =3D 32,
>          |                                               { }}
>      501 |   .data.other_data.data.range.pixel_clock_mhz =3D 4, /* 40 MHz=
 */
>          |                                                 {}}
>      502 |   .data.other_data.data.range.flags =3D 0,
>          |                                       {}}
>    ......
>      505 |  }, {
>          |  }
>      506 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      507 |   .data.other_data.type =3D 0xfc, /* Model string */
>          |                           {   }}
>    ......
>      511 |  }, {
>          |  }
>      512 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      513 |   .data.other_data.type =3D 0xfe, /* Unspecified text / paddin=
g */
>          |                           {   }}
>    drivers/gpu/drm/tiny/gm12u320.c:514:35: warning: initialized field ove=
rwritten [-Woverride-init]
>      514 |   .data.other_data.data.str.str =3D {
>          |                                   ^
>    drivers/gpu/drm/tiny/gm12u320.c:514:35: note: (near initialization for=
 'gm12u320_edid.detailed_timings[3].data.pixel_data')
>>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around =
initializer [-Wmissing-braces]
>      464 | static struct edid gm12u320_edid =3D {
>          |                                    ^
>    ......
>      478 |   .pixel_clock =3D 3383,
>          |                  {{  }}
>      479 |   /* hactive =3D 848, hblank =3D 256 */
>      480 |   .data.pixel_data.hactive_lo =3D 0x50,
>          |                                     }}
>      481 |   .data.pixel_data.hblank_lo =3D 0x00,
>          |                                    }}
>      482 |   .data.pixel_data.hactive_hblank_hi =3D 0x31,
>          |                                            }}
>      483 |   /* vactive =3D 480, vblank =3D 28 */
>      484 |   .data.pixel_data.vactive_lo =3D 0xe0,
>          |                                     }}
>      485 |   .data.pixel_data.vblank_lo =3D 0x1c,
>          |                                    }}
>      486 |   .data.pixel_data.vactive_vblank_hi =3D 0x10,
>          |                                            }}
>      487 |   /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
>      488 |   .data.pixel_data.hsync_offset_lo =3D 0x28,
>          |                                          }}
>      489 |   .data.pixel_data.hsync_pulse_width_lo =3D 0x80,
>          |                                               }}
>      490 |   .data.pixel_data.vsync_offset_pulse_width_lo =3D 0x14,
>          |                                                      }}
>      491 |   .data.pixel_data.hsync_vsync_offset_pulse_width_hi =3D 0x00,
>          |                                                            }}
>    ......
>      494 |  }, {
>          |  }}
>      495 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      496 |   .data.other_data.type =3D 0xfd, /* Monitor ranges */
>          |                           {   }}
>      497 |   .data.other_data.data.range.min_vfreq =3D 59,
>          |                                           { }}
>      498 |   .data.other_data.data.range.max_vfreq =3D 61,
>          |                                           { }}
>      499 |   .data.other_data.data.range.min_hfreq_khz =3D 29,
>          |                                               { }}
>      500 |   .data.other_data.data.range.max_hfreq_khz =3D 32,
>          |                                               { }}
>      501 |   .data.other_data.data.range.pixel_clock_mhz =3D 4, /* 40 MHz=
 */
>          |                                                 {}}
>      502 |   .data.other_data.data.range.flags =3D 0,
>          |                                       {}}
>    ......
>      505 |  }, {
>          |  }
>      506 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      507 |   .data.other_data.type =3D 0xfc, /* Model string */
>          |                           {   }}
>    ......
>      511 |  }, {
>          |  }
>      512 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      513 |   .data.other_data.type =3D 0xfe, /* Unspecified text / paddin=
g */
>          |                           {   }}
>    ......
>      517 |  } },
>          |  }
>>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around =
initializer [-Wmissing-braces]
>      464 | static struct edid gm12u320_edid =3D {
>          |                                    ^
>    ......
>      478 |   .pixel_clock =3D 3383,
>          |                  {{  }}
>      479 |   /* hactive =3D 848, hblank =3D 256 */
>      480 |   .data.pixel_data.hactive_lo =3D 0x50,
>          |                                     }}
>      481 |   .data.pixel_data.hblank_lo =3D 0x00,
>          |                                    }}
>      482 |   .data.pixel_data.hactive_hblank_hi =3D 0x31,
>          |                                            }}
>      483 |   /* vactive =3D 480, vblank =3D 28 */
>      484 |   .data.pixel_data.vactive_lo =3D 0xe0,
>          |                                     }}
>      485 |   .data.pixel_data.vblank_lo =3D 0x1c,
>          |                                    }}
>      486 |   .data.pixel_data.vactive_vblank_hi =3D 0x10,
>          |                                            }}
>      487 |   /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
>      488 |   .data.pixel_data.hsync_offset_lo =3D 0x28,
>          |                                          }}
>      489 |   .data.pixel_data.hsync_pulse_width_lo =3D 0x80,
>          |                                               }}
>      490 |   .data.pixel_data.vsync_offset_pulse_width_lo =3D 0x14,
>          |                                                      }}
>      491 |   .data.pixel_data.hsync_vsync_offset_pulse_width_hi =3D 0x00,
>          |                                                            }}
>    ......
>      494 |  }, {
>          |  }}
>      495 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      496 |   .data.other_data.type =3D 0xfd, /* Monitor ranges */
>          |                           {   }}
>      497 |   .data.other_data.data.range.min_vfreq =3D 59,
>          |                                           { }}
>      498 |   .data.other_data.data.range.max_vfreq =3D 61,
>          |                                           { }}
>      499 |   .data.other_data.data.range.min_hfreq_khz =3D 29,
>          |                                               { }}
>      500 |   .data.other_data.data.range.max_hfreq_khz =3D 32,
>          |                                               { }}
>      501 |   .data.other_data.data.range.pixel_clock_mhz =3D 4, /* 40 MHz=
 */
>          |                                                 {}}
>      502 |   .data.other_data.data.range.flags =3D 0,
>          |                                       {}}
>    ......
>      505 |  }, {
>          |  }
>      506 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      507 |   .data.other_data.type =3D 0xfc, /* Model string */
>          |                           {   }}
>    ......
>      511 |  }, {
>          |  }
>      512 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      513 |   .data.other_data.type =3D 0xfe, /* Unspecified text / paddin=
g */
>          |                           {   }}
>    ......
>      517 |  } },
>          |  }
>>> drivers/gpu/drm/tiny/gm12u320.c:464:36: warning: missing braces around =
initializer [-Wmissing-braces]
>      464 | static struct edid gm12u320_edid =3D {
>          |                                    ^
>    ......
>      478 |   .pixel_clock =3D 3383,
>          |                  {{  }}
>      479 |   /* hactive =3D 848, hblank =3D 256 */
>      480 |   .data.pixel_data.hactive_lo =3D 0x50,
>          |                                     }}
>      481 |   .data.pixel_data.hblank_lo =3D 0x00,
>          |                                    }}
>      482 |   .data.pixel_data.hactive_hblank_hi =3D 0x31,
>          |                                            }}
>      483 |   /* vactive =3D 480, vblank =3D 28 */
>      484 |   .data.pixel_data.vactive_lo =3D 0xe0,
>          |                                     }}
>      485 |   .data.pixel_data.vblank_lo =3D 0x1c,
>          |                                    }}
>      486 |   .data.pixel_data.vactive_vblank_hi =3D 0x10,
>          |                                            }}
>      487 |   /* hsync offset 40 pw 128, vsync offset 1 pw 4 */
>      488 |   .data.pixel_data.hsync_offset_lo =3D 0x28,
>          |                                          }}
>      489 |   .data.pixel_data.hsync_pulse_width_lo =3D 0x80,
>          |                                               }}
>      490 |   .data.pixel_data.vsync_offset_pulse_width_lo =3D 0x14,
>          |                                                      }}
>      491 |   .data.pixel_data.hsync_vsync_offset_pulse_width_hi =3D 0x00,
>          |                                                            }}
>    ......
>      494 |  }, {
>          |  }}
>      495 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      496 |   .data.other_data.type =3D 0xfd, /* Monitor ranges */
>          |                           {   }}
>      497 |   .data.other_data.data.range.min_vfreq =3D 59,
>          |                                           { }}
>      498 |   .data.other_data.data.range.max_vfreq =3D 61,
>          |                                           { }}
>      499 |   .data.other_data.data.range.min_hfreq_khz =3D 29,
>          |                                               { }}
>      500 |   .data.other_data.data.range.max_hfreq_khz =3D 32,
>          |                                               { }}
>      501 |   .data.other_data.data.range.pixel_clock_mhz =3D 4, /* 40 MHz=
 */
>          |                                                 {}}
>      502 |   .data.other_data.data.range.flags =3D 0,
>          |                                       {}}
>    ......
>      505 |  }, {
>          |  }
>      506 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      507 |   .data.other_data.type =3D 0xfc, /* Model string */
>          |                           {   }}
>    ......
>      511 |  }, {
>          |  }
>      512 |   .pixel_clock =3D 0,
>          |                  -
>          |                  {{0}}
>      513 |   .data.other_data.type =3D 0xfe, /* Unspecified text / paddin=
g */
>          |                           {   }}
>    ......
>      517 |  } },
>          |  }
>
>
> vim +464 drivers/gpu/drm/tiny/gm12u320.c
>
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  457=20=20
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  458  /*
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  459   *=C2=A0We use fake EDID info so that userspace know that it is d=
ealing with
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  460   * an Acer projector, rather then listing this as an "unknown" mo=
nitor.
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  461   * Note this assumes this driver is only ever used with the Acer =
C120, if we
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  462   * add support for other devices the vendor and model should be p=
arameterized.
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  463   */
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21 @464  static struct edid gm12u320_edid =3D {
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  465  	.header		=3D { 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00 },
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  466  	.mfg_id		=3D { 0x04, 0x72 },	/* "ACR" */
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  467  	.prod_code	=3D { 0x20, 0xc1 },	/* C120h */
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  468  	.serial		=3D 0xaa55aa55,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  469  	.mfg_week	=3D 1,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  470  	.mfg_year	=3D 16,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  471  	.version	=3D 1,			/* EDID 1.3 */
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  472  	.revision	=3D 3,			/* EDID 1.3 */
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  473  	.input		=3D 0x08,			/* Analog input */
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  474  	.features	=3D 0x0a,			/* Pref timing in DTD 1 */
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  475  	.standard_timings =3D { { 1, 1 }, { 1, 1 }, { 1, 1 }, { 1, 1 },
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  476  			      { 1, 1 }, { 1, 1 }, { 1, 1 }, { 1, 1 } },
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  477  	.detailed_timings =3D { {
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  478  		.pixel_clock =3D 3383,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  479  		/* hactive =3D 848, hblank =3D 256 */
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  480  		.data.pixel_data.hactive_lo =3D 0x50,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  481  		.data.pixel_data.hblank_lo =3D 0x00,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  482  		.data.pixel_data.hactive_hblank_hi =3D 0x31,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  483  		/* vactive =3D 480, vblank =3D 28 */
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  484  		.data.pixel_data.vactive_lo =3D 0xe0,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  485  		.data.pixel_data.vblank_lo =3D 0x1c,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  486  		.data.pixel_data.vactive_vblank_hi =3D 0x10,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  487  		/* hsync offset 40 pw 128, vsync offset 1 pw 4 */
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  488  		.data.pixel_data.hsync_offset_lo =3D 0x28,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  489  		.data.pixel_data.hsync_pulse_width_lo =3D 0x80,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  490  		.data.pixel_data.vsync_offset_pulse_width_lo =3D 0x14,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  491  		.data.pixel_data.hsync_vsync_offset_pulse_width_hi =3D 0x00,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  492  		/* Digital separate syncs, hsync+, vsync+ */
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  493  		.data.pixel_data.misc =3D 0x1e,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  494  	}, {
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  495  		.pixel_clock =3D 0,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  496  		.data.other_data.type =3D 0xfd, /* Monitor ranges */
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  497  		.data.other_data.data.range.min_vfreq =3D 59,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  498  		.data.other_data.data.range.max_vfreq =3D 61,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  499  		.data.other_data.data.range.min_hfreq_khz =3D 29,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  500  		.data.other_data.data.range.max_hfreq_khz =3D 32,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  501  		.data.other_data.data.range.pixel_clock_mhz =3D 4, /* 40 MHz */
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  502  		.data.other_data.data.range.flags =3D 0,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  503  		.data.other_data.data.range.formula.cvt =3D {
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  504  			0xa0, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20 },
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  505  	}, {
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  506  		.pixel_clock =3D 0,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  507  		.data.other_data.type =3D 0xfc, /* Model string */
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  508  		.data.other_data.data.str.str =3D {
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  509  			'P', 'r', 'o', 'j', 'e', 'c', 't', 'o', 'r', '\n',
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  510  			' ', ' ',  ' ' },
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  511  	}, {
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  512  		.pixel_clock =3D 0,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  513  		.data.other_data.type =3D 0xfe, /* Unspecified text / padding */
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  514  		.data.other_data.data.str.str =3D {
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  515  			'\n', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  516  			' ', ' ',  ' ' },
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  517  	} },
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  518  	.checksum =3D 0x13,
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  519  };
> e4f86e43716443e drivers/gpu/drm/gm12u320/gm12u320.c Hans de Goede 2019-07=
-21  520=20=20

--=20
Jani Nikula, Intel Open Source Graphics Center
