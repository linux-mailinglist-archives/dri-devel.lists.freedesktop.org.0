Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 154DC23D9FC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 13:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75F86E364;
	Thu,  6 Aug 2020 11:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708956E364;
 Thu,  6 Aug 2020 11:34:09 +0000 (UTC)
IronPort-SDR: KABTVTbAXFHT12xFgWP58bxfkyhBfKkgaC3468iVoYtUZNeGaIH4XNywFMs/sX96l/r5FLs45z
 /TJAMLP6lwAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="170851597"
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; 
 d="gz'50?scan'50,208,50";a="170851597"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2020 04:34:02 -0700
IronPort-SDR: 2IPgq9UeRiy3GgVhI+/Tndw4vMkPs+1atvHjI8tMKRscuNCZpdd2jwT5gZ4k30TR7G1iDi5rMj
 rLWZer7yjrdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; 
 d="gz'50?scan'50,208,50";a="493634859"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 06 Aug 2020 04:33:59 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k3e9n-0001Fl-3e; Thu, 06 Aug 2020 11:33:59 +0000
Date: Thu, 6 Aug 2020 19:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Subject: [drm-tip:drm-tip 6/10] drivers/gpu/drm/nouveau/nouveau_bo.c:750:25:
 error: initialization of 'int nouveau_channel struct ttm_buffer_object
 struct ttm_resource struct ttm_resource from incompatible pointer type 'int
 nouveau_channel struct tt...
Message-ID: <202008061900.HgVH6jVj%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Kj7319i9nmIyA2yE"
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   f39035176cb854c6d620af7614a60a485ee26818
commit: ad11f45fae37631b0482ebf6543bdd013d3f9336 [6/10] Merge remote-tracking branch 'drm-misc/drm-misc-next' into drm-tip
config: mips-allyesconfig (attached as .config)
compiler: mips-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout ad11f45fae37631b0482ebf6543bdd013d3f9336
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/dispnv50/sor907d.c:29:
>> drivers/gpu/drm/nouveau/nouveau_bo.h:142:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     142 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:146:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     146 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:149:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     149 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:152:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     152 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:156:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     156 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:159:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     159 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:163:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     163 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
--
   In file included from drivers/gpu/drm/nouveau/nouveau_bo.c:37:
