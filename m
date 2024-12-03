Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAA39E2714
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5B710E11E;
	Tue,  3 Dec 2024 16:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VIY6Wvxs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0110F10E11E;
 Tue,  3 Dec 2024 16:20:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iikiIdUrt02BKppZm9g43Tq9BuZjxuys0HbvUwzcc5+c+FG4YlgeviyyiHupCpazxBrw1siG5PvOIFpSfHDasuG/sh2PJaLgO2WzzqaJIHDyfb83WQaBbOQkHDy4E2c8TnAUfUVsgH5P2PeLQPihP3mwEu0Eauh13xdVLkJFmiDYJwF7X1pjUrxa4+ypTl2BDaYrIpCaFvwN765558quLC9wiXs9Lyw9CT8Vj5rQP690qlAU5aHA6MIKp/QwUuP+v4LD6Jn7jc8l05ZBFmtJ2EAUrqlBEEjiz1TXzSONhW5Qw/ML1XbRouYEdN+j7wCkPVEhW9WgmeNAg9J4O1pAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMNdn+GsqsTUGse3ApWvgQN/6C7ne0OVgIR42kvQIeM=;
 b=deNaz407jFc19L4nu+vCAsrG2qaIy9Q7Z6b8QbH8sKkKRZiy2NdSOyoG28kztiCmhsUZwAhYtupwmZsX1IUcZKjk9PAEXpyLMpN4XP7Z5LK+0WBFm6nnrVMcx9w5Q2bM/eTH32BNPKEOU2h1JUTRTpKVBjvxCuVOdstG8rDHn9mKdbqTASqSn7PzBs6sIx6oDpN57Sjwjb8RVRR0ekUwhRn4dfNHoWUqTMjPKYhKm/y685DTc+8mHDQq+QEQ3tP4GISHIvdk1oL8dw9L2hCY9/THAxPrz0k5hbKaZ3P6VOnQZqO/TTNMPlMaJoADvoOEvEmf3gAWa4g2RhxvNo/0Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMNdn+GsqsTUGse3ApWvgQN/6C7ne0OVgIR42kvQIeM=;
 b=VIY6Wvxs3dV4gLV5QsY4ehkH8m8jPqSrDNdAjvNvyTszM/s/R0YM7uXpq2LNBjNACSTdB03G75kJtn4D0pDCtqvR4ighx+tQarOX8hWZkR6m07I7Yi+KxhkEm7KIUiU/kKGuDnw9EqWrbrTC+TDtp1tM9CGSNI9zFzSfhKgpmqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7538.namprd12.prod.outlook.com (2603:10b6:930:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 16:20:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 16:20:50 +0000
Content-Type: multipart/alternative;
 boundary="------------hBEobJjB0QWdWP2sp1LeDwjv"
Message-ID: <0595e4df-86d4-4082-86ab-b77902d3020b@amd.com>
Date: Tue, 3 Dec 2024 17:20:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/8] drm/ttm/pool: Provide a helper to shrink pages
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-4-thomas.hellstrom@linux.intel.com>
 <800ee040-7c2e-47d0-81e6-a352f5f689fb@amd.com>
 <a07c93704bc7f59f51b5a6a13aeb3e13eee28e3c.camel@linux.intel.com>
 <d1e33436-9c1c-43d4-a86a-956926a7096c@amd.com>
 <73588525571a68f5638300ef171591de10ba5e5d.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <73588525571a68f5638300ef171591de10ba5e5d.camel@linux.intel.com>
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 9427791d-84ae-4d73-a2b3-08dd13b6734e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnY1Z1k2d29LMG9wNW9OZkZ0MHJNZDBmc0dtdHBiTklabFhUbzFLQUJjdzJ0?=
 =?utf-8?B?K2lTWXJaVkNKa3hpS3BGRkhOOWNRK1ZkWUNtUEFDZWI1U2Vnb08zRUlvaWlH?=
 =?utf-8?B?bnhXcmczWERyWWVjRnZwNVRBQi8yT2dYNHkycUNvZU5YSkJER2RPUVRETVFH?=
 =?utf-8?B?b05neEpPanJzVUhPVndTWHVxQWtQS0pHaVhlMG1zb24rUVZGR0xtNXBEWmtI?=
 =?utf-8?B?eHNMVWg0MHRrSzZEejU0QWQ2RkZqN0hRaXlIS2lFUjNhYS9IbGdUUmZNM0pl?=
 =?utf-8?B?MGFqSm4vU1pHY1E0YjNWdGxkblJJd1VHVkVJK0V6dkl4bWY1U2x4MmtNOUVq?=
 =?utf-8?B?U3YrZ3ZCa1YreWgwdzEzb3k0Ny9IUk55ejVmWHpCSkVMTEFURkJ0bzYwTzBS?=
 =?utf-8?B?d240MUtNRWNhSlgxSEhYMWtQYnVPL2ZTQ092TW9BcXMwbmdmOS9VSXUwTlVW?=
 =?utf-8?B?eEpLcXhHWTZHcE5tRHplaDE2WkJWMVZwSG16dnowMkZybjZxZmwydnRRUVVG?=
 =?utf-8?B?RjRWRHF2ZWhoNWt5Q0tXb2h5LzdYRnRleUx3a0ZoOENnbC9jV2J3UWUzaHp2?=
 =?utf-8?B?VHhpdUY0N2JrNnFaUGVPcHh4TU92TFYrTWUxZ1gza1o0ZEh6dXlBcUJHRE1E?=
 =?utf-8?B?eDZtMW1MUWJRdUpjby90YmlqeGM5UXYxdTRheE9ES1NNNmJQdVdteTlDRXZE?=
 =?utf-8?B?REp3eDFqdlFSc0U4VEgxa2hhcHIyemFnb3k5d3BjK2Flcks1N3o0blhEUFV5?=
 =?utf-8?B?OTh2TkNPbVdYY2xsREdUak5MZzZac1hGNnhtam9QdTNZSkxUNFVYekR4N0hm?=
 =?utf-8?B?ZVJwbVV0cE9lRVFwZnFsVXJ4UVVTaGI5aldUelFNY2VxbXVQbHlLNjJZazRS?=
 =?utf-8?B?WEFXM1ZaZDNONVd3OUkwdFErL2JNUkJjQ280T0NqQnBhUUFBTmVQOFJQZkIw?=
 =?utf-8?B?a2NIekwySWY0UTFmb3ZXSWVFVkFmTUN2ZHVtampSd2VrNXBBMU85YU5RcXk1?=
 =?utf-8?B?WTFSam5jRjB6U1JsYmtiMHRldVAzbWhBZk55aW5KVXBOYnRiVkV0T08xZGR2?=
 =?utf-8?B?Z0pBTDdoMkpKSExDaXBFdTd2em5QRW9zVTJjZEtDQWI1eEEyUVd5TkYvNE15?=
 =?utf-8?B?ZEpCaDUrS0lUM0MxbVA2dzBJQU1sYlJhV3A3VXhvZzJ3RDYxbVFORDE3aXNh?=
 =?utf-8?B?NjNCVytVOU8zd1pMSHZ0MzV3OTR0SnV2ZlNZc3EwRTlqRFcxNWdFRFcya1N1?=
 =?utf-8?B?bGsxVjUzS0N1MGwxTlFWVDlseWFhWVlaVTY3TTFmekVhSFJrY25aOVJJSzVB?=
 =?utf-8?B?aVNselhRQ3crVHJxV28zQW1OTGtoODVhU2FHRUFjZUlpbkkvREo0blljem15?=
 =?utf-8?B?TzZaQVZWbjZRRUF1aHl4b3pwUHRDbUMreTdhUWJYMFUrUjFPM2cxbGhLakQ2?=
 =?utf-8?B?MFhNQTlxQmhoNmp0VUZhQWZkb2VmMHhFNU8rL3BOQ0JBZ2lZTnlLLzIvTWxO?=
 =?utf-8?B?NTZHeE9SSHp3VkI1QVFzR3ZNOHZhdmk0TVQvdVR4QUhGNHkzNnpKQzJtWWlI?=
 =?utf-8?B?cWpMRVhqUUNhUXRvekNSSGNKaHpaRVJnN29INHdiQWhmSHpjZms2WWZHTXpI?=
 =?utf-8?B?Z2tYZExxaFR4ZmxCM05TenJWSGJmVzBQWjFVVENMTUlqMVJFOEJRR0NpR3Zw?=
 =?utf-8?B?N3B3blB1VEV0K2VrNVplZkJOdnlWN2tBUjJQR2J1bi9yaUJ0dWNySmZ2TVJY?=
 =?utf-8?B?NlpVd20zM0tMMkxFQVhyVE9aV29TVDU1ZWRlRW96YWJKMHpzRkJDWmdXMWVa?=
 =?utf-8?B?UGVFK21Xc1R0K0hxcStuUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWgrUis2cVo4dTdjb1E3WEN5T2Zta0VEYWd2d2V0Y3lzWTBmbENoQWkyd3dS?=
 =?utf-8?B?dUNpWmpnVmFEbEFMMUExNUpiNVJiekVydWZTM0xvMGtmYll1aVFsc1o2aG4x?=
 =?utf-8?B?T1lJK2k2ZlFDWm1lVXVKWi9BZ2xKY01SM0V4THFlY3pnbWZ2UDNIWXhmckdn?=
 =?utf-8?B?M05yWVJ4WVFXdEx2eXh3OGZHbU1VYllGQXVIQVh1Zkl3U01yUTJ6eFpXSGRB?=
 =?utf-8?B?SEo3NEd4cC9zNW9hRXdNRjlhbUQxamVieCtUQXlWSkR0WWgrQVlKQmNPeTZZ?=
 =?utf-8?B?cll1Rmg3c0Y4ODlXTmNmV25Sbzh4SzRkM24vWlArb0FkamlpK1Z6Um5MUXNU?=
 =?utf-8?B?R3h6eEtSaUE1MU01VjBIQndUZS92cW1lOVdmL1R2MzJMMlI0VVR1ZlEwTXdL?=
 =?utf-8?B?bmxtaEt0UzhSMzE4Q1p2Si83YllmMUg2SmY4RGJSYk4rNUo4R3M1YlI3THVU?=
 =?utf-8?B?R0NSRVZZaDBzRTRHbkhmTm5uN2YzQmlQWFlFZkQ4bVRFYWJsTjh5d0ZtZ1dT?=
 =?utf-8?B?WHZLekxZNDd3aEd4ZTZlZTFjeHRQdExsVEY2S3RtMCtMWEtXWEJFSWFyeWtD?=
 =?utf-8?B?QjlhNm4ycmhtdm13dWxhSUl1dE0zbFQ2aEdQZ1J4N0ViU0VQMFQ3VlFJUFIw?=
 =?utf-8?B?TGk0Wms1THBXU051UnBhQ2U5dnJnaEdHQlJxNUJSNm5JR0JPU0YySGR6NDVL?=
 =?utf-8?B?S1BFSDBEWFM1UHFvVXNNamUyNStHUVBRN1lCWGsrZm8vOVFhayt3MlJDYksz?=
 =?utf-8?B?TWdqTUl1TStxRHpTMG55VWVRN3FIMktGaVR0N0lLVWxTbExaRVZPck5VamtT?=
 =?utf-8?B?ZVZxL0J1MHVGcGhEaDZIalV0azk0VW1qTzVYTjgyWWhGaWlvNFhINWNOTHZL?=
 =?utf-8?B?TytHam5tTFZlZGxVU25uaklnODNzcXpLb0JwNDN2bXlFRy9wQk1XWDFCT1l6?=
 =?utf-8?B?Rk9VYWIrKzRlK0JQR1FDK05xRFNueGdCMXBQSm9nMDNyVnFoQ2dycm80MEww?=
 =?utf-8?B?VWNyaU95NElDREo1NjV6VzZWWWtCam1yeDltcS9hOHBsR2QvNnc0RUdhZGFT?=
 =?utf-8?B?Y05aengrQXJHZGErNnNpeUxEOFVjaTBKZHMvOFJJK05rbzUrWEJ2RTJFQTFr?=
 =?utf-8?B?V2x3dzgyT0lDbGpKdEJSMEd3RnNhbWFFaXArYzVsYzRwSXdJTTYvWFphUG43?=
 =?utf-8?B?MmdneDdqRzFVVjM5aEdTa0hNeENOY283OUFKc21MNCtJdlpOM0FZUnYrWmxH?=
 =?utf-8?B?ZjlZRDREak1mZGdJbjI5ZFpTdmd1ZWc3TVBndFRuVmxnYmY0MVVKNjNqa0tH?=
 =?utf-8?B?TFdwZDdEeUJ6SjEvUWx3WU1Qd251QjdiWmc5L1Eyb3F6dlNlZmFtS1podk1M?=
 =?utf-8?B?RENQTC8xZ3RmaU5tZFNuQ0huL29ycEdQQkpET2IxbGVvOTRDTHY0U3FwTTRJ?=
 =?utf-8?B?TjB4RVNtdVNlR295Z1dtTm9sb0JaNGxJcEM4UmNGRTNleGE1RmZjMmdaK2tS?=
 =?utf-8?B?NEZyOXlxem9wOGVzVkNJNlZ6T0owY09ITkIwVXdLcVZXVWhiYjZ4bVVHMXg0?=
 =?utf-8?B?cDZnWHphYWJlTE5ZZTROVUt0U0Rhd0ZpcDIrK3c4aU95TzlIQTB1ZVU4bVQ3?=
 =?utf-8?B?QUNRYjJXbHBBZk45bVRkMTFSRGpWMnA1MFROMklyelNxNjVmWE9vMXJSK0RO?=
 =?utf-8?B?Q28xRldzQ1k2SGZKd24rT1Myb2NKVldnY0NIZGhISFgyaHZpVk1DZHJvZEVI?=
 =?utf-8?B?elZkQkRiVW9EQXRwN290Vjd3S3pEVjFYOUluc2pjTWNiRTFIVWFzWFhqVW9W?=
 =?utf-8?B?L2xwMUNGUkpjVFJSZXZRVyszM1I1bmxtcmlzVGN5d0VPL2NSVEQ4SmhTSi8v?=
 =?utf-8?B?aEhvWHExUGEzMGdpSkxrellFMUdhZVNqb29pVkZna2p3L0hreXloN2NhZC9N?=
 =?utf-8?B?ajRzdHVsRU9KNmcwcXNzYUs0WlMyRjBROFN4RXVTZ0VXZkNNRHJ3Y3d3QXFn?=
 =?utf-8?B?QVNRYXY1RlFTbkhybVl6MTRQa1VIN0VJaVdhY2t6Nk96elhqdUNCdEFIeHZX?=
 =?utf-8?B?cVVuV2MvOVdlZ0FSelVIRGRxWUg4bkZtNG5uWFY0c2lQclRpaFdlMnVhc1I4?=
 =?utf-8?Q?E6jZq7KwJMzQ2uS7XiN3LcSiq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9427791d-84ae-4d73-a2b3-08dd13b6734e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 16:20:50.0779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzBlCbn3qQtR594KshY865FynszDz3+m7eNPoXpVa+KD1dEfbne1PtLV5pAYq49M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7538
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

