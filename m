Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 476907E0E03
	for <lists+dri-devel@lfdr.de>; Sat,  4 Nov 2023 07:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08A810E1F4;
	Sat,  4 Nov 2023 06:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D0F10E1F4
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Nov 2023 06:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699077959; x=1730613959;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9vVb1ZToq/cLDu+T0J9XSoZgHNpJVPOq/dzoxgJrPnM=;
 b=AAc6jRmRU8aM5/dixstsdb6DJeExEPmxKspn/2RgWOiHEP1yhLkIf8st
 SAj0MXW3Khcgnrn6encmv1OxwJW14H8WZV2Pbu1DMSRs5RAENtx+TGqG1
 0RaGNDqE/KfiMp8JWgQE+1QDWI3Xewpuxs6vP3AYu8+OHC/Lz312BABze
 Oa4P1BNUMKgTrJZ3pYbMSG52Ejxc7kWo2TVHqHSNIbq6yhvx5Yf29Fomp
 fOvRLKe3WDxm1PMF3gXOwz7MtAVIzO8ITSzGdlfM6/Z0vU3Ttrey+T1Od
 8rzM7Eq3cpqr3HN9vERIeo/JxKTWugh+aDW3eNHTH1833iPtQACZ9EbJE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="7697496"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="7697496"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 23:05:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="765468151"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; d="scan'208";a="765468151"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 03 Nov 2023 23:05:44 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qz9mv-0003Wu-1O;
 Sat, 04 Nov 2023 06:05:41 +0000
Date: Sat, 4 Nov 2023 14:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Subject: Re: [PATCH v5 1/6] drm/format-helper: Add drm_fb_blit_from_r1 and
 drm_fb_fill
