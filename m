Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2100B33CD7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 12:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEBB10E42B;
	Mon, 25 Aug 2025 10:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JHIBjOe6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC6510E42B;
 Mon, 25 Aug 2025 10:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756117959; x=1787653959;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ehVIStO8VWC3BPsgZslliLFZ0+kz53W0X+kat98ve/s=;
 b=JHIBjOe6l4tyET1agD+PMquSVnLzUOU5cGxi3EzfBJIfksRH0drgf771
 aitEqmWfK7eIMeFRYVVT2kQiWHZ7dhuWITR/O0ib9MVrXd8Asvz2jEDGN
 BEPOdHh2C8NajtSjSgbrP6EwBT5A6GgOFR1QR5Kn8/Xs6y5vzDkxycvxp
 dfp/ajYguRZMr7SHKgvZr/oBEZuS2b0WdEGhR99ibLaL6deRwXFpPRcD9
 c6xr1TiTqhPqn6PLthLpI9Ikp5IUPSqxe5EjlS7PYMggpDaac1804vd0R
 ODwuB4ljwti12K21t1iIkXwzmyjcVFQ+mEsiWcywR8wkcYLVC41bwBSYr w==;
X-CSE-ConnectionGUID: vl1yt20WROmolPCFanXVAQ==
X-CSE-MsgGUID: +dFGQtc2Qmi0Qt18ouJjpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69700953"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="69700953"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 03:32:38 -0700
X-CSE-ConnectionGUID: rrRnciZRQ+KFbh7ay9M7ag==
X-CSE-MsgGUID: TtUB6htmS7OXZ06OTKfL+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="169651518"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 03:32:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 03:32:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 03:32:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 03:32:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdhtlF3i5nXc7v0j2/AJ3yyTDuRhmiRWDrmC/ztq9sKa2JdgqdPyni3toLT24N6eIluFbVU8T7tat5vh1Cjjm9Pz0lgkQP8kSQx+dQkTA3rE5IPIR2OfwMkQ5DSl0M7Mok42l8Ue+qBDQMiQ010ELw4egs0YeUhQsS6ck119urny93xhGGnDPpAV6JHpNiH2OOnowX8Y0uXlP6D0d5S87opSF2v4I2wNKkIJDi08hDQNzSe8ysYa2OtJvi5XiC89zuwCtpe3dk129H6bGx10xurgTf3UPQIc0BkkpOip8sA25VEpaj672u1a4JXQhBKZyc1yiDJ5DbSyABJDy/bnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8L1JV3129HeC4EF1GmYm/Nt9yD5m3s/WMqFO4Dvbc0U=;
 b=opAKsU+gsXZ+e3CcyZxdYumOvW6eSs4qbsLRJf5FdYh5A58BWYFURuY/11wWH60PEvYsU413i1taBPq7kZ4TdZ/DsDgNFKwmKFIWmy+zTPILbZVM74ipsyhKg4vFaLXnfC1UaWvDRCumUQ+/dUo33br85cWCzBO8XugmS24/7GHCAVXY9PNb8olnxmXHPpkvkOhVaD1wN3oy6pnN1AbxxkM1vqjp+AbNxLb50NVxGpmudVel7Hqx8fquzfNFTVsPJSD0POoUT1JhSP+TnqfGRwxbhfVHUbLs/iOTE1eFl78lingENO4laobMslPM+gHr8reKB8n22KoibcpmDRHIYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 25 Aug
 2025 10:32:35 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 10:32:35 +0000
Message-ID: <1f163de1-046e-4c66-8d98-0a3062551cb1@intel.com>
Date: Mon, 25 Aug 2025 16:02:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm: Define user readable error codes for atomic
 ioctl
To: Jani Nikula <jani.nikula@linux.intel.com>, Xaver Hugl <xaver.hugl@kde.org>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 <naveen1.kumar@intel.com>, <uma.shankar@intel.com>, <harry.wentland@amd.com>
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
 <20250822-atomic-v3-1-13a0e8f2c581@intel.com>
 <CAFZQkGwqgo7FavPQecKgwaZ1DcXccY9urRzcfocg+Srd4P9WPA@mail.gmail.com>
 <3d0136ee-fa1d-40ff-8304-da4d7432b1f1@intel.com>
 <141904c898c16c8c3b03b48ba2809b5046ed9f0a@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <141904c898c16c8c3b03b48ba2809b5046ed9f0a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::13) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SA2PR11MB4938:EE_
