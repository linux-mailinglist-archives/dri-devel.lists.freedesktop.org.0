Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21D09D678D
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 05:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AE810E23A;
	Sat, 23 Nov 2024 04:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NyzsB2RC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCE810E009;
 Sat, 23 Nov 2024 04:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732337743; x=1763873743;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Tth+0nriGu4XtxEcKDNX82wxESNlV2QbbD4Y/bU8dnA=;
 b=NyzsB2RCG/NrVKU3NuM8qGrb5rzOfuJgam4wVuLSIJX8D13gQtLZj283
 yyLih32+B+7jz5+XtVlmWNVFWan9ZUqVmFhj0ikcaVffKDK5L4M9ud6yX
 szGZ/m0qXXPZzRpkBX9Kn7BT85SS74FXrczI0mLqBZ7vjLJ/PNenFQ7of
 ZDlG2adA41sRyFfmXqUdbfyNcc3wNyBSipj8J8CDOd9L5nrUjXCMnaJEe
 GBIAE0L/um3H10LNvn3iIrB5b5tdgBod9dPSICwvhClpRXhjVmuHRQPnr
 wn0P8RZDgQ7jiCBiEr1Wz1wBUFqPdAhqBGCjAqlAJ3O+xvnDDkud5+sg/ Q==;
X-CSE-ConnectionGUID: Kdaer9JHQ9e6TGYR+Lm16Q==
X-CSE-MsgGUID: N2MyOHMiS+uG+H0OyC9tgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="55008783"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="55008783"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 20:55:43 -0800
X-CSE-ConnectionGUID: w1BlGKjFRyC0WFgxNlFpXw==
X-CSE-MsgGUID: OzC1b3ktShysOVx475aJCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; d="scan'208";a="90755090"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 20:55:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 20:55:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 20:55:42 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 20:55:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPPAh1kZjJ6Na/VsIPnM8jIHutaqYNuYKXTIRdRuJyOATqc7ucaZ0Ul3NcfyVeigBcTrjG84yuD88t0c/JP+Y4PEbb7Ky6A9oum1C7KMAHWSlyDSUVsSIWX4Q/iCxYYYP6FfMtjq/AANH4wGLwpA1S8Ysw3V+mQfemqDsPfSU2GGzqYWNFa0hXScaeabyFE1n7P+CblDL69NicV52oiqO4qwk8eBlMLsphu7+vBeMFZ2T2tj3zYNoZymV7IeloRYCS/83klFWNvjX2EEYizFgNNkRXUP3jaMN5Jd3NoPeUeOGyP7B8uEjDyqLny6sgqZLWDpzoebIeKtDRubxC8vgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmICCLfQCMwjGYxf8r/M/Wa8pd9+FVyL8W3d+2/stIM=;
 b=dCsGm2xw5issneV4cnT39oXl0p3BEDzB692e8FR6vlUfY4yeiws1GuY8PPabTUz/J1d0pPf9ZTHIcoxXFLxxZ2spFhVxSvB0gXnqfxqbZduTasDeoBkGDKUSLP1GuBrwmmy/XzdHBGIfOOzv+8r/9OMm2RwkP/0d74ICTiqp+TgpY4cXFgA9rk9NH0hTV2w6il54uUHuzLV37r7PDsY7w50PQB59itXUqPdxLuoQT3Mf4jCBBiTnFFXS91jwHfjwUJPOHSxpRtdz6mAZfmqQ3V/lnbMmKXBDjoOviBXwM2ZdQ6ja2cEFDUyvqGKvwyIm6C5gPK6IxdORkDpe8SY3KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by DS0PR11MB8738.namprd11.prod.outlook.com (2603:10b6:8:192::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Sat, 23 Nov
 2024 04:55:40 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8158.021; Sat, 23 Nov 2024
 04:55:39 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv6 7/8] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Topic: [PATCHv6 7/8] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Index: AQHbPBIhX471FQ1A6EuIfBvfg3i2B7LBw8/AgAAKeYCAASQa8IAAA78AgAFZFCA=
