Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEAFC9A971
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 08:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073AE10E596;
	Tue,  2 Dec 2025 07:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rn271bYh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FD710E061;
 Tue,  2 Dec 2025 07:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764662211; x=1796198211;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+ol6cofabApWkwuMh/re9xG8ICDg35lfXzT410+OogM=;
 b=Rn271bYhOuAGIzbx2est8B5HDgnGGXGWyw+UZqA01mJDPMNEVNvUQcp2
 AAjfZB5mVhnzifWAAxjHrlR4y/YSzFoCA13QSCai/cM2of7Sq2TbCMtVZ
 V30BvDQTUXbB0Ns9zlRV2zbC/3iKWZt+vj7YThMakolcvQBrUs16m4Alx
 dP2LrlI0JdmEQwaAEdVFokVmTDTD9QzBx+f8yRwF5gOQxi4REfwGi/mNh
 SA6MoKDAI49fjj1LnNpnyQlh/8faE1gZd9deulVLfhNgmP2IXLicGeqg8
 KyhVJRGwqPFHuobgmo+XRoUsEKyxc7+6x0zteHF49UsB/z3fdhZ0+pf4O Q==;
X-CSE-ConnectionGUID: ii7qMYw3R/SY8GzFj0MuWg==
X-CSE-MsgGUID: P4FT6SeXSFeEsI9lqekYSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66657931"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66657931"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:56:50 -0800
X-CSE-ConnectionGUID: F82i1cYjTq6dHjHD4oSQ5A==
X-CSE-MsgGUID: eW7mQSvJQPG2xMkraQc1TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="194521745"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:56:49 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:56:48 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 23:56:48 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.26)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 23:56:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/zg+umUkCb4H/IkOlYdToKPLRMa3lSowKyOVR9I/15SWSOpJvEl/punsSB0sEUkciDuIvMD1XKKM7W933y04v0/8/1B/PYXf4rw82hOASDQhN1VPwB6+xVi17Oh2l3da+QuIhMkiPF3pXlOM+5y3qmnLXk18RbB+lPCBqajmPbaELYT6BpAZenR9FvEgJ0j7qu5nUPL6SzGBbzWP6LPsC6jE7/WOX75RmikxpidjfoudpGmep+r2XQMt9CZPDOD8I3bu7hPKNBVNatiIM3vO2/TD9J6CMljRt+WqO5AgVdzOQg98wDIbNwdciLFCruUIugO4xWobD0bHt23A5Etjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Als+PR3XDYZOKzSpM19FV17z+omKAQsFs95F3ofdkrw=;
 b=h9qEXqgRA5YxFr3lX16vD3W8YiqVNcgrZ6iQ+oahz97GkCdvc+X1qU8iac2fL/baHWqWcjOpWsSEIkEUAFS65WXlyELkQr+A4uihKNKOrLt4hUPvSp/jHs1+ka6yTB9nkPPfp1XrE09vv4N6WqoG3FjFfGfKg13s7mpoOAWkLNOiNxUEQt8jdYWPelaZ9f/QOgUFVe7Oc6myR6hVaJaGNrhLt73gyJ+BRa/o0eUehMlfVs6WRN1hDXgcq/M1PuPw9NdFB6RY1HRaEkdaJLqRH93AV4f/j9NAisUQeaWasLEU6QCOjBcvnHvZB5usAugc96QjOct9JZFlS16KzGXBaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 2 Dec
 2025 07:56:46 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 07:56:45 +0000
Message-ID: <a0e0f7ea-8fc0-44a0-9b32-0538bff42601@intel.com>
Date: Tue, 2 Dec 2025 13:26:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v7,04/15] drm/i915/color: Create a transfer function color
 pipeline
To: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <chaitanya.kumar.borah@intel.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>,
 <harry.wentland@amd.com>, <mwen@igalia.com>, <jadahl@redhat.com>,
 <sebastian.wick@redhat.com>, <swati2.sharma@intel.com>, <alex.hung@amd.com>,
 <jani.nikula@intel.com>, <suraj.kandpal@intel.com>
