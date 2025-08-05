Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B9BB1B266
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 13:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5862910E263;
	Tue,  5 Aug 2025 11:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ee9P3kng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A1D10E655;
 Tue,  5 Aug 2025 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754391907; x=1785927907;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uMPoa4piBVcFviHBdswssJCBNc/WVZuP43pQ9Mp0yQg=;
 b=ee9P3kngD/GhhlBpxKL6pSgLbqFnHItvXuvqZ4iKnO0Grnalr9dhuzeA
 B3zzK5fKsC0qQesTXApZfG5bcoPOPWUagPKZ+JyjfuWuA7RWrTswglDG7
 PP8a1m6KrkzawlcnoIfX4Kk5z61CXkAA6L12mv5A8ItNaMwjS74Hkdn4R
 bTDn/MS5bHkzBJbNZrDBshL9HVYLUHKbkuQ1NhJemkKFn7Y+Hd1sEjXvB
 5L2JU2xv2F8GAP9tZ4/BKhyANGx2xMl5FE7Oxoa5L/LL1XWcrvsOua6ux
 gAiKuxAfnl/hRKW0O6SveKb3Z1ZjtrWV6pCJxPrhlttdemVtRkghElCr+ Q==;
X-CSE-ConnectionGUID: FMkJPNsrTOSmlumdwx/udw==
X-CSE-MsgGUID: eRCaMsAsRFSZ+qlgpct5dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56821844"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56821844"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 04:05:07 -0700
X-CSE-ConnectionGUID: LPbF7f33QmOyhXDLAJwYsg==
X-CSE-MsgGUID: vZfEMBlFR4C9uhpANl71BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="201653734"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 04:05:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 04:05:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 04:05:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.72)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 04:05:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0j4gzkygxoKIEN8jTCgyZk579DUftePvRbcJV4AxT0L9D3toKXO58O63oQskuFnm8A9JAhRa1PffEqCM5wH3YRqyHV0FJMfKSusQiY31L3okKUVsg8vhHXazO/lwUBLpQMBqvpeAvHYH1xLL1RcmeZSmojAKPb93EW9B/BlFFvOfHvPjfb5vbCWRXn0sRqJQgpvTr85G519NFv9yEOqigEPU/DBXfRc5jVJsunHcbKwcV5uFNcvXJrjo84UhZqccRTXAUQB9/tbb1V8aTqEXufOz/cJUzwx0V0nG+voZIha31jVxlZIUAPJIjlL8hS6hmxcWu34KMTn+0Cga5DIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOHQ+jOFH67tr/HSDRyEYUH2LgFA1qpA8DgsfVA/0bQ=;
 b=tpoyQnsAg0Y2mDmG2z22nBxFa/yyspiNJxhY+MxvYlMJbUqYxq1NxRyO3gsA6fuIFes4YzBGZoWExow7wfSpOLYqLlqydaeffrlEe2meil12Nm+kVBw/CcRo96QPOCWf4kom8AnBdzPyOYOzuqKU5Ej+jEFY4EF2QzOSMe719JXfI11M9y4mv7kR6Gztb/aBGHCG2C5CfsdxShv1p/l0hpLJfhYSPx8pnFhI3ignzkf0GBIyYPtaaNxxaa0qPPmQ9xODC3ijaVTisP28q13uxbkXeyttUYtP+l60xp6BC9lRzbHjVy0HTGuTHFpFlEeZdPEcaoe1nokljTMa1LPiAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CH3PR11MB8344.namprd11.prod.outlook.com
 (2603:10b6:610:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Tue, 5 Aug
 2025 11:04:18 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%7]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 11:04:18 +0000
Message-ID: <5d66a1a8-7115-4235-bda1-a3ee1387dcb3@intel.com>
Date: Tue, 5 Aug 2025 16:34:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/25] drm/gpuvm: Pass map arguments through a struct
To: Danilo Krummrich <dakr@kernel.org>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Boris Brezillon" <boris.brezillon@collabora.com>, Danilo Krummrich
 <dakr@redhat.com>, Boris Brezillon <bbrezillon@kernel.org>, Caterina Shablia
 <caterina.shablia@collabora.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>
