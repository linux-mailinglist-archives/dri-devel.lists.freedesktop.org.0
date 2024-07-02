Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E020391F0D4
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 10:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D22C10E557;
	Tue,  2 Jul 2024 08:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QJ+ohgzq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCDD10E557
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 08:10:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l++4SbKITpPvXLRrXmHLe0xRy1up8agQ8EjutlkuM0O5aM/j45d7I4Xu7C3+FGnRPrrft4SuoKGByp1x53YSu0bHHdvVS8HLe0092YIQjr/hnv5SyIOzXDIh6TUvKPlEALaFFIx2qkhoQWXHiavxc0Lg+4VKMxewTnCWX+SzUtcZWhnlYWNiLN2mNeQ0ZlnBa1kdPo9HVcA6add4tNTSt+Vp9MTYkX65PNUYcO32v0reoLElGCx71exsN+t/EDhaL8m7qGv90Hcg9z5ovVw1Kkyf93GRDNQvRTBnpflU6CkMFVG2DOywQsbZGs7WqjhS3B0IQ7gPTSicxfBwhZ1ghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyaS9svHX1l5ytvqNTCidzzM46URAlIoi5W9xf+VUpQ=;
 b=mINYvYxkpnR3nyUTM04Zl8njtEyoLi23mA53DRKcKffpg7wm9u9x13dFEcXnFHTQ+RTthSRFD74Rr5XvlXA2061gbMr+RZtKDl96hvs4JTWdDn0mi3HXkiPpINv7OThgTmk1Tlhfo+ZsobmcvaKAgJ9gWCGBq/3F5v2PXdVZK60NN4FY7hVa1Gv3736u79Bc5Bhikr8dDyHzVWAsjzM4ZQ/am3EhbfwvxYHCRMd6nIL1fUDrzkGiwYdsfB19SWLRQODm7XsLaOGiysl57mFULY3Zei3tsIcUBRldUOfKGWYY9UUnFcOMDp3cb2zjHRbfm4/CMninnYzJhkcHOcpUpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyaS9svHX1l5ytvqNTCidzzM46URAlIoi5W9xf+VUpQ=;
 b=QJ+ohgzqTV0Z7S4w12IrAcHJtDVj9joXiLCUc27CyE6m9P9Hu87W/wptSdzu2f5/bZ4BuZ+DGB4081RB4VqX5Qs0bYdjmsne6ZL6xNyhBfGj09azlPewmjwSYc9n5u9x7Dup/viQvd9nbXzJHzRoJx9Ftgn8+D6LKOQCOjWlHsw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6662.namprd12.prod.outlook.com (2603:10b6:8:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 08:10:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 08:10:41 +0000
Content-Type: multipart/alternative;
 boundary="------------8KDgSUGs0q4mCciVzELO04lL"
Message-ID: <4e958aa5-2a56-4754-b3dd-273da95f1d14@amd.com>
Date: Tue, 2 Jul 2024 10:10:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] drm/ttm: downgrade cached to write_combined when
 snooping not available
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: Icenowy Zheng <uwu@icenowy.me>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240629052247.2653363-1-uwu@icenowy.me>
 <20240629052247.2653363-3-uwu@icenowy.me>
 <a143a2c3-c6f0-4537-acc6-94f229f14639@app.fastmail.com>
 <2760BA02-8FF8-4B29-BFE2-1322B5BFB6EC@icenowy.me>
 <7e30177b-ff13-4fed-aa51-47a9cbd5d572@amd.com>
 <6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me>
 <ff1bf596-83cb-4b3e-a33a-621ac2c8171c@amd.com>
