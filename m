Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6DED3A7A4
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049F410E402;
	Mon, 19 Jan 2026 12:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R+ptTWj5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8EE10E401;
 Mon, 19 Jan 2026 12:00:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0fWz2YfkskrGX20ZtdLnmWcrIh5j80FI9TuEsh+BZGITArp4dm/3a+Yzlg0ZvVG6MWwDx+Fzp+OSmFvpEGGRNatgDmxSUsQSvz7GnbEn9aJLH+4pulS8KtdagED4qymx01uNKtwSPBATyArEZGpJ8geMMgvaedS0Iwxnj0TCkVSjkpr0xK9m2G0uNGsu3QyvrVIg5e6/fWA0cBwmPvJKLZZKwBC3GOGzNf9z8EGVC2jjMOaV6hs272CF5zgZmvV1dSvWcWl79mMhDeP63L7paBsFOiYuoqmogn6Bi1Z2+wxqDl+mZ5f7tpw77xJUCUSIHfmrS8+yS/iUE0TSVVtCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rfPvKdeeK9HEq4Dyv+PlsBML6DyBWf0kelS2/V7CBI=;
 b=TFlcHpvhxDIfAywVQyBjappOzH3Lr+oaHcuWzCdyTC1bRFRT8zbZN0xTQYQdZpTZfuSHgf3A9sRTLr2I8/9kF1WXha7nxNSveUseUmZBwsf0RRnQ//pOZGZgm/XT7baUn/ABiMugTyYk0kDVIi5L07DhWxoVdAsky3WAPk0CV42b013CX1zN9LsUOV2PYVbwCV3/5TYKJpMXyiPIEzMXSmPFkrzln9R70OixlzwBaheeAPRLSL5HPPXttnCl2OhNiz46oVd11hISBQl9GszpWRiFCz7aUz+hOFqwMojRocGwGCl2Pg7UzmV+/fBp5wVuco5Nv5SuCFEt+CkQsiXITA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rfPvKdeeK9HEq4Dyv+PlsBML6DyBWf0kelS2/V7CBI=;
 b=R+ptTWj5LcePumySFTEKXqSq1HkF+ZySWIAfgZSbA/kFb4aha5MuPEQ8oUARLKI6AtSGV0eVdx+Jgm5VC/zbpM5TPTWUQYmZPFFpzC1UgnXSaO7JwrgSW+xv4fVmxipyJE+RosNgAoKxEFwEIDJL48JN+Zk8gWpoa6/dTRKbipw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7845.namprd12.prod.outlook.com (2603:10b6:a03:4ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 12:00:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 12:00:31 +0000
Message-ID: <871628d8-14b6-4d38-b05e-a33822f8d71b@amd.com>
Date: Mon, 19 Jan 2026 13:00:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dma-buf: Rename .move_notify() callback to a
 clearer identifier
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-1-a03bb27c0875@nvidia.com>
 <345b8dcb-5015-4801-b263-0dca4d1b3fca@amd.com>
 <20260119113809.GK13201@unreal>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260119113809.GK13201@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 62855fee-56a3-4df1-282d-08de57525806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0E4b2duY2dBOTdFbzhpOVZDc1lwVUZZQVh3TWFQeVI3QXpQMVQ5a3RCeVht?=
 =?utf-8?B?anhRdUJjcXZaeDNTcU5Td3JyOXhEM3JiL1JDallhc002T2dKK0t4L3BqZXBD?=
 =?utf-8?B?c0d6ak9CL2M0MXdHMVhvMk5iT1N5bE5URzd1UXh3ZjJENnR3aDFwQ0ZOUnhZ?=
 =?utf-8?B?WUwyUlViUWRBYzhnSE5ISjlucGxEeWVkcnkvMzJxTmtGeDFTUm5JN0dzSW1L?=
 =?utf-8?B?eXltUDJXOEFJUzFFemFxTjhxcFo1WCs3bklJQ3l2OFM2cVVDeFVSVkxPd08v?=
 =?utf-8?B?N29UVXhFdElqL1lXbG9hREp1Uzg3RGpYbzF0WU1abEgreGJvTi9ZRXVWMlVR?=
 =?utf-8?B?NjdoVmZWdjdicHduUnpLSXFDQ2UzS2d3M20yMFBVaU9GakVsVTlmV011bVNY?=
 =?utf-8?B?aWF3WXcrblo2N1lvRXNuZXA3RHIrRG0zK0ptYmR6MVlEcmo1L2lJT2F5UXNQ?=
 =?utf-8?B?cGI2S2ZZdUc2cFBMWGVlWnQ2c0djM0twRHFEUmt2NnVhL3RRRWxkMWMrUUpr?=
 =?utf-8?B?NUYrWDlXMTN6Q2UwRU5qeHU1RktLWXpEUWRKVzh1QThlZXh2dGoxU21uR2RT?=
 =?utf-8?B?ZjdiY3REMXdxYTM5Sk56MkRZaHFtNUlicDlDOEdWY2s2Y3d3WTE5MU9tRzhW?=
 =?utf-8?B?cUJISjd2QzUrTGIwODlYbjA1bDhLb096MktBUnhGdHRQV05sRWg3dXVUb1dm?=
 =?utf-8?B?OGQ1VlZLZjRWUVpiSElPeUtCNDhvV2svUmYzMEhsaWF0WERVWUcrdHRYZ2M5?=
 =?utf-8?B?bWVqcFV4SitqMGNzVzlmSFBXeXBNUElERWp3bFkrV1FSZStobTNPSzN5cHlM?=
 =?utf-8?B?alVtQytyVjB2dWE5TEZvQW9DUXR0OGhPbWVQNWNTMXNMMVptKzlPSGVNdkNU?=
 =?utf-8?B?NzgrVmtQVHVTZHNGbUYzUlpSSmtPY1BwWVJrekdJaDFyeWozQWZIblROUkli?=
 =?utf-8?B?SlhlMGt2OXFmb0YrWWtqWDVJbVVpMmdOUkJtRnYwbTJ2YmFBT0VwZFFIb1Jz?=
 =?utf-8?B?eHRISk1FbWMyNHFEZWxhSTVFQm01SFFWNjE4RkJQUllvQU04STZCZ0Y4L0dK?=
 =?utf-8?B?TU5NZ21FQjNOeENHZHZoVVQ3bXFVRXpVbmpBSlM0VzFVUGJuWURpNHRzTnZ0?=
 =?utf-8?B?bVNCeklab3I1WW8yMzIwL21pN1lUZzFuc1haTXVHZ1ozZ3NzN0E1Yml3T1BI?=
 =?utf-8?B?bTduRDNxd1diaWtacHh1M2VPV0JOT3owZysvaFI1ZEN3Wm1FYlErcXJvaDlU?=
 =?utf-8?B?cGdselEyS0tBOVNFeVIrbVpqRjZTRWxVc0ovVmxnU0xMczBpMCtDaG1Ib0JB?=
 =?utf-8?B?a0FJMk5mSFhIWitFUlg3ckRRbjFlMVlXSGlzL2pCYk9FSHEvcTVnbjZkSHF4?=
 =?utf-8?B?V0hqcG1Pek9vemZES2ZRT2thWnFVVmc3d0ZuUk5qN0hLZWh3RlhJS255Z1lY?=
 =?utf-8?B?UDMyOWJBSCtiS0lvYjMyZ2tUQmdXd0xjd2VnT1BpNTVabzJDZlNLcHk2M1M1?=
 =?utf-8?B?blFMRFF1RjFqTlFYWm9Ic21kUGxIcUtQTkJHV05aY2NKV0lNU3c2NzZaM2Y1?=
 =?utf-8?B?V09QcTBZSmduaTNHenRaWWdmN3dZM0dRRDdtS1FHYlNCWWo3UHRiK010Z2Mx?=
 =?utf-8?B?dk95cjVBUWlJekJnNyt1c0dDSWcydXN2SVlxaG93L21IZWZScFlPUXdweG1G?=
 =?utf-8?B?VWU2RnI3MmpWaDhNVzkzM29JVmx4WXdWdW8zUDRyaHVybU9NNkZreTNILzdm?=
 =?utf-8?B?YjdLL2NoZGtma01zRVZGL052clFESVorYWQraUxiaEhGSnFIK1ZObnBmNHYz?=
 =?utf-8?B?aFE2RVhqdWZPL2pCTEhtVXVlbmwwZ1AwdmhBUFFnUHVWUVlUcmRVM3o5ZDRT?=
 =?utf-8?B?UGNFYkpiS1VWemFpZWIwMExuSjlkRmJoN1gveWZwd0kzL1BDMll6Q0liRmYy?=
 =?utf-8?B?N1MwOVFGbDBzVXBDQVdNeUVxeWFDTXZaQXZuNzI1Wm5mNEswc0sxWXl3RWtZ?=
 =?utf-8?B?eHRabnRmSzVKNWlJVm0wOUVUOTZBeGxQcGxqT2tyazE2WktjT0NJa2NrNHFq?=
 =?utf-8?B?NGhvR01lUEFDSTlGZFcrVlVYNDdyR0dqRVZMS0hoN2E0UFdFZTNSeU9TVmRx?=
 =?utf-8?Q?BKH4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M25lNWJVYUdFYWZNWmRSMHI1c1Q0UWdET3NmVkNKSHpackxjWmc1OHBpZ1By?=
 =?utf-8?B?ZytVS3JoTVk0Snh6L1M2Uk5zYjlESjFWblJOUVdwL0dDZVJJQ0lXenVUeEVN?=
 =?utf-8?B?TUpHMFZhKzBBNGxxLzY1ZXY3RUQ5aXg2b1lGT2F5K1paSUZKWjVZelphUS81?=
 =?utf-8?B?NWdCUjFUVHZpdWk1YlQxSzdDMmUyZ3JlNWo0TU9XRDd0OGQxM0FRNE1zTTZM?=
 =?utf-8?B?cWo1b2IxVlB6djFQdVJKSXNNQll2NTV4YlpLT2dDejhQZFhnQzRSbmhxSkU3?=
 =?utf-8?B?allSNnM1alFHQUo4QTRoTFp6VWhSQmZFbEhEZ29UdmJGQlJ6V3RXTUxVbk9u?=
 =?utf-8?B?WENSL3l5TzhSQmR5ak1kNCtVOHFXa29Tb1BLSm1lNEMvdlBLN1U2WU5ISmVo?=
 =?utf-8?B?RHQ5cysvM1FybStzV3BjU3VYaDl1ZVNSZkpleElva1NnZk9HNll1L3JwT1Js?=
 =?utf-8?B?aEFYellVU09XWkw2dE5US3AxRGFHSlVuVklOalNmVG1hK0wyOUYySjFYL1hQ?=
 =?utf-8?B?SmlWTmRSazdZQk1kOXZWenJhSmVNVktZTE1XVXFSaWNIVjN0TXlKZ3gvTDhO?=
 =?utf-8?B?czF2ajEyRHc1aHFBS3dKZmpGb2dYbmxacmE0VmErN052K0R6ZDVwYUIvbmUr?=
 =?utf-8?B?K0srZnhEdWorbCtRZFVPVUxvWFJkczRwRkdDbE9pY2NTaTBBaEJTdncva21L?=
 =?utf-8?B?cG9kUnJ6YzFLZnMwMDFSbWVDdnFJVlhTcUpFd0M0YmJHWm1KNXZSMHRpQTNm?=
 =?utf-8?B?UmFRR1V4aVJtdEZ1c3A4bnovbmxKL3FNNjlWNmhxaEk1QWR4L3g0Z3VSMytO?=
 =?utf-8?B?SWxpVkF2UHBWdGFmSkhabm9BU3RjME5JZXNVY1hZSFVFQkdyaDdtK2FtdzZT?=
 =?utf-8?B?QnJKaGFZVmdrWkd1ckZEbzZHYis2Q1E2UlBKNGowWVZycFJ1bmsrY2J4dzJh?=
 =?utf-8?B?NDhXVlBrZnYxdTQ0TGlMOUVUVWJRY2puWnA4TDd3TjgwSkYraC93OGFKdmlZ?=
 =?utf-8?B?bUM2bmJNT2JhSWRhTDJydjc5c2w3aW5xaXh6c1Y4SG1FYWdpY3cwMVNraWdV?=
 =?utf-8?B?L3h1a0lhd2c3YXMxL2Z2M0UvZVVYaEFMQ0NMdlVWcFNTNkd6dm9MSDZvZGNm?=
 =?utf-8?B?bThqV1VaTkd6Yjkxb3FyaXVmWFVGZGdTZjBLSFdYczFueEc1R2dLYms3Qk9P?=
 =?utf-8?B?ZlpDRS90UWdSOEZ4TSt1REE3RVJzRHhNQUVlNmNVdnkxUVZLamp1d0JXZHp1?=
 =?utf-8?B?Vy91bUFXUWtnWkhTL09qN1Rwb01xbzBrcGlHdEh0R0NpUUEwS3VDVHF5cCtk?=
 =?utf-8?B?cWhVdTBXazdRbWtDVkVSclRlWEhITGJnc3oyakZqdzRxaG02aDlzYW9uSGU3?=
 =?utf-8?B?YjRqTURicWluZTd1QkNoMFdES3UxWGxSYWdacFNWTGlncVF0Z0daYXFrOTlB?=
 =?utf-8?B?RXlzQW1Cei9WaHpqVjdVS2MzMytFVURVVGlrQXkyKzhHREhOWkxEQ000QzZR?=
 =?utf-8?B?UnBYaWZsc1ZvcXErNUR6Q2ZDS0QvakEwNkhad29pcitoZTJpNDczR3pMTDNl?=
 =?utf-8?B?LzIrTk9TWXdDZ3hVazBySnVpY3Q4U2wwR1BnbnhwcTRwSFZqaTJ6dGQyY0Na?=
 =?utf-8?B?MVcwZFlDNi9SekhscDBmSVBNTkg2Q3MwRkdyMzNUMzNBTFRFNDJyVEQwZmln?=
 =?utf-8?B?S0dLaWFsa3V0WXpMZXNCRk8zclNBcG5Yc21QKzFqYlRIOTdKMjdiOU9xNTVK?=
 =?utf-8?B?dVp4VkNHTWVNMW9zZDZQL0lEQ3RKcU1nODVWM1A2K1l3QzcyVjRObW9xMkJQ?=
 =?utf-8?B?ZVRRYUgyVHVkZkxqN3JWeFk1NzduYjErVHl3Y1AydzZaU2tDWlZIZDZNdXUv?=
 =?utf-8?B?aXRWRmlyQ2ZwNzZSVHhCSUhhcGF5cTNRVmFPVFl1di9jcTBPY3dFOUJqcFdG?=
 =?utf-8?B?M0NMNjF6T2lqa2RpNmlySmZydk5wcXUyTktOanMxV2c0aWxCa2FFQ2RLOEJL?=
 =?utf-8?B?N2EvUGVoRXJDbWRaL3NwT3E5eDBiaC91QStjVHBPWDN6M2NKWlAwcDd6MGE4?=
 =?utf-8?B?REJFcUhLQUlLWC92dmNVaEVXLzZaZU9BQVZubG5pYlZyZGw4MXFWbFUvRU5Y?=
 =?utf-8?B?TGYzZ2tQSVRYUnU0L2lUWDhiWitpTitVdXE5RHNmaUp2SEpJVTFVY0RNcGdD?=
 =?utf-8?B?UnIwSzAwMG9qeTNiQXNkaEIyM3Jwbkp5NGZxbG94dTZwMitlZEI0cklHVHVo?=
 =?utf-8?B?M3AwRXN2M0duMVFPeWxXOWhEdTNmUW95QStkajBOak5wNU5wbk5Eayt4RzV4?=
 =?utf-8?Q?8x174mCkvz3PMzlSE5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62855fee-56a3-4df1-282d-08de57525806
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:00:31.1423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CO7pfaIHX5QpStNnnGCYXeTrkOTgsuZyWSSJPYCXP88UlhR7R2xwQYUM9pgikRWO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7845
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

On 1/19/26 12:38, Leon Romanovsky wrote:
> On Mon, Jan 19, 2026 at 11:22:27AM +0100, Christian König wrote:
>> On 1/18/26 13:08, Leon Romanovsky wrote:
>>> From: Leon Romanovsky <leonro@nvidia.com>
>>>
>>> Rename the .move_notify() callback to .invalidate_mappings() to make its
>>> purpose explicit and highlight that it is responsible for invalidating
>>> existing mappings.
>>>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Thanks,
> 
> BTW, I didn't update the various xxx_move_notify() functions to use
> xxx_invalidate_mappings() names. Should those be converted as well?

No, those importer specific functions can keep their name.

More important is the config option. Haven't thought about that one.

Probably best if we either rename or completely remove that one, it was to keep the MOVE_NOTIFY functionality separate for initial testing but we have clearly supassed this long time ago.

Regards,
Christian.

> 
>>
>>> ---
>>>  drivers/dma-buf/dma-buf.c                   | 6 +++---
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 4 ++--
>>>  drivers/gpu/drm/virtio/virtgpu_prime.c      | 2 +-
>>>  drivers/gpu/drm/xe/tests/xe_dma_buf.c       | 6 +++---
>>>  drivers/gpu/drm/xe/xe_dma_buf.c             | 2 +-
>>>  drivers/infiniband/core/umem_dmabuf.c       | 4 ++--
>>>  drivers/infiniband/hw/mlx5/mr.c             | 2 +-
>>>  drivers/iommu/iommufd/pages.c               | 2 +-
>>>  include/linux/dma-buf.h                     | 6 +++---
>>>  9 files changed, 17 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index edaa9e4ee4ae..59cc647bf40e 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -948,7 +948,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>>>  	if (WARN_ON(!dmabuf || !dev))
>>>  		return ERR_PTR(-EINVAL);
>>>  
>>> -	if (WARN_ON(importer_ops && !importer_ops->move_notify))
>>> +	if (WARN_ON(importer_ops && !importer_ops->invalidate_mappings))
>>>  		return ERR_PTR(-EINVAL);
>>>  
>>>  	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
>>> @@ -1055,7 +1055,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_pin, "DMA_BUF");
>>>   *
>>>   * This unpins a buffer pinned by dma_buf_pin() and allows the exporter to move
>>>   * any mapping of @attach again and inform the importer through
>>> - * &dma_buf_attach_ops.move_notify.
>>> + * &dma_buf_attach_ops.invalidate_mappings.
>>>   */
>>>  void dma_buf_unpin(struct dma_buf_attachment *attach)
>>>  {
>>> @@ -1262,7 +1262,7 @@ void dma_buf_move_notify(struct dma_buf *dmabuf)
>>>  
>>>  	list_for_each_entry(attach, &dmabuf->attachments, node)
>>>  		if (attach->importer_ops)
>>> -			attach->importer_ops->move_notify(attach);
>>> +			attach->importer_ops->invalidate_mappings(attach);
>>>  }
>>>  EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, "DMA_BUF");
>>>  
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>> index e22cfa7c6d32..863454148b28 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
>>> @@ -450,7 +450,7 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, struct dma_buf *dma_buf)
>>>  }
>>>  
>>>  /**
>>> - * amdgpu_dma_buf_move_notify - &attach.move_notify implementation
>>> + * amdgpu_dma_buf_move_notify - &attach.invalidate_mappings implementation
>>>   *
>>>   * @attach: the DMA-buf attachment
>>>   *
>>> @@ -521,7 +521,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
>>>  
>>>  static const struct dma_buf_attach_ops amdgpu_dma_buf_attach_ops = {
>>>  	.allow_peer2peer = true,
>>> -	.move_notify = amdgpu_dma_buf_move_notify
>>> +	.invalidate_mappings = amdgpu_dma_buf_move_notify
>>>  };
>>>  
>>>  /**
>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> index ce49282198cb..19c78dd2ca77 100644
>>> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
>>> @@ -288,7 +288,7 @@ static void virtgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
>>>  
>>>  static const struct dma_buf_attach_ops virtgpu_dma_buf_attach_ops = {
>>>  	.allow_peer2peer = true,
>>> -	.move_notify = virtgpu_dma_buf_move_notify
>>> +	.invalidate_mappings = virtgpu_dma_buf_move_notify
>>>  };
>>>  
>>>  struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>>> index 5df98de5ba3c..1f2cca5c2f81 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>>> @@ -23,7 +23,7 @@ static bool p2p_enabled(struct dma_buf_test_params *params)
>>>  static bool is_dynamic(struct dma_buf_test_params *params)
>>>  {
>>>  	return IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) && params->attach_ops &&
>>> -		params->attach_ops->move_notify;
>>> +		params->attach_ops->invalidate_mappings;
>>>  }
>>>  
>>>  static void check_residency(struct kunit *test, struct xe_bo *exported,
>>> @@ -60,7 +60,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
>>>  
>>>  	/*
>>>  	 * Evict exporter. Evicting the exported bo will
>>> -	 * evict also the imported bo through the move_notify() functionality if
>>> +	 * evict also the imported bo through the invalidate_mappings() functionality if
>>>  	 * importer is on a different device. If they're on the same device,
>>>  	 * the exporter and the importer should be the same bo.
>>>  	 */
>>> @@ -198,7 +198,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
>>>  
>>>  static const struct dma_buf_attach_ops nop2p_attach_ops = {
>>>  	.allow_peer2peer = false,
>>> -	.move_notify = xe_dma_buf_move_notify
>>> +	.invalidate_mappings = xe_dma_buf_move_notify
>>>  };
>>>  
>>>  /*
>>> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
>>> index 7c74a31d4486..1b9cd043e517 100644
>>> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>>> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>>> @@ -287,7 +287,7 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
>>>  
>>>  static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
>>>  	.allow_peer2peer = true,
>>> -	.move_notify = xe_dma_buf_move_notify
>>> +	.invalidate_mappings = xe_dma_buf_move_notify
>>>  };
>>>  
>>>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>>> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
>>> index 0ec2e4120cc9..d77a739cfe7a 100644
>>> --- a/drivers/infiniband/core/umem_dmabuf.c
>>> +++ b/drivers/infiniband/core/umem_dmabuf.c
>>> @@ -129,7 +129,7 @@ ib_umem_dmabuf_get_with_dma_device(struct ib_device *device,
>>>  	if (check_add_overflow(offset, (unsigned long)size, &end))
>>>  		return ret;
>>>  
>>> -	if (unlikely(!ops || !ops->move_notify))
>>> +	if (unlikely(!ops || !ops->invalidate_mappings))
>>>  		return ret;
>>>  
>>>  	dmabuf = dma_buf_get(fd);
>>> @@ -195,7 +195,7 @@ ib_umem_dmabuf_unsupported_move_notify(struct dma_buf_attachment *attach)
>>>  
>>>  static struct dma_buf_attach_ops ib_umem_dmabuf_attach_pinned_ops = {
>>>  	.allow_peer2peer = true,
>>> -	.move_notify = ib_umem_dmabuf_unsupported_move_notify,
>>> +	.invalidate_mappings = ib_umem_dmabuf_unsupported_move_notify,
>>>  };
>>>  
>>>  struct ib_umem_dmabuf *
>>> diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
>>> index 325fa04cbe8a..97099d3b1688 100644
>>> --- a/drivers/infiniband/hw/mlx5/mr.c
>>> +++ b/drivers/infiniband/hw/mlx5/mr.c
>>> @@ -1620,7 +1620,7 @@ static void mlx5_ib_dmabuf_invalidate_cb(struct dma_buf_attachment *attach)
>>>  
>>>  static struct dma_buf_attach_ops mlx5_ib_dmabuf_attach_ops = {
>>>  	.allow_peer2peer = 1,
>>> -	.move_notify = mlx5_ib_dmabuf_invalidate_cb,
>>> +	.invalidate_mappings = mlx5_ib_dmabuf_invalidate_cb,
>>>  };
>>>  
>>>  static struct ib_mr *
>>> diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
>>> index dbe51ecb9a20..76f900fa1687 100644
>>> --- a/drivers/iommu/iommufd/pages.c
>>> +++ b/drivers/iommu/iommufd/pages.c
>>> @@ -1451,7 +1451,7 @@ static void iopt_revoke_notify(struct dma_buf_attachment *attach)
>>>  
>>>  static struct dma_buf_attach_ops iopt_dmabuf_attach_revoke_ops = {
>>>  	.allow_peer2peer = true,
>>> -	.move_notify = iopt_revoke_notify,
>>> +	.invalidate_mappings = iopt_revoke_notify,
>>>  };
>>>  
>>>  /*
>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>> index 0bc492090237..1b397635c793 100644
>>> --- a/include/linux/dma-buf.h
>>> +++ b/include/linux/dma-buf.h
>>> @@ -407,7 +407,7 @@ struct dma_buf {
>>>  	 *   through the device.
>>>  	 *
>>>  	 * - Dynamic importers should set fences for any access that they can't
>>> -	 *   disable immediately from their &dma_buf_attach_ops.move_notify
>>> +	 *   disable immediately from their &dma_buf_attach_ops.invalidate_mappings
>>>  	 *   callback.
>>>  	 *
>>>  	 * IMPORTANT:
>>> @@ -458,7 +458,7 @@ struct dma_buf_attach_ops {
>>>  	bool allow_peer2peer;
>>>  
>>>  	/**
>>> -	 * @move_notify: [optional] notification that the DMA-buf is moving
>>> +	 * @invalidate_mappings: [optional] notification that the DMA-buf is moving
>>>  	 *
>>>  	 * If this callback is provided the framework can avoid pinning the
>>>  	 * backing store while mappings exists.
>>> @@ -475,7 +475,7 @@ struct dma_buf_attach_ops {
>>>  	 * New mappings can be created after this callback returns, and will
>>>  	 * point to the new location of the DMA-buf.
>>>  	 */
>>> -	void (*move_notify)(struct dma_buf_attachment *attach);
>>> +	void (*invalidate_mappings)(struct dma_buf_attachment *attach);
>>>  };
>>>  
>>>  /**
>>>
>>

