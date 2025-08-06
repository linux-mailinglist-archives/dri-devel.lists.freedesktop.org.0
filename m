Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5CB1C5E4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 14:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C5B10E75B;
	Wed,  6 Aug 2025 12:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RG65/4iq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBBA10E75B;
 Wed,  6 Aug 2025 12:32:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXM4KvvVu9UvURn8VgOLg+BwTXNEaQgMYnAwSFWGSOsEyYV5f+nUXInvWzNm+MKHvZv3HVXrC5UFLJQKdeA0OPhO076R4TlH5lsYe0XXSpnoxggUHmBFgrn4MmuNpHIKxhvphjNor4JIj4qAAvdkUcSamK2BY1lspdOSW/19X5itnSMryBSI3oqE3C80QL7K4Yuw0o3Lrg3+j+eENjPvrHfYRUwfMvWKsOSJT8zMyoiztYwEk+kyfeGd8RsiqDVG+X1MnVcwMCFYB1DZ5RY4vHdzYnZsph3E8DSGaN3nz7CQpnG3W8xrxRpWFnfAfie//xoG5a+nNu7MtcSuN3KWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUBcmTC6RT9vBkVgYy9O9Sa2KlcQbzGMvyK90zg9zDM=;
 b=RFHyJsg4A0uiF1EjcRfUJ31NruRNc6vd7NnMvXFvwmoA/p4ekHdDAwzc48FPAa/aEx4LsbqgOZUreNRa07jtRqV1D9lnm78CAgUYoa4djyf8oTkAgnIXWk5yPLgBo1K3gQxEYmTfL+KgKa3xZGmA1IZUXExLxo8m7n0lwMIS7dNyRuEfq6HGnlbiAg91g/EetxFeRXofWsxvWfMBxp6xgfbM4bHuDMotntI0Fhw1SU0SMvYQDkt9HtvEZ/Wd4a2UdaXg0Yokh59TQG97c3ElQiBZyBKfqK4XWFC1VBGfNkvRrMiCF3V7RkbDtdBg86KLqCFrwy3atrSYOfDP96JIDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUBcmTC6RT9vBkVgYy9O9Sa2KlcQbzGMvyK90zg9zDM=;
 b=RG65/4iqaSoY8OmII1zOQuYW+JGwntGjysXWYY1xOaM4gIJBB/hyPf22Cepz96jcXFlhp7P3cyqS64xLP8tVJkZaK95mCRjF8uZXO4FP+aEq3B4XSpFqHzSxI2VJeiMklfz36LxqCqyeLbO0yo0RxWXGlLl3h+GalEoE1Dtk3hw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB9007.namprd12.prod.outlook.com (2603:10b6:a03:541::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 12:32:32 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 12:32:32 +0000
Message-ID: <6e5b5c47-a97c-4757-ac0d-361c91fd5819@amd.com>
Date: Wed, 6 Aug 2025 14:32:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: fix incorrect comment format
To: cryolitia@uniontech.com, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wangyuli@uniontech.com, zhanjun@uniontech.com,
 guanwentao@uniontech.com
References: <20250806-amdgpu_typo-v1-1-b5a3cb84ce26@uniontech.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250806-amdgpu_typo-v1-1-b5a3cb84ce26@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0395.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bff6ee5-1108-426b-2760-08ddd4e550bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2Vub2N3OXhYY3BSdHpuSTRUeGVPb1VtaExyNXd3UkVyMWcvMERaaXpwdS9H?=
 =?utf-8?B?TytabXg0OThGbCtQM2tCam5JMWx0NFZ1cmYrK05wUURTVXBIekZqZ3JRTExD?=
 =?utf-8?B?V1NXVnJYWmhKWE1ybXM2a0Y0SnRqZHQzYncvWVJFdS9WT3dVdTdFRDlGSGJw?=
 =?utf-8?B?VkNPWDUvM3ByRXJvcjA2NjUwQVJhNDJaazY1TUltUDBhUFo3S1V6ZWhXUFRm?=
 =?utf-8?B?OFhHb25FcUZLNU5IcDlWSkVJbEhMT0VxKzdSNERWYnB3N3ZiM0JMMzBhOVk3?=
 =?utf-8?B?M0s5d0lYSmVycTk0Z0Fwamh3bFNpbnFCZVlhd21GNisxZUZrMHQvNEpzRkgx?=
 =?utf-8?B?TDRNeFIwVjF0RUQ0a0FvZVE0eURxYUZNcTVrd1ZaMWVlVnRJaEg4dE9kbkMw?=
 =?utf-8?B?Wko4b1c2MzU2SDRzRmpEc05sTVhUdHBTRG14SGd2aXBJQ1VtNlAya1NOVzc2?=
 =?utf-8?B?ZXBYaytwUlNPZlAwV0Fwa3liZitKZXZhemJHWXl3a2FKa0xmNEp5RnlRK256?=
 =?utf-8?B?L1ZicjI1NWZmeTg1YWtseXN1dzRYQ2U3VnBOMXlZTDd0NW50VHZ3SUtkdExE?=
 =?utf-8?B?SkprampaM29tVExpYlI1eTgvVTArQmZqd0V1Q285Mk1FRnByTEk4SHcvaDcv?=
 =?utf-8?B?VWpGMzM1R2hhZU1oNVQ1TFk1NGQvekRGZzVwdFh4amZ4Wnp0ZWFDaElYREdm?=
 =?utf-8?B?Wk5oWThXdW5XaW42RHc5Y3V1UkR5UVdKc1lxWENMZkd3NkMwVDZwOEppKy9t?=
 =?utf-8?B?SVVkbG0wdTcxbEZOR2dYYnZrL3EzNE56N1BqU0FqNC9FMldPU3JiYzJXNjVx?=
 =?utf-8?B?NGlPbnJsbFNlNVJ6MmhIK1N6V3IrWUU5cFZuUkIzaW5TTDQxanNkS1lqVGFv?=
 =?utf-8?B?VDBxZHR1UmNkUDZZOEtYcjUzQ0t3VHJ6R1gyazJYcnZYeHNETTd4c1FDSVln?=
 =?utf-8?B?UkdyZEZVNjNyVDVwUi9JN3hQYWxVdHRhci9ZN09PRDErdzNZVW05OVZnSFhL?=
 =?utf-8?B?cnprMFhCWHJLc0dXNkVSVUdaNGVjbm04MUx4YXo1L0RpbzVFaXpSdkpaVWh0?=
 =?utf-8?B?d3doMXFpbmlHdlBMa3FUVVp4akFEZXpWSzFOSUc5dFkrN3hnUjJqM0hmNmlJ?=
 =?utf-8?B?Z0Q4ME1RRWwxbnZ3WTJMTVBmaDNQbmw5NGlYM2NGQ3hRMnJaVTNwVDBJdWJP?=
 =?utf-8?B?S1lWYy9Ga3ZST3V2SktqVlZ4cDE1MkdWSVdSdElGbm5GTFhndzYweFgrR2Rk?=
 =?utf-8?B?RFZBYnRjTlp5c3dNTnpSejhGSFdFT0NqYjZZL2pBWCt1UE5UR01oVjZBempO?=
 =?utf-8?B?dEgrdXpuUDU2ZDQzdWgwQzArZmJ4RXQ0cW1iTjZwSXA3SVQ1eVBuZTRtM0RP?=
 =?utf-8?B?OGhWSnYzMmNwa3pBN3Fsbmx1QXR2U3ZsZTZQWWVUbzNaNHo5MWRHQ0tUbHRW?=
 =?utf-8?B?cnBid1hubnJmbVBjSkdDeS83bld2MnZDVmo3b3NGVmlxMmtoWnBUZjJ2WEZ5?=
 =?utf-8?B?Zk5kWnZXa3FYSmhyamlBcjhZMy9vaUh1MjJscjdJbXRnQjI0MGtkMWJlVGl6?=
 =?utf-8?B?TXRaTElENHQ3ZDR0ak9kakNEQm9OTnhCOGpsODBDQUFaUDdBeXpsNk42OGly?=
 =?utf-8?B?WDdnR1J4WjI5eUxaT1BGOG82RUxHS1BWWWQ2TUxDVDZ1cFdWUW44NWxWWXhW?=
 =?utf-8?B?V3VvNTR4YS84QXV0WGgvdVhiWHJmU0hoUHFYMGNWb0RmWDF2R1krdmtpZy8w?=
 =?utf-8?B?TEw1ZFU1Wi9MajJxTW4vbVhnbDk1aHlNS0o3QnFlbmc2dktCZFd5MzFYNHRC?=
 =?utf-8?B?R0VlS0VBOWRHcThORGYxQzBGMUhKOUdEcVNRTFRWMEVaT0dBYXZEOVdRdVNu?=
 =?utf-8?B?eTgxOUVrMnB2VVdTdDB3emdMdytObDRpL3lhWTl2bnNWaUR0eHVBN1dyd0Qw?=
 =?utf-8?Q?m+EdFYkw9no=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UCtxMWFDU1A4QUpEQUxpREJBanByMmh6a3BiUW5GUjd2NmI4RFlLTXJnTEtQ?=
 =?utf-8?B?aTNhTENpV291TFo4YmlXcjU2N1Z6NklVSkVmRXRZK2F1YXN5b3FlNVV4Mitl?=
 =?utf-8?B?MHBpWmJxNmZUdXlSNEFTZGFQOHp0MityaHVudDBRaDJwWWJ2aTdCeUxORERY?=
 =?utf-8?B?UWExZDcrakNGcHZVMGY4dFFJRGpCd3pFYktDWVcwR1FGckxNeW1lY1Q0enZj?=
 =?utf-8?B?TTdwMkRVS1RJRDBURDlpZ2tRRkxHaTQzTHUrd0pITkJ2Rko1d2RLZHlJVExP?=
 =?utf-8?B?Ly9ZM0UyS2ZMMjNjS0k3NVRleGtLNGFqYVBheTExYVRzaTg1VXJydlphUCtS?=
 =?utf-8?B?akE5c2JiMnorL3dTc0JGazBqeVJlMkd6V3JONU9YeTJqck1KMTFEbHRqamkr?=
 =?utf-8?B?Qm5DQVlFK2wyZUc0THp4ZlhSbUVSL0NIa2gxY1d3dkQzaEIzKzUvYnNsbDJY?=
 =?utf-8?B?YTcvMEM3NUplVjFGQzhhdHVNRitpZERmZTFPYXFQd3p1bUM1TG4rSTMzRlAy?=
 =?utf-8?B?cHU3NVhTbXVwelc5NzdqTjdXUzFuSnNFcU9MOS9aTkt0WHdVMFNockFvcFRz?=
 =?utf-8?B?L2ZWRGQzeTI3M2FpeG5BYkM0V0xnVTV2TTM5V0RnaEJrN2RXanJ5QzdpQjZW?=
 =?utf-8?B?M3R6bzFQRnVaNEJPMGhNUjJBOE1USnVzN3I5MmFvQnlDdTh5VEdWU1AyeTBQ?=
 =?utf-8?B?ZC8vcDNvQ1JTczdKSTVubTR0VkQwaWVZbk9JSUs1NjJpZTVFalYyMnF4V3Vr?=
 =?utf-8?B?Zkc5VDNqSjRZcjBtTWMzM2QzWmFuNVlqYy8ycjRjRkNqZkxOeWRXU1MrblFQ?=
 =?utf-8?B?ZjIrMlZSMmxFWXBZQ1ViMlpMTlZZZWxja3FQeUZNV094U3IxU3ZwenF0RUo2?=
 =?utf-8?B?eXlzaUs2U2E4bmRCVmg4Z2pBS1IxWVB0MytiRCtjSUlHVmJJL1pmTFJURlVp?=
 =?utf-8?B?c0xRbVhub2YyNTZva2YwTi9qUG91NFFLV2gyQ0lrclI4eXZEZldOWGc3dlpR?=
 =?utf-8?B?M1I0TjBuQ2ZPaWNJK0Q0UHlqYWFnWXZPR3dNMGYzTHFyc1BBRCtmR3RRM1dI?=
 =?utf-8?B?MldpZFRYZWNKOG1GdGtZRU5BN2RQRVArN1BSOTVIdkJVSUpWNVRjblhDSUR5?=
 =?utf-8?B?ZUZVVWYzVEoveDQ2bFYzcnVTYnMwR0VROWp1aWtIbHdHdkpmR3VSbUF5eVVS?=
 =?utf-8?B?ZlFiWjhmVWdvaDVva2lJSWJyRXMwK29NKzJZWndEMDRBZVpOMjZWaSt1UEh2?=
 =?utf-8?B?Yk9FT1hrZnI0TDJiT3F1RkZNWkNaQjJvcUYyUzZzYlJmMHFHUjZzczFua2hM?=
 =?utf-8?B?ckFYMG9WUmExczNhekJVNEpkQ3ErMkZvbTRzbHRaYVcxK2ZKKytUUkxrd3Vx?=
 =?utf-8?B?T1BsQ3NnM2o0djR4ejdXUjlqcWdlWVMydjZLeXpkaXdCM0hPZCtGbktTYWda?=
 =?utf-8?B?WmE2cGhUVHppZUpzUExQMlVKSXkwMFowZHdtZk1HelV5S3ovemswdmpVQlNs?=
 =?utf-8?B?MW42ZXZSbkNzUHNiNFlQaGRPbWJFYlFGNkpOMklXTTA2L3phTFR6U0JyUk0x?=
 =?utf-8?B?RXJjbHBTUFZoeVRCa0EvREI3YUhWaEJBK0RmV2lJRk5Ec1RKSHN1QkJXQ3Fp?=
 =?utf-8?B?UW9ZcjdKNHdTb01ua0NXQ1k4NkR1VVV6aDUvVTJRKzU2TDA3dW0yRmE0WDZO?=
 =?utf-8?B?WnZRUTVUUjFmbWZSdTFqQU4zWjFSa0pETnNZdjloZmxsejEzRTA3ZzhOeDln?=
 =?utf-8?B?QS9Rc2t3QjFTREJWZThMYW5XTWZDZ2RxZkhudlJrcEhrdThUaGFCbDVrdGRO?=
 =?utf-8?B?a2k1anl0T29TMFZKRk9FUUp0a1JIS2VSVmlRc1ExYzczSVNBdGUrNWRKU2wx?=
 =?utf-8?B?UElzeHdYZnQyUjViMUkwN1FYOTUzRVVIR0xUSVJxbjVNRDNseVJ1OFIxdVFO?=
 =?utf-8?B?ZU01dVFwa0dGOHBNRStPMUI2WUNVRDN4ZlZuRHM1Y3JVeDVpcDZqZEk3K1F4?=
 =?utf-8?B?OElRQ3hzWDNkaW5YSXRMSDRjeHlnMGcvZHBLN1N6Z3U2QlpQZ3Ivcm1vbU9O?=
 =?utf-8?B?WGtySUZiS3BDdmNFUTdyZzVPR2lxM0RsWGV3WEpFR3gvVzFQSEYxb01FWS9P?=
 =?utf-8?Q?9GPMOO24Pw+yoEuQ+x6F9VO+B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bff6ee5-1108-426b-2760-08ddd4e550bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 12:32:32.8006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Npmz9pqmh9Y+zb3wTsTXT064JZByNvIbAeep2b5m7LMbWZMd7te9DcMX5Visycl7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9007
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

On 06.08.25 05:34, Cryolitia PukNgae via B4 Relay wrote:
> From: Cryolitia PukNgae <cryolitia@uniontech.com>
> 
> Comments should not have a leading plus sign.

Good catch, potentially a left over from a merge conflict or similar.

> 
> Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> index d5002ff931d841994ca2c70cdf5b989f5b3c59d6..860bc5cb03c81b5346743b5fb46a7dcbe5a201a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> @@ -151,9 +151,9 @@ static void nbio_v7_4_sdma_doorbell_range(struct amdgpu_device *adev, int instan
>  		 *   BIF_SDMA0_DOORBELL_RANGE:  0x3bc0
>  		 *   BIF_SDMA1_DOORBELL_RANGE:  0x3bc4
>  		 *   BIF_SDMA2_DOORBELL_RANGE:  0x3bd8
> -+		 *   BIF_SDMA4_DOORBELL_RANGE:
> -+		 *     ARCTURUS:  0x3be0
> -+		 *     ALDEBARAN: 0x3be4
> +		 *   BIF_SDMA4_DOORBELL_RANGE:
> +		 *     ARCTURUS:  0x3be0
> +		 *     ALDEBARAN: 0x3be4
>  		 */
>  		if (adev->asic_type == CHIP_ALDEBARAN && instance == 4)
>  			reg = instance + 0x4 + 0x1 +
> 
> ---
> base-commit: 6bcdbd62bd56e6d7383f9e06d9d148935b3c9b73
> change-id: 20250806-amdgpu_typo-80869b122c36
> 
> Best regards,

