Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2514BB9F144
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 14:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5298910E8F2;
	Thu, 25 Sep 2025 12:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A6PVC40c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B000C10E8F0;
 Thu, 25 Sep 2025 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758801909; x=1790337909;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uFhYJmnYfID7w0WRJ2pUBNKM4iziKmGyKKz6L0Er4Is=;
 b=A6PVC40cUfAU+Qb1OfqvAfCjShkGJsoqwI+03LDLGHa7d712zuSaEjme
 3LIk0F4B63UUxmewIdNsPQVH7Bp6Z4pfod3mngQWKlsR7P9JkwREF0LtN
 cF6AwNd17MR4Ryx6aN17iDRX+Cl6XPHkbnnOm1Nl4zAKXmCSaX0jEd6kf
 FDoSmBTpel66UlvkPsAGiFwILjRqfxvcrQTsabvDUQN8FEwNW7rK4J7ix
 9f0b1I41Y515Qfhu4SLMS08bQhRjSu5vede0d8R93+RxExdV8xzrDn04y
 AR/id2byBBfJfzmjRS4kf46uFt0gXb7TSa+IIMJ53dNS8l7B76SaIJnpK Q==;
X-CSE-ConnectionGUID: Sz1fN3p6TdijQ0JfaIyy6w==
X-CSE-MsgGUID: zTz+PnGUSzutkXa6Gfz0Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="78756857"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="78756857"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:05:09 -0700
X-CSE-ConnectionGUID: TtkYlerESJGqkTtcrs/m7Q==
X-CSE-MsgGUID: Xas6eQ2nRrubADPHVSpdpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="208248680"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 05:05:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 05:05:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 05:05:03 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 05:05:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkCItPuwvdUIB9Shj6oOh+wF3vd0sQoj2kSYor+ltErjgYberAK+6PDqb77sjzzAQOOFVN/4Q1V3CRlXXMr4oSwIsFn/OUunoqwnaYfJmD7hikXlU1JFexQe9+QXMEUTKefhjcauAZaiwQNR5jiRmuFMkO19BJ3mxcCSEirUXKvY15Pzzlvq5sXOlH4b4gbLqHXk7/kGFxSy8IFaeL2sbjNC/JJ52PlvLAgSZdPg36YS8i3rMh39s4M/wTLECPNp7yGw999jaz/hlR4hTG6jiwzAi8xaIE2y3pIUxRzeTREfIcAJnPiL+qfdtV2pogqynlrWi+ERCmfI0aLmi/gV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ICR0EcIazOXP4u8Q1vpN4icvWs5zaOyPBOlAIckHKM=;
 b=rxiFf7zYM53q/x4CX64YbQByKxEnqmXT3yUSkkzzDOgVECmbk9lSrAQpn0HiW8Xh6YD4hgTwBy51Y6d0iiqtBqSKY1TqxbZittUyKuRI0bUq6s83wnyH9xYOfJldzAe3c52fgeVDBojvs3uHy/0v74kpwjKk7aamxyTRPVDKLaNB9Fp5tHvORYVAXlCfUL9AGc2LfEIANv6ZW9KaOceXi3ryBzfLfKNp8IgJXRSwvzz135qhN0ZxayM/VBfH+o8Dfdo00UbUgyvHhd1+Ue6+QqhripRB/axBMT1tC59UGH5ttX+LOB4qh15MwxyCn8Ub3CgIIeaRxw17kLvxmDTcxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM4PR11MB6094.namprd11.prod.outlook.com (2603:10b6:8:ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 12:04:59 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9160.010; Thu, 25 Sep 2025
 12:04:59 +0000
Message-ID: <19cadb88-1b80-444e-a062-54f3f42c856d@intel.com>
Date: Thu, 25 Sep 2025 17:34:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next][V2] drm/xe/xe_late_bind_fw: Fix missing
 initialization of variable offset
