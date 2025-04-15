Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A057AA89B9D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 13:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A1610E73C;
	Tue, 15 Apr 2025 11:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOHmuA2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA68910E73C;
 Tue, 15 Apr 2025 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744715598; x=1776251598;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5lXDC12oLLuh/8k0ikHs8F8gurrK4f8qvVcHJQfJ5+M=;
 b=EOHmuA2AWg8Cy6JkqgBLnTM2Jva1UoyoDIMZbb/FPF1K/++IOHccLby5
 +Je+YbtdfbsF6GnT/iuCc5szmRF9NwdN/R4twqhlaMwwRZzpPg9qM4WCA
 GFlf7GL/zEhqxb0i9Frt8K3U0KRSIAm0uCGOmAYyx+uBK4u1fFm5qXVLP
 4LUrM4Ll4q06E3FdYnS74L7K4sr5Qra6SjD6/W9gOeyIbKs6HRMytPqlA
 dlezm70q3OYh0Ffn3mpov85cGsTJyD+Akrvd4401vqAOQiOly3rofobvW
 kZ6Et4FcMJr1beByxYV16o8Fd+9XjyMSd/Ap9Uxma8ARrSidogBhC4plG w==;
X-CSE-ConnectionGUID: zlekZzjDQW2A0pdfUzgGQA==
X-CSE-MsgGUID: XrdLL7YAQqCidKGrf1iM8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45451699"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45451699"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:13:17 -0700
X-CSE-ConnectionGUID: 43ziDSd6Qsqaqb7jw5kcwA==
X-CSE-MsgGUID: yStaLBXFQH6XyOaq7W363g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="134188525"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:13:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 04:13:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 04:13:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 04:13:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2XiztvUwbuvHjqsnA9J+V8an0iicxoMIlKKDQSYzvGf4ouAoYlN4vGG7M0lEv2n0A786mUM/37zjpwj2dmcXAIQCq2oVRqSQ4ZWiAwEaXDEQzaJ7Ej3M56z8uqptahB/C6ATWLEuU8jPSugfwh9FZi3ZmIMXzBJkZ9qtMeKwWeVA5dEn4HFIt4FI0nmWgDAmQGX91MTBLSxCbSxm8xkDAmsszvfiob3rTc+kX5YiK72TILDGch3RcRmMd9cm2JivUG+RTyRc65Rv7d/PIibNdf+l9WJadJuLo6a/kcVS/LAwgVgfqYBil3hRp1KjRpwoKUPBhnliYkoBZ23Cq4dog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHhQrgeom6XaqL5mqOWUXj5e2tTDlGPsuzdyqBzUmcw=;
 b=GZqA34sTccR9gh8DRPNmLvPeMOAH2gruV0zjeaao3poYNnlwYNPRXsGuPj5+vMFAvwUS426BXmne6AYiElA+eJtQL6nNyTAQJ7qMGDVNOF7G0Y+7sx8jSxh3IzKFLReMWNbhx032Hvcai6OagO1gFu/ESDhoDoU9Cv+j7SpyHqTuakYy9vKNAxwqrdNffUCeFbAlrcsnpnusLYQlkEKI2PNKmcPuZ2lDQ+5IlxaLLctygB7zpVfM8O6qNlcMVQ7+cTEsSxJHWtcuQDVFFHBAZLqB1bbOdp9+JDyGQW6Ar5nvnOAEb9MaAdFDdKi79JnLH/FTT3H65sUj+nDbVojD2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by BL1PR11MB5269.namprd11.prod.outlook.com (2603:10b6:208:310::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 11:13:08 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 11:13:07 +0000
Message-ID: <8e373d60-6dc1-4b48-af99-e0a0d3a324cc@intel.com>
Date: Tue, 15 Apr 2025 16:42:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 06/43] drm/colorop: Add 1D Curve subtype
Content-Language: en-GB
To: Daniel Stone <daniel@fooishbar.org>, Simon Ser <contact@emersion.fr>
CC: Alex Hung <alex.hung@amd.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <wayland-devel@lists.freedesktop.org>,
 <harry.wentland@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>, 
 <pekka.paalanen@collabora.com>, <mwen@igalia.com>, <jadahl@redhat.com>,
 <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>, <agoins@nvidia.com>,
 <joshua@froggi.es>, <mdaenzer@redhat.com>, <aleixpol@kde.org>,
 <xaver.hugl@gmail.com>, <victoria@system76.com>, <daniel@ffwll.ch>,
 <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <louis.chauvet@bootlin.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-7-alex.hung@amd.com>
 <CAPj87rOh=1OuASau+fjL_z+XBs-P=jUiQgjJjWXQZt1FYFC==w@mail.gmail.com>
 <46R4JuwCeyu56R2FsAN-j6n0Pu5VSeLdju8KUycQ3PF5cVQrlUO3C5SX8CgpRJ-QL5_-XS2ds94pPjhzEl6hOo3iyLl0y_d0Syzinn7BxSY=@emersion.fr>
 <CAPj87rOpp8CE_kmcJmp69pM5NhxBkLOGp-BKdALX4F8GL5-29Q@mail.gmail.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <CAPj87rOpp8CE_kmcJmp69pM5NhxBkLOGp-BKdALX4F8GL5-29Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::17) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|BL1PR11MB5269:EE_
