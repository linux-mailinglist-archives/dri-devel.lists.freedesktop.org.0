Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F71DB1A634
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E569710E5A3;
	Mon,  4 Aug 2025 15:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SZqsoaW+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6977110E5A3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:41:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Klg2MIf9U7fvD/6z8AxGs4TsImHA3VJqFseFADubF5R5zDLKalsQiq90tnCnAfzn4H7Pepn7OSPUdzsBgGZObhvS4d51tM9iemaAEvrxZGJ/GvahXSQUkc44LDOV1hp/gqUcV6AiX1qIlHamBhLySsCxusbBfkz/TSWwST1wOBplQxDZPQSMbmLnMHdZCkK0NWX2if/uBZt8N2yiKMXy0xacdD/69unWlqpumYmq3p+vlSLm3SSs7swJZx7mDb56g6U6A8UFaBeescWs84i5/dKEhkMNzCjXZiaDN0VjHLwH813GtWNHxXd2tLnqMMKqCenC17lHV9m5qG5yzKA89w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=076L0QO6HLOyQf/L1h0yPhkQOp5a//y2KoF43bcrBVE=;
 b=riYNeiDJCr1+ISPCrzVY8K6xo6rW5YEligtyyQxvGIu0LnpOu5azXW7Zsa6jq+pLC0VJU0ASsmTXKZzxANSYNCMVSnzxnA30MCxfcsamRN4LbzviXt/18vgj5OTQb8poNMKQmA7jo2sc5y4zS0xtAS6Oga4zJnKxXEG2rp8IpqzK6sX0+ur8wnrxds4CgcjyG3RtJrsEIHZegEVaNtskNmT/1HSx2iUZ2CAGT6nASDhvGnPsnTtCVAVNPPCBAbkI+/TQ/eMIa3FzY3jWV6uXCN2yvh5pLDlAFumPnI1HXy55Y3Qvl6bFzKgP+2wH4NFuoPF7FHIhgBqJXTq1Go4Ceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=076L0QO6HLOyQf/L1h0yPhkQOp5a//y2KoF43bcrBVE=;
 b=SZqsoaW+Z4/OTvjkJ3Hn27Pxq8TLbZQvuxn6fOAONRM5frgScfSdvsPGNA+QSO5PzFE5xjatZ3JKYFiuK5HRWOSB7Yyd0o3yxtNUm3A++yJXbT7rQA9bXtVHrkJixa6FSFEwTpJbjocOjKHa32vvu1WhGeNRtPdBnQTuiuAh2Go=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8739.namprd12.prod.outlook.com (2603:10b6:a03:549::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Mon, 4 Aug
 2025 15:41:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 15:41:37 +0000
Message-ID: <91b95175-9f61-42e2-a9f2-47cb121cd4a1@amd.com>
Date: Mon, 4 Aug 2025 17:41:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Extend and update documentation
To: Philipp Stanner <phasta@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>
References: <20250724140121.70873-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250724140121.70873-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: af8c4969-5000-4d40-3ad6-08ddd36d65d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1l4b2QzRGJTMHhGZm5MWEV5RkxpdWtKSFVSLzMxYTNYS2NvTkMxTkdxT001?=
 =?utf-8?B?WXRaWlpPTTFGbCt3STlIeEJNQTEzVzE1ZWErdkFIZ3hNTHpBeVRFdDlWbzBP?=
 =?utf-8?B?cFFYRDd2Mks4TFlRRzVackUrV3VIeWdkQU5SYlFqQmNLckltdVBvcXpodmhL?=
 =?utf-8?B?M1J1QklidFB4Tzlxd0xqNjVwNTd2YVMzSTFTY0hKakdSTitRZFY1SnN6SHJh?=
 =?utf-8?B?ZExScXlrM1ZnckNwbTR5UGFDeUNtWEFyR1NXbU1UY1F4VmFRL0xDUk85K28v?=
 =?utf-8?B?cGtmZkJSbS9MekdFYnIrRS85RjlwNk1jTkZadVI1V1hSVFJISG8rNUpGNEhK?=
 =?utf-8?B?elY5UWVDYlJkZ014YVdBYnR5MG9LdUhwNUFGZm16ZUlhTFJzQ2xQK3pmR1lo?=
 =?utf-8?B?eHBOTW16QkpRdjR2ZWFMd29YbFp1Zkw2MUFIUGttWEFTR0lrQmo1dFZHMGp4?=
 =?utf-8?B?MWRPcnVWUmt3bm93OGcvblVXMUtVelA1aFZPb0l6eVBkRmoxZ3pkQlMraS9l?=
 =?utf-8?B?VGxVMFV1Z1p3QlNVeDVvaXlHdFQxNTlZSU5naUFaTjh3UFQ3eVlCaW96SENU?=
 =?utf-8?B?bWczckJzejIwNlBiaGJhdGRFdlZMNFFSWEFSclFGUGlnT2t3VHZiSmZlRmYw?=
 =?utf-8?B?MUlSVDZYMmFJT1NTNmdzdUFmOHN0cHFFMXJxeUl0NHdlZnl2MTBnZjVVWTg1?=
 =?utf-8?B?UlZnZTVxQXNvK3JhdGk3YXRidXpZejlLbjNrS0MwQjJJV1dYbTZtVTJyQVVE?=
 =?utf-8?B?WWZqUmZkRjhxVTcrRTVVMzhEL095OW5RRFBTaUNwSHJkWGZrNSs3N2srbVVj?=
 =?utf-8?B?bEFIM01oSXpLUjk2YTJjT1ErYjFhak1pYjMwYzhtSGFpaU4zUUM1VVVOQkFB?=
 =?utf-8?B?ZTdWZWxNV0xYQm8zT05pWkZ4TGRPWkkwWWpMYlNGRUZSM0NNcEoraEFGNGFZ?=
 =?utf-8?B?VFIrWE1tazVTOXN1akJqMFNkYmllTFc4dFpCeFg4WEtDUFdjZ1lsZWZLZkZw?=
 =?utf-8?B?TDM1S0xzS1hISk1IbUxwZEdSVEoyd0dQQ2xwTUFidDhmWmZObzVjbmR0NUJx?=
 =?utf-8?B?b0dDRG1XdTQ4bWs3bndoQ3BoK0Q1ZnYvb1NVMzRCWEJOK1VLank3RUlrNHFq?=
 =?utf-8?B?bHc2TENqb1plYURpc3h5U1hFQU54TStFbmVjMnorT1g4UXpjakZDTElkMENO?=
 =?utf-8?B?NUVWeVpFeDJKbXN0U3NvOXhKeHNiVjVJWlIxblZaZVNERGN3QnFjWldCc09j?=
 =?utf-8?B?UnU5SUg0blZjT1kyV1hYM1dpd21Od1hOWFFRRkFQTE10ZmcwZFl3bldxZzhk?=
 =?utf-8?B?akRKS1RUbWNoRG5NYXFKWUxaRm1yaTFWcHhtT2YzR0l0bUk0T3d0cVJrQXNz?=
 =?utf-8?B?S3dsc0J5RUR6NWlaeks4UTBBcitaZzUxV2VWK1RqU0d2UEhnQTZaQVR4ZkF6?=
 =?utf-8?B?NDBZWXBIUEtqL0g1d1B5Si9VeDF2M2taT2g4OURGVHdXWXRCUWdDNHFDa3hj?=
 =?utf-8?B?Mm9Yb3g5WXN5SXZ2TkdndDZsWjhIVlZwNXl4UUFiQnphWllWaVNud2NkMTFV?=
 =?utf-8?B?TmJ2eGg2KzVQaFBETnMrZEMvaUxrQVRuUFV1TDJ3WXYyNU5KVkNrNHlEM1J5?=
 =?utf-8?B?ZHJzQkpsL0ZPVlRWaTFQTjJITlJJNTk0WXdWUmwvRk53cTNrdy9PVExFZ0Qw?=
 =?utf-8?B?aTU5Y2R4RG5DQ1pOcG5UcXB1OTZOSENJUDJlODZFaitCN2JxWDMxMFpuZ3Vk?=
 =?utf-8?B?MEViYm81YWIxQy91TGVTSTA3cFQ4SmdQaFRHZktSNTlnNVpUY1UvUDRXUjEz?=
 =?utf-8?B?bkg5bUhhc0VoSFY5cVVNQzlHcGtlVDhHSHRjekg1SjdRbXhjRnB5SUtFVGtG?=
 =?utf-8?B?R09xZTkvUVlCUTZPbmEwSFBYaERuMEE1b1Q1Tkw0ZjhFYW4wYmZ0Tjc0M2dj?=
 =?utf-8?B?ekhZYU8vWm4yZTMxYjUvZ21IbTNNRHJnaWVLTWlvN3BucGNRVkxlY2Y2ZXZu?=
 =?utf-8?B?UTRCdVhBSURBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajloSzZNKzAzNTYxdXNxa205RnA1VVJ1WnNZbnBLZnQzOVQ4aE43c1JKOXZW?=
 =?utf-8?B?RkIvZjJBQlhsVTlod2hGTUFsSjZLNHh4anFVWGZWbkk0Wm9oUm0ya0dxbVZj?=
 =?utf-8?B?YjVCb1hNZ1lqd3Bha1RuNjlrVEJBWGRBMDRLYlJHaDZ1NGRHZjBIYWNmWDJG?=
 =?utf-8?B?TFBKbE9NUkFOVi9QRWNUcU5Nc2JGNmVSMFBBakNNV1ZWNnNSUis1SGxiZCs5?=
 =?utf-8?B?aHlDVlBrUWZMOTc4My9rR0RUakZhaFJZYnh6QWtMMlZQVDF1RWFjUm5kaHVM?=
 =?utf-8?B?UnRXUE5qcHdVOEdLUkJObUxlVkt1L1BiVmRkc1Rnb29KdXEwdytiTWQwY0U1?=
 =?utf-8?B?eTREcnB3RFc0dURTNnlrY2ZETjVYWHhFMXBaVzJILzJvSzUyS3VWYXczMk9q?=
 =?utf-8?B?cGRSd3REUVZBZk5nSndTOGFhUGk4ZVJRYzZKRnpweUpVblN1bU8xeSt4R1pI?=
 =?utf-8?B?QmphR0VrZHMrRVh0T0RDeUFSS1hab05NTERZZnZwSndVdHo1MUhBWTU1V3dk?=
 =?utf-8?B?NWhzWUFzamE4dXJEbE9uZTRIK2RTK244L1NQVU1uRnp2dEx6UVpnbXlRblRw?=
 =?utf-8?B?ZmUrMVBkVEN3RWE0WU5aQW1idENWc0h1Vlc4NXNKUVdpc1BLNmVwSnpnc2ZW?=
 =?utf-8?B?UFcrMWFMdGY2TkczaEF1ekFGaWx3Q3Y3cnpFL1kvSmphM0huQkgyT3Nvek8w?=
 =?utf-8?B?MUtseS9xY3FXcVZGQmxqKzc4VUtGOG1JeXhvSTg5SWdPek5KNk1EZmZySVVv?=
 =?utf-8?B?QlozeG1WSTRxTFZiN2pDNTQxRWRXOUxSNnQwNHFuRTVEd3RFSnl5MDRjZDlC?=
 =?utf-8?B?cktaNmFHN1BQWVdUMitFYkY1NGk4ZkwwS0o4cXBrbWtUOE5TdWhObnR3dVBP?=
 =?utf-8?B?TTZVTGRVVndnbEhWc2UwNGJIZVBjRjVjOHgrVkQzY1NsNHl1emEvbUJPYTNL?=
 =?utf-8?B?VVpvVm0vWlJnWWNjM2N6aFprUFB1a0FuWlNjWGxqWUxMSENOUWlkOEZsVjVR?=
 =?utf-8?B?NFBwL0c4cCtUUnlCT0Y2UHRBRi9iTHFtc3AzSS9sb3VBZ1JpdzJWaWhPUDB6?=
 =?utf-8?B?b3NQaVk4YlNVanNyZGY1akpMelRoZzYxL3NmdjZJdW50ZWVRZ0FvTFdMZFV0?=
 =?utf-8?B?MjNDMUgrSm1YQlJYT3NGeDFqN1A4VkN0UEhhcjdsTjlLNTJWMlpnb2R5ckVX?=
 =?utf-8?B?S2Z3VUYrU1lKNXlwQzAxQ0Vod25pYkpwOWNrbFF2ZldCa3lwWjlxbkZ1Wllp?=
 =?utf-8?B?ZjhmNWVyUVY1cldOTDdGYWc3d3lya05ESmRXeDJkYlNna0NwNHdNeGFEWW5i?=
 =?utf-8?B?Y2NoZ0QvdUUzZFZWakZ4MG1Yb08rL2NqNHQzbVdnbWJxYk1vdkJvT01VM0VP?=
 =?utf-8?B?dlBEZ0htL3FxaGplNzJONy80WXBjRzUyZVZ2RUlLTUZvUlUwZ3FXQ3N0K0hm?=
 =?utf-8?B?WWNMS3N5NW5SalpPWHN6NnBETk42Rm5Kb1pIczRFS0pEUVZoMHlNMzRmaTBO?=
 =?utf-8?B?UDArTzJsNVZXUDQwWVZBSTNlRUtZMnpGMWVpanM3Nk5qd09BbFF5T2tEdG5r?=
 =?utf-8?B?cjJ1dHJ4Z2pxd2JuSTRKRXpWUW0waEY0Y0hmb2NGc2I4U2UyWWZxV3cvd2gz?=
 =?utf-8?B?SWpidzl2Q1pzMUQ0SHd6TnNqbWJKalVYaU1rZ3h2VXg4NmlUa2pwNzhMT2FQ?=
 =?utf-8?B?LzVzT084allYMDFqZVR0enRMdExSd0ZRYmFNZXJObnQ5ZCtQMG02ZnlPbUhG?=
 =?utf-8?B?SW02Zm5meXFvUjhMYmFuUW1MM1NMUTlBdkZiVFJwZDZlSVVnaDlJOXNncTE1?=
 =?utf-8?B?YUhYZ1lUTVBnSm9RbmdqSEY4WTJXTWJpVDJGUGZqS2E4QWRMRlhMa3lQZm12?=
 =?utf-8?B?c0tUalRXYVp6VVZmSzV3cXQrbzhUYW5obWhzQjluRmczTmNuSFpFeGdiUjE4?=
 =?utf-8?B?YklVSU1aQXRGWkg3VDJmdnFxazcwNEgyT0xSeVJPSmtFazBRNXNXTTduc01N?=
 =?utf-8?B?M29MT3p6Z3cxRjBFUnNjZG9YNTRkLzVKajhaRVN6cFlETFQ1WFI5L0ZCWG5H?=
 =?utf-8?B?M2hDWlB2NmFhNktOTk1zaWtLVmFNRVd3MjhzeWFPMU5vUEZ2bHlHUkpSL0RB?=
 =?utf-8?Q?derMZppxxs94YVQBnXDIkxCwy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8c4969-5000-4d40-3ad6-08ddd36d65d7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 15:41:37.2648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWSEK65bnWwlz79CEBE1yXIg9cEJAR9+m4FVpfak1vh1Ozx1qmjZ30BYJMTjtv2m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8739
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

On 24.07.25 16:01, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
> 
> The various objects and their memory lifetime used by the GPU scheduler
> are currently not fully documented.
> 
> Add documentation describing the scheduler's objects. Improve the
> general documentation at a few other places.
> 
> Co-developed-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> The first draft for this docu was posted by Christian in late 2023 IIRC.
> 
> This is an updated version. Please review.
> 
> @Christian: As we agreed on months (a year?) ago I kept your Signed-off
> by. Just tell me if there's any issue or sth.

Sure go ahead. And thanks a lot for taking the work to look into this.

Regards,
Christian.

> ---
>  Documentation/gpu/drm-mm.rst           |  36 ++++
>  drivers/gpu/drm/scheduler/sched_main.c | 228 ++++++++++++++++++++++---
>  include/drm/gpu_scheduler.h            |   5 +-
>  3 files changed, 238 insertions(+), 31 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index d55751cad67c..95ee95fd987a 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -556,12 +556,48 @@ Overview
>  .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>     :doc: Overview
>  
> +Job Object
> +----------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Job Object
> +
> +Entity Object
> +-------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Entity Object
> +
> +Hardware Fence Object
> +---------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Hardware Fence Object
> +
> +Scheduler Fence Object
> +----------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Scheduler Fence Object
> +
> +Scheduler and Run Queue Objects
> +-------------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Scheduler and Run Queue Objects
> +
>  Flow Control
>  ------------
>  
>  .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
>     :doc: Flow Control
>  
> +Error and Timeout handling
> +--------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> +   :doc: Error and Timeout handling
> +
>  Scheduler Function References
>  -----------------------------
>  
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 5a550fd76bf0..2e7bc1e74186 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -24,48 +24,220 @@
>  /**
>   * DOC: Overview
>   *
> - * The GPU scheduler provides entities which allow userspace to push jobs
> - * into software queues which are then scheduled on a hardware run queue.
> - * The software queues have a priority among them. The scheduler selects the entities
> - * from the run queue using a FIFO. The scheduler provides dependency handling
> - * features among jobs. The driver is supposed to provide callback functions for
> - * backend operations to the scheduler like submitting a job to hardware run queue,
> - * returning the dependencies of a job etc.
> + * The GPU scheduler is shared infrastructure intended to help drivers managing
> + * command submission to their hardware.
>   *
> - * The organisation of the scheduler is the following:
> + * To do so, it offers a set of scheduling facilities that interact with the
> + * driver through callbacks which the latter can register.
>   *
> - * 1. Each hw run queue has one scheduler
> - * 2. Each scheduler has multiple run queues with different priorities
> - *    (e.g., HIGH_HW,HIGH_SW, KERNEL, NORMAL)
> - * 3. Each scheduler run queue has a queue of entities to schedule
> - * 4. Entities themselves maintain a queue of jobs that will be scheduled on
> - *    the hardware.
> + * In particular, the scheduler takes care of:
> + *   - Ordering command submissions
> + *   - Signalling dma_fences, e.g., for finished commands
> + *   - Taking dependencies between command submissions into account
> + *   - Handling timeouts for command submissions
>   *
> - * The jobs in an entity are always scheduled in the order in which they were pushed.
> + * All callbacks the driver needs to implement are restricted by dma_fence
> + * signaling rules to guarantee deadlock free forward progress. This especially
> + * means that for normal operation no memory can be allocated in a callback.
> + * All memory which is needed for pushing the job to the hardware must be
> + * allocated before arming a job. It also means that no locks can be taken
> + * under which memory might be allocated.
>   *
> - * Note that once a job was taken from the entities queue and pushed to the
> - * hardware, i.e. the pending queue, the entity must not be referenced anymore
> - * through the jobs entity pointer.
> + * Optional memory, for example for device core dumping or debugging, *must* be
> + * allocated with GFP_NOWAIT and appropriate error handling if that allocation
> + * fails. GFP_ATOMIC should only be used if absolutely necessary since dipping
> + * into the special atomic reserves is usually not justified for a GPU driver.
> + *
> + * Note especially the following about the scheduler's historic background that
> + * lead to sort of a double role it plays today:
> + *
> + * In classic setups N ("hardware scheduling") entities share one scheduler,
> + * and the scheduler decides which job to pick from which entity and move it to
> + * the hardware ring next (that is: "scheduling").
> + *
> + * Many (especially newer) GPUs, however, can have an almost arbitrary number
> + * of hardware rings and it's a firmware scheduler which actually decides which
> + * job will run next. In such setups, the GPU scheduler is still used (e.g., in
> + * Nouveau) but does not "schedule" jobs in the classical sense anymore. It
> + * merely serves to queue and dequeue jobs and resolve dependencies. In such a
> + * scenario, it is recommended to have one scheduler per entity.
> + */
> +
> +/**
> + * DOC: Job Object
> + *
> + * The base job object (&struct drm_sched_job) contains submission dependencies
> + * in the form of &struct dma_fence objects. Drivers can also implement an
> + * optional prepare_job callback which returns additional dependencies as
> + * dma_fence objects. It's important to note that this callback can't allocate
> + * memory or grab locks under which memory is allocated.
> + *
> + * Drivers should use this as base class for an object which contains the
> + * necessary state to push the command submission to the hardware.
> + *
> + * The lifetime of the job object needs to last at least from submitting it to
> + * the scheduler (through drm_sched_job_arm()) until the scheduler has invoked
> + * &struct drm_sched_backend_ops.free_job and, thereby, has indicated that it
> + * does not need the job anymore. Drivers can of course keep their job object
> + * alive for longer than that, but that's outside of the scope of the scheduler
> + * component.
> + *
> + * Job initialization is split into two stages:
> + *   1. drm_sched_job_init() which serves for basic preparation of a job.
> + *      Drivers don't have to be mindful of this function's consequences and
> + *      its effects can be reverted through drm_sched_job_cleanup().
> + *   2. drm_sched_job_arm() which irrevokably arms a job for execution. This
> + *      initializes the job's fences and the job has to be submitted with
> + *      drm_sched_entity_push_job(). Once drm_sched_job_arm() has been called,
> + *      the job structure has to be valid until the scheduler invoked
> + *      drm_sched_backend_ops.free_job().
> + *
> + * It's important to note that after arming a job drivers must follow the
> + * dma_fence rules and can't easily allocate memory or takes locks under which
> + * memory is allocated.
> + */
> +
> +/**
> + * DOC: Entity Object
> + *
> + * The entity object (&struct drm_sched_entity) is a container for jobs which
> + * should execute sequentially. Drivers should create an entity for each
> + * individual context they maintain for command submissions which can run in
> + * parallel.
> + *
> + * The lifetime of the entity *should not* exceed the lifetime of the
> + * userspace process it was created for and drivers should call the
> + * drm_sched_entity_flush() function from their file_operations.flush()
> + * callback. It is possible that an entity object is not alive anymore
> + * while jobs previously fetched from it are still running on the hardware.
> + *
> + * This is done because all results of a command submission should become
> + * visible externally even after a process exits. This is normal POSIX
> + * behavior for I/O operations.
> + *
> + * The problem with this approach is that GPU submissions contain executable
> + * shaders enabling processes to evade their termination by offloading work to
> + * the GPU. So when a process is terminated with a SIGKILL the entity object
> + * makes sure that jobs are freed without running them while still maintaining
> + * correct sequential order for signaling fences.
> + *
> + * All entities associated with a scheduler have to be torn down before that
> + * scheduler.
> + */
> +
> +/**
> + * DOC: Hardware Fence Object
> + *
> + * The hardware fence object is a dma_fence provided by the driver through
> + * &struct drm_sched_backend_ops.run_job. The driver signals this fence once the
> + * hardware has completed the associated job.
> + *
> + * Drivers need to make sure that the normal dma_fence semantics are followed
> + * for this object. It's important to note that the memory for this object can
> + * *not* be allocated in &struct drm_sched_backend_ops.run_job since that would
> + * violate the requirements for the dma_fence implementation. The scheduler
> + * maintains a timeout handler which triggers if this fence doesn't signal
> + * within a configurable amount of time.
> + *
> + * The lifetime of this object follows dma_fence refcounting rules. The
> + * scheduler takes ownership of the reference returned by the driver and
> + * drops it when it's not needed any more.
> + *
> + * See &struct drm_sched_backend_ops.run_job for precise refcounting rules.
> + */
> +
> +/**
> + * DOC: Scheduler Fence Object
> + *
> + * The scheduler fence object (&struct drm_sched_fence) encapsulates the whole
> + * time from pushing the job into the scheduler until the hardware has finished
> + * processing it. It is managed by the scheduler. The implementation provides
> + * dma_fence interfaces for signaling both scheduling of a command submission
> + * as well as finishing of processing.
> + *
> + * The lifetime of this object also follows normal dma_fence refcounting rules.
> + */
> +
> +/**
> + * DOC: Scheduler and Run Queue Objects
> + *
> + * The scheduler object itself (&struct drm_gpu_scheduler) does the actual
> + * scheduling: it picks the next entity to run a job from and pushes that job
> + * onto the hardware. Both FIFO and RR selection algorithms are supported, with
> + * FIFO being the default and the recommended one.
> + *
> + * The lifetime of the scheduler is managed by the driver using it. Before
> + * destroying the scheduler the driver must ensure that all hardware processing
> + * involving this scheduler object has finished by calling for example
> + * disable_irq(). It is *not* sufficient to wait for the hardware fence here
> + * since this doesn't guarantee that all callback processing has finished.
> + *
> + * The run queue object (&struct drm_sched_rq) is a container for entities of a
> + * certain priority level. This object is internally managed by the scheduler
> + * and drivers must not touch it directly. The lifetime of a run queue is bound
> + * to the scheduler's lifetime.
> + *
> + * All entities associated with a scheduler must be torn down before it. Drivers
> + * should implement &struct drm_sched_backend_ops.cancel_job to avoid pending
> + * jobs (those that were pulled from an entity into the scheduler, but have not
> + * been completed by the hardware yet) from leaking.
>   */
>  
>  /**
>   * DOC: Flow Control
>   *
>   * The DRM GPU scheduler provides a flow control mechanism to regulate the rate
> - * in which the jobs fetched from scheduler entities are executed.
> + * at which jobs fetched from scheduler entities are executed.
>   *
> - * In this context the &drm_gpu_scheduler keeps track of a driver specified
> - * credit limit representing the capacity of this scheduler and a credit count;
> - * every &drm_sched_job carries a driver specified number of credits.
> + * In this context the &struct drm_gpu_scheduler keeps track of a driver
> + * specified credit limit representing the capacity of this scheduler and a
> + * credit count; every &struct drm_sched_job carries a driver-specified number
> + * of credits.
>   *
> - * Once a job is executed (but not yet finished), the job's credits contribute
> - * to the scheduler's credit count until the job is finished. If by executing
> - * one more job the scheduler's credit count would exceed the scheduler's
> - * credit limit, the job won't be executed. Instead, the scheduler will wait
> - * until the credit count has decreased enough to not overflow its credit limit.
> - * This implies waiting for previously executed jobs.
> + * Once a job is being executed, the job's credits contribute to the
> + * scheduler's credit count until the job is finished. If by executing one more
> + * job the scheduler's credit count would exceed the scheduler's credit limit,
> + * the job won't be executed. Instead, the scheduler will wait until the credit
> + * count has decreased enough to not overflow its credit limit. This implies
> + * waiting for previously executed jobs.
>   */
>  
> +/**
> + * DOC: Error and Timeout handling
> + *
> + * Errors are signaled by using dma_fence_set_error() on the hardware fence
> + * object before signaling it with dma_fence_signal(). Errors are then bubbled
> + * up from the hardware fence to the scheduler fence.
> + *
> + * The entity allows querying errors on the last run submission using the
> + * drm_sched_entity_error() function which can be used to cancel queued
> + * submissions in &struct drm_sched_backend_ops.run_job as well as preventing
> + * pushing further ones into the entity in the driver's submission function.
> + *
> + * When the hardware fence doesn't signal within a configurable amount of time
> + * &struct drm_sched_backend_ops.timedout_job gets invoked. The driver should
> + * then follow the procedure described in that callback's documentation.
> + *
> + * (TODO: The timeout handler should probably switch to using the hardware
> + * fence as parameter instead of the job. Otherwise the handling will always
> + * race between timing out and signaling the fence).
> + *
> + * The scheduler also used to provided functionality for re-submitting jobs
> + * and, thereby, replaced the hardware fence during reset handling. This
> + * functionality is now deprecated. This has proven to be fundamentally racy
> + * and not compatible with dma_fence rules and shouldn't be used in new code.
> + *
> + * Additionally, there is the function drm_sched_increase_karma() which tries
> + * to find the entity which submitted a job and increases its 'karma' atomic
> + * variable to prevent resubmitting jobs from this entity. This has quite some
> + * overhead and resubmitting jobs is now marked as deprecated. Thus, using this
> + * function is discouraged.
> + *
> + * Drivers can still recreate the GPU state in case it should be lost during
> + * timeout handling *if* they can guarantee that forward progress will be made
> + * and this doesn't cause another timeout. But this is strongly hardware
> + * specific and out of the scope of the general GPU scheduler.
> + */
>  #include <linux/export.h>
>  #include <linux/wait.h>
>  #include <linux/sched.h>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 323a505e6e6a..0f0687b7ae9c 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -458,8 +458,8 @@ struct drm_sched_backend_ops {
>  	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>  
>  	/**
> -	 * @timedout_job: Called when a job has taken too long to execute,
> -	 * to trigger GPU recovery.
> +	 * @timedout_job: Called when a hardware fence didn't signal within a
> +	 * configurable amount of time. Triggers GPU recovery.
>  	 *
>  	 * @sched_job: The job that has timed out
>  	 *
> @@ -506,7 +506,6 @@ struct drm_sched_backend_ops {
>  	 * that timeout handlers are executed sequentially.
>  	 *
>  	 * Return: The scheduler's status, defined by &enum drm_gpu_sched_stat
> -	 *
>  	 */
>  	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sched_job);
>  

