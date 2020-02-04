Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBA6151434
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 03:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1288B89B55;
	Tue,  4 Feb 2020 02:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9313889B38;
 Tue,  4 Feb 2020 02:30:11 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 18:30:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; 
 d="gz'50?scan'50,208,50";a="219593620"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 03 Feb 2020 18:30:08 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iynya-0006LB-3k; Tue, 04 Feb 2020 10:30:08 +0800
Date: Tue, 4 Feb 2020 10:29:13 +0800
From: kbuild test robot <lkp@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 3/5] drm/r128: Wean off drm_pci_alloc
Message-ID: <202002041014.6m3ZcYAb%lkp@intel.com>
References: <20200202171635.4039044-3-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="tz2ammr6ce6fowfc"
Content-Disposition: inline
In-Reply-To: <20200202171635.4039044-3-chris@chris-wilson.co.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tz2ammr6ce6fowfc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chris,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip drm-exynos/exynos-drm-next linus/master next-20200203]
[cannot apply to tegra-drm/drm/tegra/for-next drm/drm-next v5.5]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Chris-Wilson/drm-Remove-PageReserved-manipulation-from-drm_pci_alloc/20200203-201707
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-s2-20200204 (attached as .config)
compiler: gcc-4.9 (Debian 4.9.2-10+deb8u1) 4.9.2
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/r128/ati_pcigart.c: In function 'drm_ati_alloc_pcigart_table':
>> drivers/gpu/drm/r128/ati_pcigart.c:50:7: error: expected expression before '^' token
          ^gart_info->bus_addr,
          ^
>> drivers/gpu/drm/r128/ati_pcigart.c:48:3: error: too few arguments to function 'dma_alloc_coherent'
      dma_alloc_coherent(&dev->pdev->dev,
      ^
   In file included from include/linux/pci-dma-compat.h:8:0,
                    from include/linux/pci.h:2371,
                    from include/drm/drm_pci.h:35,
                    from drivers/gpu/drm/r128/ati_pcigart.c:37:
   include/linux/dma-mapping.h:641:21: note: declared here
    static inline void *dma_alloc_coherent(struct device *dev, size_t size,
                        ^
   drivers/gpu/drm/r128/ati_pcigart.c: At top level:
>> drivers/gpu/drm/r128/ati_pcigart.c:101:2: error: expected identifier or '(' before 'return'
     return 1;
     ^
>> drivers/gpu/drm/r128/ati_pcigart.c:102:1: error: expected identifier or '(' before '}' token
    }
    ^
   drivers/gpu/drm/r128/ati_pcigart.c: In function 'drm_ati_pcigart_init':
>> drivers/gpu/drm/r128/ati_pcigart.c:168:13: warning: assignment makes pointer from integer without a cast
      page_base = (u32) entry->busaddr[i];
                ^
>> drivers/gpu/drm/r128/ati_pcigart.c:176:21: error: invalid operands to binary | (have 'u32 *' and 'int')
        val = page_base | 0xc;
                        ^
   drivers/gpu/drm/r128/ati_pcigart.c:179:22: error: invalid operands to binary >> (have 'u32 *' and 'int')
        val = (page_base >> 8) | 0xc;
                         ^
>> drivers/gpu/drm/r128/ati_pcigart.c:183:9: warning: assignment makes integer from pointer without a cast
        val = page_base;
            ^
>> drivers/gpu/drm/r128/ati_pcigart.c:188:12: warning: dereferencing 'void *' pointer
        address[gart_idx] = cpu_to_le32(val);
               ^
>> drivers/gpu/drm/r128/ati_pcigart.c:188:5: error: invalid use of void expression
        address[gart_idx] = cpu_to_le32(val);
        ^
   drivers/gpu/drm/r128/ati_pcigart.c: In function 'drm_ati_pcigart_cleanup':
>> drivers/gpu/drm/r128/ati_pcigart.c:99:2: warning: control reaches end of non-void function [-Wreturn-type]
     }
     ^