Content-Language: en-US
In-Reply-To: <ff1bf596-83cb-4b3e-a33a-621ac2c8171c@amd.com>
X-ClientProxiedBy: FR2P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: b36ac6e8-4433-457d-3959-08dc9a6e7732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVluOWU2WWtOVWZCYWJ0QzhWMm5NMCtxRXB3bjl5c1ZIdjRlZHlnWndOa3l2?=
 =?utf-8?B?UlNCS0pzb2x2OW1jWU13elo1bXFzZGpFU3lCeXpLeXhqVklsck4xQzBROWR2?=
 =?utf-8?B?K0FTVXNVUkZzWWpabmtMenV6VnlXc1crOWNJYnNZZ2d0ellxSFd6d0h5cU50?=
 =?utf-8?B?bnhBWEJOdXcvanoxbEk5NjBLK3JvVDJVbUE3ZWh3MlVMWlZMZkVvc2h1UHYr?=
 =?utf-8?B?aVIyVkNKWDRqcU85Q2xKeDVibStOQ0tPakFTaytaZEhETlpsbVN4UC9FUlAw?=
 =?utf-8?B?M0xCeHVybEJOU3JEdllCYXUwTmk1TFd2Rk1IMWgyOVlpNHlnNUs5ZHdpRlVD?=
 =?utf-8?B?dzZTV3AwTGp4NkZnaGZiZ0dnSkVCaWllK0VieEFPMFhxY1JkMDc3U2paYm5h?=
 =?utf-8?B?SEVVZGFLU2xEVTJjcURJMlVvbjJvSE9TdEd1dk5scHFJZG1mZkMxeWZyNWZt?=
 =?utf-8?B?bXBmc2thbFZ0SVgrZk56NlV4MXN3WjNWQlBzaG15YmJiaGNvYjNDMXFOMHV1?=
 =?utf-8?B?bjJrQ3ZwLzRyRmpXTGtHdGJGWmoxTjNaWmdGMFBVRGJuSWoyS2JzVHJGci9v?=
 =?utf-8?B?RE9NZnlVbkZDOVI1WUxFbXlMcVJQOW1ZU3JpbDJvQVVQSFZCYUNYZ1h1ak5z?=
 =?utf-8?B?Y1BEM3kxK05MQ3dRcy9wUytOVkhkLyt5OWU1Qllsc1lTQWZoUithNVYvMEdi?=
 =?utf-8?B?dC9SdUR0a1ZEUFV0VWUvSTkzSTVXcG9EK2E2ckpWL09LckpsSGp1SUlqYzl3?=
 =?utf-8?B?ZGdKbnIyM3dSWmRlbDJkWlM1RGhOR3BSQ3R5aFBQWEdjc3BPMkluajBQSlNR?=
 =?utf-8?B?Ui9WeEdKdzRQdjYwbll1QTFKalR5aVRUNEZBR1dJNW44M24rdUUxc0hZZVhK?=
 =?utf-8?B?VjVYN1VFOHQ4TCtnNFpobElmNkdRUEhvTXVLT0FYZWxQUnYzc2VHMTFRL1VI?=
 =?utf-8?B?WlpNdklIU2h4M25VMVZjWkE0d3N5d0czZDdpQzJSam5Vc2V3QmJYYnRrdnZ3?=
 =?utf-8?B?K2FUYzdMdERFazlxd1ZwV0ErM09pWHNUMk4rM3p0R0ZIaElOQWcrNmtyaG1M?=
 =?utf-8?B?L2ZzNERyMmF4N2c3c0N3T1NTS3pjbEh5amFEaEFwY3NFQmFZbUlpV2FEQXhz?=
 =?utf-8?B?cEFRb25xbHh0UjBFWVV2OHJ5Zy9SQXBxSThNMEdtL3FSWjh5WFRXTDBXazhj?=
 =?utf-8?B?SUlWZEpGNk5Pbi9NNHl1cU9ZenBpOU5SUFdyTnM5aHdnb3pqWW9wZ1NEQnBI?=
 =?utf-8?B?emg4ek1Ub2paOXlXSHBscmE0TGZla3p5ZWZRSXI4eDFScW9OSlQ4a21VSmY3?=
 =?utf-8?B?eTdkcForZFBsNVhuNHBqM2RMSU1MSEZrNU1MQmlxcUZNVnd1MEN2VDFRdkdu?=
 =?utf-8?B?WGRZOHIrUEM0MFJQWXlpdXhSMW9MUnZtN2F3cHRBV3hDZGQ3N1lDRjVyRlFS?=
 =?utf-8?B?MEZmODc2MFhxeUVKWCs3ZGdKL0NRTHRHcmsyNE0yY1RpWXBmTjdFRkR2VFRS?=
 =?utf-8?B?TlN4QVN3RUFjZzcra0ZpeDhSclBsNFBmSEdtNkxOcGJuS2gwQ2xLMU9BVU5S?=
 =?utf-8?B?NU12cEIzZ0Jtbi9EUjEwY3BxZXFsd1krcXR0cEljcm9OdWxIeU05UlM2aVpL?=
 =?utf-8?B?ditMRjVrOENIeGhVOTJOQUZnd25ubFIrRjZxQ21qSkpKcXU2aExRbncwWjhv?=
 =?utf-8?B?eUxRM1NZK05zSytKU1ArM3Y2MDNMVnErcVhPNzg5ZEhSSE9BWHp2T3k2RGdq?=
 =?utf-8?Q?aRr8b0YJbgZOGb+gHw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTRySlZiY3BoMlM2Ny84Q01RNURlVFF2NTN1OGhLSGE3UG9sT2JiYXJpRnpU?=
 =?utf-8?B?V2Z4U3BFWG92cERIT1RHTFBlbGFJUEdTdmYzUmFjbWlyQzFlbitacTdhV3cr?=
 =?utf-8?B?WXBGcCtBT0ZqQzBmY2Y2d21EWENhTW1UVGczVHNzcW8yK00wZ1E0djZhY1dz?=
 =?utf-8?B?eVFQc2pJZlJtU3NDbElwWFprT0lvMEp2N24wQ2lNY2ZLZ3FmaWxTYWloSlB3?=
 =?utf-8?B?cThuejhZUWtJbStqdW9yN3doZVZJVnNDNENJMTdsOUNpNkQ3WXdKWUFEUnRI?=
 =?utf-8?B?WmgwQk9mcnYzQTFZd0d4ZHZVaDlhVlQvVkJoQmNYa0VtWWhQdU1UWkNTMmYz?=
 =?utf-8?B?ZU5NWjhvWnMwVU0rdmNKQ2ZiL213SlRZbHpKeU5WelRNRkhzdGNiK1VTV3pp?=
 =?utf-8?B?OXNsRFh1NnZhc3FZZWsvSHRKSkNJa1didC91WjlRUjk4QXV6ZzhNSDQwZlNI?=
 =?utf-8?B?RUp2QTZrNEJMTzliLzlCRFkrQkVvRDlzdW9iTHZVL0RnNEwzeTdUNHpxaWZo?=
 =?utf-8?B?NnNJd1dVbktVQTRZYU1rTkZNWjZseER5amFKaFdJNTVsNG9XZUdGR3RIcmNz?=
 =?utf-8?B?TFhWT0ZuQXlKQmhpb3JWZ0hWVGtlOUpkSlIvUER3U3Z6YXBQVUE5SnJPNDZJ?=
 =?utf-8?B?NnlaZFFUR3VZZi9Kck5BZVQvMFdEZUFUSy96b2hWVlB3VTZMZ01EV2g3c0F4?=
 =?utf-8?B?NUUzTFRzclRsY0pDTktGbHlCdEhpS2wwdHJNUVFETTdtTTk3SXFQMmtFZDFG?=
 =?utf-8?B?bC8waDcxSkMrY3dDejV2ckdobGJKdWZ1YTFndEUyeTJuckgvWk9KdnhvWDVW?=
 =?utf-8?B?L2VRa2NpYU5LSUZCMk44N3B2TERXL2pkZXFXeU5ndjZZVVRmZ3l0b3BrYXls?=
 =?utf-8?B?a3R4bklpejJ2aHlDSkNFZ2pSQ1VlVkJISjNOV0FEOUhEZGhoNWQ5QmpYTEtP?=
 =?utf-8?B?eGJlcktZd2xxZkJ1QWdvYU9iRjk2cmdoWjNEN0puanRQb3RRWjY2SThST1Rq?=
 =?utf-8?B?Q0xZSm1vaGZiZUtxbzdmT0tObDR6U2NXTVdKVVNVanB1cmlTVWk1YlNFSi92?=
 =?utf-8?B?Y3dJVTFqSm9xNzFLRXM2eFN5NitaNGRHd250Ykw4SkpTSmNMZnhsR0w4NmNV?=
 =?utf-8?B?amVkWEIzdno0eWYvMUt5MjR1ZHdOcmxxL3lvY2w1d2Y5RU9xK1Q1eVZ1dk55?=
 =?utf-8?B?V21LRnFRbFVEQkF6QzhwY0FZQ3dHbVVYWjFtYWh6a1dBUVFValdIWCtkUmN4?=
 =?utf-8?B?ZWJ1RExycGRqMVVPQVVVNWZGNUJXSWY4SkJ5blJGVk5icDRibUVyeDlmTWFk?=
 =?utf-8?B?VEExNTVmdHRkR1g4SFhZVHA0cmYrck9GSitIaWNBNk90ZmhlZGVJL3VtZnpy?=
 =?utf-8?B?YW9lQXBDaCtiaGpJVm5GS0sxZUZXcTJTeDY3WHB2enF5TXZVWUtaMnNZWkhJ?=
 =?utf-8?B?eUdBNXVEN0VEMS9BZTJ2RHdRakZ0TlViOUdGUmozMmlDZXFHRi9uTE9MRWw0?=
 =?utf-8?B?NXVUNmZZK1JvZ2pibHVMckhhUHNuOUVCaEt2VUdkNlp5MGtNa3RjZjNySENO?=
 =?utf-8?B?U3htRmF5NnRMcEFic1pPVFk3cks1S3lTbnZsYmdXQVZzTTRFbHRhUWpOZmY0?=
 =?utf-8?B?V1NvQWxMTHpjMmxKaTRyc2ZXSTRHZWg0N0R0cHk2ckRNcUwzM1NtZ1gxUzNM?=
 =?utf-8?B?em4vci9namV2Vkp3RjFBVERYR1NScTFKTTl0dmdLdjI1REhxRHlOZS8zWEZX?=
 =?utf-8?B?REM5M1FOUXhWeXFnK2NJM0JpcGJIa0ZEZXgycHFxYTB4Wml3OVRaOWo0NXlP?=
 =?utf-8?B?MzVpTUZmUUJEc2Q1UUMzVEpPRk80cFN5RTg4WGZxK0o2YTB4UzlCNzFrVUFz?=
 =?utf-8?B?ZzA2cGdFbDhPanJsMXRONnB2VTlGMXBudWM0eW1IalFzdWNrSEdSMDVQcFVj?=
 =?utf-8?B?TURNMS9jSlAxRFF6K2VZL3ZCVmRER0o1TWNtVmdsem5FcXl1eUd6dVR2UlFa?=
 =?utf-8?B?MkFwQ0ZWWG9VcGhZakRjVXRlRnF4REZOdFY1bDZMV0tRUWRGdXE5UmlzYWgr?=
 =?utf-8?B?NjgyeFNQZVpHbmtqZnJ1aERUeGRwYytpNFBrSDd0OTU1c2djUDczZk5oZWtK?=
 =?utf-8?Q?WSuklrQmHBIZhbDFWZmN69GSE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b36ac6e8-4433-457d-3959-08dc9a6e7732
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 08:10:41.7808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oX4X2fRGk5sl5anA63MB0HVvFWNZZZAph+IrdbINlvsPx0XjPsEGg19PfrDDwOwi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6662
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