X-MS-Office365-Filtering-Correlation-Id: c23856bf-95ed-4dbf-8402-08dde3c2b4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1F0VFJYZUlVK0hzckgvbnVvZGJWR2JONm9XRVJMdWwzVjRXSVI1T2hFTDAr?=
 =?utf-8?B?cHNiUm1aWTZjbVNZYkM5MDdrZkRZY25jSnJLUDVYTWtRY0F5TmtrSG9DWktP?=
 =?utf-8?B?TERodzkzUTAvUVhoazBmQW9OVUFVQ1dlQzY0amhlODVIekNmZm56cEYzdU9k?=
 =?utf-8?B?U2NRYkM1Q3ZlVGFWMDdySFhpMUdqLzlpNkYwNHhBWDBNbW1ZU1hpcElkbDI0?=
 =?utf-8?B?dnNlQUtwQUExbENhSDFsYU1TaldTazJidHhUVXAyZ00vVk8xSXV0d0NtOExS?=
 =?utf-8?B?UFRiU2c1NE14OHpVM0wxZC92cGJ1bkVrVVVINFhaVHU3MlhDWHVyelNiZkFy?=
 =?utf-8?B?YVFHdkJFWmlaY0w2RlgzUWtydXhYcGNYRDQ2L3FFMUptc0t0cGJ2OGtnL0g1?=
 =?utf-8?B?UGEwMG1tN0I4bkoyYWJBRnlFRkdNYlJxZ09kSHYycUE2RDBUbi96cWU4SS9v?=
 =?utf-8?B?Z2tMdFVvQ1YxbnlxbktxdndEY0pQdjYyQXkvTGdFdkZkK0ZYUHc3WU50c04v?=
 =?utf-8?B?b3ZvSytLSDF1RCtWZEFDaTc0Q1B1bTZWM0N6bFF2ak5OVVhOWU9yeWlLc0M0?=
 =?utf-8?B?NnNrbk80ZG9SbUxuYWxqUFJONHZwTlh1SytLMEhHdHg4SHFqQlVlbXBmby9B?=
 =?utf-8?B?VFRpMUhiM2hzWDlXd2MwS2hpYmJ0V1MwMkhOL25VYVdWS0RZRVp0WjgrS0Y5?=
 =?utf-8?B?dGM0bGoyQ2d5aUVJbURjZkw0RGY1N0dHdjRZQmVjSzhwU3kvUVN4OXpHTnJO?=
 =?utf-8?B?L1IvYnlsT0hZVzhmdUFDUEpPM214NFpmdkZ6YTAzV1NOa0pmbVcyRlR1ZkZV?=
 =?utf-8?B?R0MxQW5PWnFialF1cHduTnhhWllqSXY0eHFVVEdEc29hcE5UN0J6akZabG15?=
 =?utf-8?B?Tk84T2wyRXRybkFqdTcxTkZTY2cwMzI0SnMzakEzU0V2My9NNVhJMEVpTEto?=
 =?utf-8?B?Vm9FYmNpZlA3cmJYbjF4NTdsS1RWNmdkNERRY0JzaXMvWW9aZ0NCVzJaZ1hN?=
 =?utf-8?B?Sm11RDVrMVcvK054cmY3MzBpeE5lL3VSSVpIVFgxZmluOVRZWWlzMzBzN0dw?=
 =?utf-8?B?S0hDRkVKL0JlZXFiUmllbWxZN3dMenZHVHY0bEw0L1RXbXhhdUZueGFEWWoz?=
 =?utf-8?B?YXNwc2Y5elVablA4eGJiV2pHd3RLaFJZMURTK0JlU0lMcVVtS21BeENDNVAz?=
 =?utf-8?B?ekRkV0dpdE50YlVSWnpKZjE1RWtkWnpKNzJGQ3dOMkJ1YVBETTlGd2pBOVkz?=
 =?utf-8?B?S1RGZFh1NjJYeFJPdVlxbzdFM3cyS2M2RVJHSWxLeFE2UTQ5VHhhY2FpZXVz?=
 =?utf-8?B?dmVQakVkZ0hESXRvUkJZV0k4UnBUY0Y1NnVxTE56WUQwbUg4MXZlcmljMU9F?=
 =?utf-8?B?c2NtdEJGdzF2R3lxeXdLZzFtTW1LaGJhMzRGZWd4UTlOWEZoK1hISkV3M2Zo?=
 =?utf-8?B?TXpSby9OUVlteS9kQzk5MFcvQ0dwcWNjRkFJalA5a3ZGcmpDZllya1ZPc1Qy?=
 =?utf-8?B?MDhnN3o5dGpocDI1Qmwrdmd2b1lMbHpZOVJvQ3F1K0NhbVBSa2wxSzZRZzRB?=
 =?utf-8?B?eVdhODB5SkNGSjdlcXNEeWpSV0hZVjVhc1M0VmMwaHJadE84VmgwQUx5WkZx?=
 =?utf-8?B?c20xR3diT3pQaXhhV0JHTFE2MXdHazJQYllFY2wrU1BxWlhNUHpqL3I5ZXJG?=
 =?utf-8?B?YmhRQzd5NTlYeG5rVDNFSzlicnJmU2RWMEZvOWM1UFB3YWlYMDJ2MUVZWnNC?=
 =?utf-8?B?RHpTTC9QZVAzemZJVVJhc1hpRTVhVVJMejN6MEJmSldzV09zUmFTZnVTYXNs?=
 =?utf-8?B?OUJnZi9SQ3Rqd0x0Q0NpbGpzRy90c2IwUWgyZ3VKRnhZN2pzTHFuSkwxdGdN?=
 =?utf-8?B?VHlQRDRENEpubk84YXV0TE5SdmdrUmpWbkxiek5FVXVLNXJxTis0RldoQU5r?=
 =?utf-8?Q?ryBQm/xsrCU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3dId2h3N2tsL0xjWHg0R2xKdmNFOGhQek0xOXVidEhsdjVpekU3ZFc1am1C?=
 =?utf-8?B?RDBra0FlUEZOK3pzOGZodVp4R3pFdTRNVjliQklOZXAwcWlyVHNUUVA4OVlI?=
 =?utf-8?B?OTNEeDljbWlQZCsvckx2QXN5R2pWaW9oSlkwclZPdGZiekdtZVE4Tng2Yzhy?=
 =?utf-8?B?Q1JtbXlRc3RBRVNya0dPTzEzdTRNSEZZRUprSFdxV2RGWDBmNlpBaVhMSFY1?=
 =?utf-8?B?bDJNeDM4UmNrcVdPL0JjMWdXVjgwUCswN1A0bG5WZVZ4U0lEUTBYcXhMVFJi?=
 =?utf-8?B?U0xzODBDYllDM1BXNnVQWlkzQzdVVm9iUFphSEZodlZYYURqZHdXczlsdk5a?=
 =?utf-8?B?UkE3WTZzN004aDFBeFNPZ05vVllJTG5VQlgzYmtibEx1U2wwSDVkSS9GWDEz?=
 =?utf-8?B?TWlwZW1NR2RtcGxlU0NVc2FReDFZdDBYQ1pUK2RGcll4VWVyQUJQMjZGNWFQ?=
 =?utf-8?B?UzdFdHFSd3VmWXp1K3ZhK2pPdjdiU3JMQ0dVTlUrOGRtVlU4clFrZWdWbWhq?=
 =?utf-8?B?eWc0aFBzNzRZTlFTQnAxZEw5ck94ZGhnSGhSZ2gwZFNuT2xMd2FmeFk2bDlQ?=
 =?utf-8?B?Z3MvQnc1bzFYa2wrVGladUdPTWU4WFNmNlV2elptTDdYTUt6Q2ZrR2kwUkdG?=
 =?utf-8?B?NVVEdFZqOVQ4UEpmWDJIQ1dLVm9YWVdUUWNqVGxzSmtpVExoUFNHS09lREV6?=
 =?utf-8?B?bDVpTm9vZVFWRTZhcUp3RTd1Vmpjd3JVMkxhT2ZGeWxvL0pVM1Y0bi8xOVlB?=
 =?utf-8?B?VG1HVml5K0lhZ20zZy9sSFdQOWt0OUpJNFpPbHNYVXVpejMrU1hYNURVWVJX?=
 =?utf-8?B?ZHd2ZjdCNVBlYW04R25VUkxkalZyRVdkVG1FMENmWTNvZE1WWmFVMzFvbzhS?=
 =?utf-8?B?SFFobHZONHFUQStaNzY5QWJuRTJlaUV1czRSQmVWNndNY2d4cEFQZExFL1hp?=
 =?utf-8?B?clpMeFpRaHJxbHlERXRZS0VwbXdkU2R5SU9yNHZqa3U3N1F4Z3NGM2RSTE05?=
 =?utf-8?B?dlMyY1RobnVYMnZjVVVId1hmYzhZUWdOTUpFSWx3Z2pjbGFYWXhuOWU1U1Vl?=
 =?utf-8?B?WG5BbGpYRmRFNHhnVFJzVndGMW1QQ1dJUjNKcVlTTlp6VXpLWldOV2RGUmRo?=
 =?utf-8?B?OFJBWVhDRjZheUYvbHdrdFpEcDJhZ1lRNUZySjN1SlpOVDFocUFoK3VBQ0Z2?=
 =?utf-8?B?cDZ4OG5tb2ZtdmVvTWg4aW8zR1dPRS9IVVBTbWE2TFNLSW5EMFowc2UzOXJY?=
 =?utf-8?B?WmVXRjMySk9xcWVxTUtTNmpqcytqZ3ZnV0tyY2h6VFZQcHFaMmZDb251MVNy?=
 =?utf-8?B?eWJhVWprUElMbGxwejlzMERQdUNreDlzWGxzRFMvcWJMUXBYZE0xU0ZPUFVK?=
 =?utf-8?B?Mk14VFFrSUNoQ0lSM1dPR1J1L3lwRFc1N0xzTGRtbHlQb3JrRGxuRkxwaTIv?=
 =?utf-8?B?VVhxL0pyNmw4M0x4eVZxeG5ZNE1oQk9yMTBaYnh5YXlKWk84ZGs3QmdEdTRW?=
 =?utf-8?B?bWNQZC9tbFloWVFUcHI0Nzk0aUdJNnhha2ord3FWY1ZGdGhwMjdwY0plVTRq?=
 =?utf-8?B?N2d5cXJMVEJnYURibGVyZ3phc2JWK2lVK0QydTJzbjJpRWp3UUpjY0sxZG9S?=
 =?utf-8?B?VkMxbE1HblJUSkZYT0MvUzZUQmhwY3JRUDZMcU1UczdkVENPc3pWYkZjTGs4?=
 =?utf-8?B?WDY1amJaUXFTa1ZLc2NJRmRZZVpiVHhVNTFJT1Z5ZGlEU2g4VmJBYUhWaDl5?=
 =?utf-8?B?d05GMEx5eGNieFp0WU5WNWJCQi9JMDh5TzFPMkZadXBuS3cvSERwekRUTTdQ?=
 =?utf-8?B?VmR1aUlVeFAzMlhMMU5KeWVJSVZJVTFnU2pxSVJsaXJBOUk5ckdWQlFvay9m?=
 =?utf-8?B?bm9ZL0JqYXZBQ0ZXWGlHbDlXQkJ4TjJ0aVl5czVkVzhCQzY5K0QrbVhmRU11?=
 =?utf-8?B?N1d4WjlxaUtlb0l6bUdseVQ3OEtXZTNOaUhWdkQ4TG55ZjZzdU8zbGZ3Y0Vm?=
 =?utf-8?B?NVJOSzNrTjJHbEtUZ1VweEZ1d2dKanlVL3R6Y05uSXVyWnVDcWNMWEp6L0Y5?=
 =?utf-8?B?RXMvaE4zZ1BjR0hhL3hNWndnSHNidW5Xek9mVzIyNDlpMFI3NDBzeGppV1Zr?=
 =?utf-8?B?cVErU3Vyd3JqUmdlNnNWUmlJaGlYdEdiV1BtYTYybkJCQk00UzFhUlBLWkpr?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c23856bf-95ed-4dbf-8402-08dde3c2b4d5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 10:32:35.6754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iy6stFo0YgwqvqyLuKllpdO+3lQ9ZSiaCEWMo5MdlVYry8O/aJqmqQ6eK27COn6p/KInAn/OXv5lIAoQGKCU3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4938
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

