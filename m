Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D31A33BB1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 10:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1172C10E093;
	Thu, 13 Feb 2025 09:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="enjSAof8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FFC10E361;
 Thu, 13 Feb 2025 09:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739440553; x=1770976553;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+SowSeL73WwLM1s9sq/yXtrTLl5EECDay1sR5UODE10=;
 b=enjSAof8Kv7vc89jC0MO3+paXdTFJcKnIHavtXHROMDcEizoWUW/FqPY
 tRUvHyDyZJ8YLe3U3WWbv876wKLN9TX+KPeW9lZLBEA3C2DCExVIRrRNe
 9SJ9cR2MbEYwg0dT/aiLhNZRrTUTOmJbCdO2l4JaDBeG48qoLqFPZeQmh
 a0iU2/VwIj7qHbEBcd1osc5CcwYk0nPFGAzYoX31s72wj+FNmB9qQc3fk
 WjQWqOsMws3xoA1HDgQ1BWc1FSWnx0AQL9oHQk5qeBB/0tFmwhnviUmSD
 0il2JRKH1s5TTz44q2NZnjedC/WlXlkHdK/cM8Ibuhfb4svBK24o33GnC A==;
X-CSE-ConnectionGUID: rXlCkKXxTkqnt+b2eqwdSw==
X-CSE-MsgGUID: 72hxke3ER6mkpGUe/FcoSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39321844"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="39321844"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 01:55:48 -0800
X-CSE-ConnectionGUID: K0DolFvnRv2r4BnKWRGt8g==
X-CSE-MsgGUID: buSyKdS0THSF+/Bxm4tm6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113759367"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 01:55:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 01:55:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Feb 2025 01:55:47 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 01:55:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Txso62MBRAIA1xGtJmymQ7CdlF3DxsRp/AdiqWG9CAw1lbtniksxPir8Dqsl73dfm8J4We9EkkT+VTZzGF57TIJteAQRWjRxiSn7/+3Hcxu2FDtKp4ZBllM2p74RxB7cZTAGjISHvIUDfmYt1gQNi2fKI/tCze1sCzGOeLUPrTrWs9ltvSQeJ/jGbJIYN2no6QAJDC3eIpAKZhuxJgpsvr97vdz3INbWNHhn6YrxhCXSOhiyP48mwueHd12eowr8cxBuuWcE2eY0ETKDVO4UPGPc7C6xH9ZQqWFdFUnsSx1o9t25bsQUOChUdtxDsGWrrWH87BXmpxcETU4aocnc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SowSeL73WwLM1s9sq/yXtrTLl5EECDay1sR5UODE10=;
 b=i/oGMerBUPnDmWM43AKFbKN9Q3NvYThT3arcL4SPmfkc+KtZSpfK+rotzRhqZsLlsQ0cTMl9PMldEaDOtvnWJrKzqDXucVDfPxrygafDrUHT9Q5b1bEfBt6qtytgAMm+9WQ8+vcOVZaWBb7T6PrHRNfWmviJ7lE5yGuNFWDE4IYJvKRhgnobB/Sng63jfobIAbU5TjD6820qsstMs22plkFnB/kKRPjWIXwVJXUmeuH4jzv+RiweZGjdVVMI0ABICRd5PIyjcBlxmQA4VRUI3omdEiJHJYOlDP2NdXBoe4+4gg9lRHyis0xLo4N6cUnjJlTeLLoz62kLrcpFi/N3xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SA3PR11MB8003.namprd11.prod.outlook.com (2603:10b6:806:2f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Thu, 13 Feb
 2025 09:55:45 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 09:55:45 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: RE: [PATCH v5 2/3] drm/plane: modify create_in_formats to accommodate
 async
Thread-Topic: [PATCH v5 2/3] drm/plane: modify create_in_formats to
 accommodate async
Thread-Index: AQHbfWvZsN+QiOEOkEOk1UUNnnpUjrNE/zAA
Date: Thu, 13 Feb 2025 09:55:45 +0000
Message-ID: <SJ1PR11MB61298FCBE2ACEAC1F10C444EB9FF2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250212-asyn-v5-0-dc182281dca3@intel.com>
 <20250212-asyn-v5-2-dc182281dca3@intel.com>
In-Reply-To: <20250212-asyn-v5-2-dc182281dca3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SA3PR11MB8003:EE_
x-ms-office365-filtering-correlation-id: 9cc00235-b9eb-433f-4b32-08dd4c1495dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?dWZLSUZ6V3NtNW9ydzZVQW4wTm55NnI5MVcwRUlIMFZseUw0dEpIYkFyZFM0?=
 =?utf-8?B?alRUVkcxak56aU1lTEg0aE5CcnY5dyt5ckxQczJMSEloOWwxNWZRR0dTMjZG?=
 =?utf-8?B?dWUxbzBsZ2lJaG1TcFJqUE5nZHlNNHp0MWFBMFVRNWhiVFpRUHgrU3RQOHda?=
 =?utf-8?B?eFVZK3VqRGwzUldzem5TRWFMVkVuYkJZdnB0Z211YVFRUHFJT2hNTDdjR2xm?=
 =?utf-8?B?OWg5LzRrVzhXcXVveVFKVE52d1FSVDJycUNkWWcyQ1FVMHJlZjhzbVZjNm5h?=
 =?utf-8?B?Wjgvbk11TmtNVGMrQ0sreHY0eWhWYkR6b3RmdllXZGd3ZjQ2alo1c2RTMmJh?=
 =?utf-8?B?NE1YazNsY3pzVlE4VmRiRGY4VzhuNE04OStDQWRJUzhBQ2U1ZHZwbHJ3SXFD?=
 =?utf-8?B?UHN0OGN5RFZGc0ZCT0RrT0xWanVLcWZJaGhkbEFTOXcrRHYxdEZDK1ZqQWV3?=
 =?utf-8?B?RGd4ZU5qNlN6YWZ5ZW4zeHg4b3BsSzlRWEorS0x6UUI4cmJWQVE5SW4zRFFP?=
 =?utf-8?B?bFRpZGtPdnp2VGNCME5teWROMzZzVWZ0QXd5S2RVOXBZb1k0Z3FVSW5tSG12?=
 =?utf-8?B?cktJM0NjUDF4eVBNWG56aVlnSGxma0tFOEdXZHVHc1NQc05nS29WbmJSU3Fj?=
 =?utf-8?B?VmpuMlRwNGJYMERpamthL3JWZjRzakkxa21OWVFJcEtwOEhTRXlCVEsxQ0RD?=
 =?utf-8?B?S0dPSWcxNndleDZpUU9oa3lyQThCZ0pKSC9VdHFRYUd6Ukdwa0NnZUs4UDBC?=
 =?utf-8?B?eVlwd2g4bGdQVXk4QVgzVWk5M2pIaFBCZUZNbmwweCtHUWVIOFExYlBqQTVs?=
 =?utf-8?B?QlB2a09rUmZIVjdLS0VmSVJyampubkJyVFlISFBuL0JJam50YW1LUnlBQm85?=
 =?utf-8?B?dlQ3a1RPZjVrTEVCYytabXEyVm1Kc3FrbHBlY1I0dXZpQVZuUTcrWXhtRm82?=
 =?utf-8?B?RHJEZ2RSeGV0SFZmMlc3MmVWVk9jUktObGJ2cU1SaWNJQkt2SDFjNFFEeEZ1?=
 =?utf-8?B?MFdZR2FPbThiVDRqVGlyNlBaajg0UWZ3Skd3RDZQWTFiTFVIaGJMMDFDMXJW?=
 =?utf-8?B?N3R2cnFwMUI0UmpzZi9mUytPanlCQ0FDNStqQ2VpZVFIbFdzRjVYd0lKVVda?=
 =?utf-8?B?QlVKV0UxQnJXUk1SWk03bE1Qa2k2cWwvL1QyNXpzOUQyMXdpeC9ldmVlcDdS?=
 =?utf-8?B?RmR6cFJxbWxtSW1xS2I3YUhUbXVkazVRcGdnSkxmRWhTbVd3b1VId1Q1UDF3?=
 =?utf-8?B?WDkraDB1ZjFJaktpUDRra2lvYUFMT2ozWHlTQUNvbmpxOTRCdThGemJPOUlV?=
 =?utf-8?B?OWNHQVViWFU3NXE4ZWZPc1lnRzRIN3Q0b0thN3BaaTVrMWhDcUtuSDVFamJi?=
 =?utf-8?B?TnFRYVUrdXhhaXEvVkx6Y2hLNWNlWDNKNkdRWWR1VG5xcjFUNWRSVEZscHlJ?=
 =?utf-8?B?VDk1RWhHVkpCcy83OTdQdlJIaldnWEdabG5PL1dGd051dTFLcDIzSFg0ZDE1?=
 =?utf-8?B?MFUvUXJDaGovU0I0MXhjUmVPZEw3WHpROGhGUXZibFNZeGR1K0N2NHY2LzdL?=
 =?utf-8?B?c0Y0VG81NjV3dGVzWGdBalZ3UUkwS2o3NmMvSWk3NVY4M0lmajN2a3N3YXBi?=
 =?utf-8?B?Yng1NFRtdUdxQ3ByNVhVRnNVREY3cjlFbUptWHV5RFZvL1FUYTBjc1VvNjNF?=
 =?utf-8?B?Q0dLbkdjOFdFa25KTDBsR2QvckJPNHoyNnlaUUk2aDB3VnR4TTd6cWNlVW11?=
 =?utf-8?B?V0ZoOXJJbnVVbkJxT0NTWnZIYlM4RkUrWU4zb2RESVVDTWtZODNDT1F2T2ZR?=
 =?utf-8?B?V0JjcHcxS21aNVVPaTFCQmI1ZXM3a0w4MlZDZ2p1czN5OEgrMDYrdnZ3dURE?=
 =?utf-8?B?Z3ZuQUlWbFQ5RS8zbVZnTDB2aXA5b1JoUHRjQmpyUHhEcWdxZHE3L29mbnds?=
 =?utf-8?Q?0yS4UyoWzvrT/jIungc60bQ2E9qIMsG+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHZ3SGJERDVhbjhLdnhDbHZXTEYyM1YwRUE1N3dQS2E1N3N6bVZxYmZSTldQ?=
 =?utf-8?B?aXFlWGNZWWp0eXoxV3hWV0s4L2hILzhySER4TXErb1hNU2lBckI1MHVhcVZD?=
 =?utf-8?B?TkkwWkFZQ2lnNGVtT2VYYThET2ZJd1gwRnJtL09tT3RzRVUybWcvQ0duL2ZC?=
 =?utf-8?B?SVMwbDVVTW41WGNkS1c1SDZLVjN1QXp4YlJXaHNzaUFUclp3OUVsQndtdWtL?=
 =?utf-8?B?bkJ5UGtSaERqL0kvcE5aSmdxVi9ld1lNNmg4NVl0bm5nemNraGdDZndPckJm?=
 =?utf-8?B?U01xQXNkQVpSanZMSXNiTDFCRGUxRUZ3NjdCa3JQQnk3SnVNc2tXMzg5MVFM?=
 =?utf-8?B?MXJBYmxKRThWZkxZUVdzYnJ2ZS9nYi9NbkljaWt3L2k0dEVnM0tWME1wcCtD?=
 =?utf-8?B?Sk9nbW01bjFNeHRDS3lJbzBMNXVPU1FuTTBlMEhqYVVOdlVqbUMrSWF3Sll1?=
 =?utf-8?B?TUNUWmlidVhOc0VxcEg5ZEhPeG5pSGFPVWtZWGNMbHp6YkRCT2lHRWV5MGVN?=
 =?utf-8?B?anNidHBDZXVpeFRHZWlQRzZSbWs3a0o0VlYzKzluZUliZVJ4NEU4VHdmcmJN?=
 =?utf-8?B?dENTV2pLY2l2aFk4a1RMS1YrOCtreVdGRjhERzM3VVRKTmNDb21UL3lDM2p1?=
 =?utf-8?B?aEpMRTF1UTc5Ym8yQnF6am9lT2ZSTGRWb3N2MnVvaFRzYjJ3cnNyOHNxYUtX?=
 =?utf-8?B?bC8yUjFCNVVXdWtBb3ZWOS9FUDNGSWRyRHIybEtOeHVUMUdKc0xwOURQWDd0?=
 =?utf-8?B?U1JKZjNCUWxDdkVzMDhOUXVEdTAwMS9RcXVHNnhVUXd5TU1tRnRjeGF3N3Bm?=
 =?utf-8?B?SzJpZlNaenF0L1M1TGJLKzI0eG50UnVoUFJLNDF5RTlia1pDQmtEMkQxM0cv?=
 =?utf-8?B?SThaK2ZSNmZ3cXdjTlBqTnQ4elpMcmx6ZFk5Y2o5Q1Q4WTJSNXdudGJtUnA4?=
 =?utf-8?B?SVBEZm05OFlTVENZSDFIL1FrdjdEVUdzUVBsWjBCQVU5OXdteThEYXRqVDFo?=
 =?utf-8?B?L25FT2srRk1mQ2cvQXBTdXZQUEtZR0U5RGptc3lKMHR5YVlKZzZPYWVxRjNL?=
 =?utf-8?B?OGpaczRsak4veUhsSld2S3RzS2VsWHptYnR0V2ZLTGNUUlF6WHVEUlJMM1Ro?=
 =?utf-8?B?NlpDUXJnR0x0eVY1SjJYNHNrUzdOdFpkYTR1NnlYRTlXYXh2a2Q5b2h3c01V?=
 =?utf-8?B?eWtvTmJRNmRkeUZPVWwzZjdxbkhVdUlVVTNjTXpXbXkwdGVYLzZ3c0RKYVBY?=
 =?utf-8?B?emY3VGRKRGs5K0NKZnBjUCtWOGZoU1Mvb3V4M2F6QlZKZ3RCMkRGSG5JMC9X?=
 =?utf-8?B?b3ZHNWJsZEtGdllhSWJmeWNMR29jWTZYL2RQSkVRTGtWb0x4N04rYXErSHVa?=
 =?utf-8?B?L2lmaWtMS3RUbS95OVU3cjc3OTB4UkJiazZ6SkppMmZlbHltb21CT3FRN0dy?=
 =?utf-8?B?UVFuQkdncnN4MjY2NndTTk5TNE1iQ3RUOE1MZU05Z3ZzUDVqYkthQ1pWWXJC?=
 =?utf-8?B?NEp3bUFHcDZBVEtaUlJTN2M4MFZhSHJ5WFVRUy9wWFh0N2RZNWgwcWg2clNE?=
 =?utf-8?B?SCtXOUw3bFNMcUNIU2hIdFJyalgzcUNsWmkyQzBzdVlKS3A3OHh2aTJIbTFN?=
 =?utf-8?B?OXdYVm0zcUZrYy96N05ESStpN3dTSXB1bnVlTDhiNE0rZTc0T2ovbjBOK3BH?=
 =?utf-8?B?MzFNdXQvMnU1MVdtMHpJRjFqRFp4VitjNGg0S1d4RzhSL2dDQ1p6b1JYMnM5?=
 =?utf-8?B?RW5NK1hYTmgzRFFBU2hYQk5FNmwwRSt4S3BCOTVRdzFRZThXai9ycmR4SDhH?=
 =?utf-8?B?aEpZR2k3L2NpQmUwbDdjUWdBTTVGYmo5cXVSMTRYekRtNDl2U0lqYkZabThi?=
 =?utf-8?B?S3BjL0VwUFpRaFpLWHczaksxOUJxZTA1YmtTQklBY3VSZ2JtNDZjd25rcTZ1?=
 =?utf-8?B?amdiUmpKNFpibmprckxybkt3VCt0TCtxTkk0N1Z2b29jWkIrTHJIQ0c3QTIv?=
 =?utf-8?B?Z3l3eE11VXZrQVlHSUZSWCtYcnIyNGY2WTl3aFp2eFVwTkpERG1pdzVGSFNm?=
 =?utf-8?B?OTgybTJBUnFKWE1UZEZjUWdhU0cyTVJZWVRiUlBYM1JrOUxCNkhoT1kreGx0?=
 =?utf-8?B?RmJGcS84b216Ny9aNkZiWUJ2VVBzWjRsY3VqeFFZNnlDY2VaWEpTZ3Y2QWM4?=
 =?utf-8?B?aEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc00235-b9eb-433f-4b32-08dd4c1495dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 09:55:45.3659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AXHOVWov+exb7ri/STHC6wg0oF2RPqiGJrrfpa16uEbbPjONBjN+XMuGJ4+juDIj5m4Ep8s/KsjhHwWpNYyRMPUOpVcJF+2K+NrxdFx+80g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8003
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNdXJ0aHksIEFydW4gUiA8YXJ1
bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMTIsIDIw
MjUgOTo0OCBQTQ0KPiBUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBDYzogQm9yYWgsIENoYWl0YW55YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFo
QGludGVsLmNvbT47IFN5cmphbGEsDQo+IFZpbGxlIDx2aWxsZS5zeXJqYWxhQGludGVsLmNvbT47
IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BB
VENIIHY1IDIvM10gZHJtL3BsYW5lOiBtb2RpZnkgY3JlYXRlX2luX2Zvcm1hdHMgdG8NCj4gYWNj
b21tb2RhdGUgYXN5bmMNCj4gDQo+IGNyZWF0ZV9pbl9mb3JtYXRzIGNyZWF0ZXMgdGhlIGxpc3Qg
b2Ygc3VwcG9ydGVkIGZvcm1hdC9tb2RpZmllcnMgZm9yDQo+IHN5bmNocm9ub3VzIGZsaXBzLCBt
b2RpZnkgdGhlIHNhbWUgZnVuY3Rpb24gc28gYXMgdG8gdGFrZSB0aGUNCj4gZm9ybWF0X21vZF9z
dXBwb3J0ZWQgYXMgYXJndW1lbnQgYW5kIGNyZWF0ZSBsaXN0IG9mIGZvcm1hdC9tb2RpZmllciBm
b3INCj4gYXN5bmMgYXMgd2VsbC4NCj4gDQo+IHY1OiBjcmVhdGVfaW5fZm9ybWF0cyBjYW4gcmV0
dXJuIC12ZSB2YWx1ZSBpbiBmYWlsdXJlIGNhc2UsIGNvcnJlY3QgdGhlIGlmDQo+IGNvbmRpdGlv
biB0byBjaGVjayB0aGUgY3JlYXRpb24gb2YgYmxvYiA8Q2hhaXRhbnlhPiBEb250IGFkZCB0aGUg
bW9kaWZpZXIgZm9yDQo+IHdoaWNoIG5vbmUgb2YgdGhlIGZvcm1hdHMgaXMgbm90IHN1cHBvcnRl
ZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50
ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYyB8IDQ2ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+IC0tLS0tLS0tLS0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3Bs
YW5lLmMNCj4gaW5kZXgNCj4gYzlkODg3MTQxNzcyMjE4NmQyYjZmODcxOTdjOWUxNWE3MDkyNGI0
Zi4uMDFmNjdmMWY1ZjI5ZTM3YjhkMGUwNzkzYw0KPiA1OGJiZTFiYmEzMzdlYjIgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxhbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX3BsYW5lLmMNCj4gQEAgLTE5MCw5ICsxOTAsMTIgQEAgbW9kaWZpZXJzX3B0cihzdHJ1
Y3QgZHJtX2Zvcm1hdF9tb2RpZmllcl9ibG9iDQo+ICpibG9iKQ0KPiAgCXJldHVybiAoc3RydWN0
IGRybV9mb3JtYXRfbW9kaWZpZXIgKikoKChjaGFyICopYmxvYikgKyBibG9iLQ0KPiA+bW9kaWZp
ZXJzX29mZnNldCk7ICB9DQo+IA0KPiAtc3RhdGljIGludCBjcmVhdGVfaW5fZm9ybWF0X2Jsb2Io
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9wbGFuZQ0KPiAqcGxhbmUpDQo+ICtz
dGF0aWMgaW50IGNyZWF0ZV9pbl9mb3JtYXRfYmxvYihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBz
dHJ1Y3QgZHJtX3BsYW5lDQo+ICpwbGFuZSwNCj4gKwkJCQkgYm9vbCAoKmZvcm1hdF9tb2Rfc3Vw
cG9ydGVkKQ0KPiArCQkJCQkJKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiArCQkJCQkJIHVp
bnQzMl90IGZvcm1hdCwNCj4gKwkJCQkJCSB1aW50NjRfdCBtb2RpZmllcikpDQo+ICB7DQo+IC0J
Y29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZyAqY29uZmlnID0gJmRldi0+bW9kZV9jb25maWc7
DQo+ICAJc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpibG9iOw0KPiAgCXN0cnVjdCBkcm1fZm9y
bWF0X21vZGlmaWVyICptb2Q7DQo+ICAJc2l6ZV90IGJsb2Jfc2l6ZSwgZm9ybWF0c19zaXplLCBt
b2RpZmllcnNfc2l6ZTsgQEAgLTIzNCwyNCArMjM3LDI2DQo+IEBAIHN0YXRpYyBpbnQgY3JlYXRl
X2luX2Zvcm1hdF9ibG9iKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdA0KPiBkcm1fcGxh
bmUgKnBsYW5lDQo+ICAJbW9kID0gbW9kaWZpZXJzX3B0cihibG9iX2RhdGEpOw0KPiAgCWZvciAo
aSA9IDA7IGkgPCBwbGFuZS0+bW9kaWZpZXJfY291bnQ7IGkrKykgew0KPiAgCQlmb3IgKGogPSAw
OyBqIDwgcGxhbmUtPmZvcm1hdF9jb3VudDsgaisrKSB7DQo+IC0JCQlpZiAoIXBsYW5lLT5mdW5j
cy0+Zm9ybWF0X21vZF9zdXBwb3J0ZWQgfHwNCj4gLQkJCSAgICBwbGFuZS0+ZnVuY3MtPmZvcm1h
dF9tb2Rfc3VwcG9ydGVkKHBsYW5lLA0KPiAtCQkJCQkJCSAgICAgICBwbGFuZS0NCj4gPmZvcm1h
dF90eXBlc1tqXSwNCj4gLQkJCQkJCQkgICAgICAgcGxhbmUtDQo+ID5tb2RpZmllcnNbaV0pKSB7
DQo+ICsJCQlpZiAoIWZvcm1hdF9tb2Rfc3VwcG9ydGVkIHx8DQo+IGZvcm1hdF9tb2Rfc3VwcG9y
dGVkDQo+ICsJCQkJCQkJKHBsYW5lLA0KPiArCQkJCQkJCSBwbGFuZS0NCj4gPmZvcm1hdF90eXBl
c1tqXSwNCj4gKwkJCQkJCQkgcGxhbmUtPm1vZGlmaWVyc1tpXSkpDQo+IHsNCj4gIAkJCQltb2Qt
PmZvcm1hdHMgfD0gMVVMTCA8PCBqOw0KPiAgCQkJfQ0KPiAgCQl9DQo+IA0KPiArCQlpZiAoIW1v
ZC0+Zm9ybWF0cykgew0KPiArCQkJbW9kLT5tb2RpZmllciA9IDA7DQo+ICsJCQlibG9iX2RhdGEt
PmNvdW50X21vZGlmaWVycy0tOw0KPiArCQkJY29udGludWU7DQo+ICsJCX0NCg0KSSBkb24ndCB0
aGluayBjaGFuZ2Ugd29ya3MuIDAgcmVwcmVzZW50cyBEUk1fRk9STUFUX01PRF9MSU5FQVIuIA0K
DQo+ICAJCW1vZC0+bW9kaWZpZXIgPSBwbGFuZS0+bW9kaWZpZXJzW2ldOw0KPiAgCQltb2QtPm9m
ZnNldCA9IDA7DQo+ICAJCW1vZC0+cGFkID0gMDsNCj4gIAkJbW9kKys7DQo+ICAJfQ0KPiANCj4g
LQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsIGNvbmZpZy0NCj4gPm1v
ZGlmaWVyc19wcm9wZXJ0eSwNCj4gLQkJCQkgICBibG9iLT5iYXNlLmlkKTsNCj4gLQ0KPiAtCXJl
dHVybiAwOw0KPiArCXJldHVybiBibG9iLT5iYXNlLmlkOw0KPiAgfQ0KPiANCj4gIC8qKg0KPiBA
QCAtMzY4LDYgKzM3Myw3IEBAIHN0YXRpYyBpbnQgX19kcm1fdW5pdmVyc2FsX3BsYW5lX2luaXQo
c3RydWN0DQo+IGRybV9kZXZpY2UgKmRldiwNCj4gIAl9Ow0KPiAgCXVuc2lnbmVkIGludCBmb3Jt
YXRfbW9kaWZpZXJfY291bnQgPSAwOw0KPiAgCWludCByZXQ7DQo+ICsJaW50IGJsb2JfaWQ7DQo+
IA0KPiAgCS8qIHBsYW5lIGluZGV4IGlzIHVzZWQgd2l0aCAzMmJpdCBiaXRtYXNrcyAqLw0KPiAg
CWlmIChXQVJOX09OKGNvbmZpZy0+bnVtX3RvdGFsX3BsYW5lID49IDMyKSkgQEAgLTQ3NCw4ICs0
ODAsMjQNCj4gQEAgc3RhdGljIGludCBfX2RybV91bml2ZXJzYWxfcGxhbmVfaW5pdChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LA0KPiAgCQlkcm1fcGxhbmVfY3JlYXRlX2hvdHNwb3RfcHJvcGVydGll
cyhwbGFuZSk7DQo+ICAJfQ0KPiANCj4gLQlpZiAoZm9ybWF0X21vZGlmaWVyX2NvdW50KQ0KPiAt
CQljcmVhdGVfaW5fZm9ybWF0X2Jsb2IoZGV2LCBwbGFuZSk7DQo+ICsJaWYgKGZvcm1hdF9tb2Rp
Zmllcl9jb3VudCkgew0KPiArCQlibG9iX2lkID0gY3JlYXRlX2luX2Zvcm1hdF9ibG9iKGRldiwg
cGxhbmUsDQo+ICsJCQkJCQlwbGFuZS0+ZnVuY3MtDQo+ID5mb3JtYXRfbW9kX3N1cHBvcnRlZCk7
DQo+ICsJCWlmIChibG9iX2lkID4gMCkNCj4gKwkJCWRybV9vYmplY3RfYXR0YWNoX3Byb3BlcnR5
KCZwbGFuZS0+YmFzZSwNCj4gKwkJCQkJCSAgIGNvbmZpZy0+bW9kaWZpZXJzX3Byb3BlcnR5LA0K
PiArCQkJCQkJICAgYmxvYl9pZCk7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKHBsYW5lLT5mdW5jcy0+
Zm9ybWF0X21vZF9zdXBwb3J0ZWRfYXN5bmMpIHsNCj4gKwkJYmxvYl9pZCA9IGNyZWF0ZV9pbl9m
b3JtYXRfYmxvYihkZXYsIHBsYW5lLA0KPiArCQkJCQkJcGxhbmUtPmZ1bmNzLQ0KPiA+Zm9ybWF0
X21vZF9zdXBwb3J0ZWRfYXN5bmMpOw0KPiArCQlpZiAoYmxvYl9pZCA+IDApDQo+ICsJCQlkcm1f
b2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcGxhbmUtPmJhc2UsDQo+ICsJCQkJCQkgICBjb25maWct
DQo+ID5hc3luY19tb2RpZmllcnNfcHJvcGVydHksDQo+ICsJCQkJCQkgICBibG9iX2lkKTsNCj4g
Kwl9DQo+ICsNCj4gDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjI1LjENCg0K
