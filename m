Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B0F2027D4
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 03:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452176E094;
	Sun, 21 Jun 2020 01:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBEB6E094
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 01:23:49 +0000 (UTC)
IronPort-SDR: kGb2Tr08ixlwsy7CaK/v8fLWCcn9ms/0TICec2IvLruwFh8TfrNT8nn4iu0PydVLkoammqk2hR
 Y+nzgNigSyJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9658"; a="141717870"
X-IronPort-AV: E=Sophos;i="5.75,261,1589266800"; 
 d="gz'50?scan'50,208,50";a="141717870"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2020 18:23:47 -0700
IronPort-SDR: oAXCtoyaeoulBEFWnyo1YzImPHmosSuhMOxZ0XOWKRjFePNzNHBMum/pnMGdXTDzLgkCb+i38w
 abanyAfqzTyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,261,1589266800"; 
 d="gz'50?scan'50,208,50";a="264194772"
Received: from lkp-server02.sh.intel.com (HELO 3aa54c81372e) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2020 18:23:44 -0700
Received: from kbuild by 3aa54c81372e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jmohz-0001da-EZ; Sun, 21 Jun 2020 01:23:43 +0000
Date: Sun, 21 Jun 2020 09:23:19 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 33/36] rapidio: fix common struct sg_table related
 issues
