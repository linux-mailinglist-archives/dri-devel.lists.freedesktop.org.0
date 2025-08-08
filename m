Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE0EB1E175
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 07:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA94810E4AC;
	Fri,  8 Aug 2025 05:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3fprDmD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB9210E4A9;
 Fri,  8 Aug 2025 05:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754629411; x=1786165411;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=04fnyUOSLqPPeNEZJcL548uWUgxNgasY35XaAZVnUoc=;
 b=m3fprDmDG0+w+pbV30i98m8rJ9SnqnfiEk8mJvmH+BmwZ5YrfwRB/prF
 BqiSeYhbPLoWH4Sp+HnAq327qldNEksO9Qf28zd0BXiEzwGMdalH87g1Y
 kOYDeAs530rsvNNJNLjKvSWWQLPeHE6bkTdXKjvHvbCp+zLBl9g3owLZb
 6J//Z78V3LdjyEeuzpAIC0RqS9I7FxeVieqOle4p+sxAFz37wdljztueF
 BSwOxwsvdhjTuH19d5BpadFK2ymPatuXdM6U7DaUUjQzHkX0HMvGq4b+3
 DMjXVnahdspUQbZZNoG0lYJVD7/Pex8nWiqviz1M/IhjcOdnistjX1J3v A==;
X-CSE-ConnectionGUID: 6hxdt32sQPStFtq0va07WQ==
X-CSE-MsgGUID: 1WawtNQYQreHAeSr08ZqOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68344397"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68344397"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:03:27 -0700
X-CSE-ConnectionGUID: mMI12PEFTAGOkdopQjH0Jg==
X-CSE-MsgGUID: D41m5Cr0Q4WHJ0Lyt/N9Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165142594"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:03:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:03:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 22:03:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 7 Aug 2025 22:03:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IK85Tn/ctq2F+qj/22mg55wL/MnhOcoyAgsyKsOiSD9mgRnyFxXItrgXw8Vgby+t5SBaC+QLPX/YkKLKMlOQc4R/yN0KExbfmcYo/n6SDiq2zsIBxusm7J8w8d1sVI0iPUFB3eqWUm2XYY/M1uXb/uCUFPtv0jD0VB1PfJ4A1x0bJrun9ihbOBJh+XjWfl+fFfoo+iqhLn40QTjli/fo2qckM4Fx9YnVfGBw1MG8u3kUFS+ZOlPYzIXPZ9jo98XqNOZufZafxa0CKAG0IjRWIbK2QyPsUxSp/plrn7QZYPCJ0vxioUnLNAN4RGmIpR7rJjEh9bZxjsh306cSiXDmdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYDAmjpYhY4HRFB//DikRKKiljGKUzbwIj/lwNbD++4=;
 b=s8FlWEZFzFXMiaVsar2+AFOk16DKX7rgjRFYjTv/lyt0TolkZLqt1iUd1BSu/E2HPXEaZ4J+d7M7m1q9Oay02qQJt5XSMs9CPqznYG9RDOKEAWASKknFXTRjTCePTNVwxrfe8UCqZpPGbiqP/SDJDUQ06dzEpgvbncPDyCWsft9R99VjIQwY+0Fm+gpa8wUwhw6bH8LS3zKEOsdWqk4MEtIFL/k/7oAK68816TwdiPJrS7pyS+Ul43IcHbHCP67loSyqMLutzKwbBId5ad6a9INHCIs26vW9PQcs4B00qTsepVmv2xGUoFZ5FTwy1YLEhGmOgBBPS9h5S1sTZ6NL0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7840.namprd11.prod.outlook.com (2603:10b6:208:403::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 8 Aug
 2025 05:03:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 05:03:22 +0000
Date: Thu, 7 Aug 2025 22:03:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Danilo Krummrich <dakr@kernel.org>, "Brendan
 King" <Brendan.King@imgtec.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Caterina Shablia <caterina.shablia@collabora.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 01/26] drm/gpuvm: Pass map arguments through a struct
Message-ID: <aJWFF7tKhpkHwzXL@lstrano-desk.jf.intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250807164338.1832254-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0226.namprd04.prod.outlook.com
 (2603:10b6:303:87::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7840:EE_
X-MS-Office365-Filtering-Correlation-Id: 915baa51-dddf-442b-2292-08ddd638e600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2ZRWkJvMEtyZDFBT3FIb2NLdnpjQkI2MjRVakhkZ2FTWXozTjFZaW1na1gv?=
 =?utf-8?B?RlFWaGc0RTkxMGJWYkZxb3ZCZ292Lzcwd09hUUo0aWlGYkR5Y1NnMW41NkJS?=
 =?utf-8?B?blZnUlBwMnNCdE0yeDRMNmxBNlR2Y0JneHlHWnVhTTEwV29ab3E3Ung4NzBL?=
 =?utf-8?B?Vmd2NUxqNnJYWnNyeW50WXpCNTNXd3VQRmxpeVNVN1ZCeXp2RzZPTCt5cDg2?=
 =?utf-8?B?MG5pU2ZVQS91RlFBdFg2Sk5WVUd6V3lHWlhHaXoxRkFpYW8zTlFpN2NDcnhG?=
 =?utf-8?B?eWRVSUJDM3krNUhHRWJaV0FYSzVvQ0xzUE9Qa1JzZDZqVnIrZnlMSWJxdmRG?=
 =?utf-8?B?ajdWQmZ4a3BTUjRIdy8vZlBkMXJOY2tYcjdTcFZNMjdOVjdPRXZMaTZUazho?=
 =?utf-8?B?Szcvc2tkV09Lb0F5WlQvWDNrNWE0b3A1RVo2N1RPa0xIaUY4Zmc1cmplVHcv?=
 =?utf-8?B?dGlFQU5QVU1iRkY2ZXU5Y0dZa0JkSGh5WXdDMm53bXNyUGE4ZUpWdmVrTk5u?=
 =?utf-8?B?QTIzRlYwYzRaNEg3OFdQMDEwUk05RUl2YUU0bnJWUU14Z3VVMk1TM0dORy9j?=
 =?utf-8?B?RWttb0RvSVpGUTROK1RIZmREZm5SRFVPdFVWZVBNYWl1NU5GUmJSVDNJWm8v?=
 =?utf-8?B?S1ZMbzJ2K2thYUphejR3MWlaU1FSbW01Mk5WN3FqNXFRZHg3djdhM1QyeExy?=
 =?utf-8?B?VEIvUnFrTEVvdldKdFFZRGl1aFpCcTN3TmN1N0ViMUtBRm9sR1NzVlZ4b1FW?=
 =?utf-8?B?WWhFSC9VcTBSbzVsaGh5S1ljRzdkc0ZkbjVSU0dmVi9WU01WK2gwYmRHak1a?=
 =?utf-8?B?MUpyYmREcDNBVitlY0Y0OGpUT2RWWEY4MXg4WHlRdUl2V2dQV2JQUW9MVlNw?=
 =?utf-8?B?RW5Na0lxMWV3RUl2dkR1aitOM3V2U0tsM0o1QkVvcUVNUElkZDZwd3JQQ29S?=
 =?utf-8?B?NWIrZ2dNS0Y0c0FRS052eW11aXNzeHRubElEK1c0ZnJTZFh4REtwRkNGcTFG?=
 =?utf-8?B?SDNFZndOQ29FSXR5VDJ2Q0R6R09Oa0xHYzg4c0dXZk00bEtYS0tEcVc1eENn?=
 =?utf-8?B?TEN4d3RGak03eVU4eGdvcEZKN1RkS0o3YVc5SHUwSlc2dXVidG1pWVBQMFIw?=
 =?utf-8?B?cWR1T0pVNTFpMVFINlA3YkRwK3hTQTF2NUpJRmNCTWowbnRuRUtnNkV4dkRJ?=
 =?utf-8?B?NU4xOVo4V2xRWEVUNFdOdU9KS0t6RGdwbExCR0p3bU5rU2tweW9Ob2JhTHY0?=
 =?utf-8?B?WTh2dTdtdW9RVVhxWGVTbk5mK1I3L1IwVXZWQVBxOWlnYm9uSzgxWXI5V3Yz?=
 =?utf-8?B?QkdveTFlZndGUmQwSmtmSHhpRzlLTWE3VGdmd3F0THVldWxNVVExUlFQajg3?=
 =?utf-8?B?azUwZFZ4NUlJQ2IweHVDaEd2b2t3WlhvWkREKy9OcW53eHpsRVYwdWhiL1p5?=
 =?utf-8?B?cWY1SGcyN25lNHlMT3RGRWFMM2VJQUJJTXlLQm01ZzB0Nldld2xsZWV4UXcy?=
 =?utf-8?B?VW8vdmFxRHVTS3h6dDE2c3JISVBWVXFqSkNDZVlrKzRhMEw1M2IzM0h0eWVG?=
 =?utf-8?B?RTFIbCtMZllWZWlxZ1NQTytzT1VpUzcrcTY5ZFFxcHV1ZzZnRU9aYmM4Q1Nj?=
 =?utf-8?B?R0hNbEl4Vm91SktISERoSTVyVVZaSTJyQzVBeFZEKzVKN1VpVFJRMTVlcDJp?=
 =?utf-8?B?LzdVZ2gyRmllZ1lhRmJpUXRjM0J0K1dTNi92NnhaODlSYWtXZytLTEk0RCts?=
 =?utf-8?B?M3FiNWkwNHVKNy9Gd1ZpYS9UZllBNXpTNm5IRWZVeWwzaTduRGllVEJZOXQy?=
 =?utf-8?B?RjF6NDVZdmp3NmtackU1Z2lCUy80SUZRYkZMWG9qTlJjOVpKYTFwY1RmUGxS?=
 =?utf-8?B?aHpoZUNxS3pJSHJQbFV6bVpNUldObGZneEwrZVRndkF4bGE2YWQyWnFGUHFu?=
 =?utf-8?Q?X8OmV4X6Ib4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXFXam9JS2Mwb0hIclBMY05mTUFiRjFiWXBiSlB2RERwck1jQ3ZGdWQ5NSs0?=
 =?utf-8?B?TFRiTzdCZXF6QUtTa1p0SmVKdzYwbnhicG54S2lGNm1scHJLY0drNjhxcHRz?=
 =?utf-8?B?MFpXTVJabmRzYjBST3V1R1QwbFEzYmhucEFwSHJvanVLZnBmZ3YzZ3YwTnRU?=
 =?utf-8?B?OHNLZEZrUWxtaVA4SHMwU2dDWnFYN1pudWgxbXdrdWptNUNaeWxOanhDTG1z?=
 =?utf-8?B?ZWdrVUtLQjMzcHFEaUhLVUdCcGt5MVBkN0ZjN2NCbk9PZEd4TGRNdVhTRFRN?=
 =?utf-8?B?dFJBQjY0TkU3ays2WFlzOFltR0N6bEhIWmlIblNDKzFXWGs0K3U4WHRWWCtp?=
 =?utf-8?B?OFVGYzY3OGszNUVLRXVtdlIrUG9FMm1HekRpdlBEbnVIY3l2QlJCZi9YaDhF?=
 =?utf-8?B?SUFvUDlPWjFIUys5VDhhMFVMTmxZV0ttMWo2M0I5dkRodGNDTTlrNC8zcjhG?=
 =?utf-8?B?TUpCaFVxdzlxT2prVFdNalh6L2NZM3Y5ejl1SkNURGI2RVF1cDkyS0NDVlJF?=
 =?utf-8?B?NnREU0JBbUo3Y29PVUtMQXVZMHR5dzdNUlhSUVpRSURkT3UvbmJxU3RSTDBE?=
 =?utf-8?B?RlFBc2JJOW9kR0J5TGtRRGNVb2JFcVBCa0dVRStpYkNYaXIwazZoTHR3Y0JX?=
 =?utf-8?B?Wm9DS3dqbGZOb2EvWmpwcWN4U3NINldyZEN4YkJIdHovdXlseXVFN3NQSVpq?=
 =?utf-8?B?VVZIYjJKQndHWERjR2c0eDFneVVWa3pvRkZTaDk1bmpnemxXT1ZyZWlsUVIv?=
 =?utf-8?B?M3JSTW02TWJ3YmJnNDcrN1RMZ3lMMjBvU3pZeTRQUmxTc2kvZGdTTWpVTHRB?=
 =?utf-8?B?TXpGL0Y4UVpvTGZvaUkyT293cHpxM25pd3Y4dk9sdThPeFFUNDVDVC9jNWxM?=
 =?utf-8?B?RDNzRUFvamNRVnd2c0puaUpTdUFQRjZhUklZUEhCN3MxUkYwc1lGZ1prcFZz?=
 =?utf-8?B?eHFyRzhMZHNjN2IrSDlKZUlUMnV5VjVtZXJmN1E0V1VQbUJIWGJjRmpDd3pE?=
 =?utf-8?B?OWsyZE5BL0hDOUhaSTZaRFB2UTdtYzh5RmVjUzBLU00xQk0xTjdKVW0rVXJk?=
 =?utf-8?B?ZEVxS0lWak43T2U3bktyVkNobjY2dWpwWkV3RkJ2U2lOSmF1R1YvM2JDZ1Jv?=
 =?utf-8?B?cU9xTyt1ZGRUTUNTVDZWVjl1bVl3elA4ZThlakd5N2VEa1d5cnBCcU41MGp5?=
 =?utf-8?B?TmZoZUs2K3cyUjVjY0loY3ZGZFMzc2lhdVVhMzVFc2s4TFIxT2lwQ2NRdzg2?=
 =?utf-8?B?L0gxMlBNNGNVOFZ6cVlPemJIeVF3T2ljNzg0Tmladlg4MVpTT3VlbS9HSFo0?=
 =?utf-8?B?NnBvQkN2RytQQ1hQMkNFRU1RbnpaTktrWHc0N0tXRm1VRzVxdEFpUHBqUDZz?=
 =?utf-8?B?dnpIbnY3WTI0bDVkY3hHSG9aeC92Um5jdTV5VGYyRW5jVHlsUmdtcHN0cGw2?=
 =?utf-8?B?M0dWV3MraHBiTFp4MTVwYStpeWRaRStVcXo0dEkzNE1RNTdVeXg2MUFnOWgv?=
 =?utf-8?B?b2RmeTlTU011SlBNMzZieVN4RFY3NGduSXE4bG53WkFRaXFoLzFnR3pjZWRo?=
 =?utf-8?B?T2VXUStFT0FGcUpHaVhFM2cyd1p0cUg2NTJxWGRFcFdSQ0RNZ1JtWFpMQ0x1?=
 =?utf-8?B?Mkd1NDVEVk5ESmlVRDhOTmF3YzdCRTROdWlKdldIc1hBTytuRmNSRHdEUDVJ?=
 =?utf-8?B?WnRFd3U4UGtKTGcxSTBuV2RyZDhMZThOKzd5ZTltejlwUnJ5WmUwQnFXbU9L?=
 =?utf-8?B?R1ZDK1pROFNSTFdPdjdSck96dytxb1FIdGJMWmplaXh0MEZDSEdJWS9yZ0Fz?=
 =?utf-8?B?eFl2Y3RXa0tEWlovT0xqWlZmWnBPYWZyaHR3cG9ZRHBGMll0dklMM3JNdkhD?=
 =?utf-8?B?cWh6QWU0cEtKQTNtK3RYNXRnUG5rTXBpT1FIdHFNSGs2ZnJUaWlmOXFBa0pL?=
 =?utf-8?B?ZWZpNFJtTDUrRzByTlM1YXlTOWlIOExrbVlBNTVjV2tZSnoyc2djdzdDMStN?=
 =?utf-8?B?NG9TRkhZRlBUb2dLL2pVRFpaRXhmVUJiNG5yOWxnV2ZiWkpUWUxMeEpBVXow?=
 =?utf-8?B?cWM5SzhTaTE2K1IrK1dwclYxYkNNdWpkR254aTdXcnhLMUdrbDJLaHZ4WFc3?=
 =?utf-8?B?c1dwaWpwMWRFdW5zcW9DeFlMOEVzOXhxMjBGcU5kMzVweGtQOWpHelhmR3Fl?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 915baa51-dddf-442b-2292-08ddd638e600
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 05:03:22.3713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZTpVCBt6SGBjW+/JKeWrV2nw3vQMZkmh6sVHHAKwSayKNjmcfm3Q6O13L1VA94DJvW5ovRHIrMWugpTnjWbyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7840
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

On Thu, Aug 07, 2025 at 10:13:13PM +0530, Himal Prasad Ghimiray wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> We are about to pass more arguments to drm_gpuvm_sm_map[_ops_create](),
> so, before we do that, let's pass arguments through a struct instead
> of changing each call site every time a new optional argument is added.
> 
> v5
>  - Use drm_gpuva_op_map—same as drm_gpuvm_map_req
>  - Rebase changes for drm_gpuvm_sm_map_exec_lock()
>  - Fix kernel-docs
> 
> v6
>  - Use drm_gpuvm_map_req (Danilo/Matt)
> 
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Brendan King <Brendan.King@imgtec.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Caterina Shablia <caterina.shablia@collabora.com>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c            | 105 ++++++++++---------------
>  drivers/gpu/drm/imagination/pvr_vm.c   |  15 ++--
>  drivers/gpu/drm/msm/msm_gem_vma.c      |  25 ++++--
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  11 ++-
>  drivers/gpu/drm/panthor/panthor_mmu.c  |  13 ++-
>  drivers/gpu/drm/xe/xe_vm.c             |  13 ++-
>  include/drm/drm_gpuvm.h                |  20 +++--
>  7 files changed, 114 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index bbc7fecb6f4a..b3a01c40001b 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -486,13 +486,18 @@
>   *				  u64 addr, u64 range,
>   *				  struct drm_gem_object *obj, u64 offset)
>   *	{
> + *		struct drm_gpuvm_map_req map_req = {
> + *		        .op_map.va.addr = addr,
> + *	                .op_map.va.range = range,
> + *	                .op_map.gem.obj = obj,
> + *	                .op_map.gem.offset = offset,
> + *	           };
>   *		struct drm_gpuva_ops *ops;
>   *		struct drm_gpuva_op *op
>   *		struct drm_gpuvm_bo *vm_bo;
>   *
>   *		driver_lock_va_space();
> - *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
> - *						  obj, offset);
> + *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, &map_req);
>   *		if (IS_ERR(ops))
>   *			return PTR_ERR(ops);
>   *
> @@ -2054,16 +2059,15 @@ EXPORT_SYMBOL_GPL(drm_gpuva_unmap);
>  
>  static int
>  op_map_cb(const struct drm_gpuvm_ops *fn, void *priv,
> -	  u64 addr, u64 range,
> -	  struct drm_gem_object *obj, u64 offset)
> +	  const struct drm_gpuvm_map_req *req)
>  {
>  	struct drm_gpuva_op op = {};
>  
>  	op.op = DRM_GPUVA_OP_MAP;
> -	op.map.va.addr = addr;
> -	op.map.va.range = range;
> -	op.map.gem.obj = obj;
> -	op.map.gem.offset = offset;
> +	op.map.va.addr = req->op_map.va.addr;
> +	op.map.va.range = req->op_map.va.range;
> +	op.map.gem.obj = req->op_map.gem.obj;
> +	op.map.gem.offset = req->op_map.gem.offset;
>  
>  	return fn->sm_step_map(&op, priv);
>  }
> @@ -2102,17 +2106,16 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
>  static int
>  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		   const struct drm_gpuvm_ops *ops, void *priv,
> -		   u64 req_addr, u64 req_range,
> -		   struct drm_gem_object *req_obj, u64 req_offset)
> +		   const struct drm_gpuvm_map_req *req)
>  {
>  	struct drm_gpuva *va, *next;
> -	u64 req_end = req_addr + req_range;
> +	u64 req_end = req->op_map.va.addr + req->op_map.va.range;
>  	int ret;
>  
> -	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr, req_range)))
> +	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->op_map.va.addr, req->op_map.va.range)))
>  		return -EINVAL;
>  
> -	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_end) {
> +	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req->op_map.va.addr, req_end) {
>  		struct drm_gem_object *obj = va->gem.obj;
>  		u64 offset = va->gem.offset;
>  		u64 addr = va->va.addr;
> @@ -2120,9 +2123,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		u64 end = addr + range;
>  		bool merge = !!va->gem.obj;
>  
> -		if (addr == req_addr) {
> -			merge &= obj == req_obj &&
> -				 offset == req_offset;
> +		if (addr == req->op_map.va.addr) {
> +			merge &= obj == req->op_map.gem.obj &&
> +				 offset == req->op_map.gem.offset;
>  
>  			if (end == req_end) {
>  				ret = op_unmap_cb(ops, priv, va, merge);
> @@ -2141,9 +2144,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  			if (end > req_end) {
>  				struct drm_gpuva_op_map n = {
>  					.va.addr = req_end,
> -					.va.range = range - req_range,
> +					.va.range = range - req->op_map.va.range,
>  					.gem.obj = obj,
> -					.gem.offset = offset + req_range,
> +					.gem.offset = offset + req->op_map.va.range,
>  				};
>  				struct drm_gpuva_op_unmap u = {
>  					.va = va,
> @@ -2155,8 +2158,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					return ret;
>  				break;
>  			}
> -		} else if (addr < req_addr) {
> -			u64 ls_range = req_addr - addr;
> +		} else if (addr < req->op_map.va.addr) {
> +			u64 ls_range = req->op_map.va.addr - addr;
>  			struct drm_gpuva_op_map p = {
>  				.va.addr = addr,
>  				.va.range = ls_range,
> @@ -2165,8 +2168,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  			};
>  			struct drm_gpuva_op_unmap u = { .va = va };
>  
> -			merge &= obj == req_obj &&
> -				 offset + ls_range == req_offset;
> +			merge &= obj == req->op_map.gem.obj &&
> +				 offset + ls_range == req->op_map.gem.offset;
>  			u.keep = merge;
>  
>  			if (end == req_end) {
> @@ -2189,7 +2192,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					.va.range = end - req_end,
>  					.gem.obj = obj,
>  					.gem.offset = offset + ls_range +
> -						      req_range,
> +						      req->op_map.va.range,
>  				};
>  
>  				ret = op_remap_cb(ops, priv, &p, &n, &u);
> @@ -2197,10 +2200,10 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					return ret;
>  				break;
>  			}
> -		} else if (addr > req_addr) {
> -			merge &= obj == req_obj &&
> -				 offset == req_offset +
> -					   (addr - req_addr);
> +		} else if (addr > req->op_map.va.addr) {
> +			merge &= obj == req->op_map.gem.obj &&
> +				 offset == req->op_map.gem.offset +
> +					   (addr - req->op_map.va.addr);
>  
>  			if (end == req_end) {
>  				ret = op_unmap_cb(ops, priv, va, merge);
> @@ -2236,9 +2239,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		}
>  	}
>  
> -	return op_map_cb(ops, priv,
> -			 req_addr, req_range,
> -			 req_obj, req_offset);
> +	return op_map_cb(ops, priv, req);
>  }
>  
>  static int
> @@ -2303,10 +2304,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>   * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
>   * @priv: pointer to a driver private data structure
> - * @req_addr: the start address of the new mapping
> - * @req_range: the range of the new mapping
> - * @req_obj: the &drm_gem_object to map
> - * @req_offset: the offset within the &drm_gem_object
> + * @req: ptr to struct drm_gpuvm_map_req
>   *
>   * This function iterates the given range of the GPU VA space. It utilizes the
>   * &drm_gpuvm_ops to call back into the driver providing the split and merge
> @@ -2333,8 +2331,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
>   */
>  int
>  drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> -		 u64 req_addr, u64 req_range,
> -		 struct drm_gem_object *req_obj, u64 req_offset)
> +		 const struct drm_gpuvm_map_req *req)
>  {
>  	const struct drm_gpuvm_ops *ops = gpuvm->ops;
>  
> @@ -2343,9 +2340,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
>  		       ops->sm_step_unmap)))
>  		return -EINVAL;
>  
> -	return __drm_gpuvm_sm_map(gpuvm, ops, priv,
> -				  req_addr, req_range,
> -				  req_obj, req_offset);
> +	return __drm_gpuvm_sm_map(gpuvm, ops, priv, req);
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
>  
> @@ -2421,10 +2416,7 @@ static const struct drm_gpuvm_ops lock_ops = {
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
>   * @exec: the &drm_exec locking context
>   * @num_fences: for newly mapped objects, the # of fences to reserve
> - * @req_addr: the start address of the range to unmap
> - * @req_range: the range of the mappings to unmap
> - * @req_obj: the &drm_gem_object to map
> - * @req_offset: the offset within the &drm_gem_object
> + * @req: ptr to drm_gpuvm_map_req struct
>   *
>   * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
>   * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
> @@ -2445,9 +2437,7 @@ static const struct drm_gpuvm_ops lock_ops = {
>   *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->addr, op->range);
>   *                    break;
>   *                case DRIVER_OP_MAP:
> - *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences,
> - *                                                     op->addr, op->range,
> - *                                                     obj, op->obj_offset);
> + *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences, &req);
>   *                    break;
>   *                }
>   *
> @@ -2478,18 +2468,15 @@ static const struct drm_gpuvm_ops lock_ops = {
>  int
>  drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
>  			   struct drm_exec *exec, unsigned int num_fences,
> -			   u64 req_addr, u64 req_range,
> -			   struct drm_gem_object *req_obj, u64 req_offset)
> +			   struct drm_gpuvm_map_req *req)
>  {
> -	if (req_obj) {
> -		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
> +	if (req->op_map.gem.obj) {
> +		int ret = drm_exec_prepare_obj(exec, req->op_map.gem.obj, num_fences);
>  		if (ret)
>  			return ret;
>  	}
>  
> -	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
> -				  req_addr, req_range,
> -				  req_obj, req_offset);
> +	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec, req);
>  
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
> @@ -2611,10 +2598,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
>  /**
>   * drm_gpuvm_sm_map_ops_create() - creates the &drm_gpuva_ops to split and merge
>   * @gpuvm: the &drm_gpuvm representing the GPU VA space
> - * @req_addr: the start address of the new mapping
> - * @req_range: the range of the new mapping
> - * @req_obj: the &drm_gem_object to map
> - * @req_offset: the offset within the &drm_gem_object
> + * @req: map request arguments
>   *
>   * This function creates a list of operations to perform splitting and merging
>   * of existent mapping(s) with the newly requested one.
> @@ -2642,8 +2626,7 @@ static const struct drm_gpuvm_ops gpuvm_list_ops = {
>   */
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
> -			    u64 req_addr, u64 req_range,
> -			    struct drm_gem_object *req_obj, u64 req_offset)
> +			    const struct drm_gpuvm_map_req *req)
>  {
>  	struct drm_gpuva_ops *ops;
>  	struct {
> @@ -2661,9 +2644,7 @@ drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
>  	args.vm = gpuvm;
>  	args.ops = ops;
>  
> -	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args,
> -				 req_addr, req_range,
> -				 req_obj, req_offset);
> +	ret = __drm_gpuvm_sm_map(gpuvm, &gpuvm_list_ops, &args, req);
>  	if (ret)
>  		goto err_free_ops;
>  
> diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
> index 2896fa7501b1..0f6b4cdb5fd8 100644
> --- a/drivers/gpu/drm/imagination/pvr_vm.c
> +++ b/drivers/gpu/drm/imagination/pvr_vm.c
> @@ -185,12 +185,17 @@ struct pvr_vm_bind_op {
>  static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
>  {
>  	switch (bind_op->type) {
> -	case PVR_VM_BIND_TYPE_MAP:
> +	case PVR_VM_BIND_TYPE_MAP: {
> +		const struct drm_gpuvm_map_req map_req = {
> +			.op_map.va.addr = bind_op->device_addr,
> +			.op_map.va.range = bind_op->size,
> +			.op_map.gem.obj = gem_from_pvr_gem(bind_op->pvr_obj),
> +			.op_map.gem.offset = bind_op->offset,
> +		};
> +
>  		return drm_gpuvm_sm_map(&bind_op->vm_ctx->gpuvm_mgr,
> -					bind_op, bind_op->device_addr,
> -					bind_op->size,
> -					gem_from_pvr_gem(bind_op->pvr_obj),
> -					bind_op->offset);
> +					bind_op, &map_req);
> +	}
>  
>  	case PVR_VM_BIND_TYPE_UNMAP:
>  		return drm_gpuvm_sm_unmap(&bind_op->vm_ctx->gpuvm_mgr,
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 3cd8562a5109..2ca408c40369 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -1172,10 +1172,17 @@ vm_bind_job_lock_objects(struct msm_vm_bind_job *job, struct drm_exec *exec)
>  				break;
>  			case MSM_VM_BIND_OP_MAP:
>  			case MSM_VM_BIND_OP_MAP_NULL:
> -				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1,
> -							    op->iova, op->range,
> -							    op->obj, op->obj_offset);
> +			{
> +				struct drm_gpuvm_map_req map_req = {
> +					.op_map.va.addr = op->iova,
> +					.op_map.va.range = op->range,
> +					.op_map.gem.obj = op->obj,
> +					.op_map.gem.offset = op->obj_offset,
> +				};
> +
> +				ret = drm_gpuvm_sm_map_exec_lock(job->vm, exec, 1, &map_req);
>  				break;
> +			}
>  			default:
>  				/*
>  				 * lookup_op() should have already thrown an error for
> @@ -1283,9 +1290,17 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
>  				arg.flags |= MSM_VMA_DUMP;
>  			fallthrough;
>  		case MSM_VM_BIND_OP_MAP_NULL:
> -			ret = drm_gpuvm_sm_map(job->vm, &arg, op->iova,
> -					       op->range, op->obj, op->obj_offset);
> +		{
> +			struct drm_gpuvm_map_req map_req = {
> +				.op_map.va.addr = op->iova,
> +				.op_map.va.range = op->range,
> +				.op_map.gem.obj = op->obj,
> +				.op_map.gem.offset = op->obj_offset,
> +			};
> +
> +			ret = drm_gpuvm_sm_map(job->vm, &arg, &map_req);
>  			break;
> +		}
>  		default:
>  			/*
>  			 * lookup_op() should have already thrown an error for
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index ddfc46bc1b3e..92f87520eeb8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1276,6 +1276,12 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
>  			break;
>  		case OP_MAP: {
>  			struct nouveau_uvma_region *reg;
> +			struct drm_gpuvm_map_req map_req = {
> +				.op_map.va.addr = op->va.addr,
> +				.op_map.va.range = op->va.range,
> +				.op_map.gem.obj = op->gem.obj,
> +				.op_map.gem.offset = op->gem.offset,
> +			};
>  
>  			reg = nouveau_uvma_region_find_first(uvmm,
>  							     op->va.addr,
> @@ -1301,10 +1307,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
>  			}
>  
>  			op->ops = drm_gpuvm_sm_map_ops_create(&uvmm->base,
> -							      op->va.addr,
> -							      op->va.range,
> -							      op->gem.obj,
> -							      op->gem.offset);
> +							      &map_req);
>  			if (IS_ERR(op->ops)) {
>  				ret = PTR_ERR(op->ops);
>  				goto unwind_continue;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 4140f697ba5a..5ed4573b3a6b 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2169,15 +2169,22 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct panthor_vm_op_ctx *op,
>  	mutex_lock(&vm->op_lock);
>  	vm->op_ctx = op;
>  	switch (op_type) {
> -	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP:
> +	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
> +		const struct drm_gpuvm_map_req map_req = {
> +			.op_map.va.addr = op->va.addr,
> +			.op_map.va.range = op->va.range,
> +			.op_map.gem.obj = op->map.vm_bo->obj,
> +			.op_map.gem.offset = op->map.bo_offset,
> +		};
> +
>  		if (vm->unusable) {
>  			ret = -EINVAL;
>  			break;
>  		}
>  
> -		ret = drm_gpuvm_sm_map(&vm->base, vm, op->va.addr, op->va.range,
> -				       op->map.vm_bo->obj, op->map.bo_offset);
> +		ret = drm_gpuvm_sm_map(&vm->base, vm, &map_req);
>  		break;
> +	}
>  
>  	case DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP:
>  		ret = drm_gpuvm_sm_unmap(&vm->base, vm, op->va.addr, op->va.range);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 432ea325677d..9fcc52032a1d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2316,10 +2316,17 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  
>  	switch (operation) {
>  	case DRM_XE_VM_BIND_OP_MAP:
> -	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
> -		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
> -						  obj, bo_offset_or_userptr);
> +	case DRM_XE_VM_BIND_OP_MAP_USERPTR: {
> +		struct drm_gpuvm_map_req map_req = {
> +			.op_map.va.addr = addr,
> +			.op_map.va.range = range,
> +			.op_map.gem.obj = obj,
> +			.op_map.gem.offset = bo_offset_or_userptr,
> +		};
> +
> +		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, &map_req);
>  		break;
> +	}
>  	case DRM_XE_VM_BIND_OP_UNMAP:
>  		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
>  		break;
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 274532facfd6..3cf0a84b8b08 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1058,10 +1058,20 @@ struct drm_gpuva_ops {
>   */
>  #define drm_gpuva_next_op(op) list_next_entry(op, entry)
>  
> +/**
> + * struct drm_gpuvm_map_req - arguments passed to drm_gpuvm_sm_map[_ops_create]()
> + */
> +struct drm_gpuvm_map_req {
> +	/**
> +	 * @op_map: struct drm_gpuva_op_map
> +	 */
> +	struct drm_gpuva_op_map op_map;
> +};
> +
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_map_ops_create(struct drm_gpuvm *gpuvm,
> -			    u64 addr, u64 range,
> -			    struct drm_gem_object *obj, u64 offset);
> +			    const struct drm_gpuvm_map_req *req);
> +
>  struct drm_gpuva_ops *
>  drm_gpuvm_sm_unmap_ops_create(struct drm_gpuvm *gpuvm,
>  			      u64 addr, u64 range);
> @@ -1205,16 +1215,14 @@ struct drm_gpuvm_ops {
>  };
>  
>  int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
> -		     u64 addr, u64 range,
> -		     struct drm_gem_object *obj, u64 offset);
> +		     const struct drm_gpuvm_map_req *req);
>  
>  int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
>  		       u64 addr, u64 range);
>  
>  int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
>  			  struct drm_exec *exec, unsigned int num_fences,
> -			  u64 req_addr, u64 req_range,
> -			  struct drm_gem_object *obj, u64 offset);
> +			  struct drm_gpuvm_map_req *req);
>  
>  int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
>  				 u64 req_addr, u64 req_range);
> -- 
> 2.34.1
> 
