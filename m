Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA05C90C373
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 08:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE9310E1FC;
	Tue, 18 Jun 2024 06:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C26lvEew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6DA10E1FC;
 Tue, 18 Jun 2024 06:20:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giwO/e4jaCA+5HC8wKpUpJ8dvxeeTHTzDXaYIDqNI/i1u31ChY4BCWIfoBmFUOBRkVOgQvnXvcnXToKvtUS2QXJpy91+vp5YtTxoPHqnIpxO9/aCK3QRj9LdZmSSkvHM4SIs4uJ1KxPlquterCpre4GjQJ0g2uUCFscNddCt1aXhFOaz8H2PE8Lj0utlHAkWnesm8xSvXOpIRSoKgvN8TnBgNlRtMsHVknVYLc63NTfgpaFIio3yjICxf4UDa+rsN70NRxBcqCEhkjbKsh+zR9Q/FfYqIj2+cpu+xEAPrDKg1gDTWGCshf5MSdHkYueGyrZxB1UivuBdrPEKL91TdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lri4UcfKmblGQnpubDrqybCrRWBN9fHjln92BS70qIg=;
 b=Tr/X50I2Rx7t0guhyD+OUVWn5bfmkJ1DrTryEdGGkB1+HDITSX80FmUc0djUk05cTRaCbOA6fRV8VqvM5cGyvPhePo+Sxy2Rzc5YR8Zs6nrjDj8khcNFzvCOGzzzLwnTa8EHL7UCy16q7TKFvnUvErNT2x+k3jq7Y/dKctVEoehcClkEquXfmOgfLKeShNsDPd36Ct9eVifN0f0sEl+6VYTyXvFoDQERywXierW9mprrA2PkbBsUB5ZvFams5PC0TQMKe6mfpeEKAXKjCGjrswZs1JL0jQY7lJARmAqV6BcPgovToueMelPXrbMk3Esq9JX3Sln71xZa48c4roINiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lri4UcfKmblGQnpubDrqybCrRWBN9fHjln92BS70qIg=;
 b=C26lvEew3yKnCeLHHOsd5F/28QspUvZeU6WUwikRGhnRH/8Th6Q7dbbbDghjK4BoPhjNfFY3Aq9JT1p2Nk88IxDccWiGQ65A9v1IRY0b7dr57t5QQxlKtJife3moLxW0a96jJ0yTumZlTLR+YYwy1d+GAWMiI8xpsVn8ZesAkpU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by SN7PR12MB6692.namprd12.prod.outlook.com (2603:10b6:806:270::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 06:20:34 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%2]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 06:20:33 +0000
Content-Type: multipart/alternative;
 boundary="------------ylqG0tZQq5fnxMadofUGSRhi"
Message-ID: <a57fd6cd-d9e4-4ac0-8d53-06d6149e196a@amd.com>
Date: Tue, 18 Jun 2024 08:20:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: make duplicated EOP packet for GFX7/8
 have real content
To: Icenowy Zheng <uwu@icenowy.me>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
References: <20240617105846.1516006-1-uwu@icenowy.me>
 <20240617105846.1516006-2-uwu@icenowy.me>
 <88337509-3ad7-47aa-b70f-5294f7f1e486@amd.com>
 <b4ebdbce2f44c06806a650e72b1b6eb9a16dffe6.camel@icenowy.me>
 <09fbcd1f-c7b1-47e3-9146-17f8189978a8@amd.com>
 <e88d4722fa3bbd7104b140debdd85cb212628944.camel@icenowy.me>
 <d44651a7-0c07-4b84-8828-f1d405359aeb@amd.com>
 <73597116d4f004c5f75cf4f13da1af405ea8da8b.camel@icenowy.me>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <73597116d4f004c5f75cf4f13da1af405ea8da8b.camel@icenowy.me>