Message-ID: <202006210924.l7ZUJ53c%lkp@intel.com>
References: <20200619103636.11974-34-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <20200619103636.11974-34-m.szyprowski@samsung.com>
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
Cc: kbuild-all@lists.01.org, Alexandre Bounine <alex.bou9@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 clang-built-linux@googlegroups.com, Matt Porter <mporter@kernel.crashing.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marek,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20200618]
[also build test WARNING on v5.8-rc1]
[cannot apply to linuxtv-media/master staging/staging-testing drm-exynos/exynos-drm-next drm-intel/for-linux-next linus/master v5.8-rc1 v5.7 v5.7-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marek-Szyprowski/DRM-fix-struct-sg_table-nents-vs-orig_nents-misuse/20200619-184302
base:    ce2cc8efd7a40cbd17841add878cb691d0ce0bba
config: x86_64-randconfig-r005-20200621 (attached as .config)
compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project ef455a55bcf2cfea04a99c361b182ad18b7f03f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/rapidio/devices/rio_mport_cdev.c:939:40: warning: variable 'nents' is uninitialized when used here [-Wuninitialized]
ret = do_dma_request(req, xfer, sync, nents);
^~~~~
drivers/rapidio/devices/rio_mport_cdev.c:816:11: note: initialize the variable 'nents' to silence this warning
int nents;
^
= 0
1 warning generated.

vim +/nents +939 drivers/rapidio/devices/rio_mport_cdev.c

e8de370188d098 Alexandre Bounine  2016-03-22  793  
e8de370188d098 Alexandre Bounine  2016-03-22  794  /*
e8de370188d098 Alexandre Bounine  2016-03-22  795   * rio_dma_transfer() - Perform RapidIO DMA data transfer to/from
e8de370188d098 Alexandre Bounine  2016-03-22  796   *                      the remote RapidIO device
e8de370188d098 Alexandre Bounine  2016-03-22  797   * @filp: file pointer associated with the call
e8de370188d098 Alexandre Bounine  2016-03-22  798   * @transfer_mode: DMA transfer mode
e8de370188d098 Alexandre Bounine  2016-03-22  799   * @sync: synchronization mode
e8de370188d098 Alexandre Bounine  2016-03-22  800   * @dir: DMA transfer direction (DMA_MEM_TO_DEV = write OR
e8de370188d098 Alexandre Bounine  2016-03-22  801   *                               DMA_DEV_TO_MEM = read)
e8de370188d098 Alexandre Bounine  2016-03-22  802   * @xfer: data transfer descriptor structure
e8de370188d098 Alexandre Bounine  2016-03-22  803   */
e8de370188d098 Alexandre Bounine  2016-03-22  804  static int
4e1016dac1ccce Alexandre Bounine  2016-05-05  805  rio_dma_transfer(struct file *filp, u32 transfer_mode,
e8de370188d098 Alexandre Bounine  2016-03-22  806  		 enum rio_transfer_sync sync, enum dma_data_direction dir,
e8de370188d098 Alexandre Bounine  2016-03-22  807  		 struct rio_transfer_io *xfer)
e8de370188d098 Alexandre Bounine  2016-03-22  808  {
e8de370188d098 Alexandre Bounine  2016-03-22  809  	struct mport_cdev_priv *priv = filp->private_data;
e8de370188d098 Alexandre Bounine  2016-03-22  810  	unsigned long nr_pages = 0;
e8de370188d098 Alexandre Bounine  2016-03-22  811  	struct page **page_list = NULL;
e8de370188d098 Alexandre Bounine  2016-03-22  812  	struct mport_dma_req *req;
e8de370188d098 Alexandre Bounine  2016-03-22  813  	struct mport_dev *md = priv->md;
e8de370188d098 Alexandre Bounine  2016-03-22  814  	struct dma_chan *chan;
67446283d89467 John Hubbard       2020-06-04  815  	int ret;
e8de370188d098 Alexandre Bounine  2016-03-22  816  	int nents;
e8de370188d098 Alexandre Bounine  2016-03-22  817  
e8de370188d098 Alexandre Bounine  2016-03-22  818  	if (xfer->length == 0)
e8de370188d098 Alexandre Bounine  2016-03-22  819  		return -EINVAL;
e8de370188d098 Alexandre Bounine  2016-03-22  820  	req = kzalloc(sizeof(*req), GFP_KERNEL);
e8de370188d098 Alexandre Bounine  2016-03-22  821  	if (!req)
e8de370188d098 Alexandre Bounine  2016-03-22  822  		return -ENOMEM;
e8de370188d098 Alexandre Bounine  2016-03-22  823  
e8de370188d098 Alexandre Bounine  2016-03-22  824  	ret = get_dma_channel(priv);
e8de370188d098 Alexandre Bounine  2016-03-22  825  	if (ret) {
e8de370188d098 Alexandre Bounine  2016-03-22  826  		kfree(req);
e8de370188d098 Alexandre Bounine  2016-03-22  827  		return ret;
e8de370188d098 Alexandre Bounine  2016-03-22  828  	}
c5157b76869ba9 Ioan Nicu          2018-04-20  829  	chan = priv->dmach;
c5157b76869ba9 Ioan Nicu          2018-04-20  830  
c5157b76869ba9 Ioan Nicu          2018-04-20  831  	kref_init(&req->refcount);
c5157b76869ba9 Ioan Nicu          2018-04-20  832  	init_completion(&req->req_comp);
c5157b76869ba9 Ioan Nicu          2018-04-20  833  	req->dir = dir;
c5157b76869ba9 Ioan Nicu          2018-04-20  834  	req->filp = filp;
c5157b76869ba9 Ioan Nicu          2018-04-20  835  	req->priv = priv;
c5157b76869ba9 Ioan Nicu          2018-04-20  836  	req->dmach = chan;
c5157b76869ba9 Ioan Nicu          2018-04-20  837  	req->sync = sync;
e8de370188d098 Alexandre Bounine  2016-03-22  838  
e8de370188d098 Alexandre Bounine  2016-03-22  839  	/*
e8de370188d098 Alexandre Bounine  2016-03-22  840  	 * If parameter loc_addr != NULL, we are transferring data from/to
e8de370188d098 Alexandre Bounine  2016-03-22  841  	 * data buffer allocated in user-space: lock in memory user-space
e8de370188d098 Alexandre Bounine  2016-03-22  842  	 * buffer pages and build an SG table for DMA transfer request
e8de370188d098 Alexandre Bounine  2016-03-22  843  	 *
e8de370188d098 Alexandre Bounine  2016-03-22  844  	 * Otherwise (loc_addr == NULL) contiguous kernel-space buffer is
e8de370188d098 Alexandre Bounine  2016-03-22  845  	 * used for DMA data transfers: build single entry SG table using
e8de370188d098 Alexandre Bounine  2016-03-22  846  	 * offset within the internal buffer specified by handle parameter.
e8de370188d098 Alexandre Bounine  2016-03-22  847  	 */
e8de370188d098 Alexandre Bounine  2016-03-22  848  	if (xfer->loc_addr) {
c4860ad6056483 Tvrtko Ursulin     2017-07-31  849  		unsigned int offset;
e8de370188d098 Alexandre Bounine  2016-03-22  850  		long pinned;
e8de370188d098 Alexandre Bounine  2016-03-22  851  
c4860ad6056483 Tvrtko Ursulin     2017-07-31  852  		offset = lower_32_bits(offset_in_page(xfer->loc_addr));
e8de370188d098 Alexandre Bounine  2016-03-22  853  		nr_pages = PAGE_ALIGN(xfer->length + offset) >> PAGE_SHIFT;
e8de370188d098 Alexandre Bounine  2016-03-22  854  
e8de370188d098 Alexandre Bounine  2016-03-22  855  		page_list = kmalloc_array(nr_pages,
e8de370188d098 Alexandre Bounine  2016-03-22  856  					  sizeof(*page_list), GFP_KERNEL);
e8de370188d098 Alexandre Bounine  2016-03-22  857  		if (page_list == NULL) {
e8de370188d098 Alexandre Bounine  2016-03-22  858  			ret = -ENOMEM;
e8de370188d098 Alexandre Bounine  2016-03-22  859  			goto err_req;
e8de370188d098 Alexandre Bounine  2016-03-22  860  		}
e8de370188d098 Alexandre Bounine  2016-03-22  861  
67446283d89467 John Hubbard       2020-06-04  862  		pinned = pin_user_pages_fast(
e8de370188d098 Alexandre Bounine  2016-03-22  863  				(unsigned long)xfer->loc_addr & PAGE_MASK,
73b0140bf0fe9d Ira Weiny          2019-05-13  864  				nr_pages,
73b0140bf0fe9d Ira Weiny          2019-05-13  865  				dir == DMA_FROM_DEVICE ? FOLL_WRITE : 0,
73b0140bf0fe9d Ira Weiny          2019-05-13  866  				page_list);
e8de370188d098 Alexandre Bounine  2016-03-22  867  
e8de370188d098 Alexandre Bounine  2016-03-22  868  		if (pinned != nr_pages) {
e8de370188d098 Alexandre Bounine  2016-03-22  869  			if (pinned < 0) {
67446283d89467 John Hubbard       2020-06-04  870  				rmcd_error("pin_user_pages_fast err=%ld",
369f2679f7e739 Lorenzo Stoakes    2017-02-27  871  					   pinned);
e8de370188d098 Alexandre Bounine  2016-03-22  872  				nr_pages = 0;
e8de370188d098 Alexandre Bounine  2016-03-22  873  			} else
e8de370188d098 Alexandre Bounine  2016-03-22  874  				rmcd_error("pinned %ld out of %ld pages",
e8de370188d098 Alexandre Bounine  2016-03-22  875  					   pinned, nr_pages);
e8de370188d098 Alexandre Bounine  2016-03-22  876  			ret = -EFAULT;
ffca476a0a8d26 John Hubbard       2020-05-22  877  			/*
ffca476a0a8d26 John Hubbard       2020-05-22  878  			 * Set nr_pages up to mean "how many pages to unpin, in
ffca476a0a8d26 John Hubbard       2020-05-22  879  			 * the error handler:
ffca476a0a8d26 John Hubbard       2020-05-22  880  			 */
ffca476a0a8d26 John Hubbard       2020-05-22  881  			nr_pages = pinned;
e8de370188d098 Alexandre Bounine  2016-03-22  882  			goto err_pg;
e8de370188d098 Alexandre Bounine  2016-03-22  883  		}
e8de370188d098 Alexandre Bounine  2016-03-22  884  
e8de370188d098 Alexandre Bounine  2016-03-22  885  		ret = sg_alloc_table_from_pages(&req->sgt, page_list, nr_pages,
e8de370188d098 Alexandre Bounine  2016-03-22  886  					offset, xfer->length, GFP_KERNEL);
e8de370188d098 Alexandre Bounine  2016-03-22  887  		if (ret) {
e8de370188d098 Alexandre Bounine  2016-03-22  888  			rmcd_error("sg_alloc_table failed with err=%d", ret);
e8de370188d098 Alexandre Bounine  2016-03-22  889  			goto err_pg;
e8de370188d098 Alexandre Bounine  2016-03-22  890  		}
e8de370188d098 Alexandre Bounine  2016-03-22  891  
e8de370188d098 Alexandre Bounine  2016-03-22  892  		req->page_list = page_list;
e8de370188d098 Alexandre Bounine  2016-03-22  893  		req->nr_pages = nr_pages;
e8de370188d098 Alexandre Bounine  2016-03-22  894  	} else {
e8de370188d098 Alexandre Bounine  2016-03-22  895  		dma_addr_t baddr;
e8de370188d098 Alexandre Bounine  2016-03-22  896  		struct rio_mport_mapping *map;
e8de370188d098 Alexandre Bounine  2016-03-22  897  
e8de370188d098 Alexandre Bounine  2016-03-22  898  		baddr = (dma_addr_t)xfer->handle;
e8de370188d098 Alexandre Bounine  2016-03-22  899  
e8de370188d098 Alexandre Bounine  2016-03-22  900  		mutex_lock(&md->buf_mutex);
e8de370188d098 Alexandre Bounine  2016-03-22  901  		list_for_each_entry(map, &md->mappings, node) {
e8de370188d098 Alexandre Bounine  2016-03-22  902  			if (baddr >= map->phys_addr &&
e8de370188d098 Alexandre Bounine  2016-03-22  903  			    baddr < (map->phys_addr + map->size)) {
e8de370188d098 Alexandre Bounine  2016-03-22  904  				kref_get(&map->ref);
e8de370188d098 Alexandre Bounine  2016-03-22  905  				req->map = map;
e8de370188d098 Alexandre Bounine  2016-03-22  906  				break;
e8de370188d098 Alexandre Bounine  2016-03-22  907  			}
e8de370188d098 Alexandre Bounine  2016-03-22  908  		}
e8de370188d098 Alexandre Bounine  2016-03-22  909  		mutex_unlock(&md->buf_mutex);
e8de370188d098 Alexandre Bounine  2016-03-22  910  
e8de370188d098 Alexandre Bounine  2016-03-22  911  		if (req->map == NULL) {
e8de370188d098 Alexandre Bounine  2016-03-22  912  			ret = -ENOMEM;
e8de370188d098 Alexandre Bounine  2016-03-22  913  			goto err_req;
e8de370188d098 Alexandre Bounine  2016-03-22  914  		}
e8de370188d098 Alexandre Bounine  2016-03-22  915  
e8de370188d098 Alexandre Bounine  2016-03-22  916  		if (xfer->length + xfer->offset > map->size) {
e8de370188d098 Alexandre Bounine  2016-03-22  917  			ret = -EINVAL;
e8de370188d098 Alexandre Bounine  2016-03-22  918  			goto err_req;
e8de370188d098 Alexandre Bounine  2016-03-22  919  		}
e8de370188d098 Alexandre Bounine  2016-03-22  920  
e8de370188d098 Alexandre Bounine  2016-03-22  921  		ret = sg_alloc_table(&req->sgt, 1, GFP_KERNEL);
e8de370188d098 Alexandre Bounine  2016-03-22  922  		if (unlikely(ret)) {
e8de370188d098 Alexandre Bounine  2016-03-22  923  			rmcd_error("sg_alloc_table failed for internal buf");
e8de370188d098 Alexandre Bounine  2016-03-22  924  			goto err_req;
e8de370188d098 Alexandre Bounine  2016-03-22  925  		}
e8de370188d098 Alexandre Bounine  2016-03-22  926  
e8de370188d098 Alexandre Bounine  2016-03-22  927  		sg_set_buf(req->sgt.sgl,
e8de370188d098 Alexandre Bounine  2016-03-22  928  			   map->virt_addr + (baddr - map->phys_addr) +
e8de370188d098 Alexandre Bounine  2016-03-22  929  				xfer->offset, xfer->length);
e8de370188d098 Alexandre Bounine  2016-03-22  930  	}
e8de370188d098 Alexandre Bounine  2016-03-22  931  
c99597eab54307 Marek Szyprowski   2020-06-19  932  	ret = dma_map_sgtable(chan->device->dev, &req->sgt, dir, 0);
c99597eab54307 Marek Szyprowski   2020-06-19  933  	if (ret) {
e8de370188d098 Alexandre Bounine  2016-03-22  934  		rmcd_error("Failed to map SG list");
b1402dcb5643b7 Christophe JAILLET 2017-11-17  935  		ret = -EFAULT;
b1402dcb5643b7 Christophe JAILLET 2017-11-17  936  		goto err_pg;
e8de370188d098 Alexandre Bounine  2016-03-22  937  	}
e8de370188d098 Alexandre Bounine  2016-03-22  938  
e8de370188d098 Alexandre Bounine  2016-03-22 @939  	ret = do_dma_request(req, xfer, sync, nents);
e8de370188d098 Alexandre Bounine  2016-03-22  940  
e8de370188d098 Alexandre Bounine  2016-03-22  941  	if (ret >= 0) {
bbd876adb8c729 Ioan Nicu          2018-04-10  942  		if (sync == RIO_TRANSFER_ASYNC)
e8de370188d098 Alexandre Bounine  2016-03-22  943  			return ret; /* return ASYNC cookie */
bbd876adb8c729 Ioan Nicu          2018-04-10  944  	} else {
bbd876adb8c729 Ioan Nicu          2018-04-10  945  		rmcd_debug(DMA, "do_dma_request failed with err=%d", ret);
e8de370188d098 Alexandre Bounine  2016-03-22  946  	}
e8de370188d098 Alexandre Bounine  2016-03-22  947  
e8de370188d098 Alexandre Bounine  2016-03-22  948  err_pg:
bbd876adb8c729 Ioan Nicu          2018-04-10  949  	if (!req->page_list) {
67446283d89467 John Hubbard       2020-06-04  950  		unpin_user_pages(page_list, nr_pages);
e8de370188d098 Alexandre Bounine  2016-03-22  951  		kfree(page_list);
e8de370188d098 Alexandre Bounine  2016-03-22  952  	}
e8de370188d098 Alexandre Bounine  2016-03-22  953  err_req:
bbd876adb8c729 Ioan Nicu          2018-04-10  954  	kref_put(&req->refcount, dma_req_free);
e8de370188d098 Alexandre Bounine  2016-03-22  955  	return ret;
e8de370188d098 Alexandre Bounine  2016-03-22  956  }
e8de370188d098 Alexandre Bounine  2016-03-22  957  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--rwEMma7ioTxnRzrJ
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
e+VwkGFC+Sn8H+ln/Vh9OwIA

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--rwEMma7ioTxnRzrJ--
