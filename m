Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C64954FBDF4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E1FC10F6AF;
	Mon, 11 Apr 2022 13:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684D210F68A;
 Mon, 11 Apr 2022 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649685496; x=1681221496;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=qaHjffKM665lC2tRpBV6IvYgZv2vzVPvhpmfiLKyIuw=;
 b=lWilmz6bMiCzRpMh0qxWQ4mFTtq/Q/5I1eJRL1MSVVYcbXuqpxDfaQ4j
 ocCh4BVezOnPmXLgLOUC0ywZf8cC81x9MYPjhwYxsk7xjSx/nKzMRs76r
 znt786f9Vauo6xfQ9TaZWHwFscu5388ZNBL5V8jLcC6HdkkjHENZJKOxA
 KxkZqozPM0d1vY0XJ6njJwb3RqjJQab8r7dO2nPkgRkxucpyAEtOCGVVr
 j77294p7sUGtiQ2zcgmn020DZ5bIcqJ4N+m/5gAvfi0PyQGKOioCT5mP6
 +eWqa33fBls2RxnNkVGTB/ZEaibJ+QehFt6k8Nie6ROee8v4WfMo3nm1t Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="249402363"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="249402363"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 06:57:30 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="572172907"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 06:57:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [CI v2 12/12] drm/edid: add EDID block count and
 size helpers
In-Reply-To: <202204112055.cUmakJdJ-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <44265d5a3f64e9d7ad9984fee766f68d0b8bd473.1649670305.git.jani.nikula@intel.com>
 <202204112055.cUmakJdJ-lkp@intel.com>
Date: Mon, 11 Apr 2022 16:57:26 +0300
Message-ID: <875ynfiuyh.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Apr 2022, kernel test robot <lkp@intel.com> wrote:
> Hi Jani,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on drm-tip/drm-tip]
> [also build test WARNING on next-20220411]
> [cannot apply to drm/drm-next drm-intel/for-linux-next v5.18-rc2]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-ed=
id-low-level-EDID-block-read-refactoring-etc/20220411-175027
> base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
> config: arc-allyesconfig (https://download.01.org/0day-ci/archive/2022041=
1/202204112055.cUmakJdJ-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 11.2.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/ba74d3cc8cc1b6ba4=
c34a039e797994ddbc77567
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Jani-Nikula/drm-edid-low-level-E=
DID-block-read-refactoring-etc/20220411-175027
>         git checkout ba74d3cc8cc1b6ba4c34a039e797994ddbc77567
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cro=
ss O=3Dbuild_dir ARCH=3Darc SHELL=3D/bin/bash drivers/gpu/drm/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    drivers/gpu/drm/drm_edid.c: In function 'drm_do_get_edid':
>>> drivers/gpu/drm/drm_edid.c:1664:21: warning: array subscript [128, 3264=
0] is outside array bounds of 'struct edid[1]' [-Warray-bounds]
>     1664 |         return block[0];
>          |                ~~~~~^~~
>    drivers/gpu/drm/drm_edid.c:2173:15: note: referencing an object of siz=
e 128 allocated by 'krealloc'
>     2173 |         new =3D krealloc(edid, edid_size(edid), GFP_KERNEL);
>          |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I presume this is caused by the other blunder.

BR,
Jani.

>
>
> vim +1664 drivers/gpu/drm/drm_edid.c
>
> c465bbc87ce372 Stefan Br=C3=BCns 2014-11-30  1659=20=20
> 4ba0f53ce685b0 Jani Nikula  2022-03-31  1660  static int edid_block_tag(c=
onst void *_block)
> 4ba0f53ce685b0 Jani Nikula  2022-03-31  1661  {
> 4ba0f53ce685b0 Jani Nikula  2022-03-31  1662  	const u8 *block =3D _block;
> 4ba0f53ce685b0 Jani Nikula  2022-03-31  1663=20=20
> 4ba0f53ce685b0 Jani Nikula  2022-03-31 @1664  	return block[0];
> 4ba0f53ce685b0 Jani Nikula  2022-03-31  1665  }
> 4ba0f53ce685b0 Jani Nikula  2022-03-31  1666=20=20

--=20
Jani Nikula, Intel Open Source Graphics Center
