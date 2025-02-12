Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1722CA32EF7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 19:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F5A10E960;
	Wed, 12 Feb 2025 18:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5L3iNRg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A2310E960;
 Wed, 12 Feb 2025 18:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739386474; x=1770922474;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZiNOZ7oVVpmm/hMQ38b0tzcJrCkob6Fcf7N67B/S1ro=;
 b=l5L3iNRg5EHbTztIy3gXeeSgzM4hMvx3mAZdy/sKj54udQ1w1rSQMCO2
 8apOZA3PNWI8/bwxakuALWjr5O2S/stjGDto57OtbTZeM49KnTcSXQMHX
 vRjxvo+tO6UCW4Pr2BTZt3dOpoDpNGZmNQQ3dN22UwptQKA8lxPAIC55z
 29OdSi40FNZB/hteDXtNzFmnilCYH3+ASjKowhi6nWYibWbk5qvYwqIOR
 idNkHGlz9eQztCzlHYe2x5FS1Z5IArWig72UMSSbpjuA5dpZzzz8Dh8DW
 mfWfwMMHTYzcIdxIXD4IT5uI6Om8MZy6gyzgZXA+Iu3OfetB6B/AbwBr9 A==;
X-CSE-ConnectionGUID: sw7CxOVlRHCR+p3rL7hVug==
X-CSE-MsgGUID: vO5EhpmgTr65MsKt/N66Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="43832326"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="43832326"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:54:34 -0800
X-CSE-ConnectionGUID: L7QGNGIhQhqkuQqbKq/KHA==
X-CSE-MsgGUID: B5vqLStBRkqG8xMJzz2OTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136174041"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 10:54:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 10:54:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 10:54:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 10:54:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOBI4+gfwKdMwQ8fio8swslyspIcVFtfaPeasSSDLvP7sqCqe8io3YNQzKTPCYl/mvQfQogvLXXv3058t3O256PXY+G0B3OmrBj2SBKFho5x6SHdDQp012/Jw1fBi07hXTn6X7EMkGjmyzbDy8sLnASeUyMhvaSDBJxbpSu9eMlTgRogLDYvJVCmUhE2jBoEARlIY3vBxwbZj/cVQFwd67cHNzsHJGunbz0wZF4kgxdWqoGwhBi/Hdu9kfkx18u2GoKDe51mBSlYrukNIb8ZE9+rNtpVVUCRVxMGKvb7WhmFd9zz0ZOKPckntnJU39tXuTgR1haJ0w4ambV6qN7+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiNOZ7oVVpmm/hMQ38b0tzcJrCkob6Fcf7N67B/S1ro=;
 b=NY7iC3cSb0sKGh2s4ZsoEwFU7A9ggHZo/MVWPcJwOvztBqagc/eAJcE5P0v+0tYt5OLSnjIU/8W5iuubIR7IX4roJVXHaCIv8DDprVK+9kPKBcfbTHVAy8Q40rZdl21tP2Kuag4Tv1lj6MEnV9zxhvFRStC3kyOtI8YqfGkizZq2KE47tDgmUbKzx2tobTRQ5eB/u6mi6l3jwuVaeEm1RtcGCmJ+UyIIHHhnEi4EWUAmpwLuVLE2mnOJrbFEws7mroTbIyHvaCsr8KMAfntihNyri5/Sgxq7kI8fGMyP6FPoocD35/jf0B3fMkMOc/HJgTIEo8W5r0RRBkbgcJ+CXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 IA0PR11MB7912.namprd11.prod.outlook.com (2603:10b6:208:3dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Wed, 12 Feb
 2025 18:54:10 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 18:54:10 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v7 6/6] drm/xe/guc: Update comments on GuC-Err-Capture
 flows
Thread-Topic: [PATCH v7 6/6] drm/xe/guc: Update comments on GuC-Err-Capture
 flows
Thread-Index: AQHbfBRFMrt2vJMLO0u8v66nGGpFHLNCu8gAgAFLDQA=
Date: Wed, 12 Feb 2025 18:54:10 +0000
Message-ID: <4080c246be1cfe4fd62e6a5fc3a17e633540e4c4.camel@intel.com>
References: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
 <20250210233254.419587-7-alan.previn.teres.alexis@intel.com>
 <850c82d7-cdcc-4182-b7db-61f0d38e5a2f@intel.com>