--------------8KDgSUGs0q4mCciVzELO04lL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 02.07.24 um 10:08 schrieb Christian König:
> Am 02.07.24 um 03:46 schrieb Icenowy Zheng:
>> 在 2024-07-01星期一的 13:40 +0200，Christian König写道：
>>> Am 29.06.24 um 22:51 schrieb Icenowy Zheng:
>>>> 于 2024年6月30日 GMT+08:00 03:57:47，Jiaxun Yang
>>>> <jiaxun.yang@flygoat.com>  写道：
>>>>> 在2024年6月29日六月 上午6:22，Icenowy Zheng写道：
>>>>> [...]
>>>>>> @@ -302,6 +302,10 @@ pgprot_t ttm_io_prot(struct
>>>>>> ttm_buffer_object *bo,
>>>>>> struct ttm_resource *res,
>>>>>>                  caching = res->bus.caching;
>>>>>>          }
>>>>>>
>>>>>> +       /* Downgrade cached mapping for non-snooping devices */
>>>>>> +       if (!bo->bdev->dma_coherent && caching == ttm_cached)
>>>>>> +               caching = ttm_write_combined;
>>>>> Hi Icenowy,
>>>>>
>>>>> Thanks for your patch! You saved many non-coh PCIe host
>>>>> implementations a day!.
>>> Ah, wait a second.
>>>
>>> Such a thing as non-coherent PCIe implementation doesn't exist. The
>>> PCIe
>>> specification makes it mandatory for memory access to be cache
>>> coherent.
>> Really? I tried to get PCIe spec 2.0, PCI spec 3.0 and PCI-X addendum
>> 1.0, none of this explicitly requires the PCIe controller and the CPU
>> being fully coherent. The PCI-X spec even says "Note that PCI-X, like
>> conventional PCI, does not require systems to support coherent caches
>> for addresses accessed by PCI-X requesters".
>
> See the very first PCI specification, AGP 2.0 and the PCIe extension 
> for non-snooped access.
>
> Originally it wasn't well defined what the PCI 1.0 spec meant with 
> coherency (e.g. snooping vs uncached).
>
> AGP was the first specification which explicitly defined that all AGP 
> memory accesses must be non-snooped and all PCI accesses must snoop 
> the CPU caches.
>
> PCIe then had an extension which defined the "No Snooping Attribute" 
> to allow emulating the AGP behavior.
>
> For the current PCIe 6.1 specification the non-snoop extension was 
> merged into the base specification.
>
> Here see section "2.2.6.5 No Snoop Attribute", e.g. "Hardware enforced 
> cache coherency expected"
>
> As well as the notes under section 7.5.3.4 Device Control Register:
>
> Enable No Snoop - If this bit is Set, the Function is permitted to Set 
> the No Snoop bit in the Requester
> Attributes of transactions it initiates that do not require hardware 
> enforced cache coherency (see Section 2.2.6.5 ).
>
> To summarize it: Not snooping caches is an extension, snooping caches 
> is mandatory.
>
>> In addition, in the perspective of Linux, I think bypassing CPU cache
>> of shared memory is considered as coherent access too, see
>> dma_alloc_coherent() function's naming.
>
> Yes that's correct, but this is for platform devices. E.g. other I/O 
> from drivers who doesn't need to work with malloced system memory for 
> example.
>
> We have quite a bunch of V4L, sound and I also think network devices 
> which work like that. But those are non-PCI devices.
>
>>> There are a bunch of non-compliant PCIe implementations which have
>>> broken cache coherency, but those explicitly violate the
>>> specification
>>> and because of that are not supported.
>> Regardless of it violating the spec or not, these devices work with
>> Linux subsystems that use dma_alloc_coherent to allocate DMA buffers
>> (which is the most common case), and GPU drivers just give out cryptic
>> error messages like "ring gfx test failed" without any mention of
>> coherency issues at all, which makes the fact that Linux DRM/TTM
>> subsystem currently requires PCIe snooping CPU cache more obscure.
>
> No, they don't even remotely work. You just got very basic tests working.
>
> Both the Vulkan as well as the OpenGL specification require that you 
> can import "normal" malloced() system memory into the GPU driver.
>
> This is not possible without a cache coherent platform architecture. 
> So you can't fully support those APIs.
>
> We exercised this quite extensively already and even have a 
> confirmation from ARM engineers that the approach of attaching just 
> any PCIe root to an ARM IP core is not supported from their side.
>
> And if I'm not completely mistaken the RISC-V specification was also 
> updated to disallow stuff like this.

