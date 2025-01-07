Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DBFA0346B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 02:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4173A10EA4F;
	Tue,  7 Jan 2025 01:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QAUa8kc6";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476B910EA50;
 Tue,  7 Jan 2025 01:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736212538; x=1767748538;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=fxQ9w2uqlqr2TpH07Ou25kCqBsWu9dmdZ5K72pmSR1E=;
 b=QAUa8kc6FKnivh01nzW4mdgfrz/BbUp22KnP7jgVg4iwlzIfWVDX5Gn7
 vs3si+mDcAkC9pr0neBjAbVDRgbd5Ab1tSF3O/+PhjDhMUccA9BPsGNzX
 BaJeYT29xVQLVaaP+8RD3dHoHQESesBg+fm3lBls4E+EEgNelMGwgolNb
 WHBmaNT2WpKImKDirWsl40WoO9yWBwsX5HVxBrZGXkHgtrrfcQMdXRquf
 U4CKBQdaSJ2EkIAQ7OYM3pPhgaHwx9H6nUn2UNd27LW1zUJYkJ6qOynPc
 tEgaiSpxjC0k+aT6ovGXTot19gqgqrNWzgjoaL4cw7o9q6h7awzHlFgK3 w==;
X-CSE-ConnectionGUID: uv9gNwe6Sm+llqqyIAXZwQ==
X-CSE-MsgGUID: l4IblHOiSbilnW1Mz5iOBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="23986543"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; d="scan'208,217";a="23986543"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 17:15:38 -0800
X-CSE-ConnectionGUID: BZb4MeYXQfGgiCaLDOkBiQ==
X-CSE-MsgGUID: H0vNAgsmQNKqsWJ4R0qP8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
 d="scan'208,217";a="133459488"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jan 2025 17:15:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 17:15:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 17:15:37 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 17:15:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9pQDEU5ZfoZ6AukbZldBbkD+qFQJNgwLPp8FqblkW6LUtbad+98mxIVYI6kcjqqmaoMUc2UHQbTqEh9/D1fkHv04DPc6mg4CTtvtIGVClglFuAwI+1uOSHQvFOYdr5CfZnymtvbzFyu+6tSiojwXVGmIW7aR09YNj4jknu7M4E8dcQMrdu/O4QyoDYya7WMEgvLeY3lvMfpi/fWX0HPdw3fDrETuJt2h3T6r8P9Of/U+dwlAkq4v8vPgeeD6WNs/ePNWIoniYoz806moDao4De5IgUlGhsJ8PuBfbChnXxqdu7eB5MynaJ8uGDGDUT95VgLZckKWO6qE3O6iDJm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rK5fdZ/6kUxivjWhVDO7bZrQBR8pwboTYzNoQQmBZxY=;
 b=oqJdycVnWoC7D8EtIJLArsWo86dvy0nNwgUGkxo6LYEGyRKC+ZlH/m0FWsddR8Ler/Ys0iFVuZ79+NOWWSZeFW3HlVtlEpAadf80tw5igKqnPSqi4LUTLfj1yvCVlrCX1LbujUT09+Rz/AWzG5gcWeAWUGk+ZoN3YsZfwXuV1lOKgnXKohFwqQR0Z4rdLi5DNlQ6CF/Riw2xMBxoMi9EW+QzAoWCun980Aq3io5Ew8lVaYVW/V8CdmzrdmBGSCEGGl7OknWxeg7oAu3Xyd4UbpmXE7PXXW3zRtLI50hv22yptiEIf4sd9Xqaj1x195Fm19wjO38TQmu7RzMcQODLdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB7613.namprd11.prod.outlook.com (2603:10b6:510:285::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.15; Tue, 7 Jan
 2025 01:15:16 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 01:15:16 +0000
Content-Type: multipart/alternative;
 boundary="------------wcOJgXfr9woj40qb2zZZrxge"
Message-ID: <8eb8aa5c-2220-4426-b487-576ab813eb2c@intel.com>
Date: Mon, 6 Jan 2025 17:15:14 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Add debug print about hw config table size
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
CC: <DRI-Devel@Lists.FreeDesktop.Org>
References: <20241221011925.3944625-1-John.C.Harrison@Intel.com>
 <27c27339-cde3-4028-99e5-deb574c091ec@intel.com>
 <16414d38-e5ae-4bc5-9b22-a2a7a928264b@intel.com>
 <5c2c8e5c-c16d-41c1-90e7-07b1ddf0f923@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <5c2c8e5c-c16d-41c1-90e7-07b1ddf0f923@intel.com>
X-ClientProxiedBy: MW4PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:303:b7::32) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3b8998-6536-420d-7430-08dd2eb8beb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bm8xYW16S3ZEWjRKZnUrS2w4M2loZmdDa1RWL21BUFhWeFhTbm5zVXpzWmY1?=
 =?utf-8?B?SXUrK1VjdTAzMXVOb3Q2bFovL3FHejdJd0pBMVhnbWVLU2hTTzcwVnZ6azZZ?=
 =?utf-8?B?cnRvR0puOVE2NnJ6MVJsYzE4Z291VllHQ2NPTldjaG9LSHBCZXFQaE03a2k2?=
 =?utf-8?B?dFFHSEd3blIwUVJGU3FlZTg3WEJJbWcrVlg4Z1BoN1pzYjduM3RITHl0azcw?=
 =?utf-8?B?RGFvdHlDSTJYekpiOFl6dHlOQmNnTng3VWNxYzdBd0RkMjVkeHhVdFdFalUz?=
 =?utf-8?B?WXVIZHhjbFgyUDZJRDIveTg2c1RyZEw0SEpOV1ZKb05lQzhtREpXeW9weWV1?=
 =?utf-8?B?VEV5TG9EQStWempPSzRxL3ptQWJrL1FoQWlWUWtJaXZwMjd2dG12c1Y1S0FZ?=
 =?utf-8?B?UHRqdmlNV1ZSbGc5QW44eVJPZkZacWF2bDJXaTFkVlNPa1R2ZldCZVlPQ2lZ?=
 =?utf-8?B?TS9HelV0SVFZc05ORFhmM2YvWTRWNFN1Rm1zNXdIVkcvVUZjNGRHU1hYY004?=
 =?utf-8?B?Qmh5dnpYMXVCVnkxWGh1MHFmdEFvelZhcjVLeTVkeTh5Q3g2RFpOWmhZN21w?=
 =?utf-8?B?Y2xES0NMRkp0WmljZXYwa3J2VnB3TDFHcWFBMjh1ZEhGbndWZFh6OTBWcmhi?=
 =?utf-8?B?V1ZraXBQeXpVWTZsRlJ5ZlBWWk5GVFFIcS9sdVM0WVRTdU92dXE0Nm1YdVRC?=
 =?utf-8?B?TDlQYytqekdhby9CdDR3THNXWWluMVl5TlRRakJJSkx1QWFzRGh0Q2pMeFRB?=
 =?utf-8?B?RjlBUEdGWTQ5RTFJQzM5cjZtdTQrUWQ4VEhKM00zSEZVZWdUNzBTN3AzeFcx?=
 =?utf-8?B?NXE0YklPT25MSEtKMzhmQnNoQjYzMU0vZ09XUndKb1JjaFFPbzZjdlFkTytV?=
 =?utf-8?B?ZVNEYXRHcGxsWW1RdkNRY1BRQUIxM2tvOEhDcnQ5anc5TWhKVzFmbVR3OThI?=
 =?utf-8?B?WENINzhUVU52TTZTUG9reVl4UDh0dGNMYk5kZDdJbmUwNTVvdHNIZ0ZjRGZp?=
 =?utf-8?B?RnVyenhWbUFFNzRaZGdWU3pxUVJZMGw3UzNuSjBnRHlueWZEYlVCNzE0Tnp4?=
 =?utf-8?B?U2Z4NmtmemxGb1NRMFpvbHB5aDhmWjdnNWY5ajZlVGRpcHl0NlVtcmo4Y0ZM?=
 =?utf-8?B?RWs4ZDAzTkxkUmxNcjFrQmtGQy9UVFlaMW1FQnk3NStkWENSZUgyZDJ2VHd2?=
 =?utf-8?B?OFphWXZHVDZKYjVZYURkSW5YUDh5SEZnOCtWQmlTYWV2WjgrdkJKSXA2NjVT?=
 =?utf-8?B?eXZQYUJ0azZRTzlveUFvc3lTZ25ZVEFubFZqQlJRRXlMT205N2JxS1E0eHNC?=
 =?utf-8?B?K2NJZ3JKV3ErcHN0NmNrdG9DNFpHcTU2TThWSGxYaGVUaENncXVoNVkzeC92?=
 =?utf-8?B?aTJuMDhNUVRxU1NVaEdmK3lXbVU1N0FubFRLK1ZlRFBKV09uRzJaaW10OGpX?=
 =?utf-8?B?RDRrelJGL0hyUDc3UE04T3RQNkJMNkdDMUNMZjg5U3Q1MitsT1l6V1lTVk1P?=
 =?utf-8?B?bFB3azBsTU9OeGNYRHVNQy9BdHRkYXJVM1djSlJZTTE0WHdHR0oyQWR5eW9D?=
 =?utf-8?B?RmljL0tGaU5DaVJjeG5nUzJLTDYvM3BraHNIUTVnNndObXZJQUNGZXlXdDZl?=
 =?utf-8?B?dnVVK2MzQ3RmTXRPZjFTaW9ZSnhFT0FvMGJpVnVVc2NjcFY2YmswQUJwNHEz?=
 =?utf-8?B?ZFZIaTBNdzJBOVZBaXp4Z3YrekxnUFJ1NFBabTM4YVc2azQxcUhWdmpIRVli?=
 =?utf-8?B?MlFPbDRBYS9hSVFjVDMvZkZ4T1hpVklXVms4SHhtOVQ4WVdaMzdzT0JwVWRz?=
 =?utf-8?B?Rzg0b1dBb09jdU1lR2xwQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm55Rmx2N2dzaWI2QzF1Ym54S0RqUWI4ak1tVzhSeW55aDdKQ2NlK2pqcEpo?=
 =?utf-8?B?RHpZUXM3SzN6NDJ0U0hZenZ5OTFlYUNTWVpISFZCQ1dlVUJGcEhYdEJnTGlE?=
 =?utf-8?B?eGlSV0sySmV0UkF5b3VBNXlqL21rT2VVVS83Z2o0K211OGhKM3lseU52VFpq?=
 =?utf-8?B?MURucFNKK1JvVURHK3BOamJvVDhtcG0xNjljMjZpTm81VWpYZWhvcmxiczRn?=
 =?utf-8?B?YnUxWEtRSWMyUVJYdmdIZFpCMEpBZUhFYloxUC9WYTh1eXBqbGJPUE5WN2tM?=
 =?utf-8?B?V01nNmdJMVRQcHliSUYvQ3MwdUlIMDJJc051M005eWFNakV3bExob0kwS3Js?=
 =?utf-8?B?MEREQnI0YVlrazJabFdIZUlkZk5nWjVQUGY1SEdjT3NJOHJhanFmWW1QcS9T?=
 =?utf-8?B?bHdqUzlDajY4UjI2a3hQWFJIWU1ueStqSzcwMXQ3REd3TGNNd3V2Z0dDeStr?=
 =?utf-8?B?cDVyMlErY1pyd3JxTmgvMHdFMTZhOW82V0paUlJWNXNQZWJZdFFMRUhJSFhn?=
 =?utf-8?B?dTE5ZUpNQ1A1Zi9majVMdWpYSEo0dE1LL25PcE1Wc1BTUEIrVTJVQ1U4Mmdl?=
 =?utf-8?B?TlN0MjlLSkVGbkxUMW5VdElSajZvMlpiTFgzMkk1NXREVXhMdENmd3lzRjds?=
 =?utf-8?B?Qk1oaUZoTVJMUGwwa0cyK2x6K2VNcFU3WXVZaWdGZ2l1ejhBTXlvdE5UblNZ?=
 =?utf-8?B?cnA3V2cvYkpqdkRiSUZlZDJKQVhVNldMUXpHOC9PbVMzVzZKbWRrMlhPR2dj?=
 =?utf-8?B?UWhST2NaMUlEcXlKUm9hSXpaM3I0RDlHbTFpUVFBTkhJcll4ZXFXd1Njalps?=
 =?utf-8?B?UVRWdTJCRjJYR21uYkpmNzBGMWVpSTZQSmllSlhyV2RWejUxb0EyUlpORDNr?=
 =?utf-8?B?allIdGh2NkFjNXVUMk9uMEg5cGtnQlhtMStPL1N1ZEtHRzVRaXZKOTduYldo?=
 =?utf-8?B?WVhGaXdldVF0TEFkL0hKTEJpNHYrd3BJU29xOWhFL1ZDZ3h0MVdZUnNON2Q0?=
 =?utf-8?B?WjE5UnFhdEdlTkNjazJZQXFDbUhGclpsbVVhY3d1UmpySnRYLzVmanZpUCtI?=
 =?utf-8?B?WlB6VmJ3NWhyNjhUUXVFUmU1ekY0OS9LR3NSRjNIalpQNVN5WmFDM2RxQzhB?=
 =?utf-8?B?YlFhaW1rM1dnUTA3WUFBRmVReWV0NnlnQkZ1bVV3ZnVsQ3I4QkZVcEZlZ2hm?=
 =?utf-8?B?NTdrZnJIRDN0cWZxUElVZ0M2Y0wzSi8vdSsxL2QxNHJucll5Y0RFVjBncGtL?=
 =?utf-8?B?Smp5NmFTYlJaQjUrY1hydlAzUFE5eVZ3TjV2aFl2c3FvNkMvOGZTWEpqM241?=
 =?utf-8?B?RGF6VkxMa1BERHVDdEU2Y0VGZy9ibVk5MkpqdnRVdThTaEZ5aXR1elRkV205?=
 =?utf-8?B?UEJyeWYwUjlVZjFUYnkwUU5pVkE3dXhEb2Z2M0ZCM05tUHJLR205VUxoSWtJ?=
 =?utf-8?B?b0NZMG10N3JOa0xJRFdLRFFMUUoyMTlLeTB5Vmk2anBablBUcThLbWVxNGUx?=
 =?utf-8?B?M21XWlB5YUJrZVFUVUR2aHpCSUFWUEw2VGllZ1RrM1NPNkU0dDVHQlB3TzhL?=
 =?utf-8?B?dlFPYnR4SkxyV1R6TzRrVW1jaG9hWlRjekpqUnZtYTFkakpDOGw5and1NVp1?=
 =?utf-8?B?MXFuODdUTWcrbHFsckQ0MWJWMG9zbUVzTDZJcWV2RXBjN3hVZC9UVTRFV3Jr?=
 =?utf-8?B?Y3RCREsvYXgwWnBuRndRWkU4WmdCa1pYZFlVRHhBTDZjTHpnNTdlK08zaVNq?=
 =?utf-8?B?TzdRbzlQcGQxdlhPcUkxYm55VW1GTkRNOUU3WXMvOURrVmhnL1FBcUU0L0g3?=
 =?utf-8?B?NU9vdTBmQkE3bTFNNTRVRm1rNmw0cVhqUFdwWE1kdVVZOFRHLzdNR21VYUNj?=
 =?utf-8?B?YmlZOXREUEJ2MTZON1I0U0dyZ0l3MTJ5S0tZaGpkdFFoK1ZsM3Y4cDNoc2pa?=
 =?utf-8?B?eEZkc3FFN2dwTzE1WTkveVhWbGk5MWdzamtPcDZ1Q1hucmRnd0U0TThZWkcw?=
 =?utf-8?B?c3NrUWNVNmRjb3J6WElPcnRBajJ0bTlWWjN6VGpxbm80UWc3SHJXUVRuTmlT?=
 =?utf-8?B?VkoyU016cTV1VjF3L2Q1TlBpMm1WUlVaWjlSQytMZSswbjBEVjdnTSs5YzVi?=
 =?utf-8?B?eFRMRUdIbTdnMlIxSW9SNmJZdFN3WWlIQy91RjZLdlFXQXpvRk83bFZmdWkr?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3b8998-6536-420d-7430-08dd2eb8beb2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 01:15:16.6393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FSZwS1icCGnEfWloi5zvxlHMekl83BcVSDDFBV7nDv0rKJ2jKmAmw9+gyMonywTw+hgEtpGG06DUy6WdBModwlyJMvPT0ltKSOrb0f+RsvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7613
