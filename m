Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFEDC363FC
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF6F10E792;
	Wed,  5 Nov 2025 15:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIgyMBWF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D6110E790;
 Wed,  5 Nov 2025 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355538; x=1793891538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=otOpvSHiHtEJ+FH4psfrlx9fOE9ZLUrrjBgq8ajvId0=;
 b=QIgyMBWF28QD16kn7UsU2Rh7nMyA5wzQE5O7fNwoYzUBAxsjc8XeXNdT
 JkyvaS/yFFaTVMoPizRBWNRwqEDs7T9WVivc/vujDJk4E8sSxIY3iwc3T
 VrNOnxolSzR6Rb3xMR2KsCIozfeMBYy2NA89z0dwRPbX+NtARhd9KuvWz
 I2wjPa6JDMlif8fXcjGfCWmpqrE9UJXKmryUzMQVZuwrqp1GsCWmumSVS
 orrRrKS8SqMQgTHGVkUPZGSCX7KGLcd8f5mybxXzXeZ9RRF9M8HlpqqJD
 rnDjN+5uqce5Z5mjTdBTAG9Psj1V8Zl73g/Q0hBgiik0hXzEIYuNTXOsl w==;
X-CSE-ConnectionGUID: Apd3xKBwS9mVjHivjnQO5A==
X-CSE-MsgGUID: bZthVN5qRZOOuDRQnE+rmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75922122"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="75922122"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:16 -0800
X-CSE-ConnectionGUID: B8KVv4vuSzSku8cM2idCoQ==
X-CSE-MsgGUID: F/PwFHK9TVq8rC8+pzCobQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="186766518"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:12:16 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:12:15 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:12:15 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:12:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHHPRmRdPTILqkJtLwU5F+QgnhAA8RQvOCyr7sf0so2jKpRkiONfgzL/bTmdirSeoyoSPs6QzDhpY/upa20vu15epDh/w24So+XZigrovwDke2V3a8em/pCRscjPmxayY7jWaFePAgxaOXwKhECByutetPuyCRBwRexPIhjB22e5f2Ex4Ib8cRCwpEFwk9KSkErxj3hf9BZyfpb4qO0Dj5nzUpUQip03i2gsCBHn2wAdCyjkUpWwP5S2i9P9tFFIk0Kr/wlxgqjzzPMiPCBnIGMjoPrWgNuCKD0yMBvOUVmeXW4mShh1nUVlZfOV5dZRKM97yX/3XyNNFA6hZFEwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4dQVkffAi5gYrgLYPlQVBsLw3jn2mQe4aAjoZXShf0=;
 b=eQHZPV9CFBiWGmbI2ZMWd7i9ZGK3omgs77Yin+0Gk7Ufr7fpNs5hKEZijRFiyFfClSm55GJZB188SY2KKyMOiCKGJo9isdav6l6R7S+HATAz16W0DCMBHKFKDCTeFpUwjBLaK/h7HhnGnj471A5hjo+rgLfx4hfxYRNCKzQI2uUBHqeJd3x4TrqUczbYQqpW1/31xPnEX0sZe5vuMSgFeH3w7nl+3686xDlKBS8xTSvnDbXMLh+5nTVnTD9Be4EpeqOngzJc9a+Tx66l6GXRlzKIaGHOnVkvDaAnJdrqJ90W8ZP01A8In3XpYj4x9PTej/U0Q2wVODfHTvYE8K6ROg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.9; Wed, 5 Nov 2025 15:12:12 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:12:12 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v4 17/28] drm/xe/pf: Add helpers for VF GGTT migration data
 handling
