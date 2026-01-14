Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5FD203CC
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 17:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA8910E63C;
	Wed, 14 Jan 2026 16:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VObgL1A3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F79110E2AB;
 Wed, 14 Jan 2026 16:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768408626; x=1799944626;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=E8RIcN9R+L5K9uirA6NlzA+r2qmPrPFCBl8xyWyV8yY=;
 b=VObgL1A3/mVnxixgO00z27BGHpqPL7vekDprwQnsi880TFys4XgM7sWP
 eAQSiCLLeWCmaIa3OfOFEMN+tJcLYCwbg9ffcaBcXJOE99lw4LV7RkiZQ
 6kx4wEWu6VPAJHiqZ/dq9eJ9jAVKpVa3XRVcz5GFWnGwGw1aZAaQ/1LrD
 EImkU+5ImnXaeTSrYAhRD+DsPQK78hby7g2XAci0oevr2H9IXrM0GfoRW
 9SHrzjDS0hjgD8hYqAFnyjIRfPJxOhgv3Uh1fErzFLqJiS/nncD8v/mV5
 +806/ZRXcB4XPVFLFRJ1EEC2ADUJQuwFdEAKmKfsIe4bvw1H9wR/ICf19 Q==;
X-CSE-ConnectionGUID: WmsH9pTsRMCj3XGRshhY+A==
X-CSE-MsgGUID: KUAVnU8DTI+fCrKcUqCy5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92381914"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="92381914"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 08:37:05 -0800
X-CSE-ConnectionGUID: CKbvLsaSQMiv2EPNqWL0Xw==
X-CSE-MsgGUID: mBjtWAiQTpqONdYkXrUgVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="209193588"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 14 Jan 2026 08:37:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vg3re-00000000Gei-1aER;
 Wed, 14 Jan 2026 16:36:58 +0000
Date: Thu, 15 Jan 2026 00:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 1/3] soc: qcom: smem: Expose DDR data from SMEM
Message-ID: <202601150105.Pod3agMP-lkp@intel.com>
References: <20260108-topic-smem_dramc-v3-1-6b64df58a017@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-topic-smem_dramc-v3-1-6b64df58a017@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Konrad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fc4e91c639c0af93d63c3d5bc0ee45515dd7504a]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/soc-qcom-smem-Expose-DDR-data-from-SMEM/20260108-222445
base:   fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
patch link:    https://lore.kernel.org/r/20260108-topic-smem_dramc-v3-1-6b64df58a017%40oss.qualcomm.com
patch subject: [PATCH v3 1/3] soc: qcom: smem: Expose DDR data from SMEM
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260115/202601150105.Pod3agMP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150105.Pod3agMP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150105.Pod3agMP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'smem_dram_parse_v3_data',
       inlined from 'smem_dram_parse' at drivers/soc/qcom/smem_dramc.c:380:3:
