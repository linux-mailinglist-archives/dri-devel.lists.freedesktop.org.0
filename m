Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2258541BB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 04:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC4110E1E3;
	Wed, 14 Feb 2024 03:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nqcyJS8J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C11E10E1F7;
 Wed, 14 Feb 2024 03:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707880688; x=1739416688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p6ZccOv71mTvxHd2OM4mStnYdazZUoO85xGrKXDmQfI=;
 b=nqcyJS8JK6obrsz7id79IKBe7lqbu4AUjEsIFTN6AwEgJsWaxcE3N6z8
 jEpNGD4KdZi4NLl79GEksKjBynXYtdvBCbMvmTEnvCjGKABjy9Pj9WkdT
 sR99btKuxSOXXlY4WempilqcVheSmgY6FjGIKM/M5lxwiNeKWPC0NIFSx
 +rTrVMbmTSxbM1BAW6S9mNbMJCiLd8PmhVBP341492SnJLAChTLxHdyix
 3ZIamevkEyqC90pjbbp5vBpSkIsC2ugdzjxUEbFeazIl3odXQoU4YvnpM
 23cSRM30qaFoTAYvrTuFBKnPdE51mAngzrJQNlgb11zSPJv37Ay+EceJw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13302449"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="13302449"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 19:18:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="3364523"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2024 19:18:06 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ra5md-0008Fw-1h;
 Wed, 14 Feb 2024 03:18:03 +0000
Date: Wed, 14 Feb 2024 11:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] [v3] nouveau: add command-line GSP-RM registry support
Message-ID: <202402141030.X3uj4YDf-lkp@intel.com>
References: <20240212211548.1094496-2-ttabi@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212211548.1094496-2-ttabi@nvidia.com>
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

