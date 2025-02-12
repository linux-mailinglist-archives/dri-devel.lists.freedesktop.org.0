Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5206A32EA2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 19:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0717110E1A6;
	Wed, 12 Feb 2025 18:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5m+SLQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E06810E111;
 Wed, 12 Feb 2025 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739384679; x=1770920679;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/bA3oUo57D0ERgpx4CGkXM6NVzJb3T52XpIGGGeLIXo=;
 b=R5m+SLQeX5hMVKXnry9VNOZGJB6gYnI8ackkO1sYYhk4HCSuH2IQND1m
 r1FO/sO1BAIFWmmJsSmE4oDvT22pEYgTMmluWCGcvU2IWltJ5aBaVtEXC
 DslGUe0yqbsp7EWtTqNnqGdFhDm4KWzt8+fytvIzq3e23S1FWZceEmeO3
 AMu+t5QWKNym9UD2c8HWvE6T26bKrTYAGAdW7r/dOs5fZg7E6yTaKJY8L
 zw23pxGwUks3WLMRa5nj6l8EMLWtAAQZvn/0qHXOsuJOK28mK0ElpYNAq
 SfMQrfFizuPZGluF/BUBBVG7w7fD4o+hfEnDsV0MWaJ85aq9y0mijCHke g==;
X-CSE-ConnectionGUID: IpyUn2WaRaefW9LecUo2pg==
X-CSE-MsgGUID: 6E42J5THRNGrUlhxyysJBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50707932"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="50707932"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:24:39 -0800
X-CSE-ConnectionGUID: 7pmFBgAMS3aOKm+lYrTf7w==
X-CSE-MsgGUID: wVniNOSCRMKLLdyyReZXrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="117988257"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 10:24:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 10:24:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 10:24:38 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 10:24:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCh8sTM63/sUgdmzfzs1IuAfyLiSc9tA4ezWuA36hajBCXUD6iBT9nh45WsTx0S6POqXy+SIHlhYVysMyMsc1pAQoIn9oDbSN81n6lClvI9CtL/0JCdFWPAHq9m62pjK4tgmhnpssFmBeZj8Z8d0kQaNjsYfuxaLcORRYD+zDRYSZZAKsj8ku0mMlV6AwYdmTc8ituMYmWdzD/yMe9h/KHnvXZ5v5FSCR/kFqGlC9P21V7ftp1+ruzXpD1eKoByMuxq/2d7UxIIPoDC+72nSeALOkaoD3mvoVBsO64lAMjCwANzsMqWRW5VJTyGLaxshFcoepPhTyPIR1XpmUHdjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NT4kZDSvytfKCPFK2sff5xoFPGI1a2SL8lh48T+bkqw=;
 b=XqcoafhrpAYrZ2DtT4lj86fbd1zuTs3SEvAehGbqqCu5zS3WW0WYnvC9cNqM3lbarEqywS4wDR9UfhrtCIe7cmC+znFe+CpVXptyJFKV1tOon4zImElonnfeavzDa9RCmM0LeHOURh/+HxnQoF8RRdTQagbYHoMuehhSTKNkmYHvfWHwnDVb5SPvCRQqfm9iyIkagI9cWM26dDOO8rXLtzSwBisvxRK435wLWu9YW5GKlrcdCxf1v+XhrhUzFOoeBHc4BQUQcnyk8NL6SAC2lLfdWkfuy2LIiae3SzhNcTY2nNCkosYJoE1piyDEP70wShF0PqYFiDiflXhmVoljyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 18:24:21 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 18:24:20 +0000