References: <20250730130050.1001648-1-himal.prasad.ghimiray@intel.com>
 <20250730130050.1001648-2-himal.prasad.ghimiray@intel.com>
 <aJGA4BPLJRs0RLfz@lstrano-desk.jf.intel.com>
 <cb5e582f-7c85-4de6-8039-5c62d1ce5950@intel.com>
 <DBUEUXL9KTUK.E54ZVQIZ6IEP@kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <DBUEUXL9KTUK.E54ZVQIZ6IEP@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::33) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CH3PR11MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 23231f5a-5f01-49fa-81cd-08ddd40fd2d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blZ5aGlQNTdETjByNWNyRXZ6L1JSYXNxTEh3RDBCcHk1T3JJem9qemtxdWJY?=
 =?utf-8?B?bnpKVnpBYjVyRm0yOVNvbGFOSVoxYlZsUUhQTTMwVmZRRGpXMG43cGlLajZv?=
 =?utf-8?B?djNtMlRCa3A1VVU3alhyVFpTRTkwd2JjZU9tbDJaTEdUVnFLY3VucXdzTVMy?=
 =?utf-8?B?Z25pb0U5RWcrbGszaDg3Yzl3YTJ2a2szeXBtalhkcjBZTjg2aFEyTktSUk92?=
 =?utf-8?B?QWhQZzFBWTQybHZ6R04wdnRtODE5ek8vY1J1R0d2WGVZaG5lbDgrRUZnUGZO?=
 =?utf-8?B?NTQ1emcxRzN6dCs4ektwVHBKVlBZQ0dCcWNZRUxDL3dUcE10SmxtWkRRRTBx?=
 =?utf-8?B?Snk4cUFDMzl2UUo0bjBGZHJmQUlzL1YwdXpzYmo0ZG05NzVQZGh0bVRFeGNi?=
 =?utf-8?B?OUp2MHJDSDJQa1BuU2wvQ0ZZTm13VzZhR25LRFpxdDJKZkZVdGZlbWZvYnVC?=
 =?utf-8?B?WXVETjVNbzdyU1V6L2FFaXZoYkNYWWdHMmdzVi9UdVdyK3JNYW1UVlFEMFcr?=
 =?utf-8?B?b3N5MVZ5SVFNSnFmY2YvYzV2SDByYzFBaDFmTWJibi9wdnVNMDlWMDF4enky?=
 =?utf-8?B?ZkV1WmNPT2dMMG1Lc0pRNGVWeDBHSWFvUVNEUERXV1hpVS9lQUNlektmNUZw?=
 =?utf-8?B?Y2FOT2tQMUk3MlFublNzM2gzMkxROU1pYUVpT3RLYTVCRS8vVS92M1Bpai8x?=
 =?utf-8?B?eGpjMGhuU1dvbkx3c2hhaGNOYVgxRkpPWkFFTVdEczRJellybEpoRXV5ZXZD?=
 =?utf-8?B?cWMxU1djZU1EYzFNbjdVdFdoZ0pBVW1qMlRnMWd2V0hwZ211dWRucTVnVXBl?=
 =?utf-8?B?byt0UFFpOUg0WlVjS3R4aTJuSERVazZBRVdka1NjUk13OHhFVVFMQWtwNGdH?=
 =?utf-8?B?dHRtT0pzMGN4S0Rta2VzR2FjMTNzcGg2OXkyQUt6d0JqM1poaFg1bXpHMFJJ?=
 =?utf-8?B?TGl2WldWS292cU12SjB1cFFxUm5CQ3ZTa01mS0FLcjRVQVBOR0NxWHZLNWZu?=
 =?utf-8?B?YTBEaitibGV0cHMwTXhDZElFK2RGY3hmQUpPTjF3MlpxQmF5VnBHa2JobVg5?=
 =?utf-8?B?c3NFWTJKYnBMalZRbVpRSGZzVUUxT04vdzhqeG9JN2xQOGJEYUtCbEp3U0lq?=
 =?utf-8?B?eVRzWFVHeUk3QzZjTUg4SFRxN0tEMmVFL0lPbkVqdEVpNTcrMUQwUlViMEsv?=
 =?utf-8?B?dmpaaTk3eVhlV05iZndJcy9NNnRlUHVIZlh4czZEL3VXMVMxMmwxRXl0dEV5?=
 =?utf-8?B?SUVEKzNDSi8vb2xnQXBhK1YyTG5xOUQrVEtzMEpoN0NleXh0YVdhMDcwblpL?=
 =?utf-8?B?bzc2NmJjb0J6WHE5WWZGOHZLcmxCS0xUQUxqcVZIWjAvMDExQU5tdjJqU3cz?=
 =?utf-8?B?VHhrWGZMT2M0OGdoNVkrZ0VRc0YyK3ZBejlaNlh3dC9SaTJraDY4SlBna2Zj?=
 =?utf-8?B?OFF5OGFOa3ZwM1NjUGw5WXE5OTdJaHJRSGJpa3UvYWNzN2dRM05tOHhDUFl6?=
 =?utf-8?B?Tnc3Uk9OcHVQZWs5Q0ZMUndScEdjU3ZuQ3VlNHpMcmdocWJLMFRZZGNWTUhS?=
 =?utf-8?B?Wko5cWRjam5qU0UzWFFGUVpjQkk2dTZTcFNiVVZXa3ZleDZUSFVIKzZvRVMy?=
 =?utf-8?B?ZWVtYkhDYmVTT0ZUT1JYTlU3STR0SWxlWGJ0cE1WQnc3cmpTQkZKZ1d3VnZK?=
 =?utf-8?B?YUEza0RUVk9NQmdtYmRqZERiRElZU2JrR3QxaEJSSWhaT0IrVDBHVmtwYk5M?=
 =?utf-8?B?bXNEakx3QklkN1JlZmxkdGorNldWQm9aV1dnMjNiVmJIOFBWWWF3V2NnaG0y?=
 =?utf-8?Q?nGXR6w3s7zlrthFTUG5ZcNoU3pLHNntq4jjuk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmJEZFlRaFJzRzJFeWtNVjZyWW0wRURwOTVSSlYwNGtET1dySEN2QXY0WXlW?=
 =?utf-8?B?b2J0SU85TlNrREZXY3pNYXJ0RUhaS3JNUFRoeitjM0xwcWVreFJBWUtBZHVO?=
 =?utf-8?B?a0p6SVZ6WVY2NjFMb3FlRUFzMjRrK3UzRWkrVVZTNnplSmxzV3lHTkk5QmtR?=
 =?utf-8?B?VTVJeTUxMTlMUDhtK29UTnhISkpLV2RHaEwwbXlvUUdwQm5YRHk1TkptSGRV?=
 =?utf-8?B?YnBFVytoaFVYUkRYY0VBaExjd0pHYXBzMnF3eHVWRGkwa2FvT0ZxNlpvODZq?=
 =?utf-8?B?c0FMV3RoVGUyS01pUDVqYjN3UUdUL2hQMXJueTJxRmpGRElXd0lpTU5EcjV1?=
 =?utf-8?B?Vlo2b2Z6ekNSRGZ5dldLODVaRXlDemxlTDNsQVd0Uy9sSFBXRjdMcytCcFR0?=
 =?utf-8?B?eEFoK0tmU3dWYkloK2kvVG5OYkpoQ0JrRjl2aUlKRzJObFFCc2Z1WGlQUlU2?=
 =?utf-8?B?RzFXV0RoZDk2VjBHdjR6WTRQdVF5VEdnYjBwMEFoOEdWbWc0MUc5dkZ1MEpi?=
 =?utf-8?B?L2dCcjZyUVlSNkpzRVJ3RUtQc2t5bFk0RHpoUXBVTXp3SE9IanRGOFY2ODJy?=
 =?utf-8?B?NUNHQXRTWTNUYUNhZXZmaVVvWGxoUVpsRjdsWjM0MWlmRkt1OHBiT0d2OEE2?=
 =?utf-8?B?WFhybFN2ei9oVTB3S2NBUVdqcUFGb05oSXdkWjZqUUliTzhJdGZVTWVYNjV2?=
 =?utf-8?B?UVA3S2RMWXhaZDhMckRJZDRpNDBOazVNWmRPTEwyNWgyZlZ0bzQ2eDhTdGVV?=
 =?utf-8?B?L29tQWRHMU54cWRYVmFGZG84NWpqTEJnaFdaNU9WRDBXMjNQamJmOWxPQk5O?=
 =?utf-8?B?MDUvMU5WcFdOVmFvKzY1c0Z4azgrZzl0MTJJWm1YZ3lyc1ZETVo1TlM3TjJp?=
 =?utf-8?B?QzFkOWd5QXZqMkVBNHZtd2JSWUxSUGtseHN4VWk4eis2Q3RxQ3lyY2ZJbU5o?=
 =?utf-8?B?WWorK29mdC9yMWh6TkpvcDY3Sk9OejloL1JSUEhsVDFtYUdZSnBnYVdEbXY3?=
 =?utf-8?B?dk9FbTlOanlCTDFueEdJR3p5UFBoQTRSeTFja1UwR3hxSkdxRHdkbHZOODYw?=
 =?utf-8?B?R2ovMDRjRHdlcWpOSkZYT2taeUsycGdDMDJGWVlSS0tNRzVOZlJoZGloeGh1?=
 =?utf-8?B?ZHBvaGFiRGpQc1hXcVZGbTFnL3hheTJvTEk0dGsyYnVhTWFqWDZIamtsZ1Mv?=
 =?utf-8?B?TG8xb01nZ3FicDdFZ0orais3RGF6N3hYd2w2Q0J1WU9HbHAwYzNVLzFaWGl5?=
 =?utf-8?B?NTlKUi9ZSmlBTDJYZVpQaWtuOFl5NWRZYzZJeHl2TlpGUkc1Wi9IWkJlRXJY?=
 =?utf-8?B?Sll2bjUxbXU2ZHkzZVdIV1piY0poS1pVaGwzRnVTd0dETHIweWtRY0hnN08v?=
 =?utf-8?B?Qnd2ZEx1a0lUUWUvOHlpd2dkRysxcHJkWFZhV1c4UG9hVDUzRE8xaVZJNit1?=
 =?utf-8?B?YUl4NXZUaU41Yyt0YkF2STAxVWgrdk4wRTJPQUxvamloMEs0RitCSFlRaTky?=
 =?utf-8?B?TFNJRHhKZ0ZZaTlMUXZtbTdVYlRidEdRYzhOLy9pOTZ5aDF3S2lsd1ZOSVR3?=
 =?utf-8?B?azJvcmtUSDZRSHdPbGJYbjJJQTNJVVBBUHFFZFM2QzkybXZjYWlEYVRNRXV5?=
 =?utf-8?B?TllMM08vck5BRDZnbE8wbUZGbFlYa0hnaENyNFhodXJXSUd2VzVXR0JUdkZv?=
 =?utf-8?B?YkdsejVndTk1b1A0NU0vSWQxeXVjWWlQeWJXWERuLzVlV1RGVk1VS0lhS3FW?=
 =?utf-8?B?ZEhiUzlKSUU2UitSR0VRTWd2ZUYxVG9GU3NMcnNSajlSbTVWRldUUTdFWlUr?=
 =?utf-8?B?OFlXOHJnY1hVdi9CTlh3RS9CUnhtMzk2VXZmb2pxT08yLy90TytWUWowYS9v?=
 =?utf-8?B?VUs5cmI3Mkh5WnlpbS92M0xQK1ZEc3ZSRUdjcDFrcy9HVUFGMWQ1akxOMVhv?=
 =?utf-8?B?TnJhZFdKUDJpZ2doV2xQR1ZZaTdOSHNhQmFKOWFBS3BSRFdDNGxib3JSK0RW?=
 =?utf-8?B?U0c0OWJnREVyKzhrOUgyekN0NldnSldwT2JaQ2FZV2l3RXp4Q2hOYTcyM2M1?=
 =?utf-8?B?L2dOVkE4MFVJTklabE9TRjlJOGdwd2FmYnVXVExXUUF0UUE2Tk42RFdVVjdE?=
 =?utf-8?B?VFZQTWVuQU5BZDlUdm1iNFU3cUhtU2sraDlOYjdVdkh4SDY4YnN4WG9MV0ww?=
 =?utf-8?Q?Ql0qmo0FARzHFrlHoMgbUW0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23231f5a-5f01-49fa-81cd-08ddd40fd2d0
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 11:04:18.6949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHWgfAbKeU1lmieK4ko4I5dkOVp14cp1TP+b9A33kC312JAwdyGO1E4cVzVUXbWZATgXUVJOJllUHLEgLcu6oRMzkaX2xupOaEFj9h0x2J4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
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