X-OriginatorOrg: intel.com
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

--------------wcOJgXfr9woj40qb2zZZrxge
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/24/2024 11:10, Daniele Ceraolo Spurio wrote:
> On 12/24/2024 10:13 AM, John Harrison wrote:
>> On 12/23/2024 15:20, Daniele Ceraolo Spurio wrote:
>>> On 12/20/2024 5:19 PM, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison<John.C.Harrison@Intel.com>
>>>>
>>>> Add debug info to help investigate a very rare bug:
>>>>    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13385
>>>>
>>>> Signed-off-by: John Harrison<John.C.Harrison@Intel.com>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>>>> index b67a15f742762..868195c33f5b3 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
>>>> @@ -7,6 +7,7 @@
>>>>   #include "gt/intel_hwconfig.h"
>>>>   #include "i915_drv.h"
>>>>   #include "i915_memcpy.h"
>>>> +#include "intel_guc_print.h"
>>>>   
>>>>   /*
>>>>    * GuC has a blob containing hardware configuration information (HWConfig).
>>>> @@ -42,6 +43,8 @@ static int __guc_action_get_hwconfig(struct intel_guc *guc,
>>>>   	};
>>>>   	int ret;
>>>>   
>>>> +	guc_dbg(guc, "Querying HW config table: size = %d, offset = 0x%08X\n",
>>>> +		ggtt_size, ggtt_offset);
>>>
>>> This seems to result in a double-log where the first print has no 
>>> useful information, e.g.:
>>>
>>> [drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config 
>>> table: size = 0, offset = 0x00000000
>>> [drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config 
>>> table: size = 752, offset = 0x00D05000
>>>
>>> Given that only the second log is useful, IMO better to move the 
>>> guc_dbg to guc_hwconfig_fill_buffer(), because the info needed for 
>>> the second print is available there and it is only called once.
>> I disagree that the first print has no useful information. It tells 
>> us that a call is being made and these are the parameters. We do not 
>> know what the failure is. It seems highly unlikely that the size 
>> changes from query to the next given that the table is a fixed 
>> entity. It is much more likely to be a caching type issue with GuC 
>> reading data the KMD did not write. If so, GuC could potentially read 
>> non-zero data for the initial size query and complain that data is 
>> invalid.
>>
>> The intention is to report all calls with their parameters to try to 
>> narrow down exactly what calls are not working.
>
> But we don't need both prints to know which of the 2 calls has failed, 
> if the error comes before we get the second print then we know the 
> failure was in the first call, otherwise it was in the second.
Is it really such a problem to have two lines of debug print instead of 
one? Given that this is a 'this cannot possibly happen' type bug, I 
would much rather have totally explicit debug at the point of operation 
rather than something further back that requires making assumptions 
about what is or is not happening.

John.

>
> Daniele
>
>>
>> John.
>>
>>
>>>
>>> Daniele
>>>
>>>>   	ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
>>>>   	if (ret == -ENXIO)
>>>>   		return -ENOENT;
>>>
>>
>

--------------wcOJgXfr9woj40qb2zZZrxge
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/24/2024 11:10, Daniele Ceraolo
      Spurio wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:5c2c8e5c-c16d-41c1-90e7-07b1ddf0f923@intel.com">
      
      On 12/24/2024 10:13 AM, John Harrison wrote:<br>
      <blockquote type="cite" cite="mid:16414d38-e5ae-4bc5-9b22-a2a7a928264b@intel.com">
        <div class="moz-cite-prefix">On 12/23/2024 15:20, Daniele
          Ceraolo Spurio wrote:<br>
        </div>
        <blockquote type="cite" cite="mid:27c27339-cde3-4028-99e5-deb574c091ec@intel.com"> On
          12/20/2024 5:19 PM, <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:John.C.Harrison@Intel.com" moz-do-not-send="true">John.C.Harrison@Intel.com</a> wrote:<br>
          <blockquote type="cite" cite="mid:20241221011925.3944625-1-John.C.Harrison@Intel.com">
            <pre wrap="" class="moz-quote-pre">From: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com" moz-do-not-send="true">&lt;John.C.Harrison@Intel.com&gt;</a>

Add debug info to help investigate a very rare bug:
  <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13385" moz-do-not-send="true">https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13385</a>

Signed-off-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com" moz-do-not-send="true">&lt;John.C.Harrison@Intel.com&gt;</a>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
index b67a15f742762..868195c33f5b3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -7,6 +7,7 @@
 #include &quot;gt/intel_hwconfig.h&quot;
 #include &quot;i915_drv.h&quot;
 #include &quot;i915_memcpy.h&quot;
+#include &quot;intel_guc_print.h&quot;
 
 /*
  * GuC has a blob containing hardware configuration information (HWConfig).
@@ -42,6 +43,8 @@ static int __guc_action_get_hwconfig(struct intel_guc *guc,
 	};
 	int ret;
 
+	guc_dbg(guc, &quot;Querying HW config table: size = %d, offset = 0x%08X\n&quot;,
+		ggtt_size, ggtt_offset);</pre>
          </blockquote>
          <br>
          This seems to result in a double-log where the first print has
          no useful information, e.g.:<br>
          <br>
          <div style="font-family: Roboto, Oxygen-Sans, Ubuntu, Cantarell, sans-serif; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: nowrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span id="dmesg-normal420" class="dmesg dmesg-normal" style="font-family: monospace; white-space: pre; overflow-wrap: normal;">[drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config table: size = 0, offset = 0x00000000</span></div>
          <div style="font-family: Roboto, Oxygen-Sans, Ubuntu, Cantarell, sans-serif; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: nowrap; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><span id="dmesg-normal421" class="dmesg dmesg-normal" style="font-family: monospace; white-space: pre; overflow-wrap: normal;">[drm:__guc_action_get_hwconfig [i915]] GT0: GUC: Querying HW config table: size = 752, offset = 0x00D05000</span></div>
          <br>
          Given that only the second log is useful, IMO better to move
          the guc_dbg to guc_hwconfig_fill_buffer(), because the info
          needed for the second print is available there and it is only
          called once.<br>
        </blockquote>
        I disagree that the first print has no useful information. It
        tells us that a call is being made and these are the parameters.
        We do not know what the failure is. It seems highly unlikely
        that the size changes from query to the next given that the
        table is a fixed entity. It is much more likely to be a caching
        type issue with GuC reading data the KMD did not write. If so,
        GuC could potentially read non-zero data for the initial size
        query and complain that data is invalid.<br>
        <br>
        The intention is to report all calls with their parameters to
        try to narrow down exactly what calls are not working.<br>
      </blockquote>
      <br>
      But we don't need both prints to know which of the 2 calls has
      failed, if the error comes before we get the second print then we
      know the failure was in the first call, otherwise it was in the
      second.<br>
    </blockquote>
    Is it really such a problem to have two lines of debug print instead
    of one? Given that this is a 'this cannot possibly happen' type bug,
    I would much rather have totally explicit debug at the point of
    operation rather than something further back that requires making
    assumptions about what is or is not happening.<br>
    <br>
    John.<br>
    <br>
    <blockquote type="cite" cite="mid:5c2c8e5c-c16d-41c1-90e7-07b1ddf0f923@intel.com"> <br>
      Daniele<br>
      <br>
      <blockquote type="cite" cite="mid:16414d38-e5ae-4bc5-9b22-a2a7a928264b@intel.com"> <br>
        John.<br>
        <br>
        <br>
        <blockquote type="cite" cite="mid:27c27339-cde3-4028-99e5-deb574c091ec@intel.com"> <br>
          Daniele<br>
          <br>
          <blockquote type="cite" cite="mid:20241221011925.3944625-1-John.C.Harrison@Intel.com">
            <pre wrap="" class="moz-quote-pre"> 	ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
 	if (ret == -ENXIO)
 		return -ENOENT;
</pre>
          </blockquote>
          <br>
        </blockquote>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------wcOJgXfr9woj40qb2zZZrxge--
