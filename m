Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C11B005FF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEB410E8FC;
	Thu, 10 Jul 2025 15:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a52qqiDg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286E210E8F5;
 Thu, 10 Jul 2025 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752160140; x=1783696140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6d0asqTU2l+T1oEVvPkuupv3vFUSwDhi0vxX8jHfLIA=;
 b=a52qqiDglYbHbAHQ9GtLgdzxD+4QiajKsiu4muabsxcJvymxUKSS+Nlj
 pQXImBXyJ9CdrILD3/gf0O2P7TTFdaQJgAvmVDi+xO6822aPJGHmGOK6e
 rVc33YBVUYS4Yi/MR/TtAMpUOwCSK7pmrPhhJ0wqbUDqkyZaq7/KJM6GB
 euOkzV2xq3SAcM6Yzg239J0btwElNZamUc3WaLs/lAB8AnLjIb9S9gFk3
 6Y0OFPyVn8WFsz3yimLyVEbyjFPfm7QcUYqR92dmp+xPoUDtuKjRG5kF/
 Jlyj4UKyCJtlaWrQinGcuW/zsq8Ii4Nk310KLsEGrGZp01tlq6xqURmkd g==;
X-CSE-ConnectionGUID: RmbMo9aXQDyzvxB5WUHqtg==
X-CSE-MsgGUID: jiLvfguYQPinBp2YupOQeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54296579"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54296579"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:08:59 -0700
X-CSE-ConnectionGUID: zEzN1gHDQ7GM5bj2ET0cwA==
X-CSE-MsgGUID: mQIF8iYHRQGakPy81JNV8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="156600191"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:09:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:08:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 08:08:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:08:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWqx1lr0tQAyZggedTQP+NTE4DtJejrgyz3qHaYuHYocVaOpaXl+xinH0Ts75nfdX6V8ln/1xA5zVmDcGwt3wFFCwF7D2WUvy15NejUdrwklR+edsEsy4LiK8+og9rTFRfE5SB2ZsHHnZ8JQjt/VB3FPpaP3vpmoAqsHh85GZCWTGIbpFYjtpoivKvVa8KinwLxfS/FAMyACXXNc1xdXFjEBuPubLFxLnrNA6bHJDIgJSb21IYoV+/4qyF5rLI0AiCrGkgUngZ66Mar/Ncv6dmR5lwKuM9cnaKhuGVHAKSoKzf6gQJnHbM6RA7w5QS+QXpT+id1I23Iy3jmRtZ5BoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8Eh5IbYZcMogguf3/61UGGrrMBWjnBm42y7kxggy3Q=;
 b=gV1T5IdwGTX6/Zxn4YXBtQQHSma+6fBqQSztGBEfFOhJRXXiI3a+jxIPlx2DHCSJOJXOw447KsuHPP0DqCq86mEXu/yFBctZ5BqxqTQ6GTibi+lCtY8AOdBJFCIyqVYAIrTVJuuB/JA/GvLM6MvyINhrT2EPoN90uSOSae7QTRjDpFeRcfEC4HJm0A0kgcXZzYjzpZyZmnxP3c7frn6gQ+zTJDT+jeKPtYr8uT91ssPwneK82ScJhKZ6U3dLXsTvWenSL7n/mSc95BnCWvxE/ZnWstLE0/K8keBnJk/+5KAswVBxTqGnnOUxGXXyZUWdMTQuWNxJpwZK00z4XsOTTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7809.namprd11.prod.outlook.com (2603:10b6:208:3f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 15:08:55 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:08:54 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <daniele.ceraolospurio@intel.com>,
 <anshuman.gupta@intel.com>, <alexander.usyskin@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 6/9] drm/xe/xe_late_bind_fw: Reload late binding fw in rpm
 resume
