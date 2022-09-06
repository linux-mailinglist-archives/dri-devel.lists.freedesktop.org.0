Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 467705ADC69
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 02:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6829D10E526;
	Tue,  6 Sep 2022 00:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FC110E526
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 00:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662424385; x=1693960385;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=RUVdfPOb6chs1+8BqyYEVqAOhl9fQh8rHeVVH/dD89Y=;
 b=V4HRx/MHXpn7gZYe2ef8jf17GLmWuO0tdb6x63nKbDqGf5RynHh6GLGP
 921W/pXoQxyQF4dMq2K7G3U7nPP3iv9C9Nx6inCZrMQJRbXOa753oJsaL
 5clRmCRQG/DEbKa473fhqeJQVZ8QOfN7/fmPSokt1NjbvXcVsG/Ol6gDE
 UliY3V1bBzMSjzSuOz//y67AiUWQARiYPBzXnAiGqH6MGkc8YEe3NEHgV
 S+OlGSIKRDlpVlZdnwK/WPEqvFMV6rc0bBx3fswnD1K1P6/0M24YX+yBd
 vC8HYbIgugKtTdjw4z9ChcL/52UP/caUmAZl76jPllAKRJP2Ls3Lu1oKQ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="297778396"
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; d="scan'208";a="297778396"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2022 17:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; d="scan'208";a="643957100"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 05 Sep 2022 17:33:04 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oVMWV-0004fh-1B;
 Tue, 06 Sep 2022 00:33:03 +0000
Date: Tue, 6 Sep 2022 08:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: [drm-misc:for-linux-next 9/9]
 drivers/gpu/drm/vkms/vkms_formats.c:259: undefined reference to `__divdi3'
Message-ID: <202209060813.wci1hZUA-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Melissa Wen <melissa.srw@gmail.com>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   396369d6754993e40f1c84b2e22e40e92dfa4c49
commit: 396369d6754993e40f1c84b2e22e40e92dfa4c49 [9/9] drm: vkms: Add support to the RGB565 format
config: i386-randconfig-a006-20220905 (https://download.01.org/0day-ci/archive/20220906/202209060813.wci1hZUA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc for-linux-next
        git checkout 396369d6754993e40f1c84b2e22e40e92dfa4c49
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/gpu/drm/vkms/vkms_formats.o: in function `argb_u16_to_RGB565':
>> drivers/gpu/drm/vkms/vkms_formats.c:259: undefined reference to `__divdi3'
>> ld: drivers/gpu/drm/vkms/vkms_formats.c:260: undefined reference to `__divdi3'
   ld: drivers/gpu/drm/vkms/vkms_formats.c:261: undefined reference to `__divdi3'


vim +259 drivers/gpu/drm/vkms/vkms_formats.c

   241	
   242	static void argb_u16_to_RGB565(struct vkms_frame_info *frame_info,
   243				       const struct line_buffer *src_buffer, int y)
   244	{
   245		int x_dst = frame_info->dst.x1;
   246		u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
   247		struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
   248		int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
   249				    src_buffer->n_pixels);
   250	
   251		s32 fp_rb_ratio = INT_TO_FIXED_DIV(65535, 31);
   252		s32 fp_g_ratio = INT_TO_FIXED_DIV(65535, 63);
   253	
   254		for (size_t x = 0; x < x_limit; x++, dst_pixels++) {
   255			s32 fp_r = INT_TO_FIXED(in_pixels[x].r);
   256			s32 fp_g = INT_TO_FIXED(in_pixels[x].g);
   257			s32 fp_b = INT_TO_FIXED(in_pixels[x].b);
   258	
 > 259			u16 r = FIXED_TO_INT_ROUND(FIXED_DIV(fp_r, fp_rb_ratio));
 > 260			u16 g = FIXED_TO_INT_ROUND(FIXED_DIV(fp_g, fp_g_ratio));
   261			u16 b = FIXED_TO_INT_ROUND(FIXED_DIV(fp_b, fp_rb_ratio));
   262	
   263			*dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
   264		}
   265	}
   266	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
