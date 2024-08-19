Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706679564FE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 09:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B7310E1DE;
	Mon, 19 Aug 2024 07:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYWkqDFD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DA010E1DE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 07:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724053876; x=1755589876;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kPecblUWJnNquAI3ZXfXiWggGg8rClvA+OONaXkTR3E=;
 b=bYWkqDFDUpaXs4bG3Bf0Zch2PTmNdVCYaeHgGoMEP85BtYidorTh868f
 xkSTkiRyMtgAAROY/5qQ69eDU1idi942VquwR53c9yI6G72P6yBqkSfXp
 RAJXd2TiadRmIE7QiRARAQmcAP2DT4b8kbe1vKZDjNEnmEnn5zoNA2vbQ
 PR0vZEqYJV1NWz/Z26IWzb0TrB60VZQ08C7Di7gBsczjXFTkltzcUu066
 GACGpmpdGoDhRAs0xe1f0DJiZuiVg5Xhv0DZRyMgShs7RSiavmbbi9otI
 Vhr01ur1HDTdjgSnhgrd/Xe/++ydUwrHLkcK5UbrQqhGXdWkJdCjtMyY2 Q==;
X-CSE-ConnectionGUID: iIzL+ZRDT2u28x7FoxCRhA==
X-CSE-MsgGUID: UBp5sON8QWWZ9DUiG4OpUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22132051"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="22132051"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 00:51:15 -0700
X-CSE-ConnectionGUID: pwctg6F/T32SMwjlUhN8MQ==
X-CSE-MsgGUID: w1O6zX+TSPWjEXp22gtT1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="59954115"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 00:51:14 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 00:51:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 00:51:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 00:51:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fz5lxoOsZi04yvIyLqYD2nctMF0wOasiyY6hXQQVvlhtWgKZptXUZUmhqgEm0dFuP+ATHTos2lxG9cXWkU7jVhuueLuFVuUrM7oSnXnN021yFjWId949Z23w+XIj0f7sMjrV/lc60hgdHq5Gq5kTfzq5/zPHXbkI7KhRGewPBrj/8A/jRu0fYx3Abydg2PwNFz05+4cqQkBCZ+0ArXiGsdsE33M+IXlaOlti+lxbC/LcGkcyCkqCv8iawyJVShy6F+BWfpPzLg1QZU+aXwetO93SvwZHQ0zzslQ1MKivJH2UU2nwp8xj4Os+0ekkoJxiE/XhdNB7y6U2297PmUp5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6U63LPGG4WIt98HT6e0b6b7+NVwscjnvH7rW+j7sQPU=;
 b=KYv5LaxkK9U7ijn3DZ3J8iAocMOu2/+w2dbTaAZ3pt3KOb1k/uW5Wj20JvwhWfNbTsgGmj5BXMDRFkjJ4BDmH/7Sv8kCSQlnrXoP7PenmWKVR/TFiX//aiOQApVff3zPftwzPNGFtKaav+AgU7Ioa9aKC1hvPdlXnsNPgaWh0n0/4IKfTf07JEgUVE/h6IhTKGIRIQy/3cU+LMQxbwWRB074iAfz0ykAbwMl7qKirdOlDvWD5bDtGDnluZlqeQiFDxAqOj7ZzrkeexdiBdIRmqlUyec1YYqohoZc38SayMNR1gLAfaFxY7aRwGHXcWDY65P39PZbe8Qn58W/eca1OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 07:51:10 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52%4]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 07:51:08 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: abid-sayyad <sayyad.abid16@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>
CC: "daniel@ffwll.ch" <daniel@ffwll.ch>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>, "mripard@kernel.org" <mripard@kernel.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Deak, Imre" <imre.deak@intel.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>, "marilene.agarcia@gmail.com"
 <marilene.agarcia@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "tytso@mit.edu" <tytso@mit.edu>,
 "jack@suse.com" <jack@suse.com>, "linux-ext4@vger.kernel.org"
 <linux-ext4@vger.kernel.org>, "skhan@linuxfoundation.org"
 <skhan@linuxfoundation.org>
Subject: RE: [PATCH] fix member variable description warnings while building
 docs
Thread-Topic: [PATCH] fix member variable description warnings while building
 docs
