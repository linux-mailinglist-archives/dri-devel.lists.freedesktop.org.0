Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E9B6ED24A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 18:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F71310E53A;
	Mon, 24 Apr 2023 16:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6277D10E53A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 16:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682353061; x=1713889061;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=lddDPRsOCJPjQMD1K8jB3+ZtYW/kKidYHcbIhNWqBbE=;
 b=duQ0rSCpzMYRcy5mcps6XCEhc9RNX5v95fARfMgFO283XxfpeLfph3tA
 vVCaQgxa83IuXqdI21IsLlT2ywMr5yMToONEap6Z7Ro1avhJVK6EaOGMd
 nLnxOQA4JXX4uyTPF2sQ3jdJa3a6qgNz7jKM/Mvpa8ApO9EExXLmWFSbw
 /FoI+I2X+ePtqan65hFVnEwS0I6fn8f9dEXT677mya3TyHRd72DFMRLLH
 DUA7hThZ70oHeheQAwc9xx0CgAvG5ubsIrUjLaX7thQW42DJy7MCEgG7Q
 g0aEI0fZl2jJKA4pEvTYhIjhBTU7SFEdfHlZ9K0VmMmapNEhaKlzDs7tj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="343982713"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="343982713"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="643426831"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="643426831"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 24 Apr 2023 09:15:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pqyr4-000iWC-1r;
 Mon, 24 Apr 2023 16:15:54 +0000
Date: Tue, 25 Apr 2023 00:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [drm-misc:drm-misc-next 11/19] drivers/video/sticore.c:888:14:
 sparse: sparse: cast to restricted __le32
Message-ID: <202304250018.7fBSSPpq-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

