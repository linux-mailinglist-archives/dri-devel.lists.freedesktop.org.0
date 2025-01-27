Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67E0A1D152
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 08:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C4610E148;
	Mon, 27 Jan 2025 07:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sp8m/WwL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8850B10E148;
 Mon, 27 Jan 2025 07:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737962736; x=1769498736;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GpLAWkOP2jeC+62s0E7R5ViyvqAJ0OLbutmk2hR9Vtc=;
 b=Sp8m/WwLQgQuTeD8MdtNUj4VKbTFkKcft5wQLdfgbYzOZJVI+QLnbwcw
 S7PKpU9N3dIZkkhTXposRO446sY6EybJ1MtbcQ6sSsnC8KeFXPdLl2xa5
 OGGmFHZAH0wcLJU4VnbOQhP/YsSQUIDltWkOx/1pvoN98UYoOxXVsMa3K
 iHsukGRrEBV+N7cMtHGo3oIhcNp6lTaAeOMgoOQFAApDIr2GX9IKBGqZy
 dOHw2I4KEvPlSmJtXA62suXw7TonwM9uaFheZxzo4X4tg/KtRJ5Q7xzFj
 ksSs4w/rbKyNIh44kcF6CGUssSUfe2l/oXvERsN3UggjKNMh+BiVUrEtl g==;
X-CSE-ConnectionGUID: JF5cY9TIRIeat2W+WgrxzQ==
X-CSE-MsgGUID: anBFrgAITYyd/j0zGxoIMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38304312"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="38304312"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2025 23:25:36 -0800
X-CSE-ConnectionGUID: 1/lqGb5BS3mKFE5xRYJmXw==
X-CSE-MsgGUID: OY5R8TlyQpKriLS88Ys31A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; d="scan'208";a="113352489"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2025 23:25:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 26 Jan 2025 23:25:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 26 Jan 2025 23:25:35 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 26 Jan 2025 23:25:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FY2iqxW96vRr6rssVKRX3g0mYYe7nWJQap+wNS5yxfjQL/5tJG/IvVdltRhvYYNLV4GbL0Vp64NUr3s++wsMAaf2+TIIlyW9o0AjB4TuTTsEKAdRqJEoUHJTEz8BR2I3MtKM+Nl0L3YSqjM5uzdy8Y+gOcJu5yUYbHhx1/0QlPbbTw3HAotjyaRbkHLltiVS5sIC+XVESUGKFbjvXLv980WfoYAXFQaEiGoOZx81YJWvjTsOriy3/zM6ZZ1EcgnPp/U0vPjGS3xYYAkv2zOOMTRngGz3GRFmPaQc3fTsyywCljoE/ZsjLJevzLIRk9pfT6zP5V37QDA6ff2hXZ+elw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eH8W37vGIg8P30Jutdb4IaR8S/SRXfcs6yQbcRWWOIk=;
 b=KdWXpGUmx/CABd1dIhjV3Yvr89nh+OJLEqtlHn/3vrIuuyWFhv4rInlcwXR6IjRRcAkHM0Uv/Q9RxCR+ihCbIgF0xLmBQ3InrIZbOcNH8/BX/IcE4NxLPaY4M33y/tE5iS6fNVwsQpvmPUnca76NiB9QfMhvo0vGoMfW2SWyC+M+8XccVIJIWcT5Guwux/RSA+t9lNGVmfSiINQJCEwFzw54Ubm1Thsj5KdeyPxo1iwlg65Wd7GlOjEp77PZP9zLGzwxHrV4Rv6gh6KfzepHrM+tebrWQoglL26/Althwun0AOsZ4pFpjjbPUVFnvPKixuB7CvoYChWH33TuyAwC7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CY5PR11MB6258.namprd11.prod.outlook.com (2603:10b6:930:25::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 07:25:32 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%3]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 07:25:31 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Topic: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Index: AQHbYZGzWpcbHJL1pUi0hPF0y6Z5nbMgNIsAgAJoH4CAAXY7AIABzzQAgAFG+ACAAyPcwA==
Date: Mon, 27 Jan 2025 07:25:31 +0000
Message-ID: <SJ1PR11MB6129F369898E2962C12D6024B9EC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-2-f4399635eec9@intel.com> <Z461PqtBPu2z9GPh@intel.com>
 <IA0PR11MB7307EF2ABEFEF5FE2F0D58B9BAE12@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CH3PR11MB7300A783B09132F6612DDA1EBAE02@CH3PR11MB7300.namprd11.prod.outlook.com>
 <Z5N4ko2GqOhCvdMJ@intel.com>
 <IA0PR11MB73072C33CA9E5584C0654467BAE22@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB73072C33CA9E5584C0654467BAE22@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|CY5PR11MB6258:EE_
