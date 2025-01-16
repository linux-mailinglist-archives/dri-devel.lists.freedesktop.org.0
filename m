Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BE4A13AF6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 14:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D266210E973;
	Thu, 16 Jan 2025 13:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwKukDGI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC6110E972;
 Thu, 16 Jan 2025 13:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737034418; x=1768570418;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0z36bcpFAA8cAivCUxTm/VLSKBeslJJhgGK3RHMMA/4=;
 b=dwKukDGIQgLkAtUu/Y5trn8AZMeiCsNNl9nvjuiIXcnUEyQhIjffrG+A
 o6FBFwg+zgo+TmRW+QV6OK3u/t+Fx/LmuaF3px8hcICCeiKUBXWeItHr4
 VScvbjSpY1k9NjgIVQ2YUKDl1N28VVs8y8iQeOA6k4G1K7XXOkIaz5y+P
 15Znjxu7ObpnjtB7mox9Jpxu/GiQK+hSHoaH9EQWDkgjY4oz6DIRGDddk
 Yg3y1IgkB2U4hczxp9UPqOIqCmGKjLc6ik7k/fLcj4XFvrBk2trKi4uJJ
 94YnhW7FCH27Q10CpYnr9bjQRmc73qZMlvuFXzO+v0yPjhPXMwGCPL4ZU w==;