>> drivers/soc/qcom/smem_dramc.c:216:31: warning: iteration 13 invokes undefined behavior [-Waggressive-loop-optimizations]
     216 |                 if (freq_entry->freq_khz && freq_entry->enabled)
         |                     ~~~~~~~~~~^~~~~~~~~~
   drivers/soc/qcom/smem_dramc.c:213:27: note: within this loop
     213 |         for (int i = 0; i < num_freq_entries; i++) {
         |                         ~~^~~~~~~~~~~~~~~~~~
--
>> Warning: drivers/soc/qcom/smem.c:293 struct member 'debugfs_dir' not described in 'qcom_smem'
>> Warning: drivers/soc/qcom/smem.c:293 struct member 'debugfs_dir' not described in 'qcom_smem'


vim +216 drivers/soc/qcom/smem_dramc.c

   203	
   204	static void smem_dram_parse_v3_data(struct smem_dram *dram, void *data, bool additional_freq_entry)
   205	{
   206		/* This may be 13 or 14 */
   207		int num_freq_entries = MAX_DDR_FREQ_NUM_V3;
   208		struct ddr_details_v3 *details = data;
   209	
   210		if (additional_freq_entry)
   211			num_freq_entries++;
   212	
   213		for (int i = 0; i < num_freq_entries; i++) {
   214			struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
   215	
 > 216			if (freq_entry->freq_khz && freq_entry->enabled)
   217				dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
   218		}
   219	}
   220	
   221	static void smem_dram_parse_v4_data(struct smem_dram *dram, void *data)
   222	{
   223		struct ddr_details_v4 *details = data;
   224	
   225		/* Rank 0 channel 0 entry holds the correct value */
   226		dram->hbb = details->highest_bank_addr_bit[0][0];
   227	
   228		for (int i = 0; i < MAX_DDR_FREQ_NUM_V3; i++) {
   229			struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
   230	
   231			if (freq_entry->freq_khz && freq_entry->enabled)
   232				dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
   233		}
   234	}
   235	
   236	static void smem_dram_parse_v5_data(struct smem_dram *dram, void *data)
   237	{
   238		struct ddr_details_v5 *details = data;
   239		struct ddr_regions_v5 *region = &details->ddr_regions;
   240	
   241		dram->hbb = region[0].highest_bank_addr_bit;
   242	
   243		for (int i = 0; i < MAX_DDR_FREQ_NUM_V5; i++) {
   244			struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
   245	
   246			if (freq_entry->freq_khz && freq_entry->enabled)
   247				dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
   248		}
   249	}
   250	
   251	static void smem_dram_parse_v7_data(struct smem_dram *dram, void *data)
   252	{
   253		struct ddr_details_v7 *details = data;
   254		struct ddr_regions_v5 *region = &details->ddr_regions;
   255	
   256		dram->hbb = region[0].highest_bank_addr_bit;
   257	
   258		for (int i = 0; i < MAX_DDR_FREQ_NUM_V5; i++) {
   259			struct ddr_freq_table *freq_entry = &details->ddr_freq_tbl.ddr_freq[i];
   260	
   261			if (freq_entry->freq_khz && freq_entry->enabled)
   262				dram->frequencies[dram->num_frequencies++] = 1000 * freq_entry->freq_khz;
   263		}
   264	}
   265	
   266	/* The structure contains no version field, so we have to perform some guesswork.. */
   267	static int smem_dram_infer_struct_version(size_t size)
   268	{
   269		/* Some early versions provided less bytes of less useful data */
   270		if (size < sizeof(struct ddr_details_v3))
   271			return -EINVAL;
   272	
   273		if (size == sizeof(struct ddr_details_v3))
   274			return INFO_V3;
   275	
   276		if (size == sizeof(struct ddr_details_v3)
   277			 + sizeof(struct ddr_freq_table))
   278			return INFO_V3_WITH_14_FREQS;
   279	
   280		if (size == sizeof(struct ddr_details_v4))
   281			return INFO_V4;
   282	
   283		if (size == sizeof(struct ddr_details_v5)
   284			 + 4 * sizeof(struct ddr_region_v5))
   285			return INFO_V5;
   286	
   287		if (size == sizeof(struct ddr_details_v5)
   288			 + 4 * sizeof(struct ddr_region_v5)
   289			 + sizeof(struct ddr_xbl2quantum_smem_data)
   290			 + sizeof(struct shub_freq_plan_entry))
   291			return INFO_V5;
   292	
   293		if (size == sizeof(struct ddr_details_v5)
   294			 + 6 * sizeof(struct ddr_region_v5))
   295			return INFO_V5_WITH_6_REGIONS;
   296	
   297		if (size == sizeof(struct ddr_details_v5)
   298			 + 6 * sizeof(struct ddr_region_v5)
   299			 + sizeof(struct ddr_xbl2quantum_smem_data)
   300			 + sizeof(struct shub_freq_plan_entry))
   301			return INFO_V5_WITH_6_REGIONS;
   302	
   303		if (size == sizeof(struct ddr_details_v5)
   304			 + 6 * sizeof(struct ddr_region_v5)
   305			 + sizeof(struct ddr_misc_info_v6)
   306			 + sizeof(struct shub_freq_plan_entry))
   307			return INFO_V6;
   308	
   309		if (size == sizeof(struct ddr_details_v7)
   310			 + 4 * sizeof(struct ddr_region_v5)
   311			 + sizeof(struct ddr_misc_info_v6)
   312			 + sizeof(struct shub_freq_plan_entry))
   313			return INFO_V7;
   314	
   315		if (size == sizeof(struct ddr_details_v7)
   316			 + 6 * sizeof(struct ddr_region_v5)
   317			 + sizeof(struct ddr_misc_info_v6)
   318			 + sizeof(struct shub_freq_plan_entry))
   319			return INFO_V7_WITH_6_REGIONS;
   320	
   321		return INFO_UNKNOWN;
   322	}
   323	
   324	static int smem_dram_frequencies_show(struct seq_file *s, void *unused)
   325	{
   326		struct smem_dram *dram = s->private;
   327	
   328		for (int i = 0; i < dram->num_frequencies; i++)
   329			seq_printf(s, "%lu\n", dram->frequencies[i]);
   330	
   331		return 0;
   332	}
   333	DEFINE_SHOW_ATTRIBUTE(smem_dram_frequencies);
   334	
   335	static int smem_hbb_show(struct seq_file *s, void *unused)
   336	{
   337		struct smem_dram *dram = s->private;
   338	
   339		if (!dram->hbb)
   340			return -EINVAL;
   341	
   342		seq_printf(s, "%d\n", dram->hbb);
   343	
   344		return 0;
   345	}
   346	DEFINE_SHOW_ATTRIBUTE(smem_hbb);
   347	
   348	struct dentry *smem_dram_parse(struct device *dev)
   349	{
   350		struct dentry *debugfs_dir;
   351		enum ddr_info_version ver;
   352		struct smem_dram *dram;
   353		size_t actual_size;
   354		void *data = NULL;
   355	
   356		/* No need to check qcom_smem_is_available(), this func is called by the SMEM driver */
   357		data = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_DDR_INFO_ID, &actual_size);
   358		if (IS_ERR_OR_NULL(data))
   359			return ERR_PTR(-ENODATA);
   360	
   361		ver = smem_dram_infer_struct_version(actual_size);
   362		if (ver < 0) {
   363			/* Some SoCs don't provide data that's useful for us */
   364			return ERR_PTR(-ENODATA);
   365		} else if (ver == INFO_UNKNOWN) {
   366			/* In other cases, we may not have added support for a newer struct revision */
   367			pr_err("Found an unknown type of DRAM info struct (size = %zu)\n", actual_size);
   368			return ERR_PTR(-EINVAL);
   369		}
   370	
   371		dram = devm_kzalloc(dev, sizeof(*dram), GFP_KERNEL);
   372		if (!dram)
   373			return ERR_PTR(-ENOMEM);
   374	
   375		switch (ver) {
   376		case INFO_V3:
   377			smem_dram_parse_v3_data(dram, data, false);
   378			break;
   379		case INFO_V3_WITH_14_FREQS:
 > 380			smem_dram_parse_v3_data(dram, data, true);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