References: <20251201064655.3579280-5-uma.shankar@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20251201064655.3579280-5-uma.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0216.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::6) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|CY8PR11MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: e7cd4933-3d3e-49cf-9152-08de31785654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0dBMnphdUI1SzI5TGw0Z2I0UDViUW1zcUpTUk50b2NGM25rT0sxRi92NWRq?=
 =?utf-8?B?RGthMTB2Tk0wZzNYU0xYazN0TzNhczNZNFdjVXpOOFd1cnQrdUJhTFhqWTRy?=
 =?utf-8?B?cENMZ01oVFNDRTQ3ZlJiaGwvVHRXeGYveTdnQUFDeEY4WHZ2MHBqREVEcWRC?=
 =?utf-8?B?ZHU5NDZuOWhxVzQ0bDAwQUx0dzcyTHVLN2FxWGlJUXpSSVNBc2xMZDZRZmpv?=
 =?utf-8?B?d3Q2VTdsZ3pCdVZQcTVzdExQSGkrNVo3TFR5SGVKejRSSUZiYkxWZklyWHVt?=
 =?utf-8?B?QUZDb1VGcEJocWdzNCtZM2pmbzFxeGJJUnNlNnE5bkFFK1JuUVNEV1dLM3R4?=
 =?utf-8?B?eGs5QXEyaC80TS9aSjZCeXBDRURqKzMrZEFiN3M5dlF1c3ZKMm9pTVV6ZVY3?=
 =?utf-8?B?SVdsVnROZU5ESWcrQlc1amFveVFmcWFxWTUzWlppOENWdVdianlHQXkycVBY?=
 =?utf-8?B?QjdvRFBwVnpWTDQvRGhoSGoxNTlhTW45akpDdDk1L0VDVHhqZHBEM3h1Z0FQ?=
 =?utf-8?B?WFJNRkRRTThlZXB4dnJVWjhNVkI4SG91VUtYYStKMHJMaFJMMTBjZUM2L0VE?=
 =?utf-8?B?UXJPdk5TeG9IZXBLY2x4R2VpcTBJMDc3cmpDazhWLytoZmVlVExVbitTN3Qr?=
 =?utf-8?B?WkJ3MWVzSWFtb3dLM3o1YmtRc2hNVUV0VzJ2QXpYc3J6SWdYdmhsMnY3TXVU?=
 =?utf-8?B?LytCaHU0cnQ3NllzVmFLVSs1aTJkaFdKRHVGVmlYWXNhb2t6VE1BODZtTjBP?=
 =?utf-8?B?eVpzT3JCTkg4L3BReTUwWWVsZmFKQTJQVnR0QVVhTmdaUkx4NXVPMWcvU2Rv?=
 =?utf-8?B?RTc5MTlOKzlQK2VpS214WmpFQUExMDloYVQ4VVMzWWFENi9qSlFacEtEbDly?=
 =?utf-8?B?NUZ0UmdSeVJvaDBWclh1MHcxMUhwRzdGOEd5S21nK2FEcXBXcm5PbldzZS82?=
 =?utf-8?B?UllKZU1NbTNGLzhKUjQvZzBOMEl2WDNGM1U5RCtWY3E5OFhiTmVzdUNDekZj?=
 =?utf-8?B?QlZSTHhFdUphbW9KLy92T2MvbHlzWlVxSWUwUjdETUoySzYyWXAwZ083R2hp?=
 =?utf-8?B?d3l3ZnRVNmhTWHhVZHFOalZSUWk2Y1FKMUM5M3QxeEFzelR4aHk0NlQzUDlT?=
 =?utf-8?B?bE1YWGtZS0xGWHJ5WWVwL2swQVJNbDBkQmQrcU56ZGhPS1prdjl5Z2RuRXp6?=
 =?utf-8?B?SDdDOXdEQW5yeHd2Zzl1SGorQVRsVno1OVA4SENmc0tqT2cybklQd3dPNFRu?=
 =?utf-8?B?Ynd1K2Z5VjdCTXNKODJqNVZ4UTU2U1BZSldHS29sZ050U2p5WFJETG8vZWxD?=
 =?utf-8?B?cWVHbEN5NHIwYlpEaXYvKzVLWTQrZGNEblZOSmJVYzgvWHMyVzM5SlM0OWZo?=
 =?utf-8?B?OERhR2JWZDVHK3kyMXNEY1pkMno5dDR2TVNwOXUxclppc3B3aWRjYkJJRTlB?=
 =?utf-8?B?Y1V5RGJKcE9JOTVZQXVOL2tlRXVRN3poenRMRitJZlhRdVc5amp4OXNFOEhQ?=
 =?utf-8?B?OHBTOVVvMHA4VnNvOHRnLzdKdTJtYjBESEVaYXRZVFh1dzN1WTFiODM0clJR?=
 =?utf-8?B?VmFJdTdCSTVuZkNjM3diQlZQcCtFNFh1Ujc4YTZiYkYyQWdHa0t1WHBFWEt2?=
 =?utf-8?B?T0R3MlYvd3FWU3gvbGFNWkt1UTJrNEYrekN2MXlCQXozNXhRYlBSdGN1ait1?=
 =?utf-8?B?TFAwOGRGT3RFdGEvNU1Na21WQ1FGWDdPK1V1eCt2czF3VXBOT3VKRGJSdDZk?=
 =?utf-8?B?Y3o5R0RjN1dkbDd5K3FYeHYyUWNGeG5KZGI2YmFKWHFQdU1sUDFYb01CeE5a?=
 =?utf-8?B?R1N0UTFQeEpjREttdnRLdWovcWZ6STVHdysrOTcxRmYrNHRxSUlVVnNMZGNw?=
 =?utf-8?B?L1JrQ1dib09aRjVFVUpwcGhYSVovTzRFdnhQaVdkOWFEZHVEUXBScVA3a2hU?=
 =?utf-8?Q?GRTt4x0wMj72cSFDxdYnXMF+h5A5RvuV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDhQdW5sTk5zaDJmUHpMd1JWbU82NXZhREpMUEw1endveitYOGNVT1pWVitE?=
 =?utf-8?B?NHNxR0hUVnBGQzV4ODhScWsyQzB1NjNvVmpiaHZCZkt4eGRtQXhJakRiYk5G?=
 =?utf-8?B?VlgwcmdVMzVNQzNKeTNMRURzOGkvZnovZmFQU0dDZFp6YzUwRHl1OHg2ZXNO?=
 =?utf-8?B?Z3h5UUNQaDFpWTJWOFlXOTlHMnZHMzdrUW9nWVlnZ2FscmFycTVJQmxSZnR1?=
 =?utf-8?B?UVp2SVhLNUxtTG44cExrWlYxVG95YzlneVNBaUxuRkhRb1FnQWx0L3Axa0Y3?=
 =?utf-8?B?QTBiNm9jK0tKNTM4ZVkxaDJJaVFJSkxqUTBGWHFhUUxpSHgvMFlvaDRRMnFk?=
 =?utf-8?B?a3pISERXT3htY1dLUlhEaUpJanpNU29wclF0eXJ0U3FPT1FacHNRRVNmMnhK?=
 =?utf-8?B?NzVuRisySnBuMEtHNncyRlIvLy9ZK0c4bWRTMitlbkFVUE9va2k0ZHd3TTVX?=
 =?utf-8?B?Z1NpdmwrTFlrUVM4RnlkSEF0emhVanFncXYzcUVsalltaWMxKzZjOGprdHl5?=
 =?utf-8?B?Z1YrTGhRRzlVLy9wbU9GSndWK241SFVxVkhmMUlVNmNPUm1FWXNDSVRMc2ov?=
 =?utf-8?B?dVdFWjNRc1NpUFVGMjMyZkVDY0JpWUJZcHVDOHUwNGU0L1dqUU5XdjQ2ZG9u?=
 =?utf-8?B?cS82b0w5M2xiMGc4RG12VjhIcndsYVlnbUo4OFVMZ3JhaTFjblk2RHVuRElQ?=
 =?utf-8?B?NzdzbldJOE1Ua1pPN3dVNWpzREFHQkN6aEhqN05iOEgzR251YzhDdmVGUzUw?=
 =?utf-8?B?YUR5RkM3WmFKcVRsWXp2WXFBVDcySUJ1K2wzaXMwZzc0b0Q0RmhURXJMYk5B?=
 =?utf-8?B?YUtOaHljcHdSWnNidUhlN3FhZnVBeUNvUE05WVJtUjFZb3kvQ0RvOUN6MW5o?=
 =?utf-8?B?TmVHdHNsRXRXOFZrTEtrd2k2dllleFBKZ2s3NmpLTUk0OXZmT0tZQTRzclVn?=
 =?utf-8?B?dFhFcXk0OXdWUDJPMXBiVTNPeGoyK0RYQXRnMTMzQng2U0NQOGVGUlVNelBk?=
 =?utf-8?B?d21TS2wxZTJvMWZickdJbG81bTh2WUZxcjloc0NQWmxNMXA5N3Z6dm5GUDVk?=
 =?utf-8?B?T01pdjBEVm1zeUNoTk14OGp4NEJycytZYlJkOWk4dFhVZndDOHNMdGxJMm5P?=
 =?utf-8?B?SGF3dWlMUFo4QXVnWlBNZkpaT2pqdURsb3JxTTlhaFdQTlA2RmpCMFFoOHBW?=
 =?utf-8?B?emRublYzWHkvZWpickJYZnJYUm4zaGthNDMyZlI3SXVONWFNL2J4VEZLZlE3?=
 =?utf-8?B?S3JuWU9DcTF6T0FoZzgzRTFNN2dHL3Z1KzNydUsvSE42SUxuT0pSVnhadStj?=
 =?utf-8?B?eWpYRUVhN1NVTzhSMTE4NlVKMGNUSS9OcnVUdGd5UlFkaldRWjZKTnQ0S0g1?=
 =?utf-8?B?M2k2VlcvemQ0bHRaanR5K1pTa2lZdnRNYjJTYzdYWFdqRFBPSDZlTFMvVHNB?=
 =?utf-8?B?VFA2TXBQaFg3N2pKN0lzYU9LaTBoaXEzL3ZkYlZzK2NCQkJ0bk9wb2hCZnRL?=
 =?utf-8?B?d0dqaW11RU5ia2I2cGV5bzNFYnNpTnVXaEhqT1dEdnpkc0swc2tqeVVBUWpj?=
 =?utf-8?B?NjYyendORUU1T3BIc0wvMXppdDZmUlZYNUUxZ3FSMmZkNVgyTngvMStBd0d0?=
 =?utf-8?B?SUxjTGNjYURZRXRsNnN1VTZoR0RWTmR1cXVOaDN5RVc1VXdleHdReG92Zkhq?=
 =?utf-8?B?aE05RmE0cGRKbURFS3JZeHh1YWluc2hEWklTSHRuRUlxZHYwa1B3Y3ViVjJM?=
 =?utf-8?B?a25zYUtCdmc1VUxTS0VaUjhoWDVZUXNIM0NITG52YjEzVDZjVE1ISXdLVmVT?=
 =?utf-8?B?aDZXdEdrWlRhZWI3RFJCMFlnOGpnVEllbWhMZmZUUjVxRjlVaFdrMFRRbjEy?=
 =?utf-8?B?ZUlaVXVsY2JoaXMyUHdvTlNWeUdONTNHVXhMOVVXREFXbHg3UU1uQlpvMUxL?=
 =?utf-8?B?SzlVYmxOOUg5MXVMdEtVR2pXdlNJdkN0M2NuenlGQlc4K3NKT3JobTRCVlBx?=
 =?utf-8?B?eVA2TDY3N3hqYmcrWnZLdEozanlaWWo1MzYxZWZJNnZqMVI0NlhwTXBCZVkz?=
 =?utf-8?B?ek1KWGZVVTNoR2R6YTlhU2tRSVEyNUFtaUJ3UHlKNkIrK25GdGJPZm1BU2tR?=
 =?utf-8?Q?P2wlXiCZfdFHsfcnllEfgBdyD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7cd4933-3d3e-49cf-9152-08de31785654
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 07:56:45.0818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rIq1J++Yr95P139MYj+8Ee0u/AWGKR7TP/y3QXOAvuFIF00rTICRYW7l0VFK166AdAuDYsgzT2boES+4pyl86w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6868
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


