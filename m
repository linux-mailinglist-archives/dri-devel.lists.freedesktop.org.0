Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC85ECCD6
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 02:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035C16F8AA;
	Sat,  2 Nov 2019 01:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAAA6F8AA
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2019 01:31:59 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 18:31:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,257,1569308400"; 
 d="gz'50?scan'50,208,50";a="199971478"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 01 Nov 2019 18:31:56 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iQiGh-0007X0-I1; Sat, 02 Nov 2019 09:31:55 +0800
Date: Sat, 2 Nov 2019 09:31:27 +0800
From: kbuild test robot <lkp@intel.com>
To: Flora Cui <flora.cui@amd.com>
Subject: [radeon-alex:amd-mainline-dkms-5.2 2121/2647]
 include/kcl/kcl_drm.h:104:1: error: redefinition of
 'drm_fb_helper_remove_conflicting_pci_framebuffers'
Message-ID: <201911020901.ygGXg9jB%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="edekwuvf5wyjbfsu"
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
Cc: kbuild-all@lists.01.org, Jack Gui <Jack.Gui@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--edekwuvf5wyjbfsu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-mainline-dkms-5.2
head:   b027ed8d9051470f4ed6bc071fcde172fe1fc595
commit: a54762aadc4f9bc23849aa01cac1ed8ad158ca3a [2121/2647] drm/amdkcl: refactor drm_fb_helper_remove_conflicting_pci_framebuffers() check
config: x86_64-randconfig-g002-201943 (attached as .config)
compiler: gcc-7 (Debian 7.4.0-14) 7.4.0
reproduce:
        git checkout a54762aadc4f9bc23849aa01cac1ed8ad158ca3a
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
>> include/kcl/kcl_drm.h:104:1: error: redefinition of 'drm_fb_helper_remove_conflicting_pci_framebuffers'
    drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:612:1: note: previous definition of 'drm_fb_helper_remove_conflicting_pci_framebuffers' was here
    drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_encoder_init':
   include/kcl/kcl_drm.h:202:9: error: too few arguments to function 'drm_encoder_init'
     return drm_encoder_init(dev, encoder, funcs,
            ^~~~~~~~~~~~~~~~
   In file included from include/drm/drm_modeset_helper_vtables.h:33:0,
                    from include/drm/drm_atomic_helper.h:32,
                    from include/kcl/kcl_drm.h:10,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_encoder.h:183:5: note: declared here
    int drm_encoder_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_crtc_init_with_planes':
   include/kcl/kcl_drm.h:217:10: error: too few arguments to function 'drm_crtc_init_with_planes'
      return drm_crtc_init_with_planes(dev, crtc, primary,
             ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drmP.h:68:0,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_crtc.h:1120:5: note: declared here
    int drm_crtc_init_with_planes(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_universal_plane_init':
   include/kcl/kcl_drm.h:238:29: error: incompatible type for argument 7 of 'drm_universal_plane_init'
         formats, format_count, type);
                                ^~~~
   In file included from include/drm/drm_crtc.h:45:0,
                    from include/drm/drmP.h:68,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_plane.h:713:5: note: expected 'const uint64_t * {aka const long long unsigned int *}' but argument is of type 'enum drm_plane_type'
    int drm_universal_plane_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:237:10: error: too few arguments to function 'drm_universal_plane_init'
      return drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
             ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_crtc.h:45:0,
                    from include/drm/drmP.h:68,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_plane.h:713:5: note: declared here
    int drm_universal_plane_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_gem_object_lookup':
   include/kcl/kcl_drm.h:249:32: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
      return drm_gem_object_lookup(dev, filp, handle);
                                   ^~~
   In file included from include/kcl/kcl_drm.h:9:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:386:24: note: expected 'struct drm_file *' but argument is of type 'struct drm_device *'
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:249:37: warning: passing argument 2 of 'drm_gem_object_lookup' makes integer from pointer without a cast [-Wint-conversion]
      return drm_gem_object_lookup(dev, filp, handle);
                                        ^~~~
   In file included from include/kcl/kcl_drm.h:9:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:386:24: note: expected 'u32 {aka unsigned int}' but argument is of type 'struct drm_file *'
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:249:10: error: too many arguments to function 'drm_gem_object_lookup'
      return drm_gem_object_lookup(dev, filp, handle);
             ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:9:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:386:24: note: declared here
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: At top level:
   include/kcl/kcl_drm.h:258:8: error: redefinition of 'struct drm_format_name_buf'
--
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
>> include/kcl/kcl_drm.h:104:1: error: redefinition of 'drm_fb_helper_remove_conflicting_pci_framebuffers'
    drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:612:1: note: previous definition of 'drm_fb_helper_remove_conflicting_pci_framebuffers' was here
    drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_encoder_init':
   include/kcl/kcl_drm.h:202:9: error: too few arguments to function 'drm_encoder_init'
     return drm_encoder_init(dev, encoder, funcs,
            ^~~~~~~~~~~~~~~~
   In file included from include/drm/drm_modeset_helper_vtables.h:33:0,
                    from include/drm/drm_atomic_helper.h:32,
                    from include/kcl/kcl_drm.h:10,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_encoder.h:183:5: note: declared here
    int drm_encoder_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_crtc_init_with_planes':
   include/kcl/kcl_drm.h:217:10: error: too few arguments to function 'drm_crtc_init_with_planes'
      return drm_crtc_init_with_planes(dev, crtc, primary,
             ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drmP.h:68:0,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_crtc.h:1120:5: note: declared here
    int drm_crtc_init_with_planes(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_universal_plane_init':
   include/kcl/kcl_drm.h:238:29: error: incompatible type for argument 7 of 'drm_universal_plane_init'
         formats, format_count, type);
                                ^~~~
   In file included from include/drm/drm_crtc.h:45:0,
                    from include/drm/drmP.h:68,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_plane.h:713:5: note: expected 'const uint64_t * {aka const long long unsigned int *}' but argument is of type 'enum drm_plane_type'
    int drm_universal_plane_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:237:10: error: too few arguments to function 'drm_universal_plane_init'
      return drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
             ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_crtc.h:45:0,
                    from include/drm/drmP.h:68,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_plane.h:713:5: note: declared here
    int drm_universal_plane_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_gem_object_lookup':
   include/kcl/kcl_drm.h:249:32: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
      return drm_gem_object_lookup(dev, filp, handle);
                                   ^~~
   In file included from include/kcl/kcl_drm.h:9:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:386:24: note: expected 'struct drm_file *' but argument is of type 'struct drm_device *'
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:249:37: warning: passing argument 2 of 'drm_gem_object_lookup' makes integer from pointer without a cast [-Wint-conversion]
      return drm_gem_object_lookup(dev, filp, handle);
                                        ^~~~
   In file included from include/kcl/kcl_drm.h:9:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:386:24: note: expected 'u32 {aka unsigned int}' but argument is of type 'struct drm_file *'
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:249:10: error: too many arguments to function 'drm_gem_object_lookup'
      return drm_gem_object_lookup(dev, filp, handle);
             ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:9:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:386:24: note: declared here
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: At top level:
   include/kcl/kcl_drm.h:258:8: error: redefinition of 'struct drm_format_name_buf'
--
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
>> include/kcl/kcl_drm.h:104:1: error: redefinition of 'drm_fb_helper_remove_conflicting_pci_framebuffers'
    drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:7:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fb_helper.h:612:1: note: previous definition of 'drm_fb_helper_remove_conflicting_pci_framebuffers' was here
    drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_encoder_init':
   include/kcl/kcl_drm.h:202:9: error: too few arguments to function 'drm_encoder_init'
     return drm_encoder_init(dev, encoder, funcs,
            ^~~~~~~~~~~~~~~~
   In file included from include/drm/drm_modeset_helper_vtables.h:33:0,
                    from include/drm/drm_atomic_helper.h:32,
                    from include/kcl/kcl_drm.h:10,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_encoder.h:183:5: note: declared here
    int drm_encoder_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_crtc_init_with_planes':
   include/kcl/kcl_drm.h:217:10: error: too few arguments to function 'drm_crtc_init_with_planes'
      return drm_crtc_init_with_planes(dev, crtc, primary,
             ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drmP.h:68:0,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_crtc.h:1120:5: note: declared here
    int drm_crtc_init_with_planes(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_universal_plane_init':
   include/kcl/kcl_drm.h:238:29: error: incompatible type for argument 7 of 'drm_universal_plane_init'
         formats, format_count, type);
                                ^~~~
   In file included from include/drm/drm_crtc.h:45:0,
                    from include/drm/drmP.h:68,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_plane.h:713:5: note: expected 'const uint64_t * {aka const long long unsigned int *}' but argument is of type 'enum drm_plane_type'
    int drm_universal_plane_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:237:10: error: too few arguments to function 'drm_universal_plane_init'
      return drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
             ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_crtc.h:45:0,
                    from include/drm/drmP.h:68,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_plane.h:713:5: note: declared here
    int drm_universal_plane_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_gem_object_lookup':
   include/kcl/kcl_drm.h:249:32: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
      return drm_gem_object_lookup(dev, filp, handle);
                                   ^~~
   In file included from include/kcl/kcl_drm.h:9:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:386:24: note: expected 'struct drm_file *' but argument is of type 'struct drm_device *'
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:249:37: warning: passing argument 2 of 'drm_gem_object_lookup' makes integer from pointer without a cast [-Wint-conversion]
      return drm_gem_object_lookup(dev, filp, handle);
                                        ^~~~
   In file included from include/kcl/kcl_drm.h:9:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:386:24: note: expected 'u32 {aka unsigned int}' but argument is of type 'struct drm_file *'
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:249:10: error: too many arguments to function 'drm_gem_object_lookup'
      return drm_gem_object_lookup(dev, filp, handle);
             ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:9:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:386:24: note: declared here
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: At top level:
   include/kcl/kcl_drm.h:258:8: error: redefinition of 'struct drm_format_name_buf'
..

vim +/drm_fb_helper_remove_conflicting_pci_framebuffers +104 include/kcl/kcl_drm.h

    97	
    98	#define IS_REACHABLE(option) __or(IS_BUILTIN(option), \
    99					__and(IS_MODULE(option), __is_defined(MODULE)))
   100	#endif
   101	extern int remove_conflicting_pci_framebuffers(struct pci_dev *pdev, int res_id,
   102						       const char *name);
   103	static inline int
 > 104	drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
   105							  int resource_id,
   106							  const char *name)
   107	{
   108	#if IS_REACHABLE(CONFIG_FB)
   109		return remove_conflicting_pci_framebuffers(pdev, resource_id, name);
   110	#else
   111		return 0;
   112	#endif
   113	}
   114	#endif
   115	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--edekwuvf5wyjbfsu
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
qoOjTFqhPdnVe/huPlrl+B/DDn5URwYCAA==

--edekwuvf5wyjbfsu
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--edekwuvf5wyjbfsu--
