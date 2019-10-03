Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B6EC9788
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 06:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539DE6E048;
	Thu,  3 Oct 2019 04:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1516E048
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 04:44:27 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Oct 2019 21:44:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,250,1566889200"; 
 d="gz'50?scan'50,208,50";a="343553766"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 02 Oct 2019 21:44:23 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iFsyV-000Bor-Cd; Thu, 03 Oct 2019 12:44:23 +0800
Date: Thu, 3 Oct 2019 12:44:14 +0800
From: kbuild test robot <lkp@intel.com>
To: Flora Cui <flora.cui@amd.com>
Subject: [radeon-alex:amd-mainline-dkms-5.0 3808/3821]
 include/kcl/kcl_drm.h:635:20: error: static declaration of
 'drm_mode_is_420_only' follows non-static declaration
Message-ID: <201910031213.bia2Q1HH%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="4og4nq2xyxxlddug"
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
Cc: Feifei Xu <FeifeiXu@amd.com>, kbuild-all@01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4og4nq2xyxxlddug
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://people.freedesktop.org/~agd5f/linux.git amd-mainline-dkms-5.0
head:   e971bfc1faa0fa4df97ecca7a867a194455f26fd
commit: 13a2da823a67d53982d85b4d28a9a2532fede843 [3808/3821] drm/amd/autoconf: check drm_mode_is_420_xxx() is available
config: i386-randconfig-b004-201939 (attached as .config)
compiler: gcc-7 (Debian 7.4.0-13) 7.4.0
reproduce:
        git checkout 13a2da823a67d53982d85b4d28a9a2532fede843
        # save the attached .config to linux build tree
        make ARCH=i386 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_universal_plane_init':
   include/kcl/kcl_drm.h:343:29: error: incompatible type for argument 7 of 'drm_universal_plane_init'
         formats, format_count, type);
                                ^~~~
   In file included from include/drm/drm_crtc.h:45:0,
                    from include/drm/drmP.h:69,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_plane.h:713:5: note: expected 'const uint64_t * {aka const long long unsigned int *}' but argument is of type 'enum drm_plane_type'
    int drm_universal_plane_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:342:10: error: too few arguments to function 'drm_universal_plane_init'
      return drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
             ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_crtc.h:45:0,
                    from include/drm/drmP.h:69,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_plane.h:713:5: note: declared here
    int drm_universal_plane_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_gem_object_lookup':
   include/kcl/kcl_drm.h:354:32: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
      return drm_gem_object_lookup(dev, filp, handle);
                                   ^~~
   In file included from include/kcl/kcl_drm.h:10:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:365:24: note: expected 'struct drm_file *' but argument is of type 'struct drm_device *'
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:354:37: warning: passing argument 2 of 'drm_gem_object_lookup' makes integer from pointer without a cast [-Wint-conversion]
      return drm_gem_object_lookup(dev, filp, handle);
                                        ^~~~
   In file included from include/kcl/kcl_drm.h:10:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:365:24: note: expected 'u32 {aka unsigned int}' but argument is of type 'struct drm_file *'
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:354:10: error: too many arguments to function 'drm_gem_object_lookup'
      return drm_gem_object_lookup(dev, filp, handle);
             ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:10:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:365:24: note: declared here
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: At top level:
   include/kcl/kcl_drm.h:390:8: error: redefinition of 'struct drm_format_name_buf'
    struct drm_format_name_buf {
           ^~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drmP.h:70:0,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fourcc.h:142:8: note: originally defined here
    struct drm_format_name_buf {
           ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_gem_object_put_unlocked':
   include/kcl/kcl_drm.h:422:9: error: implicit declaration of function 'drm_gem_object_unreference_unlocked'; did you mean 'drm_gem_object_put_unlocked'? [-Werror=implicit-function-declaration]
     return drm_gem_object_unreference_unlocked(obj);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            drm_gem_object_put_unlocked
   include/kcl/kcl_drm.h:422:9: warning: 'return' with a value, in function returning void
     return drm_gem_object_unreference_unlocked(obj);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kcl/kcl_drm.h:419:20: note: declared here
    static inline void kcl_drm_gem_object_put_unlocked(struct drm_gem_object *obj)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kcl/kcl_drm.h: At top level:
   include/kcl/kcl_drm.h:536:34: error: redefinition of 'drm_debug_printer'
    static inline struct drm_printer drm_debug_printer(const char *prefix)
                                     ^~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_mm.h:49:0,
                    from include/drm/drmP.h:72,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_print.h:217:34: note: previous definition of 'drm_debug_printer' was here
    static inline struct drm_printer drm_debug_printer(const char *prefix)
                                     ^~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
>> include/kcl/kcl_drm.h:635:20: error: static declaration of 'drm_mode_is_420_only' follows non-static declaration
    static inline bool drm_mode_is_420_only(const struct drm_display_info *display,
                       ^~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_crtc.h:40:0,
                    from include/drm/drmP.h:69,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_modes.h:471:6: note: previous declaration of 'drm_mode_is_420_only' was here
    bool drm_mode_is_420_only(const struct drm_display_info *display,
         ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
>> include/kcl/kcl_drm.h:642:20: error: static declaration of 'drm_mode_is_420_also' follows non-static declaration
    static inline bool drm_mode_is_420_also(const struct drm_display_info *display,
                       ^~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_crtc.h:40:0,
                    from include/drm/drmP.h:69,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_modes.h:473:6: note: previous declaration of 'drm_mode_is_420_also' was here
    bool drm_mode_is_420_also(const struct drm_display_info *display,
         ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:9:0,
                    from <command-line>:0:
   include/kcl/kcl_kref.h:7:28: error: redefinition of 'kref_read'
    static inline unsigned int kref_read(const struct kref *kref)
                               ^~~~~~~~~
   In file included from include/linux/dma-fence.h:28:0,
                    from include/kcl/kcl_fence.h:10,
                    from drivers/gpu/drm/ttm/backport/backport.h:5,
                    from <command-line>:0:
   include/linux/kref.h:36:28: note: previous definition of 'kref_read' was here
    static inline unsigned int kref_read(const struct kref *kref)
                               ^~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:9:0,
                    from <command-line>:0:
   include/kcl/kcl_kref.h: In function 'kref_read':
   include/kcl/kcl_kref.h:9:21: error: passing argument 1 of 'atomic_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return atomic_read(&kref->refcount);
                        ^
   In file included from arch/x86/include/asm/atomic.h:265:0,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:38,
                    from include/kcl/kcl_rcupdate.h:4,
                    from include/kcl/kcl_fence.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:5,
                    from <command-line>:0:
   include/asm-generic/atomic-instrumented.h:19:28: note: expected 'const atomic_t * {aka const struct <anonymous> *}' but argument is of type 'const refcount_t * {aka const struct refcount_struct *}'
    static __always_inline int atomic_read(const atomic_t *v)
                               ^~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:11:0,
                    from <command-line>:0:
   include/kcl/kcl_mm_types.h: At top level:
   include/kcl/kcl_mm_types.h:10:3: error: conflicting types for 'pfn_t'
    } pfn_t;
      ^~~~~
   In file included from include/asm-generic/memory_model.h:5:0,
                    from arch/x86/include/asm/page.h:76,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:38,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:40,
                    from include/kcl/kcl_rcupdate.h:4,
                    from include/kcl/kcl_fence.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:5,
                    from <command-line>:0:
   include/linux/pfn.h:15:3: note: previous declaration of 'pfn_t' was here
    } pfn_t;
      ^~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:11:0,
                    from <command-line>:0:
   include/kcl/kcl_mm_types.h:35:26: error: conflicting types for 'vmf_insert_mixed'
    static inline vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma,
                             ^~~~~~~~~~~~~~~~
   In file included from include/linux/scatterlist.h:8:0,
                    from include/linux/dma-mapping.h:11,
                    from include/drm/drmP.h:37,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/linux/mm.h:2572:12: note: previous declaration of 'vmf_insert_mixed' was here
    vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
               ^~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:11:0,
                    from <command-line>:0:
   include/kcl/kcl_mm_types.h: In function 'vmf_insert_mixed':
   include/kcl/kcl_mm_types.h:41:8: error: implicit declaration of function 'vm_insert_mixed'; did you mean 'vmf_insert_mixed'? [-Werror=implicit-function-declaration]
     err = vm_insert_mixed(vma, addr, pfn_t_to_pfn(pfn));
           ^~~~~~~~~~~~~~~
           vmf_insert_mixed
   include/kcl/kcl_mm_types.h: At top level:
   include/kcl/kcl_mm_types.h:53:26: error: static declaration of 'vmf_insert_pfn' follows non-static declaration
    static inline vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma,
                             ^~~~~~~~~~~~~~
   In file included from include/linux/scatterlist.h:8:0,
                    from include/linux/dma-mapping.h:11,
                    from include/drm/drmP.h:37,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/linux/mm.h:2568:12: note: previous declaration of 'vmf_insert_pfn' was here
    vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
               ^~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:11:0,
                    from <command-line>:0:
   include/kcl/kcl_mm_types.h: In function 'vmf_insert_pfn':
   include/kcl/kcl_mm_types.h:56:13: error: implicit declaration of function 'vm_insert_pfn'; did you mean 'vmf_insert_pfn'? [-Werror=implicit-function-declaration]
      int err = vm_insert_pfn(vma, addr, pfn);
                ^~~~~~~~~~~~~
                vmf_insert_pfn
   In file included from drivers/gpu/drm/ttm/backport/backport.h:12:0,
--
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_universal_plane_init':
   include/kcl/kcl_drm.h:343:29: error: incompatible type for argument 7 of 'drm_universal_plane_init'
         formats, format_count, type);
                                ^~~~
   In file included from include/drm/drm_crtc.h:45:0,
                    from include/drm/drmP.h:69,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_plane.h:713:5: note: expected 'const uint64_t * {aka const long long unsigned int *}' but argument is of type 'enum drm_plane_type'
    int drm_universal_plane_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:342:10: error: too few arguments to function 'drm_universal_plane_init'
      return drm_universal_plane_init(dev, plane, possible_crtcs, funcs,
             ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_crtc.h:45:0,
                    from include/drm/drmP.h:69,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_plane.h:713:5: note: declared here
    int drm_universal_plane_init(struct drm_device *dev,
        ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_gem_object_lookup':
   include/kcl/kcl_drm.h:354:32: error: passing argument 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=incompatible-pointer-types]
      return drm_gem_object_lookup(dev, filp, handle);
                                   ^~~
   In file included from include/kcl/kcl_drm.h:10:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:365:24: note: expected 'struct drm_file *' but argument is of type 'struct drm_device *'
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:354:37: warning: passing argument 2 of 'drm_gem_object_lookup' makes integer from pointer without a cast [-Wint-conversion]
      return drm_gem_object_lookup(dev, filp, handle);
                                        ^~~~
   In file included from include/kcl/kcl_drm.h:10:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:365:24: note: expected 'u32 {aka unsigned int}' but argument is of type 'struct drm_file *'
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h:354:10: error: too many arguments to function 'drm_gem_object_lookup'
      return drm_gem_object_lookup(dev, filp, handle);
             ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/kcl/kcl_drm.h:10:0,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_gem.h:365:24: note: declared here
    struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
                           ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: At top level:
   include/kcl/kcl_drm.h:390:8: error: redefinition of 'struct drm_format_name_buf'
    struct drm_format_name_buf {
           ^~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drmP.h:70:0,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_fourcc.h:142:8: note: originally defined here
    struct drm_format_name_buf {
           ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
   include/kcl/kcl_drm.h: In function 'kcl_drm_gem_object_put_unlocked':
   include/kcl/kcl_drm.h:422:9: error: implicit declaration of function 'drm_gem_object_unreference_unlocked'; did you mean 'drm_gem_object_put_unlocked'? [-Werror=implicit-function-declaration]
     return drm_gem_object_unreference_unlocked(obj);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            drm_gem_object_put_unlocked
   include/kcl/kcl_drm.h:422:9: warning: 'return' with a value, in function returning void
     return drm_gem_object_unreference_unlocked(obj);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kcl/kcl_drm.h:419:20: note: declared here
    static inline void kcl_drm_gem_object_put_unlocked(struct drm_gem_object *obj)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kcl/kcl_drm.h: At top level:
   include/kcl/kcl_drm.h:536:34: error: redefinition of 'drm_debug_printer'
    static inline struct drm_printer drm_debug_printer(const char *prefix)
                                     ^~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_mm.h:49:0,
                    from include/drm/drmP.h:72,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_print.h:217:34: note: previous definition of 'drm_debug_printer' was here
    static inline struct drm_printer drm_debug_printer(const char *prefix)
                                     ^~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
>> include/kcl/kcl_drm.h:635:20: error: static declaration of 'drm_mode_is_420_only' follows non-static declaration
    static inline bool drm_mode_is_420_only(const struct drm_display_info *display,
                       ^~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_crtc.h:40:0,
                    from include/drm/drmP.h:69,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_modes.h:471:6: note: previous declaration of 'drm_mode_is_420_only' was here
    bool drm_mode_is_420_only(const struct drm_display_info *display,
         ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:6:0,
                    from <command-line>:0:
>> include/kcl/kcl_drm.h:642:20: error: static declaration of 'drm_mode_is_420_also' follows non-static declaration
    static inline bool drm_mode_is_420_also(const struct drm_display_info *display,
                       ^~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_crtc.h:40:0,
                    from include/drm/drmP.h:69,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/drm/drm_modes.h:473:6: note: previous declaration of 'drm_mode_is_420_also' was here
    bool drm_mode_is_420_also(const struct drm_display_info *display,
         ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:9:0,
                    from <command-line>:0:
   include/kcl/kcl_kref.h:7:28: error: redefinition of 'kref_read'
    static inline unsigned int kref_read(const struct kref *kref)
                               ^~~~~~~~~
   In file included from include/linux/dma-fence.h:28:0,
                    from include/kcl/kcl_fence.h:10,
                    from drivers/gpu/drm/ttm/backport/backport.h:5,
                    from <command-line>:0:
   include/linux/kref.h:36:28: note: previous definition of 'kref_read' was here
    static inline unsigned int kref_read(const struct kref *kref)
                               ^~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:9:0,
                    from <command-line>:0:
   include/kcl/kcl_kref.h: In function 'kref_read':
   include/kcl/kcl_kref.h:9:21: error: passing argument 1 of 'atomic_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return atomic_read(&kref->refcount);
                        ^
   In file included from arch/x86/include/asm/atomic.h:265:0,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:38,
                    from include/kcl/kcl_rcupdate.h:4,
                    from include/kcl/kcl_fence.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:5,
                    from <command-line>:0:
   include/asm-generic/atomic-instrumented.h:19:28: note: expected 'const atomic_t * {aka const struct <anonymous> *}' but argument is of type 'const refcount_t * {aka const struct refcount_struct *}'
    static __always_inline int atomic_read(const atomic_t *v)
                               ^~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:11:0,
                    from <command-line>:0:
   include/kcl/kcl_mm_types.h: At top level:
   include/kcl/kcl_mm_types.h:10:3: error: conflicting types for 'pfn_t'
    } pfn_t;
      ^~~~~
   In file included from include/asm-generic/memory_model.h:5:0,
                    from arch/x86/include/asm/page.h:76,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:38,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:40,
                    from include/kcl/kcl_rcupdate.h:4,
                    from include/kcl/kcl_fence.h:5,
                    from drivers/gpu/drm/ttm/backport/backport.h:5,
                    from <command-line>:0:
   include/linux/pfn.h:15:3: note: previous declaration of 'pfn_t' was here
    } pfn_t;
      ^~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:11:0,
                    from <command-line>:0:
   include/kcl/kcl_mm_types.h:35:26: error: conflicting types for 'vmf_insert_mixed'
    static inline vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma,
                             ^~~~~~~~~~~~~~~~
   In file included from include/linux/scatterlist.h:8:0,
                    from include/linux/dma-mapping.h:11,
                    from include/drm/drmP.h:37,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/linux/mm.h:2572:12: note: previous declaration of 'vmf_insert_mixed' was here
    vm_fault_t vmf_insert_mixed(struct vm_area_struct *vma, unsigned long addr,
               ^~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:11:0,
                    from <command-line>:0:
   include/kcl/kcl_mm_types.h: In function 'vmf_insert_mixed':
   include/kcl/kcl_mm_types.h:41:8: error: implicit declaration of function 'vm_insert_mixed'; did you mean 'vmf_insert_mixed'? [-Werror=implicit-function-declaration]
     err = vm_insert_mixed(vma, addr, pfn_t_to_pfn(pfn));
           ^~~~~~~~~~~~~~~
           vmf_insert_mixed
   include/kcl/kcl_mm_types.h: At top level:
   include/kcl/kcl_mm_types.h:53:26: error: static declaration of 'vmf_insert_pfn' follows non-static declaration
    static inline vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma,
                             ^~~~~~~~~~~~~~
   In file included from include/linux/scatterlist.h:8:0,
                    from include/linux/dma-mapping.h:11,
                    from include/drm/drmP.h:37,
                    from include/kcl/kcl_drm.h:6,
                    from drivers/gpu/drm/ttm/backport/backport.h:6,
                    from <command-line>:0:
   include/linux/mm.h:2568:12: note: previous declaration of 'vmf_insert_pfn' was here
    vm_fault_t vmf_insert_pfn(struct vm_area_struct *vma, unsigned long addr,
               ^~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/ttm/backport/backport.h:11:0,
                    from <command-line>:0:
   include/kcl/kcl_mm_types.h: In function 'vmf_insert_pfn':
   include/kcl/kcl_mm_types.h:56:13: error: implicit declaration of function 'vm_insert_pfn'; did you mean 'vmf_insert_pfn'? [-Werror=implicit-function-declaration]
      int err = vm_insert_pfn(vma, addr, pfn);
                ^~~~~~~~~~~~~
                vmf_insert_pfn
   In file included from drivers/gpu/drm/ttm/backport/backport.h:12:0,
..

vim +/drm_mode_is_420_only +635 include/kcl/kcl_drm.h

   633	
   634	#ifndef HAVE_DRM_MODE_IS_420_XXX
 > 635	static inline bool drm_mode_is_420_only(const struct drm_display_info *display,
   636				  const struct drm_display_mode *mode)
   637	{
   638		/* DRM < 4.4 ,un-support this pixel format */
   639		printk_once(KERN_WARNING "This kernel version not support API: drm_mode_is_420_only!\n");
   640		return false;
   641	}
 > 642	static inline bool drm_mode_is_420_also(const struct drm_display_info *display,

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--4og4nq2xyxxlddug
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--4og4nq2xyxxlddug
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--4og4nq2xyxxlddug--
