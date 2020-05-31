Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B561E94F0
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 03:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D8289F33;
	Sun, 31 May 2020 01:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A1389F33
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 01:57:28 +0000 (UTC)
IronPort-SDR: p7ysV/tiU6olv5gykvKzgT4WuHB7d68HnQCbq4+dJew0B+Zwl7XJwy5Ol32trQfj9I66HWSdOj
 VTSNKhRUPZlQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2020 18:57:26 -0700
IronPort-SDR: avLOjjqFe/RX8rMrRiV5lJygZJqW2xFtRY5z2lTtft7xOhZbLrTr7ZXPIqrnM/ybLDN0hfhplF
 picBDmJmK5Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,455,1583222400"; 
 d="gz'50?scan'50,208,50";a="311620883"
Received: from lkp-server01.sh.intel.com (HELO 9f9df8056aac) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 30 May 2020 18:57:24 -0700
Received: from kbuild by 9f9df8056aac with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jfDE3-0000rS-Q0; Sun, 31 May 2020 01:57:23 +0000
Date: Sun, 31 May 2020 09:56:50 +0800
From: kbuild test robot <lkp@intel.com>
To: Rohan Garg <rohan.garg@collabora.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6] drm/ioctl: Add a ioctl to set and get a label on GEM
 objects
Message-ID: <202005310935.akozdAWT%lkp@intel.com>
References: <20200528170604.22476-1-rohan.garg@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <20200528170604.22476-1-rohan.garg@collabora.com>
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
Cc: emil.l.velikov@gmail.com, kernel@collabora.com, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rohan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on drm-intel/for-linux-next tegra-drm/drm/tegra/for-next drm-tip/drm-tip linus/master v5.7-rc7 next-20200529]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Rohan-Garg/drm-ioctl-Add-a-ioctl-to-set-and-get-a-label-on-GEM-objects/20200531-000134
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
config: x86_64-randconfig-a013-20200531 (attached as .config)
compiler: gcc-5 (Ubuntu 5.5.0-12ubuntu1) 5.5.0 20171010
reproduce (this is a W=1 build):
        # save the attached .config to linux build tree
        make W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from drivers/gpu/drm/drm_auth.c:34:0:
>> include/drm/drm_drv.h:566:12: warning: 'struct drm_handle_label' declared inside parameter list
struct drm_handle_label *args);
^
>> include/drm/drm_drv.h:566:12: warning: its scope is only this definition or declaration, which is probably not what you want
include/drm/drm_drv.h:581:14: warning: 'struct drm_handle_label' declared inside parameter list
struct drm_handle_label *args);
^

