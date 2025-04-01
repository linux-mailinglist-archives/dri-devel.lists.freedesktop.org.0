Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55427A773E3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15DF10E4E7;
	Tue,  1 Apr 2025 05:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C7AnkL7+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDE010E07B;
 Tue,  1 Apr 2025 05:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743485304; x=1775021304;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pW1dblMQmpAjYG6NgYcvbsw0mexhBLXng3HL9u6ErEM=;
 b=C7AnkL7+VbhOMmpmvbLkmieHLk7AEYVHMbolGQaGNtQQEPBn4BPbWi2y
 RVWmetIfN+Qr/X49sIgDWiahWSHzf67Tj/Evoc0lg7lupIAZ8EYAJ+g78
 ExD2I3FlzKv+rNumcI698sazNFsIdnHAAPywaY5o9FV+VWFE2qbHWO1zL
 BgDlzkIxn6XHak4KJ6kXkzqPXZLlgUqaChhBUY7WkCHf0StZUh2njuk6j
 MZz5ryJyDu4u5GiGA1FzmU2wq7POUW4I0sBt6LzodMgqp/yMhJrwV/R/h
 yQM9pFzItY7nuVJYMihu8ZCh99isZqoFrD2cgfio5yObRFlAG39KXR6ka g==;
X-CSE-ConnectionGUID: /7ghK4mFQuWyy8Dn1mid+g==
X-CSE-MsgGUID: 3vi072vTSGupXhm276uYQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48579392"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="48579392"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 22:28:24 -0700
X-CSE-ConnectionGUID: 9Ovy996RRcyG8ITo2GgRBw==
X-CSE-MsgGUID: DekyU3mESmu/Y0o6VJkxKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="130401801"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 22:28:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 22:28:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 22:28:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 22:28:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EC0Y7ozbqEvEIzGKETtpEIWWlzHg6XxkYogryHVo85T+oU4szuulJjL+/XMdg0FCr/CGo15wJpYKxvsceI7PrbFSyyaUc+Vb+egg7ZLFW08bDOrzcB0IN3OyZPHJyS8vkHyh4VFnAub+WOEt9XY0G5KVNWAlgud1TQ2mympxhm/pB5OHNDQSTzRFMVxQVnSJOBqUa8ciVgdgydV6Esr0H3GPPC1IXm3mdHgAXGmBL/ch71IEUJlWOb+8Oxu2oiDA/5seEhV4fMq0AQzBNx0qraputdg1isCgWhSRIz1zp1LKHTgJ60A8EbEfIQuO3uMcR3nfWkDKKC9VQ5NlvHTIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXljfmYfNOWlA/2txSGtaQ/CwD3inFmnViUvzWv4hYk=;
 b=eQMU8nwFMCCw2uJGImTX7q2OH4qmaM1fYR397k3g0+PaN7WqfIk+bS/2zsNaUyCCKrG/8Dj6oYLjOLENk9K0MN58ffTHKaS1d8l2G6QpFrK+VNPNouY1WK/ILLMABlsi+GLeAJ4xTJZ2wdQPunRUyQk8woW2pNYY83l2p16ZUU+qxF9UPFL68cidEtO9mCGReDnTZ+sZg/T9pEc4nH8+IEoh4hy/ENt/w6SLHGIR0AahCGDkHQn75a81QvL6V7nrnmQUL9IHT6MpyrJEEI/fKKUTxAMyQ69Iw7iyBGzCDvYy86AJoYj2aKrpWOd2HKLdP0+46+Th/ngq1XXuY7oYiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.53; Tue, 1 Apr
 2025 05:28:13 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 05:28:13 +0000
