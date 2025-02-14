Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B09A358D0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 09:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01ECE10EBFD;
	Fri, 14 Feb 2025 08:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpNs27B/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3528C10EBFC;
 Fri, 14 Feb 2025 08:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739521603; x=1771057603;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8yQ44TMRX9Y6n6kWMix8fKrAnIO21DKhb/hO5CVmY1s=;
 b=YpNs27B/kxyBpSUIHSu/r8byfD518b+JTtr0fuEAbFdk9vDwX+T1aAQb
 DX4z92VgWTETkAXymz3nC1zc7qGe9KfNqKvColGcyD7foAEmIdAz7w8JL
 BF96Qg6iqIm0fAxxgNqktGKw/j6UvxgSlEQjt1/TYJN0GKa2/91B2bB9t
 SSxGxh5r9Gd4xYSEow6pg6nEgtxdMUr3pKacV2Ep5ZGMIZ5EPnlxeFKf3
 sqSkgLCwwqtOYv8TSZZYCfkrhCgSOQPhDUVThzmOnsNjJckQ76EqTu9Q8
 22sigqtIhl6Bl132gxdZopzZustvvcNrYli44hDPoPZObi1PnPxxBbF5y Q==;
X-CSE-ConnectionGUID: yLWmDlZKR+eygHuZ5gtF6Q==
X-CSE-MsgGUID: Napy8I8LSDaAwGMhmZFI4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40135135"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40135135"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 00:26:43 -0800
X-CSE-ConnectionGUID: eFOI6rBXRzKLIOaw43fEgQ==
X-CSE-MsgGUID: K1/8X61LR+aEsPH4y/OJ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117527553"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 00:26:43 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 00:26:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 00:26:42 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 00:26:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKTf24Ylj2vJN8EpFPywvXYXbOUmbmfd+ZDiBkgg2mJMee2LWovS9s/ezk0MQSXh1yMOQjapTJqmOmngucP/Y1p0j59KbO9izYUpKDtyC7Ig2AHHeprTp9fwy/JVdOX85DzGbgM90ldf+HEQ1pn4CstiXAYI7b5zdgR1UKy1XILupKiugY0M7CwXwDV13737+WmekGnh9L7ErxCp435SPWcuw5p8R6OUuLJ0HtXHh1l0Lbc0eOTChfoqLAh5NNOgXFNnXWbrnG5lZUahYd1A702S+I3NJ9Ur6EIJ/OsXQ8DHq+9Ai3Jo9M/uOA/+QVJr9EMptyVvGdAypKbYF6Yzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yQ44TMRX9Y6n6kWMix8fKrAnIO21DKhb/hO5CVmY1s=;
 b=n3umMBB6xQue58YxrJs4hKgwpryYPIBHRSquCefdWQJ+JRiQOvE0vAIGQ0JBrd5KwEHLPm3gvcmKsXVlRhkaxlCIPP1FakuLw4zAhaxiw5yyqLhTZaAyCQLA4s3PFO87HTacKtcPLD23RNOBJrYv5PlWW8gzg3cC1XhPr5D2B2mCTuISjBuVyszJNRNiQvhRCMOdTEUieVohDFcYnBNMPpeYjChhAhyO8M7CMOqxasvPx5T3diCbmvaBUSzZztcxwcg1zMf5x+om+Y8L7tmwTpxZZ+2/+HP3/LNP2MPR7/BtYih9ivphXH8GIO7XDszNGGWiV3+s8INfw5MgoZgvfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA1PR11MB7917.namprd11.prod.outlook.com (2603:10b6:208:3fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Fri, 14 Feb
 2025 08:26:39 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 08:26:39 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: RE: [PATCH v5 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Topic: [PATCH v5 1/3] drm/plane: Add new plane property IN_FORMATS_ASYNC
Thread-Index: AQHbfWvSlpXtD++Tyk2VlVTtFrlmyrNGeLmQ
Date: Fri, 14 Feb 2025 08:26:39 +0000
Message-ID: <SJ1PR11MB6129FF27D438877D8B01B768B9FE2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250212-asyn-v5-0-dc182281dca3@intel.com>
 <20250212-asyn-v5-1-dc182281dca3@intel.com>
In-Reply-To: <20250212-asyn-v5-1-dc182281dca3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA1PR11MB7917:EE_
x-ms-office365-filtering-correlation-id: 75a2ea8e-e771-4e25-312a-08dd4cd14dd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ejBaVXFCUlpXSnBHaVVUeXR4OGM4RXpuQXZlcWpPOW1ZSGJxeVpHVjV5UHNt?=
 =?utf-8?B?WGZHR3piMW1QZi9ScjIxWDhCRmZZNmNrelVBTkZCMnpHcjZGS1pVNmdhQ0l0?=
 =?utf-8?B?UFdyOUlYMC9PM2hLblBHNEZ2azE5c08zblpkckFhV2QzOWczTHdFMlZ3Mjho?=
 =?utf-8?B?Ull4bmdZWUNiTmMwZVZMTDZqdldTdjlxdHdUYlVTWmdpdXdwMUpQN1dnMCth?=
 =?utf-8?B?MytlcDJtdGpwQ0ducHJ5MkNGZ0JBSGNBUXVGdkxRU21kRkd2Ti8zakczcHA2?=
 =?utf-8?B?bHJQZDBFa2VNWm93VGJoa2kzWjVFZVViWlRjY1EyeldJQ1lxVllnelRHQzky?=
 =?utf-8?B?QXozUWxHK0paR0RjNEUxeUIycVMyOFgyZkN3RUM0ZFRxeUduTlFWMHQ2RnZ2?=
 =?utf-8?B?eUJGamh6N2lDNzBNM2g4RkxLTy9ZbEtKOXg4K2VLTU9YakxZRks0RjhqN1RP?=
 =?utf-8?B?U3ZzcUZOSFRjckE5aHVBRVQ5M0Q0a3N1emxQZVN1cENVOEZPYmUxWEJ1Ymk5?=
 =?utf-8?B?ZTdtdmQyY0YxdnRnMllwTU1WSEJsUTZvQ0dDT3p1QTM1WEs4bE1KTWErblc2?=
 =?utf-8?B?b1lGYllOK1FCYW5yM1F6QmVUdnNSVHoyMmk1Zzl5aHJnbnVBeUNJV3lFRExt?=
 =?utf-8?B?VUd0cHNhRzZRdmpVV1YwSlcxRkpZWHJISEF5MHNXOUxSUjJ1V3F0dFBNZ0Z4?=
 =?utf-8?B?ck4xbHlwNVRMcUNPUTI2cnVqcTVOUTlra2lKTFhOQ1NDMGtkRWk0QVFPbUZS?=
 =?utf-8?B?RWlERGZ3WlBkNDNuTDZ6T05EN0VraUpkbHorajg5L0RmN3RaWHByOURkUmlV?=
 =?utf-8?B?SWYveWlQNThLd3R0azQybEVKYVREVnIzdDZiYVJhZ09velNEQUNsUFloTmJq?=
 =?utf-8?B?R3JGVFJRa0tBZ0VMckx4QTJ0akljVSthVzBtVWR0Q085MnVzcklqRGlJNktW?=
 =?utf-8?B?Q29INWNwTjN1OXpQdGVuYnpXeFVkUDZyY1NDVmlmRmlyaTNoM0Y2dFNNa2tV?=
 =?utf-8?B?MkkxS2orWFB0Tm9ReWFOTEl4THNybnlIbzFVT243Mk5zTjZmN3I4TlpJRGxK?=
 =?utf-8?B?bUxDT3k4Y21GeWZVeS9vVUZFaW4xR0Ztb01odDZCNlUwc2dQK2VMblVGMCtV?=
 =?utf-8?B?L3c3TUY3ZkNiR3ZCOERRK3FkY2pwckkvcm5OcVEyQ0Q3SFlVV0NlL1NJU2ZD?=
 =?utf-8?B?SExlMFRkays1Ti9GUUdoYU1IZVFuRFU3bWhnMGwraU8xZ0lkTXk1Z2VqSEV6?=
 =?utf-8?B?T1BkL3ZMMkJxQis4eUVMbHNEVDhHTjBOZFduRlltUGZtRFJsdCtrb05BdEVF?=
 =?utf-8?B?K1IyR1VZdkR0MEFmd09abnkxVWtITnVMbWRVcEtOQzNXSk9YZTVzckZEVmNK?=
 =?utf-8?B?Ny9YNjN1MnFLanJBYU5ad1lkWFJlQTVORkJLRUlIdW50THFWSnlOSDZwcUpP?=
 =?utf-8?B?ZkRIdFlHSDE0S0tLV0N2ckt5b3NKYXJ5WUhMVkV2WVV5R1VJQ3VSdy9xdmNF?=
 =?utf-8?B?V1NGaXFoaDRLTVFoc1JobS90ek5OVzViQUJFNGRMNzJOamIxY1JzTWtGQ1Er?=
 =?utf-8?B?RzlyUDBjK2FYNFZsNW5rdHBjWExRYVZPUjlTOUdEdzdiaXZKeHlnWmRqSmRu?=
 =?utf-8?B?RXVHNmJveFBVNzh3UG1zcXpOL0wrZ3NNSjg2Y05lMFZIUzYvUVhKdnFDSGZ0?=
 =?utf-8?B?TllROFNRWVBIRjJ3UTlxdmVxa080dlZWdmphUWV6dVdndDNITkVoT1M1aEFX?=
 =?utf-8?B?dFhMaEdRWmRkaVBGeTBKSTIrVXg4RTdQWGxQcWg3QmhwYytVMDJ0RE1kcUk0?=
 =?utf-8?B?ZGRVbnlBbDBOUTY4RnRmNTFJSDlmVUg5dWZiNm9xd1A5cGRTdHlRa0xmQVV4?=
 =?utf-8?B?WUo5eWNYVjErL0s3SmdqYnBrNUdWV0s3cmE1eVpxZzR0V2VyaDBzVm8vK2Ji?=
 =?utf-8?Q?GHSQPoj3ZOahP80dZJ+E2w8CHsPok1oQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXA1NzlMQktmVDR5TWliMS9iYVJDRkZtWEJzeHJEMXhUTVdPN2lTczlXYnRq?=
 =?utf-8?B?OElCUzdldDVIQ3BITms4czFmV0JWUkdoaHJlQm1xZTYyazVtS1FLYzk5dlJB?=
 =?utf-8?B?TllLSFUvQUxkY2FTR2xkT1ZVV3kwUTQwVHdCMUhrSEFrM0x0N2d5NGdKMVhC?=
 =?utf-8?B?RWhyVjNLbDFYdmtlZ1FLUkl2QVhFYTFyZEIzZ3p6RU04TVE4bEtjMTZjYTNo?=
 =?utf-8?B?WTVQbjFTdWZoRmFsODk5a0VVU3dERTNGQ1RBTUF1am54SkZSVlR3QXRTeTRN?=
 =?utf-8?B?V25PMis5c25nZnkvOG9CRU55UzBuaU93RVRnTHl4cE9iT1Nnc0RXV3pkRzhU?=
 =?utf-8?B?VmpFQ1F6VWorTWQ0TGNtNXE5S1pvMFdYUW5qdXhkQy92b1V5cko4Q2lyYTVB?=
 =?utf-8?B?QlJEZi9IZyswODJ6S2MxSzd5ZzAvSHcxbWNKUDRIWVE0OVN3eXFWcW9vQ3F0?=
 =?utf-8?B?YWhaQUdrQkIvSThRYnl6ZDA4UG1XM0tkZm1oOXU1NHlhVE5POSszdlVJdXY1?=
 =?utf-8?B?ZWpoSnN4d05JUlBNYlNRaEtqU003MzlpcmkwRWJVdjgvaklqUmZTRDdkV2Na?=
 =?utf-8?B?ZXNFMUs4ZHpRbG1hUW5FZTA0Q05lcllzVTEwR2RpbDI1RFVQT24wTFo3ektM?=
 =?utf-8?B?U2ZnbWR4Mkl6ZUthdXlmcmRqbVZtOGZjQ1hlb2dqdlNBOFp1OW5FYSswSWlB?=
 =?utf-8?B?eHd0Tm80eGswS1czTGVGVzhTbDdLQ2xwa2dsaW5QUTM5NEduQmNQNEdLVURs?=
 =?utf-8?B?RWJDMUI0bUpFZkNGQ0FCSEVrYUJtRGNIYmxjVlJzTnlRa2tmLzJVdklPTFJt?=
 =?utf-8?B?bFFZOXU3M3ZvN0I1azhBczFiNW5Bekx3NmxMN1g4Y25WYm4rdkk5b01tVnBS?=
 =?utf-8?B?N0RDZHIwbUQyMVFTV1J3aTVwY2lRdlhRU1h0dGtqcER6RmZNRWVBVS9xYXBk?=
 =?utf-8?B?cFdRaHl3Q1NWMVRvcHVhQ1plQm9sU2xlakp2elkyeERzNGJLU29wOGdLWUtS?=
 =?utf-8?B?Q3pRdE9CYmhIcGUzOVFBbDhNeHYwOVIzVFFzSVhSRkxTQzVGVVl0WFlyYksv?=
 =?utf-8?B?MlhhUkNJeGZkaWwvTmVrdUZnSzh3T3dsYzE5TUd5bGFNZjFHVFA2WVlCL3hW?=
 =?utf-8?B?SmFWTHR5MWtqS0FWeE9SemdjNzIyUDVpaUdoa09uZEhDbmFzMUhpSCtUczI4?=
 =?utf-8?B?cDdycWFBVkYyYVFCSzcwa1JFQ2ZpTEpCVDU4cHRsck5MR1lwbk1BRUF3dUk5?=
 =?utf-8?B?Qndlb3R2Q1M2SW9pcEVMZDBHYmhWanA4amRVTHRrcjd4VDI0RDdtcU8rdjRJ?=
 =?utf-8?B?c3IxbnNLZXhWUXBGRzBLamlkUUNYbk9zdDVQUWpDeVFqdno2S2lCVmhmMjY2?=
 =?utf-8?B?VVlveDNSRE0zSlVucjBMNm8wcjg1SGRlRzhHRWZQUHlnK0tnQmp3Nktzdnp5?=
 =?utf-8?B?WDF1VmlHM3dMU25IWHRQS3c4UDRiV3pyRWVuWlVUR1BNdVZRaHpSWEJJZFA5?=
 =?utf-8?B?Z09mZk03WDVhTDFIazBiRStTckJNN0ZrK2xCUlVaRTlSMzFrYnc1eFBEbkxO?=
 =?utf-8?B?TEVCVnZJdGFzQndUNlozbkRJWEpRdlMvRGVCVlk0ZU51UWI3VmFDV2wzcWtB?=
 =?utf-8?B?aUNiVlpWMkk4SDJmVmR2ekNiR3VISXdHeTRMN2RjeklIbmUvcnVjaUV1OEdy?=
 =?utf-8?B?anJRMER2SjhoNDFTS0VySzlxUmpyd21SOGoxcDVQV0RDckd6UXNzY0FKYzhO?=
 =?utf-8?B?MEh5bFM5K2tjS3FuUUZYQlNoYmUzVG1DeEN1Z3ZmUHFQUFozWWNaOEVLdDhF?=
 =?utf-8?B?TXhuNkU4UE1ZdW8rZDVyeW5xeFA3L3Z4eS9YN2R5Q3A2VlVWYmxvY2M5YUhQ?=
 =?utf-8?B?eXZaOHBraEU2M1V0eUVER2V0dTZPc1N5LzBCNGJJajZkckxWUjZnWkxVWDJ2?=
 =?utf-8?B?dmNrbnp2dDBJYk01c1hPQVlKQVc0Z1NwMThsOWdBUko2bjZZeVdWRkw5S0c4?=
 =?utf-8?B?Wjd6SXVKL2JoNTlRRUlFU2ZIdWNWSTNMbzJEZTFiejNXUkFUc0xwWGlqa0RD?=
 =?utf-8?B?NVo2ZWcyV3l4bkpVM0pVUkRtcURpM29jMUd1V3ZtL2lVRjRNdW5hMytaM24v?=
 =?utf-8?B?d1NrcXNxRlZWaHQ3MFJ6NG5lZytwRGM1Qkprb243WVMxUnVLWjlGV2EvOG9y?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a2ea8e-e771-4e25-312a-08dd4cd14dd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 08:26:39.3864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hf5bD6k5txquUzHY4R7Y7+nXJpf2Ws3IB80ahNy/d5QkDHKAEG9TIlVCo/zbzKFQYruXBD+DzLVZ5r62Rh57YU8vKx5KHWXJTV6o4sajSEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7917
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDEy
LCAyMDI1IDk6NDggUE0NCj4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGlu
dGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gQ2M6IEJvcmFoLCBDaGFpdGFueWEgS3VtYXIgPGNoYWl0YW55YS5rdW1hci5i
b3JhaEBpbnRlbC5jb20+OyBTeXJqYWxhLA0KPiBWaWxsZSA8dmlsbGUuc3lyamFsYUBpbnRlbC5j
b20+OyBNdXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6
IFtQQVRDSCB2NSAxLzNdIGRybS9wbGFuZTogQWRkIG5ldyBwbGFuZSBwcm9wZXJ0eQ0KPiBJTl9G
T1JNQVRTX0FTWU5DDQo+IA0KPiBUaGVyZSBleGlzdHMgYSBwcm9wZXJ0eSBJTl9GT1JNQVRTIHdo
aWNoIGV4cG9zZXMgdGhlIHBsYW5lIHN1cHBvcnRlZA0KPiBtb2RpZmllcnMvZm9ybWF0cyB0byB0
aGUgdXNlci4gSW4gc29tZSBwbGF0Zm9ybXMgd2hlbiBhc3luY2hyb25vdXMgZmxpcCBhcmUNCj4g
dXNlZCBhbGwgb2YgbW9kaWZpZXJzL2Zvcm1hdHMgbWVudGlvbmVkIGluIElOX0ZPUk1BVFMgYXJl
IG5vdCBzdXBwb3J0ZWQuDQo+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBwbGFuZSBwcm9wZXJ0eSBJ
Tl9GT1JNQVRTX0FTWU5DIHRvIGV4cG9zZSB0aGUNCj4gYXN5bmMgZmxpcCBzdXBwb3J0ZWQgbW9k
aWZpZXJzL2Zvcm1hdHMgc28gdGhhdCB1c2VyIGNhbiB1c2UgdGhpcyBpbmZvcm1hdGlvbg0KPiBh
aGVhZCBhbmQgZG8gZmxpcCB3aXRoIHVuc3VwcG9ydGVkIGZvcm1hdHMvbW9kaWZpZXJzLiBUaGlz
IHdpbGwgc2F2ZSBmbGlwDQo+IGZhaWx1cmVzLg0KPiBBZGQgYSBuZXcgZnVuY3Rpb24gcG9pbnRl
ciBzaW1pbGFyIHRvIGZvcm1hdF9tb2Rfc3VwcG9ydGVkIHNwZWNpZmljYWxseSBmb3INCj4gYXN5
bmNocm9ub3VzIGZsaXAuDQo+IA0KPiB2MjogUmVtb3ZlIGFzeW5jIHZhcmlhYmxlIGZyb20gZHJt
X3BsYW5lIChWaWxsZSkNCj4gdjM6IEFkZCBuZXcgZnVuY3Rpb24gcG9pbnRlciBmb3IgYXN5bmMg
KFZpbGxlKQ0KPiB2NTogVHlwbyBjb3JyZWN0ZWQgaW4gY29tbWl0IG1lc3NhZ2UgJiBzb21lIGNv
cnJlY3Rpb24gaW4gdGhlIGtlcm5lbA0KPiBkb2N1bWVudGF0aW9uLiAoQ2hhaXRhbnlhKQ0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jIHwgIDcgKysrKysr
Kw0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jICAgICAgIHwgIDUgKysrKysNCj4gIGlu
Y2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oICAgICB8ICA2ICsrKysrKw0KPiAgaW5jbHVkZS9k
cm0vZHJtX3BsYW5lLmggICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysNCj4gIDQgZmls
ZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fbW9kZV9jb25maWcuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9j
b25maWcuYw0KPiBpbmRleA0KPiA4NjQyYTJmYjI1YTkwMTE2ZGFiOTc1YWEwYWI2YjUxZGVhZmI0
Yjk2Li5kYmJlZjIwNzUzZjgzNGE4NWFlOWRlZA0KPiA3NDhjZmYyYjNmMGU4NTA0MyAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fbW9kZV9jb25maWcuYw0KPiBAQCAtMzg4LDYgKzM4OCwxMyBAQCBzdGF0
aWMgaW50DQo+IGRybV9tb2RlX2NyZWF0ZV9zdGFuZGFyZF9wcm9wZXJ0aWVzKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYpDQo+ICAJCXJldHVybiAtRU5PTUVNOw0KPiAgCWRldi0+bW9kZV9jb25maWcu
c2l6ZV9oaW50c19wcm9wZXJ0eSA9IHByb3A7DQo+IA0KPiArCXByb3AgPSBkcm1fcHJvcGVydHlf
Y3JlYXRlKGRldiwNCj4gKwkJCQkgICBEUk1fTU9ERV9QUk9QX0lNTVVUQUJMRSB8DQo+IERSTV9N
T0RFX1BST1BfQkxPQiwNCj4gKwkJCQkgICAiSU5fRk9STUFUU19BU1lOQyIsIDApOw0KPiArCWlm
ICghcHJvcCkNCj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ICsJZGV2LT5tb2RlX2NvbmZpZy5hc3lu
Y19tb2RpZmllcnNfcHJvcGVydHkgPSBwcm9wOw0KPiArDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9wbGFuZS5jDQo+IGluZGV4DQo+IGEyOGIyMmZkZDdhNDFhY2E4MmQwOTdkNDIy
Mzc4NTFkYTlhMGE3OWIuLmM5ZDg4NzE0MTc3MjIxODZkMmI2Zjg3DQo+IDE5N2M5ZTE1YTcwOTI0
YjRmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jDQo+IEBAIC0xNDEsNiArMTQxLDExIEBADQo+ICAg
KiAgICAgdmFyaW91cyBidWdzIGluIHRoaXMgYXJlYSB3aXRoIGluY29uc2lzdGVuY2llcyBiZXR3
ZWVuIHRoZSBjYXBhYmlsaXR5DQo+ICAgKiAgICAgZmxhZyBhbmQgcGVyLXBsYW5lIHByb3BlcnRp
ZXMuDQo+ICAgKg0KPiArICogSU5fRk9STUFUU19BU1lOQzoNCj4gKyAqICAgICBCbG9iIHByb3Bl
cnR5IHdoaWNoIGNvbnRhaW5zIHRoZSBzZXQgb2YgYnVmZmVyIGZvcm1hdCBhbmQgbW9kaWZpZXIN
Cj4gKyAqICAgICBwYWlycyBzdXBwb3J0ZWQgYnkgdGhpcyBwbGFuZSBmb3IgYXN5bmNocm9ub3Vz
IGZsaXBzLiBUaGUgYmxvYiBpcyBhIHN0cnVjdA0KPiArICogICAgIGRybV9mb3JtYXRfbW9kaWZp
ZXJfYmxvYi4gVXNlcnNwYWNlIGNhbm5vdCBjaGFuZ2UgdGhpcyBwcm9wZXJ0eS4NCj4gKyAqDQoN
CldlIHNob3VsZCBtZW50aW9uIHRoYXQgaXQgaXMgYW4gb3B0aW9uYWwgcHJvcGVydHkgYW5kIHVz
ZXJzcGFjZSBzaG91bGQgZmFsbGJhY2sgdG8gSU5fRk9STUFUUyBpbiBjYXNlIHRoaXMgcHJvcGVy
dHkgaXMgbm90IHByZXNlbnQuDQoNCldpdGggdGhpcyBjaGFuZ2UsIExHVE0NCg0KDQpSZXZpZXdl
ZC1ieTogQ2hhaXRhbnlhIEt1bWFyIEJvcmFoIDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwu
Y29tPg0KDQoNCj4gICAqIFNJWkVfSElOVFM6DQo+ICAgKiAgICAgQmxvYiBwcm9wZXJ0eSB3aGlj
aCBjb250YWlucyB0aGUgc2V0IG9mIHJlY29tbWVuZGVkIHBsYW5lIHNpemUNCj4gICAqICAgICB3
aGljaCBjYW4gdXNlZCBmb3Igc2ltcGxlICJjdXJzb3IgbGlrZSIgdXNlIGNhc2VzIChlZy4gbm8g
c2NhbGluZykuDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaA0K
PiBiL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oIGluZGV4DQo+IDI3MTc2NWUyZTlmMmRh
NjJhYWYwZDI1ODgyOGVmNDE5NmUxNDgyMmUuLjBjMTE2ZDZkZmQyNzcyNjJiMWE0YzBmMA0KPiA5
N2ZjZTJkNzE5ZjQzODQ0IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25m
aWcuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaA0KPiBAQCAtOTM2LDYg
KzkzNiwxMiBAQCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnIHsNCj4gIAkgKi8NCj4gIAlzdHJ1Y3Qg
ZHJtX3Byb3BlcnR5ICptb2RpZmllcnNfcHJvcGVydHk7DQo+IA0KPiArCS8qKg0KPiArCSAqIEBh
c3luY19tb2RpZmllcnNfcHJvcGVydHk6IFBsYW5lIHByb3BlcnR5IHRvIGxpc3Qgc3VwcG9ydA0K
PiBtb2RpZmllci9mb3JtYXQNCj4gKwkgKiBjb21iaW5hdGlvbiBmb3IgYXN5bmNocm9ub3VzIGZs
aXBzLg0KPiArCSAqLw0KPiArCXN0cnVjdCBkcm1fcHJvcGVydHkgKmFzeW5jX21vZGlmaWVyc19w
cm9wZXJ0eTsNCj4gKw0KPiAgCS8qKg0KPiAgCSAqIEBzaXplX2hpbnRzX3Byb3BlcnR5OiBQbGFu
ZSBTSVpFX0hJTlRTIHByb3BlcnR5Lg0KPiAgCSAqLw0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX3BsYW5lLmggYi9pbmNsdWRlL2RybS9kcm1fcGxhbmUuaCBpbmRleA0KPiBkZDcxOGM2
MmFjMzFiZjE2NjA2ZjNlZTlmMDI1YTViMTcxY2QxZTY3Li40MzkzYTBlOWVkZjkxY2NmZDc4ZWY2
MmIxDQo+IDY4YjkzMTMxODdjMWE4MSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3Bs
YW5lLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3BsYW5lLmgNCj4gQEAgLTU0OSw2ICs1NDks
MjMgQEAgc3RydWN0IGRybV9wbGFuZV9mdW5jcyB7DQo+ICAJICovDQo+ICAJYm9vbCAoKmZvcm1h
dF9tb2Rfc3VwcG9ydGVkKShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwgdWludDMyX3QNCj4gZm9y
bWF0LA0KPiAgCQkJCSAgICAgdWludDY0X3QgbW9kaWZpZXIpOw0KPiArCS8qKg0KPiArCSAqIEBm
b3JtYXRfbW9kX3N1cHBvcnRlZF9hc3luYzoNCj4gKwkgKg0KPiArCSAqIFRoaXMgb3B0aW9uYWwg
aG9vayBpcyB1c2VkIGZvciB0aGUgRFJNIHRvIGRldGVybWluZSBpZiBmb3INCj4gKwkgKiBhc3lu
Y2hyb25vdXMgZmxpcCB0aGUgZ2l2ZW4gZm9ybWF0L21vZGlmaWVyIGNvbWJpbmF0aW9uIGlzIHZh
bGlkDQo+IGZvcg0KPiArCSAqIHRoZSBwbGFuZS4gVGhpcyBhbGxvd3MgdGhlIERSTSB0byBnZW5l
cmF0ZSB0aGUgY29ycmVjdCBmb3JtYXQNCj4gKwkgKiBiaXRtYXNrICh3aGljaCBmb3JtYXRzIGFw
cGx5IHRvIHdoaWNoIG1vZGlmaWVyKSwgYW5kIHRvIHZhbGlkYXRlDQo+ICsJICogbW9kaWZpZXJz
IGF0IGF0b21pY19jaGVjayB0aW1lLg0KPiArCSAqDQo+ICsJICogUmV0dXJuczoNCj4gKwkgKg0K
PiArCSAqIFRydWUgaWYgdGhlIGdpdmVuIG1vZGlmaWVyIGlzIHZhbGlkIGZvciB0aGF0IGZvcm1h
dCBvbiB0aGUgcGxhbmUuDQo+ICsJICogRmFsc2Ugb3RoZXJ3aXNlLg0KPiArCSAqLw0KPiArCWJv
b2wgKCpmb3JtYXRfbW9kX3N1cHBvcnRlZF9hc3luYykoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUs
DQo+ICsJCQkJCSAgIHVpbnQzMl90IGZvcm1hdCwgdWludDY0X3QgbW9kaWZpZXIpOw0KPiArDQo+
ICB9Ow0KPiANCj4gIC8qKg0KPiANCj4gLS0NCj4gMi4yNS4xDQoNCg==
