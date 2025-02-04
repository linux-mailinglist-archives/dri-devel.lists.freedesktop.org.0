Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11373A26EB4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 10:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4111710E312;
	Tue,  4 Feb 2025 09:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/2CcixU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC4110E2F6;
 Tue,  4 Feb 2025 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738662143; x=1770198143;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C6GoeX7cVFeZjCUYa0kNRl49UXdO3Yac1YLCbClgOQM=;
 b=M/2CcixUYVpSn+b95mDb3sesaqmdPecQJoUYFspJ/EGhqzVeOjQeNGNz
 sV7W4D2mHOr7VSNMqcS/Tc60nLTb1+6XePh35Q9ZQxqbO9wgxnDl9Vq0L
 xf30a2AjcsEFX/n6VcPYLZ45bTlD9OscQ0xolpwG1mqUeWLLV2ghChhEo
 SBy64MPYOgywxQ431UrCStFKVcoCcKRdrWfzM1MYU5+5fW5Nh0BGOrFTx
 igJ/cAn4K5iVg1UpWGXY4kyKRLP2HGn4gJ+1Op7GG05JgLrXtsFvB/gP7
 lGTzM4/ZR/d6bQq9lYyMq4fXFVPEmi9r+zh1zNOyYcws1PeLgs5iA+S3a A==;