Date: Sat, 23 Nov 2024 04:55:39 +0000
Message-ID: <SN7PR11MB67507E7A840DC087C73BD3A8E32C2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
 <20241121122603.736267-8-arun.r.murthy@intel.com>
 <SN7PR11MB6750748F22B5F4C6B1949A88E3222@SN7PR11MB6750.namprd11.prod.outlook.com>
 <IA0PR11MB7307C889E2B558CFE2632588BA222@IA0PR11MB7307.namprd11.prod.outlook.com>
 <SN7PR11MB67507FDB16D98414E2175E75E3232@SN7PR11MB6750.namprd11.prod.outlook.com>
 <IA0PR11MB73074A02D43358C944B804BABA232@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB73074A02D43358C944B804BABA232@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|DS0PR11MB8738:EE_
x-ms-office365-filtering-correlation-id: fb151a92-ac34-4249-8019-08dd0b7b1368
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?S8MrWAUFQwIrwYpov1Zt3H5Lc1RxG7FWt/ehg5iEADyY1U9EC7CIgP/bVT7w?=
 =?us-ascii?Q?tcYVDcSteWGLXOCMRUK+61H+ZqXk1rsR/qmFFhThHykEUvw/jlq+U4xn/VKU?=
 =?us-ascii?Q?0B1yZn6LlQpIAZsgCUyXIcunbrFpxpf1wUOpU5f1pc+txnlz8m+5Pg2cS56T?=
 =?us-ascii?Q?MckxM90/6w5Uz9W4gOVaO6M3wONO28KsjKJLrhR5POqAA2h+W0rhTmz9hQP9?=
 =?us-ascii?Q?KiR/2rRhOx8Sc9UtU4chXlgn+UqrnVw5W3A23yS+POwvSocicvmoI/MCXh5t?=
 =?us-ascii?Q?/Y/4A0NMVLxGuiitphXqiN7gcQxQTZhY2yWTFzDIJ0hIcDuk51NoJecOUTfD?=
 =?us-ascii?Q?/XNus13qGaUApGHAW8njSQz4NH+RQPRfHXL32tG0nmA/euj4JUvJuVsSvTaa?=
 =?us-ascii?Q?igszhtxakWQcOx1RSM1DYSK4aBHXhSrECt2TsI4x/p4dmNvIJAO0zulmEg7F?=
 =?us-ascii?Q?UlFQZxBUa8bsf+YFvcH7a6Bf8YZwdcBuEfkjdckg9cuKlugTRXA5ltAGGqeb?=
 =?us-ascii?Q?1y7B8MGxw5NVGkgHRQ1ZNDbb1QTaWlVBi3YpnhoAUTCA5a4YBsqTF8f2uSuH?=
 =?us-ascii?Q?f8WEb1lb63AtWvXbcClc4qHJujBPMFAHNgvxB/w8j/sqo1EBdU25kkhH009q?=
 =?us-ascii?Q?wrwwUS8TOxCKJyWWdydopW2Omjdp67CVjGjY9LQGIHcySsKxwbRhZ7xdrSQG?=
 =?us-ascii?Q?6cZFnJR6Tgq1uG9MUo4plzUmsQ0QzcHzFMIh82MMrd6hrUfbNQSDnSMi6O44?=
 =?us-ascii?Q?5wbO7qWj4xan23PPDxD2vQW2F3d1JX/ifoG4M1wwQWxwW7m1Bn4Um14cTbUQ?=
 =?us-ascii?Q?lSjPs2n/dyxdA8xol47r25ZYqgWdyxeqDKJIhvJH7dQzxYXF6quQrYiTJwr4?=
 =?us-ascii?Q?VtQgqhmoJDOSUEkiR1D3X1zG/vxoJ7srPJzhEug5iQv/SmgzRbbWbsBpcaxp?=
 =?us-ascii?Q?sN67XmwjfrvvHVV3j7//V8UtIV7PQYBHyD3nQvfKvOsL9x+GitLmAX048prr?=
 =?us-ascii?Q?BWup2SNnszTuIusBO4VmoTPXP6ZQfqrHQZUc2XRisP/VWxdDItTvaNhz3+SO?=
 =?us-ascii?Q?S8P2k/z55IdH0dgwVKNb1M8r90BOCBrE8zU/cSYubl5b0/gZrumHI7lmK+x1?=
 =?us-ascii?Q?A+YOCOFDMCnk8C31qr7V9/OHF6Oui0omDm8dtGVf/Y6ksXvO5Kuyq/h5KIn8?=
 =?us-ascii?Q?ljd50Xk7btBxIXbZvvZ/Fel2E3Y3ghSpnw+TVepwEXJkECKBEUPQsIfil22C?=
 =?us-ascii?Q?bDgMhUt+U+Z92YlZ7InIk5v/KubWVf5GqyYzW+nSqC+tktf/6D3kPW9Gh5SM?=
 =?us-ascii?Q?dC8L0EkL+Vmv+kMEYEpLtJkIwK+0P7Ch++B2iBz1TKJvcY37b7GE/Aczwaop?=
 =?us-ascii?Q?Mb6vhtbV7EhKRmoDf/a+CCZOwWd1FwQtKStiAIOSfMtqRiohmQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8gYykmohRoCNdZnIGJV7vj95GlmBwZmDCftLGKPwZTOBkCMsURyvzXqTa9mX?=
 =?us-ascii?Q?LU1WsPUu+aAAMXZbmBdUwOpVDXowp0T8xT6BVs1rgJCwfgl3lfYb/7mYGWHI?=
 =?us-ascii?Q?L6uEulWNFonWVW4y2PSynUloKgxfPv947iaYO/Y86tgxWzTi0SQcw0ICoLT3?=
 =?us-ascii?Q?++9f2fZXN1qp5y05xa0WkLwFD5nimzVR8NXRemFjUn/5Ypougx3fuKKCLZwJ?=
 =?us-ascii?Q?BdjEaXypJjy1OaRge71OiD+vqKKEenO+uxlNZmcLXMgJmlqms+AjFbUVknoU?=
 =?us-ascii?Q?+ujXHzrSTkxHQO/PzKxaH1dTRusOt9ysTvleMV1cmRqxA8Nda8P2wY61Z2Ze?=
 =?us-ascii?Q?99G9VPTK5wJNMQfPaxp2HZn6ZoEWyM6f1PwzPgSXxNjRe+UR3ovetHP0oNKF?=
 =?us-ascii?Q?CaCw6uAX8rYNTmcJCGwpXOjVoGmE8mqDtgHFnRPpe/eh/gIz1pUnJB0FbZ77?=
 =?us-ascii?Q?lKnrN36Cciyvt1pT6CrCQxbIALYiCCEobasICG84uILw+1nWuRYyjRmCxyJA?=
 =?us-ascii?Q?xUpt5q7YJeDJMAtPNyjB9kgGinC6uMRiIyK28GuwUFKQBRCY3fTPV82BBUZG?=
 =?us-ascii?Q?Y6eXZhPeV5iQYn/Ixy5Qm9fC7GwbF/EMKq0mcMmV9eDq51BclGgT14y3CV48?=
 =?us-ascii?Q?aGQRzbX9Zk+/QLdZo5i+J7W4aLlSkreAeVdQ6ZQsHRENSYdyjtk9/BSPptPl?=
 =?us-ascii?Q?a3OKsyulr7En4qqQt4kBb/gAITYBJ+RXgjyrAmAC5tqNS8L7I6va7UwNYdVb?=
 =?us-ascii?Q?ectQ2eXlT3fdiZ6WIj1xLExN627hblxPX7hHQdNk1ro7FiBrwXvmYUouAAnO?=
 =?us-ascii?Q?FD1Dcpd6NKxi81Jy2y5YN5gqzzUAgDtJYn5BGif78tU7488jDeR3xeWV3YXt?=
 =?us-ascii?Q?NK/g7ZrvmBZYlfveoXxDTilcj+czPMEm4lZKYHvtMxY+a9h6+xULXqA2BFcv?=
 =?us-ascii?Q?3/+JKR122/vDLsgUJh7GTIR64O1/15+F673NDxMripnsLvE2cwhFeD+y/kpX?=
 =?us-ascii?Q?THBE6EqCirxu7a8hLxhU6uC+fQ83xHQXyTf/GjXE+D/Sn5T5HeW/0xBfidIV?=
 =?us-ascii?Q?FtBkvRk38LaH1FYWvu6ncO5ZgP9aDG8FE6EEz6KBzt/esLBynKp+rIdJaKAG?=
 =?us-ascii?Q?fwM5e37p3XmdgMqxSCkb48z0gv+gB5GMQLEsFPr1OKP+abWao6qPWRy5kFnq?=
 =?us-ascii?Q?0a3+bUDwduOukiZWKxqnGKFioRtK8S6gz7QsbFHTl7iPs1BbfDcEQI4hOLA9?=
 =?us-ascii?Q?8uVhfsrGdb719Tx56rWS1+NEk3xcA6q07h3yRZwl/9q1y3L1WKkZwYzl99CP?=
 =?us-ascii?Q?TM42LqMInWTsvkhBVTNDKQJpLjAvpHMQtpPj5JDx8wj33d2iPzFzo4Yo5qia?=
 =?us-ascii?Q?Ct1Rj6QiZkhBDrSMYb3PN73UL1od+ijMkn7iQxOQq3rnf0oUTw4VLCW8D1hf?=
 =?us-ascii?Q?hVLMEKp5GXNE3y3iPKOLlZWNgHSQpRvX+XigvETe9K+l/jjFFyItJUMzR1FA?=
 =?us-ascii?Q?JH2ZsJD9shz42c5IWxANm0ORjFwFjpIgwqaPUMhavvEa5qi5n+So+Sia1zNz?=
 =?us-ascii?Q?hORrTJADabnbZuy52+vgLcVFtA1S8uev2jB2a0I2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb151a92-ac34-4249-8019-08dd0b7b1368
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2024 04:55:39.0748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yIpFrsQ0I/iHzx2Gcc25DE9Z3wxW84Qu3wHMAtpz++wzc02VbW1e3j/E1sLOn5xSaronjy+fhGn29SS6JwSeZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8738
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



