Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C033A8557C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 09:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4D610EB16;
	Fri, 11 Apr 2025 07:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3gqL/1ud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2058.outbound.protection.outlook.com [40.107.100.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C79910EB16
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 07:30:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxqrjH0adnz7Mj4koymnnPer7Oh7L4F1hHcI1EML+5oySvlnL2W5VHO3KArJ/PYbNbslg7JMYEY4MXr3VOBjMg0E1q6RXDhK4g6BN0reri+t4jvKOFfS9hCHiYYv5NxJLxLuEdgicCabsIfQTCYcftHF1sK0cuItD+6P+OGKkFcxkp3OFIahRglDk3G90K6yN+b85qVVpgVjoXb3tNzVhVbhf1fWUzn0SLAibOkfZSPHI1kev8jCPvqxAB53hDgO6IHkhQfw9LoNaVhJB1XoFyjJHRczB1YbKhXq3xUPEDMTRT5+mQo25kl1sIZ91lLYvv9jCJBEpy39QMZj7nBVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeHsgMgMRn0QsYP6x06KhMz6+isEtC9qJSITYDZytfw=;
 b=aGzSKZCQodpEeHvvSCBwXHYnYuUsW8HuUB/VT+wZoovtH046eqn8TBBPEoHMEZY2cVgQsoVEuMYnZmUXRuZNO90fP8RRKMZth34Btifkp1Y51rkz09vzHnRIIed5HUjSpSr0Wri3Nqh3UpmlXxXzhR5NlIuA/gp9/qjcXgNOw2UuK+Bqs/wO+9dNVyMhLzkaM4CUuRUQ1rOrglgl482EAtr7a+stxqqLMoxzBJBJHvnSZ51kNOnNotjueSCinWdBEps8Ccikf1E8U8ImVdLspWIzDoRUxvysB8ADSuobfiYpkBDicoqbRQxBfBZJqeRgfRaBPtbc+bwAXeCWfp+LkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeHsgMgMRn0QsYP6x06KhMz6+isEtC9qJSITYDZytfw=;
 b=3gqL/1ud5nmdtAh9vfhoYr+ITizaSQcxf181aevWqypUUfzCP4wXVNNv+EK1+o319do54PY9ltgI42KUGHXp6PD5JKSVn5QfrLLpxwTnf5UMS7G3uqCKujf7VqFTGrJL/liT8ChENJV+S00C9E/yUtsERFx2oVOxFnOcteobdtQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5936.namprd12.prod.outlook.com (2603:10b6:8:7f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.27; Fri, 11 Apr 2025 07:30:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 07:30:45 +0000
Content-Type: multipart/alternative;
 boundary="------------k3Sbn7YSVmluaFQCINjd3qdk"
Message-ID: <b596c9af-c0e3-4557-b45a-462a33179235@amd.com>
Date: Fri, 11 Apr 2025 09:30:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <09a5beeb-bae3-4a00-9aff-66adf68064e6@amd.com>
 <20250410214307.361e373f@windsurf>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250410214307.361e373f@windsurf>
X-ClientProxiedBy: FR4P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: ff21f271-0146-4dbd-be1b-08dd78cac56a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1NSRlRUZy9OR2UrMEFPZGtvR3oydkp1NDNmbFU0enA0Si9HUFFrUVdIT0pn?=
 =?utf-8?B?KzlrbWduYTZPcU1yaHJVR3RzSnFMcW9jcUkzU3Z6azFHek9VTHZ1bzFVdnhB?=
 =?utf-8?B?QXNQdzRkVGlxL2ZVWlM2bFpqSWIwaGsra0xOczBoYm9tRjE1SFcrTGpvOVRh?=
 =?utf-8?B?Wk50WDZ5VHdhSG9yV1JpamhlamVqR0hCekZkUDBleFV2cVZVZHlLdHNXM05w?=
 =?utf-8?B?U0RkSnNwd1BWNXJTZU5QZzVxTi9ML0NwQk1MOHpIcDI0QjJnRW91dGxXUURz?=
 =?utf-8?B?YzlQSkEwdzlFZjZCQlVxekJGZ1EwRjZNQWYxc1RJUGRZc0R0cFV5bnBLa0xD?=
 =?utf-8?B?ZXkyaHFwamszMTVlcnJLNmFoNzlQMFVoSUcwVGFkUWExckZKL2s2aFoxcjdJ?=
 =?utf-8?B?YU9vWXpoK2FZWXlHZ0JwZFc1TzQ5TERGWTVQaGFFYWJyc2JnOS9sVFhOY3hD?=
 =?utf-8?B?ZTlyWllXYmhsOXdtL1FzSkIzc0hOR1paQ3M5cUQxcEJMaFYrU0dlQ21KaGph?=
 =?utf-8?B?dnhiTDdiR0ZiN2FpRnZTVHJwekVuVzhIclFYTEhRUlZpenpZczczcW56b1V1?=
 =?utf-8?B?MmxhbGN0eW9CT1pCdDk4Q3pzbW01bURuTEFReWVKbHpDdmtnVkR1bHh3cWNr?=
 =?utf-8?B?bXZwcGdJWnorb2hxemYyRTRpek8wamNiN1hZdkd0bmE2Q0hsQSs1cm1ibkpr?=
 =?utf-8?B?WXJtVEM0K2lSTUUvbXpwNnh1cnFCMmJCTHF0N3I4SlQzTnBBSnZ5b2pHNzFm?=
 =?utf-8?B?ZjZiVk1BU2RGMDdsdWo0ZmE4WFFzaVlUU0hjMjF6SE5qYXE4WFRVMExOdHBj?=
 =?utf-8?B?T29iSlhBamx2YWszbE5oMnhMZm1MaVhWMXoycm9wbStJelRxSzF0a2lzSzFs?=
 =?utf-8?B?S2IxR2pwYzlUMlJtaEk5RFBPQWEvcHBxVWhJNm5rS0VXNXQ5R0VpUUY0UUVY?=
 =?utf-8?B?R09Zamhkb0tTN3IzYzZ2U0hrQWRkTTAwRHhRZk9XU1VCaFRNdGZkT0lkVmJj?=
 =?utf-8?B?TkxBK09BWnZJSXhIYXMzMlI2WVlFT1hJT2dHSlpkU0JoazR2T2pHazVlcHBR?=
 =?utf-8?B?VW9nbXNHV3hFRlNSd2hLMUkyTlNDSXp3RHhnT3VXN0pscEMyVXo5SHVLaDJW?=
 =?utf-8?B?ZGJnby9YQTlxMExrc3FCbGd0SkNpR3dpdzA0Z29jUXZVY2pVTi9iTEZzSnl1?=
 =?utf-8?B?bkV2S1kxTUJaaVp1bFZ0TlRFYUtiaGNkcUVjOWwzbHRqNTl1YWY5VVNjT3Fw?=
 =?utf-8?B?MXNjTEp0cDVuaU5RdFIyVzFoV1RGSTM3NVlwOGxyeW1IZVNSNUR0bmNPRmhs?=
 =?utf-8?B?WTRSUXhSSDR3VXlkV3I2ZnczR3VRWjNxQXV2bWZCdlVNS2hJeFBCaU5pVmNN?=
 =?utf-8?B?N3Rvd0pYRVJUOVV5RTFRMDRleFBHWm96THp6MXBJZnZ1RUFKSXRSVUU5RUEw?=
 =?utf-8?B?M1hnbnNwV29OaithaGZNclFLR3prR0R2UXhMMUtQeXhUVnFKYkNrUUJZbGZZ?=
 =?utf-8?B?MXZSMmc1MStMVk9sSHV2VmFMdmJHWWd5NWhWWkIzeGhQcTBTWHBUcDRaMThl?=
 =?utf-8?B?TjlwMFZ4UHdYVjI0MmRyUlVSeDI1NWc0WWMyM21kUDkvMTI3RGdmRG82QXNv?=
 =?utf-8?B?Um8rbU1CM21Ib1ZrdlV6ZUhMWkJtTVQ5bk9yV094N09XMHQvd1d1YVd6VHBh?=
 =?utf-8?B?MDBPQlgxR1FKWllDUnh4Rlp5U2FKRG01TnJ0SFgrcCtDTW8xV3ZhZ0xiQXhj?=
 =?utf-8?B?b0tDZ09GcythVk0rQUlvcmpYaEhvM1F5bStubDNVWHpKZDJkaWxkVytrSFBP?=
 =?utf-8?Q?5tppV+XFYUG8bGFa63HofoxIxF02wqRPRUZjA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGNNSzErRFJUbU9hODdYZU9GbjZCdnNHbFRsd2d5dXF0M0NjQTVrYzl5REkw?=
 =?utf-8?B?TWliZ0hkOVN5U0pPSWc0RmlqeUpWZGw3bTl6TEZ2WnNrTTZvN2JTb3dseG5Y?=
 =?utf-8?B?UGR3TXpqU3pPOUZ1U1dPOTNyWTR1TGFxcWdVVXBFaGJleEgrTXYremN2TFMw?=
 =?utf-8?B?NDZNaTdMZ1daYjgvb3J2T2NOcnZtNEw2L2dteDg5Qkg5V0N3MGYxcVpJTGdr?=
 =?utf-8?B?L0hORWc4WnUyb3R1OGNxZjBKS3h1MHR3Vk5FQWlRVnBmOUhFTE1mcUdDQkRE?=
 =?utf-8?B?elByNkhwUjNjRmRJZjdiRFU2ZktGMFpCMm94MjlxWkxHdkVha0xTdWVORkdR?=
 =?utf-8?B?SnpEVHVqdVJyenIvQ2NDN2dCVk5SZDNIV2IxV2FCME12UlllVG10eDI1Q05H?=
 =?utf-8?B?MlRWMmxZblpvcUlEd2NQK1ZwenVwYlJpVXlOeWg4dzJ4QlBUTnYwNk1SZGdB?=
 =?utf-8?B?My96Y3hZWkNnbm85V1Arck1ZTnpOU0lpUjlPb09BM2g0UTFJNFpDYlorYnNL?=
 =?utf-8?B?TVBlOGJqNTRVZFdvcHRHRE1QR3hSTzc0eDVBUGI2N0Q5dnZJZm1naE4zM05Y?=
 =?utf-8?B?em10UFdlKzFYb3BwdXVYbklqeHY4bW5VNzEvVS9hSzJTOXM3R2JUQ2tWU1Ex?=
 =?utf-8?B?YU9MNVg5REFST3FDNFlNQkJicWNDQWw0OGVLYVhzcUlkWE4rZElIK0I5dUVN?=
 =?utf-8?B?K1d5WXdMWk9NNXNFdEIwdytiVW15QmVJRlM5dWhIMEdPYllYVWxQaERHM016?=
 =?utf-8?B?WFB3cVc5ZC9JU1c1WTYrMnE3R0MzdmhsSTcwaWhoMUFYVjUyeWtvdUpTby85?=
 =?utf-8?B?S0IzRldIMExRTGw0dm9ZQWVtdFBMRnpyVWNiNzZnelRFR2Q3aERxcVp2dTli?=
 =?utf-8?B?enBLMkJ0MUkxU3ZIY3JCQVFoRUsyUDFjdHN0YUVvK1V5MUNSY2hUSWlMWVZ4?=
 =?utf-8?B?ZHMyb212UDZJb3VVMWxuZ0ZIZzZOSlZORVo5V3QybWRTZVl1M1lQVkdmeU81?=
 =?utf-8?B?eU1PSDZlYVdKaVZuZG13NnVlR2hFNDhZOWFNdlN0cnRjUDlJZzBPUjJtNGE4?=
 =?utf-8?B?LzFrN0ZlNXlONnlOenJLYU9BLzJIZ3BSYUlTaWdubXIzZE43djFyOUQvVkRi?=
 =?utf-8?B?RUJYWm9ZbWNTMDhScjMrY1lTNjhlcGZiMjVvajVrYzBUcGVscEtrdWtNbjVo?=
 =?utf-8?B?N09FbXArZGZvekVjUHBwTEV6QmpxSVRjeDE4TC80eXlHeUg4TVNjL1owUjIr?=
 =?utf-8?B?eTZhR1NnZEZUK2ZXZnFYYUxHbGpqc0VCVW44c056NmpRTzdWV1RRMDhwZ1Bn?=
 =?utf-8?B?QTFsa21JL3JQaWdLcjRJSnlWbWM4Q0RnUmZHTUNMdDhpMVF5SlRvY0FOSlU1?=
 =?utf-8?B?QXlRZmpFcjlsbkZmTzgvRzVGNThWOUw4SjR0SmVKWi9uQzJpaFlYZW81V3cv?=
 =?utf-8?B?SUNmRjBMRE5VSWpCWS9VZSs1dzJ3emwyem5iQWRhL0Q3dEpVbmFDeFAxY09N?=
 =?utf-8?B?UmhUWWtRbDBSNXhCbkJQZzhPZmdmQmpTZG0yYWdIOFZuK01JWXdTQUhReFMz?=
 =?utf-8?B?Q0JNcm03NlNab3Q3cStkbnVWRE5FTGwzNzZhcWt4enhZenpNb0ZtcGlQYkVK?=
 =?utf-8?B?Ly9WUUxkK1ZEZGpzd2dBRnMydXdsdm5xTnU1REFlT2tSQ1dEUlg2Y2o2ekJV?=
 =?utf-8?B?TlB1S1JCelE0ZDRCenNiR09mSXNWTDJEbU1yTXF0Z1M4RDE5c3ZXM3BCcmVK?=
 =?utf-8?B?eC9jcXdpV25tZU0wZExYSUpETDB3eUJCSjB4WnlOQ1hyZ1Mzcjhpa05HWXJy?=
 =?utf-8?B?cEU3akxNeHJlQzJWRFk0cEdtaXhnMkNsSWt2S1l0MXRDcUZnQ2ZpaFFnZDNu?=
 =?utf-8?B?Z0gxWkUrVno5OTVvejRWSWhyOEtJdlMrczlyanQ3ejJvRk0weWtEVzBaQmFJ?=
 =?utf-8?B?cTJ4c1ZSbGlvcFlBV3VndmpIaVdrWDdGSnVNaFYvTHlGeDN4aTl3TkRFaHl5?=
 =?utf-8?B?Znl0R2hHMUZ0alppb2tUOURYTnNLSWRac0hPL294bnBUVDVhL0ZldGd1dTcr?=
 =?utf-8?B?Rk83UFdRb0JlWStsZzFyUlduWlZLZTNQN3BoZ3BxcGdmdisvbEFJL1FxZmZC?=
 =?utf-8?Q?wiPJUnwUFSqvP67C9tuVk40WY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff21f271-0146-4dbd-be1b-08dd78cac56a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 07:30:45.1109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3o4dCsboTKKW8qWrMIykOTAllHt3WXILB/dL0bAYZ1VjPsW5K8be67rcGrPfODPX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5936
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

--------------k3Sbn7YSVmluaFQCINjd3qdk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas,

Am 10.04.25 um 21:43 schrieb Thomas Petazzoni:
> Hello Christian,
>
> Thanks for your feedback!
>
> On Thu, 10 Apr 2025 18:29:12 +0200
> Christian König <christian.koenig@amd.com> wrote:
>
>>> Many UIO users performing DMA from their UIO device need to access the
>>> DMA addresses of the allocated buffers. There are out-of-tree drivers
>>> that allow to do it but nothing in the mainline.  
>> Well that basically disqualifies this patch set in the first paragraph.
>>
>> To justify some kernel change we always need an in kernel user of the
>> interface, since this is purely for out-of-tree drivers this is a
>> no-go to begin with.
> I'm not sure to understand your comment here. This patch series is
> about extending the UIO interface... which is a user-space interface.
> So obviously it has no "in-kernel user" because it's meant to be used
> from user-space. Could you clarify what you meant here?

Bastien wrote about "out-of-tree drivers" which is something the upstream kernel explicitly does not support.

When you make that UIO API and have an open source userspace driver then that is probably a good justification to do this.

What the kernel community tries to prevent here is that people start using the UAPI to write closed source drivers in userspace.

>> What you could potentially do is to create an UIO driver which
>> imports DMA-bufs, pins them and then provide the DMA addresses to
>> userspace.
>>
>> But please be aware that DMA-fences are fundamentally incompatible
>> with UIO. So you won't be able to do any form of synchronization
>> which probably makes the implementation pretty limited.
> Could you clarify why DMA-fences would be needed here, and for what
> synchronization?

In general DMA-buf is an interface which enables you do share device specific buffers between different drivers as well as between userspace processes.

For this to work with for example cameras, GPUs or RDMA NICs you need to some kind of synchronization primitive, e.g. device A can only starts it's DMA transaction when device B has completed his.

The problem is that this synchronization approach is fundamentally incompatible with UIO. See here for more details: https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences

> The DMA buffers allocated here are DMA coherent buffers. So the
> user-space application that uses UIO will allocate such buffers once at
> application start, retrieve their DMA address, and then program DMA
> transfers as it sees fit using the memory-mapped registers accessible
> through UIO. I'm not sure which synchronization you are referring to.
> We are not "chaining" DMA transfers, with for example a camera
> interface feeding its DMA buffers to an ISP or something like that. The
> typical use case here is some IP block in an FPGA that does DMA
> transfers to transfer data to/from some sort of specialized I/O
> interface. We get an interrupt when the transfer is done, and we can
> re-use the buffer for the next transfer.

Well why do you then want to use DMA-buf in the first place? As far as I know what you describe can perfectly be done with the normal UIO memory management interfaces.

DMA-buf is only interesting when you actually want to share something in between devices or between applications.

Regards,
Christian.

> If you could clarify here as well, it would definitely help in
> understanding the shortcomings/limitations.
>
> Thanks a lot!
>
> Thomas Petazzoni

--------------k3Sbn7YSVmluaFQCINjd3qdk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Thomas,<br>
    <br>
    Am 10.04.25 um 21:43 schrieb Thomas Petazzoni:<br>
    <blockquote type="cite" cite="mid:20250410214307.361e373f@windsurf">
      <pre class="moz-quote-pre" wrap="">Hello Christian,

Thanks for your feedback!

On Thu, 10 Apr 2025 18:29:12 +0200
Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Many UIO users performing DMA from their UIO device need to access the
DMA addresses of the allocated buffers. There are out-of-tree drivers
that allow to do it but nothing in the mainline.  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well that basically disqualifies this patch set in the first paragraph.

To justify some kernel change we always need an in kernel user of the
interface, since this is purely for out-of-tree drivers this is a
no-go to begin with.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm not sure to understand your comment here. This patch series is
about extending the UIO interface... which is a user-space interface.
So obviously it has no &quot;in-kernel user&quot; because it's meant to be used
from user-space. Could you clarify what you meant here?</pre>
    </blockquote>
    <br>
    Bastien wrote about &quot;out-of-tree drivers&quot; which is something the
    upstream kernel explicitly does not support.<br>
    <br>
    When you make that UIO API and have an open source userspace driver
    then that is probably a good justification to do this.<br>
    <br>
    What the kernel community tries to prevent here is that people start
    using the UAPI to write closed source drivers in userspace.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250410214307.361e373f@windsurf">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">What you could potentially do is to create an UIO driver which
imports DMA-bufs, pins them and then provide the DMA addresses to
userspace.

But please be aware that DMA-fences are fundamentally incompatible
with UIO. So you won't be able to do any form of synchronization
which probably makes the implementation pretty limited.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Could you clarify why DMA-fences would be needed here, and for what
synchronization?</pre>
    </blockquote>
    <br>
    In general DMA-buf is an interface which enables you do share device
    specific buffers between different drivers as well as between
    userspace processes.<br>
    <br>
    For this to work with for example cameras, GPUs or RDMA NICs you
    need to some kind of synchronization primitive, e.g. device A can
    only starts it's DMA transaction when device B has completed his.<br>
    <br>
    The problem is that this synchronization approach is fundamentally
    incompatible with UIO. See here for more details:
<a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences">https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences</a><br>
    <br>
    <blockquote type="cite" cite="mid:20250410214307.361e373f@windsurf">
      <pre class="moz-quote-pre" wrap="">The DMA buffers allocated here are DMA coherent buffers. So the
user-space application that uses UIO will allocate such buffers once at
application start, retrieve their DMA address, and then program DMA
transfers as it sees fit using the memory-mapped registers accessible
through UIO. I'm not sure which synchronization you are referring to.
We are not &quot;chaining&quot; DMA transfers, with for example a camera
interface feeding its DMA buffers to an ISP or something like that. The
typical use case here is some IP block in an FPGA that does DMA
transfers to transfer data to/from some sort of specialized I/O
interface. We get an interrupt when the transfer is done, and we can
re-use the buffer for the next transfer.</pre>
    </blockquote>
    <br>
    Well why do you then want to use DMA-buf in the first place? As far
    as I know what you describe can perfectly be done with the normal
    UIO memory management interfaces.<br>
    <br>
    DMA-buf is only interesting when you actually want to share
    something in between devices or between applications.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:20250410214307.361e373f@windsurf">
      <pre class="moz-quote-pre" wrap="">If you could clarify here as well, it would definitely help in
understanding the shortcomings/limitations.

Thanks a lot!

Thomas Petazzoni
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------k3Sbn7YSVmluaFQCINjd3qdk--
