Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877099BF10B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 16:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE9D10E718;
	Wed,  6 Nov 2024 15:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O87lEkDj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A1110E707
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 15:02:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiTgJRz33a9KGjhk+Y1hdId0aavsDlFEL3QWqraviErIgOMh72Hz0aurneMgcy8x02vzLj42YkDhE4D3Tu8xMIFeDviNMNFy1ygMvF9/J4s42wFg94lCeukS2MzhZ+qaQ24HyDemMMKte2LUUTOZmEPB01AKOQYsDUNDOY/9gCAi9/CDh6xOZPv2RvpkfldVoZjxgPW5brbup5TpSSan/lDkh/iFMtEYyHFFJzHdLLPh+tng91rpF/n8UToKLfDTQWu5fvqOrUwiXm6+CRuogQPj5RpTFTJpVfINPF1UDNwTAJTVYrBU+VwvVPUxHC1MYzRgxtxytPh527f+dP6veg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iz54qMHtSVdxPERFeF6eg4cyCgODhg+PSvWTNncXQFg=;
 b=HfA9i0Ur6v4exoiBCx2KpNZCBYVX7uQE6+1XPWnO0ULItKQb4fdPiH6/TcQpq9TLLvt+V4idf3TD3rr1TcFZms7b3pHJ85/wrwI0W8Wg6/gCorbyUHnC3L4TFEKDWg+OcBr5uEhVsoMwKelORcKaf9PU6tNThegdM2gSL5C0Fwf4cxzu/ArSOAIJG0Ooq/TtdTWT7rovs0fir/40T1LShXA+OKGPLqc4UbopW5gXqZecoDi6zBwuUVUHHBvcghJFHvjXWMe3F2Gi+fu4fFyaayP58XKQ4O+sXPWE6mbR72/NphcHWCciwYaCpREt8CzTDQLWhR5+RMkxsBCCk3UwCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iz54qMHtSVdxPERFeF6eg4cyCgODhg+PSvWTNncXQFg=;
 b=O87lEkDjDTgziifVgEbMltZnIx6nhE+1gY+0bsuf9d/zLz/PEqvc+ZhwDl0FtPowZBjq3ZFFXVi1C13PMuMFcmq78aOCmdST/kgt0kyr1ez2XbFsWKOAXQ/rn+ko3lAKXz5XxnrwxEkABxZ2JlKor6kECuKF8YE7g31oLPJP7dE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8134.namprd12.prod.outlook.com (2603:10b6:a03:4fa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Wed, 6 Nov
 2024 15:02:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 15:02:21 +0000
Content-Type: multipart/alternative;
 boundary="------------MRzmGnxC3aRTQnavHgkQeYr2"
Message-ID: <743080a5-06e4-4537-a408-240a47982b12@amd.com>
Date: Wed, 6 Nov 2024 16:02:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/syncobj: ensure progress for syncobj queries
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Chunming Zhou <david1.zhou@amd.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 faith.ekstrand@collabora.com, simona@ffwll.ch
References: <20241022161825.228278-1-olvaffe@gmail.com>
 <900f8658-726c-4034-90ff-398e6c57ec47@amd.com>
 <CAPaKu7QwSq7a-ipSOdETFEBGMu4J4ud1SqxDfPp8bNMjCMM5RQ@mail.gmail.com>
 <CAPaKu7TB30wvDvMW2FcYNcxjfDkOje358JNnRr2jJf=99-h-rg@mail.gmail.com>
 <301110a2-c004-4385-9231-b9354904b5e0@amd.com>
 <CAPaKu7Tbp1_sd7Eqj7tkWBJBVPSZYo6uYD+7jwP=CwM5YYauFg@mail.gmail.com>
 <20241106091436.48687e86@collabora.com>
 <048c2dca-48fd-4627-ba0c-bc9daa17ac29@amd.com>
 <20241106141245.0a4f88be@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241106141245.0a4f88be@collabora.com>
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 628f2df0-5271-4e78-fa5a-08dcfe7403e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDN4N3k2NmhnTXU5K2lweC8zLy9uSEk4Wi9hZFRzWmFSRGs1K2pkZGgrdEhW?=
 =?utf-8?B?UlpMVUhVQnNLVHhYOWo5MFVYdDVZdTEvK1J0RFhyditMQkJqNk9TOWpuSVdZ?=
 =?utf-8?B?S1gzakE1YTZ4MWFJN0wvZFhVbEYxWWV3bllmaFNjRlc1OXRiQTBDbzFHMjM0?=
 =?utf-8?B?U2l2SUJnK3FIYmFKQnNFRElOZzhNU1JLeEZPcFEvZUErYzA4NUlJU3ExWDk4?=
 =?utf-8?B?dmFTcmZGV2RQMForTUVRWjJrSkoyU1JmS09WTXdiMjZKSUZaYjducDRvTFdy?=
 =?utf-8?B?VllWdDdTdDJQZWY0RnlJNEtpbWRlb3RkMm5EdUVyZ1VIWFdpR0QzcXdQM2Zu?=
 =?utf-8?B?RWZXOHQ0ZnZJckhkR3dMZlJpMVp3MEgxT0NoWHBrQmtmQmJlUzd4cGg0M25z?=
 =?utf-8?B?d1lwTUFxRy95YkdYOUpybTVOYS9tSFhMSGt3RnRjb3BmNDhySlZ3dGtqcjNm?=
 =?utf-8?B?aDZiOS8xNkRLTVFqYXJEY0s0N2wwMlczYkNtQndlVmR0Y1JvZTRWU0pJL01Q?=
 =?utf-8?B?djh4TGZiRktyanh5ZUVNbVgvN0loNWtNT2ZJOUduaFdEQmY5aEppYXdTWDdt?=
 =?utf-8?B?eHV3a1Z2L1ZjOGcyR3VoV29nSnVkNGQ5VnFWZEVwSm12Szd6a3lOWmJXZ09P?=
 =?utf-8?B?YVArcWkrS0Z6b2RpMW1MR3FGckR2bWdMV1UyYXRST2E2RWppRjRJSWNTMUtO?=
 =?utf-8?B?UVl3V01KWEZuVHJSSU15S1FOeTBFQ3FjdHVvaFhMSUV0ckx1b1h5WDdMSkJ1?=
 =?utf-8?B?bmg3UHpHSUFCemlTSFM3M3d2S0psV0hnRTFUaE9KNUpPWUlSc0RNUkttVEln?=
 =?utf-8?B?ZCtBZU9YQk9WNk9nblJGNGxETGxQSTl6azdpd2tRTGo0MzdKRmpYMHgzenNu?=
 =?utf-8?B?NDdGQldsbjV1QVg3dk81YXlFWStBNE81d0RsbkUxWU45ZGRDa0JtQ2tLaWZV?=
 =?utf-8?B?Sm9ZOEg4UXd6ZGpYVUZIbkdwOFQrUzlKZ2ZjdXIrY1ZOQm1UemFGMDY2WFBt?=
 =?utf-8?B?TmF4VEpLUEJQb1BoaVhuOW05aGxKTEJJeXp2a3NobkErNzdkbWgvN05kdkV0?=
 =?utf-8?B?WDQ5cUJmMksySm5GREhpWVJWUmFUN3VOdnhLWUNHVE9hRmtpR1NPYUtkcytG?=
 =?utf-8?B?SFJKMzJtOWZOYW9FeW5FaFYwZGVJNGRFd21FNFcxZjBvVS8yVlUrcVJrWG44?=
 =?utf-8?B?T05pY1JCdzZTeHgvNU9WUUh6TTNaazUrNXloUHlWT3p5T3FEVFhOUDQvMGFn?=
 =?utf-8?B?ZlNFajljUncvOVhIbk1qWTVCeG11TUZIblU4ZXRvTlZGaGZ1VXk2eWVRZUg4?=
 =?utf-8?B?VU4yUllyYmluV2NyRTN5clF6NURDK1ptQk41SElYMVhhMi9ZUnExUnVBakQx?=
 =?utf-8?B?VnEva1NUN0dGdnJPWjBzNzdOWVpCV1NqMXcrVDVXZ0ZVNjB4M1J2VGg3Snlm?=
 =?utf-8?B?bXBjcFpyZmZzMUJPRFNzS0hacnN6dXNKSkdTT3FxZzYvMWhFYUlhUTcvZ2dS?=
 =?utf-8?B?STRwdlh2S3R1RnFqRk5sU1ZiL3FjZlo4R0NoOUNHem9wZGtlcUJwa0dzWGJn?=
 =?utf-8?B?NFZkSU8wbXlNSDRhMUVKTVZoa3I3amJreVE2anBqQ0JLNStvTGpMOHMzMjJo?=
 =?utf-8?B?dFFMZDZMT2p2R0FmMjYwRWh2TnpGei9TcjEySnZtQ1JBNmZ5Vm1nUjZESEdJ?=
 =?utf-8?Q?7N8q6Lo8WC1Ndlxk4BgZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3RWMENVdEJ4ZUlKWVFNR0l3M0hJd0ZWckszNVFHeCtJSGd3amZPWUQ1MS85?=
 =?utf-8?B?ZUREeDM5SzBGUmdpVHZqc0RDdW42K1hDOGlYQnNxcWlYdlRvTVUrblhDUzdG?=
 =?utf-8?B?VFoyQlk2ZDluTENPbG10aGdFeEJManZiTXdKUDJXUDZuVUtkbmhmenNYVDkx?=
 =?utf-8?B?eGFrOVJWMTZqZ0NJS3d5azMySDZURkF5UEJtNWg5SUoyMFJ4NFZERk1rdFM4?=
 =?utf-8?B?WDZmN04xVjBhNDNTSExoa1ZOMkNWTjhTdHVxTWp6QWRVQkVvM3czZEpKbEMx?=
 =?utf-8?B?djNUZmlOTzcwRjZIb3Z3dnk2ai9FNjgyWlk1TWwvWGxoRFB2TlA2MzBCc0VW?=
 =?utf-8?B?Vk0yTVJxSlpXb1o3bFpPWFZLR0s1dkpCcUMzZUxFWE9ka1ltL3FCR21IaTJv?=
 =?utf-8?B?b1M5Q0dwZGhEWXMwQ3lHb3pITGJKV0wzODNNeEpkNkxHU3JVY0hwTXhyWTA1?=
 =?utf-8?B?b2VQMDN3OUJMUXUvYXU3b1B3UDdwUWJHc25FT09TYmZmWS9JandCK01rZHRG?=
 =?utf-8?B?U0xVdVVlZUJNQmoyMGVVbk9SaVBkZ1ZEckdCcHpGZGN5R1F0VlNKUnJKZkU4?=
 =?utf-8?B?N050eTF1WGc1cmV6RjlxWnk0dFlqMVl3RHd3TU0vcUsvMGJ2VkoxR256cHJy?=
 =?utf-8?B?RGlWb2ZJaUgwaTdkZjRUeU1jTVpRYmsvTWk2NDBzcTVLNDhNSTFVblBWTUFY?=
 =?utf-8?B?S2ZpdFk0bWsrdzl2OStvZEpIM3hRYlZHMURjdnBnSEZjYmp1THlWaGQyK0Ny?=
 =?utf-8?B?cTEzMHF6YzRYODl0V250MmNzdUdUSUk2aHJOWkpReGtYeFpmOE5IRGJFcUJ3?=
 =?utf-8?B?ZDZMandPWCswQ1Jkb0NFbWRjRGhFeUtVT2Qwd3dydkJQamk4MWdSVG9iWHU1?=
 =?utf-8?B?a2RGNXo3YlNkSG9XU2dUL0hVUTVRYjBQL0UvdW9ndzdIa1RNaTNUc3VWTDl2?=
 =?utf-8?B?SG01Q0Y1dm1GTnhQcWtsMnRMbE83RkpZNUJkRFdnSUVNb25VZFpTR2UwVFhR?=
 =?utf-8?B?eGpDbTMxQUIrVHlqWFQzSm9hWCt5bENEUE9jalkxcitVdk82VDRhTnRWVUow?=
 =?utf-8?B?aWhqcGprNEwwaW0vc0NEY1FkSlRldk16dVhKMEN4ZU10ZWVSVTZzNEF4SmRo?=
 =?utf-8?B?Z1d3WVlDLzJSYnp3UnVVWVU0MkZ3OWpFK3Jidm9UMjFZT0djVEpVd2hnTGc2?=
 =?utf-8?B?WndvNnprZ0hBcmhRcFBHQVI1dmI0QWNkbDJsWlJQaUtQSzY4dDJLRGdXVmRG?=
 =?utf-8?B?MCtxUzhpUy9xUmlERjZsSDVFNHhVNytod291Ly8zaGJmcXQ3L0I5NWdCN1R5?=
 =?utf-8?B?NWVUait1NTZscTQ3ZkRYNk5PakcrL2N3MUswNFdGQStLc0cxVGpFUGxCRE9C?=
 =?utf-8?B?WnBnOXdmbXBrZ0U1TzJYNkkvWmw4TkZLeGZheTV6cDByeWVFbDVLYURlc3M2?=
 =?utf-8?B?M2EzMWFPYWdBZC96SlpMTHlxMFlML0VzT21Jamgwdjh3djI4c002QXdXMnMw?=
 =?utf-8?B?UXZ3OG9JWjRNdmVTRmtUWHZOQk9ISnZCWElwYjE1NFo0SEJDQ20xc3d5b1Bi?=
 =?utf-8?B?N0JNTEliM2JIc1hxMDJhczdoekY3ODdIbkhRaFltYUJCQllTaEgya29rbmhV?=
 =?utf-8?B?aXp6Zkkrc2ZCQTM1Vk5MOWt2NnJabXV3SVMrakY0NStubStpQ01YZ1M1Tklq?=
 =?utf-8?B?ZHc1TjJwQ1dHVWhsQzdxQnllMTlMZGp3S3cvL1o2QnY1U3pJOTZoRG0xZWRi?=
 =?utf-8?B?akI5WkxuWS94VlUvYUhLSGZzT2ZFbkFkemlxT016eE4vZVl0WTFVUGkyM1Js?=
 =?utf-8?B?dmVlZTJXSW5DVWJmWTRXL3FGZG5xUWNJRW5ReTJnN2NsOW01dy9DSEpXTUVD?=
 =?utf-8?B?dzhhZFlDMWFzUWo2MEd6akU0SkJtZml2aVJlTDFFVWxCL0cvOXNzbjdpZlNh?=
 =?utf-8?B?OEtPZFRTRHBGQ0MyM1dMU3Bjc252VnExVWlyMHFST3pjTWZ0eFUxY24vSjNB?=
 =?utf-8?B?WE1wc2JSK2N3WjRhQTdNNXpRUjhGM0xSWVUxSVI3QXYrU2cyNGM0YlgwdVhv?=
 =?utf-8?B?S3JTNGtvVklRSm1ESzAxWlBQd2lOM2ZsK2hqcTcveTg5VkxjZ1BOaVY1dUVR?=
 =?utf-8?Q?j0YREZMS7ZXEgO9IgW0ByJgez?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 628f2df0-5271-4e78-fa5a-08dcfe7403e6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 15:02:21.6268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PM7RWTyAWT0r8CXXFF1dl10q5YJSOjqwLdxUnpavQjoBAIYimKxNqZWvT5/FqLaC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8134
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

--------------MRzmGnxC3aRTQnavHgkQeYr2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 06.11.24 um 14:12 schrieb Boris Brezillon:
> On Wed, 6 Nov 2024 13:44:20 +0100
> Christian König<christian.koenig@amd.com>  wrote:
>> Am 06.11.24 um 09:14 schrieb Boris Brezillon:
>> [SNIP]
>>>>> I filed a Mesa issue,
>>>>> https://gitlab.freedesktop.org/mesa/mesa/-/issues/12094, and Faith
>>>>> suggested a kernel-side fix as well.  Should we reconsider this?
>>>>>
>>>>>
>>>>> Wait a second, you might have an even bigger misconception here. The difference between waiting and querying is usually intentional!
>>>>>
>>>>> This is done so that for example on mobile devices you don't need to enable device interrupts, but rather query in defined intervals.
>>>>>
>>>>> This is a very common design pattern and while I don't know the wording of the Vulkan timeline extension it's quite likely that this is the intended use case.
>>>> Yeah, there are Vulkan CTS tests that query timeline semaphores
>>>> repeatedly for progress.  Those tests can fail because mesa translates
>>>> the queries directly to the QUERY ioctl.
>>>>
>>>> As things are, enable_signaling is a requirement to query up-to-date
>>>> status no matter the syncobj is binary or a timeline.
>>> I kinda agree with Chia-I here. What's the point of querying a timeline
>>> syncobj if what we get in return is an outdated sync point? I get that
>>> the overhead of enabling signalling exists, but if we stand on this
>>> position, that means the QUERY ioctl is not suitable for
>>> vkGetSemaphoreCounterValue() unless we first add a
>>> WAIT(sync_point=0,timeout=0) to make sure signalling is enabled on all
>>> fences contained by the dma_fence_chain backing the timeline syncobj.
>>> And this has to be done for each vkGetSemaphoreCounterValue(), because
>>> new sync points don't have signalling enabled by default.
>> The common driver design I know from other operating systems is that you
>> either poll without enabling interrupts or you enable interrupts and
>> wait for the async operation to complete.
> The problem is that we don't really poll if we call ::signaled() on a
> dma_fence_array. The test is based on the state the container was at
> creation time. The only way to poll a fence_array right now is to
> enable signalling. So maybe that's the problem we should solve here:
> make dma_fence_array_signaled() iterate over the fences instead of
> checking ::num_pending and returning false if it's not zero (see the
> diff at the end of this email).