Date: Thu, 10 Jul 2025 11:08:37 -0400
Message-ID: <20250710150831.3018674-17-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0056.prod.exchangelabs.com (2603:10b6:a03:94::33)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb7041a-7348-4e73-4fba-08ddbfc3afbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rCBeeGlFnLg56cR/zOVWFf+05ab6+l0xe12iMNV82mXeLLidZLaBaRZfSHGl?=
 =?us-ascii?Q?WWeOoZUu7+8Q3rHguSoD8FnJrBPY3G92sN53onWzVY9tNmD9c3ak1IXsCJ5v?=
 =?us-ascii?Q?we/449SPdO/RCReUAp/h2LrEcIMjMtxuqcXg3kyrA9RSjD6nQTi1KfJmGg13?=
 =?us-ascii?Q?nTwRugpr+1STVNkJVa88i8xlqJaW2j1nZ1v6FDqj1muWUpDzaXODpgE8Twcm?=
 =?us-ascii?Q?4cCjpSRrCGKkWKiyNS66d3iq+EsXm3GnI1QvGaaYkiatYw9X/Jw7FkLo2+Yr?=
 =?us-ascii?Q?BlRnScWaT3DH/4nZ+VGmSU8io7UO1szAGi3GY50U3VcfEke2Wmv83E6pPDuL?=
 =?us-ascii?Q?eOXRsDJA6LP3ke/J01f6Fs4k0SRhBIh238f/tMj8O33XlbAytAJ+rkIoV6l1?=
 =?us-ascii?Q?yHlkWcGkTzj6VeD1f8jm24/ymcm2Dg4HRvPbbSR8XZmJzkzq0d/vt4U9a5JG?=
 =?us-ascii?Q?jd4/7u9DM/MHbls/JlKmmV125AUZsx3C0PHIykcBLk72BA1rTURbMstFg3jM?=
 =?us-ascii?Q?N7fHwFkAW0fZWkHga/KlSLZSqG+sKvMEtu7aZRfkQId4ruJg/Yn4aHJUUY43?=
 =?us-ascii?Q?C0cQUKopOqoAVm3pRLCpHlbEarfIaSuxwrTDaGrpvGP6EAhQersRg6VZcZQj?=
 =?us-ascii?Q?84xLRqoP5omDAG1+NX5JQI4UIbwT9kDHvxoNHL+lChQ8mAmBxLAdsEfTy6KA?=
 =?us-ascii?Q?AIKHB6PUtyKUchTUjkecJGjvtH6uLJ0pr75fuQoI2qftsw8DqjMkgnpwE9b6?=
 =?us-ascii?Q?HaPQRCSX26DB6cGc3T17FWdyJRpG7dpn+pSeLfx+7BoTmVbG8G6dCGp6NnFv?=
 =?us-ascii?Q?cWu+jDjkfCR7MQjg5GFgIr1Fm7GJmhWFp9xeddAFNom5zNmc3KNBVevWeKTN?=
 =?us-ascii?Q?/pC9falN6tNxZxZoa2rjvbqAFHTaGs1IXWly9csU93f/Jo5WIWCFzSPJoiZr?=
 =?us-ascii?Q?MPSjLBEmhoFwrK05M3bQDf6uGQJ9QDEcHCg3it5IAr7uTli8qmehrE12YY16?=
 =?us-ascii?Q?FsP06zhbTSCLWRlszCOhMQ4Eg2eIDOBr5hFMi9ymir+1gZ4CdgZd7wdXtyXZ?=
 =?us-ascii?Q?syZ589qujc4P+c9brljU+N/hjypCiDndQ+zsRbHJ4hPKwqVba3q+CQNPDDqX?=
 =?us-ascii?Q?ByQ/o+eDlkkub/jD6QIczpIbch5+5OfQdNyEYbkEqgA5L39nII0pW9hQ3JQL?=
 =?us-ascii?Q?otOApB7ye9SsGVEqQETMLsYoUi16lOWaGaR/n2kVTzB7rN7In53yNpxkI58B?=
 =?us-ascii?Q?VvzkpI/Oz0e2a09pVl84MJZ6yuxbOGDLPINoNvIsiOCyO6AschhW8yq65VJo?=
 =?us-ascii?Q?7DhlvqvlVvrv3O3wmFTFkhhcUck0ASjLABAyQjfjp7kYuLYQsR1Ml4BluQkV?=
 =?us-ascii?Q?VfjAnHdK2UTLMrI0seEwZS0vx3gGnowZUq3XwoT7kvWt0ovryXcfomNQ3ToT?=
 =?us-ascii?Q?tyyZCWZ2Qq4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QrkipQSguNBe9GOBEXjW00VxAE0UVi3vUlDo6uh5Y43ALYJEsEd1/Du5Ry1B?=
 =?us-ascii?Q?StuvCmHXB0qCZE0OZ9S5U6VSGIrRHzrpPL1rtI6OFbStYQOwLTSCdpHWdiaG?=
 =?us-ascii?Q?9DAaIjQUoOuYPajSep/oeUe1G8gKKyK1nfqYJgdomKl6xPnLW3OMTu61OU5K?=
 =?us-ascii?Q?u7KuoEXywx8SOIuy/j2WZLwv96aXaINVhdYSRACALtxXIt9WQb3XmcFQ2uIt?=
 =?us-ascii?Q?0mPlQATN31LvEAhK9ReVOAtD1SfegcAvTnlSSvGiHRzrNSwN3v87PeTbHcfG?=
 =?us-ascii?Q?cw7NVj+yEtwNVjLu58zi6ZLCO+T464Vo/Hpf2/RWmhAdV3PeIuF6VdafRRts?=
 =?us-ascii?Q?+tzDh2rIEk9rjtprPAmMXS05eEPFL1dyfrr0vaFM3bYnsUBz0kWxyQuOyX4G?=
 =?us-ascii?Q?3lwwd/pZ8i7wexKWtY3FiWE9KXt9Q0cHxaZStmUCWFVUZkkl0BXIv9dr597C?=
 =?us-ascii?Q?tFevcjwXbI9vOWXec4DZd5JbyDs2q8ZWwn91Ge9/0B+WPKBj5eQSjUEF5pRT?=
 =?us-ascii?Q?mBwWuDA6SeVM1fQNsyxFScMaEBDalQkwtOn6eWMwz1qt17fK8zYwR/g8LfXc?=
 =?us-ascii?Q?qi1yu5Rrj7VJhWV08CgAPhO1vYEa5K4PLn53+tr7zV/4s9PRdT3W/f7h8rzG?=
 =?us-ascii?Q?X6jgH7/vBR+EKrCfjMAs//ItAFkvFgt/v/PqcU8grKKf/fD4R4tP+vPDf5QV?=
 =?us-ascii?Q?FtKgBYNtLiqF5F/b9O0o0PpzPIW5/8TdzjkajCG/OO3rEVOL5uTkthDP7HVv?=
 =?us-ascii?Q?dBULmAvQo+QkYNGrShKC6LkVuMk0T4+QzhMOYgusf5X4hdfIsaBFXy7CW/hM?=
 =?us-ascii?Q?de0olEVwXm2brYbb/iMEeb7H0xDVlaT7WnW8+HQKBWfQwQB1Uajze4FNQUkc?=
 =?us-ascii?Q?lCugoWw6SVk6cqTWHEUwBxEDUET2tnOk1qvJ8KmSuan+4dftBZ112a6wM7WW?=
 =?us-ascii?Q?5PnW64rdNpe5LjQUU0IRR9I1clPuaIvv8mk5eVE8EBhWgRUG/u8omjS9ZGjh?=
 =?us-ascii?Q?iTiCgBgc3lgz/DXgwEAifpdZz3wggwxi7eOO8qXDUzjzbqaEpaH9T8VR+5E6?=
 =?us-ascii?Q?IhKBUupR/VgKWSxkQ43YoiVO1uwy6cw3EnWb9TE5g/ygoWxM89BD1hYLClw1?=
 =?us-ascii?Q?ej9+bQMOhgqUuw4Bw67NVSuMvkHwpM0ZgX6pSPCPXbnhm7/j3FoaKPhACjvY?=
 =?us-ascii?Q?uSffzQzb1FQ5dNLuzdKAyJ6nEMXrQFI4aLBbdFdU+wnKDhEZRGlc5vm/g//9?=
 =?us-ascii?Q?BZwPFjOQmrWUgLF4TSAubacFe6YXZn4hfV/9JWRfoiKcD2GNxgGqB8Fz5HQm?=
 =?us-ascii?Q?KcoZrlvSK/BR7DUcL+KDbsytbz0nsq2Y0pV9VpveOjYLGIDHiE6l+YGlZsrS?=
 =?us-ascii?Q?dLSrObQ7fm48QdkwPPSM/2O6lsnYqwtQNNrKABKdbyWCPtJq3j0rsjJuOtzE?=
 =?us-ascii?Q?fb7vWzN6DeJ+VvkNVtgO5dCF140ZNK5GxEpFK2xo0MJHkPbQfBYtAWXLxDCp?=
 =?us-ascii?Q?aarRG7H2rpnL1UQcTPBVLFt3gDUsKR2rtg9hjqafySMXO6YEsWf/LPbez2c/?=
 =?us-ascii?Q?ASzs+tvdZAsxwik7qGWPUSb0Zi2RHSRwdzaciul1oizSR78OI/+or4lyIFte?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb7041a-7348-4e73-4fba-08ddbfc3afbd
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:08:54.6442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R94Tj3ALUNWdmYS2F87o/t+2bTEAMG1B9VH+xqDHgPu8t1H3kzOMm0SLJk1ysCplcMp3zclbh/EjfezZLIVoOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7809
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

From: Badal Nilawar <badal.nilawar@intel.com>

Reload late binding fw during runtime resume.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 2 +-
 drivers/gpu/drm/xe/xe_late_bind_fw.h | 1 +
 drivers/gpu/drm/xe/xe_pm.c           | 4 ++++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 85cd42a1ec05..df43523e9043 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -82,7 +82,7 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
 		return 0;
 }
 
-static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
+void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_late_bind_fw *lbfw;
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
index 28d56ed2bfdc..07e437390539 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
@@ -12,5 +12,6 @@ struct xe_late_bind;
 
 int xe_late_bind_init(struct xe_late_bind *late_bind);
 int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
+void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 7131c403cbe8..b2cd94dd817e 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -20,6 +20,7 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_irq.h"
+#include "xe_late_bind_fw.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
 #include "xe_trace.h"
@@ -545,6 +546,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (xe->d3cold.allowed)
+		xe_late_bind_fw_load(&xe->late_bind);
+
 out:
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
-- 
2.49.0

