Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEEA601A7B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 22:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BA810E0C9;
	Mon, 17 Oct 2022 20:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA14010E0C9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 20:41:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sp0KdZIm1e8R2wbs4E7aaZheiY6vrWoQr1P2EOPquCpdm8ZsIMWfBqUjQ9Onu0Cf+aYkdeOnUPnhWllLw4L4MzmgCNQLU/qbYHpKwBHWwP3bt8ULlzZa+EmRZnu3xMxfB74utqGSX79y7veFjfTWgXqdn6dJ/WZqpVSIFJtDnHVlWtin+UHEa18xbYStz6fMDLN9QjGSEQ2vJLQAnR1yypAys3gzB7+QqSTBDoiqzxFtnVyT5yKoF6EYpeVHR8PJRFoYd1/S8+prVzmcie4Xuq01WI0B3QW79Iltu7jAKi/mCndeZFf6OUDYQ/KPahlzGa1Fv+zQUB67ETL55AvEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOGWCcKcEXBJ9OvvDQvXk2rW/536dupp5mz1eaZ1dTs=;
 b=dJAvKBaHhNpyK4w6uuCzA1wSsrx+AJPq6N/BHtgsb6GS9PZgK5bMDrBY58YVP1zniHH4HsMjpKMYBOpBs++uRljuF1+SHqLVF27JgVVdu8wYB1SR60SOzigYcodi/781A4h5C1stdTOmRFLyvDZ2QFFqvXZrXE0hcan83FINJvFzpZnW61sU3QAfnAofaUE+Pn8GGnRyv5YoJxnnGgcBwFcFLggfHjouL/lec2fNU9WmP5GjBHRPHz5FhUZ78wP68z9e3z5u0CbeH5bReGR/dr1r3MccQpCCderRuwhcDLPTbugyqcAO6e0GAUce+6ds/rmQXKdgWkx1uQiKeysl3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOGWCcKcEXBJ9OvvDQvXk2rW/536dupp5mz1eaZ1dTs=;
 b=zKJvF3PkbPYM3Dn77Q3bbNTLS0tjk8927LXjCiAYPzLg0gcTq0YL63YBycEdqub8CArTnyo640EFN1XuRfbqawvxS5AACIm0AY+jCmAsJcflXrT2cSrBtot11O9S6DkkdXpGl17axO7yejHIm8fGMlUYEoUguawSgFa0KuIfzwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DM4PR12MB7597.namprd12.prod.outlook.com (2603:10b6:8:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 20:40:57 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::597:967e:d8b8:8fb9]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::597:967e:d8b8:8fb9%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 20:40:57 +0000
Content-Type: multipart/mixed; boundary="------------2pLdTOlKpJFxMMSbN1XIq5e0"
Message-ID: <f3a5b249-84d8-9ba3-9977-3557c82a7850@amd.com>
Date: Tue, 18 Oct 2022 02:10:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [git pull] drm fixes for 6.1-rc1
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>, Arthur Marsh <arthur.marsh@internode.on.net>
References: <CAPM=9ty3DGWa8vnfumgSrpSgWnixWjikb6C0Zk_5bW+deKLVQw@mail.gmail.com>
 <20221016080833.5503-1-user@am64>
 <CAPM=9txsBf5HJ97tAMOQ8PdiPciK-zqngERUm7hGJO8Zyyqb+w@mail.gmail.com>
 <C98B32CF-86B0-438D-BC8D-10FA255B3B4F@internode.on.net>
 <7c645fa8-bf29-4b30-bdc5-e61e6bb09927@amd.com>
 <f0110d36-a9c2-c1b9-b193-32da4f98a975@amd.com>
 <67e2904a-4b80-5173-2d8f-6a3d1f702fbb@amd.com>
 <CAPM=9tz8=iDye+vYai2NLLW-u3TfZ=DKdA_h2e+kk==ZO7q3PQ@mail.gmail.com>
 <50dcf794-e96f-24a3-5d40-6c64941b1bc0@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <50dcf794-e96f-24a3-5d40-6c64941b1bc0@amd.com>
