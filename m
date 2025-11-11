Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6CEC4C6DE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 09:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1827210E51B;
	Tue, 11 Nov 2025 08:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="evc1Feky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC55710E517;
 Tue, 11 Nov 2025 08:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762850368; x=1794386368;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=37hfkIl/xtAOz1mfYS4NmK2qtk/xoaXl2qDkOZBXFvA=;
 b=evc1Fekyv9lvt/VtHQtvhczY0+dsKRZ4Sk0ncTaGO252A6+gfwmwYlY3
 Jwqdi2ex7ZQOcLmKHyqLi7XwVAuP6pXFZrXnPrOq6x6e0ONTS0DhyYKbk
 ZThc2Q0ST0xhU46/t5X0FLaVUxH//OeEnbyQIqkY6EDXgnRGQ451TiP6J
 dBcDHmM4/Cif9CAHmmo8h0n8Zc9IdL4qvIhptHbCEw3T+AWgvQOI+RFVi
 AvvYcsKrT/0DotVVQJRcwd4uZxi+Dxt+HjKQfq6+kRggys2Hr98zKjXzk
 ojMhKQ2FNH5lGm3WRgClczAQykeZU24+LI5KXIGT51/Em1ZGLV4CCzjCL A==;
X-CSE-ConnectionGUID: JRArR+ITSZW9W8QYlOHrYw==
X-CSE-MsgGUID: 3A83PsbBTAOHIvKsb53pRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75592852"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="75592852"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:39:24 -0800
X-CSE-ConnectionGUID: mwVeuq9zR0W8cbobpYl2qQ==
X-CSE-MsgGUID: f2Bu2X5zSW6ofDQh1fgXFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="188674347"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:39:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 00:39:23 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 00:39:23 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 00:39:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFS6bnB6u1m6gKxsfTbhjDhonxRWugGsiSoAXWMrBwpDemhVLU7OTUD3XrJNMlja+mQIR+DtvAb2we3bX2OzFgctmcAUE2E5HJoDOesZ3iiQot2hoil18FCHCmHZW151pHeB8oF97eOWMJNt6bhW2enew4fhPdjnTVuAbdWLWwjZl0lrXVHGG/lu/ALBA1OaZc8g272f9ns2hO2PT8uyMowl3UfPY/emTD8rGMtrDZAsxyXOR16xJUDpLd9x173eJsw6ZOUsqdRH/BEyEKK7f26BVUfN69UR11uKFHT+mE6TpMr09x7sGnsBb9hiyXDALgfCwIv7LhpahGAJ/2te7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHQorRitbXHAsWUjIisTmde8FX5tqKpgCNetEzpY0kk=;
 b=Ce0xmh2eHNWvd0sQBNHplyHL1I3t0GTwMvPm6dQ61bpAj+dl2P+LSdAXf4cA6F7kPkmTlOTre14WF5MvEVbm88tvthtNZepXJwloa3g992kazTj1ukbbOc65mNZwppX7s2j/0i7S6G46oX8itTeJeCc7ECqUb93O8JLFb2BrEIUVbNyrB1w6KzynnctwVERWS4arPXTWi+cu0YkE6ShfkZpxYPKUh3KSSv7sVIlvYRBRBzwowiAWYb0DDGx8azJ0jnkYlu+UGsJ2RTFHXkavhRp+JPnPtZLZjOjWxLuB4BFArAXoCAcu4aIjHNS1kEoc9vjBoqHzf5kJ6I/Ez1a/BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 08:39:21 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 08:39:20 +0000
Message-ID: <b01cade8-ba63-472a-a95f-bba9af57afbb@intel.com>
Date: Tue, 11 Nov 2025 14:09:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 15/16] drm/i915/color: Add 3D LUT to color pipeline
Content-Language: en-GB
To: Jani Nikula <jani.nikula@intel.com>, Uma Shankar <uma.shankar@intel.com>, 
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, <pekka.paalanen@collabora.com>,
 <contact@emersion.fr>, <harry.wentland@amd.com>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <swati2.sharma@intel.com>, <alex.hung@amd.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-16-uma.shankar@intel.com>
 <6a310c6396adb711e5f996136a4f3c813c71e2bc@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <6a310c6396adb711e5f996136a4f3c813c71e2bc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::8) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH0PR11MB5206:EE_
