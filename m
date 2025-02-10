Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5393A2F81B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2796810E5F7;
	Mon, 10 Feb 2025 19:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAYeKg6g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041E810E5F5;
 Mon, 10 Feb 2025 19:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739214117; x=1770750117;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uxAbl07UpN/m5s89+7DWZhViDbaV6zgmuk0N0uS9Tbc=;
 b=jAYeKg6g8k1uC+bt9c88oQuNv5m1CMlDvFgZvXZhmGWrS0dsI8/YADvE
 hNEgd7osmnV+0dxeNmKCnn3do8u6YVIWOAlMt8Ypi5pb+UJHo6UswpYyi
 pi7R2vYK5zijbWww3qSew3p28wH029wcEyr+R08v4UOnhKgvWSVJPF26y
 a279+2wsPRx4saIUx4VuewjVT4o8ECofJtAKJQjJHtHZthJX9pdDn6ltt
 w/ljmNpZBFn6pRo1644tii39XpARtbsrXADQ1OAlLRUZr98q1RHMxAv/f
 WrOoU4BvTeYOrkqZ34H2bG5FfV94fBL47T8T3douXhbDfCgFtuNdehtKQ Q==;
X-CSE-ConnectionGUID: 5TsdNoYQTaOVRGuP5hJPRw==
X-CSE-MsgGUID: DPKZ02khROiF6R4pidyFJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39724875"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39724875"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 11:01:56 -0800
X-CSE-ConnectionGUID: UqRPx0LiQ1ubeeqv4dtqvg==
X-CSE-MsgGUID: 93i0Zap0SbOuSk+wVk4QtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="117296633"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 11:01:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 11:01:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 11:01:54 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 11:01:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfSKWDFf7vhP5F4YkkgoJN5iiiFfi/+3eonc+xS3z9aEcXVyLYAADcmPqcoV27YPUTtH+gYBLnYeXCOyLoL3+lscevNJGlCbypcU2rPvwd1MlQ1vdfYqDAORwYGooGoo5JQHQPVRVC3lx+QGRUmdDqnTUf93h/OoleLSCozv5DmUYX0I1ywSuClSsULhWAvcXTLhjK05nVVYOWIvT4GSRzQY2jZOM+B4xHwGxhPwIk95Yx9hCYAmX9HiIgvwZNYpYEzxOWWJW7rnhBkvBjbZMTHVcwvMIwL6cSM6qno1xPskxWp1RnuCCN4pWmniv89uLVOzldRooIVURZWbNg79lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAcUWfMNF2EFDN5z+2ynA5H8vyGa1hi2ZLvxEXv+02c=;
 b=fqC6eGZj3MNWNBir0siwfkqB3IUbgENBa/ik7Hv4/7qOPFheO0o5ouzbNeJ1awaGx9y9AMIk2QLzUJO/nf/Yvdfhw+2HBc+UcBFkqt8Sf9Upvo0eEjErzPpu9UJlLWtxr0PgsxVRKrZB+gnT/nfHO2mCw/e7k4KfvtArsenaj/wU2AuOi4nxbhQDNHeRzx2Gi6xYH2m/+rWQHe7KsC3cAwnSSmBSoO5v64ikaWqzw1p/b4RcJ4fxrkMqY64DLs4rV27X2WvyixNNYCt8LudHRAPkVhF0KSIwW6a9GzcHYZ1V3QiN4rCTuuOoTGZN4XGxbzHrmrRvJRS6k23/hbtcqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 19:01:17 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 19:01:17 +0000
