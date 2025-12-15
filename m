Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BC1CBF864
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 20:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FC410E4E8;
	Mon, 15 Dec 2025 19:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cn5IiT4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C2810E269;
 Mon, 15 Dec 2025 19:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765826651; x=1797362651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=TbY1KTmiiCigEwyyGpbTK07w5oFfdG4dPMluFJaJfMU=;
 b=cn5IiT4OryvN7qoCjNijKZAFDBK203m76xsQmFw0eAXsYeZ13kc3of3A
 JjwoJ/vdYRSngOfr2HufKWUCribCe6n51H0zfBgeLeZBj+hVRiNdh5CBT
 GfPRNiaXTbAxE6rI6r8lNc38vnt4r/EOah5LyNYNEzpf5LSaHeJQpsgBP
 VBUqQJOtPLwPZsUOkF95oC8B+ay5gC5HQ8FWT+qkqCQ9/rNQaKR5MuCx8
 sHjKI+/zpX95YZtoTHB8EKB3g/Fcm702uYmtRCwC1rOyQCd3mvkRi5j2s
 NmezY4gjBep4J/rZppAwkTN9o7zvUkldhN7/CjRqQyHKoq0Co+eLSOBs+ w==;
X-CSE-ConnectionGUID: z0cppxIgQYCXCtcZHKnW0w==
X-CSE-MsgGUID: pVQpohwTRg+eFqaRRv8FYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="79106209"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="79106209"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 11:24:07 -0800
X-CSE-ConnectionGUID: 1jMryaX2SYeo1ZPmnX0a+g==
X-CSE-MsgGUID: w5l/ZWb7TEytfU5Toa180g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="201986963"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 11:24:07 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 11:24:06 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 11:24:06 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 11:24:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeAZWs6HtnftvrkXmFMhDR2hKQt7K6r7PceM6AoNsCHcTtrNN+B9xnTw+P50GYntAIr2SFDjLEE8/T8f7fBO0REy8yqYYuY9I4lmxmQIyzE5hoNNHw9ZORBOQ/3AWvY5j7Fgp87jkMz7P7OrTgkXKlEkXLfysD/KiKg//56xeXJ9ff1hWogaelb3fhOJAYa/hkDFowONbYoKnId9/qKk0NOvxBNDAREYKfoCyzmmBCd4t+ejUTtmBcvuFT3fMOP9jILvvPF1aFxGpbryW96cMagNcERCfB5HqqecXV2e71dagLovXz/+57Z5oy/ttLLMyO+CSvZldGg2RQGqbj/7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNxeBTYqKZTSWfKWBBwEKZP9IUd+tWEFWQR6PXm6a1E=;
 b=vl51C+ndvIw6xWT7Puu6OxmF3WASTX9ioK5ngUYqDP4imytGbWslCNi36hSYj/wYz83QiM85KhYFhlSNa0lK4DKkJIBrC3sG1a9UmnWefuU/KFr2IjP36eZMRba0IaxTILke6S1GaKhmQXaTE9R8tdBpZ/ayOy511l8zagNBO3PpJV2Fas9nKCBT5kbteAM1Ddfynl9KeZU2Hf4ocgg79S8Cn7u/dddg2R+/vImDUjAHaPHwLvyg+hYmXAlzmaXVVO5emt9n0UNSfh0QX80bVgWYR8sKgWvZiyWRD0osy+0i5WS7JXX+IwfsWyA4Iyafg5p/7ZX2cOb7fG08i9YWVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH0PR11MB5128.namprd11.prod.outlook.com (2603:10b6:510:39::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 19:24:04 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 19:24:04 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Luca Coelho <luciano.coelho@intel.com>
Subject: [PATCH 01/16] drm/dp: Parse all DSC slice count caps for eDP 1.5
Date: Mon, 15 Dec 2025 21:23:41 +0200
Message-ID: <20251215192357.172201-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251215192357.172201-1-imre.deak@intel.com>
References: <20251215192357.172201-1-imre.deak@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0093.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::18) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH0PR11MB5128:EE_
X-MS-Office365-Filtering-Correlation-Id: ba15ef51-f779-44c7-711b-08de3c0f8259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wbOYiEcfMqqtq83jEyVuu2M90ZakgwoXC4yfNYUffnT0yBh5cgNfxOA5KFfm?=
 =?us-ascii?Q?v8BPTvlD+pUnvQfp9LqGvNRk+u6O/mEKcYRQ/zbXl2/1HSa6KQFVW7lA8Nti?=
 =?us-ascii?Q?TtTHazViO8/eXAhdtZ+ZPc0KG1XsKP/2oQeZA6AKf+AFrJaI8npeJwOhy22L?=
 =?us-ascii?Q?IEY0FitxIhbt2qa9IVE1dF5q2e/0QSLpdOBKOym5YMK0GwyP/voPhH5Y4suP?=
 =?us-ascii?Q?dtE+dndr6USLR5hQfgiWpU7LwViShgMTZz6MBTLj7R1FJ5tt905eO+NziIz5?=
 =?us-ascii?Q?2ARFEbYwJipQ1cMoususAf/o8JNz79R/cPYatEOlFtPYKLKBhymLPLbF+gSw?=
 =?us-ascii?Q?kpu9KU+dpjeWjdd82KmSeBWMWIb0wa/IzryvT+9UFDE+ubejWE9kSpDXA2Ai?=
 =?us-ascii?Q?+gZUzdyJarHAkGQVkJA/f/nViZmJeV1cOIcmwUoyxRao4w9c6KhLVMaG/11p?=
 =?us-ascii?Q?6+DJWxr/0xPQsSkJC5cCA/8SizlDK/Ktha4FecPvHh70HPDKqlZ69fKgIraG?=
 =?us-ascii?Q?N+SEbpdTtsXynGDoRD2fjFHKoj9L9GoSi2vSZ69PeIB9I9ZV2/4X6zTGs6Qs?=
 =?us-ascii?Q?B1o8wrFJ+CRC5lJTpLUF7wGfhxDm9cVASo5C+gwy9V4Ko6zCC7jhr0TGUwPz?=
 =?us-ascii?Q?SinyORpkypPzCZdTWuiEUYbBJOyh4FnirbXomylO+XTzmOAi3maoYR/m1fNq?=
 =?us-ascii?Q?1XKdy0WnmKoizvdPqXLhjttLYiD93oWv5dxoxU8+aFWnEB1Z9BR4tKdtEAuv?=
 =?us-ascii?Q?xviQnqghYtMuntDbJ21XTLdV2N8kE9XjgK0NELQPdgumw8G91l08Ant/0Wz5?=
 =?us-ascii?Q?Pdkd6vnBniZB2QFd/uY+JGKMDJZzGYUpdA0Hh3BC3OEPxF5e9opZIBNkJKkH?=
 =?us-ascii?Q?2AIui7s4RsbqJg7twtybYsDmK8q1CLOYrOaoXgcAOwjGLxVh9ORC5Gu0YPJj?=
 =?us-ascii?Q?kJGPRwL2cJ8G4mwOKqoR8Vm7ZwHjLG1bZEHJUbM+tlUJB3ke7k4DDWc3btUf?=
 =?us-ascii?Q?RfH8TcobetM/enLE0AlxiLqp+jcC1I5mJ+EXmhuT5rWxm+2PCthvQ2uRyN1s?=
 =?us-ascii?Q?Ht3gmnCtXFbO//10mstktLN07Y4AfIABrOE/LEV85CczsLq9u6cyz/Rc/AQZ?=
 =?us-ascii?Q?2p9t5Ul44d2i8Gxzz+SE4LVtOyZ87p3fzoiDp+9bcze4/xKL/YhICO/Lo4AJ?=
 =?us-ascii?Q?wBy+DBOLAAKG24wnoD7W8RX16WJdYYiQabGMeLlzNjDoTJZ7sp7SkaNrfZxY?=
 =?us-ascii?Q?RP/x57ToJwUridjoYqYCO1NlDLA9J/fPsVQQWwC5VsNJiteTTB/3SegQRP+p?=
 =?us-ascii?Q?Smmyoiskr7vrP+HhxYY8smSpb0wejpbssfF3yX9Q7GWKKOfmqxujkxuMTTWz?=
 =?us-ascii?Q?flbsrrAHNDn+eXHqwQqIZ6SffV6bDM+czX95Jpjc0l96Kk0CBBAKfp3d8XtG?=
 =?us-ascii?Q?5JsE9UINieJaVhH5K2Y2y9s51dAohcFl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vNLRtqjyYJllCbeejHj1+p/xO5ZsEjV+RNz+8HENfYlVbiQ1TUl+njlskgJ8?=
 =?us-ascii?Q?NmCBXJPyeVgNbNdHTIaJ/uL5FznHMCQtTc7czbaSoVWdFE4kk27BpmVimfvk?=
 =?us-ascii?Q?orcqp4vPl3OQaFWgGRvVJQhLfiuvnUfHBBOUSI7JpJqqXTLQ8LQxLnFWvcn9?=
 =?us-ascii?Q?R4u85Rt0MfjCxSP+kjehteJPmvADuU6RpXv1JQt1q4z/eIovEUKurPnJFNh9?=
 =?us-ascii?Q?6JIjmRXzaV3UmcUAe7MQryS3/MhBB3aZoMInTUFxjAWdB9lIo7VFqRTv0tQu?=
 =?us-ascii?Q?wv5nIzJQaEHIIwsTDtd52Io3HzisPBUYinvFDdFecuDe1UkqDa8M1v+COPgi?=
 =?us-ascii?Q?DDYaMa0kXkK7y9jfS54NSkhuGuaP8yYyZLUT6vJENZ7uuTDLzS/WVDkFEVrq?=
 =?us-ascii?Q?o2hmd4d0o+6/A5zqLT1pQ9YtLcfkEST7pbtYkf2hlwADVuOa5RAm6cXK/PSx?=
 =?us-ascii?Q?a7t3SMwfU0tcb8yCzpurFZfA8DQmdxRIrUQhFAOqSb4HNVxxHtTM6+kcbvfn?=
 =?us-ascii?Q?YvqR8fmkDok3vHmgqOhPAno2jU04JwWuzRmA0r278I4Hd6ZYiOjHflIgfDWH?=
 =?us-ascii?Q?cDeomDAaBSV5JPW92OpO7/6wLts9ir6fmAPKWMvI3NA244RPGAnPfNAwqMX/?=
 =?us-ascii?Q?gLimSjvDZNnM0pQb99JGb87JXqYDNb3JMyoRIvAYrILX/OLnVy7VbVeX+uXO?=
 =?us-ascii?Q?/thBumzmuby508lVhNaKHoP7CFnLQgSZTffZ7Dv2msQY1uAaoTp5229BPzr9?=
 =?us-ascii?Q?Mvc0jESHOLl76IElffY+hnNnrn2mOqn8Xm0dDPiYiPKYtQIN+De3zXvb5fO8?=
 =?us-ascii?Q?Dl10IqGwgFTEM5hCH+AYMV/LKhu/5rifwbh1PsqHiTx8UxmtfYANxaVjCe9U?=
 =?us-ascii?Q?VUUKDJz0SUxb796nReMsi+vcvvmxbOy7z1GJolMov6QFNBV2R582CWzSJdkH?=
 =?us-ascii?Q?E/23s6uYoXrUBZX7IvH4EnCWhulW2Arsf9PdHGEUc0UkjJOow8EGzfApHstg?=
 =?us-ascii?Q?wMm6NvXgHhIZtYPPjwcB0vw0kocCaG0CCihJIerAW5gLaRd59Calm2XTNhWF?=
 =?us-ascii?Q?lwziWs38se+YHQwm3iRiayMap+8Zi8va7rKQv9B75lPlfD6E5dNQUf7r7si/?=
 =?us-ascii?Q?aPgi7vv4g8fiNKHedWxH84oWQ8cca6Bp5zxNrXfCYhgUcy8C9iz0tZhohuqL?=
 =?us-ascii?Q?kS3UB3rQFu827d8DV7Xj5ZdwvJeUPhB4NkmN0RHQ/dzq3ioqZtT5lSPEpjIv?=
 =?us-ascii?Q?tMVjIJcTQdgT5DAn1wG666m1sRh2PzAorAAUJa8XFOWibYKLt2jic2ggzmpc?=
 =?us-ascii?Q?86wr7+3uGS7FiAUWvjtWQalogi3DFbmEdOb0Wq/1/746MMwwcuOIW5Znq4sl?=
 =?us-ascii?Q?oflTFeO3bZgoUr+HGnZaGvEeMxeCH1CBIsTTrhJ17NlW5B6eqZmiDUiwBls1?=
 =?us-ascii?Q?G1eKj/OXYXCnB0+PlO+VtX+Gd9ghlSWw4CNnmhTVYvr8ZtJjDv4jcwIPLyNn?=
 =?us-ascii?Q?88o4+1NzUyih72qc1OBAQbzE0j3a0/yJkUbhwsf8YFKdaRX3sYe5x95Ebqhu?=
 =?us-ascii?Q?diSPl/rXiSV9eJ8tmTZLzeDVUPViDdl8HGTkWkZEOnY8DAYdNQ79UjaRQqKB?=
 =?us-ascii?Q?pGtxOP6xozd0q2X/rxq0FybTK9XNNzMcuG8dRiPAkftm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba15ef51-f779-44c7-711b-08de3c0f8259
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 19:24:04.3863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7z1EjelvExGzd0YsAvyWNuD+GbFl4AG+eZtF0Dci6dGr/yQJbfiwx+S6rVmMvNGEgQlE2coXu3kEfZL0iDLHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5128
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