>> drivers/gpu/drm/nouveau/nouveau_bo.h:142:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     142 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:146:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     146 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:149:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     149 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:152:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     152 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:156:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     156 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:159:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     159 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:163:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     163 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c: In function 'nouveau_bo_move_init':
>> drivers/gpu/drm/nouveau/nouveau_bo.c:750:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     750 |   {  "COPY", 4, 0xc5b5, nve0_bo_move_copy, nve0_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:750:25: note: (near initialization for '_methods[0].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:751:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     751 |   {  "GRCE", 0, 0xc5b5, nve0_bo_move_copy, nvc0_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:751:25: note: (near initialization for '_methods[1].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:752:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     752 |   {  "COPY", 4, 0xc3b5, nve0_bo_move_copy, nve0_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:752:25: note: (near initialization for '_methods[2].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:753:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     753 |   {  "GRCE", 0, 0xc3b5, nve0_bo_move_copy, nvc0_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:753:25: note: (near initialization for '_methods[3].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:754:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     754 |   {  "COPY", 4, 0xc1b5, nve0_bo_move_copy, nve0_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:754:25: note: (near initialization for '_methods[4].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:755:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     755 |   {  "GRCE", 0, 0xc1b5, nve0_bo_move_copy, nvc0_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:755:25: note: (near initialization for '_methods[5].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:756:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     756 |   {  "COPY", 4, 0xc0b5, nve0_bo_move_copy, nve0_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:756:25: note: (near initialization for '_methods[6].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:757:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     757 |   {  "GRCE", 0, 0xc0b5, nve0_bo_move_copy, nvc0_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:757:25: note: (near initialization for '_methods[7].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:758:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     758 |   {  "COPY", 4, 0xb0b5, nve0_bo_move_copy, nve0_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:758:25: note: (near initialization for '_methods[8].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:759:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     759 |   {  "GRCE", 0, 0xb0b5, nve0_bo_move_copy, nvc0_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:759:25: note: (near initialization for '_methods[9].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:760:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     760 |   {  "COPY", 4, 0xa0b5, nve0_bo_move_copy, nve0_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:760:25: note: (near initialization for '_methods[10].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:761:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     761 |   {  "GRCE", 0, 0xa0b5, nve0_bo_move_copy, nvc0_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:761:25: note: (near initialization for '_methods[11].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:762:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     762 |   { "COPY1", 5, 0x90b8, nvc0_bo_move_copy, nvc0_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:762:25: note: (near initialization for '_methods[12].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:763:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     763 |   { "COPY0", 4, 0x90b5, nvc0_bo_move_copy, nvc0_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:763:25: note: (near initialization for '_methods[13].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:764:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     764 |   {  "COPY", 0, 0x85b5, nva3_bo_move_copy, nv50_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:764:25: note: (near initialization for '_methods[14].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:765:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     765 |   { "CRYPT", 0, 0x74c1, nv84_bo_move_exec, nv50_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:765:25: note: (near initialization for '_methods[15].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:766:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     766 |   {  "M2MF", 0, 0x9039, nvc0_bo_move_m2mf, nvc0_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:766:25: note: (near initialization for '_methods[16].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:767:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     767 |   {  "M2MF", 0, 0x5039, nv50_bo_move_m2mf, nv50_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:767:25: note: (near initialization for '_methods[17].exec')
   drivers/gpu/drm/nouveau/nouveau_bo.c:768:25: error: initialization of 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_resource *, struct ttm_resource *)' from incompatible pointer type 'int (*)(struct nouveau_channel *, struct ttm_buffer_object *, struct ttm_mem_reg *, struct ttm_mem_reg *)' [-Werror=incompatible-pointer-types]
     768 |   {  "M2MF", 0, 0x0039, nv04_bo_move_m2mf, nv04_bo_move_init },
         |                         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.c:768:25: note: (near initialization for '_methods[18].exec')
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/nouveau/nouveau_bo0039.c:29:
>> drivers/gpu/drm/nouveau/nouveau_bo.h:142:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     142 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:146:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     146 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:149:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     149 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:152:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     152 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:156:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     156 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:159:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     159 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:163:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     163 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
>> drivers/gpu/drm/nouveau/nouveau_bo0039.c:39:46: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
      39 |         struct nouveau_channel *chan, struct ttm_mem_reg *reg)
         |                                              ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo0039.c: In function 'nouveau_bo_mem_ctxdma':
>> drivers/gpu/drm/nouveau/nouveau_bo0039.c:41:9: error: dereferencing pointer to incomplete type 'struct ttm_mem_reg'
      41 |  if (reg->mem_type == TTM_PL_TT)
         |         ^~
   drivers/gpu/drm/nouveau/nouveau_bo0039.c: At top level:
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:48:12: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
      48 |     struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
         |            ^~~~~~~~~~~
>> drivers/gpu/drm/nouveau/nouveau_bo0039.c:47:1: error: conflicting types for 'nv04_bo_move_m2mf'
      47 | nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
         | ^~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/nouveau/nouveau_bo0039.c:29:
   drivers/gpu/drm/nouveau/nouveau_bo.h:141:5: note: previous declaration of 'nv04_bo_move_m2mf' was here
     141 | int nv04_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
         |     ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo0039.c: In function 'nv04_bo_move_m2mf':
>> drivers/gpu/drm/nouveau/nouveau_bo0039.c:51:51: error: passing argument 3 of 'nouveau_bo_mem_ctxdma' from incompatible pointer type [-Werror=incompatible-pointer-types]
      51 |  u32 src_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, old_reg);
         |                                                   ^~~~~~~
         |                                                   |
         |                                                   struct ttm_mem_reg *
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:39:59: note: expected 'struct ttm_mem_reg *' but argument is of type 'struct ttm_mem_reg *'
      39 |         struct nouveau_channel *chan, struct ttm_mem_reg *reg)
         |                                       ~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:52:26: error: dereferencing pointer to incomplete type 'struct ttm_mem_reg'
      52 |  u32 src_offset = old_reg->start << PAGE_SHIFT;
         |                          ^~
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:53:51: error: passing argument 3 of 'nouveau_bo_mem_ctxdma' from incompatible pointer type [-Werror=incompatible-pointer-types]
      53 |  u32 dst_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, new_reg);
         |                                                   ^~~~~~~
         |                                                   |
         |                                                   struct ttm_mem_reg *
   drivers/gpu/drm/nouveau/nouveau_bo0039.c:39:59: note: expected 'struct ttm_mem_reg *' but argument is of type 'struct ttm_mem_reg *'
      39 |         struct nouveau_channel *chan, struct ttm_mem_reg *reg)
         |                                       ~~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/nouveau/nouveau_bo5039.c:29:
>> drivers/gpu/drm/nouveau/nouveau_bo.h:142:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     142 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:146:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     146 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:149:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     149 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:152:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     152 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:156:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     156 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:159:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     159 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:163:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     163 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:40:12: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
      40 |     struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
         |            ^~~~~~~~~~~
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:39:1: error: conflicting types for 'nv50_bo_move_m2mf'
      39 | nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
         | ^~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/nouveau/nouveau_bo5039.c:29:
   drivers/gpu/drm/nouveau/nouveau_bo.h:145:5: note: previous declaration of 'nv50_bo_move_m2mf' was here
     145 | int nv50_bo_move_m2mf(struct nouveau_channel *, struct ttm_buffer_object *,
         |     ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo5039.c: In function 'nv50_bo_move_m2mf':
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:42:40: error: passing argument 1 of 'nouveau_mem' from incompatible pointer type [-Werror=incompatible-pointer-types]
      42 |  struct nouveau_mem *mem = nouveau_mem(old_reg);
         |                                        ^~~~~~~
         |                                        |
         |                                        struct ttm_mem_reg *
   In file included from drivers/gpu/drm/nouveau/nouveau_bo5039.c:32:
   drivers/gpu/drm/nouveau/nouveau_mem.h:10:34: note: expected 'struct ttm_resource *' but argument is of type 'struct ttm_mem_reg *'
      10 | nouveau_mem(struct ttm_resource *reg)
         |             ~~~~~~~~~~~~~~~~~~~~~^~~
>> drivers/gpu/drm/nouveau/nouveau_bo5039.c:44:23: error: dereferencing pointer to incomplete type 'struct ttm_mem_reg'
      44 |  u64 length = (new_reg->num_pages << PAGE_SHIFT);
         |                       ^~
   drivers/gpu/drm/nouveau/nouveau_bo5039.c:48:32: error: passing argument 1 of 'nouveau_mem' from incompatible pointer type [-Werror=incompatible-pointer-types]
      48 |  int dst_tiled = !!nouveau_mem(new_reg)->kind;
         |                                ^~~~~~~
         |                                |
         |                                struct ttm_mem_reg *
   In file included from drivers/gpu/drm/nouveau/nouveau_bo5039.c:32:
   drivers/gpu/drm/nouveau/nouveau_mem.h:10:34: note: expected 'struct ttm_resource *' but argument is of type 'struct ttm_mem_reg *'
      10 | nouveau_mem(struct ttm_resource *reg)
         |             ~~~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/nouveau/nouveau_bo74c1.c:29:
>> drivers/gpu/drm/nouveau/nouveau_bo.h:142:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     142 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:146:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     146 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:149:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     149 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:152:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     152 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:156:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     156 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:159:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     159 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo.h:163:16: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
     163 |         struct ttm_mem_reg *, struct ttm_mem_reg *);
         |                ^~~~~~~~~~~
>> drivers/gpu/drm/nouveau/nouveau_bo74c1.c:37:12: warning: 'struct ttm_mem_reg' declared inside parameter list will not be visible outside of this definition or declaration
      37 |     struct ttm_mem_reg *old_reg, struct ttm_mem_reg *new_reg)
         |            ^~~~~~~~~~~
>> drivers/gpu/drm/nouveau/nouveau_bo74c1.c:36:1: error: conflicting types for 'nv84_bo_move_exec'
      36 | nv84_bo_move_exec(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
         | ^~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/nouveau/nouveau_bo74c1.c:29:
   drivers/gpu/drm/nouveau/nouveau_bo.h:148:5: note: previous declaration of 'nv84_bo_move_exec' was here
     148 | int nv84_bo_move_exec(struct nouveau_channel *, struct ttm_buffer_object *,
         |     ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo74c1.c: In function 'nv84_bo_move_exec':
>> drivers/gpu/drm/nouveau/nouveau_bo74c1.c:39:40: error: passing argument 1 of 'nouveau_mem' from incompatible pointer type [-Werror=incompatible-pointer-types]
      39 |  struct nouveau_mem *mem = nouveau_mem(old_reg);
         |                                        ^~~~~~~
         |                                        |
         |                                        struct ttm_mem_reg *
   In file included from drivers/gpu/drm/nouveau/nouveau_bo74c1.c:31:
   drivers/gpu/drm/nouveau/nouveau_mem.h:10:34: note: expected 'struct ttm_resource *' but argument is of type 'struct ttm_mem_reg *'
      10 | nouveau_mem(struct ttm_resource *reg)
         |             ~~~~~~~~~~~~~~~~~~~~~^~~
   In file included from drivers/gpu/drm/nouveau/nouveau_chan.h:6,
                    from drivers/gpu/drm/nouveau/nouveau_dma.h:31,
                    from drivers/gpu/drm/nouveau/nouveau_bo74c1.c:30:
>> drivers/gpu/drm/nouveau/nouveau_bo74c1.c:47:41: error: dereferencing pointer to incomplete type 'struct ttm_mem_reg'
      47 |  PUSH_NVSQ(push, NV74C1, 0x0304, new_reg->num_pages << PAGE_SHIFT,
         |                                         ^~
   drivers/gpu/drm/nouveau/include/nvif/push.h:84:12: note: in definition of macro 'PUSH_DATA__'
      84 |  u32 _d = (d);                                      \
         |            ^
   drivers/gpu/drm/nouveau/include/nvif/push.h:128:2: note: in expansion of macro 'PUSH_DATA_'
     128 |  PUSH_##f(X, (p), X##mA, 1, o, (dA), ds, "");                   \
         |  ^~~~~
   drivers/gpu/drm/nouveau/include/nvif/push.h:132:2: note: in expansion of macro 'PUSH_1'
     132 |  PUSH_1(X, DATA_, 1, ds, (c)+(n), o, (p), s, X##mA, (dA), ##a); \
         |  ^~~~~~
   drivers/gpu/drm/nouveau/include/nvif/push.h:137:2: note: in expansion of macro 'PUSH_2'
     137 |  PUSH_2(X, DATA_, 1, ds, (c)+(n), o, (p), s, X##mA, (dA), ##a); \
         |  ^~~~~~
   drivers/gpu/drm/nouveau/include/nvif/push.h:142:2: note: in expansion of macro 'PUSH_3'
     142 |  PUSH_3(X, DATA_, 1, ds, (c)+(n), o, (p), s, X##mA, (dA), ##a); \
         |  ^~~~~~
   drivers/gpu/drm/nouveau/include/nvif/push.h:147:2: note: in expansion of macro 'PUSH_4'
     147 |  PUSH_4(X, DATA_, 1, ds, (c)+(n), o, (p), s, X##mA, (dA), ##a); \
         |  ^~~~~~
   drivers/gpu/drm/nouveau/include/nvif/push.h:152:2: note: in expansion of macro 'PUSH_5'
     152 |  PUSH_5(X, DATA_, 1, ds, (c)+(n), o, (p), s, X##mA, (dA), ##a); \
         |  ^~~~~~
   drivers/gpu/drm/nouveau/include/nvif/push.h:197:2: note: in expansion of macro 'PUSH_6'
     197 |  PUSH_6(X, DATA_, 1, 1, 0, o, (p), s, X##mF, (dF),    \
         |  ^~~~~~
   drivers/gpu/drm/nouveau/include/nvif/push.h:252:73: note: in expansion of macro 'PUSH_6D'
     252 | #define PUSH_(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,IMPL,...) IMPL
         |                                                                         ^~~~
   drivers/gpu/drm/nouveau/include/nvif/push.h:272:25: note: in expansion of macro 'PUSH'
     272 | #define PUSH_NVSQ(A...) PUSH(MTHD, ##A)
         |                         ^~~~
   drivers/gpu/drm/nouveau/nouveau_bo74c1.c:47:2: note: in expansion of macro 'PUSH_NVSQ'
      47 |  PUSH_NVSQ(push, NV74C1, 0x0304, new_reg->num_pages << PAGE_SHIFT,
         |  ^~~~~~~~~
   cc1: some warnings being treated as errors
..

vim +750 drivers/gpu/drm/nouveau/nouveau_bo.c

6ee738610f41b5 Ben Skeggs  2009-12-11  737  
d1b167e168bdac Ben Skeggs  2012-05-04  738  void
49981046e3dc2f Ben Skeggs  2012-08-06  739  nouveau_bo_move_init(struct nouveau_drm *drm)
d1b167e168bdac Ben Skeggs  2012-05-04  740  {
72ecb0a6ce89dd James Jones 2019-12-16  741  	static const struct _method_table {
d1b167e168bdac Ben Skeggs  2012-05-04  742  		const char *name;
1a46098e910b96 Ben Skeggs  2012-05-04  743  		int engine;
315a8b2edf5171 Ben Skeggs  2015-08-20  744  		s32 oclass;
d1b167e168bdac Ben Skeggs  2012-05-04  745  		int (*exec)(struct nouveau_channel *,
d1b167e168bdac Ben Skeggs  2012-05-04  746  			    struct ttm_buffer_object *,
2966141ad2dda2 Dave Airlie 2020-08-04  747  			    struct ttm_resource *, struct ttm_resource *);
d1b167e168bdac Ben Skeggs  2012-05-04  748  		int (*init)(struct nouveau_channel *, u32 handle);
d1b167e168bdac Ben Skeggs  2012-05-04  749  	} _methods[] = {
c36322d23d5d84 Ben Skeggs  2018-12-11 @750  		{  "COPY", 4, 0xc5b5, nve0_bo_move_copy, nve0_bo_move_init },
c36322d23d5d84 Ben Skeggs  2018-12-11  751  		{  "GRCE", 0, 0xc5b5, nve0_bo_move_copy, nvc0_bo_move_init },
6e1f34e33c17f6 Ben Skeggs  2018-05-08  752  		{  "COPY", 4, 0xc3b5, nve0_bo_move_copy, nve0_bo_move_init },
6e1f34e33c17f6 Ben Skeggs  2018-05-08  753  		{  "GRCE", 0, 0xc3b5, nve0_bo_move_copy, nvc0_bo_move_init },
146cfe2476ce37 Ben Skeggs  2016-07-09  754  		{  "COPY", 4, 0xc1b5, nve0_bo_move_copy, nve0_bo_move_init },
146cfe2476ce37 Ben Skeggs  2016-07-09  755  		{  "GRCE", 0, 0xc1b5, nve0_bo_move_copy, nvc0_bo_move_init },
8e7e1586c58a5e Ben Skeggs  2016-07-09  756  		{  "COPY", 4, 0xc0b5, nve0_bo_move_copy, nve0_bo_move_init },
8e7e1586c58a5e Ben Skeggs  2016-07-09  757  		{  "GRCE", 0, 0xc0b5, nve0_bo_move_copy, nvc0_bo_move_init },
990b4547042a94 Ben Skeggs  2015-04-14  758  		{  "COPY", 4, 0xb0b5, nve0_bo_move_copy, nve0_bo_move_init },
990b4547042a94 Ben Skeggs  2015-04-14  759  		{  "GRCE", 0, 0xb0b5, nve0_bo_move_copy, nvc0_bo_move_init },
00fc6f6f731efb Ben Skeggs  2013-07-09  760  		{  "COPY", 4, 0xa0b5, nve0_bo_move_copy, nve0_bo_move_init },
49981046e3dc2f Ben Skeggs  2012-08-06  761  		{  "GRCE", 0, 0xa0b5, nve0_bo_move_copy, nvc0_bo_move_init },
1a46098e910b96 Ben Skeggs  2012-05-04  762  		{ "COPY1", 5, 0x90b8, nvc0_bo_move_copy, nvc0_bo_move_init },
1a46098e910b96 Ben Skeggs  2012-05-04  763  		{ "COPY0", 4, 0x90b5, nvc0_bo_move_copy, nvc0_bo_move_init },
1a46098e910b96 Ben Skeggs  2012-05-04  764  		{  "COPY", 0, 0x85b5, nva3_bo_move_copy, nv50_bo_move_init },
1a46098e910b96 Ben Skeggs  2012-05-04  765  		{ "CRYPT", 0, 0x74c1, nv84_bo_move_exec, nv50_bo_move_init },
1a46098e910b96 Ben Skeggs  2012-05-04  766  		{  "M2MF", 0, 0x9039, nvc0_bo_move_m2mf, nvc0_bo_move_init },
1a46098e910b96 Ben Skeggs  2012-05-04  767  		{  "M2MF", 0, 0x5039, nv50_bo_move_m2mf, nv50_bo_move_init },
1a46098e910b96 Ben Skeggs  2012-05-04  768  		{  "M2MF", 0, 0x0039, nv04_bo_move_m2mf, nv04_bo_move_init },
5490e5dfb9e9d6 Ben Skeggs  2012-05-04  769  		{},
72ecb0a6ce89dd James Jones 2019-12-16  770  	};
72ecb0a6ce89dd James Jones 2019-12-16  771  	const struct _method_table *mthd = _methods;
d1b167e168bdac Ben Skeggs  2012-05-04  772  	const char *name = "CPU";
d1b167e168bdac Ben Skeggs  2012-05-04  773  	int ret;
d1b167e168bdac Ben Skeggs  2012-05-04  774  
d1b167e168bdac Ben Skeggs  2012-05-04  775  	do {
49981046e3dc2f Ben Skeggs  2012-08-06  776  		struct nouveau_channel *chan;
ebb945a94bba2c Ben Skeggs  2012-07-20  777  
00fc6f6f731efb Ben Skeggs  2013-07-09  778  		if (mthd->engine)
49981046e3dc2f Ben Skeggs  2012-08-06  779  			chan = drm->cechan;
49981046e3dc2f Ben Skeggs  2012-08-06  780  		else
49981046e3dc2f Ben Skeggs  2012-08-06  781  			chan = drm->channel;
49981046e3dc2f Ben Skeggs  2012-08-06  782  		if (chan == NULL)
49981046e3dc2f Ben Skeggs  2012-08-06  783  			continue;
49981046e3dc2f Ben Skeggs  2012-08-06  784  
9ac596a4e875e2 Ben Skeggs  2020-03-30  785  		ret = nvif_object_ctor(&chan->user, "ttmBoMove",
0ad72863ea426d Ben Skeggs  2014-08-10  786  				       mthd->oclass | (mthd->engine << 16),
0ad72863ea426d Ben Skeggs  2014-08-10  787  				       mthd->oclass, NULL, 0,
0ad72863ea426d Ben Skeggs  2014-08-10  788  				       &drm->ttm.copy);
d1b167e168bdac Ben Skeggs  2012-05-04  789  		if (ret == 0) {
0ad72863ea426d Ben Skeggs  2014-08-10  790  			ret = mthd->init(chan, drm->ttm.copy.handle);
ebb945a94bba2c Ben Skeggs  2012-07-20  791  			if (ret) {
9ac596a4e875e2 Ben Skeggs  2020-03-30  792  				nvif_object_dtor(&drm->ttm.copy);
ebb945a94bba2c Ben Skeggs  2012-07-20  793  				continue;
ebb945a94bba2c Ben Skeggs  2012-07-20  794  			}
ebb945a94bba2c Ben Skeggs  2012-07-20  795  
ebb945a94bba2c Ben Skeggs  2012-07-20  796  			drm->ttm.move = mthd->exec;
1bb3f6a252c92c Ben Skeggs  2013-07-08  797  			drm->ttm.chan = chan;
d1b167e168bdac Ben Skeggs  2012-05-04  798  			name = mthd->name;
d1b167e168bdac Ben Skeggs  2012-05-04  799  			break;
d1b167e168bdac Ben Skeggs  2012-05-04  800  		}
d1b167e168bdac Ben Skeggs  2012-05-04  801  	} while ((++mthd)->exec);
d1b167e168bdac Ben Skeggs  2012-05-04  802  
ebb945a94bba2c Ben Skeggs  2012-07-20  803  	NV_INFO(drm, "MM: using %s for buffer copies\n", name);
d1b167e168bdac Ben Skeggs  2012-05-04  804  }
d1b167e168bdac Ben Skeggs  2012-05-04  805  

:::::: The code at line 750 was first introduced by commit
:::::: c36322d23d5d84cbe03c93beaa5dd6c705d48122 drm/nouveau/ce/tu104: initial support

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--Kj7319i9nmIyA2yE
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--Kj7319i9nmIyA2yE--
