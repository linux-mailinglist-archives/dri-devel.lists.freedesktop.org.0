Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EC4ACC648
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 14:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902FC10E926;
	Tue,  3 Jun 2025 12:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNX8Ojqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4184F10E90D;
 Tue,  3 Jun 2025 12:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748952972; x=1780488972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Hc2DOmT/31Uk/XwIJTSiLY30lPRunBIz36N0g5KuFeg=;
 b=QNX8Ojqx2L0xuZCrVDw1U+vOu7RFn23JHOiFTT42UqArebCS/dkoB+dF
 4T47mnMcmSKBWGCrKrrY3W86ThY0N9HqXoeLJa2wqD2mwiIUYHMszdGFW
 FxtrhJJaNKGEHw2+9tGcdYapxAesFA3K/qa55HoEiAywlxNSnObKkNP2I
 W2fqFZ3JSvfzhfn8YRp5VlpMY1f4NxZnhlO5Ky6AQ1zHegPRGesSY/es4
 k1t1CDF7YjLgPK8ok2bHf4goj6eMxkUL5omqKy5VHPrMvbVgPReiwKoTl
 OV39uoWg/Vmg716j/fYsBxJuyHJEzw2W34b7H4NtSNMdIqpEWdHZkQOA7 g==;
X-CSE-ConnectionGUID: SGRsvxMWT7GkgJQcxfIvrw==
X-CSE-MsgGUID: ov6auC4NQwiOmtzzdJc2SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50230066"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="50230066"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:16:12 -0700
X-CSE-ConnectionGUID: WNKlt6jvRSGEWWoaiopFqQ==
X-CSE-MsgGUID: qVP+Akh+RcePEUFziJp8Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="144818028"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 05:16:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 05:16:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 05:16:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.80)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 05:16:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCAhJAhLuoeUuD5nLZpcags3DIktHuZM19QQj4v5engtGakBo6I1qPuI78cjUcYlUMrDiXT+Y7Ffw9q4Mmo7krZ7q0gMc5O0OwdwkO20ChvUZASqcPNN2aMh/4zrWPZT0Nf5z1HWxJsvkJuLfvgaNQgXKNONikGlgOOFbFP9wWjWyXeHdZ4oCgVeeZLEapFflNeEhby1bQRISHN5IbKYffbT7JluMbiObG8g+SCiWM10arVoNm/BzpjPQhtmPvj8R4PuSAk1wSZM9NmM0AmDU56kmCNSjhSvushNI4CJOOMz0kpjBgWhdzQ6Y03GqMtpHlFHez6DSRCSje36f3iM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5Quki4VuC+EPyy/z795zZcOdhCULJDTc3k/EjknQjI=;
 b=fOJdhYu6YPj1vFXLT3nSI+wNez6VmdOMQpIWkQevaymNJERDQ2ikaycVDsUiZzNvAQDvzsroa0riG8F/BZXPAIJRulxiOOCZhOqlh7e3PoWqq4/kACRihujyycSNyrjNxocfaWspC7A5ZBwnxcso3jhx2IQABbwDvdCwwh+KghWbNdEsMR0yXakli4B2mUgcPx63qXZ+5d+HYxWUAW44MhI3cY/edN8jKdNtmzUH7USqbUalK8CmwmiAgotdOYJUcfPANpMo9PW4zmt0cVL0x2CaziSQTmfUtS8n3FbfCU/HVtxJxAoqD150CtQx7qt7UmWzqURItTP2PSrW3tkXNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BY1PR11MB8007.namprd11.prod.outlook.com (2603:10b6:a03:525::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 12:16:00 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 12:16:00 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH 4/4] drm/i915/dp: Disable the AUX DPCD probe quirk if it's not
 required
