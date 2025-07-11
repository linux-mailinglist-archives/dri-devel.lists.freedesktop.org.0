Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F66DB0129B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 07:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A735010E9A8;
	Fri, 11 Jul 2025 05:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGTgYzzL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F21210E25C;
 Fri, 11 Jul 2025 05:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752211087; x=1783747087;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=3WGheKReUMnTGm5v81rDNUCJSd5LKAHITDnKHrwq/Qw=;
 b=JGTgYzzL6i2iARU4ptX+CkCKyfeIqRgR0yAHD71AZt9skHhAPyu0KHkg
 CAg85K4tAcRc88A4kSWOOwgfLS1F+zw1cneAvcSk/3XRg4bd32A4UGT0/
 utycFJlk5pSPB8UnEIjtizZngU3nLT3iMjZTZrHoM4nSpgWsrupNUFxr4
 qJemBDXh8KcqgHMggYphmTj9fYoq8xzfsejj49h8L5fA8B8hLuHUwv/cM
 SMZIUTXwRp3Gy9HUm9Wg0xuk+3uk/bvmNzx5jwuVawvjxpvIy4SK+HO8w
 yASaPCsoHf3TBUJ9FTWF9mv8mcRUXPh1J5kURB3bWoalUvdhN1FW41gb6 w==;