Message-ID: <9efba6f4-9060-441c-ac88-4648653774a9@intel.com>
Date: Tue, 1 Apr 2025 10:58:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/i915/display: Add sharpness strength and winsize
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250321160628.2663912-1-nemesa.garg@intel.com>
 <20250321160628.2663912-4-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250321160628.2663912-4-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SN7PR11MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 60342b82-0eec-4197-01d5-08dd70ddffb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk15eERVcDJsS2N6VS8wYWNpNmU4RUNzT2M0UWRxQjhvSm5HYmZZRGdiV2Fz?=
 =?utf-8?B?U1g0eWpqUVJ1OHJ2NUd6aU1LWERjOEt6SUxVN3psL0lWZHFreXQwS0ZzQ2o4?=
 =?utf-8?B?QTkydGEzZ3FvZ0hUcEJFRFlRS0x5d2p3STQ5REVUTStUend2YmNvS21Ra0tv?=
 =?utf-8?B?MHVpY3oyTUlZd1piRnBJYkhNeUpJRmpLK1Z2TnF6dmRXNU5kcWk0K1AvRlg0?=
 =?utf-8?B?RVk4TzkrcTZNMlBPRWVwaEcwR0h2RC9wUWJUWmJtR2VJMGRPd1BzY2ErMFVH?=
 =?utf-8?B?OXNGS1hYU3R3MXJOTy93OWE0cGluL2k2dXhxR2tlcUE1SEJVWlpqdG1URFV0?=
 =?utf-8?B?VDA2WGs0RklWMEFzQllSREhtVEhhWGxLdnZlZzBUK0FoQTdzUGxhT0YvclBM?=
 =?utf-8?B?WFJ5UkhQSlJMZDA5QlFtZWczR2tKd1ZQKy9teDJqRm9OWXZldVRBSzhMZG9D?=
 =?utf-8?B?MC9WSWFlVkxHeS9GRU9uTlcxREJTVnBKSDFLTTBaM0Jqb3RLMXJMNnZORytD?=
 =?utf-8?B?aFlSMkc4SzhVNVZSazIxRW9tbkRqZmIzMmlpTHgyM2ptZytMYzVVcDZTZEVV?=
 =?utf-8?B?R092cU1Pc2QrTTMyQXFPUks0T3pjeGJ2NW1pZ3pQWHhTYTJWaDZWZHlZczVU?=
 =?utf-8?B?OThUVUdqRU1QNnp5MUtrNUhMemRLNE1uTC9OaGMrREZ1KzlZZGpFMXlEb09z?=
 =?utf-8?B?aEtZY01tZkd1R2dybWZrZVgzeTRZZ2ZKN0YyZmVPZTcxeExrSlUvbVNhVjNU?=
 =?utf-8?B?UktYZnV1UitNdWszTGZrdml1Yms0Y1N5aXRsNzcxbm1qV0cyOW1tTDVvZHVD?=
 =?utf-8?B?OVhOMEphZWVvM3lPQ3ZGQ1BIUHNFZU12cTVvaGRmVFROMTBHUUZ6aHZNTlhv?=
 =?utf-8?B?dUNWU3hvWTR5QUswemFDdi9xTWNGdi9TMHVoOW1MMGZUVENQSjJRZ0F5ZUtp?=
 =?utf-8?B?eXJNU29wQmRMYllSUDJBbVIrUjdGTHY0Z2N2VDNaS0JRUnltbUM0RGhnL3Z0?=
 =?utf-8?B?cFV6enBiQUZhV29EK0I0UHppQTd3N1hBRDBTVTV0ZHJWSTN5V1MrN2lTN1A4?=
 =?utf-8?B?NGxydytUM0tPQ1dZRHV4Wjg5V1VzcnNkOXQyUnF6VURGcWdINnJSeDJrZUZy?=
 =?utf-8?B?VllGRWFPTnlVR2VYZ1RMRVkvZm5Tam5CbDRKbVhXZThiUmhUTUJUWnI0OFp3?=
 =?utf-8?B?SEtwNERONUtjdWo5NEY0N1VvY1NVZG8wV3lUMmtyUmcrMDhRYVRUN2haUDVk?=
 =?utf-8?B?SnlMUW1DR2dVOE52SmZkYWFJMGlwV0dENmtFUWpWTlU5YkYvYmxGWVVlTDFH?=
 =?utf-8?B?d0h0dTdMK2o2SDh4aEhRU0pHN1JxTzgwWTRVSGdKdmRNMlBLRy84UHg4L2Yx?=
 =?utf-8?B?ME1xTTlmeGd1RDhsOERjWXhYSzlYMTN6NVFZZks3aXZ4NzJ3aEc1eURYcW1K?=
 =?utf-8?B?c2x1Q3pwNytWWVBjYlg3SEowQTlKTTlSeVN6M2Ywc0VHVDlXWlM2dVo0c1VQ?=
 =?utf-8?B?QjZaWEdHdmFCWFB0UU1pUkxvalRreGFDenNZWU5hWG55cElMZVU0TWU0L25P?=
 =?utf-8?B?aUgzTDZRYVBaMmFqMEZlMWl1V3ducDdNRDQ5Z1V4a0xtT0g4NnpydzRLcDRp?=
 =?utf-8?B?dldZSHEvNDhFd2NyQ3hzUS9aSW5YcGNoaUdUOTZHK1NUTHhFZUQxZ0JNZkZT?=
 =?utf-8?B?cnZRY3hUSTRQLzJjM2VsK2F4NVNjUTFhaXUvME9jWGV0OEFDRyt2YnQ1Yzkv?=
 =?utf-8?B?VkNLWnNSbkV4eEYyS0h2K3UxY3pRYkVRcTVQSFdKWHU0b0QwSzFpQXg4Q1F2?=
 =?utf-8?B?WkgreGV5S1BTUHhzU2pQWFQxbGNtVE4rV1llK0VKZU04MXViS1Jwa3kxNytZ?=
 =?utf-8?B?ZHBHOTI2LysveFVxL1lIMjh0dWV0TDFtNDg0eHZCTG9sYURYc2FjeUpXVDh3?=
 =?utf-8?Q?JozKpwTERgc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDlXVlB3NkljVUhXalpkRkRBK0VQNm5tWXJieE13MTMxOXF3S1pYVUJ3SjFw?=
 =?utf-8?B?ZU1ld1NsSFpWREd1eWxTMnVCK1FJQWdRd1U2RUYvSElTT1lvLytCb3A1Q1cw?=
 =?utf-8?B?bGFSWlI5ZkJzQ0Y0RU0xM3Fhb1ovaXl6THVNcUNrVnpDZEg2alJZejR1Zzd2?=
 =?utf-8?B?R1VBa0t3dm9rOFdRdGhLUXFrRTFpQXNHejJjRWZUZk4zQlpzZ0s0Rm1lbE5m?=
 =?utf-8?B?Y1VwaWVhY1hMcjNrVWwyeTNLSkJsTGZqZDJIVzNGU1RoSmlmVnRhcnZnNG9k?=
 =?utf-8?B?QzVxYlpQRUtFU1RBeFNJcUxmQVlLWEUyUHd6OVJrSDdhRW9zS2RZNGJjWW9u?=
 =?utf-8?B?RGw1Q3hlZWIrVXg4V2VNM0ErSkd3OEQwTngxZzUwR08zTDJJS3NLbEd1c2ph?=
 =?utf-8?B?ZFowV2IwRm9OeVhHMzlrMXcreUZvYUNmeHhFMmIyY2x6UjJzSFdTU0x4TkV4?=
 =?utf-8?B?RVdhekdvSHBrRGlLZ0s1Sm5NNjg1aFdkRVB4YkNMR1RHWG1pd0svR29tL2R0?=
 =?utf-8?B?R3NSSXY5ZW1rZ0MzRndiZU5BbXVnYkV0dFVTQ1BuWEJpRGgvSFB0dVgzZ3lZ?=
 =?utf-8?B?UytUZ1ZGK1BHZHc4clVaRmhwRHJ3M1BMS281NDFqUmNBSTBjV2Q0TjY3d2Q3?=
 =?utf-8?B?MTB1WVBYS2J6YnlleXpjYUV3UlIwM3FvTTRUcG9vL3Jjb240WUlpelNBTGVo?=
 =?utf-8?B?OTFvbnE4TTVLS0x5RU9vMHZUZUlrOWdxdEltN1luWFkzMXFEOEVUS1NGeVZ3?=
 =?utf-8?B?ZExBUndrcm44Um52RVk3aytmcXVzOTlrcmloeTZwTS9zR1NWd3BiZ2F1QlFt?=
 =?utf-8?B?UE04NEVlUGFkZ29FNndRWVdOMmRTUUptWGlPWFVtWkVLMXRTNThKTWIzK3Z4?=
 =?utf-8?B?dGViR09JVFNWNlVoRS92Tnh1eDFER3VxK2FMWHcwZXp0anFacXM4QlJyV25k?=
 =?utf-8?B?MWlLZjY1WHdHc0hFY1YwVEh6YXV6ajNIS2t1d3kyd3R5Q1lzOXJjbXhaN2x1?=
 =?utf-8?B?Ym1QTmlHWGJ3OTVCbHNnTjdaMGJaN3ZxSURiVmtRMFJTeWI0Tlo3bmgxQ29N?=
 =?utf-8?B?WVprUXBoWWN3YzN6REFvNjJmcTd6clZ6MmJaNWZqVUJxYkZpWk5tNk0xVEk5?=
 =?utf-8?B?b2czWUxFZWhMWkJEcXkxZTFNaVhxeXZ0amVKblpFc1JHcTlYVTBIRVl5aTBl?=
 =?utf-8?B?NGJhV3E1RzVSc1NHK28zais5akVUd09yUFVlRXhnelcwRUF0d2R3MzlTT0h3?=
 =?utf-8?B?VTIrcngrUFhTQnZ1MnFSaGI0NDJqekxLSTVKWjZtcm5IOUxQd1k4d2k1enRX?=
 =?utf-8?B?RnRzd2xoK0MwM2FZSi95cEdHSVovSjViVGErOFBvODhHejRxTDFIYW5rWnpu?=
 =?utf-8?B?bFQ3d1g5MTU2cUZHUTRCSjJmejZNSkFvQ3RjbW5iakRQa2pDeDNPUDJlL0Ey?=
 =?utf-8?B?U1VrRHFncGNoZlVwbjlQbTlkcVM3L21HU0FiaXA0Mk96ZEt1RGV0dzBsNXVa?=
 =?utf-8?B?d2YxNHpYeG5Ueng4V2psenNVck5qbTNoTzVQY1VlQ0htc3NQZExrQWVCWElJ?=
 =?utf-8?B?dUNMOHcvd0ZFaHpVdU5oVlBtbENFWXVLcDd3WjVuR1RQMXdxU0Era2xlUi9v?=
 =?utf-8?B?bTdYT3hINW5JcU9HOXRONGpWRU5GRUZiY0Z6ZTVyMk1YZjFwWktkWmFSSkdF?=
 =?utf-8?B?ZGZuaGVha0FQeGR5SjdLWXUxaTZnYVFrOFRnS1YxK0k5WjFPdS8zR1lYWjUz?=
 =?utf-8?B?ZHZUd00wSDVpeU9Ga1gwcGZQUVhzN3VvQlE4bDZvUGVpZW45RFJaSHZobm0x?=
 =?utf-8?B?OVhFSVBQTjYrNXZCS3Q2WFBsNDEzTWo3eHRzSHFnWFFwMzBSUVIrSUo5N3l1?=
 =?utf-8?B?SmpXRTk1NzR0alc3UTJtQkNSemxqdk1DUkNpSnJKQ29WT0tuY2hFR2NUd3J2?=
 =?utf-8?B?OE9zS1daZU5JTHFmQXVhL3ZSRjB6L2xaQVZqYW1lenRmZDZVcXI2UlFRUE1G?=
 =?utf-8?B?enBwUlcvS2xJQ0ZuZVVZTEJQSDllc1pkMHJ0Snd3UUhmYU9odVpzVVpybzFH?=
 =?utf-8?B?MEZhRmVwSVJaL1lOS2xrK1dQVHF3OEY0Y1hmTU5uaGtVZ0NLak94QXpuRFli?=
 =?utf-8?B?dEpSZ0gzRzVuc3o0Uitpd0NaY2RnZXo2OGgyWi9pUE5kTkVOcFJSR3piMm94?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60342b82-0eec-4197-01d5-08dd70ddffb4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 05:28:13.7798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3tBx0cGxOjIMzDZYrcrGO15ytw8zOYmZOEUQXLj066okHUovJJvbDJ09d+Gc+B3ZKMXWUvsX5CUt4JrbZ/jVERAAZ9UowX8gI1cn1nQi4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6678
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