--------------hBEobJjB0QWdWP2sp1LeDwjv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[SNIP]
>>>>> @@ -453,9 +601,36 @@ int ttm_pool_alloc(struct ttm_pool *pool,
>>>>> struct ttm_tt *tt,
>>>>>     	else
>>>>>     		gfp_flags |= GFP_HIGHUSER;
>>>>>     
>>>>> -	for (order = min_t(unsigned int, MAX_PAGE_ORDER,
>>>>> __fls(num_pages));
>>>>> -	     num_pages;
>>>>> -	     order = min_t(unsigned int, order,
>>>>> __fls(num_pages)))
>>>>> {
>>>>> +	order = min_t(unsigned int, MAX_PAGE_ORDER,
>>>>> __fls(num_pages));
>>>>> +
>>>>> +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
>>>>> +		if (!tt->restore) {
>>>>> +			gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;
>>>>> +
>>>>> +			if (ctx->gfp_retry_mayfail)
>>>>> +				gfp |= __GFP_RETRY_MAYFAIL;
>>>>> +
>>>>> +			tt->restore =
>>>>> +				kvzalloc(struct_size(tt-
>>>>>> restore,
>>>>> old_pages,
>>>>> +						     (size_t)1
>>>>> <<
>>>>> order), gfp);
>>>>> +			if (!tt->restore)
>>>>> +				return -ENOMEM;
>>>>> +		} else if (ttm_pool_restore_valid(tt-
>>>>>> restore)) {
>>>>> +			struct ttm_pool_tt_restore *restore =
>>>>> tt-
>>>>>> restore;
>>>>> +
>>>>> +			num_pages -= restore->alloced_pages;
>>>>> +			order = min_t(unsigned int, order,
>>>>> __fls(num_pages));
>>>>> +			pages += restore->alloced_pages;
>>>>> +			r = ttm_pool_restore_tt(restore, tt-
>>>>>> backup, ctx);
>>>>> +			if (r)
>>>>> +				return r;
>>>>> +			caching = restore->caching_divide;
>>>>> +		}
>>>>> +
>>>>> +		tt->restore->pool = pool;
>>>>> +	}
>>>> Hui? Why is that part of the allocation function now?
>>>>
>>>> At bare minimum I would expect that this is a new function.
>>> It's because we now have partially backed up tts, so the restore is
>>> interleaved on a per-page basis, replacing the backup handles with
>>> page-pointers. I'll see if I can separate out at least the
>>> initialization here.
>> Yeah, that kind of makes sense.
>>
>> My expectation was just that we now have explicit ttm_pool_swapout()
>> and
>> ttm_pool_swapin() functions.
> I fully understand, although in the allocation step, that would also
> increase the memory pressure since we might momentarily have twice the
> bo-size allocated, if the shmem object was never swapped out, and we
> don't want to unnecessarily risc OOM at recover time, although that
> should be a recoverable situation now. If the OOM receiver can free up
> system memory resources they can could potentially restart the recover.

What I meant was more that we have ttm_pool_swapout() which does a mix 
of moving each page to a swap backend and freeing one by one.

And ttm_pool_swapin() which allocates a bit of memory (usually one huge 
page) and then copies the content back in from the swap backend.

Alternatively we could rename ttm_pool_alloc() into something like 
ttm_pool_populate() and ttm_pool_free() into ttm_pool_unpopulate(), but 
those names are not very descriptive either.

It's just that we now do a bit more than just alloc and free in those 
functions, so the naming doesn't really match that well any more.

Christian.

>
> /Thomas
>
--------------hBEobJjB0QWdWP2sp1LeDwjv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    [SNIP]<span style="white-space: pre-wrap">&nbsp;&nbsp; </span>
    <blockquote type="cite" cite="mid:73588525571a68f5638300ef171591de10ba5e5d.camel@linux.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">@@ -453,9 +601,36 @@ int ttm_pool_alloc(struct ttm_pool *pool,
struct ttm_tt *tt,
&nbsp;&nbsp;&nbsp;	else
&nbsp;&nbsp;&nbsp;		gfp_flags |= GFP_HIGHUSER;
&nbsp;&nbsp; 
-	for (order = min_t(unsigned int, MAX_PAGE_ORDER,
__fls(num_pages));
-	&nbsp;&nbsp;&nbsp;&nbsp; num_pages;
-	&nbsp;&nbsp;&nbsp;&nbsp; order = min_t(unsigned int, order,
__fls(num_pages)))
{
+	order = min_t(unsigned int, MAX_PAGE_ORDER,
__fls(num_pages));
+
+	if (tt-&gt;page_flags &amp; TTM_TT_FLAG_PRIV_BACKED_UP) {
+		if (!tt-&gt;restore) {
+			gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;
+
+			if (ctx-&gt;gfp_retry_mayfail)
+				gfp |= __GFP_RETRY_MAYFAIL;
+
+			tt-&gt;restore =
+				kvzalloc(struct_size(tt-
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">restore,
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">old_pages,
+						&nbsp;&nbsp;&nbsp;&nbsp; (size_t)1
&lt;&lt;
order), gfp);
+			if (!tt-&gt;restore)
+				return -ENOMEM;
+		} else if (ttm_pool_restore_valid(tt-
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">restore)) {
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">+			struct ttm_pool_tt_restore *restore =
tt-
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">restore;
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">+
+			num_pages -= restore-&gt;alloced_pages;
+			order = min_t(unsigned int, order,
__fls(num_pages));
+			pages += restore-&gt;alloced_pages;
+			r = ttm_pool_restore_tt(restore, tt-
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">backup, ctx);
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">+			if (r)
+				return r;
+			caching = restore-&gt;caching_divide;
+		}
+
+		tt-&gt;restore-&gt;pool = pool;
+	}
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Hui? Why is that part of the allocation function now?

At bare minimum I would expect that this is a new function.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">It's because we now have partially backed up tts, so the restore is
interleaved on a per-page basis, replacing the backup handles with
page-pointers. I'll see if I can separate out at least the
initialization here.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yeah, that kind of makes sense.

My expectation was just that we now have explicit ttm_pool_swapout()
and 
ttm_pool_swapin() functions.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I fully understand, although in the allocation step, that would also
increase the memory pressure since we might momentarily have twice the
bo-size allocated, if the shmem object was never swapped out, and we
don't want to unnecessarily risc OOM at recover time, although that
should be a recoverable situation now. If the OOM receiver can free up
system memory resources they can could potentially restart the recover.</pre>
    </blockquote>
    <br>
    What I meant was more that we have ttm_pool_swapout() which does a
    mix of moving each page to a swap backend and freeing one by one.<br>
    <br>
    And ttm_pool_swapin() which allocates a bit of memory (usually one
    huge page) and then copies the content back in from the swap
    backend.<br>
    <br>
    Alternatively we could rename ttm_pool_alloc() into something like
    ttm_pool_populate() and ttm_pool_free() into ttm_pool_unpopulate(),
    but those names are not very descriptive either.<br>
    <br>
    It's just that we now do a bit more than just alloc and free in
    those functions, so the naming doesn't really match that well any
    more.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:73588525571a68f5638300ef171591de10ba5e5d.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

/Thomas

</pre>
    </blockquote>
  </body>
</html>

--------------hBEobJjB0QWdWP2sp1LeDwjv--