Date: Wed, 5 Nov 2025 16:10:15 +0100
Message-ID: <20251105151027.540712-18-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 7410b0b2-ad2d-4d7a-88fe-08de1c7db262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVd3ckJMUkZMeWJaL0UxUWoxSXBNQUpRSzVaNDRKVXd4TTRkNnFydWZJN3pE?=
 =?utf-8?B?MytMcnZhNXpEdjY4VmNBS25lQmxLU0dWdUpOOGIzR0JMRDNwRGZKVUhNVmZJ?=
 =?utf-8?B?TUlTZ0xueEdYV1VwL3NyU2NBZEdmMExnRWR2UzRsalF2VHlYSmpGbHFCMVBS?=
 =?utf-8?B?Qjh0S0NaZXVURXV2Ny9jSkxXVjdRaW1IZ2VwUnFuT3BOMDY1Mm9KbnFsZ3Bz?=
 =?utf-8?B?dlhnMENiSnZoRTZwYUUxQTRwV0t4K3dtZStvZWJadERFU1dhV2Y1NkJrM1pj?=
 =?utf-8?B?YkVWbFpMRW16RHBNaWc3R3lNRWVPRDQ4emhiSHF2QTh2ZWUxVFZVb09uWDFr?=
 =?utf-8?B?ek1sQ0treVlNck5BMFVVUlA3Q1VZYTZzOVVZV25Qcm45VEpkckRaTDN5czQr?=
 =?utf-8?B?SURsQTVJTEx6cy84QUhDZmxkMFkxTFRuVjJHeHJ1cG9UUjRNalNNZHEyREQ4?=
 =?utf-8?B?MzRkODZTODllQ1ZxSVlmY0VoVjQ4NE12UjBoTVdhR2R4YXZoRHdnV1Q2Rk5r?=
 =?utf-8?B?UlhFNmE1cVJyK0drN0ZOM3hsbWpEQ0U2dTl6Zm9rdlJ3bWwwVVJtbDQ1NFpV?=
 =?utf-8?B?c2hXZ1NnZCtSYW5mc3dyY0dPVGpsRnZWYkpVai8ySzhpNVF4WTBqUDEwNFps?=
 =?utf-8?B?YnlObmQ3TmdKZWdpeHNqZ1g2NVdKanJUOHN5aTNZVzlaZXcxVERwQUtZblBV?=
 =?utf-8?B?S0tsMUJHbVUzZkliNlZVY1BxeWhCbEgxb3NMTWJ5M3dweVdhcllJOW5qNEpa?=
 =?utf-8?B?S2lhY05QeDA2ZHZRUjJXQmE5OFc4Z2ptQUZTUEIzWVVpMUt5UUlBcU8ycWt2?=
 =?utf-8?B?Z0U4UXFQbFcxZ3BsS09ERDkycEh4ZTJNNjhkSzBBYWhxYXAwbkN3c3VXRXo5?=
 =?utf-8?B?MUJMOEdTa2lPUzJNYmxwRGd0cnZoTFNBSVBndmdndWxtOTJpRm9GL2ZHVWdL?=
 =?utf-8?B?dDRhNmpWOUJsR0dIUVdFN0xPWU9pb3NmbWZlckwyN3lIWEdXWXdlQXpTekFR?=
 =?utf-8?B?Q0Z1dVBHR3NIa1VsZm1vRXBySDZZdWI4SFFudDNFVXJOZlY2bEd3c28rZDhF?=
 =?utf-8?B?TFhSN00yMVoweDNHNk43T09IY2NPd0JPb2piKzdzbUMvSTlyYW1rUk9rK1Yz?=
 =?utf-8?B?cXZFYUVKS3dlb3VWdDZFQ1dBSkVtcXFzYk5CTksyUkMzbTNBRUJqb0U4Tmcy?=
 =?utf-8?B?WXEwenREWkRuUUh3M1dJYVFBcWN6bjl4YnE0Nlo0aGhsaDduOU15ellQcy9E?=
 =?utf-8?B?UkVwcEJoZzYyMnd1M2c5SXh6UTA4RXBNYXhTNkRWSXlkOWxVeDlYSGR2RThw?=
 =?utf-8?B?Qng3ZmNUMzJFa2V0Qmd3L0lYU0ZjRVRWR0NWUFZGK3JHVlhoampWL1l2N0Ez?=
 =?utf-8?B?QWUzQ2tyb1lSMjNpMFZEenlqS1NDSlJHazcrRndLOUs1bUpNaWs1ZG92QUJw?=
 =?utf-8?B?K3hvU1IyQ2RwL0k4djNqUE1rQk8xbU1iYUZveFB1UCtMR0NHSHF2eUNRRE83?=
 =?utf-8?B?eDZLZWNqSlV2YVpEejdJYzRtc2dGTysyVFBkTDhXUUNsS1dUby82NGQ3YzY5?=
 =?utf-8?B?Q0VDc0tHMDQ3d1ZBczhCRWRWSmc0VzA2VlkxQ2w2SVNYM3VrRWFjSnRiOHhD?=
 =?utf-8?B?dWVtcDFJTy9ETzdWbWVWa3dHR3NDcWJYZ2R4ekFXR2dIOFJ6MTdoS0pJTndi?=
 =?utf-8?B?aXVuTnUzcU0yTEJTMU1VT1BFdjlXTnVHT3JDZWU5emxINVpRSzFoYXQwL21z?=
 =?utf-8?B?RXFrYzdBaUM1c01meS9kMVFmbS9qR01TTEliOXNVRDhNM1Z3aWxpd2RKV3Vi?=
 =?utf-8?B?bktOazgrZjhkVmxBSk83OHVucDZVTG5SZmJMeWNrYjdJRE5JU1R4WGN6eXR1?=
 =?utf-8?B?d0JUaktKVXN6SnhKeVNUekt3TkxscUd6TG1FMVFabU5qeU15RVl0ZERLT3Vl?=
 =?utf-8?B?Q3BRd3pyOEdWRjRhVzhaeldIZmlJT2RxSmxPM2pmbWkzc0tGWUNuWTdxYS9X?=
 =?utf-8?Q?xPQcVY+9RVwNQGlyhoArMjWM2YEXmQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3E2dU5LSFo4WmNOUUZ5cTFkVnF3Q3RSbjhxVWtXOE90RWIyeG1tZ2l2bFpy?=
 =?utf-8?B?WlYxd2I0Q1dBUzZNcGtFK3Z6b0lNT1hscGJsaUs3WWhDbTM1Q204NW1yZzZ6?=
 =?utf-8?B?SDk4Uk5McjhwQU4vdllxSmFqUEdTemhHTzJDMmFacU5oRVVkZmdMUitlR3A2?=
 =?utf-8?B?Zm9XamNhb3lOVEtTS0p5QTh4SGdPNmhOWnFvN25UcVZJQlVMNkZsUEdtZkQ5?=
 =?utf-8?B?Y2Q1TEhhRGFuczhVdjJFaFR0eGh5ZWpzUnlIQmxnYTJYQ1FFenNnY0JzSXVP?=
 =?utf-8?B?U295Zko2WGNWWDFtRnVVdzk5MTlsN3ZwK1gyNjJLUi9xUUpzenVLSzJBMEZs?=
 =?utf-8?B?K0lQa3lmaUxVUFU4NE42UVhHUXJ2NGp4U3JKVDAzdjJpL1JKT0dFVHhSUURB?=
 =?utf-8?B?QmZFaXE1eGF0UE93OGUxNDVSb1BBcEMrZkRZRHdvQk13bHphVlhheGl1dHdF?=
 =?utf-8?B?cE0rb1JMcmVYbE0wTDJHZDZHd2lOZzRaajN6bXUzWVBaZ3d4cS9NKzA5Q0t0?=
 =?utf-8?B?TnZUTkxTSUJwdEM0QjRwQmgrbXRKTmQ3bHJxMU9jRFdQZy84cDhDRDJJQXRn?=
 =?utf-8?B?NWt2WGRMM3I4UEdqUS9hZ0Z4QkhZd3BlaGFEc3VaMVU0NWlLS2RDY2FRZ3VB?=
 =?utf-8?B?emhRQlRzN3VtSVZQUFE1QlA0RUhZQmFGOTRSdDNSdUdldDdldkFNNWxMbUFL?=
 =?utf-8?B?bHN4bUdHNkdhek5LY3hxeTJTSzkya2hvVmN0ZWlTd3UvcFZDWUREdTJ5MGlN?=
 =?utf-8?B?UTFlbEpPYlM4bFZKYTNIL3ZTY3phdlMwWmxOQ20raGkxMjhMTlRLYzVTdzFY?=
 =?utf-8?B?Q2pybDhQUUNnbGQ4TVEyNG5ObFlDTG1mUUxBTjlmb04yakd1NWhodEMyZG1D?=
 =?utf-8?B?UW1ZYndqbncyMUcrQUJ0TnBsMTdWSGg4MlBYNkNRWHdab0N6bVpPdjlxazZh?=
 =?utf-8?B?ZjVBZ2NsVE41OThEZGJRQ0c1OWxJOExRUllHK3g4MlRlRE1lbDNZOWdKNmRa?=
 =?utf-8?B?OHZkWittcDRSUkt3alNRV01FblhSczNUTG0wQjFqSU52MSt2Y2FhS05WZ1ND?=
 =?utf-8?B?eElIUjFnckxRNTRmUG5ZRlAvRE45amxQbWVsK1Nac3ZqZkkrNmVoQTdUKzZP?=
 =?utf-8?B?S09ETjJiZFg1NWlMUzFHVnpXNXZucHJQdVhrNnQ0SklETnRXSGk0SnRJNG1t?=
 =?utf-8?B?T0tSbVhQWXhRMFUwK09qNUZwYk92Vk4yZjcwc0dWbGFDb1BzSTZTdU1JdG0y?=
 =?utf-8?B?YTdLdG5FV0tnQ2d0VUZjajVDTW0zK09GSzB6V3YvR0lmLzRmT05aaUFKUnpl?=
 =?utf-8?B?ZDhpeEtvblZKRjNTczA5bUZMZVROaGQ0RFpVM2FrWE0yN2d4WW5uWU11SlFG?=
 =?utf-8?B?UXRYVk9oOU9Hb083RlI3VzhoaS9hNkk3Sm11RlpMMjNUMEpSdEJiaVVRNU5n?=
 =?utf-8?B?M3NGWVFlU0lpTXRzNWlVNkFaRlR1K0l0WHhrQXRLWHhoY0Z0Z09ORGpodjFG?=
 =?utf-8?B?U1Z0NG81Zzl5NFRYbE5aZk1QSklzZmlNRjRKUDhwTHJFRjZicm40Q010bHh5?=
 =?utf-8?B?YVEwczM3OFZGWGErM1VXY29mQ3JGMXBjdEhYeldvZGtEeVEwSEpxTVlCUWJW?=
 =?utf-8?B?dG50VVBGVmVhd25hT0RvWFJsNFZhRzJJb1QwWi9lbENveHJjTk1Ld0dYaVM5?=
 =?utf-8?B?VFRJRGlDd0tNTGpSSDFKR3FVU2NYZGdUU0s3RzFRUFUways0VThIVG44ZFFs?=
 =?utf-8?B?ak9lbzV5cjVoUi93eFpTY2tJZDVxTjZoK1g5bXJQd3FTWFl1MWtPSWNmemNQ?=
 =?utf-8?B?OFZpMGxSdHhiQ3VEeXhqaEJxaFZvZTZHc2Q3eU4zVTNsRFBPM2liVVFwYmcv?=
 =?utf-8?B?N2xFWStsZ1F3UnpEVzA4WFV6dHBwUVVlSngya3hMUEx3R1ljbUsvUWNGbkxm?=
 =?utf-8?B?NnVWV2IxbHBqci9EckdOSjZrNWk5ZHkvU0hxdVhSUjRiWEl5QWVTRTBNWFNW?=
 =?utf-8?B?enBvRXBBL1BEbzlxRFF6WjNianNjNXhoaDJoTU5YY2VSOWVkekQ1TjdhcXVx?=
 =?utf-8?B?TUVoU3AzbDRTbVRYd3QzN1FMRTdudkFGdjhGeHgyWXU5ZnRjTjhVbWVhYyts?=
 =?utf-8?B?b2RxM2gwUXRGUmlLU25CYkEraTBnREF6UUZtbExtZzE1dlc4c3k3QjJOTG1j?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7410b0b2-ad2d-4d7a-88fe-08de1c7db262
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:12:12.6102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkhD9npn8TSN3Dxee2WccYqP7Sh/EZgum19uOmKHg3PWPIyiFIQ4G9vcRwq1B1oZCyfm6V3BLu3250bsBW3+v2BfXGRvEwwn9e1TRW7/u04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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