X-CSE-ConnectionGUID: zSfBsez3TT6uvqRLQJVzjQ==
X-CSE-MsgGUID: 6WVb3UMlTNafGSF/XaUR7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39283871"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39283871"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 01:42:22 -0800
X-CSE-ConnectionGUID: BEPcQqsvQImaN3tF0KFM1A==
X-CSE-MsgGUID: oqy3nScqTx6UkcZnWXrztA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="111124631"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 01:42:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 01:42:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 01:42:20 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 01:42:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XB7OEqizN1CtEppk5VMG0QU1JKKO37tjHFKXwn1Cudpm1OyfkkbZopEm/uBhdSM8zjBfQoby7QUaJlLluqzlBNHQzWdi3L7x9aATvy2HEL/lmtwz36M57I17ungyOBZURXMG52bgzAfn1YdKnj/WdZ3mdEZGJ1NVeuxwWd4hPL4Pu1b57dJCrSWHBXGfOubvqi1OFngYTr31OKTRqbl6FV40S4DwzBK4C4eHwjEGleLN+ddoJHUUEhQKCO0o/6w9c05L5udOcRPkPP40Q+DdeTpHJlsijOa0bO5BrrHGo30rcBAYNhRQs/Ha3DnRqbcAm2GRw/n/NV2lBzgps5Wa5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2rinKKoMOYDJtPNQOyVxw1NgdfyIGokHXtkiI9HsfE=;
 b=t0aZwYULxtqv9r6pdXZOxx1lEBD/8y+JGE6RCg9NcDbsXea2adhgpSO0waNJvcnniun6jSHRHDlNRxACaYMF3GZc8hP48RmbVvbEPfH7XBzH76yAmnDqjJsgodb0kXu6+savAuhy8dUdZGwLJykGVmg4wJfa8caV29fmwTIBgl+Ac3FP6xQ9Uam1i3iI1Mg/ym4gaEFn6Bsz4hsc3zbwBkUdIwuJ51HSPCuQIGoQXHfwu/IXa8YhXtjidP8MWxYViwTOmPqX3vyMW9hwvh1i/ghuQjYy3QIGNeibZbr0Uyddsgo4aGxyl25M5mvqXFxZ0PThK53LNKp/Msm8hQbA5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by SN7PR11MB6995.namprd11.prod.outlook.com (2603:10b6:806:2ae::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 09:42:17 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 09:42:17 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Kao, Ben" <ben.kao@intel.com>
Subject: RE: [PATCH 3/7] drm/i915/backlight: Check Nits based brightness
 control for VESA
Thread-Topic: [PATCH 3/7] drm/i915/backlight: Check Nits based brightness
 control for VESA
Thread-Index: AQHbbiN3F5+4V1WjIU24ZQXnPjhU1rM25e0AgAAPwTA=
Date: Tue, 4 Feb 2025 09:42:17 +0000
Message-ID: <SN7PR11MB6750BA5E7C546AFF0B1BBFE8E3F42@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250124054631.1796456-1-suraj.kandpal@intel.com>
 <20250124054631.1796456-4-suraj.kandpal@intel.com> <87ed0e6quf.fsf@intel.com>
In-Reply-To: <87ed0e6quf.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|SN7PR11MB6995:EE_
x-ms-office365-filtering-correlation-id: b97db374-cf8b-4175-fa9e-08dd450036cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?L9NE/jJeQYXI+lnJdpHXdUjHVt40hCt4DhvgyYx/e0ctCKyU22kYB1FVAxuH?=
 =?us-ascii?Q?p1GKiKh042RX19W8fu4qhpyagp4PpA7zjPeWGnAQJyVEqDOGu8r43IPz6gq9?=
 =?us-ascii?Q?F8bYN58PsOIbZU1Sf0FbqL9MGkS5Q0SR7agpVCF4bT/4PUgHprbn4pIfdtx8?=
 =?us-ascii?Q?WUxyIyM6KFH/IXYa5JGeqeIkOSz8ZaJHbgEJFqcQgGYeHy+QPprYwM+eXHP0?=
 =?us-ascii?Q?FlYDycrpfdyy66cmJ2mepLqgG0ItRldPW6TzqFN1/q34VHpGYdFubBs6z2sd?=
 =?us-ascii?Q?Din21EG/BxAmE5utDL1TqWsrM6P7SeEVMyfLGVJV3Co5lAESib4ZWoDNrvys?=
 =?us-ascii?Q?sngQnSVJp1gTbX/0bxPNU9qw0A9gKGRpkMplz0oSdsY3iHiOmJrHVDwPw9KV?=
 =?us-ascii?Q?1rf+cBaCpAQT6awFZtaAuLIM66mIAt471sXY4knT9pKR814BxpRuj5xDoL2I?=
 =?us-ascii?Q?Vo0lexPJu+a+PNq287fqrGoRvvOto8ixWuSeclc9gdQxPSdoWUL4H5c+eBf/?=
 =?us-ascii?Q?K+vFVEtvxuFh1NW2zfTsLiCgEc5FpJ9jn3T9AhDe1QeAZkBA/5N1IQZGTqEt?=
 =?us-ascii?Q?xrEBg3E8fU0V6ad3crhJmEeXdRtmuusMJet8PrWoLrbKcHYCxxLbpJ1//U0A?=
 =?us-ascii?Q?0e3BlaVe0M99vKoyIc49MGFB/T/xh4l5MwztAydiRSZkAq+B0NNiQvktXZxz?=
 =?us-ascii?Q?jFT+N5FI4mfvyNaLnJ6O1bpIBRt0Mmr61PX48UOtbcx9vtclMJgPYnCDxcCS?=
 =?us-ascii?Q?BJ4vzvM1gsjNU0QDVi2uEjAtvB4vjLMbai4Hn12Oi8ymt2f8Pq/ow3uGym+j?=
 =?us-ascii?Q?X1wgTq7wXXDG/vqs3NiQtQVl2l+roUFHGBK1kZvXUBMVGNQA7EH9Qdr3LLxk?=
 =?us-ascii?Q?4AefnNj9tK7F1h94UWXWMTkYTTvbub2KTKryFm+cMnbejyb7vBwJ0k5Ilz+N?=
 =?us-ascii?Q?14HHjE5IPDxfsW5v9Qx5hT0Tk942RIt9r8sXTRGfyAv9apFwDlQ4PCp/8O2z?=
 =?us-ascii?Q?6pm/jQvLWE7AZ9857PmElr0tw+56axd4wU4ugbVtZBuEHIU1qY+d3B+3WGii?=
 =?us-ascii?Q?Da36dT9wh9Mjf2uxMgXM+ggDTYaHiCwPOJzR6df68K9ief+Sda2v/C3aycu4?=
 =?us-ascii?Q?5xEyP/shD5JGGG/l0y0p3qUsLhID1TxBIckhS/6l2fUTXJHrEpXh743z2yTY?=
 =?us-ascii?Q?SNiRRjNp4cLD1CQ4O0PKL5K91Cje+bj44JPY6CV3cOVC1be6gglgUWtp9XtC?=
 =?us-ascii?Q?wjn9DMNKUX8on8rgp60AT20PYHglxjOXqJZEqgoGTe0F8RLEtBQR5eApjPSQ?=
 =?us-ascii?Q?86/6ZxiKQS40pKtFhMrVv8uPg7rTKc9GOd5NbQaEY6ANuMXkb8V8TzzwCuqA?=
 =?us-ascii?Q?ttyGot9cXmn9Hrjz4ee9331npUoy7TX54GC01Bp0CzsZ2dTnOt/CBNuVbxfq?=
 =?us-ascii?Q?qB0/7pfm/no1QQFsNQT4K9XZnAC6acB8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+IRw3/3DMZ+7pGoInN4MKH6KEgDhdpVi3C2nk4P2qKyPNfPAPQ0UBUpoOkVe?=
 =?us-ascii?Q?qOqh+sGzRuq6Dor5Z85x4Ekh9leUuFvXmD2uD+1uWl/n+018cHNVa7Mtd1dy?=
 =?us-ascii?Q?88i+GymlezuC0jLyBpyIGmfan2boSqdAkCUqetNcm3hpc1T1LU3sJuG0rJZ4?=
 =?us-ascii?Q?jDXf3PwpEjrpR1BqDATnLvU8rxnpwpsQjq6ubSlhCnPYEtqTP6/8Xkuz5OSG?=
 =?us-ascii?Q?9Kc1ZeK2/SmAsZmIh5AxIQQb4QYRWS/ZvCYXUTGtddUgtJesdy9dk2wghiSE?=
 =?us-ascii?Q?zX0mEM+wn9r6S3MK3tCxzNjOIhvmzxCOgZHc4yYygeAGVtufl4Csjt7nS2kH?=
 =?us-ascii?Q?VzIA2yVVtCtZNNUQnzQ7pyakVoVbDEyitZkVXDM01dvKzuZLD5nh0zl2Gdfy?=
 =?us-ascii?Q?4IFzGOaCWEGcU/UiHGdNwvhUrmxp3HDwO/YWW/ek06IyVIXU2Md7HcSDTUL2?=
 =?us-ascii?Q?lEttt8FiOWVBMicNi4yWLKj2fJgxGNOPbSRnYvdaTIp5Q/aMI3mYX1rC3Yo/?=
 =?us-ascii?Q?g2fpRXkXdiRXc1SQNMeGfRiNvtiP8seLj8LWNGzQ12h8lHCLF/jkJ3xLsdae?=
 =?us-ascii?Q?WK2oFx1Ucfve1nraCgx8TlUXfqJsqiNH5kOora373nDx2zoMcHt434Hxfbxl?=
 =?us-ascii?Q?yE2vYVzdh9/kNmtczv4of4Dd3GmP3ZCq5ctLwcYH1eSWiQbp1xxcrI+GZWtp?=
 =?us-ascii?Q?WbrdtePIKb1Ot9zHyQ2KwmGbZ/2Lk8TxOH5FwZ0w12JTqrQy+iY8vvrmmJ3l?=
 =?us-ascii?Q?pDKffi/E8ujXTLPHuu4RnCT133N7UwWbrFoVpLyBJmp0hlreaDOCWwZoI2aR?=
 =?us-ascii?Q?Rf+VzVhDUnyzYUxPofLv5RoILaL7Sz/QWAoQz4Z7J/QaOVk76da4LEAcNRw7?=
 =?us-ascii?Q?jtd5nXCweJaDJa2BmmqCcrZqOdM5fyyx634qDoTz25BKO0ZCHr71U8mBlSGd?=
 =?us-ascii?Q?NJjIdL3O04C8aROgVV+XdL5wqqabtdcCwNSs78TwxF38Lfmki5hGaNdPFd6B?=
 =?us-ascii?Q?egPnPw7NxTFijU8LfFKBCRHZpDC/h0R/NoMwGoxrKnE5/fOoB1L8X0Rvnrfo?=
 =?us-ascii?Q?F9VxKshYBRDXjW+JLdJKF2EXTek2T9Lru9Aa7GyJFs+LNeowTPkCk/febdK4?=
 =?us-ascii?Q?7omyWZIQfVF0nFSHHpS2mfe5zO8S44viJICuxrOCLlrTgroRlrjYQYgTDUmY?=
 =?us-ascii?Q?kTxMdQkZ3PCf8fsZq+0zx08FtsNLN/YOADf1zrHa2zCIiFYgaL4r+IlISGgi?=
 =?us-ascii?Q?0l/4fHxlI1bDd31rSIxtWZnCkl3syzoTYpSe2WmNYUcarB52QgZZ+r0BF0XN?=
 =?us-ascii?Q?N/VTjhpl5S+pVtvLPbhBn7MHBx6QBNLa5QZJWCFfP6OYMErTaS02f47nlmSd?=
 =?us-ascii?Q?5USgd43jHcL4iv4dosNhW9i7utJP1C48vPCVkoqhO/Vv4VAAElljXQY+9M+r?=
 =?us-ascii?Q?af3FlHrm8bR6RE1+ofwfYhBGXm5kTg5lugDs7kCvPC6QRDMVaP4n2PAGdIFr?=
 =?us-ascii?Q?EW48aOfEd+6UkeX1NSuO8zxbqZ5i7UvLHcTgfOlAv6eFQRUL1/VyFOfjIMO2?=
 =?us-ascii?Q?/LBKXshVffwxwl0D3hNaZaAYMyN5jS+g0JfZVlN3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97db374-cf8b-4175-fa9e-08dd450036cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 09:42:17.7889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E3TCk9WngPt8qodiaAmtGRdE6Eiv2P7K3hPr5KbPqMevAwcjX/kuWBXFRG18HP6Aemde0WwJc3bPQo6cUNUBYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6995
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
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Tuesday, February 4, 2025 2:15 PM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; intel-xe@lists.freedesktop.=
org;
> intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kao, Ben <ben.kao@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: Re: [PATCH 3/7] drm/i915/backlight: Check Nits based brightness
> control for VESA
>=20
> On Fri, 24 Jan 2025, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > Check if we are capable of controlling brightness via Nits which is
> > dependant on PANEL_LUMINANCE_OVERRIDE and SMOOTH_BRIGHTNESS
> > capablility being set.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_types.h    | 1 +
> >  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 9 +++++++++
> >  2 files changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 083eb86f0904..f900e1f2d93e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -412,6 +412,7 @@ struct intel_panel {
> >  		union {
> >  			struct {
> >  				struct drm_edp_backlight_info info;
> > +				bool nits_support;
> >  			} vesa;
> >  			struct {
> >  				bool sdr_uses_aux;
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > index 09e82f24d030..c5ff6e044866 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > @@ -575,6 +575,15 @@ intel_dp_aux_supports_vesa_backlight(struct
> > intel_connector *connector)  {
> >  	struct intel_display *display =3D to_intel_display(connector);
> >  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> > +	struct intel_panel *panel =3D &connector->panel;
> > +
> > +	if ((intel_dp->edp_dpcd[2] &
> DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE)) {
> > +		drm_dbg_kms(display->drm,
> > +			    "[CONNECTOR:%d:%s] AUX Nits Based Backlight
> Control Supported!\n",
> > +			    connector->base.base.id, connector->base.name);
> > +		panel->backlight.edp.vesa.nits_support =3D true;
>=20
> Should we refer to luminance rather than nits here?

Sure I can refactor the series to use luminance over nits then

Regards,
Suraj Kandpal

>=20
> BR,
> Jani.
>=20
>=20
> > +		return true;
> > +	}
> >
> >  	if (drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
> >  		drm_dbg_kms(display->drm,
>=20
> --
> Jani Nikula, Intel
