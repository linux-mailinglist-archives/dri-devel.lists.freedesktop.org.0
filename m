Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8E1A5C000
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 13:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F7010E57C;
	Tue, 11 Mar 2025 12:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAk8aqnv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A287110E579;
 Tue, 11 Mar 2025 12:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741694619; x=1773230619;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=puN1l37GMpURc3SeOrBRb9UpgxCrqxGdtkxhGe7xPTE=;
 b=eAk8aqnvbqWv52510Mt0x53COuJKbNerUmCHALTFF4m7hzMIrDr/FpFr
 59+HmTlm+yS/lDrUIMplRmtJJ8TkadJOAqtA+La+RLuqUxaAMdBMdN9CU
 ShDaHH3XMxx96H/O4idaqx7vysuwdZeL4bbfETKsX4rPP270j9hAu4l8Q
 zuR3rK1LZ1BqIP3vmji+LsM+6xmMawbqMKQbtGlUqL0XgvWKBaJc7lJEY
 yGYUOWCWXyrGbct7TegWQIkW2yNYSIMpa6A7Kt11kJFJ0gejvHKMsuFjr
 FonTWitdglQV9hwck+IRZCcM+xTg6l1K7fEIiyWXfUUl8kug2mjq7mXEJ w==;
X-CSE-ConnectionGUID: 7vH8L3V2QUyukLGMMlyyOg==
X-CSE-MsgGUID: DB/A1oTOQWWdA4ac2ZYuVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="54110228"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="54110228"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 05:03:39 -0700
X-CSE-ConnectionGUID: Hh/ppW1ASuK3LfnGG4UBTw==
X-CSE-MsgGUID: Vx7bqTABQoe/bOyuBGPkxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120334731"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 05:03:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 05:03:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 05:03:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 05:03:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbuUYkmPe5cDq7yRRHSc88guj7sXoopl6fivK0b50M8jASU6iZaZraquKY4a6gv9IkktuBqdJKbazMmiZ+ZyoZGRw8pcrhC9KOnMghtuG/h+SULl4EEw/OpjneTocCiCV4Q5BDG17B5/paAlqZz3LarHXYvHQ5N6l5nraAis1s80LXDX32RBj702G80/hbHvtMGIfdTaqYHP4w4D6OcHviaIilW4pbN12uKAlm7Dw71ltubkty2FadpYGd1WBwfx0prW7CpkZacKtU3agY2OePo/gllUqGqYXAi4C6jRBijqb3r6DUQtEqFvZi5pcDD13iG0ed+t+ZgBidB5YI7drQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kVmEO1spmU3Wv7qRca/Vma0SJU0JOFUbqV+n8DvZT4=;
 b=L+BgxJmSTeCVmSJg7BrIzqJakUHMY8aj0wtfpF9rl4oxkuOwdk4D+c7d+Cdn0ZqaBCz3paaZSIKGS+ZIvBbPfzRYMUzrtcU9cxy2DOZJrJ31KFTwkU1by4KzxFG1JY/gXKQJ3OM+PqShbf84Q4p1yUCVFGtrnAczatw+iSp2O8X/zHTP7jUw3nvP5J6eOrtAi4wPptJJYDAxW0a6Z8GsUW3A6a694DXYdvBcg+3UGs85jUyXacYirWlXsE6VjRyCY3xeX1/KiIHRzGYDZkdm9SoKHVZGjOOdYI7oyiBc8XsxePxXF0RVQTL9OnrLqu1cfL4gyx7VbTeyMk6lryyqaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV8PR11MB8557.namprd11.prod.outlook.com (2603:10b6:408:1e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 12:03:36 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8489.025; Tue, 11 Mar 2025
 12:03:36 +0000
Message-ID: <9378acb3-60f7-44fe-8ac7-a6672435d0bb@intel.com>
Date: Tue, 11 Mar 2025 17:33:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] drm/i915/display: Add and compute scaler parameter
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250304102857.326544-1-nemesa.garg@intel.com>
 <20250304102857.326544-7-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250304102857.326544-7-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::25) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV8PR11MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3abc6a-2199-436a-df5f-08dd6094c064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTN2WjFxZk5SUnpuVXhOUWlsenBZWktOcjVnZVlQZnBIZ1QvalVsWm5DbGpl?=
 =?utf-8?B?Q2Q3aERoRkhaemtXei85ajdLZm9ab1RzNndtUE5tbGZ3SUpDTFhLSy9qRmhD?=
 =?utf-8?B?MzljYllrWldjbHRqc0FkeHNIL013VWpsNFJPKzJpY3FlMjJncWVKWHhTQVg1?=
 =?utf-8?B?OEtGRWg3YnVOaU9LdDRUM2JiYUdSVzd6YTYyUFQ1RnhTZUVVTkJ5cVYrZjBq?=
 =?utf-8?B?d0VYODB0Q3BMUGFRaCt5Y2hYVVE1MlRvS1ZBblFTZU9ncU1LK0g0YitMN09x?=
 =?utf-8?B?QTRWZ0NWQkdXOGwrOHpmdzM1WlRVVGpUUkNyZ1pqS3dqUUpQL2VINzFkRE5p?=
 =?utf-8?B?eU5Rb0pXZmdZbmxQcmlHazlMTmQ0MDZxWkNQdGNYTGpvRVZxaUpKYTE5L3d3?=
 =?utf-8?B?OGVRamx4VzhyUDY3eTdueDBTNTllR3JQdUwvLzBzOHdTUTVQZTZDWWNmdll1?=
 =?utf-8?B?VU1hZTdDejQ4K3oxRUMxNHV5ZStsL1JFTVVQQVRnZWIremx2dnhXeUI2emlH?=
 =?utf-8?B?Y1BVTThBaDY1ZWV2bHoyWjJyV0xyM052NU5YUlRSaHNBWi9zNjhBZ3crRTM1?=
 =?utf-8?B?UmRXM21QRVhNcG9uWTBYMmdWS2t1YndTd2dwN0dnc2hpcDlzZ0d3d3FXV0pr?=
 =?utf-8?B?UXFjamY2cFJRbGl6M2UzMXNWSVlvZUpuOTEzWnl0SC9aeVprNURZZVdUdnZo?=
 =?utf-8?B?elJpOFVOeElpd2ZwUkQ5TTZqQld2alpyOXRJTFM3cjhESkZLa1BWRGd1MVI3?=
 =?utf-8?B?eldpa2dqM2xIV0ZPSjNySHltMHloalZhaThHaTJSeSs2dldNNlNUNmd5NWtx?=
 =?utf-8?B?cVVIaVBoamZIR1ROdkdYM3UrWnFDUk53Z0FQUG81MVBPSXNnUExacElqb2JL?=
 =?utf-8?B?c2g5VHBnbjdWVkZLbFZkaDJOOFRaNVVabVlJaGVyWWY1a2wvQ1JBL3F1bVl6?=
 =?utf-8?B?QVF0WHdtM2xrLzd1dXROV3laN1BabkIyOWxxQ1J3VHVsTjd6VVdpY1RRMXJ0?=
 =?utf-8?B?TW9kdjNiQnRyaGJYSTJwZTVzeEY1NXZtTXE2c2E1SVNwNXVYY3hSbnNvOGgz?=
 =?utf-8?B?OFFCMEo1SDNVR1dvcXFIRnlReXlSeUxBTkh3TldLOXhUcHZjaUhNU2JOd2RW?=
 =?utf-8?B?bVlqRytBbW9pWVBTODIwMHVLa0lPRWwzbG91QW1SMlRzbkxqV2JXQTlsTEl2?=
 =?utf-8?B?RFc4WEpoZmdxRG05VTNLUG5jaTZ5WXhtOE9BOUh3MFc5VkViYnZSUjhFd0x0?=
 =?utf-8?B?SXBJZHFBdHRCdGlSV2RrM1pJMFYyMUJTL3NiamJyeWVyR2dJdjJxdUF4Zm5S?=
 =?utf-8?B?anM0dEhaRGU5UDdlVFR2c09MTnpNREcwRjNrTUNHZkcweGJYS0NjT09FdXZO?=
 =?utf-8?B?eTN1TlRtNUpRM2JKYTZTOUFmbDNoTmtXK1ZkWGtqaVU2NUNzeHpjTm5mRWls?=
 =?utf-8?B?REtFc0djTkRjTDZEYSt0bml5RURIM2FkTWNoN1pQNXBiSnpkSEVHYnVhZlRK?=
 =?utf-8?B?cE9vejNaaldRNWdwZXJRL2dtdmJMbGpia1pGMEQ3TzlTK0t4MS9Dd2cwQUM2?=
 =?utf-8?B?UHREekx4Z3VVeFB5bDdObjZnQWI2a1E5M3d4TS9BYmNCS3RLVFM0UnhGN3FL?=
 =?utf-8?B?MDdOS0hMVHExSkdTdXRiV1ZJY2IyRWI3dkk0Njc5TE44WEZlcTVWZWovNXMr?=
 =?utf-8?B?dURPdXZlSDF6cU1MRnUvZ3ZlTkFnR3AvWWNUZDd3MmtjQ210Z3Z6MXZ4ZFk2?=
 =?utf-8?B?L0hseFJrYm1BenVldjZWVWZEbXlQWUgweUVaS2VSNjJPSUs1dSt6NTZXKzZY?=
 =?utf-8?B?dmVVM1A5SmZnYzdRY3cvZVhCTHhMSktEdTVucjlTQ082K2E1RFNBaDNUeXAr?=
 =?utf-8?Q?4oidl6P6s+RBw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0E2dC95T0FIRmFIcjBNSFBGdUV6a1NTOGhDeGFKMFAxTDhZb3EvenNmQlhJ?=
 =?utf-8?B?cXhNZnpKZ3lxcCtvQWtEQ1RPT2FxbjNOQ2J4MG8rc3Zta2FoWkhHaEllMWQr?=
 =?utf-8?B?b3NBOVEvSmZKbzEwY2FXQXZza2pWendmNUVxQnZTSkJPU2sxVzVGUHpRc0Z6?=
 =?utf-8?B?bzhOTit6Q2plYjF0bThKZENEalBxTXNndUM5SG9BdFg5VWo1RnF6ZTZnSnha?=
 =?utf-8?B?cDNJRjM1NFZmeFhzNGNicEczd2lIaEZ4NHgwT0J3dG9iblRZNDZwL2RzVDhh?=
 =?utf-8?B?dXpPVmR4YWhqWGFIaUJQNWhxdDNzQ0dsYUcyRG9sdmptV3h0RHVvMFh2R0w0?=
 =?utf-8?B?SmVneDJReHhoSi9HL2lwSUYrSnZDRW5sMm1PdktLaWJFVzhOR2xCenZoOGg5?=
 =?utf-8?B?eTVwQnBZRWVSME8rcnhTbkhVRlZYM1JySmdkV2FpSThYeDg5U0ZHdlZreURW?=
 =?utf-8?B?MEF1RlloOEhNM1FMSG0rekxEVVc3YVU4SlV4YW81LzBhQVdCWTdpR0NCUFFC?=
 =?utf-8?B?NWpGODBpUW15TjJmMi9OM0ZwNW1hdWJoKzRCcm1XNXVmSm0xWUZwUWVRQ25B?=
 =?utf-8?B?d3JRYXE2ckhydWVmdU9JU0grdXFhb0VDQUtDNG11RlF3a3JBVTk0RDFNTng4?=
 =?utf-8?B?NXlkb0ZTUGpyeUIzT2c4WGM2cDdyU1Y1ZGR0c241WmhVZTY3TC9zOTNUWnJl?=
 =?utf-8?B?bGJGYW5adEQreDVUUkpldURRQ1F3aGc0NEh2VFRkeWs5RlRNSEtkOWQ1RHl5?=
 =?utf-8?B?WWZSTzNnRjBkTFROa1llTnpvT3oxazkzaFpmMnZkRjBBYzFTWTZlczlSb0c2?=
 =?utf-8?B?WXV0Y0NGcVZ6OE9seTNWNWlydVpTVjQ5UDNjNys5UWt1bFZrR0RJZDlwMkVM?=
 =?utf-8?B?K1l4aXdLTmlvWEJWeDZRWEJGRFdTU3gwUUFYUGpuWk5oNGI3N3BYcGVyT29u?=
 =?utf-8?B?c1RCckRQaEoxYko0MEhXZGJnbmErMXdRUk53UlBKdVpBZ2ZRRHZHY2thUEkv?=
 =?utf-8?B?Y0tJem9leDh0WWIzazVKOVhrWWlYeWhQU25NT0lmbXpTL1JHM3hWemQ4blF5?=
 =?utf-8?B?bzNQbDg3U1lkM3IvN2NLT2twY0hQZU42dlNhTGx2d0ZyL1hWMVRnUWsrUjl3?=
 =?utf-8?B?M3IxSkE2ZUh1UDdjd245VWhDVkhRSzdsZTEzc3l4cHBEditHT1hlWUpKYkhU?=
 =?utf-8?B?MnZicVZycHBjdCtmSEUvSk11UmpmZ0JraVFMaThjWG1LY2FqRzBmMTcwd1hN?=
 =?utf-8?B?NnI2aWZEUlBGcXdhbWw1UUo2UXZLcHlDOU9hOWsyby9hcGxJUndTSVRWdG1q?=
 =?utf-8?B?SWlkMzUwYnc5OG0zQUFMdmJlbHQweEFHc1c1OEdMeHozd2VSelBwR2l3dWdZ?=
 =?utf-8?B?Qk1LWDNabWlkQWc5QXBwaFAyajl4MUlROHk3VzlydkRxMy9sNDg4d2k2WFY3?=
 =?utf-8?B?UWhWSTRXRXd2TDNiWjNraTdoSkxyMXZoQXBBM2xlaEo1K2FMdVp5MTdCMlFa?=
 =?utf-8?B?TjVPTFlxV3pRMmVlWmxrd0M0UStsM1gwQVhuZ3cvTnQ3bHVYV3hHcmhPMElG?=
 =?utf-8?B?bzVEaDlDenBwWmF1T3I0d3MrTmZ2SWRsUU1sSTFZRURtRC9MOEpkQW40OXhO?=
 =?utf-8?B?ckRIeG5Da1dIaUlrYThGOEpqSlVENmhXa0ZoK2o4WnhEMHNqRFV3aE9MSjZw?=
 =?utf-8?B?RFNjNzhVTU5WekpDYkhBODBHUTJMUXp5WG5BR2FQaFNUNUNKTXR5RjUwK1Zi?=
 =?utf-8?B?bXRkeHBFQTFkbHp6dWlWNVdUZENBdVRmYldpSDlYWUdqb25HNnU0bzk2VnJo?=
 =?utf-8?B?UTc0VmE5ZmdhemlNY1Y2cFh6ZFpFajExT0RYUC9Fa2lDZVJFUE96V2k0SGtr?=
 =?utf-8?B?bTNvdVVqQUtRbWsrQ1Zvbm5HRnA5MXVTQWhBaTBYbUhoMFowUWZOeTd3QWRN?=
 =?utf-8?B?SU5vdmk2R0tvUTY3QVhhTDVkV0lwT3JoTkFZYklJZ0Y3SGs1bzFoL1ZDbkZ4?=
 =?utf-8?B?K2wrWTFPNzRkblNhcnNFT3R0M2djczU4WENwWS9MOFlMUmJPVEhLQW1lR093?=
 =?utf-8?B?MWtzZGNiVlZ4aC9zRXl6UUxNWHJwUFpJTEFrdnV5U1BjOVF4QWwzaHF5TnRo?=
 =?utf-8?B?TERpWDdadUpJQ080RWhUd3BGVTgyc25kYzdBQzRqL2hXVmUyYlJsQjJpTi9v?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3abc6a-2199-436a-df5f-08dd6094c064
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 12:03:35.9102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WnibqoAFRhK/HIDDh2KD+hY51H4vYu0fCagBE93xZA3QmSAQd/9+ANnUAzJbOhLEUnSeFIXQoYxWsWVKKnuhmlBSNG+igyivlXYMYi9VibM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8557
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