To: Colin Ian King <colin.i.king@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250924102208.9216-1-colin.i.king@gmail.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250924102208.9216-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM4PR11MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a685f9-c35f-42e8-1b7f-08ddfc2bbff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEZTRFBwSWRPd1J5eFE0a21SdmFZZFRPcmlaTmNHL25UU3haQU5MNEMwRGl0?=
 =?utf-8?B?M2YzVERHZFdRMjJ6eE5icGJoSjNxUHdJTmgxV2R4UURMR085ZklyZCtGcERD?=
 =?utf-8?B?MXVWdldzbFNENWNMdzliYlRGc1hYc3JQM0VhT1lqVUFoeWQ2LysvQU5uOWgw?=
 =?utf-8?B?aWY4cjBTbm8xSGRTRmszbTVvSXViR3p0RWMyV0E2SVBhOEtjM1pzZktzQ3Fl?=
 =?utf-8?B?L1FIWUplc0J1WndTNFFKaFBxQmxYWk9zdk9tS0lXQUFRWE81SlNxQWVxbVlC?=
 =?utf-8?B?NldOL3JJV3ZGdGN4TTFTd3RyTlJhZGpiWDF0TU8wd0JnTzJ0UGI0R3IwMHRH?=
 =?utf-8?B?bTBVTXJJZVlLUDV3Nkg5WWRvWTBZTVRaYXU5OXptaHBJbWY3T2pMaktVRmlI?=
 =?utf-8?B?aGFtNklVYVhxN1FqdWlkUE9tb0hYaVl6ajJpOG1HdUYzNTEvcjBOSm16T3BM?=
 =?utf-8?B?NkFCSVZCdjBTMmZwTkhMek15a1lrZlJ3UEZ2N0pRdUQ3c2s4ejJHbTJQL0tt?=
 =?utf-8?B?NkgxSGdta2hTaW5zMysrK0gzbkhGckNoVy9GZUlHTXRyUDFDRFU5M2F2VEFx?=
 =?utf-8?B?OEI1L1hHSExrSnhVcEpTN2xSWUFIUGlBbmtEZXp6bzRWZDR5TUZmd3BZOXdn?=
 =?utf-8?B?NzhlaDI2MFVIU2JEUXVWOG9UYUp5azRzdjNObkJhNXFhUVp5b0ZpaW53Qjda?=
 =?utf-8?B?VTZBYVIxZU1uOU1ONE9ZaDBaSi9JeUlQbWNwOThrWmFQTityQlRmZmVyQzU3?=
 =?utf-8?B?MjRJejRXVmFobDQrcGhiMWltcWF6TllhUHNvc1JOQ2loZnhKcmNSQVJtVnJF?=
 =?utf-8?B?M1IzTk81VGZ4Q1JVZXhBTHh1K0VDSENpbXJjbUFvRWhuRVNwRUcya2wrSTNQ?=
 =?utf-8?B?SGs2MlVnamgyVzVNaFFWWmRlNS9FbE01ZVRwZHF1UzllalVxTGhMS3BvWkR6?=
 =?utf-8?B?YVNia0lsUTNYNUgrQm9VSzFjSEhmbkswMEwxRk9sUzF3ZWtxMi9SL2QxdStt?=
 =?utf-8?B?S0dNWklsV0U2RFQrVjFQSHNYdEpFZmgzdWxYcjhLQ2FJRjlPRm55cVhLdTVo?=
 =?utf-8?B?VmtSQU4yOGdZVXhOMjc4TStIZWFqZkR5VzFUN0JuSWVONE5QdW13R0d0anN6?=
 =?utf-8?B?QkdSeHA3QUpQQzlMZWlXbnlhbVZDbXVxKzBuNENzY29aOC82am8zRVlkcG1Z?=
 =?utf-8?B?dVhmd0hpd01nR2o5OS83R2R2MEhIM0xHSVRvY3QzVzgyRno4SnlINGk5T3BU?=
 =?utf-8?B?MWx1enhyZEY0cXo3bkdQdzZGNDdVdGlKT0RJckoyVzFzdEVaMWhsRTJBMFhH?=
 =?utf-8?B?U3ZXWk4rUlZTK3ZCeVVEYkdKbGJ0TXBnV2pBYXMrVTRXb0JsZi9JN1dPdlNT?=
 =?utf-8?B?RmhMc2FSZWRlbDJhQ09ZNUM2SkFVMWR3OHIxL2poc3liZ2d5ejJHMDJzZ3JR?=
 =?utf-8?B?azhScWU1ZCtvL1NrRjFvTUprTC9sWG52ODIvbmYzTjVXMnJlV202T2VUV0ph?=
 =?utf-8?B?Q0dZdERMWFUzR3p3c3lleVlsTjBaMm96Zml6TGpoaDl4WXlKZ1o1M3NXbklT?=
 =?utf-8?B?dm42dmdyN2ExL2pKc2RRVndaQlAxQmhRMWcyWG13TTNOSWI4dURvNUYrT1pm?=
 =?utf-8?B?MS9nWHNKZ0FuZjVDSUF2ZmNZYUlEMEtqSmN3Z254K1hKSTFkVkQ4eVZUSDc1?=
 =?utf-8?B?YW8zcENUakk5bzBrRk55bkpZQ1E2cjhMNlgzR3RCS2NjOHp1RjdZWExsSGR4?=
 =?utf-8?B?UlJlZnliZkY5Nml6M01JYkRSMU1wc0VFVnN1ay83eXpuSHBtUXd2elFoUVMw?=
 =?utf-8?B?cWNSbVNPT2JzdTc4SUNQQU9GcFVMOE9TU2J0SEpFbUZkY0hyQVdzcHNGbFNp?=
 =?utf-8?B?WmNpRHJVVzhLMWJlOTMzbzlIaUo5b3pYOGlnU1FHeTFQdWo5N3JrYkM5QUNC?=
 =?utf-8?B?a2h1d2FURzNDc3VXTTFDT2RaRDlrdFJhczFxcXJNUWFRcFhaQ21RYkJKdGhp?=
 =?utf-8?B?TTJzUEtjRzVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3ZvRWVibm1FT3dyUWx1d1ZTYXhldVc0OTNFeWRUUS9GK2cvOGpKUG9VQlpo?=
 =?utf-8?B?aTUrWWtnYnBtdDY3SUJCeHlNYnFWQ0crZFBlekQ1dXVvaDJvblJ2dVN0R3l0?=
 =?utf-8?B?RHBCL3lWVzFKMGl2RkkyYkk3QzEzaTBPUzhnalp5WWN6ZDZ1NUV0b0svb29j?=
 =?utf-8?B?MUhITmF1TWFXUXdpZ084Q3pVUWdUUDBieldiWkVSVVN3ODlTVS9yS2c3WUMz?=
 =?utf-8?B?NUFFSVNkc0p2NFQ4cWxqbE80NE9UTW5IWTFRREFUaXFiNURNK2hkU09kTXlN?=
 =?utf-8?B?czByQ3pGdzBraVRxTVBPa2wxQnUyWHQvMjRjejNYSjVyN2E4ZFNnZS9OMWc1?=
 =?utf-8?B?SDh0ZGhnZ3pUbWVMUmxjSVZWczZ3dXZSTmJUT0dKK0gzOStieTh5QjhUcHEw?=
 =?utf-8?B?VWNRekh4YVFOaUlPcVZMZXFLNVhSWnN2YUJMd2t6RnRudFhVbHJLOXFZL1Rs?=
 =?utf-8?B?cmZUdGk4YVNjSTVPSFV5b202TE1vZEFBdzhISERCemk0OHpwWVJzYkVNdi9k?=
 =?utf-8?B?ZHhRa2lwaWtZUnhvczcwRmxMOFVVNGZlOFVGS1dISWhvOEFrUEV1a25CNUdQ?=
 =?utf-8?B?NHlGbjRINUpKYnhnWjlsWXIxS2JxOXRubU9SU2dOWmdGSGhxbWJ4NGZWQWJq?=
 =?utf-8?B?VnJUU0ZWdWgzRWNmTnkxWUN6ZFlxYkZDZEwrTTBneU90MFB2RjNqaDI1RlB4?=
 =?utf-8?B?TWgwNlJkcUFyMk5acjdXSERKRDgzNjdDcitDQzdqeDduVGtjUVJtNnlkWFVw?=
 =?utf-8?B?ZjdMazFsMS9IejkrZGxMdTE1UldFY2JyazVEVzFKR1BuU0hPR2xPUWVDTmp0?=
 =?utf-8?B?UW5oeEdkeExYUVE5ZHBobEpzWlhEdU94WWMxaitOYTNvNlgxNmhtdTIzWTFY?=
 =?utf-8?B?QXNuRHY2eUpqSElUWEIzQnJUOEl6K2JUWE9QU1htV2plTHhtbUhYa210cWtk?=
 =?utf-8?B?OHprcDBxZmcrc1ljeUMvd3dJLzNTWVFPQkFuTUlBZGJQbGxkY0c5UVlsS1Rq?=
 =?utf-8?B?YlJLUlN1TVZkSWMzb0YwL0tqZUtmY3owdHN2MHBubUZ4SVJScTRLS0tUbGhq?=
 =?utf-8?B?RDhTd1B0MzY4UzhDVU5DNXhEM0NYZUowc0docHNrSGNRWm9IS2tKdHlXU0dF?=
 =?utf-8?B?ZVN3dUxPWTNBVkYyeG1ZZVdhczg1L09EejV6MkdLVEpXYUYwaXNzdmhTeTkw?=
 =?utf-8?B?ZG1aY0R1RDdKR1ZpbVN1aHFxRG9Na0U2QW9TeGwwRzhFZTRNeUEvQkFORkdv?=
 =?utf-8?B?N0tFZ2g5T2ZucTRTVzIxVDBlaVg5RnhVSUJGZWd6dHpZWURibW9DbU9QY3Vy?=
 =?utf-8?B?MWlMUmFtTlhobnBGN2ZzMWl3RWpaVGtjN0ZNSllBakVoTXRBQnZENmxaV0ZX?=
 =?utf-8?B?VEpKMkg1NzF2Q2dSMGVxWUdJWVRRV3A4WnZLL3J0OG9aTXpxOXhPTFRtenJN?=
 =?utf-8?B?VWtrODV5TmZzQ3JzLzN1T0F2N0hKZGRKSUt5YjM3a3B1NGppcHFoMEw1bE0v?=
 =?utf-8?B?bXdlSC9YeDM4WXRIeXNLL3ZNUzY5TE1uUzBwTGhNa0Z0VUhzMXVpanNhMS9h?=
 =?utf-8?B?eFNZdnBMK1BYYk5kY2FReHVHWGI3ajU5V01sNTFmcFpMSXl1clVTcExDNHI1?=
 =?utf-8?B?SnJkQUdtYjI5REdaNi9xMVBBZVJBMW5OR3IwdittS2xiakQrWmVxVUczT0h5?=
 =?utf-8?B?OWJEWUFtWHNkSUFKZWVlY0F3bXcrS2JnSGc3b1N4bWd1b3lsVDYzKzBtMEFV?=
 =?utf-8?B?MncrNFBSV3JYdmpWRDk4VG9Wc2hxOUtvSzJHSUdyYUFJZWZCTDJrMDZ0U3p0?=
 =?utf-8?B?VzZCZnRnUnQxK2Ixb2x5aVRoVi9wdCtFTGNEVlp3MWJBQ1FZZkdlYjlUU3Yr?=
 =?utf-8?B?SHpTM3pDTGtKWWJXenZza2YvK2g2UTlVaGozbldPNVJrWG80OHVCdVRaV0hi?=
 =?utf-8?B?WmszSUN6Z0UxckFCT3dVUnlXWjAzMWlmS2I5VENhU2JyTzNYMjZsTkNyRm9Z?=
 =?utf-8?B?R09janExTnBQdldBNm9zZVZMTW9LT3BtUTBWcnNBYVROR2haNEJYOXRzeXdT?=
 =?utf-8?B?Zzg1bmNuZWhhamhnQzZaYit4M2hLWFhmYUNlOTFnUG80NmUxRlBUS1NFbUZt?=
 =?utf-8?Q?V+JJUltm6Q5TWdC+OlIHJwDoc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a685f9-c35f-42e8-1b7f-08ddfc2bbff0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 12:04:59.6631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPE9mlFgwR2nlJqZEtEImykOcYwgIiGFbUgzZ4JDVD9SsyEHcAqpyxjEgMHnWP8kIZItSqEeUNM8bbwewh3cNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6094
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


