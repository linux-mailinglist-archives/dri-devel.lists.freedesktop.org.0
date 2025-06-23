Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E3EAE4289
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 15:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7EE10E1DA;
	Mon, 23 Jun 2025 13:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIdn9a4o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737B410E19B;
 Mon, 23 Jun 2025 13:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750684907; x=1782220907;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h4sICj45DJbhDZuUbCSrIvI5CiaHr241yItruqIPa2I=;
 b=CIdn9a4o08rKLeHzU4t0jZ8s7qudj3Z6cj9ZWocum/9LUAYIDUh9Q0lO
 +As0UTSPvJVkAdLtI4xGQyKjY91QfJ2Bi5COOnpG3RLR4/e5Mq+5OaFFR
 2AjFCsG+3MUCvLm61x/5BjG+DOKMCs95O6KtmcgHF2EO/xiBGu/i/+AQS
 g+rc8suUUmFeDTFAPRnk6LRyBIn9T/HpoxjNATOBVWNSq/KPXsKhIMaXf
 AnFmo/WPEMPp7xff1dNjacJXV6BXHgfaADrQ3Xd6e5xF2Xh9n1QXqzTjv
 ZqNkNMc/gk+ilZXWlk7uZNhRIkxXLo3pceGTsbWhCbfvu7hN+3leKez7C g==;
X-CSE-ConnectionGUID: DIpUcyCAScGoMRSSzIvcdw==
X-CSE-MsgGUID: s2QRgkc4SFKekXtHFHGxnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="70318437"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="70318437"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 06:21:47 -0700
X-CSE-ConnectionGUID: 931S02GVR2OXe5QV86Siqg==
X-CSE-MsgGUID: NgOdMjaiTEix7YiTJyXE9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="188811143"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 06:21:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 06:21:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 06:21:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.79)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 06:21:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIN2eAOkl2Ts5URrd1pZesZbKSkRKAGEoDf49qbOqr0B6VVC0aaivfKMyp3ilbk/NTTI1zlucreehg/TwjuvHkUhS2VS/MTmjWXBO/SV/gUm1GCyMPe6SK98V/aJMStnpzEXGPpKusNvmRL3BbGra9rF0mUkkTgCf80HXmfSx/8AYx2J5OOW/NdNvFPJTtmmelJWNhdOHHm4BcQlaZ2DvRBQbxxcZO4UFDdsz3fClkVIyiyAUHvgzrK107c6waK+st/xrW+jrS1E2Kond2fxe6hYkBDc7XlvDu+ISpxlddlFlOkzMcQytRTTnKWJNRdjtBeXv8rUgVI+7+CMov781Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbVJxicT5UVSDA+UFFS9Ehrbt65LtB2Hv1qhBHVQKek=;
 b=mmycn4IFswYbiwy47LdCEPzuCWAQY8XFlrJpnVHMxMOwAX5yd+kZzPvBadaU1dqujH5FOST2N0gmpB8fOMXBH0P/kLBhLyKYO7NUaINqTfJgQU/lKsl2zqdv+kVZiCersTgpDm3XGhd+fk4HKmJq7xKqHdD7rUpukr4j4iKTYmyBGcD2voL4vALoHzjcX6nPpZE4REewUuKm1CFCa7Z2ekUHoqtt6h+PJkmgNzTjltP/bkAqDuN8pt8ofaOp/PE4r7cYE5ix66kJXohZElkCOKvx2mCz1dQpt4oNeFdl1Pp6PwSDKE9lbfnSqz62JZ8TkfmQgSaGBqYCKPSfPNEc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 23 Jun
 2025 13:21:30 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 13:21:30 +0000
Date: Mon, 23 Jun 2025 13:21:18 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Jeff Layton <jlayton@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
 Qasim Ijaz <qasdev00@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v15 4/9] ref_tracker: add a static classname string to
 each ref_tracker_dir
Message-ID: <rmruq6quhhpthllm77ewdx4lgo76trqinewlj3qzyowrqy45h2@bb4kvi4q3h4o>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
 <20250618-reftrack-dbgfs-v15-4-24fc37ead144@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250618-reftrack-dbgfs-v15-4-24fc37ead144@kernel.org>
