Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA418CA5219
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 20:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7924D10E8BE;
	Thu,  4 Dec 2025 19:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VIk4n4up";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B1F10E0BA;
 Thu,  4 Dec 2025 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764876850; x=1796412850;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=dtDfwNNcbpoclsxRBvPxEYuotXEyLce9WOvUJxjq2ZE=;
 b=VIk4n4upYnyb6fTB5B2x/zaLIFeIZET1IFM37vrGRYiVliL8FzMDCxnc
 O76u/aPRG5wycT5GfMthEu13zxM5tlwfU4gKmDyGUe3DV+BKsqEim08D3
 Pjx4p6k1BKX1SLLmDnYjMhZ+pfnl9V5cwRRqjL/pMYaj3HV5qEsDxSB2e
 RJ/QQNVRhoye9mFJVwZBjHe+HoBKbTKn70DHUNViRHOfnpxARdqfOTXWB
 C8atRv7A2mCmytapAiW9l3N9HWKpt8BorK8w3M0vwQ0jH1hZluEiuJ4kR
 BstwCyfjEU8RyxY/5PKhhsfNBWWjTB5j2DclNcatswWVFX/Uao1UuBOIg A==;
X-CSE-ConnectionGUID: pQsnT+7VR3u0sCX76fMbwA==
X-CSE-MsgGUID: 3lT/VdSmRjuJNKzSYSc6sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66982515"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="66982515"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:34:10 -0800
X-CSE-ConnectionGUID: l2bGvDcdQw+/SEZYyra0Bg==
X-CSE-MsgGUID: 2+0qH0nBRoSE09Tc1pp5Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="200034635"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:34:10 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:34:09 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 11:34:09 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:34:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pwbz2W+7zVJinNiDoK26NxlYSLgV7RdfeO9ooEwrvysIt/KvfoR9WDWftHzSh/mVpYnpo3dd+bt5msTrOs+zlm0cZqWUaGWPjer3d6d7jMjJjd37Qe0fbEw50wg/opGE+AvvjZLOrstEGzuO+Q5LYft/HvXig+cIWWkUEoz8hINHHRt7aucKiEgte0fbR5NsE9nvf2+uHUK2zSPpJij15V0lnERbsSr3C+DCMhbKZ0btEdDMf+aAzMee57/hn5Ju3zok6spKMuNLXJ/iez4RBYHegv6/1aaBpf4pgrLGafoEfwCsR9vK0dlpWo6cSOZCNUkNgPn7zD07IPRz2NwozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBzAS5LoS+UU0J9+SSjG1yTNpsJc1RD9m5zrzBdLT+Y=;
 b=L2opJh2aOymFr7Ptw+DkR3xzawF31jDu7/Jo2AhF4H84UVdn8R6GT+wda2DZxHfok9MF9gXuW92YJdKGf7NeDlfSyGbCNie9Pp6eoWg8dHQY25H44qgpNP/D/G2QOZc9sRb2nTPUlY8ZdRohT6fHpTpVfGDlSg2Si3qy4WQJmH8W+4PELZJh45ZzzzbuRXi84b5YA0d7JMx9jmO337l3I8zO3c/CBiAO5jHJ96we8aX/Qpp3MVE2Nq5oQ9fZHi12CY4BdCdxZHn4wD9NMBk8zzKC0xKBOe+ZLITdzKJxioMO4n6X147GqfaD8w+3R7khvDRJCQdgMYW2fWseOwgZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7073.namprd11.prod.outlook.com (2603:10b6:510:20c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 19:34:07 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 19:34:07 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: Update Xe driver maintainers
Date: Thu, 4 Dec 2025 14:34:04 -0500
Message-ID: <20251204193403.930328-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.51.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: ed8239cd-b717-4cf3-5333-08de336c16fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnlwcktPYm1DVXVPVzAwTExBMSszZUU0OUNrRll4dWFxUk8vWlJWUzBKTDhs?=
 =?utf-8?B?MUhNQ2FHQmxtSlhYQXNpNldHS3BzeXNlVWgycmV2NE9FelhWeDBVT1FmS0dX?=
 =?utf-8?B?S2crTHh3Q3ZVSlVqckxCaGpSajBDQUtrRkhPc1Q4RFNuN2tVekdtWDNBTWRO?=
 =?utf-8?B?R2oxRldPZVhCMDg5UDVWZGV5LzROWEphU0VCS0pyTE1VbDJETDVOOCtscEE2?=
 =?utf-8?B?Zm9GeVBSZGNBbXJxU1BFQW9TUDhLN3dvelhUV1p4RFJyVHpwZWxpc21iNTB1?=
 =?utf-8?B?NzFJY0RSZWxFa1BnL1VtT1d6OVZCYlFHeGtBdFhxelhLZ0JRMDNpQ0g2aVUv?=
 =?utf-8?B?NTR4QTRGVzZ2cFRQWjNGTHJHZVJkRll5U0o4dnFPSUUxR0dCRWJzNDRtQ2Mx?=
 =?utf-8?B?NWhmUHNhYXdBTno5OXR2eWNMWkJTSm1PKzhIL2x5UFRwSU5vWnBoOGI0bGxL?=
 =?utf-8?B?SGY3WUc1dGliaEJWcExkeElyRUZaVU84RzBpRU9tbW00NjVHR2w3cFUxcU43?=
 =?utf-8?B?QzZmR1ZRMkdaVjBNa0I2akxaWkhsd2FIRCtxMWUwTzMyUjFxVWZsNHZsdEtF?=
 =?utf-8?B?SFNWT1JuKzB1bUZlVVpzT1dXTUlpQ0IrVDhHWTlhUVNKSVR1ZDNTVjRvMDJD?=
 =?utf-8?B?Ym1TUit2eUIwMFdYbDRGWU9iTWV4a0kvWW52WUJZM2ljM1NTTVlhTjlzcHdj?=
 =?utf-8?B?VWM1cTdOcUlUQUc1VzR0K0NZalFLRkRzVElPTUZSekJ5YlE2YzRFM3FPU3J4?=
 =?utf-8?B?UVh4RTJtVmFPK1ljY05xUnFZOFdxTnFpSFdlOEdkVUFGTEdWUUw5Smt3c0Vy?=
 =?utf-8?B?RWN1MWNrZm8zZFJFbXhxUWhZbHA4NHlwVDRWakpRMG5QMmcrekh4QXZtTUJ2?=
 =?utf-8?B?amhWZWdyZjNNcGc2bEF3ZVU3YVFiUzJlTm9naCtUK3ozOHViYTR5cUZNQXZJ?=
 =?utf-8?B?RFNDQXpxUk1wNlROV2xpaWF3Mm5rWEtmYTJocnViNGZKNGRZNDdoVHllQTlj?=
 =?utf-8?B?N0dGY2tCazU1aTkycjZMbWNMT3loOG0rWlRxTUJWNWRFOFhybWd1U3R3bllE?=
 =?utf-8?B?WmFVMU9NTk1vbldPejk0MDVKYnJmK3VMc1hLVmp6amZYbVpOR0MzNUQvMC8z?=
 =?utf-8?B?YjNxRStjSTNGWmsxczVzTEYra2c3ZWRXUXJoUHY5RVFaY0dyR2NVald0QnMx?=
 =?utf-8?B?b3ByaUVlVTdES0VZMlJ6VnMvRFdGaHV1YVNpbEhvMFhQNW9NTXdVOGxBUHJl?=
 =?utf-8?B?cTIvaGx2TS9LQmFvYnFyV28vVUJoZzNOcnVtN29ib2Q2VmticnNNRnh3aDZh?=
 =?utf-8?B?TktPQmpQbU0rY2VSNGdML21oWTNIaWpHOGRIc2JYV2RORjRGM2h3b3krN1Br?=
 =?utf-8?B?Sm5YU2V6RnQzdUhvallrd0lnM3c2SzE3WW5uSGRxSVNTbmtCeFZTem1QN2ZZ?=
 =?utf-8?B?bGFQQVNPaGNHSEdVdjMzNVl6SGtqcjFrK3ZFUnAyWTBTenVtN3ZJTkloL1FZ?=
 =?utf-8?B?TitCOEkwMDQvdG5TeVNMVTlIUFkzblpOMkVtcGxJVWZwbXNIY2pldnZPNG02?=
 =?utf-8?B?L1VMK3ZLaWpwUVZteXN0UXMwNDRZdkcvcjV6NnBqZWtOS3pqMTNCU2JGTTA4?=
 =?utf-8?B?VFBWb2duZW0wdU5RY0FRTHBDU0Zjc01OanY1VWM2S2lmTzBWeCtKeEovM3Fj?=
 =?utf-8?B?VnVYeGJBcUJlNkhtRzBYeUIrcDB2cnExV3FWSmdCVlMzaExDbDI5SlhmdENY?=
 =?utf-8?B?c0o0dDJpQzV4R2VLeDZla1ZBYTNldEJaV1BTNUFFdzl0ZHZ6blZJTy9lWlNO?=
 =?utf-8?B?OURxVXk5VXpvYTF5SENBVXQwR2lzaXJJaXZFd0V0SlVDWUNTa3k2bm9XNzQ1?=
 =?utf-8?B?c0RMakgvTzBZckZoekpZeE5zTlBHS0ZYQ2dPRk9aRnAyT0QxSGpVaGM4dDJj?=
 =?utf-8?Q?0jI08pEue2X3M0bB89cF/HjROHGRzwJQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnRMaGRMWXVPcW1aWWUxR3BFS3gveE5zTXFMeE15WjBpZmw5eDFuQkp4Ymcr?=
 =?utf-8?B?ZTlHQlVCVi95TFZ6SDhiM3hpWSs1bmZucnN1cUFWYmJkSVlIQlZRcituSG9G?=
 =?utf-8?B?UURQaC9XTHhpNmM1Rks1Mzh6RmoxQTRDZ3pJSmVUdm1SbTc3a2hLN0I2L0RS?=
 =?utf-8?B?R1NIcDIvV1NxMzA5TGJBdUI5VDN1aVpiak83SWtTUlA5Y0d6bzhvOXdTcGlV?=
 =?utf-8?B?ZktKakhyMmZtMFJsY1FibDBHUGNGN1M4SVJON25IVGpRQnZPcXZ6ZlZpNFNm?=
 =?utf-8?B?N3RJa3JiaXlEMmpTZjBlSlFYdmJqdVZFakpYWTZ5YUt6aWwza1UvTUo5N0Iz?=
 =?utf-8?B?RjR2WjFMMXZIMHRBOVlNR2IybkRTOG5UbHpramo0ZGJtakRhaWFrVEhJVkto?=
 =?utf-8?B?K0Q4MlFGdzJPMmd1cE0yTjV0ZWt0d01zYnlQb053cVA0anpxWjh5T3FBVHJ2?=
 =?utf-8?B?WWtSQldPdC9ock1lTjBIQ2wyOHp4WkJHQkdLOUJvNU9iU2NxQjBzWUhEWDJU?=
 =?utf-8?B?Nk1HT3pNTlpwMUJsNHZUSEVaaEJ3Q1B2UldhMG8zSEc4NE9pSnZtajYwVFJ0?=
 =?utf-8?B?VE02MFBEbnFuei92ajZDZm9XSHBiMThzUldEd1ZlTFNwZVdraWp0UDY3Tlhu?=
 =?utf-8?B?RVBKVVkydHhabEp4RzVPZnlGc3duSDFBbGZ5bjQ0SlYrZVgvT2dGZDlteUJv?=
 =?utf-8?B?SWNQTGZPTFAxYTc5V3hrV0lmNU5VSGhOb2IwR0lNbXEyRzYwMDhGWHQ0UjlJ?=
 =?utf-8?B?OVQ0cFFjaUdwM1Rtb21iS2NLMXJoOXFoTjhNbXVXYmk4RXlVeDRhR1BJQ0lH?=
 =?utf-8?B?a0ovZkpqTjFHYm1xMVZPTTdwUStqVFliZjBIamIwdDM4OUhnRDI2Z2xUK2pP?=
 =?utf-8?B?R1FxZFhRamZ3QXhXT3VRRytxTGNkc2dwMnRCY2M0cEV0NEI1cFEwZlNleFRL?=
 =?utf-8?B?U2xwVnRZM0x4RGcxTVlnUzNOU1c4TU03Z1ZkYXpBQ1U1VksySmR3dXFwdnhG?=
 =?utf-8?B?dHdSWUI5eW0vL2dvQ05waGxSTkxzRHZtejBuTEZEcXRIaVVDdEpVVVVoalFQ?=
 =?utf-8?B?cFhTdjV0TTJlb1lOWWVFT3Q4b2lZOElCMG13WDFxdEFUbjBOb1J6N1hxWkNm?=
 =?utf-8?B?RjkvcU81ZWpwZ0RIb2gzL2IvR2xMZW11ZzN3YUppSEpSQ2lVcTlsU2I5ZVov?=
 =?utf-8?B?b3hPTUpwUFJ0dGYxeWZ0SGtxdVdoOFRKRExmaXY2Y25vOHBmYU43aHhRc2sx?=
 =?utf-8?B?MEhFcXpUZzVPamx5eFZ6bkQwb3hPRlE1UUZ6UjBPVEtGeWhvS0p6QW5oc2dJ?=
 =?utf-8?B?aU5FdVNxTDJObTduQml4aEdwSk9xalI3cDZVcElDU0xMRUhWVzNWS2RaMCtS?=
 =?utf-8?B?R21FdEhTMFNqamN4TnNFaWpsSXRVbFZEcWd5VXA5QU04YVNNaGUxdHpTM1Qx?=
 =?utf-8?B?TlcwWGR2NDhMc0hkeG1oTVBGTW53cmpJemhkKzEvaXprNGlZMnJNSllFL0N4?=
 =?utf-8?B?dFdGYVZmY25mL1kwb0grS09kY1l5eU5EdzJvT2p3ZlhCUXZud2o4cjNUZmVj?=
 =?utf-8?B?bVhCa3ZGaDJNWC9La0UwN2FNaHZacDhKcitLZDVsK3kweUdpbDhoVFE5dVNJ?=
 =?utf-8?B?SnlFSUp3dVdmbzlEay9Rd2VkTFVmSWNjeDZMK0RUTGlQYnNKbUNpdVFqOC9X?=
 =?utf-8?B?ejBwK25BTXFUdDI0cEFYTEd4OGNFdUNGRmVtWHBwbDd6aEtibVZaOVN2QkVs?=
 =?utf-8?B?UWM5MHRONG1iQUR0YmJoS004cHBSc09nY1VYeVpyVEFOZE53eDJ0QytHa2ZF?=
 =?utf-8?B?M1VWdDYxN1JLQ25ibHA4M3NnaGgvc2ZSZHF2K0labFZGVVBLbDd3UnFoOFNL?=
 =?utf-8?B?NzVQUGQwR0dBdFBHaFM2c2RCNjJuNFdBUkdWNGFmS2R2UkpkY2ZhN0RmNmZM?=
 =?utf-8?B?dVZpZXJTL2IrdDZJbXdiUnNpRFBac2tSdjNzbmgzYlpMNENyOWJKc3RIT2tH?=
 =?utf-8?B?dThtMTJLci9qd2sxelhwNFQyQ0tsQXFuZkhnclFTcUR3TVdmTTEwYUNyaUVy?=
 =?utf-8?B?YXd5dy8zVUpQUk9wRUU5c0pYZjY1WVhnL3lEZ05MWHZOd2QxVmVzM24vR25F?=
 =?utf-8?B?TTZvRFVpd3JRNTFSQ3FYc3hkMEN3bWNUKzB5ZTkvbUJYdng0cVFNRFI3WXF1?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8239cd-b717-4cf3-5333-08de336c16fb
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 19:34:07.0352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQ2wFSWT+UBkza6enczw1S1QXOX1oX2S0MU4mothl1M2RUN3maeYLU+Up4msdVok28PRjQ85nz1DMhUobLlC6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7073
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

Add Matt Brost, one of the Xe driver creators, as maintainer.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7774cacab5f6..254649de9c26 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12517,6 +12517,7 @@ F:	include/drm/intel/
 F:	include/uapi/drm/i915_drm.h
 
 INTEL DRM XE DRIVER (Lunar Lake and newer)
+M:	Matthew Brost <matthew.brost@intel.com>
 M:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
 M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
 L:	intel-xe@lists.freedesktop.org
-- 
2.51.1

