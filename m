Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28929945B53
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 11:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5FB10E9CB;
	Fri,  2 Aug 2024 09:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gfh34x7V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D42310E9CB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 09:46:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dv/QI77AviaZG+hk2uHEAqR/NukXThEMi4clat0Sh6q5W5CVwud/zGWmSWxUjFQcT38cPM7yayS6mogy20P/44eo0TPZ3sbehNpI2DMDoCPpA6IkiVcva2xK7wYFRqMnv+7DyYDriGpKHgWkyoHp5ROgMoVUVMSYEYYhBebrdA8tny9YEwXsi/ABgJHCajM4PGXDJY5exmzjQvNg1ZaAA1jF9P32NubN0O/cQdwghIGbWPxqFLHs+jdXRDX/lKAgeHd9ZUwvkB6TeDzXlS2pUzKYsnZFGH3A8zKP2IJmLCtNzeLrjLlRnDjoMCSLBlsvzqvU01+K/R3LDHsGWFEMrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reW3meQp3EfGYFb2zhf4cv1E3wKujJOl/+cd3bAqEgs=;
 b=tcHxXEKCJnpN9Din6szXnZtEOi2BYJVGwFfwx06yhNP4DaIyTZZtNa7Cxjm2wrouIrTXfJVs+BAeJbsWPZy3TXB6vDdw7iMbKj4fqOnbVKn/LPgMTsL9vYz62rH9AM3/zQb/YZNxeKPNk+75Ob4Dg5FjrFpc0z2I+h5pYn9/43kg7pggsWKlJ0WjbLZbSCUDHPkPvD2Hf65cVCIj+KycTV/+bo0sGzwePPAxafOtdQm/TnHivcbfCtUA92O5ZqTiarGzy2s851b+63o4D4umHUBD0dRjYH8U8Ckzop4ft1JPRTWe+FSzU7UOMm0IJYiCxoBqSBZ+38QA/NigfD8D8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reW3meQp3EfGYFb2zhf4cv1E3wKujJOl/+cd3bAqEgs=;
 b=gfh34x7VsUXN/4/d+cv2liW4nZRNGABAiXlp4/Xf2gm17D/LZaX5hHFJJk1akJPg8P8SetbNKMWZEVmHtZgcywOBNdpHF1sgvHpxzstWpB8PtGcqQrJl3S8Cv4kUtG/KpKLH5FFO/EUsPluxmUIG5ecWyHVtX7mYrLExr+99hZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6682.namprd12.prod.outlook.com (2603:10b6:303:1e3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 09:46:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 09:46:04 +0000
Message-ID: <0df2b2b3-561d-4dc7-89ab-8c8a3bc2ee9e@amd.com>
Date: Fri, 2 Aug 2024 11:46:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: bisected/regression: choopy youtube video on Ryzen IGP -
 0ddd2ae586d2 drm/ttm: increase ttm pre-fault value to PMD size
To: Yanko Kaneti <yaneti@declera.com>, "Zhu, Lingshan" <Lingshan.Zhu@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Li Jingxiang <jingxiang.li@ecarxgroup.com>
References: <20240604084934.225738-1-lingshan.zhu@amd.com>
 <26c01e3b726812979846710afcaab81e92da6a40.camel@declera.com>
 <a7dc49b7-0da2-4fbf-a045-1bcd72ebaa8c@amd.com>
 <43b8f01904131c9d3461436c0d1c916663f721e2.camel@declera.com>
 <fc75ca479e78f0f7baf9a7442b9907c588647fb8.camel@declera.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <fc75ca479e78f0f7baf9a7442b9907c588647fb8.camel@declera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6682:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb1bce1-0484-474e-ea0a-08dcb2d7ed08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjZSdklpanZMb0JXMjJWVVI1MXNWTkFDWGhtZEFGbmtUd3I0aEx5M0M2bm11?=
 =?utf-8?B?U2ZPOFlJR3IvZ1VnTFM4OXBsMlJvam40ekJkNUlwZXpiRmsyOTRrK0ZwYWQz?=
 =?utf-8?B?c0lTUGJvaXZRbm9rclJFR2pwOXRTMkNObTR3TS9YN1NzZ2ZNTTE5U2dXbnVX?=
 =?utf-8?B?Ry9rTDNDMnBGc0dESWUwWkxQcWhXZTl1djN6VUlEZEY0YWxQQ3dmUkJOZFhT?=
 =?utf-8?B?ZTUxY2JpZFk1Z2daY3cxTlFIclZYQTZXRERuK2JhTGt0SGgrb3I3ZGtybzNK?=
 =?utf-8?B?OFZvd1YxemlpWTJReHM3cnQwZG5iWkV1RGJJQnlmLzE5aDJuMzJoQXNUTzJG?=
 =?utf-8?B?Wm9DMExWS3lqVlBOejV5bDZZa1lJbnMyYWNFYU5weGkwWUpTdWNLeFFnQjBK?=
 =?utf-8?B?YmIwcSt6ejQ3U1dKU1k3M0FJK1A0M1VKSmhMbUNSdVBoZGxLVThJeU1IZUNa?=
 =?utf-8?B?eWdlYkp6cDk2ZDFXZGJVSXVOa3pJZkZLbzZhc1dPb01aM3E0ZEhzRStPZXdn?=
 =?utf-8?B?QXc5c3k2NmpmWUk1NTV5dlNyOHc4WTJSM3ZnUU9vcmdSSFFaVFVMZ0tOcEwv?=
 =?utf-8?B?NUhLbkI2YmpFb2crc3NOa1dxQkhPL3lmUFZDL0dZU2EwV2p1TXFhajk0L2tB?=
 =?utf-8?B?WEhDbjNIbHBveDlMSHRPekdUNlhCUHVMVGpsN2g5dFRoaTVZVzZoMnJxTXhI?=
 =?utf-8?B?T25ITGp3OVVsdTBOS05rdW1uZlFyZUF0ZzVhSFpjSXZNK3lHMXBMWmI2cVhN?=
 =?utf-8?B?TVIrYTJyKzg4eDhIZUlmeEJBSVJaT1JxalE1STFWKzBLZXExSmFHcXk3dzc4?=
 =?utf-8?B?NEhsZERJdnBtZnhaTno1M1hHUERLRU84eFdudlF6UUErUGRXOTdSYnd0ektQ?=
 =?utf-8?B?K2Z2VE55SS9Yd2w3Qkl3eEgrekllSzNtdjdlL2xLUEM3cnpmTFJ5RGM0VHRQ?=
 =?utf-8?B?Mi9GdEFmbU1mWHlkb3NHdCs5dXJqcUFGZkZNcDdMNDhOMzhpZmdoVytIaUU2?=
 =?utf-8?B?OTJQalpabUNYcVVLcW5tRDVTZXl5cm9Qd05mREV4OHJUdnBOV2g0OHhVRXhV?=
 =?utf-8?B?c2JLVzBVenArQ2V3OExCTStIcGRGTXBRYjBON0t2dkRpS2h0LzRyaGw4QlFY?=
 =?utf-8?B?NEt3dDd1Qmp4dkdLRENBYUo0dW81aHZSS1JYZ1g0YUUyWXJsNTVrdDJDcFhl?=
 =?utf-8?B?YU8xZVRJWDBiZU5ISlRjMEhpd1JXMTM2U3ZXejNLNDJpZkozZys5Z0pSYmZR?=
 =?utf-8?B?NmJDMFJLWlBBVjY5TUZsN1VvS3pHZFAxUlNEY200N2xtYkJNR1ZWNWR0ZHhE?=
 =?utf-8?B?aTdmZ1BMOWZEVUxORHlwNXE4emhZVXhvK252b3JYM3RFY2Z2ZTVBcFdtNWRW?=
 =?utf-8?B?ZmZLdXVOUlJ4cVVZWURDbTM2dmkvOC9qUzJvTEdYbGFPcHZ3VUptZ2ErcGl2?=
 =?utf-8?B?OUFiSHJ6MGFwdXBPTHJ0L0s3NDJtUTVSNkZUYWVIQmdjWGRMUzNqS2I4MjM3?=
 =?utf-8?B?czVKL1lGeWxhZVVkZU1keWZXMG1iejdOYlo1SElHclVyTGl1ZGxTQVZVV2d5?=
 =?utf-8?B?V0daVkFLVEhyOHU2eFpjSnZvVGw0RWZ3SUNEODJDeFpoSjJjem1ITjg2RjFv?=
 =?utf-8?B?SGJNSzlCUEp6elRzM1J4ZVNvZ0ZNeHU3OVZ4eElqdHkxQ1l0UXNjTHFTa05j?=
 =?utf-8?B?WWpYckJiTlRSYm50TGhOUjVnL21hTGVVYXVXZy8yVllmcEtCUWJFelJEUlNp?=
 =?utf-8?Q?1e9u8TRwEdFJuOZD/E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGtoNW80NnlpRkRlOHh2NDZwTjFzSDFoR0haMVM0UUhWWjRtSEQyZnRkRTgr?=
 =?utf-8?B?ZlR2cjhiN3EyMDdYZXg0QkxzRGlUM2tGbmlZYk9GM0hkMDBFUXBVc3hxY1Vn?=
 =?utf-8?B?cDN4NlFWVi9Rc2tOQTEvU0d0VExaUzk0Um1vWlNHNDZXdlJ2d1RhSXM4NkdD?=
 =?utf-8?B?czJvYXNUQmw5cTZ2QVVWeUViZTBVZnNGbkxROHN0Tno0Z251NGp2THAwa2I5?=
 =?utf-8?B?T0JwOTJCcFZFRjZhdjA2RE81WWp1TVZoQ1hidlhWeVY0eGQzcHJ0TzkzZWRY?=
 =?utf-8?B?b3V6OGRVWUg4VFBvMVRYR3NsWEk2RjRYU01Ea0E2UmlBejVFbWVyK2NwaVVu?=
 =?utf-8?B?WVBmV1pMc0R2NzVzWG8rS0V4Rmc1VENPa1k1MnhTaTltT2w5VE5IcmlQbWRM?=
 =?utf-8?B?aHFVQW85MHByY0J3YXBMWWMwdmprWDQvdEFnSVBERzFjTVZNaTVEd0EyTnht?=
 =?utf-8?B?bitjWEN2V2dXTTZGVkYxS0dCaDF3YTJ0cWluNlpKeGZQaVZ3d0gzbE5RNGt3?=
 =?utf-8?B?Rkk2Zy96MTY3K1lESEZ6VDdYTytneWlyTFNIZmd1NlZSdFJvSW9lMVRTN0pN?=
 =?utf-8?B?SFBUU3VDWkc4bXh2REVEOHArUEF1UkE4aGFYOVZ5LzV2czZxbmkrdVBCWld4?=
 =?utf-8?B?bDZjdUVmdFBSSnQ1N1NTelhXZmVNU2xCZldBR3ZuR2U1MjZrSkFhQU9FM0Ez?=
 =?utf-8?B?TkgvL0xHYTlIVEc1cXlXSnN5NDFYYW1xQzB4WlNFK3ZraFBSTm81cVZpTkcw?=
 =?utf-8?B?UUpLN3UxeTV6VW84amU3cURaSTFpQVRkZmE0bTJxWUJRWWErQjBLYTZFbmZK?=
 =?utf-8?B?QUtxRzFMTDJGOTVaL3pQc1M2NTNQN0t5L1hrZlN6RVRnaVlsRTBQL28wTU1T?=
 =?utf-8?B?MzE1YnVLUlNwd1hidUNxUlo3akVhTWFESVRCckQ0RzBqRHMvbnJIK1NSZ0l3?=
 =?utf-8?B?ckFkV29pNHFieGdiT3RZbTRGaDVPLzl0R3V6aytwbmFXYXpWcmFabDlWdzU4?=
 =?utf-8?B?cUZieGF3dUVSNWQxbDVXaHFaVDUybHc2SlJsTFRtZ29XNEpjM3k5M1V0aHg2?=
 =?utf-8?B?NWE4eWZFdm1seFA0TjN6N29pSGxQN3ZhNUh0R2RVR0V5ZWRXQ05Kand4d2lI?=
 =?utf-8?B?L0tkNUNhR1lPcFlaMkZtcnhIRS9wTXJySzJKTnZ3RzU4L0pyb2pMVE1Sd21u?=
 =?utf-8?B?RWZVNjFLb3pqUjlCTXFzUVJudWRCQldLblpDQjdwdWc1K08yRk8xejlMcFdj?=
 =?utf-8?B?aVJjZWZTOVFWa2dmWWJGNS9IMnJzUW9IczE0U2NqRjN4bzBZY0RiVHhyc1Zz?=
 =?utf-8?B?bk5PMy9tbnMwQXZOQTRYSEhMNWZTcllzZysrb2ZtWTVVWG8razNkRmpNRlNJ?=
 =?utf-8?B?MWlGMnpHekVaVTVhOWlEUHZEeWVaZlcreDJRTWtiRkVUa2d2NVhtQUhWVnFB?=
 =?utf-8?B?TXdMZzZvd2lvaUpjdW9zTUxjbEE3RHY5cE4wdStXSFNXWFo2bUJYOEQ1aVcv?=
 =?utf-8?B?NkxwZjZDYWM5UG5PMHZBRkgwYnhZb1JhU2dmK0ovY0NYdE5XRFRPNS9aWHI0?=
 =?utf-8?B?RTRDQTJQc0NHeTRzK3F1MDlnZTBza1VNK1N6TkdSUUhwbGRvZWVkVTRPTG5r?=
 =?utf-8?B?T0s2NUN6UWhXd3c1U29LemZpRkRmS3Q4azc2VDlmR25yclduTVo4U3IxYnp3?=
 =?utf-8?B?WnBNRTZ2dWRBZmJSUE9zdSt5RURyaEdvdUwzNlNyQ29hRzRMaHhsKzJISERu?=
 =?utf-8?B?c1pYaFFML0REODIxMS80QnlRQUYybVVZVGJmKzJENnI2WmgxaEhySXpKQSt6?=
 =?utf-8?B?SS9YVlpqYlFXYlp4MmpmaVVSNUNIc1N0aUsvaUE1bm5pLzhNU1A4VWZiMmFZ?=
 =?utf-8?B?c2thcUlSRlU5UmF2OVRudkpwN2VIMEdXRHhrYktmRUVzQ29hNzN6NG9WNlhl?=
 =?utf-8?B?a29FcHBTWm5TcFM2QTFSTHQ3NERheWcxL1ZiMHgxSjFpYmRaZE90TllnMDRB?=
 =?utf-8?B?MXlZQ1loc0QvTkQvOTRQVmRFQ3MyNWU1Lzh3N3RSSXd3ZVExLzFnT2tzektZ?=
 =?utf-8?B?RmwvTzRFcVRQU090VXFUS0Y1SEYvREVPWllORXdSYWRydnVDaVhMYXlsNlNr?=
 =?utf-8?Q?N9MlLF49EGyOhPo1iC/6XExkh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb1bce1-0484-474e-ea0a-08dcb2d7ed08
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 09:46:04.6447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWEAeBr5/3l1rT9qajChauAP/QVwXqGBuKIkgxehI/SMSaHBPIEBC3h2eu1lFtQp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6682
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

I'm still scratching my head what the heck this could be.

Increasing the TTM prefault number has minimal more CPU overhead on the 
first access but makes subsequent accesses to the same buffer faster 
(because the buffer is already completely present).

So as long as Chrome didn't wrote some single bytes repeatably on newly 
allocated buffers I don't see how the change could affect video playback 
at all.

Maybe Chrome did exactly that because of a bug or something, but in 
general such an application behavior wouldn't make much sense (except if 
you want to burn CPU cycles).