X-ClientProxiedBy: FR4P281CA0305.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::14) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|SN7PR12MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a58062-a7ab-4e13-6413-08dc8f5ec288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUxIeXRPMVAzeC9HcDh2QjlaVDRvcUJYVFZXeTdjckFEUEo4dGVZKzYrUXE5?=
 =?utf-8?B?Q08zTnVrREhaVjhPUTVHQ2tMQU1GUzlCRVhUWFZEUDVBSWRMSkQzc29XbWMx?=
 =?utf-8?B?T0VGakZycktvVllVMHpra1ZyOHhMMTJGUDdLRFN5RVNiYlprcVFxSGhSZ0dl?=
 =?utf-8?B?RDdiSy84ZkF4dEJ6NVpQbi9UUWxKcG9FTzhvdExmUDFTdFFuSk5ITkJGaXpJ?=
 =?utf-8?B?VWpLelpiTEdmSlgrTjhZM1hnWXVzQXo4cnE4NTd0VU0vc0tRVEJmUWdLUmRL?=
 =?utf-8?B?eWNGMHB4bWRyS0lVVUg4RG41R3JFR3VCWENBZE94Q2ZWdVhPbEpIdFFEWGdj?=
 =?utf-8?B?MmQ2ZUFvMXRQMFBDNjZVOE1TYnRRSVFZYjhiNlRmakl3cjQxK0dqeHgvQzgz?=
 =?utf-8?B?THkwV2haNU51TFFRTUZZUm9LR0tncHF0Nm9aWEtTUHA3TEFML21mZVdyRTZq?=
 =?utf-8?B?UHFMUEZEaGVaVFRSN3oveHpWcWc1bjhBa1JwL2lLblVSbEUyNFREc1FzU0E2?=
 =?utf-8?B?OWlibUdaUHJFRHRYekVDSjM0c2FNSGR0WXMwcDJ1WWgzNVVGdUw5OHgvRU9T?=
 =?utf-8?B?WmFSMHVBdUlIZk1KNEVEeDM4dlRIMFNEaGx5b0ZFNlpjWjNtMnZpalkzWldO?=
 =?utf-8?B?dXVZVjFxNVV4eUZXVzVHdzFnOXByeWxIZlh4YjdQQ2kxaGlLQnNIZSt2WlZo?=
 =?utf-8?B?Y3JheldNM0FPcmw3SXByVTFHWWFVbGowZVBteEw0cHVhWExBMlZEV3Y4TnFH?=
 =?utf-8?B?d2ZNaGMwcFZVcVE5Q0NzdDNBdUNlUE93VTdxczVxYm9LamdQNkZjS3BlSTV1?=
 =?utf-8?B?QWZSVVpWbnVEVk5WdnB0aHhHdzRpTjZqMitzTkVFaWFhL2xHVHNmWEJlKzRk?=
 =?utf-8?B?MUV2akY1NlVlSmRUY0VLL1BRVm02QzVtNWxId2p1RytSMkd3YU0zOTRNWmts?=
 =?utf-8?B?UTBsbnRrZGs3Z0Rob2hHblFmZVNOZktiK0ErVEh0VnVUVTV2QXdRdjV1NTFs?=
 =?utf-8?B?VUE0elhjeWdleXpnM1FyY0FsYnBzS2lMT0ZuWENuOW5OZDBWRXVlU1JaaGZ4?=
 =?utf-8?B?NjVuQkVRbFBMTkRuUkNmQkJLc3JQZExFZ0w1YjVEK1NLb0hiZ2Z6UlFhQUc5?=
 =?utf-8?B?SEF3dFBqYkZYUmhZQVMrNUkzc25oSnJrN0N0QUN4K2M3ek1nTlZCSGJMUVZL?=
 =?utf-8?B?V2phYmE1aXJnVDRick1ZTUk0aW9kSm5zNklpbFNWRFovcnp4azlyYmltVFZW?=
 =?utf-8?B?bWo0OVVNek5jTitJbngyRG52TTlISVRBLzBsMXR3ZmtCSkhhVUVmS2xCd3Rj?=
 =?utf-8?B?d2FIVkhtcEEyR1kvRXc4SGR2emd2ZHZ4eWtHYTViTXRzL0x5UDNDVDdVOVVp?=
 =?utf-8?B?S3BxTnhXK3VKdXRtTTRpL1B6Q2M0a0svaFlqYVpjaldMNFFMRjBxdHQ5T3hS?=
 =?utf-8?B?aTRpNFdSbXpDWlowd3kvTFNmMXpuUlNHQVFlQklmRHZZaDVzbDBQQUoyekpn?=
 =?utf-8?B?YTMrQ04vbjB1QkhYczl0dHk0NWNsOXpVaExKa3RHeUgvZzdDTG4vVXVzaTIw?=
 =?utf-8?B?NkZkYW12RmJiMHZsQU50aVZ3M0xaOUdwNXdQZ2syZnZGbkRNL3Q3Z21zdlNW?=
 =?utf-8?B?eHYySDQvTFZBUlZYT21nZFFLeE16N2dIRW44cnBTbFhRSzJIOXRINkZIem9V?=
 =?utf-8?B?MFZCd0w5aE8xY1gzazhUWUFhdXE2Vy8yZ21kaVF6R1ozbWJNeGU4M0ZVaGMv?=
 =?utf-8?Q?9L00Di7AgQe3IAPODv0BrQEXNFo/xWVIu3My76/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVR0ZVozL09UVnhtQVRialBxNGpsVjc3QWl5SVdVd3pRY01ZV0Y2MktlVTNo?=
 =?utf-8?B?a2kwaXh0M1pBdGpWU0hPU1U4dVp2eUVrWCtGR2x1UGZZRFlyUnoybkJYUTMw?=
 =?utf-8?B?UiswQ21rdjFMQTYzWG13cVcvUDJyRmtCYVRWVmNrOFhXZElCNm56cDgzYm16?=
 =?utf-8?B?aDdjRjd1Nk4rb2xteVU4Y0xxeVBlMG9LbVVPakliNGxoRld2VWJUMVR5VE45?=
 =?utf-8?B?d3VrQW93K0JlUGU2TzUxTXJrNk82TnpHc094RzVReVF2UkR2TlNUT2wzckw5?=
 =?utf-8?B?SnIzQ0pwVjJOei9KdWhHS1ZIOTF5UEVSSmNIeG0xcmZVWUdlZUxEcHFqNXM3?=
 =?utf-8?B?bmJqaUI0R2VVS2cwZG9nZVBaYUFWUWlkMnBNYk4vZ2k5NmZPMWZseE1YRmhX?=
 =?utf-8?B?QWR0amloci8vUW02TUpxcFRRd3VCZ0I0eTdCQmR4VnhpUUh2NDB1TDg1aUM4?=
 =?utf-8?B?L0hRYnBvdkt4aHFLRE5SVHpGdS9JVExWNGovZm56UWZlR1liMmlFVDg2MDlO?=
 =?utf-8?B?QmNTd3NyYXlZWGZlZHVLT1g3RXNRTU9sTk1jTm9xblNvQkZvcVhjNFYvMlRB?=
 =?utf-8?B?cVNvNkpvY0hISTg0cHZ1WWZ2eTdLbE5ValpEZmJpVmp5S0pJMVhYbDVLVmY0?=
 =?utf-8?B?eDNrSW5YbENKLzBYSmo3R0tRbFdYU2d6VWVYRDBLemJWMXdYMm5hZHhpSENQ?=
 =?utf-8?B?Snc1YUxpZEU1cVRaTDVmWm1Vc1RrS2N2OGRmUGUyZ2djME9PU3VWL25yN2xV?=
 =?utf-8?B?dXlzRU1RQVVDK0RibzRqcWY0YjdYSmVrSDlmbUpUTCtDMGgrRHNLV3lFZzcx?=
 =?utf-8?B?L20ycTJvbGhrYjF5ZVBUS0NiTXhOQ0pxdDJXTkxnalVMdU1nUjgvVFBlMXhm?=
 =?utf-8?B?WDJrdTNoUURxbm9YWHpheGNHNDAyQ0MvbW5JUnFNdHpZSFpkRU5qb3ZBQVNa?=
 =?utf-8?B?Q0tOWmIxRXcweGxKUXBHSTNrdURRbENHM3ZYN2k2Vmt3QkptY1hOTWQ1RVNi?=
 =?utf-8?B?ejd0YU1yUjgzRlJBQy90S3NUS1o4clo0UTdoSjFRVEl1b2VsL0tOUWdPTi9V?=
 =?utf-8?B?bkllcDlNNUxsU0pSM1hGdVI0Y3ZpMkdaelJwR01jKzIxYXZsVVdXZEJteWow?=
 =?utf-8?B?bEUrRkpndmRBdFhNNThaVzVkdEV4VGovN0lLbkkrK1JGNmt1L1N1bVY4T0ln?=
 =?utf-8?B?S2xkNzRpRVh4RDR2VjFudjZ2dGs3aGNMaGFpalJFMmgrL1FRS3YwTmk1cW5p?=
 =?utf-8?B?T2FMQWh4bFZVbFljenFTbmRaZ3hnUlBJb1A2VnYvQWVVOHBRbUlPQld4OGZm?=
 =?utf-8?B?aVBnTytSMU1BMlVBWjhHeC92d3RwMjljUzZob291TFZIQkdGRzdKSFlMdUlR?=
 =?utf-8?B?c296a3J1Y2hjT0NCZkNwRkgwR3JUcUFDKy9WbGViUDF0WTluVk1vQUt1a3M0?=
 =?utf-8?B?d3FXVExVYUhkTlFZbS95YUU3OFZrN1kydGd4SmxXS0pCWGZsdVN5STVOWUFq?=
 =?utf-8?B?dlBaSnlETE0wUE0vRUd3dTYycTFBeVU0VXVsbFZzY0RtNlRaelNOVG5qU3ZM?=
 =?utf-8?B?S0Ztd1k4M2RJUi9iTWVpMkRpUGQxRFhKZmpWbGdpVDBmcDZrcU1ramRXY1hS?=
 =?utf-8?B?ZXJSS0NmNzZ6ckhNRi83UmUxOUFzQXRza3NPQUpKVmhzdzRYa2JxRzdmeHZT?=
 =?utf-8?B?QVpkTW5CTFYvL1JVbmVMVW5CTWthZXBsaFVKNEQycTdSdFh3ZFFsZSsydmZ6?=
 =?utf-8?B?SVN2QzNBenNadFFUVWRrRlhpNXRCeVhpd1FaOW13dmVLSlRvbGwzbU94MkpU?=
 =?utf-8?B?ajR1YW5USHB1SC9LN0g0bVI4c3lhZmhhUzRodEpNbWNQdGRiQXZKcG5HWXh4?=
 =?utf-8?B?b0lhR2VqRFR0OFNkUVNlRVRQQ25sekJNWUpSV2NabFZaM1NhYndiRitRQ0Ry?=
 =?utf-8?B?VlRPeVp6T1JwcHV5UDl3eElPYlRlU2JNS3dJZFlkM2UvVVIxVFRSTHpxWmVT?=
 =?utf-8?B?NkdidUxhODhsK0trOEcvTzRYU0FlMmdoUnlBSlZqTm9BS1drRTNWdENZRUZs?=
 =?utf-8?B?VUNWaDZvdjIwVHZ3S3U4ZU9KOVNIK3pnaFJPYTE0NHEyN052REkyOEZuTElq?=
 =?utf-8?Q?ku/+wKhqkmWJlxJMcAFzsBR8n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a58062-a7ab-4e13-6413-08dc8f5ec288
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 06:20:33.8222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5DbPzeARTPV2krhn1To3pyU7bo99LmAo8bDYehptWwgTWxuZZoThdlolE4uaddg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6692
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