Hi Timur,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next-fixes]
[also build test WARNING on drm-tip/drm-tip linus/master v6.8-rc4 next-20240213]
[cannot apply to drm-misc/drm-misc-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/nouveau-add-command-line-GSP-RM-registry-support/20240213-051852
base:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20240212211548.1094496-2-ttabi%40nvidia.com
patch subject: [PATCH 1/2] [v3] nouveau: add command-line GSP-RM registry support
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240214/202402141030.X3uj4YDf-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141030.X3uj4YDf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402141030.X3uj4YDf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function 'r535_gsp_rpc_set_registry':
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1317:24: warning: variable 'length' set but not used [-Wunused-but-set-variable]
    1317 |                 size_t length;
         |                        ^~~~~~
--
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1246: warning: cannot understand function prototype: 'const struct nv_gsp_registry_entries r535_registry_entries[] = '
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1673: warning: Function parameter or struct member 'priv' not described in 'r535_gsp_msg_run_cpu_sequencer'
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1673: warning: Function parameter or struct member 'fn' not described in 'r535_gsp_msg_run_cpu_sequencer'
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1673: warning: Function parameter or struct member 'repv' not described in 'r535_gsp_msg_run_cpu_sequencer'
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1673: warning: Function parameter or struct member 'repc' not described in 'r535_gsp_msg_run_cpu_sequencer'
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2046: warning: Function parameter or struct member 'gsp' not described in 'r535_gsp_libos_init'
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2186: warning: Function parameter or struct member 'gsp' not described in 'nvkm_gsp_radix3_sg'
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2186: warning: Function parameter or struct member 'sgt' not described in 'nvkm_gsp_radix3_sg'
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2186: warning: Function parameter or struct member 'size' not described in 'nvkm_gsp_radix3_sg'
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:2186: warning: Function parameter or struct member 'rx3' not described in 'nvkm_gsp_radix3_sg'


vim +/length +1317 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

  1235	
  1236	/**
  1237	 * r535_registry_entries - required registry entries for GSP-RM
  1238	 *
  1239	 * This array lists registry entries that are required for GSP-RM to
  1240	 * function correctly.
  1241	 *
  1242	 * RMSecBusResetEnable - enables PCI secondary bus reset
  1243	 * RMForcePcieConfigSave - forces GSP-RM to preserve PCI configuration
  1244	 *   registers on any PCI reset.
  1245	 */
> 1246	static const struct nv_gsp_registry_entries r535_registry_entries[] = {
  1247		{ "RMSecBusResetEnable", 1 },
  1248		{ "RMForcePcieConfigSave", 1 },
  1249	};
  1250	#define NV_GSP_REG_NUM_ENTRIES ARRAY_SIZE(r535_registry_entries)
  1251	
  1252	/**
  1253	 * strip - strips all characters in 'reject' from 's'
  1254	 * @s: string to strip
  1255	 * @reject: string of characters to remove
  1256	 *
  1257	 * 's' is modified.
  1258	 *
  1259	 * Returns the length of the new string.
  1260	 */
  1261	static size_t strip(char *s, const char *reject)
  1262	{
  1263		char *p = s, *p2 = s;
  1264		size_t length = 0;
  1265		char c;
  1266	
  1267		do {
  1268			while ((c = *p2) && strchr(reject, c))
  1269				p2++;
  1270	
  1271			*p++ = c = *p2++;
  1272			length++;
  1273		} while (c);
  1274	
  1275		return length;
  1276	}
  1277	
  1278	/**
  1279	 * r535_gsp_rpc_set_registry - build registry RPC and call GSP-RM
  1280	 * @gsp: gsp pointer
  1281	 *
  1282	 * The GSP-RM registry is a set of key/value pairs that configure some aspects
  1283	 * of GSP-RM. The keys are strings, and the values are 32-bit integers.
  1284	 *
  1285	 * The registry is built from a combination of a static hard-coded list (see
  1286	 * above) and entries passed on the driver's command line.
  1287	 */
  1288	static int
  1289	r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
  1290	{
  1291		PACKED_REGISTRY_TABLE *rpc;
  1292		unsigned int i;
  1293		int ret;
  1294	
  1295		INIT_LIST_HEAD(&gsp->registry_list);
  1296		gsp->registry_rpc_size = sizeof(PACKED_REGISTRY_TABLE);
  1297	
  1298		/* Add the required registry entries first */
  1299		for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
  1300			ret = add_registry_num(gsp, r535_registry_entries[i].name,
  1301					 r535_registry_entries[i].value);
  1302			if (ret) {
  1303				clean_registry(gsp);
  1304				return ret;
  1305			}
  1306		}
  1307	
  1308		/*
  1309		 * The NVreg_RegistryDwords parameter is a string of key=value
  1310		 * pairs separated by semicolons. We need to extract and trim each
  1311		 * substring, and then parse the substring to extract the key and
  1312		 * value.
  1313		 */
  1314		if (NVreg_RegistryDwords) {
  1315			char *p = kstrdup(NVreg_RegistryDwords, GFP_KERNEL);
  1316			char *start, *next = p, *equal;
> 1317			size_t length;
  1318	
  1319			/* Remove any whitespace from the parameter string */
  1320			length = strip(p, " \t\n");
  1321	
  1322			while ((start = strsep(&next, ";"))) {
  1323				long value;
  1324	
  1325				equal = strchr(start, '=');
  1326				if (!equal || (equal == start) || !isdigit(equal[1])) {
  1327					nvkm_error(&gsp->subdev,
  1328						"ignoring invalid registry string '%s'\n", start);
  1329					continue;
  1330				}
  1331	
  1332				ret = kstrtol(equal + 1, 0, &value);
  1333				if (ret) {
  1334					nvkm_error(&gsp->subdev,
  1335						"ignoring invalid registry value in '%s'\n", start);
  1336					continue;
  1337				}
  1338	
  1339				/* Truncate the key=value string to just key */
  1340				*equal = 0;
  1341	
  1342				ret = add_registry_num(gsp, start, value);
  1343				if (ret) {
  1344					nvkm_error(&gsp->subdev,
  1345						"ignoring invalid registry key/value '%s=%lu'\n",
  1346						start, value);
  1347					continue;
  1348				}
  1349			}
  1350	
  1351			kfree(p);
  1352		}
  1353	
  1354		rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_SET_REGISTRY, gsp->registry_rpc_size);
  1355		if (IS_ERR(rpc)) {
  1356			clean_registry(gsp);
  1357			return PTR_ERR(rpc);
  1358		}
  1359	
  1360		build_registry(gsp, rpc);
  1361	
  1362		return nvkm_gsp_rpc_wr(gsp, rpc, false);
  1363	}
  1364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
