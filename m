Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A87590B290
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 16:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B4310E3FD;
	Mon, 17 Jun 2024 14:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KE6RNwGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CC410E3FB;
 Mon, 17 Jun 2024 14:42:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyUhNF0p3dyALm/R4JmOPaB9J5DLBIyBKcLUMwBQu8v7qbcecRGfoASzqthxVOewVhmBuy7xNRcJbtw+n8NkczVAsiFtejpNx1O9rFbdr3CzaQuZCxIazYEInA+YLUGzi09irnvxIKDzBlp+tk0in0qCO2F5RBtFH8e3HqhDNpolcnFuuolRITyRfwamZQ8C+j1AIL1iq23dpO9F1lYaYh7IpeaCVybN6fCGD6ic2qhO77f2gaPjtxT/AkiZVPIc64MZtj6ijtBVTUW8trPfPkSKmMt55/MG6taXm1oK090J9JdMzalfSKio2iqP35Ofl7xKsH1y3/iJTqmqvFxtJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1c006+ZN0Vr7MME+mIuWuSdSCiDXPJaxuYb5AUp2s1k=;
 b=BsPxMOdQtAFvdGAYEzIxuFPsfGNajxUi/74wpSJFRWzYX71JecKeHvC6yYJAPP+msFlipFPblWHn79xNXu5oUZ/8zls8/FUoMzBN1G5b5CRHIWqrLl/C3mTD3s9L6+3ufFJXT0Pxp2tmlVzwCNmMBTMzAgqE9BZujzbK9zicZgizmdow9sZr4qMLa58mgifGmE5GK0wePWPftq5m4RjSHD3uYLzL7lgYjeQxceq4zu6DdCmHFzZH3NU0dwrhm++NioIvy9voiAZgAIXTNeIisoKDNLEQ0L3ctvGjAg3ZCZxv0dhxfR+oL7R5fsd1G6I40lMaMl79j+XfCi03/WqpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c006+ZN0Vr7MME+mIuWuSdSCiDXPJaxuYb5AUp2s1k=;
 b=KE6RNwGyCSEnw/77SPn0eG6fV2GggroeYJM8fFWqx24Eflv33Epg+rD5DeAMPBZ+b7K2tosSc/QQ9jwWKwToZB8noeJPdr8ea9hai15pP/3e5iuDbTigtckO8Svtd9HAetxJhv2tVBDp69PrTJvD7cp9ejHIYnsZcoO8j4C8/og=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5684.namprd12.prod.outlook.com (2603:10b6:303:1a1::21)
 by CH2PR12MB4167.namprd12.prod.outlook.com (2603:10b6:610:7a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 14:42:33 +0000
Received: from MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105]) by MW5PR12MB5684.namprd12.prod.outlook.com
 ([fe80::9eac:1160:c373:f105%6]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 14:42:33 +0000
Content-Type: multipart/alternative;
 boundary="------------NNVOUGbb5DaC86WVN8PVC809"
Message-ID: <e7a814fc-7b1a-4e32-8868-292be004f920@amd.com>
Date: Mon, 17 Jun 2024 16:42:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: make duplicated EOP packet for GFX7/8
 have real content
To: Icenowy Zheng <uwu@icenowy.me>, Alex Deucher <alexander.deucher@amd.com>, 
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
 <1e5f86991635b9045e91fab6397cda87555f85ff.camel@icenowy.me>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <1e5f86991635b9045e91fab6397cda87555f85ff.camel@icenowy.me>
X-ClientProxiedBy: FR0P281CA0225.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::13) To MW5PR12MB5684.namprd12.prod.outlook.com
 (2603:10b6:303:1a1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5684:EE_|CH2PR12MB4167:EE_
X-MS-Office365-Filtering-Correlation-Id: 8216be67-09af-4654-8ec9-08dc8edbb8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVpaMlVUNHRyU3BiR0RuNWFkZHFWbFBpdkhuVFIzaEJ6c2kzUzlzSm1mWmZm?=
 =?utf-8?B?cy9Ha1o5NmFhdjBxZFcxRWt6WU9sdjhLa0N6bTFnRUhLOHpoNmtlT0tQUVdZ?=
 =?utf-8?B?cWxIOENqdE13Tk1rOU1GdzB4S2trSk1OSGYrcnlhbStPVnZoZ2hNSlBrUXJP?=
 =?utf-8?B?aHZrQ2pYd2dtMVFuZVdlc2duUTVrMCtsVTUwTm9IOGNBYWZxU2p0M2VzOGFN?=
 =?utf-8?B?SHFMVEhqbGNnZDhEQ3NiUGJndWZhdC9nV2h5c3ZGNktrYTg4NnZkc2VHaUFC?=
 =?utf-8?B?YitKZTk3aktNeStPU1JxQzB2SFRONmZveE8zK0JTV25LSlZNVFZXSmx4MGI0?=
 =?utf-8?B?MGFBajVsaDFtYWRwSXhJdGtOaCsyWTNGUXowN0hhKy9OSW5vZEVRbldISUg2?=
 =?utf-8?B?WVFZNElHa2tNekNEcERkaHZ5ODNQZWoyOVdCZlVSWmIyWDRmK20yakU0SXF2?=
 =?utf-8?B?VGdGS0tORlRxbnJTUFdxQnJiM0w3YitkTm9jbkoxR0lIWWYybFN5RVZVaTda?=
 =?utf-8?B?K01ZU0t6ampEQ25kcVlZaHRqcjI1NXJTVlNTMUpzM2czQ0RtWlJzZHhyTGJ6?=
 =?utf-8?B?cE0wYnV6cG5sYVhvUlNMTnVmM3BINXVkOXN5K3pJUHFXQy9xN1A2Qi9qUGUr?=
 =?utf-8?B?UlZYMjYwV3NULzh6ZDIvNnN3bThHMENwbkYwN2xqeisrdVdiV0RGMlhhQ2J0?=
 =?utf-8?B?Q0dPc1lwMTdlNFRJdWRVakVaWEdKZnBxWVd6bVh6QURFVFgzRU9HSDFUTmJo?=
 =?utf-8?B?VHBpVTR3NVJpa3N3QTJta1lFd045YVRrT1Vrd0N6eTlUMTdTbDlMblI4djFD?=
 =?utf-8?B?UW5hKzhidThRc2RGVU5YaEhaOXQ4NW9GRGhOSU9ROHRzb25HRDNTeHVBa2hP?=
 =?utf-8?B?aVJlOUJOcmwxeExENHpWdTc5aXFncWtDbGVRUWZGZFJKM0tndmMwTk9qNzlt?=
 =?utf-8?B?M1BwcHAyL2RsZTVrRTFhSWxCeWtiaHdyU1JJdUZoNFgyTzQ5aitEbVhYQmQz?=
 =?utf-8?B?TU4wTmRZUVBlc1JhN2dlNUZ3Q2tLRityOWNMVU9kbnlEMXp4S3dGNittOVZm?=
 =?utf-8?B?NXFhVzNiQ21MKzFTYmJtMWtrU2lJWEFjaERYZHI3ZEpwaTUrV1VXRTV6aGVi?=
 =?utf-8?B?OEw1Z0F4ZEhNVTFZN0VEVUFEQWI4alYweC9Ob2JObmF0djlEbjR5clV0K2Na?=
 =?utf-8?B?eXZXS1Vnb25FWDk2a0U5U2FGMXZHZWZCWFdhS3RJUXNWYlliNVdlamlzR01p?=
 =?utf-8?B?REd4RmJmQkx2eXMyV2JWQ0x4K2hrNklTNEpmd3lHMmJ6bzJxdjNWOVpGUFNO?=
 =?utf-8?B?d1BpUVlDMTZXeGljRmlBcVRDbFp3L2p2ODhiNW9qTkI4S2c2OW5mTGl2NVFT?=
 =?utf-8?B?dkpPSVdxalVKeG9yRkpiVmcxclRWTGNXZGJkMDdlVmp6OUlMczNhVzZuZmdk?=
 =?utf-8?B?RDkwUUFJR3MwQjZyajVQK1hwQms0cWI5cEFLM1ZlUDJQaFhyZHI4dmFCazdu?=
 =?utf-8?B?b3pVL1E5ajN5ckdzcUdSZWVML0drTkk5YlV4UVlYOEI1a003TGZ1RStnSW9o?=
 =?utf-8?B?VTAvUWV2OSsrcDd1U0JGTWErOGNnRW96d3o1czZPaWZsd0tXQ3V6YUorOHdG?=
 =?utf-8?B?aHc1K3VxeFYzVmlmZ2dYc01hR0dtQWJlZjRCZmFvZlFVaHBiU0laVlNsTC9C?=
 =?utf-8?B?ZlZRR3JLOThSc3VSWDIxWjZXak5aaGNnZ0tBajN5OUl3Ri9JT1puOUtJNkRx?=
 =?utf-8?Q?4V5ss2tdVQCbE18CTviHrvpjsSHK8IaC9aEj9RC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR12MB5684.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejhWQ2VMdjRLMmlLN0ZVZEdteGhyZjF2cU9DSXFaQ3c1eXl4UWxmaFB3eTlt?=
 =?utf-8?B?TUx6d1c3Ri9WRFN5N085MU1EYkVvUWVEWTdBQUdrTk1lR2RTbVdvOFc5MStI?=
 =?utf-8?B?UnN1RmU5b0NoVTRVdUd0RFRueEwzc3RTcjRNS3NPMDUxRzNodDk5aDJmc2I1?=
 =?utf-8?B?WnErTGJ1NXlGT1I0NDBLMEhVZzRYTUhWR2xhRVRlQ3hnMWY0OWdMSkVRZm8x?=
 =?utf-8?B?aVFpUmVhVzF3Q0hpcHlSQ2taLzF2cGhXSE5GSHFnT2VieWF6V0VkSVhEZ0lu?=
 =?utf-8?B?L1BWSDFBMUdrOVNpSTdhSXR2WWYvRlpwWitxR0ZxaDlZYk15ck8vUHAwS05y?=
 =?utf-8?B?NG5wRHRaeVZTOW05a3YvVnBucVU2aVNyWVArdWxSamdnblpVVUFWSFBpdFpW?=
 =?utf-8?B?RVh6dm4xS1B6YWoyNFVSczd2WmV6ZDNzSllKRG91Q3JiT0MvdHBGbWZJOFdG?=
 =?utf-8?B?bS9COWFEcDdXamxZZ3N0QUtMNENrcks3eHc4VHJWT2V4RDhsS0xscjgybXhG?=
 =?utf-8?B?eEI5bFRwb1RibE1XT3BEajNOVzZzTWdYWHBUZTd5OElDcTlDZGNRRzN6UCti?=
 =?utf-8?B?N1BiNXF1aEFJQW9wMFNDdUNyNk51aUZHWkxXd0MySk92SnpNVGlucFJVR2RX?=
 =?utf-8?B?ajF1WEZGUXA3WGZ6QnEya09hSlVvSFR3NkcwNHVLVS9xNVBlMTZ4L0Z0a2V3?=
 =?utf-8?B?YzgzNzhzaENTZEhVeWlNRmFMeGU1NTRjanZEZ2xOdTZ3aG5wUGx6eFZrYXNR?=
 =?utf-8?B?TFVFTVpIdzNjV3o0ekc4ZHJtYnRzeEo0Ly9MZHVVSTN2MlQyTzNuSHZjUnZG?=
 =?utf-8?B?djkzM0J4NUJnM25HTTUvdmxuMHEwWFg4Y0JTNERKekRBNUxESkRNZXpTYWhp?=
 =?utf-8?B?VlVDOTJsMW9Hek4xZWgyblQ2QW53aVpzWGtmeGV0US9hVGtmbyswTTNueXlG?=
 =?utf-8?B?VFBLZFd5MXdZSzYrODRrc3F1c3hjaEhUZ0JrODlsTC9VcDUrVXhkMGNtVEJ4?=
 =?utf-8?B?d1g2ek8zYmpVTXZZOVRmUklvNWdpS2NtbHFGSmUzblVHWDBjRERpd1VDZm1q?=
 =?utf-8?B?UFNoeXhObTJUY1RHMWwvY0U2R2kxLzhoY3p6a1QydWdpcEljaDEyZmJKUlpo?=
 =?utf-8?B?QldIc0U3Ujl4QlNMZXl1dHFlTktMVUJoTGlhalF6aUxGMUU3ZWM2eXFvbmNL?=
 =?utf-8?B?cUVHY1IxU0RpelFxMVR1YzBuc3UvNGxvLzB0Qlo2ckhBREZqdG1weWN4ak9k?=
 =?utf-8?B?VkFjbEhXUytYa0Jia2YvRk03eXRMZGU1NXFZekRpejBvU3I4Q0grbnV5c3Rs?=
 =?utf-8?B?S3FzWkxvNVU2Ym80WkwrdFd1OUFBMXdIYkgrbEhtZDlLRkovODk0N0Q4Ly9r?=
 =?utf-8?B?MVhBNDZocXk1L1FWbVhVc3RVUGJZL3JjdTlDRHpSYUZhTjJpVXFZTGNidi9L?=
 =?utf-8?B?cTR5dExUUk5SY012VHJGN3Nlc0xHNUFNRHNlYkVMZ0k0M3JCSkFXc0Y3SkhM?=
 =?utf-8?B?QmUwKy90T2tDRkluak5rdjh1STVpNCt4Wm9BUDFJc2RVRFNEYmtNalVsQ0h0?=
 =?utf-8?B?VEJTMUVIQkszaWhEODU5R3AvYnRnYjl6VkRBYW9VWVNHNlRKSHZIcm5xNlhx?=
 =?utf-8?B?Z084RG1lenJtYmM1WEdkZGw1L1U5bGR0UmNLK1BxSEdZZVd6eXA3SjY1V2Nu?=
 =?utf-8?B?bDZzNDJoVjBRRno0Zjg3VVBuWk9oaCtvSGFkWlJsRkpVTWpIN2dlMU9heEtO?=
 =?utf-8?B?aWZXeHJ2Q2Q4U04wM09nVXc0TEFHb0RLMFp5bCtXMWJPOERBSzNGNk9CeGNn?=
 =?utf-8?B?NEQvbUZVZnRXWE5hd2NrSmd5RVd5bmVEZ1JaSXR1ekI4WW5sSEVHN0tuSG5w?=
 =?utf-8?B?QjVJSTcrQ0trZ1M1N2sreFlkNHRnTWE5aEE1UEpyNXhvRXRPZHNCUUJJU1BC?=
 =?utf-8?B?S2huODczbGRMbThmY2E3SjEycUJoKzlUeUFoZENTYnpFQ2xFUHNhOXdieUNP?=
 =?utf-8?B?SG5qd2ZYRGdWOXM4emRRNGkvcVZ3Rmp3VXFwMXZwY2l3cXdqdzVGRjFJaHdV?=
 =?utf-8?B?MXlPZVg3ZjJMWi9icDZsWDVDWHJnVm5XbXJGS1ZONjZQUFJFYVJmR09xVU1R?=
 =?utf-8?Q?EQxrR3mEV5SG17YAnRvZ2a3TV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8216be67-09af-4654-8ec9-08dc8edbb8f9
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5684.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 14:42:33.4457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKZuNFu5O04OElowe6FhwgpTKPU2fNO+BqMivRG3TfTR82VSCMEoke01T05IEkow
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4167
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

--------------NNVOUGbb5DaC86WVN8PVC809
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 17.06.24 um 16:30 schrieb Icenowy Zheng:
> 在 2024-06-17星期一的 15:59 +0200，Christian König写道：
>> Am 17.06.24 um 15:43 schrieb Icenowy Zheng:
>>> 在 2024-06-17星期一的 15:09 +0200，Christian König写道：
>>>> Am 17.06.24 um 15:03 schrieb Icenowy Zheng:
>>>>> 在 2024-06-17星期一的 14:35 +0200，Christian König写道：
>>>>>> Am 17.06.24 um 12:58 schrieb Icenowy Zheng:
>>>>>>> The duplication of EOP packets for GFX7/8, with the former
>>>>>>> one
>>>>>>> have
>>>>>>> seq-1 written and the latter one have seq written, seems to
>>>>>>> confuse
>>>>>>> some
>>>>>>> hardware platform (e.g. Loongson 7A series PCIe
>>>>>>> controllers).
>>>>>>>
>>>>>>> Make the content of the duplicated EOP packet the same with
>>>>>>> the
>>>>>>> real
>>>>>>> one, only masking any possible interrupts.
>>>>>> Well completely NAK to that, exactly that disables the
>>>>>> workaround.
>>>>>>
>>>>>> The CPU needs to see two different values written here.
>>>>> Why do the CPU need to see two different values here? Only the
>>>>> second
>>>>> packet will raise an interrupt before and after applying this
>>>>> patch,
>>>>> and the first packet's result should just be overriden on
>>>>> ordinary
>>>>> platforms. The CPU won't see the first one, until it's polling
>>>>> for
>>>>> the
>>>>> address for a very short interval, so short that the GPU CP
>>>>> couldn't
>>>>> execute 2 commands.
>>>> Yes exactly that. We need to make two writes, one with the old
>>>> value
>>>> (seq - 1) and a second with the real value (seq).
>>>>
>>>> Otherwise it is possible that a polling CPU would see the
>>>> sequence
>>>> before the second EOP is issued with results in incoherent view
>>>> of
>>>> memory.
>>> In this case shouldn't we write seq-1 before any work, and then
>>> write
>>> seq after work, like what is done in Mesa?
>> No. This hw workaround requires that two consecutive write operations
>> happen directly behind each other on the PCIe bus with two different
>> values.
> Well to be honest the workaround code in Mesa seems to not be working
> in this way ...

Mesa doesn't have any workaround for that hw issue, the code there uses 
a quite different approach.

>> To make the software logic around that work without any changes we
>> use
>> the values seq - 1 and seq because those are guaranteed to be
>> different
>> and not trigger any unwanted software behavior.
>>
>> Only then we can guarantee that we have a coherent view of system
>> memory.
> Any more details about it?

No, sorry. All I know is that it's a bug in the cache flush logic which 
can be worked around by issuing two write behind each other to the same 
location.

> BTW in this case, could I try to write it for 3 times instead of 2,
> with seq-1, seq and seq?

That could potentially work as well, but at some point we would need to 
increase the EOP ring buffer size or could run into performance issues.

>>> As what I see, Mesa uses another command buffer to emit a
>>> EVENT_WRITE_EOP writing 0, and commit this command buffer before
>>> the
>>> real command buffer.
>>>
>>>>> Or do you mean the GPU needs to see two different values being
>>>>> written,
>>>>> or they will be merged into only one write request?
>>>>>
>>>>> Please give out more information about this workaround,
>>>>> otherwise
>>>>> the
>>>>> GPU hang problem on Loongson platforms will persist.
>>>> Well if Loongson can't handle two consecutive write operations to
>>>> the
>>>> same address with different values then you have a massive
>>>> platform
>>>> bug.
>>> I think the issue is triggered when two consecutive write
>>> operations
>>> and one IRQ is present, which is exactly the case of this function.
>> Well then you have a massive platform bug.
>>
>> Two consecutive writes to the same bus address are perfectly legal
>> from
>> the PCIe specification and can happen all the time, even without this
>> specific hw workaround.
> Yes I know it, and I am not from Loongson, just some user trying to
> mess around it.

Well to be honest on a platform where even two consecutive writes to the 
same location doesn't work I would have strong doubts that it is stable 
in general.

Regards,
Christian.
--------------NNVOUGbb5DaC86WVN8PVC809
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 17.06.24 um 16:30 schrieb Icenowy Zheng:<br>
    <blockquote type="cite" cite="mid:1e5f86991635b9045e91fab6397cda87555f85ff.camel@icenowy.me">
      <pre class="moz-quote-pre" wrap="">在 2024-06-17星期一的 15:59 +0200，Christian König写道：
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 17.06.24 um 15:43 schrieb Icenowy Zheng:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">在 2024-06-17星期一的 15:09 +0200，Christian König写道：
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Am 17.06.24 um 15:03 schrieb Icenowy Zheng:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">在 2024-06-17星期一的 14:35 +0200，Christian König写道：
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">Am 17.06.24 um 12:58 schrieb Icenowy Zheng:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">The duplication of EOP packets for GFX7/8, with the former
one
have
seq-1 written and the latter one have seq written, seems to
confuse
some
hardware platform (e.g. Loongson 7A series PCIe
controllers).

Make the content of the duplicated EOP packet the same with
the
real
one, only masking any possible interrupts.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Well completely NAK to that, exactly that disables the
workaround.

The CPU needs to see two different values written here.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Why do the CPU need to see two different values here? Only the
second
packet will raise an interrupt before and after applying this
patch,
and the first packet's result should just be overriden on
ordinary
platforms. The CPU won't see the first one, until it's polling
for
the
address for a very short interval, so short that the GPU CP
couldn't
execute 2 commands.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Yes exactly that. We need to make two writes, one with the old
value
(seq - 1) and a second with the real value (seq).

Otherwise it is possible that a polling CPU would see the
sequence
before the second EOP is issued with results in incoherent view
of
memory.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">In this case shouldn't we write seq-1 before any work, and then
write
seq after work, like what is done in Mesa?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
No. This hw workaround requires that two consecutive write operations
happen directly behind each other on the PCIe bus with two different
values.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well to be honest the workaround code in Mesa seems to not be working
in this way ...</pre>
    </blockquote>
    <br>
    Mesa doesn't have any workaround for that hw issue, the code there
    uses a quite different approach.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:1e5f86991635b9045e91fab6397cda87555f85ff.camel@icenowy.me">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
To make the software logic around that work without any changes we
use 
the values seq - 1 and seq because those are guaranteed to be
different 
and not trigger any unwanted software behavior.

Only then we can guarantee that we have a coherent view of system
memory.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Any more details about it?</pre>
    </blockquote>
    <br>
    No, sorry. All I know is that it's a bug in the cache flush logic
    which can be worked around by issuing two write behind each other to
    the same location.<br>
    <br>
    <blockquote type="cite" cite="mid:1e5f86991635b9045e91fab6397cda87555f85ff.camel@icenowy.me">
      <pre class="moz-quote-pre" wrap="">BTW in this case, could I try to write it for 3 times instead of 2,
with seq-1, seq and seq?</pre>
    </blockquote>
    <br>
    That could potentially work as well, but at some point we would need
    to increase the EOP ring buffer size or could run into performance
    issues.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:1e5f86991635b9045e91fab6397cda87555f85ff.camel@icenowy.me">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">As what I see, Mesa uses another command buffer to emit a
EVENT_WRITE_EOP writing 0, and commit this command buffer before
the
real command buffer.

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Or do you mean the GPU needs to see two different values being
written,
or they will be merged into only one write request?

Please give out more information about this workaround,
otherwise
the
GPU hang problem on Loongson platforms will persist.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Well if Loongson can't handle two consecutive write operations to
the
same address with different values then you have a massive
platform
bug.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I think the issue is triggered when two consecutive write
operations
and one IRQ is present, which is exactly the case of this function.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well then you have a massive platform bug.

Two consecutive writes to the same bus address are perfectly legal
from 
the PCIe specification and can happen all the time, even without this
specific hw workaround.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes I know it, and I am not from Loongson, just some user trying to
mess around it.
</pre>
    </blockquote>
    <br>
    Well to be honest on a platform where even two consecutive writes to
    the same location doesn't work I would have strong doubts that it is
    stable in general.<br>
    <br>
    Regards,<br>
    Christian.<br>
  </body>
</html>

--------------NNVOUGbb5DaC86WVN8PVC809--
