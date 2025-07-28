Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BDDB139FE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 13:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A49A10E339;
	Mon, 28 Jul 2025 11:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3mb2jfX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1977710E339;
 Mon, 28 Jul 2025 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753702996; x=1785238996;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FWFYVLo1RjTtswlfMf+bihDa6jBt+8PGLU3UwU7cpIA=;
 b=g3mb2jfX2CEtzXrR3/LLAnC/IpoDh22xs1rcW2bD2aBlK8DBgpbJhGgy
 26gwywn+g35r9uuaG++rEeZ774BrsuDpW6/3i8Tv0jQvVn27N3pSunlCA
 +aX1whBFXL+g4jlECfTO+5S0wwL18KSz1mRi10ckl0lqbl50zXzFN9UNd
 FV8jhRebm4QJjvJLFDS4ezqoWGAyrfe4Stx9ziLCNS38YmDmLt8bGkwak
 XMlzSVTI6fXzacQA+zZCzfaY+Dwmt0vnZy6AAG2AASQWmHChHZlQIb7na
 blbLaAsJsZC99JoX4wGRhIlrw9kI5dKkTLLRBlemyCOmunz/jQyIEXZoc g==;
X-CSE-ConnectionGUID: OgsjZfIGQAmGixJ9zcDK9A==
X-CSE-MsgGUID: LWAzvyhHQD+ZJJZzMt/C7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="58569797"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="58569797"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 04:43:15 -0700
X-CSE-ConnectionGUID: vuruoSTkTN2inKCLMvvPWA==
X-CSE-MsgGUID: rIywtzpDSLqwSy+vdqfbHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162445715"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 04:43:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 04:43:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 04:43:15 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 04:43:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTrR+hzHDIxxnjwdl5Efw6+Y8FoCIyTMQjeIfxRQhTTbYjkep0+NcwKTu4wHZcOR1y4crz0Xw2+U7oSHFfBxhPJn5vNMp63zrEcA9B2TnpjS5xzHjMtjK9LK88ZSvhLDt9M+yEEpnYmn1DyC1V9fsD7/Vbyjo6yhsAcJTnMznw8Bk4CcGpLVmnifsvolOK+pw+NIX4SCWzgznHnOAZjQwdRAPD7mq7GXZJSTShxszzZ4JH69Isuwti6E9s8dYAm0sd17IxEre6A3+Qd11ga9Al1RhiKAyAMnT/0ph27ojWj9GA60Ti7hzTYazCNHtaibNT6EsVt1rBCYFnDZFD7RbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BP3+YTOOceVe9FCYpGxxU2cMdbSaDC02CM/4nVHqywk=;
 b=qzvOAEVI1D0YSGiKQtEDTrPD2zEPSfQ2/cMl7HRaXLozwLFEUPiYI94pGy3nqwT3EAb2Bf1m3R9B/nyywXwKRquVLU3npllvs2xDVYnMvbjHq7eEutV8ynqwxeOKjT3h0J4TzjZq+u4IEyfz2LrO+Tr/CtZpfzlcPLM9KvWTNJ8spesxX/hbOLOv6N0g7By17t97TAgIsXyFQX9rvVQ+gdfPKhXX0uF+fRElg7o144dMGkYuPpxfqpXbTsry2owlHIpDvUNv2p9v2d2z4Iai4SdOLTZJNBmSBqhnap0zxYRdmKVtB+b7tpOKa0oxs5FVeg/QdvsYaHsQIkZbLy/LYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by DM6PR11MB4676.namprd11.prod.outlook.com (2603:10b6:5:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Mon, 28 Jul
 2025 11:42:59 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::af0a:68bb:7bbf:5a45%3]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 11:42:58 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harry.Wentland@amd.com" <Harry.Wentland@amd.com>, "Sunpeng.Li@amd.com"
 <Sunpeng.Li@amd.com>