Googling helps: https://github.com/riscv/riscv-platform-specs/issues/83

Regards,
Christian.

>
> So yes you can have boards which implement non-snooped PCIe, but you 
> get exactly zero support from hardware vendors to run software on it.
>
> Regards,
> Christian.
>
>>> Regards,
>>> Christian.
>>>
>>>>> Unfortunately I don't think we can safely ttm_cached to
>>>>> ttm_write_comnined, we've
>>>>> had enough drama with write combine behaviour on all different
>>>>> platforms.
>>>>>
>>>>> See drm_arch_can_wc_memory in drm_cache.h.
>>>>>
>>>> Yes this really sounds like an issue.
>>>>
>>>> Maybe the behavior of ttm_write_combined should furtherly be
>>>> decided
>>>> by drm_arch_can_wc_memory() in case of quirks?
>>>>
>>>>> Thanks
>>>>>
>>>>>> +
>>>>>>          return ttm_prot_from_caching(caching, tmp);
>>>>>>    }
>>>>>>    EXPORT_SYMBOL(ttm_io_prot);
>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
>>>>>> b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>>> index 7b00ddf0ce49f..3335df45fba5e 100644
>>>>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>>> @@ -152,6 +152,10 @@ static void ttm_tt_init_fields(struct
>>>>>> ttm_tt *ttm,
>>>>>>                                 enum ttm_caching caching,
>>>>>>                                 unsigned long extra_pages)
>>>>>>    {
>>>>>> +       /* Downgrade cached mapping for non-snooping devices */
>>>>>> +       if (!bo->bdev->dma_coherent && caching == ttm_cached)
>>>>>> +               caching = ttm_write_combined;
>>>>>> +
>>>>>>          ttm->num_pages = (PAGE_ALIGN(bo->base.size) >>
>>>>>> PAGE_SHIFT) + extra_pages;
>>>>>>          ttm->page_flags = page_flags;
>>>>>>          ttm->dma_address = NULL;
>>>>>> diff --git a/include/drm/ttm/ttm_caching.h
>>>>>> b/include/drm/ttm/ttm_caching.h
>>>>>> index a18f43e93abab..f92d7911f50e4 100644
>>>>>> --- a/include/drm/ttm/ttm_caching.h
>>>>>> +++ b/include/drm/ttm/ttm_caching.h
>>>>>> @@ -47,7 +47,8 @@ enum ttm_caching {
>>>>>>
>>>>>>          /**
>>>>>>           * @ttm_cached: Fully cached like normal system memory,
>>>>>> requires that
>>>>>> -        * devices snoop the CPU cache on accesses.
>>>>>> +        * devices snoop the CPU cache on accesses. Downgraded
>>>>>> to
>>>>>> +        * ttm_write_combined when the snooping capaiblity is
>>>>>> missing.
>>>>>>           */
>>>>>>          ttm_cached
>>>>>>    };
>>>>>> -- 
>>>>>> 2.45.2
>

--------------8KDgSUGs0q4mCciVzELO04lL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 02.07.24 um 10:08 schrieb Christian König:<br>
    <blockquote type="cite" cite="mid:ff1bf596-83cb-4b3e-a33a-621ac2c8171c@amd.com">
      
      Am 02.07.24 um 03:46 schrieb Icenowy Zheng:<br>
      <blockquote type="cite" cite="mid:6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me">
        <pre class="moz-quote-pre" wrap="">在 2024-07-01星期一的 13:40 +0200，Christian König写道：
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Am 29.06.24 um 22:51 schrieb Icenowy Zheng:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">于 2024年6月30日 GMT+08:00 03:57:47，Jiaxun Yang
<a class="moz-txt-link-rfc2396E" href="mailto:jiaxun.yang@flygoat.com" moz-do-not-send="true">&lt;jiaxun.yang@flygoat.com&gt;</a> 写道：
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">在2024年6月29日六月 上午6:22，Icenowy Zheng写道：
[...]
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">@@ -302,6 +302,10 @@ pgprot_t ttm_io_prot(struct
ttm_buffer_object *bo,
struct ttm_resource *res,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;caching = res-&gt;bus.caching;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}