Message-ID: <202311041300.X5kh1Yvx-lkp@intel.com>
References: <20231103145526.628138-2-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103145526.628138-2-jfalempe@redhat.com>
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
Cc: gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ffc253263a1375a65fa6c9f62a893e9767fbebfa]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-format-helper-Add-drm_fb_blit_from_r1-and-drm_fb_fill/20231103-225824
base:   ffc253263a1375a65fa6c9f62a893e9767fbebfa
patch link:    https://lore.kernel.org/r/20231103145526.628138-2-jfalempe%40redhat.com
patch subject: [PATCH v5 1/6] drm/format-helper: Add drm_fb_blit_from_r1 and drm_fb_fill
config: i386-randconfig-062-20231104 (https://download.01.org/0day-ci/archive/20231104/202311041300.X5kh1Yvx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041300.X5kh1Yvx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041300.X5kh1Yvx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_format_helper.c:445:33: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/drm_format_helper.c:542:37: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/drm_format_helper.c:653:65: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] pix @@     got restricted __le32 const [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:653:65: sparse:     expected unsigned int [usertype] pix
   drivers/gpu/drm/drm_format_helper.c:653:65: sparse:     got restricted __le32 const [usertype]
>> drivers/gpu/drm/drm_format_helper.c:653:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned short @@
   drivers/gpu/drm/drm_format_helper.c:653:27: sparse:     expected restricted __le16 [usertype]
   drivers/gpu/drm/drm_format_helper.c:653:27: sparse:     got unsigned short
   drivers/gpu/drm/drm_format_helper.c:723:67: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] pix @@     got restricted __le32 const [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:723:67: sparse:     expected unsigned int [usertype] pix
   drivers/gpu/drm/drm_format_helper.c:723:67: sparse:     got restricted __le32 const [usertype]
   drivers/gpu/drm/drm_format_helper.c:723:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned short @@
   drivers/gpu/drm/drm_format_helper.c:723:27: sparse:     expected restricted __le16 [usertype]
   drivers/gpu/drm/drm_format_helper.c:723:27: sparse:     got unsigned short
   drivers/gpu/drm/drm_format_helper.c:767:67: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] pix @@     got restricted __le32 const [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:767:67: sparse:     expected unsigned int [usertype] pix
   drivers/gpu/drm/drm_format_helper.c:767:67: sparse:     got restricted __le32 const [usertype]
   drivers/gpu/drm/drm_format_helper.c:767:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned short @@
   drivers/gpu/drm/drm_format_helper.c:767:27: sparse:     expected restricted __le16 [usertype]
   drivers/gpu/drm/drm_format_helper.c:767:27: sparse:     got unsigned short
   drivers/gpu/drm/drm_format_helper.c:811:67: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] pix @@     got restricted __le32 const [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:811:67: sparse:     expected unsigned int [usertype] pix
   drivers/gpu/drm/drm_format_helper.c:811:67: sparse:     got restricted __le32 const [usertype]
   drivers/gpu/drm/drm_format_helper.c:811:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] @@     got unsigned short @@
   drivers/gpu/drm/drm_format_helper.c:811:27: sparse:     expected restricted __le16 [usertype]
   drivers/gpu/drm/drm_format_helper.c:811:27: sparse:     got unsigned short
   drivers/gpu/drm/drm_format_helper.c:905:67: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] pix @@     got restricted __le32 const [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:905:67: sparse:     expected unsigned int [usertype] pix
   drivers/gpu/drm/drm_format_helper.c:905:67: sparse:     got restricted __le32 const [usertype]
>> drivers/gpu/drm/drm_format_helper.c:905:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int @@
   drivers/gpu/drm/drm_format_helper.c:905:27: sparse:     expected restricted __le32 [usertype]
   drivers/gpu/drm/drm_format_helper.c:905:27: sparse:     got unsigned int
   drivers/gpu/drm/drm_format_helper.c:949:67: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] pix @@     got restricted __le32 const [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:949:67: sparse:     expected unsigned int [usertype] pix
   drivers/gpu/drm/drm_format_helper.c:949:67: sparse:     got restricted __le32 const [usertype]
   drivers/gpu/drm/drm_format_helper.c:949:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int @@
   drivers/gpu/drm/drm_format_helper.c:949:27: sparse:     expected restricted __le32 [usertype]
   drivers/gpu/drm/drm_format_helper.c:949:27: sparse:     got unsigned int
   drivers/gpu/drm/drm_format_helper.c:972:67: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] pix @@     got restricted __le32 const [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:972:67: sparse:     expected unsigned int [usertype] pix
   drivers/gpu/drm/drm_format_helper.c:972:67: sparse:     got restricted __le32 const [usertype]
   drivers/gpu/drm/drm_format_helper.c:972:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int @@
   drivers/gpu/drm/drm_format_helper.c:972:27: sparse:     expected restricted __le32 [usertype]
   drivers/gpu/drm/drm_format_helper.c:972:27: sparse:     got unsigned int
   drivers/gpu/drm/drm_format_helper.c:995:70: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] pix @@     got restricted __le32 const [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:995:70: sparse:     expected unsigned int [usertype] pix
   drivers/gpu/drm/drm_format_helper.c:995:70: sparse:     got restricted __le32 const [usertype]
   drivers/gpu/drm/drm_format_helper.c:995:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int @@
   drivers/gpu/drm/drm_format_helper.c:995:27: sparse:     expected restricted __le32 [usertype]
   drivers/gpu/drm/drm_format_helper.c:995:27: sparse:     got unsigned int
   drivers/gpu/drm/drm_format_helper.c:1039:70: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] pix @@     got restricted __le32 const [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:1039:70: sparse:     expected unsigned int [usertype] pix
   drivers/gpu/drm/drm_format_helper.c:1039:70: sparse:     got restricted __le32 const [usertype]
   drivers/gpu/drm/drm_format_helper.c:1039:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] @@     got unsigned int @@
   drivers/gpu/drm/drm_format_helper.c:1039:27: sparse:     expected restricted __le32 [usertype]
   drivers/gpu/drm/drm_format_helper.c:1039:27: sparse:     got unsigned int
   drivers/gpu/drm/drm_format_helper.c:27:15: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/drm_format_helper.c:31:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:31:16: sparse:     expected unsigned short
   drivers/gpu/drm/drm_format_helper.c:31:16: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/drm_format_helper.c:38:15: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/drm_format_helper.c:43:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:43:16: sparse:     expected unsigned short
   drivers/gpu/drm/drm_format_helper.c:43:16: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/drm_format_helper.c:50:15: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/drm_format_helper.c:54:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:54:16: sparse:     expected unsigned short
   drivers/gpu/drm/drm_format_helper.c:54:16: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/drm_format_helper.c:61:15: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/drm_format_helper.c:66:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:66:16: sparse:     expected unsigned short
   drivers/gpu/drm/drm_format_helper.c:66:16: sparse:     got restricted __le16 [usertype]
   drivers/gpu/drm/drm_format_helper.c:73:17: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/drm_format_helper.c:75:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:75:16: sparse:     expected unsigned int
   drivers/gpu/drm/drm_format_helper.c:75:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/drm_format_helper.c:82:15: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/drm_format_helper.c:87:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:87:16: sparse:     expected unsigned int
   drivers/gpu/drm/drm_format_helper.c:87:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/drm_format_helper.c:106:15: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/drm_format_helper.c:111:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:111:16: sparse:     expected unsigned int
   drivers/gpu/drm/drm_format_helper.c:111:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/drm_format_helper.c:118:15: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/drm_format_helper.c:124:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/drm_format_helper.c:124:16: sparse:     expected unsigned int
   drivers/gpu/drm/drm_format_helper.c:124:16: sparse:     got restricted __le32 [usertype]

vim +445 drivers/gpu/drm/drm_format_helper.c

   431	
   432	static void drm_fb_r1_to_24bit(struct iosys_map *dmap, unsigned int dpitch,
   433				       const u8 *sbuf8, unsigned int spitch,
   434				       unsigned int height, unsigned int width,
   435				       u32 fg32, u32 bg32)
   436	{
   437		unsigned int l, x;
   438		u32 val32;
   439	
   440		for (l = 0; l < height; l++) {
   441			for (x = 0; x < width; x++) {
   442				u32 off = l * dpitch + x * 3;
   443	
   444				val32 = (sbuf8[(l * spitch) + x / 8] & (0x80 >> (x % 8))) ? fg32 : bg32;
 > 445				val32 = le32_to_cpu(val32);
   446	
   447				/* write blue-green-red to output in little endianness */
   448				iosys_map_wr(dmap, off, u8, (val32 & 0x000000FF) >> 0);
   449				iosys_map_wr(dmap, off + 1, u8, (val32 & 0x0000FF00) >> 8);
   450				iosys_map_wr(dmap, off + 2, u8, (val32 & 0x00FF0000) >> 16);
   451			}
   452		}
   453	}
   454	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