On 01-12-2025 12:16, Uma Shankar wrote:
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>
> Add a color pipeline with three colorops in the sequence
>
>          1D LUT - 3x4 CTM - 1D LUT
>
> This pipeline can be used to do any color space conversion or HDR
> tone mapping
>
> v2: Change namespace to drm_plane_colorop*
> v3: Use simpler/pre-existing colorops for first iteration
> v4:
>   - s/*_tf_*/*_color_* (Jani)
>   - Refactor to separate files (Jani)
>   - Add missing space in comment (Suraj)
>   - Consolidate patch that adds/attaches pipeline property
> v5:
>   - Limit MAX_COLOR_PIPELINES to 2.(Suraj)
> 	Increase it as and when we add more pipelines.
>   - Remove redundant initialization code (Suraj)
>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |  1 +
>   .../drm/i915/display/intel_color_pipeline.c   | 97 +++++++++++++++++++
>   .../drm/i915/display/intel_color_pipeline.h   | 13 +++
>   drivers/gpu/drm/xe/Makefile                   |  1 +
>   4 files changed, 112 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_color_pipeline.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_color_pipeline.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 7c19d5345d88..ca5c69d1cb08 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -241,6 +241,7 @@ i915-y += \
>   	display/intel_cmtg.o \
>   	display/intel_color.o \
>   	display/intel_colorop.o \
> +	display/intel_color_pipeline.o \
>   	display/intel_combo_phy.o \
>   	display/intel_connector.o \
>   	display/intel_crtc.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> new file mode 100644
> index 000000000000..1415f94dd3e3
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include "intel_colorop.h"
> +#include "intel_color_pipeline.h"
> +#include "intel_de.h"
> +#include "intel_display_types.h"
> +#include "skl_universal_plane.h"
> +
> +#define MAX_COLOR_PIPELINES 2
Should this be same as INTEL_CB_MAX defined in intel_display_limits.h ?
> +#define PLANE_DEGAMMA_SIZE 128
> +#define PLANE_GAMMA_SIZE 32
> +
> +static
> +int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
> +{
> +	struct intel_colorop *colorop;
> +	struct drm_device *dev = plane->dev;
> +	int ret;
> +	struct drm_colorop *prev_op;
> +
> +	colorop = intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
> +
> +	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
> +						  PLANE_DEGAMMA_SIZE,
> +						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
> +						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +
> +	if (ret)
> +		return ret;
> +
> +	list->type = colorop->base.base.id;
> +	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop->base.base.id);
> +
> +	/* TODO: handle failures and clean up */
> +	prev_op = &colorop->base;
> +
> +	colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
> +	ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> +					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, &colorop->base);
> +	prev_op = &colorop->base;
> +
> +	colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
> +	ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
> +						  PLANE_GAMMA_SIZE,
> +						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
> +						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, &colorop->base);
> +
> +	return 0;
> +}
> +
> +int intel_color_pipeline_plane_init(struct drm_plane *plane)
> +{
> +	struct drm_device *dev = plane->dev;
> +	struct intel_display *display = to_intel_display(dev);
> +	struct drm_property *prop;
> +	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
> +	int len = 0;
> +	int ret;
> +
> +	/* Currently expose pipeline only for HDR planes */
> +	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
> +		return 0;
> +
> +	/* Add "Bypass" (i.e. NULL) pipeline */
> +	pipelines[len].type = 0;
> +	pipelines[len].name = "Bypass";
> +	len++;
Code for creating Bypass and COLOR_PIPELINE property is there in 
drm_core and is exported as drm_plane_create_color_pipeline_property()

Can this function be used to avoid code duplication?

Thanks and Regards,
Arun R Murthy
-------------------

> +
> +	/* Add pipeline consisting of transfer functions */
> +	ret = _intel_color_pipeline_plane_init(plane, &pipelines[len]);
> +	if (ret)
> +		return ret;
> +	len++;
> +
> +	/* Create COLOR_PIPELINE property and attach */
> +	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
> +					"COLOR_PIPELINE",
> +					pipelines, len);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	plane->color_pipeline_property = prop;
> +
> +	drm_object_attach_property(&plane->base, prop, 0);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.h b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
> new file mode 100644
> index 000000000000..7f1d32bc9202
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_COLOR_PIPELINE_H__
> +#define __INTEL_COLOR_PIPELINE_H__
> +
> +struct drm_plane;
> +
> +int intel_color_pipeline_plane_init(struct drm_plane *plane);
> +
> +#endif /* __INTEL_COLOR_PIPELINE_H__ */
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 3420725c4ba8..89f922d745ba 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -235,6 +235,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   	i915-display/intel_cmtg.o \
>   	i915-display/intel_color.o \
>   	i915-display/intel_colorop.o \
> +	i915-display/intel_color_pipeline.o \
>   	i915-display/intel_combo_phy.o \
>   	i915-display/intel_connector.o \
>   	i915-display/intel_crtc.o \