+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Downgrade cached mapping for non-snooping devices */
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!bo-&gt;bdev-&gt;dma_coherent &amp;&amp; caching == ttm_cached)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;caching = ttm_write_combined;
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Hi Icenowy,

Thanks for your patch! You saved many non-coh PCIe host
implementations a day!.
</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Ah, wait a second.

Such a thing as non-coherent PCIe implementation doesn't exist. The
PCIe 
specification makes it mandatory for memory access to be cache
coherent.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Really? I tried to get PCIe spec 2.0, PCI spec 3.0 and PCI-X addendum
1.0, none of this explicitly requires the PCIe controller and the CPU
being fully coherent. The PCI-X spec even says &quot;Note that PCI-X, like
conventional PCI, does not require systems to support coherent caches
for addresses accessed by PCI-X requesters&quot;.</pre>
      </blockquote>
      <br>
      See the very first PCI specification, AGP 2.0 and the PCIe
      extension for non-snooped access.<br>
      <br>
      Originally it wasn't well defined what the PCI 1.0 spec meant with
      coherency (e.g. snooping vs uncached).<br>
      <br>
      AGP was the first specification which explicitly defined that all
      AGP memory accesses must be non-snooped and all PCI accesses must
      snoop the CPU caches.<br>
      <br>
      PCIe then had an extension which defined the &quot;No Snooping
      Attribute&quot; to allow emulating the AGP behavior.<br>
      <br>
      For the current PCIe 6.1 specification the non-snoop extension was
      merged into the base specification.<br>
      <br>
      Here see section &quot;2.2.6.5 No Snoop Attribute&quot;, e.g. &quot;Hardware
      enforced cache coherency expected&quot;<br>
      <br>
      As well as the notes under section 7.5.3.4 Device Control
      Register:<br>
      <br>
      Enable No Snoop - If this bit is Set, the Function is permitted to
      Set the No Snoop bit in the Requester<br>
      Attributes of transactions it initiates that do not require
      hardware enforced cache coherency (see Section 2.2.6.5 ).<br>
      <br>
      To summarize it: Not snooping caches is an extension, snooping
      caches is mandatory.<br>
      <br>
      <blockquote type="cite" cite="mid:6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me">
        <pre class="moz-quote-pre" wrap="">In addition, in the perspective of Linux, I think bypassing CPU cache