vim +50 drivers/gpu/drm/r128/ati_pcigart.c

    43	
    44	static int drm_ati_alloc_pcigart_table(struct drm_device *dev,
    45					       struct drm_ati_pcigart_info *gart_info)
    46	{
    47		gart_info->addr =
  > 48			dma_alloc_coherent(&dev->pdev->dev,
    49					  gart_info->table_size,
  > 50					  ^gart_info->bus_addr,
    51					  GFP_KERNEL);
    52		if (!gart_info->addr)
    53			return -ENOMEM;
    54	
    55		return 0;
    56	}
    57	
    58	static void drm_ati_free_pcigart_table(struct drm_device *dev,
    59					       struct drm_ati_pcigart_info *gart_info)
    60	{
    61		dma_free_coherent(&dev->pdev->dev,
    62				  gart_info->table_size,
    63				  gart_info->addr,
    64				  gart_info->bus_addr);
    65	}
    66	
    67	int drm_ati_pcigart_cleanup(struct drm_device *dev, struct drm_ati_pcigart_info *gart_info)
    68	{
    69		struct drm_sg_mem *entry = dev->sg;
    70		unsigned long pages;
    71		int i;
    72		int max_pages;
    73	
    74		/* we need to support large memory configurations */
    75		if (!entry) {
    76			DRM_ERROR("no scatter/gather memory!\n");
    77			return 0;
    78		}
    79	
    80		if (gart_info->bus_addr) {
    81	
    82			max_pages = (gart_info->table_size / sizeof(u32));
    83			pages = (entry->pages <= max_pages)
    84			  ? entry->pages : max_pages;
    85	
    86			for (i = 0; i < pages; i++) {
    87				if (!entry->busaddr[i])
    88					break;
    89				pci_unmap_page(dev->pdev, entry->busaddr[i],
    90						 PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
    91			}
    92	
    93			if (gart_info->gart_table_location == DRM_ATI_GART_MAIN)
    94				gart_info->bus_addr = 0;
    95		}
    96	
    97		if (gart_info->gart_table_location == DRM_ATI_GART_MAIN)
    98			drm_ati_free_pcigart_table(dev, gart_info);
  > 99		}
   100	
 > 101		return 1;
 > 102	}
   103	
   104	int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *gart_info)
   105	{
   106		struct drm_local_map *map = &gart_info->mapping;
   107		struct drm_sg_mem *entry = dev->sg;
   108		void *address = NULL;
   109		unsigned long pages;
   110		u32 *page_base, gart_idx;
   111		dma_addr_t bus_address = 0;
   112		int i, j, ret = -ENOMEM;
   113		int max_ati_pages, max_real_pages;
   114	
   115		if (!entry) {
   116			DRM_ERROR("no scatter/gather memory!\n");
   117			goto done;
   118		}
   119	
   120		if (gart_info->gart_table_location == DRM_ATI_GART_MAIN) {
   121			DRM_DEBUG("PCI: no table in VRAM: using normal RAM\n");
   122	
   123			if (pci_set_dma_mask(dev->pdev, gart_info->table_mask)) {
   124				DRM_ERROR("fail to set dma mask to 0x%Lx\n",
   125					  (unsigned long long)gart_info->table_mask);
   126				ret = -EFAULT;
   127				goto done;
   128			}
   129	
   130			ret = drm_ati_alloc_pcigart_table(dev, gart_info);
   131			if (ret) {
   132				DRM_ERROR("cannot allocate PCI GART page!\n");
   133				goto done;
   134			}
   135		} else {
   136			DRM_DEBUG("PCI: Gart Table: VRAM %08LX mapped at %08lX\n",
   137				  (unsigned long long)bus_address,
   138				  (unsigned long)address);
   139		}
   140	
   141		address = gart_info->addr;
   142		bus_address = gart_info->bus_addr;
   143	
   144		max_ati_pages = (gart_info->table_size / sizeof(u32));
   145		max_real_pages = max_ati_pages / (PAGE_SIZE / ATI_PCIGART_PAGE_SIZE);
   146		pages = (entry->pages <= max_real_pages)
   147		    ? entry->pages : max_real_pages;
   148	
   149		if (gart_info->gart_table_location == DRM_ATI_GART_MAIN) {
   150			memset(address, 0, max_ati_pages * sizeof(u32));
   151		} else {
   152			memset_io((void __iomem *)map->handle, 0, max_ati_pages * sizeof(u32));
   153		}
   154	
   155		gart_idx = 0;
   156		for (i = 0; i < pages; i++) {
   157			/* we need to support large memory configurations */
   158			entry->busaddr[i] = pci_map_page(dev->pdev, entry->pagelist[i],
   159							 0, PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
   160			if (pci_dma_mapping_error(dev->pdev, entry->busaddr[i])) {
   161				DRM_ERROR("unable to map PCIGART pages!\n");
   162				drm_ati_pcigart_cleanup(dev, gart_info);
   163				address = NULL;
   164				bus_address = 0;
   165				ret = -ENOMEM;
   166				goto done;
   167			}
 > 168			page_base = (u32) entry->busaddr[i];
   169	
   170			for (j = 0; j < (PAGE_SIZE / ATI_PCIGART_PAGE_SIZE); j++) {
   171				u32 offset;
   172				u32 val;
   173	
   174				switch(gart_info->gart_reg_if) {
   175				case DRM_ATI_GART_IGP:
 > 176					val = page_base | 0xc;
   177					break;
   178				case DRM_ATI_GART_PCIE:
   179					val = (page_base >> 8) | 0xc;
   180					break;
   181				default:
   182				case DRM_ATI_GART_PCI:
 > 183					val = page_base;
   184					break;
   185				}
   186				if (gart_info->gart_table_location ==
   187				    DRM_ATI_GART_MAIN) {
 > 188					address[gart_idx] = cpu_to_le32(val);
   189				} else {
   190					offset = gart_idx * sizeof(u32);
   191					writel(val, (void __iomem *)map->handle + offset);
   192				}
   193				gart_idx++;
   194				page_base += ATI_PCIGART_PAGE_SIZE;
   195			}
   196		}
   197		ret = 0;
   198	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--tz2ammr6ce6fowfc
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICHupOF4AAy5jb25maWcAlFzdc9y2rn/vX7GTvrRzJqntOLnpveMHSqJ22ZVEhZTWXr9o
XHudeuqPnLV9mvz3FyBFiaSgbU+n03oJ8BsEfgBB/fjDjwv2+vL0cPVyd311f/998WX3uNtf
vexuFrd397v/W2RyUclmwTPRvAPm4u7x9dsv3z597D6eLj68+/Du6O3++mSx3u0fd/eL9Onx
9u7LK9S/e3r84ccf4N8fofDhKzS1/9/Fl+vrt6fvfl38lO1+v7t6XMDf707eHh/962b3+6fX
459tAVRKZZWLZZemndDdMk3Pvrsi+NFtuNJCVmenR78enQy8BauWA+nIayJlVVeIaj02AoUr
pjumy24pGzkhnDNVdSXbJrxrK1GJRrBCXPJsZBTqc3culddm0ooia0TJO37RsKTgnZaqGenN
SnGWdaLKJfyna5jGymaBlmbJ7xfPu5fXr+PsseOOV5uOqSVMoBTN2fsTXM9+rLKsBXTTcN0s
7p4Xj08v2IKrXciUFW453ryhijvW+pM3M+g0KxqPf8U2vFtzVfGiW16KemT3KQlQTmhScVky
mnJxOVdDzhFOR0I4pmFV/AH5qxIz4LAO0S8uD9eWh8mnxI5kPGdt0XQrqZuKlfzszU+PT4+7
n4e11ufMW1+91RtRp5MC/H/aFP6ka6nFRVd+bnnLiY5TJbXuSl5Kte1Y07B0Nbbaal6IZPzN
Wjjp0fozla4sAftmRRGxj6VGnuFwLJ5ff3/+/vyyexjleckrrkRqzk6tZMK9U+2R9Eqe0xSe
5zxtBA4oz+F86vWUr+ZVJipzQOlGSrFUrMFDQZLTlS/jWJLJkokqLNOipJi6leAKF2s70zdr
FGwULBWcwkYqmktxzdXGjLErZcbDnnKpUp716gRm6slHzZTm8zPPeNIuc20EZ/d4s3i6jXZq
VKUyXWvZQkegCpt0lUmvGyMMPkvGGnaAjGrM07AeZQNaFSrzrmC66dJtWhAiYVTqZiJ3jmza
4xteNfogsUuUZFkKHR1mK2EXWfZbS/KVUndtjUN2ot7cPez2z5S0NyJdd7LiIM5eU5XsVpeo
uksjgMMJhsIa+pCZSIkDbGuJzKzPUMeW5m1RUGdeVg0Yoq5RLF1bMfEsR0izMjXXbzBMsVyh
fJpdUTrUgb1MTZbE01OK87JuoN2K6s6RN7Joq4apbaDjLPFAtVRCLbcxad3+0lw9/7l4geEs
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
f1GQtLWxTiawFrElKpBiwf8At71Ig//KAQA=

--tz2ammr6ce6fowfc
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--tz2ammr6ce6fowfc--
