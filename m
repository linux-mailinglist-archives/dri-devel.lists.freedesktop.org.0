Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B33A202B25
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 16:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905CE89F33;
	Sun, 21 Jun 2020 14:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D0689F33
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 14:48:20 +0000 (UTC)
IronPort-SDR: zE7+QlroPTW4H3WHXZ1ve+BG2ki57JkmX00JIxwHP4FbRblMugAe1qfJA/bm9FV/+VDJNaLv2o
 w7Xt8mjAmZcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="208766196"
X-IronPort-AV: E=Sophos;i="5.75,263,1589266800"; 
 d="gz'50?scan'50,208,50";a="208766196"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2020 07:48:19 -0700
IronPort-SDR: Ymd8+lNaeANHML7cITWRtv+MjyImMlXXFvZGDOrDbFuxL9vkK5eIrB+dQ8F5aQnVRPeV9gaV/n
 GeecCSZmnExQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,263,1589266800"; 
 d="gz'50?scan'50,208,50";a="278516430"
Received: from lkp-server02.sh.intel.com (HELO 3aa54c81372e) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 21 Jun 2020 07:48:15 -0700
Received: from kbuild by 3aa54c81372e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jn1GY-0002kF-JF; Sun, 21 Jun 2020 14:48:14 +0000
Date: Sun, 21 Jun 2020 22:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 26/36] drm: host1x: fix common struct sg_table related
 issues
Message-ID: <202006212216.jLr6uCUi%lkp@intel.com>
References: <20200619103636.11974-27-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <20200619103636.11974-27-m.szyprowski@samsung.com>
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
 David Airlie <airlied@linux.ie>, clang-built-linux@googlegroups.com,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marek,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20200618]