On 05-08-2025 15:40, Danilo Krummrich wrote:
> On Tue Aug 5, 2025 at 7:24 AM CEST, Himal Prasad Ghimiray wrote:
>> On 05-08-2025 09:26, Matthew Brost wrote:
>>> Also I believe Danilo's suggestion here was to define drm_gpuvm_map_req
>>> as the argument and then embed drm_gpuva_op_map within
>>> drm_gpuvm_map_req. So in patch [1], flags would be added to
>>> drm_gpuvm_map_req rather than drm_gpuva_op_map.
>>>
>>> Matt
>>>
>>> [1] https://patchwork.freedesktop.org/patch/666211/?series=149550&rev=5
>>
>> Hi Matt,
>>
>> Thanks for the review. Initially, I considered using drm_gpuvm_map_req
>> struct instead of passing drm_gpuva_op_map directly to the gpuvm layer,
>> allowing it to handle split/merge decisions independently.
> 
> Generally, we should only have the flags field on struct drm_gpuva_op_map if we
> need to let GPUVM pass flags for (re)map operations to drivers.
> 
>> However, the upcoming patch [1] relies on this flag to determine
>> driver-side behavior. So at the end drm_gpuva_op_map and
>> drm_gpuvm_map_req might end up identical. Based on that—and Danilo’s
>> feedback on this patch [2] I thought It will be better to keep a single
>> op_map struct with the flag included.
> 
> Let's leave this to the upcoming patches, we can always adjust. For now, let's
> go with what Matt summarized above please.

Sure. Thanks. will update next version to use drm_gpuvm_map_req

> 
>> Boris, could you please confirm if the flag will be useful on the driver
>> side [1]?
>>
>> [1] https://patchwork.freedesktop.org/patch/662832/?series=151264&rev=2
>> [2] https://patchwork.freedesktop.org/patch/662819/?series=151264&rev=2