X-ClientProxiedBy: WA1P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::28) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 8502cc9e-8afd-4567-7b02-08ddb258ddad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDhZMmlrQ3RHNzdVeDN5cnJKVXFLbnFqci9YT3l6WkJIKzdHSWdtMytReUFs?=
 =?utf-8?B?c09JUzhtbHhMYzNaQlpTd3dpVStIazVoemM4Y3hNRkpiNEtVY2JsZERHcWJ1?=
 =?utf-8?B?SFNzV3J4U0xuMGZjdmNHaUpCSDZyZ1dhTHpSZVZVanYrQ25yK0xpbU1HaE96?=
 =?utf-8?B?VU5hUXF4a3M0R2YwbEUxVHZrWjhURmRPL0VJNjNueFIvTC82UlZyZUI5Rms4?=
 =?utf-8?B?SDNwdEZ3dnQxY2VUSUtnSWZmTDVxSGErNDZpQkd0UUkrQ1RVNU9IKzdHdzlP?=
 =?utf-8?B?c2RXcDUxSGtKK1I2OG5JVjFmdnN3dzR0NEYzYmxEOWxjQzRISjk3UTg2cG94?=
 =?utf-8?B?QXBlNHNSblUvclJQbzU4ZmR0TzBlWUNBOHh2TmRmVjY5MXY5RGNTdVAzNERH?=
 =?utf-8?B?dFhOaGl6VlhrV3NEdVNhRUs3MjY3S0NhWWhUcC8vU0k4Sk93WTA0ZUhIQmVE?=
 =?utf-8?B?VG5NWUZmams5WEdHY2xnRmhFcXhMK05obE04WDBvRWJqU0w0QkdKQUNpRUFS?=
 =?utf-8?B?WDZlYUlteWd1cjhnYXZGMUNDeFNrdTNudkxUQzNzSVQ2MkJsc0c5UHMwQTZV?=
 =?utf-8?B?empvS3ROOEtHdVFxd0FkMlR1R3BwanhCdXRaNkFmMnU4T1ZsVFNqZFV0RGo4?=
 =?utf-8?B?bHhPTlI2blZXUUxzSU9NWUJzbW9hZnIwbWNpY0hoL1pXSld2ZE9RaFFoUnpE?=
 =?utf-8?B?TG5zUkRXeVVNUmxJUVN0OHhQKzNWbXNtZHlLZGVaSy9hbDNzMUJWOG0vVmZr?=
 =?utf-8?B?bGgraVBPMjF4QUJQNFJrcHVNYmhFK1k2U3ViMDNWb0ZQcWh6VGxMUjBVdkJC?=
 =?utf-8?B?UCtFWGxUL3NWWjB5YVprQjVyeGxmMzFmSTNLQ3JGb1ZaTmovT3QzY3hIbkFH?=
 =?utf-8?B?OXNwZktBd1h3VjF4bDZ5WUF6TzIvMFhMc252UEZTUnUxREMxWTBJenJpTFJ2?=
 =?utf-8?B?L1VHNTJHVzVyWjZRakZDMjdIcnkxWi9pNmJOS0NNY1FDeWhRSUxnbFlaMjFw?=
 =?utf-8?B?KzlDcE9DWHRiVXZKWEdycTlHWEZabmJtU2tMdDZZOUkyK1pZdXRHclZadGsy?=
 =?utf-8?B?SW5QUFp4bUZMWHJEVTduTmRPUGdHS3RhK0c2VlFSSmtkWEpSaWQ4N1poZmpp?=
 =?utf-8?B?eXRsU3dLWFpyNkJjN3ZMczZDdEhVQy9COEQwWGYzRkFBdEVSRnpITXp2cVhR?=
 =?utf-8?B?UWRNeDdVeVpzWFRBM1ZXMHdsMTZQd3BpbXZzWVdHZldWcEpzVjBWY0Rod3ZQ?=
 =?utf-8?B?S09KbFh3aHZ6Nm9STEJKMnhOTkptUjVNN3U1eUZhdHl2ZUFxWFNYZlFQWXVE?=
 =?utf-8?B?eHQzRG9BYUk2K2RoaTdpSEhWbFg1M3ErcGsrRnVaR0lJRlBaQ083NDk3U2Zx?=
 =?utf-8?B?L1ZUeTBCSGpPQldpdCtmdGNvU1lGRmRoZ0xkOVpRYXVJSUlXcjQzaTRXV1ZB?=
 =?utf-8?B?QWVLVk9MRXVSaEtWK3dkdlBsV0JRZEY2MzBlVENKOWd1K3ppUDhwaDIzYzVw?=
 =?utf-8?B?V1RzZ2JYWnd4WVdIelcyZVpWMjBmeTlGNHNxc1gzTzRtUXJCZ250dzJwZmdv?=
 =?utf-8?B?djRzSFBlVXNzeFZIUkZwTktrb0xLb3JEd1pYYlJlMWphdmYydFpnNFVWSnhT?=
 =?utf-8?B?ZFVmcnFaRWR4Qk4yc0VqU2h1d2U2UGFJTk9ydmQyTUEzaHIxM0p6VW5VeFNK?=
 =?utf-8?B?bWYxbVpnZ2FWUzIzSmRvcXBkRlV0UkFuNkIxNGpLQTJXN253Z1ErZ0tOOVow?=
 =?utf-8?B?N3h2UEhOUXgxK1huUllWeVFVZ1R2V3hPS0gvSVpJM1kzS1l3cC9rYkVNS3JW?=
 =?utf-8?B?Q3dZdGk4dE55K2dkSm43bXFyTEZxTlZPZE8vZXZmZDFpaStSVzJlTWJmTWFD?=
 =?utf-8?B?dXVwSFVYdjA0WUM1UGY1RTJzUTd0M2VwWTdjVHFPbG9FaHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3pDMzJYeWtndjk0K0xrTGFoampFSFhyanNiNjZvS0JNZWlRZzJDM0wzZkR1?=
 =?utf-8?B?Y2NGb2EweStrQ2RGK2JuSVRsR242OGx3SEtTakJHMHRhNTFTRVpPZmlWYkRh?=
 =?utf-8?B?bm1HbWt0ODY4dWdwdGEyZ2s5T1B1ZW5WNE5QRjZqNWxzdXBPQlkvWXZDVmRM?=
 =?utf-8?B?RDhrM2NrWUc0dlpPZEQwdDJyMXBkRnR3K3cwVWc4TWw3emZveEVvdjFucXF5?=
 =?utf-8?B?VTV6djNLVkg3aWluU2VHc3p2K1NpVGIvZkJsNzJNVjgxNk5QQ294THpZOXBk?=
 =?utf-8?B?VEJXOTR2Zno5R2lsTTRpSDhrWXhMN2tOcjF1bFBxbG9RQWU3Tmg3akJGU0ZL?=
 =?utf-8?B?MUc4RFBEdUlYdWNBN3ErZXNPeEQ3bFg0bTV6ZU02MjlpYWpQSUJnbHd5NEs5?=
 =?utf-8?B?RXpIajBFV3l0SUN3bkVmTkFoRlliL3VPS1VneDFtZXVHZHlhenRFRkNOeG5z?=
 =?utf-8?B?MTd1WVJYdERpRkQ4SDRuL3hJRVJzWCtaNTNVeHkxSW5WdmRoWXh5cjhZUmpu?=
 =?utf-8?B?UW1rUnE3dXpoL3Vma2ZqcE1iZVQ4OElpQ04vbmFKQTlIOVkrcUR1emdlOWIy?=
 =?utf-8?B?RFlrcUF4RkthWTBUay9odnBXR2ozVTVsak1tZ1l0b0VrK005QytNV2hSSThp?=
 =?utf-8?B?YWJtQUM3cmlRMDRJSWJ6eFA3Q1VWQmFpSnlZWnZCNis1OEpzVmErdXRRbGtD?=
 =?utf-8?B?aVBCRVI3alZ1VHFUT3UwaGxITGpvNTBoUUNadkJ4S3NFbkVraDV6UjZMS3Vy?=
 =?utf-8?B?aWMzaUErdGJnaXVlK2FDZEE1VSs5SEJjZ1BBcHVjRjNtYjBxdURRVmc5TUkr?=
 =?utf-8?B?MGZ4U0RERlFxRnJVcC94dWlaLy90YkxyWHM1Y0VLQi9TTGR2ckNUdmJTRmlC?=
 =?utf-8?B?RlQxWSs0TFdQVTZJeE90V0VqSTZzT1EvUjRKQTl1TEtCbEN3MGhUeUtyKzNa?=
 =?utf-8?B?cjZ6NXBBZ0NZMXFXYkFlV3p5NVV4ZitWVTNCSEpVNDRhcW02bnRZcEM5cWl0?=
 =?utf-8?B?WEVVZy9GSmxTendnM2ZscXRjNGN2OXdXSUVUSDNCYzhvckVuSGpCV2FuVFQw?=
 =?utf-8?B?eGIxYU54bTJrQzlydkpWcHZ3a2RzaHdDWXM3bHBsMWo0YnVjc2twOTVzWmow?=
 =?utf-8?B?YU8yTWEyQ0xNd3pYTDZSZnk4eHgxR285Y1lYN2J2T1F4ZmU0OEJqa1NNbUxu?=
 =?utf-8?B?UVBITkdnVWp5MmNDZXBQUEpwWlV5ZmcvK3hWWGZEU1FiSUtOWCsvZjlkWlcy?=
 =?utf-8?B?MnhLU3hSZ2VjblpYSzVGL1VQK0RGVGNHWFJDQzBFVUlHcVNqSnA1bzMyTXNl?=
 =?utf-8?B?NUhlaUZIRm9QNG9ma2dhTGZXNEEybUtzNE5tUnM4K0FlQWlUT0p0dTh0amsv?=
 =?utf-8?B?Vm5CQ2hzSytLUEhacVlEd21peCs5eG5uSVFTZmF4M0R1Mk9vV2pXTWU3K05R?=
 =?utf-8?B?VzJHSGZnUWFtNVV0Vm5xTUJtS0t0UmZiN0J1K0p3cHVsT3V6Q1FrbHNGdlcr?=
 =?utf-8?B?d0dSWlc2eld1NWlzT1JBOHpoMk9LZzhrZklpaTFxcnlVOFliT3R5aUV1aWNQ?=
 =?utf-8?B?SFhYK05xQjdkaW5KMWdsK2NyQVVNT3ZGS3hJeERxSHhxeEkvMDlyYTFqR1dO?=
 =?utf-8?B?bWNhcWpuWHZPSkJCUkE0SWNPdkRGeU1OWWtlb2RZZEQvTmdlN3Z1cjlsZXhB?=
 =?utf-8?B?THMvTkZUSDRPRklROHQ4RjNkTEl2NVliUThQV3luczAxek9PQXRMMEhqY1cy?=
 =?utf-8?B?NE5nQUxSZ0F3NUFSK21aWG5LTW1FaHRiVzYwZHAweXFSWnpZTFlXbi9nWGZh?=
 =?utf-8?B?eWt1TzZNOHdOaFh2bzE4ZkNhQ3RBLyt5aWkvYlpqZTlBckpqM29WWm0rTXIz?=
 =?utf-8?B?ay9Zai9jcnRrUFpKbkJUSXpRV0F4VmRCSUE4eUNlTnIwUGFXSWs1WFA4Rlpr?=
 =?utf-8?B?UmtadmIva0lyTkZDcEpXaFV0bkhlaFZGZ1ZuODlyMUsrRGVBMnhzY0NpUTRR?=
 =?utf-8?B?TitEWFhrTE55VHNNaldTQXQ5MTJUVEJZZTk0MGF4TFU5cEI4UUF2TkcxMFo5?=
 =?utf-8?B?WjFxNU5wano3cUNVYWpUT2d1ZThiN201T2lDbGQxSmptM1k4L21DU2ovSTV0?=
 =?utf-8?B?R2Ixc2hVR0h2Y1NrV0xKdEpUNExLQXY1SmFRdktDMFVzaHJxdnBPVEVMdFF5?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8502cc9e-8afd-4567-7b02-08ddb258ddad
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 13:21:30.4654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecI70OoJFWXnuXv6UDfGEjrDZL+hgFXN0CJiqbAfaI7a0y5v2yJrUdz7/jSH2BEYw8d+I+ubVcVfLaICxIu3Q9H2QfbPBpsA2GSQfOP+h1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
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

Hi Jeff,

[...]
> +++ b/drivers/gpu/drm/i915/intel_wakeref.c
> @@ -114,7 +114,8 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
>  			 "wakeref.work", &key->work, 0);
>  
>  #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_WAKEREF)
> -	ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, name);
> +	if (!wf->debug.class)
> +		ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, "intel_wakeref", name);
I think this line could be broken in two. It is almost 100
characters long and the majority of this file does not
exceed 90.

>  #endif
>  }
>  
> diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
> index a0a1ee43724ffa00e60c116be18e481bfe1d1455..3968f993db81e95c0d58c81454311841c1b9cd35 100644
> --- a/include/linux/ref_tracker.h
> +++ b/include/linux/ref_tracker.h
> @@ -19,6 +19,7 @@ struct ref_tracker_dir {
>  	bool			dead;
>  	struct list_head	list; /* List of active trackers */
>  	struct list_head	quarantine; /* List of dead trackers */
> +	const char		*class; /* object classname */
Another nitpick here: the comments start with capital letters in
this struct, so could you change object -> Object?

Apart from these minor suggestions, I think this is a nice
change:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

---
Best Regards,
Krzysztof