Date: Tue, 3 Jun 2025 15:15:43 +0300
Message-ID: <20250603121543.17842-5-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20250603121543.17842-1-imre.deak@intel.com>
References: <20250603121543.17842-1-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0233.eurprd07.prod.outlook.com
 (2603:10a6:802:58::36) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BY1PR11MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: aefa9ad3-30c9-4de9-524a-08dda298671c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVZJeGVvT3FpL2FsSXZ4cWtpOFNmSTJ0K1B0N0tmOHJMTkROV0F3dzlWcmJp?=
 =?utf-8?B?aWtPa3pQYysxdW1sdXJvL2pCRjVaSmxsSmhrLzZEdjJiYlQ1bEZlckNNNmxI?=
 =?utf-8?B?YTkrUmNZRlpIVUVKc1k4MExqbEY1dWF2enlhRnNGRGJCVjZVNUhWMnNHM2Jr?=
 =?utf-8?B?Nyt2UXFnV1l6b2UxS2JaVGp6cjBkZCtxTWI2VWszbVBqYnAvOWZzSFZxb05N?=
 =?utf-8?B?V3Qxak5CdytOZm1MZ1IrMURtdTFLS09pRkNzc0xBQzZnNkJMV1NKUEdCVSt3?=
 =?utf-8?B?RWlPK3ljTlVGMkdGdDJtdEFUT2h1SVRvdW1kbjBPZjhpNUt1bUhBOVlsNE0y?=
 =?utf-8?B?Rmsvb0lvVDRJOHpmY2NJNkdKb3dzd284NVF5NG5KY1k5MnA3ZEEvbkZLeG9s?=
 =?utf-8?B?M29iWktDWWJXejA3eWxDY2NCNUNyNlRQNExjMUcvQ1haS0JJSDZRcFNQMElF?=
 =?utf-8?B?dHB2b2t2dmxWQ1NmNXY1V2ZUeEozSlY1dzFtT05sS3k2eEhHR1ZjaFJUMXE5?=
 =?utf-8?B?U1ZXd1NBMzVGYTRmSEw1WUZ2QlB3ZjNIM2Y1M0tGdVVOMGRNMWVTZitHcXBR?=
 =?utf-8?B?REJZRHZXci9TZG9lamg3dmlSSlBja08wcGJMWlZhdXNmUGZyUzMvdTR5U1Y0?=
 =?utf-8?B?S0hTSGhoNjlXaFVUdTBaSVpmK1RDTWxYRVlJbXMySWtSWEhNSkdhVTJ6MzQw?=
 =?utf-8?B?ckhuRlBVVXFkKzZBdDVDQ0haVUkxcUcwL1J2bEJLUHhlZDBCajBHa0d5Kzhy?=
 =?utf-8?B?OTBWcHNLMk5ldy92aDY5Z0toczNMdHNUTFhNS0tKVTVsMVZpcVpCS0k0UTN3?=
 =?utf-8?B?d25TRm9OQzNLS1E5VWprQ1c4bXVmNitTTWZMd3o4bHk4M09pMStwdVdlYUtK?=
 =?utf-8?B?ZnB4M1Vjc2ZuNFJzMzVXbkc3TGpYMnQrRmE0eU0rUDRWWGdsaXUxNkhtR00x?=
 =?utf-8?B?RTdUQ1hzSllLVGpKS0R0NkNEUllpV285ckRORHF6Z1B1SUFNcEw4TGxZNklv?=
 =?utf-8?B?a1JHRVhUZDJYWWVudm4ydit2Vjd4bHhCV3FYSzExTDYrMFdCOXZ6TFRoTmRq?=
 =?utf-8?B?U2VOMjVGYnR5Sm9nMkxOcDF5SVhTb3VNMUhVb25EVlRmUDdmQ1VncTFuTDhV?=
 =?utf-8?B?ZmR5ak4vQlBWdnJneG1wNVMwdXlweEFpaGYzNmw3b0VIUFZqTy9tUE1kVmtm?=
 =?utf-8?B?eUNLMEt1OGh5L3JaMXA4U3VNVktzMGlnUXpoclVGbVA2MytmSlRwVDMzcGUz?=
 =?utf-8?B?djNvblROVHZmeXNadU1mais3UUR2UWtGdVptRm1zMEdQdDdUZ1hQSVZxcW5R?=
 =?utf-8?B?dUdEVktnakY1T2VMVEVkR0taZ2JXRTUxS2NJWTNwTCtZalNjQm91ZjBMNytW?=
 =?utf-8?B?ZW5ldGtnZE9oL3dSNWJJY3BVTHMxZU92c1c4NDVyV01UQmJQRjBmc2kzZlFi?=
 =?utf-8?B?ZEpzcDBSTEJvOUllN0tZeERjVTNTV3dLMkFZNE5kdTRFaE5XVU5EYVNxV2h4?=
 =?utf-8?B?MGxlMUlRdXh5RmRqczRIUzRRQ0locW9ZUWRMQUxNZ2dXNStXRjNpMy93ZTdo?=
 =?utf-8?B?UEVONDR3aGZNSk1YQXRpenlBc3FVNHdtRTN6RXJUeThicnYwRWNDVzh6T0th?=
 =?utf-8?B?VS82bzk4aWhrRHhVU2hqVVZMVC9QVmNHQUVHMVF6LzY0cHUrb0xNQ2ZWZUJR?=
 =?utf-8?B?cWRXWTBiUWlVcWppWjJpcEIyVkU2emxQbmxJTk9KVktKSVM4TE44eGlYYzNQ?=
 =?utf-8?B?UitXNFZ4Y3llZmY5cko4bUZTS0VkRUJNVU1meFhTTFZmMFVXNEJGQi9yRlZ1?=
 =?utf-8?B?RWNjOWR4RWdpUno5cXJGNFhxeHJMRElLZStyb2pUcnNZRXJ1SE1PMW5Uam5p?=
 =?utf-8?B?cE1NQm0rNUpyNU9zZDRiNFUxdE40UHYwc2dLSXBNdGVSbmJ2QzNIR2JWZ3l3?=
 =?utf-8?Q?CHaiEXcHfng=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEhYL09MVS8wTHNoeWNCcTIxc2hkRzE3T3VwL0NLMjYyeUJWQ05PaWdnM0pi?=
 =?utf-8?B?eU93aWZablNhTnJMV1ZoTENvaDk2dzVFUEhRY0N2NUVPZHl4WjNObzBvTVJx?=
 =?utf-8?B?Q013KzVjRXA4ZkRBaHIwMTBKOUJQT2ZrY3h6TkhrTWlieDhhcHR0UkYyem1v?=
 =?utf-8?B?QXFZSlFsY1h6cUloblVoMktPRVFEczNtRzlKc08wWVJ1Y3hKc0RYc0ZseWhw?=
 =?utf-8?B?UnY4YVN6MjZLdm9ETFJpbnQySWtMVElpS0hmdzdMM3pqcEJUelpwMzFZR09G?=
 =?utf-8?B?WVlxUUNQY2RHMmwxa1drRHV0UXJLVXYwS0c0S3laZVlIazRSMjJqYnpOUFdE?=
 =?utf-8?B?THhQOTI2R1YxSEtxMnBVa0lEcHREaTR6NXlqaEpPejdoRGt0cHR2Y2pPWHV0?=
 =?utf-8?B?RW5rUEQrRXFNN0xOSklMK2JSRDhNWnBodlhVZjJIc2JGMG1LVFdzNTN3ODdO?=
 =?utf-8?B?RFRkc2k1bU03VDFTb2MyOGV6WUF1UWRhOFl5YVNsKzV2YkdwZUtRMlF6YXo2?=
 =?utf-8?B?bkpDTldqTzdmaHExQzg0c1pvTDlWQm55Rks0ZGhkWE9tUEcxMG5zaVF3Sy93?=
 =?utf-8?B?QTU3d1JoK3dqMGpIZnp2Yk5HcXdDZ3ArNGZGNzIzdGdKVkNCVzRpTlIzNUJx?=
 =?utf-8?B?Q1ZIV0l0S0VwemFYcjFOQldDT2pxRkN6dDBROXBudG5jNm1rZlVNbS82dGlN?=
 =?utf-8?B?TUNXZG0vOEZ3bzFINWs4RDIrYU9zbG8yNnpyNlFPRkxEU1Q4amVJT3dZY0NQ?=
 =?utf-8?B?NUczZXo3Z2lSTUtJVU1na0RCbzRSSktsdUYwbm9HRDZQMERXSVViSUxMMDNK?=
 =?utf-8?B?N05XSTVYQ05QMHc2VzdSZHVibTllNXFzUVJFNnVleUhncWFRUGd1Mlc2anFN?=
 =?utf-8?B?UmhiVmN3MVluMWxoaG1EYmV6cHdaZ2F4YXY1dnNaR2dpc1VMUmFrL0NuYWR2?=
 =?utf-8?B?WXErdW5KT2hNeXUrM25IdWN4ZlNKVk5kUHVzbjRaN3dqZjVoQ052ejhxUE1j?=
 =?utf-8?B?QjFYSDAzR3JseWVwbjQrOW01TTVtSW4zZXFSc3Bma0ZOd0xwZ0lxaVFzWW02?=
 =?utf-8?B?UGdrQ21yN002amZLWlhqNXB5OC9SMWI2LzBMcCtuTjBrckZXY3k0M2hxeGdQ?=
 =?utf-8?B?UXVTZXhsVEJnN1ZGNXVoQnc1Qk5tNzdad3VRblpuNjJEd3NxblZ4cWhCRCtv?=
 =?utf-8?B?U1JUL1c1YWZTczRyU1lqTFMvSG9OZ0owZmgvQTRLS2dYYWlIU3JDRHFoKzlC?=
 =?utf-8?B?NTViN3VNZHRBNndnZkF3YXZVMVl1ZXdqb2hIMUJYaU5KN1A5eWQ3enRVT0xK?=
 =?utf-8?B?cE0ya3NBZGNHUEFSNmxxOFVVaGRxK1FyR1pEVlVUS1VQNXFRWGRNR0szeFF5?=
 =?utf-8?B?V3c4SUpRa0hSRTg1ckh3Y2gxYWltajVJbTBYOWZxdSthR0N0SG5rQmtMSVVW?=
 =?utf-8?B?d2pFWEUzbkhDRVBvOUxuVHlVUVpnSzh3QU1RdlQwbEl3Rmcwb2RtcFA2d1ND?=
 =?utf-8?B?eThleFZFVDFKaHU3R3hZTE0wUUQzT2wvNGVMMDBEajkrMUNvanFBa1FwTG05?=
 =?utf-8?B?Q3ZqcU9FdTA1NDhhZFQ4clYvcUlCVUFkY00rRWhxQU5JZlp6ODFjZDlZWXV6?=
 =?utf-8?B?M2xQR1JmR3lRWVJoMWxWQkNqcFRsTldLNVA2bzhsQURVZHhWTW9TSTlPT2t0?=
 =?utf-8?B?Nlp6d0xqZmpJWG4zVTJDNmNacUc0a3NqbkxBeXFFUTcyNG1FL2pzZzNaL2d5?=
 =?utf-8?B?RjlCODkrQkNhWmF0a25sNUJYSTlIaW0wbjZTNVMyeHpBaW1DOEpoaUVCUkFI?=
 =?utf-8?B?N25ZZG54ekxRdWk4TldFdmtza3AySGZwWmgrKysvbjVwOG0xSTlzMTdWVmlz?=
 =?utf-8?B?UXBmNnlwdWpvaSs1RXYyckUrWUViekVodENNY1RBMHpzWU4xNnJ4NURlSGkx?=
 =?utf-8?B?clU0cnJQZWVHMERvNjlNcWtlM1lMRzR6SVJJb0VnQmt4OHVLbzZsa2NKVi9S?=
 =?utf-8?B?Nm9YTGUzd21FSVNHTGVqVFh3VlB6Mk1BOXBoTVpTSGRVZmpYc2x0TmdPME5F?=
 =?utf-8?B?ekRQb2RaNWNrWVpDbUVKRG1RTVcrR0FDVmZmL3VSMTJvc1BCSzNxKzVpSHFh?=
 =?utf-8?Q?r2+dPAjDGrRdV9Ydmr/HgnLbq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aefa9ad3-30c9-4de9-524a-08dda298671c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 12:16:00.7118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: is2LDSsdPIQxbqSa15b44gznbMf50LdP0JlP6pqsmWLb+MrYQACr0PlWFTlz3RLM3+4iU9xJ2W1qy/JOubh0XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8007
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