x-ms-office365-filtering-correlation-id: 4be93dc8-2c07-4c36-6a0d-08dd3ea3c86a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?1+OIy4NHRFiGD+OzdLYuIDHb/+bJj5sCv05Akci4qEju83zhKhnLO366MI?=
 =?iso-8859-1?Q?NEd2uTmlOYvCbHAILUWjyt4toRNosJOsHJTEb8OKhwgp84DuVRyN+lNJBz?=
 =?iso-8859-1?Q?mbNAzQQ5pyCD07OHUVApm82tCv1rx0VHIvvDZl13frm1ZKcYkr/yZ4VX2c?=
 =?iso-8859-1?Q?WffIQSNovOpucv8TEe/H2PjtOOSjZo8sq+UA76IuQSr3BVrNhRyhtDL7iu?=
 =?iso-8859-1?Q?gzNt2xDaRI8JEKzfAgbunEjbyq+xeQla41lZ+PzkkCrtSyFT1mw1wvWP2E?=
 =?iso-8859-1?Q?kLRL8NJMG+Om5Q9GTt00842M3MclMwBqFf/RTTyH3f1mxpbSPtfulzWTb0?=
 =?iso-8859-1?Q?CjhduS45Op9Y+FAjDgP5u/1GpIEOpm5yMcWc+5M66fSVCDSqQ8RgDevi/k?=
 =?iso-8859-1?Q?hmSyyvU+QLjTw6nX6ih35g0ddtsO/Gv6AlLNeK75OMnpmLEpiKaq/UoJmg?=
 =?iso-8859-1?Q?s4UU8rr6uoqNerBT6LZnjEYK+8njhkS9fQXXyGvHJae+W7eb18PBcw+Fpl?=
 =?iso-8859-1?Q?UK5UKOsAbDMbQn8pF0R/YGrPfRIts9CWKM0KClJCGc2AkdY9XZDyF6jPVn?=
 =?iso-8859-1?Q?ADU+5DnveWeflvw7dfRaMXQqKDcNiLPaYeqnUVwJlNjQIr/8uHSLl5JHCy?=
 =?iso-8859-1?Q?9+pE09Tyk5S+wAv6cCidQvzuPPU2/VdV6A0Xb1mxxIfE9VlKwiAjkj36N2?=
 =?iso-8859-1?Q?PUj33gFeeu1byz+HANW7JS/kt8Gjkld0zCFkwS/F+uzRQNcBst1a4tdD7h?=
 =?iso-8859-1?Q?DMu8xYoa5gZrNgJEdYY/5KghS0EuC/DTn1UWhpntwyZJw6W/9Q+Yof+oAV?=
 =?iso-8859-1?Q?k6VPNOjJxdxnapd5lGstjkvxPaEMozyGuPNtSEIf6Po2ATJEyg1dnQCY7B?=
 =?iso-8859-1?Q?KTrgscvGMiNoFZn2hwCGsR3sXV2XnoLjt9Fce7olbLFpxUDumNp+NtI7hn?=
 =?iso-8859-1?Q?m1oGa6AgWXXqTqLfRwy9cLSlf2f+ECw5FRBkpgtwqspRVo3SYtvleGUbiR?=
 =?iso-8859-1?Q?55kw5VKTOw86aHCUF930kI73GMTrgP9xUJAuETd9YgHBTMxrWmtZcoSFat?=
 =?iso-8859-1?Q?nnDxYXecQk7bPY3huZDx9btZ4/z0u/OJttFPSXZm1Bo9ORxfnGonM/oGcw?=
 =?iso-8859-1?Q?ThRuU/ewzxHBF89jSYPZP4mm0djjktiLSqV7G1mb1eM8WIlnc8fjSjPYOd?=
 =?iso-8859-1?Q?zj7aDBQEcLnY6XU1wCp7ldy2T1uKN3Ge5q2JECgv6ABYXx5g5sA84Qvjgb?=
 =?iso-8859-1?Q?cbs8Hszzy1BTok64eiWh+zdlPP+Oou0ZwpU7e6w0BIDEYyUr7AhJcvG2Np?=
 =?iso-8859-1?Q?2nuqytdcmBmmogkdonQM4MMpzwGFKe7gczCh8u3SRn8kJOPJ9x8PjbLre1?=
 =?iso-8859-1?Q?/U1AvqSP3mNP3tw1vl8u4wkKkMv7MfV5OCMuH7/kobUdyy3R4cYSI45ASP?=
 =?iso-8859-1?Q?Fbex60ySCW+FXZlJ+I9CyFNg4t4AwDd2ylIckQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UJleiwdx80CTjc9M9ogNX/MDz/dAEhHEPnPkTUsd6XpnpPhAlH74abQUq4?=
 =?iso-8859-1?Q?2wo0keVVoFq5j4Z9WKnPFhSyuUcjkDabBLNcxRyhMOlLpeLyZT/8fX4HEG?=
 =?iso-8859-1?Q?djG9Yn92VxZhBZ7DzQgcG6ax8mzUkn0a9YJh7QNJvRepM9M5SfiOuvHgVi?=
 =?iso-8859-1?Q?wUELVMwOTaUbteP+bATZD3T1p8xhweeOQod3KqN+T8O7W8eguGq0tNRUIB?=
 =?iso-8859-1?Q?bdmjlHnHLwEeVU92T8ejXpmHOvwb3sMukPwI5D8weJ2+KS3WgaZrRd3/rk?=
 =?iso-8859-1?Q?TMoXf1iHftjWugDkdF/hlHfzE3PLC2SUW0B/ZCEoof5BjEsbnx0eeWSg3j?=
 =?iso-8859-1?Q?MPhoxnZ2AOn8A10UDjU6LvlWBnA9pofsl6GHyYZqnTTdrvObmX6ikIFEi1?=
 =?iso-8859-1?Q?OBZ9bK7mpSFg1W5n1QizerD4+gzXq3dBJF0xVSJTcj0MI+R6WuyZI2OAQM?=
 =?iso-8859-1?Q?/Lfd7CFq/dUO7A2/W/IOk5FVLoKWlJ5fCtmThF0hT4OE/ybRL4JGnkiwuN?=
 =?iso-8859-1?Q?SBMDK3lyapiitwd/HUGbSYZPnMp+p34yVxVuNdybyJts99N9sTG91TxTPG?=
 =?iso-8859-1?Q?EeNUyXC+wfaS0Fljs2WUKs6ov9P58bLybhylXRkeVAlSGLqEAGSWmj4v+S?=
 =?iso-8859-1?Q?OffOEeW5vKhlhIJYbNTyqo7iAz5nazXQw+LIMuPTTVdtcx4fD2EoLYDd2k?=
 =?iso-8859-1?Q?tk20mpQ/IsjF+gTYqCtnNIIVTOAkNGz3eO3xIIWXR0+rUpMYDdlJmtX78s?=
 =?iso-8859-1?Q?LgtlFXcfC8s4kYg7gcO4S1ftBlq1kIZjcQE9EzcYNtIfrG6pwomNy08tKY?=
 =?iso-8859-1?Q?L1WbrM4TEeGyw7iMmrIu9xLVoW9HFSoBChvGlSRxAjDoSXfGOlIdv7r0Io?=
 =?iso-8859-1?Q?M8HKxTlU4v5m+NKg7ybDb9/b0xXDNCQANEkMHu8AxLzQUgZAVY2AR/OikK?=
 =?iso-8859-1?Q?KhY+dpalTjBPnPLUevvouM5GcKzPlHjoPwCg4U7aanHzJ0QIwGEqp+QrTa?=
 =?iso-8859-1?Q?JVK+Fsu9ywXLE6NNLlt0xfnIQiysQ17mYb7dAIm7xKSdfltXjgEMYOeOcx?=
 =?iso-8859-1?Q?7778HLDLypu4mDNtofJJKdSMJ1XfKd3TejWLASMOOCw1qJH6LpJ0O3iJpH?=
 =?iso-8859-1?Q?bzFwsP+oy5+5evqy6AIj8oG1NLdbebdDw3w/yAVx+qwl8NupHXyu7v5yQ9?=
 =?iso-8859-1?Q?1CfCV/8iPaB07vV8n/QTiM3kK/gVrr4fLw5Uk1p+TRaFSQtp+8YXHeQz5h?=
 =?iso-8859-1?Q?MzdF/Tw9BoWzcMIFFdfCC1SirGygI1cX2nFB7iF9mk2pIG/8j9aFN4ks/H?=
 =?iso-8859-1?Q?mY0oG3DfqMfXMwxYfW0c+h84F9UNW3wB7KkpljKgcnqp7qUmjoVC28TcBP?=
 =?iso-8859-1?Q?8/2zSKG4ayxSP0HE/DpkW0giivi0KhpGJgcooefxUuhndS5hAV8xHA7mw+?=
 =?iso-8859-1?Q?Cmi8/jkAJx9i1MCZKETBxi8CndN3kUCpaxza50KtNUpCt+e11hXDtbOMHV?=
 =?iso-8859-1?Q?C/dM23rY7Fq5k6M6ozkA/xmZLJCYZOawRjYLMxveItQ/vtibpeedA5UMYj?=
 =?iso-8859-1?Q?H8xCggAjWhtWs7KPKSURN44ZMsPPDjXhQKKnLzo2HzMkK5Q+jepRZjESf1?=
 =?iso-8859-1?Q?E+tDcCh2sVXseNRDNx0l+lJP/LqORj96sxmV31hCjf99vT52O4UIGn4w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be93dc8-2c07-4c36-6a0d-08dd3ea3c86a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 07:25:31.8953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iNuDQd/ZL1WWPfXNKmyx3R3YbGRRg25ZgbVUwxDkW3Jc0nLqO3lYeEz3vtdntkHZNFxvYL3a9zJvbxJnmUmtuqkVPwk/Riyf00nYPpjZ4wM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6258
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