of shared memory is considered as coherent access too, see
dma_alloc_coherent() function's naming.</pre>
      </blockquote>
      <br>
      Yes that's correct, but this is for platform devices. E.g. other
      I/O from drivers who doesn't need to work with malloced system
      memory for example.<br>
      <br>
      We have quite a bunch of V4L, sound and I also think network
      devices which work like that. But those are non-PCI devices.<br>
      <br>
      <span style="white-space: pre-wrap">
</span>
      <blockquote type="cite" cite="mid:6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">There are a bunch of non-compliant PCIe implementations which have 
broken cache coherency, but those explicitly violate the
specification 
and because of that are not supported.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Regardless of it violating the spec or not, these devices work with
Linux subsystems that use dma_alloc_coherent to allocate DMA buffers
(which is the most common case), and GPU drivers just give out cryptic
error messages like &quot;ring gfx test failed&quot; without any mention of
coherency issues at all, which makes the fact that Linux DRM/TTM
subsystem currently requires PCIe snooping CPU cache more obscure.</pre>
      </blockquote>
      <br>
      No, they don't even remotely work. You just got very basic tests
      working.<br>
      <br>
      Both the Vulkan as well as the OpenGL specification require that
      you can import &quot;normal&quot; malloced() system memory into the GPU
      driver.<br>
      <br>
      This is not possible without a cache coherent platform
      architecture. So you can't fully support those APIs.<br>
      <br>
      We exercised this quite extensively already and even have a
      confirmation from ARM engineers that the approach of attaching
      just any PCIe root to an ARM IP core is not supported from their
      side.<br>
      <br>
      And if I'm not completely mistaken the RISC-V specification was
      also updated to disallow stuff like this.<br>
    </blockquote>
    <br>
    Googling helps:
    <a class="moz-txt-link-freetext" href="https://github.com/riscv/riscv-platform-specs/issues/83">https://github.com/riscv/riscv-platform-specs/issues/83</a><br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ff1bf596-83cb-4b3e-a33a-621ac2c8171c@amd.com"> <br>
      So yes you can have boards which implement non-snooped PCIe, but
      you get exactly zero support from hardware vendors to run software
      on it.<br>
      <br>
      Regards,<br>
      Christian.<br>
      <br>
      <blockquote type="cite" cite="mid:6303afecce2dff9e7d30f67e0a74205256e0a524.camel@icenowy.me">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Unfortunately I don't think we can safely ttm_cached to
