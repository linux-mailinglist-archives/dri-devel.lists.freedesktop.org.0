Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BA6A20369
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 04:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4FB10E0DC;
	Tue, 28 Jan 2025 03:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ceq50wa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08ED10E073;
 Tue, 28 Jan 2025 03:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738035802; x=1769571802;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZbLgGBCxt31rDLMyfM8YygqbYTlmr/0hzFYVLEIK/6k=;
 b=Ceq50wa38UTS2idh/1kfdUCX0XZ4lCYLlWMeqQ8Iicje2AAmKUVuuzOm
 6KwkURho+yGXKRQMW0roVKtHO1qf5NlHiGkcAU9AS+xeewYvHKcMGCVcz
 2fqIwzRujQcXiNIzm7TfJ6hTVBZcmS5RXaX/RHBWRfsFuyXEVWByuzyAU
 sildTtdl8YNZq2sAafaAXhk3K3CviNo8MxPhngTmqllefp1lLmFYgS5wY
 a0VbSjp8RNptlZtqEMhUotcjQrT0dc/VFw3iS232vXM+z3k6SqA5xnS2L
 8Mq2OqjGr9mLU3mGJef4sPvyVETEBtxYl3Z7wJpWlzlco/+Bo3rK49xLM g==;
X-CSE-ConnectionGUID: GXmMPoTTQ1ab8cSEg8suPA==
X-CSE-MsgGUID: 1fBtD9M+Sq2qmX3PCTuEYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38396559"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="38396559"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 19:43:21 -0800
X-CSE-ConnectionGUID: cNRLvwMLTE2Sb53t+YfHJA==
X-CSE-MsgGUID: If3t8YKcSk63BZy7XC5HkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109546968"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 19:43:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 19:43:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 19:43:21 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 19:43:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEPxzx2dbrN6DLIBo1hL5zmEtX0r/mdVGNCZKVbJH+i2wZ8LI0LxTTJ+GM9NcXsnxqausqkv24HcJtsRofi9uHQ36ciRv9b1fY1BxCgk6YEsLGq4dFh6rHTaJx2MxE5H84adViHQ96P91G5pNHrfnKwBZ9EVQjXzACXvniuiR3zII49l+O6FOBba2wOvqlM6TNyp4F+8CaSOpnLD1gqUwevNQG+uYx+vkn8sEeoN/O9CpJygrhfddBNOrcRPasJbCwYmAVOWi5HHRcSIdgQTqFmxaXf36Ufj9rk2rril0gF2HLx+t5YJ9uFk3/cteiYZQv5g295C/XQK8aXZnhZlfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbLgGBCxt31rDLMyfM8YygqbYTlmr/0hzFYVLEIK/6k=;
 b=Px+WxeRvi/Bl7X+lmvKDQbK8oqjBxjeNJz6eo4sSXoFuMtPK390+6XqYCV86eGb4qAy8bbaXVZwrzkRIqa26sEIv3VaqSpvBzH3G1zmJG/urppNI8cU7PsJypF75SW9Y1uyFYWFNbSZskjS2Tl6Nm6bPRqkXFsttALxuAy7XpUoOpUkucVMUb/zCI2+Dyh7fUXUV3Y1of37+ukP/eXwzJMBBN28XkB5KW7zC+lUS5oM0+eHingAIKlHE7xgYEC37UZHKfB3JHiBgU5kAX+4bxmJAX0cq3/1mY0l8ZGNjqkDM2+kazsTQ7b+u/YKlp9tGPxy1ZDXkGaX6H5t38Jpe7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by LV3PR11MB8530.namprd11.prod.outlook.com (2603:10b6:408:1b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 03:42:37 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%6]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 03:42:36 +0000
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, Brian Geffon
 <bgeffon@google.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "Wilson, Chris P" <chris.p.wilson@intel.com>, "Saarinen, Jani"
 <jani.saarinen@intel.com>, "Mistat, Tomasz" <tomasz.mistat@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, Tomasz Figa <tfiga@google.com>
Subject: RE: [PATCH v3] drm/i915: Fix page cleanup on DMA remap failure
Thread-Topic: [PATCH v3] drm/i915: Fix page cleanup on DMA remap failure
Thread-Index: AQHbcPwo87rutNyj7U6aIPCA5JN+27MrHyyAgABsAmA=
Date: Tue, 28 Jan 2025 03:42:36 +0000
Message-ID: <PH7PR11MB82521EC01BA03D0C44631F5989EF2@PH7PR11MB8252.namprd11.prod.outlook.com>
References: <20250127204332.336665-1-bgeffon@google.com>
 <CH0PR11MB5444F718F2073C04D7F5729AE5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB5444F718F2073C04D7F5729AE5EC2@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8252:EE_|LV3PR11MB8530:EE_