In-Reply-To: <850c82d7-cdcc-4182-b7db-61f0d38e5a2f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|IA0PR11MB7912:EE_
x-ms-office365-filtering-correlation-id: 7388c70c-6994-4aee-518d-08dd4b96a2d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TUhTNFV4aDBMd25yZW9aeXp3b3NBTmZCY2lyMnpGU1QycWR4cW96bnJnOVYw?=
 =?utf-8?B?NnIzL2JqZmhMdUlzdU1DdkEraC94eTlpTjB2WjRZRElVa2IvK1J5Q2VsMnFP?=
 =?utf-8?B?bk9QV2JpMU84WFJ5ZWtCaUEvVVF2ampCbnNUMDAxV0xtcWJGTEpCWUZmTTJO?=
 =?utf-8?B?RmRyL0dYWmYvYmVzRzJFRnBYeitoRzJPMk9DRVJHMlVwQnUybkNIOXE4d2FU?=
 =?utf-8?B?UGF6c1dTVm9mMEMvbXJxL1FvOU5xOUc4K0w3dURNc2ttRWFUcDBPT1VuV1Ba?=
 =?utf-8?B?MXNHZHpGRVJMamoxTEdvbG1EditqanJ0bTFmTFcrVElaV1FNQ0ZLQ3Ewd3dq?=
 =?utf-8?B?N0lKMHVLcVJwdFJyZXUwMWloUjdhZnptdjQrWTlTWlFaRXZqL2svVlViS2NH?=
 =?utf-8?B?K1R4Tmt0TzJUNERQUU1kaGJkVW5sa3ptT1dvRjhwUjlZR2RNNVZIZkxZYmxM?=
 =?utf-8?B?N2dnZ2tib0c2YUh1WCtuT3FqeTNJa1VZU0w1dG9UcjdFWFIzc201ZGVQTitX?=
 =?utf-8?B?QjRubHJ5UUVKcWc5QUtVZmFuWEVTWUQrbWR5RjNkeU9FUkxpbEltQVRMemtE?=
 =?utf-8?B?WHZ1M05WZ1FWTmxXTU9zL1M2djh4M1VWaEd2UDhLaExHTm52K2tQSi9kYjFW?=
 =?utf-8?B?MHdtemhTS2VtckF6UFRiUUU5Ry94VW03VmNNTnlOVzJCR29rV0FpVXJPM0tw?=
 =?utf-8?B?WXF1NjlUNmNnWHBnNnlkcGI3S2VTbEROc1VoNW43TDBxdmtuM0NHQU85MWdT?=
 =?utf-8?B?MmJlY21qK2pDTHNaOHdxVDI2OFpHOFdXVzhVT3BQWHRWLzNScitVRGZLNFZq?=
 =?utf-8?B?Z3FDZzRnaXduOFpyaDJhSVBJYS83dHZvWm9GMlc4cWxlODdOckpMSEt6cVZL?=
 =?utf-8?B?YS9rWlZ2dFZNUFFGUkR2dGxTMzJoSFBRWG83L2M0N21kT0QwVXZHM01tbUkx?=
 =?utf-8?B?UWNvTGpXZVpCNjl1cURrVHpSMmpwR2JCcE9sL2UzMENtb0ZGQUN1REs0bHh3?=
 =?utf-8?B?SXFWSVNrY2xtcFNUWEpiR0U5YmNreUtCUXg2NWxUMmlCaUovdFo0V1NnNTdL?=
 =?utf-8?B?N3Z5ek9PZTIvNTR5ZGEyQzFLdU9kalMwKzBKRXBMUFZ1NDlBeW1SenM4VXFa?=
 =?utf-8?B?RVA4Zkg0SDZMQm1DU01DOFk5VUppdTVmMEovZmdoU3EyMjhURjdsNDBqdlBx?=
 =?utf-8?B?TDJUOVg2UTF1VTNXdnJYRzhMNyt1Z0xSakxZbDN4THdZQ2RxV1FJOEd3Y1V6?=
 =?utf-8?B?bFcyckhBTHRuSEJqZ2tvQ1VWTC95bVZJQUx0YlRXdW5yc3kzMTVDY2xCcWpH?=
 =?utf-8?B?VTQ1dld4R1ViMnVvM2YwUThWVWh6S3lmalJtUXpydUVIRVFvOGx6Z3AwTUNi?=
 =?utf-8?B?MUVwSzhmSDc3L0ZsdzNjSWZBV2YrQWRDZ3F4N2ZtRlF0M0J0MEtUZ2IyM1dD?=
 =?utf-8?B?TlhpMXZSUk5LNmYyd3RoZDM4Ym9UWVZ3KzNiQWt2YUsxdFd4UTZSL3ZJLzB1?=
 =?utf-8?B?cFdQa0hlenY4UkpxbUNiMzVoTnRWOFY0ZTlnclF0ZTM1dndnc1lUeWQxUzhO?=
 =?utf-8?B?Y0x5NllONm00RXBJeEpjU09UeFZsRWNicSsxYkhHYzJJNnlzUDZVcmpnRlE0?=
 =?utf-8?B?RHc4VXhZdnNoYkFDT0V3UkxKcjJBZWxtcXZOYVdtS2k1dW9YUDg0b0ttaXRo?=
 =?utf-8?B?N1lza09MWmMrNnplZUdiMlgzZzF3QnJzWUs2WlhLOTRTWkdGU0FqS0xyd3ZX?=
 =?utf-8?B?RHNyejhBdnF0bmE0MlM0Ri9uVTFBekpHYUtIWWtiVzBLV1hTSUxCUTh5aU82?=
 =?utf-8?B?TXYvQVVUN2JDR3RSQ0NqS3VLY0t3Y2lXQy9oRVRIOUdXZFdGUHFxbkdZeGkr?=
 =?utf-8?B?QlJ5RFg3Y2dsQ0MwNi8rcGdDb0dYY1RCTHNPc042ZDkvNjdFazY0dHJsNW1G?=
 =?utf-8?Q?zaPH2Hi8qdRoO0seAn0/fPvNjzYqESvl?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWNhdFNFU3phRlQxMEF0dUJWUWVhQjkyck9NaU9TZ1dQNDNaVmVQWEhEeHpx?=
 =?utf-8?B?QzkxM2hYNXZ5SEdiajNzV0k4dXl1bk9TbWFVZDhlelM1OFZsZ2lOODB3ZnRv?=
 =?utf-8?B?aVBUdjZKMlFxeHpzdzU0NzlJR284Yzk4YzV2Y2pjUmNJdmpJckwxaDVYTFBr?=
 =?utf-8?B?T0EyaFFEQXYxODNTMVFWZ2hPazcxTVlXK3laTUV6Q1VTMWhacURGYVUrSzVJ?=
 =?utf-8?B?SVRIK1d1Y3YweG51elBwSzdTM2IwM1ZYWkdXNE5mZG9rZjJJZ21IQkRWNnNN?=
 =?utf-8?B?Smk4R1VabWFzOEhPNHM5QVJicUs3d2hUSjVsR09XWURrSkkyWC9veWd4ZWRP?=
 =?utf-8?B?d2VOQlVSZi8wTSsxUm9Da2Y1WVY2T0lOMWtENnJHTEs2SmNsb0JQRlZ6OWNu?=
 =?utf-8?B?NWRRRFY4QUdvS2FhNXFXU3JzUkJXQzZseVozL1VnK3ArTS90dmZ1c0E1Z2ZV?=
 =?utf-8?B?TkFvSi9Fc20zM3k5bnJEWEFlMXdINFRzNjNkRThtSjkrT2xxOXBVbjJSbmEr?=
 =?utf-8?B?RSs1blYrV0EvZVk1U0x4NU5qbDNVYVJRVkpwY1dFU3M5TUVPSHVhcWlGamQ0?=
 =?utf-8?B?VTV1Z1VGdkswRFUrZWwrMzR6ZUIydk9kK1FUWFd5dERoYlpkTG1JbzZDWW1P?=
 =?utf-8?B?d3RpeWttMjNtaCtTZi8wNXlIaksyQWZIb3BpVy9EY0FWY0NSS0l2QklpQmhV?=
 =?utf-8?B?TEFRbkJ5Q0R2MW5XenJxQVY4SzA3V2EyR2JDTThFRkJsY0drT1F4NXZTUy9M?=
 =?utf-8?B?a25hOFpyMjRBOEZ4dmNTbDJ2bklTcnZocW5EdEk5TUxESzBTYUduUHRFTjVS?=
 =?utf-8?B?SmZ4L051OUtjeVh0dnRjOVNwS0xJNVdjOHRZZXdaUFlUSXJTQ3BuK2FEYmVw?=
 =?utf-8?B?YWR6QzFZdTA0TmVjSVYxR0dqLzhyMUM0VUdGQmx6OXdVR2Y1ZFFaMzVRYjJK?=
 =?utf-8?B?SEF1cWVLZlUyeVJPSXV3eWpUS1dFTDZndS9uNHZucHg4SmlnZnR3M1lDSmxX?=
 =?utf-8?B?dVlKOFV1NjhRVnEzdndnQXpKSUtkdkY2S29kWnp0b0FXQVUrL2JRSnlOLzRN?=
 =?utf-8?B?U3kvNmZzY251QzlxUktKc245TGhUUDFJTW1RRy9tUjVvd0xMVkl2dDVXcHkw?=
 =?utf-8?B?N0JWR09ZZnREeUswM3Y5OXp1S2ZHamI4N1h0aHNxK3VDLzF0dTRFUzV3U1pQ?=
 =?utf-8?B?MlBBWER5SC9na0hZd1pkZWl1encvNm9EcGg0ckhSa200RGlVZFg1S2pMci94?=
 =?utf-8?B?U3ZlaWFTSXJubkhnN2tXSUlXOU5pRXpLV200L2NscVIzV29tV3p2ejlyWWNl?=
 =?utf-8?B?UWJtaFBuYnJyc2ZLRWdCNmk1dmR4N3BzMWhMdDVqbkZYUmhGcXhJaG0raFhz?=
 =?utf-8?B?a1Q2QXVVS0xiL1NZdVVodndZbmVkZjdJaW41cDlkRHNsUjVobnlmMWpmb3Uy?=
 =?utf-8?B?WUkwWHlxVzV1Q042WTlmZ2k4eTQwQUlhcmQvTHBJUmVaRDRYSFcvemRaemxl?=
 =?utf-8?B?bm44V0lHaVFUTWx4NjI4VHZLMW51UzdEVEptVk1CeXdCdmUxNXYzRkZ3WVY3?=
 =?utf-8?B?Lzh4RWlSZ2s0ZU1aUGRtbURmUmQ2RUNlQ212cVVqNy9RTlUxcG93TktablVT?=
 =?utf-8?B?MU42MVFvZE1LekJtb0c0aFdiQTl3UGlhSkdqdUZCYzYvekY4ZG8zZENlWUxH?=
 =?utf-8?B?NFRUTTkzbndWMVdsLzVLSk02clBOeUlEYVp6eWVEbnE1QURObWlzMGdNTWpR?=
 =?utf-8?B?NXk2QnowaGV4WWljcXNvZkZCdUM4R2ZMWjltTWc4ZWgxZnBiM0VBNlRpemdG?=
 =?utf-8?B?dUNrNjBiaTVlbUt3SmtNSDlCNHA5Tml1aWVMWG93L3FGTDRWRGE5RkQ4TzVX?=
 =?utf-8?B?Ung1Yk5rOEQzY2ZJdzFPVDN5OUc5Qjgvc1owenZVVWlDQkxraHVZYjB1TmJt?=
 =?utf-8?B?MVFwSngxZTFrNTdGeHBTWUllWXlCN3dJdHlRd0pJNDRGOG1SeTlMNHZTL3hU?=
 =?utf-8?B?cG1YaDFCcVVmN1BHQ1ZKNGpJQkV4emFyL3dYeFgrSnVoMmVwZU1RbFFxdHFn?=
 =?utf-8?B?NEtNTytld0JKTnhlZWNSWDNCMVNxQm1YYlpCYUNwOGI0TVRwN05CaVYzcldI?=
 =?utf-8?B?S3Jtc1ZvUnd2ZEhYaU5KQU9SKzJ0L2NZdXMyaEQ2ek8rOVZyL1RRUjY1MDFw?=
 =?utf-8?Q?ZHyA1IJvatntxhLzOJX+Eb8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C6BB9BD73AA4B499952BFF5BF3D52A9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7388c70c-6994-4aee-518d-08dd4b96a2d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 18:54:10.5191 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iLYNA5SU63NqHSRIatoDP2DPsFpucvg1nEg1GKq351V8/msMprSWfDzzA6RuPWMB+55AXfKiNj2VwGSKXKTYx1f+cy6aQSnFlBqeaExS4GtOWq5rKIo7itMhhFbI54kg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7912
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