Thread-Index: AQHa8WN4Lx/m86sUqkSco3PD+5KZVLIuNe3g
Date: Mon, 19 Aug 2024 07:51:08 +0000
Message-ID: <IA1PR11MB6348A1DE51518D6B437D2C04B28C2@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20240818112543.1089986-1-sayyad.abid16@gmail.com>
In-Reply-To: <20240818112543.1089986-1-sayyad.abid16@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: sayyad.abid16@gmail.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|CY8PR11MB7033:EE_
x-ms-office365-filtering-correlation-id: 40be87ca-67f0-4e63-b919-08dcc023afef
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rD+I4uLM/1pEG2Tos02Dm6qqHB82dCf3XTheZinAMSkpWQTdM0mmFYjhcupL?=
 =?us-ascii?Q?klG3AtiRIFTBB/kinRVpuUhsIzKm7TBjmRFQJWrVXjOFQmcPHMaoB3VgDDIA?=
 =?us-ascii?Q?REZPFaCfWnRfngj+mc3JXhtrH4jsqARHYbYazBg6EjoXZTYBPIEuBNiNwZlk?=
 =?us-ascii?Q?x0WWHPCggoF4i8u/JkMjQD6tui1/DMVYdQp0NfyY2dVcihBYBsRY7eHJ7x1+?=
 =?us-ascii?Q?sN1tCHt/HfayFhdZSUPtJd5X6Ow0I0ugEiD3mfvDufRrcO3s3Ih92QsKJnfO?=
 =?us-ascii?Q?9fBArXu2P3WDOclIAXnuzAhjA2coiUMvn3ysxxmcivvnToUaIiHCMmUZDVtL?=
 =?us-ascii?Q?0u00mhAtfMtv4sGPHCdMFXFFjiDXvkP79mdvCZ6Vathjyjy6WbjJmHvA2RlN?=
 =?us-ascii?Q?BOcdGUUhw740YrZFY+D3Lu/Nhym0eh0YiaBDhXwpP040D2shN3K/U7zmpG1B?=
 =?us-ascii?Q?LGsH/gzckHp3pt2zxENgAYa5AY+xyii84GN3rHo/DfOoQYBD9TL0fY3tQNhU?=
 =?us-ascii?Q?A6OK9P10D+62m1ZZXqEe2MUE4FM3yGvn+1TRI188SEhIrRMmOpZFY5nDaaPs?=
 =?us-ascii?Q?hWvqXJ6zhrx8OziNeL7OcSAiLUJyq2jH9UdW1YGuUI5KfeyacecXo9N1o8aj?=
 =?us-ascii?Q?oTq/PJw1pMOXI7DMRPrjQY5YkTo42GVt1Es/As/FaCwyo6u8LDBEpT7NYkEx?=
 =?us-ascii?Q?ZGZBsEzbJAJPNdybxwQ+NRoUZ8usrhSeMcFBI11+v4CRDbqNEn560s9CUl/1?=
 =?us-ascii?Q?BeQUinQuagweP+nuRsqVaHXt1bAFYWtWiqdqLJmURBm3guskfZ3/ynSE7AGD?=
 =?us-ascii?Q?ReK1gzylp+VrqmuVnvtgu69AiCm5OFh05F74rOIOUeV06DesCEqL8sRy4yZY?=
 =?us-ascii?Q?qffpDJ79BmDNbglQkiFYHQCXxtPXElQ6FNZ3b3LM++cBjLrIHnABzXEP45j+?=
 =?us-ascii?Q?7uERHZkrm4fMsUPaCzGV80289l066E9y60R4lAptcUEhksQCqC50ch05NBTe?=
 =?us-ascii?Q?w4Yqfgk+mcoQtPa4hwyB3ihavbGfZCtnXy89wj2DoTdIg3rTOOzhLluNk2Ej?=
 =?us-ascii?Q?pABCLXOotJukIkaldnt7oxLlBeY4qWZLzW+vb2kDomYW3svCqchOa0OPM01l?=
 =?us-ascii?Q?JoVSAR9n7CfSZJ9oB+CpCL4SWx+mSuQIHIS2enT7nMvN1PKV2IRG3F2OPZGz?=
 =?us-ascii?Q?zYP4tbMi4qDNgf1qmmXZ/Te7Ew0gzarRaYlEY9Vz3MsNfo9g/djQIm9gZkQJ?=
 =?us-ascii?Q?5CeqWx6hqKTx8hsziLg2xo+TRi70GccRJTn6PelV/kWBEzumK10TbTpWH4ji?=
 =?us-ascii?Q?YF3GuW1qfDd+ELyDk+C7gXMZ0F/0EKdjftvO17zmwy8HflwsimjkKXwxEUpc?=
 =?us-ascii?Q?QsL7E/fPMiTvnDwlc1smG7aBzNtq5V5GaHzjBDve0/+6c9gMsg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Iv8g342kV6p5zOYz6yFP1rdrhOOhOXJZL38l0tKDYFxqgZ15tREtljC2rVTS?=
 =?us-ascii?Q?2rlqg0fwSj0MjyPoguxxUI9GhvG2exoPo15hNw1bW0ncwOeOvLtLDDWs9Iwu?=
 =?us-ascii?Q?GgbIoOqHYvHdT5uVtSphQXudrDddMK/JvlZfjzyi4cCrIVfpQc6JjEWyvST+?=
 =?us-ascii?Q?O9g1upxRVcrvVJlEHdftJsq95isQEh4ANFnaQZSnlzpfZyhP7HhpONNUWLCV?=
 =?us-ascii?Q?4YboF+al2GyNFmO8l428dA515hajEZMGlM2Nc5pzSGVp5Re698h1inD0Azan?=
 =?us-ascii?Q?ZZktWq/RYU/z/9DQtjuSkQCj4QjOzJFqWTfvCVGM09y0ymvyrV+aBpyTLBxd?=
 =?us-ascii?Q?Ujo5IGv/2qVVORR2daH5fx33Th4sduBTzfZpNudCQm9RLXgH1uu/NzSyGa0W?=
 =?us-ascii?Q?ednc4gVR7veraNH/AaqyJz/bB0M5zt8f9QFBwzDmQCeRu/IuzTutYygz7da8?=
 =?us-ascii?Q?5kUyvzZPPhGWFx1zebuHt9UQ0yctO8JUvjfRQtGNb7gCpjWz9nYy+Ws7dHvO?=
 =?us-ascii?Q?ijCzJxUlFnlRV/u9kn0VYkh9gmqDyanalCGKZc+vFD4XVAVZgJD9nX99dHMM?=
 =?us-ascii?Q?mAeQh+Cy7bMV7QMIoyB9r5Xs7IZ7sS2Td4atnlpgLrwA39UhNfe/8FT9qQfs?=
 =?us-ascii?Q?eP+WJLfstWoe4fvlE2ff/OEFYBK9T3fRBmnY1RAeVXYfJ6bFIsQ3/GCuGGQm?=
 =?us-ascii?Q?gdC1ZoJf7Cgx+OByLiBCHYPM5Tp6pdyxvtqmI+KoRLZYM/HVIMRxw5pFDXPH?=
 =?us-ascii?Q?H6wn2QjXCXmEh0hQSMcSVeclZdhAjvpXuz3pgL7L32A5YMEtbb3P1Edjz9kC?=
 =?us-ascii?Q?nR2C0cpy6HC7slIQAZc+iE12npfpPmA1Ov0J71mqIut5Au0xwPRiIs1E6CNE?=
 =?us-ascii?Q?dxTUC5YVB2Ycibs06kMNknl9V6bmz2dMlFBYQGs+dktrJaMsFQ2CFLuBzTXG?=
 =?us-ascii?Q?DR7n36fN9RkSzdOBi9KarqcrYGshWDOqMM4T6Oq1lvT3BK6hOh6EXv+BMxPg?=
 =?us-ascii?Q?6EQjr1lt1DtaYfJTmrDyrWOGN36TNbADKvCf1jUwugXXK57cyQzh11M8BUCG?=
 =?us-ascii?Q?G0gdX8ZDmxAKGnF7FV+O4dZL7Yl2bnjezncIg8Gp/2CBOihySz+7P9GXK3X4?=
 =?us-ascii?Q?SvWkt7czuATu5smiE0LY+TRT/224OOhmquxzQB08Ms069LGmAA1JRwB4o4iQ?=
 =?us-ascii?Q?3pc13P7TmlzeFPV+YOI8y6KH3672/mgYDZluE7bNSiUKQFjGxkLAoipFvaPv?=
 =?us-ascii?Q?3N8//Rc0nVhqxSHZQiQykJxMwhOTev+TDizx372jkpynPXmZBDHOU0zoFWCQ?=
 =?us-ascii?Q?7vYw3j96+Wa79tPsykl0ThO9yJ2Ed05XNMjUfp/G/uebWED/2fanyuCLNEAT?=
 =?us-ascii?Q?GrPUOruXkOE1UcsaTuTlD+/pN9fpHT5F8QRTYNbngZNizPBxzDwZdbXnFwoS?=
 =?us-ascii?Q?5qzMsxLodqpnsbvxFtm3qGpGBdzPsNIyXRr80FOIvrCIff9aps+TYrF6N+M+?=
 =?us-ascii?Q?VEDyg7wBuvMicpabk1xpFqwlTdX3q9nB4zjO7aXPMqMMMsG558qGu0u3xMCl?=
 =?us-ascii?Q?dIG9MgEVRHgUTPzh6OenRMLiCT/2B3S6M7Gj5zl6IiCVcoNPO0IqHqk/6u41?=
 =?us-ascii?Q?UqjxS0bXrPHCun5L+DpPuGQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40be87ca-67f0-4e63-b919-08dcc023afef
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 07:51:08.7689 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pSxcVlgeblsiQf+xyTGmzVdGMKQLkqMpPoTmUGR8Mz1onGfbBt7lXuU8a6041YSw51+MF1F0Ddvq9nNkGUJcEOvrILEzIAqoxuARt82qOcauMvsFJwvdVqjH2F/z/zqQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
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