Message-ID: <64326a18-1e6e-494e-9a89-c942469b0314@intel.com>
Date: Mon, 10 Feb 2025 14:01:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] drm/xe/guc: Rename __guc_capture_parsed_output
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <john.c.harrison@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
 <20250128183653.4027915-2-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250128183653.4027915-2-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:303:2a::27) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CY8PR11MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 73b5c93d-bb49-4242-e636-08dd4a054c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzYzS2R3T2QySmxqTmpvTEpCUDJOM3JMSmtGSlprMDk4eFVmamVtNzlaK2RJ?=
 =?utf-8?B?cGN0dk9XcXpvT3hvbGZ5TmROOE1NcHl6WXFOd3JvVXdwb2FrUmZQNkowVzZD?=
 =?utf-8?B?bVVPcXRUM2FxYyt5UkZFU2pNV1M0eVhUcENXUlVHdDF3TkFKd3hnbzhianZS?=
 =?utf-8?B?ekhGejgzRmFmNE9VUEU2ZzhyUUphUWFtcnhHRHNCK1A0cG8rdDI4Qy9mU3FJ?=
 =?utf-8?B?YWxYWjV3a0FhV3d1ZVk4emJMOGJJWEMyV2tzdHJOMzY2Z3VTSnZBd1hrbytV?=
 =?utf-8?B?aXVZck5LWktCekJ5NWM3SHk1eUxibXZmL0ovVEM1bTZzU1FCTHo4bFJuV3Vp?=
 =?utf-8?B?N1FxdmRNVlNMUStXM1I3aXdSQzBJY3JlTzl4VUd6QVc5V1JKRGdpR3RTazNq?=
 =?utf-8?B?bFRRLzAvRzFwWnN1L0ZjTldneVRER3pBK3hpZVM4WTEzSmpzdkd4MzNFNldF?=
 =?utf-8?B?RXBkdG04NW9JRTU2TE5CL3oyZXNjUjV5ZVBSU0JUVDdwYTNJVDhzNm9SbTZS?=
 =?utf-8?B?cW9zc0V4TzhxajAvWVdMWVhhYWJkVGlOZk4xZFh5cG9SMCthNGxIejc4empP?=
 =?utf-8?B?TGJoNzZaV3g4RkdGYnJsTWtmeEkrUFJLRkpqemFvWkpuZzltRDlLc1h0L0J2?=
 =?utf-8?B?NldxUGxUbnppZklSSTJMSjhld1FRTlRyc0JkL0l5WUFVTEdWWGM4elMzeWVP?=
 =?utf-8?B?cFJUOTF1UysvUnN3S2JvZVBJeGErSnRxeE8rRENXdFUzL2cwN3d6SWlmTG1V?=
 =?utf-8?B?cHBvT1RVSThQR2c4RnlxQmJyMENHNW0wMnAvaEwrTmZ1aGM1Q0RIL3pZQzl4?=
 =?utf-8?B?Nm9OdXhBTmEyMk9sZ1RGYWhYUFpXVlA4aTVDTzZhNGhVVTJZa05raU0vR1da?=
 =?utf-8?B?VnNzOFJRNnZyT1hTWVMxREtPRFdDNXNNU2tPOXVoU3VkUFNVWWdXTGxJaXE0?=
 =?utf-8?B?M1VvUVpNQWpNWFl2VjIwT3ZBYiszS2syYkpVQ2p2RjY0MEROZzhiQ3RST2sv?=
 =?utf-8?B?ancrYm9zMm80ODhKL3d1NDBSOU5UMmc2RGtmdjErWDBBY3V2VmxjUkh6dTlp?=
 =?utf-8?B?NFErNWhGL1VqR2NQQkZxTFFGMnhHRWJCY0dVbmVMV3JybVo2UE5WL2dyWXNR?=
 =?utf-8?B?RnpnVU9LY1lyUk5zRFVVemZDMGVlWFg1OGZudnc2TlVETzhzMWFxYnRmNGJ3?=
 =?utf-8?B?QlNUT0tDcW0yVkx5aUpKTHlEVXc2UUZkN29HeUNMNDZKdHdNMXRZMmg0a21J?=
 =?utf-8?B?bXZQZnEzQnBmWjVNNUt5U3JreVJzQ0RpSWdoY0NLeVU2NysveElsTHM1dTBQ?=
 =?utf-8?B?ZGMvMnpqN3RaZ3J5UFlLckxDZktRVmpiUExaU2NWK3pGOHlPWEsyZkxGTlpO?=
 =?utf-8?B?UlN1amQrNTZvU0RCN3hOTjVlZ0ptRVA4OXlTRzBvbVZpdXN6R3YwWElPQ2k4?=
 =?utf-8?B?Skd6VHMyZGl4cnhDUFYzZ09kNmpYK2o5V2FnaTdnSDNpZ3VDK1V2OStaZ1lT?=
 =?utf-8?B?Mm1vVE41eUxQRzNodzRNU2RmcWh1WGZ6M3VsdFd3OXJvR2xjdkdkY0JrWWFr?=
 =?utf-8?B?MzJZOEN3VmRoZGVYN3hjV0V4N2lUVnlXVzA2SEFSVys1RjF5U0s2b1BhOG9y?=
 =?utf-8?B?OEFrdnliWnp3NG1NVXg3TWxPYkJkRjdXUjVCOUtDNEFXd1NXck5VVEhadGN5?=
 =?utf-8?B?aHo3TlVFR0ZodVl1cTNMRlNTN2tWMFhOSGdHcXcwa3Jja2RHZHFVTCtoQnJ0?=
 =?utf-8?B?TVBTSUVqNm9jYmlXRWdxUkJCSFlQaFYrVU5SNkNDbU9PZ2JmUTdReG1tbFJo?=
 =?utf-8?B?V2JWOWJuMjZQSEJ3TDc1NlBWWDdkMEpjUUU2VElZOVBxeVY5cGxta3Y0alB2?=
 =?utf-8?Q?G8nqcC329bqEz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnFNRkhtdkhEOG5ldmM5cWtsTXYxT0xJSVpkR0NUVUpwYnpKREtoTVhHalNK?=
 =?utf-8?B?endpT1hCUzRvS3FsWXRta0drb0NBNktwTVZRN2dKcWZpU24rRGltZGUxQ0pw?=
 =?utf-8?B?Zm94Tk5ISWVXL2Fzd3dwdC9zc01nMHlyN29SazJEQjBKV1JPZndNdnpNT3Mw?=
 =?utf-8?B?bHFjcWkvOS8vMzJvMEpUQ0wzUTJIMzcxM3lhNVJMdyt2c25yT012SGxlVFlq?=
 =?utf-8?B?TExLN2JRWCtzT3gzYm5QUjF1OHJ0UERpQjdxRmdxYXRrbTJ3ZUZORmpTNThB?=
 =?utf-8?B?cW94VTF1WElVNUk3TXY5TWpNWTVzZHVrYjVDOElaSndVU3BKRTdBeXVpdFZW?=
 =?utf-8?B?ZlFDVkVuQkVicVhhdzA4VUdIMWRwd05nUExvWXMvSHhkUHhuclpHWmExYkNp?=
 =?utf-8?B?aVJGTDFEaWZWL2tSSSt2cG5LNnNiaVd6WDhLWUFwUDlCTU9RWk8zWjU1dVR3?=
 =?utf-8?B?WHpYYjN2VW5wWVBQS1NPY0VIejNXblBZb2ZkN1pWd0VJakduWEYwRDlQMXZW?=
 =?utf-8?B?RjlHM3pWMmtQN1N3ZmR0Vk1aS29xVnJRZ0FBekdOdW1mak1ERVMwZVBMVkV2?=
 =?utf-8?B?QUw0Uy9GVFdiMnFQSWhRSjR0ZXZoVGIvTmVCemVXa0lPVVFIa3dnTGxFSnNG?=
 =?utf-8?B?U0hnWGdSS09sZEs5cG1PZHNUNlBnQitRWXJFTkFyT1I4TnJOb2QyS0tvTmdM?=
 =?utf-8?B?T2IzbXk0V0g4RlRIUFh4TjV2UVNic2F0UjNMd1laZFg2eXZ2N1RUM2hjSi82?=
 =?utf-8?B?TVV0ckEra2NtWUFaOTR5cTlldVh0TmNvZXZaOWh4Vll1c2MrcjR6ZEtONTVJ?=
 =?utf-8?B?SHA5VldpUWIxVUIyU2Z0R1ZYUXp0TFZrQXN1WS9DZVJRVWxRWDZMSk9YUmI5?=
 =?utf-8?B?amxHK3NYckFvZGNwUFhRcEdLcnNybFc5cSt1VEhuRm1BckRITzB1azdSTmtU?=
 =?utf-8?B?N043K3Z4NU1zR1lQUFNmOWI5a01kd2pqbG1Ta01lL0p4b1MrcWFiTTE3Tlha?=
 =?utf-8?B?Q0FFUjRjODV1WGhubytEdmlBMDVveVZvblBxNllsMTdZRzJITUh6UVZUY1VW?=
 =?utf-8?B?QW41aEN6NUxRV3lGWWxiRUVveTNoRExSZDRYclQxRzRUR09BQm16K2IrRGh0?=
 =?utf-8?B?RlgwS0M4YVRlL2I1QTBjS0Zld09QWVdISGw2WSs3ZUFMUm90dSsra2NhRzQr?=
 =?utf-8?B?R2RnV2puV0ttU1RBYlBLdmYyYmFwQURGSVF2MjRqeExPNFZpUExlQjNRalIr?=
 =?utf-8?B?c3BnSzNuek1rWFVveWRyMDVaMktZN01XSExMbk50YlpaYmp2TUJ2eW1DZ0RG?=
 =?utf-8?B?VWlqS3o2Sk56QVVJSlJydUtoMmNHMGEwamVDM3lManRFSm5Pc3BCeWFtMEFN?=
 =?utf-8?B?aHN4M1RaK0wwZjNMN0xIVkdWZW80NmZreEdXMVQ2Nk5QMEtqTXVMZThSZmR1?=
 =?utf-8?B?NjFDalNRdk8vb0lTV2kwUU1TL0tzUlRwYVduMWphbFU5MDFjbFRhb0F3ZGxi?=
 =?utf-8?B?bUVGVkE5NTJ2ODFpbnFjMmViT3Z3R0MxUjd6eUZlMVZEbkNNcGlqQ0M5aTA1?=
 =?utf-8?B?NGF6eDZML2pZU1pSb1k4QWNiWk9udEM0TjgxVitJSjRFSFpqcmR0aklqR0Ey?=
 =?utf-8?B?MkExR3BwcHpkN255TEFnM3N0am5XZGJZckpHU2ZnN3ZjKzhLb1A5NXVOTXg0?=
 =?utf-8?B?MC9lbTBZWXF6c3Q0M3doVnpZVmlGVkhKY0U1aHBIY2kva25jdHhOSzF5LzZp?=
 =?utf-8?B?Sm54TGdDZjVYaDZicUszeGhXSTdZeU92ZEV0VEhGZUFsUldTdXQrZWxwQ29N?=
 =?utf-8?B?eHowc3prczZjWlBaWDY1TjJDNHNUQzVTR2dPaldkZHhYVFdKM2ZCSHd2RHBw?=
 =?utf-8?B?bUpmUktqanViTk12MERWdS9zc3h6VGZ4aVdiOHN0Zlg4WEZSbUFVZzhYdW5U?=
 =?utf-8?B?VHZ3YzhtQ2wyMjhkMmxLdTJXMVFIOFpGdzJWUS8wQzUvSFB2cW05RThnN0Ni?=
 =?utf-8?B?WE1ORzl1MU9Vb2pQSW4wNGJyWkpJMDliSDJNRVEveHhJamFzZkk0Zm0vR0pE?=
 =?utf-8?B?MzY4MHZzbHB5U1JWUW9hdVVVSERlQy9zVkx2WGQ1NGFKaEpxQUhhVjlWU3pn?=
 =?utf-8?B?S1dxdmZlM0k1cjgycFVPZnFJTzVKeVJ6RlBZN04zNDdZRUVkUWpnVFRIOXRm?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b5c93d-bb49-4242-e636-08dd4a054c47
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:01:17.3927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpkiIIAg6hUCBHnOChVMVbivlFEyE/1LlJWypdNsBmaZWpD0BkDfcQ2xoVJgWTYvyp6dH0cmDhN8zedtxftqmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
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

