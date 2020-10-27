Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3807429B01A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 15:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113816E210;
	Tue, 27 Oct 2020 14:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAC06E210;
 Tue, 27 Oct 2020 14:16:25 +0000 (UTC)
IronPort-SDR: gSAw9uO4mx2MJaBXEz4At+8MJns25GeY22zECk2Z4aJVFD+GSqmDbuksv6nMjvPhXWTj+OMFR6
 ZijnO15TifPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="229724344"
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; 
 d="gz'50?scan'50,208,50";a="229724344"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 07:16:24 -0700
IronPort-SDR: Y97s6ZB+Ciqc8nWQpcOOqLl0PnoS1qt4QmnuaPcxxczT5hpnpBC/oMA5qGwc6QF35EjVUB1z8F
 DG2zLnKmKi1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; 
 d="gz'50?scan'50,208,50";a="318238847"
Received: from lkp-server01.sh.intel.com (HELO ef28dff175aa) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 27 Oct 2020 07:16:21 -0700
Received: from kbuild by ef28dff175aa with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kXPls-0000KA-Eq; Tue, 27 Oct 2020 14:16:20 +0000
Date: Tue, 27 Oct 2020 22:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/4] disp/msm/dpu: add support to dump dpu registers
Message-ID: <202010272209.bbn0iOt0-lkp@intel.com>
References: <20201022050148.27105-3-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <20201022050148.27105-3-abhinavk@codeaurora.org>
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
Cc: kbuild-all@lists.01.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, swboyd@chromium.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Abhinav,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on drm-intel/for-linux-next tegra-drm/drm/tegra/for-next drm-tip/drm-tip linus/master v5.10-rc1 next-20201027]
[cannot apply to drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Abhinav-Kumar/Add-devcoredump-support-for-DPU/20201022-130507
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
config: arm64-randconfig-s032-20201026 (attached as .config)
compiler: aarch64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-56-gc09e8239-dirty
        # https://github.com/0day-ci/linux/commit/a7e6907c303a46ea8422fc3c414c22fdfb45d49f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Abhinav-Kumar/Add-devcoredump-support-for-DPU/20201022-130507
        git checkout a7e6907c303a46ea8422fc3c414c22fdfb45d49f
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=arm64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
>> drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:99:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got char * @@
>> drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:99:50: sparse:     expected void const volatile [noderef] __iomem *addr
>> drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:99:50: sparse:     got char *
   drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:100:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got char * @@
   drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:100:56: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:100:56: sparse:     got char *
   drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:102:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got char * @@
   drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:102:56: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:102:56: sparse:     got char *
   drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:104:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got char * @@
   drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:104:56: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:104:56: sparse:     got char *
>> drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:211:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char *addr @@     got void [noderef] __iomem * @@
>> drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:211:30: sparse:     expected char *addr
>> drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:211:30: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:220:44: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected char *base_addr @@     got void [noderef] __iomem *base @@
>> drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:220:44: sparse:     expected char *base_addr
>> drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:220:44: sparse:     got void [noderef] __iomem *base
>> drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:229:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char *addr @@     got void [noderef] __iomem *base @@
   drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:229:22: sparse:     expected char *addr
   drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:229:22: sparse:     got void [noderef] __iomem *base
   drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:232:36: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected char *base_addr @@     got void [noderef] __iomem *base @@
   drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:232:36: sparse:     expected char *base_addr
   drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c:232:36: sparse:     got void [noderef] __iomem *base

vim +99 drivers/gpu/drm/msm/disp/dpu1/dpu_dbg_util.c

    20	
    21	/**
    22	 * _dpu_dump_reg - helper function for dumping rotator register set content
    23	 * @dump_name: register set name
    24	 * @reg_dump_flag: dumping flag controlling in-log/memory dump location
    25	 * @base_addr: starting address of io region for calculating offsets to print
    26	 * @addr: starting address offset for dumping
    27	 * @len_bytes: range of the register set
    28	 * @dump_mem: output buffer for memory dump location option
    29	 * @from_isr: whether being called from isr context
    30	 */
    31	static void _dpu_dump_reg(struct dpu_dbg_base *dbg_base,
    32			const char *dump_name, u32 reg_dump_flag,
    33			char *base_addr, char *addr, size_t len_bytes, u32 **dump_mem)
    34	{
    35		u32 in_log, in_mem, len_align, len_padded, in_dump;
    36		u32 *dump_addr = NULL;
    37		char *end_addr;
    38		int i;
    39		int rc;
    40	
    41		if (!len_bytes)
    42			return;
    43	
    44		in_log = (reg_dump_flag & DPU_DBG_DUMP_IN_LOG);
    45		in_mem = (reg_dump_flag & DPU_DBG_DUMP_IN_MEM);
    46		in_dump = (reg_dump_flag & DPU_DBG_DUMP_IN_COREDUMP);
    47	
    48		pr_debug("%s: reg_dump_flag=%d in_log=%d in_mem=%d\n",
    49			dump_name, reg_dump_flag, in_log, in_mem);
    50	
    51		if (!in_log && !in_mem && !in_dump)
    52			return;
    53	
    54		if (in_log)
    55			dev_info(dbg_base->dev, "%s: start_offset 0x%lx len 0x%zx\n",
    56					dump_name, (unsigned long)(addr - base_addr),
    57						len_bytes);
    58	
    59		len_align = (len_bytes + REG_DUMP_ALIGN - 1) / REG_DUMP_ALIGN;
    60		len_padded = len_align * REG_DUMP_ALIGN;
    61		end_addr = addr + len_bytes;
    62	
    63		if (in_mem || in_dump) {
    64			if (dump_mem && !(*dump_mem))
    65				*dump_mem = devm_kzalloc(dbg_base->dev, len_padded,
    66						GFP_KERNEL);
    67	
    68			if (dump_mem && *dump_mem) {
    69				dump_addr = *dump_mem;
    70				dev_info(dbg_base->dev,
    71					"%s: start_addr:0x%pK len:0x%x reg_offset=0x%lx\n",
    72					dump_name, dump_addr, len_padded,
    73					(unsigned long)(addr - base_addr));
    74				if (in_dump)
    75					drm_printf(dbg_base->dpu_dbg_printer,
    76							"%s: start_addr:0x%pK len:0x%x reg_offset=0x%lx\n",
    77							dump_name, dump_addr,
    78							len_padded,
    79							(unsigned long)(addr -
    80							base_addr));
    81			} else {
    82				in_mem = 0;
    83				pr_err("dump_mem: kzalloc fails!\n");
    84			}
    85		}
    86	
    87		if (_dpu_power_check(dbg_base->dump_mode)) {
    88			rc = pm_runtime_get_sync(dbg_base->dev);
    89			if (rc < 0) {
    90				pr_err("failed to enable power %d\n", rc);
    91				return;
    92			}
    93		}
    94	
    95		for (i = 0; i < len_align; i++) {
    96			u32 x0, x4, x8, xc;
    97	
    98			if (in_log || in_mem) {
  > 99				x0 = (addr < end_addr) ? readl_relaxed(addr + 0x0) : 0;
   100				x4 = (addr + 0x4 < end_addr) ? readl_relaxed(addr +
   101						0x4) : 0;
   102				x8 = (addr + 0x8 < end_addr) ? readl_relaxed(addr +
   103						0x8) : 0;
   104				xc = (addr + 0xc < end_addr) ? readl_relaxed(addr +
   105						0xc) : 0;
   106			}
   107	
   108			if (in_log)
   109				dev_info(dbg_base->dev,
   110						"0x%lx : %08x %08x %08x %08x\n",
   111						(unsigned long)(addr - base_addr),
   112						x0, x4, x8, xc);
   113	
   114			if (dump_addr && in_mem) {
   115				dump_addr[i * 4] = x0;
   116				dump_addr[i * 4 + 1] = x4;
   117				dump_addr[i * 4 + 2] = x8;
   118				dump_addr[i * 4 + 3] = xc;
   119			}
   120	
   121			if (in_dump) {
   122				drm_printf(dbg_base->dpu_dbg_printer,
   123						"0x%lx : %08x %08x %08x %08x\n",
   124						(unsigned long)(addr - base_addr),
   125						dump_addr[i * 4],
   126						dump_addr[i * 4 + 1],
   127						dump_addr[i * 4 + 2],
   128						dump_addr[i * 4 + 3]);
   129	
   130			}
   131	
   132			addr += REG_DUMP_ALIGN;
   133		}
   134	
   135		if (_dpu_power_check(dbg_base->dump_mode))
   136			pm_runtime_put_sync(dbg_base->dev);
   137	}
   138	
   139	/**
   140	 * _dpu_dbg_get_dump_range - helper to retrieve dump length for a range node
   141	 * @range_node: range node to dump
   142	 * @max_offset: max offset of the register base
   143	 * @Return: length
   144	 */
   145	static u32 _dpu_dbg_get_dump_range(struct dpu_dbg_reg_offset *range_node,
   146			size_t max_offset)
   147	{
   148		u32 length = 0;
   149	
   150		if (range_node->start == 0 && range_node->end == 0) {
   151			length = max_offset;
   152		} else if (range_node->start < max_offset) {
   153			if (range_node->end > max_offset)
   154				length = max_offset - range_node->start;
   155			else if (range_node->start < range_node->end)
   156				length = range_node->end - range_node->start;
   157		}
   158	
   159		return length;
   160	}
   161	
   162	static int _dpu_dump_reg_range_cmp(void *priv, struct list_head *a,
   163			struct list_head *b)
   164	{
   165		struct dpu_dbg_reg_range *ar, *br;
   166	
   167		if (!a || !b)
   168			return 0;
   169	
   170		ar = container_of(a, struct dpu_dbg_reg_range, head);
   171		br = container_of(b, struct dpu_dbg_reg_range, head);
   172	
   173		return ar->offset.start - br->offset.start;
   174	}
   175	
   176	/**
   177	 * _dpu_dump_reg_by_ranges - dump ranges or full range of the register blk base
   178	 * @dbg: register blk base structure
   179	 * @reg_dump_flag: dump target, memory, kernel log, or both
   180	 */
   181	static void _dpu_dump_reg_by_ranges(struct dpu_dbg_base *dbg_base,
   182			struct dpu_dbg_reg_base *dbg,
   183			u32 reg_dump_flag)
   184	{
   185		char *addr;
   186		size_t len;
   187		struct dpu_dbg_reg_range *range_node;
   188	
   189		if (!dbg || !(dbg->base || dbg->cb)) {
   190			pr_err("dbg base is null!\n");
   191			return;
   192		}
   193	
   194		dev_info(dbg_base->dev, "%s:=========%s DUMP=========\n", __func__,
   195				dbg->name);
   196	
   197		if (reg_dump_flag & DPU_DBG_DUMP_IN_COREDUMP)
   198			drm_printf(dbg_base->dpu_dbg_printer,
   199					"%s:=========%s DUMP=========\n",
   200					__func__, dbg->name);
   201	
   202		if (dbg->cb) {
   203			dbg->cb(dbg->cb_ptr);
   204		/* If there is a list to dump the registers by ranges, use the ranges */
   205		} else if (!list_empty(&dbg->sub_range_list)) {
   206			/* sort the list by start address first */
   207			list_sort(NULL, &dbg->sub_range_list, _dpu_dump_reg_range_cmp);
   208			list_for_each_entry(range_node, &dbg->sub_range_list, head) {
   209				len = _dpu_dbg_get_dump_range(&range_node->offset,
   210					dbg->max_offset);
 > 211				addr = dbg->base + range_node->offset.start;
   212	
   213				pr_debug("%s: range_base=0x%pK start=0x%x end=0x%x\n",
   214					range_node->range_name,
   215					addr, range_node->offset.start,
   216					range_node->offset.end);
   217	
   218				_dpu_dump_reg(dbg_base, range_node->range_name,
   219						reg_dump_flag,
 > 220						dbg->base, addr, len,
   221						&range_node->reg_dump);
   222			}
   223		} else {
   224			/* If there is no list to dump ranges, dump all registers */
   225			dev_info(dbg_base->dev,
   226					"Ranges not found, will dump full registers\n");
   227			dev_info(dbg_base->dev, "base:0x%pK len:0x%zx\n", dbg->base,
   228					dbg->max_offset);
 > 229			addr = dbg->base;
   230			len = dbg->max_offset;
   231			_dpu_dump_reg(dbg_base, dbg->name, reg_dump_flag,
   232					dbg->base, addr, len,
   233					&dbg->reg_dump);
   234		}
   235	}
   236	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--UugvWAfsgieZRqgk
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--UugvWAfsgieZRqgk
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--UugvWAfsgieZRqgk--