In an upcoming change, the VF GGTT migration data will be handled as
part of VF control state machine. Add the necessary helpers to allow the
migration data transfer to/from the HW GGTT resource.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 104 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |   4 +
 drivers/gpu/drm/xe/xe_ggtt_types.h         |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  52 +++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   5 +
 5 files changed, 167 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 20d226d90c50f..2c4f752d76996 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -151,6 +151,14 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 	ggtt_update_access_counter(ggtt);
 }
 
+static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
+{
+	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
+	xe_tile_assert(ggtt->tile, addr < ggtt->size);
+
+	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
+}
+
 static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
@@ -233,16 +241,19 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
 static const struct xe_ggtt_pt_ops xelp_pt_ops = {
 	.pte_encode_flags = xelp_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
 	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
@@ -889,6 +900,20 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare)
 	return max_hole;
 }
 
+/**
+ * xe_ggtt_node_pt_size() - Convert GGTT node size to its page table entries size.
+ * @node: the &xe_ggtt_node
+ *
+ * Return: GGTT node page table entries size in bytes.
+ */
+size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node)
+{
+	if (!node)
+		return 0;
+
+	return node->base.size / XE_PAGE_SIZE * sizeof(u64);
+}
+
 #ifdef CONFIG_PCI_IOV
 static u64 xe_encode_vfid_pte(u16 vfid)
 {
@@ -930,6 +955,85 @@ void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
 	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
 	mutex_unlock(&node->ggtt->lock);
 }