X-CSE-ConnectionGUID: upUxOOOMSRqR3WIfqYLyJw==
X-CSE-MsgGUID: 13DtVJqURHiVUdA/QbpZmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="47911081"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="47911081"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 05:33:38 -0800
X-CSE-ConnectionGUID: cbP5nRhNSia6mvoUO2ULIw==
X-CSE-MsgGUID: cJ3glIpVR+2bPACeJHzn+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="136335150"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 05:33:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 05:33:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 05:33:37 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 05:33:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v17EJAe3WorQf/14gmgsui/vVMXBjDqv02YF/6MQcOKFUEilch+YyMaDj524ZV3H5JDiSsbNRFRZxNbbNds55HHIdMGexGtxZ938bWhy3uk2EieK9ngPCV3CswkF6csgAXE+rrDkHMizftyl0GAJmUHOd9wkRRVJ6f2EAb+nSXRYq9t3CqsX4+F1v4VsBhGY/Z9u9w7WQI/OrL+gjwu1TV2UGz68oK5ERqzIetuPPmoC1gw3FvRm/MLgFbKnIt0C6H38wIs4f11ea2iQZLBqisCOkwjqK3Nuj5UwEm3hIGcEd21jXA+r4/lg1WQ+2U73auLBQsJPTUTa6iG589J1eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z36bcpFAA8cAivCUxTm/VLSKBeslJJhgGK3RHMMA/4=;
 b=M4bqHsv3xTHiNPV1Y3PS0zqr9hQcuHXCLs8alJG9wbYgirDK4teF2JnqzEs8UNLiZtgqNjMtf99SyNdMlU6vjdq7V6PtS6zTfPC+Uz/cea7INkI4pvZdfGU5ks97BOXDBfiNBXdCTgM9vRJ/RZhhPWeOHP9SwIHFX2ZZH/rlsQnEWpu4l5R6Il4ADfMxY60n8nG1Ez9xlnWMBZxPbYQMYpmc/D92H/4veNOvjM6zSlJLrHdUr/BykgVIQdl9hlT+w/e+UM9B483NeHF+pGa1wc0b2Ckv+N5bvV4I5IwzX/de18M9ba8BHR3a77FmfDDiwK8/XZR0sPnVBrE2c/Nhwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM4PR11MB7182.namprd11.prod.outlook.com (2603:10b6:8:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 13:33:34 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 13:33:34 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "Bhattacharjee, Susanta" <susanta.bhattacharjee@intel.com>
Subject: RE: [PATCH v7 02/14] drm: Define ImageEnhancemenT LUT structures
 exposed to user
Thread-Topic: [PATCH v7 02/14] drm: Define ImageEnhancemenT LUT structures
 exposed to user
Thread-Index: AQHbYtFEgXOdJTxz0Uatj2h0T3Y1k7MYSSEAgACcqVCAACSXAIAABa/QgABazQCAAAM4EA==
Date: Thu, 16 Jan 2025 13:33:34 +0000
Message-ID: <IA0PR11MB7307B7438F092377B1388C83BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-2-605cb0271162@intel.com>
 <i6j3zi5tlnyk2eonmpa5h5qitwgzs2nuzrvsasde3dci6a4ngl@qhbtsjbhq6xr>
 <IA0PR11MB73075A89DAA5BF7D783125EEBA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJprDgcyZTgz9QX0X51sC=F6ogXsMkDLfbSypH1kSm5hJzg@mail.gmail.com>
 <IA0PR11MB73072FF4CF32A40E670CD9CEBA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
 <6fiprampyjzkkyofaavdpe4dgeoomwahtwkh2dsclxegz4u472@irq2yelghle5>
In-Reply-To: <6fiprampyjzkkyofaavdpe4dgeoomwahtwkh2dsclxegz4u472@irq2yelghle5>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|DM4PR11MB7182:EE_
x-ms-office365-filtering-correlation-id: f8939e53-778f-47d9-bf02-08dd36326010
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NlE0eiswS1VicGFLLzVYd05lVXdVUmNFaWVMT05CUVRSNTdjc2dHeHkvNjhP?=
 =?utf-8?B?TVFwbS9Nc3UrMWFsaTdBT0ZwbUpKK2RTbDdrbzIzTm5rRkJiN0NIV1JnTjRP?=
 =?utf-8?B?M0pwTlRRUFVJNWEwalFhcDhVQjM3eXVNSWNwbFFrdWhvcEJHcjc2NnE0VjVT?=
 =?utf-8?B?c2NSSWxsUHl4WGQwaHE5RGtzbkkzQzJiZkFyeXM5OTVzejNuSUJnczJhUkVj?=
 =?utf-8?B?RS8vOHd3Z1pUNk5ONVVicXRMOU1LVUMwUTUvYjRrWmxicm1LeDVvQnFCVmUx?=
 =?utf-8?B?RnVzZDZpd3EySFdJTEpwL0NJNGkxZkJnQ2RveHFCWlF0QUU3ekZZVW5KRUVr?=
 =?utf-8?B?NFRkdFdRMloyeGdaS0padVovNytkbjVwT0ZXa3pzbFl2emFEeXFtU09hK0RE?=
 =?utf-8?B?d1crUXB1Mkh6ejVMWGxFZzhGYWVWN3ZnTk1XRytXOHFkVVp6Rm5hMGFmaVpN?=
 =?utf-8?B?QlRqcjB5RVhwMFA2TkJsUUR6bWdvUW0relo4MDhINFNpS1lDVnhRMjllbUNH?=
 =?utf-8?B?NW16dzZRMldydzFEL2t4M0xYcDRsNi9VVWtBYXlFT0dXRGF0U1YxNnQ0ZE52?=
 =?utf-8?B?UE9BeWRRRDE1MjZvbWdIUzVyRXBCMHo2T0o4bDFoNklZVXNkYjVYc2tsRlVF?=
 =?utf-8?B?b2Z4Slp4aEFaVDdsdGNWNm0rYmNXTGVRUGlKRVRQWjVUSGhVQVF2eTB3dzhK?=
 =?utf-8?B?RDZ4dm5hcmFSMFR1M0xNbld1ZGdKVTBFeG5yejEwOTFZV051UHQ5RUZpWU9W?=
 =?utf-8?B?NEJmZXNEbnRib1dKWnNvZ3BLeUtZMkZQd1M4aHQxbnRqK2NIbDc4S0V5QnJp?=
 =?utf-8?B?VmZ1a2MyV05ZN2lxdE54MVhxdVJDcHc5c3NuamZQOEprMHlWRDFuZStNbnE3?=
 =?utf-8?B?VWxndVdJaHhVWUQ0UWZRMTJZZDU5STdyRjUvVHpZcGo1cWYzNnU4dXcwc3FB?=
 =?utf-8?B?eDVvSHc5dlo3SlV5d2Vtc0k1Vit3c1UwQUtxRnhyUU9jWFRxWG5rOFZvWkpO?=
 =?utf-8?B?c1RWQWpNM0xTRlhZRnMrR2VPWDRhYXI4cUc4RDJ2aTNPcDFrQXZWUlZKT0ky?=
 =?utf-8?B?Wm5lLzFuY3Z0RkQxdnV1SnU2SFdLL1MvRFpJVWZzb0xTNUcybFJaWk9EUmgz?=
 =?utf-8?B?TGZnU25pZUlhaTVydTVtVHpKc3hocW14b1ArM2dUVzRuenVneGdFRTlyVHgr?=
 =?utf-8?B?TkhGd1FlK1EzeTFnM1lNY0NHSkdSWCtQLzh3WGh4UlNlellwV1ZDN3pOMXAv?=
 =?utf-8?B?MEZnK3ltaS9XVU90dVI1eUM0amxNSGhHUGtycUpDYXprU3ZJODlhVDJ1WjVZ?=
 =?utf-8?B?VFo4WmJiV1ZsbHJNRFZ5NVFBNkI4dmdCczVraDNMY0xRWDlPVE9jOUx2TU9S?=
 =?utf-8?B?bWc0b0NhdHlUVzZtUjdZbE5seTE0QzRRL1lXUXZ6blM0azlocUhZeS9KOERL?=
 =?utf-8?B?MzZuRVdyR0JiR3FadnpYSkNzYlFHZFZVNkdwVmJBMys0Y216NWZiVHNkSFB6?=
 =?utf-8?B?TWFvVUtJcGMyRjBXZnJSWStoQ2I4SnVtRFU4NXkzN2YyNHY1bGYwandpcVRX?=
 =?utf-8?B?T21xdlArNHJPREZvcnZqdlNqdGc1aGxpVFl2dFFtMEFJNXZrMTMzNExuOXV1?=
 =?utf-8?B?UTZ0cVpjVExFRy8vTnpYYVNJOHMyQmE4SElWVmZ1anc0V2lUZkpGQWZNT3VK?=
 =?utf-8?B?dExYTCtLYVFxNEVaZTVsRUJ5UTZuSTI1cVFrZ1IwaDlnNkhWZFdoSWljakZW?=
 =?utf-8?B?NVIvUmxST0ltVzhNY1FGeVJMRGgrMHdRL2JjWGdzeS92b2Jpbktvakc0Y3ND?=
 =?utf-8?B?enBnV21KazZFQ2xXZzdzcDYrTEU1eDlaNlBnR1Q0aitpMC9SYWM0QXhSS1BK?=
 =?utf-8?B?YW1zVUIzazErMjNBZGMwZTlLY1BUTi9tS0dxNmN0U25zMmU3QUxQYWN3WDRl?=
 =?utf-8?Q?xpvwecrHnIFx87CpanZB4bXfCgcgtRRw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anZ0QlhpRE5HMERucG1VcVNwc216UXAvQy9ENGI4SVZpaE1kZXNKcW9GbGpj?=
 =?utf-8?B?aTR0VE9ET1JPK0I2ME41UWhBa0xia24xVVNUc3d0a0UrOW9zUXNLYTRkR1dM?=
 =?utf-8?B?MzZBeGFwdmV2OHN5S0VNU0FxVWZOMGR5MVlLcDdibmprQVNjUXk1STk2b3lD?=
 =?utf-8?B?OGI3RTVJY05hS0xWeHJPNDFmV1ZUbEtYN2IyNm9iV1Z1NXFqR21QOTBZZ0VX?=
 =?utf-8?B?WTVhU01kdCtKZzBEcFBlV21JRVBOcUtVdWNJakpQck0zNS9XamszRGpZNVBY?=
 =?utf-8?B?RTg5S2V2MkQ1LytBZDdoU3VxMmYvazRxcU9GaXd5TEJtTHNnSGF6Vzg4YW5x?=
 =?utf-8?B?b0ZjNUFOWmFhODhnRmJxYzA4b1Z6MElBRlpoc1pRQllVSVd5cjlKeUMxNFBn?=
 =?utf-8?B?M0ZoVXluRXVaa3c3dzFZVjBCUHlQS2RJbHdoRkJUOWNSaWM3M1JsV1lqMkRk?=
 =?utf-8?B?eGdONmtHWThxV0NlNDZ6MzhwaVRPQmpWWGp2S1FqWUV4MmpxS2FYazBCbWNQ?=
 =?utf-8?B?OCtydjJMSnVYbEVIY1l3TkJSTXN1YmlJT0cxRVp2ekFZdEtYY0w1ek51NGxL?=
 =?utf-8?B?MmdNcnAwSkpxQ3Y1Q0V6YlBVN3dVUkRVS2lqbUxxSVQ5Q2ozbDhXblNBa3lu?=
 =?utf-8?B?YmFjSzhMaStzdkxMWCt2dW42Sk5QWTRWTEJHUCs0Snd6cGVXWE5BMmJ6azFW?=
 =?utf-8?B?VURJTTBCK09ERlBTWmFnajRPeU0wUi94NmEzNWkyYzNpUjRXWFNDSHFYaDNn?=
 =?utf-8?B?a3NSVHppUHR3ZGcrQ05hQWFkUHNWYklxZ1ZMcmdWTTNkQll5LzRQSmkzYnFi?=
 =?utf-8?B?Y3gzTERxVGZYSSsrTlZlWGxoWmF0SXEzbXBjLzBFZlBKdkhja1FUcVpaNnBs?=
 =?utf-8?B?Y1pYTm00VU9NY2pxSXdRcUxpV29JUnMvVDI0MHRucFBPZUp0bU13QlNldmZK?=
 =?utf-8?B?bHZRNXR5RkpxaVlRNHloYksxMFVDNGkzUHNhZjlwelpLQlBWdW1FMmtxY3Rs?=
 =?utf-8?B?STI2dlAvb3k1MkRnckFmcno1czlmZ1hTRmJydVNoQ0F4SHVJUy9OZkF4MUkx?=
 =?utf-8?B?WWY5RHluZDVIUnJMODI2VFZpRjFGUDBtOEhpSXB4bk15ZGJIV04wZUFaMzc3?=
 =?utf-8?B?amxCVTZsU1FjMFNkT2ZMWFp2bXVSK0MrYnlEVkJrOCtpaDJlcnFWUyt6WUp2?=
 =?utf-8?B?REYra0lqTUJCSFpIcmk0NkFTdUxRcmtrUmdNaVRVRER4aGt3bmRZVFZHcW5S?=
 =?utf-8?B?Nk9DT1hMa3MwRlRiZUl4UkVPbGxlYVpSS0lnTnFINC80VW0rMk1rT0hvMjh0?=
 =?utf-8?B?V0ZnSXdMTDYzaUpVKzJtVUZvODBEMjdsaXNMTVl6eUpha2p1S2c1NkZRTmxM?=
 =?utf-8?B?bEZkb3FSU0liQXNkOW1MSmt5dkVZZGt2RFR1VzlhSGI5QTRUQmxFSFg3SlNI?=
 =?utf-8?B?WGwwMmNHam1BY3JQYjFZcXpwSFUySjJuQ25ETCtwMFl3ZkozUlR6TkkxdWFs?=
 =?utf-8?B?WGk4bnRXQVFhOEZHcTFrWGhQeGR1dk5mZ2tFcXlGK0FpQWJyY1RuSTkrNWlX?=
 =?utf-8?B?YmI3QkhkRUJFeXhxTHlUVFhBWGlxVlN2dmlHRHhaeDYvUzZWL2k5eGVhdnh5?=
 =?utf-8?B?MVA1bjBEYWFMOExYWHV4SUhuaXZ4TVNqTFViVjVpN0RiRUQ1c3lITVoxM08r?=
 =?utf-8?B?TFI1bnFOMzgzbm1EWENLdzJQSlozZjRVSVdKcnkvUGprSkZScUZ3c2VrVklL?=
 =?utf-8?B?OWw5c0dUd0doSmlRVmhWb0tIb0h3SW5CSVhvWm15TllQWmpQdUFOSlBHWXpF?=
 =?utf-8?B?NWFHNkRwalRmRGkzcjhPQW92Y01OWSs1cXM1RG5UVVJHd1RhVUxLUDNYRkdU?=
 =?utf-8?B?eHBEc2lpOTVRYUpRVEwyZEh4bHN2Z3dKdXp1R1JVcm9RdjFvSmdtV1RZRWU5?=
 =?utf-8?B?UjRqWklyeUcwQnJGbURjY1V6d3JwOEdiSXFrSTM4eGo1NE9ZVENsOXF5SGZI?=
 =?utf-8?B?Yzl0RFhwaXEvWVBjNnZ3NmoxYU4wWlU2Sm52MGpHcHljN0ZpVkhtR29IcTlj?=
 =?utf-8?B?VWVVWDgvcjVVT1ZMU1Z2dGhsUGVnN09kSEdaQ0JqUWc2bnZTTiszdTlXR3Ur?=
 =?utf-8?B?Y3QyMEF1UGVSR1ViQmRKdVNoUStBY3BHSUVNTk44bHZ3UnZjdlRXSGppMUV1?=
 =?utf-8?Q?0BcuiqZOHP7/yEDOqvoHnlFM6VxVSMiNMPW4Ep//zB3n?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8939e53-778f-47d9-bf02-08dd36326010
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 13:33:34.4020 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W8+oHOAr5Umh8NohZ6aQMIHptqznua0V49/JAzdjU3YBocWEB3n0dMoe1572bXgAkAeir6ZGI8OTSS2hN68/VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7182
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

PiBPbiBUaHUsIEphbiAxNiwgMjAyNSBhdCAxMjozMzozMFBNICswMDAwLCBNdXJ0aHksIEFydW4g
UiB3cm90ZToNCj4gPiA+ID4gPiBPbiBGcmksIEphbiAxMCwgMjAyNSBhdCAwMToxNTozMEFNICsw
NTMwLCBBcnVuIFIgTXVydGh5IHdyb3RlOg0KPiA+ID4gPiA+ID4gSW1hZ2VFbmhhbmNlbWVuVChJ
RVQpIGhhcmR3YXJlIGludGVycG9sYXRlcyB0aGUgTFVUIHZhbHVlIHRvDQo+ID4gPiA+ID4gPiBn
ZW5lcmF0ZSB0aGUgZW5oYW5jZWQgb3V0cHV0IGltYWdlLiBMVVQgdGFrZXMgYW4gaW5wdXQgdmFs
dWUsDQo+ID4gPiA+ID4gPiBvdXRwdXRzIGEgbmV3IHZhbHVlIGJhc2VkIG9uIHRoZSBkYXRhIHdp
dGhpbiB0aGUgTFVULiAxRCBMVVQNCj4gPiA+ID4gPiA+IGNhbiByZW1hcCBpbmRpdmlkdWFsIGlu
cHV0IHZhbHVlcyB0byBuZXcgb3V0cHV0IHZhbHVlcyBiYXNlZA0KPiA+ID4gPiA+ID4gb24gdGhl
IExVVCBzYW1wbGUuIExVVCBjYW4gYmUgaW50ZXJwb2xhdGVkIGJ5IHRoZSBoYXJkd2FyZSBieQ0K
PiA+ID4gPiA+ID4gbXVsdGlwbGUgbW9kZXMgRXg6IERpcmVjdCBMb29rdXAgTFVULCBNdWx0aXBs
aWNhdGl2ZSBMVVQgZXRjDQo+ID4gPiA+ID4gPiBUaGUgbGlzdCBvZiBzdXBwb3J0ZWQgbW9kZSBi
eSBoYXJkd2FyZSBhbG9uZyB3aXRoIHRoZQ0KPiA+ID4gPiA+ID4gZm9ybWF0KGV4cG9uZW50DQo+
ID4gPiA+ID4gPiBtYW50aXNzYSkgaXMgZXhwb3NlZCB0byB1c2VyIGJ5IHRoZSBpZXRfbHV0X2Nh
cHMgcHJvcGVydHkuDQo+ID4gPiA+ID4gPiBNYXhpbXVtIGZvcm1hdCBiZWluZyA4LjI0IGkuZSA4
IGV4cG9uZW50IGFuZCAyNCBtYW50aXNzYS4NCj4gPiA+ID4gPiA+IEZvciBpbGx1c3RyYXRpb24g
YSBoYXJkd2FyZSBzdXBwb3J0aW5nIDEuOSBmb3JtYXQgZGVub3RlcyB0aGlzDQo+ID4gPiA+ID4g
PiBhcyAweDEwMDAxRkYuIEluIG9yZGVyIHRvIGtub3cgdGhlIGV4cG9uZW50IGRvIGEgYml0d2lz
ZSBBTkQNCj4gPiA+ID4gPiA+IHdpdGggMHhGMDAwMDAwLiBUaGUgTFVUIHZhbHVlIHRvIGJlIHBy
b3ZpZGVkIGJ5IHVzZXIgd291bGQgYmUNCj4gPiA+ID4gPiA+IGEgMTBiaXQgdmFsdWUgd2l0aCAx
IGJpdCBpbnRlZ2VyIGFuZCA5IGJpdCBmcmFjdGlvbmFsIHZhbHVlLg0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+IE11bHRpcGxlIGZvcm1hdHMgY2FuIGJlIHN1cHBvcnRlZCwgaGVuY2UgcG9pbnRl
ciBpcyB1c2VkIG92ZXIgaGVyZS4NCj4gPiA+ID4gPiA+IFVzZXIgY2FuIHRoZW4gcHJvdmlkZSB0
aGUgTFVUIHdpdGggYW55IG9uZSBvZiB0aGUgc3VwcG9ydGVkDQo+ID4gPiA+ID4gPiBtb2RlcyBp
biBhbnkgb2YgdGhlIHN1cHBvcnRlZCBmb3JtYXRzLg0KPiA+ID4gPiA+ID4gVGhlIGVudHJpZXMg
aW4gdGhlIExVVCBjYW4gdmFyeSBkZXBlbmRpbmcgb24gdGhlIGhhcmR3YXJlDQo+ID4gPiA+ID4g
PiBjYXBhYmlsaXR5IHdpdGggbWF4IGJlaW5nIDI1NS4gVGhpcyB3aWxsIGFsc28gYmUgZXhwb3Nl
ZCBhcw0KPiA+ID4gPiA+ID4gaWV0X2x1dF9jYXBzIHNvIHVzZXIgY2FuIGdlbmVyYXRlIGEgTFVU
IHdpdGggdGhlIHNwZWNpZmllZCBlbnRyaWVzLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+
ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiAgaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIHwg
NTANCj4gPiA+ID4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspDQo+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21v
ZGUuaA0KPiA+ID4gPiA+ID4gYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggaW5kZXgNCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+DQo+IDdhNzAzOTM4MTE0MmJiNWRiYTI2OWJkYWVj
NDJjMThiZTM0ZTJkMDUuLjA1NmMyZWZlZjE1ODk4NDgwMzRhZmMwMA0KPiA+ID4gPiA+IDg5ZjEN
Cj4gPiA+ID4gPiA+IDgzOGMyNTQ3YmNmOCAxMDA2NDQNCj4gPiA+ID4gPiA+IC0tLSBhL2luY2x1
ZGUvdWFwaS9kcm0vZHJtX21vZGUuaA0KPiA+ID4gPiA+ID4gKysrIGIvaW5jbHVkZS91YXBpL2Ry
bS9kcm1fbW9kZS5oDQo+ID4gPiA+ID4gPiBAQCAtMTM2Nyw2ICsxMzY3LDE3IEBAIHN0cnVjdCBk
cm1fbW9kZV9jbG9zZWZiIHsNCj4gPiA+ID4gPiA+ICAgKi8NCj4gPiA+ID4gPiA+ICAjZGVmaW5l
IERSTV9NT0RFX0hJU1RPR1JBTV9IU1ZfTUFYX1JHQiAgICAgICAgICAgICAgICAgICAgICgxIDw8
DQo+ID4gPiA+ID4gMCkNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiArLyogTFVUIHZhbHVlcyBh
cmUgcG9pbnRzIG9uIGV4cG9uZW50aWFsIGdyYXBoIHdpdGggeCBheGlzIGFuZA0KPiA+ID4gPiA+
ID4gK3ktYXhpcw0KPiA+ID4gPiA+ID4gK3k9Zih4KSAqLw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
SHVoPw0KPiA+ID4gPiA+DQo+ID4gPiA+IFRoaXMgZih4KSBjYW4gYmUgdGhlIGFsZ29yaXRobSBk
ZWZpbmVkICBieSB0aGUgdXNlciBzcGFjZQ0KPiA+ID4gPiBhbGdvcml0aG0gdG8gZ2VuZXJhdGUg
dGhlIGxvb2t1cCB0YWJsZS4gR2VuZXJhdGlvbiBvZiB0aGUgTFVUDQo+ID4gPiA+IHZhbHVlIGlz
IGxlZnQgdG8gdGhlIHVzZXINCj4gPiA+IHNwYWNlIGFsZ29yaXRobS4NCj4gPiA+ID4gV2hlbiB0
aGlzIExVVCB0YWJsZSBpcyBwYXNzZWQgdG8gdGhlIGhhcmR3YXJlIGl0cyBqdXN0IHNpZ25pZmll
cw0KPiA+ID4gPiBob3cgaGFyZHdhcmUgc2hvdWxkIHVzZSB0aGlzIHRhYmxlIHRvIGdldCB0aGUg
TFVUIHZhbHVlLiBJbiB0aGlzDQo+ID4gPiA+IG1vZGUgaXQncyBhIGRpcmVjdA0KPiA+ID4gbG9v
a3VwIHRhYmxlLg0KPiA+ID4NCj4gPiA+IFlvdXIgZG9jdW1lbnRhdGlvbiBzaG91bGQgYmUgZGVz
Y3JpYmluZyB3aGF0IGlzIGV4cGVjdGVkIGZyb20gdGhlDQo+IHVzZXJzcGFjZS4NCj4gPiA+IFdo
YXQgaXMgeSwgeCBhbmQgZih4KT8gSG93IGlzIGl0IGJlaW5nIHVzZWQ/DQo+ID4gPg0KPiA+IFN1
cmUgd2lsbCBhZGQgdGhlIGFib3ZlIGV4cGxhbmF0aW9uIGluIHRoZSBwYXRjaCBkb2N1bWVudGF0
aW9uLg0KPiA+DQo+ID4gPiA+DQo+ID4gPiA+ID4gPiArI2RlZmluZSBEUk1fTU9ERV9JRVRfTE9P
S1VQX0xVVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAoMSA8PA0KPiA+ID4gPiA+IDApDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBBZ2Fpbiwgd2hhdCBpcyB0aGUgcmVhc29uIGZvciBhIHNoaWZ0
PyBDYW4gdGhlc2UgdmFsdWVzIGJlIE9SJ2Q/DQo+ID4gPiA+ID4NCj4gPiA+ID4gWWVzIGNhbiBi
ZSBPUidkIHZhbHVlcyBhcyB3ZWxsLg0KPiA+ID4gPiBMZXQgbWUga25vdyBpZiB0aGlzIGhhcyB0
byBiZSBjaGFuZ2VkPw0KPiA+ID4gPiBKdXN0IGNob3NlIGJpdHdpc2Ugc2hpZnQgdG8gZGVub3Rl
IHRoZSBtdWx0aXBsZSBtb2Rlcy4NCj4gPiA+DQo+ID4gPiBXaGF0IGRvZXMgaXQgbWVhbiBpZiBk
cm1faWV0XzFkbHV0X3NhbXBsZS5pZXRfbW9kZSBjb250YWlucyBPUiBvZg0KPiA+ID4gdHdvIHZh
bHVlcz8NCj4gPiA+DQo+ID4gaWV0X21vZGUgaW4gc3RydWN0IGRybV9pZXRfY2FwcyBjYW4gYmUg
T1Igb2YgdHdvIHN1Y2ggbW9kZXMsIHdoaWNoDQo+ID4gbWVhbnMgdGhhdCB0aGUgaGFyZHdhcmUg
c3VwcG9ydHMgYm90aCBvZiB0aGUgbW9kZXMuDQo+ID4gRHJtX2lldF8xZGx1dF9zYW1wbGUuaWV0
X21vZGUgdGVsbHMgdGhlIGhhcmR3YXJlIHdoaWNoIGlldCBtb2RlIGlzDQo+ID4gdXNlZCBpbiBn
ZW5lcmF0aW5nIHRoZSBMVVQgdmFsdWUuIEJlY2F1c2UgaGFyZHdhcmUgd2lsbCBoYXZlIHRvDQo+
ID4gaW50ZXJwcmV0IHRoZSBMVVQgdmFsdWUgYmFzZWQgb24gdGhlIG1vZGUuDQo+IA0KPiBZZXMu
IFRoYXQncyB3aHkgSSBhc2tlZCBhYm91dCB0aGUgZHJtX2lldF8xZGx1dF9zYW1wbGUuaWV0X21v
ZGUsIG5vdCB0aGUNCj4gY2Fwcy4gSXQgbWFrZXMgbm8gc2Vuc2UgdG8gYWxsb3cgT1Jpbmcgc2V2
ZXJhbCBtb2RlcyB0aGVyZS4gU28gdGhlIGxpc3Qgb2YNCj4gbW9kZXMgc2hvdWxkIGJlIGEgc2lt
cGxlIGVudW0gYW5kIGNhcHMgc2hvdWxkIHVzZSBCSVQodmFsKS4NCj4gDQpPayBzdXJlIHdpbGwg
Y2hhbmdlIGFjY29yZGluZ2x5IGluIHRoZSBuZXh0IHJldmlzaW9uLg0KDQo+ID4NCj4gPiA+ID4N
Cj4gPiA+ID4gPiA+ICsvKg0KPiA+ID4gPiA+ID4gKyAqIExVVCB2YWx1ZXMsIHBvaW50cyBvbiBu
ZWdhdGl2ZSBleHBvbmVudGlhbCBncmFwaCB3aXRoDQo+ID4gPiA+ID4gPiAreC1heGlzIGFuZCB5
LWF4aXMNCj4gPiA+ID4gPiA+ICsgKiBZID0geS94IHNvIHVwb24gbXVsdGlwbHlpbmcgeCwgeSBp
cyBvYnRhaW5lZCwgaGVuY2UNCj4gPiA+ID4gPiA+ICttdWx0aXBsaWNhdGl2ZS4gVGhlDQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiBDYW4ndCBwYXJzZSB0aGlzIHNlbnRlbmNlLg0KPiA+ID4gPiA+DQo+
ID4gPiA+IFdlIG5lZWQgeCBhbmQgeSBwb2ludHMgaW4gdGhlIGV4cG9uZW50aWFsIGdyYXBoLg0K
PiA+ID4gPiBGb3IgcmV0cmlldmluZyB0aGUgdmFsdWUgWSBvbiB0aGUgZ3JhcGggdGhlIHZhbHVl
IHBhc3NlZCBieSB0aGUNCj4gPiA+ID4gdXNlciBpcyBpbiB0aGUgZm9ybWF0IHkveCBJbiBvcmRl
ciB0byBnZXQgdGhlIFkgcG9pbnRzIG9uIHRoZQ0KPiA+ID4gPiBncmFwaCB0aGUgdmFsdWUgaGFz
IHRvDQo+ID4gPiBiZSBtdWx0aXBsaWVkIGJ5IHguDQo+ID4gPiA+IFRoaXMgaXMgYSBmbG9hdGlu
ZyBwb2ludCB2YWx1ZSB3aGVuIGNvbXBhcmVkIHdpdGggYW4gaW50ZWdlciB2YWx1ZQ0KPiA+ID4g
PiB3aXRoIHRoZSBkaXJlY3QgbG9va3VwIG1vZGUuDQo+ID4gPg0KPiA+ID4gQWdhaW4sIHdoYXQg
YXJlIHggYW5kIHk/IEJpbiBpbmRpY2VzPyBQaXhlbCBjb3VudHM/IE51bWJlciBvZiBDUFVzDQo+
ID4gPiBpbiB0aGUgY3VycmVudCBnZW5lcmF0aW9uPw0KPiA+ID4NCj4gPiBJdCBkZXBlbmRzIG9u
IHRoZSBtb2RlIGZvciBkaXJlY3QgbG9va3VwIGJvdGggeCBhbmQgeSBhcmUgcGl4ZWxzIGFuZA0K
PiA+IGZvciBtdWx0aXBsaWNhdGl2ZSBtb2RlIFggY28tb3JkaW5hdGUgaXMgcHJvcG9ydGlvbmFs
IHRvIHRoZSBwaXhlbA0KPiA+IHZhbHVlIGFuZCB0aGUgWSBjby1vcmRpbmF0ZSBpcyB0aGUgbXVs
dGlwbGllciBmYWN0b3IsIGkuZSBYLWF4aXMgaW4NCj4gPiBwaXhlbHMgYW5kIFktYXhpcyBpcyBP
dXRQaXhlbC9JblBpeGVsDQo+IA0KPiBQbGVhc2UgZXhwYW5kIHRoZSBkZXNjcmlwdGlvbi4gQW4g
ZW5naW5lZXIsIHdobyBoYXMgbm8gSW50ZWwgZG9jdW1lbnRhdGlvbiwNCj4gc2hvdWxkIGJlIGFi
bGUgdG8gdW5kZXJzdGFuZCB5b3VyIGRlc2NyaXB0aW9uLg0KPiANClN1cmUgd2lsbCBhZGQgdGhp
cyBpbiB0aGUgZGVzY3JpcHRpb24gYW5kIGluIHRoZSBwYXRjaCBjb21taXQgbWVzc2FnZSBhcyB3
ZWxsIGluIHRoZSBuZXh0IHJldmlzaW9uLg0KDQo+ID4gPiA+ID4gPiArICogZm9ybWF0IG9mIExV
VCBjYW4gYXQgbWF4IGJlIDguMjQoOGludGVnZXIgMjQgZnJhY3Rpb25hbCkNCj4gPiA+ID4gPiA+
ICsgcmVwcmVzZW50ZWQgYnkNCj4gPiA+ID4gPiA+ICsgKiB1MzIuIERlcGVuZGluZyBvbiB0aGUg
aGFyZHdhcmUgY2FwYWJpbGl0eSBhbmQgZXhwb25lbnQNCj4gPiA+ID4gPiA+ICsgbWFudGlzc2Eg
Y2FuIGJlDQo+ID4gPiA+ID4gPiArICogY2hvc2VuLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gV2hh
dCBkb2VzIHRoYXQgbWVhbj8gSG93IGlzIGl0IGNob29zZW4/DQo+ID4gPiA+ID4NCj4gPiA+ID4g
VGhlIG1heCB2YWx1ZSB0aGF0IHRoZXNlIGtpbmQgb2YgMURMVVQgY2FuIGJlIGlzIDguMjQNCj4g
PiA+DQo+ID4gPiBXaHk/DQo+ID4gPg0KPiA+IDMyYml0IGlzIHRoZSBjb250YWluZXIgYW5kIHdp
dGhpbiB0aGlzIGlmIHdlIGNob29zZSAxNi4xNiB0aGVuIGl0DQo+ID4gZG9lc27igJl0IG1ha2Ug
c2Vuc2UgdG8gYm9vc3QgdGhlIHBpeGVsIGJ5IDJeMTYgSGVuY2Ugc2V0IGFzaWRlIDggYml0DQo+
ID4gZm9yIGludGVnZXIgMl44ICB0aGVyZWJ5IGJvb3N0aW5nIHRoZSBwaXhlbCBieSAyNTUgYW5k
IHRoYXTigJlzIGEgaHVnZQ0KPiA+IGJvb3N0IGZhY3Rvci4NCj4gPiBSZW1haW5pbmcgMjQgYml0
cyBvdXQgb2YgdGhlIGNvbnRhaW5lciAzMiBpcyBmcmFjdGlvbmFsIHZhbHVlLiBUaGlzIGlzDQo+
ID4gdGhlIG9wdGltYWwgdmFsdWUgZm9yIGltcGxlbWVudGluZyBpbiB0aGUgaGFyZHdhcmUgYXMg
d2VsbCBhcyBwZXIgdGhlDQo+ID4gaGFyZHdhcmUgZGVzaWduLg0KPiANCj4gR2VuZXJpYyBBUEkg
bWVhbnMgdGhhdCB0aGVyZSBpcyBubyBwYXJ0aWN1bGFyIGhhcmR3YXJlIGRlc2lnbi4gSG93ZXZl
ciB0aGUNCj4gcmVzdCBvZiB0aGUgZGVzY3JpcHRpb24gbWFrZXMgc2Vuc2UuIFBsZWFzZSBhZGQg
aXQgdG8gdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiANClN1cmUgd2lsbCBkbyBpdCBpbiB0aGUgbmV4
dCByZXZpc2lvbiENCg0KPiA+DQo+ID4gPiA+IEhhcmR3YXJlIGRlc2lnbiBjYW4gY2hvb3NlIGFu
eXRoaW5nIHdpdGhpbiB0aGlzIHJhbmdlLiBUaGlzDQo+ID4gPiA+IGRlcGVuZHMgb24gdGhlIGFj
Y3VyYWN5IHJlcXVpcmVkIGJ5IGhhcmR3YXJlIGtlZXBpbmcgaW4gbWluZCB0aGUNCj4gPiA+ID4g
aGFyZHdhcmUgY29zdCBmb3IgaW1wbGVtZW50YXRpb24uDQo+ID4gPiA+IEp1c3QgYSBwcmVjaXNp
b24gZm9yIDMyYml0IHZhbHVlLg0KPiA+ID4gPg0KPiA+ID4gPiA+ID4gKyAqLw0KPiA+ID4gPiA+
ID4gKyNkZWZpbmUgRFJNX01PREVfSUVUX01VTFRJUExJQ0FUSVZFICAgICAgICAgICAgICAgICAg
ICAgICAgKDEgPDwgMSkNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICAvKioNCj4gPiA+ID4g
PiA+ICAgKiBzdHJ1Y3QgZHJtX2hpc3RvZ3JhbV9jYXBzDQo+ID4gPiA+ID4gPiAgICoNCj4gPiA+
ID4gPiA+IEBAIC0xNDE0LDYgKzE0MjUsNDUgQEAgc3RydWN0IGRybV9oaXN0b2dyYW0gew0KPiA+
ID4gPiA+ID4gICAgIF9fdTMyIG5yX2VsZW1lbnRzOw0KPiA+ID4gPiA+ID4gIH07DQo+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gKy8qKg0KPiA+ID4gPiA+ID4gKyAqIHN0cnVjdCBkcm1faWV0X2Nh
cHMNCj4gPiA+ID4gPiA+ICsgKg0KPiA+ID4gPiA+ID4gKyAqIEBpZXRfbW9kZTogcGl4ZWwgZmFj
dG9yIGVuaGFuY2VtZW50IG1vZGVzIGRlZmluZWQgaW4gdGhlDQo+ID4gPiA+ID4gPiArYWJvdmUg
bWFjcm9zDQo+ID4gPiA+ID4gPiArICogQGlldF9zYW1wbGVfZm9ybWF0OiBob2xkcyB0aGUgYWRk
cmVzcyBvZiBhbiBhcnJheSBvZiB1MzINCj4gPiA+ID4gPiA+ICtMVVQgc2FtcGxlDQo+ID4gPiA+
ID4gZm9ybWF0cw0KPiA+ID4gPiA+ID4gKyAqICAgICAgICAgICAgICAgIGRlcGVuZGluZyBvbiB0
aGUgaGFyZHdhcmUgY2FwYWJpbGl0eS4gTWF4IGJlaW5nIDguMjQNCj4gPiA+ID4gPiA+ICsgKiAg
ICAgICAgICAgICAgICBEb2luZyBhIGJpdHdpc2UgQU5EIHdpbGwgZ2V0IHRoZSBwcmVzZW50IHNh
bXBsZS4NCj4gPiA+ID4gPiA+ICsgKiAgICAgICAgICAgICAgICBFeDogZm9yIDEgaW50ZWdlciA5
IGZyYWN0aW9uIEFORCB3aXRoIDB4MTAwMDFGRg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gPz8gQ2Fu
IGhhcmR3YXJlIHN1cHBvcnQgMTYuMTY/IDMyLjA/DQo+ID4gPiA+ID4NCj4gPiA+ID4gTm8sIGZv
ciBhIDFEIExVVCBtYXhpbXVtIGZsb2F0aW5nIG51bWJlciBjYW4gYmUgOC4yNA0KPiA+ID4NCj4g
PiA+IFdoeT8gSXMgaXQgYSBsaW1pdGF0aW9uIG9mIHRoZSBJbnRlbCBoYXJkd2FyZSBvciBqdXN0
IGEgcmFuZG9tIEFQSSBjaG9pY2U/DQo+ID4gPg0KPiA+IEFzIGV4cGxhaW5lZCBhYm92ZSB0aGlz
IGFuIG9wdGltYWwgdmFsdWUgeWllbGRpbmcgdG8gYSBodWdlIGJvb3N0DQo+ID4gZmFjdG9yIG9m
IDI1NS45OS4gVGhpcyBpcyBhcyBwZXIgdGhlIGhhcmR3YXJlIGRlc2lnbi4NCj4gPg0KPiA+ID4g
PiBIZW5jZSBoYXJkd2FyZSB3aWxsIGhhdmUgdG8gYWRoZXJlIHRvIGFueXRoaW5nIHdpdGhpbiB0
aGlzIHJhbmdlLg0KPiA+ID4gPg0KPiA+ID4gPiA+ID4gKyAqIEBucl9pZXRfc2FtcGxlX2Zvcm1h
dHM6IG51bWJlciBvZiBpZXRfc2FtcGxlX2Zvcm1zdHMNCj4gPiA+ID4gPiA+ICsgc3VwcG9ydGVk
IGJ5DQo+ID4gPiA+ID4gdGhlDQo+ID4gPiA+ID4gPiArICogICAgICAgICAgICAgICAgICAgIGhh
cmR3YXJlDQo+ID4gPiA+ID4gPiArICogQG5yX2lldF9sdXRfZW50cmllczogbnVtYmVyIG9mIExV
VCBlbnRyaWVzICAqLyBzdHJ1Y3QNCj4gPiA+ID4gPiA+ICtkcm1faWV0X2NhcHMgew0KPiA+ID4g
PiA+ID4gKyAgIF9fdTggaWV0X21vZGU7DQo+ID4gPiA+ID4gPiArICAgdTY0IGlldF9zYW1wbGVf
Zm9ybWF0Ow0KPiA+ID4gPiA+ID4gKyAgIF9fdTMyIG5yX2lldF9zYW1wbGVfZm9ybWF0czsNCj4g
PiA+ID4gPiA+ICsgICBfX3UzMiBucl9pZXRfbHV0X2VudHJpZXM7DQo+ID4gPiA+ID4gPiArfTsN
Cj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsvKioNCj4gPiA+ID4gPiA+ICsgKiBzdHJ1Y3Qg
ZHJtX2lldF8xZGx1dF9zYW1wbGUNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IElzIGl0IHN1cHBvc2Vk
IHRvIGJlIHVzZWQgd2l0aCBEUk1fTU9ERV9JRVRfTVVMVElQTElDQVRJVkUgb25seT8NCj4gPiA+
ID4gPiBPciBpcyBpdCBzdXBwb3NlZCB0byBiZSB1c2VkIHdpdGggRFJNX01PREVfSUVUX0xPT0tV
UF9MVVQ/IEluDQo+ID4gPiA+ID4gdGhlIGxhdHRlciBjYXNlIHdoYXQgc2hvdWxkIGJlIHRoZSBp
ZXRfZm9ybWF0IHZhbHVlPw0KPiA+ID4gPiA+DQo+ID4gPiA+IFRoZSBzdHJ1Y3QgaWV0XzFkbHV0
X3NhbXBsZSB3aWxsIGJlIHVzZWQgZm9yIGFsbCB0aGUgSUVUIG1vZGVzIGkuZQ0KPiA+ID4gPiBk
aXJlY3QgbG9va3VwIGFuZCBtdWx0aXBsaWNhdGl2ZS4NCj4gPiA+ID4gVGhlIGVsZW1lbnQgaWV0
X3NhbXBsZV9mb3JtYXQgd2lsbCBub3QgYmUgYXBwbGljYWJsZSBmb3IgZGlyZWN0DQo+ID4gPiA+
IGxvb2t1cC4gVGhpcyB3aWxsIGJlIHVzZWQgZm9yIG11bHRpcGxpY2F0aXZlIGFuZCB0aGUgdmFs
dWUgd2hhdCBpdA0KPiA+ID4gPiBjYW4gaG9sZCBmb3IgbXVsdGlwbGljYXRpdmUgaXMgbWVudGlv
bmVkIGluIHRoZSBhYm92ZSBkZXNjcmlwdGlvbi4NCj4gPiA+ID4gSSBtaXNzZWQgYWRkaW5nIHRo
aXMgaW5mbyBpbiB0aGUgZGVzY3JpcHRpb24sIHdpbGwgYWRkIGl0IGluIHRoZSBuZXh0IHZlcnNp
b24uDQo+ID4gPg0KPiA+ID4gQW5kIHNvbWUgb3RoZXIgZm9ybWF0cyB3aWxsIGFsc28gcmVxdWly
ZSBhZGRpdGlvbmFsIGRhdGEuIFRoaXMNCj4gPiA+IG11bHRpLWZvcm1hdCBzdHJ1Y3R1cmUgc291
bmRzIGJhZCBmcm9tIG15IFBPVi4NCj4gPiA+DQo+ID4gV2lsbCB0cnkgZ2VuZXJhbGl6ZSB0aGlz
IHN0cnVjdHVyZSBhY3Jvc3MgdGhlIG1vZGVzLg0KPiA+IEl0cyBvbmx5IGZvciBkaXJlY3QgbG9v
a3VwIG1vZGUgd2Ugd2lsbCBub3QgbmVlZCBhbnkgaWV0X3NhbXBsZV9mb3JtYXQuDQo+ID4gRm9y
IG90aGVyIG1vZGVzIHN1Y2ggYXMgbXVsdGlwbGljYXRpdmUsIGFkZGl0aXZlIGV0YyB3ZSB3aWxs
IG5lZWQgdG8NCj4gPiBtZW50aW9uIHRoZSBpZXRfc2FtcGxlX2Zvcm1hdC4NCj4gDQo+IFRoZXJl
IG1pZ2h0IGJlIG90aGVyIG1vZGVzIHdoaWNoIHJlcXVpcmUgbW9yZSBkYXRhLg0KPiANClllcyBh
Z3JlZS4NClRoYXTigJlzIHRoZSByZWFzb24gaWV0X3NhbXBsZV9mb3JtYXQgaXMgdTY0IHdoaWNo
IGhvbGRzIHRoZSBhZGRyZXNzIG9mIHRoZSBmb3JtYXQuIEZvciBlYWNoIGluZGl2aWR1YWwgbW9k
ZSB0aGF0IHdlIGFkZCB3ZSB3aWxsIGhhdmUgdG8gZGVmaW5lIHRoZSBmb3JtYXQgYXMgd2VsbC4N
CkZvciBub3cgdGhlIG1vZGVzIHRoYXQgd2UgYWRkIGRpcmVjdCBsb29rdXAgYW5kIG11bHRpcGxp
Y2F0aXZlIHdpbGwgYmUgYWRkZWQgaW4gdGhpcyBwYXRjaC4NCldpbGwgYWRkIHRoZXNlIGRlc2Ny
aXB0aW9uIGluIHRoZSBuZXh0IHJldmlzaW9uIG9mIHRoZSBwYXRjaC4NCg0KVGhhbmtzIGFuZCBS
ZWdhcmRzLA0KQXJ1biBSIE11cnRoeQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg==