Hi @abid-sayyad

> -----Original Message-----
> From: abid-sayyad <sayyad.abid16@gmail.com>
> Sent: Sunday, August 18, 2024 4:56 PM
> To: airlied@gmail.com
> Cc: daniel@ffwll.ch; dmitry.baryshkov@linaro.org; mripard@kernel.org;
> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Nikula, Jani
> <jani.nikula@intel.com>; Deak, Imre <imre.deak@intel.com>; Golani,
> Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> quic_abhinavk@quicinc.com; dianders@chromium.org;
> marilene.agarcia@gmail.com; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org; tytso@mit.edu; jack@suse.com; linux-
> ext4@vger.kernel.org; skhan@linuxfoundation.org; abid-sayyad
> <sayyad.abid16@gmail.com>
> Subject: [PATCH] fix member variable description warnings while building
> docs
>=20
> Fix the following warnings while building the docs :-
>=20
> ./include/linux/jbd2.h:1303: warning: Function parameter or struct member
> 		'j_transaction_overhead_buffers' not described in 'journal_s'
> ./include/linux/jbd2.h:1303: warning: Excess struct member
> 		'j_transaction_overhead' description in 'journal_s'
>=20
> Fix spelling error for j_transaction_overhead to
> j_transaction_overhead_buffers.
>=20
> ./include/drm/display/drm_dp_helper.h:127: warning: Function parameter or
> struct
> 		member 'target_rr_divider' not described in 'drm_dp_as_sdp'
>=20
> Add description for the 'target_rr_divider' member.
>=20
> Signed-off-by: abid-sayyad <sayyad.abid16@gmail.com>
> ---
>  include/drm/display/drm_dp_helper.h | 1 +
>  include/linux/jbd2.h                | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index ea03e1dd26ba..7f2567fa230d 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -112,6 +112,7 @@ struct drm_dp_vsc_sdp {
>   * @target_rr: Target Refresh
>   * @duration_incr_ms: Successive frame duration increase
>   * @duration_decr_ms: Successive frame duration decrease
> + * @target_rr_divider: Target refresh rate divider

This change is merged to drm-tip as part of following commit
a755947e050b8751fc5402609a7d600e9c756fa7

>   * @mode: Adaptive Sync Operation Mode
>   */
>  struct drm_dp_as_sdp {
> diff --git a/include/linux/jbd2.h b/include/linux/jbd2.h index
> 5157d92b6f23..17662eae408f 100644
> --- a/include/linux/jbd2.h
> +++ b/include/linux/jbd2.h
> @@ -1086,7 +1086,7 @@ struct journal_s
>  	int			j_revoke_records_per_block;
>=20
>  	/**
> -	 * @j_transaction_overhead:
> +	 * @j_transaction_overhead_buffers:
>  	 *
>  	 * Number of blocks each transaction needs for its own bookkeeping
>  	 */
> --
> 2.39.2