+
+/**
+ * xe_ggtt_node_save() - Save a &xe_ggtt_node to a buffer.
+ * @node: the &xe_ggtt_node to be saved
+ * @dst: destination buffer
+ * @size: destination buffer size in bytes
+ * @vfid: VF identifier
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid)
+{
+	struct xe_ggtt *ggtt;
+	u64 start, end;
+	u64 *buf = dst;
+	u64 pte;
+
+	if (!node)
+		return -ENOENT;
+
+	guard(mutex)(&node->ggtt->lock);
+
+	if (xe_ggtt_node_pt_size(node) != size)
+		return -EINVAL;
+
+	ggtt = node->ggtt;
+	start = node->base.start;
+	end = start + node->base.size - 1;
+
+	while (start < end) {
+		pte = ggtt->pt_ops->ggtt_get_pte(ggtt, start);
+		if (vfid != u64_get_bits(pte, GGTT_PTE_VFID))
+			return -EPERM;
+
+		*buf++ = u64_replace_bits(pte, 0, GGTT_PTE_VFID);
+		start += XE_PAGE_SIZE;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_ggtt_node_load() - Load a &xe_ggtt_node from a buffer.
+ * @node: the &xe_ggtt_node to be loaded
+ * @src: source buffer
+ * @size: source buffer size in bytes
+ * @vfid: VF identifier
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid)
+{
+	u64 vfid_pte = xe_encode_vfid_pte(vfid);
+	const u64 *buf = src;
+	struct xe_ggtt *ggtt;
+	u64 start, end;
+
+	if (!node)
+		return -ENOENT;
+
+	guard(mutex)(&node->ggtt->lock);
+
+	if (xe_ggtt_node_pt_size(node) != size)
+		return -EINVAL;
+
+	ggtt = node->ggtt;
+	start = node->base.start;
+	end = start + node->base.size - 1;
+
+	while (start < end) {
+		vfid_pte = u64_replace_bits(*buf++, vfid, GGTT_PTE_VFID);
+		ggtt->pt_ops->ggtt_set_pte(ggtt, start, vfid_pte);
+		start += XE_PAGE_SIZE;
+	}
+	xe_ggtt_invalidate(ggtt);
+
+	return 0;
+}
+
 #endif
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 75fc7a1efea76..1edf27608d39a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -41,8 +41,12 @@ u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 
+size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node);
+
 #ifdef CONFIG_PCI_IOV
 void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
+int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfid);
+int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
 #endif
 
 #ifndef CONFIG_LOCKDEP
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index c5e999d58ff2a..dacd796f81844 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -78,6 +78,8 @@ struct xe_ggtt_pt_ops {
 	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
 	/** @ggtt_set_pte: Directly write into GGTT's PTE */
 	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
