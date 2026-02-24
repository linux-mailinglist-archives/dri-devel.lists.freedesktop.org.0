Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENV9EDagnWlrQwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 13:57:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F821874EA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 13:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB9110E579;
	Tue, 24 Feb 2026 12:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bjuKYED/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010009.outbound.protection.outlook.com [52.101.85.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601EE10E579
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 12:57:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKcAimllS09SLKspaRVhEv6DPBTotb/brK3cZCYBkkimeQZk+hnRm+zoJPH1MTYgSKz6o+vpDUzMK+BKhVKUMmNwyWMk2pEKyAGL8aCa1SyTo6eZ9x3jVn+CVfte76m35E87MLDAEaytZKMwtt1BLTsoKvo9GjYO9dJKJedJ2socJV8LWt8Gsq/YrgRhKQ0f+NRfkv9qwmK5NFBOZfPWcK+KN58G12tdEL1CcLsKyrdXIljE9GXJgNvZ26wTARkwqOC8tk8D3Zo1bigRh7Q6JtzABwDD9FlzGsjV7ibQMv+WaTBKE3IL7I+vGUxFNLGSLwS8cQl8TjCOnh/q7RLdQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2ao/atFP0YvY5IZyZXRj7Spv9dmO4Gn0ERrvnZH/mg=;
 b=bY8LFgctFZB0yePtLbxkyChE1Cewwk0Q/YUU9sP29xwKHt45AljYvkirMEC7IbYkoAUCmt3v4ZlioPj1BFoFwbRK8Yp+lThdUsE/DRz+WqaANYHNq3iD2DSrPeY+s4+jLBnZkMQrrpPiZv5dXLwgrVD7SXLE01sY28y3Vgwm7wsBfdhqmL2g4CkzYQ72vHKWA8VcaHdEWgcWaYRF6OmA/QVgkTScQt+wgf8WWcgLROSjZT86DFkDHatOD0M/D6oDHDhZxWuECypeng2TH5N/7IN4K/Hrvlb6I4RfQ0BABpVJ5MBC1nTNyY5PsKN614yxp972Xxi63MXME1qP7gb3xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2ao/atFP0YvY5IZyZXRj7Spv9dmO4Gn0ERrvnZH/mg=;
 b=bjuKYED/cvNeKGDv+FPEa+0b+HylMKaOq86jEED7D1B7aCxhxIdW1UEoCwz44n2H9ndph5WrZu+x7fQJkvCpY6k6Tvn4/kyzx1U5RPrNWnE4px3QAUHUFTOhy1wQQ60QoNEg5jsoOony3r+jtKdQDO3BZZY7D9yyz3jrUqqP+9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8259.namprd12.prod.outlook.com (2603:10b6:610:124::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 12:57:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 12:57:18 +0000
Message-ID: <9108cb5d-6925-4572-9431-f7903257a4c0@amd.com>
Date: Tue, 24 Feb 2026 13:57:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Opportunistic dma_fence polling
To: phasta@kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <91f84eccd59d593822dbb97c995ae9c52ba788d2.camel@mailbox.org>
 <e9bbe32f-b165-483b-a2c9-e581bfe57b59@amd.com>
 <ceaa533664599c294beb307b198c1fa48197f581.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ceaa533664599c294beb307b198c1fa48197f581.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0398.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: d6595469-2b21-49ad-0374-08de73a43dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEVuU3N1RWxjcENzS2I1UzdUMW1tRWI3alRTbjJHN0N1MHB3clMzaGQ5RkVE?=
 =?utf-8?B?d0szb3dvOWwyNXNMMkhjbllmaUhmY0VEdWlJWEJkaTBVeWFjU0YxUnZCckx1?=
 =?utf-8?B?WGxRUlFBdEFxVmdEYTBlZFA4TFFENEMwUDV1UnpPWUY0aWcwRGcyMnN3V2Ux?=
 =?utf-8?B?WmNFcHRxa3l6NGhMb2JNWmhjVXlRNmxXQlJLcFJ3ZVdiWHlaNzUxb3pzcnVn?=
 =?utf-8?B?RFM4YU5xM1pCeWdwMWZ0LzhRRStER1lYR3cySm1HOFNGTC9iVG9ZaWhCWVFz?=
 =?utf-8?B?ckV6ZzdQWGxIWXFpZ2NwQWNHbzlodWxQRmZDMTFCQ0hBTjZKVDdvNVRwUjhp?=
 =?utf-8?B?RDFidGxOeTZOOXZoOElqcklwRUxPMmZNQk5ZSlNmWDJ5UGNhYzFScEdBRUhz?=
 =?utf-8?B?dVdaZm5OdGpRQWNOTXRHSTBkSzhyQ0ROZVJYcXU1QjNtd0VmS255cDY1Uy9S?=
 =?utf-8?B?U1dpMHBXeXRlTkYxYWEzWndjdkNsU0hQclNlVllnWFlUSWg0cXhyejVRVDNH?=
 =?utf-8?B?RFlKWGs0eXFqb0ZWNFhDWGFBcHFMWVNsc0w4OXYzRWtXdUFPalBVRzNOZ3Q5?=
 =?utf-8?B?QWVjTE9CT2RUOHhab0s5SHlBaHlNUEdPcllwcWFISnlUVnZXcGNXMXhsOFE4?=
 =?utf-8?B?VjFacTM5VjJJU0l0QllDc3hQQnlCbDUySy9sdlR5VFBLaGluQXo2ZlhtVFZC?=
 =?utf-8?B?QnNFNEkwV3BBbVdqQ0l2NDJkQzdNbGN5emhuTmVCdithSXVqRnNpV2FHVnVh?=
 =?utf-8?B?TDJwcmxiQUUvbUJudzRWV1ZSUUtaalhHbFQ5dTAyVkpkNXY0WUNVN3NFcWZq?=
 =?utf-8?B?L1Z4ZGRyNG1QcUZtVURyK0hpL0dzYmVXNmRBNEZsWU5RU21mR3pLMDVLN1dQ?=
 =?utf-8?B?d1crWk5zaFhRZ25ISjVabjhONGhEKy84T3lmcEpYYU4wOXNCV3hMRVJBMm1y?=
 =?utf-8?B?OGsxNUg4VEl1WHAzbkxVc0JzL0c0dmtPVGFCVlVETkZCMzU4VDFQVFlBUUky?=
 =?utf-8?B?Nlh3UEUwTWVucWZNa2N5aFMyWlNuR2dZeW5DbWdNa2ppSHJncXE3Z0liSzRV?=
 =?utf-8?B?SVdCVjdpWnZUNmlhUFB4cUhWSzFJcVV4UGhwM0IvVHVsZDZyUE1kWDNLS1o4?=
 =?utf-8?B?Rit1dHEweitGbE5jdHVwY3JYbzZKTldKTTFwVGZDVHZ3VDNoZTJNdWVZb243?=
 =?utf-8?B?dGgxSXZMM2pvRVEwVjZRQjBkN0ZWWUs4S3lwdFJsTFBkN1ZxR1VESVhuemZo?=
 =?utf-8?B?ZWVnRU9mVGhrZFZXOFJmWUIzNE91L0toWmVxWGZrWnZaMzV1YVBETGpJS2JY?=
 =?utf-8?B?NjFnM29BSWEyOFFsTnIwSkxkZXdjZTk1QUFaK1NJYjNXU2N2NzgwUS9aWklz?=
 =?utf-8?B?WEFSbk1ldGNsRDRvWVh0aHFLUWNTdHc4MEJaaGkvdjhuMmVROTRocDVqMzZ5?=
 =?utf-8?B?Q1k2VGFmWjA2Z3RNTHBuOE54OU5ZTFg3UHNHU0kzR3lPSWFUV1UxVE81NkNB?=
 =?utf-8?B?THYxSVdJTUVIcVkwUE5LWHJSVGU1S2pvV01WQ2JDMGNodFNQb29jRkdlR3V3?=
 =?utf-8?B?T1NRbE9KeTFUSDhKc2lqL1RDT1VPSGJNTkwreVFib1FNRnArVjlVcnY1Q2V3?=
 =?utf-8?B?YjJMYzh1Q3BiLzlpVlZwUGJSOC83OW5XZVhRUmlyNS9ia2tITnpTNzF2ZG14?=
 =?utf-8?B?cnlQK2xiY0hBM2pMVE1PNm9zVzBldkl3TVdvV3pia3lTQlI2d0VTNDJ0Q21U?=
 =?utf-8?B?RUtHTGpNQzBGYW5JQ2haQ0ZMRjZSVURNSjhVZkVhcTJZeTdRYXVwRGl0R1Y0?=
 =?utf-8?B?OG9SUjVZQ1ZNdzZ6VXdDdVp2UjFiY0RLbERTQm9tQXd0aWlmdzhHR0haNU9P?=
 =?utf-8?B?eXRhMXFKZTZqMkI3WnFTZUV1ZVo2dWx1T2VhL3d0VWNmaEJ4T2p1ZHFabzl0?=
 =?utf-8?B?dW9XZUlLTmxUS2M1WStrekFmWm1mY2xNU0NOUlRzbTZ4cW9XUkFlWVB1WExV?=
 =?utf-8?B?Y2ZKVk5LSmRQUng0aERGWDNJUGtlZGZZWEY5ZGFkRmF6SmQ4eDNPY1Z0RzhE?=
 =?utf-8?B?NENPUUVtNE1NeWJwNnlyU2NZeVZqL2pLbi94TEFLYTFVc3BxajZOZXJXWVhv?=
 =?utf-8?Q?mQlk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ulh1cW1ObVZuZ2M4TFVrSG1QVjRqRWlKbi9QL0RtY1R4elhWeHJkbmZURk55?=
 =?utf-8?B?YTRVNld5RTh3cmUwVHZOSHNuQ25GZGV6OFVmLzN2VHlaaTVHVWZaTHRaN1Jr?=
 =?utf-8?B?TXJxOWk5ZktMdW9kaVNpS281RklHbzJIN2hZOUVtS1EvYzhqV1VFbXFTL0Fv?=
 =?utf-8?B?aEVaenVRVzhIRzVyaFFzVGs5QURQbFNEUmZDSXQyRkh5VzVRMThSa0M4ZTY4?=
 =?utf-8?B?ZXUyTHZadXBycWZRb0JQK2tTTHJxQkQ0enozUERORmdpbzZFM2FuZlF6Z0I4?=
 =?utf-8?B?bXExdFZ0emxkb2srUVpmVzU2UlYyWmVkenVrd1NSanl5MUVvRHNpMU9wQ2RD?=
 =?utf-8?B?UXZBY1l5Zi9SeWxXVjRVR0V5M0FrMHZ3bE1qVFdwN3FIVGVvdDkvUlo2bHlK?=
 =?utf-8?B?R0ltV3JSZEJNYjdnL3huY09GV1JUZXV2d2RyL1R0V2Q2R2JqdzBhSERsMWlB?=
 =?utf-8?B?LzZOQ0hqTitSUmtTOTZaUEVGSWZSWUF6UkRISWI5TXoxeDJIT2tMazBuS2Q2?=
 =?utf-8?B?cCtTaHJPRzgvT2lNQlpaMUNXNDdSanRCUFFmaE56NHpaZldXVUx3R2pmaW8z?=
 =?utf-8?B?Sk15RTRoQ3orcG1RcTlLc0ZPRFkrTDVTSjVzQS9KaEY0TlN5c2dtaFlzd1pI?=
 =?utf-8?B?Sll3VjBkOG41a3F0ZDkrYVpBOFFPc2tLVEkxZmhuTmFXYUhuZCtZdGVuc3dO?=
 =?utf-8?B?NDRPL1JEeW4yb3VkZEdIQWxGcUNuQ3hxWEVQZmg3Zjd2OThybTJBZVNFYVhU?=
 =?utf-8?B?eG5EaDJ6VEtCeEdhb0xXbzRSS0EweFA3ZU5TaCtKTXFlL2VpSFdGa05JRjlV?=
 =?utf-8?B?NndWcm5QZWZ1by9yckdxUVlic0ovNDdsNmlMSCt1STZ4U0JlVVlRbmlIUmh1?=
 =?utf-8?B?QjRCcVRTQndqNVlVZHplcHc2bzJFUHhnZ3l4ZEFrOWllQ2t2bXRHNEZBMHV5?=
 =?utf-8?B?UG9SaFNTSCtGSlRQQ3U0T0NGR01CNjVjQlEyQVRWcTIrTjVoY2R2N085N2Rh?=
 =?utf-8?B?ZEZveXp0NngvQzhWTzBxYzZGQTZwU092S083ZnZmQndyZ2x1bGVKeEJVWVE3?=
 =?utf-8?B?Z2s3aGoxQ2EweDJUTmNmUnVNMVBLZmRBSXdhenlKc2o2ZnFkUTQyTjJQVGds?=
 =?utf-8?B?M1hQTkVPeEk3alN2Z0cwdXVxL1JYcjd0R2lwL1V5MHZLT2dpSFlURlk3YlFI?=
 =?utf-8?B?M2VkaDZaVlh3M2RpUjJVQVY5QVlwRUUwTlMvNXowN3liUUJTUzAwZDRub1FW?=
 =?utf-8?B?RFhYbHlwd2d4OFRBSUpOTEVxaFBzSW1wdi9CbTZZbFRNQWUzTDZpRmxHU0Jh?=
 =?utf-8?B?WC9qQzlUVzh6QmJwV1N2anliQ0RrRzdZN1R3THJ5dzNnRlMyUXMvd3JYY2xN?=
 =?utf-8?B?b2ovc2FTZ1JJQ1hjQ1c5czg3VElhTU42ZkY3NzR2clpteXp4VGlRYzhYWG0x?=
 =?utf-8?B?N3VoYnNzVm0yeUhFdE9RekFFTFQ5TmlPOGhOaE53K1E0M3k3KzJwaHFhdUs3?=
 =?utf-8?B?T29tOXB1NXptNWc2TndmYjhlTktVMzhwNHNwamNYd1lVbXd6WjBMZzdNVmRI?=
 =?utf-8?B?SEpqQ0VQWUlRQlNLZHZvZUdBcXhaUkw2L0kyRmduUEd4YzBUTEJNL1RheFJx?=
 =?utf-8?B?MEVGUEZDOXRES1gwMUF4cDhZRnpvM0o3T2JZZC9FRkpOUDkwQzJ0NXNVN2xp?=
 =?utf-8?B?TGR1UEZrSUh5NkZTWmtuZ2ZlNnBzYTl5UkZ4SmU0YnFkTE1Pek5mZklob1Jz?=
 =?utf-8?B?bGpNQzM5MUd2bWFCQnNXVWJ0d0pmUzNJZnVIOXZrdnNKeTkySFB1K2ZsTzha?=
 =?utf-8?B?NXczOG9vYkJmbDVqRE1LTU9Yc0VlY2xjMW5VcXR0OFZOcnJxS1Nobk1OMmVE?=
 =?utf-8?B?dHhBTnVraDVDNmdEVTEwUXlna2ZzUnkwZ0JKM0F0ZG5Cc0xPWkZXZ0JRcFVX?=
 =?utf-8?B?Q0F4Z2JYaEdlNCt0TnZKdEJVdFJHREt4V0lnS2xzV1AzdlJaN0EyY093cW9n?=
 =?utf-8?B?Q29vNzJUQUpsaFMrRmNGM0djMWxSR0w1c2lBSXJWUE52MjYxYVF2Sm5HYVZv?=
 =?utf-8?B?WEtpeEkrbngrOE8xTHh2MWp3bGZDdTFid3d6RHk5elRHclp4WTQzL0xuZjEw?=
 =?utf-8?B?Q1JOS2k4U2x0ZHhrdWtUdUdtMDRNQnlxSVJ5bkptRFQwZTBaS3ZnYytVVmFu?=
 =?utf-8?B?dHNOMTErenBDRUJUMDlrMkF4VE5mLzh3eHRPV3BMTGx5dUJOdVdXQlNBQVc5?=
 =?utf-8?B?TVJvYW4zMnEySEs0cXZhSVFhYnFNdjVSL0NkekVTSWhLZW9DMmhFWDV4cktj?=
 =?utf-8?Q?p86x4+e0GIq7qE7qU/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6595469-2b21-49ad-0374-08de73a43dd9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 12:57:18.4539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVILzTTwrzT8IthwBh8ROOTCi0beED8BYFXRpNz15SVowSPFGedNqgeP71njG3yT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8259
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
X-Spamd-Result: default: False [-1.60 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:dakr@redhat.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: A3F821874EA
X-Rspamd-Action: no action

On 2/24/26 11:32, Philipp Stanner wrote:
> On Mon, 2026-02-23 at 12:42 +0100, Christian König wrote:
>> Hi Philip,
>>
>> I only found this message by coincident, please make sure to always CC my AMD work email address as well.
> 
> You've been the direct recipent, in the To: header field :)

Yeah, but this is just the gmail account for mailing lists which I use as workaround because AMDs IT has the problem to mangle mails and so make patch review impossible.

>>
>> On 2/19/26 12:06, Philipp Stanner wrote:
>>> Yo Christian,
>>>
>>> I'd like to discuss the dma_fence fast path optimization
>>> (ops.is_signaled) again.
>>>
>>> As far as I understand by now, the use case is that some drivers will
>>> never signal fences; but the consumer of the fence actively polls
>>> whether a fence is signaled or not.
>>>
>>> Right?
>>
>> Close but not 100% right. The semantic is that enabled_signaling is only called when somebody actively waits for the dma_fence to finish.
>>
>> So as long as both userspace and kernel only poll for the fence status enable_signaling is never called and only is_signaled is called.
> 
> So you're telling me that enable_signaling enables interrupt-driven
> signaling, typically. IOW in some cases you can request that a specific
> fence gets signaled the expensive way (interrupt) while polling on the
> others.

Correct, yes.

> What is the hw->hw signaling that the documentation details?

Oh, do we still have references to that in the framework documentation?

Initially we tried to make hw->hw signaling a general framework as well, but it was quickly found that this is really problematic and removed/never fully merged. 

HW->HW signaling is still used by a bunch of DMA-buf implementations, but that is then implementation specific.

> hw->sw signaling seems to refer to interrupts.

HW->SW signaling is both interrupt and polling driven.

>>
>> What drivers/fence implementations do with that is up to them. For example userqueues use it as preemption signaling, but most drivers simply try to avoid waking up the system with IRQs.
>>
>>> I have a bunch of questions regarding that:
>>>
>>>    1. What does the party polling the fence typically look like? I bet
>>>       it's not userspace, is it? Userspace I'd expect to use poll() on
>>>       a FD, thus an underlying driver has to check the fence somehow.
>>
>> No no, that is indeed userspace.
> 
> Userspace has no direct access to a fence. It's, ultimately a kernel
> ioctl through which userspace can check a fence. That's what I meant:
> it's kernel code implemented in the driver [but running in the user's
> process context]

What I meant is that the polling is triggered by userspace.

In other words the kernel doesn't care if fences signal or not as long as it doesn't wait for them. E.g. in case of memory pressure etc...

>>> So it circles around the question why ops.is_signaled is supposedly
>>> unavoidable.
>>
>> Additional to the interrupt/poll handling it is also a really important optimization for multicore systems, e.g. it makes the signaling state visible to other CPU cores even when the core handling the IRQ is still busy.
> 
> What is the "signaling state"?
> 
> A fence's signaled status is indicated through an atomic flag which
> becomes visible globally once someone, like said interrupt, has
> signaled the fence.

Well not quite. The atomic flag is the generalized coherent signaled state of the dma_fence framework over all CPU cores.

But the state inside the dma_fence implementation which you can query directly with the is_signaled callback can be quite different.

For example we have seen the following:
1. MMIO HW registers
2. Local device memory
3. System memory coherent to all CPU cores
4. System memory coherent to only some CPU cores
5. System memory not coherent at all and you need explicit memory barriers

So it is perfectly possible that the is_signaled callback returns true on one CPU core and false on another.

And for some use cases you don't want to wait for the CPU to CPU synchronization of the atomic flag, but rather go ahead and push the depending work etc...

Regards,
Christian.

> 
> 
> P.
> 
>>
>> That is also really important for some use cases as far as I know. Keep in mind that this framework drivers everything from Android mobiles all the way up to supercomputers.
>>
>> I mean what we could potentially do is to fix the locking invariant of the is_signaled callback, but that is probably the only simplification possible without breaking tons of use cases.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards
>>> P.
>>
> 