X-MS-Office365-Filtering-Correlation-Id: ed041b39-c771-4797-56cb-08de20fdcee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGxlaExtczBWRHRBTXRocEw1SERHdFQ1ZGh1Qm5JRGNXOVBhcjRQaUdQUk5J?=
 =?utf-8?B?SlNkZmdSVG11dFRZWitVUmYzcXR3bk9kcVpFaVliQTNTbEQ1NVZxT3A0VUts?=
 =?utf-8?B?Tk4rZkJDcnlUVnN2TkZ0VXZPeVo4bnBadkxOZjJUWG9HYlluWDVNVU5tekZl?=
 =?utf-8?B?NUJ3bytoR1dqV2tsMEY3cFJqbEtuc1hta2lUWlJQaFQ1YVBqT1JkVmtGdG1s?=
 =?utf-8?B?NnpXekRXYnpMN0pLdHlZb1NxaGI0bnJscEJlaUcvVWFYMmliU2lLSko4M2ZO?=
 =?utf-8?B?SDYxcUtobllVd0V3TDF0bXB3RFpLSi9GdVlXTlQvTUlmQ004aEdFV2Y3NFFJ?=
 =?utf-8?B?dVlacm9FYW9oZXUrdDU4c2d3OURzeXpNOGgxdmdmcG5hQXFpZTlHVk9FMUNP?=
 =?utf-8?B?UUorRWtaNU85NmM5cmdMdGhXZFBmQVhTTlpzZS9TNVB5UHVkRU5kbG5STUlG?=
 =?utf-8?B?SmtudUd4VnBFcUxkVTcybm9DMXdFa2ZoQWMxZ1NwYVQ3bGU0bEZRUHBWVHQ3?=
 =?utf-8?B?d2J4OW5rUXpTcFl6azVxVmxSSkR4blJmNjRWVU0zeDNYalMrOEtyVEdmSno4?=
 =?utf-8?B?WVQ4QWVWUTgxRGN6Z1hRT3dDa0dseXlMOFAvTGFSNUxKdndWK3FPaEI0TEVq?=
 =?utf-8?B?eUJIRFY0MU9VUjR6bWlKUTlSb29TaDhWZ2dBYlBKZ3p4TGN2TWxEbEFZWnpW?=
 =?utf-8?B?SHA3QVJ4bTRlcWFqckcxNnY4b0xoUXlVS3ovVHV2L01id1dqWnJKbEtob3VG?=
 =?utf-8?B?elFzWVcxdU9Demg2dmRFRkxrQUVLblg5VlYzbVVHMUJ5ay9hUEhseHIxRmJT?=
 =?utf-8?B?L1h1S0xmanowSG1YV3BwWHJmbjBXTXUxdW5PSktidmpLbzhtTmt5UzZvUHFI?=
 =?utf-8?B?SjRLRGhaNkFxWVF3c25HeHBlZWpXeDM3K2VKNmZDM2dBalYxR28rdkFISTZX?=
 =?utf-8?B?TDd1WlkvNmVvRTE5ZjdiZXk0Ulk3TDl1Ylo0SFI0VGwxcVBENlNDcGhPRHhi?=
 =?utf-8?B?VDZ1M0tLTVRBc2F4bXhvbDBlSU9oRG1ZcjZJVUEyVE5yUlZNV0NES1pOWlh6?=
 =?utf-8?B?SDg5Q3ArQTJmOEtoZ3k0Z2VqdS9HZUZKRlFmcnVUL3NWMURvMkNka0RMcGFu?=
 =?utf-8?B?OVUvbFY0QW5qOVpWR1kyWW4zVW9XbEdlRnpIa0FPci9xVTExTXV6S2pjSTNz?=
 =?utf-8?B?V3FoTTVUOWhEVlp5ZlhNR3dsd1NmckJkV3F0cVNLcmdaY2JUSVd2dTYrdXZo?=
 =?utf-8?B?WEJuOUJGS01NVXdVZXdUVGtmanNPUXN5VzdVSWowRzRFc3NiZnVzdkpHSjZr?=
 =?utf-8?B?UTc5Z3VjSnJtZXFpU1hWcDJtck5sUTU5ODZlbjdKYWR3SEptV3hDK3Z3OE9u?=
 =?utf-8?B?Y3F1TzJpVWtSZjNsQU04V2RlYk1XL0pxSTdxVjlpQVREenFxdlpJdzZic3Ra?=
 =?utf-8?B?ZmRFZW9SQ0NoS3kyWHE2RTFwSXFsbUtTY0xzMFNtWFhpTW5XRGJqZS9lMzJ5?=
 =?utf-8?B?czk1d0t3bm1Ob0VtWnczeDlrWkM4azg2d2hLYjg0SUtZY055NFlseEpzMktn?=
 =?utf-8?B?RkNrZnFhVUVhOFBlN3Y4VllWN2hoK1dZN3RJK2FFWkhqMks0STJ3SnhaNExz?=
 =?utf-8?B?amVvVkp4VDRFQ082bVFQQzNWWnVzOVNPQzlpVmthdkdIWDgwRW1pUkkwMWVL?=
 =?utf-8?B?ZHZWdkNiWElLNkNUUTdsVG9YVjRvaDc3UHppeU56WG96TEc3VEhZZEE1WHRy?=
 =?utf-8?B?cWUrL2RUU3pIQVlOc1p0Q3gzZGRNZUY0eGM2MTl5akcxeDExYTMrUzZrZ1dY?=
 =?utf-8?B?TGVmV2FNMlFSTWNsZE1LQWxCQnp0T2pGbzc4VXFOeEU3TGw0Tk1qL2JycStO?=
 =?utf-8?B?d2FzS3oxTlppUkNCMEZ0bXNlVzA3OGhvbFJXS2RJcjBPRkRzNHhzSG56TDk0?=
 =?utf-8?Q?RuyhZgzjdlhhOgxSBjFejEdN8y+4xWQK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0ovNWRscXZ5UisrK1lGTFJuRVhrQ2ZCK2RIaENEQ3FKdEpRYzlBd3BRbUxJ?=
 =?utf-8?B?LzZtS1V4TjdjMVFnUm40b1B0SlJwVlk4Ny9DWlBBOWZoZThWUGsrZk50MGFr?=
 =?utf-8?B?ZnBCbFdUZ3Y4Rlg2bzRNQlAzYnBLV0pobjhRYVBzSU1PUzl6cm1za1VQQUFl?=
 =?utf-8?B?SFdieFdvVWlpWlVacnp0TE16aW9UbW5xT052ZDkvRXRMUWtHY2s0Snhaenpi?=
 =?utf-8?B?SEtETGVxakJBU0F2bkU0cEN6cHhocDJiQ1BWZUR0b2Y0UWRtb2psU0lEWXht?=
 =?utf-8?B?M2gxaFkwNnNVSzMzU1RTOC9nZjloaUlxSWdCakVKdGZTUlJuNjBVYS9DS2lT?=
 =?utf-8?B?ejhLand4dWtpaWdDVTRUY3l3VHEwRWxFYk5LZlI3OXBkS0s3L3FIWEZ0TEl6?=
 =?utf-8?B?ZnBNS2lPU2pUMlgwWWdQZGYrMUErdkNCdlJweDVJZ3Q5cnFha0k5bUlXSVdT?=
 =?utf-8?B?N0F3ZDhNZUxMQjV6cGJsZ09uem44SW9LcWVRaWRLRDRnZExFckJpeU40ZXUw?=
 =?utf-8?B?T2h1cGlwR1hhY0Rkc3AyUXhCV2MvcTQwb01FSVl0ZkJ5SE5DNFBoODQ2WkRp?=
 =?utf-8?B?UCszYUtHOEJ5UExXVXh5ekExUS9TYktXaWRtQThYMWRjVllXd3ExS2VoeHVw?=
 =?utf-8?B?ZUlFdCtYWWpSaTFzV3hKVFBiZWhaUnU1U0xJOHBQbDVKdWFNclhnZ3N4Ykht?=
 =?utf-8?B?ODFucjJqeHZiTlJLWDk2ZC9YTFlJbGFIbVdtdFZwYTNBbHU0ZHlOT0F2STND?=
 =?utf-8?B?Q1hFZnlrbTRhWTV1MzcyU2F6S3lCeVNVeHMwdDE5cTZVVW0xUkptMVNaUmVT?=
 =?utf-8?B?TDBxd2lYdzRQc3ZrZW9YcmMwcUxsT3pwRVNGdVVHK0N0cVI2RmF0aEVQRjQz?=
 =?utf-8?B?UVNYRnRLWFRQZmR0YSs1ejhSN0RhczdxZkttaGpWMU9KZExXUEhYMXIrMnk2?=
 =?utf-8?B?dm8wbjFyZEhxUjFCalZRaEJXbVpsUGhFcmY5amNrT3YvTEZ0bUxtT28rLzdY?=
 =?utf-8?B?NVhQcVkya2RhZUxNM09mbVlUU1g2bnUvR1JuZXVxekFjUzdmRHVZRnJwQUlM?=
 =?utf-8?B?bVk3RWQ2czh4TlB4bmFxTWdKYjNYTmhQQTcrc0hnVGFtODhYTlg2UHlNVy9F?=
 =?utf-8?B?d0V0bHlOSnhTQ05LM0xJSFhXc2NJYlBObEZXQzE4S3oyOFBTaXk3TGtRc0tX?=
 =?utf-8?B?V2xPczRNaTJEdm5hVnJFdkdmTnR5VnB2cTZpQm5rUmQ5cHJnOXlKZDhDY0ho?=
 =?utf-8?B?b2p2RkNZRkhKOStKTi80N3FTUlp5MFNYRWVJT0V0SjYyd3BqNXFaOXY4OEwv?=
 =?utf-8?B?UXZtZ09zWXZ3T1B1S2NsNDR1RTVEU0tNZU43eW9rK0s5bUxXcVhLd2ZtZGR4?=
 =?utf-8?B?ZGl0cDFRd0p5OUZQekk0azZGTUhZaEh0MjNvdU55K3VjUFIydzBwM0g4bEsv?=
 =?utf-8?B?Um9FWTlLamdJMXVwUS9NdmtBSlhraktmTjEyK3QySUJ0ZjhFaGZQWnNXT1E5?=
 =?utf-8?B?ekVKdFpFaC9icXdLcnRRZ1cyZGdJbkx2OEwvRFNlemQ5RGQxMUpFV0hXNDFt?=
 =?utf-8?B?NUxjZEhsZmF0aVI0Rm9BZXR4UElubVpMRHJrakdpajhFQjZVOTZDT0gvSHl1?=
 =?utf-8?B?VHBlN1BjK2E4NTd2YnpqTUlRaWJaWWY4ZXJ5U0VJNXlqTWJxcnQ2Umd2TnRV?=
 =?utf-8?B?VXRJVGJTQlpYTHRVY25OUE5qS0tnc29KMk00bjR4cVBBWlZ5WENHYXExTkxw?=
 =?utf-8?B?MXB3OWpKOUNta2ErTTFwaUtCNk5yWVF3Y3JpaUlYdldEZkVIVDYyTGo5MkIr?=
 =?utf-8?B?RG4ySHYxb3VQYy91YjZPekwzQUdUVklHRlJPejBsM0xhdEZrOTFsR3kyZGxj?=
 =?utf-8?B?VXhTWldTdWw3SVVWNWNjdjdiOFFpYWFqU2c2TFg4UE1PVkJESHZxcG5EeE5s?=
 =?utf-8?B?R0p1N1ErZ0hSNkk3RmlJZ2tJYjVINVd1TjRCSHk3OFRpSVgyUFY5YUVoVjMw?=
 =?utf-8?B?NlluQVU5Z3F6alFjSTFPeDJ2bmlNWGdVNWpXbnZuODU4NE1oV2llWEdoU0Ew?=
 =?utf-8?B?bVRkVE5kclRXeHNmM3hZajk3WWZWWDZqcEdaZWZUY1BwVzRNMjZPU05PNWcr?=
 =?utf-8?B?dTN5VHpkeS9WMXBOcVZsQml4MDNyY1YvWXEzWUc2Z3E5NStjNGRRY2U0VGxQ?=
 =?utf-8?Q?BMgJE5/xlnx29FtCEaXKdoY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed041b39-c771-4797-56cb-08de20fdcee5
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 08:39:20.7322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGNCvGic9UckuEgXjGfbKeY79fI57w6qxI78YWlZOkLhlk5Q6ML0bXAnaDrwmRB0zsmOiWQc3m0L8WmZXDLyCGzlq12zcIQBFaV169CxB+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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