X-CSE-ConnectionGUID: EdNTAgh9SQewS2Lx9OvjGg==
X-CSE-MsgGUID: h2SLOYjiQayiLx02EGdVgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="77049558"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="77049558"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 22:18:01 -0700
X-CSE-ConnectionGUID: nkdNDVjUTfmy3EUpCgBVzg==
X-CSE-MsgGUID: m+ZMEedOQy+lUOW78IlKoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="160296819"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 22:18:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 22:17:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 22:17:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.87) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 22:17:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHfWIHI4Lmp1VxADu+LIeDwmdRguR4I8mUIy6U6xTwhRqZkFManupFevRRKHEbSIz1ZjSAGkRY77hAC8wIf7EcM/uRT+cPnL8XorUzvxbbnqrFUlKEpBazeLrmNaL2gk3B8lTQcF6ydUkD7L95sutOdlcb3tsWlBuS2EzqeGuqOc3+TLs54dwAz3l4HOb9tQE6zytfkBWSiqk9JgkMptpnr/DjDvmZ0WO6JtC0JXA8AgoYqt+kwzOZ8pRHEjWlQOSyPs2el3s76DiPAwd2EnnxStv/tZifMcZWuNqPUAALqU6vlSsR5sFKCWW2qquxJSwwLU57xscAjZ7F0nlRgXuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLLzGdQjvdP7khds9apPon2Zu+1c5XNeRLxjBCSAlQ4=;
 b=X5QNpIgAfyDcwHTwnU8LkFUS36dmYniKJxDUQwYi3oDtJo5I7oCbyGNdNW9dbpB6odjX6ohU2d6jDOCR3wYZAL1A723t0uY5fAL1OKF6z5/99thX/xEGfNMXQwzq3UiaOzUZlcmNzxmXoRa8w4Uirm3eumsg2MoZ/ZtyfIzlC5HFV6ynseT/EXEMsdMFjB/Hl+9+UHJ/2CSisU/akqMbLG9j9Gh9bhcCI0L+BgNgMMzTVrsPPp5pzDLPrzE1mrShSXrVDXExCZwUq+WCcl760E0T5snAjYrn9Vrhov/X1Mgrg4QuNIZwhlZVHzQvQoXLnJpxSSX8UlbUKTr8pEsrxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6543.namprd11.prod.outlook.com (2603:10b6:8:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Fri, 11 Jul
 2025 05:17:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 05:17:56 +0000
Date: Fri, 11 Jul 2025 00:17:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <s6jyd24mimbzb4vxtgc5vupvbyqplfep2c6eupue7znnlbhuxy@lmvzexfzhrnn>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: aaefea13-c13c-4b10-b136-08ddc03a4ba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cWDz1T1TpXkRUD0/tx1qRyI0rZN2IVESsRDStTZoo9gDvTRAqanoj4LRFbU2?=
 =?us-ascii?Q?b5yS1242iaRTVfeHwPZeE2d7BS79g6FIScjZULDlCJlKvB/9MKMX1eqrjV4j?=
 =?us-ascii?Q?gmq+ri6TbXD2A0hpc/KEvTSPW4GGnN/mu4v3eqfqU0F38gwbZaO65+ozDWGX?=
 =?us-ascii?Q?lAxMEs8/W98dCX2rOdOndhGW8V38+0n/D8iKcr+YUmMWsA6wXi/J34gzT1Um?=
 =?us-ascii?Q?b95R/HYmhG+74WRf8jwzLzVMfr4myrQTMgclExT+fXaiXTeJNBBnVSEYLR5L?=
 =?us-ascii?Q?1T4AtpG+uCIxMEqDJgcDgNKUvkl4e52Laz/HCR+FxK/8vBCI3KIUSL3BOGWi?=
 =?us-ascii?Q?RiCeQl0+/2L6BD1oW3LhdGMvEH+OjEZRur0Pab0Bpe4R7/ElsKpoBvWnmuF9?=
 =?us-ascii?Q?b0mVRCXLDlkR7r0oMWG1CpqOo9+gtfVeEze42kaOPn7SugVFN8DN+iEJSp95?=
 =?us-ascii?Q?9mbP8VF77k3m20TH6wr3QuI7OdkjnKedeeHHDOpCLwsGdXpcvG4afKve+hGS?=
 =?us-ascii?Q?vJePfPSc8qh4+j6Da0hJtFHgqYMEnvCcrzfxXVLeKQSunWx8sR98hNQYog+/?=
 =?us-ascii?Q?3FXBYJkxhIp/T14k4sksrFvxqa0bgfpyrNTZFfvxIvMNfCIp10VmMtf7QPoD?=
 =?us-ascii?Q?7kefW8rqOH+1A94nbsZJ0sGRa7pf+RNHqZ+jrDzeSDaBgb5m1u8i6sT3H3WS?=
 =?us-ascii?Q?MZxFpE5XcH0dVZ7NqhHmrQcUthde0pyZfxSsng0USwwvUHpsljdpra+jCr3a?=
 =?us-ascii?Q?tGeXFs/WdXBcH161xqF66ApUvBoc70S+toNt72mkTpVxLrhYNiqxHgsg9o9i?=
 =?us-ascii?Q?VK8W9c2kiq/uC3BeTIX1udJ5uWRQrQOd0VfgArgL5N8W8UEXx9uf3JuiTPcn?=
 =?us-ascii?Q?yv+1D3+nigXCCct207FQzYDKUAMebdfnvlzLyLhhbfOzpC0kvQrE51w7g8KL?=
 =?us-ascii?Q?pkPfMjsOUmSKUVouyC5EgsXdeP7+zt/EAjzBwk0hJNeCyU6EDnMCwpYe+bDK?=
 =?us-ascii?Q?/D7Z/XFxyeYG6uukRt3D1MUMlaMkf+dv2CEDLWEJfSeuzWwgrt3TWBeLWKXR?=
 =?us-ascii?Q?zdUGMBW0i5CYbaLnDnQouBKdq1YBNdxbjtt10vy5NUTP0ypB+DMmJ6B/rIrL?=
 =?us-ascii?Q?/vBNhfs+IOEoDaHFmqlQ37HCr7wyqhMxF6k/bxdRWIQgAbX8+aWamTAHDLPL?=
 =?us-ascii?Q?z8U3nLz6ahkhJDqLZra69deSMGUulUITjOCuQul/0xa+duFZ3Ymte6jyxzji?=
 =?us-ascii?Q?Uzvit2gKVpuBG4LThq5TKI4zqTBdQTfzGC1TuKIhfwpxeOZvQqYk2n+B3DUu?=
 =?us-ascii?Q?v2FJODixwH9o6A2jkYLrQZIXIxidqPaKv32MkUuUKs23i5+4xVdlt0LedewQ?=
 =?us-ascii?Q?LbiFm88mAPPVg02Jw7c/K/c+T+cEL1WQ+UpC92LQeeQabygv0FdYYpZOoFPB?=
 =?us-ascii?Q?z5HLOTIJPhs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m/moyWgtlLSL6PwqQ1PdjazjH3b5Gu9u0JSLgdFyQwS5c6hC/V4i79y4Zw5z?=
 =?us-ascii?Q?9LuGbQywiKFhNI9i4GaMxf2AzpRy79LRcwukxgZ4By83KDKBySOwIRxThyXj?=
 =?us-ascii?Q?J+Xut3mG//NVaWLp2UbOCWBb9tRxDCZMSqt7oybCtT8OKyCkTIBAP6jM6T/2?=
 =?us-ascii?Q?0uAO3xTbLjO85laMV9Lxh3Is4wxk2igiyVPtxtgdjfVCtNQHF0vbJHdt4o2+?=
 =?us-ascii?Q?ZJCUq6qPluGs+xRDmpgX0uFQKqLMqMeGJIt06qkAASKuxkr75AtcDJrOTglE?=
 =?us-ascii?Q?LwhPKjjSHdTkjs4fKyr37j25fkdY8tbu3sY2tUXGEavqWuo9RBlNli6rk5qf?=
 =?us-ascii?Q?4sP4NFkevgmXiDs7cagtu7JDXgi7mLjZdpBqS/0J6T/4Ps2igmdtX+c1AQq3?=
 =?us-ascii?Q?YIkMdMGep1dzpKjcfvqtBYXizq1r31yjfH3Rl/SmxSXNYg7Exj4LhTfSwDQR?=
 =?us-ascii?Q?IzVWNFl1csgN2CwB1UpsIlfQRAYNZ76bveESv3Zl1sB83ygdvuqaB0ogY8Q7?=
 =?us-ascii?Q?mR7H++Gwo3iPgDomVvDYdUaaMjhIUIJMQWoP7wECJLPuYf1iz51KV/OK0h2/?=
 =?us-ascii?Q?p1DdUp5yyv76wxKmbuXVJnGK6V/foi7nsnCIFoukCz0l5or8DkgBGjTFpPbw?=
 =?us-ascii?Q?Pz1lNf5xeg74bWCUHWfv3VLEBJk7fFE/GUCZ5QacbL7MxfRxMgWtA91iljpX?=
 =?us-ascii?Q?zzVoo0E7CTv1LkosIn2EUJJU+ZluDEhLlEIxm3zfrSZXnLiXxLujUnGlaGpf?=
 =?us-ascii?Q?0QN/DAb2WRuI+B4yDva3bUSNiZLDLB4NvX6/A4aYn1c2zkGwLV5ODTNoAzOC?=
 =?us-ascii?Q?vG5xfJZFFVDjv6EgNxT9IYxEwIjKj7gCf3Chrjy1hmKzfSvNfh63C3pgQV/B?=
 =?us-ascii?Q?3AP0NWcfoK3Jl4+qyZTaucEkQ1xi1W13L+6wDeNBwmLuo7P4wQiOsIRUxN8u?=
 =?us-ascii?Q?Y1Q30Jva0r4LDJHhwNwFFQdKTye4HTVicy22sRaJaE6Fd0m96UU5bsoCi2Y4?=
 =?us-ascii?Q?jYpvPC7f2aFVvAKHUHewbMKEtQwUMJ8fPcPJjC2T3E14024f1tlLRw2sKXYx?=
 =?us-ascii?Q?CKkgSDw7qhove0rqCDdmUKQq/7rUomgNplM0iUFR01FqVO+1F+vyLTqjFcL3?=
 =?us-ascii?Q?LgAs1n0k+P6mb23+NXWVycItGuqaikiPvXsSatK7Z+jVLUv3bY2+4Cln2Tcm?=
 =?us-ascii?Q?ibwPUYOyull3dNUyrj1QHgOGZfV6ZESNqQF7fO/cooxaSJPP/ZBdt5qTjQjz?=
 =?us-ascii?Q?IBTO4iopQDJppqEtnoK/bZAiO6wtwD47c9UgZ8x4hF3aoNXb1yq8PPBf0DNy?=
 =?us-ascii?Q?uFDCFQ577e8DjAboJHgwViwnf/L7Zj/N1pbLcBPGtYw0YLWxGYUDAElR9sXS?=
 =?us-ascii?Q?qaul5MF/25i/xbLbFNzcZTzlytBpBAav2pOAq0+1eBsFC7LTsQKoapdWmY1u?=
 =?us-ascii?Q?IOVZOtt+K9NmZhy7V7JH4Mh72XXeaOyMqTIjZoZEdi0nk5OCG36QjxO9aQxd?=
 =?us-ascii?Q?d4Lcu1YFbx3fWLCrPOaCdKs1fYjmyidnI4V5roWEfkmZxHlfM/J7EoEX8xze?=
 =?us-ascii?Q?fYKcxqdwnQ0VqOsTdUThFmoxNQJl9QZ/fxlojX3zMHF0CLy/Eck0Fuga0Vx0?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aaefea13-c13c-4b10-b136-08ddc03a4ba1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 05:17:56.8439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXHJzpC0zMWBf2qK7PWL+G69GpDexQLde3h3/lesKtFct8gbvnqgFU0Tt5ZObG0Avu8Ea9cNSNzFRZQBBZfIpdukszHjsCZ3vG5ACLVsY00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6543
X-OriginatorOrg: intel.com
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

Hi Dave and Sima,

Here is the drm-xe-fixes pull request for 6.16-rc5. By number of
commits, still on the big side, but they are mostly small ones spread
theough the driver.

drm-xe-fixes-2025-07-11:
Driver Changes:
- Clear LMTT page to avoid leaking data from one VF to another
- Align PF queue size to power of 2
- Disable Indirect Ring State to avoid intermittent issues on context
   switch: feature is not currently needed, so can be disabled for now.
- Fix compression handling when the BO pages are very fragmented
- Restore display pm on error path
- Fix runtime pm handling in xe devcoredump
- Fix xe_pm_set_vram_threshold() doc
- Recommend new minor versions of GuC firmware
- Drop some workarounds on VF
- Do not use verbose GuC logging by default: it should be only for
   debugging

thanks,
Lucas De Marchi

The following changes since commit d7b8f8e20813f0179d8ef519541a3527e7661d3a:

   Linux 6.16-rc5 (2025-07-06 14:10:26 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-07-11

for you to fetch changes up to 74806f69b8668ea0e98cd9d461b7803ffa1fcdf3:

   drm/xe/guc: Default log level to non-verbose (2025-07-10 20:59:39 -0700)

----------------------------------------------------------------
Driver Changes:
- Clear LMTT page to avoid leaking data from one VF to another
- Align PF queue size to power of 2
- Disable Indirect Ring State to avoid intermittent issues on context
   switch: feature is not currently needed, so can be disabled for now.
- Fix compression handling when the BO pages are very fragmented
- Restore display pm on error path
- Fix runtime pm handling in xe devcoredump
- Fix xe_pm_set_vram_threshold() doc
- Recommend new minor versions of GuC firmware
- Drop some workarounds on VF
- Do not use verbose GuC logging by default: it should be only for
   debugging

----------------------------------------------------------------
Julia Filipchuk (1):
       drm/xe/guc: Recommend GuC v70.46.2 for BMG, LNL, DG2

Lucas De Marchi (1):
       drm/xe/guc: Default log level to non-verbose

Matthew Auld (1):
       drm/xe/bmg: fix compressed VRAM handling

Matthew Brost (2):
       drm/xe: Allocate PF queue size on pow2 boundary
       Revert "drm/xe/xe2: Enable Indirect Ring State support for Xe2"

Michal Wajdeczko (2):
       drm/xe/pf: Clear all LMTT pages on alloc
       drm/xe/bmg: Don't use WA 16023588340 and 22019338487 on VF

Shuicheng Lin (3):
       drm/xe/pm: Restore display pm if there is error after display suspend
       drm/xe: Release runtime pm for error path of xe_devcoredump_read()
       drm/xe/pm: Correct comment of xe_pm_set_vram_threshold()

  drivers/gpu/drm/xe/xe_devcoredump.c  | 38 ++++++++++++++++++++++++++----------
  drivers/gpu/drm/xe/xe_gt_pagefault.c |  1 +
  drivers/gpu/drm/xe/xe_lmtt.c         | 11 +++++++++++
  drivers/gpu/drm/xe/xe_migrate.c      |  2 +-
  drivers/gpu/drm/xe/xe_module.c       |  2 +-
  drivers/gpu/drm/xe/xe_pci.c          |  1 -
  drivers/gpu/drm/xe/xe_pm.c           | 11 ++++++-----
  drivers/gpu/drm/xe/xe_uc_fw.c        |  6 +++---
  drivers/gpu/drm/xe/xe_wa_oob.rules   |  4 ++--
  9 files changed, 53 insertions(+), 23 deletions(-)
