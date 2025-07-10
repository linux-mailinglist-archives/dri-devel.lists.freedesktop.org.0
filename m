Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF17B00601
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BB010E8F4;
	Thu, 10 Jul 2025 15:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0sLDj13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43AE10E8EE;
 Thu, 10 Jul 2025 15:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752160150; x=1783696150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IyDEY7+NhQ3Bu2KRNQret88x4Zo2tRyWIiNc42Krk54=;
 b=Q0sLDj13KV2wcE8jKZJv024QKejHPKMmQOGHzjTmOb4LmrqBmrsmQLhJ
 GU30+Ug8qWOKEU27GH2JJ+YyrVKr2tno9pwoMwrup+g9LP7mB32SGfy3J
 iASsCK3ssEvFS20G6iBSe3urdNbv8/l6H9+6iH1eCqO38/EH3/MuH6G4p
 0V1djXHr8LaarTRdvGFSi9ZF5xPmckIWorwB6Oyae4X1ekgCaYt2qO8CJ
 w+/hYYOOOnTKzqiIGltLB09vVmu54c3AON2OSfzFoR4nHm9O/MrrfK0Ob
 p5uYFSrg3p+4z9rkZLH2cJoHFcCe7d1RTtSHFyk4bksA5PODeclT1PYPT A==;
X-CSE-ConnectionGUID: 1nHlzeZ1Rp+PJVFEnH0m+g==
X-CSE-MsgGUID: i/siw3h/QKqSmACoCb5mjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54416404"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54416404"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:09:10 -0700
X-CSE-ConnectionGUID: 8PektRdsQlWSASijTOMjFg==
X-CSE-MsgGUID: fytMrxnyTxKWHhLbjsh/nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160137799"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 08:09:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:09:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 08:09:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.86) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 08:09:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhXKRXGeRbuikt3/lnpqZZxHqCfREsCB7pYco0J/eCUVwXdnmlfdOOuY9cipTNam/cm6O9SFB6hs/b5jvFqzUrkWlqDICpM4ojfUQGZ6Vvj+1IFo+fGMapthJl5bzRvX50bh8pIoamdJJq4SNVYQY1d5iP8+qO55IxiQA9b7+HsL4GC0Ocvi9qegH5u3TAyYidlV4CxnnPaGhmhMMCxQbDpye9V0aYT47ym2gXGDaHXNLlYMEIld/R2Fr2irQVo5/IFzUBlISmSpk3Qs4A7568g8NIZQSSzCn4x3PQTsbw4nj9Bnkj0e825uinE/to5dkpknOcwHjrtVew/rLq0KnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbpe7Bz80syMJOlIuHBELvcpQue9/HU3q2HJdAjb4Fs=;
 b=LhhvbGsOZpz9L5+eY7zvTCkbKKBks2h0GmRGJAM9c5K0Sni8agTNX9HqZfQeZ0Z13QkB44QscjPC9/DCV1YeJQ2QEfyLjzGVvZYoIlMnIVwIya1mUfECKhbLLiCI5mfPRqM//boHvVB8IOpEb9tOzxs1EVQHVIXFo5ZURkxnCvsyv1UITMIgsRCI68/uq5/bilQYKF1jsk56T8+50366pNWtiK0sg/Z9yDS+0nvGGS3TaMsPAwaKkHJGnBLXemoR0REHy0wbA6zniqIkr4cavuB9IngQuoUjeggpkcqguWnqDGtozpwu4MfbLV2DENqZoPZIYVKR83srljOv3e6aeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7809.namprd11.prod.outlook.com (2603:10b6:208:3f2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 15:09:02 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:09:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <daniele.ceraolospurio@intel.com>,
 <anshuman.gupta@intel.com>, <alexander.usyskin@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 9/9] drm/xe/xe_late_bind_fw: Extract and print version info
