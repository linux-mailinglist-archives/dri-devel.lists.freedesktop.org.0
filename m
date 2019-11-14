Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F381CFBCF9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 01:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292BA6EEA9;
	Thu, 14 Nov 2019 00:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9436EEA9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 00:21:05 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 16:21:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,302,1569308400"; 
 d="gz'50?scan'50,208,50";a="203144295"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 13 Nov 2019 16:21:02 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iV2sg-0000tp-8s; Thu, 14 Nov 2019 08:21:02 +0800
Date: Thu, 14 Nov 2019 08:20:16 +0800
From: kbuild test robot <lkp@intel.com>
To: Flora Cui <flora.cui@amd.com>
Subject: [radeon-alex:amd-mainline-dkms-5.2 2701/2834]
 include/kcl/kcl_drm.h:236:1: error: static declaration of
 'drm_atomic_helper_update_legacy_modeset_state' follows non-static
 declaration
Message-ID: <201911140814.CrU1kbAC%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="kmbamtfyxlbk4euv"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kmbamtfyxlbk4euv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Flora,

FYI, the error/warning still remains.

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-mainline-dkms-5.2
head:   a48b0cc1cdf3900e3e73801f9de64afbb70dc193
commit: cc8e420623914e7a903534abddf086dad609a455 [2701/2834] drm/amdkcl: drop kcl_drm_atomic_helper_update_legacy_modeset_state
config: x86_64-randconfig-e004-201944 (attached as .config)
compiler: gcc-7 (Debian 7.4.0-14) 7.4.0
reproduce:
        git checkout cc8e420623914e7a903534abddf086dad609a455
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:154:1: error: redefinition of 'drm_fb_helper_remove_conflicting_pci_framebuffers'
    drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:612:1: note: previous definition of 'drm_fb_helper_remove_conflicting_pci_framebuffers' was here
    drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:175:6: error: static declaration of 'drm_fb_helper_cfb_fillrect' follows non-static declaration
    void drm_fb_helper_cfb_fillrect(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:289:6: note: previous declaration of 'drm_fb_helper_cfb_fillrect' was here
    void drm_fb_helper_cfb_fillrect(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:182:6: error: static declaration of 'drm_fb_helper_cfb_copyarea' follows non-static declaration
    void drm_fb_helper_cfb_copyarea(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:291:6: note: previous declaration of 'drm_fb_helper_cfb_copyarea' was here
    void drm_fb_helper_cfb_copyarea(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:189:6: error: static declaration of 'drm_fb_helper_cfb_imageblit' follows non-static declaration
    void drm_fb_helper_cfb_imageblit(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:293:6: note: previous declaration of 'drm_fb_helper_cfb_imageblit' was here
    void drm_fb_helper_cfb_imageblit(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:201:17: error: static declaration of 'drm_fb_helper_alloc_fbi' follows non-static declaration
    struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
                    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:265:17: note: previous declaration of 'drm_fb_helper_alloc_fbi' was here
    struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper);
                    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:208:6: error: static declaration of 'drm_fb_helper_unregister_fbi' follows non-static declaration
    void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:266:6: note: previous declaration of 'drm_fb_helper_unregister_fbi' was here
    void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:217:6: error: static declaration of 'drm_fb_helper_set_suspend_unlocked' follows non-static declaration
    void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:297:6: note: previous declaration of 'drm_fb_helper_set_suspend_unlocked' was here
    void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'drm_fb_helper_set_suspend_unlocked':
   include/kcl/kcl_drm.h:221:53: error: 'state' undeclared (first use in this function); did you mean 'statx'?
     _kcl_drm_fb_helper_set_suspend_unlocked(fb_helper, state);
                                                        ^~~~~
                                                        statx
   include/kcl/kcl_drm.h:221:53: note: each undeclared identifier is reported only once for each function it appears in
   include/kcl/kcl_drm.h: At top level:
>> include/kcl/kcl_drm.h:236:1: error: static declaration of 'drm_atomic_helper_update_legacy_modeset_state' follows non-static declaration
    drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:11:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_atomic_helper.h:74:1: note: previous declaration of 'drm_atomic_helper_update_legacy_modeset_state' was here
    drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_encoder_init':
   include/kcl/kcl_drm.h:303:9: error: too few arguments to function 'drm_encoder_init'
     return drm_encoder_init(dev, encoder, funcs,
            ^~~~~~~~~~~~~~~~
   In file included from include/drm/drm_modeset_helper_vtables.h:33:0,
                    from include/drm/drm_atomic_helper.h:32,
                    from include/kcl/kcl_drm.h:11,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_encoder.h:183:5: note: declared here
    int drm_encoder_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_crtc_init_with_planes':
   include/kcl/kcl_drm.h:318:10: error: too few arguments to function 'drm_crtc_init_with_planes'
      return drm_crtc_init_with_planes(dev, crtc, primary,
             ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drmP.h:68:0,
                    from include/kcl/kcl_drm.h:6,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_crtc.h:1120:5: note: declared here
    int drm_crtc_init_with_planes(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_universal_plane_init':
   include/kcl/kcl_drm.h:339:29: error: incompatible type for argument 7 of 'drm_universal_plane_init'
         formats, format_count, type);
                                ^~~~
   In file included from include/drm/drm_crtc.h:45:0,
                    from include/drm/drmP.h:68,
                    from include/kcl/kcl_drm.h:6,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_plane.h:713:5: note: expected 'const uint64_t * {aka const long long unsigned int *}' but argument is of type 'enum drm_plane_type'
    int drm_universal_plane_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:338:10: error: too few arguments to function 'drm_universal_plane_init'
      return drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
             ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_crtc.h:45:0,
                    from include/drm/drmP.h:68,
                    from include/kcl/kcl_drm.h:6,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_plane.h:713:5: note: declared here
    int drm_universal_plane_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_gem_object_lookup':
   include/kcl/kcl_drm.h:350:32: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
      return drm_gem_object_lookup(dev, filp, handle);
                                   ^~~
   In file included from include/kcl/kcl_drm.h:10:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:386:24: note: expected 'struct drm_file *' but argument is of type 'struct drm_device *'
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:350:37: warning: passing argument 2 of 'drm_gem_object_lookup' makes integer from pointer without a cast [-Wint-conversion]
      return drm_gem_object_lookup(dev, filp, handle);
                                        ^~~~
   In file included from include/kcl/kcl_drm.h:10:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:386:24: note: expected 'u32 {aka unsigned int}' but argument is of type 'struct drm_file *'
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
--
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:154:1: error: redefinition of 'drm_fb_helper_remove_conflicting_pci_framebuffers'
    drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:612:1: note: previous definition of 'drm_fb_helper_remove_conflicting_pci_framebuffers' was here
    drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:175:6: error: static declaration of 'drm_fb_helper_cfb_fillrect' follows non-static declaration
    void drm_fb_helper_cfb_fillrect(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:289:6: note: previous declaration of 'drm_fb_helper_cfb_fillrect' was here
    void drm_fb_helper_cfb_fillrect(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:182:6: error: static declaration of 'drm_fb_helper_cfb_copyarea' follows non-static declaration
    void drm_fb_helper_cfb_copyarea(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:291:6: note: previous declaration of 'drm_fb_helper_cfb_copyarea' was here
    void drm_fb_helper_cfb_copyarea(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:189:6: error: static declaration of 'drm_fb_helper_cfb_imageblit' follows non-static declaration
    void drm_fb_helper_cfb_imageblit(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:293:6: note: previous declaration of 'drm_fb_helper_cfb_imageblit' was here
    void drm_fb_helper_cfb_imageblit(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:201:17: error: static declaration of 'drm_fb_helper_alloc_fbi' follows non-static declaration
    struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
                    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:265:17: note: previous declaration of 'drm_fb_helper_alloc_fbi' was here
    struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper);
                    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:208:6: error: static declaration of 'drm_fb_helper_unregister_fbi' follows non-static declaration
    void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:266:6: note: previous declaration of 'drm_fb_helper_unregister_fbi' was here
    void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:217:6: error: static declaration of 'drm_fb_helper_set_suspend_unlocked' follows non-static declaration
    void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:297:6: note: previous declaration of 'drm_fb_helper_set_suspend_unlocked' was here
    void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'drm_fb_helper_set_suspend_unlocked':
   include/kcl/kcl_drm.h:221:53: error: 'state' undeclared (first use in this function); did you mean 'statx'?
     _kcl_drm_fb_helper_set_suspend_unlocked(fb_helper, state);
                                                        ^~~~~
                                                        statx
   include/kcl/kcl_drm.h:221:53: note: each undeclared identifier is reported only once for each function it appears in
   include/kcl/kcl_drm.h: At top level:
>> include/kcl/kcl_drm.h:236:1: error: static declaration of 'drm_atomic_helper_update_legacy_modeset_state' follows non-static declaration
    drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:11:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_atomic_helper.h:74:1: note: previous declaration of 'drm_atomic_helper_update_legacy_modeset_state' was here
    drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_encoder_init':
   include/kcl/kcl_drm.h:303:9: error: too few arguments to function 'drm_encoder_init'
     return drm_encoder_init(dev, encoder, funcs,
            ^~~~~~~~~~~~~~~~
   In file included from include/drm/drm_modeset_helper_vtables.h:33:0,
                    from include/drm/drm_atomic_helper.h:32,
                    from include/kcl/kcl_drm.h:11,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_encoder.h:183:5: note: declared here
    int drm_encoder_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_crtc_init_with_planes':
   include/kcl/kcl_drm.h:318:10: error: too few arguments to function 'drm_crtc_init_with_planes'
      return drm_crtc_init_with_planes(dev, crtc, primary,
             ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drmP.h:68:0,
                    from include/kcl/kcl_drm.h:6,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_crtc.h:1120:5: note: declared here
    int drm_crtc_init_with_planes(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_universal_plane_init':
   include/kcl/kcl_drm.h:339:29: error: incompatible type for argument 7 of 'drm_universal_plane_init'
         formats, format_count, type);
                                ^~~~
   In file included from include/drm/drm_crtc.h:45:0,
                    from include/drm/drmP.h:68,
                    from include/kcl/kcl_drm.h:6,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_plane.h:713:5: note: expected 'const uint64_t * {aka const long long unsigned int *}' but argument is of type 'enum drm_plane_type'
    int drm_universal_plane_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:338:10: error: too few arguments to function 'drm_universal_plane_init'
      return drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
             ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_crtc.h:45:0,
                    from include/drm/drmP.h:68,
                    from include/kcl/kcl_drm.h:6,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_plane.h:713:5: note: declared here
    int drm_universal_plane_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_gem_object_lookup':
   include/kcl/kcl_drm.h:350:32: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
      return drm_gem_object_lookup(dev, filp, handle);
                                   ^~~
   In file included from include/kcl/kcl_drm.h:10:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:386:24: note: expected 'struct drm_file *' but argument is of type 'struct drm_device *'
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:350:37: warning: passing argument 2 of 'drm_gem_object_lookup' makes integer from pointer without a cast [-Wint-conversion]
      return drm_gem_object_lookup(dev, filp, handle);
                                        ^~~~
   In file included from include/kcl/kcl_drm.h:10:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:386:24: note: expected 'u32 {aka unsigned int}' but argument is of type 'struct drm_file *'
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
..

vim +/drm_atomic_helper_update_legacy_modeset_state +236 include/kcl/kcl_drm.h

   213	
   214	#ifndef HAVE_DRM_FB_HELPER_SET_SUSPEND_UNLOCKED
   215	extern void _kcl_drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper, int state);
   216	static inline
   217	void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
   218						bool suspend)
   219	
   220	{
 > 221		_kcl_drm_fb_helper_set_suspend_unlocked(fb_helper, state);
   222	}
   223	#endif
   224	
   225	#ifndef HAVE_DRM_FB_HELPER_FILL_INFO
   226	void drm_fb_helper_fill_info(struct fb_info *info,
   227				     struct drm_fb_helper *fb_helper,
   228				     struct drm_fb_helper_surface_size *sizes);
   229	#endif
   230	
   231	#ifndef HAVE_DRM_ATOMIC_HELPER_UPDATE_LEGACY_MODESET_STATE
   232	extern void _kcl_drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
   233						      struct drm_atomic_state *old_state);
   234	
   235	static inline void
 > 236	drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
   237						      struct drm_atomic_state *old_state)
   238	{
   239		_kcl_drm_atomic_helper_update_legacy_modeset_state(dev, old_state);
   240	}
   241	#endif
   242	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--kmbamtfyxlbk4euv
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
RZf/RFVdIf8PRgLRijAxAgA=

--kmbamtfyxlbk4euv
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--kmbamtfyxlbk4euv--
