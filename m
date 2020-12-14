Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D512D9358
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 07:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C49A6E044;
	Mon, 14 Dec 2020 06:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4257C6E044
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 06:43:54 +0000 (UTC)
IronPort-SDR: 1eeZGN6WZlOvw4SIKJmFOOCnq8n9OLeXj0fJ1xX0R3Jg3O+PBClSPMB7HDKHJE/xIAzXAsfWOm
 njST/vc/5wUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="174775412"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
 d="gz'50?scan'50,208,50";a="174775412"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 22:43:52 -0800
IronPort-SDR: uM/WuzJd7Vw/4Dv5dMhr5djzHyhFnH/LdgdRuMLg/uDUSwzqiSkACZsMo+D/xtv2epOYa0deV2
 323E03KTLuoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
 d="gz'50?scan'50,208,50";a="486898773"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 13 Dec 2020 22:43:48 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kohaG-0000As-2s; Mon, 14 Dec 2020 06:43:48 +0000
Date: Mon, 14 Dec 2020 14:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jianxin Xiong <jianxin.xiong@intel.com>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v15 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <202012141456.2b3HY1yU-lkp@intel.com>
References: <1607629058-141952-2-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <1607629058-141952-2-git-send-email-jianxin.xiong@intel.com>
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
Cc: kbuild-all@lists.01.org, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jianxin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on rdma/for-next]
[also build test ERROR on next-20201211]
[cannot apply to tegra-drm/drm/tegra/for-next v5.10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jianxin-Xiong/RDMA-Add-dma-buf-support/20201211-032359
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
config: i386-randconfig-r025-20200629 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/de7b8a9035076ce9b065dd12d421bab311c1cc43
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jianxin-Xiong/RDMA-Add-dma-buf-support/20201211-032359
        git checkout de7b8a9035076ce9b065dd12d421bab311c1cc43
        # save the attached .config to linux build tree
        make W=1 ARCH=i386 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: drivers/infiniband/core/umem_dmabuf.o: in function `dma_fence_wait':
>> include/linux/dma-fence.h:581: undefined reference to `dma_fence_wait_timeout'
   ld: drivers/infiniband/core/umem_dmabuf.o: in function `ib_umem_dmabuf_map_pages':
>> drivers/infiniband/core/umem_dmabuf.c:26: undefined reference to `dma_buf_map_attachment'
   ld: drivers/infiniband/core/umem_dmabuf.o: in function `ib_umem_dmabuf_unmap_pages':
>> drivers/infiniband/core/umem_dmabuf.c:100: undefined reference to `dma_buf_unmap_attachment'
   ld: drivers/infiniband/core/umem_dmabuf.o: in function `ib_umem_dmabuf_get':
>> drivers/infiniband/core/umem_dmabuf.c:124: undefined reference to `dma_buf_get'
>> ld: drivers/infiniband/core/umem_dmabuf.c:162: undefined reference to `dma_buf_put'
>> ld: drivers/infiniband/core/umem_dmabuf.c:147: undefined reference to `dma_buf_dynamic_attach'
   ld: drivers/infiniband/core/umem_dmabuf.o: in function `ib_umem_dmabuf_release':
>> drivers/infiniband/core/umem_dmabuf.c:171: undefined reference to `dma_buf_detach'
   ld: drivers/infiniband/core/umem_dmabuf.c:172: undefined reference to `dma_buf_put'

vim +26 drivers/infiniband/core/umem_dmabuf.c

    11	
    12	int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
    13	{
    14		struct sg_table *sgt;
    15		struct scatterlist *sg;
    16		struct dma_fence *fence;
    17		unsigned long start, end, cur = 0;
    18		unsigned int nmap = 0;
    19		int i;
    20	
    21		dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
    22	
    23		if (umem_dmabuf->sgt)
    24			goto wait_fence;
    25	
  > 26		sgt = dma_buf_map_attachment(umem_dmabuf->attach, DMA_BIDIRECTIONAL);
    27		if (IS_ERR(sgt))
    28			return PTR_ERR(sgt);
    29	
    30		/* modify the sg list in-place to match umem address and length */
    31	
    32		start = ALIGN_DOWN(umem_dmabuf->umem.address, PAGE_SIZE);
    33		end = ALIGN(umem_dmabuf->umem.address + umem_dmabuf->umem.length,
    34			    PAGE_SIZE);
    35		for_each_sgtable_dma_sg(sgt, sg, i) {
    36			if (start < cur + sg_dma_len(sg) && cur < end)
    37				nmap++;
    38			if (cur <= start && start < cur + sg_dma_len(sg)) {
    39				unsigned long offset = start - cur;
    40	
    41				umem_dmabuf->first_sg = sg;
    42				umem_dmabuf->first_sg_offset = offset;
    43				sg_dma_address(sg) += offset;
    44				sg_dma_len(sg) -= offset;
    45				cur += offset;
    46			}
    47			if (cur < end && end <= cur + sg_dma_len(sg)) {
    48				unsigned long trim = cur + sg_dma_len(sg) - end;
    49	
    50				umem_dmabuf->last_sg = sg;
    51				umem_dmabuf->last_sg_trim = trim;
    52				sg_dma_len(sg) -= trim;
    53				break;
    54			}
    55			cur += sg_dma_len(sg);
    56		}
    57	
    58		umem_dmabuf->umem.sg_head.sgl = umem_dmabuf->first_sg;
    59		umem_dmabuf->umem.sg_head.nents = nmap;
    60		umem_dmabuf->umem.nmap = nmap;
    61		umem_dmabuf->sgt = sgt;
    62	
    63	wait_fence:
    64		/*
    65		 * Although the sg list is valid now, the content of the pages
    66		 * may be not up-to-date. Wait for the exporter to finish
    67		 * the migration.
    68		 */
    69		fence = dma_resv_get_excl(umem_dmabuf->attach->dmabuf->resv);
    70		if (fence)
    71			return dma_fence_wait(fence, false);
    72	
    73		return 0;
    74	}
    75	EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
    76	
    77	void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf)
    78	{
    79		dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
    80	
    81		if (!umem_dmabuf->sgt)
    82			return;
    83	
    84		/* retore the original sg list */
    85		if (umem_dmabuf->first_sg) {
    86			sg_dma_address(umem_dmabuf->first_sg) -=
    87				umem_dmabuf->first_sg_offset;
    88			sg_dma_len(umem_dmabuf->first_sg) +=
    89				umem_dmabuf->first_sg_offset;
    90			umem_dmabuf->first_sg = NULL;
    91			umem_dmabuf->first_sg_offset = 0;
    92		}
    93		if (umem_dmabuf->last_sg) {
    94			sg_dma_len(umem_dmabuf->last_sg) +=
    95				umem_dmabuf->last_sg_trim;
    96			umem_dmabuf->last_sg = NULL;
    97			umem_dmabuf->last_sg_trim = 0;
    98		}
    99	
 > 100		dma_buf_unmap_attachment(umem_dmabuf->attach, umem_dmabuf->sgt,
   101					 DMA_BIDIRECTIONAL);
   102	
   103		umem_dmabuf->sgt = NULL;
   104	}
   105	EXPORT_SYMBOL(ib_umem_dmabuf_unmap_pages);
   106	
   107	struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
   108						  unsigned long offset, size_t size,
   109						  int fd, int access,
   110						  const struct dma_buf_attach_ops *ops)
   111	{
   112		struct dma_buf *dmabuf;
   113		struct ib_umem_dmabuf *umem_dmabuf;
   114		struct ib_umem *umem;
   115		unsigned long end;
   116		struct ib_umem_dmabuf *ret = ERR_PTR(-EINVAL);
   117	
   118		if (check_add_overflow(offset, (unsigned long)size, &end))
   119			return ret;
   120	
   121		if (unlikely(!ops || !ops->move_notify))
   122			return ret;
   123	
 > 124		dmabuf = dma_buf_get(fd);
   125		if (IS_ERR(dmabuf))
   126			return ERR_CAST(dmabuf);
   127	
   128		if (dmabuf->size < end)
   129			goto out_release_dmabuf;
   130	
   131		umem_dmabuf = kzalloc(sizeof(*umem_dmabuf), GFP_KERNEL);
   132		if (!umem_dmabuf) {
   133			ret = ERR_PTR(-ENOMEM);
   134			goto out_release_dmabuf;
   135		}
   136	
   137		umem = &umem_dmabuf->umem;
   138		umem->ibdev = device;
   139		umem->length = size;
   140		umem->address = offset;
   141		umem->writable = ib_access_writable(access);
   142		umem->is_dmabuf = 1;
   143	
   144		if (!ib_umem_num_pages(umem))
   145			goto out_free_umem;
   146	
 > 147		umem_dmabuf->attach = dma_buf_dynamic_attach(
   148						dmabuf,
   149						device->dma_device,
   150						ops,
   151						umem_dmabuf);
   152		if (IS_ERR(umem_dmabuf->attach)) {
   153			ret = ERR_CAST(umem_dmabuf->attach);
   154			goto out_free_umem;
   155		}
   156		return umem_dmabuf;
   157	
   158	out_free_umem:
   159		kfree(umem_dmabuf);
   160	
   161	out_release_dmabuf:
 > 162		dma_buf_put(dmabuf);
   163		return ret;
   164	}
   165	EXPORT_SYMBOL(ib_umem_dmabuf_get);
   166	
   167	void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf)
   168	{
   169		struct dma_buf *dmabuf = umem_dmabuf->attach->dmabuf;
   170	
 > 171		dma_buf_detach(dmabuf, umem_dmabuf->attach);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--dDRMvlgZJXvWKvBx
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--dDRMvlgZJXvWKvBx--
