Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6251FFF4F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 02:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483866EBF7;
	Fri, 19 Jun 2020 00:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD136EBF7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 00:35:05 +0000 (UTC)
IronPort-SDR: v2QdxLg7+FMbq+HjAlk4HlcvTeoshhqRPSRLOmaQTOv2YoOAZBB9Rm4muqqmkjeePWy2x+DsAK
 JMAOHC7lUOKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="131183272"
X-IronPort-AV: E=Sophos;i="5.75,253,1589266800"; 
 d="gz'50?scan'50,208,50";a="131183272"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 17:35:04 -0700
IronPort-SDR: AgnT+gip0myjcdI8Ms17wq1hbKEwdsAM0aSptfysZ0pJTuvWIDB0rlwGD0D+OcLz+JUo5vAN6h
 W3O7w2qpweYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,253,1589266800"; 
 d="gz'50?scan'50,208,50";a="299884034"
Received: from lkp-server02.sh.intel.com (HELO 5ce11009e457) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 18 Jun 2020 17:35:00 -0700
Received: from kbuild by 5ce11009e457 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jm4zj-0000Tv-NC; Fri, 19 Jun 2020 00:34:59 +0000
Date: Fri, 19 Jun 2020 08:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 35/36] videobuf2: use sgtable-based scatterlist wrappers
Message-ID: <202006190824.T4QZEyel%lkp@intel.com>
References: <20200618153956.29558-36-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200618153956.29558-36-m.szyprowski@samsung.com>
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
Cc: kbuild-all@lists.01.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Marek,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20200618]
[also build test ERROR on v5.8-rc1]
[cannot apply to linuxtv-media/master staging/staging-testing drm-exynos/exynos-drm-next drm-intel/for-linux-next linus/master v5.8-rc1 v5.7 v5.7-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marek-Szyprowski/DRM-fix-struct-sg_table-nents-vs-orig_nents-misuse/20200619-000417
base:    ce2cc8efd7a40cbd17841add878cb691d0ce0bba
config: alpha-allyesconfig (attached as .config)
compiler: alpha-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=alpha 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/media/common/videobuf2/videobuf2-dma-sg.c: In function 'vb2_dma_sg_alloc':
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:173:13: error: invalid storage class for function 'vb2_dma_sg_put'
     173 | static void vb2_dma_sg_put(void *buf_priv)
         |             ^~~~~~~~~~~~~~
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:173:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     173 | static void vb2_dma_sg_put(void *buf_priv)
         | ^~~~~~
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:195:13: error: invalid storage class for function 'vb2_dma_sg_prepare'
     195 | static void vb2_dma_sg_prepare(void *buf_priv)
         |             ^~~~~~~~~~~~~~~~~~
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:207:13: error: invalid storage class for function 'vb2_dma_sg_finish'
     207 | static void vb2_dma_sg_finish(void *buf_priv)
         |             ^~~~~~~~~~~~~~~~~
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:219:14: error: invalid storage class for function 'vb2_dma_sg_get_userptr'
     219 | static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
         |              ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c: In function 'vb2_dma_sg_get_userptr':
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:278:13: error: invalid storage class for function 'vb2_dma_sg_put_userptr'
     278 | static void vb2_dma_sg_put_userptr(void *buf_priv)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:278:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     278 | static void vb2_dma_sg_put_userptr(void *buf_priv)
         | ^~~~~~
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:298:14: error: invalid storage class for function 'vb2_dma_sg_vaddr'
     298 | static void *vb2_dma_sg_vaddr(void *buf_priv)
         |              ^~~~~~~~~~~~~~~~
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:315:21: error: invalid storage class for function 'vb2_dma_sg_num_users'
     315 | static unsigned int vb2_dma_sg_num_users(void *buf_priv)
         |                     ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:322:12: error: invalid storage class for function 'vb2_dma_sg_mmap'
     322 | static int vb2_dma_sg_mmap(void *buf_priv, struct vm_area_struct *vma)
         |            ^~~~~~~~~~~~~~~
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:358:12: error: invalid storage class for function 'vb2_dma_sg_dmabuf_ops_attach'
     358 | static int vb2_dma_sg_dmabuf_ops_attach(struct dma_buf *dbuf,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:396:13: error: invalid storage class for function 'vb2_dma_sg_dmabuf_ops_detach'
     396 | static void vb2_dma_sg_dmabuf_ops_detach(struct dma_buf *dbuf,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c: In function 'vb2_dma_sg_dmabuf_ops_detach':
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:409:3: error: too few arguments to function 'dma_unmap_sgtable'
     409 |   dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir);
         |   ^~~~~~~~~~~~~~~~~
   In file included from include/linux/dma-buf.h:20,
                    from include/media/videobuf2-core.h:18,
                    from include/media/videobuf2-v4l2.h:16,
                    from drivers/media/common/videobuf2/videobuf2-dma-sg.c:21:
   include/linux/dma-mapping.h:651:20: note: declared here
     651 | static inline void dma_unmap_sgtable(struct device *dev, struct sg_table *sgt,
         |                    ^~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c: In function 'vb2_dma_sg_get_userptr':
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:415:25: error: invalid storage class for function 'vb2_dma_sg_dmabuf_ops_map'
     415 | static struct sg_table *vb2_dma_sg_dmabuf_ops_map(
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c: In function 'vb2_dma_sg_dmabuf_ops_map':
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:434:3: error: too few arguments to function 'dma_unmap_sgtable'
     434 |   dma_unmap_sgtable(db_attach->dev, sgt, attach->dma_dir);
         |   ^~~~~~~~~~~~~~~~~
   In file included from include/linux/dma-buf.h:20,
                    from include/media/videobuf2-core.h:18,
                    from include/media/videobuf2-v4l2.h:16,
                    from drivers/media/common/videobuf2/videobuf2-dma-sg.c:21:
   include/linux/dma-mapping.h:651:20: note: declared here
     651 | static inline void dma_unmap_sgtable(struct device *dev, struct sg_table *sgt,
         |                    ^~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c: In function 'vb2_dma_sg_get_userptr':
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:452:13: error: invalid storage class for function 'vb2_dma_sg_dmabuf_ops_unmap'
     452 | static void vb2_dma_sg_dmabuf_ops_unmap(struct dma_buf_attachment *db_attach,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:458:13: error: invalid storage class for function 'vb2_dma_sg_dmabuf_ops_release'
     458 | static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:464:14: error: invalid storage class for function 'vb2_dma_sg_dmabuf_ops_vmap'
     464 | static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:471:12: error: invalid storage class for function 'vb2_dma_sg_dmabuf_ops_mmap'
     471 | static int vb2_dma_sg_dmabuf_ops_mmap(struct dma_buf *dbuf,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:478:12: error: initializer element is not constant
     478 |  .attach = vb2_dma_sg_dmabuf_ops_attach,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:478:12: note: (near initialization for 'vb2_dma_sg_dmabuf_ops.attach')
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:479:12: error: initializer element is not constant
     479 |  .detach = vb2_dma_sg_dmabuf_ops_detach,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:479:12: note: (near initialization for 'vb2_dma_sg_dmabuf_ops.detach')
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:480:17: error: initializer element is not constant
     480 |  .map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:480:17: note: (near initialization for 'vb2_dma_sg_dmabuf_ops.map_dma_buf')
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:481:19: error: initializer element is not constant
     481 |  .unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:481:19: note: (near initialization for 'vb2_dma_sg_dmabuf_ops.unmap_dma_buf')
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:482:10: error: initializer element is not constant
     482 |  .vmap = vb2_dma_sg_dmabuf_ops_vmap,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:482:10: note: (near initialization for 'vb2_dma_sg_dmabuf_ops.vmap')
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:483:10: error: initializer element is not constant
     483 |  .mmap = vb2_dma_sg_dmabuf_ops_mmap,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:483:10: note: (near initialization for 'vb2_dma_sg_dmabuf_ops.mmap')
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:484:13: error: initializer element is not constant
     484 |  .release = vb2_dma_sg_dmabuf_ops_release,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:484:13: note: (near initialization for 'vb2_dma_sg_dmabuf_ops.release')
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:487:24: error: invalid storage class for function 'vb2_dma_sg_get_dmabuf'
     487 | static struct dma_buf *vb2_dma_sg_get_dmabuf(void *buf_priv, unsigned long flags)
         |                        ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/common/videobuf2/videobuf2-dma-sg.c:515:12: error: invalid storage class for function 'vb2_dma_sg_map_dmabuf'
     515 | static int vb2_dma_sg_map_dmabuf(void *mem_priv)
         |            ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:543:13: error: invalid storage class for function 'vb2_dma_sg_unmap_dmabuf'
     543 | static void vb2_dma_sg_unmap_dmabuf(void *mem_priv)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:567:13: error: invalid storage class for function 'vb2_dma_sg_detach_dmabuf'
     567 | static void vb2_dma_sg_detach_dmabuf(void *mem_priv)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:580:14: error: invalid storage class for function 'vb2_dma_sg_attach_dmabuf'
     580 | static void *vb2_dma_sg_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:612:14: error: invalid storage class for function 'vb2_dma_sg_cookie'
     612 | static void *vb2_dma_sg_cookie(void *buf_priv)
         |              ^~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/media/common/videobuf2/videobuf2-dma-sg.c:13:
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:636:19: error: extern declaration of 'vb2_dma_sg_memops' follows declaration with no linkage
     636 | EXPORT_SYMBOL_GPL(vb2_dma_sg_memops);
         |                   ^~~~~~~~~~~~~~~~~
   include/linux/export.h:98:21: note: in definition of macro '___EXPORT_SYMBOL'
      98 |  extern typeof(sym) sym;       \
         |                     ^~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:159:33: note: in expansion of macro '_EXPORT_SYMBOL'
     159 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "_gpl")
         |                                 ^~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:636:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     636 | EXPORT_SYMBOL_GPL(vb2_dma_sg_memops);
         | ^~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:619:26: note: previous definition of 'vb2_dma_sg_memops' was here
     619 | const struct vb2_mem_ops vb2_dma_sg_memops = {
         |                          ^~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/media/common/videobuf2/videobuf2-dma-sg.c:13:
   include/linux/export.h:67:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
      67 |  static const struct kernel_symbol __ksymtab_##sym  \
         |  ^~~~~~
   include/linux/export.h:108:2: note: in expansion of macro '__KSYMTAB_ENTRY'
     108 |  __KSYMTAB_ENTRY(sym, sec)
         |  ^~~~~~~~~~~~~~~
   include/linux/export.h:147:39: note: in expansion of macro '___EXPORT_SYMBOL'
     147 | #define __EXPORT_SYMBOL(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
         |                                       ^~~~~~~~~~~~~~~~
   include/linux/export.h:155:34: note: in expansion of macro '__EXPORT_SYMBOL'
     155 | #define _EXPORT_SYMBOL(sym, sec) __EXPORT_SYMBOL(sym, sec, "")
         |                                  ^~~~~~~~~~~~~~~
   include/linux/export.h:159:33: note: in expansion of macro '_EXPORT_SYMBOL'
     159 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "_gpl")
         |                                 ^~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:636:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     636 | EXPORT_SYMBOL_GPL(vb2_dma_sg_memops);
         | ^~~~~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:640:1: error: expected declaration or statement at end of input
     640 | MODULE_LICENSE("GPL");
         | ^~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c: In function 'vb2_dma_sg_alloc':
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:640:1: error: expected declaration or statement at end of input
   drivers/media/common/videobuf2/videobuf2-dma-sg.c: At top level:
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:56:13: warning: 'vb2_dma_sg_put' used but never defined
      56 | static void vb2_dma_sg_put(void *buf_priv);
         |             ^~~~~~~~~~~~~~
   drivers/media/common/videobuf2/videobuf2-dma-sg.c:219:14: warning: 'vb2_dma_sg_get_userptr' defined but not used [-Wunused-function]
     219 | static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
         |              ^~~~~~~~~~~~~~~~~~~~~~

vim +/vb2_dma_sg_put +173 drivers/media/common/videobuf2/videobuf2-dma-sg.c

5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29   55  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  @56  static void vb2_dma_sg_put(void *buf_priv);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29   57  
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   58  static int vb2_dma_sg_alloc_compacted(struct vb2_dma_sg_buf *buf,
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   59  		gfp_t gfp_flags)
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   60  {
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   61  	unsigned int last_page = 0;
14f28f5cea9e399 drivers/media/common/videobuf2/videobuf2-dma-sg.c Sakari Ailus          2018-12-12   62  	unsigned long size = buf->size;
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   63  
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   64  	while (size > 0) {
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   65  		struct page *pages;
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   66  		int order;
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   67  		int i;
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   68  
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   69  		order = get_order(size);
4b129dc907e9b95 drivers/media/common/videobuf2/videobuf2-dma-sg.c Mauro Carvalho Chehab 2019-02-18   70  		/* Don't over allocate*/
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   71  		if ((PAGE_SIZE << order) > size)
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   72  			order--;
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   73  
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   74  		pages = NULL;
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   75  		while (!pages) {
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   76  			pages = alloc_pages(GFP_KERNEL | __GFP_ZERO |
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   77  					__GFP_NOWARN | gfp_flags, order);
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   78  			if (pages)
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   79  				break;
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   80  
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   81  			if (order == 0) {
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   82  				while (last_page--)
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   83  					__free_page(buf->pages[last_page]);
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   84  				return -ENOMEM;
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   85  			}
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   86  			order--;
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   87  		}
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   88  
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   89  		split_page(pages, order);
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   90  		for (i = 0; i < (1 << order); i++)
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   91  			buf->pages[last_page++] = &pages[i];
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   92  
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   93  		size -= PAGE_SIZE << order;
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   94  	}
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   95  
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   96  	return 0;
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   97  }
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02   98  
00085f1efa387a8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Krzysztof Kozlowski   2016-08-03   99  static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
d16e832da23edff drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-04-15  100  			      unsigned long size, enum dma_data_direction dma_dir,
d16e832da23edff drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-04-15  101  			      gfp_t gfp_flags)
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  102  {
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  103  	struct vb2_dma_sg_buf *buf;
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  104  	struct sg_table *sgt;
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  105  	int ret;
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  106  	int num_pages;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  107  
0ff657b0f6120cb drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-07-21  108  	if (WARN_ON(!dev))
0ff657b0f6120cb drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-07-21  109  		return ERR_PTR(-EINVAL);
0ff657b0f6120cb drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-07-21  110  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  111  	buf = kzalloc(sizeof *buf, GFP_KERNEL);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  112  	if (!buf)
0ff657b0f6120cb drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-07-21  113  		return ERR_PTR(-ENOMEM);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  114  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  115  	buf->vaddr = NULL;
d935c57e8fb6902 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  116  	buf->dma_dir = dma_dir;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  117  	buf->offset = 0;
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  118  	buf->size = size;
7f8414594e47552 drivers/media/v4l2-core/videobuf2-dma-sg.c        Mauro Carvalho Chehab 2013-04-19  119  	/* size is already page aligned */
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  120  	buf->num_pages = size >> PAGE_SHIFT;
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  121  	buf->dma_sgt = &buf->sg_table;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  122  
758d90e161382c1 drivers/media/v4l2-core/videobuf2-dma-sg.c        Tomasz Figa           2017-06-19  123  	buf->pages = kvmalloc_array(buf->num_pages, sizeof(struct page *),
758d90e161382c1 drivers/media/v4l2-core/videobuf2-dma-sg.c        Tomasz Figa           2017-06-19  124  				    GFP_KERNEL | __GFP_ZERO);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  125  	if (!buf->pages)
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  126  		goto fail_pages_array_alloc;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  127  
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  128  	ret = vb2_dma_sg_alloc_compacted(buf, gfp_flags);
df23728118cd0f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  129  	if (ret)
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  130  		goto fail_pages_alloc;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  131  
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  132  	ret = sg_alloc_table_from_pages(buf->dma_sgt, buf->pages,
47bc59c52b005f5 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-08-01  133  			buf->num_pages, 0, size, GFP_KERNEL);
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  134  	if (ret)
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  135  		goto fail_table_alloc;
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  136  
0c3a14c177aa85a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  137  	/* Prevent the device from being released while the buffer is used */
36c0f8b32c4bd4f drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-04-15  138  	buf->dev = get_device(dev);
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  139  
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  140  	sgt = &buf->sg_table;
251a79f8f5adfd8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  141  	/*
251a79f8f5adfd8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  142  	 * No need to sync to the device, this will happen later when the
251a79f8f5adfd8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  143  	 * prepare() memop is called.
251a79f8f5adfd8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  144  	 */
b8bd9d592f68e3c drivers/media/common/videobuf2/videobuf2-dma-sg.c Marek Szyprowski      2020-06-18  145  	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
b8bd9d592f68e3c drivers/media/common/videobuf2/videobuf2-dma-sg.c Marek Szyprowski      2020-06-18  146  			    DMA_ATTR_SKIP_CPU_SYNC)) {
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  147  		goto fail_map;
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  148  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  149  	buf->handler.refcount = &buf->refcount;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  150  	buf->handler.put = vb2_dma_sg_put;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  151  	buf->handler.arg = buf;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  152  
6c4bb65d0be8f34 drivers/media/v4l2-core/videobuf2-dma-sg.c        Elena Reshetova       2017-03-06  153  	refcount_set(&buf->refcount, 1);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  154  
ffdc78efe1a8a01 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2013-03-02  155  	dprintk(1, "%s: Allocated buffer of %d pages\n",
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  156  		__func__, buf->num_pages);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  157  	return buf;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  158  
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  159  fail_map:
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  160  	put_device(buf->dev);
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  161  	sg_free_table(buf->dma_sgt);
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  162  fail_table_alloc:
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  163  	num_pages = buf->num_pages;
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  164  	while (num_pages--)
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  165  		__free_page(buf->pages[num_pages]);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  166  fail_pages_alloc:
758d90e161382c1 drivers/media/v4l2-core/videobuf2-dma-sg.c        Tomasz Figa           2017-06-19  167  	kvfree(buf->pages);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  168  fail_pages_array_alloc:
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  169  	kfree(buf);
0ff657b0f6120cb drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-07-21  170  	return ERR_PTR(-ENOMEM);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  171  }
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  172  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29 @173  static void vb2_dma_sg_put(void *buf_priv)
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  174  {
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  175  	struct vb2_dma_sg_buf *buf = buf_priv;
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  176  	struct sg_table *sgt = &buf->sg_table;
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  177  	int i = buf->num_pages;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  178  
6c4bb65d0be8f34 drivers/media/v4l2-core/videobuf2-dma-sg.c        Elena Reshetova       2017-03-06  179  	if (refcount_dec_and_test(&buf->refcount)) {
ffdc78efe1a8a01 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2013-03-02  180  		dprintk(1, "%s: Freeing buffer of %d pages\n", __func__,
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  181  			buf->num_pages);
b8bd9d592f68e3c drivers/media/common/videobuf2/videobuf2-dma-sg.c Marek Szyprowski      2020-06-18  182  		dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir,
b8bd9d592f68e3c drivers/media/common/videobuf2/videobuf2-dma-sg.c Marek Szyprowski      2020-06-18  183  				  DMA_ATTR_SKIP_CPU_SYNC);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  184  		if (buf->vaddr)
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  185  			vm_unmap_ram(buf->vaddr, buf->num_pages);
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  186  		sg_free_table(buf->dma_sgt);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  187  		while (--i >= 0)
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  188  			__free_page(buf->pages[i]);
758d90e161382c1 drivers/media/v4l2-core/videobuf2-dma-sg.c        Tomasz Figa           2017-06-19  189  		kvfree(buf->pages);
0c3a14c177aa85a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  190  		put_device(buf->dev);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  191  		kfree(buf);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  192  	}
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  193  }
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  194  
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24 @195  static void vb2_dma_sg_prepare(void *buf_priv)
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  196  {
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  197  	struct vb2_dma_sg_buf *buf = buf_priv;
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  198  	struct sg_table *sgt = buf->dma_sgt;
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  199  
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  200  	/* DMABUF exporter will flush the cache for us */
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  201  	if (buf->db_attach)
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  202  		return;
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  203  
b8bd9d592f68e3c drivers/media/common/videobuf2/videobuf2-dma-sg.c Marek Szyprowski      2020-06-18  204  	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  205  }
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  206  
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24 @207  static void vb2_dma_sg_finish(void *buf_priv)
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  208  {
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  209  	struct vb2_dma_sg_buf *buf = buf_priv;
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  210  	struct sg_table *sgt = buf->dma_sgt;
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  211  
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  212  	/* DMABUF exporter will flush the cache for us */
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  213  	if (buf->db_attach)
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  214  		return;
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  215  
b8bd9d592f68e3c drivers/media/common/videobuf2/videobuf2-dma-sg.c Marek Szyprowski      2020-06-18  216  	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  217  }
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  218  
36c0f8b32c4bd4f drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-04-15 @219  static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
cd474037c4a9a9c drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  220  				    unsigned long size,
cd474037c4a9a9c drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  221  				    enum dma_data_direction dma_dir)
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  222  {
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  223  	struct vb2_dma_sg_buf *buf;
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  224  	struct sg_table *sgt;
3336c24f25ec932 drivers/media/v4l2-core/videobuf2-dma-sg.c        Jan Kara              2015-07-13  225  	struct frame_vector *vec;
251a79f8f5adfd8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  226  
10791829eb52d57 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-07-21  227  	if (WARN_ON(!dev))
10791829eb52d57 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-07-21  228  		return ERR_PTR(-EINVAL);
10791829eb52d57 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-07-21  229  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  230  	buf = kzalloc(sizeof *buf, GFP_KERNEL);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  231  	if (!buf)
0ff657b0f6120cb drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-07-21  232  		return ERR_PTR(-ENOMEM);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  233  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  234  	buf->vaddr = NULL;
36c0f8b32c4bd4f drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-04-15  235  	buf->dev = dev;
cd474037c4a9a9c drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  236  	buf->dma_dir = dma_dir;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  237  	buf->offset = vaddr & ~PAGE_MASK;
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  238  	buf->size = size;
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  239  	buf->dma_sgt = &buf->sg_table;
707947247e9517b drivers/media/common/videobuf2/videobuf2-dma-sg.c Hans Verkuil          2019-04-04  240  	vec = vb2_create_framevec(vaddr, size);
3336c24f25ec932 drivers/media/v4l2-core/videobuf2-dma-sg.c        Jan Kara              2015-07-13  241  	if (IS_ERR(vec))
3336c24f25ec932 drivers/media/v4l2-core/videobuf2-dma-sg.c        Jan Kara              2015-07-13  242  		goto userptr_fail_pfnvec;
3336c24f25ec932 drivers/media/v4l2-core/videobuf2-dma-sg.c        Jan Kara              2015-07-13  243  	buf->vec = vec;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  244  
3336c24f25ec932 drivers/media/v4l2-core/videobuf2-dma-sg.c        Jan Kara              2015-07-13  245  	buf->pages = frame_vector_pages(vec);
3336c24f25ec932 drivers/media/v4l2-core/videobuf2-dma-sg.c        Jan Kara              2015-07-13  246  	if (IS_ERR(buf->pages))
3336c24f25ec932 drivers/media/v4l2-core/videobuf2-dma-sg.c        Jan Kara              2015-07-13  247  		goto userptr_fail_sgtable;
3336c24f25ec932 drivers/media/v4l2-core/videobuf2-dma-sg.c        Jan Kara              2015-07-13  248  	buf->num_pages = frame_vector_count(vec);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  249  
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  250  	if (sg_alloc_table_from_pages(buf->dma_sgt, buf->pages,
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  251  			buf->num_pages, buf->offset, size, 0))
3336c24f25ec932 drivers/media/v4l2-core/videobuf2-dma-sg.c        Jan Kara              2015-07-13  252  		goto userptr_fail_sgtable;
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  253  
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  254  	sgt = &buf->sg_table;
251a79f8f5adfd8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  255  	/*
251a79f8f5adfd8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  256  	 * No need to sync to the device, this will happen later when the
251a79f8f5adfd8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  257  	 * prepare() memop is called.
251a79f8f5adfd8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  258  	 */
b8bd9d592f68e3c drivers/media/common/videobuf2/videobuf2-dma-sg.c Marek Szyprowski      2020-06-18  259  	if (dma_map_sgtable(buf->dev, sgt, buf->dma_dir,
b8bd9d592f68e3c drivers/media/common/videobuf2/videobuf2-dma-sg.c Marek Szyprowski      2020-06-18  260  			    DMA_ATTR_SKIP_CPU_SYNC)) {
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  261  		goto userptr_fail_map;
6a5d77cbf26078e drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2015-04-29  262  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  263  	return buf;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  264  
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  265  userptr_fail_map:
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  266  	sg_free_table(&buf->sg_table);
3336c24f25ec932 drivers/media/v4l2-core/videobuf2-dma-sg.c        Jan Kara              2015-07-13  267  userptr_fail_sgtable:
3336c24f25ec932 drivers/media/v4l2-core/videobuf2-dma-sg.c        Jan Kara              2015-07-13  268  	vb2_destroy_framevec(vec);
3336c24f25ec932 drivers/media/v4l2-core/videobuf2-dma-sg.c        Jan Kara              2015-07-13  269  userptr_fail_pfnvec:
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  270  	kfree(buf);
0ff657b0f6120cb drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2016-07-21  271  	return ERR_PTR(-ENOMEM);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  272  }
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  273  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  274  /*
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  275   * @put_userptr: inform the allocator that a USERPTR buffer will no longer
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  276   *		 be used
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  277   */
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29 @278  static void vb2_dma_sg_put_userptr(void *buf_priv)
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  279  {
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  280  	struct vb2_dma_sg_buf *buf = buf_priv;
d790b7eda953df4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-24  281  	struct sg_table *sgt = &buf->sg_table;
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  282  	int i = buf->num_pages;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  283  
ffdc78efe1a8a01 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2013-03-02  284  	dprintk(1, "%s: Releasing userspace buffer of %d pages\n",
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  285  	       __func__, buf->num_pages);
b8bd9d592f68e3c drivers/media/common/videobuf2/videobuf2-dma-sg.c Marek Szyprowski      2020-06-18  286  	dma_unmap_sgtable(buf->dev, sgt, buf->dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  287  	if (buf->vaddr)
223012475968fb8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Ricardo Ribalda       2013-08-02  288  		vm_unmap_ram(buf->vaddr, buf->num_pages);
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  289  	sg_free_table(buf->dma_sgt);
5b6f9abe5a49df8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Stanimir Varbanov     2017-08-21  290  	if (buf->dma_dir == DMA_FROM_DEVICE ||
5b6f9abe5a49df8 drivers/media/v4l2-core/videobuf2-dma-sg.c        Stanimir Varbanov     2017-08-21  291  	    buf->dma_dir == DMA_BIDIRECTIONAL)
c0cb76589c77b9a drivers/media/v4l2-core/videobuf2-dma-sg.c        Stanimir Varbanov     2017-08-29  292  		while (--i >= 0)
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  293  			set_page_dirty_lock(buf->pages[i]);
3336c24f25ec932 drivers/media/v4l2-core/videobuf2-dma-sg.c        Jan Kara              2015-07-13  294  	vb2_destroy_framevec(buf->vec);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  295  	kfree(buf);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  296  }
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  297  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29 @298  static void *vb2_dma_sg_vaddr(void *buf_priv)
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  299  {
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  300  	struct vb2_dma_sg_buf *buf = buf_priv;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  301  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  302  	BUG_ON(!buf);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  303  
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  304  	if (!buf->vaddr) {
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  305  		if (buf->db_attach)
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  306  			buf->vaddr = dma_buf_vmap(buf->db_attach->dmabuf);
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  307  		else
d4efd79a81abc70 drivers/media/common/videobuf2/videobuf2-dma-sg.c Christoph Hellwig     2020-06-01  308  			buf->vaddr = vm_map_ram(buf->pages, buf->num_pages, -1);
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  309  	}
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  310  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  311  	/* add offset in case userptr is not page-aligned */
e078b79d8aa70a4 drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  312  	return buf->vaddr ? buf->vaddr + buf->offset : NULL;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  313  }
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  314  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29 @315  static unsigned int vb2_dma_sg_num_users(void *buf_priv)
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  316  {
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  317  	struct vb2_dma_sg_buf *buf = buf_priv;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  318  
6c4bb65d0be8f34 drivers/media/v4l2-core/videobuf2-dma-sg.c        Elena Reshetova       2017-03-06  319  	return refcount_read(&buf->refcount);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  320  }
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  321  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29 @322  static int vb2_dma_sg_mmap(void *buf_priv, struct vm_area_struct *vma)
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  323  {
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  324  	struct vb2_dma_sg_buf *buf = buf_priv;
a17ae14766935aa drivers/media/common/videobuf2/videobuf2-dma-sg.c Souptick Joarder      2019-05-13  325  	int err;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  326  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  327  	if (!buf) {
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  328  		printk(KERN_ERR "No memory to map\n");
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  329  		return -EINVAL;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  330  	}
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  331  
a17ae14766935aa drivers/media/common/videobuf2/videobuf2-dma-sg.c Souptick Joarder      2019-05-13  332  	err = vm_map_pages(vma, buf->pages, buf->num_pages);
a17ae14766935aa drivers/media/common/videobuf2/videobuf2-dma-sg.c Souptick Joarder      2019-05-13  333  	if (err) {
a17ae14766935aa drivers/media/common/videobuf2/videobuf2-dma-sg.c Souptick Joarder      2019-05-13  334  		printk(KERN_ERR "Remapping memory, error: %d\n", err);
a17ae14766935aa drivers/media/common/videobuf2/videobuf2-dma-sg.c Souptick Joarder      2019-05-13  335  		return err;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  336  	}
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  337  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  338  	/*
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  339  	 * Use common vm_area operations to track buffer refcount.
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  340  	 */
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  341  	vma->vm_private_data	= &buf->handler;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  342  	vma->vm_ops		= &vb2_common_vm_ops;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  343  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  344  	vma->vm_ops->open(vma);
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  345  
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  346  	return 0;
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  347  }
5ba3f757f0592ca drivers/media/video/videobuf2-dma-sg.c            Andrzej Pietrasiewicz 2010-11-29  348  
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  349  /*********************************************/
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  350  /*         DMABUF ops for exporters          */
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  351  /*********************************************/
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  352  
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  353  struct vb2_dma_sg_attachment {
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  354  	struct sg_table sgt;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  355  	enum dma_data_direction dma_dir;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  356  };
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  357  
a19741e5e5a9f1f drivers/media/common/videobuf2/videobuf2-dma-sg.c Christian König       2018-05-28 @358  static int vb2_dma_sg_dmabuf_ops_attach(struct dma_buf *dbuf,
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  359  	struct dma_buf_attachment *dbuf_attach)
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  360  {
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  361  	struct vb2_dma_sg_attachment *attach;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  362  	unsigned int i;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  363  	struct scatterlist *rd, *wr;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  364  	struct sg_table *sgt;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  365  	struct vb2_dma_sg_buf *buf = dbuf->priv;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  366  	int ret;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  367  
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  368  	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  369  	if (!attach)
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  370  		return -ENOMEM;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  371  
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  372  	sgt = &attach->sgt;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  373  	/* Copy the buf->base_sgt scatter list to the attachment, as we can't
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  374  	 * map the same scatter list to multiple attachments at the same time.
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  375  	 */
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  376  	ret = sg_alloc_table(sgt, buf->dma_sgt->orig_nents, GFP_KERNEL);
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  377  	if (ret) {
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  378  		kfree(attach);
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  379  		return -ENOMEM;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  380  	}
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  381  
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  382  	rd = buf->dma_sgt->sgl;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  383  	wr = sgt->sgl;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  384  	for (i = 0; i < sgt->orig_nents; ++i) {
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  385  		sg_set_page(wr, sg_page(rd), rd->length, rd->offset);
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  386  		rd = sg_next(rd);
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  387  		wr = sg_next(wr);
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  388  	}
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  389  
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  390  	attach->dma_dir = DMA_NONE;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  391  	dbuf_attach->priv = attach;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  392  
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  393  	return 0;
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  394  }
041c7b6ac74ee7a drivers/media/v4l2-core/videobuf2-dma-sg.c        Hans Verkuil          2014-11-18  395  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--opJtzjQTFsWo+cga
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
OLc4rjfJk2VukBj7sIU4jc2BqyyJW0SBIGEmt7DwHbkx0ak2ird+zGR+JrcbboJYyBvRbnVn
pSZ5M02moVeSE1cry82uK7u/ySa3Yt4yo2MlGTGzkLtb0e5u5Wh3q353t+qXG/0ryY0Mjb2Z
JW50auztb2817O5mw+44abGyt+t4Z0m3O209x1KNwHHDeuEsTS44P7bkRnBbdsU1c5b2lpw9
n1vPns+tf4MLtnYustfZNmKmEMUNTC7xEY+OimlgF7HiHp/2IPiw8ZiqnyiuVaabtQ2T6Ymy
fnVipZikysblqq/Px7xOs0K30T1z5ikNZcTWmmmuhRVry1t0V6SMkNK/Ztp0pYeOqXItZ7rp
UYZ2maGv0Vy/19OGelZ6Ty+fXp/7l/+5+/r65eP7N+b9bZZXPVaHXNYxFnDkJkDAyxqdo+tU
E7c5syCAQ0yHKao8ymY6i8SZ/lX2kcttIAD3mI4F6bpsKcItJ1cB37HxgBdEPt0tm//IjXg8
YFelfejLdFc1LVuD0k+LOjlV8TFmBkgJqnjM3kIsT7cFt5yWBFe/kuCEmyS4eUQRTJVlD+dc
2mLSFXZhHYYuViZgPMRd38T9aSzyMu9/CdzlpUt9IKu3+ZO8fcDn/erYxQwMh5K6MxyJTYc3
BJVeE5xVy/Dlj7dv/7n74/nr15dPdxDCHG/yu61YspLLNYnTe1EFkh26Bo4dk31yaaoMuojw
YhvaPsKFnf4oT5kfMlSiFng4dlSJSnFUX0rpTNLbSYUa15PKstE1bmgEWU51PhRcUgA9lVfK
SD384+jqJ3rLMQo1im6ZKjwVV5qFvKa1BrbkkwutGOMIbEbxO1LVffZR2G0NNKuekNRSaEN8
YCiU3PkpcDD66UD7szxJt9Q2OnhQ3Scxqhs9LFLDJi7jIPXEiK73Z8qRe6wJrGl5ugrOuJE6
q8LNXAoBMA7Ifcc8eBP9BlGC5Bn6irn66kvBxOSgAo1LJQmbaxBllmuIgoBg1yTF6g0SHaBz
jh0dBfRiSYEF7YBPNEhcpuNBnqBr84VVJC0qnxJ9+fPr85dPpqgy3PnoKLaFMDEVzefxOiLN
G0100oqWqGf0coUyqUlVaZ+Gn1A2PNjQouH7Jk+8yJAcoiuoI1OkRkNqSwn+Q/o3atGjCUym
+KhoTbdO4NEaF6gbMegu2Lrl9UJwauN6BWnHxAodEvoQV09j3xcEppqWk2Dzd/qyfgKjrdEo
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
AA==

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--opJtzjQTFsWo+cga--