Hello Ville,

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Murt=
hy,
> Arun R
> Sent: Saturday, January 25, 2025 12:25 PM
> To: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org
> Subject: RE: [PATCH v3 2/5] drm/plane: Expose function to create
> format/modifier blob
>=20
> > On Thu, Jan 23, 2025 at 07:47:14AM +0000, Murthy, Arun R wrote:
> > > > > On Wed, Jan 08, 2025 at 11:09:00AM +0530, Arun R Murthy wrote:
> > > > > > Expose drm plane function to create formats/modifiers blob.
> > > > > > This function can be used to expose list of supported
> > > > > > formats/modifiers for sync/async flips.
> > > > > >
> > > > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/drm_plane.c | 44
> > > > > > +++++++++++++++++++++++++++++-------
> > > > > --------
> > > > > >  include/drm/drm_plane.h     |  4 ++++
> > > > > >  2 files changed, 33 insertions(+), 15 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/drm_plane.c
> > > > > > b/drivers/gpu/drm/drm_plane.c index
> > > > > >
> > > > >
> > > >
> >
> 416818e54ccffcf3d3aada2723e96ce8ccf1dd97..4f35eec2b7770fcc90c3e07a90
> > > > 6
> > > > > 8
> > > > > > b31c0563a4c0 100644
> > > > > > --- a/drivers/gpu/drm/drm_plane.c
> > > > > > +++ b/drivers/gpu/drm/drm_plane.c
> > > > > > @@ -191,7 +191,10 @@ modifiers_ptr(struct
> > > > > > drm_format_modifier_blob
> > > > > *blob)
> > > > > >  	return (struct drm_format_modifier *)(((char *)blob) +
> > > > > > blob->modifiers_offset);  }
> > > > > >
> > > > > > -static int create_in_format_blob(struct drm_device *dev,
> > > > > > struct drm_plane *plane)
> > > > > > +int drm_plane_create_format_blob(struct drm_device *dev,
> > > > > > +				 struct drm_plane *plane, u64
> > *modifiers,
> > > > > > +				 unsigned int modifier_count, u32
> > *formats,
> > > > > > +				 unsigned int format_count, bool
> > is_async)
> > > > > >  {
> > > > > >  	const struct drm_mode_config *config =3D &dev->mode_config;
> > > > > >  	struct drm_property_blob *blob; @@ -200,14 +203,14 @@
> static
> > > > > > int create_in_format_blob(struct drm_device
> > > > > *dev, struct drm_plane *plane
> > > > > >  	struct drm_format_modifier_blob *blob_data;
> > > > > >  	unsigned int i, j;
> > > > > >
> > > > > > -	formats_size =3D sizeof(__u32) * plane->format_count;
> > > > > > +	formats_size =3D sizeof(__u32) * format_count;
> > > > > >  	if (WARN_ON(!formats_size)) {
> > > > > >  		/* 0 formats are never expected */
> > > > > >  		return 0;
> > > > > >  	}
> > > > > >
> > > > > >  	modifiers_size =3D
> > > > > > -		sizeof(struct drm_format_modifier) * plane-
> >modifier_count;
> > > > > > +		sizeof(struct drm_format_modifier) * modifier_count;
> > > > > >
> > > > > >  	blob_size =3D sizeof(struct drm_format_modifier_blob);
> > > > > >  	/* Modifiers offset is a pointer to a struct with a 64 bit
> > > > > > field so it @@ -223,37 +226,45 @@ static int
> > > > > > create_in_format_blob(struct drm_device *dev, struct drm_plane
> > > > > > *plane
> > > > > >
> > > > > >  	blob_data =3D blob->data;
> > > > > >  	blob_data->version =3D FORMAT_BLOB_CURRENT;
> > > > > > -	blob_data->count_formats =3D plane->format_count;
> > > > > > +	blob_data->count_formats =3D format_count;
> > > > > >  	blob_data->formats_offset =3D sizeof(struct
> drm_format_modifier_blob);
> > > > > > -	blob_data->count_modifiers =3D plane->modifier_count;
> > > > > > +	blob_data->count_modifiers =3D modifier_count;
> > > > > >
> > > > > >  	blob_data->modifiers_offset =3D
> > > > > >  		ALIGN(blob_data->formats_offset + formats_size, 8);
> > > > > >
> > > > > > -	memcpy(formats_ptr(blob_data), plane->format_types,
> formats_size);
> > > > > > +	memcpy(formats_ptr(blob_data), formats, formats_size);
> > > > > >
> > > > > >  	mod =3D modifiers_ptr(blob_data);
> > > > > > -	for (i =3D 0; i < plane->modifier_count; i++) {
> > > > > > -		for (j =3D 0; j < plane->format_count; j++) {
> > > > > > -			if (!plane->funcs->format_mod_supported ||
> > > > > > +	for (i =3D 0; i < modifier_count; i++) {
> > > > > > +		for (j =3D 0; j < format_count; j++) {
> > > > > > +			if (is_async ||
> > > > > > +			    !plane->funcs->format_mod_supported ||
> > > > > >  			    plane->funcs-
> >format_mod_supported(plane,
> > > > > > -							       plane-
> > > > > >format_types[j],
> > > > > > -							       plane-
> > > > > >modifiers[i])) {
> > > > > > +							       formats[j],
> > > > > > +
> > modifiers[i])) {
> > > > > >  				mod->formats |=3D 1ULL << j;
> > > > > >  			}
> > > > > >  		}
> > > > > >
> > > > > > -		mod->modifier =3D plane->modifiers[i];
> > > > > > +		mod->modifier =3D modifiers[i];
> > > > > >  		mod->offset =3D 0;
> > > > > >  		mod->pad =3D 0;
> > > > > >  		mod++;
> > > > > >  	}
> > > > > >
> > > > > > -	drm_object_attach_property(&plane->base, config-
> > > > > >modifiers_property,
> > > > > > -				   blob->base.id);
> > > > > > +	if (is_async)
> > > > > > +		drm_object_attach_property(&plane->base,
> > > > > > +					   config-
> > >async_modifiers_property,
> > > > > > +					   blob->base.id);
> > > > > > +	else
> > > > > > +		drm_object_attach_property(&plane->base,
> > > > > > +					   config->modifiers_property,
> > > > > > +					   blob->base.id);
> > > > >
> > > > > IMO the function should only create the blob. Leave it to the
> > > > > caller to attach
> > > > it.
> > > > >
> > > > Prior to this change for sync formats/modifiers the property
> > > > attach was also done in the same function. So retained it as it.
> > > >
> > > > > The 'is_async' parameter could also be replaced with with a
> > > > > function pointer to the appropriate format_mod_supported()
> > > > > function. That makes the implementation entirely generic.
> > > > >
> > > > If the list of formats/modifiers for sync and async is passed to
> > > > this function, then based on the list the corresponding function
> > > > pointer can
> > be called.
> > > > This was done in the earlier patchset.
> > > >
> > > > > >
> > > > > >  	return 0;
> > > > > >  }
> > > > > > +EXPORT_SYMBOL(drm_plane_create_format_blob);
> > > > > >
> > > > > >  /**
> > > > > >   * DOC: hotspot properties
> > > > > > @@ -476,7 +487,10 @@ static int
> > > > > > __drm_universal_plane_init(struct
> > > > > drm_device *dev,
> > > > > >  	}
> > > > > >
> > > > > >  	if (format_modifier_count)
> > > > > > -		create_in_format_blob(dev, plane);
> > > > > > +		drm_plane_create_format_blob(dev, plane, plane-
> > >modifiers,
> > > > > > +					     format_modifier_count,
> > > > > > +					     plane->format_types,
> > > > > format_count,
> > > > > > +					     false);
> > > > > >
> > > > > >  	return 0;
> > > > > >  }
> > > > > > diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> > > > > > index
> > > > > >
> > > > >
> > > >
> >
> e8749e6fc3bc0acfc73bbd8401f85c3126e86759..eb84830fbb723e39436bfbadf
> > > > > 369
> > > > > > 894a5657cd45 100644
> > > > > > --- a/include/drm/drm_plane.h
> > > > > > +++ b/include/drm/drm_plane.h
> > > > > > @@ -1008,5 +1008,9 @@ int
> > > > > > drm_plane_create_scaling_filter_property(struct drm_plane
> > > > > > *plane, int
> > > > > drm_plane_add_size_hints_property(struct drm_plane *plane,
> > > > > >  				      const struct drm_plane_size_hint
> *hints,
> > > > > >  				      int num_hints);
> > > > > > +int drm_plane_create_format_blob(struct drm_device *dev,
> > > > > > +				 struct drm_plane *plane, u64
> > *modifiers,
> > > > > > +				 unsigned int modifier_count, u32
> > *formats,
> > > > > > +				 unsigned int format_count, bool
> > is_async);
> > > > >
> > > > > I don't think this needs to be exposed to anyone.
> > > > > __drm_universal_plane_init() should just populate both the
> > > > > normal blob, and and the async blob (iff
> > > > > .format_mod_supported_async() is provided).
> > > > >
> > > > Ok!
> > > >
> > > For __drm_universal_plane_init() to have both the sync/async
> > format/modifiers list we will have to add new elements to struct
> > drm_plane to hold the async formats/modifiers.
> >
> > No, you can just use the already existing format/modifier lists.
> > .format_mod_supported_async() will filter out what's not wanted.
> >
> Agree, to populate the struct drm_format_modifier
> .format_mod_supported_async along with the existing formats/modifier list
> should be sufficient.
> In case of async for the struct drm_format_modifier_blob the elements
> format_offset includes the list of formats supported by async only. For t=
his we
> will need to have the static list. So can passing this list be done by ad=
ding new
> elements in drm_plane specifically for async.

Just to add to Arun's point. We had this discussion on thread [1].

If we populate struct drm_format_modifier_blob for async using just the exi=
sting format/modifier lists in struct drm_plane,
We will be mis-representing the following members of the structure to the u=
ser space

struct drm_format_modifier_blob {
        /* Number of fourcc formats supported */
        __u32 count_formats;

       /* Number of drm_format_modifiers */
        __u32 count_modifiers;
};

However, as you correctly point out, it should still work because of the fo=
rmat-modifier bit mask.
But it leaves the overall blob unnecessarily bloated (for example, with unn=
ecessary entries in the format list).

We could however change the function in such a way that the loop

for (i =3D 0; i < modifier_count; i++) {
                for (j =3D 0; j < format_count; j++)

runs before filling up these members.

I am not sure how much juggling that would take but it could be a solution.

Anything you would suggest?

[1] https://lore.kernel.org/intel-gfx/SJ1PR11MB6129F7B51AD33A31D6A07B95B91F=
2@SJ1PR11MB6129.namprd11.prod.outlook.com/

Regards

Chaitanya

>=20
> Thanks and Regards,
> Arun R Murthy
> -------------------
> > > Then upon adding new elements in struct drm_plane we may not need to
> > pass a function pointer instead of is_async as commented above as well
> > as this new elements added in the struct drm_plane helps out over here.
> > >
> > > New elements to be added to the struct drm_plane Struct drm_plane {
> > > 	U32 * formats_async;
> > > 	U32 format_async_count;
> > > 	U64 *async_modifiers,
> > > 	U32 async_modifier_count
> > > }
> > >
> > > Then the functionwith below changes it will be generic and no
> > > exporting of the func would be required
> > >  create_format_blob()
> > > {
> > > 	If(plane->format_count)
> > > 		/* Create blob for sync and call the format_mod_supported()
> > */
> > >
> > > 	If(plane->format_async_count)
> > > 		/* Create blob for async and call the
> > format_mod_async_supported()
> > > */ }
> > >
> > > Is my understanding correct?
> > >
> > > Thanks and Regards,
> > > Arun R Murthy
> > > --------------------
> >
> > --
> > Ville Syrj=E4l=E4
> > Intel