Message-ID: <97a81b7b-8b3e-4ade-b06c-523ae4f67b3e@intel.com>
Date: Wed, 12 Feb 2025 13:24:17 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] drm/xe/xe_hw_engine: Update xe_hw_engine capture
 for debugfs/gt_reset
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
 <20250210233254.419587-6-alan.previn.teres.alexis@intel.com>
 <917819dcd25fabc9732fbf151b1cc4e4b1f0bb30.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <917819dcd25fabc9732fbf151b1cc4e4b1f0bb30.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:303:dc::10) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 8974944d-2bee-4841-69b7-08dd4b927802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3BCeHFCOW56c0owSkFNZTdPekY2ZW9XbmxuR2NSSmJTOG5KVUY2VTJsZHBU?=
 =?utf-8?B?MldJUFpQVnc5aXE1U05kZVNVRGNwK1ZuOHJCb0xZSzZETzc3YXorRUZoM1R1?=
 =?utf-8?B?SDJCWFRZdDdLYzZzczhuRVJpR0ZkWklaZHFDM2pzTWd3L0dRVHh0Q0YvWkVJ?=
 =?utf-8?B?Um1rOEJveGVsMElKS050SldwbkRSamFQZHZLRDdLbFpMZU1XTVI2YzVmV1Er?=
 =?utf-8?B?R1poU1hvWkpPNVJEVXNxaWg4V2ljRFgxblAreVIwUStNRzFIM2E2M1E1WUFk?=
 =?utf-8?B?eVNmVUZ3VmZaOWNvQWdmS0dRd3RRc3A0M3JCODJqVElVQTBIL2hieTdZc3pH?=
 =?utf-8?B?bElITmdiUnpHNndnS2JtOHZEZzhITllpWG5XRXcybnBEU3l6cHYvSXFEcUtm?=
 =?utf-8?B?dGhrTmwrbW5IMXladEhIa0tRTjVJOGJGN01qMXNGL3FENmV2QTdrU2NjWWtT?=
 =?utf-8?B?eWc1b0JZQnNIb1gya0tSVHhYNzF5S2VJQXFITmZ4S3VRNkhpdXZqcUdiTnNr?=
 =?utf-8?B?cG5xazZIMWJGeDc3WU5GTFZjRzRYdkdVTWdaVjQxMHEydWYxYy9jMFdCS01J?=
 =?utf-8?B?ZDlZMldVRm03dFBWSUpMdHNldDdzTmdraVZ0Q3dRTFJEOWtjYVFYanB1dXdQ?=
 =?utf-8?B?M0F2Z0JOZGIweE1jb0tKaGhMSWExZmp2L3l3U1RGYzFhd3A0anJkWGZyUFBk?=
 =?utf-8?B?NnZndTJxQlF1SmdQZ3hjTmhyL1N6dkhSLzZDYlM0NW9nTnpJSmF6aldQcWNT?=
 =?utf-8?B?V0VMSjV6cXlJRm1KaGRaVU82L2tWK21MQXZkZEIwTVhOSTNSMlg4RHgxRzFI?=
 =?utf-8?B?eXZHQXphck1sNER5RU8vbWp5NHc4bmtIY1ZpazAzcTRiMDFSaFArLzRxRk1X?=
 =?utf-8?B?eG9uZFgwU1BqSzJycmRpZHlMMXh2ZHFhZkR4OWRCdTdqMytRSU5wSUV5ZklG?=
 =?utf-8?B?dERQUnhmU2Z6TTRHai90ZUw5SExjalFsQjRieHZmbEtCR0IwN3k0RUlwSlU2?=
 =?utf-8?B?L1dHekZCOVAxVTFtRmwxOUpDaG5pamxnN29DZi9Bc2FEUWVIWlU2NGFOaUJC?=
 =?utf-8?B?Ty9LWkl2Z1ZTUnh4WCtqbkxrbEV4ak5QN2hTTFhnVmh3NHcwcHRhUGE2cmtx?=
 =?utf-8?B?SVR0aEtwNUY3VEdZaFBDaWZmcXhHdGlZdjBUQ1Q0Z0xxNGtCWHB4TFBMNkRT?=
 =?utf-8?B?dytqcUJKeGpLVFZENFRFSm1qMSt3R2V6Z1BaK3paZ2o5bU55MG5sbXQvMkQv?=
 =?utf-8?B?RkZOeUtTeXBrYjdCTXh3bnlBdFVVRGd5eU5HRlBnRWwvMkdaM0hDaHNqcFZu?=
 =?utf-8?B?SjY2czJqZEwydFg2TWM4eS9qT2oyVFFxOVA5aE1adDJoK2Q4ZmRGcXhOTzFj?=
 =?utf-8?B?cVljTlJpbitrOVhiSmZsMzhMaDhTbUYvalRQUlB4ci83RmpZTlNsMXRJMVZQ?=
 =?utf-8?B?UmlBQnpKNWUzdlV2TWY1K0VHaENuNW5vZklnTFpkQ2o2amNBSi8xaUZ1SFQx?=
 =?utf-8?B?RUZXUmZPYStmL2p0bE9Eb09wMTdiYmpEUW9tTk1NVEtGdXhDZHFUd1ZWNSs1?=
 =?utf-8?B?bTNueGJ4WnpibTBPKzBBUEVxSTlGdElxM2dQM3lOSGlQVDlmTnVkTU1DSXIv?=
 =?utf-8?B?WlV4V0dSV212NUg2MzZzN2JOdDk0VDlqUm1UcUdRUldJWDBDbUpxNUtNM0ww?=
 =?utf-8?B?Z0ZFQ2x1Y0tWNFBIMFplU3ppaEpLUWJLWmduWW9USTJjQk9vYUIwTTlhTHJT?=
 =?utf-8?B?YjZOeTgvR1JWdmxYVFpQbXJpbDVMQUt4SW9xL01MWEY2bjJzV2Z2U3praVFt?=
 =?utf-8?B?TGQ5MWNoMmkyNm83cmpBUndPZmZQaTg0Q1VrUktCZlhiNXNBVmJVNTdiTjdi?=
 =?utf-8?Q?iXYK4emjZOv0L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3EvKzVxVkhhMVFMd0VVQnptT05vTDdvdUJGWFRYSFBmTlJ0MndTSUZScXdo?=
 =?utf-8?B?Q0tDM0Z0SThyWGQ1VXNBcVdZbDdPRzQ0T2VsMnF0UEQzQ0l5bENjaUg4REVQ?=
 =?utf-8?B?eHIzMUIxQTVBV2xVenIxZUh1Z1o4UjVxeEFTKzRaNklIejB0WWozRlRKRGd6?=
 =?utf-8?B?MWlhdjJIaUVzOFdaai9iQTlhNWVLUjgxN29YMWJoUG1TcjlweWtJZkg2OGI5?=
 =?utf-8?B?dThKVDJkb1I3OXE5TVIvRjhrdU5wS3l6YmM5NjJPVDRpMzM1VzJad21zY3RW?=
 =?utf-8?B?ZUtNWFZRQkU1Rm00UnM1L08vK3RGYTRnb2F6ZnpkTFNhaVFDYnJBVUN0T1U2?=
 =?utf-8?B?V2paZkhMMnFiRHpPUFQzcnpmZFhyRUZNN3RqZ09KNllMc1prZytEdGZtWHE1?=
 =?utf-8?B?SFlUNWJUUXl6MUEyQ1BTbmZyZFdMMW9nS1RkMlJwWUZTaVhXZWtGQW1nZW50?=
 =?utf-8?B?UzVCQjdDczE3MThtUkZGWFVVbWc1WVk0YXpVSWkvV3lrbEE1WERmQ3N1cENq?=
 =?utf-8?B?YnA1a0ZKRU5DVHJKSTJhbDlsQ2k4Nm80ZnRqV00vblZ1YnNoK2xaNk9ialBD?=
 =?utf-8?B?Vy9oelhESDNmV2VxRU9pZENOYTdueHJ1VFJMaGdQaFgzYnhBenNTb09mQVFu?=
 =?utf-8?B?Wi9LL2VaL1ZnYXdpVzJybmlEQXM1aWFzNXZjeW52TGlVZ0F1Qnkvem9HZ0VP?=
 =?utf-8?B?U3NGZ04raDA2aEJRdFg5MXpENzVTK1EwM243YkRSY1BEZUxPRkJxMy80d2lM?=
 =?utf-8?B?eWlHeCtrOUx5RG9Ob00wYzBVc0hWeFEzRkNKM3ZTOEJJbnhTSGdaTzJmRUdP?=
 =?utf-8?B?Z1lQdGtxc1NUUjA4QXoyVzhrcGo3WS9GWnByK2xjd05rbU5nOEhGZjhKeG41?=
 =?utf-8?B?YldxV2N0REMrNTJkVlpMZmFJVUYzK1Z2bTRnRHVZNUFDdEdHZGZCZm5oOEJx?=
 =?utf-8?B?bmE0dkxVcGc4Nm16RmIxRm9LMVJNWWF0N1ZtNlh2T3NvcEtNNFovMHhsUkNo?=
 =?utf-8?B?SnNEOU9LNUZOSUpBTTVVWm1BQlJyS3YrK0kyaDJLa1cxNXdvUGhDcWluSGt6?=
 =?utf-8?B?Y0pnWTB5YkdWUHJGVENrN2NrRzIreUJGS0I2MlhGcjkreEc2WXdnSTYycFZo?=
 =?utf-8?B?RCtVbmtaZVlhSDFqNCs1WVJQUVFzRDN6QUxPNXVPejIxR0lHOGJlSnBLUFNI?=
 =?utf-8?B?Z1YraWErcHJRa1NlbExubEJiRHpKYUw2ZEd1WlhGTG9HbEdaeWVZMVdGb0lN?=
 =?utf-8?B?S1labUJQQngxR1NZYWw0TUttT2swRURSeWFjWDlVZjJsYUQ0M0w5TU9HbnBN?=
 =?utf-8?B?aVFOTCtuY2JtVzZ3c1J1bmhZMXFqaU85RTNQM0hURk03cUU5WVhBSXVKemFu?=
 =?utf-8?B?WWNMN3ZCUm5LK1VmNXYrUTZTWHdYdE9vLzVFMXcyRS9zL3JrWWphSnVxRUxV?=
 =?utf-8?B?ZXJPWXZCSHNiRDZ1QjRoSytPZElpTXkyRDc2NzE3MWJZY3c5RHFDU2M0TXpu?=
 =?utf-8?B?QWdwcHE3OWdlVWhPeTBXWkoyNGNsZjlzU012aEl5d3Y4dEtybjE4R0Fya01N?=
 =?utf-8?B?OWI1VHZicVNIRzA5SFBJVHQzdmJoSmtZSHlKcWxpWFltT2NnUGZDMXBHTkdW?=
 =?utf-8?B?bkR5amZWRWt0T0F5MUZWZ2RFSjZBNUtRVUVTUFNvcnlPcFFueU5jV3VxeW1j?=
 =?utf-8?B?TGdubm9nWDBoR01hTXo3Y2E2bTBSRzdBRzE3SExrQWRqVUs0RDl4VjJyTStl?=
 =?utf-8?B?NXp4Qk03Mm80MFhjVEVvS05mQ0hQZ3kvM1A0V0FCNTkzSis1T1l5ZGlUUXdP?=
 =?utf-8?B?YmxCaFN5b09zb1NrbGgyNkQ0RFgxUjIyM0FqMEM3YksveWlOZ0ZrOVRMb3V0?=
 =?utf-8?B?MlZCV3NWdi9nT2t0ZW9sZTB0ajBHOEsvWWNOb2JFMGsyZDZhalBCMXlNZlFR?=
 =?utf-8?B?dlRwd09OSGNFNGpiSW5Ha1E3NnVrOTBDRTcxdmJCc28zVHU0VHNYc05RYml6?=
 =?utf-8?B?M3ovN0gzT08zdzFlMkxNTXFNVmQ1TTB5VXlCUUxmd1BkT2hKd3BLYVRwcHdN?=
 =?utf-8?B?Tm1pMWU1c2dnZ2kxdmZlZ0x4VHVjTzVvYmlJYTB2U0szbDNLSkpPakJMUUVG?=
 =?utf-8?B?cHlpY2J2NW1JNU9mZnJZSE1LQXlDSEVoVEtjUnhLQVpEeGx4VGoxa2M0Y2Ni?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8974944d-2bee-4841-69b7-08dd4b927802
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 18:24:20.9111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGrXJnrgdqNsyslC/oyi+Hac4KoDiewudtdL7uXVGgSEs/bSFQl+BPUbLBZXScBb4DwEy5PnhvLV5OrBTioc/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
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

If rename is the only change in next revision, that's fine to me.

Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

On 2025-02-11 12:34 p.m., Teres Alexis, Alan Previn wrote:
> On Mon, 2025-02-10 at 15:32 -0800, Teres Alexis, Alan Previn wrote:
>> xe_hw_engine_print is called by debugfs to do an immediate raw
>> --- a/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
>> @@ -12,7 +12,11 @@
>>   struct guc_mmio_reg;
>>   
>>   enum xe_guc_capture_snapshot_source {
>> -       XE_ENGINE_CAPTURE_SOURCE_MANUAL,
>> +       /* KMD captured engine registers when job timeout is detected */
>> +       XE_ENGINE_CAPTURE_SOURCE_MANUAL_JOB,
>> +       /* KMD captured raw engine registers without any job association */
>> +       XE_ENGINE_CAPTURE_SOURCE_MANUAL_RAW,
>> +       /* GUC-FW captured engine registers before workload was killed */
>>          XE_ENGINE_CAPTURE_SOURCE_GUC
>>   };
>>   
> alan: some offline feedback was given to rename the enum to match:
> "enum xe_guc_capture_snapshot_source" -> "enum xe_engine_capture_source"
> 
> 