Subject: RE: [PATCH 00/10]  Introduce drm sharpness property
Thread-Topic: [PATCH 00/10]  Introduce drm sharpness property
Thread-Index: AQHb/KIBhR8uaAMNTEi4oGfQIbVlGrRHblTg
Date: Mon, 28 Jul 2025 11:42:58 +0000
Message-ID: <IA1PR11MB6467181EC608CF4982A3852EE35AA@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20250724134544.284371-1-nemesa.garg@intel.com>
In-Reply-To: <20250724134544.284371-1-nemesa.garg@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|DM6PR11MB4676:EE_
x-ms-office365-filtering-correlation-id: 8c6f4a8d-ae6c-4322-edce-08ddcdcbe6b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?QJSAQKSs/YWklWkE5fDI9bvfpJyQbJvT9q4QxbCkrJuXXVZ7bWnRjDrdhthP?=
 =?us-ascii?Q?3fB8NXvam8nEVgKbki5qBW7IYdzX5T1jkmApNghPoK0IAJnw7pel4De9vY21?=
 =?us-ascii?Q?5E30EdRK/5jMUt+aLGnd90e7+mxfnFYqLyJD56w5PCD03PJP0iGdNlramPXb?=
 =?us-ascii?Q?NnxF5/VP00e/o+PfNlcdLipgmEg3r0uZpw/cA4NWk5gHm0KVvuQnKVglFHmP?=
 =?us-ascii?Q?yGzHjzrGggm7YaS8q4LmEnd3BDYXvRZmOVU4BQl77UcjOH78waRNZoQOooJ3?=
 =?us-ascii?Q?ps/JueMVPhLFAxHzTkya836G/o9KCK99ptdnz9jYMMtMfe6KjYdLVqcTAn7/?=
 =?us-ascii?Q?qaU4CziGnQtmCco3lUoyqrTnS7e8VoEXPLpQQpRCoKj6fhDO/srLeouuo9bH?=
 =?us-ascii?Q?QwZ+OKz+Kvql6DGp85dJ/t1j8vegpvl6L4kqF0R8Z1k6TIrl1sd2ba5ZHWKs?=
 =?us-ascii?Q?Kg1L0FXnojAIbzEO2vi4DjO/18pe4/CtlH7V5rXXzj0qXGGgMB8fFdc4m5gd?=
 =?us-ascii?Q?d/V7qAdWg/QiL8wI7/7PtCeqYWn57bBGiscFnZMkfuzjGkfSCS54qMG6km+u?=
 =?us-ascii?Q?m9EG1i++s0jQnF5tLeC56eOXw0Zi13thwRI8A9mRly9m2fatEbPjymczMCz1?=
 =?us-ascii?Q?EL57jrTgRwdC+qKImwk0HphhYvZZAXwOSNchIefMzoPd1caec7zdMbFO3LRC?=
 =?us-ascii?Q?Qnmt48l9yEKnxuGaVH8sGAiGOWgXCm8YFKw7ZLNATRUTN18eQWodsNbKt0Yo?=
 =?us-ascii?Q?KMepdAkiS/RAYIpPQ1WJ6Xg380aoUNxkv340hRvTJN3HTDM8Xwsh0+CvdRl0?=
 =?us-ascii?Q?xwK3iMsq/gfYryQpZT5m6HWX52yBE5sfEpZLcLZYxpYpKF1UD+o/5wBPiul7?=
 =?us-ascii?Q?OPYwrbnGdk+nXqacBK5t7bVMZmSgnhG1XlMifQGi3yzPdt7KwSpxqy2yGHuG?=
 =?us-ascii?Q?320McMmKYmsKJXBb2narushPITnwfZdghbbQb8L/HWA1sENIOH+ddp2fLBMV?=
 =?us-ascii?Q?t5miMAGt09g2kaeEeXryJtUfwzm5/6JOEGVgExBCz58lZbVNMdTY+h6SBhTm?=
 =?us-ascii?Q?Gi4q5hwmWWRChiwCFCzPdyH1ZefHmUh6iAjibrDw/yI13cQGJQr/ixqXwC0S?=
 =?us-ascii?Q?DJBZ8wkn56BLqlHyVt0ceiA09NBjmWuTkeLkWgImLMnMDE3XWnL4i/6W8ldT?=
 =?us-ascii?Q?6SeGnndnCNoU8X5G9g2GkHKCIz6ynjn4QlHWz9ehmsHyWGyZEN/Rx5/Fsp7I?=
 =?us-ascii?Q?5jwGFNtPGpiif7aV8FlPT0d7/6v93cXb/ol153y2MNlIBtTXvpJgEpOkh9kA?=
 =?us-ascii?Q?f3Cn4il6LPdlhrfNkd1Cq4gpFpYGz1GPjjeyl+9gzU7ZoMuYXSsIjG0AAD5l?=
 =?us-ascii?Q?1Z8hnjZUVuIuKAcfrs57XLvOVeD64if2y9GM7qNyydBPCd4vrkVnes/3HSvm?=
 =?us-ascii?Q?IEQO/aQHU34=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6I1lhQ5sDgEOPJWwTSc5ZSUATQrOgOGwuUPDNAkCFpLGop1YGU85rgSeEQAm?=
 =?us-ascii?Q?MEd21ObJ/zq6cSjqgGl062avf4s4sVJzsJc0A3sDxF64qfk+MqbRXQXur/QC?=
 =?us-ascii?Q?7yFHlNe20LYF+KvxPluvtAlV10+yUACKpfpGOIPq6qcMjXL7RwrbbAT2Xue4?=
 =?us-ascii?Q?SDFHg2TG3x04do05nrAa335zblEyWq4OLLjvM3TUOqp7HYEZqxFc+QkCUbKQ?=
 =?us-ascii?Q?uQNBDSXzFItuqTVkC48tsq4oCBjWAb3b3wLNVdZNXdeCU9+qpO1BnGxcSDmF?=
 =?us-ascii?Q?55/M1c234VT8+ud/36ASgJkGubLCEq3U55F9M9WZxsvbu3xELD0sqaU8fsD1?=
 =?us-ascii?Q?4P+ehgJwbezjCdr3e6665Jb32HqfHkTTVopQuFfV+1C0wiYXmsTUtMgCkQD7?=
 =?us-ascii?Q?4Q6DTkJB18hBAY6uRsNLx+pMBGDDOfLNPqyr4SAS/pbvfp90J5MytFjjKU11?=
 =?us-ascii?Q?1x89PNokZLD+uSVdt8SHQprWuTjcM2Lr5z1mZGM+j6qOR0rG1+e6UqBlTnZX?=
 =?us-ascii?Q?tvQP1tKhmxeXTekw6Ss4GIWITFHUZ8hVWE2KOdPxVI/X3yo4vtXydq51ztJf?=
 =?us-ascii?Q?4DEfwe+8DB04H2avMO/eedgeC3MryTNq+dLD80DEJSoNuwh+Iq+rOIc96vSK?=
 =?us-ascii?Q?GpWGWFDeqRGHLmHfJ3OnCBfp2fojr/XFPnMStjlPfoxa+gaPD3JGHbWvusCd?=
 =?us-ascii?Q?H8uQvUBqZbDi0lq6Q1TkljSDxJlcXJUKt/QvumLVPXAekF+kRSOmpCXQfDx2?=
 =?us-ascii?Q?7YDIzy89/Yckn4jDppIrPyD29T82yKXEoQR7spDrRIFwYlFGI+ijAHM6Sdj1?=
 =?us-ascii?Q?urb2+FwezQ1Crih7k9P3fsWRmV8oYw2QNV+gStzAer9248Udg9LE6gR5FWCB?=
 =?us-ascii?Q?pVEtL1OfcoiewOfC9Zba2YGWxpKp1xWp2L219uusrL158A6uO9LpWcVS9dlw?=
 =?us-ascii?Q?kYW8n0WiNw1sLhtk1MDfLPiyppS6kJvKesopL7Hd373lBcmGZfpTpqO+aKMi?=
 =?us-ascii?Q?p8ReE3jkDaQ2nYoC4omn5SHc7LX+vSFFU+uMj6GtH2Ci7UEjdmcXpgJrsXwg?=
 =?us-ascii?Q?zBLEkCJz7fCdfWC3Jtj6HesylYBvlbXxZN2Ub/fPUaFVTJ2bMrNEAQpdA/Fw?=
 =?us-ascii?Q?2znUDsBwk8P//wHhaFct7cwV69h/zOe6sLEHSWngvhdkkXEBr2WtT+q0LYXJ?=
 =?us-ascii?Q?PdmU+t7R8jFKKFCI0IA8O6Yj6KotOCxB9q90161sg7afdDu2aMlTwVemCnSz?=
 =?us-ascii?Q?KA0/d28QQ1YWnnrYz9c+Q431xQt9miK70m5EmZwelnaTPGTGLzUSzTkYzm5Q?=
 =?us-ascii?Q?z3ilNxcQ4/KkX2wCWfdDcNs9lPefLCaUufdxiRpr5AOBBi8BufNWhCO438Hi?=
 =?us-ascii?Q?5okc1Ql99L34t4zpETja388W4YiZBg54X1dq5cgbPhufeN24p650cCzG5CWd?=
 =?us-ascii?Q?xtLzCIVaVk5GwLEvcIsJmoI7L23m2ID3YoDkyDRrv5GYcIWYqgaP/0XswcOR?=
 =?us-ascii?Q?Wzzdfbv76ljzBBA5MyvPILszXCac1/0+9yJYTUnJ0B9kvUfMcpVGy+SsPwy1?=
 =?us-ascii?Q?aF8z9E8XICbeQRo8FbhbckzXLTmfdStF7gVis9Jp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6f4a8d-ae6c-4322-edce-08ddcdcbe6b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2025 11:42:58.9024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F8eRlIfSPDQyYqWcu4rL0kYQMP+nYWYVOAQg09KoIF1oa+fAHdZN4KPvw4qUcqjopbToPzK1jTpbmUOUflp0rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4676
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