Oh, really good point as well. I wasn't aware that we have this problem 
in dma-fence-array.

>> That distinction is really important for things like mobile devices
>> where interrupts are rather power costly.
> Sure, I get the importance of keeping interrupts disabled for
> power-savings.
>
>>> At the very least, we should add a new DRM_SYNCOBJ_QUERY_FLAGS_ flag
>>> (DRM_SYNCOBJ_QUERY_FLAGS_REFRESH_STATE?) to combine the
>>> enable_signalling and query operations in a single ioctl. If we go
>>> for this approach, that means mesa has to support both cases, and pick
>>> the most optimal one if the kernel supports it.
>> Another problem we have here is that dma_fence_enable_signaling() can
>> mean two different things, maybe the documentation is a bit confusing:
>>
>> 1) Enabling interrupts so that we don't need to call the
>> ops->is_signaled() driver callback.
>>
>> 2) Asking preemption fences to actually signal because memory management
>> wants to do something.
> Uh, I wasn't aware of (2). If it's document somewhere, I probably missed
> that part.
>
>> So when this ops->is_signaled() callback is implemented it shouldn't be
>> necessary to enable signaling to query the state.
> Agree on that, see my comment about fence_array() not necessarily doing
> the right thing here.
>
>> To summarize: When you call _QUERY you shouldn't get an outdated sync
>> point. When you do this then there is something wrong with the backend
>> driver.
> If by backend, you mean the dma_fence_array implementation, you're probably
> right.