Anyway not going to look further into that issue.

Thanks,
Christian.

Am 02.08.24 um 11:40 schrieb Yanko Kaneti:
> Hi,
>
> So, can't reproduce this any more with with recent rawhide (rc1+).
> Tried also with the same old kernels but this time its with newer mesa
> and google-chrome (126 -> 127). The same scenario as before now works
> ok.
>
> Cheers and sorry for the noise.
> - Yanko
>
> On Wed, 2024-07-24 at 10:13 +0300, Yanko Kaneti wrote:
>> Hi,
>>
>> Well, it starts, then within a second or two it begins stuttering with
>> long (half a second/second) freezes of the video , while the audio seems
>> to work fine. Nothing in the log from chrome or kernel , AFAICS,  to
>> show anything is wrong.
>>
>> Regards
>> Yanko
>>
>> On Wed, 2024-07-24 at 09:02 +0200, Christian König wrote:
>>> Hi Yanko,
>>>
>>> interesting. What do you mean with "choppy"? E.g. lag on startup?
>>>
>>> Regards,
>>> Christian.
>>>
>>> Am 23.07.24 um 21:42 schrieb Yanko Kaneti:
>>>> Hello,
>>>>
>>>> Noticed and bisected a rawhide (with the new 6.11-rc0 snapshots) regression to this commit:
>>>>
>>>>     0ddd2ae586d2 drm/ttm: increase ttm pre-fault value to PMD size
>>>>
>>>> The regression manifests in choppy youtube video playback in google-chrome-stable.
>>>>    https://www.youtube.com/watch?v=uOpl2XNOgMA
>>>>    google-chrome-stable-126.0.6478.182-1.x86_64
>>>>    VP9 video,
>>>>    Chrome -> Override software rendering list -> on
>>>>    Chrome -> Hardware-accelerated video decode - default enabled
>>>>
>>>> No other visible graphics issues.
>>>>
>>>> Its a desktop system with Ryzen 7 5700GRyzen 7 5700G  IGP
>>>> [AMD/ATI] Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] [1002:1638]
>>>>
>>>> Tested with linus tip and just reverting the commit fixes the issue.
>>>>
>>>> Sorry for the brevity, not sure what other details might be relevant.
>>>>
>>>> - Yanko
>>>>
>>>>