x-ms-office365-filtering-correlation-id: 01feb250-5876-424d-7505-08dd3f4dce9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?YUoyY3cxaGtzUDdYVzN3MlA2dDZueGJQMHR3bG1IczRyREJtUGp4emFwVnpo?=
 =?utf-8?B?MStleDk5ZnFqOGhCWVpSMVdqRU1Ta2g5cGlQNjVvc0t6ejZEMEpaMGxQaWlB?=
 =?utf-8?B?K0JyWnN6bjZQSlZURUgvMUljMVF4NWZHc3QrYnU2QjhCNERZdkpFK0loK3pB?=
 =?utf-8?B?ZkIrVXkwNzk3S3I2aVZtLzFwTHBaVkhVc0dhckxESnIrN0hhTUlKWUxiUVF0?=
 =?utf-8?B?d3hGbWlOOTlyL3Vza2VUa0F6a3lxcTdFWFJnbVo1eE9mY0I0S0dQWUpkZWV5?=
 =?utf-8?B?RmlZZFg3SkxtRmxJc2lWNVNVUzA3MkFNck1UK1hxY3ZaRUdsdkcyTUFHOXVi?=
 =?utf-8?B?UU1PODlyeGRqaGlScE94bjBmcG5FdVp6ZVBaWW1DYVFZMVAxNG1zT3V6T0hQ?=
 =?utf-8?B?Q3VISVdsdnhRNU5sRXVmMS9uWk4rSXZtVUdYRFF1Tkw0ZUtqUW9rREoxbitJ?=
 =?utf-8?B?QkRhZFp2RVhtQktKZ2xMRzdMLzdxTlExVERtaUlEaTBPa01vaTFsRWNjcFFr?=
 =?utf-8?B?US8yMUVyR1hCZVgzZ0xEY1paMXlrTWJXcGVtNmhSS29mdzVTaU5TZUd4VUR6?=
 =?utf-8?B?SFZKODYvOGZ2UWtlVDJtVVZocUVDbndmTG1ESllJeEd4ZEUxZnNxTTR6Ykpa?=
 =?utf-8?B?S0lVSVFxNzFYbmcwcmN1OEhDbXlYQyt5Z3JlYTFucUxGQWJCWFRYdUdZeVU1?=
 =?utf-8?B?OUhRZzVJZy9SRkpMaDR4VTJLV2xaUTJRK3hlZXQySlc3cStXNi9aQW04VnJs?=
 =?utf-8?B?eFFkMlAwbytXZXJmU3VndGRrNVJIT0dDZ09seXVOWWJVK3gvaHRuRy9ZdmNQ?=
 =?utf-8?B?dk02ZUdwZGxnOVROQ1RWTkhFOUpMUEpNaWhKUVpWZGZtbEZCcW15dnV1d1ho?=
 =?utf-8?B?MFBTZ2Q1V0pFbW5LTXo2UG45a05POXJxMXo5aUNEQW9wekhvdUVFRW00WGt3?=
 =?utf-8?B?eVN1U3VkY0RxLzROdTNIT0hMT21JMTdoYk1lRkhZLzZHVnZhVWFZZVFEdTBv?=
 =?utf-8?B?elJFOE9tYzJnNXFFUzdGenZZS3RDRW8xM0x1RGk3b2ZDVlB3WVhrRnJNTXZ4?=
 =?utf-8?B?Snk0OXIvajlOMVVCMURsVW1lRjAzMDlJOEUra3ozNXVSc2ZxeG8yMzlKeElQ?=
 =?utf-8?B?VFZHS1NDL3ZtMFdvbzJodUcrQU4zSkJuRGZCQk9xSTZLTGczN1A1UWZHb1pQ?=
 =?utf-8?B?TWZXRTVsa296Zlp3b3RYdlQwVG1QcjdxQVN5RlYxRytURjdZVmczRWtMVDEz?=
 =?utf-8?B?QjNTZUtDMjl6MnJlMWxmVVVCcE00QUdXaDJaeWdxa3JwYTZ4bEQ3c285R0ND?=
 =?utf-8?B?NFZhejBwUkNUK1ZVTVhDMXBFT1g0S2M3c1pYRkxsUzVoeU01cG81eFZ0YmZS?=
 =?utf-8?B?RHlEcUlVZ0pYcm45RlNFTnE4Zy8rU1VxRlJqSC9wZm1sT0ttYmpBTitRZXhr?=
 =?utf-8?B?Tit2RGxYcEpjRmJrbGVqSW5GZUIvUHozbTErRDczZUR4TjhiSGRQNExWNGps?=
 =?utf-8?B?TWlkdHcwYTVnTEIwdDNTSWROZ1JQWTNjOUtYVmdCUnNuc21oOHJzclQ2V1U4?=
 =?utf-8?B?OXJicEcwb3ZZbVZFOGIxbXUvaVgvYVNCV25rdTZUZklDS3lPaU5JazJRb0p0?=
 =?utf-8?B?cXppUjlPT3hYUm82YU1TekJKMjFJSlNKRWhJdDhGb1dSTzh2MjdXUitLUFQ1?=
 =?utf-8?B?RnhPVlMwaC85YnA5VUE5emJ6eGZkSmY5SU45OXhvcUJVaVlkd0dxak1NS1lk?=
 =?utf-8?B?ZldaZHZsamNhREFYTHU3V2FsYjZMT3ZJdTFLYWc5UW1OdFE3anN0VFFzNkZW?=
 =?utf-8?B?RXo3eU5jQzhaSktrL0M5K1Z5Yk0zVStUalRLYXl6OVRZTmh4YlBFemJUOEpJ?=
 =?utf-8?Q?eQ0sX6tnj3Zrq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjdieGpjWkxOOXRFMGMzREtiblBQVGk1MHJ0Q1c4N3ExK1VMd0xRdVAzZUhM?=
 =?utf-8?B?d3FQb0NwUGtaOTdLOTA1bVppSDdla2NpcHQwSjlVU04zS1ExUU96cE5obHNZ?=
 =?utf-8?B?Wk1UR0liSWQzWUt5RWNPZlFWNmcyTkZza3FlVllBOG9INi9xZXhiSmR4OVRZ?=
 =?utf-8?B?RGh6QlpVb0Yza0hZS2l2d0pmdldROXNzN3krMzBsalo0cUpHaXU0cEhaK0lT?=
 =?utf-8?B?dVZBOUJ3YzZhUGlnWWVoRHJ6VlNaeGQwSjI4N3NKWWgzWm12K2xTSTBxQXJX?=
 =?utf-8?B?QVpBRHFzU2pkeHdjUm5MVW5OS0hnK0JtRlpEQnRqSWp1Tkh6SWY3ampXLzI0?=
 =?utf-8?B?M2t4NkYzVEMwTGQ4WnVlOFI1VUlDek9QVnZZa0pxcU9QcHlRK3MzL0RIeTRv?=
 =?utf-8?B?WjBZV3dYc3RDNzRobFAxVGVLNjQ4OHNaY29lOTErTjRPSWNEVWRJaFFjQzNr?=
 =?utf-8?B?emlRd1lWRloxWmhDYkRVcU9TNEFxYVlFRndIV25aSFozZHdrdmo3WDlweXRq?=
 =?utf-8?B?cFhqcU13MCtPL2FmanVBUXBNNVE1cVYzTFVsVm0zK0tvQU9CTWFxQTR2S3F1?=
 =?utf-8?B?czc3aWo0eHV3ZitHRHovT1RmdWowM1U4M1VFL0I0ZlRLVW95TjBRK25pemEw?=
 =?utf-8?B?ZDdLc21ycktFK2pBeklneGgwTXl2MTFKcmJnTU5tNngwdW5KR0oyU1Rmd2pH?=
 =?utf-8?B?eTl5S2NFaldDS1lmTjB0a2tkSU1ONTFWUmI5TjJTSHlPZUdGYWFkSHhlZW5D?=
 =?utf-8?B?UGtYQTJxOHArQlVhSmxKSk1zNlFqZ0F2Z0gyTDlhL0FBZVN1M1Z1VEIwUEtr?=
 =?utf-8?B?YTNNSSsyM3Q5MjBZQWYxQUkycnZWdTBueWNEVmQ1UnkweUtvby9sd1NBSGVr?=
 =?utf-8?B?RFp6SEtXbUZGOWhwL2piUHNoQ3dYbXlwcDlQckgwbU9oL3U3MkdYVy92dC9m?=
 =?utf-8?B?U0U2Q2JWS0pPamlYNkhqSzI5Z3NUWlJnT2NBVG93MkxsUDk4WTBJV3ZJS2F6?=
 =?utf-8?B?WXVJSzRQQ0NCUE9ZK0JzbVl5Qnh1dkQxUE5Ba2NpczU5ZS9hREJQcWpIL3hP?=
 =?utf-8?B?dFVYT29VZC9wYlA0ZUF5b2pMTVVOWUJ0SlpJcndQL1RRbTZtc0VYVjFpWGli?=
 =?utf-8?B?ejd1L0U1SGprSkJYVUJVd092K0FzU0VXZTdkOHphcTdySTJkV2FROTNoQUtP?=
 =?utf-8?B?QTBEWkpxYTdOYUNiVWJLd3ZvSDJCT3JVemdUMHB3ejdtZFh4TkVqRUNzNEw3?=
 =?utf-8?B?VFdSNWRzZ1VZR3kyclhDdmJRanlIaVBSMGM4WUppNmxIbW1OVDFOYTBVTnN3?=
 =?utf-8?B?Mk5KbkxtS3J1cThDUHhxaUwyekd4b0cvOEJOZWV2cklHSXZQMFhXcEJnS2N4?=
 =?utf-8?B?aG53b3FpWWdLVUZHSTViTzR2eDhwTEhlTVRGSzk4eW9DZ3RuVXA2cnJzV1dj?=
 =?utf-8?B?ZXI3SllrRThMVjMrT05heG1DVTdMYk9Wb0Z0bHVYSDFxQllWeUtzcHVEYTRz?=
 =?utf-8?B?ckxUU3ovbkU5UGhHY0pHV0ZVaTR5bnZZOUxpZ1JtTG5NdFY2WWlIUVpKeWNT?=
 =?utf-8?B?RUhsMUtNa2Q0a3NabWtiSmJHayt2cCtKZHNadThJRElNUWxvdmYxRUNORUJw?=
 =?utf-8?B?YlVsOHRqMmlFS0RYWllqRFZ2L2VIVkdKSWpyUU9uNTRDNzZDY2RJWksxSWRC?=
 =?utf-8?B?OWMzdGJaNnpXL0hyeGRpaU0zYjNrMGMyekwzdVdpaWR1cng5YnV1M3AvNzRR?=
 =?utf-8?B?NDFLM1lTZFQ4ZEhJWHQxcmJvY2F6MzVTL1ErcGNKelc0V3AwZ2JwYXVHYklE?=
 =?utf-8?B?Ylk1R0NmS25XWlRYMWRGdXpxMWVTcnhWVGZUZ2lGT3VMaEdCV1pRTHd4c2tR?=
 =?utf-8?B?RDdVY2Q4YnFleWZHQ0tGY0JnZ2FORXRqM2hMWU9WUmliRW4ydnhjZW5FWGdu?=
 =?utf-8?B?SnljcnZvdzJYMUFobU9aN0dYQitEWDg2QmFMTTBicDBVRUZucFpBR3orbE9V?=
 =?utf-8?B?NThpYkdIVlVGcDNjZjhHTXFYanUwT1RJNzc3RFFpaWV3L3JpRzE5Y0dvdzZk?=
 =?utf-8?B?dENNck9CWnRyOXNCOWw2ajVjYTUwa2ZuTU1CbTRyUVdidnlTV0QwbVhYdCtr?=
 =?utf-8?B?QUpadDhTS3JuSEozME56bEFGZWkyaTRWRWx6Mk50VnQxWko2OVAxZEZPdzNU?=
 =?utf-8?Q?JXUhd7sJ+6cTNHVQYPHX7wWF3bKiQiuOkSAEykUANWBE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01feb250-5876-424d-7505-08dd3f4dce9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 03:42:36.7949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1YQZNTghBV1HDWOylMB1CDpewPOB7jSj2i78j4/Hp//KIicerFZVVqucepduPNY4QyuAG2+1M1HrF4l8CdY2B7yY6wu0E7K6JuaCEYgYeHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8530
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2F2aXR0LCBKb25hdGhh
biA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCj4gU2VudDogMjggSmFudWFyeSAyMDI1IDAy
OjQ1DQo+IFRvOiBCcmlhbiBHZWZmb24gPGJnZWZmb25AZ29vZ2xlLmNvbT47IGludGVsLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFdpbHNvbiwgQ2hyaXMgUCA8Y2hyaXMucC53aWxz
b25AaW50ZWwuY29tPjsgU2FhcmluZW4sIEphbmkNCj4gPGphbmkuc2FhcmluZW5AaW50ZWwuY29t
PjsgTWlzdGF0LCBUb21hc3ogPHRvbWFzei5taXN0YXRAaW50ZWwuY29tPjsNCj4gU3Jpbml2YXMs
IFZpZHlhIDx2aWR5YS5zcmluaXZhc0BpbnRlbC5jb20+OyB2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbTsNCj4gamFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tOyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSm9vbmFz
IExhaHRpbmVuDQo+IDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPjsgc3RhYmxlQHZn
ZXIua2VybmVsLm9yZzsgVG9tYXN6IEZpZ2ENCj4gPHRmaWdhQGdvb2dsZS5jb20+OyBDYXZpdHQs
IEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BB
VENIIHYzXSBkcm0vaTkxNTogRml4IHBhZ2UgY2xlYW51cCBvbiBETUEgcmVtYXAgZmFpbHVyZQ0K
PiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBCcmlhbg0K
PiBHZWZmb24NCj4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDI3LCAyMDI1IDEyOjQ0IFBNDQo+IFRv
OiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBXaWxzb24sIENocmlzIFAg
PGNocmlzLnAud2lsc29uQGludGVsLmNvbT47IFNhYXJpbmVuLCBKYW5pDQo+IDxqYW5pLnNhYXJp
bmVuQGludGVsLmNvbT47IE1pc3RhdCwgVG9tYXN6IDx0b21hc3oubWlzdGF0QGludGVsLmNvbT47
DQo+IFNyaW5pdmFzLCBWaWR5YSA8dmlkeWEuc3Jpbml2YXNAaW50ZWwuY29tPjsgdmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb207DQo+IGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbTsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IEpvb25hcyBMYWh0aW5lbg0KPiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNv
bT47IEJyaWFuIEdlZmZvbiA8YmdlZmZvbkBnb29nbGUuY29tPjsNCj4gc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZzsgVG9tYXN6IEZpZ2EgPHRmaWdhQGdvb2dsZS5jb20+DQo+IFN1YmplY3Q6IFtQQVRD
SCB2M10gZHJtL2k5MTU6IEZpeCBwYWdlIGNsZWFudXAgb24gRE1BIHJlbWFwIGZhaWx1cmUNCj4g
Pg0KPiA+IFdoZW4gY29udmVydGluZyB0byBmb2xpb3MgdGhlIGNsZWFudXAgcGF0aCBvZiBzaG1l
bV9nZXRfcGFnZXMoKSB3YXMNCj4gPiBtaXNzZWQuIFdoZW4gYSBETUEgcmVtYXAgZmFpbHMgYW5k
IHRoZSBtYXggc2VnbWVudCBzaXplIGlzIGdyZWF0ZXINCj4gPiB0aGFuIFBBR0VfU0laRSBpdCB3
aWxsIGF0dGVtcHQgdG8gcmV0cnkgdGhlIHJlbWFwIHdpdGggYSBQQUdFX1NJWkVkDQo+ID4gc2Vn
bWVudCBzaXplLiBUaGUgY2xlYW51cCBjb2RlIGlzbid0IHByb3Blcmx5IHVzaW5nIHRoZSBmb2xp
byBhcGlzIGFuZA0KPiA+IGFzIGEgcmVzdWx0IGlzbid0IGhhbmRsaW5nIGNvbXBvdW5kIHBhZ2Vz
IGNvcnJlY3RseS4NCj4gPg0KPiA+IHYyIC0+IHYzOg0KPiA+IChWaWxsZSkgSnVzdCB1c2Ugc2ht
ZW1fc2dfZnJlZV90YWJsZSgpIGFzLWlzIGluIHRoZSBmYWlsdXJlIHBhdGggb2YNCj4gPiBzaG1l
bV9nZXRfcGFnZXMoKS4gc2htZW1fc2dfZnJlZV90YWJsZSgpIHdpbGwgY2xlYXIgbWFwcGluZw0K
PiA+IHVuZXZpY3RhYmxlIGJ1dCBpdCB3aWxsIGJlIHJlc2V0IHdoZW4gaXQgcmV0cmllcyBpbiBz
aG1lbV9zZ19hbGxvY190YWJsZSgpLg0KPiA+DQo+ID4gdjEgLT4gdjI6DQo+ID4gKFZpbGxlKSBG
aXhlZCBsb2NhdGlvbnMgd2hlcmUgd2Ugd2VyZSBub3QgY2xlYXJpbmcgbWFwcGluZyB1bmV2aWN0
YWJsZS4NCj4gPg0KPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+ID4gQ2M6IFZpbGxl
IFN5cmphbGEgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiA+IENjOiBWaWR5YSBT
cmluaXZhcyA8dmlkeWEuc3Jpbml2YXNAaW50ZWwuY29tPg0KPiA+IExpbms6IGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTM0ODcNCj4gPiBM
aW5rOg0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNTAxMTYxMzU2MzYuNDEw
MTY0LTEtYmdlZmZvbkBnb29nbGUuY28NCj4gPiBtLw0KPiA+IEZpeGVzOiAwYjYyYWYyOGYyNDkg
KCJpOTE1OiBjb252ZXJ0IHNobWVtX3NnX2ZyZWVfdGFibGUoKSB0byB1c2UgYQ0KPiA+IGZvbGlv
X2JhdGNoIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBHZWZmb24gPGJnZWZmb25AZ29vZ2xl
LmNvbT4NCj4gPiBTdWdnZXN0ZWQtYnk6IFRvbWFzeiBGaWdhIDx0ZmlnYUBnb29nbGUuY29tPg0K
PiANCj4gU2VlbXMgZ29vZCB0byBtZS4NCj4gUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIENhdml0dCA8
am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4gLUpvbmF0aGFuIENhdml0dA0KPiANCg0KVGhhbmsg
eW91IHNvIG11Y2ggdG8gYWxsLg0KVGVzdGVkLWJ5OiBWaWR5YSBTcmluaXZhcyA8dmlkeWEuc3Jp
bml2YXNAaW50ZWwuY29tPg0KDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dl
bS9pOTE1X2dlbV9zaG1lbS5jIHwgNiArLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9zaG1lbS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fc2htZW0uYw0KPiA+IGluZGV4IGZlNjlmMmM4NTI3ZC4uYWUzMzQz
YzgxYTY0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dl
bV9zaG1lbS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3No
bWVtLmMNCj4gPiBAQCAtMjA5LDggKzIwOSw2IEBAIHN0YXRpYyBpbnQgc2htZW1fZ2V0X3BhZ2Vz
KHN0cnVjdA0KPiBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmopDQo+ID4gIAlzdHJ1Y3QgYWRkcmVz
c19zcGFjZSAqbWFwcGluZyA9IG9iai0+YmFzZS5maWxwLT5mX21hcHBpbmc7DQo+ID4gIAl1bnNp
Z25lZCBpbnQgbWF4X3NlZ21lbnQgPSBpOTE1X3NnX3NlZ21lbnRfc2l6ZShpOTE1LT5kcm0uZGV2
KTsNCj4gPiAgCXN0cnVjdCBzZ190YWJsZSAqc3Q7DQo+ID4gLQlzdHJ1Y3Qgc2d0X2l0ZXIgc2d0
X2l0ZXI7DQo+ID4gLQlzdHJ1Y3QgcGFnZSAqcGFnZTsNCj4gPiAgCWludCByZXQ7DQo+ID4NCj4g
PiAgCS8qDQo+ID4gQEAgLTIzOSw5ICsyMzcsNyBAQCBzdGF0aWMgaW50IHNobWVtX2dldF9wYWdl
cyhzdHJ1Y3QNCj4gZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQ0KPiA+ICAJCSAqIGZvciBQQUdF
X1NJWkUgY2h1bmtzIGluc3RlYWQgbWF5IGJlIGhlbHBmdWwuDQo+ID4gIAkJICovDQo+ID4gIAkJ
aWYgKG1heF9zZWdtZW50ID4gUEFHRV9TSVpFKSB7DQo+ID4gLQkJCWZvcl9lYWNoX3NndF9wYWdl
KHBhZ2UsIHNndF9pdGVyLCBzdCkNCj4gPiAtCQkJCXB1dF9wYWdlKHBhZ2UpOw0KPiA+IC0JCQlz
Z19mcmVlX3RhYmxlKHN0KTsNCj4gPiArCQkJc2htZW1fc2dfZnJlZV90YWJsZShzdCwgbWFwcGlu
ZywgZmFsc2UsIGZhbHNlKTsNCj4gPiAgCQkJa2ZyZWUoc3QpOw0KPiA+DQo+ID4gIAkJCW1heF9z
ZWdtZW50ID0gUEFHRV9TSVpFOw0KPiA+IC0tDQo+ID4gMi40OC4xLjI2Mi5nODVjYzlmMmQxZS1n
b29nDQo+ID4NCj4gPg0K