vim +566 include/drm/drm_drv.h

   152	
   153	/**
   154	 * struct drm_driver - DRM driver structure
   155	 *
   156	 * This structure represent the common code for a family of cards. There will be
   157	 * one &struct drm_device for each card present in this family. It contains lots
   158	 * of vfunc entries, and a pile of those probably should be moved to more
   159	 * appropriate places like &drm_mode_config_funcs or into a new operations
   160	 * structure for GEM drivers.
   161	 */
   162	struct drm_driver {
   163		/**
   164		 * @load:
   165		 *
   166		 * Backward-compatible driver callback to complete
   167		 * initialization steps after the driver is registered.  For
   168		 * this reason, may suffer from race conditions and its use is
   169		 * deprecated for new drivers.  It is therefore only supported
   170		 * for existing drivers not yet converted to the new scheme.
   171		 * See drm_dev_init() and drm_dev_register() for proper and
   172		 * race-free way to set up a &struct drm_device.
   173		 *
   174		 * This is deprecated, do not use!
   175		 *
   176		 * Returns:
   177		 *
   178		 * Zero on success, non-zero value on failure.
   179		 */
   180		int (*load) (struct drm_device *, unsigned long flags);
   181	
   182		/**
   183		 * @open:
   184		 *
   185		 * Driver callback when a new &struct drm_file is opened. Useful for
   186		 * setting up driver-private data structures like buffer allocators,
   187		 * execution contexts or similar things. Such driver-private resources
   188		 * must be released again in @postclose.
   189		 *
   190		 * Since the display/modeset side of DRM can only be owned by exactly
   191		 * one &struct drm_file (see &drm_file.is_master and &drm_device.master)
   192		 * there should never be a need to set up any modeset related resources
   193		 * in this callback. Doing so would be a driver design bug.
   194		 *
   195		 * Returns:
   196		 *
   197		 * 0 on success, a negative error code on failure, which will be
   198		 * promoted to userspace as the result of the open() system call.
   199		 */
   200		int (*open) (struct drm_device *, struct drm_file *);
   201	
   202		/**
   203		 * @postclose:
   204		 *
   205		 * One of the driver callbacks when a new &struct drm_file is closed.
   206		 * Useful for tearing down driver-private data structures allocated in
   207		 * @open like buffer allocators, execution contexts or similar things.
   208		 *
   209		 * Since the display/modeset side of DRM can only be owned by exactly
   210		 * one &struct drm_file (see &drm_file.is_master and &drm_device.master)
   211		 * there should never be a need to tear down any modeset related
   212		 * resources in this callback. Doing so would be a driver design bug.
   213		 */
   214		void (*postclose) (struct drm_device *, struct drm_file *);
   215	
   216		/**
   217		 * @lastclose:
   218		 *
   219		 * Called when the last &struct drm_file has been closed and there's
   220		 * currently no userspace client for the &struct drm_device.
   221		 *
   222		 * Modern drivers should only use this to force-restore the fbdev
   223		 * framebuffer using drm_fb_helper_restore_fbdev_mode_unlocked().
   224		 * Anything else would indicate there's something seriously wrong.
   225		 * Modern drivers can also use this to execute delayed power switching
   226		 * state changes, e.g. in conjunction with the :ref:`vga_switcheroo`
   227		 * infrastructure.
   228		 *
   229		 * This is called after @postclose hook has been called.
   230		 *
   231		 * NOTE:
   232		 *
   233		 * All legacy drivers use this callback to de-initialize the hardware.
   234		 * This is purely because of the shadow-attach model, where the DRM
   235		 * kernel driver does not really own the hardware. Instead ownershipe is
   236		 * handled with the help of userspace through an inheritedly racy dance
   237		 * to set/unset the VT into raw mode.
   238		 *
   239		 * Legacy drivers initialize the hardware in the @firstopen callback,
   240		 * which isn't even called for modern drivers.
   241		 */
   242		void (*lastclose) (struct drm_device *);
   243	
   244		/**
   245		 * @unload:
   246		 *
   247		 * Reverse the effects of the driver load callback.  Ideally,
   248		 * the clean up performed by the driver should happen in the
   249		 * reverse order of the initialization.  Similarly to the load
   250		 * hook, this handler is deprecated and its usage should be
   251		 * dropped in favor of an open-coded teardown function at the
   252		 * driver layer.  See drm_dev_unregister() and drm_dev_put()
   253		 * for the proper way to remove a &struct drm_device.
   254		 *
   255		 * The unload() hook is called right after unregistering
   256		 * the device.
   257		 *
   258		 */
   259		void (*unload) (struct drm_device *);
   260	
   261		/**
   262		 * @release:
   263		 *
   264		 * Optional callback for destroying device data after the final
   265		 * reference is released, i.e. the device is being destroyed.
   266		 *
   267		 * This is deprecated, clean up all memory allocations associated with a
   268		 * &drm_device using drmm_add_action(), drmm_kmalloc() and related
   269		 * managed resources functions.
   270		 */
   271		void (*release) (struct drm_device *);
   272	
   273		/**
   274		 * @irq_handler:
   275		 *
   276		 * Interrupt handler called when using drm_irq_install(). Not used by
   277		 * drivers which implement their own interrupt handling.
   278		 */
   279		irqreturn_t(*irq_handler) (int irq, void *arg);
   280	
   281		/**
   282		 * @irq_preinstall:
   283		 *
   284		 * Optional callback used by drm_irq_install() which is called before
   285		 * the interrupt handler is registered. This should be used to clear out
   286		 * any pending interrupts (from e.g. firmware based drives) and reset
   287		 * the interrupt handling registers.
   288		 */
   289		void (*irq_preinstall) (struct drm_device *dev);
   290	
   291		/**
   292		 * @irq_postinstall:
   293		 *
   294		 * Optional callback used by drm_irq_install() which is called after
   295		 * the interrupt handler is registered. This should be used to enable
   296		 * interrupt generation in the hardware.
   297		 */
   298		int (*irq_postinstall) (struct drm_device *dev);
   299	
   300		/**
   301		 * @irq_uninstall:
   302		 *
   303		 * Optional callback used by drm_irq_uninstall() which is called before
   304		 * the interrupt handler is unregistered. This should be used to disable
   305		 * interrupt generation in the hardware.
   306		 */
   307		void (*irq_uninstall) (struct drm_device *dev);
   308	
   309		/**
   310		 * @master_set:
   311		 *
   312		 * Called whenever the minor master is set. Only used by vmwgfx.
   313		 */
   314		int (*master_set)(struct drm_device *dev, struct drm_file *file_priv,
   315				  bool from_open);
   316		/**
   317		 * @master_drop:
   318		 *
   319		 * Called whenever the minor master is dropped. Only used by vmwgfx.
   320		 */
   321		void (*master_drop)(struct drm_device *dev, struct drm_file *file_priv);
   322	
   323		/**
   324		 * @debugfs_init:
   325		 *
   326		 * Allows drivers to create driver-specific debugfs files.
   327		 */
   328		void (*debugfs_init)(struct drm_minor *minor);
   329	
   330		/**
   331		 * @gem_free_object: deconstructor for drm_gem_objects
   332		 *
   333		 * This is deprecated and should not be used by new drivers. Use
   334		 * &drm_gem_object_funcs.free instead.
   335		 */
   336		void (*gem_free_object) (struct drm_gem_object *obj);
   337	
   338		/**
   339		 * @gem_free_object_unlocked: deconstructor for drm_gem_objects
   340		 *
   341		 * This is deprecated and should not be used by new drivers. Use
   342		 * &drm_gem_object_funcs.free instead.
   343		 * Compared to @gem_free_object this is not encumbered with
   344		 * &drm_device.struct_mutex legacy locking schemes.
   345		 */
   346		void (*gem_free_object_unlocked) (struct drm_gem_object *obj);
   347	
   348		/**
   349		 * @gem_open_object:
   350		 *
   351		 * This callback is deprecated in favour of &drm_gem_object_funcs.open.
   352		 *
   353		 * Driver hook called upon gem handle creation
   354		 */
   355		int (*gem_open_object) (struct drm_gem_object *, struct drm_file *);
   356	
   357		/**
   358		 * @gem_close_object:
   359		 *
   360		 * This callback is deprecated in favour of &drm_gem_object_funcs.close.
   361		 *
   362		 * Driver hook called upon gem handle release
   363		 */
   364		void (*gem_close_object) (struct drm_gem_object *, struct drm_file *);
   365	
   366		/**
   367		 * @gem_print_info:
   368		 *
   369		 * This callback is deprecated in favour of
   370		 * &drm_gem_object_funcs.print_info.
   371		 *
   372		 * If driver subclasses struct &drm_gem_object, it can implement this
   373		 * optional hook for printing additional driver specific info.
   374		 *
   375		 * drm_printf_indent() should be used in the callback passing it the
   376		 * indent argument.
   377		 *
   378		 * This callback is called from drm_gem_print_info().
   379		 */
   380		void (*gem_print_info)(struct drm_printer *p, unsigned int indent,
   381				       const struct drm_gem_object *obj);
   382	
   383		/**
   384		 * @gem_create_object: constructor for gem objects
   385		 *
   386		 * Hook for allocating the GEM object struct, for use by the CMA and
   387		 * SHMEM GEM helpers.
   388		 */
   389		struct drm_gem_object *(*gem_create_object)(struct drm_device *dev,
   390							    size_t size);
   391		/**
   392		 * @prime_handle_to_fd:
   393		 *
   394		 * Main PRIME export function. Should be implemented with
   395		 * drm_gem_prime_handle_to_fd() for GEM based drivers.
   396		 *
   397		 * For an in-depth discussion see :ref:`PRIME buffer sharing
   398		 * documentation <prime_buffer_sharing>`.
   399		 */
   400		int (*prime_handle_to_fd)(struct drm_device *dev, struct drm_file *file_priv,
   401					uint32_t handle, uint32_t flags, int *prime_fd);
   402		/**
   403		 * @prime_fd_to_handle:
   404		 *
   405		 * Main PRIME import function. Should be implemented with
   406		 * drm_gem_prime_fd_to_handle() for GEM based drivers.
   407		 *
   408		 * For an in-depth discussion see :ref:`PRIME buffer sharing
   409		 * documentation <prime_buffer_sharing>`.
   410		 */
   411		int (*prime_fd_to_handle)(struct drm_device *dev, struct drm_file *file_priv,
   412					int prime_fd, uint32_t *handle);
   413		/**
   414		 * @gem_prime_export:
   415		 *
   416		 * Export hook for GEM drivers. Deprecated in favour of
   417		 * &drm_gem_object_funcs.export.
   418		 */
   419		struct dma_buf * (*gem_prime_export)(struct drm_gem_object *obj,
   420						     int flags);
   421		/**
   422		 * @gem_prime_import:
   423		 *
   424		 * Import hook for GEM drivers.
   425		 *
   426		 * This defaults to drm_gem_prime_import() if not set.
   427		 */
   428		struct drm_gem_object * (*gem_prime_import)(struct drm_device *dev,
   429					struct dma_buf *dma_buf);
   430	
   431		/**
   432		 * @gem_prime_pin:
   433		 *
   434		 * Deprecated hook in favour of &drm_gem_object_funcs.pin.
   435		 */
   436		int (*gem_prime_pin)(struct drm_gem_object *obj);
   437	
   438		/**
   439		 * @gem_prime_unpin:
   440		 *
   441		 * Deprecated hook in favour of &drm_gem_object_funcs.unpin.
   442		 */
   443		void (*gem_prime_unpin)(struct drm_gem_object *obj);
   444	
   445	
   446		/**
   447		 * @gem_prime_get_sg_table:
   448		 *
   449		 * Deprecated hook in favour of &drm_gem_object_funcs.get_sg_table.
   450		 */
   451		struct sg_table *(*gem_prime_get_sg_table)(struct drm_gem_object *obj);
   452	
   453		/**
   454		 * @gem_prime_import_sg_table:
   455		 *
   456		 * Optional hook used by the PRIME helper functions
   457		 * drm_gem_prime_import() respectively drm_gem_prime_import_dev().
   458		 */
   459		struct drm_gem_object *(*gem_prime_import_sg_table)(
   460					struct drm_device *dev,
   461					struct dma_buf_attachment *attach,
   462					struct sg_table *sgt);
   463		/**
   464		 * @gem_prime_vmap:
   465		 *
   466		 * Deprecated vmap hook for GEM drivers. Please use
   467		 * &drm_gem_object_funcs.vmap instead.
   468		 */
   469		void *(*gem_prime_vmap)(struct drm_gem_object *obj);
   470	
   471		/**
   472		 * @gem_prime_vunmap:
   473		 *
   474		 * Deprecated vunmap hook for GEM drivers. Please use
   475		 * &drm_gem_object_funcs.vunmap instead.
   476		 */
   477		void (*gem_prime_vunmap)(struct drm_gem_object *obj, void *vaddr);
   478	
   479		/**
   480		 * @gem_prime_mmap:
   481		 *
   482		 * mmap hook for GEM drivers, used to implement dma-buf mmap in the
   483		 * PRIME helpers.
   484		 *
   485		 * FIXME: There's way too much duplication going on here, and also moved
   486		 * to &drm_gem_object_funcs.
   487		 */
   488		int (*gem_prime_mmap)(struct drm_gem_object *obj,
   489					struct vm_area_struct *vma);
   490	
   491		/**
   492		 * @dumb_create:
   493		 *
   494		 * This creates a new dumb buffer in the driver's backing storage manager (GEM,
   495		 * TTM or something else entirely) and returns the resulting buffer handle. This
   496		 * handle can then be wrapped up into a framebuffer modeset object.
   497		 *
   498		 * Note that userspace is not allowed to use such objects for render
   499		 * acceleration - drivers must create their own private ioctls for such a use
   500		 * case.
   501		 *
   502		 * Width, height and depth are specified in the &drm_mode_create_dumb
   503		 * argument. The callback needs to fill the handle, pitch and size for
   504		 * the created buffer.
   505		 *
   506		 * Called by the user via ioctl.
   507		 *
   508		 * Returns:
   509		 *
   510		 * Zero on success, negative errno on failure.
   511		 */
   512		int (*dumb_create)(struct drm_file *file_priv,
   513				   struct drm_device *dev,
   514				   struct drm_mode_create_dumb *args);
   515		/**
   516		 * @dumb_map_offset:
   517		 *
   518		 * Allocate an offset in the drm device node's address space to be able to
   519		 * memory map a dumb buffer.
   520		 *
   521		 * The default implementation is drm_gem_create_mmap_offset(). GEM based
   522		 * drivers must not overwrite this.
   523		 *
   524		 * Called by the user via ioctl.
   525		 *
   526		 * Returns:
   527		 *
   528		 * Zero on success, negative errno on failure.
   529		 */
   530		int (*dumb_map_offset)(struct drm_file *file_priv,
   531				       struct drm_device *dev, uint32_t handle,
   532				       uint64_t *offset);
   533		/**
   534		 * @dumb_destroy:
   535		 *
   536		 * This destroys the userspace handle for the given dumb backing storage buffer.
   537		 * Since buffer objects must be reference counted in the kernel a buffer object
   538		 * won't be immediately freed if a framebuffer modeset object still uses it.
   539		 *
   540		 * Called by the user via ioctl.
   541		 *
   542		 * The default implementation is drm_gem_dumb_destroy(). GEM based drivers
   543		 * must not overwrite this.
   544		 *
   545		 * Returns:
   546		 *
   547		 * Zero on success, negative errno on failure.
   548		 */
   549		int (*dumb_destroy)(struct drm_file *file_priv,
   550				    struct drm_device *dev,
   551				    uint32_t handle);
   552	
   553		/**
   554		 * @set_label:
   555		 *
   556		 * Label a buffer object
   557		 *
   558		 * Called by the user via ioctl.
   559		 *
   560		 * Returns:
   561		 *
   562		 * Length of label on success, negative errno on failure.
   563		 */
   564		int (*set_label)(struct drm_device *dev,
   565				 struct drm_file *file_priv,
 > 566				 struct drm_handle_label *args);
   567	
   568		/**
   569		 * @get_label:
   570		 *
   571		 * Read the label of a buffer object.
   572		 *
   573		 * Called by the user via ioctl.
   574		 *
   575		 * Returns:
   576		 *
   577		 * Length of label on success, negative errno on failiure.
   578		 */
   579		char *(*get_label)(struct drm_device *dev,
   580				   struct drm_file *file_priv,
   581				   struct drm_handle_label *args);
   582	
   583		/**
   584		 * @gem_vm_ops: Driver private ops for this object
   585		 *
   586		 * For GEM drivers this is deprecated in favour of
   587		 * &drm_gem_object_funcs.vm_ops.
   588		 */
   589		const struct vm_operations_struct *gem_vm_ops;
   590	
   591		/** @major: driver major number */
   592		int major;
   593		/** @minor: driver minor number */
   594		int minor;
   595		/** @patchlevel: driver patch level */
   596		int patchlevel;
   597		/** @name: driver name */
   598		char *name;
   599		/** @desc: driver description */
   600		char *desc;
   601		/** @date: driver date */
   602		char *date;
   603	
   604		/**
   605		 * @driver_features:
   606		 * Driver features, see &enum drm_driver_feature. Drivers can disable
   607		 * some features on a per-instance basis using
   608		 * &drm_device.driver_features.
   609		 */
   610		u32 driver_features;
   611	
   612		/**
   613		 * @ioctls:
   614		 *
   615		 * Array of driver-private IOCTL description entries. See the chapter on
   616		 * :ref:`IOCTL support in the userland interfaces
   617		 * chapter<drm_driver_ioctl>` for the full details.
   618		 */
   619	
   620		const struct drm_ioctl_desc *ioctls;
   621		/** @num_ioctls: Number of entries in @ioctls. */
   622		int num_ioctls;
   623	
   624		/**
   625		 * @fops:
   626		 *
   627		 * File operations for the DRM device node. See the discussion in
   628		 * :ref:`file operations<drm_driver_fops>` for in-depth coverage and
   629		 * some examples.
   630		 */
   631		const struct file_operations *fops;
   632	
   633		/* Everything below here is for legacy driver, never use! */
   634		/* private: */
   635	
   636		/* List of devices hanging off this driver with stealth attach. */
   637		struct list_head legacy_dev_list;
   638		int (*firstopen) (struct drm_device *);
   639		void (*preclose) (struct drm_device *, struct drm_file *file_priv);
   640		int (*dma_ioctl) (struct drm_device *dev, void *data, struct drm_file *file_priv);
   641		int (*dma_quiescent) (struct drm_device *);
   642		int (*context_dtor) (struct drm_device *dev, int context);
   643		u32 (*get_vblank_counter)(struct drm_device *dev, unsigned int pipe);
   644		int (*enable_vblank)(struct drm_device *dev, unsigned int pipe);
   645		void (*disable_vblank)(struct drm_device *dev, unsigned int pipe);
   646		int dev_priv_size;
   647	};
   648	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--LZvS9be/3tNcYl/X
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
BnJSHijHlv8B1g9dfwHQAQA=

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--LZvS9be/3tNcYl/X--
