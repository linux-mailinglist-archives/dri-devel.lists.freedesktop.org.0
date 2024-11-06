Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD3E9BF3CE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 17:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9424A10E1F7;
	Wed,  6 Nov 2024 16:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMID5IRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1AB10E196;
 Wed,  6 Nov 2024 16:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730912385; x=1762448385;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YzDy+AbWqR4X8C/lwv8uqqOg6zEaFQ2f8LlgsPm3Gp8=;
 b=PMID5IRzWaTlYd6ReC9G3ZzwN9N2/mQrE1h/zvbmT30bOKab3lgV3c2G
 1v6o0BhPqafAM6J2jQXVyKs4DKoZpUHKGPSZUz2arS3vDatHK5EuK7juP
 lSAClVTaST3ahFTRMOCdoYc4WQ17sonApDGh9DDPAZxNO3e6oXk9ZiLSs
 Lk9Do537CZYyAMrTG+qLFsYR44dIM9Sv18eDR283oZjWmUvmcuEdzR4EN
 sbq4+0m3Cb9wPBSA9K07rSmX5QzcI5nzbOLBa6B536hvIFV6uGUxqmFmu
 X7YMQrJi3xVSWvwcyzl2xHxFxZc6VgyDBe7HaRtUCsIZvaRrhcK+ztT7S g==;