ttm_write_comnined, we've
had enough drama with write combine behaviour on all different
platforms.

See drm_arch_can_wc_memory in drm_cache.h.

</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Yes this really sounds like an issue.

Maybe the behavior of ttm_write_combined should furtherly be
decided
by drm_arch_can_wc_memory() in case of quirks?

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Thanks

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">+
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return ttm_prot_from_caching(caching, tmp);
&nbsp; }
&nbsp; EXPORT_SYMBOL(ttm_io_prot);
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
b/drivers/gpu/drm/ttm/ttm_tt.c
index 7b00ddf0ce49f..3335df45fba5e 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -152,6 +152,10 @@ static void ttm_tt_init_fields(struct
ttm_tt *ttm,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum ttm_caching caching,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long extra_pages)
&nbsp; {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/* Downgrade cached mapping for non-snooping devices */
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (!bo-&gt;bdev-&gt;dma_coherent &amp;&amp; caching == ttm_cached)
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;caching = ttm_write_combined;
+
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ttm-&gt;num_pages = (PAGE_ALIGN(bo-&gt;base.size) &gt;&gt;
PAGE_SHIFT) + extra_pages;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ttm-&gt;page_flags = page_flags;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ttm-&gt;dma_address = NULL;
diff --git a/include/drm/ttm/ttm_caching.h
b/include/drm/ttm/ttm_caching.h
index a18f43e93abab..f92d7911f50e4 100644
--- a/include/drm/ttm/ttm_caching.h
+++ b/include/drm/ttm/ttm_caching.h
@@ -47,7 +47,8 @@ enum ttm_caching {

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/**
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @ttm_cached: Fully cached like normal system memory,
requires that
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * devices snoop the CPU cache on accesses.
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * devices snoop the CPU cache on accesses. Downgraded
to
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * ttm_write_combined when the snooping capaiblity is
missing.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ttm_cached
&nbsp; };
-- 
2.45.2
</pre>
              </blockquote>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------8KDgSUGs0q4mCciVzELO04lL--