Hello Harry, Sunpeng

We have added a new drm crtc property to expose the sharpness strength whic=
h user
can use to set the value of sharpness from 0 - 255.

Can you please let us know if this implementation looks good to you?

If so, kindly provide an Ack.

Got ack from Xaver Hugl.

Thanks and Regards,
Nemesa

> -----Original Message-----
> From: Garg, Nemesa <nemesa.garg@intel.com>
> Sent: Thursday, July 24, 2025 7:16 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org
> Cc: Garg, Nemesa <nemesa.garg@intel.com>
> Subject: [PATCH 00/10] Introduce drm sharpness property
>=20
>       Many a times images are blurred or upscaled content is also not as =
crisp as
> original rendered image. Traditional sharpening techniques often apply a
> uniform level of enhancement across entire image, which sometimes result =
in
> over-sharpening of some areas and potential loss of natural details.
>=20
> Intel has come up with Display Engine based adaptive sharpening filter wi=
th
> minimal power and performance impact. From LNL onwards, the Display
> hardware can use one of the pipe scaler for adaptive sharpness filter.
> This can be used for both gaming and non-gaming use cases like photos,
> image viewing. It works on a region of pixels depending on the tap size.
>=20
> This is an attempt to introduce an adaptive sharpness solution which help=
s in
> improving the image quality. For this new CRTC property is added.
> The user can set this property with desired sharpness strength value with=
 0-