T24gVHVlLCAyMDI1LTAyLTExIGF0IDE4OjA5IC0wNTAwLCBEb25nLCBaaGFuanVuIHdyb3RlOgo+
IAo+ID4gCmFsYW46c25pcAo+ID4gwqDCoCAqCj4gPiAtICogVXNlciBTeXNmcyAvIERlYnVnZnMK
PiA+IC0gKiAtLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gLSAqwqDCoMKgwqDCoCAtLT4geGVfZGV2
Y29yZWR1bXBfcmVhZC0+Cj4gPiArICogVXNlciBEZXZjb3JlZHVtcCBTeXNmcwo+ID4gKyAqIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICsgKsKgwqDCoMKgwqAgLS0+IHhlX2RldmNvcmVkdW1w
X3JlYWQtPiAodXNlciBjYXRzIGRldmNvcmVkdW1wKQo+ID4gwqDCoCAqwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIEwtLT4geHh4X3NuYXBzaG90X3ByaW50Cj4gPiDCoMKgICrCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMLS0+IHhlX2h3X2VuZ2luZV9wcmludCAtLT4geGVf
aHdfZW5naW5lX3NuYXBzaG90X3ByaW50Cj4gPiDCoMKgICrCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMLS0+IHhlX2d1Y19jYXB0dXJlX3NuYXBzaG90
X3ByaW50Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoEwtLT4gaHdfZW5naW5lX3NuYXBzaG90X2NhcHR1cmUKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgeGVfZ3VjX2NhcHR1cmVfc25hcHNob3RfbWFudWFsX2h3ZQo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAvLyBUaGUgbmV3IGZ1bmN0aW9uIHdoaWNoIGRvIG1hbnVhbCBjYXB0dXJlIHdpdGhvdXQg
am9iCj4gQW5kLCBmb3IgZGVidWdmcywgaXQgZGlkIG5vdCBjYWxscyB4ZV9kZXZjb3JlZHVtcF9y
ZWFkLi4uCj4gaW5zdGVhZCwgYnkgImh3X2VuZ2luZXMiLiBTaGFsbCB3ZSBtZW50aW9uIGRlYnVn
ZnMgY2FsbCAKPiB4ZV9od19lbmdpbmVfcHJpbnQgZGlyZWN0bHk/Cj4gCj4gT3RoZXIgdGhhbiB0
aGF0LCBMR1RNCj4gUmV2aWV3ZWQtYnk6IFpoYW5qdW4gRG9uZyA8emhhbmp1bi5kb25nQGludGVs
LmNvbT4KPiAKCmFsYW46IHRoYW5rcyAtIGkgd2lsbCBhZGQgYSBuZXcgc2VjdGlvbiB0byBkaWZm
ZXJlbnRpYXRlCiJVc2VyLT5zeXNmcyBkZXZjb3JlIGR1bXAiIHZzICJVc2VyLT5kZWJ1Z2ZzIGVu
Z2luZSBkdW1wIiAtIGJvdGggd2l0aCBzaW1pbGlhciBlbmRwb2ludHMgZW5kaW5nIHdpdGgKeGVf
aHdfZW5naW5lX3NuYXBzaG90X3ByaW50LT54ZV9ndWNfY2FwdHVyZV9zbmFwc2hvdF9wcmludAo=
