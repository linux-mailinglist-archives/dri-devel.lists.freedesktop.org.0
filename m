Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE718B43EF
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 05:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2D810FFEE;
	Sat, 27 Apr 2024 03:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cMTHwVaQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF0B10FBAE
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 03:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714188444; x=1745724444;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=bwY3Npzz2Gej71CBmwPkAL8Kw3nLv5f+pJV4aekd1zU=;
 b=cMTHwVaQ9L3vbBITarulJ+MVVYKyU0wMOoPZtZlpDdlySlW7JAwZMq0i
 yHnq1aDlR2xUDu50ZmzFar14Jw8ss6JlPKCn6liUIwT+EvDgL++uup0Du
 faniUZDoy3WwCTbxckI74wvWVUlolbdEogKA3EmYVS3zWpUIpkZNsFdm3
 n0HyNpgu+pEo3f+zSkNrwBhmMmitCN5SQ4UjKEPyrkE94xsRpSWSv5UFV
 xVpaCL6RnaGIk91ET+bAmLx1UhzdVXXHYDxMt6/rf4m+bFpUCVYA4hA/F
 0fBGd3654HZOqrM2GKZNCSlkOTwGb0hO8/hMXKakQkLrg8ub3xp3vMczw w==;
X-CSE-ConnectionGUID: /BR90g9JS8y7vBQv2WY5ng==
X-CSE-MsgGUID: 9SQelq7RSwSZMNMBL/yo9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="13723662"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; d="scan'208";a="13723662"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 20:27:24 -0700
X-CSE-ConnectionGUID: lZc3D/6sQ0avYueMOyLW1g==
X-CSE-MsgGUID: CDHgIDkfSUOttRYC4EKJ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; d="scan'208";a="25592948"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 26 Apr 2024 20:27:22 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s0Yid-0004bu-2R;
 Sat, 27 Apr 2024 03:27:19 +0000
Date: Sat, 27 Apr 2024 11:26:20 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:for-linux-next 1/1]
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1266:11: error: label at end
 of compound statement: expected statement
Message-ID: <202404271146.n4lVV4tO-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240427/202404271146.n4lVV4tO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271146.n4lVV4tO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404271146.n4lVV4tO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1266:11: error: label at end of compound statement: expected statement
                   default:
                           ^
                            ;
   1 error generated.


vim +1266 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

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
> 1266			default:
  1267			}
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