X-ClientProxiedBy: PN2PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::34) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|DM4PR12MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 14752e35-734c-44a3-9a04-08dab07fe4a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t+piWu9k+nsDAs0/8RrQc6YNc5xynSMCMTo12k2bG0VpAAUYoeIpCXyuHZjcnYlyjAFUYeugbpUaM0wor/6CMfnsgoQyPohhKau2etbQwOkddpljMPYElf50idshLLYvpw/fydu0wI8pR8VOm5Bl7D+g9a0OHfo2cLYs4Uk8AFHzyntCYHRNMuITHyWSwGVUmuXaVW7gzoZhYW6gmz5ObKT+5ySd1ThbOGlZjWlej8SLZdU2gUepXjmrb5FR/6aBHVgplAuJqUKReoWFuJkkYQlf3SZly+ULGe6hfxR9cjRu/P0KgEdHPayo8L6UCg3qkAZNxVahP/uuif2/UYsEO3xj4+npEH/kXVas7bKIFVBT2Mfh+YlgJzzlhAqkkSC6oIK1mpu6/VGLLY/BcQOKpPehSTjGhVMKxgkf/Ns6C9tvrRRuP4UDgV9/zqLwy7Yc4swOEn9Go3tDtzub7mefuCkfENuTKJ1n3fPuIpejXVT3sR+OjeiCLNLCU/DTRbC9unegQUtTr6aLuR4Af/ERbChRtlHQ/kpgmd/6YCcVR0Quz0EgEks9Gh/eTwto8K5s+TMdOB0Hl6pT5x+uF86UVTMOd6c80mIJ1iATHulLpxi1oZCImURsrukiCPgeFxKFz/lzcSmKH/tSJ0IVdtt36jaY74v02BuAtYannQ3qfAksaBZC+smbPQIlIjpdv/uNzAWykKd8bNFMvx+vpjQV3bYQAUCUiiwm9LAozv9V9F76XdD6epsFSsWXyknNLyXHUVD6/JccT46bUzbauGvgdQTmDewlqjxn9kRJnznASRw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199015)(31686004)(6506007)(36756003)(2906002)(33964004)(8936002)(5660300002)(31696002)(86362001)(235185007)(53546011)(6512007)(186003)(6666004)(26005)(41300700001)(2616005)(478600001)(4326008)(8676002)(6486002)(66946007)(83380400001)(66476007)(66556008)(38100700002)(316002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHU3UnNYZTRHY0YyaGlHNEhaSWorVE5YQUpsa1VYN0ZnT1lrQklkZ281YU4z?=
 =?utf-8?B?Y29JRmd2YVpoR2FqZXVrSUpTajMzR1hYK1JMcEdoTXFDZmQ0a3UrY0V2aHpm?=
 =?utf-8?B?WHdGRUtIaHFrekZqWnVUbVdJb0lUVkgxdHdwUUVZM3prbG5FQXJNaWx3TWtV?=
 =?utf-8?B?TGRWR3J2N2R0Z0FNSUFzYUpiaEdlMzhPWVdoaFNOdzdlaXd6MVBELzFlSEY4?=
 =?utf-8?B?NGJrVDRBeXBVQzN1UnV2SUNVWExsU0RNV3djN1BCYVpSZDMwMTdCM3JiZm4w?=
 =?utf-8?B?LzV6YWVVNWNmMnBSRHVqQjNTeXhYWHl5bjJFempFV1pHb0w4T1VMeDQrQUdK?=
 =?utf-8?B?eUpMQ3UxZXZPSVFvdlgxazREaWYyYXJkTEZEOWI3ZG03bW5ickNkSmR6OWI3?=
 =?utf-8?B?bHE4akN3TG14eS84RElSVVRyZWJqeGJGOExwYzZRZEN1cmNyTTJ6cTZTRGxT?=
 =?utf-8?B?dTNhTy9nYTBDMGhLYWROSWI3aFVuQXk3bStxY09Fek5YdG1seWJsVFpMQWxT?=
 =?utf-8?B?Rm5EQ2l1UzNqMlhaU0luS2FzNFZCTVdNZEdvU0xSbk9yR3J6OThKTzZ6OTRr?=
 =?utf-8?B?dUI3MnU5d2ZkSHhzWDRWS08rUGdKd1dZMVZxckRaeFVabWFZUkpRSFUrUVY5?=
 =?utf-8?B?Wms4ZzE5U1BwVGNSQzRkOUpldDRyQThoeWFCRGZDWDhZaDMrVDdEVkptK1Z3?=
 =?utf-8?B?a1BEOVZ4TzBUUUQvZ0pyK25BVlpHQlR0ODZLeG1EcDFESEVpSkZFMzBkMFE5?=
 =?utf-8?B?OXhUOUhKSjE1S1ViQ3JMcEZrUmp5Y0MrUHlZcVlYTEJGdVRsQWhiTWdzL1oy?=
 =?utf-8?B?MldITEZsb2lnNmx4YlNWT01wK1N3Q293cTVsSUJwYXF6aVNMUDJGT3hRSytI?=
 =?utf-8?B?Y3FEYVNvcU1wTUJ2QlJEM3NYRkxnZEdNR1VpQjgwMEloR0RsVmxkaE93cmIw?=
 =?utf-8?B?YlNSdkJkcHBLeGwwS1FiTEJwY244R1ZGRzYwQmxSdjB5bERSaHRSTnVQRUFw?=
 =?utf-8?B?alRYRURzbHNFdDhVb0F1clpWUW4zdmMxM0RwMGgybG1kRmtBRE9HWnJ6bG1K?=
 =?utf-8?B?S1RMSmYwQU5pMlhvSGdkTkhyejdBQURkaXp2Q3JaWVJ2SWdtZzdpUXgyUGo0?=
 =?utf-8?B?NDN0blNZeXZmNG9kQUtNZjJ0Nzdob2VKa3RNYUlUU01GZUVxcm5tQWFjbGR3?=
 =?utf-8?B?RGNGamlTYVlmcU9CaGRhOWgwejNBUzlwc3N5MXhNeG9mYllyWHR5SHRzazh1?=
 =?utf-8?B?QjhRZnF5NXo1dDFMVFFUMVAybFlkMTZpQmZiSFpxUys3SVptVGpnK29tTHAr?=
 =?utf-8?B?TFczRGZYMjRwU1M3andHMXRvUjNBUkJXOFZENnJzV3J4MENqQjJCK0pPdTJm?=
 =?utf-8?B?UGRkNm52ZHA1T3FZSnRsQkhCU2U0bHZMZTNsTGlwMXBQTlZybUExWW0xT2Jv?=
 =?utf-8?B?NWNGdktzZjlsZWNqSUFtUDhMQjFXWWgzNjk1ekl4eDJUeWM5VXo2VDE3NEVL?=
 =?utf-8?B?MlYxK29OY1k3QWFOOE5jT1FWcHFRalVNcWxzL0tTTEVHS0xXSjdZNjE2TjVR?=
 =?utf-8?B?SW5ibFRIM1FTanhyL2NRMmhZOVhnOHUzY2RSUnJVZ1RCd0p1ZitESFJSdjdP?=
 =?utf-8?B?YjNrQjE4MEJMV2hham5RU1F0cGs3V0pVVk5PSmV6UWprVkE3dlFBcCsrVVVz?=
 =?utf-8?B?ZnRpMWxrTGphSDdncC94NEwrb3R4V2tlajA1VVczNkNiQXBZZkI0WFZZVnlh?=
 =?utf-8?B?aG5GZm45a0p0dnNCakdwUUVWdDlUVGNvd3FRVjVFbzFMOEVITDdaUHhnbFow?=
 =?utf-8?B?MjVuaW41NlFBcHFSZ1MrTUJIR2themFEZHVrb0pCUW1XOUx3WUpWMjlVU2Nx?=
 =?utf-8?B?eXJJUGdGYUZ6Y1dJN3ZZUlNRRUt1UzlRMjR1em1YczdHSVB0b21aVE9GZEpW?=
 =?utf-8?B?RHpNbTJ3ME5laElTTDBtZzI1MGxCeGxzR0R1NHNQbVdPZmFFZE9ab0ptL1B4?=
 =?utf-8?B?eDUzUGhBL0x4Z1ZKMnRsaVYrYjltRTVmSWJKeHpBaHFxT0xWc2pDbHVnbjBx?=
 =?utf-8?B?LzYyeUQ0Y3dWM1RITHpWNmUrY2VHdlZKNXdsNWJITjJ1bnpCbnBybE96T1BL?=
 =?utf-8?Q?2XX6mDUEvy8EYggWY9Gy6Upv7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14752e35-734c-44a3-9a04-08dab07fe4a3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 20:40:57.3201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mTuA4OHKD1daj6oizaKa7PxB6O2+TLGpfpIdE/iiocAHYhoHCY7W3ydIdmyUq1aIQjOFaOp/UnYQSQQEVttpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, daniel.vetter@ffwll.ch,
 torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------2pLdTOlKpJFxMMSbN1XIq5e0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Christian,

Looks like we have to exit the loop if there are no blocks to compare.
May be that's why the function returns false.

@Arthur Marsh Could you please test the attached patch.

Thanks,
Arun

On 10/17/2022 1:39 PM, Christian König wrote:
> Am 17.10.22 um 10:01 schrieb Dave Airlie:
>> On Mon, 17 Oct 2022 at 17:07, Christian König 
>> <christian.koenig@amd.com> wrote:
>>> Hi Arun,
>>>
>>> the hw generation doesn't matter. This error message here:
>>>
>>> amdgpu: Move buffer fallback to memcpy unavailable
>>>
>>> indicates that the detection of linear buffers still doesn't work as
>>> expected or that we have a bug somewhere else.
>>>
>>> Maybe the limiting when SDMA moves are not available isn't working
>>> correctly?
>> It is a CAPE_VERDE, so maybe something with the SI UVD memory 
>> limitations?
>
> Yeah, good point. Could be that we try to move something into the UVD 
> memory window and that something isn't allocated linearly.
>
> Arun can you trace the allocation and make sure that all kernel 
> allocations have the CONTIGUOUS flag set?
>
> Thanks,
> Christian.
>
>>
>> Dave.
>

--------------2pLdTOlKpJFxMMSbN1XIq5e0
Content-Type: text/plain; charset=UTF-8;
 name="0001-drm-amdgpu-Fix-for-BO-move-issue.patch"
Content-Disposition: attachment;
 filename="0001-drm-amdgpu-Fix-for-BO-move-issue.patch"
Content-Transfer-Encoding: base64

RnJvbSAxMzJjZTgzZjg5M2VhZWE3NDNmYjdmNDFhOWRjNzJhZmVhNTJjZGFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBcnVucHJhdmluIFBhbmVlciBTZWx2YW0gPEFydW5wcmF2aW4u
UGFuZWVyU2VsdmFtQGFtZC5jb20+CkRhdGU6IE1vbiwgMTcgT2N0IDIwMjIgMTM6MTU6MjEgLTA3
MDAKU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBGaXggZm9yIEJPIG1vdmUgaXNzdWUKCklm
IHRoZXJlIGFyZSBubyBibG9ja3MgdG8gY29tcGFyZSB0aGVuIGV4aXQKdGhlIGxvb3AuCgpTaWdu
ZWQtb2ZmLWJ5OiBBcnVucHJhdmluIFBhbmVlciBTZWx2YW0gPEFydW5wcmF2aW4uUGFuZWVyU2Vs
dmFtQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5j
IHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKaW5kZXggZGMyNjJkMmMyOTI1Li41NzI3N2IxY2YxODMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKQEAgLTQzOSw2ICs0Mzks
OSBAQCBzdGF0aWMgYm9vbCBhbWRncHVfbWVtX3Zpc2libGUoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCiAJd2hpbGUgKGN1cnNvci5yZW1haW5pbmcpIHsKIAkJYW1kZ3B1X3Jlc19uZXh0KCZj
dXJzb3IsIGN1cnNvci5zaXplKTsKIAorCQlpZiAoIWN1cnNvci5yZW1haW5pbmcpCisJCQlicmVh
azsKKwogCQkvKiB0dG1fcmVzb3VyY2VfaW9yZW1hcCBvbmx5IHN1cHBvcnRzIGNvbnRpZ3VvdXMg
bWVtb3J5ICovCiAJCWlmIChlbmQgIT0gY3Vyc29yLnN0YXJ0KQogCQkJcmV0dXJuIGZhbHNlOwot
LSAKMi4yNS4xCgo=

--------------2pLdTOlKpJFxMMSbN1XIq5e0--
