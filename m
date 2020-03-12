Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CFF183D29
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 00:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD356EB56;
	Thu, 12 Mar 2020 23:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039F06EB56
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 23:15:49 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 16:15:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,546,1574150400"; 
 d="gz'50?scan'50,208,50";a="235169046"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 12 Mar 2020 16:15:45 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jCX3I-0000rl-M7; Fri, 13 Mar 2020 07:15:44 +0800
Date: Fri, 13 Mar 2020 07:15:36 +0800
From: kbuild test robot <lkp@intel.com>
To: Flora Cui <flora.cui@amd.com>
Subject: [radeon-alex:amd-mainline-dkms-5.4 2602/2653]
 include/kcl/kcl_drm.h:337:2: error: implicit declaration of function
 'drm_dev_ref'; did you mean 'drm_dev_get'?
Message-ID: <202003130731.Ox1vXOLN%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Feifei Xu <Feifei.Xu@amd.com>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-mainline-dkms-5.4
head:   fa14e19bd78eecca201da26d22c7b95ee06769c6
commit: 2c983c686ea93d464867ca4fb4c4ce05abe20eec [2602/2653] drm/amdkcl: fake kcl copy of drm_dev_get
config: c6x-allyesconfig (attached as .config)
compiler: c6x-elf-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 2c983c686ea93d464867ca4fb4c4ce05abe20eec
        # save the attached .config to linux build tree
        GCC_VERSION=9.2.0 make.cross ARCH=c6x 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

         |         ^~~~~~~~~~~
   include/asm-generic/atomic.h:171:37: error: 'refcount_t' {aka 'const struct refcount_struct'} has no member named 'counter'
     171 | #define atomic_read(v) READ_ONCE((v)->counter)
         |                                     ^~
   include/linux/compiler.h:265:50: note: in definition of macro '__READ_ONCE'
     265 |   __read_once_size_nocheck(&(x), __u.__c, sizeof(x)); \
         |                                                  ^
   include/asm-generic/atomic.h:171:24: note: in expansion of macro 'READ_ONCE'
     171 | #define atomic_read(v) READ_ONCE((v)->counter)
         |                        ^~~~~~~~~
   include/kcl/kcl_kref.h:9:9: note: in expansion of macro 'atomic_read'
       9 |  return atomic_read(&kref->refcount);
         |         ^~~~~~~~~~~
   In file included from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/kcl/kcl_drm.h: At top level:
   include/kcl/kcl_drm.h:191:12: error: conflicting types for 'remove_conflicting_pci_framebuffers'
     191 | extern int remove_conflicting_pci_framebuffers(struct pci_dev *pdev, int res_id,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_crtc.h:31,
                    from include/kcl/kcl_drm_connector.h:4,
                    from <command-line>:
   include/linux/fb.h:610:12: note: previous declaration of 'remove_conflicting_pci_framebuffers' was here
     610 | extern int remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/kcl/kcl_drm.h:214:1: error: static declaration of 'drm_gem_object_put_unlocked' follows non-static declaration
     214 | drm_gem_object_put_unlocked(struct drm_gem_object *obj)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:13,
                    from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/drm/drm_gem.h:388:6: note: previous declaration of 'drm_gem_object_put_unlocked' was here
     388 | void drm_gem_object_put_unlocked(struct drm_gem_object *obj);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/kcl/kcl_drm.h: In function 'drm_gem_object_put_unlocked':
   include/kcl/kcl_drm.h:216:9: error: implicit declaration of function 'drm_gem_object_unreference_unlocked'; did you mean 'drm_gem_object_put_unlocked'? [-Werror=implicit-function-declaration]
     216 |  return drm_gem_object_unreference_unlocked(obj);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         drm_gem_object_put_unlocked
   include/kcl/kcl_drm.h:216:9: warning: 'return' with a value, in function returning void [-Wreturn-type]
     216 |  return drm_gem_object_unreference_unlocked(obj);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kcl/kcl_drm.h:214:1: note: declared here
     214 | drm_gem_object_put_unlocked(struct drm_gem_object *obj)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kcl/kcl_drm.h: At top level:
   include/kcl/kcl_drm.h:230:1: error: static declaration of '__drm_atomic_helper_connector_reset' follows non-static declaration
     230 | __drm_atomic_helper_connector_reset(struct drm_connector *connector,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_atomic_helper.h:34,
                    from include/kcl/kcl_drm.h:16,
                    from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/drm/drm_atomic_state_helper.h:62:6: note: previous declaration of '__drm_atomic_helper_connector_reset' was here
      62 | void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/kcl/kcl_drm.h:242:8: error: redefinition of 'struct drm_printer'
     242 | struct drm_printer {
         |        ^~~~~~~~~~~
   In file included from include/drm/drm_mm.h:49,
                    from include/drm/drm_vma_manager.h:26,
                    from include/kcl/kcl_drm.h:11,
                    from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/drm/drm_print.h:74:8: note: originally defined here
      74 | struct drm_printer {
         |        ^~~~~~~~~~~
   In file included from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/kcl/kcl_drm.h:248:6: error: conflicting types for 'drm_printf'
     248 | void drm_printf(struct drm_printer *p, const char *f, ...);
         |      ^~~~~~~~~~
   In file included from include/drm/drm_mm.h:49,
                    from include/drm/drm_vma_manager.h:26,
                    from include/kcl/kcl_drm.h:11,
                    from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/drm/drm_print.h:91:6: note: previous declaration of 'drm_printf' was here
      91 | void drm_printf(struct drm_printer *p, const char *f, ...);
         |      ^~~~~~~~~~
   In file included from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/kcl/kcl_drm.h:252:59: warning: 'struct drm_pending_event' declared inside parameter list will not be visible outside of this definition or declaration
     252 | void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e);
         |                                                           ^~~~~~~~~~~~~~~~~
   include/kcl/kcl_drm.h: In function 'kcl_drm_atomic_get_old_crtc_state_before_commit':
   include/kcl/kcl_drm.h:278:43: error: invalid type argument of '->' (have 'struct __drm_crtcs_state')
     278 |  return state->crtcs[drm_crtc_index(crtc)]->state;
         |                                           ^~
   include/kcl/kcl_drm.h: In function 'kcl_drm_atomic_get_new_crtc_state_after_commit':
   include/kcl/kcl_drm.h:313:43: error: invalid type argument of '->' (have 'struct __drm_crtcs_state')
     313 |  return state->crtcs[drm_crtc_index(crtc)]->state;
         |                                           ^~
   include/kcl/kcl_drm.h: In function 'drm_dev_get':
>> include/kcl/kcl_drm.h:337:2: error: implicit declaration of function 'drm_dev_ref'; did you mean 'drm_dev_get'? [-Werror=implicit-function-declaration]
     337 |  drm_dev_ref(dev);
         |  ^~~~~~~~~~~
         |  drm_dev_get
   include/kcl/kcl_drm.h: In function 'drm_dev_put':
>> include/kcl/kcl_drm.h:342:9: error: implicit declaration of function 'drm_dev_unref'; did you mean 'drm_dev_get'? [-Werror=implicit-function-declaration]
     342 |  return drm_dev_unref(dev);
         |         ^~~~~~~~~~~~~
         |         drm_dev_get
   include/kcl/kcl_drm.h:342:9: warning: 'return' with a value, in function returning void [-Wreturn-type]
     342 |  return drm_dev_unref(dev);
         |         ^~~~~~~~~~~~~~~~~~
   include/kcl/kcl_drm.h:340:20: note: declared here
     340 | static inline void drm_dev_put(struct drm_device *dev)
         |                    ^~~~~~~~~~~
   include/kcl/kcl_drm.h: At top level:
   include/kcl/kcl_drm.h:354:13: error: conflicting types for '__drm_printfn_debug'
     354 | extern void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf);
         |             ^~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_mm.h:49,
                    from include/drm/drm_vma_manager.h:26,
                    from include/kcl/kcl_drm.h:11,
                    from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/drm/drm_print.h:87:6: note: previous declaration of '__drm_printfn_debug' was here
      87 | void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf);
         |      ^~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/kcl/kcl_drm.h:356:34: error: conflicting types for 'drm_debug_printer'
     356 | static inline struct drm_printer drm_debug_printer(const char *prefix)
         |                                  ^~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_mm.h:49,
                    from include/drm/drm_vma_manager.h:26,
                    from include/kcl/kcl_drm.h:11,
                    from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/drm/drm_print.h:226:34: note: previous definition of 'drm_debug_printer' was here
     226 | static inline struct drm_printer drm_debug_printer(const char *prefix)
         |                                  ^~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/kcl/kcl_drm.h:377:6: error: static declaration of 'drm_fb_helper_cfb_fillrect' follows non-static declaration
     377 | void drm_fb_helper_cfb_fillrect(struct fb_info *info,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:9,
                    from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/drm/drm_fb_helper.h:251:6: note: previous declaration of 'drm_fb_helper_cfb_fillrect' was here
     251 | void drm_fb_helper_cfb_fillrect(struct fb_info *info,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/kcl/kcl_drm.h:384:6: error: static declaration of 'drm_fb_helper_cfb_copyarea' follows non-static declaration
     384 | void drm_fb_helper_cfb_copyarea(struct fb_info *info,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:9,
                    from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/drm/drm_fb_helper.h:253:6: note: previous declaration of 'drm_fb_helper_cfb_copyarea' was here
     253 | void drm_fb_helper_cfb_copyarea(struct fb_info *info,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/kcl/kcl_drm.h:391:6: error: static declaration of 'drm_fb_helper_cfb_imageblit' follows non-static declaration
     391 | void drm_fb_helper_cfb_imageblit(struct fb_info *info,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:9,
                    from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/drm/drm_fb_helper.h:255:6: note: previous declaration of 'drm_fb_helper_cfb_imageblit' was here
     255 | void drm_fb_helper_cfb_imageblit(struct fb_info *info,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/kcl/kcl_drm.h:403:17: error: static declaration of 'drm_fb_helper_alloc_fbi' follows non-static declaration
     403 | struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:9,
                    from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/drm/drm_fb_helper.h:228:17: note: previous declaration of 'drm_fb_helper_alloc_fbi' was here
     228 | struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/kcl/kcl_drm.h:410:6: error: static declaration of 'drm_fb_helper_unregister_fbi' follows non-static declaration
     410 | void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:9,
                    from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/drm/drm_fb_helper.h:229:6: note: previous declaration of 'drm_fb_helper_unregister_fbi' was here
     229 | void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/kcl/kcl_drm.h:419:6: error: static declaration of 'drm_fb_helper_set_suspend_unlocked' follows non-static declaration
     419 | void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:9,
                    from include/kcl/kcl_drm_connector.h:7,
                    from <command-line>:
   include/drm/drm_fb_helper.h:259:6: note: previous declaration of 'drm_fb_helper_set_suspend_unlocked' was here
     259 | void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from <command-line>:
   include/kcl/kcl_drm.h:191:12: error: conflicting types for 'remove_conflicting_pci_framebuffers'
     191 | extern int remove_conflicting_pci_framebuffers(struct pci_dev *pdev, int res_id,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_crtc.h:31,
                    from include/kcl/kcl_drm.h:8,
                    from <command-line>:
   include/linux/fb.h:610:12: note: previous declaration of 'remove_conflicting_pci_framebuffers' was here
     610 | extern int remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/kcl/kcl_drm.h:214:1: error: static declaration of 'drm_gem_object_put_unlocked' follows non-static declaration
     214 | drm_gem_object_put_unlocked(struct drm_gem_object *obj)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:13,
                    from <command-line>:
   include/drm/drm_gem.h:388:6: note: previous declaration of 'drm_gem_object_put_unlocked' was here
     388 | void drm_gem_object_put_unlocked(struct drm_gem_object *obj);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/kcl/kcl_drm.h: In function 'drm_gem_object_put_unlocked':
   include/kcl/kcl_drm.h:216:9: error: implicit declaration of function 'drm_gem_object_unreference_unlocked'; did you mean 'drm_gem_object_put_unlocked'? [-Werror=implicit-function-declaration]
     216 |  return drm_gem_object_unreference_unlocked(obj);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         drm_gem_object_put_unlocked
   include/kcl/kcl_drm.h:216:9: warning: 'return' with a value, in function returning void [-Wreturn-type]
     216 |  return drm_gem_object_unreference_unlocked(obj);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kcl/kcl_drm.h:214:1: note: declared here
     214 | drm_gem_object_put_unlocked(struct drm_gem_object *obj)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kcl/kcl_drm.h: At top level:
   include/kcl/kcl_drm.h:230:1: error: static declaration of '__drm_atomic_helper_connector_reset' follows non-static declaration
     230 | __drm_atomic_helper_connector_reset(struct drm_connector *connector,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_atomic_helper.h:34,
                    from include/kcl/kcl_drm.h:16,
                    from <command-line>:
   include/drm/drm_atomic_state_helper.h:62:6: note: previous declaration of '__drm_atomic_helper_connector_reset' was here
      62 | void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/kcl/kcl_drm.h:242:8: error: redefinition of 'struct drm_printer'
     242 | struct drm_printer {
         |        ^~~~~~~~~~~
   In file included from include/drm/drm_mm.h:49,
                    from include/drm/drm_vma_manager.h:26,
                    from include/kcl/kcl_drm.h:11,
                    from <command-line>:
   include/drm/drm_print.h:74:8: note: originally defined here
      74 | struct drm_printer {
         |        ^~~~~~~~~~~
   In file included from <command-line>:
   include/kcl/kcl_drm.h:248:6: error: conflicting types for 'drm_printf'
     248 | void drm_printf(struct drm_printer *p, const char *f, ...);
         |      ^~~~~~~~~~
   In file included from include/drm/drm_mm.h:49,
                    from include/drm/drm_vma_manager.h:26,
                    from include/kcl/kcl_drm.h:11,
                    from <command-line>:
   include/drm/drm_print.h:91:6: note: previous declaration of 'drm_printf' was here
      91 | void drm_printf(struct drm_printer *p, const char *f, ...);
         |      ^~~~~~~~~~
   In file included from <command-line>:
   include/kcl/kcl_drm.h:252:59: warning: 'struct drm_pending_event' declared inside parameter list will not be visible outside of this definition or declaration
     252 | void drm_send_event_locked(struct drm_device *dev, struct drm_pending_event *e);
         |                                                           ^~~~~~~~~~~~~~~~~
   include/kcl/kcl_drm.h: In function 'kcl_drm_atomic_get_old_crtc_state_before_commit':
   include/kcl/kcl_drm.h:278:43: error: invalid type argument of '->' (have 'struct __drm_crtcs_state')
     278 |  return state->crtcs[drm_crtc_index(crtc)]->state;
         |                                           ^~
   include/kcl/kcl_drm.h: In function 'kcl_drm_atomic_get_new_crtc_state_after_commit':
   include/kcl/kcl_drm.h:313:43: error: invalid type argument of '->' (have 'struct __drm_crtcs_state')
     313 |  return state->crtcs[drm_crtc_index(crtc)]->state;
         |                                           ^~
   include/kcl/kcl_drm.h: In function 'drm_dev_get':
>> include/kcl/kcl_drm.h:337:2: error: implicit declaration of function 'drm_dev_ref'; did you mean 'drm_dev_get'? [-Werror=implicit-function-declaration]
     337 |  drm_dev_ref(dev);
         |  ^~~~~~~~~~~
         |  drm_dev_get
   include/kcl/kcl_drm.h: In function 'drm_dev_put':
>> include/kcl/kcl_drm.h:342:9: error: implicit declaration of function 'drm_dev_unref'; did you mean 'drm_dev_get'? [-Werror=implicit-function-declaration]
     342 |  return drm_dev_unref(dev);
         |         ^~~~~~~~~~~~~
         |         drm_dev_get
   include/kcl/kcl_drm.h:342:9: warning: 'return' with a value, in function returning void [-Wreturn-type]
     342 |  return drm_dev_unref(dev);
         |         ^~~~~~~~~~~~~~~~~~
   include/kcl/kcl_drm.h:340:20: note: declared here
     340 | static inline void drm_dev_put(struct drm_device *dev)
         |                    ^~~~~~~~~~~
   include/kcl/kcl_drm.h: At top level:
   include/kcl/kcl_drm.h:354:13: error: conflicting types for '__drm_printfn_debug'
     354 | extern void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf);
         |             ^~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_mm.h:49,
                    from include/drm/drm_vma_manager.h:26,
                    from include/kcl/kcl_drm.h:11,
                    from <command-line>:
   include/drm/drm_print.h:87:6: note: previous declaration of '__drm_printfn_debug' was here
      87 | void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf);
         |      ^~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/kcl/kcl_drm.h:356:34: error: conflicting types for 'drm_debug_printer'
     356 | static inline struct drm_printer drm_debug_printer(const char *prefix)
         |                                  ^~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_mm.h:49,
                    from include/drm/drm_vma_manager.h:26,
                    from include/kcl/kcl_drm.h:11,
                    from <command-line>:
   include/drm/drm_print.h:226:34: note: previous definition of 'drm_debug_printer' was here
     226 | static inline struct drm_printer drm_debug_printer(const char *prefix)
         |                                  ^~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/kcl/kcl_drm.h:377:6: error: static declaration of 'drm_fb_helper_cfb_fillrect' follows non-static declaration
     377 | void drm_fb_helper_cfb_fillrect(struct fb_info *info,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:9,
                    from <command-line>:
   include/drm/drm_fb_helper.h:251:6: note: previous declaration of 'drm_fb_helper_cfb_fillrect' was here
     251 | void drm_fb_helper_cfb_fillrect(struct fb_info *info,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/kcl/kcl_drm.h:384:6: error: static declaration of 'drm_fb_helper_cfb_copyarea' follows non-static declaration
     384 | void drm_fb_helper_cfb_copyarea(struct fb_info *info,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:9,
                    from <command-line>:
   include/drm/drm_fb_helper.h:253:6: note: previous declaration of 'drm_fb_helper_cfb_copyarea' was here
     253 | void drm_fb_helper_cfb_copyarea(struct fb_info *info,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/kcl/kcl_drm.h:391:6: error: static declaration of 'drm_fb_helper_cfb_imageblit' follows non-static declaration
     391 | void drm_fb_helper_cfb_imageblit(struct fb_info *info,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:9,
                    from <command-line>:
   include/drm/drm_fb_helper.h:255:6: note: previous declaration of 'drm_fb_helper_cfb_imageblit' was here
     255 | void drm_fb_helper_cfb_imageblit(struct fb_info *info,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/kcl/kcl_drm.h:403:17: error: static declaration of 'drm_fb_helper_alloc_fbi' follows non-static declaration
     403 | struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:9,
                    from <command-line>:
   include/drm/drm_fb_helper.h:228:17: note: previous declaration of 'drm_fb_helper_alloc_fbi' was here
     228 | struct fb_info *drm_fb_helper_alloc_fbi(struct drm_fb_helper *fb_helper);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/kcl/kcl_drm.h:410:6: error: static declaration of 'drm_fb_helper_unregister_fbi' follows non-static declaration
     410 | void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:9,
                    from <command-line>:
   include/drm/drm_fb_helper.h:229:6: note: previous declaration of 'drm_fb_helper_unregister_fbi' was here
     229 | void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/kcl/kcl_drm.h:419:6: error: static declaration of 'drm_fb_helper_set_suspend_unlocked' follows non-static declaration
     419 | void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:9,
                    from <command-line>:
   include/drm/drm_fb_helper.h:259:6: note: previous declaration of 'drm_fb_helper_set_suspend_unlocked' was here
     259 | void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/kcl/kcl_drm.h:432:1: error: static declaration of 'drm_atomic_helper_update_legacy_modeset_state' follows non-static declaration
     432 | drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:16,
                    from <command-line>:
   include/drm/drm_atomic_helper.h:74:1: note: previous declaration of 'drm_atomic_helper_update_legacy_modeset_state' was here
      74 | drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   include/kcl/kcl_drm.h:457:20: error: static declaration of 'drm_mode_is_420_only' follows non-static declaration
     457 | static inline bool drm_mode_is_420_only(const struct drm_display_info *display,
         |                    ^~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_crtc.h:40,
                    from include/kcl/kcl_drm.h:8,
..

vim +337 include/kcl/kcl_drm.h

   333	
   334	#ifndef HAVE_DRM_DEV_PUT
   335	static inline void drm_dev_get(struct drm_device *dev)
   336	{
 > 337		drm_dev_ref(dev);
   338	}
   339	
   340	static inline void drm_dev_put(struct drm_device *dev)
   341	{
 > 342		return drm_dev_unref(dev);
   343	}
   344	#endif
   345	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--KsGdsel6WgEHnImy
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--KsGdsel6WgEHnImy
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--KsGdsel6WgEHnImy--