[also build test ERROR on v5.8-rc1]
[cannot apply to linuxtv-media/master staging/staging-testing drm-exynos/exynos-drm-next drm-intel/for-linux-next linus/master v5.8-rc1 v5.7 v5.7-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marek-Szyprowski/DRM-fix-struct-sg_table-nents-vs-orig_nents-misuse/20200619-184302
base:    ce2cc8efd7a40cbd17841add878cb691d0ce0bba
config: arm64-randconfig-r036-20200621 (attached as .config)
compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project ef455a55bcf2cfea04a99c361b182ad18b7f03f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/host1x/job.c:230:10: error: implicit declaration of function 'iommu_map_sgtable' [-Werror,-Wimplicit-function-declaration]
                           err = iommu_map_sgtable(host->domain,
                                 ^
   drivers/gpu/host1x/job.c:230:10: note: did you mean 'dma_map_sgtable'?
   include/linux/dma-mapping.h:628:19: note: 'dma_map_sgtable' declared here
   static inline int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
                     ^
   1 error generated.

vim +/iommu_map_sgtable +230 drivers/gpu/host1x/job.c

   100	
   101	static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
   102	{
   103		struct host1x_client *client = job->client;
   104		struct device *dev = client->dev;
   105		struct iommu_domain *domain;
   106		unsigned int i;
   107		int err;
   108	
   109		domain = iommu_get_domain_for_dev(dev);
   110		job->num_unpins = 0;
   111	
   112		for (i = 0; i < job->num_relocs; i++) {
   113			struct host1x_reloc *reloc = &job->relocs[i];
   114			dma_addr_t phys_addr, *phys;
   115			struct sg_table *sgt;
   116	
   117			reloc->target.bo = host1x_bo_get(reloc->target.bo);
   118			if (!reloc->target.bo) {
   119				err = -EINVAL;
   120				goto unpin;
   121			}
   122	
   123			/*
   124			 * If the client device is not attached to an IOMMU, the
   125			 * physical address of the buffer object can be used.
   126			 *
   127			 * Similarly, when an IOMMU domain is shared between all
   128			 * host1x clients, the IOVA is already available, so no
   129			 * need to map the buffer object again.
   130			 *
   131			 * XXX Note that this isn't always safe to do because it
   132			 * relies on an assumption that no cache maintenance is
   133			 * needed on the buffer objects.
   134			 */
   135			if (!domain || client->group)
   136				phys = &phys_addr;
   137			else
   138				phys = NULL;
   139	
   140			sgt = host1x_bo_pin(dev, reloc->target.bo, phys);
   141			if (IS_ERR(sgt)) {
   142				err = PTR_ERR(sgt);
   143				goto unpin;
   144			}
   145	
   146			if (sgt) {
   147				unsigned long mask = HOST1X_RELOC_READ |
   148						     HOST1X_RELOC_WRITE;
   149				enum dma_data_direction dir;
   150	
   151				switch (reloc->flags & mask) {
   152				case HOST1X_RELOC_READ:
   153					dir = DMA_TO_DEVICE;
   154					break;
   155	
   156				case HOST1X_RELOC_WRITE:
   157					dir = DMA_FROM_DEVICE;
   158					break;
   159	
   160				case HOST1X_RELOC_READ | HOST1X_RELOC_WRITE:
   161					dir = DMA_BIDIRECTIONAL;
   162					break;
   163	
   164				default:
   165					err = -EINVAL;
   166					goto unpin;
   167				}
   168	
   169				err = dma_map_sgtable(dev, sgt, dir, 0);
   170				if (err)
   171					goto unpin;
   172	
   173				job->unpins[job->num_unpins].dev = dev;
   174				job->unpins[job->num_unpins].dir = dir;
   175				phys_addr = sg_dma_address(sgt->sgl);
   176			}
   177	
   178			job->addr_phys[job->num_unpins] = phys_addr;
   179			job->unpins[job->num_unpins].bo = reloc->target.bo;
   180			job->unpins[job->num_unpins].sgt = sgt;
   181			job->num_unpins++;
   182		}
   183	
   184		for (i = 0; i < job->num_gathers; i++) {
   185			struct host1x_job_gather *g = &job->gathers[i];
   186			size_t gather_size = 0;
   187			struct scatterlist *sg;
   188			struct sg_table *sgt;
   189			dma_addr_t phys_addr;
   190			unsigned long shift;
   191			struct iova *alloc;
   192			dma_addr_t *phys;
   193			unsigned int j;
   194	
   195			g->bo = host1x_bo_get(g->bo);
   196			if (!g->bo) {
   197				err = -EINVAL;
   198				goto unpin;
   199			}
   200	
   201			/**
   202			 * If the host1x is not attached to an IOMMU, there is no need
   203			 * to map the buffer object for the host1x, since the physical
   204			 * address can simply be used.
   205			 */
   206			if (!iommu_get_domain_for_dev(host->dev))
   207				phys = &phys_addr;
   208			else
   209				phys = NULL;
   210	
   211			sgt = host1x_bo_pin(host->dev, g->bo, phys);
   212			if (IS_ERR(sgt)) {
   213				err = PTR_ERR(sgt);
   214				goto unpin;
   215			}
   216	
   217			if (!IS_ENABLED(CONFIG_TEGRA_HOST1X_FIREWALL) && host->domain) {
   218				for_each_sgtable_sg(sgt, sg, j)
   219					gather_size += sg->length;
   220				gather_size = iova_align(&host->iova, gather_size);
   221	
   222				shift = iova_shift(&host->iova);
   223				alloc = alloc_iova(&host->iova, gather_size >> shift,
   224						   host->iova_end >> shift, true);
   225				if (!alloc) {
   226					err = -ENOMEM;
   227					goto unpin;
   228				}
   229	
 > 230				err = iommu_map_sgtable(host->domain,
   231						iova_dma_addr(&host->iova, alloc),
   232						sgt, IOMMU_READ);
   233				if (err == 0) {
   234					__free_iova(&host->iova, alloc);
   235					err = -EINVAL;
   236					goto unpin;
   237				}
   238	
   239				job->unpins[job->num_unpins].size = gather_size;
   240				phys_addr = iova_dma_addr(&host->iova, alloc);
   241			} else if (sgt) {
   242				err = dma_map_sgtable(host->dev, sgt, DMA_TO_DEVICE, 0);
   243				if (err)
   244					goto unpin;
   245	
   246				job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
   247				job->unpins[job->num_unpins].dev = host->dev;
   248				phys_addr = sg_dma_address(sgt->sgl);
   249			}
   250	
   251			job->addr_phys[job->num_unpins] = phys_addr;
   252			job->gather_addr_phys[i] = phys_addr;
   253	
   254			job->unpins[job->num_unpins].bo = g->bo;
   255			job->unpins[job->num_unpins].sgt = sgt;
   256			job->num_unpins++;
   257		}
   258	
   259		return 0;
   260	
   261	unpin:
   262		host1x_job_unpin(job);
   263		return err;
   264	}
   265	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--PNTmBPCT7hxwcZjr
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICIBt714AAy5jb25maWcAnDxbd9s2k+/9FTrpy7cPTXWz4uweP4AkKKEiCRogJdkvPIoj
p97Pl6wsp82/3xmAFwAEVe/m9DQRZgAMgMHcwV9/+XVE3k4vT/vTw93+8fHn6Nvh+XDcnw5f
R/cPj4f/GkV8lPFiRCNWfATk5OH57e/f98enxXx08fHy4/i3491ktD4cnw+Po/Dl+f7h2xt0
f3h5/uXXX0KexWxZhWG1oUIynlUF3RVXH+4e98/fRj8Ox1fAG00mH8cfx6N/fXs4/efvv8P/
nx6Ox5fj74+PP56q78eX/z7cnUaH+/nFxf7i4svd/fTu/rAfz/efP9/NFpMvk8vp/uvk8sun
+/HsfvIfH5pZl920V+OmMYnatulsPlZ/DDKZrMKEZMurn20j/mz7TCZOh5BkVcKytdGha6xk
QQoWWrAVkRWRabXkBR8EVLws8rLwwlkGQ1MDxDNZiDIsuJBdKxPX1ZYLg66gZElUsJRWBQkS
WkkujAmKlaAkgsFjDv8DFIld4Qh/HS0VQzyOXg+nt+/dobKMFRXNNhURsK0sZcXVbNoRleYM
JimoNCYpSc6qFcxDhQNJeEiSZpM/fLBoriRJCqMxojEpk0IR4GlecVlkJKVXH/71/PJ86PhB
bknezShv5IblYa8B/w6LBNp/HdWQnEu2q9LrkpZ09PA6en454WY0HbekCFeVgpq9QsGlrFKa
cnFTkaIg4crs3OKVkiYs8IJICZfOM+OKbChsO8yqMJBikiTNecHRj17fvrz+fD0dnrrzWtKM
ChYqzsgFDwwWMkFyxbfDkCqhG5r44TSOaVgwJC2Oq1RzkAcvZUsB1wIO2gtm2R84jAleEREB
SMIRVoJKmkX+ruGK5fYViHhKWGa3SZb6kKoVowI39aY/eCoZYg4CevOsSBYB+9cjW10RPeYi
pFF96ZgpbmROhKT+ydRENCiXsVSMdnj+Onq5d87bu+NwL1hNk+iPq4TCpuMiBxzC5VzDsWeF
IV8U96FIAvm2rgLBSRQS80Z7eltoilWLhyfQAT5uVcPyjALTGYOubqscRuWREqrtPck4Qhis
znuNNDguk8Rzl+Av1ElVIUi41kfRXWEHps/NM4iawSCTLVfIqGpnhXVYvRUbYkZQmuYFDJb5
19EgbHhSZgURNx5KapyOlqZTyKFPr1lfM3UWYV7+Xuxf/z06AYmjPZD7etqfXkf7u7uXt+fT
w/O37nQ2TMCIeVmRUI3r7Js6PBvsIdUzCHKNORAyr+JO/0AtngxX6jpRkZIE1yZlKfybGMgI
xV8IKDhq4UVC9Ye6W/p2WDJjG+H+N4onYhIVa2Qe9zs21WA32AsmeaKEozmzOh8RliPpuShw
kBXA+iduNcKPiu7g8hg8IC0MNZDThNuguta32QPqNZUR9bXjHaJ9mmCXkwTNhdQU+AjJKByp
pMswSJgpWBAWkwwspKvFvN8IGorEV5OFCQk4d0dQTXB0Cbm5ugCLrj0ENTUPAzyNYd7ollMp
uyl1FHh9/PaZtRpgrf9h6IR1e3Y8NJu1sSSvnjpDCa2iGJQxi4ur6dhsR/5Jyc6AT6YdU7Cs
AIOUxNQZYzJzRba+TUpwN8JB3v15+Pr2eDiOwPQ+vR0Pr6q5XqYHaukJWeY5WJuyysqUVAEB
kzq0tF5t3gKJk+mlo2Tazi60N1gn8C1Ie0Fppu6nTwksBS9zaY4BhlvoFzZBsq47eMEapDfx
HELOInkOLqKUDJJaxXBbb5Uyd/utyiUtksDXNQdbs7BWifyGlNSw4fkiumEh9UwHHV0x6qyT
itjTL8jjc6tXdo5fm4NtD1YSCHB//xUN1zkHZkENDE6RXw1oHidlwYdPEiyiWAIlIFBDUngZ
RygB0vlYwBqwU8o1EYaRqn6TFEaTvAQTwnBbRFQtb02zFRoCaJhaLcltSqyG3a0D587vuUEV
56j/bZEDV46D/k/ZLUWzRh0TB/WZOafsoEn4h2cfWqfJ+g0aJ6TKyNDy0iApj7sfrl5S5iqw
o2GqSuBp9CiqnpWqD6nXHGtr19CKyolrDTJLLLq/qyw1dDwwovGDgHWOpqQxVQlGovMT7pTp
DGxo3Rym+S5cGePRnFurYcuMJLHBOoriODLPRFnTsY8d5QrEliE/mcEVjFelsKQuiTYMVlPv
nSv9AiIEeESeWdaIfZMa29i0VNYZtK1q0/CqoHdoMUH/4JTM35KsaMU2ov3BzDACsIYCmfvU
OiQd6TB4Bg4IiABzaeBeXXsWBb1oFNHIOTa8FpXr/KhGoKLagLmZcMsXycPJeN4z3ur4WH44
3r8cn/bPd4cR/XF4BkuQgAoN0RYEt6Cz6rzTKpnon7xWxO+cpqN2k+pZtHsAV8PHVEkZ6Llt
3yjNCRyOWPtlZ0J8KgjHMkeRCfejkQAOUixpwwXGFUEYqj80CysB15yn9pAmHEMHYNb4L0sZ
x+Ck5wSmUVtJQF3YQ5XKDgQUUTCSeFcKKjRmid/FUVJPKSPLCbQjah0HpwtDai/mgcn0aVqa
zA6omnDX0NMg+FHUoLl1Q9KUgGmRgY5hYFKlLLuaXJ5DILur6cAIDQe0A03egQfjdbY5GP/h
WlvStZVniKskoUt05nD34C5vSFLSq/HfXw/7r2PjT2cAh2tQ1f2B9PjgScYJWco+vLF6LTFv
NLaCqyFF9tFWWwouvy/6IcvU00oSFggwKWoHpEW4Bde/ipSqb/mraZtNPQymdlrbtU2occWL
PDHX4scR8C9TGMvUsEHWVGQ0qVIOvlxGTc8sBiVKiUhu4HdlKZt8qePKKkIor2bW9K0RX6rQ
oxtIUmboGiW1ThAYKkSSDBiZRHxb8TgGGxV54B7/dGygZWz+uD+h2IP9eTzc2RkIHSxVYUVL
z+n2JUvozh+B1cRnOzYMJknOBiI2Ch6E6fRydjF0egCumO336XYqEpb1iIVrhDHFM9OJMJXF
QEBZscLuJuM+Qa+g65lDBzAo8HxIctqjJVlO1kPjrJgZJ9ESgUYMmH7dGwcMen5mRekGlM/Q
POku7I13DSJnCB/c9cRHg4C7KcngtsD5rO3wsmaN2dRtoaQokv5eyQKD3rvJeGgGMFauwZUy
rV7VXtClIO4kuYh6MxSrMou8BpsJduktM5Zj5Ls33AbMcgykDZ/LDuXZMPj2zJW6hcWmjtdV
K0fPNTZNqLiLP6hm0Hejw/G4P+1Hf70c/70/gpHz9XX042E/Ov15GO0fweJ53p8efhxeR/fH
/dMBsXTA01SYVMDxlGl1OV3MJp8HCLcRP70XcT5evAtx8nn+yS/kLbTZdPzpwrUFWuh8Np98
HoJOxtP5p8mlC8ZEIQE3GJS1zGlY1vqOFDZTWCNNFhcX03+mdgKbNFt8OjPQxWz8eTobHMig
TdAcLldVJAE7M970cnE5/vSO/Z7MF7Pp9OI9mBfz6dw+7MYKJhsGCA3idDpTR9NZyQ58NpnP
3zHMDGY8N8yn+cXCH/2wEWfjycS/wBqx2E27Ub0rjEvwvWTZYo0xAz4xiUNJnzC0B9r9WkwW
4/HleOqdGqVzFZNkzYXBmGMfCwygGvytMK6jGC7ZuKNxvLhwUJxBKDhp1iIkD8E2wGRPK4cx
kM4K6RVS/z+pY3P2fK0seNnn5cmiBp3hzcXcg2NhbIi2uWef+zM0sPnlP3W/mn12vY6ma98f
0T3mrUeBvlOAznUGmt+yZRCSMNSUNdDnoKkYXWrm6FWLTA0LMRMqdnk1vWjditoCxnY7Wmz8
AstWNkF0I66A3jWSpiLIiFQxNyIAJqiOaurcFdgTxrCYs2hAKqIABrMANzQE5WuEmVY8oRjQ
Vsa90XyL3G3drdtqejH2sgGAZuNBEN5SX+XA7dWk85n0dq4E5uuGou510AE4rYk22IYIpqvB
D6gdjEFwz42vjaWEhkXjlaC7kTi7rd2DOEP/zzwKeSM7GuuQd+y6FSqMhMAqTyP0IoRLIAaM
QgLbgPU6VEU3/Y6TzIFb1TB5USdGGk4Oa77QTgpGs7Rja4kXGqIb7EsnEkEwE2rFkOq2c7nP
1lPbUcsAVg3AdYkvTBsKIldVVCpfr+2yo77bp3LdKp+ETMoF2I7o4nd1Kxk6+LWnCGqZJl6G
U/EXcEpIpvw8cAFCJ8pSo9BkCjanKmM6I/akDLxxeB6RgqjArJvucaWU3FZFEYgx7HLWF4wF
WS4xMRBFoiKB3+vTAY1ejA8G+HH5cTLaH+/+fDiB6fqGMR4jX2ZNtNpWJI6CtC9EPVRtVnRI
DZ2b0iBr+k6ySsL70+dwQc+cCTAVOJWFj4nqaFSWm+Gvf6DIoHr2TqrzQmAuZ+XcStnxHYfL
S0IwIftFdRhzR0ApMnXu4PMYhyIVDvTttYUxA4G/xDCOIKrUj/ZXObgCY5Xzd66SpKXa5/4s
gyMYs1y8c5agYO/ZRhuvtpfHuRuRN+KzFsWD1PQu/MYnyDQMFEaJAdyk8BhRuaRlxDGV42Vd
QVXAF0WEH64Ix7QXZi+8t8/1SNVmBy+A9vId/VZja8M0UlWbHz503S1Mn85BzaVivGbFnA51
vfx1OI6e9s/7b4enw7NnQlmCJ2fWydUNRuLYAcg1y1XGxNDALADxjgyOWi0AnSb7QLtSr2us
ZEZyLN/CjKgRJkzhqkQ6ol7Y1Z4ISijNbWRssaOT0IqJ2z7ulqzxVE0qzda6SnVilntY8GXo
U9CpNVovEYLURBvMm0b9rHWHg/Wu/VNpF9gM27WHydr63QSPdU2hxfDb6yrnWzA7aRyzkNEu
eeanxRnKs+suBjfStSohYmwKoi571lsdBOzYIedSsr6JaKLoapeeJar50+jfxYqG7kFT0VZj
pC1GEzZCGPv6eDCuKFZfRXbkrmmrlnxTJaAc7PCaHy+lmS9aaeEUlDd3GV3JhppRdHz4oROB
pjTDvoPVjQjPZch8SOYQSS4/TSa7Bs0RyR4SjBo2vVXtxsXHw/+8HZ7vfo5e7/aPVmUgrhJE
zLXNLtii1k0K0NTSUsImuK0Ds3ZWgVG/Du69wmjsPhzIqGb4P3TCOySJV+F4O2AiWpWieCk2
MXkWUaBmoCDI1wNgMPpGReLe30t5dGXB/KlKa68HtsiL2mxMV4dmwc198MGb1UN3Py3vX+zg
IlvmvHeZc/S1f6kAUe+dn6fwwsgwZw3ewJ2qUy0V2cgG0zKJKpbuFtct6MkENckQf0cVs2qI
XG3trmBv5yA0xU1HoI0gw5QZ41rLUumEyeXizNKuuWAm1ZYk8Nx9E9yTt2rX44fj01/746B8
UwSjdclD7ivS7nCUmqur7Z01590Q9mZqkN3Tnh7jPJjajYn3MsRMpFsiVPo0JZbvHIPHH9dV
SL4CAFahaO7TBd6GYBKU5q4S2yLt1hKE6fzTbldlG0GsuoYGIGEwvze25HwJ+qWh1lfkAi5L
k73taAEurSKZm7uCTTL0J91qdRNvXdbSWgjr77xZqDqeA9udhqFpZVrtWEYd8g0VN42CLA7f
jvvRfcNC+jYbBdDI0BXbmMXJqinIU8vtHBinAfd4tBkNIzElSdhtY+t2sZaNP82ofF64ntYL
L/Ubo0TTi4Vb69EBLybTFthJqxY8aUb3R3faKVq0s3MMwGc1BU99CtLZewhI5+b47iDLFQah
/nmYUITFZByxuBvsyUEhVA5sZQvxrdEEgoubnkcITEO8h4DlEQrFpS1cEfhvOm4KKNxtyHly
M5mNLxR8eBeylYV4hpIAy8StF3uGi3347evhO3C611nUYcG6UK7hbRVHdIvn1rp8wyt+/ijT
HIzkgPokuLrknXtSZnChlhlG2sLQCrgoxLVbJaJbBS28gLjMVGkHpne48L8gAzSrqrOLLqsC
oRXnawcYpUTVUbFlyUtP0Q/4pNqg18+4+ggKiPWdOmfgCT2DAVaw+KapCu4jrMExc4uJWyCM
WofOB4AREyq8br57NNatn3zqx6PVdsUKar+00KgyRdeufpvp7rygS2A/jB5gxLs+zIr0ql+x
6HLo0PD96GDH1RasLEp0RbcDU5WQSIGvHW3Smqo63t3bgI5hz0M9patpWlZLgg+O6te0GFbx
gvGJiA+lPijNlvpdRq84WBNTX5T6nDAg5GDU/fQj2gFYxEvL9+7WWacmMGVQmM63gYG7mMAh
uJkwbEfThtYh/Uac1HFVC6yetVkpEQs8WBXT5HjOp1dc4JAEwvvsvPYzwcNP0kwsz6u0AbmS
YQKM1kkoz8lpJsAE1aZ/SeHWNVk0GrLYfH2lA59SZSxpEisG9cgABWrimL6prWJPZwAb5lSJ
WgXaBc9h9zPdIyE3vHRvasjzm0beFIkxU5hgdSNGFsFijUyALhqdTWF2tdk+8nHTWmboCcAC
ZHDRJKjE1ijRPwNyu9chZl93H6ijrX4BL6qVD5rDic2mTRDaFqy6LEsqb0NQXCLekg6OsUqz
als2hvIS7ObfvuxfD19H/9ah6e/Hl/sHO0CDSPXKPatWUF3RTOti/q5q+czw1grxwwuYgG+i
lE7V8z9YJc1QcBNTfDNhanv1kEBi3Xv3RYf6LpjioD4ZncFMOPFlDGucMkO4e7Pqri3QHLnR
hF4bqO4uRdh88IIk/lhMg8n8r5xqMHKRW4RnY2BWflulTEoUVu3jKPDglNzsVlZmwFOgRm7S
gJtXsJEl6v1nAmaQaakEdq4b3zfJUDJg3OvS+oBD8/IpkEtvY8KCfjv63EvBCu8LqhpUgQ/Q
B2NK2joY9ShPJ1kqVXTgD9Qi2jbwhcX1yFjrYJYRmK3+SXFPeT7wNgAR9Pc6Kpopg933sjff
H08PyPyj4uf3gxUcadMkbY7Bxwky4tLIqHSReXD3zeYubu7MaC43va7ykNlbAG2oGs3nRNis
sgD6mxO8ewRqOBbQj3FdZRKB7K8/XNIxeQde3wQDR9ZgBPG1DW8+f2BN/Uu7cVgQYEg4mU3M
u1CfigTrWl3z4QIYUoD6DCuRGp/FUIJJd4ajAd1nGk5iK2k6BFTCewDWCn71LZFIoTnprGGI
21ls/V177a3sz5AiEFsJyXOUJXUuvHIiu52G1E+3qq2ADuY6uhSj4g369+Hu7bT/8nhQXxQa
qadJJ4NLApbFKRaQxM4sHaBNr/esZwTa+rHdiWVWIggfFxoSBjrYnm49iwwFy60ynBoAsjX0
ciYOg76Fly2HVq22JD08vRx/GmFSTwL3XGlUV1eVkqwkPkjXpIrS1JvKHPSFqnxzLU09Sa6+
rVL4pgGbGUwR6gNtdFC0VwDWw3D9PyKLatlzi9HjVW/47DupCvIaGH6lyLiMmvr2ywk9SO9F
jN1eUzoIbsxc7nx46cxbGl0spgrFdHXi3OkUoNo2Sa0btN3rBC98baouQFAUUZb74fm4Tqhi
GJVTvpevbqQucyrap2Yd54NdOZA5W0tfzLPZI8UJcD5q5Kv5+PPCOtxWqNbbEBOWlHaEyYb4
39Sdcat8UFj6ltxYFqIXLdUPYv13HfzfTFUKesGxgE3GD0z5O3tf8t/mnFvfmboNSn+C8HYW
88Sn+W9l/wFq09Y+yEq1PD/TXUnXfvxKZQpA/yonpAPDWVMh7IiE/hhXl1GImneVfUe71R+5
ev9mO776sVvzrYF2wo0aDHmL59aDWETER9sbSzvEguAXjahbaVgX9/a+7NJlUPDDBGCprVIy
8K5VubAgCdCdzdWLeG/ex1qk8t+J5UsNK4BOapuCeB2gCKZZE4NTWiQ7nLCsHFOcnfowTMdw
7f2iAxg/hseKvzC3Zu6TaosY8bsm4MB723exSFXYzQuF9YD8vvH3jHIswAdyfXvJ9FZ0BmGu
tRl+SMpvMeZdRY7gYKr5okuAlP8vZ1f24zhu9P8VIw9BAmSwlux22w/7QOuwOa2rRdqW90Xo
nelkG+k5MN2b47//WKQOkqqS98sCMzuuKvE+isWqHwsbLUz/buNjVHmZARkgFPC53QnUrMb5
UG9e8TnmoYYxn58apJhGopWnwhzYR5PXFTaL8oET1njz4Vni3m/ATUsc4KbjjdniGUC3tAzH
tNM8dRClmbwi/KE1d6iuTYQB6ZFkVPVkN/lTXNEDWEvU7HJDAriqX9QqV+LDFnJX/zzMnc0G
mei0ty14g+2s4//8p0+///ry6U9u6nl85xkIhlF33rjD9LzpxjqocTi0ihYyaB5CgnMXw7cb
qP1mrms3s327QTrXLUPOKzx8SXO9MWuzBJeTWitau6mxttfsAu6TtdYrr24Iq2abkTZT1F5v
1nspMRO0oG59mi+Sw6bNLrfy02Jq+8FPHKabqwxNqFegKhlZ65r+ORkvhgr5aMdEah2A4Du4
ICC3w15GaZPaSqu21txXNmxhc8mA20qqGaZai+IoIldgERGrc01gLKk+xVuYSdy3IguJHPY1
jw+YnmrudmAdEU48f0dCEztnrGi3yzB4RNlxEhUJ3llZFuHRdkyyDO+7hoh9VOd/PHq8OpZU
9pusvFQMj+HmSZJAne7W1KiYAcuKIwwfJC4EoDuVABlruynsVfcxbStDEyurpDiLC5cEFOsZ
UULscmpMX3LTyCtip4QaFgLP8ihodcmUVCm5pES2ApxVWPQpqcda0hkUkcCW2trWsetU4yTa
u3HjIqV1iF2QoNLES/wENMpEGROCY+u13pYBvk5cWxcWaf/o6D4dIhCRRAoGcePq7SrKi/fn
tw7H0mmG6kEeEnzs6slal2onLtUBp/SaslPmJ8l7DFtBt3qe5TWLqfYi5tKe8FdMVcPV1JKW
tg8Rdmi/8DrJjPPFmHF6gLkaTIzUA+Pr8/Pnt8X7t8Wvz6qeYOD6DMathdpLtIBl/e0ocOBq
tdMPRJPpGDvLA//CFRVfvNMHjmK2Qq/srD3O/B5N1E737ebA5CLGCRi6pDq2FC5zkeItXQm1
+1EgtKD0pjhvZjePIXgUzA7W8bwuVfE8wC6wl4DxFkkikUdZllm/gHlmuGSE19L9HD//6+WT
7ajZjyJ1uGP53jKpGy87dtx7KTq3B/4PK3xhSpzCjAJzAhGmiNrwtbe9cnprHXwBAs65X/1m
hGaheaLC5gewIPbNT0od6knx/cUtfC74hIAiRgPv8cTrB+FlNzN6devIE7ZDAotJr5mTyHUp
BRovz8TnajH3hSuGr9yaF1axHWJtdQjeSxHJEUcNzG4uxyK++PTt6/uPb68AMIr4cuuqslqd
wQglVXdMAxhdTVtcCBQv8GiV6u8AjZsGtgfEolOtI1YjJA1C77Y9UCY4twOjH/hf0FKTJaYR
WIB7XindPcd2eM0Fl37JHYxEyNLDIhppbZUxCSEDKNMMdLf0gLRT45ruUPMOlqatiBDTiSAM
Yrqbe5we/Q01STEgIjN7Z7CToCBgoj8I5Ao3fn57+cfXC7gPw4CNvql/iN+/f//2490C9YMs
4ovXfPFlOlo0FZobp/YfOGUjYZ30LM+bzaS2okpYHawazO4EHz0kVyEdgAKbihZiBIsi0uxg
odyC+HhN3iiqcxazdos5dXUCskqijddWHRVrXHAuyNqD3xMPvHYBtzQVStzODYoJepX9tQm3
2K1H92CHbErn8ixEJncy2QbkuQFnrhi//apWypdXYD/PDci83PNzwr39dSBj7TfwuiHqNtg4
BmBZ8w59vf2bLp1Z2p8+PwN6pWaPyz8A52N1iFicFJG/knVUrAY9C5ljNmsc432Iy81yDS4W
+L417GnJ18/fv73ogER3Ghex9nVFm835cEjq7d8v759+w3dJW1O4dCdKmTigofNJjCmofc2O
XI3yiDN3wwKK9rdqI06gM6s0lNo2WT+r6MOnpx+fF7/+ePn8Dzsm/ZoU0jGfaEJbYshThqW2
0dLyuTNEyadpyFIc+R67mavizX24G6cl34bLXWhPU6gHOEwMD/yMhxZWce9UN/rkv3zqFOtF
Ob2wORmfvmOSVager474Mq9SRz/saWpKnvwx04moIhYxy2YeldDZDjFO+s2dSfGH6JjXb2oK
WOE36UX3uOP/0ZP0rV0MWPMjEzwJ2JCbFf09fqVdt00zYIlabIB10nHpzlFokMS852wx5D7X
DwbqqjscmY3f63nw/bAzNq54Npew4oE/WVzzM3Ek6QSSc00YnI2Ajig3ybTGAwEbynn7WIr2
4QSvNblvLunvmcZI7lIxzwINw9x81PP8x5wGMFNwlz7JknhTCNjnU6Z+sL1SZiW3vU9ECRCr
trUpOTj3weZ3y8NoQhMZz+HbLz69yvmEeAkm3+e57c7WZ2S/uwMBIBo0SA/h1MVIBGaqNwod
P4I0fd8Cxhm8rMqsPFzthZdYEgyMxO9vi8/6KO6dwY1jJCAVt5mlifehqAcu9krOAVney6Cl
bLqa12BnhBHWLbOfyYLIwEtiP6GkY1WTPbeQJQUHOwgMPtNDo91d2wwO6KGk13vgwC+TvBsY
o3G2w6PskOyRBFKRtXnkf5cfeettOSMEh9XK1iZVFsUkKGHgHgrcHVfG46hTP/RsGSKyRofL
708/3rwDLEiz+l67ahJJQ/TnRmnqRsbNyHJ79VllilGNf6zqSbU6S3ZwmSwVM9/IurG7Ezgw
QyrV8nOlV1NIP0KAJNyzTKyS9o3Snl8fAjIBHT2mHeddd9ypIHhrgLMGrkxN+kR3yukNApi/
gT+pgU2XP56+vr3qJw0X2dN/XQdX6JrsQa3Vwm8XXQ2qN7VnWF3a36QSNXUq8thg8KutrXML
d/l1GrcOQYg0jqyfecd2SlqWFeHNDt1LOTXlNooLeBjqi4iJ4lCz/Ke6zH9KX5/elIL528v3
qXaqR3HK3YHxMYmTyNuRgK6W1WGjcgoDeEwsPusbbs8/35KCVX7Piof2wmN5bK19AeGGs9y1
y4X8eYDQQoQGJ1BAuv7ic1geC38pAbpS49iUCigIfjvUhH1E84iDtp75e/D+RKfKTCeaw+bT
9+8W0oK+D9BST5/U0jpZ7EAvU7XvPdPowQdOivnM+BPRXbiMYlqgSKSWIQWkuLtDLX7ANHaC
M8Su1X4rw/Fw0tL96fZGc5gnlZ5f//4BDlxPL1+fPy9Umt1WhM+PKo/u7gJvUdY0AKlPbZcu
i+XBCuk2ywBYwE3naEhOBdUfr37+AhaaPc8YwF7e/vmh/PohgmpO7hCchOMyOqzQdrvdJOY6
Tx1o3MYBiolVdre/Iik82BGLDBZQCL691Fxi+pstOtpnEaZguTgVB5xZysrfo3pW2MBCdqBb
WUslUQRH9yNTCqvOxB3gUxHAUaD2YXZpsRaxU9m7l+NmEX/6909qk3x6fX1+1c2/+LtZCUYL
CNIhcQJR3m6zWAx9M0AyY4kWUjU1PJogsWP7IFSqNSNEPy/1Ek5c/w9S6sR8KOcy6HQeNIuI
pdRoMjWQeZIh9c5ZfU4yjCOyCHTwVdhMlC/z5cifyxiOCF3nT1gGW6RIMyaOeMM1BQqOPwiA
8s3TCEn8nG6CJdyZ4oVv8LtUq63bNItQ5WgcM+zMCz2akM5sml0Rp+Sc6Eqf48Wj334YROCg
dLfEnVsGIeJJgrEZ5AM2Jhp/zTFV0jdRyECR+SpsVVVDLC0wUyP0Q8VLtOr9dc9csXvD6zRZ
VsPTHf32kL+8fUJWCPgLnuPFstd2vNlO5+KhLPSjDMgqMjCNsjj4aLqbISVrUECXt0Xhqdf5
JPd7qXcY++SvdzDdMFml8lr82fw/XFRRvvhifMNRLUCLudV91G92jxpxl8XthO1ETntvKVaE
9pLpmG1xLLPYieXoBfbJvnO0CZduDwIXAnw85c2TOGSnBMu4j/1xkjxeq6T2DvIdO5aWgaJ0
XhtUJ2CwYpFOjooPMWyx3GMJK65aEqV0kBsU0URGoKyHcv/RIcTXguXcKeAUZlbRHNOT+u0E
AKjfeWzbq8pUv4SttozYfYbHMMAzzqGZwL6rm4MDia7Ocu7DSB2hZc12e7/bWObvjhGE2/VU
vIDTt1XdLmR3QlDZq4Z3wXXiusyngnAtIwSskbzSm6Ad7YJrT/2nJ2ibLz41UydenKpjl8xT
yVufbwB3um9HA1rHjes97sE4VBcFru654iGeVlw02ynR0d4tYlfs8XUtm6edruwprJsaPN+i
+Bx7PdCTO6unUE0x2sYcgQsdEQVw3DDowP0Iqbfx1eq6f9JW9Wxb1UIrQuYscM6T6cUmUD08
o6Ebzq5DjxY1Xt4MLakWOF4cvw1NS9le7VGWOctQHT1Ck2SELYKGxepDIqdfaLIekfNftrbG
5dL9gWpzpe9K3e9LdmsOG7dliB67N74L75o2rkrMyyI+5flVr2jjonFkhSydrd4cr3MOmPqY
QVjyNPdOdZqkNFXrIKy6YLcKxXoZOLB+oGW3gojcVTpLVsIT4S0soTxCX9E4Vi3PHHdCg8pY
KlUzQf0Su5dGhKwr91GqKha77TJkGRrfJLJwt1yurCppSri0DHdJIcpatFJx7u6cJyJ61v4Y
3N9jloxeQJdit2zGVI95tFndWeapWASbbeje6B9V153wywOBL772NbZ3adR5YYk4TWzFFkI0
aiksG0Z1rlhh75pR2O1OJqY80SiIozfA2LWao/o/xB7a6bjwtGB0HQvQkXPWbLb220odfbeK
ms1Emsey3e6OVWKXu+MlSbBcrm2VzyvxUK39vTocdYN8XGU1lUKTtrgtE+KUV9IOC5TP/3l6
W/Cvb+8/fv+iH/98++3px/PnxTsYsiH3xevL1+fFZzW1X77DP+32A8RK3Aj4P6Q7HaUZFyu4
zkOqZbzFwNBZZX1d+Nf359eFUp+UJvvj+fXpXWU3cQE5q33buQk8dytfjxAxk0j/ySEpLo/W
QmN+D2egDlmuTjpoyuFkkERHOxQdBjLLInhP2XZuHAa45w3J9qxgLeP2QHFWXGMpBDf9zhA2
qbyGY8lL61RfMx5roGWrRUDK/dU6zpqaov340mEc6Wy7/Bbv//3+vPiL6tp//m3x/vT9+W+L
KP6gBvRf7bEz6C3oG+vH2jDlVH0R1plmkDsgtOjo1SLSPhjOM7manpWHgxN2rKkiguiQDuR+
rKTsB/Cb166i4kNLjkMZOGlkGPi6CBJc/z0RcpJngkgeOBnfew8SejJ1hZWht6V6FfNa56Kf
6bRXelNeXFcxPH2xppFuJ+WNmsN+ZcToAoPQ+pbQvmjCGZl9Ek6Y3mBaXdpG/afngTdajpVg
k7Ir+V2Dms56tuqGyVcMXIDoajAWQf5UooxHSouxtuKOAJe5Qr8g1QXBr0JfAo590jwc2+bi
57ul/ZxBL6SdeOaQgHtBs4tMHm9yuPDw+s9IJnWi3YekvJp30+cqu/Mru7tZ2d0fqexutrIT
Ubu6RKvs/HpPiuTW2tHFuuru1g3utG1W6zP+0GjHPOV8OtrAeqWmHtnE4P5Re6Md3jMNbWuR
0nr05lAkFwfVcGDkOSKdM57tS9f03POMIoWZeHoJM3ecGlZyhVJDWPV0iNAh+TkIt9hXDt9r
VpMCudjm4BH86G+Dp1QcI3+dMMTugsLNRbHa+BKphRLYVGZ9Ar3HPJZKBFGMmJGVzvAPCffe
7fNSYLWeKT3ogR/vwyCZtkyH8TZNkvRA79ZepaVWk5bIrzX6AnzH84eJKNwoiYE4wLRRicV5
swp2gd/VqQ8mb1PdKyrNOcTS10F4Nd0eAA+FY3dIPZfBS39e3WTS+KRrfreKtmrZCUkOeKJ1
BkW4/QOoqJ8DSraHHWAHYT/E7krBHNMSm7Xf0qNMTlfvUWlfqkfUFF1OGuYxY9Pt3emnaLW7
+49XWwbZ7u7XHvkS3wc7v83Mnbefb5VPNmRfYLtcBlSputhCP9Vekeqcn+nU4yOtpXmq/Xg6
gGA6sKNZgTe2fQ2/cUJRKIzZx7WISXh43Jjav9g0wP7UVbVoVXeAGI+JkcF6wYPOwfYEbrld
xqhMp2/SAulJYGiJEE6+CFa79eIv6cuP54v681fMEKD0gQQiXDFHwY7VquXK8cicTXswsyXS
6CvWmaMYW3dUVcsipqAQtIEM5UC5DidKt0we9UsEMxg7RGiqRktJKM8gFgHyAN5NFck6NxQH
3CWIl1z2SkU7ER47BwJjQZVPJGS94AhYElG38oQXUNHbs+60uhTqqIV/ffZs1yPDWK8pNIQi
y+n37L2Peu+Z9x8vv/4OlglhQjGYhZLrRD32AUB/8JPBUAFo5M6dElT/nBRxWberqPQCQ3Uo
xyq6u8fvtUeBLf60+bms1W6Gt/21OpZoxJRVIhazSrovm3YkMBDVKT6x7QQOiTsdExmsAgpi
qf8oU8c2rjI5OgoOuEGjTr/Op9J754FFidJL8GFgTF1S3KpEzn5x7h1sluP7qn5ugyDwb1us
DlPfrvDVuuvMIo+o+axSb9XhnY5spwNRB257xmJ27Bqpta2Q3In2YY8+Yi7yXe0OkzpqEwpA
BxhDjOiNZGHClO7DkjKjQFaygGRQ92NZQA2OW6P0VJe120ya0hb77RZ1ZrQ+3tcli73pvl/j
s3wf5dBz+CIHhhqUEVGjXvJDWazIxLBa7w+5/fKq/omqQyZmAK4IqPQpuJCxXcCZxWmWAvMy
s74Zww7trYrAjIDNRnVtEjM1H7zxiSV95ienhn38M5x1Khy0whY53xbZH4gF2pKpCZmMP578
OLcJ0ysEUstjkgkXsqMjtRKfUAMbH0cDGx/QI/tmyeAVKmf78EY18onGYnXm5QGwavmw9+Jl
aiCkHefFBYrgaGUau3ukAc/Lbq1tcQcEMmaUhYS9QA0F4olAK70kP2WJ45exT8KbZU9+0c5b
diNrSltUYOcpAPITQhP9JWiaUspqpR1c0Y0S0KgBQMSZpimhToIXY5oTuyAwq0ftiEPy9dSm
RQ6cFaqw5OdQVbpkmkvN7FHAzx1pk9NHLsUJUfnS/Pwx2N7YgMxDc85AR4MPrU+GaDL7qyNv
7o5x2PrLoSUAthhyN1djZbkmVZ5jIQBoDW8tYJJbm2KublTnxC4Jd+tyc4Hg2/CuadBBql0h
nJmA45AAeenLLQnYwQO+Eyk6MYR4Q31CKn+aQyW3pkqmGNQ3BOx0mgdLfIXiB3xwfMxvDMne
4drevc+bNUTZUUMqP5MzO4fjJGGSOVcVoXk3LNhsyezEwwFvDfFwxRMsIziFyCZsiXE/ChA6
hN1AiCEZk8rUsaF0Vv88a9S8xFdRxbvTthKKKy6z7PRyozw8qt259CC227tAfYtD/zyIX7bb
dUOY872US3/LUnW/V2PmD3wJWDzo5M+vLtIS/A6WRNenCcuKG9kVTHaZjd1qSHiXi+1qG944
N6h/JrX3/qUIiclwblBITDe5uixKzxcvvaG3FG6dNADS/09T2K52S2TbYw21F3Ter8RcCR/8
YeOnXPkGH6RWZ6UsO3qjfn4oppaFrIr+QE3LBw9o59hSi7jKqLyxdxk0cZXtgRfuY0tHprbn
I94G1wQgEVJ+4wRfJYWAZ8ocd4Ty5n5qrhkcB72MrRri6vUxIw+mKs0mKVqK/YgiO9sFOYHP
T+4c10xUPKW51PnN/qtjF1dks1zfmKJ1AnYlR6/fBqsdAZsLLFni87feBpvdrcwKuF92loMj
uZPV7Izd8tnpAfRqja6PfXydnRWoHYRrsf1lYj87aTPKjNWp+uM+SUgYzxUdkEaiW5YopeIy
d4GMduFyhV0qOV+5rcjFbokHrCpWsLsxCEQunHEj8mgXUAhyeoXSEqqg+NJQ8SigiqOy2gVE
4pq5vrWriDKC6PHG9aJQCzsjrg+AB0G9yY21QUi95zrJyhzOZrcHzck9pLCquuYJ8cIXDEwC
uS4CnNuC2HI59ra2XYhrUVbCfbQEvACa7LbtSCbHkwt4ZCg3vnK/4H1QHb2IWTKkWiwB51Fp
dAAQLgjg804G53km6Wm5z+7WqX62tTqMETc6inuGRxe5xLxWrGQv/JfCfXfCUNrLHTUfBoHV
LSOscYO2E+8co1kz096dTJap/rw5CBpe45c6wAgJwIc0jvHxqpTeChs/0O+T91o00UdhARoT
VYK/YKe/gPvoDnzS/Q44p4JT7WJkuNwz9JWbvjhtfmqmhQTqXNadBERJzmTeSekYy/YQhNTd
vC2bw8s6BJS4I9g9QdAQt75a+IalRMvw6nG9DPD7ul5gu9wQkawgkJcNIyzshi+iSB12OHHN
DCLmAErz1YK6JgJugd3ZpmkB+ibKsKsIxcg8Xp0XKsVFUZxjXhK3suaHA0BhHZ21w8TJcL4A
+gTCYTxIxOBPdMRv/eGCjeR192K0gDmi7EmBATyI5muHzhn+9n6e30bXQ6EGLCnSXTvNpXG3
DtbL2UKst9uAFIh4BDihJNuY50k+bGVzBYwrOCWHs3wZbQO6gP/H2JW0N24j7b/Sx5lDJiIp
LjrkQJGUxDY3E5BF+6LHk/ZM/ExvT7dnvuTffyiAC5Yqyod0LNRL7EsVUIvMYZus06P4Bn1n
06e9uxwKOYkMKSrrqpVRURZYwyV9JCEVKJJyb+N5GY0ZOEkbb9lu0r3NkcaobXVYyUVe+qyS
W2W1fRPB6QGcr3FIRCNj76V0TZpBlPAxFVwzvZxSnmwCmny/WoNRCFyhS7mNpk8OlCkAMPY0
kRfeZsAFTlB5EAxKmdGFP5S8YKwg6SMHdBS7rd/Dv7hcUxHhtroOT2fWB3LbPn37+fbLz9dP
Lx/ObD/bwQDq5eXTGPMAKFP0h/TT8/e3lx+uhc7FEgqnsAvXS44dRQBftGBqJdBjNG4oqYif
K57iBTV0rqrQTGs90odO0hQHEOr0XoqQprcNgtSz0ritBZe7hMunri9ZHWJ2fXqmy70+Rlxc
fyPUPjUjJBi0+XYFI+pu/nWCbvyop3MC//SYpwwnSTagaMwX5pGp79PHzPWqW8jwHB8urxBh
429uNJK/QxiPny8vH97+mFAI43Kh1P9quDTF3+HFwtjS6nFSgZIRXKJUYkSiWSyHFstRkfDB
kHbEz2u3N0MfjSaF3//7RprTlU131gNZwk9g/piddjiA34XK8OKgKBC6BhweGJbOQFBxZu9w
nxgKUqeCyRzulA/U2R3h5+evnz68fhW7y7+eDYeg40ctRHbHSpwoEJkEDS9owZg4RYvmOvzm
bfztOubxtzhKTMjH9hGtRfFARSea6Na2pY0TFY5EfXlXPO5b5ZZ6znNKE5tnF4ZJgrTaguyW
EVwo/G6fI+n3ghUy7a8NEmqArSF8L9K0/mdCVnUsFjyB3nczMR/DTvVREq7lXt1Bld3Mi24X
6M/OM0F6/sGT5SQusA7gWRptvQinJFsvQWqgZjXauKpOAh97bDcQQYB+LDasOAixi+oFojto
WFK73vM9dBRZ8yD4k0tPxSqdgWWNLaiZ3BQXbr6WLR0F7pvWM4dIZfAIil/TzLBOcKQJbru4
NMj2TrcMdFvlhxJu7cEDOEOGlPH2kl50xRqNJCNBZGmD5CwKxOciO6mvkAzLexb5+CQBr234
rcTSp7V/5e05O90ctwFW9lqHAY9/LbAqZmkHjDs6qPsMP86WOcfv5HitbIRyj12hiw0WAncS
ehASIsNUYi9LIxm6SO3gmiHIkgg24F3Rj166F9ZdQ6R5nMT4JZIB68UZ4tmm/jhU+uqoB5xb
MJBnsTOVQ1Zi/vF14P7sC5E1oNogyT62cegoEIMg0EmZNUngJXiHZY9JxuvU226owhTi6HnY
2WACOWed4wwCgeAOFFzg1jb5QRDKtzpaWp7uNgG+8AzYY5OKeXMTd0rrjp1wzX0dVxQ6d2xQ
jmmVavZeLg0cukCsbRwyZMFGN7vTiYtOHEI8tm1unmBGw8q8KDCmTgcJ0VVMOjIPef18IwsW
scc48vD6H8/NU0G0+44ffM+PqXEu8EcWE9LieV9SuDS7gO0c1TQFuT1nxXHueQmdjzjLwQD8
Vi4187wt1VSx0xzAirjsMDHSQMofeKMhnNK5unKWkcPZFAOqhWkUcRd7PpWD4ACcoB7YwORC
FuHhsImoJvcp6/ZF3z925RVVnjKqVB7bHm+0/LsvjyeOrxH590Wa0uINcjZufLbkXF42354v
F8EZegPVbCGCSkfTLSuJuMxGu61ouFT7SsHCk8cKZ9uEeBs0YZncpm5ND4HzN5vBdoHlILZr
xBgfrL6+ckaNFCurgogNbsLYO0aJcc8PfKrLGK8PRMBdA2a/CmGYIYnCLTE3OxaFm5g4Op4K
Hvl+gH/6JJWxyMXVnuqRncCkGGNLuGeG+u/I85WmvoZKTRIwRx6ubWPxswZKsGLe1slRpcpz
/YtFkYyW4GKtrU1R94KLkaKtKZwHw0Y0kHPdDm286KhB9rg+lHsZj8RtxSSeIPKU2QdCjouj
XQC6Fty07x8BtRAtQ2znV3Qpsu7FGVz0dqskKS+yNidosvpukSkvZVQdXuCKMfMFBOvSZkSS
9bsb+MedW0bXXopeCMdrPP9jIe8kVxBZ7W0wVlZRwZq4kuFixs51Rqkv+BlGSA0yLTrAEvK9
ZIG6DTrL/5FZdNkh3ERBICbGGZkt2SGx7E1N+qUmxhgoahjdxt0lm3BNntdmQt/ytH8E54At
9cSs0MAXR8GNxalOp6t5BzCt0KEKtvR9nNgp/GiHtCar0wDngMaK9Q9+JLYNNdTOzaQkR6FG
thsmAfEEWOkCqW8g5+96x4ozKJ72iDUYh73Cc7t0eZeqy62jF64eap5/fJKxuspf2w+2Fy84
ZrVnffgJ/5qeblVyl/bGpYVKhZjHd3pEqRGclR3z7dSq3EOqlXGfXpxclQEwkoVIAoUPOw+w
alVZL69WitBBkfizlgS0oC6cdgyTT8b+gMMVz13dBTLMcves+nbxmJfWMiqzvitMadeGhWGC
VnKGVNjKn6lFffY2d55b3PVQTyLDaBmPzYfFFSBy+a8eO/54/vH8OzzgOWG3ODfe1B+wDe7c
lMNO7I38UVt1yjsSmTh67PXD2Q9LlUsHgmdwM5zm0xMAe/nx+vzZdQiuRF3ljDrTj+eRkPj6
ca4livOw6wsZP2mKloPjvCgMN+n1IRVJ6obQmB8T7ADveJiZiA7KlJsGvCDDLaJOKIa0p4ol
NigdUkuxEXUwpKGa/nqWkam2GLUXg1TWxQxBCyoGXjR5QfiX0YBKB+76cLYUqbBRupg6SXqP
s4rqlRxXpDRaxP0kIdR2NVhLhd7RQWJ38RLK25k+EjwK4/gmbAoCdxNYNkfCJNesHSOmdl3m
OGEK822XCrHUEP9bygv1t6+/wMciRS5VqSqA+KQZs4IzRWS28Qi9aguFW0Jbq18GBwTNEDvw
tZMtCAFrgOkxag0zPiqsQVSoP56d10DWI4pNhkVSUeL7VJWTYDIIh5IKcWIr4VGmRhv3pFqi
tm/Z+X5khCc2RZYWIDBJV2tfHkpK1V0hKlD+u1/NI8saQudmRnhRyeL1ZSo2uX3R5ynhDGdE
jbqEqzNMMTcfeXq0dzkCegsGxku3MPXAxMl5AzQqEHXsdnaC67kJElzZGrknzD5HMlhsV92t
MiSqbA5VMdyCZmBKISPUlscyEzzE6jYqo7+u1h9OzycvCFdz6Sg3qFMpNeF2Zirkodifb/Z0
e1nds8S0XS2jrPZFCgIqs9W459BjBo9lbQR1xvtqei+3M1dhoJuc8tnVXI/ERtG0Ty1lkwnB
MTjHZSEZcVZsHcS1wOkhu+bZ6siCIocTFHVhd5VnU4yjkwQzEm7VTXskml3XUdofoxct5ONJ
NhRCoZBFm7zSLcNkqozOnqc8tdPBa7x60EYpjPelaUomicqEQemjHfBwvhKnq3mpBLGBW0mX
lGenvHULkeJye8A8j0j6XcauezMO1cgtAkVC9mgYq6aTCtwGDMllz9FM9Eru39MTp4sQaZtc
VwWck+AUAblQxaRZpuRMl+9c1745+ug9xgIcPS7imdQDZEF4hZhhto9TBOJsTw7Cipu1EGYX
Pe4n/A5LVv5RsaxgALF0uF7kYlNHixd7ku7gPO06cLBRT1Lj6JHyd0SuXXaDxyaT2kWEKAU+
ruu0uW7xS6eFvLUcffb+FmcRym5Sf0W3YbLSSw5igtYFFnYCghuqYOWalU86qHQI0AuCtp4N
6S2KZ+K/DitD8A/VoxFrYEqRUYqQ5Pag3024twzaDde4gPqzOJmzDjMQNCDgjl0Fup+GHB5j
XI1GPXa6+HGV6igQNMzYoAQBXssIR0SSfBLfmVu5RgXjqinY238/v71+//zyp2gmVEnGBEWk
Ifgs7ffqkknkXlVFg/oNGPN3QtUt6fWZmG4jouLZNthEK3l3WboLt3pcGYPwJ1ZuVzbAGKyW
bJl4adS80PLAsq+rIeuqHF0oq31sZnUqKvCxDrdKRE1Yrab0PInSz//+9uP17Y8vP415JNj1
Y7svuTmfILHLDlhiaoThMDOeC5vv6yAa+zJNxk3sg6icSP/j2883LdyoexmmCi29MAjteS2T
I1xReaYPK/Q6j0Nq7oyOF+0yR9dGxEelurLUU5jpcxLSurIc0OcQQWvkq6RvdrpyJCGWw9nO
ipUsDHfYC/dIjYKNPQXBED1CHykEUVndmgmdDGi+7ER//Xx7+fLhn2L0pkDIf/sihvHzXx9e
vvzz5RMYUfw6on759vUXiJD8d2d/kAIi1feSr7EmHt95bsqVVeBNuRjESijBVUjqrLh0GEqq
ICH0+omYWF+sxNlo1Eq+a5vUAoODfr63Cx09CBLFZnCAjJuevnHM0U6N3YSVxwYCIDgKZBZZ
dgW5J80wzXc9AXCqMEmdZocUB8FimchCcH/WLlLUxYNv11pxTLj8CXTSKlctweOpSm1rUX3N
1UdrEdaDvXCA06w6XMtB0tvOUK6GtI9P2zjZ2DndFbWzmWvkqst8TOCSh4HJgsokHoV2uTWP
I98+wR6irRFoRCYOzNo42jrNyzu7+0e5gqxzS6soSzJh6QCki7P+xGmxHuBAgmqxjKhMu8Zq
ZzekToKa/vbgqMhuqHnUTIarPLvSfYleQUvSXeDMJhZk/hbVA5XU07UWx2tVmJVmZc31aGkq
rbcOXLiHsVK4s6ODsHOgjhRFjd2PzgGh1CTJ5yYSoq1/wSUtCXls7s9ClKTWoXPjPide911N
jfb0UmDXd0q/Eg7m4KwqepbyEr9zEPRLzc3uHq3OrenlenGQqRXVzqHqdmYIbzlPMtMfpLLc
+lPICF+fP8NB+qvigJ5H+0KU85mCt1p58xRU2R/cB4v27Q/FOI6Za4e0mfHIg5oNHzXkwYt6
U1Q2j4fyc+ZEO++t6YytyfHIVnHzqKFUUT9If3ELBBjSGxDnQkxrlNOOQI9NCJFcRApEDOK6
+Jlf9GRdQka9abDOdNoGv681q6UiFYhK2EWFfiV1klG6FvFO6UewUuOcf06stUz+/AqB/JYh
hwxAzluGp+uMZ1/xk4xL2PBuhCvevWNTAa5UCvlkVQlO2+7klZFdyEiUL+LEveIMGmc/dl25
gMbb27lq/375+vLj+e3bD1fo4J2o+Lff/4MJrYJ49cIkEdm2mWtdOJpcKn8SH8Buryn4pe2l
Qba8HGM8rTuIC6HZXj5/+vQKFpliwcuCf/6DLhIeQ/C7E6facy+MMuY8T8BHRg9+pBXheuzb
c6fxBCLdcJai4UEwPZzFZ6bWAOQk/sKLMAhqrS1VWpo5ViZlQewT/jIniGDpxXASsQkmUI1z
WxN9X3tJgp3FEyBPE1BNOHc5Vs21h+8JU2edH7ANZoM4QSZ7e7MrJeUp9dBUH0ttPKySEBEI
PeZmwOCFmwH9lNeH9dYhT/AORurfrZTfZkXVcqx868XHmSSj6IdMH3nZfcTYHBsTrmWA+3yc
Zw+IhB76pGxAArQMdQtOii8TbHSqUqO2uxOoYVgJDeuc/B2Ib/pE0r9FCfuiFyyPmw5LdkPB
r/vjNuMu1ZK2tOSkRsMK64CG/JRwHaBD7tc6Rck8WPZCevDD9SUBkHhtsMRpjnSf8rukMwgG
KVnf6BC/Ti6CKkCSqCgvCybaeGu7mGhWEummzTphFyFzo87rXeSF+BeDHunLyMqLsJGRpBi7
ojMQuy35MeHh1cSs9cB9xrYbpNZSdJSMHDBxFJ3tRzq2EWext3pOsbyOsC4W6ck2xAZdtMYL
cZlOg/ioxv0MmL1yWoTxmQtpiaKAptJq0QuM8EU2VwHE6RtHsMBENzGna3fA5HgTYBnMa0Rg
iAgqfKfutrAdRRD7JI2DdL2hEy5GXcC6qNXC4i1+1e3i3lsp/ILOxcXrU24BppjLVBe2R/ij
hZptVnshXlvNC2q3mgnqjdVFrdVztz5Yu3cO1m6N31lQIbJPaFSUiVzo0TsHUOzs7wW+c+7s
3jt3dqtb5QLbrXbEDuXagM5Osb/BTL1sULTFC5C0HUkLUnLaCmqMOtR1QOSUktR31D720aNy
ohJG4TYsxPV9bVhyew5I2PoRrWDEM968V3fghCLbJdHq0QY3ochGr65PfWTwRhI2ruO16jYi
SeRXJ7FVE6JZ4NedZ/avBZpuVbFkz0cmp7pxHc5sj9DKa9nKMNwuBzNfxCI1nS9jq3x9ysxA
IRit7WQzjlV54tZTzwZdwgtgQK1akIpH+xstIxS0EaS/vonplTPmsVKrePn0+sxf/vPh++vX
399+IAYhRdlwU/lo5l+JxOsDMs8hvW4NhWid1KV9yTCSH2/Q80O+S61tOhKALIKaJ56Un5F0
P8ar4KENiuIIEzVE+g7NR9QHzSfx4gBPT/D0kBBYeBTsrN1x0uyghtnOvWqzU5Me094tuLg/
l1W57w39NOBPDYOSMeF6SBnvwH9gVdYl/y30/AnRHiyudvqk7O/tQCjqXo+4cpAqPuyRHZiZ
13RNOF3M1i9fvv3468OX5+/fXz59kJkhHunkl/GWjkItAUp1wCrPVhnQEq/MVvBVRH4i3N0o
o1HNu0IxYI9Vyjh50gr4y0kejmzUI/hi5T0qDVB5LuEHjVTEl5gyglZqA3RT8kvakYUV5fjG
+MVMrp0OA5MtKpcDh/9tvI3z1XxfjDwBG7jeVIiQiafqYldMxZrXU2S0kIfM6q7xGtdNBXsR
K4d6n0QsHpy610XzJDYkqsp1J63g3c/kez351WBXVT3bm3l01YbgtRUZHo6moaNKgmdysyR4
k7ST8tQpnKV1Gua+2HbaPW7mo2C0jYuiQ7y/DFeUU4DOdPGnEnknPRev7DaZaaMuk2nnawvZ
I1hNhaCdfCj6+FZM1Utjl/TkhyEJQ6eRlyzfBYQqrQQ47s4d4pXtrWk8vlvbPTNU5O71ZK8P
8Fd+kC4ktHOL3LpnlTCZ+vLn9+evnwzGReWp/DValU3zprPPjMsVnqSd5QTeAFE95YXs2w0Z
U+FAsyhS7zOw8WPqiLcWm3RgQA4878rMT7yNlaOYT7sxpp/23mz1lDocD/mNHuzLJ0PzTJ0i
ebwJfbtfRaqX+Il9HuW7MPbqy4OF/pg2T1fOKytZ6TTZ+2wX7LaBk5jEoc6DjV2ifEpgyUnk
7piSsEMVaBT9vh6SyMptdBPkJoZGryO9O6qglm6vWyyC0gElz36eYLt/NewxU5CF6DtLtK7E
uYaFrxnn38mZrUJug7AHnt0poK2uSP7WIvW5OPtG/mFWy3f6wJx4x6PYvkcnMEaF2+zurK3f
izdxet4v//c66ojUzz/fjMl88UaVCek5tNXGbqHkzN8mRg9pXw3YZa7+rXfR/VjPBJPZXdLZ
sdS7A6m73ib2+fl/L2ZzlC4LhAGujcaodAbWMm4yNHETUoTEqKhOAFfV+T7N7giEF1CfRkRh
PvFFsgmJrIINkVXgUV8E1BeBYA4y6qsE/yrcDDhBaWaiBKJmSbHZWvNMo3m4FGdOhVk+Awuw
a/qgSUFK87DTNG5mD/xlm7d1Wmqan+r7vmCF/p66JI66EzgNpAlTBLGpoKCMEsc41pMBmyHR
6jDyPdsCwZ8cd4CgQ8F+iypLKQ6oHzfLlJr0a/Z3Orjimb8LfapgEN194pZRg72vhZJDo0qa
rL9ulqVY3XfC3tsNva2LqhOftNXVF2CJJLb6XLegV2XptC9EraSHIEydDOy88NzV9+zcddUj
nqquIwja6VLr7lI6iBoDdG3HUM6bYBM9d8biVwQJx84YyVbMuc2fcTEb3I9mMqjcQWQhYIEt
eW5E7FMuDqLHa5rxZLcNtUU8UbKLv/FCNx22tsiQt3UK+lpiADw8S/PsnShsTxgSjg206CNV
RXCV1GUIpiz39zA/BrcWI8E0cLOJp/yeJub8ehaDLwbHjh4wtxQ84K51EfgsjZX5I07x3eIl
xTc9V04dNLlIQ4qcIOLzRNRK7/6JBFw2eg8xAewbriVPOQIrX1Y8iEJtLmi18bZhHC8dMFHy
ghcZb0dIFEYuZHL8h1dpIFQuJoRSnaj3e7dWYoS3Xoj2sCTtcAFex/jo64qOiPW7aY0QJvrj
4jz1632wjbFRU84p0afkacoc0/OxUCfTFlmQkyd3bAr3PNyszqeeiw0ldAdHanmf2b7LXRps
2gEyG84Z8zYbH+mWWQh1Ozvf7XZoVBdrn5Y/rw+64x6VNCqBqwtp5ZDn+e31f2gYNlY0rO0Z
eMncelihBiDRe3Sh1ODbfPVbQGizwyRoK8EkGD4iDRIaRFZHeHFM1HXno1ojC4LHg7fB6spF
D2zwXIG0XiWBiHzyY+I538RQjkdGDCgdrlWBZdIeym3YUF4PaQOOJ4R0WaF9Ds6UMlxJf87e
fEmY0/nQIYXuIa7YA8c6ZCRd00oUS/k0U9CcRcQb4oLwrEtlB1KGd+BcaqVtB9A4Cw9YZYGU
+AfK9dMECoM4xI76CXE0XWfPH3Ihb585HMlrH1ehl+iKlBrB3/w/Y9fS3LbNtfffr/B08U27
6AzvpBZdUCQlsSYohqBkORuN6zipp0mccZyZ9t+/OABIAsQBmE1infMQ99sBzoUSrNx7dgjC
zDsVfoAkyB8t8tbkHOpD4ofo7Ki3JEc9FCiArrqYadZDlprUP4sowNqKHSd7P1gZDk3dVjlq
VD8hlGdE83O+47jnocCk1lAPGg7d5RQE27V9c3UERuAj6ylnBEjHcUYUW5JKkOVOMJCZC8eX
xEtirA84zxJSVcMk2EFGRWyQnmf00E9DpLCMk6BrG2eEG7PenBGhCzJnWdRBNcwGOxHphd1g
hS260AuQbh0K4bDbzK1qd4G/JYXY4N3DiiTY6WZmpyE6skmK2SUobKRDGDXDqJmHDQ6IXOTM
IsNGNMlSZNSSDbrUMDqmxaKwQzSxOAgjLG/GiLD5xxnoDOiKLA1RbSoVEQVIa7ZDIa5Ea6rd
HE/8YmDzBqkAMNIUmdyMwSRadLUE1sbDlZAmjGnvvETQPAyQIX4simuX6aKowsO6jr8WbVBF
VyKCZy8/wMlw+AtSZCRtISDqrjJbiW0/12K36yjCaml36q91RzuKtWLdh3HgPPoyBDc1MDe3
vqNxpEf3mHi0STI/tLkHHQdhwERj/GVW22NQzV4FEWY+MnbkMh9ZOImHr7aBZ1ugGSdGaytW
SjSYmwqJoghPOEsyZBXqLhXbijxkle3AMiFAl37Gi8PEot8ygk5FucEdQKmIwEMXwUvZVX7g
WqTeN6zYSLnBq/tOD506slSlG2OHWGDpYcBODoyMbUmMHP6Lkguk/6VbFayIJanY1u3aMCtS
+JF+j6OwAt/DL5kVTAJXfq6qE1pEKUEH4cjb2JwzqrCtoay2hBWHOAl+AhNiRjoTYhioZc5Q
QhKLrvi8EBZ+kJWZjzsan2E0zQLXEpGzls308IDz+pgHaLAFFaDqDSn0MMAObEORokeg4UAK
1P5mApDOx7c6znEPHg5xtQEDWNZq4Dh3AAaIfXRYn+s8yRKbp06JGfzAebNwHrIgRDvnLgvT
NHRLpoDJfEwVSkVs/NKWwSZY/Tg0e5nT0fOT4MBCB5qb7qQbtmkMyBFAsBLVGEthsXl52Nk4
FcoaAysh9FgNnwaHt1yxK5cENpHzoaZ6CIqRV5Gq31ctuMCXD1FXrlh+JfQPbwkebwDnhxTJ
OOLePUb2XV/zSIjXoWdnGSe0rHb5qRmu++MZwpd317uaohHqEPwur3u2N+R9hZVRRUK0BAgA
jPp6Gj9YT/JnCwm4bd7u+T+2hPAyoVD5cN00xwK0PPDLc+6dQH6FlK2szru+emcfNRWBSDW1
euU7skDPV60GDz9izwq8NhnZCMPiia4GGg0dadGuynszNXpqs9okT4/3SDagVenIiLPZzAiV
VOci1v3t3fFYYt9PoPI4KpmgGeSMXuZY6jygTeD4FPT+5+9kfOa3p8/gveL1ixacgjNzuDut
2yGMvAuCmdQk3Lg5ageWFU9n+/ry8OHx5QuSiSy6VGwwuwp0r1uK02mvdaAshzUzXpTh6d+H
76ys399ef3zhXk+sZRrqKz0WWE8MrmENDrXQ0cED5DqHBiBi1+Ts8zQOtLRlpderJYKUPHz5
/uPrJ1dn2yBTq7C16qi0u3jJ4T4NWSk+vT44GpTbLrE2FSpW/+l08CKF9aczbZ77ux8Pn1mH
O4YXf4QcYIdUG8363dwj7y/BJkmdncat1ex9pjiaXlDGcAaz2sLIaI93+f0RjdE1YYTHbe5f
9lq1sI2WSBYQopo7tGGpsY3bzIqbe6j58Ba9e3h7/PvDy6eb7vXp7fnL08uPt5v9C2ubry/6
Q92UTtdXMhvYiuwJGqHi53Y87oYpPbSl5fOkGwSrJJsj65h4HZOEP4FZyUsosroQ8z3qGuy9
l2zcID47L26M1I5ZxcSeGyPDNDgx7+u6By08J4i/43UQAm4dtqX5Kgr2zxBcrbuBlGyCZKWO
4MOoJ3Btso6jOdms5ClsMSI3SFoMuUG74a4cPH+lWNKV4coovnPzq24TrjUm7FxuRNdeIs9b
nbzc+skNYgfBfljB9G08JP5Kbux0eFlJZ3Ta706HCdMhqCr1w8ocFmYpa5g0WMsRHnpW+0To
7QQr2bEDdwDhfG3M9NR0Vj6PSukuxPGS98MygbHh6n4HRywsGAMdwL5rpan4wcEJ4Tu/rfjc
Zet1f9lu15ZewK1A2CFlqG5XxvfofPcnVrq1/UDaxK2tS01O05W5UrUVzamjkwW/f5/bINI2
c2WWiOiRTtBkXI2hxvIMpe8rK602auAw5m6Rpiap7/nW6tIihjljmxFJ6HkV3VoBwtrG3pjC
bsPKZ3JNxBccOx/clbn43ITVBUi9MHNM+X1XFvYp00Hz2NuHuzJOHHx2Hs0De+ufSIP232jl
8/tfD9+fPsznyeLh9YN2jISYn4X7bFMOHepEmLJu7Y6U1lstAqLqagEgFHyd6iSWHkR0w78e
udo4ZWT+BVv+LCURUTLgYx7hDE9aB6E83VyGdX+OpAVkRTsWQKJCRW1BT3xNnXFi4PXi/LnM
ixQlg9Sql0tR4B1bxg4LYjsS9ezHapO8uBYEe3TSYGbrjErpc5iMjz++PoLnzzEmqSFfkl25
CE4HlEkN/ItKFYFc911eFgs4DVPfN2mB9n4gvMyCFSbqZYZ/lA9BlnpYicDL/onmalxdQYeY
4xC9DGLTKLnNzENTlFiXzgi2Y6mdAQzWnvHGQx/rOXsyZFx8l1+6wLtY4tbzxpbOjcvK+JZA
sBVMiYy3HNcVvyy/kUKjTTlqguBvWyM7wR5QJ2aIZOqjj0fAlO7Vmi5XY2MCZ8+OGeCr1lDP
45Uv/FCq21sSJl2Q6CqsnHphefW5tYfZITFmJ1MYs9pgPtRJxFZz3WueZMTxZWTMV8IDuMGm
dYG/fAGbFX3hgn8+8Fxrbs6sEKhqTgkZ1+9oohoQA40bxhbkWKo+CYAhTWM1cJZ1JNOfyWey
fQBwfuLZhvqkgW+MVnFIt6YrANZxItiqOe1M3RhDjtMzi2s5Ccg2Hv5EPPEDeysIewDsQX3m
Znp7g6mWquo30jbpok7jNYkOBRFEp4zWGTN1CmmvrbkTVd8DeBJk6QuCr9yjg0hL9UabXL18
XLN/OZr6Ih5iVPGMc28zb9FKUqBdbCVVYcQR4fQ6SpOL3eE6x5AYVUvgvNv7jI3WwGgAYnHz
nW8vseetZMikZOw1TO6JEJ+gL4hea+keYlEMJvznJAzZ8jLQwr5mTSbu2sdgfZNhj+oy5Yac
lvl1eUNyTNUZbEJ8L9a8NAg7EdT6XbDSy7JIgp5hShczW1ctnOjB0rR1URtW29C2Jkm+ZvGv
JJwhVGHvv6RufLxwG9+9pzIQW2lDXBF+uGsiL3QMKgZIvMgEKBncNX6QhsZFOx8HJIxD+0K4
EmeXQ4owzjbWxhVeDrTGGt2HqMUw/UPxA5B0EoERdQVGfhqiUdrozgB57Unse7jm0MhGx6lg
wjpupmix9pLMyFss5EslhZlm1mLy9mDQJNYsCmYaJNaauygzVuLjgQiPGqruj8rRPXDo3wSL
BZm792Pzx4iLMDM5CzWl5BB+HWIkuluUTTqX0Zy4uGSS6Zak2sNDvaqyO5GWdrczY1dfIO79
sRnyfYUBIODnSUQxpidSoamDygLXWFBRynXSiGNHpn2GBi/TMPI0ZrBAvMqSGE97lL0sN1oT
rIxDdEArkJb916EFEHKWpQBcmnOnbAh3M0+OxpXiy5H5MyhUCFMxiCg2s6W8tZKRkHOc+TBI
4FuajPPwzUAZoXkbh7FFEpthVi8HM0TILs7SCsg5DtEBKGQcvP9q2mxCi7igoZIg9TFpdQax
nSpRXRwpHHPzUJjs+JP6eEtzHiatqpAsDfBc4cwQ49WW5wl3ymLjxFoUWEmaYCxFgEJ5cZbg
deW62BGmDrrAJGgnc5klDizZcnEGbYlRMFsZAaOk9jOwzHN3mQAFCVrWovPZKRKvRxdHPt7o
XZbFG0sFGW9l8Sbdu3SjWmIoLCbh+ZbR6XDeoYPitZXP9OBpQLptnVOs7pMYifF2p/eV76E1
685Z5uFjibMyy+rHmRaTdwV1h7vlnxH8xavvCOaBaoHioayQcgr5E2MspVCFNcq5BocGpMt1
NWWdSVcXfRqTLE3cHTlZu2PfS4F2LZtmz07MqBGFAuJnu+3xuAwXtoSc+2q3PeEqsEtsd4e5
dVBR4rSINa84617PRL0aUfis6l6So5/eZ1kQoYs82Jz4iRoSVOMZYq/ODXBjMx3EVqPQkvUo
Jlt4G3TicZ4fWg5Uo1C70h2jlLte+o2PznHTc6RyeAbtcYwxeb9DSiREIGd5Jslr/rywicXF
eGf0n0ppj0O900rNH7Q5D/zxHNUXA56EOBBqriIqGQT1muNHrxmw94PchbKe3nh5REwTtihg
rjA5YlCWNUEQvuK1dOxORk/waHdqaJUB0Arp87qlh7w83llhohVlCxrvmfvXh29/Pz8ikffO
+xxCCc5tLgmwx0PoaPqHn0zXSlwLAl7dVIlXpTKxrq/u8kbXs77W3elsXo6UvRmJEoLBCDlT
VwxWyP83fy6UpEG7v5IO7vhHu9eHL083f/34+PHpVeoBai+3O8zZASHdtayp5sR6pI2+IZql
wyZZPDRDoZD88PjP5+dPf7/d/P9NU5SjDG10A+NdiyanEE7xXKtenIFjBl+G6jb1/jBYvpr5
s0vt+fVyYto2+RkhnrFWQEL3pamwx5QZtbyimTl5CUc8Dy8jZ1ochCg1sXtKUpKScjTSjFz2
8XKsdJy1QTldFsdojbCLbaUcNpFd6Tb9uXjO8hwHXtpoXshm7rZk+yV+T6vk3heXokXfq+ds
ZDS9UdV9ZRiPOGOdURQRjqe2NOb7oS6xsJpAXkJ5MFkcLuJ7l+jcXH6mWCvU9GBNsR2qhknN
B3u6eBIjW8tSWcqPh6K+NvUwNNW1atmarZi3AH/eA7UdgPUHGC9ZdJkY4NR0tRmyVgGwP1ub
P37gs1HBKpvT66EoF7lbvhB6FbzVAARVXRp+AL37+7/vz48Pn2+ah/+0gMVTFu2x4wleiqo+
Wysg/GLbqjjkh/NxWVjte3h57g73Vr7Yx1wIaGOUCSHeU8/8Vo4FRyssqpiXe4v/yuG+cx0Q
jmw40bt6WAaDnTYy9O2qImCVd6vcA0vKQjWF+/Kmb8+P/yAaKeMnp5bmuwrcOJ6I/ggCekzX
7TJA7sQVrNHCQ83s8PL97aaYghUryvzLzNmhkoDJoPrgNfL+ZAJNz86CYYY+oYywPt4ESEv0
FUSOuOWjfeK21R1MSUVhAn6JvRijXYUG0ReNs+1hqW0rxj7cgf+zds9XXd4MsJkiU4V/yLYx
P7AI8ALQhl4Qb7DbPsHv60qzGBJUGia2i2wBAANzbIcV1SkIE+OyRfU5NV5S+ZuYhxEDk7jw
UzORNwHWnxPbU718c6q47lHHCCcLJ+7YjRdn6zuxSB4efCOEGAeLLJuOHRDggZwQPfrAxEUv
hmduiCSYBEhKGf7KPnIXx6u54pYQphMgsZz+OEC+sIGB7wl7f5pAqp0wJ07qUVp+d8So2SR8
WsddGQgnL1qNhzDemF09FDlI/LakhqZg0raujyFGDnJ5uhy68b/GZ8chsMSGEKmOiia2ZG+H
Mkg2Zm/XNPR3Teijb8IqQjgfWCwoNx9fXm/++vz89Z9f/d/45tTvtzfy9P4D/Lnf0G9Pj89s
s4JTjFyFbn5lP67DoW735DdFcOFd0NTtLTGqbzoi1jobtJyWCwNpLqzDF0R45jO7kmtQyJll
7VDkAkkUbU9CX3eEOLXS8Pr86ZO2zYi02HK9r/rl+i7J4g12MQpH3pEt8ofjYNZB8smAxybX
QIcq74dtlWP2DRpwOsVb8yu601oieTHU53q4Nzp1BFhvTjTUaPSudxFv6udvbw9/fX76fvMm
2nsefe3T28fnz2/sr8eXrx+fP938Ct3y9vD66entN2M3nDqgz1taVy1+ftLrnxNcc1NDdXmr
y80at60GJnSv59Vxx6v2ETq290noDE6J5EVRgTp0zYQF/Ehas3/bepu3mNhdlXmBCRNAx674
huKqRQMDwuI4A6RDMRzZtEaJ4yXEL69vj94vyhUhg1DwXX6w5bzUEmAk7u57PAwxws0zk7de
Pz4srnIAymS1nWleakIgqJalAJy/UPFV6ddTXXGHBLYK9Gfu1HtcbEHohEIjJ7gRLvQN8L11
xOTbbfy+opYXqglUHd/jLptmyCVDFUZHgOHuf/py1BxY0Evqh166bK6Zcy3YRDz1+MBVoZZY
4wokSS2vKRJyuCdZjCsDSAQYsW10RVuFtVRDxRCLt9eZZby8LiDLB66RTOOCNazZ3jVt/MBD
cxOswN0YEuQq0oUBYrNI3AGd9k6iMkCrHP8kTGzfWBkZkhaJ/GHxYKlx7HZO4xA29ViWiHdh
cGvmbKobahz99WXsvwKeJzcmgzIRZqNeI46MHTtvqBLPlBKbmT5OjzMfyZnhgxgbHxVhQp9r
JPdnBkCHVg8vwq4ZRGOCdQ0t2VTPjJ2ddvVi9VOX1KBg8inoOE+3R4B/+PrhZ1bNkjIJDlVO
mAdYoEUD1Wq/KQKsHoJn+o4TtmCfH97YifmLvUpyoQpU5XiFHvs+1ujAiV2NDmtfBr6gSN3c
W5baxBItWYOgKikzIA2y2JJ8Gq2nn2ao70ItFXQHCSIvMvtpMmFZjrXh1k+HHFlMSZQNC50c
hRO6CgeAeIN+SkkSRK6Rtn0XZR6yhPddXKjeIUc6jDF0DxJCtCMnJTrZslFs0VImALgrwjJ1
vJeMkPf37TvSYR8jSnp8qrx8/R1EC+dEkd4Q0AHnCEk6YUbDZkfBa3IpayyDHW2uu4EI1+qu
YQFvx2YPiiflM/uJNQp4JnAWnYYWtcZxAefuDxzFOveRr2oUT33ZeCGySQEZ2UFmTxPIcU96
lzC/mp8Rl4Ua2OkAyZ1bWqBjFpwhOBtiuESb0H2iJbjkNdWD++bAL3ynQTzFyzXHycD+wk0r
pq+Ph43nh1gDg/0Jliq8EqCxF0ZA0xVBdEEOIkb82amLDfOhWRrZoxLu1ICXAllJL4UIAW52
WnvG7vemD7nzBSTBMQS32YFWhbkJwKNuIxPNFuR0WoDTUI88rnSM8+wg7f0xKYgHd/gyv1nS
p6/fX17dKx0WhqUEo1GQkk1XSIwFSlwv30DZXndYdN8W113dYJU+ic8WeTAK65NzJdRtcClM
wmjV7EB0xbpXQg5V3lEkB07non21UCOQD1+LKo3J5qcLaFU0uRKt61BGUZop60hNwNtDUdeg
ATHjuryHKw24nKmU+KP858icHUdKcn+E1vsj1snixQVWdarZIAiuiDMmeb8o1xkQqAaUMrbg
dhILm6YCNJMyhcHfg5BvF9WSX8yEk2pYeoL43vVOJ3RytYaQtMrkAVYJEdQECxtJELmzKvTU
aNUXRxousijqaT9YZNFWA7bm8q/6E6V6QmSXqPFGweRDmssrN0xAVV9gxG+4PNfs5yQZd7gg
meeyy/XsIB4r+LHUO0py6rZDXaONJSD6jZ1CvhakhFgbV2Syj2itLPWuOCsdeeauDerj0GyX
xL5u91qunAqtYawo5Pnx9eX7y8e3m8N/355efz/ffPrx9P1N03cYLX1WoHN++76636KPPXTI
97XqdbY4glaaNgM4Rdz3YTNnZItLY7481e+r6+32j8CLMgeM5BcV6RlZkpoW49hCl0OJq2mO
wXQQTABjnEpeFsSx7nJCMvKynH1AKVNc4eaQsO+pyrAmO9YVMBGAj13/ILhEC2RqApILfj1p
IAMP3VdNXKCeFA126Ksq/CY79nzX11pYwIndQGckgXoLp/PSS3hB24FzMz/BbP900MbXRXyD
i8atG0EgjNV+6mN1l7wA7/KRi18QGzBnRSQoceTEhC+LsqyEka4pAAR+ezqLIKdh2YE3TH4a
moSW5X0BrIMgMttyYobmGGS/hqoY64itWDn1Mnfu5RB6ntmH5X2b86b1kOG5Z4vSoStro0Bs
Z7xESDnqorsStui5ypG/2x7zvgyw0vzZh7omi6TfggnlqR3UJ8yxbbimF2sANRjGkoeMfskr
cYUSDURK1Op9gSlzozqkijxkSSEVtIKBbutrEgcpUlbOQWVvBZB4ZgcCPfWw9YNxmnzbFe5B
0/LNBB9zgkfcc47JLLh/HsmniWqmNW2GQ4VVhR1f2MEFKUpXkKL+iY2RbX7mzIMdEd8mqdmj
t+J/7S1SKyBG7o+nodY9m/dDw9KwXBJQ1mS4fcaxGKpje63AzW5bmYr09NvTwz8/vsHD9PeX
z0833789PT3+rbk1xhFzFmBr3Z4tynzyDCXU+Y3c868fXl+eP2ia8ZJkJsEXAaSr9vT6v8qe
rLltpMe/4pqn3aqZbyz5kh7yQJGUxJiX2aQk+4XlcTSJamI75aN2sr9+gT5IdDdaztbUJBEA
9n0AaBzLehWhfEO48TIDOU7U1MNTmVb0cX7d7/Jyh//Y3jUJXeuoUAM+NuJufwwQt8mStLKd
QExcuU28zm6MSL26f/1n/0Ys/52+rCJxnbb9sokKGZKIzrShiep0p1coK4w6dZgqdlmOKSBh
ULKltQuXWZonwOn2oWf+a7iSTgP2PTf5io/nYJQCzICRcFNkEtYNLPPBA4Dymx6pDlVlxTsw
wKYuBOU6NRhE49Y+ezQCJc9Qxw2NNDJZRGyeYE2yWcR+pZL9XwofoTJLrLsF1yLvhZ/iZWLa
Pq/QlsIpV6GUIsS2D83zqKx2w9jyBwLGftpVEzY93BojDsO2IMOdX6O5AAiUmCn8p0uI0ath
j6XcJnOOXbP1/NcBpRr6/jxY40qDLtRoN/u/9y/7JwzSsH89fLW1SFks+BdUrEXUs8kpu21+
sSK7uLVIOFtf0i0STorrNaDn5+y7EiFyHtcJxneYJ0gRF4EbeaSoXbF1QGUXZ+e8F6lDdfEr
VBPe/MEmOv8VIjb5LSFZFJPZ7JQ93eMkTq9OL9mRRNx8esHjBJ5/fVwHxgpvBxEFeXtDtkqL
rPyQSulgP5g35ePLNhbT/MLfq7S0dmt/UzXZjQ3KxeR0OgOuPc+TbBVYRSEtNCEZoybwRTje
Vz5BtSsjERjcTcy/zNJNVNRTZVj2EWU4cAedThmyRedeIcOFpoJVKWxgtYW5v7AkEAO9YqFz
F7qIsuso79uJA24nfRx3ODk8Isk2DkJxHB6wx8jW1ugSuIx+yI2Hprm2giaRUcrQzMyvK75d
lZ3w4etm6gNL2w1xBLNaFo0VjV0QyYoXOCPhiLqMN2eOAGXh54HVB8hL1vPaobniTxxAXc1n
8WZ6GsJfTu1wDgLYP0zzY3N+3YKQsyrJgQLby9a1qERLX3vxEcy9jnFeZb6g4AUq0ZyV54D0
plRCb7ybPXv6un86PJyI5/jVf1wCTjctM2jhytg+jy2nOPXYGMZNLywmy0Wzt4lLZNtrUewu
ENzAppmdMQ1sYQub4R9c7ZgRYWbyOkUr09JOlQUicCxPfqY5iJQ26rLGxwBnVey/HO7b/T9Y
P2Wo6EnbTq9OP7zv1Wvox1SXV4Hchg5VIFGnQxXI1WhR4VPrL1H9Qo2zydkvtH42uQpqLSnV
7FeoHI13mHe1ptKsAum9vEpEzB4PiB3PR0kbXZzh7WMD5U1YxwIth2ZzGuVmQGOslBEc1Tf9
Ko574GEtPTzCi0IjuD2kvzs/pQaIBnp5SqOmZEMdlzsbmrNQRXtFFH3QGwW1ohYNUKujI5Sm
HB+hbgm5D00U7fxyYtk4IjzXcE5yhsLUkHl1qJqvrBEm5AHz4/FLPvLfiHa6r4t1wZp45kDr
joWbQmZ0DQk96VZP8E0rEzUggH9jL8BYfobYsTAEyqo9cCGEAdI6lBonXAnMThzJRp/TVMp6
Mq2Vgx1pO3zE1H0h8JtLAed3bSNMKX7RavRcsGmrh9AD5cFl5GsPoSudXNhjocFTPherCdsr
1QDAhpIv5SGwXsK5EdAlwcjvYl4pKM8OlRvjA/lHBSwZzzEd3BtE9svzgKrBkHSJEEqq4/Mn
6wQ/fCEKOyVYXruJZOdnATLSW5Ets03qMkwK2i+7i/NTjOHLplbAvBxWIylCxPPZ5am+7cdm
Daiz6Fij0HDN5rFVYh+Z6lJ4rZU4DDWsbOGOlTqQzdgKDHZus7+q8pjz5cJvx2x3ASYewxsn
oRWJBCbEUKCCfFUgJ0dLX29FnZWuqzfhq8Tz+wuX2EC6z/UVST+rICBNLVJrTEQTO0KoUSl7
EVKHHCUSwxk46TRQ3pdj/hzv05FmC3f1Ilj2sm2LBhNnmcLNPburz0G+dKBjplAvzCtanV4G
q0Hh2fumScJ9VmkhvE8AfJH1axH6TK0mp9XK+NMvzGSzChVmMo+1bex/bPKlBT9WayBRocBx
b3T23qvF1WQSrlynKvIHeieOzHbdZEU0DRYKInvWpO74GInErwwDjMCAyuis9ZFqdWfrTLQR
rA8ueocmgd2M/i3eVqkF0TBEjR5w67gaof3l+SLjbJ4wU5QMEeJPl4Xp000r2iaNONWWQ1pV
eY+vOVGDsWHGRqLeMG1gcDogPz2dXcyI8gaVAHmGMpshmVxOTuV/TqvgyjMkUMScdbTHFqnG
YF7AczpQxeaqkMaNWUxGVWUgqTPLqVKnJQmq13Ee9D1bxNzoahoTcAz94K3RQKN1Z2lJ3SCI
FMJFoCemdvyEf6z7uKA5WDBzr7f1ZWLR0HHhFNcWnbfGPqvEQfagCDPN0ACeGzAERduFAiaq
hGCVaHnNy1AEtIppezpMbmvr81Wz8S07arNA5HWz83acGfV6dobnXtEQB/YBNrGcUTTYdrl2
a8EoaauaWxqqA4jHmYjbxht9lcDOXo8xTMbkNHyGDtoW527SYJVEyqwZDJ8i7yYoFM4Hqpph
L/XhwyjLF9XOPSyKNTdX2MPCoTYvc+4nhOBseio/4/f2kKCz2cIOksUPLD76a0zrvBMMXIL6
a3wSlhaIn6YXQxS84abWrTW15W0KF6RdVpsZE2IYjDJa0bFWKkmvz0qXGeqTHlLjbGyLF1L9
kNWck7MO0ifcViOHhFnYfCjmaGoKB4HHR1wkN6ablHu4hL6KFd9secLYRckWQ2OJ1iUD1rSD
PzeRdVNKaCiyYbN/fH7b/3h5fmAM8dOialOtjx/Lg4U2YthlZbbBpu7ghOXdxnEohH760puB
aYtq44/H169M8+STPOXaECBf3pn6FJLWaiGUEgvjcCAg+P1gTD022mrcMGF4I28z+VKtDF+e
35++bA8vexJQUSFgdP5L/Hx92z+eVE8n8bfDj/9Go5eHw9+HBz9iE7KrNQjjsMuyUvTrNK+t
W81Cm8qjx+/PX5UCmAtAhV5ZcVRuaHhlDUX9YBqJzspPppNxYuq4rFxWDMZqgs2J92lK0Lz2
SNIVQwWsbpLrk+osWgx94fuKOUy1M8p48KiUmGinoKO+Ek56QImyqrgoppqknkbqa5L9gWkI
vWLmE9mcjHuTHbBi2Ri9+uLl+f7Lw/Mj3zMjw9XV1mJmoIwxOMEYj5ArSyWI39V/Ll/2+9eH
++/7k5vnl+zGqdAzXuINeLosBqatXGUlzx7g1wVIIXxEPWkUhaoUUdF8hvhRE9cF7ctHLVbB
Uv5T7PiBU5xDvJkGFq2cI3xpYlehV656ggIR9d9/A/Up8fWmWPkybVmndAExxegQb6MWnpsY
c8sETl3YUk0UL62jE+FS87ZtAl6Y+uQEJipQbFGowCajTwTXTNnOm/f777D63KXs3MaVEDBM
fGvUmwDcbOgKn3ARFtWBDtdQL1LnLWElFhY7K4F5HnPX1BCk3ftAFIl7VdgE27gUkuPkFUSa
5eCN7dgRoptas/aWZLpW8Xyh01Y+OYWZRVdX5xEvww34xSTwYczpa0f83HavpojjNc7pozIF
BxoyD7zsEQr26ZXgZ3yN81AP5nyN+PCpB4ezKiBoazII/MNy2Z4QfERMOwh4wYPjU74dV1x4
gxE9D3w2559rCQEvkxIC7mmIoC+4blgLhoLZTs/trEME8cHYWquEgIOjMWfDJKC/WRw1blEK
5BRTVAveRXUQmFaN5ac6wHl2ihwW47uG92wheBNVjcbiWQZF42tbdThCpaAaNncfCLkbVyNJ
TqOqq3NeFSmVYVI2m5xNsa/eJlbY6eQ0kOmYFjG7PFLEZH4eSgJd6Rj1/bITNLfzCM+rrZ1S
YMTVNBsEASMjh0ZU5gXCpQAhV6f/MgPksi2S7MwjCw3C9VkfFfwIAOrz1XSSHhsA8vKijUbI
9FKJHgrD98uIiq76i6xsI5CCM/0dbUcntdU+xyz5ht3h++HJZbiGT3cZyHW7fhN37F3LfEw7
dtdaD2l3u+n88ioowhgvhl+S6kw1WFi6WTbpjZHY9M+T1TMQPj1TBlKj+lW16UVWwIz2VZmk
yAlZLzCEDEREVANFZcydLxYlrjoRbcgqpughYRyPxpdg9e5odSLxpwSPB73PtYuApOQVzMii
EypiAqKQMxi+pInJGFr1qP3EVOFTwZ463pTm+uxsPu+TIvZbM85in27SsuVmQyJMz8sq5rlb
lrquWR2tTTvcCcmSWC2muzaWhm5yCtJ/3x6en7QewtcwKGIQtaL5OTVv0HAZztcFDjm/GMTZ
GXVfGuEq7/EjPfclqm7LCz7dtiYYMiJJp2T75pAETTubX51xamdNIIoLlWHL/dLESQ9/ChQ0
p4qRf9Kiakg0BlwqdT65mvYFHu8010A76XOQbFsuFCKKt9nS6pKyE+zLtAg4POknDzYIrlr5
drb3LGDNXLacFLUpUtx6ZunAz5PFy+HLV2bdIGkrssk5MbtB2DK6Tq3vn+9fvnCfZ0gNnb0w
Gg+kDq1SpJVxbcewE/TRB34ohxdLHb4tgq7ziJPPUHYZqMl1LJINWFowPzpQaSj9aFe5SBu4
fwJ1epEjEWieYB2ou+oQqIIeub3Ub168zh/w62yx4R+VEJsVfJ4EhdtxEp1G0cBxGtS3deE2
T6Z+P+UVR4hXCaED1eR1jLb2wC+09lCYKD9OZVKbGCgL9RYyaY1VkHQebNNrr6Qdx8siRr55
JIUTwxgxMgT4zFsTzquYhUPxIFCPedBr686uxpz7bj36eAgU55sJSSjGPAt9UTeJXbOgjJ8C
FDQAwwCC+fFqQlOK4DiEQjBJXJbGUW1XDLB144RAR7gysggUdLczZxNGdXkAPs1PLgQYObbW
8b6iwbw0oK8LH4aJoMrm08SFb6YM8eaMg/VZK0JwO1aGg1NKVvrI1i9pu7UJTgbXEX1YMxYC
0PG+WGSWz89n+VYdWaHM9KoE7j3Gb+qsZJAwiJb0quHNXTSRSO7+EsCBnPYqFI+ZDGLnjgiv
ovVMtYRoV42KdwTlAi9063sAiXiJFqR0QUdNm6F7DvLQcW1Juzg6xsILBiQJZB6RCbyaG9Gm
/Esyosu26GhKsEEaavzFR0WlEelKz9g44JMWWRkwjMGYPSt8Z6lBvqszNoY+JSm074jRTbu7
hXQYBIRrN5fOsD51lhzlkQJQnReMzuNxTNSur+YecCcmpzsXqm5ee9VJuLp0OV0LxeOvOMrd
UtE50y8T5pF3FNBomRBptQ3WmUdlm924denLzq8udKsRrHJdk9npHm00mpe5NQ0WUi5iUMa7
pUhEndjBHCUm4CGqkVJm9XskL4minlzw2UMlSRWj673bQmNY6hSoNkqwsMF5xe0XSQzplDjs
9lXe8a9aig4jf3JWSsp01DhjnVmG3Q5S+m85DbMMUlVs3fXtiXj/61UqGsYLSwcXw4RK41gR
IAhOddYnFhrBhrWSibZay3MT0Z7LpoVVdpGhDFKaAo0cTN3H6OYflnRxKkl49xbZR9wDswUS
8Zrogahf7XKPzCfCVJhIZXExHlrGhwmPkt6Zu5VHxhLJwUJKzG6fVyt7vpRTpMQThgsQyp8R
mzPCB2Ne7EPvzb1ykGQ7OKJYnhwoSjFVrfjpQnEpJXbQC1mktMiOWpa/M3ir+aRbur9WgYNF
bNU0Tg4Lhkou/UAJIkOrxw8KEFG+qezeSuFduiT6DS+yHZz+gV2nLZbUR1aTtIkTn0JOEeA1
hfe86pCNQiahrNSUOiWr26bfNDsdayq0FDVhA9yWXhojp4khYq8upEok7zDJMrOq5A0sZ9qZ
SoVgOl1sQETvoeRT6S1x7KCgpF3L3jmUbLbTBdptVOi4nkxMhXZTQVbrp7MSpGZh5zOxkEfO
D6TBjtq1FvUZA0X7Ur+FAO0cXYYG78TRAYrqeo3200VSwEpihSAgq+I0r1oMVpmkwq5aclt+
O7X12Q060WmsVbHiDWBZhcZEEqjw2B5UL1gXLtM7ljVINWnRVj1l5y2atZAz4q6rsQxWigeK
JpL2X0x3hnf1Y4fgqHt1ejUg0qLwFtCAlHt1nRQBgdgjPXqv2aSJyNwLl6P1T/DRqwLTJwZ6
xYyXFkKSWrmTBSo2Jt14LEo6uwKj9/ZaZXSe3MEmLuoNPvYd2Y4DF+evM4o6c4sekEeOS9Eq
9cnkDNoAHXPPkhF/HsBn6/PTK/8GUSoUjMWzvo3dlinGcBe+JyQBPmDW084uN4k0w+eWmRSz
yeXuKBcWFZcX5/rUCBKpd8Ntdsc0TarNtKSn747hW4kLrnFg3uusTsPcn5K38GYMrT5FIbck
sbmyOWpSJj6MxRFnAljEZK4KFW3PcpcFUF770f7r/QvmxbjHMECPz0+Ht+cXLpUuqnRi+ZrK
Pf8orJUaUT4+BIkT0cln+6HFhm/BNzQbg+SwWjVwHKIj7R4EFmqaBLN4bnT6NASbqaZMmiqQ
JdgPz5Zni3KTZAVno5tERAWAcaQUgL6rIai/LlLuc5Mzi/4cXhEsoFTaZNYVMyKquGr5dz39
mJOimUCo/kEIS9G+mqnC4J1KLBp0xZLNIAsTmAVZsWMMd7OU1fx0q5EPbCKJ+EeE8UoL9GUg
sBqhikY23rTOrVUecxiyjZug4QRObUML9e1meQmHrlfwYE3sNdWtu9xgqs+Va5KniVSukGCH
pYm+GWAV53578vZy/3B4+uqrlKGfxFm6LVQguX4RiSzmEOi7YjksICrpioK71BEnqq6J08GC
9pHBDQkRWeyybfCdn+hd8bhs1z7EDog6QFcsrZDQUVdo4HCjc8rRoYo2Yz/znvPGBOL+6A8n
HuqQaBRG+N0Xq8bol9jpd4n6iM1vod1Y6ga4415GbnwMoqR/DjmITQ2aMN7UDBJ1S6YHFLdo
smTl17Zs0vQu9bDaJKbGDJPGesgur0lXGdWNVUseLoHJMvch/bJIeSh2xJsAg1NNDc+BoVMN
OU4XLXm/p4GADy5rDXZR+wtG8Ex6m7J8IZx2taWjFxnv5ZNnBT62020OIG3sHLIjxr3QwL/L
lHeN1GGJf5I9fjY1roUl8VMDniq9Sa2zE/0mb7ooSQLhVovKddo0mSvsZ3t5Hi4PGM5VMlbU
nCmO4nWKfqyJztk5tmgDAlmCJnBLgS8xwtbJwiw4ziEDAp2e6PNgumunPY2YqQH9Lmpbq1CD
qCuR7aBB/JgbKpHGXePkFx1JzlSV9KuzYNkOjSnZ6sN5T1kRDRiL81GkFNqK86AZhERewz3b
Shc5UtvnRTK1f7lpR5foCShnkyroM5i1pbAaPgCBlPoGD3A0uOi1axFRrQ9FqWljmv9Z1fRI
f9PhGTmx45OHaKd38os2ajN0aCad2ZnOjeaGALnpKla3uQs1CBEN/4CIqKqU6TBE3HScjLfz
24ugSMCItf0yaukr1moppk6T4UqTMKboRetOn4FwC2/AyanVXvrOAhxomg41g7DWbvtQBh1F
63RNAVXnmKqbdImuyRiulnK1We73cTxLpvJbFndXlamHHde8JXSo33DkW+74/BZFf0x7PytI
v8D4H3BnEBzm38F4mNdWghC0+UQL6VsXT87IPi3j5rZug3elkIPFboOl0GF/R6HKBWQKYGyx
xmKjI6mTCryTVEjhLI5k9Eue5V6EiYwMgxuNViwBmEdH6vLk5biMWLvXugGspt9GTWkNrQI7
C+9mWbT9xkpVoUCcqkmWYBlWRF1bLYV9iCuYBUIZwjrFYktq02ly7KulgjnMo1tnkSop+/7h
G40JvhTmjCZrQF3CeL4F9oemwAeHatWw0SkMjRk07+Nq8Rl4FJDgBcuoIA2uYxrlc4C5U0Ew
Q5uofYLutRqB5A+QKP9MNonkQUYWZOShRDXHlxZ2j3fJ0oy2KZwvUBk9V+JPOHD/THf4Z9k6
VQ7bo7XmvBDwnXMobxQRN9KAMNl74ipJa8yxdX52RS/54Mdl66w3CfAmTUKbLc/dHeuj0m29
7t+/PJ/8zfVd3u7OawaCrlEm4hV6iN4ULp5i8Smf7jUJrGXggApumKpxUPE6y5OGGjZdp01J
h8VR/LRFbbdZAj7gExVNiFtZdys4pha0Fg2SLSerI1Wx7UFWJ9DBlmaVrfCVLna+Un+N7IlR
3/lTQ05mTPMkt5XMSseun7TFoDOUiqwld23h9TJ1flsOcQoS4IYl0orYhxCxDfioKvKe90xr
MCFdGbjjVbvloRLE47Gcp6sovoVrkB0ZTYQrKc2RyO54koloAfd0l9QmHoMzEmy+CdTDoPlZ
VhGmAu969ycOlVWhG+BWdGVTx+7vfmXZ9tQxMMYI66+bhWW4qslNN7JSctApchj4PhS4w/VH
vqLGLNO0XvMnVZzZlxz+VncUG8cZsZiLbju2TE0XHWRJtU0jjB6Om2fNtwmpujqOQsHdsiPb
WiK983SEBiLFDnjU69Uy9NURwl9o37H1DLdGFOJ3ozArPK8Dd0pOl3ouzO306bfD6/NsdjH/
Y/IbRZtLq4dLy9oCFHd1xlmC2SRXF8HPZ6wPiUNC3v8czLGCeUM/m+iST2ziEPFHlUPELxiH
iHuVdkjO7TkimIvQMFxeBjFz61imuPkZl0DPJrk4DRQ8PwvNyfx8HmoMjbiLGODncNX1s8AH
k+nFaWAwADVxeybzqAYnwVTG+UVQ/JRv45ndEAMO9OjCbZtBhIbc4K/48uY8eHIWqmfCeW1b
BN7Oua6yWc8/qgxoTvuPyCKK8TkoKu1RQnCc5i19LRnhIPR1TcV80VQgSLJl3TZZntv5WA1u
FaWAOdK+VZOm136ZGTQQnTK9BmZll7U+vewm27q2a64xEbLTuK5d8lm4kpx/tevKDNc599BS
9dsbyiVayloVqGj/8P5yePtJMiwPnPOtxRnj775Jb7pUtH34DgKWRoDohm6L8AW6BPOXjlZg
pEn4TgREn6z7Coo8ok5Aqo/0CUYpiMl+hTS8bZsstgPzhfWGBmWx9Ji7SGaDKqELncwIXN9K
TiWOlGAyFO2R8cI4MI6oc1EvdewDYITiABZSwHy7QaJYNAgP7frTb3++/nV4+vP9df/y+Pxl
/8e3/fcf+5fh7jZC5zhKEWEnc1F8+g0D2n15/p+n33/eP97//v35/suPw9Pvr/d/76GBhy+/
H57e9l9xHf3+14+/f1NL63r/8rT/fvLt/uXL/glf7MYlpgPePD6//Dw5PB3eDvffD/97j9hx
/cWxFINQldJvogb2V4YJrtsW+HAiDnFUdyk9JyQIzeCvYZ3YeRAICmbOlB54kLFIsYowHdr5
4koYhpa16jek+JpHKOmGDYyRQYeHeHBZd/f3oEmuGqWStJKnwY7EkVNalJefP96eTx6eX/Yn
zy8natGQ+ZHE0M9VVGduGRo89eFplLBAn1Rcx1m9pkvcQfifIOvPAn3SxsrJPMBYwoHx9Roe
bEkUavx1XfvU13Xtl4BWqz6pFzHRhltm3hqFRwIn0VgfDgKg80KkqVbLyXRWdLmHKLucB3It
qeXf4bbIv5j10bVruC+YArGx4eJEVviFqehlZpHX7399Pzz88c/+58mDXO9fX+5/fPvpLfPG
ysqpYAkxhTCFx7FfYZz4izKNm0RE3vdwAG/S6cWFTGKhTKve377tn94OD/dv+y8n6ZNsJezk
k/85vH07iV5fnx8OEpXcv917zY6pS5CZSgYWr+FCj6andZXfTs5OL7yGRekqE7AELMndRsnh
5uVSPR3pTbYJz1YKLYAjcWOmZiGjqOKF9er3a+GPc7xc+OPZ+jslZpZ3Gi88WN5sPVi19Onq
2E7nKIG7Vngw4FQwEJsHL9fDsHsrPwHWse0Kf6FhTI7BJun+9VtooIrIH6m1Arrzs4OOHJu/
DXzmPUQkh6/71ze/3iY+m3KVSER4Eex27Bm+yKPrdLpgylMYPgWmqbCdnCbZ0t8IbFXBuSiS
cwbmb5Uig4UsHUNiZrc0RQJ7JdxcxDvpxgfE9OLy2PwAxRmf9VjvvzWNLTYCoVgOfDGZen0D
8JkPLBhYC0zNoloxI9CumkkgjJim2NYXdkYoxY8cfnyzokUM54+/nwFmxS4y4LJbZP7GjJr4
nGkosEdbNyutt5wjzJiacVYBAwXKS0pn6x1PgPMXEEIvPahy4nDrX35wo16vo7soYTonolxE
x1aLuRK4bwM5Jw22qdPSZ5ZE4e+fNo2YTrXbyh13tQKeH3+87F9fbTnBDM8yx4cUd9jyu4qp
YcaG9xs+OWeKOV/7p/ydaBNzCDf3T1+eH0/K98e/9i8nq/3T/sWVaMwiFFkf18iAenPcLPBd
qOx8XgMxgXNb4SI2fTIl4S5DRHjAzxnKQSla8Ne3TIXIUPbA3h9RtTuEhmX/JeKmDLwpOHQo
NvhrREkt3w9/vdyD5PTy/P52eGIuxjxbsCeHhKvzwEfoy8Z43R6j4Q6ZtVIbIJXaXWztCjXU
ESbhUQMHSVrpDqFNeGQnAF0SGCRzTwJrjLHg58dIjvWFsJxsMx3O9HhjA7fZ2ufk0GsAZPRt
VpaMNIVYmXioj/0jhSI9CwaXRPgrgSKPfI8uHHEUFaHLg9IcRTLPVgzR56ObE0nrLK52cRp6
nSKdi9YR62xLaEw8SO4UxCIufIlYTplMKjIKhEEKZtWO2BYXNVetzlnC7K0R62SSd7CcBGiV
PD095+48pIljzvmDEKAHSBLzIxPX9MqNNllXOLCRtszgaN8dQfVxWV5cOImAR6IqbtOqbHdY
wUeLQTflLuNf9wnlTRx41qQkGLiZDX1EqLJi1aax0gb5pwpSGEeWj+rTpuJR4BmcTo0OL/UR
nTL0+ohK+sTXbA4zus2WKe5HdiXHMTDgLEb6kIvUv73kMi3yCkMNrXZ5YO4JxZH3/0jcFkWK
WnapoEdLAv+q3r+8YeTM+7f9q0xE+nr4+nT/9v6yP3n4tn/45/D0lZpzKbMUvF/ja7Q2M+8L
rDHTr5Rtur/Iyqi5VZaDS6N9yIMMRBNlyWVf06guGtIv4FACJq0h70Zo4Rs1QFKubAYe4+lk
7EpewBZMMcYuMfuRjINkITisiQICUlcZ17f9spFe0fRioyR5WgawJcZDabPcya/eJOxTGWb/
SvuyKxaYOms0NpHvMJZxsolSgiGObCN+0cL+gnWVxa4RFBrdxEW9i9fKEqZJlw4Fav6XKF4V
Xd5mdZ7RLg1lwEoEnrus2sjJyJ6VSdag7WJtJW9vYvTMbK2TM55c2hS+SiHus7brW7qr4jNH
CRpjOOM0X7pqS5ckh9FY3PLPgBYJ92yrCaJmG9lBbhWCz2QGuEtLPIvtX+ShGfisQbszEpCU
T64OByMWtWo+UKcdtT4/CNsjqQoyOiPqDvm6rFTSnQ01Mt+42e4qWUVjOZwgFB2ifPj5SP1I
oOuYh7OloAzIVCrBHP3uDsHu7343s/Jjaah0UK55rZwmyaJLPl2vxkcN/2w8ots17GBmTWgK
UcPUee1dxJ89mM6/pIFj5/vVHY11RhALQExZTH5XRCxidxegrwJwspDNOUSfac0KxIQvosqr
wo4dNUKxVHoMLGKi/99FTRPdqoOIrHyByW7g3JGHNxDQA136M1HXZAVCA8LeOiIRntDRKGWr
Vgjs4SxHn0wbhwj0tMc3YfdYRVyEXuGtSmtIRq1A2/g4jxp0MV1LDQBz4oq07WpJbDkzjPjb
MpboZdXwJ7tHpWLwuSSIhUmsmcaIbVa1+cJue1mVhrIvrBFE7ICqqyq3UU3qUeubwWBGIwwc
PQz4E3C1EqtcrS5yOEqnGZGtyqhVKZfGE7nuikhc99VyKZ+WuYMZs23ZzbuhN2teWVpx/M1e
MWZ55No3zhSf3/VtRAYSQwyCrE2qKOoMDlvK0SyWCZmLKkuk2yZwFiTuhWRYzH7bJKLyd+Eq
bdFhsVomdGMsQbAghrQUOvuX7j8Jwod/6G4a08WBftt5ZkPsWZejnaR1RYlgMzizXWM8JO7p
vlp8jlZEckV7knJFb6+BE/UYSds4wrC5Evrj5fD09s/JPXz55XH/+tW3ypFMqspWaTVUgdF0
lH/rVR7jwEetcmAe8+FF+ypIcdNlafvpfFgFOmOfV8JAsUBTbN2QJM0jS3OY3JYRZiIKSwwW
RR/0GgBublEB84NZTOEDPvQ9lgD/A5e8qERKZyM4woOC+fB9/8fb4VHLCa+S9EHBX8h8EEMm
+WxedKjmx63OuXY00FLpjvRpNplP6aqpMbMv9spiuZs0SmSxgOR8DACNeWmzEhYy3auq6yDc
yeimRSaKqI3J7eBiZJvQD9EKcy7hsLlUs+tK+ltRXyYKdyuH8zxOtTF2ao72US771RGWQyy1
6IcHs1uS/V/vX7+inUv29Pr28v64f3qjOe8ilEtBTKQBYAlwsLFRU/bp9N/JOOKUDkSjLOI8
F3QPXTswlU1jlVgnMf5mihhut24hIu0pmd2lvZrG0agPsaxk+0tjYjdYuS64E6Xj7FNbrKEw
usClAW26a9NShNwNVYFIKO8+3jAQi6m2JXs+SSQsKFHZDns2HG547VoapLBNv8Z29Up6dFrc
VEnURiErkpERkcTbnVswhQwibouG/qR98rcKGkEPbAWW5QTM8lUdyr2ONWrMu4UhssLhSoTn
9UcXrF4WwH3msE/9cTGY4BZQhnCdUK5JY81wACYamZZJ8Dx0RnZT9PWqlXvSGeFN4TcOqNES
IWiBOlA13P4jNYLwuBJ+jX5b3OZmTdtFOdMyhQjWqhJKSLs/+rEGKyNWjIPTNBVaMn7mYz/o
Ra3OVmTz+eMoEtTo2EEAAw1sH+29NqRUWP+9hmK9b5263DLGI5F+zhvzSoqqQz9f7mpX+Ez6
zbsVymX36XQsDLe1wrEHqXfmudMp1hgP2zN4QfqT6vnH6+8n+fPDP+8/1A22vn/6Shm1SKaM
hs5YUpIFxlAYXToGkVdIyRN3Le2JqJYtqsBQ7kpbWBYV/1ijkP0a4+i1IFgwI7i9gbsdbv6E
hp2VI6UqoJf18a4q+3G4w7+848XN3h3qQAgKSxJrZ5uVMHl40ZZw1dj7AUftOk1r6/rQWwWk
+EK+hCjNLpqVjdfmf73+ODyhqRl08vH9bf/vHv6xf3v4z3/+89/jdErnfVncSjL6rnxSN9WG
9dVXiCbaqiJKGGlPZ03rwK4HNz1qBro23aXesSWg4/i9d8nz5NutwsBdUW2ljbhD0GyF5QKq
oLKFjngrnRTT2j8NNSLYmaitkN8XeRr6GkdaWg9osYq7z2STYD+gaO0lAB+7ySpdjYT2/1gQ
w46R/ptwPjiXiDyEVJCtASZ5bDQa70q0nIElr9SdzL2rbvvj17Yl2JAj6R/FEH65f7s/QU7w
AV87rBRjclwzqlzVG4QDCm8fmQuKRg2RzEcvuShgcZpOhqTwz5BA2+zy4wYGp2yB9R5SEzVx
Zx0s9qaKO3cDYkRjuzPO0jDyFdBh/jQGHP4Ar1spbw1H9JQIEPLbhg9Kgbj0hvqPmjzjVv/c
5QBntZKmGnnXH+F2VHARYNJR4cbq96Ht66qtc8W8tamJ0EkXISrTy/i2ZXNil1Wt+kckPrkq
l12phMrj2FUT1Wuexoj+S2fjMMh+m7VrVDe5TI9GFzIyFhDgo5VDgtEE5OwhpZRe3UJi/aEq
hSwi2WqZ9MVpoqo1to9eqQtadMsl7alK5Yb01hWF04DzJqBjsT8+pCjtBo1+8nTZy7sNtXZs
t7z6jJziVqQJGc2b02NU8+D694sOLoQP1kBo+o/M/Og1ZYqG/Y+xCzjhUskjXIdTM36w61cr
yvJjbpdqufS+GugN3GF1FJw7wLewu5jPdOf02uRuOL34RAmc/rryV6VBDCKBvUIWcNlgMhg1
Pp4LlIHrF1LogvogFPzXkMM+4ghNpfm1ssSohg0zqjagjEWq9gP3rZl2ReAuxNAON+vXfly+
LWHNuAVhaBmgz1YrdZeNAoOsQG1UX/yyyeRGGx/8uUOfbF3GMMBUFuXyqQZHlezSGBNv6rFe
ekNoFk0bNfgWE3xOpk0IEfsHiVTeOvcfGUk8QjxOyxrTI1peEWGemKBi4jpGSQ4f77Lce8xX
EriKyKuDQqSJ4RTuXx4vz3khRLObWSLfmsTt3aIKpMnLUBoxR3KW8El1i8tzWH15FXuDgEoe
ka3WPJvptpC+A7T71zfkPVG6ijE77P3XPXHF7Ur6mqEi+WnVkQu2H88VLN3JUWdx8kK0Xb5Y
RYQVHrQueCIreNVS7tFwiewUlGkrrdB++QOl0R3aeEzZdA2bylNpwHrDvaZvA1tdAQh+W8EB
JG9AJcxJi22mYlio7mPQ0en2vDq1mdIozqAgUWRCYKVJFXeFe4T+H8dtT5+rQAIA

--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--PNTmBPCT7hxwcZjr--