On 3/21/2025 9:36 PM, Nemesa Garg wrote:
> register

I think this is part of the subject, need to fix this.


>
> The strength value for sharpness is based on user input and
> the winsize is based on resolution. Set the casf_enable flag
> if there is a platform support and uapi strength is not zero.
> Once the sharpness is enabled then just update the strength
> bit of the register everytime whenever user changes the strength
> as enable bit and winsize bit remains constant.
>
> v2: Introduce get_config for casf[Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |  1 +
>   drivers/gpu/drm/i915/display/intel_casf.c     | 99 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h     | 17 ++++
>   .../gpu/drm/i915/display/intel_casf_regs.h    | 22 +++++
>   .../drm/i915/display/intel_crtc_state_dump.c  |  7 ++
>   .../drm/i915/display/intel_display_types.h    |  7 ++
>   drivers/gpu/drm/i915/display/skl_scaler.c     |  1 +
>   drivers/gpu/drm/xe/Makefile                   |  1 +
>   8 files changed, 155 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index c8fc271b33b7..a955960d09ec 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -230,6 +230,7 @@ i915-y += \
>   	display/intel_bios.o \
>   	display/intel_bo.o \
>   	display/intel_bw.o \
> +	display/intel_casf.o \
>   	display/intel_cdclk.o \
>   	display/intel_cmtg.o \
>   	display/intel_color.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> new file mode 100644
> index 000000000000..28f76b06fd8f
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + *
> + */
> +#include "i915_reg.h"
> +#include "intel_casf.h"
> +#include "intel_casf_regs.h"
> +#include "intel_de.h"
> +#include "intel_display_types.h"
> +
> +#define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
> +#define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
> +
> +/**
> + * DOC: Content Adaptive Sharpness Filter (CASF)
> + *
> + * From LNL onwards the display engine based adaptive
> + * sharpening filter is supported. This helps in
> + * improving the image quality. The display hardware
> + * uses one of the pipe scaler for implementing casf.

Use CASF.

Perhaps a line can be left here before beginning a new paragraph.

> + * It works on a region of pixels depending on the

CASF works...

Apart from the nitpicks above the patch looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> + * tap size. The coefficients are used to generate an
> + * alpha value which is used to blend the sharpened image
> + * to original image.
> + */
> +
> +void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +
> +	intel_de_rmw(display, SHARPNESS_CTL(crtc->pipe), 0,
> +		     FILTER_STRENGTH(crtc_state->hw.casf_params.strength));
> +}
> +
> +static void intel_casf_compute_win_size(struct intel_crtc_state *crtc_state)
> +{
> +	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
> +	u16 total_pixels = mode->hdisplay * mode->vdisplay;
> +
> +	if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
> +		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_3X3;
> +	else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
> +		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_5X5;
> +	else
> +		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_7X7;
> +}
> +
> +int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +
> +	if (!HAS_CASF(display))
> +		return 0;
> +
> +	if (crtc_state->uapi.sharpness_strength == 0) {
> +		crtc_state->hw.casf_params.casf_enable = false;
> +		crtc_state->hw.casf_params.strength = 0;
> +		return 0;
> +	}
> +
> +	crtc_state->hw.casf_params.casf_enable = true;
> +
> +	/*
> +	 * HW takes a value in form (1.0 + strength) in 4.4 fixed format.
> +	 * Strength is from 0.0-14.9375 ie from 0-239.
> +	 * User can give value from 0-255 but is clamped to 239.
> +	 * Ex. User gives 85 which is 5.3125 and adding 1.0 gives 6.3125.
> +	 * 6.3125 in 4.4 format is b01100101 which is equal to 101.
> +	 * Also 85 + 16 = 101.
> +	 */
> +	crtc_state->hw.casf_params.strength =
> +		min(crtc_state->uapi.sharpness_strength, 0xEF) + 0x10;
> +
> +	intel_casf_compute_win_size(crtc_state);
> +
> +	return 0;
> +}
> +
> +void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	u32 sharp;
> +
> +	sharp = intel_de_read(display, SHARPNESS_CTL(crtc->pipe));
> +	if (sharp & FILTER_EN) {
> +		if (drm_WARN_ON(display->drm,
> +				REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) < 16))
> +			crtc_state->hw.casf_params.strength = 0;
> +		else
> +			crtc_state->hw.casf_params.strength =
> +				REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp);
> +		crtc_state->hw.casf_params.casf_enable = true;
> +		crtc_state->hw.casf_params.win_size =
> +			REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> new file mode 100644
> index 000000000000..83523fe66c48
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_CASF_H__
> +#define __INTEL_CASF_H__
> +
> +#include <linux/types.h>
> +
> +struct intel_crtc_state;
> +
> +int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
> +void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
> +void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
> +
> +#endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> new file mode 100644
> index 000000000000..c24ba281ae37
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_CASF_REGS_H__
> +#define __INTEL_CASF_REGS_H__
> +
> +#include "intel_display_reg_defs.h"
> +
> +#define _SHARPNESS_CTL_A               0x682B0
> +#define _SHARPNESS_CTL_B               0x68AB0
> +#define SHARPNESS_CTL(pipe)            _MMIO_PIPE(pipe, _SHARPNESS_CTL_A, _SHARPNESS_CTL_B)
> +#define   FILTER_EN                    REG_BIT(31)
> +#define   FILTER_STRENGTH_MASK         REG_GENMASK(15, 8)
> +#define   FILTER_STRENGTH(x)           REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
> +#define   FILTER_SIZE_MASK             REG_GENMASK(1, 0)
> +#define   SHARPNESS_FILTER_SIZE_3X3    REG_FIELD_PREP(FILTER_SIZE_MASK, 0)
> +#define   SHARPNESS_FILTER_SIZE_5X5    REG_FIELD_PREP(FILTER_SIZE_MASK, 1)
> +#define   SHARPNESS_FILTER_SIZE_7X7    REG_FIELD_PREP(FILTER_SIZE_MASK, 2)
> +
> +#endif /* __INTEL_CASF_REGS__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 599ddce96371..66b6fbae8294 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -372,6 +372,13 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
>   
>   	intel_vdsc_state_dump(&p, 0, pipe_config);
>   
> +	if (HAS_CASF(i915)) {
> +		drm_printf(&p, "sharpness strength: %d, sharpness tap size :%d\n sharpness enable :%d\n",
> +			   pipe_config->hw.casf_params.strength,
> +			   pipe_config->hw.casf_params.win_size,
> +			   pipe_config->hw.casf_params.casf_enable);
> +	}
> +
>   dump_planes:
>   	if (!state)
>   		return;
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 7d9cc430a6b8..2540a2a1a0e0 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -931,6 +931,12 @@ struct intel_csc_matrix {
>   	u16 postoff[3];
>   };
>   
> +struct intel_casf {
> +	u8 strength;
> +	u8 win_size;
> +	bool casf_enable;
> +};
> +
>   void intel_io_mmio_fw_write(void *ctx, i915_reg_t reg, u32 val);
>   
>   typedef void (*intel_io_reg_write)(void *ctx, i915_reg_t reg, u32 val);
> @@ -971,6 +977,7 @@ struct intel_crtc_state {
>   		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
>   		struct drm_display_mode mode, pipe_mode, adjusted_mode;
>   		enum drm_scaling_filter scaling_filter;
> +		struct intel_casf casf_params;
>   	} hw;
>   
>   	/* actual state of LUTs */
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index ee81220a7c88..f0cf966211c9 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -5,6 +5,7 @@
>   
>   #include "i915_drv.h"
>   #include "i915_reg.h"
> +#include "intel_casf_regs.h"
>   #include "intel_de.h"
>   #include "intel_display_trace.h"
>   #include "intel_display_types.h"
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cd464fe26eb8..785bda98973d 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -210,6 +210,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   	i915-display/intel_backlight.o \
>   	i915-display/intel_bios.o \
>   	i915-display/intel_bw.o \
> +	i915-display/intel_casf.o \
>   	i915-display/intel_cdclk.o \
>   	i915-display/intel_cmtg.o \
>   	i915-display/intel_color.o \