I'm going to take a look at the dma_fence_array implementation and the 
documentation on dma_fence behavior we have.

Thanks a lot for pointing all that out,
Christian.

>
>> Regards,
>> Christian.
>
> --->8---
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 8a08ffde31e7..c9222a065954 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -104,8 +104,22 @@ static bool dma_fence_array_signaled(struct dma_fence *fence)
>   {
>          struct dma_fence_array *array = to_dma_fence_array(fence);
>   
> -       if (atomic_read(&array->num_pending) > 0)
> -               return false;
> +       if (atomic_read(&array->num_pending) > 0) {
> +               struct dma_fence *subfence;
> +               unsigned i;
> +
> +               /*
> +                * If signaling is enabled, we don't need to iterate over
> +                * fences to get the state, we can rely on num_pending > 0.
> +                */
> +               if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
> +                       return false;
> +
> +               dma_fence_array_for_each(subfence, i, fence) {
> +                       if (!dma_fence_is_signaled(subfence))
> +                               return false;
> +               }
> +       }
>   
>          dma_fence_array_clear_pending_error(array);
>          return true;
>
>

--------------MRzmGnxC3aRTQnavHgkQeYr2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 06.11.24 um 14:12 schrieb Boris Brezillon:<br>
    <blockquote type="cite" cite="mid:20241106141245.0a4f88be@collabora.com">
      <pre class="moz-quote-pre" wrap="">On Wed, 6 Nov 2024 13:44:20 +0100
Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 06.11.24 um 09:14 schrieb Boris Brezillon:
</pre>
        [SNIP]<span style="white-space: pre-wrap">
</span>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">I filed a Mesa issue,
<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/mesa/mesa/-/issues/12094">https://gitlab.freedesktop.org/mesa/mesa/-/issues/12094</a>, and Faith
suggested a kernel-side fix as well.  Should we reconsider this?


Wait a second, you might have an even bigger misconception here. The difference between waiting and querying is usually intentional!

This is done so that for example on mobile devices you don't need to enable device interrupts, but rather query in defined intervals.

This is a very common design pattern and while I don't know the wording of the Vulkan timeline extension it's quite likely that this is the intended use case.  
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Yeah, there are Vulkan CTS tests that query timeline semaphores
repeatedly for progress.  Those tests can fail because mesa translates
the queries directly to the QUERY ioctl.

As things are, enable_signaling is a requirement to query up-to-date
status no matter the syncobj is binary or a timeline.  
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I kinda agree with Chia-I here. What's the point of querying a timeline
syncobj if what we get in return is an outdated sync point? I get that
the overhead of enabling signalling exists, but if we stand on this
position, that means the QUERY ioctl is not suitable for
vkGetSemaphoreCounterValue() unless we first add a
WAIT(sync_point=0,timeout=0) to make sure signalling is enabled on all
fences contained by the dma_fence_chain backing the timeline syncobj.
And this has to be done for each vkGetSemaphoreCounterValue(), because
new sync points don't have signalling enabled by default.  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The common driver design I know from other operating systems is that you 
either poll without enabling interrupts or you enable interrupts and 
wait for the async operation to complete.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The problem is that we don't really poll if we call ::signaled() on a
dma_fence_array. The test is based on the state the container was at
creation time. The only way to poll a fence_array right now is to
enable signalling. So maybe that's the problem we should solve here:
make dma_fence_array_signaled() iterate over the fences instead of
checking ::num_pending and returning false if it's not zero (see the
diff at the end of this email).</pre>
    </blockquote>
    <br>
    Oh, really good point as well. I wasn't aware that we have this
    problem in dma-fence-array.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20241106141245.0a4f88be@collabora.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