> 255. A value of 1 representing minimum sharpening strength and 255
> representing maximum sharpness strength. A strength value of 0 means no
> sharpening or sharpening feature disabled.
> It works on a region of pixels depending on the tap size. The coefficient=
s are
> used to generate an alpha value which is used to blend the sharpened imag=
e
> to original image.
>=20
> Middleware MR link: https://gitlab.gnome.org/GNOME/mutter/-
> /merge_requests/3665
> IGT patchwork link: https://patchwork.freedesktop.org/series/130218/
>=20
> Continuing discussions from:
> https://patchwork.freedesktop.org/series/129888/
>=20
> Nemesa Garg (10):
>   drm/drm-crtc: Introduce sharpness strength property
>   drm/i915/display: Introduce HAS_CASF for sharpness support
>   drm/i915/display: Add strength and winsize register
>   drm/i915/display: Add filter lut values
>   drm/i915/display: Compute the scaler coefficients
>   drm/i915/display: Add and compute scaler parameter
>   drm/i915/display: Configure the second scaler
>   drm/i915/display: Set and get the casf config
>   drm/i915/display: Enable/disable casf
>   drm/i915/display: Expose sharpness strength property
>=20
>  drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
>  drivers/gpu/drm/drm_crtc.c                    |  35 +++
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_casf.c     | 293 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_casf.h     |  24 ++
>  .../gpu/drm/i915/display/intel_casf_regs.h    |  33 ++
>  drivers/gpu/drm/i915/display/intel_crtc.c     |   3 +
>  .../drm/i915/display/intel_crtc_state_dump.c  |   7 +
>  drivers/gpu/drm/i915/display/intel_display.c  |  37 ++-
>  .../drm/i915/display/intel_display_device.h   |   1 +
>  .../drm/i915/display/intel_display_types.h    |  15 +
>  drivers/gpu/drm/i915/display/skl_scaler.c     |  90 +++++-
>  drivers/gpu/drm/i915/display/skl_scaler.h     |   1 +
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  include/drm/drm_crtc.h                        |  17 +
>  15 files changed, 549 insertions(+), 13 deletions(-)  create mode 100644
> drivers/gpu/drm/i915/display/intel_casf.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h
>=20
> --
> 2.25.1

