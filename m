Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Xr2hMoaGjmlfCwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 03:03:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F3A13257F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 03:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F46E10E129;
	Fri, 13 Feb 2026 02:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qtWDQ7DK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010043.outbound.protection.outlook.com
 [40.93.198.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD5810E129
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 02:03:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EE65SVDjzIMV+j6wXVATk+2ITBOenVQliWj4jKn85MmXId7hyT4D3jX19q/IbdUV//01pCJzqleFiSz8x0RK0lkL2H8+YDTSqCCnOWn10mK3ID8D6PDl9zlU659ZeBV1dlxMlokvBQXQ2G5mluUqSM6/Ot6DyyUR97nZrBv6t6mGo+gBJyzXBjzZRLmNEQI76O6zPQK+Lj2wKQvOXuE220iRppPlm5h2KGq9Vz2TgkFK6+cI4Yi/wwPSZQzfep4Qiey3xIvp5+gKrN9CJsL5Rg9Rq82dqMesh0ftA+IDXNjFqaeDphO6AWsD2bSqGaAZJW5ribNqEAx1TURJY2I7tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diNM1hQe3YE+uNf38Hrmt5HY22mrL7spVK3/CCqW7K0=;
 b=qoQBcPtQ+WHQyLtFpLIcEHKPSKJIGYoFsmRJ2nPfJdSpP7VDRIkVB6oboZMDwVu0b8NtrOmQhwD5/NtAL+R7Tva1i/OXcInoIC6oOInLTuhybgvVhb9OrKisQ81BP/2TJfTdBXUD6vmbqPt6UVV/c/Vgmpej7sPs1qBRJl6FuR6EEkow38SsrPRyZZ5mEUd0slX7W5fIKFWyeWvSrYjaXcDxWupxF46ivg+MeRwPJNI3zgI0tl5Rzs5s1SiYbL3M1RVmHPjCBd2pscAt4AZqJfhyNzuFsMXX1WjgckPev0w+Khros6lRC7kjMfEoVdjnsi2TV1NaB/BfxehoUMC+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diNM1hQe3YE+uNf38Hrmt5HY22mrL7spVK3/CCqW7K0=;
 b=qtWDQ7DKMWxLYR1mtsRpmay47/W+T+epYkZ5/1Yn8GMWJkqkMDYqFhMPg2PbngysmQ2X+3jlvLXJwb58g5WWeXGAySwWp+Dobe7acQ2ze4DFYZgMuX5r1q/H9qKuN87Az1ClhagEnat08+SfvysoFgxVE2sNJSvZlKo1+vy6UBsD/twLbuQf7rwXnV6CXh/XW6/w4ZaTBuuXMtPx6cdKSgGzxX628G+xYrFy1KohmsXA+036VEsqVgkfNvJSwLf5YEF6LufUtIQugmJBfRZEgnx/bKS916QR2tJwak4BLWfLpP/1vTgsvRrNTwf/vDCZoHJFkafsC/GpQ1vZonGKBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CY5PR12MB6622.namprd12.prod.outlook.com (2603:10b6:930:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 02:03:41 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 02:03:41 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Alper Ak <alperyasinak1@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Alper Ak <alperyasinak1@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Fix passing zero to ERR_PTR in
 host1x_iommu_attach()
Date: Fri, 13 Feb 2026 11:03:30 +0900
Message-ID: <11263677.nUPlyArG6x@senjougahara>
In-Reply-To: <20260209131426.37611-1-alperyasinak1@gmail.com>
References: <20260209131426.37611-1-alperyasinak1@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::17) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CY5PR12MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f121fb4-21af-4130-58bf-08de6aa41c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmVzNmtXcWpYa0JjL000UGd5b0Z1V1ZqV3E1MjEvSmJXWGEyUjVJa0RucGJa?=
 =?utf-8?B?YjFzRHJRYU4rQ3VlaVNHVGM1ekJoRS9pOE1QWUtOdDlWR1diWEtUcXdXUjBU?=
 =?utf-8?B?eWV4SHZkS09TZExnMVZCSWZ6NzhuN3IyWkNuallGUkUrZFpwVE5pd3lyQ0t2?=
 =?utf-8?B?QS9CTUZMaU01VldwUCthVjE0TkRWT3pGc1NtODU1YS82V0l1MzEvcVFrZ2Yw?=
 =?utf-8?B?UDFrMDZjdyt2c0FGOWxwVTVML3BxQ2w5Zmc5S0NJYzBsMEpJQTI2TzJtdy81?=
 =?utf-8?B?ZjZBRkpBUXBWSERVbUZNZnBPUlBNc1VaWFFuRnpLZ2hUMjBVOE5yQVpYUk1o?=
 =?utf-8?B?aHNHQmc0UlFwdkZZV0hRM0RtMmZzRmtHZjhWdG9kNkh6akVlejBPeExwbjlX?=
 =?utf-8?B?Vi9PSUgwb0JzK3hhUm1EYzBtRE5sY2tIOEswaXhqVlc5TTdOOHF0Sk5Yd2xM?=
 =?utf-8?B?WU9zVVlNY0N1Uko3dDNZOTBXcUdnOHNSbzlTeUNvbm9YM1JmUW9ON2hzYUJX?=
 =?utf-8?B?VGM1S1djUTlIMFA1R3ROSkkrcjdROHNzMEJtZmdXM3NxUkFCRGloaW9mb2s2?=
 =?utf-8?B?Q0dmQWdGM29kdktnaFJPdmVKRm1HR1IxZFRpdlZzV05LR3hYbHlRelhDSHRr?=
 =?utf-8?B?TldkY1NuNEZ3dXA3QlgzUk1JQkJuK25LUlNVZjQyZEl0SGZsMWlMOC85RWJu?=
 =?utf-8?B?emEvVTZzTTVha0RoV1pHaE5ka0MzM21aRzBYaXVSZ2o5MHpKT3VLVVFIRTZS?=
 =?utf-8?B?UjNCbTQxRUNOVnRTdjdrSUdzYWtsdVk2VWRucUU2SGdXRFJuMVh3ZVVFN1J3?=
 =?utf-8?B?aHhMNHdHUWxINHh5cDhuYkpocnhJZG5Jaktuckw4TjlKa1pLU1ZmY29reFJr?=
 =?utf-8?B?b0JOOENORG1DdlRaRjhKMGRrNEtRL3htWURPVnptUGE3RnlkaW1NS0s0L2NU?=
 =?utf-8?B?UzJVNTNsU1NRdGluQ2Y4WjZKUkM3Rkt5aE9KUFdvK3lYSTlQdXlkd1lkT3hy?=
 =?utf-8?B?VW4wd0szNmRzOXMzVVVDNkw4NFFsSDRvUHJsN3l2RGo2MmVsbDJ0OVZhdmtj?=
 =?utf-8?B?TzdvRU1WcFViTDRyWldUUlByNlVURFZKdVZMOFJIMFpLSm1ENXdRSERrRWh1?=
 =?utf-8?B?UmFCNWtINCthRmNDVHFtNlNKQUhoZDZQSnJUMXFnTHhEdWV2TmZZUTMxZThp?=
 =?utf-8?B?MGY3Ny9ERXJld1NZK292ZzJSSG44Ky90L0hpdW9xLy9BK0NCK0NrYjZudFUy?=
 =?utf-8?B?a1NDalFReHg3UG83ZG1MZHpzSGc5YVRaK1pzNVpnMkxEck9CcGdVQmhyVlFJ?=
 =?utf-8?B?dUlQbW5aVW51MlNnTUhyV3VucmhtQWxPTHEvb0M2ZXNSUkYzcEpBZ016ZjJE?=
 =?utf-8?B?RlpZWlFvSUlUejdVaFprRSszWVd4U2xnRGxNVTFTdTBaZHJKdm1QYjFPSjVy?=
 =?utf-8?B?cVNtNWV5b2NUK3l1QVdrN1NwaWhWMVlGS1FUVTlFOFFxV1hGWk1vQWtUSDlw?=
 =?utf-8?B?MHFPT2NXcGxUbXY0cHFtUC90THpsMXo4a2gzT0NPcTlyWDFsOE45eEQ4Z09I?=
 =?utf-8?B?Z2VKWGRlZ0YzZFBWWjNZTnRVdFZTanltdlEvZEt0YnYrR09nQ21ZSHNwYVd1?=
 =?utf-8?B?YklIWVRmS1Mzd2dSWGVRYWlvb2d1R25VYzZzSkNYb3BNYXFza1QzblJGbG8v?=
 =?utf-8?B?b1o4RlVGcTFpNXh0YUFhWXozbEZuZTBVRnpBMDlhWFYwY3YrbUtkN0t5U3Nt?=
 =?utf-8?B?TkdzL1JZWU51Z0g1cTdhKzBFN0lmZEtBR2U2YlAvdzZEZURnSC9ZeXF3SzZY?=
 =?utf-8?B?dERnV0V3VU5FUjJLQjQvQ1VOZlF3dFdXZlhFU0tpbmw1ZUxCQWUwWG9GZkt0?=
 =?utf-8?B?RTJLSlNDellGaWpFeXBNeEd0VWtnUTJKNVZvTHFObEVOSWFDOGgxeVd3OGZO?=
 =?utf-8?B?TFdMd2FpSXY0aWJIdWprb002aW5uQXNVdTNkSlJVeVBOQ1VVcmJLOXNWMGR0?=
 =?utf-8?B?Tmdxeld0bk9xV3NQSUcxQjRDMWlkTndsMis4Y1ZpeGROcHB6NENYWmFZaW5L?=
 =?utf-8?B?d09abzdCWVNzYW5WTm5MNEtiY2lIYktSSG9ibnQvSytCSXJSWnpCN2FTUzNw?=
 =?utf-8?Q?sK6o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVVORk9Ubzl6K2dOUGZrYndMWHErdFFXdUJoR3o0YUpQSWdpRDAyaDcvVXNl?=
 =?utf-8?B?ODlRMlIxRFRzSHpYQVlrVTVsbGFOeGdoT2dncU1Da0x4WXd1ZFdHREJHVmNQ?=
 =?utf-8?B?ZExNaHZrWDZBVDNEWkJtMm0rZnFpb2QySkMzUUJLUmlad2VSVlk4eVRTSnVO?=
 =?utf-8?B?VFNxVStOQnNpRWc2TjRGSGxmMkp4UlRMeVdrZS9sYWVyaTFKVjJSWVFzRlNp?=
 =?utf-8?B?SkxYMWFva1ZUYlVkSHEyakRkSHJKS3lvUURIS2Zaejg1VDVMZXJoeDJ0ZlJ2?=
 =?utf-8?B?RTJCUVI1aFZTczN5Um9Ta2Z6RWE1a2ljMHlLeS9uOERIN2Z0SVV6Q1VhcVV5?=
 =?utf-8?B?bFBsMllSdXFpU3M5R01oSUZYa0ZIOE5ZSjNuc0FhWllzbXFTd1pJSmhsdVpT?=
 =?utf-8?B?MWVNY1BYclFQK3ExcDRsZnBiZlVOblhNQ3VhZm93TGRDVm43bTBIR0dPTTQx?=
 =?utf-8?B?UkwxNnpYNmVqNXJERWh1NDUybTJBR2ttZGxIM3FmTVBqMUFvbUE2TzVyNnEy?=
 =?utf-8?B?YUhPQXFzY1RYRTJwUjE2NEhnb3N3SlRuV0VGcEN4Ky9EQVAyOFVScDRITVRK?=
 =?utf-8?B?NFg5UVVKZ0taeVhkSy9YMkN1cHVpWGxvLzc5QzVEcC9PZzFFUDZoSFRlSkN2?=
 =?utf-8?B?c3dwWjFhOUZNcnVUWEp3Wlp3VW1lNWpqZmozdU02NzBTYTNCZmRIb2JRWkpB?=
 =?utf-8?B?ZmpMc1U0MnZiNCtvZ0VER3UwNGtzMENTSjRVTlQ3aG1QTWVpRkQxSnRWYVBC?=
 =?utf-8?B?YXpPdUFiZXZWT3VFbXU0bEpsM29WUnpJak9qYk1wR0VJbTJsM1M3VFZOdllx?=
 =?utf-8?B?Yk41YXZGa21rWXJ2dHhOTW96bXJjTTBhcC8zRW9mNDErVFcweURWOFdOQS94?=
 =?utf-8?B?MWxTM1NUWlFLL3NIMGtYZHliK2d3dllUNXR4dWdUV1AyYTlHcVViTG5BWTY4?=
 =?utf-8?B?d1NsM3k5Ym5jQ1ViZFlxSXVlVnAxeUlJWG1KZ212VExXcVpyWjlIVzlrdmla?=
 =?utf-8?B?ZjNYNlZKZnJsTzN1a3I4S3IrSkpaa0F2S090M3BwQUpTMnpsRVRJQ3QzVTNa?=
 =?utf-8?B?Z2tteVVnQktwNnJXQkZkM05ydGczb2VrK3dXcjM5UjQvZUxXejdXOUlrRDhk?=
 =?utf-8?B?bWl6d2FZVHVyTlBldTlGQjNMcUlPZjhOK3ZNdUEranlBK1FEZE9PWkdJbG5x?=
 =?utf-8?B?Z1MvZldxdnkrOWZiSFQvVEl3cWY0UlhJeWw1YmM2UnNEWENhcmt0TVp0ZzBj?=
 =?utf-8?B?ejljazZ6cEM0NEpQZzVMa21DT3Fic0tiZXRYbXZBSys4Ky9kemJaVklCcmpI?=
 =?utf-8?B?VEl3Szh2azlsQzRyOGZTUlBRcnovY0dyWFBmYTBQck0xclJQMmtyWm53ZHZI?=
 =?utf-8?B?VFVXek5FSVNGbjYzMUZoMEJ3RnVGMy9pWUJZOW44TlVxd3NIOWZBVGFQRVhF?=
 =?utf-8?B?TFN5TzRzWXNTRXcwZ3BJZDdnU2RJMFZQbysrTDFQcGtPM3RQTDljZW5UTUc5?=
 =?utf-8?B?S1Q0YlQxOFZEb0c0UEZmd0RNMmlkNEVpNGhuYVc3OHQ4VWY3ZHM2Q0Z0b3pL?=
 =?utf-8?B?Q2lZUC9BOHI4K3NGSm5RNXd4U1preVdJckl3RDFCdVdpbDhwdzl4QWg4WG1U?=
 =?utf-8?B?K2JpZXo3emtTbkRMRk1JRm9VL2RlWGg3ajJ6SEhRWWh4dDUzLzRYbVM2VlE5?=
 =?utf-8?B?bGtJNG96YVBjZXRrWWhPVjZteTVpZmloaW9Sd2xjbmVlT0tBK0ZPY2grcDAr?=
 =?utf-8?B?YXZ3bnlYdjJobitQMGRLVmswNEgrbk45RkRzcC84d3dobUZxcW8rZ0xTMDRC?=
 =?utf-8?B?SmpFblNza2EwWFdFSlRMMkJiaDFyci9oWE1sSTcrK0thR2lLczVCeWQ2cGN1?=
 =?utf-8?B?WDZFM3dOZjdSM2ZjZ0szK1Fld1Y0TUxjTk5JemhTby9GOG84UVgxSXlVTXRO?=
 =?utf-8?B?bHdNYnBnMUhaYzFwRjBWbHV4ZENEMVU4OTBCc1l1S2lQamtiK0t4N21tWDQ3?=
 =?utf-8?B?MG9MdThVY0cwcDhjNTU3VVBhUitxdHNYcVI2UFJ2eDFkMGpFaFBxc3VZTUZ4?=
 =?utf-8?B?a2h5aUpFbWpFc0paQUVVcGJQekhkZW4yYVY0VDNIcW4xRmpqUXJ1THk0UlNZ?=
 =?utf-8?B?ekNxeVJwbmNjRHYwNVk4WWJaRkozbnBBWTh0SXVJZWxaUXFiVE5oaDlCc1dV?=
 =?utf-8?B?cDc4VmFmc01MRFQ5VE1YUy9jazdwWUVEaDVDZ2plckxrYkxoWFdJZ1RMaUxG?=
 =?utf-8?B?ejE4UkJmWEFCZXc4VCtPbVVCWFVHMXdBWkViRThQbEtXWUZZckUwcGgrSWFr?=
 =?utf-8?B?RWlFOVZMMCtncmNnMHpKa2txcEJjb3pBNGNLUy96ZHBzTUxjRURWbWExRTYy?=
 =?utf-8?Q?GuMbdDyeQ6nCwuXTJDgQuHTaPtQ5sdPBUw5pkI6AUOUVN?=
X-MS-Exchange-AntiSpam-MessageData-1: BVSzl7+93TPE/A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f121fb4-21af-4130-58bf-08de6aa41c3c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 02:03:41.6122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVu5fhRow9m5L1rkGU5talGmmS/L9SiWHgRZWQxZdywOHIPT3m9v57qvYHLN/Vcja2Gr9887ek7XNy08+wwvjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6622
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:alperyasinak1@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 29F3A13257F
X-Rspamd-Action: no action

On Monday, February 9, 2026 10:14=E2=80=AFPM Alper Ak wrote:
> When iommu_attach_group() returns -ENODEV, the code sets err to 0 but
> still falls through to the error path, returning ERR_PTR(0).
>=20
> Returning ERR_PTR(0) evaluates to NULL and breaks the ERR_PTR/IS_ERR
> contract, causing the error to be silently ignored and potentially
> leading to NULL pointer dereferences by callers.
>=20
> Fix this by returning NULL when err is zero, and ERR_PTR(err) only
> for actual error codes.

This commit message doesn't make sense. First you say that the function has=
 a bug because ERR_PTR(0) evaluates to NULL and can cause problems when cal=
lers don't handle NULL. Then you fix that by returning NULL explicitly.

While returning NULL through ERR_PTR(0) may not be very beautiful, this fun=
ction is defined to return NULL in certain cases and so the behavior is cor=
rect.

Mikko

>=20
> This issue was reported by the Smatch static analyzer.
>=20
> Fixes: 06867a362de0 ("gpu: host1x: Set DMA mask based on IOMMU setup")
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  drivers/gpu/host1x/dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index 3f475f0e6545..46a570b861ac 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -450,7 +450,7 @@ static struct iommu_domain *host1x_iommu_attach(struc=
t host1x *host)
>  	iommu_group_put(host->group);
>  	host->group =3D NULL;
> =20
> -	return ERR_PTR(err);
> +	return err ? ERR_PTR(err) : NULL;
>  }
> =20
>  static int host1x_iommu_init(struct host1x *host)
> --=20
> 2.43.0
>=20
>=20