--------------ylqG0tZQq5fnxMadofUGSRhi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 17.06.24 um 18:09 schrieb Icenowy Zheng:
> BTW is there any operation that could be taken to examine this specific
> workaround?
>
> Is there any case possible to reproduce?

No idea, I mean that's for GFX7/8 which was released between 2013 and 2017.

My educated guess is that you could create a test where you write 
something to VRAM or GTT with a shader and than in the interrupt handler 
try to observer if you can see those values with the CPU.

If those values aren't visible with the CPU then you have either a cache 
flushing issue or your CPU and/or PCIe root complex is incorrectly 
reordering writes and interrupts.

Regards,
Christian.
--------------ylqG0tZQq5fnxMadofUGSRhi
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 17.06.24 um 18:09 schrieb Icenowy Zheng:<br>
    <blockquote type="cite" cite="mid:73597116d4f004c5f75cf4f13da1af405ea8da8b.camel@icenowy.me"><span style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap="">BTW is there any operation that could be taken to examine this specific
workaround?

Is there any case possible to reproduce?
</pre>
    </blockquote>
    <br>
    No idea, I mean that's for GFX7/8 which was released between 2013
    and 2017.<br>
    <br>
    My educated guess is that you could create a test where you write
    something to VRAM or GTT with a shader and than in the interrupt
    handler try to observer if you can see those values with the CPU.<br>
    <br>
    If those values aren't visible with the CPU then you have either a
    cache flushing issue or your CPU and/or PCIe root complex is
    incorrectly reordering writes and interrupts.<br>
    <br>
    Regards,<br>
    Christian.<br>
  </body>
</html>

--------------ylqG0tZQq5fnxMadofUGSRhi--