Date: Thu, 10 Jul 2025 11:08:40 -0400
Message-ID: <20250710150831.3018674-20-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
References: <20250710150831.3018674-11-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:a03:333::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 8613ddc5-f136-41af-2719-08ddbfc3b475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BfFbKzBS77pUPuKQ2oUGu1QqASPqA1XjzHvaAKPbAsAlOz1yGMkiqlvzRHBw?=
 =?us-ascii?Q?gn1PGAqfrVXTNqhq/4eDuoYLFs4COnzX6XKj4TfdMyXr0CJxBzH8AXHyXZ0h?=
 =?us-ascii?Q?/9+Cr6XVqOghFjLvVurB0s/id6ZMAt71xgUpqcC5o6lA4DFh91gEmHVABj+h?=
 =?us-ascii?Q?jD8En8fC9D6JXeQqk90XvrPQZUfeYCyPJb8+EkeEbMzVyivwBB3pi0vbH0rT?=
 =?us-ascii?Q?FQu5eL6dfiTmmSAT8KYKycvhLaAZYrlGG4HBL6b99KKV38HLeMpB+Q2Sdxhy?=
 =?us-ascii?Q?TTV7Mev575IiZH5Idh/IVzclszuZDHZwNxqI8SOmj8ecG03YIqI7wH7kd+pV?=
 =?us-ascii?Q?pzk4htXFV/CRCwTCTltqPb5t5rBZ6/XmNOqXi9r5b77wuhH3utq9DNQUoc61?=
 =?us-ascii?Q?ynBHKRpoU8Ca1yZWb0JY8k4cY10JzHxhZgrKpNF+DFjEERHrEQWDMuU/21r7?=
 =?us-ascii?Q?lpZQNRJ3EL2A3AJJFNgP8FyBNABR3t4IXvtQcozrbdv68mgJNra/LPGQfi2a?=
 =?us-ascii?Q?912Qg+S6r3gW/s2uKRiJG/fKubT6SRGFGq1eJODZo+zwmecTaU0C517yivnx?=
 =?us-ascii?Q?5eFF3LgjuSLlpr3I6vzueIWIYP+rB5VDR38237W5uCDnnzKV8EZahUEfKYhw?=
 =?us-ascii?Q?2iHhH9bm+ntWdSdv2okM5V6ozE4Zo/cIdTcrNWOQ5pZitoEGt7OO38hj2Did?=
 =?us-ascii?Q?ROTl2jP+e+1+encXkaQpNNVVDEs5kbfZ66z6MfJiMboVCNg4iPI4xIlfcQFr?=
 =?us-ascii?Q?k999qTof8UPTTQqSgnuw3MbFgvDrhjQzQVXtZcIMfmp/v0hPHnkmXo6N0l3d?=
 =?us-ascii?Q?jCx25GiFijFW0HSf/9hRhR/M8cz//YwULHLCGP03HL9KzvD3c/BgOgR3qwuO?=
 =?us-ascii?Q?+4Isd7Wj1c/iVPqjhnsHMbyAuxCHLNmlcIV5wfKOti6bEXxOQzPfkNISYPE5?=
 =?us-ascii?Q?RwTWIM9tw94TVP9TV7zq3yNAqbN/HZEcT9NSvpyvCZhho6eIRN/V0yk2L/c/?=
 =?us-ascii?Q?10PJ/qEsHIP65pG2wOcX0t1Qw3PmrdNxq1QXupePPThc/+CJm+N3jbZ02NgL?=
 =?us-ascii?Q?tU9A6CFfR3B2yUe2WDwMOkZkSfVshMBvn/mo3/FV8ubUt5m2G8/by0A2ZwFs?=
 =?us-ascii?Q?OnAj1gabQyyPJX2oyFaTxc246sMaB2x9LZ73NLTGRlOPl0fnjrf0j8QBUCF/?=
 =?us-ascii?Q?A4wp2XHsdPvWXLSkn/xWXvy1G1Z7b+5qqndqgUBDNLgCn9MJ/ZnfbkU9LIpw?=
 =?us-ascii?Q?bDXmac6qfOpctbHGnS0OTV1NBjf0e6ZwuIHEtRamqFFlfnnpcJIzdfDuiQXB?=
 =?us-ascii?Q?w58Ed/JBJrJdPWENoUNKxBYg3TUNDekte7kAu3sieHoPxmLYH/EwJhacVCGY?=
 =?us-ascii?Q?batbwr6nXUs000p9tTeN5QzqiOn2hmWJzC/Ed0fLzazbaWITFHPKqVqIepMr?=
 =?us-ascii?Q?DqRd4hAilZ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mr5GiL+E0IaM5fPOUmAepo0QwSLIEUHCrtjYPHhyGoGJGjG/Go3/vbMT6ByD?=
 =?us-ascii?Q?aO7YpzDxj+NHxlQFEDeqCU78cco6b0+Mvl/c1XWUzvLOico4vboDdSmaNPdn?=
 =?us-ascii?Q?yuZP9ShSvz/ecL3YRwG4YA5uSuDAbUND4nb1+dGZKcTyR0edIDQ6xI6iuZQd?=
 =?us-ascii?Q?pMNyg5iGs3hBjIf8k3Tl66ytALwJHKEMl2kO/S0IFz6+mb07KN/5krRMfNTg?=
 =?us-ascii?Q?7yheyo78UQYlG7SdXOTET/OrmgeS+yTx1KHEtD1p1D63e+SaQ8vS7pMI3vOr?=
 =?us-ascii?Q?8JkiP+t1bwLYD23B9UN4U+28iba/CR+iyt0dqfYotZ9iCCmqsDO3RjIZ3p/Q?=
 =?us-ascii?Q?LajxgwdQqcTv6xn4XxoF7DaNiF0sQQGgSILnV9kkyF2eYvgVGVcG2qsmVPH2?=
 =?us-ascii?Q?gBk6hKHNv+5pOC1FgCRAaYCzqnDh8OFhs9UCgwKo80Ti9f2o7vUEzupNB4s2?=
 =?us-ascii?Q?HI8HFY47jJQIkZAYnCPg+L2h44eEdk5XgBGVkrqxcWpvZP01j7LEyTrOYmEh?=
 =?us-ascii?Q?N2cN2F2eITJT6dsSk++HgvMiRJYmwPrlklzQeki+0QkooUfAGM1Tvw23zYUs?=
 =?us-ascii?Q?6OojlNsdKzwigmqeRSxT62pluSV4ikk+Gf3/NItJcLkRTgDSoAybECJ2fB5g?=
 =?us-ascii?Q?8n0XRfXW/sAkDKgqoipfZhUvPK4Orpjg/2QA5HQim6CLH7HkWGI7ywq8y6Zw?=
 =?us-ascii?Q?PC/MYoGoMUGw9L23sASXvAQH2y2QxhdxyjxEHqQSMJsZdmwAFw0Vrh6c3nQ1?=
 =?us-ascii?Q?7O0DJcpkjmZwXuqXNViyzDB6Y6FcAsxw8hZS9NH12qMUWO4g1Q/zI2/Si81i?=
 =?us-ascii?Q?ZLRGY0D81M+QKexcle8eYBNvZG3utmpah6uFD3zXlYXy0fbuZ4MlhBxl0EQd?=
 =?us-ascii?Q?B7KP6lr4HoAKET3Tc2vvazxhEl1+ks+Ik3MOm7ZGGpfCCi6dvH2tBQTRFXtj?=
 =?us-ascii?Q?2MPY7MqyvFjuFJGUfaVownFuNnJd8olL+/WYV2mpSxRUXlYP8odUSJdJ4cv9?=
 =?us-ascii?Q?1Dthh1HQ0tM3U+yR5wulRGZqpgn+XkmcXxeL4thum79f/CNUd2Xx0jpmem0J?=
 =?us-ascii?Q?VhpFDqKjG50t8W6Z7/1y0k3ry0duxwM8uMZLk/2FbSVZ8q/xOBafGTfxx3r3?=
 =?us-ascii?Q?HtH04oajZfJe+0lKNFC8JLw2rRKfH04xeudbFIioKITuPvQ/YR2RAKjOnuE9?=
 =?us-ascii?Q?RbaVg3fGxnwqmy3lC9ylnSLdY0lx5v5dDWd2p7yaT10PfZ0tsEc/d49rZDrN?=
 =?us-ascii?Q?Pue7zxNaR7rBlkV1zM6R5IS+lWkdC3q0IwzFH2AMDalvox1DQe71QEwxnPwL?=
 =?us-ascii?Q?Z3LLLGSPebShhPRdO660Uue5bQSEKggoVGJyYNDbsh8duVQAbpu9xUzlHrO0?=
 =?us-ascii?Q?iJYQEP5sk+TiD547IpyJP0/CIwbkEPR37mQQOS0j5q38a7gG3kjbLhV1v74k?=
 =?us-ascii?Q?DtZJrHx5pzgnHjfk90IKhtkAHNYdro3BGnZ4yj1hNPcVO3UZUqnxIrDpONE8?=
 =?us-ascii?Q?jlKzfEOByF2l2Uu0WbfYDfKciXe7sc//zDkJUrV6np61ba5DANz2pHHmMDsM?=
 =?us-ascii?Q?3hb6b/TcftWo9mQWcQEAnNKrDCIDYxDE5njClq+w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8613ddc5-f136-41af-2719-08ddbfc3b475
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:09:02.5547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ytKCZSEvlheXsejuXqzOxkmY6CRTq2zBnB2JB8+JBQ2QjOq5T1eyA8F9vqdMDrrbHl1PQY4bdjLHPtbUa2EUg==
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