That distinction is really important for things like mobile devices 
where interrupts are rather power costly.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Sure, I get the importance of keeping interrupts disabled for
power-savings.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">At the very least, we should add a new DRM_SYNCOBJ_QUERY_FLAGS_ flag
(DRM_SYNCOBJ_QUERY_FLAGS_REFRESH_STATE?) to combine the
enable_signalling and query operations in a single ioctl. If we go
for this approach, that means mesa has to support both cases, and pick
the most optimal one if the kernel supports it.  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Another problem we have here is that dma_fence_enable_signaling() can 
mean two different things, maybe the documentation is a bit confusing:

1) Enabling interrupts so that we don't need to call the 
ops-&gt;is_signaled() driver callback.

2) Asking preemption fences to actually signal because memory management 
wants to do something.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Uh, I wasn't aware of (2). If it's document somewhere, I probably missed
that part.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
So when this ops-&gt;is_signaled() callback is implemented it shouldn't be 
necessary to enable signaling to query the state.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Agree on that, see my comment about fence_array() not necessarily doing
the right thing here.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
To summarize: When you call _QUERY you shouldn't get an outdated sync 
point. When you do this then there is something wrong with the backend 
driver.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If by backend, you mean the dma_fence_array implementation, you're probably
right.</pre>
    </blockquote>
    <br>
    I'm going to take a look at the dma_fence_array implementation and
    the documentation on dma_fence behavior we have.<br>
    <br>
    Thanks a lot for pointing all that out,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:20241106141245.0a4f88be@collabora.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

---&gt;8---
diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 8a08ffde31e7..c9222a065954 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -104,8 +104,22 @@ static bool dma_fence_array_signaled(struct dma_fence *fence)
 {
        struct dma_fence_array *array = to_dma_fence_array(fence);
 
-       if (atomic_read(&amp;array-&gt;num_pending) &gt; 0)
-               return false;
+       if (atomic_read(&amp;array-&gt;num_pending) &gt; 0) {
+               struct dma_fence *subfence;
+               unsigned i;
+
+               /*
+                * If signaling is enabled, we don't need to iterate over
+                * fences to get the state, we can rely on num_pending &gt; 0.
+                */
+               if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &amp;fence-&gt;flags))
+                       return false;
+
+               dma_fence_array_for_each(subfence, i, fence) {
+                       if (!dma_fence_is_signaled(subfence))
+                               return false;
+               }
+       }
 
        dma_fence_array_clear_pending_error(array);
        return true;


</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------MRzmGnxC3aRTQnavHgkQeYr2--