X-CSE-ConnectionGUID: tli0Od2bSm+wWvtIbEpR4A==
X-CSE-MsgGUID: rsCwOmgBT6OuHE1477p3Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41819964"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="41819964"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 08:59:44 -0800
X-CSE-ConnectionGUID: MpXbN+TPRya5MaycHzeWRA==
X-CSE-MsgGUID: kAjU2fOmS0aJNMj68Yc9Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84766167"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 08:59:45 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 08:59:44 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 08:59:44 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 08:59:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADno9DK2Z9oM4BdUAtd72YsrsiZJT8cvHGByITIcaz7/BZIayPhTkDTI3BoEQEn6j6BWwyU5LWPDusebukq//T8umEN9nlbJM9ZCr8QV5iEyie9zvYFFD2I/JE2rXkhGotv+R7uj+iTorLph6WykpG4n2+/88El5GT33BwMsAIj8bCzA75Gp1ZTCa9kIJfHGZjD6juB9d0m5jCWOcsqBfghOrsGz2w2gylOq5AJB9ah0Vsz5G9RE6/iri/eA2U6Xs3QS4K+PDs3go1eHgZuYDiLtdT6UPCZQHfmM0o/FwKMxrbweHQcwg65TgdotuLwSHSeexoU16A4m4Qgyd7ouFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaYJGsvJuRp9U1Lv6ouzfZgM/MtWqcmzNjP6Af+zGHs=;
 b=oh8YvMKp0O3/PYhi/e4HC+57TKboCnfya/Js7R+pyxdNXNgiAcBp0+jKQRpq7XDgi4ZCXLenqrZx/piL8F4aEOasCumD6FIHUroPmOmW9+SWynfj5rHPmAIwqEdrYSzLzUelxROduehzoyXkLzXcdHAb89MgVfa/keoSudixHS32s8sHu39GqjGr4ngjgKSw2lW3ghJEwMBUT1L7uagcuk9vl4KZ7njHxZ2xnAfGhWd28HpRDX6D4uyu2Ev206EMD9GwRkafbcejwouw98CIiDnmqffOEQSIEAbNreYd97Wb9r35lPVqPlfg8kqDop72O6EffQ6hYXAjMbgv8GlSuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5278.namprd11.prod.outlook.com (2603:10b6:5:389::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 16:59:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 16:59:39 +0000
Date: Wed, 6 Nov 2024 09:00:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
References: <20241031181048.2948948-3-matthew.brost@intel.com>
 <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com>
 <ZykFrJIx9M204Weg@intel.com>
 <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
 <ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com>
 <c76830ae-c6f9-47a2-8087-32d9f7c3df2c@amd.com>
 <ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com>
 <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com>
 <34d18085-7e23-4632-9287-65eff6651bba@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34d18085-7e23-4632-9287-65eff6651bba@amd.com>
X-ClientProxiedBy: MW4PR04CA0236.namprd04.prod.outlook.com
 (2603:10b6:303:87::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5278:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e2b82d-1edf-4272-8885-08dcfe846671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlpsV1hxTFlnQnZtWU1EL1l4QmhyZS8rK2FhTVRCTnNCcGlnWm02N0pRQTFY?=
 =?utf-8?B?ZW5kRVZ3SEJsbzMxNVlBUk9QL2xoQlB4Y3BQaE1XSFVYQjFOTHlKWlorcEFB?=
 =?utf-8?B?YzRHZ3BKbG54Z2lKZGdPUmlLa003dEFTUEtLclMwbmd3d1ZraXM1ZWVmRnRM?=
 =?utf-8?B?b2lpdUNFSXlqNER5QnNQTThqNkhSeGZqVEhQdEEzRiszeExnVGdIcnlwanhE?=
 =?utf-8?B?N1Z4dUhhMVh6R3J3c3dNUjF2bmswb29wUUkzSXVxRU1QWXpTL05oellvUURP?=
 =?utf-8?B?ZnlrelVQTVlpNjBkbUlzY2N1Z1hlMy9qL1NmZitMcE1aU0pZSXVkVTlES2hH?=
 =?utf-8?B?VGVOVkpCWkEzeDYrb2ZmWSs0eUo3aDRrSnc2VTBlYjk3c1ZYNTU4bDNYakdv?=
 =?utf-8?B?QzNhZG0wbXJ1SzU0TGI5NWRId2Z5ZTRucHNyZnlXT3NSMGQyZ0dhKzVTTVNu?=
 =?utf-8?B?ejJTamZSN0dodjl4TkMzYlVycGpUbXRKOENNQVdaR3J5NzNKZCt4bDZmczNr?=
 =?utf-8?B?UENscDNrYVVTZWlkNkgySW40SjY3dFJZRlJFZHZBNVQ0YXcwaTQ4cHp5VzRw?=
 =?utf-8?B?b2w0cUEva05GK3lYRnlyTEdzSGpUWnRMK3hNeEYxNVZjb2pPUnVPeXRxK3NN?=
 =?utf-8?B?NEwvblFGZ0xKZVU5c1VVanBPTTFrOW4vZWd0c0tVUVY0emd3ZVNQSFpmb2RV?=
 =?utf-8?B?SVJwZkZLMFFBWm9OSFJVSzFFM1F4U0dnaTBFRWFBZ3I2YnEwZnBzU044Q0Nl?=
 =?utf-8?B?MmF1RlJqMnNUc1AzV0ZZdnA3YXk1L1N5d0ptVkl6bE1KdUZBV2tPd3ZqVHI1?=
 =?utf-8?B?dkswV3dGZ3l3a2k4MjFuQms4bEFzNGJyTjJndlBwdDZ6NHJRdDYrMUN3aENr?=
 =?utf-8?B?RWp6SWtSajYwaTh4aGZvN29ZU0hWWWNWUVZNaUFITU5ITWNLck9UUFRhZ2ZW?=
 =?utf-8?B?Q2dQSTV4Q0xkaW9xR1UzTzFjanhFU2RKVG5TbHdXWjE5SE1qY0Y2UWNnS05K?=
 =?utf-8?B?K1BJSmk1dlJhSFBLRzEyRHRpUkd5RnpkTE0xWmlFRTNmRUNlemdoR1Zld0NH?=
 =?utf-8?B?ajNxeXlNRXo4MUpTL3pkblZGcnZHSk1zcWFzdkpMY1U0RFkxV0MxMTZBT0Mx?=
 =?utf-8?B?cmMxNnpIdUR0cURvQnp4S1V2MGFaQVdWUDg0dTBtVVROejJDbHFFakc1dkFW?=
 =?utf-8?B?ZGpqMGlTSzVNNUYxdlpOK0VOdU1UN1hsVytGOXlxTHAzWFNWUXIvUjNzSks0?=
 =?utf-8?B?a1dTc1NPUG5FMkVsR2lxRTZwS2ErNHJzZll4Vmh4NnhwUHFkY2tXQVBUWnRm?=
 =?utf-8?B?a0ZrZVhnOXBlck9URkx6ZWdoTURwUk01bDhqRFhtR1ZLdGVjNVB4ZjZyMXBR?=
 =?utf-8?B?Ump1OWNSS05USEwyL2lQZzFvdnRGbjNVaXduL3lDSHRERWhVbHFzTFVnTm0v?=
 =?utf-8?B?UEF6cGo2WXIyb3RmNnJXN1cyek45Ym8va2NySVZBNGMvM2FiT09jbExPcjBO?=
 =?utf-8?B?NnpxMFpDd2JiQ08vREs1TUNDQzFBYklTTjZVVTdsaXEzUktIYjkveDB4UWlT?=
 =?utf-8?B?VXFQRllJZE80c3EwSUZTTmkzNWdLR2wvMkZ3d2FVMUduT003WXh4eUh1dVFp?=
 =?utf-8?B?NDh1QTVHTnROT2prZ0N3WVdrSERHRm5hMGxYU1JZWlV0Z3BoYXl2MWhiSkdO?=
 =?utf-8?B?RUFJNjlRWGV2VWdWeTRZdjJ1c2g0VktXZTh0Wmtqb3g5N1R1S0FpRHhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjFkczVWZnIyUU1lcS94R3hLOVZvVWFuRGUrMnA2REdjSVg5bFd1QjVuajFX?=
 =?utf-8?B?ZndYcjQ0QkZ1dG1Td2FwL2V2Vm5JK1N4VDI0NGZIWWxXcnRtaDN1ZEZxQVNp?=
 =?utf-8?B?c0FoNDVmSzhwNG9kTXdkZldCMG5Oa3pGVzVwNHlVWEkycThsTHlkSmZtTDZX?=
 =?utf-8?B?azRHRDNVVElhZmx2L3pmSitRVWYrVVUwY3A3MENQRUN5OEl3NzQ1cklFQnB5?=
 =?utf-8?B?OVNLRW83aTRJMVJvdVo4NmNveHdVZS83bmM2ZjFYRURFVC9NZlR2NnRHRnNp?=
 =?utf-8?B?RHQzUlRpVWNPRXRzZWNqZGNmSks1QVpuaDB0WExQSjJ6TzdvaTlydFVjcEdj?=
 =?utf-8?B?Qmd5dm1NSTNiQzgzNjVjbjA2aWpUTWhnYkJwVnpwaUFESlVsODVJd3FLZ2o1?=
 =?utf-8?B?U085Skh6N2o4Tlp2SWw3K0QwOGN4NGVwUFFjLzlCNVdlMVhqOWRLYVBvTHdD?=
 =?utf-8?B?eW13aUVzWmN4SDRvQzFhSlJBaXJpS0Fod3hjY2hqTU4wU0NodmJnMStVaCth?=
 =?utf-8?B?QVRSZDZnUEd5T0U0U0pLdEl6UnJIUnZJUXN2bnpYODlHelQvaU9nN0FGVUhL?=
 =?utf-8?B?TFoyQXlOSlJxeU9UdmJTWkxTTVR0bFo5RVduZ1FwSUJqTXhyVjFBN0ZFNGQ5?=
 =?utf-8?B?U2hTK3ZPbkJORUwzWmhiUVNTQy9nZkVKU2prTFFLNGd0TFNHenBuQmNwbm8v?=
 =?utf-8?B?RGJqVEcvNjFjL3Izd252QlVDeWhpdHhJMjVTK1lOc1J1SFpUVmxhSHIrVmJz?=
 =?utf-8?B?a3owdG1GWEhDc0NrbWplV3pWckk3QTVuQlUwNzd1Y1hjTW5NRTJmSnVFOFFa?=
 =?utf-8?B?Z0pmZ3pjbHgyY1N0M3owbW05R0ZPK09ES3h6RzNsUlRUdlp2ZEhLODZZSmk1?=
 =?utf-8?B?TzhwMm5VeDFCVVpRUDVjcTJ4b2hGcUdkNUZDNGxJMVRkQ1BGa0Y4ZHAyVUgr?=
 =?utf-8?B?d3FYYk91MXpPenk4Rm8zL05mNFJwWmt3N0xTbVFLdUhjUU1PZ1Z2RDNVK1By?=
 =?utf-8?B?S0grVDhBZnluVTFOaFNLbjg3RGthNUVGM3ZiM3R4bkVRVEQyNE1oTmxSemR3?=
 =?utf-8?B?Z3p3SlNjYjRVV1AxWkU1NE4wNzl5UFUzdWl5cG5QcUMyQ2pwMUp0Nlg1RkF0?=
 =?utf-8?B?SURHYVpidUUzZmtnajlXeXNzL2ZNRXZ4V2tPb3ZWVk5PYzlXZTY4VTUxYlRM?=
 =?utf-8?B?bXduTmxKUXZFY2NQeFhkV212K2pnOXRmMVF4bTBacDVKRklqdHludzBpMVd1?=
 =?utf-8?B?Y25vKzZIQUhSRXBzeFFxWkNwNVZHUEZBK283ME5tNTRSZFEzVm5EZWt5MDdG?=
 =?utf-8?B?QWk3NUdtTkRNQVFZQXBHODRPc2tsbHpybUZjcERYRG9Sc1d3SUhTQUJwWHBJ?=
 =?utf-8?B?aU5hWkNpbGd6NUpSdlRyS0hqbEh4SEVqaldFSlYxdDR6bnVDWno5aWUyd3R2?=
 =?utf-8?B?bEtUcW9LdGdUTDFvZnBleDlnT2U3Wk94a1VWUXlUcE9FT3lPek9jRWJ5NXow?=
 =?utf-8?B?ejdLV1hQTkI0b01SNk1tcE9PQlM2MXBCVUR0MFBnK0FRYThEZlZ5a05adzhB?=
 =?utf-8?B?YlNaSGlTVVkvWitZUFVGQWdnei9xV0o5UlIyUVJvK1BVT0N0bmFlc3Z1TTB1?=
 =?utf-8?B?UFd0NEhCT0ZCUkhwMm1FemlLbDN6N2NyN2NLcEpmSEJ5bjBaYTE1WWZqMXhC?=
 =?utf-8?B?T3Z1QlpxOTRTeDhEZXhHTmV6ZFE4VEI2azVQOW1TSUZ6M2x0UW1tUW5Ra2RJ?=
 =?utf-8?B?V1dtY0VkcXlTakNNcUlBUmx5YnhIbHVSeGZzNkhhNWtpNy9haXNEV2g5bllS?=
 =?utf-8?B?QjRrbmhKQlBsR0ZlUExvb0VacHZkMDZ3ejhUZ2JoY0dESFI2anJlalhMUzN6?=
 =?utf-8?B?bWQxN1RpUFp5ellBK1MwMm01U0hMSVBEdFJncG9YREp5OEY0Vk9GVFlxeHdZ?=
 =?utf-8?B?SE5pcXV4eVpTZHQwbWRRWjRhN0ZnWFQwWG1hQlFyeVRad3FxVXBOTDhYVU82?=
 =?utf-8?B?dTlITWdHaVhHczJGUUpYeGJrOGhSWFFNYlFzVlRGYXBHZ24rcndGWGNGRUp5?=
 =?utf-8?B?SXNBcTZYV1RNY2RNOHI4NGVCYVRFZ2pWV20rR2E1MEM1VGQ3ZFhHNXNubUNl?=
 =?utf-8?B?b0k1eEhGb2JYakY1L2YvWkVrZ3VmOER5ZjgzaUtSQ1N4RkluTndUOFhYNEV4?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e2b82d-1edf-4272-8885-08dcfe846671
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 16:59:38.9571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6ETC0wQQLmQwPct/FbNCNQyfcOIYGlR2Ml5nm2oGzZ8C7a7VnWfwLtWakcq9xKPBT8LZWL3ALtVUUZ8ediprw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5278
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

On Wed, Nov 06, 2024 at 04:44:15PM +0100, Christian König wrote:
> Am 06.11.24 um 16:25 schrieb Matthew Brost:
> > [SNIP]
> > > Can you fully describe your use case? In other words what exactly is your
> > > debugger trying to do?
> > See above; I hope I've made this clearer.
> 
> It at least sounds a little bit better.
> 
> > Also, I'm not really an expert on Eudebug, as I haven't been involved in
> > the development aside from reviewing its interaction with the core of
> > Xe. Any further explanation would likely require me to loop in a
> > colleague.
> 
> I think that could help since I don't have a clear picture of your use case.
> 
> 
> > > Well, I think we need to take a step back. The major question is what is
> > > your use case and is that use case valid or causes security concerns.
> > > 
> > > For example userptrs are imported anonymous pages the GPU has a DMA mapping
> > > for. Re-mapping them into an user address space for debugging or even
> > > accessing them through the ptrace interface is strictly forbidden.
> > > 
> > > We already had people trying to do exactly that and it ended not well at
> > > all.
> > > 
> > Again, if we can focus on what this patch is doing—accessing a BO, not a
> > userptr—I think that will help progress here.
> > 
> > To bring things together: "There is a huge push from upstream to avoid
> > using kmap/vmap if possible." How would you suggest accessing a BO then?
> 
> Well that's the whole point: You should *not* access the BO on behalves of
> userspace in a peek/poke like interface.
> 

This is not a generic interface that anyone can freely access. The same
permissions used by ptrace are checked when opening such an interface.
See [1] [2].

[1] https://patchwork.freedesktop.org/patch/617470/?series=136572&rev=2
[2] https://patchwork.freedesktop.org/patch/617471/?series=136572&rev=2

> > kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
> > failing to see the problem with adding a simple helper based on existing
> > code.
> 
> What#s possible and often done is to do kmap/vmap if you need to implement a
> CPU copy for scanout for example or for copying/validating command buffers.
> But that usually requires accessing the whole BO and has separate security
> checks.
> 
> When you want to access only a few bytes of a BO that sounds massively like
> a peek/poke like interface and we have already rejected that more than once.
> There even used to be standardized GEM IOCTLs for that which have been
> removed by now.
> 
> If you need to access BOs which are placed in not CPU accessible memory then
> implement the access callback for ptrace, see amdgpu_ttm_access_memory for
> an example how to do this.
> 

Ptrace access via vm_operations_struct.access → ttm_bo_vm_access.

This series renames ttm_bo_vm_access to ttm_bo_access, with no code changes.

The above function accesses a BO via kmap if it is in SYSTEM / TT,
which is existing code.

This function is only exposed to user space via ptrace permissions.

In this series, we implement a function [3] similar to
amdgpu_ttm_access_memory for the TTM vfunc access_memory. What is
missing is non-visible CPU memory access, similar to
amdgpu_ttm_access_memory_sdma. This will be addressed in a follow-up and
was omitted in this series given its complexity.

So, this looks more or less identical to AMD's ptrace implementation,
but in GPU address space. Again, I fail to see what the problem is here.
What am I missing?

Matt

[3] https://patchwork.freedesktop.org/patch/622520/?series=140200&rev=6

> Regards,
> Christian.
> 
> > 
> > Matt
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > With this, I strongly prefer the code as is.
> > > > 
> > > > Matt
> > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > > Matt
> > > > > > 
> > > > > > > Regards,
> > > > > > > Christian.
> > > > > > > 
> > > > > > > > > Matt
> > > > > > > > > 
> > > > > > > > > > Reported-by: Christoph Manszewski<christoph.manszewski@intel.com>
> > > > > > > > > > Suggested-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>
> > > > > > > > > > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > > > > > > > > > Tested-by: Mika Kuoppala<mika.kuoppala@linux.intel.com>
> > > > > > > > > > Reviewed-by: Matthew Auld<matthew.auld@intel.com>
> > > > > > > > > > ---
> > > > > > > > > >      drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
> > > > > > > > > >      drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
> > > > > > > > > >      include/drm/ttm/ttm_bo.h          |  2 +
> > > > > > > > > >      3 files changed, 89 insertions(+), 64 deletions(-)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > > > > > > index d939925efa81..77e760ea7193 100644
> > > > > > > > > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > > > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > > > > > > @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
> > > > > > > > > >      	return progress;
> > > > > > > > > >      }
> > > > > > > > > > +
> > > > > > > > > > +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
> > > > > > > > > > +			      unsigned long offset,
> > > > > > > > > > +			      void *buf, int len, int write)
> > > > > > > > > > +{
> > > > > > > > > > +	unsigned long page = offset >> PAGE_SHIFT;
> > > > > > > > > > +	unsigned long bytes_left = len;
> > > > > > > > > > +	int ret;
> > > > > > > > > > +
> > > > > > > > > > +	/* Copy a page at a time, that way no extra virtual address
> > > > > > > > > > +	 * mapping is needed
> > > > > > > > > > +	 */
> > > > > > > > > > +	offset -= page << PAGE_SHIFT;
> > > > > > > > > > +	do {
> > > > > > > > > > +		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > > > > > > > > > +		struct ttm_bo_kmap_obj map;
> > > > > > > > > > +		void *ptr;
> > > > > > > > > > +		bool is_iomem;
> > > > > > > > > > +
> > > > > > > > > > +		ret = ttm_bo_kmap(bo, page, 1, &map);
> > > > > > > > > > +		if (ret)
> > > > > > > > > > +			return ret;
> > > > > > > > > > +
> > > > > > > > > > +		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > > > > > > > > > +		WARN_ON_ONCE(is_iomem);
> > > > > > > > > > +		if (write)
> > > > > > > > > > +			memcpy(ptr, buf, bytes);
> > > > > > > > > > +		else
> > > > > > > > > > +			memcpy(buf, ptr, bytes);
> > > > > > > > > > +		ttm_bo_kunmap(&map);
> > > > > > > > > > +
> > > > > > > > > > +		page++;
> > > > > > > > > > +		buf += bytes;
> > > > > > > > > > +		bytes_left -= bytes;
> > > > > > > > > > +		offset = 0;
> > > > > > > > > > +	} while (bytes_left);
> > > > > > > > > > +
> > > > > > > > > > +	return len;
> > > > > > > > > > +}
> > > > > > > > > > +
> > > > > > > > > > +/**
> > > > > > > > > > + * ttm_bo_access - Helper to access a buffer object
> > > > > > > > > > + *
> > > > > > > > > > + * @bo: ttm buffer object
> > > > > > > > > > + * @offset: access offset into buffer object
> > > > > > > > > > + * @buf: pointer to caller memory to read into or write from
> > > > > > > > > > + * @len: length of access
> > > > > > > > > > + * @write: write access
> > > > > > > > > > + *
> > > > > > > > > > + * Utility function to access a buffer object. Useful when buffer object cannot
> > > > > > > > > > + * be easily mapped (non-contiguous, non-visible, etc...).
> > > > > > > > > > + *
> > > > > > > > > > + * Returns:
> > > > > > > > > > + * @len if successful, negative error code on failure.
> > > > > > > > > > + */
> > > > > > > > > > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > > > > > > > > > +		  void *buf, int len, int write)
> > > > > > > > > > +{
> > > > > > > > > > +	int ret;
> > > > > > > > > > +
> > > > > > > > > > +	if (len < 1 || (offset + len) > bo->base.size)
> > > > > > > > > > +		return -EIO;
> > > > > > > > > > +
> > > > > > > > > > +	ret = ttm_bo_reserve(bo, true, false, NULL);
> > > > > > > > > > +	if (ret)
> > > > > > > > > > +		return ret;
> > > > > > > > > > +
> > > > > > > > > > +	switch (bo->resource->mem_type) {
> > > > > > > > > > +	case TTM_PL_SYSTEM:
> > > > > > > > > > +		fallthrough;
> > > > > > > > > > +	case TTM_PL_TT:
> > > > > > > > > > +		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
> > > > > > > > > > +		break;
> > > > > > > > > > +	default:
> > > > > > > > > > +		if (bo->bdev->funcs->access_memory)
> > > > > > > > > > +			ret = bo->bdev->funcs->access_memory
> > > > > > > > > > +				(bo, offset, buf, len, write);
> > > > > > > > > > +		else
> > > > > > > > > > +			ret = -EIO;
> > > > > > > > > > +	}
> > > > > > > > > > +
> > > > > > > > > > +	ttm_bo_unreserve(bo);
> > > > > > > > > > +
> > > > > > > > > > +	return ret;
> > > > > > > > > > +}
> > > > > > > > > > +EXPORT_SYMBOL(ttm_bo_access);
> > > > > > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > > > > > index 2c699ed1963a..20b1e5f78684 100644
> > > > > > > > > > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > > > > > @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
> > > > > > > > > >      }
> > > > > > > > > >      EXPORT_SYMBOL(ttm_bo_vm_close);
> > > > > > > > > > -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
> > > > > > > > > > -				 unsigned long offset,
> > > > > > > > > > -				 uint8_t *buf, int len, int write)
> > > > > > > > > > -{
> > > > > > > > > > -	unsigned long page = offset >> PAGE_SHIFT;
> > > > > > > > > > -	unsigned long bytes_left = len;
> > > > > > > > > > -	int ret;
> > > > > > > > > > -
> > > > > > > > > > -	/* Copy a page at a time, that way no extra virtual address
> > > > > > > > > > -	 * mapping is needed
> > > > > > > > > > -	 */
> > > > > > > > > > -	offset -= page << PAGE_SHIFT;
> > > > > > > > > > -	do {
> > > > > > > > > > -		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
> > > > > > > > > > -		struct ttm_bo_kmap_obj map;
> > > > > > > > > > -		void *ptr;
> > > > > > > > > > -		bool is_iomem;
> > > > > > > > > > -
> > > > > > > > > > -		ret = ttm_bo_kmap(bo, page, 1, &map);
> > > > > > > > > > -		if (ret)
> > > > > > > > > > -			return ret;
> > > > > > > > > > -
> > > > > > > > > > -		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
> > > > > > > > > > -		WARN_ON_ONCE(is_iomem);
> > > > > > > > > > -		if (write)
> > > > > > > > > > -			memcpy(ptr, buf, bytes);
> > > > > > > > > > -		else
> > > > > > > > > > -			memcpy(buf, ptr, bytes);
> > > > > > > > > > -		ttm_bo_kunmap(&map);
> > > > > > > > > > -
> > > > > > > > > > -		page++;
> > > > > > > > > > -		buf += bytes;
> > > > > > > > > > -		bytes_left -= bytes;
> > > > > > > > > > -		offset = 0;
> > > > > > > > > > -	} while (bytes_left);
> > > > > > > > > > -
> > > > > > > > > > -	return len;
> > > > > > > > > > -}
> > > > > > > > > > -
> > > > > > > > > >      int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > > > > > > > > >      		     void *buf, int len, int write)
> > > > > > > > > >      {
> > > > > > > > > > @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > > > > > > > > >      	unsigned long offset = (addr) - vma->vm_start +
> > > > > > > > > >      		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> > > > > > > > > >      		 << PAGE_SHIFT);
> > > > > > > > > > -	int ret;
> > > > > > > > > > -
> > > > > > > > > > -	if (len < 1 || (offset + len) > bo->base.size)
> > > > > > > > > > -		return -EIO;
> > > > > > > > > > -	ret = ttm_bo_reserve(bo, true, false, NULL);
> > > > > > > > > > -	if (ret)
> > > > > > > > > > -		return ret;
> > > > > > > > > > -
> > > > > > > > > > -	switch (bo->resource->mem_type) {
> > > > > > > > > > -	case TTM_PL_SYSTEM:
> > > > > > > > > > -		fallthrough;
> > > > > > > > > > -	case TTM_PL_TT:
> > > > > > > > > > -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
> > > > > > > > > > -		break;
> > > > > > > > > > -	default:
> > > > > > > > > > -		if (bo->bdev->funcs->access_memory)
> > > > > > > > > > -			ret = bo->bdev->funcs->access_memory(
> > > > > > > > > > -				bo, offset, buf, len, write);
> > > > > > > > > > -		else
> > > > > > > > > > -			ret = -EIO;
> > > > > > > > > > -	}
> > > > > > > > > > -
> > > > > > > > > > -	ttm_bo_unreserve(bo);
> > > > > > > > > > -
> > > > > > > > > > -	return ret;
> > > > > > > > > > +	return ttm_bo_access(bo, offset, buf, len, write);
> > > > > > > > > >      }
> > > > > > > > > >      EXPORT_SYMBOL(ttm_bo_vm_access);
> > > > > > > > > > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > > > > > > > > > index 5804408815be..8ea11cd8df39 100644
> > > > > > > > > > --- a/include/drm/ttm/ttm_bo.h
> > > > > > > > > > +++ b/include/drm/ttm/ttm_bo.h
> > > > > > > > > > @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
> > > > > > > > > >      int ttm_bo_evict_first(struct ttm_device *bdev,
> > > > > > > > > >      		       struct ttm_resource_manager *man,
> > > > > > > > > >      		       struct ttm_operation_ctx *ctx);
> > > > > > > > > > +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> > > > > > > > > > +		  void *buf, int len, int write);
> > > > > > > > > >      vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
> > > > > > > > > >      			     struct vm_fault *vmf);
> > > > > > > > > >      vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> > > > > > > > > > -- 
> > > > > > > > > > 2.34.1
> > > > > > > > > > 
