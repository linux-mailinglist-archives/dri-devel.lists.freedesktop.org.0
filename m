Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C691195975E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 11:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F384210E5B6;
	Wed, 21 Aug 2024 09:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BSNWS8e/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771CA10E57B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 09:48:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2/17bvnBws1abhAFhg+F0gkmdEfzTuJTmv8RqWE63cA9Z3e56ZQ8jdVrtiXmKBllrOVK1LBdO29Tc4z5O1DgS1VmtGjcD4ItqlsMwdZzOptLcor9c25wCxiVuGnvMUmzfkFK6MEQaAtvP6+o1gcKN4r1XlrEutNgAI9h4xugHgAhK7VwDw6TPGqRhMuG9o6DHrra2VTcLp4Ug3m3gYP/5gTyCGpIawiUi5dTbXQlMliDBiZVteCavxveZDWavU/PKTr/HRjNdQF8tmhQP3wxGp2alBrDBxwp3TF4QgJYYdYlDaAwA4kH1xYqGG2rfMyPRGmz9yPOHZzPFnHXo+yww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rsl9wpMt1Wdu3EGiyGNu+ae7oBaRBwOh7Q43o8JxvWM=;
 b=jy/+k+rIzbhW+nereIEvxbuSjrJCrggdjuTAo1IzLN1tultEgGRQVNC55oag3fOrSXIsaulRviHlxN3Qase1AhBEpw99K5E0lJJrkqdSO+LaGGaxC+alJUO0u9pvsJdWTB9GMHWfq4ALiUJfAADyUgPstUh8jYyQe7wk4fxuyFlPmocahjLyjpSZ0TMZ2eTkP8maSjGIiTA3JiY4iC6WCCdMQ89+/031fn4wZLEaO7LiADnzV5fZH3M/PRlW7gYpQWC9IdCNX6+2GAysin8qf3sOEsEEadTskn6IeaszgKGN+ptqIdJLVQnW5UIRl3hgWTtSYy45iqhKXfNNxTyYzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rsl9wpMt1Wdu3EGiyGNu+ae7oBaRBwOh7Q43o8JxvWM=;
 b=BSNWS8e/hOG2Lx6aBAmrPNCMaJhcn1W5y198N9FSwx/ql2Uj1rkALGFHhhoyrSw5lfx5kMhXERl3amnQM+ZMkwnGq5SRLFboh8OZgHYCMY7ZOgTxzy/SkmJ26LDzFD0U9xXdtHkK5AElrgCZCjbJdzy3YZhTi/ERo5LAm3VWgF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4108.namprd12.prod.outlook.com (2603:10b6:5:220::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 09:48:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 09:48:32 +0000
Content-Type: multipart/alternative;
 boundary="------------BNvMq8TlwnQ2NSd1xdFw1W1s"
Message-ID: <006ba26a-48ed-43e7-8213-72ca0ae553e1@amd.com>
Date: Wed, 21 Aug 2024 11:48:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 David Airlie <airlied@linux.ie>
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <20240710124301.1628-5-christian.koenig@amd.com>
 <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
 <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
 <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
 <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
 <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
 <ZsNTTCfBCpZNrSQH@phenom.ffwll.local>
 <440bb9a5-54b8-46ef-b6db-50110af5c02a@amd.com>
 <5a2f24bce352b65a1fb6e933c406b3ab1efa33e3.camel@linux.intel.com>
 <4d4c532a-ff35-4172-9b71-93f5d130711b@amd.com>
 <bb0a31ea3d82ee370873ca5f1c66ec4eeafabffe.camel@linux.intel.com>
 <d065806d-1d72-4707-bc5f-4da311809295@amd.com>
 <13a47d22fb6753e20046a983126c6fea675beed2.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <13a47d22fb6753e20046a983126c6fea675beed2.camel@linux.intel.com>
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4108:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb71843-2c48-40eb-9a32-08dcc1c66b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUJaLzBOcktTUVRiQkhJcENmSWZWWE05cFZyNWIwSEoxWWdFZ3MrTXFsK1E0?=
 =?utf-8?B?WkdGZy9NV0NMOFVWN2V0aEhWWnpKM2Rha3lXODFEODBaU2VFLzJrOVlHT0cv?=
 =?utf-8?B?NzBpTjhMZTJqK2RYVkJTSUppZFpzRU9kZi9rUWwyNFltRnlhT0d4MW53THBm?=
 =?utf-8?B?dGxkS2h3QVlFTGdqYXNMb2NxU21aUzdHWmxmck1zU1VqRDExVjRTOGhnbWpF?=
 =?utf-8?B?QVYvU25oZHdVMG43TS85a3dDcjRESnFIdDJyL0VrM2IyWEZiZDFDVU9LcWcz?=
 =?utf-8?B?TExNT2hoUVp1VVJJYStqcnVHTEwxK0RvaXpzVUdCaU1McEpEdGRQQ1BYWjhG?=
 =?utf-8?B?ZlU1aEc5bWJqQXFnVjJrb2p5aFdtc1AzQmhHazVWa3FkTWhBVVFpMXFCcklj?=
 =?utf-8?B?azc5UHhLbEd4M1grVGlqd2J3eU8vc1B0ei9YWk1ZcGIyN3JsWFBUQUVFLzda?=
 =?utf-8?B?WGh2WkFXSVFDOEozdXJ1N21McGdZS1U0UTBlZDMvK3JNZnd4WGE4dEVNckpn?=
 =?utf-8?B?ejV6T3hEc1kyQkYyV3ZNVERvYzg1bzZQUHI2K1pSOHRNanVSejNoSC9LcE41?=
 =?utf-8?B?aVhETFJUNnNPQlBkeitIaXFwSE1UTXhncmZFNDNNbHlCbS9nTTdVTW9temJ5?=
 =?utf-8?B?Q211ZzZTanhQQlZScjhLN3drSU9GeHZBM2dOWTl0K3c1T2JwSG9McFpOSVgx?=
 =?utf-8?B?RzhrWEY4TmdEb2pzanJVL3ZuR3pPaGJHdzNsMzNKU1R1Qys2TGVaV1FJMWxl?=
 =?utf-8?B?MWRKdnlZQnZZTWpzOGRJMWdzTDZ3YkxsQUw5T3NLZmpSdTFjd3pNdnJvQ1ZE?=
 =?utf-8?B?L1MxQ0U3TlVsRG04ZEpBSElJTWFaKzZSYXMzaU5aZWtoR2YycjJML2RhUEE1?=
 =?utf-8?B?c21BekpPckozVXpnYkhlQzRDRmY2UkJpU1p3NExKQmEvZTMxVW1VL3NUOWla?=
 =?utf-8?B?SkNNVW1MejY1TE5YWWRPYmFPSVNxQ3FFZ1ZzZ2Q1c3NOT2Iyc0pDekxscUJn?=
 =?utf-8?B?Z3BjU0c0a2FDdWJsc3IxWDBVOEp1cUNYd0xwRkxRWGE0V0xyMWZTakNNWUdJ?=
 =?utf-8?B?Y0dXK21vOXJOMk44K3lUV0RVeWFNS2NDM3lXZEJFT2tEOC9Tb3hSQXFhT3lI?=
 =?utf-8?B?ZXZoUy9JZG9VZWdSVlhBWUlmblQ0bjJaaUpCQlBLRTgwNGJYSk5nOXFmZkdu?=
 =?utf-8?B?bDRHL3NONGdEcS9lQ3h0c0VCd1owS01lbHVCL083MHg3THV1Vkkxa0JucG1K?=
 =?utf-8?B?NFZSQlUyTlpYbHVQKzJuWUl3U3JqTGJPRFZ6WE5Zb1dyVWVlZit5aUMzOGhM?=
 =?utf-8?B?SmwzUC9CMTRyN0pZcjh4c3NMRGZFNzhvTEw2QTBDcEJLTWRJcGhqNklSQTFO?=
 =?utf-8?B?WVhWK21HelJSeTdpa2VDRjVGejZRai83bW9RdHY1WDA4SHVEa2FwVTZBekJo?=
 =?utf-8?B?bXl1YVRON3dOQzJYRXZPY1FIemNkZDhZQkNpRTdVK0d2aFh6VHJLTDZCSW80?=
 =?utf-8?B?NEVTOHc2akpLd25uSXA4SFRSR2txZ1hDZGtaSTl6SjFYR081QXFqRUpKZjNE?=
 =?utf-8?B?OG1oNjQwSVBUd0ZaT3lKcUpRN2lpVGFXSCtSTGVUYXphd1dWUS9MbCtQQVB5?=
 =?utf-8?B?Mit5M3BBVE9GcjhtdUJxamttbnFGWUo5ZWlNd3lCUFNmV0JQdTFxcjlCVlgz?=
 =?utf-8?B?RjVBaERoSFhOSDhPcFJ4dC9KbG5iMy8yeDdlc1lSZW4rSDZlK0V1bW1lVEgv?=
 =?utf-8?Q?FXINF3rxXsM7g1ENCbRHdBHlbr/tcK2OHiATktL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K253RkZTRTRvdXZaazAyUnZULzlpeE5HVTJCUUJuM1BFdDRMa1VNd0pMeWpC?=
 =?utf-8?B?RnJpa2JGdHNYbFMrSHVWSitVVmtMOVVjaUR6bTd3QllxUEkyV3BreXp1UkVB?=
 =?utf-8?B?Q0ZmMi9JRGNuejEvaW5RRnBCQ3N3MWJLNG1CamVhSU16L0ZuRkpFWVFuQmZ3?=
 =?utf-8?B?Qnk1ZkZMRnRleU5DaStDRXBMbCtIUTFrcUVYRDRTYmFTUTl1M2ZPN0VsbkRE?=
 =?utf-8?B?TE1RZ2dkMkpuQVlmbmVDc0E3UGlyL1NuN1FPNmR3VU5uaTVIcXJDTmZhQTN6?=
 =?utf-8?B?TSt6Zy80ajgxMnF4bVp0ajgyUTVFZStBdWhCUTBsWGtxanAyQktleXY0WUZp?=
 =?utf-8?B?ZUNtL0U2dnk4ZklGRStFUHJiNnZubnVpK1VZZWN0YTdmbUdYWHA1LzVtdDZX?=
 =?utf-8?B?Nm5aMG92M0x3d0hQUGI5cGN3ZW5YMVZuaXlMNE9BblJ1YnQzNkloWEpPUnJP?=
 =?utf-8?B?aWpMY3ZwOWRCMG9BbDMyRzZ3Z0xzeGR1TUJVS3BYOUVULzNJWmY5YXIzQjY3?=
 =?utf-8?B?R0FvWDNmd3VSc28wNTEwQVBmUUFZdXZPd3Evb011MWp2UlF6MGJxU1ZxVVBy?=
 =?utf-8?B?VTRrdUNKL2pZeWE5RVFvaFVWTW12Zmg0S0JzM0k4ekc1RktUNVIyMXFBWjhJ?=
 =?utf-8?B?Vkg2WW1tanIwSjNJTlh4QkVPYStpVHhtQTg1SVhCYlNBaG16TlVMU1RkcE54?=
 =?utf-8?B?d1BBQlVYZldjblJIWVFDOHNWZmdvMnQwZ05FK1k1MDJSckZ2bDRNVVVPbkpG?=
 =?utf-8?B?QzRPQlhoL0hjUVZQT0VwMnc4cGxSQ29jZ3dONDh3Uk4rQXRhSHRPSFdYdjl1?=
 =?utf-8?B?VzRFTjVVZ2x6RlhCR1JjY21mMTNDNGVzV2ovZC9PaEZyckZWWGRFZE5jcVJ1?=
 =?utf-8?B?WWZ2YXN4Y1llUXJlUVlFTzdzckxKelMwdFlrSFdQd2VjZDdaUWpzRFhVRHcx?=
 =?utf-8?B?a0VjeGRQaFJpcVRKOHVhUCtSTDdjTGkrRWNkaC9hSmJmSGdOcjhmZzBNMHhO?=
 =?utf-8?B?NjV3Nm9yK2I5NlMveUxuekdyOGhXNDVGSEdPNjN0VTU0UE1aVTB3UkdaNC94?=
 =?utf-8?B?Yk9mYmxwclEzQjdjWm8yZEVJeVFSN0pWd05hdnRkR2UwUFRhemc2MzVDb2dq?=
 =?utf-8?B?MndsOVZpMGI1dVBKNng3cGxrZVZiQ042ODhHcjNBUHhBVURlVHU3WFFDZWwr?=
 =?utf-8?B?Z3Z3R1JaRVpsWEJrZjhmNUxmSFcrWi9DRVU4S0QwbGoraDY3TUhQY0kwYkg3?=
 =?utf-8?B?ZmY1cDZSa3JOTGxSajlKbWxkSXAveXREOFFZMlVheTBWNFE0Q3lITUVBaTRi?=
 =?utf-8?B?dTkzN3A5ZXZ1Qk5XM3J1cGlHL1pTbXhwRkNrR2JtUU1KWVFjN0RQUGNLRFB1?=
 =?utf-8?B?ckdNMnhadHU3MzkvMVdzK3N3YXpuYzR2N2ZnS2xiYXlLQlI5MVI1NzMvZzB3?=
 =?utf-8?B?VnFSSXFSY2pXbjc0YjhQOXRUVTZicDZGV0tGZm1GTzVnMjdxcU9YQnF5bWg5?=
 =?utf-8?B?UVFod0syTUJKSkNRSUhka3MyV3ozZFdUb3BjMnF0S1p4ZjJKZ0s5SXRhY3ZK?=
 =?utf-8?B?R2FTNDlrRWNoN1dTUzZXd1lqc2k5SjhxaW4rR0xVd2M4RHFmQUxmN3hXbzhR?=
 =?utf-8?B?bkpLazR1dlNab0RRZSszTktxU3RxTlFJdEhzUVBZTm9TenUyeWRxVmVoWURN?=
 =?utf-8?B?Y1RlMG5RcUJuUHR3clFtQlVjbUJSVjhJQTUveUtoSHRCcHhvb0hYRmwvVUNV?=
 =?utf-8?B?VnkyeGhwZU5lcVFYelhGeFR3dDJncWRwMWFwRlA1ViszL3ZlVTFjdmpTa3JE?=
 =?utf-8?B?ZDJlQTI5UUs2MTY5WmQ4T2YvZWpDdU9RYnBFVFNscTNDUnlMZU01ZlMzTTYy?=
 =?utf-8?B?NW5vaHBVc1FPUlVSUXhHU3A4UEVYM1lwOG9QNnh0OHFhTEsyRkFheXUvSjB0?=
 =?utf-8?B?S1YwT09OcFBOZitUSEo5VDlrRUhkN3hnSWw4VXNzanZpSUVOeHZSZXJKOXk1?=
 =?utf-8?B?UDFwaEVXRk1DQnFTSE5KK0lVM0VTU3dVTUpxVHo3TWhpOVJtcFJxQ2lNSmU5?=
 =?utf-8?B?c3lwc2Z2eHZ0M0xkR0dPanZ4anFOdW44d2R4QWJ4NXBZS1hucmhZTGtsWmRN?=
 =?utf-8?Q?bxc4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb71843-2c48-40eb-9a32-08dcc1c66b27
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 09:48:32.6156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRVks56KBa7oJuA5Mw1sw8YnVmVv5RlYURXueye7i+Q3dFUiqZJp3vTFxqSY0Iv3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4108
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

--------------BNvMq8TlwnQ2NSd1xdFw1W1s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 21.08.24 um 10:57 schrieb Thomas Hellström:
> On Wed, 2024-08-21 at 10:14 +0200, Christian König wrote:
>> Am 20.08.24 um 18:00 schrieb Thomas Hellström:
>>>> Or why exactly should shrinking fail?
>>> A common example would be not having runtime pm and the particular
>>> bo
>>> needs it to unbind, we want to try the next bo. Example: i915 GGTT
>>> bound bos and Lunar Lake PL_TT bos.
>> WHAT? So you basically block shrinking BOs because you can't unbind
>> them
>> because the device is powered down?
>>
>> I would say that this is a serious NO-GO. It basically means that
>> powered down devices can lock down system memory for undefined amount
>> of
>> time.
>>
>> In other words an application can allocate memory, map it into GGTT
>> and
>> then suspend or even get killed and we are not able to recover the
>> memory because there is no activity on the GPU any more?
>>
>> That really sounds like a bug in the driver design to me.
> It's bad but it's not as bad as it sounds.
>
> Problem is we can't wake up during direct reclaim IIRC due to runtime
> pm lockdep violations, but we can and do fire up a thread to wake the
> device and after the wakeup delay have subsequent shrink calls succeed,
> or punt to kswapd or the oom handler.

Yeah that is obvious. The runtime PM is an interface designed to be used 
from a very high level IOCTL/system call.

And delegating that from a shrinker to a worker is not valid as far as I 
can see, instead of reducing the memory pressure the shrinker would then 
increase it.

> I think that's an orthogonal discussion, though. There are other
> reasons shrinking might fail, like the bo being busy in direct reclaim
> (shouldn't wait for idle there but ok in kswapd), Other points of
> failure is ofc shmem radix tree allocations (not seen one yet, though)
> which might succeed with a smaller bo.
> (Not saying, though, that there isn't more to be done with the xe
> runtime pm implementation).

I don't think that argumentation is valid.

When a BO is locked then that it is ok to not shrink it, but TTM should 
be able to determine all those prerequisites.

In other words the idea of a function returning a BO to the driver is 
that the driver is obligated to shrink that one.

That other necessary allocation can fail like shmen for example is 
obvious as well, but that's why we discussed to allow shrinking BOs 
partially as well.

And I really don't think this discussion is orthogonal. We are basically 
discussing what drivers should do and not should do. And as far as I can 
see the requirement to expose the LRUs to drivers comes up only because 
the driver wants to do something it shouldn't.

>>> And again, all other drm bo shrinkers do this. We just want to do
>>> the
>>> same.
>> Do you have pointers?
> As Sima said, this is complicated but not beyond comprehension: i915
> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c#L317

As far as I can tell what i915 does here is extremely questionable.

     if (sc->nr_scanned < sc->nr_to_scan && current_is_kswapd()) {
....
         with_intel_runtime_pm(&i915->runtime_pm, wakeref) {

with_intel_runtime_pm() then calls pm_runtime_get_sync().

So basically the i915 shrinker assumes that when called from kswapd() 
that it can synchronously wait for runtime PM to power up the device again.

As far as I can tell that means that a device driver makes strong and 
completely undocumented assumptions how kswapd works internally.

> msm:
> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c#L317
> which uses
> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/drm_gem.c#L1426
> that is very similar in structure to what I implemented for TTM.
>
> Panfrost: (although only purgeable objects AFAICT).
> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/drm_gem.c#L1426

 From skimming over the source only MSM actually seems to use this and 
the criteria for rejecting shrinking is everything TTM should know, e.g. 
if a BO is pinned, idle etc...

>>>>> If we bump LRU we could end up with infinite loops.
>>>>> So IMO we need to be able to loop. I don't really care wether
>>>>> we do
>>>>> this as an explicit loop or whether we use the LRU walker, but
>>>>> I
>>>>> think
>>>>> from a maintainability point-of-view it is better to keep LRU
>>>>> walking
>>>>> in a single place.
>>>>>
>>>>> If we return an unlocked object, we'd need to refcount and drop
>>>>> the
>>>>> lru
>>>>> lock, but maybe that's not a bad thing.
>>>>>
>>>>> But what's the main drawback of exporting the existing helper.
>>>> Well that we re-creates exactly the mid-layer mess I worked so
>>>> hard
>>>> to
>>>> remove from TTM.
>>> It doesn't IMO. I agree the first attempt did. This affects only
>>> the
>>> LRU iteration itself and I'm even fine to get rid of the callback
>>> using
>>> a for_ macro.
>> Well, I mean using a for_each approach is objectively better than
>> having
>> a callback and a state bag.
>>
>> But the fundamental question is if drivers are allowed to reject
>> shrinking. And I think the answer is no, they need to be designed in
>> a
>> way where shrinking is always possible.
> Rejects can be out of our control, due to anticipated deadlocks, oom
> and deferring to kswapd.
>
>> What can be that we can't get the necessary locks to evict and object
>> (because it's about to be used etc...), but that are the per-
>> requisites
>> TTM should be checking.
>>
>>>>> In any case, I don't think TTM should enforce a different way
>>>>> of
>>>>> shrinking by the means of a severely restricted helper?
>>>> Well, as far as I can see that is exactly what TTM should do.
>>>>
>>>> I mean the main advantage to make a common component is to
>>>> enforce
>>>> correct behavior.
>>> But if all other drivers don't agree this as correct behavior and
>>> instead want to keep behavior that is proven to work, that's a dead
>>> end.
>> Well no, even if all drivers agree to (for example) drop security
>> precautions it's still not something acceptable.
>>
>> And same thing here, if we block shrinking because drivers think they
>> want their runtime PM implemented in a certain way then upstream
>> needs
>> to block this and push back.
>>
>> As far as I can see it's mandatory to have shrinkers not depend on
>> runtime PM, cause otherwise you run into resources handling which
>> depends on the well behavior of userspace and that in turn in
>> something
>> we can't allow.
> Please see the above explanation for runtime pm, and for the record I
> agree that enforcing disallowed or security violations is a completely
> valid thing.

Putting the TTM issue aside as far as I can tell what i915 is extremely 
questionable and doing the same thing in XE is most likely not something 
we should allow.

Regards,
Christian.

>
> /Thomas
>
>> Regards,
>> Christian.
>>
>>> /Thomas
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> /Thomas
>>>>>

--------------BNvMq8TlwnQ2NSd1xdFw1W1s
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 21.08.24 um 10:57 schrieb Thomas Hellström:<br>
    <blockquote type="cite" cite="mid:13a47d22fb6753e20046a983126c6fea675beed2.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">On Wed, 2024-08-21 at 10:14 +0200, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 20.08.24 um 18:00 schrieb Thomas Hellström:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Or why exactly should shrinking fail?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">A common example would be not having runtime pm and the particular
bo
needs it to unbind, we want to try the next bo. Example: i915 GGTT
bound bos and Lunar Lake PL_TT bos.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
WHAT? So you basically block shrinking BOs because you can't unbind
them 
because the device is powered down?

I would say that this is a serious NO-GO. It basically means that 
powered down devices can lock down system memory for undefined amount
of 
time.

In other words an application can allocate memory, map it into GGTT
and 
then suspend or even get killed and we are not able to recover the 
memory because there is no activity on the GPU any more?

That really sounds like a bug in the driver design to me.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It's bad but it's not as bad as it sounds.

Problem is we can't wake up during direct reclaim IIRC due to runtime
pm lockdep violations, but we can and do fire up a thread to wake the
device and after the wakeup delay have subsequent shrink calls succeed,
or punt to kswapd or the oom handler.</pre>
    </blockquote>
    <br>
    Yeah that is obvious. The runtime PM is an interface designed to be
    used from a very high level IOCTL/system call.<br>
    <br>
    And delegating that from a shrinker to a worker is not valid as far
    as I can see, instead of reducing the memory pressure the shrinker
    would then increase it.<br>
    <br>
    <blockquote type="cite" cite="mid:13a47d22fb6753e20046a983126c6fea675beed2.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">I think that's an orthogonal discussion, though. There are other
reasons shrinking might fail, like the bo being busy in direct reclaim
(shouldn't wait for idle there but ok in kswapd), Other points of
failure is ofc shmem radix tree allocations (not seen one yet, though)
which might succeed with a smaller bo.
(Not saying, though, that there isn't more to be done with the xe
runtime pm implementation).</pre>
    </blockquote>
    <br>
    I don't think that argumentation is valid.<br>
    <br>
    When a BO is locked then that it is ok to not shrink it, but TTM
    should be able to determine all those prerequisites.<br>
    <br>
    In other words the idea of a function returning a BO to the driver
    is that the driver is obligated to shrink that one.<br>
    <br>
    That other necessary allocation can fail like shmen for example is
    obvious as well, but that's why we discussed to allow shrinking BOs
    partially as well.<br>
    <br>
    And I really don't think this discussion is orthogonal. We are
    basically discussing what drivers should do and not should do. And
    as far as I can see the requirement to expose the LRUs to drivers
    comes up only because the driver wants to do something it shouldn't.<br>
    <br>
    <span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:13a47d22fb6753e20046a983126c6fea675beed2.camel@linux.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">And again, all other drm bo shrinkers do this. We just want to do
the
same.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Do you have pointers?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
As Sima said, this is complicated but not beyond comprehension: i915
<a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c#L317">https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c#L317</a></pre>
    </blockquote>
    <br>
    As far as I can tell what i915 does here is extremely questionable.<br>
    <br>
    &nbsp;&nbsp;&nbsp; if (sc-&gt;nr_scanned &lt; sc-&gt;nr_to_scan &amp;&amp;
    current_is_kswapd()) {<br>
    ....<br>
    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; with_intel_runtime_pm(&amp;i915-&gt;runtime_pm, wakeref) {<br>
    <br>
    with_intel_runtime_pm() then calls pm_runtime_get_sync().<br>
    <br>
    So basically the i915 shrinker assumes that when called from
    kswapd() that it can synchronously wait for runtime PM to power up
    the device again.<br>
    <br>
    As far as I can tell that means that a device driver makes strong
    and completely undocumented assumptions how kswapd works internally.<br>
    <br>
    <blockquote type="cite" cite="mid:13a47d22fb6753e20046a983126c6fea675beed2.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">msm:
<a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c#L317">https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c#L317</a>
which uses
<a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/drm_gem.c#L1426">https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/drm_gem.c#L1426</a>
that is very similar in structure to what I implemented for TTM.

Panfrost: (although only purgeable objects AFAICT).
<a class="moz-txt-link-freetext" href="https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/drm_gem.c#L1426">https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/gpu/drm/drm_gem.c#L1426</a></pre>
    </blockquote>
    <br>
    From skimming over the source only MSM actually seems to use this
    and the criteria for rejecting shrinking is everything TTM should
    know, e.g. if a BO is pinned, idle etc...<br>
    <br>
    <span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:13a47d22fb6753e20046a983126c6fea675beed2.camel@linux.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">If we bump LRU we could end up with infinite loops.
So IMO we need to be able to loop. I don't really care wether
we do
this as an explicit loop or whether we use the LRU walker, but
I
think
from a maintainability point-of-view it is better to keep LRU
walking
in a single place.

If we return an unlocked object, we'd need to refcount and drop
the
lru
lock, but maybe that's not a bad thing.

But what's the main drawback of exporting the existing helper.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Well that we re-creates exactly the mid-layer mess I worked so
hard
to
remove from TTM.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">It doesn't IMO. I agree the first attempt did. This affects only
the
LRU iteration itself and I'm even fine to get rid of the callback
using
a for_ macro.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well, I mean using a for_each approach is objectively better than
having 
a callback and a state bag.

But the fundamental question is if drivers are allowed to reject 
shrinking. And I think the answer is no, they need to be designed in
a 
way where shrinking is always possible.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Rejects can be out of our control, due to anticipated deadlocks, oom
and deferring to kswapd.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
What can be that we can't get the necessary locks to evict and object
(because it's about to be used etc...), but that are the per-
requisites 
TTM should be checking.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">In any case, I don't think TTM should enforce a different way
of
shrinking by the means of a severely restricted helper?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Well, as far as I can see that is exactly what TTM should do.

I mean the main advantage to make a common component is to
enforce
correct behavior.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">But if all other drivers don't agree this as correct behavior and
instead want to keep behavior that is proven to work, that's a dead
end.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Well no, even if all drivers agree to (for example) drop security 
precautions it's still not something acceptable.

And same thing here, if we block shrinking because drivers think they
want their runtime PM implemented in a certain way then upstream
needs 
to block this and push back.

As far as I can see it's mandatory to have shrinkers not depend on 
runtime PM, cause otherwise you run into resources handling which 
depends on the well behavior of userspace and that in turn in
something 
we can't allow.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Please see the above explanation for runtime pm, and for the record I
agree that enforcing disallowed or security violations is a completely
valid thing.</pre>
    </blockquote>
    <br>
    Putting the TTM issue aside as far as I can tell what i915 is
    extremely questionable and doing the same thing in XE is most likely
    not something we should allow.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:13a47d22fb6753e20046a983126c6fea675beed2.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

/Thomas

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
/Thomas


</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">/Thomas

</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------BNvMq8TlwnQ2NSd1xdFw1W1s--