> -----Original Message-----
> From: Murthy, Arun R <arun.r.murthy@intel.com>
> Sent: Friday, November 22, 2024 1:49 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: RE: [PATCHv6 7/8] drm/i915/histogram: Histogram changes for
> Display 20+
>=20
> > > > > +static void write_iet(struct intel_display *display, enum pipe p=
ipe,
> > > > > +			      u32 *data)
> > > > > +{
> > > > > +	int i;
> > > > > +
> > > > > +	for (i =3D 0; i < HISTOGRAM_IET_LENGTH; i++) {
> > > > > +		if (DISPLAY_VER(display) >=3D 20)
> > > > > +			intel_de_rmw(display, DPST_IE_BIN(pipe),
> > > > > +				     DPST_IE_BIN_DATA_MASK,
> > > > > +				     DPST_IE_BIN_DATA(data[i]));
> > > > > +		else
> > > > > +			intel_de_rmw(display, DPST_BIN(pipe),
> > > > > +				     DPST_BIN_DATA_MASK,
> > > > > +				     DPST_BIN_DATA(data[i]));
> > > > > +
> > > > > +		drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n",
> > > > > +			       i, data[i]);
> > > > > +	}
> > > >
> > > > This looks more clean according to me if (DISPLAY_VER(display) >=3D
> > > > 20) {
> > > >     register_base =3D DPST_IE_BIN(pipe);
> > > >     data_mask =3D DPST_IE_BIN_DATA_MASK;
> > > >     data_temp =3D DPST_IE_BIN_DATA(data[i]); } else {
> > > >     register_base =3D DPST_BIN(pipe);
> > > >     data_mask =3D DPST_BIN_DATA_MASK;
> > > >     data_temp =3D DPST_BIN_DATA(data[i]); }  intel_de_rmw(display,
> > > > register_base, data_mask, data_temp);
> > > >   drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n", i, data[i]);
> > > >
> > >
> > > With the above code snippet data_temp will have to be in the for
> > > loop so as to get the bit mapped value of data[i]
> > >
> >
> > Yes the  whole code snippet will be inside the loop itself
> >
> In that case I don't see any advantage of this over the present code.
> If you still insist will do the necessary changes.

I think it looks much cleaner and the variables also help explain what the =
values are instead
Of just craming a bunch of macros in two differenct intel_de_rmw
Side note make data_temp into bin_data or something around those lines

Regards,
Suraj Kandpal

>=20
> Thanks and Regards,
> Arun R Murthy
> --------------------