Extract and print version info of the late binding binary.

v2: Some refinements (Daniele)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c       | 124 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   3 +
 drivers/gpu/drm/xe/xe_uc_fw_abi.h          |  66 +++++++++++
 3 files changed, 193 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 88355adce1d0..171771639761 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -45,6 +45,121 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
 	return container_of(late_bind, struct xe_device, late_bind);
 }
 
+static struct xe_device *
+late_bind_fw_to_xe(struct xe_late_bind_fw *lb_fw)
+{
+	return container_of(lb_fw, struct xe_device, late_bind.late_bind_fw[lb_fw->id]);
+}
+
+/* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
+static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
+			    const void *data, size_t size, const char *manifest_entry)
+{
+	struct xe_device *xe = late_bind_fw_to_xe(lb_fw);
+	const struct gsc_cpd_header_v2 *header = data;
+	const struct gsc_manifest_header *manifest;
+	const struct gsc_cpd_entry *entry;
+	size_t min_size = sizeof(*header);
+	u32 offset;
+	int i;
+
+	/* manifest_entry is mandatory */
+	xe_assert(xe, manifest_entry);
+
+	if (size < min_size || header->header_marker != GSC_CPD_HEADER_MARKER)
+		return -ENOENT;
+
+	if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
+		drm_err(&xe->drm, "%s late binding fw: Invalid CPD header length %u!\n",
+			fw_id_to_name[lb_fw->id], header->header_length);
+		return -EINVAL;
+	}
+
+	min_size = header->header_length + sizeof(struct gsc_cpd_entry) * header->num_of_entries;
+	if (size < min_size) {
+		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
+			fw_id_to_name[lb_fw->id], size, min_size);
+		return -ENODATA;
+	}
+
+	/* Look for the manifest first */
+	entry = (void *)header + header->header_length;
+	for (i = 0; i < header->num_of_entries; i++, entry++)
+		if (strcmp(entry->name, manifest_entry) == 0)
+			offset = entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
+
+	if (!offset) {
+		drm_err(&xe->drm, "%s late binding fw: Failed to find manifest_entry\n",
+			fw_id_to_name[lb_fw->id]);
+		return -ENODATA;
+	}
+
+	min_size = offset + sizeof(struct gsc_manifest_header);
+	if (size < min_size) {
+		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
+			fw_id_to_name[lb_fw->id], size, min_size);
+		return -ENODATA;
+	}
+
+	manifest = data + offset;
+
+	lb_fw->version = manifest->fw_version;
+
+	return 0;
+}
+
+/* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
+static int parse_lb_layout(struct xe_late_bind_fw *lb_fw,
+			   const void *data, size_t size, const char *fpt_entry)
+{
+	struct xe_device *xe = late_bind_fw_to_xe(lb_fw);
+	const struct csc_fpt_header *header = data;
+	const struct csc_fpt_entry *entry;
+	size_t min_size = sizeof(*header);
+	u32 offset;
+	int i;
+
+	/* fpt_entry is mandatory */
+	xe_assert(xe, fpt_entry);
+
+	if (size < min_size || header->header_marker != CSC_FPT_HEADER_MARKER)
+		return -ENOENT;
+
+	if (header->header_length < sizeof(struct csc_fpt_header)) {
+		drm_err(&xe->drm, "%s late binding fw: Invalid FPT header length %u!\n",
+			fw_id_to_name[lb_fw->id], header->header_length);
+		return -EINVAL;
+	}
+
+	min_size = header->header_length + sizeof(struct csc_fpt_entry) * header->num_of_entries;
+	if (size < min_size) {
+		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
+			fw_id_to_name[lb_fw->id], size, min_size);
+		return -ENODATA;
+	}
+
+	/* Look for the cpd header first */
+	entry = (void *)header + header->header_length;
+	for (i = 0; i < header->num_of_entries; i++, entry++)
+		if (strcmp(entry->name, fpt_entry) == 0)
+			offset = entry->offset;
+
+	if (!offset) {
+		drm_err(&xe->drm, "%s late binding fw: Failed to find fpt_entry\n",
+			fw_id_to_name[lb_fw->id]);
+		return -ENODATA;
+	}
+
+	min_size = offset + sizeof(struct gsc_cpd_header_v2);
+	if (size < min_size) {
+		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
+			fw_id_to_name[lb_fw->id], size, min_size);
+		return -ENODATA;
+	}
+
+	return parse_cpd_header(lb_fw, data + offset, size - offset, "LTES.man");
+}
+
 static const char *xe_late_bind_parse_status(uint32_t status)
 {
 	switch (status) {
@@ -224,6 +339,10 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 		return -ENODATA;
 	}
 
+	ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
+	if (ret)
+		return ret;
+
 	lb_fw->payload_size = fw->size;
 	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
 	if (!lb_fw->payload) {
@@ -231,6 +350,11 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
 		return -ENOMEM;
 	}
 
+	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u.%u\n",
+		 fw_id_to_name[lb_fw->id], lb_fw->blob_path,
+		 lb_fw->version.major, lb_fw->version.minor,
+		 lb_fw->version.hotfix, lb_fw->version.build);
+
 	memcpy((void *)lb_fw->payload, fw->data, lb_fw->payload_size);
 	release_firmware(fw);
 	INIT_WORK(&lb_fw->work, xe_late_bind_work);
diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
index 158dc1abe072..0f5da89ce98b 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
@@ -10,6 +10,7 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
+#include "xe_uc_fw_abi.h"
 
 #define XE_LB_MAX_PAYLOAD_SIZE SZ_4K
 
@@ -39,6 +40,8 @@ struct xe_late_bind_fw {
 	size_t payload_size;
 	/** @work: worker to upload latebind blob */
 	struct work_struct work;
+	/** @version: late binding blob manifest version */
+	struct gsc_version version;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
index 87ade41209d0..78782d105fa9 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
@@ -318,4 +318,70 @@ struct gsc_manifest_header {
 	u32 exponent_size; /* in dwords */
 } __packed;
 
+/**
+ * DOC: Late binding Firmware Layout
+ *
+ * The Late binding binary starts with FPT header, which contains locations
+ * of various partitions of the binary. Here we're interested in finding out
+ * manifest version. To the manifest version, we need to locate CPD header
+ * one of the entry in CPD header points to manifest header. Manifest header
+ * contains the version.
+ *
+ *      +================================================+
+ *      |  FPT Header                                    |
+ *      +================================================+
+ *      |  FPT entries[]                                 |
+ *      |      entry1                                    |
+ *      |      ...                                       |
+ *      |      entryX                                    |
+ *      |          "LTES"                                |
+ *      |          ...                                   |
+ *      |          offset  >-----------------------------|------o
+ *      +================================================+      |
+ *                                                              |
+ *      +================================================+      |
+ *      |  CPD Header                                    |<-----o
+ *      +================================================+
+ *      |  CPD entries[]                                 |
+ *      |      entry1                                    |
+ *      |      ...                                       |
+ *      |      entryX                                    |
+ *      |          "LTES.man"                            |
+ *      |           ...                                  |
+ *      |           offset  >----------------------------|------o
+ *      +================================================+      |
+ *                                                              |
+ *      +================================================+      |
+ *      |  Manifest Header                               |<-----o
+ *      |      ...                                       |
+ *      |      FW version                                |
+ *      |      ...                                       |
+ *      +================================================+
+ */
+
+/* FPT Headers */
+struct csc_fpt_header {
+	u32 header_marker;
+#define CSC_FPT_HEADER_MARKER 0x54504624
+	u32 num_of_entries;
+	u8 header_version;
+	u8 entry_version;
+	u8 header_length; /* in bytes */
+	u8 flags;
+	u16 ticks_to_add;
+	u16 tokens_to_add;
+	u32 uma_size;
+	u32 crc32;
+	struct gsc_version fitc_version;
+} __packed;
+
+struct csc_fpt_entry {
+	u8 name[4]; /* partition name */
+	u32 reserved1;
+	u32 offset; /* offset from beginning of CSE region */
+	u32 length; /* partition length in bytes */
+	u32 reserved2[3];
+	u32 partition_flags;
+} __packed;
+
 #endif
-- 
2.49.0