eDP 1.5 supports all the slice counts reported via DP_DSC_SLICE_CAP_1,
so adjust drm_dp_dsc_sink_max_slice_count() accordingly.

Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 41 +++++++++++--------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f9fdf19de74a9..19564c1afba6c 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2725,15 +2725,7 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 {
 	u8 slice_cap1 = dsc_dpcd[DP_DSC_SLICE_CAP_1 - DP_DSC_SUPPORT];
 
-	if (is_edp) {
-		/* For eDP, register DSC_SLICE_CAPABILITIES_1 gives slice count */
-		if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
-			return 4;
-		if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
-			return 2;
-		if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
-			return 1;
-	} else {
+	if (!is_edp) {
 		/* For DP, use values from DSC_SLICE_CAP_1 and DSC_SLICE_CAP2 */
 		u8 slice_cap2 = dsc_dpcd[DP_DSC_SLICE_CAP_2 - DP_DSC_SUPPORT];
 
@@ -2743,22 +2735,25 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 			return 20;
 		if (slice_cap2 & DP_DSC_16_PER_DP_DSC_SINK)
 			return 16;
-		if (slice_cap1 & DP_DSC_12_PER_DP_DSC_SINK)
-			return 12;
-		if (slice_cap1 & DP_DSC_10_PER_DP_DSC_SINK)
-			return 10;
-		if (slice_cap1 & DP_DSC_8_PER_DP_DSC_SINK)
-			return 8;
-		if (slice_cap1 & DP_DSC_6_PER_DP_DSC_SINK)
-			return 6;
-		if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
-			return 4;
-		if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
-			return 2;
-		if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
-			return 1;
 	}
 
+	/* DP, eDP v1.5+ */
+	if (slice_cap1 & DP_DSC_12_PER_DP_DSC_SINK)
+		return 12;
+	if (slice_cap1 & DP_DSC_10_PER_DP_DSC_SINK)
+		return 10;
+	if (slice_cap1 & DP_DSC_8_PER_DP_DSC_SINK)
+		return 8;
+	if (slice_cap1 & DP_DSC_6_PER_DP_DSC_SINK)
+		return 6;
+	/* DP, eDP v1.4+ */
+	if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
+		return 4;
+	if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
+		return 2;
+	if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
+		return 1;
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_dp_dsc_sink_max_slice_count);
-- 
2.49.1

