Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EDC9A1998
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 06:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7583910E796;
	Thu, 17 Oct 2024 04:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8sVJT86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2B610E1CB;
 Thu, 17 Oct 2024 04:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729138059; x=1760674059;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yy1+IJ1Ce9KADOWK1dLatML+QVy+l4FXFXKb4oo0Pxc=;
 b=T8sVJT86sBbBrrR77sqn1cP5B83JAPx3zwac7TgaGJ1lDY5sbSb45yca
 uUPafetnneOvBPlaTEc3p7QAiuUfC9//ndNp97uKAHf0EOAmORdwvSJYY
 NHcdCsy+iQRjhOkBL11qBbv55kdi/EqVEcBsFJhCvvkJTeElvwh1EQhgZ
 k5cZpxyFJTJCrIH+fFIvscRc3zVaELVhgZ1i1y9ShKeauwNrIsBfJwsaq
 AfquH6ve5xMAKe59t4IKJ7RVFjI+cO7NJgsJbC5mhlfSUg3fUoAJ1XMc/
 Mwy6E6mxN78osiKD365fjlA7JmcMih5Vadv4MGhMnjyiNR0JsqjIbXgvJ g==;
X-CSE-ConnectionGUID: 0sfAhwvqTYSBWGmLH7ze7Q==
X-CSE-MsgGUID: k7HsFyRDSKGicmhj4+J4uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39733352"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39733352"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 21:07:38 -0700
X-CSE-ConnectionGUID: Kr5975eOQ+yyaiEg98pRQQ==
X-CSE-MsgGUID: Xu9mZsD2TCasrY6kj6lyrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="78040903"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 21:07:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 21:07:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 21:07:37 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 21:07:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9B3MIxsPsy3o8xRQibIR8ljOF8UmGxkiVWwl0hqI6KeRCgTrv0XO9VorUnE7hF0Z+vclwShklZbd4m4twmmv0IjOEdK2ZCxRuH2kdKHJA0/lzbZzTI/3yN7Ue031U/fGW5zZVPQzSRLmRsHdy6XE9j1VKDz88W0F5d72ujZSoybzCF3S2wTWRqfoWdWyjntJQPoGY4xvf94cjyWH/cDljugAcXhXH3xY6qZR0iyJTdng4Qxz5Lyqk9Ju+BuT+8QoS0ypmkVlMFLQsQyBf19hWFkvr12jr1ieM1y5GPv6pEKJBtj7LU4N+RYVWiMfEDQ7YgJOAOAbODYA5X3v3jOew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRlmS2IzC8we60ceb2/WLocLTdvLHWhyenV1Dsx4qoc=;
 b=Sgxovb5JS7pNIqjtM1id2bxn8zulfcszOlO1crTxEPRfRe+Dehe+tkTiHl4vM3RwYL14dVVePNQwXlLV/rN2Rfw2cR2oVLSsVXS+1J1VIGS9T0e+wE0IIWN2KcX6HpnjPAZaIXvCh6olZF+W9GN6vOMhHCCm4K1KYuThhwsGN/Aflb02ROsv8Qt2bpPNH4jdEJZFtXTxRJ/gor+nROvk3Obx3W76HTP7ph39VJ9fzdzqgqEWWwXUPyGqrHFGQ6B9qR3r9Uxslpq64/Ogw20rJa1+WSTbR+TXFrlfVQVrSYPS3zHRzm0oJYxDUWdFbVRlKSiumPX9fakKXxS+qTPWaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SN7PR11MB7438.namprd11.prod.outlook.com (2603:10b6:806:32b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.24; Thu, 17 Oct
 2024 04:07:35 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 04:07:35 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915/display: plane property for async supported
 modifiers
Thread-Topic: [PATCH] drm/i915/display: plane property for async supported
 modifiers
Thread-Index: AQHbH47FDuXGqBVxjkSYyqY0UpsJ5rKJX/iAgAAGqYCAAAHsAIAA65ew
Date: Thu, 17 Oct 2024 04:07:35 +0000
Message-ID: <IA0PR11MB73076CAE9CF2258CF83F8F49BA472@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241016053626.2850384-1-arun.r.murthy@intel.com>
 <Zw-_6yuy139Zmir3@intel.com> <Zw_FgeZFATAk-aMf@intel.com>
 <Zw_HHn42gYFvjWmP@intel.com>
In-Reply-To: <Zw_HHn42gYFvjWmP@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SN7PR11MB7438:EE_
x-ms-office365-filtering-correlation-id: 53abfdf3-98ff-4b72-268e-08dcee613b48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Ghh5EkEcXwRL8naWzK39I8xZiyI2bGOPOZwIkuc6tTEMzcdWwQyc2JS9u+?=
 =?iso-8859-1?Q?+UPIBfthnACJk8gEW+OavL8AXuYUcrh31ay85sbu5K6w9iXLuT5+JlOKPH?=
 =?iso-8859-1?Q?fNOnuA7kNi2GC42fOSYbVJauuk3b2Lh5zGg9PhDpKzm8E+X4kaRyKAcYP4?=
 =?iso-8859-1?Q?8msv5qzeafa2MDYcp+ojSdrmSQU4oL3b0SIW3OlDvAZLT9sQLz8oCHDN0C?=
 =?iso-8859-1?Q?rjFba25rAxluGldGIMJjFmL5m85XbH0GGNYLJymBbkYFOSNfC54rYxILLk?=
 =?iso-8859-1?Q?ipsIDZdHWy3LBs0aj8xR5wIJbdiDlpdYMLFOavGu9EhwciGjsmzZckzv4O?=
 =?iso-8859-1?Q?EnyGnKmBHebc7+qyEDQy6araeSNV3g5kWkYajARD52ZKbrJ2w4HCBvJR8h?=
 =?iso-8859-1?Q?uTCk859E07xv5H3FeIt7A43EiqScOpIgRQ31vp25caCr5TQD2jTxbhQZe6?=
 =?iso-8859-1?Q?hXokEQL1mYcvHRTtfZpl/acofyh99XGwoCR6Y9bZgZvnBIcgmIS25xUoij?=
 =?iso-8859-1?Q?eaqPpmGVrFE1kHa91YlsTwT5MyM14OPP/c/k8/x+RhBIk0AJ5gBBIXZJzS?=
 =?iso-8859-1?Q?16qrIn9L43TSCCCmKkuqx2ik0TS90H3VLnYzUj5JOFALNFT9FtwFWgUxO7?=
 =?iso-8859-1?Q?yiCB47iwvMcD2Wl7rm/TNHTAyjvMc98UmTjJ3G+mIZbAohDyRIPPcr+FTR?=
 =?iso-8859-1?Q?M4iYOHaEo78ljC6w5vgMT43oHBvSPY/DOVkWZ4AuDZSmCIZ3tVKtzJMaDk?=
 =?iso-8859-1?Q?7COthAEXe+PAZWfs/5UFDo9kRXOXH2L06G8Ylk9in+52DiupsCx5Avpp+P?=
 =?iso-8859-1?Q?rROoT5H8/DKINVX9cRNVC0nfCbvy9qKnZslZr+Bwdd14BxTVNVUvZ7180s?=
 =?iso-8859-1?Q?KX6fdlkZLsuVIyptljGwh+fzQTKJm+fRQv0oL8wfCpJlfNpFUSq3fApUdW?=
 =?iso-8859-1?Q?4uFlqJdqSVM5QqUZRUqKijTHi5iRxLCyyIGtld9QWXubemUtnM9GIbrewQ?=
 =?iso-8859-1?Q?nFZHzFXKdjceXE5DgDJo5ZRzTbgmwVMIjdI65yQJTbEQMUfrjotgeSptXq?=
 =?iso-8859-1?Q?hdtvP2Ppio9Rj1c7/uPRkCK0Nl5dVMht8ZdDdmqYbT6d3gwPcxeQmGV3P3?=
 =?iso-8859-1?Q?4Yv7cs5yxR6NNn1nhxS8e7qt2egVSKEtvyZWtIavazdeJvhP8dxTQi+Orm?=
 =?iso-8859-1?Q?dA8JBJtm2yXDXByVigWNRaSdzrB6ZLmIvyPY2WAXdr1CCh9MsiHFtKXVU6?=
 =?iso-8859-1?Q?G7oWimTd7tnhV8oI18FSESDI6Hmn3FUgJi0sirL8MDLr6Ku07rEl2eHyxW?=
 =?iso-8859-1?Q?T/rXlzubXGhT8Zd0IYLZT1mRtOwRas7QNipzAJMP5ae4yK8ugBOaG8VB5f?=
 =?iso-8859-1?Q?q+mx4xuMvo?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?eNZ/9BsDaqDTyg4e5uXh/cUdRkrEzdW/aDdJFSMa6nbnsy3tj93S516gLS?=
 =?iso-8859-1?Q?gR4z2btaZruTUIJfYsk0oghuViLN4XGwMgFfHQqpMjffaKLMERN1Yz4YKr?=
 =?iso-8859-1?Q?pyvABbiOqQFsJbk9sZDBiJLu8voT/yCsAb1WaONKx18G5DW3th4s96Nnd7?=
 =?iso-8859-1?Q?tNDdaPdVB3+opAL8shr0p8FWl8nkGMQ96IJulmXkfl2yvGDWc976phO3wZ?=
 =?iso-8859-1?Q?Dnoj3Q2kBJY9WVGeuNkr59KDXukk/+98P/u6X6qTxH+aZUQ069541xZAiL?=
 =?iso-8859-1?Q?UusB9HHhSOhPRdSLmH8gxieqDI20Zwmfkadm9QxSLn+ysJVBPabm5GoRZW?=
 =?iso-8859-1?Q?jGtfkhiIBpmbUxX94F43iRnDkwauYZhiyuyQ8n8IxtOnSEeq+C48+IXnAh?=
 =?iso-8859-1?Q?bdf3shoAHtIbVvG0bVbhwn/dIHw/7uotTczP0XVQoOD/wEo3s0Fd9d7aZs?=
 =?iso-8859-1?Q?bh66o0eyVJSF4gNH4r3lQ8QFQrt+i1UJlkhxDUwXkKnLXbgLONL2PcpYGZ?=
 =?iso-8859-1?Q?oP5clzUnt7CrmpgR+iYMQ+NJ79GaCRcch1P4QTBUQt2yzmEm02BCMcxcOf?=
 =?iso-8859-1?Q?QCbAHb1LQFjwm9MUHjyxG4zYtaA2qpWvW8kmCO6nSj/apNIaN6s/9epwM9?=
 =?iso-8859-1?Q?/t5OJZi83X+R2UGHOtgfSqnegHkM239h3nGvN8NIQgLH5yGSiNDIwdi/EI?=
 =?iso-8859-1?Q?8lSVInR9gyrixaprCcso2D0WLARHDiK5bIwE/wtQWJT9LzCBkOGpVdsLh1?=
 =?iso-8859-1?Q?Elen8B3oCCl/XB1it7Hp+JJzrSIgqSSxBu5RsYr7GoIYCiiZ9dEqcALb4+?=
 =?iso-8859-1?Q?KX3NqYbtT4XGzmWaYCZm96eDe9v6CpGasC59l1kqnfdzh33ZGRUz19tA32?=
 =?iso-8859-1?Q?FySD7Jp4AH9bWJHvTNGzMDtopn22kumdq5YudO0i3VoVmcR8zwOGb72B4t?=
 =?iso-8859-1?Q?7RrKofrF2zAIl/wu+le8gEJv0I0Q6zdFJt8Vn/ZvWVCPtzhihMdbhc/pno?=
 =?iso-8859-1?Q?CE/5hxrVILKsM3sVc/fbBImXJz2NqZ4YXbGeIhgE5ZHG6EENEc29peP7/J?=
 =?iso-8859-1?Q?M2vsYvbsEAbUrUqpGAtdGXX11mzGSkRg2Gp8/+15AT3kQ+2D2IHP1Hqwkg?=
 =?iso-8859-1?Q?7ia6Amx1y5CR5J3ziLt9jpTucnTU9SpoIb7qIOD/s2ZoNBeuTNrE+lvlzM?=
 =?iso-8859-1?Q?EpYtJWXJHGQjN1xz0jN2uXSKL/pd7EOvPtbj29oHF2odSjS1yfVS0FM8Uq?=
 =?iso-8859-1?Q?+skfeGEcHkuhGqa+IIkKEmw28uPQLBW3PY2ZLzsDAjXTGD29XptoT5Y5qI?=
 =?iso-8859-1?Q?pBdNDoa0ySu3y8CVNaxukpzk6+1xUo/+SdN5QsKYqq9q5hpFo37BUyhAyP?=
 =?iso-8859-1?Q?vt09wXRSgvYxibz/z7pWUbOdw+BXzCjmMZn1JofsFuC3RXfGB3otpFaAAD?=
 =?iso-8859-1?Q?kAD/fAiZCy51vth+8IlXcEy0Upir510dbmC+AJmu5RpmbYWBnHnEY5afWX?=
 =?iso-8859-1?Q?IA2WB4JDsLK7bu3dvuhdkKl4i/rA64EOgXkiOVlRd7fgpTk7+OR35X3RHf?=
 =?iso-8859-1?Q?nOvMMzVpAhZClL7hFRAbNZ0hSjYHEGOTJyIx/pBpr+3sMvwsML4zbkKXnP?=
 =?iso-8859-1?Q?O8u1x34cZehzPLMXlfY0Gfmh0cFb0tkMS08esldWhWdiGD6pBXk5dpvxES?=
 =?iso-8859-1?Q?h2aEqVLpYgOHfWnL5Dcq/62xY2rFnrKaKz5Jij/Z?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53abfdf3-98ff-4b72-268e-08dcee613b48
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2024 04:07:35.3138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xv+6pthQhec+fSIPLsdvpckSkC3x90MzAaQ65bn/Kc+ZfxHy5Subh0nPPlSOkhQ9bM0WWU+nJIcqsa/iAigapw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7438
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
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Wednesday, October 16, 2024 7:31 PM
> To: Murthy, Arun R <arun.r.murthy@intel.com>
> Cc: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Subject: Re: [PATCH] drm/i915/display: plane property for async supported
> modifiers
>=20
> On Wed, Oct 16, 2024 at 04:54:09PM +0300, Ville Syrj=E4l=E4 wrote:
> > On Wed, Oct 16, 2024 at 04:30:19PM +0300, Ville Syrj=E4l=E4 wrote:
> > > On Wed, Oct 16, 2024 at 11:06:26AM +0530, Arun R Murthy wrote:
> > > > Create a i915 private plane property for sharing the async
> > > > supported modifiers to the user.
> > > > UMD related discussion requesting the same
> > > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29618#no
> > > > te_2487123
> > > >
> > > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > > ---
> > > >  .../gpu/drm/i915/display/intel_atomic_plane.c |  6 +++
> > > >  .../drm/i915/display/intel_display_types.h    |  4 ++
> > > >  .../drm/i915/display/skl_universal_plane.c    | 49 +++++++++++++++=
+++-
> > >
> > > This whole thing belongs in the drm core.
> >
> > And I don't even see an actual implementation of anything here.
> > Why did you even post this when it doesn't do anything?
> >
> > Anyways, thinking about how we might actually implement this, we can
> > probably leverage
> > https://patchwork.freedesktop.org/patch/619047/?series=3D139807&rev=3D3
>=20
> Although we should probably pass the format to that as well...
>=20
The blob points to the struct with elements, modifier and formats.=20
The main intention of this patch to get the i915 plane private property.
The reason for not having this as drm property is we are the only user for =
this and no other vendor has this restriction.=20

Thanks and Regards,
Arun R Murthy
--------------------