On 3/4/2025 3:58 PM, Nemesa Garg wrote:
> Compute the values for second scaler for sharpness.
> Fill the register bits corresponding to the scaler.
>
> v1: Rename the title of patch [Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_casf.c |  3 ++
>   drivers/gpu/drm/i915/display/skl_scaler.c | 46 +++++++++++++++++++++++
>   drivers/gpu/drm/i915/display/skl_scaler.h |  1 +
>   3 files changed, 50 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> index ff34e390c8fe..15ae555e571e 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -8,6 +8,7 @@
>   #include "intel_casf_regs.h"
>   #include "intel_de.h"
>   #include "intel_display_types.h"
> +#include "skl_scaler.h"
>   
>   #define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
>   #define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
> @@ -211,4 +212,6 @@ void intel_casf_scaler_compute_config(struct intel_crtc_state *crtc_state)
>   void intel_casf_enable(struct intel_crtc_state *crtc_state)
>   {
>   	intel_casf_write_coeff(crtc_state);
> +
> +	skl_scaler_setup_casf(crtc_state);
>   }

Remove from this patch and add this where casf_enable is introduced later.

Otherwise looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index f0cf966211c9..39fc537e54f0 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -133,6 +133,13 @@ static void skl_scaler_max_dst_size(struct intel_crtc *crtc,
>   	}
>   }
>   
> +#define CASF_SCALER_FILTER_SELECT \
> +	(PS_FILTER_PROGRAMMED | \
> +	PS_Y_VERT_FILTER_SELECT(0) | \
> +	PS_Y_HORZ_FILTER_SELECT(0) | \
> +	PS_UV_VERT_FILTER_SELECT(0) | \
> +	PS_UV_HORZ_FILTER_SELECT(0))
> +
>   static int
>   skl_update_scaler(struct intel_crtc_state *crtc_state, bool force_detach,
>   		  unsigned int scaler_user, int *scaler_id,
> @@ -722,6 +729,45 @@ static void skl_scaler_setup_filter(struct intel_display *display,
>   	}
>   }
>   
> +void skl_scaler_setup_casf(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	struct intel_display *display = to_intel_display(crtc);
> +	struct drm_display_mode *adjusted_mode =
> +	&crtc_state->hw.adjusted_mode;
> +	struct intel_crtc_scaler_state *scaler_state =
> +		&crtc_state->scaler_state;
> +	struct drm_rect src, dest;
> +	int id, width, height;
> +	int x = 0, y = 0;
> +	enum pipe pipe = crtc->pipe;
> +	u32 ps_ctrl;
> +
> +	width = adjusted_mode->crtc_hdisplay;
> +	height = adjusted_mode->crtc_vdisplay;
> +
> +	drm_rect_init(&dest, x, y, width, height);
> +
> +	width = drm_rect_width(&dest);
> +	height = drm_rect_height(&dest);
> +	id = scaler_state->scaler_id;
> +
> +	drm_rect_init(&src, 0, 0,
> +		      drm_rect_width(&crtc_state->pipe_src) << 16,
> +		      drm_rect_height(&crtc_state->pipe_src) << 16);
> +
> +	trace_intel_pipe_scaler_update_arm(crtc, id, x, y, width, height);
> +
> +	ps_ctrl = PS_SCALER_EN | PS_BINDING_PIPE | scaler_state->scalers[id].mode |
> +		  CASF_SCALER_FILTER_SELECT;
> +
> +	intel_de_write_fw(display, SKL_PS_CTRL(pipe, id), ps_ctrl);
> +	intel_de_write_fw(display, SKL_PS_WIN_POS(pipe, id),
> +			  PS_WIN_XPOS(x) | PS_WIN_YPOS(y));
> +	intel_de_write_fw(display, SKL_PS_WIN_SZ(pipe, id),
> +			  PS_WIN_XSIZE(width) | PS_WIN_YSIZE(height));
> +}
> +
>   void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.h b/drivers/gpu/drm/i915/display/skl_scaler.h
> index 355ea15260ca..22fcfe78b506 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.h
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.h
> @@ -31,5 +31,6 @@ void skl_detach_scalers(struct intel_dsb *dsb,
>   void skl_scaler_disable(const struct intel_crtc_state *old_crtc_state);
>   
>   void skl_scaler_get_config(struct intel_crtc_state *crtc_state);
> +void skl_scaler_setup_casf(struct intel_crtc_state *crtc_state);
>   
>   #endif
