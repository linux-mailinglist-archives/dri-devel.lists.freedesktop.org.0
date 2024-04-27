Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D688B440F
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 06:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C4A1126C4;
	Sat, 27 Apr 2024 04:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Axh9QdAw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A4B1126C4
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 04:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714191506; x=1745727506;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=9/tn2G0UzT+pos5SSWjCh/ekHpy90xZIn8Ntu6sbS2s=;
 b=Axh9QdAwjdGeohciHpMt2GD77Myz0IMX1clnK6ZXH6+Gy8RQr7pGRtp0
 T8PWVWQ4n2m5M7p3Vq3aGNlhQD0JcMV54+p6Au/4e0xabZC7NFVBmxrXq
 1Ru7cQjknwbTNLSL6FIDwdB63KgwX8kCKKyFOWXqCxzFkdfMiF073TdDR
 nWnODpTe88TUJziPCwBlSxUhIIJp9NNYOOY+b6XgV2rp6BASB1JfUp5Yx
 GUOoxlv9DGuX6yj9GesG4fq84s6ncSi7iHmttnxV52Hi1dq0UUrwgGSfe
 320k67pYvs0meh06dT9WXVUs5CTM4Tz6QwC7i9P968fAg0XPxA1kMubTh w==;
X-CSE-ConnectionGUID: YDiF4ka8SnyJZaeacIKRcQ==
X-CSE-MsgGUID: 9l7OtzW7QfGDBPR4ZKwmHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21082792"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; d="scan'208";a="21082792"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 21:18:25 -0700
X-CSE-ConnectionGUID: U6L3KslTQ0WicT3QfkDltA==
X-CSE-MsgGUID: I4Vi0DFhSweW+/+y4ch40g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; d="scan'208";a="26012762"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 26 Apr 2024 21:18:23 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s0ZW0-0004eI-31;
 Sat, 27 Apr 2024 04:18:20 +0000
Date: Sat, 27 Apr 2024 12:17:57 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:for-linux-next 1/1]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1267:3: warning: label at end
 of compound statement is a C23 extension
Message-ID: <202404271259.rahBUb02-lkp@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   61ba791c4a7a09a370c45b70a81b8c7d4cf6b2ae
commit: b58a0bc904ffa091fc020f7fd00e91808fec820e [1/1] nouveau: add command-line GSP-RM registry support
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240427/202404271259.rahBUb02-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271259.rahBUb02-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271259.rahBUb02-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:22:
   In file included from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/device.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h:3:
   In file included from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:4:
   In file included from drivers/gpu/drm/nouveau/include/nvif/os.h:8:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1267:3: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
    1267 |                 }
         |                 ^
   2 warnings generated.


vim +1267 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

  1199	
  1200	/**
  1201	 * build_registry -- create the registry RPC data
  1202	 * @gsp: gsp pointer
  1203	 * @registry: pointer to the RPC payload to fill
  1204	 *
  1205	 * After all registry key/value pairs have been added, call this function to
  1206	 * build the RPC.
  1207	 *
  1208	 * The registry RPC looks like this:
  1209	 *
  1210	 * +-----------------+
  1211	 * |NvU32 size;      |
  1212	 * |NvU32 numEntries;|
  1213	 * +-----------------+
  1214	 * +----------------------------------------+
  1215	 * |PACKED_REGISTRY_ENTRY                   |
  1216	 * +----------------------------------------+
  1217	 * |Null-terminated key (string) for entry 0|
  1218	 * +----------------------------------------+
  1219	 * |Binary/string data value for entry 0    | (only if necessary)
  1220	 * +----------------------------------------+
  1221	 *
  1222	 * +----------------------------------------+
  1223	 * |PACKED_REGISTRY_ENTRY                   |
  1224	 * +----------------------------------------+
  1225	 * |Null-terminated key (string) for entry 1|
  1226	 * +----------------------------------------+
  1227	 * |Binary/string data value for entry 1    | (only if necessary)
  1228	 * +----------------------------------------+
  1229	 * ... (and so on, one copy for each entry)
  1230	 *
  1231	 *
  1232	 * The 'data' field of an entry is either a 32-bit integer (for type DWORD)
  1233	 * or an offset into the PACKED_REGISTRY_TABLE (for types BINARY and STRING).
  1234	 *
  1235	 * All memory allocated by add_registry() is released.
  1236	 */
  1237	static void build_registry(struct nvkm_gsp *gsp, PACKED_REGISTRY_TABLE *registry)
  1238	{
  1239		struct registry_list_entry *reg, *n;
  1240		size_t str_offset;
  1241		unsigned int i = 0;
  1242	
  1243		registry->numEntries = list_count_nodes(&gsp->registry_list);
  1244		str_offset = struct_size(registry, entries, registry->numEntries);
  1245	
  1246		list_for_each_entry_safe(reg, n, &gsp->registry_list, head) {
  1247			registry->entries[i].type = reg->type;
  1248			registry->entries[i].length = reg->vlen;
  1249	
  1250			/* Append the key name to the table */
  1251			registry->entries[i].nameOffset = str_offset;
  1252			memcpy((void *)registry + str_offset, reg->key, reg->klen);
  1253			str_offset += reg->klen;
  1254	
  1255			switch (reg->type) {
  1256			case REGISTRY_TABLE_ENTRY_TYPE_DWORD:
  1257				registry->entries[i].data = reg->dword;
  1258				break;
  1259			case REGISTRY_TABLE_ENTRY_TYPE_BINARY:
  1260			case REGISTRY_TABLE_ENTRY_TYPE_STRING:
  1261				/* If the type is binary or string, also append the value */
  1262				memcpy((void *)registry + str_offset, reg->binary, reg->vlen);
  1263				registry->entries[i].data = str_offset;
  1264				str_offset += reg->vlen;
  1265				break;
  1266			default:
> 1267			}
  1268	
  1269			i++;
  1270			list_del(&reg->head);
  1271			kfree(reg);
  1272		}
  1273	
  1274		/* Double-check that we calculated the sizes correctly */
  1275		WARN_ON(gsp->registry_rpc_size != str_offset);
  1276	
  1277		registry->size = gsp->registry_rpc_size;
  1278	}
  1279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
