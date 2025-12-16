Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC2CCC06A6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 02:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A7F10E61A;
	Tue, 16 Dec 2025 01:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XjHsRkQF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42F010E5FF;
 Tue, 16 Dec 2025 01:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765847184; x=1797383184;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KiHMsrJmBnFLqxhCndJNCQjiAhjRMQqvkOeASD6eY58=;
 b=XjHsRkQFB0oN8VGAMBxtjD8ZqwrpSiZgt/l3GIlMihltJq6vo+sMgPFW
 TZ4LA13BdVYVESFCZNNb5qx9UTmGv8iPjiQHEgDBDCWHGX4SZc2lSBIUN
 GHloariZ934uD+WEU7MuEpAC49RVTsgj4TxwrB1+Hjvx7+l9NWu09gjNq
 lsE0TrbRH5BY6Yuh6CRJ0ZqJT3R85e+FE1u/alP6C8uFP9P8ThOsC7pIR
 W44Z8sJR51I9GF/7F2ptZhjNWBl/AFxVYn9UEdJUM+gpayL0Z9ZsZvybL
 rbUFiQwP3z66j8UR/GZemEuYXr1kLKapS/6BhwwNsL4zNdfjQqijYRlvf A==;
X-CSE-ConnectionGUID: 3sSdLeobSpCd4siPzJaqhw==
X-CSE-MsgGUID: CS4TLFfTSG+E6DgMNWRPkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="71614538"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="71614538"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 17:06:24 -0800
X-CSE-ConnectionGUID: 0zTi0c92Te+FC064vNgQwg==
X-CSE-MsgGUID: HSXRH44+S3Cu8ZQFL2QuBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="198363102"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 17:06:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 17:06:22 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 15 Dec 2025 17:06:22 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 15 Dec 2025 17:06:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xtc4mvkC+T/Z+sZ/y5ZXHVuMUOqGdOgrm0+9uWph/xaNTSH4WfCwV5IQ7sKDTI1WEwtbc++A4mLJBhWLStD5FG23WXB+ku2dM8AwUwq6pDVGohzzCGDSlY/WTChBau6JXzFz91kh6HA0M123FiHu5F13p6aPnevt3Gnp+CouzQRGMkNVVpLko24Kf7mKvy8hHSSERuwauG+wybnkemJ0Q+TQFTCFDgF9jUufUfWnv4jVrYco8YR6PBGbdLPWH7YsSAZAvCuzFCCznnMBzkdZR0foeX8HpEuoa3cnokZt4eNfzW8+VOsrK/FBcxxCcGeox3ktY9ORpdbdnNcAOxAAsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGEgDjs2EMXr4E9gjCGbrn9xdMGxO3Gcq6ojGZdNjEc=;
 b=NxMY5Pf/7NJgSDmDm0jx0ScEaSzNvVdeVOacoDFxuJ+pvwXM3+5sYOIKYKd0VVPpkmwnagrVRn3UGOcf74Qe5HqPqSmOcJ8yePtPPWP87wZ4/ff465HXtlWXow0WcBkDkZMXtAAWxt+mnCgOZqnbubnt3N917n/GbLG2W5258L89FJIn3N0ON6p5qdsWNHMco4C2Fp68ZAEZizOr57Fi865pmAbUWAPRNUsZLnDtj9eqbsgDLcrNCK9Qi7DPsQGJZtniZ9SuMhaWpCMexV/wQ/chH+9R+vTYsBvY5nRFH9sjBe1TOQA86gD+SyI21Cj67l/z5QHsoMch7wUe7mWLkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9033.namprd11.prod.outlook.com (2603:10b6:208:566::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 01:06:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 01:06:20 +0000
Date: Mon, 15 Dec 2025 17:06:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v4 20/22] drm/xe: Use drm_gpusvm_scan_mm()
Message-ID: <aUCwiXI1uUNNf9Rj@lstrano-desk.jf.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
 <20251211165909.219710-21-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251211165909.219710-21-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0270.namprd04.prod.outlook.com
 (2603:10b6:303:88::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9033:EE_
X-MS-Office365-Filtering-Correlation-Id: 932101e6-bffd-48c9-b9cf-08de3c3f528f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHR2azkydVIybE1yK1RGdHM3QzBGaTY3c0s3SXV1RTQ2VUpQOFlmK2hmUHNw?=
 =?utf-8?B?NEVLeE95d1l4NXZLNHZDMU9QN3ZFcmdJb1YrTXQ0dGhGNEVHWTl4MXpOUFJX?=
 =?utf-8?B?VHgrRmRUeFdVUkFnSmhUYTB6Y0pHZlBGRGJsRERvbFVpQVlGUjIyUmpSc2tL?=
 =?utf-8?B?OTFuNVBsMTdNZ0pGUEozaGROZ0R1c2ZubFVIdEFJWVU0QlVnK0VORUdvWlhS?=
 =?utf-8?B?U0VUTUtkZ2RMTXlUYUYzVWNlRkRJSHNQakhabTFyMjJhOWo5WmNTRWZVZVJu?=
 =?utf-8?B?eFlVaW81S08vWXlYT2RsWGJqZUdKRFZnZ1UrY3hxTHBib2c3RDQwMm5KdFJI?=
 =?utf-8?B?LzA3QktJZmppY1FObE5QcFRHOFdaaXZ6Q1VyQmJKa2pSZmtJclhOVzJlK0U4?=
 =?utf-8?B?QllIb2J1M1kzeWpGTExmbmZiUVJVdDAyMGd3VjBKVGgvV3k0T0daVmdLQWRD?=
 =?utf-8?B?emtxK2p5bUNGOUZab1l6NU5pbGhYc3JYaFJvdTQ3RzAwYVVabUhVcTE4TTVz?=
 =?utf-8?B?andSai9STTRSTUdreVJwTldKZUY0d2RjVFluWDQ3VjhHNjByOTFiUm1RSHU4?=
 =?utf-8?B?RWNHckVDQ1pWZkxTVFgvdUlCb21tOWk5bXhIUmc2SWxrcVMzZDNzbElRelpu?=
 =?utf-8?B?c211VnB6dVNmUUJqbXQzM1d3TzhRbUNleVo5Umprd041ZTlwREcxcUlXSkhC?=
 =?utf-8?B?Ni9DNVJ1T09oYkVnYmVtM1JvZUJFbUpNazBsMDh1Q0RhUlVNeDlyaU5VMGp2?=
 =?utf-8?B?OENXSWViT0ZlK1JBcUJQeERKVEtYaEtaQlhxdTVLc1l3bGRUdzZITXJMR2U5?=
 =?utf-8?B?ZnloZ0RKelFZTVRoSjBKM3NBTlFMa0tzRkVSb3g5WXJnNkdnb3k2NmdVM3Rk?=
 =?utf-8?B?UFI2eEFtaFJHUG4wUnBYWmErQ2puUlE0TWJPRHdiN0Q5QUdENEViNUxXU2Y1?=
 =?utf-8?B?T2xXb3VVbjU1aTV0alg5L0U5ZXluM3oxK2FiSW9JQVJvMmFqdDRsTklDV2Js?=
 =?utf-8?B?QlBodGV3WmQ2OTcyZGhrTGt5TGwzVi9hWnVMN2dtbWhPNE1MSzZWdmVIM0ZJ?=
 =?utf-8?B?dVZSKzJUS290VHQvUElkTnFwV3ZoY3drUWZjUWt6dlBLWXpzdjFOb1VSd0lS?=
 =?utf-8?B?VDR3Z3YyeGlvZnFGVm1NcWtSdlZtTnlCd1UxK3FITWt5eHpCeFlsc3YrMEFl?=
 =?utf-8?B?Z0k5TlJQNTRacWFpM21laGxZT3M4R3NCOGczcEtxNTdCYmFyS0NLRTBlY0lt?=
 =?utf-8?B?dm1FMmRidFo3RXk1Zlp2QVBxZlBFOHRYR2doL0FLUVFLQ3JKY0FsdEJFeWlu?=
 =?utf-8?B?M2VqUVhRUzlPTnZwTFMyRC8wZytYQjJnVm9zZFZ3MXNzejdmOWR0d1VwOGxu?=
 =?utf-8?B?ekpsRGorK1FhZUxsdlVwK3Y4Tmwwb1VQSzN4ZjRiUTFObmlDclk0Q0RrbDR6?=
 =?utf-8?B?SGs4MzVvaWw1VU8xekRkRkZEUDdnenJsaU1aeWNBOFJ5VHozWlc3K3EzR0ZE?=
 =?utf-8?B?QkkwZ2NXYWVaTm5DQVFtY0VBWGpUMWJya3ZaZE8rM2w1UXJLVkMxTXppMzAw?=
 =?utf-8?B?MzlTaDVoTFRFREp2RXN4c3JSR0g2dHp6bUliU3UvZDVVaDFTSWZTZXNjdExp?=
 =?utf-8?B?K0x2MFpKeURzZ3IrS21VYzM1L051QTN0NEJOekhxWkNUSmpIVDk5S1pzU2I2?=
 =?utf-8?B?aVNUbDl0NVVyTlNPUGVHQW5PZ3FHckpCd1pycis2SGtsTkVKc3pXTjhWTFpC?=
 =?utf-8?B?SGhwNU8yNEdhcVd6bnhEM2U3MjgzeEI2QjQ0TjBuWGhDZ2FxWUcxYWFGV1Fw?=
 =?utf-8?B?Z2loVEVxdUUreFRpL29Bc3paQytLMEk4M0ZWaWdrSWJKNTc3bEhBZmp0eWln?=
 =?utf-8?B?M2l0V3RvUndlb293Rko3MHMrcWJyMXBQdXpSV083QnFHS0VXWU5VSHZLaVVS?=
 =?utf-8?Q?8Ld9IGn1cipCM6ZWDOZa528gHXSA+dnk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFRVSTdaVTZNd2w4S0g5M0FrVmE1SGEvbC9jS1hNelFuS1NtenhrQ2JGa2pH?=
 =?utf-8?B?NFZweUJxQndWdm1hRFpIZUNLWUh1UmJaUjNYaE5LUzRVdi9FZ3hUTjgrL0Jt?=
 =?utf-8?B?QUIwT05HMGpCeExubEs0N1pYYTQrRkRXd2pwZHJYcUpxNEFldXVXVi94TGRU?=
 =?utf-8?B?TGlFZnluTC91aXBxSis5OW1aOWp0anowbjR3Z1FPbXVvcDVVbXI3RFZXSTd2?=
 =?utf-8?B?OTZyOFdZY0x6dnd3dXJ6SUFLYTFLWms5M0dCbnZXTmQ3ZnpGT1JrbGpHTDE4?=
 =?utf-8?B?cXhQYXlMa1FQQ2tPSFh4QXlZVDZBeVlFT0xVaHorNC9BdHRqV3p6dFFPTEpB?=
 =?utf-8?B?dzBGa2x4RFdZN3MyLzMxaEM5ZFNic0pzN0xNTGZ5ZU0rQ0t3Rm1IV1plUTNs?=
 =?utf-8?B?S3puTFZOdHE3ckpkZ0cwRHRkR1BUeGh1SUs5Q200RFRyZ1o4UndiemhJNHFu?=
 =?utf-8?B?VHBiMWVYOTJuYWNGQkdRSy9sVlZhRksyKzRaanFCbDhFTGJabnc1bHNoRmlr?=
 =?utf-8?B?S2pZQjFkYnE1ZHo5dzJ5NmpobDVobW9ucUhrVmE0bVpJa1hBZ0cyWWJ5eC9r?=
 =?utf-8?B?cFg3Y3YrcW9jL09wRmtDNHVwYjQvdHNRb1pON24xRFhUeGJac1pmRGwxNWRL?=
 =?utf-8?B?NW5pcHc4TWhTRXBwZC9RSlU1YjRBRnZ0VllMYmI5YlRyNGFYNUhxckFOZ3lP?=
 =?utf-8?B?Mk1na2h4bC8wWGcyRjFnZ0dvTkErTTNGNmVRd3E2Nkw5NXE2WlBIMk00T0FY?=
 =?utf-8?B?TEkrVEE2ZS9GTDNqVlBPbSt0eDFndWhEdmFwNWtvekEzNFBKNEVsQ0R2eDUr?=
 =?utf-8?B?bFBacUUzb0ZxWURhb0EyakVQS0dBMFRlcTZycVpKNjVjbkxUR1dEVmZzZ2Rw?=
 =?utf-8?B?allzUUgrM3EzZGVaS0pOKzZTS3N1V0VrTDN3SFZqcGYxOGlJMUhrWi9EV1Z0?=
 =?utf-8?B?RVpyOWhKUkRLR1VEUk1sQkZXNTYwOHBsOHhVdzBXK3UxY3J2QWttalI3RVdx?=
 =?utf-8?B?d0tWOUh2Yy9KSWpHdHR5b2dOcVNqVGdCL2VCNFdLc3YxZzgvTFZsckNkb0pk?=
 =?utf-8?B?b0I3Ymd0N1lBa2h6ckdIMzNPTWcwUVRIOWdBWlFBZlg1TlJwQWlIVlVkZFRi?=
 =?utf-8?B?ejRPMkQ2RWZIc1ZJOXdBYmdnd2lsMUdRYU0yYmE5SFB1dVFmVzJWZTErQVdS?=
 =?utf-8?B?dUFIRkpwL2ZSa2VjV25QejIwWmtIQVY2OVplTmU5ZzNQLzRYNWEzUDgzL2d3?=
 =?utf-8?B?T2FjTTQreVlRUFM1dlhjZUFEK3FpT3RPMk5TN25NSEZXeVV0Rk1MSjFENGpw?=
 =?utf-8?B?OU0rWUpRbXdPc1g0RCtFMXhhMW80aVZYM1ZpWFF4a0dodUo1Wlk4OVZpSm9N?=
 =?utf-8?B?d1V4cEZ6Nnh1K3FHTTRJQTRMMGpSY2ZBQXBiczhnMU5DVEtXdmhmWFY4ZG81?=
 =?utf-8?B?ZGpwQkd3WXpPUGUxbWJ3K3BNQXlIWE16YkR6VWZ1ZXllZUVrZitiaFIzVVY5?=
 =?utf-8?B?cE9sbUthWmdJYWNDRzl2OE9yTkM5Sm5tK2VBQldieFcwcXY2aEpSNk4xNTgw?=
 =?utf-8?B?M2tIRUkveHRoTXcwanBGbVRKTStta3d5RG5UNlZmbVJPaG9rdStNQWxQUEVx?=
 =?utf-8?B?cE02YTdvdkNEdkx6LzhRU0dUTTJpdjRGQzdKMlhJamFOd3RvS3lTN1Y5djUw?=
 =?utf-8?B?WTh6cHFoYUdTRGNVK1ovOWlUTEc5Y1VwcERXV3BaRGVjTFZPMUZBVFhJUzlM?=
 =?utf-8?B?L3lsVTAxWk1XOFVOSGJHTXpyN1QyK05uUE93d2pLT2JCVjJzb3RyZFJHS09P?=
 =?utf-8?B?N0pQUC9KdE5ndnA2N3Q0U1RQRW9Fd1loNlpVNkoyc0c4UG5hSjJlVnB4cWFa?=
 =?utf-8?B?UllCcW16YjB2SmNGR1duQWE0c2VBMGlZS0F0RFNNLzg0V084MWpuRjlXcHFp?=
 =?utf-8?B?Nm9aeWZUSXFrZ1djOEtHWlZabHo3QnNwdWRPM3pGb0ZLb0g0UEh6THhlUldB?=
 =?utf-8?B?TWdCb2xOWVVXTGE4TnViU0cveENJVXNGd1N1MGI5b0cyTnR2WkJKbDBkYlRu?=
 =?utf-8?B?ZHVDWG1XM2UxbHhvbFRZWW9UdVJxQUp2WGpuRE5wai9Fdi9KWHFsYVZScThw?=
 =?utf-8?B?aFVZVzk3eWxTRHVVR2dFV3o1ZmgxOGU5L2RTWWVVbWdzQU42V1hwWEQ3TjVW?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 932101e6-bffd-48c9-b9cf-08de3c3f528f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 01:06:20.0163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnPQnpWJy8cxGBL1p9eBnu+hfJZMbWHGSB+fL1QizxJWJf70WxcnL4bDic6y0XEtDRDWysUaDkZQBEUHU4QYXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9033
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

On Thu, Dec 11, 2025 at 05:59:07PM +0100, Thomas Hellström wrote:
> Use drm_gpusvm_scan_mm() to avoid unnecessarily calling into
> drm_pagemap_populate_mm();
> 
> v3:
> - New patch.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 2fa73143fcd5..22281d69e26a 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1625,11 +1625,23 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *ctx,
>  		      struct drm_pagemap *dpagemap)
>  {
> -	struct xe_device *xe = range_to_vm(&range->base)->xe;
> +	struct xe_vm *vm = range_to_vm(&range->base);
> +	enum drm_gpusvm_scan_result migration_state;
> +	struct xe_device *xe = vm->xe;
>  
>  	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
>  	range_debug(range, "ALLOCATE VRAM");
>  
> +	migration_state = drm_gpusvm_scan_mm(&range->base,
> +					     xe_svm_private_page_owner(vm, false),
> +					     dpagemap->pagemap);
> +
> +	if (migration_state == DRM_GPUSVM_SCAN_EQUAL) {
> +		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
> +			drm_dbg(dpagemap->drm, "Already migrated!\n");
> +		return 0;

LGTM, but I suggest adding something like CONFIG_DRM_XE_DEBUG_VM to the
SVM code in a follow-up. We get spammed a ton just running
xe_exec_system_allocator, with a reasonable DRM printk debug value.
IMO, it’s best to hide most of the debug in this function behind a
Kconfig. CONFIG_DRM_XE_DEBUG_VM would also select the SVM level debug.

Anyways:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +	}
> +
>  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
>  		drm_dbg(&xe->drm, "Request migration to device memory on \"%s\".\n",
>  			dpagemap->drm->unique);
> -- 
> 2.51.1
> 
