Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A153F5DB4
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2019 07:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F047C6E13A;
	Sat,  9 Nov 2019 06:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A44D6E13A
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2019 06:30:10 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Nov 2019 22:30:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,283,1569308400"; 
 d="gz'50?scan'50,208,50";a="377962251"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 08 Nov 2019 22:30:07 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iTKG6-0006vL-H9; Sat, 09 Nov 2019 14:30:06 +0800
Date: Sat, 9 Nov 2019 14:29:06 +0800
From: kbuild test robot <lkp@intel.com>
To: Flora Cui <flora.cui@amd.com>
Subject: [radeon-alex:amd-mainline-dkms-5.2 2699/2834]
 include/kcl/kcl_drm.h:206:17: error: redefinition of
 'drm_fb_helper_alloc_fbi'
Message-ID: <201911091402.BKDujnso%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="rvrlh23zdvj5pilm"
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


--rvrlh23zdvj5pilm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-mainline-dkms-5.2
head:   a48b0cc1cdf3900e3e73801f9de64afbb70dc193
commit: faafc170760aa44876ca6d04bc0b461945c9c98d [2699/2834] drm/amdkcl: drop kcl_drm_fb_helper_{alloc,unregister}_fbi
config: x86_64-randconfig-e001-201944 (attached as .config)
compiler: gcc-7 (Debian 7.4.0-14) 7.4.0
reproduce:
        git checkout faafc170760aa44876ca6d04bc0b461945c9c98d
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:159:1: error: redefinition of 'drm_fb_helper_remove_conflicting_pci_framebuffers'
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
   include/kcl/kcl_drm.h:180:6: error: redefinition of 'drm_fb_helper_cfb_fillrect'
    void drm_fb_helper_cfb_fillrect(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:457:20: note: previous definition of 'drm_fb_helper_cfb_fillrect' was here
    static inline void drm_fb_helper_cfb_fillrect(struct fb_info *info,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:187:6: error: redefinition of 'drm_fb_helper_cfb_copyarea'
    void drm_fb_helper_cfb_copyarea(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:462:20: note: previous definition of 'drm_fb_helper_cfb_copyarea' was here
    static inline void drm_fb_helper_cfb_copyarea(struct fb_info *info,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:194:6: error: redefinition of 'drm_fb_helper_cfb_imageblit'
    void drm_fb_helper_cfb_imageblit(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:467:20: note: previous definition of 'drm_fb_helper_cfb_imageblit' was here
    static inline void drm_fb_helper_cfb_imageblit(struct fb_info *info,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
>> include/kcl/kcl_drm.h:206:17: error: redefinition of 'drm_fb_helper_alloc_fbi'
    struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
                    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:386:1: note: previous definition of 'drm_fb_helper_alloc_fbi' was here
    drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
>> include/kcl/kcl_drm.h:213:6: error: redefinition of 'drm_fb_helper_unregister_fbi'
    void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:391:20: note: previous definition of 'drm_fb_helper_unregister_fbi' was here
    static inline void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_encoder_init':
   include/kcl/kcl_drm.h:305:9: error: too few arguments to function 'drm_encoder_init'
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
   include/kcl/kcl_drm.h:320:10: error: too few arguments to function 'drm_crtc_init_with_planes'
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
   include/kcl/kcl_drm.h:341:29: error: incompatible type for argument 7 of 'drm_universal_plane_init'
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
   include/kcl/kcl_drm.h:340:10: error: too few arguments to function 'drm_universal_plane_init'
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
   include/kcl/kcl_drm.h:352:32: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
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
   include/kcl/kcl_drm.h:352:37: warning: passing argument 2 of 'drm_gem_object_lookup' makes integer from pointer without a cast [-Wint-conversion]
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
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:159:1: error: redefinition of 'drm_fb_helper_remove_conflicting_pci_framebuffers'
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
   include/kcl/kcl_drm.h:180:6: error: redefinition of 'drm_fb_helper_cfb_fillrect'
    void drm_fb_helper_cfb_fillrect(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:457:20: note: previous definition of 'drm_fb_helper_cfb_fillrect' was here
    static inline void drm_fb_helper_cfb_fillrect(struct fb_info *info,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:187:6: error: redefinition of 'drm_fb_helper_cfb_copyarea'
    void drm_fb_helper_cfb_copyarea(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:462:20: note: previous definition of 'drm_fb_helper_cfb_copyarea' was here
    static inline void drm_fb_helper_cfb_copyarea(struct fb_info *info,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:194:6: error: redefinition of 'drm_fb_helper_cfb_imageblit'
    void drm_fb_helper_cfb_imageblit(struct fb_info *info,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:467:20: note: previous definition of 'drm_fb_helper_cfb_imageblit' was here
    static inline void drm_fb_helper_cfb_imageblit(struct fb_info *info,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
>> include/kcl/kcl_drm.h:206:17: error: redefinition of 'drm_fb_helper_alloc_fbi'
    struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
                    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:386:1: note: previous definition of 'drm_fb_helper_alloc_fbi' was here
    drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
    ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
>> include/kcl/kcl_drm.h:213:6: error: redefinition of 'drm_fb_helper_unregister_fbi'
    void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from include/kcl/kcl_drm_backport.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:391:20: note: previous definition of 'drm_fb_helper_unregister_fbi' was here
    static inline void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_backport.h:5:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_encoder_init':
   include/kcl/kcl_drm.h:305:9: error: too few arguments to function 'drm_encoder_init'
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
   include/kcl/kcl_drm.h:320:10: error: too few arguments to function 'drm_crtc_init_with_planes'
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
   include/kcl/kcl_drm.h:341:29: error: incompatible type for argument 7 of 'drm_universal_plane_init'
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
   include/kcl/kcl_drm.h:340:10: error: too few arguments to function 'drm_universal_plane_init'
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
   include/kcl/kcl_drm.h:352:32: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
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
   include/kcl/kcl_drm.h:352:37: warning: passing argument 2 of 'drm_gem_object_lookup' makes integer from pointer without a cast [-Wint-conversion]
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

vim +/drm_fb_helper_alloc_fbi +206 include/kcl/kcl_drm.h

   204	
   205	static inline
 > 206	struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
   207	
   208	{
   209		return _kcl_drm_fb_helper_alloc_fbi(fb_helper);
   210	}
   211	
   212	static inline
 > 213	void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper)
   214	{
   215		_kcl_drm_fb_helper_unregister_fbi(fb_helper);
   216	}
   217	#endif
   218	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--rvrlh23zdvj5pilm
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--rvrlh23zdvj5pilm
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--rvrlh23zdvj5pilm--