X-MS-Office365-Filtering-Correlation-Id: 383f0fed-f09e-4775-d0bb-08dd7c0e7f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmJTVGZxRzJsSCtkK0cvWlBFcGg3MzZ2UFNNWk5GbUlDUHhleUlTcXBtT2JC?=
 =?utf-8?B?L3pXRy9PWEIxTWdWbEdxSDh3U2xjL1lsKzdxeEIwM0lkWHdCVTZzeVhHS0I5?=
 =?utf-8?B?V3NQKys3UitSWDhTaEw4WEVpcEtyM2RlWjV1RFNVRVV4ZGd5NlIrZXZJK1pC?=
 =?utf-8?B?dWFpUE1pbEdrTjJXM3BSY0U3TTNudnBNbkZ6R2RaejUyZ2h2cmNlU3plZXpt?=
 =?utf-8?B?bjlZUVlQR2oxc1FMaVRHSDMvR2gzZEJFYmpmRURSMzY2cldoRHZHY2lkZlVu?=
 =?utf-8?B?eUNjdXAyUTFpTy95Z29VV1YwY3RQekVlUm9KUmJtNCs3Q0VJYU9uMkdyZ2pu?=
 =?utf-8?B?YmpGcEd4bi95aXc2cG1KdVVTUW5WR2xNV0owWWtTSFhmdWh0NWxhcnkzQUE1?=
 =?utf-8?B?Z2lweU5XZGtoR1lDZ2F6TElpL1VFc09ySTRER0ZhNVhDcWVFdlRJRGprSy9v?=
 =?utf-8?B?TVRHNnhMaWxZU3pRaDFqV2xSOFdXa2puaFhudTZmekgyMXZTRllJaStTQThW?=
 =?utf-8?B?MEtPOER4aWVBWnYvN1VXeHBtcmtYVzM3WkhGeDA3MDVXT0tDZVJGS0VIdnEz?=
 =?utf-8?B?NVREd1RVM1JKRnNGNkkwTWkzZis0K1Y0U0pYL0pxdElDeG82T3ZGSDE5QzZG?=
 =?utf-8?B?eXNjMU05anQzRjNYNEpZbjlmYTM3ZnJGWVhNMldGaFdNSkwyUHJhWUd5S1gr?=
 =?utf-8?B?NGc4N3hETGI0M0JkV0I4L2FSMkRBQkloRDRqU2FQbWZvVnBpeDVVMkFJK1hv?=
 =?utf-8?B?eFU0OG1Gb2pLbVZKTkZERERzYTBNdVUybXZWWEpnZzJWRnYyUlZNWEhFS3pw?=
 =?utf-8?B?eXV0T0ZaOGpZRCtmZFRaaFBqVE40d1ZubmN0ZnlPVHNRWGg5N1MreHRqdWc5?=
 =?utf-8?B?SVlld0hTbytYM2lSbGE3ZWFBOC9WY3dkUHN0dTlUUVdzUWE0S1NaRDIxeVBl?=
 =?utf-8?B?QVowclF6MjBUL3p5WUdzOGNpV0Vndzc4ZDVWMi9NYXNyTXB5ZXNmd1lEb3Vn?=
 =?utf-8?B?U20wSWFlcTZ1SS9BWDZPQTJRd0JnZU00N3VXMklzNWJ3QThPazZheE4wUHZX?=
 =?utf-8?B?Zklwa1MwMGt3bEZad2tPWDRwYTRDTzB2RjNTaW5FR0Evcy9HRi8wczNERzBI?=
 =?utf-8?B?WThVZm9MSTVUWVkvS3hhUHdkMXVxSFhjT2pLc1VUVTVoR01pdmh4a2JSdTlF?=
 =?utf-8?B?b1dTYStRM3JHaFUvbmxXRkdwdk1qUEtOVE9VeC9ZbVFuWDkrOW96L2toZUNj?=
 =?utf-8?B?bkxqU0Y0cklVSS9MSzQweTMvQ3pLM2lFZGFkRjg0dFlSOURDRU9lc3llYjZ3?=
 =?utf-8?B?WitKVlpoV0xweENscExleXIrT1UyOFNjWDZEbWg4WmdaNlJDRnhIN0N3NUh0?=
 =?utf-8?B?RzcxeHVFL21GMWdYQjE4S1lYYUZhdFFBbnBJdHFaSFpuY0pyc3NRRGRVb0h2?=
 =?utf-8?B?TGZQVlZJZEZTajFNTWg2Sk81M0tuU2RnQ2NzbjNJcElRdUVNbkRwQ1lIR3ZI?=
 =?utf-8?B?VVIrTzdqSWduVUR3c0ZHaDNzaDlOelVvamtuVkNPNHNMSmhMUjFmT1c0YWVZ?=
 =?utf-8?B?UXNmcGRDMjh1ZkE1OFFRcmZDNHNpSjBTcTB4TnZ2b3JHQzd5cE5mVW1sNTl4?=
 =?utf-8?B?b0dwVUk1UjZLQjd5WURtNUY2dVlwUE40UjcvMjZ3ci9jVWFLdTNMQjZDYTR5?=
 =?utf-8?B?b21hQjRjbHhScnhoakZxQW9xcVhlWTU4Y2ZWVUs1L0J6MVNTOE5GbzVRZUta?=
 =?utf-8?B?dTZlQk9vV0NwSHBOdTJRQTBuZW1GQWdTa2xKM0dBdjZHN3kwWUZZY3FJNS9P?=
 =?utf-8?B?MTE3a2ZiSnRSK0lXSnBzdE90dTNOTWtScTJmVTNRVUIxZjlNcTlGeHFKV0E0?=
 =?utf-8?B?djhxbzZVTzBIUTBRek1CeXFmRUdmd0M0VW0vSExreURuT2NiZDd1WUN3VC8r?=
 =?utf-8?Q?le/GMqBvy3M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3VlMExPQjMzWWFXSGgySDBSVHFHQ3hKMWJZNzlzQlduMTNJbmthay81QmRQ?=
 =?utf-8?B?NWhqV2NKVFNob3BraXJtdUpWT1phU3FVV3AycVUzY1MyMUg4YVhrMll6SllH?=
 =?utf-8?B?TksrTHlzdDJla0wwUzUvdnZTMXBHZ3p2SXVHQTRoUHN2NE9MMGZOV2pjNXkw?=
 =?utf-8?B?d1EwOG1wSHRuc2twa3gyMWQzR2d4aDR0aEt6a0pZcCs3ekw3TTFmTWZtV2oy?=
 =?utf-8?B?NXFMcmx1cTN5d3ppZ1VhMks1VThZc3Z6d0JLT3FvM0JISFBIdmREdVl4cGly?=
 =?utf-8?B?K0ord3JBWlhDRU5RUlVlQmJSeGRLWk9UOXk3UG5STW1kYUdna2xUMCtOVlJV?=
 =?utf-8?B?Z1FkRkpuWDVWa1NwZ2ZYYTBOelpKampSeXgybkFKdTJveXp5NkkzWjZnTGFQ?=
 =?utf-8?B?bkljZ2p1emNuWW9ZQ2oyWW9KVUJXZTd3c1RLbDA5Y2hKam5YaU9keUZDVTRr?=
 =?utf-8?B?aWFBOWtjMnFhbDE5c0J3QnhVSXQxTmdYaVhBZm9UbzZ3dHZmNFJQOHlrc0Nm?=
 =?utf-8?B?dlhSQTVtbWpkSE5pbUN4MEJzQi9jaDgrWFBuN0RhNnhoblZGcWd2ZjZQMmZq?=
 =?utf-8?B?Q0NsZjZ2d2tTMVFmQVNsMFNFNWJlaE1sZHB6YVdSUVFtcVc0VTAzQ3dyN051?=
 =?utf-8?B?eC9JeVlCTXhsbmd4bHhIMkZJWVlqYk5DV01JeDdLRDB0Zk43UXFJUElMZkg3?=
 =?utf-8?B?VFdQVGZsMzJ5czQ2Q2tRaDAyaUd3dzAxaTBkWXFVZDFvd3JkVkNjOXdBSDk4?=
 =?utf-8?B?a1dtMmJHRENwYy8wRU5CbG5Eb08yNmlOOTZ4cFhpWXA3M0JUbWtDTEhzWGFn?=
 =?utf-8?B?QnBMRXdtUHFvcHptaWFoaEF6WVpxRGJvUEE4L1VIWkRLQ2xPSUhZYUlhbEY5?=
 =?utf-8?B?OWVqWjR0ZUU1REowOGtqY0hIUmI3WnNWSHJ2L3BHUDlJZWNBRHYzMzZRU1RV?=
 =?utf-8?B?WkdUU21GSkFET0JhendGZXpOV2lwdUlpUW5KQzFoVWRZS2N6cGx4Rzg4NUd2?=
 =?utf-8?B?dzNtNnFyUEtZbHB6akw1cU9EcnVoaXNuOFdWbnIzRXhLTk9ybGVFUi9vZDRV?=
 =?utf-8?B?WjdkWkdMaGRCUmhHZmJUci9VS0pQVmhRbWYxTDFNV2Zqd256TEFuSjcrOFU5?=
 =?utf-8?B?Z05LNnVjazRtY2lZMTByOFhWSlVHc3ZHaVAxWWVpNmk0TFBvNDRPaG9kbXdn?=
 =?utf-8?B?VWx3TUsyRzgvZlpaMjh3aHBPU1FzZUFpOW1LWnNyQzFTR1ZrdmR0M3I1NWw5?=
 =?utf-8?B?RlorRE5NRmQrc0ZzNkVmZVByb3h2UGU3NXN4cGRGZVdSR29XUVByRHVHaUJG?=
 =?utf-8?B?ZjREekhrZXN6aHg5elZ1RjFwQXlybEhQMUlrZDBhQmlNYm9zNUdmaHlKMnR3?=
 =?utf-8?B?SXBJMTRmalptMEpkakJ3TUJwTVRnbWdiQnVDazZrdGo2emFRQnJpYUVURXpa?=
 =?utf-8?B?bVpNMmUzQjBqVGxXZzRZQ09vQ0VtbWd1blY0LzhaL0JtbmJFYWFRcjQzOWJp?=
 =?utf-8?B?NDdRRFU5dldHMjJMZXVsK2ZERWdKdEppdjhMUkJNN1M5emNGVWI4TTdnVm9O?=
 =?utf-8?B?YmpZSlRPK2Z1ZHVhek5HSVpqYTBYV1JNdTJBNjJiTGgyUGZBUDEzVFd5ZWp3?=
 =?utf-8?B?cmhMWkhHbW11d3grZEIvUysvUE43dWp2dnRaaGpkWjZKQkU0RElmeEdMdHN0?=
 =?utf-8?B?TUN0WnVoeXFTeGRRcDNBdVN5MUtrclpMMEZjZUlUL3RQa3N6Q3V5eGJVeGQw?=
 =?utf-8?B?RkF3UHZocTg1QStDenZ3K1BjVVhRaHdhMFBib1RUZnhMK3pJbUEyTm5JUk51?=
 =?utf-8?B?d3FEcmJkUVh0cUNCSWhzTVd1bWFXTUM4Mnc1RTBJWHNsdW40YURiRDd2V1A2?=
 =?utf-8?B?UERRdWVxbE5SVkRSTjVDaGVaVXgwajE4MjZWOENTaHlqUjNXbzBBRDVGRkJU?=
 =?utf-8?B?ejBtd2RRWkp3Z3RlZDY0bFBtTlFBWGFTL1ZlQWU4RzRqbUFKVUc4ZjRTSmRF?=
 =?utf-8?B?SEY3QTV4SmpjUnNzaFdGckZQU2trY2luNWlVR1VaN00vMFBEbVJKVmlqemEz?=
 =?utf-8?B?MU9SYXIrNFZ0WEhWQkFRTzdncG5oUWg4VjBTYXc4bFZZS1RIR0k3Mit5WTVr?=
 =?utf-8?B?d1ZMU1hWRlBVc3JDR2lFVjU2WFBqbG9tQUdZcDVyS0ZBKzN5UHhNL2czNUtp?=
 =?utf-8?Q?XxN8XNE1PHtynTzRvFN3It4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 383f0fed-f09e-4775-d0bb-08dd7c0e7f9b
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:13:07.2316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZurY97/4S+jdsl19R7RRaR4lCGopuRzIr/b64WNNB+dekdEq923KKQNgUU2M8gJgy2CGJ90DXBAwJ7Xt6yCajOjfYXMZjlDrK0cl7n2YwS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5269
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


On 4/8/2025 10:10 PM, Daniel Stone wrote:
>
> As it stands, I've gone through the implementation pretty thoroughly,
> as well as our use of it in Weston. I'm happy with how it looks for
> pre-blend, and I'm even happier that the implementation is written to
> apply easily to apply to post-blend CRTC pipelines.

Since we are planning to use this frame work on post-blend pipelines 
eventually. Should we change the name space of the current pre-blend 
helpers to reflect that?

e.g.

s/drm_colorop_curve_1d_lut_init/drm_plane_colorop_curve_1d_lut_init/
s/drm_colorop_3dlut_init/drm_plane_colorop_3dlut_init/


Regards

Chaitanya