First bad commit (maybe != root cause):

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   70102d77ff22dd88a0111b1c3bac5099ac5d0425
commit: 7470849745e6cd746ae773a6e59b309867310181 [11/19] video: Move HP PARISC STI core code to shared location
config: parisc-randconfig-s052-20230423 (https://download.01.org/0day-ci/archive/20230425/202304250018.7fBSSPpq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc drm-misc-next
        git checkout 7470849745e6cd746ae773a6e59b309867310181
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash drivers/video/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304250018.7fBSSPpq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/sticore.c:888:14: sparse: sparse: cast to restricted __le32
>> drivers/video/sticore.c:888:14: sparse: sparse: cast to restricted __le32
>> drivers/video/sticore.c:888:14: sparse: sparse: cast to restricted __le32
>> drivers/video/sticore.c:888:14: sparse: sparse: cast to restricted __le32
>> drivers/video/sticore.c:888:14: sparse: sparse: cast to restricted __le32
>> drivers/video/sticore.c:888:14: sparse: sparse: cast to restricted __le32
>> drivers/video/sticore.c:902:17: sparse: sparse: cast to restricted __le16
>> drivers/video/sticore.c:902:17: sparse: sparse: cast to restricted __le16
>> drivers/video/sticore.c:902:17: sparse: sparse: cast to restricted __le16
>> drivers/video/sticore.c:902:17: sparse: sparse: cast to restricted __le16
   drivers/video/sticore.c:904:29: sparse: sparse: cast to restricted __le16
   drivers/video/sticore.c:904:29: sparse: sparse: cast to restricted __le16
   drivers/video/sticore.c:904:29: sparse: sparse: cast to restricted __le16
   drivers/video/sticore.c:904:29: sparse: sparse: cast to restricted __le16
   drivers/video/sticore.c:914:28: sparse: sparse: cast to restricted __le32
   drivers/video/sticore.c:914:28: sparse: sparse: cast to restricted __le32
   drivers/video/sticore.c:914:28: sparse: sparse: cast to restricted __le32
   drivers/video/sticore.c:914:28: sparse: sparse: cast to restricted __le32
   drivers/video/sticore.c:914:28: sparse: sparse: cast to restricted __le32
   drivers/video/sticore.c:914:28: sparse: sparse: cast to restricted __le32

vim +888 drivers/video/sticore.c

^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  859  
48c68c4f1b5424 drivers/video/console/sticore.c Greg Kroah-Hartman 2012-12-21  860  static struct sti_struct *sti_try_rom_generic(unsigned long address,
48c68c4f1b5424 drivers/video/console/sticore.c Greg Kroah-Hartman 2012-12-21  861  					      unsigned long hpa,
48c68c4f1b5424 drivers/video/console/sticore.c Greg Kroah-Hartman 2012-12-21  862  					      struct pci_dev *pd)
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  863  {
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  864  	struct sti_struct *sti;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  865  	int ok;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  866  	u32 sig;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  867  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  868  	if (num_sti_roms >= MAX_STI_ROMS) {
7ff3f14ddc355b drivers/video/console/sticore.c Helge Deller       2020-10-12  869  		pr_warn("maximum number of STI ROMS reached !\n");
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  870  		return NULL;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  871  	}
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  872  
cb6fc18e9ca615 drivers/video/console/sticore.c Helge Deller       2006-01-17  873  	sti = kzalloc(sizeof(*sti), GFP_KERNEL);
3af04d5c459485 drivers/video/console/sticore.c Markus Elfring     2018-03-28  874  	if (!sti)
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  875  		return NULL;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  876  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  877  	spin_lock_init(&sti->lock);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  878  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  879  test_rom:
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  880  	/* if we can't read the ROM, bail out early.  Not being able
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  881  	 * to read the hpa is okay, for romless sti */
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  882  	if (pdc_add_valid(address))
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  883  		goto out_err;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  884  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  885  	sig = gsc_readl(address);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  886  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  887  	/* check for a PCI ROM structure */
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16 @888  	if ((le32_to_cpu(sig)==0xaa55)) {
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  889  		unsigned int i, rm_offset;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  890  		u32 *rm;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  891  		i = gsc_readl(address+0x04);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  892  		if (i != 1) {
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  893  			/* The ROM could have multiple architecture
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  894  			 * dependent images (e.g. i386, parisc,...) */
7ff3f14ddc355b drivers/video/console/sticore.c Helge Deller       2020-10-12  895  			pr_warn("PCI ROM is not a STI ROM type image (0x%8x)\n", i);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  896  			goto out_err;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  897  		}
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  898  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  899  		sti->pd = pd;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  900  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  901  		i = gsc_readl(address+0x0c);
7ff3f14ddc355b drivers/video/console/sticore.c Helge Deller       2020-10-12 @902  		pr_debug("PCI ROM size (from header) = %d kB\n",
7ff3f14ddc355b drivers/video/console/sticore.c Helge Deller       2020-10-12  903  			le16_to_cpu(i>>16)*512/1024);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  904  		rm_offset = le16_to_cpu(i & 0xffff);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  905  		if (rm_offset) {
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  906  			/* read 16 bytes from the pci region mapper array */
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  907  			rm = (u32*) &sti->rm_entry;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  908  			*rm++ = gsc_readl(address+rm_offset+0x00);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  909  			*rm++ = gsc_readl(address+rm_offset+0x04);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  910  			*rm++ = gsc_readl(address+rm_offset+0x08);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  911  			*rm++ = gsc_readl(address+rm_offset+0x0c);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  912  		}
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  913  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  914  		address += le32_to_cpu(gsc_readl(address+8));
7ff3f14ddc355b drivers/video/console/sticore.c Helge Deller       2020-10-12  915  		pr_debug("sig %04x, PCI STI ROM at %08lx\n", sig, address);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  916  		goto test_rom;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  917  	}
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  918  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  919  	ok = 0;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  920  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  921  	if ((sig & 0xff) == 0x01) {
7ff3f14ddc355b drivers/video/console/sticore.c Helge Deller       2020-10-12  922  		pr_debug("    byte mode ROM at %08lx, hpa at %08lx\n",
7ff3f14ddc355b drivers/video/console/sticore.c Helge Deller       2020-10-12  923  		       address, hpa);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  924  		ok = sti_read_rom(0, sti, address);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  925  	}
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  926  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  927  	if ((sig & 0xffff) == 0x0303) {
7ff3f14ddc355b drivers/video/console/sticore.c Helge Deller       2020-10-12  928  		pr_debug("    word mode ROM at %08lx, hpa at %08lx\n",
7ff3f14ddc355b drivers/video/console/sticore.c Helge Deller       2020-10-12  929  		       address, hpa);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  930  		ok = sti_read_rom(1, sti, address);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  931  	}
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  932  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  933  	if (!ok)
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  934  		goto out_err;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  935  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  936  	if (sti_init_glob_cfg(sti, address, hpa))
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  937  		goto out_err; /* not enough memory */
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  938  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  939  	/* disable STI PCI ROM. ROM and card RAM overlap and
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  940  	 * leaving it enabled would force HPMCs
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  941  	 */
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  942  	if (sti->pd) {
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  943  		unsigned long rom_base;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  944  		rom_base = pci_resource_start(sti->pd, PCI_ROM_RESOURCE);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  945  		pci_write_config_dword(sti->pd, PCI_ROM_ADDRESS, rom_base & ~PCI_ROM_ADDRESS_ENABLE);
7ff3f14ddc355b drivers/video/console/sticore.c Helge Deller       2020-10-12  946  		pr_debug("STI PCI ROM disabled\n");
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  947  	}
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  948  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  949  	if (sti_init_graph(sti))
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  950  		goto out_err;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  951  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  952  	sti_inq_conf(sti);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  953  	sti_dump_globcfg(sti->glob_cfg, sti->sti_mem_request);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  954  	sti_dump_outptr(sti);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  955  
0219132fe7c265 drivers/video/console/sticore.c Helge Deller       2013-11-06  956  	pr_info("    graphics card name: %s\n",
0219132fe7c265 drivers/video/console/sticore.c Helge Deller       2013-11-06  957  		sti->sti_data->inq_outptr.dev_name);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  958  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  959  	sti_roms[num_sti_roms] = sti;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  960  	num_sti_roms++;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  961  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  962  	return sti;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  963  
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  964  out_err:
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  965  	kfree(sti);
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  966  	return NULL;
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  967  }
^1da177e4c3f41 drivers/video/console/sticore.c Linus Torvalds     2005-04-16  968  

:::::: The code at line 888 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