LGTM

Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

Regards,
Zhanjun Dong


On 2025-01-28 1:36 p.m., Alan Previn wrote:
> Since '__guc_capture_parsed_output *' is a handle that
> is retrieved, stored and relinquished by an entity
> external to GuC (i.e. xe_devcoredump), lets rename it to
> something formal without the'__' prefix and export it
> via give a header file.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump_types.h     |  2 +-
>   drivers/gpu/drm/xe/xe_guc_capture.c           | 83 ++++++-------------
>   drivers/gpu/drm/xe/xe_guc_capture.h           |  2 +-
>   .../drm/xe/xe_guc_capture_snapshot_types.h    | 53 ++++++++++++
>   drivers/gpu/drm/xe/xe_hw_engine.c             |  2 +-
>   drivers/gpu/drm/xe/xe_hw_engine_types.h       |  5 --
>   6 files changed, 81 insertions(+), 66 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 1a1d16a96b2d..c94ce21043a8 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -58,7 +58,7 @@ struct xe_devcoredump_snapshot {
>   	 * this single-node tracker works because devcoredump will always only
>   	 * produce one hw-engine capture per devcoredump event
>   	 */
> -	struct __guc_capture_parsed_output *matched_node;
> +	struct xe_guc_capture_snapshot *matched_node;
>   	/** @vm: Snapshot of VM state */
>   	struct xe_vm_snapshot *vm;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index f6d523e4c5fe..e04c87739267 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -26,6 +26,7 @@
>   #include "xe_guc_ads.h"
>   #include "xe_guc_capture.h"
>   #include "xe_guc_capture_types.h"
> +#include "xe_guc_capture_snapshot_types.h"
>   #include "xe_guc_ct.h"
>   #include "xe_guc_exec_queue_types.h"
>   #include "xe_guc_log.h"
> @@ -53,40 +54,6 @@ struct __guc_capture_bufstate {
>   	u32 wr;
>   };
>   
> -/*
> - * struct __guc_capture_parsed_output - extracted error capture node
> - *
> - * A single unit of extracted error-capture output data grouped together
> - * at an engine-instance level. We keep these nodes in a linked list.
> - * See cachelist and outlist below.
> - */
> -struct __guc_capture_parsed_output {
> -	/*
> -	 * A single set of 3 capture lists: a global-list
> -	 * an engine-class-list and an engine-instance list.
> -	 * outlist in __guc_capture_parsed_output will keep
> -	 * a linked list of these nodes that will eventually
> -	 * be detached from outlist and attached into to
> -	 * xe_codedump in response to a context reset
> -	 */
> -	struct list_head link;
> -	bool is_partial;
> -	u32 eng_class;
> -	u32 eng_inst;
> -	u32 guc_id;
> -	u32 lrca;
> -	u32 type;
> -	bool locked;
> -	enum xe_hw_engine_snapshot_source_id source;
> -	struct gcap_reg_list_info {
> -		u32 vfid;
> -		u32 num_regs;
> -		struct guc_mmio_reg *regs;
> -	} reginfo[GUC_STATE_CAPTURE_TYPE_MAX];
> -#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_STATE_CAPTURE_TYPE_GLOBAL)
> -#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS)
> -};
> -
>   /*
>    * Define all device tables of GuC error capture register lists
>    * NOTE:
> @@ -287,7 +254,7 @@ struct xe_guc_state_capture {
>   
>   static void
>   guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
> -					   struct __guc_capture_parsed_output *node);
> +					   struct xe_guc_capture_snapshot *node);
>   
>   static const struct __guc_mmio_reg_descr_group *
>   guc_capture_get_device_reglist(struct xe_device *xe)
> @@ -841,7 +808,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
>   }
>   
>   static void
> -guc_capture_add_node_to_list(struct __guc_capture_parsed_output *node,
> +guc_capture_add_node_to_list(struct xe_guc_capture_snapshot *node,
>   			     struct list_head *list)
>   {
>   	list_add(&node->link, list);
> @@ -849,7 +816,7 @@ guc_capture_add_node_to_list(struct __guc_capture_parsed_output *node,
>   
>   static void
>   guc_capture_add_node_to_outlist(struct xe_guc_state_capture *gc,
> -				struct __guc_capture_parsed_output *node)
> +				struct xe_guc_capture_snapshot *node)
>   {
>   	guc_capture_remove_stale_matches_from_list(gc, node);
>   	guc_capture_add_node_to_list(node, &gc->outlist);
> @@ -857,14 +824,14 @@ guc_capture_add_node_to_outlist(struct xe_guc_state_capture *gc,
>   
>   static void
>   guc_capture_add_node_to_cachelist(struct xe_guc_state_capture *gc,
> -				  struct __guc_capture_parsed_output *node)
> +				  struct xe_guc_capture_snapshot *node)
>   {
>   	guc_capture_add_node_to_list(node, &gc->cachelist);
>   }
>   
>   static void
>   guc_capture_free_outlist_node(struct xe_guc_state_capture *gc,
> -			      struct __guc_capture_parsed_output *n)
> +			      struct xe_guc_capture_snapshot *n)
>   {
>   	if (n) {
>   		n->locked = 0;
> @@ -876,9 +843,9 @@ guc_capture_free_outlist_node(struct xe_guc_state_capture *gc,
>   
>   static void
>   guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
> -					   struct __guc_capture_parsed_output *node)
> +					   struct xe_guc_capture_snapshot *node)
>   {
> -	struct __guc_capture_parsed_output *n, *ntmp;
> +	struct xe_guc_capture_snapshot *n, *ntmp;
>   	int guc_id = node->guc_id;
>   
>   	list_for_each_entry_safe(n, ntmp, &gc->outlist, link) {
> @@ -888,7 +855,7 @@ guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
>   }
>   
>   static void
> -guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
> +guc_capture_init_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *node)
>   {
>   	struct guc_mmio_reg *tmp[GUC_STATE_CAPTURE_TYPE_MAX];
>   	int i;
> @@ -1067,13 +1034,13 @@ guc_capture_log_get_register(struct xe_guc *guc, struct __guc_capture_bufstate *
>   	return 0;
>   }
>   
> -static struct __guc_capture_parsed_output *
> +static struct xe_guc_capture_snapshot *
>   guc_capture_get_prealloc_node(struct xe_guc *guc)
>   {
> -	struct __guc_capture_parsed_output *found = NULL;
> +	struct xe_guc_capture_snapshot *found = NULL;
>   
>   	if (!list_empty(&guc->capture->cachelist)) {
> -		struct __guc_capture_parsed_output *n, *ntmp;
> +		struct xe_guc_capture_snapshot *n, *ntmp;
>   
>   		/* get first avail node from the cache list */
>   		list_for_each_entry_safe(n, ntmp, &guc->capture->cachelist, link) {
> @@ -1081,7 +1048,7 @@ guc_capture_get_prealloc_node(struct xe_guc *guc)
>   			break;
>   		}
>   	} else {
> -		struct __guc_capture_parsed_output *n, *ntmp;
> +		struct xe_guc_capture_snapshot *n, *ntmp;
>   
>   		/*
>   		 * traverse reversed and steal back the oldest node already
> @@ -1100,11 +1067,11 @@ guc_capture_get_prealloc_node(struct xe_guc *guc)
>   	return found;
>   }
>   
> -static struct __guc_capture_parsed_output *
> -guc_capture_clone_node(struct xe_guc *guc, struct __guc_capture_parsed_output *original,
> +static struct xe_guc_capture_snapshot *
> +guc_capture_clone_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *original,
>   		       u32 keep_reglist_mask)
>   {
> -	struct __guc_capture_parsed_output *new;
> +	struct xe_guc_capture_snapshot *new;
>   	int i;
>   
>   	new = guc_capture_get_prealloc_node(guc);
> @@ -1146,7 +1113,7 @@ guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *
>   	struct xe_gt *gt = guc_to_gt(guc);
>   	struct guc_state_capture_group_header_t ghdr = {0};
>   	struct guc_state_capture_header_t hdr = {0};
> -	struct __guc_capture_parsed_output *node = NULL;
> +	struct xe_guc_capture_snapshot *node = NULL;
>   	struct guc_mmio_reg *regs = NULL;
>   	int i, numlists, numregs, ret = 0;
>   	enum guc_state_capture_type datatype;
> @@ -1439,11 +1406,11 @@ void xe_guc_capture_process(struct xe_guc *guc)
>   		__guc_capture_process_output(guc);
>   }
>   
> -static struct __guc_capture_parsed_output *
> +static struct xe_guc_capture_snapshot *
>   guc_capture_alloc_one_node(struct xe_guc *guc)
>   {
>   	struct drm_device *drm = guc_to_drm(guc);
> -	struct __guc_capture_parsed_output *new;
> +	struct xe_guc_capture_snapshot *new;
>   	int i;
>   
>   	new = drmm_kzalloc(drm, sizeof(*new), GFP_KERNEL);
> @@ -1468,7 +1435,7 @@ guc_capture_alloc_one_node(struct xe_guc *guc)
>   static void
>   __guc_capture_create_prealloc_nodes(struct xe_guc *guc)
>   {
> -	struct __guc_capture_parsed_output *node = NULL;
> +	struct xe_guc_capture_snapshot *node = NULL;
>   	int i;
>   
>   	for (i = 0; i < PREALLOC_NODES_MAX_COUNT; ++i) {
> @@ -1583,7 +1550,7 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
>   	struct xe_devcoredump *devcoredump = &xe->devcoredump;
>   	enum guc_capture_list_class_type capture_class;
>   	const struct __guc_mmio_reg_descr_group *list;
> -	struct __guc_capture_parsed_output *new;
> +	struct xe_guc_capture_snapshot *new;
>   	enum guc_state_capture_type type;
>   	u16 guc_id = 0;
>   	u32 lrca = 0;
> @@ -1849,7 +1816,7 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>    *
>    * Returns: found guc-capture node ptr else NULL
>    */
> -struct __guc_capture_parsed_output *
> +struct xe_guc_capture_snapshot *
>   xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>   {
>   	struct xe_hw_engine *hwe;
> @@ -1878,7 +1845,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>   	}
>   
>   	if (guc_class <= GUC_LAST_ENGINE_CLASS) {
> -		struct __guc_capture_parsed_output *n, *ntmp;
> +		struct xe_guc_capture_snapshot *n, *ntmp;
>   		struct xe_guc *guc =  &q->gt->uc.guc;
>   		u16 guc_id = q->guc->id;
>   		u32 lrca = xe_lrc_ggtt_addr(q->lrc[0]);
> @@ -1931,7 +1898,7 @@ xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
>   			coredump->snapshot.hwe[id] =
>   				xe_hw_engine_snapshot_capture(hwe, q);
>   		} else {
> -			struct __guc_capture_parsed_output *new;
> +			struct xe_guc_capture_snapshot *new;
>   
>   			new = xe_guc_capture_get_matching_and_lock(q);
>   			if (new) {
> @@ -1965,7 +1932,7 @@ void xe_guc_capture_put_matched_nodes(struct xe_guc *guc)
>   {
>   	struct xe_device *xe = guc_to_xe(guc);
>   	struct xe_devcoredump *devcoredump = &xe->devcoredump;
> -	struct __guc_capture_parsed_output *n = devcoredump->snapshot.matched_node;
> +	struct xe_guc_capture_snapshot *n = devcoredump->snapshot.matched_node;
>   
>   	if (n) {
>   		guc_capture_remove_stale_matches_from_list(guc->capture, n);
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index 20a078dc4b85..046989fba3b1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -50,7 +50,7 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
>   const struct __guc_mmio_reg_descr_group *
>   xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
>   				 enum guc_capture_list_class_type capture_class, bool is_ext);
> -struct __guc_capture_parsed_output *xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q);
> +struct xe_guc_capture_snapshot *xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q);
>   void xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot);
>   void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
>   void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h b/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
> new file mode 100644
> index 000000000000..0be2c809a7ce
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_CAPTURE_SNAPSHOT_TYPES_H
> +#define _XE_GUC_CAPTURE_SNAPSHOT_TYPES_H
> +
> +#include <linux/types.h>
> +#include <abi/guc_capture_abi.h>
> +
> +struct guc_mmio_reg;
> +
> +enum xe_guc_capture_snapshot_source {
> +	XE_ENGINE_CAPTURE_SOURCE_MANUAL,
> +	XE_ENGINE_CAPTURE_SOURCE_GUC
> +};
> +
> +/*
> + * struct xe_guc_capture_snapshot - extracted error capture node
> + *
> + * A single unit of extracted error-capture output data grouped together
> + * at an engine-instance level. We keep these nodes in a linked list.
> + * See cachelist and outlist below.
> + */
> +struct xe_guc_capture_snapshot {
> +	/*
> +	 * A single set of 3 capture lists: a global-list
> +	 * an engine-class-list and an engine-instance list.
> +	 * outlist in xe_guc_state_capture will keep
> +	 * a linked list of these nodes that will eventually
> +	 * be detached from outlist and attached into to
> +	 * xe_codedump in response to a context reset
> +	 */
> +	struct list_head link;
> +	bool is_partial;
> +	u32 eng_class;
> +	u32 eng_inst;
> +	u32 guc_id;
> +	u32 lrca;
> +	u32 type;
> +	bool locked;
> +	enum xe_guc_capture_snapshot_source source;
> +	struct gcap_reg_list_info {
> +		u32 vfid;
> +		u32 num_regs;
> +		struct guc_mmio_reg *regs;
> +	} reginfo[GUC_STATE_CAPTURE_TYPE_MAX];
> +#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_STATE_CAPTURE_TYPE_GLOBAL)
> +#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS)
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index fc447751fe78..a99e3160724b 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -843,7 +843,7 @@ struct xe_hw_engine_snapshot *
>   xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>   {
>   	struct xe_hw_engine_snapshot *snapshot;
> -	struct __guc_capture_parsed_output *node;
> +	struct xe_guc_capture_snapshot *node;
>   
>   	if (!xe_hw_engine_is_valid(hwe))
>   		return NULL;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index e4191a7a2c31..de69e2628f2f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -152,11 +152,6 @@ struct xe_hw_engine {
>   	struct xe_hw_engine_group *hw_engine_group;
>   };
>   
> -enum xe_hw_engine_snapshot_source_id {
> -	XE_ENGINE_CAPTURE_SOURCE_MANUAL,
> -	XE_ENGINE_CAPTURE_SOURCE_GUC
> -};
> -
>   /**
>    * struct xe_hw_engine_snapshot - Hardware engine snapshot
>    *