On 11/10/2025 5:39 PM, Jani Nikula wrote:
> On Wed, 05 Nov 2025, Uma Shankar <uma.shankar@intel.com> wrote:
>> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Add helpers to program the 3D LUT registers and arm them.
>>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_color.c    | 57 +++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_color.h    |  2 +
>>   .../drm/i915/display/intel_color_pipeline.c   | 35 +++++++++++-
>>   .../drm/i915/display/intel_color_pipeline.h   |  3 +-
>>   .../drm/i915/display/intel_display_limits.h   |  1 +
>>   .../drm/i915/display/intel_display_types.h    |  2 +-
>>   drivers/gpu/drm/i915/display/intel_plane.c    |  2 +
>>   7 files changed, 97 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
>> index f290432f3c31..ab9e889ce19f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>> @@ -4061,6 +4061,44 @@ xelpd_plane_load_luts(struct intel_dsb *dsb, const struct intel_plane_state *pla
>>   		xelpd_program_plane_post_csc_lut(dsb, plane_state);
>>   }
>>   
>> +static u32 glk_3dlut_10(const struct drm_color_lut32 *color)
>> +{
>> +	return REG_FIELD_PREP(LUT_3D_DATA_RED_MASK, drm_color_lut32_extract(color->red, 10)) |
>> +		REG_FIELD_PREP(LUT_3D_DATA_GREEN_MASK, drm_color_lut32_extract(color->green, 10)) |
>> +		REG_FIELD_PREP(LUT_3D_DATA_BLUE_MASK, drm_color_lut32_extract(color->blue, 10));
>> +}
>> +
>> +static void glk_load_lut_3d(struct intel_dsb *dsb,
>> +			    struct intel_crtc *crtc,
>> +			    const struct drm_property_blob *blob)
>> +{
>> +	struct intel_display *display = to_intel_display(crtc->base.dev);
>> +	const struct drm_color_lut32 *lut = blob->data;
>> +	int i, lut_size = drm_color_lut32_size(blob);
>> +	enum pipe pipe = crtc->pipe;
>> +
>> +	WARN_ON(intel_de_read(display, LUT_3D_CTL(pipe)) & LUT_3D_READY);
> 
> Why?
> 
...

>> +	intel_de_write_dsb(display, dsb, LUT_3D_INDEX(pipe), LUT_3D_AUTO_INCREMENT);
>> +	for (i = 0; i < lut_size; i++)
>> +		intel_de_write_dsb(display, dsb, LUT_3D_DATA(pipe), glk_3dlut_10(&lut[i]));
>> +	intel_de_write_dsb(display, dsb, LUT_3D_INDEX(pipe), 0);
>> +}
>> +
>> +static void glk_lut_3d_commit(struct intel_dsb *dsb, struct intel_crtc *crtc, bool enable)
>> +{
>> +	struct intel_display *display = to_intel_display(crtc);
>> +	enum pipe pipe = crtc->pipe;
>> +	u32 val;
>> +
>> +	WARN_ON(intel_de_read(display, LUT_3D_CTL(pipe)) & LUT_3D_READY);
> 
> Why?
> 

LUT_3D_READY is cleared off by the HW once the LUT buffer is loaded into 
it's internal working RAM.

So by the time we reach here (or above) this bit should be cleared off.
This warn on was added to indicate if we are writing 3DLUT data while 
hardware is still processing previous values.

TOL, we should perhaps move it to the state checker in the same commit 
or poll on it if there are precendance for doing such thing.

==
Chaitanya


>> +
>> +	if (enable)
>> +		val = LUT_3D_ENABLE | LUT_3D_READY | LUT_3D_BIND_PLANE_1;
>> +	else
>> +		val = 0;
>> +	intel_de_write_dsb(display, dsb, LUT_3D_CTL(pipe), val);
>> +}
>> +
>>   static const struct intel_color_funcs chv_color_funcs = {
>>   	.color_check = chv_color_check,
>>   	.color_commit_arm = i9xx_color_commit_arm,
>> @@ -4190,6 +4228,14 @@ static const struct intel_color_funcs ilk_color_funcs = {
>>   	.get_config = ilk_get_config,
>>   };
>>   
>> +void intel_color_plane_commit_arm(struct intel_dsb *dsb,
>> +				  const struct intel_plane_state *plane_state)
>> +{
>> +	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
>> +
>> +	glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
>> +}
>> +
>>   static void
>>   intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
>>   				  const struct intel_plane_state *plane_state)
>> @@ -4210,6 +4256,15 @@ intel_color_load_plane_luts(struct intel_dsb *dsb,
>>   		display->funcs.color->load_plane_luts(dsb, plane_state);
>>   }
>>   
>> +static void
>> +intel_color_load_3dlut(struct intel_dsb *dsb,
>> +		       const struct intel_plane_state *plane_state)
>> +{
>> +	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
>> +
>> +	glk_load_lut_3d(dsb, crtc, plane_state->hw.lut_3d);
>> +}
>> +
>>   void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>>   					const struct intel_plane_state *plane_state)
>>   {
>> @@ -4217,6 +4272,8 @@ void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>>   		intel_color_load_plane_csc_matrix(dsb, plane_state);
>>   	if (plane_state->hw.degamma_lut || plane_state->hw.gamma_lut)
>>   		intel_color_load_plane_luts(dsb, plane_state);
>> +	if (plane_state->hw.lut_3d)
>> +		intel_color_load_3dlut(dsb, plane_state);
>>   }
>>   
>>   void intel_color_crtc_init(struct intel_crtc *crtc)
>> diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
>> index 8051c827a1d8..a70df0c2bd9a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color.h
>> +++ b/drivers/gpu/drm/i915/display/intel_color.h
>> @@ -43,4 +43,6 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
>>   void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
>>   void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>>   					const struct intel_plane_state *plane_state);
>> +void intel_color_plane_commit_arm(struct intel_dsb *dsb,
>> +				  const struct intel_plane_state *plane_state);
>>   #endif /* __INTEL_COLOR_H__ */
>> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> index b6e6ebdd0dff..fd7d63ce6d9f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>> @@ -12,11 +12,24 @@
>>   #define PLANE_DEGAMMA_SIZE 128
>>   #define PLANE_GAMMA_SIZE 32
>>   
>> +static inline bool
>> +intel_crtc_has_lut_3d(struct intel_display *display, enum pipe pipe)
>> +{
>> +	if (DISPLAY_VER(display) >= 12)
>> +		return pipe == PIPE_A || pipe == PIPE_B;
>> +	else if (DISPLAY_VER(display) >= 10 /*|| IS_GEMINILAKE(display)*/)
>> +		return pipe == PIPE_A;
>> +	else
>> +		return false;
>> +}
>> +
>>   static
>> -int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
>> +int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_enum_list *list,
>> +				     enum pipe pipe)
>>   {
>>   	struct intel_colorop *colorop;
>>   	struct drm_device *dev = plane->dev;
>> +	struct intel_display *display = to_intel_display(dev);
>>   	int ret;
>>   	struct drm_colorop *prev_op;
>>   
>> @@ -36,6 +49,22 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
>>   	/* TODO: handle failures and clean up */
>>   	prev_op = &colorop->base;
>>   
>> +	if (DISPLAY_VER(display) >= 35 &&
>> +	    intel_crtc_has_lut_3d(display, pipe) &&
>> +	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
>> +		colorop = intel_colorop_create(INTEL_PLANE_CB_3DLUT);
>> +
>> +		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, plane, 17,
>> +						   DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>> +						   true);
>> +		if (ret)
>> +			return ret;
>> +
>> +		drm_colorop_set_next_property(prev_op, &colorop->base);
>> +
>> +		prev_op = &colorop->base;
>> +	}
>> +
>>   	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
>>   	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
>>   					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> @@ -58,7 +87,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
>>   	return 0;
>>   }
>>   
>> -int intel_color_pipeline_plane_init(struct drm_plane *plane)
>> +int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe pipe)
>>   {
>>   	struct drm_device *dev = plane->dev;
>>   	struct intel_display *display = to_intel_display(dev);
>> @@ -77,7 +106,7 @@ int intel_color_pipeline_plane_init(struct drm_plane *plane)
>>   	len++;
>>   
>>   	/* Add pipeline consisting of transfer functions */
>> -	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len]);
>> +	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len], pipe);
>>   	if (ret)
>>   		return ret;
>>   	len++;
>> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.h b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
>> index 7f1d32bc9202..a457d306da7f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.h
>> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
>> @@ -7,7 +7,8 @@
>>   #define __INTEL_COLOR_PIPELINE_H__
>>   
>>   struct drm_plane;
>> +enum pipe;
>>   
>> -int intel_color_pipeline_plane_init(struct drm_plane *plane);
>> +int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe pipe);
>>   
>>   #endif /* __INTEL_COLOR_PIPELINE_H__ */
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/drivers/gpu/drm/i915/display/intel_display_limits.h
>> index 55fd574ba313..cb3c9c665c44 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_limits.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
>> @@ -142,6 +142,7 @@ enum intel_color_block {
>>   	INTEL_PLANE_CB_PRE_CSC_LUT,
>>   	INTEL_PLANE_CB_CSC,
>>   	INTEL_PLANE_CB_POST_CSC_LUT,
>> +	INTEL_PLANE_CB_3DLUT,
>>   
>>   	INTEL_CB_MAX
>>   };
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index d8fe80a55601..50a14f75b727 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -646,7 +646,7 @@ struct intel_plane_state {
>>   		enum drm_color_encoding color_encoding;
>>   		enum drm_color_range color_range;
>>   		enum drm_scaling_filter scaling_filter;
>> -		struct drm_property_blob *ctm, *degamma_lut, *gamma_lut;
>> +		struct drm_property_blob *ctm, *degamma_lut, *gamma_lut, *lut_3d;
>>   	} hw;
>>   
>>   	struct i915_vma *ggtt_vma;
>> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
>> index 298f8e186fee..7c230a2832c2 100644
>> --- a/drivers/gpu/drm/i915/display/intel_plane.c
>> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
>> @@ -348,6 +348,8 @@ intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
>>   		return	drm_property_replace_blob(&plane_state->hw.degamma_lut, blob);
>>   	else if (intel_colorop->id == INTEL_PLANE_CB_POST_CSC_LUT)
>>   		return drm_property_replace_blob(&plane_state->hw.gamma_lut, blob);
>> +	else if (intel_colorop->id == INTEL_PLANE_CB_3DLUT)
>> +		return	drm_property_replace_blob(&plane_state->hw.lut_3d, blob);
>>   
>>   	return false;
>>   }
> 