On 25-08-2025 15:17, Jani Nikula wrote:
> On Sat, 23 Aug 2025, "Murthy, Arun R" <arun.r.murthy@intel.com> wrote:
>> On 22-08-2025 21:44, Xaver Hugl wrote:
>>>> +#define DRM_MODE_ATOMIC_FAILURE_REASON \
>>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_CAP_NOT_ENABLED, "DRM_ATOMIC capability not enabled") \
>>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_INVALID_FLAG, "invalid flag") \
>>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC, "Legacy DRM_MODE_PAGE_FLIP_ASYNC not to be used in atomic ioctl") \
>>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY, "requesting page-flip event with TEST_ONLY") \
>>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET, "Need full modeset on this crtc") \
>>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_NEED_FULL_MODESET, "Need full modeset on all the connected crtc's") \
>>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_NOT_SUP_PLANE, "Async flip not supported on this plane") \
>>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED, "Modifier not supported on this plane with async flip") \
>>>> +       FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED, "No property change allowed when async flip is enabled")
>>> As mentioned before, some of these errors are a bit too specific. We
>>> don't need to have an enum value for every way the API can be used
>>> wrongly - CAP_NOT_ENABLED, INVALID_FLAG, PAGE_FLIP_ASYNC and
>>> MODIFIER_NOT_SUPPORTED should all just be one enum value for "invalid
>>> API usage".
>>> In general, there should only be enum values that the compositor
>>> implementation can actually use on end-user systems. For further
>>> information when debugging a broken compositor implementation, other
>>> tools can be used instead, like drm debug logging or the returned
>>> string.
>> I have considered your comment in the last series and have removed
>> driver specific errors.
>> Anyway will have a look again on this and will get back.
>>>> +#define FAILURE_REASON(flag, reason) flag,
>>>> +typedef enum {
>>>> +       DRM_MODE_ATOMIC_FAILURE_REASON
>>>> +} drm_mode_atomic_failure_flag;
>>>> +#undef FAILURE_REASON
>>>> +
>>>> +#define FAILURE_REASON(flag, reason) #reason,
>>>> +extern const char *drm_mode_atomic_failure_string[];
>>>> +#undef FAILURE_REASON
>>> The intention for the string wasn't for the enum values to be paired
>>> with a description of the enum - that belongs into documentation, not
>>> uAPI.
>>>
>>> The idea behind it was that drivers could add driver-specific
>>> information in the string for compositors to log (only in commits
>>> where failure isn't normally expected), so we have an easier time
>>> debugging issues a user system experienced by looking at the
>>> compositor logs. Sending the enum value again in string form isn't
>>> useful.
>> We are not sending enum value in string. Its just a single place where
>> we have both enum and string. Upon user adding new error codes if both
>> enum and string are at a single place it would be easy for the user.
>> Hence adding both in a single place using X macros.
>>
>> Its not mandatory to have a string for every enum, the string can be
>> left empty if not required, or later in the driver user can overwrite
>> the string as well.
> See my reply [1] about fixed vs. non-fixed error messages.
>
> I believe Xaver is also saying we don't want the fixed error messages,
> and especially not in a uapi header.
>
> BR,
> Jani.
>
>
> [1] https://lore.kernel.org/r/419591dda7158b3d56c40aac0df86ca499202676@intel.com
As pointed out in option C of [2] I also feel better to have a default 
message so that
  compositor can use it for logging.

Thanks and Regards,
Arun R Murthy
--------------------

[2] 
https://lore.kernel.org/all/419591dda7158b3d56c40aac0df86ca499202676@intel.com/