On 24-09-2025 15:52, Colin Ian King wrote:
> The variable offset is not being initialized, and it is only set inside
> a for-loop if entry->name is the same as manifest_entry. In the case
> where it is not initialized a non-zero check on offset is potentialy checking
> a bogus uninitalized value. Fix this by initializing offset to zero.
>
> Fixes: efa29317a553 ("drm/xe/xe_late_bind_fw: Extract and print version info")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>
> V2: Fix identical issue in parse_lb_layout that I ommitted in the first
> patch
>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 38f3feb2aecd..8f5082e689dc 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -60,7 +60,7 @@ static int parse_cpd_header(struct xe_late_bind_fw *lb_fw,
>   	const struct gsc_manifest_header *manifest;
>   	const struct gsc_cpd_entry *entry;
>   	size_t min_size = sizeof(*header);
> -	u32 offset;
> +	u32 offset = 0;
>   	int i;
>   
>   	/* manifest_entry is mandatory */
> @@ -116,7 +116,7 @@ static int parse_lb_layout(struct xe_late_bind_fw *lb_fw,
>   	const struct csc_fpt_header *header = data;
>   	const struct csc_fpt_entry *entry;
>   	size_t min_size = sizeof(*header);
> -	u32 offset;
> +	u32 offset = 0;
>   	int i;
>   
>   	/* fpt_entry is mandatory */