Reading DPCD registers has side-effects and some of these can cause a
problem for instance during link training. Based on this it's better to
avoid the probing quirk done before each DPCD register read, limiting
this to the monitor which requires it. The only known problematic
monitor is an external SST sink, so keep the quirk disabled always for
eDP and MST sinks. Reenable the quirk after a hotplug event and after
resuming from a power state without hotplug support, until the
subsequent EDID based detection.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c      | 11 +++++++++--
 drivers/gpu/drm/i915/display/intel_dp_aux.c  |  2 ++
 drivers/gpu/drm/i915/display/intel_hotplug.c | 10 ++++++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 208a953b04a2f..d65a18fc1aeb9 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5747,6 +5747,11 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
 	/* Below we depend on display info having been updated */
 	drm_edid_connector_update(&connector->base, drm_edid);
 
+	if (!intel_dp_is_edp(intel_dp))
+		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux,
+					    drm_edid_has_quirk(&connector->base,
+							       DRM_EDID_QUIRK_DP_DPCD_PROBE));
+
 	vrr_capable = intel_vrr_is_capable(connector);
 	drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] VRR capable: %s\n",
 		    connector->base.base.id, connector->base.name, str_yes_no(vrr_capable));
@@ -5881,6 +5886,7 @@ intel_dp_detect(struct drm_connector *_connector,
 	intel_dp_print_rates(intel_dp);
 
 	if (intel_dp->is_mst) {
+		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, false);
 		/*
 		 * If we are in MST mode then this connector
 		 * won't appear connected or have anything
@@ -6321,10 +6327,11 @@ intel_dp_hpd_pulse(struct intel_digital_port *dig_port, bool long_hpd)
 	 * complete the DP tunnel BW request for the latter connector/encoder
 	 * waiting for this encoder's DPRX read, perform a dummy read here.
 	 */
-	if (long_hpd)
+	if (long_hpd) {
+		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, true);
+
 		intel_dp_read_dprx_caps(intel_dp, dpcd);
 
-	if (long_hpd) {
 		intel_dp->reset_link_params = true;
 		intel_dp_invalidate_source_oui(intel_dp);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index bf8e8e0cc19c9..410252ba6fd16 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -835,6 +835,8 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
 
 	intel_dp->aux.transfer = intel_dp_aux_transfer;
 	cpu_latency_qos_add_request(&intel_dp->pm_qos, PM_QOS_DEFAULT_VALUE);
+
+	drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, !intel_dp_is_edp(intel_dp));
 }
 
 static enum aux_ch default_aux_ch(struct intel_encoder *encoder)
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 74fe398663d63..1093c6c3714c0 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -33,6 +33,7 @@
 #include "intel_display_core.h"
 #include "intel_display_rpm.h"
 #include "intel_display_types.h"
+#include "intel_dp.h"
 #include "intel_hdcp.h"
 #include "intel_hotplug.h"
 #include "intel_hotplug_irq.h"
@@ -906,9 +907,18 @@ void intel_hpd_poll_enable(struct intel_display *display)
  */
 void intel_hpd_poll_disable(struct intel_display *display)
 {
+	struct intel_encoder *encoder;
+
 	if (!HAS_DISPLAY(display))
 		return;
 
+	for_each_intel_dp(display->drm, encoder) {
+		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
+
+		if (!intel_dp_is_edp(intel_dp))
+			drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, true);
+	}
+
 	WRITE_ONCE(display->hotplug.poll_enabled, false);
 
 	spin_lock_irq(&display->irq.lock);
-- 
2.44.2