+	/** @ggtt_get_pte: Directly read from GGTT's PTE */
+	u64 (*ggtt_get_pte)(struct xe_ggtt *ggtt, u64 addr);
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index d90261a7ab7ca..2786f516a9440 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -726,6 +726,58 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
 	return xe_gt_sriov_pf_config_bulk_set_ggtt(gt, vfid, num_vfs, fair);
 }
 
+/**
+ * xe_gt_sriov_pf_config_ggtt_save() - Save a VF provisioned GGTT data into a buffer.
+ * @gt: the &xe_gt
+ * @vfid: VF identifier (can't be 0)
+ * @buf: the GGTT data destination buffer (or NULL to query the buf size)
+ * @size: the size of the buffer (or 0 to query the buf size)
+ *
+ * This function can only be called on PF.
+ *
+ * Return: size of the buffer needed to save GGTT data if querying,
+ *         0 on successful save or a negative error code on failure.
+ */
+ssize_t xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
+					void *buf, size_t size)
+{
+	struct xe_ggtt_node *node;
+
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid);
+	xe_gt_assert(gt, !(!buf ^ !size));
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+	node = pf_pick_vf_config(gt, vfid)->ggtt_region;
+
+	if (!buf)
+		return xe_ggtt_node_pt_size(node);
+
+	return xe_ggtt_node_save(node, buf, size, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_config_ggtt_restore() - Restore a VF provisioned GGTT data from a buffer.
+ * @gt: the &xe_gt
+ * @vfid: VF identifier (can't be 0)
+ * @buf: the GGTT data source buffer
+ * @size: the size of the buffer
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+				       const void *buf, size_t size)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid);
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_ggtt_node_load(pf_pick_vf_config(gt, vfid)->ggtt_region, buf, size, vfid);
+}
+
 static u32 pf_get_min_spare_ctxs(struct xe_gt *gt)
 {
 	/* XXX: preliminary */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 14d036790695d..66223c0e948db 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -71,6 +71,11 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
 int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
 				  const void *buf, size_t size);
 
+ssize_t xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
+					void *buf, size_t size);
+int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+				       const void *buf, size_t size);
+
 bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
 
 int xe_gt_sriov_pf_config_init(struct xe_gt *gt);
-- 
2.51.2

