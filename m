Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBEE88D702
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 08:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3764910F8DC;
	Wed, 27 Mar 2024 07:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kboYs5o3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3FF10F8DA;
 Wed, 27 Mar 2024 07:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711523527; x=1743059527;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+Q/vW9BVpeMVvfDo3FCkR8+YZ4z5WqGTVayWF1oo1X8=;
 b=kboYs5o3+t8nGnWMRwgbf+/GvOPm1o0rKXVtNeid3hrD0qr3LWlU3WlC
 XRiZVgCtJO1MZshmmH2XOWXpZ9upK5sk3vnAwoLENG6/dXZHrMT3mbOit
 vSu7GmpCD00HjrohyIWfcZMexACSDYEOMasf9KUuGGcbADbfibOzlUSum
 1FEbLjc+zuB+eHSoA9NCvcA9r4lmdp+ER4/B/GCkxt5lQsBlNfn2/jfG9
 DstTC+SJgVRJccea5Oq4+xhXCQpS7twC6S97BLyplbJpaxBtgA0iP+Cu+
 tHP1EIf7GBHjRAkOWZXTiPjmQ9H5nAEjj/SYHybUhAUu2sHx6BUCpFgHN g==;
X-CSE-ConnectionGUID: XJtYdyz+QXqEcWG4nOSZZw==
X-CSE-MsgGUID: /Y+tjqDlQWa3WALmk276Mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6433503"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6433503"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 00:12:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="39314435"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 00:12:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 00:12:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 00:12:05 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 00:11:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUwB0m8eA4ytFMfI4HELAYLow5nRlbIlSx/UULBS0ByBKJaf54dNjrE+LL/Zn3v6HBJ7ZyehknzJW0/LFSpGDPiMU4UhRWIiMMXcZ2b/4lh/qNbBkKXULVZH8v8RUAUUh4mkB7BK3M00i7vmY8hJEz3LfIFCbzVnHgYPXotlMk5TBm/13Hf8wE+DmZMSJEX6kMKT4AlImVJrDFgkWWr1pvbDRiMe5Q9aXSRhpm2RreJpy3YM9pXncUZ4eTz4feVftQ2R94ad/0MTgRGM/8giJ1ZLgtZYuejVztZ+Vn9xRshuq8BJj5n9J2q+3QxOHDh02rE9cRqu/m9GFA6mK4ED6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81vBNKcIxbVkMxu0Td0v/w9j1+ZGLCs4znwPTnr+i70=;
 b=JUib2UVSuSKv1OPrerekahJF/uvYZivISlCxZ9G16YSY8mRnUteShJ6Dr+qNaggEjA/YDfOkq0JMUafdJOt1QNdCSzwG+fmnLzi/7htGYckYwYMHC9zgWjs1JaGw+pwzBfRn+d19S+9F0vM2lolGvSyeYJjISvz84XcA7ICIGH3Nog4QY8staG7hNapxMCVeFFamachQ0gR6UxDi04+ydi+mIHV1Ju91xewr9dWuUt9nbAnITZs71CXJYhGZbs2R0Mf24JkgaKEzTz6vwrNgC4sEGHV1LccRpjgTAPmrBYPPxHL1QN19vZC0fmlWrJwZxyDKjavn0035X5oxPheMwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by DM4PR11MB7350.namprd11.prod.outlook.com (2603:10b6:8:105::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 07:11:48 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::295d:a3cc:1218:ad9d]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::295d:a3cc:1218:ad9d%6]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 07:11:48 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
CC: Simon Ser <contact@emersion.fr>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "G M, Adarsh" <adarsh.g.m@intel.com>
Subject: RE: [RFC 0/5]  Introduce drm sharpening property
Thread-Topic: [RFC 0/5]  Introduce drm sharpening property
Thread-Index: AQHaXzje+hY9B6aMtUSnlRX/VsGgnrELFMOAgAFLpoCAAEeTAIAbEMyAgAAFrYCADDAggIAAZWIAgAFBewCAFdX10A==
Date: Wed, 27 Mar 2024 07:11:48 +0000
Message-ID: <IA1PR11MB646705FED711C1F129E5C5E3E3342@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240214112457.3734871-1-nemesa.garg@intel.com>
 <8Ma-GlU3bFAuSPpFhGbYYuXQ8OeeDjMK9WiWO6KP-4pPO41fLnLrgABkRfhjHY6XlIh5u67vcEbD8ejDq7-zo5BXf-too0Pt7oTDhWCOPlU=@emersion.fr>
 <IA1PR11MB6467A91412978DE0FFCAB50FE34C2@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240216103620.33deabb1@eldfell>
 <IA1PR11MB6467F801FFB564769E357EA9E3232@IA1PR11MB6467.namprd11.prod.outlook.com>
 <uL84QKNtst1cp9uG3HqNAqEpJS2pT07qxwufONZx8Zq3t665BwY15fHRm3cZxMtiecQlPlNTs9srrmlIzRKmRYItWUv6cQbDEkms8eUT84Y=@emersion.fr>
 <IA1PR11MB6467C642ABBD54BD82DF46B9E32B2@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240312162600.7358e146@eldfell> <20240313113638.3ff61e4f@eldfell>
In-Reply-To: <20240313113638.3ff61e4f@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|DM4PR11MB7350:EE_
x-ms-office365-filtering-correlation-id: 188fd12a-1ee2-4020-3dc3-08dc4e2d2b03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BpFMNYasjt695e+qpCYGOuDqG7f8jVh+O+2rKBKopP7dmA0MJg0z/WOXBqtvFqvDOD7qmncZI9d4HG2mdugHwxfrUHGfyiKCSyHNvJDv5bt1zk5eLZSQF3lWw/I73vHpgy4r7N2fsNFtcVdIuTr29JtoeP5fSI3cBcHr9CTGytyz2C72j/UngrMsRdg3YfJqOjzg9CGX0RxOkkSWemP1NDgj6SVkQlfBN+8Im6zyMx2xc3OmJ+uhYTDRygh/56gqCUGeJCulal+XCqSMCaCw3Nw8ncsVp1lgrJwzUkE9S8jhUByJLmZ7JA1tLzG+wRJlsRfIg9DmGeTlO1BRQmYTc1FxHnZF5Y4+Wt2zlO6hl0tZX9xunU41qrKMSlR8Mb3iK5l9Fa4zeRVf3A67LvGTkbItzN6Oj9+6HQWrdiwdCyNdn7xZ2ju087wSF72HFNASBOkGNDv4ukpENnDBFr4zsIpieRyS1dpf6f+0ZfdIJvt01hBdyOC2DHRRu0nWWlsZcyJnVHhmglx7DoLEUe5d0PKEhhHsM+v+ttNlPgdjy0QRFC9TsWpOIrzL6iBZ+Vy7kcAkPbsfZM7UuhzojRcCYeSx1Q9RvRHDNIGXiemISWOF0hzcHotRLHuqfzDp8tb2cEGjJKNx2Vmirb5snFXSbHe++ZC+h+yQVgkTSiiILJw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EZb2sDal4+4R0vh2490hGCZ9ZwJRgFosOOdgW/RffNOqnqnYsd91XxJ/ygE0?=
 =?us-ascii?Q?ff8kkJhLSK6IpuYyBrmSi95hYXY7kHNVlcrSFlJn9UhHcnglStE2fmVo7+/L?=
 =?us-ascii?Q?0mDfqYIUO1WlYSwhZdP2faVTlf8K6HmL6LygZw6KaedtEmkwzBmP7KsgViLc?=
 =?us-ascii?Q?2MGLaOh9GosNGW9GYNUwIcuB2XBegcYetFSuVqskDb7FAw1Zps0kefUne4pH?=
 =?us-ascii?Q?x1d7r4p+KQ6MdSsHLXqI8ctVNBuyK5LRxdNgdhklw2Kj56alZlMgzBvL0Bir?=
 =?us-ascii?Q?irmkLtYC0AEIqaH8aNhTDHkH2kPGOnnWyEzzHF1vYTxo5NWh3dx9YvjeKIWf?=
 =?us-ascii?Q?B6odh4s4Du3mOUdCp9/TPUCabYr12/SdR8HZGsd36ZU8jO7MkqUn7Y5HyhF2?=
 =?us-ascii?Q?EcrZuRch7vrV2PGIhvm2KgZLcuo7juYDd9gO+cXHlw10bekkUdHUKJIQKFqY?=
 =?us-ascii?Q?ZonFaJ3+A/wCFovwZ1fEOiRoo0Ui9zVZDeBykBE1sq3zNh+QYePjGNGdYn0D?=
 =?us-ascii?Q?ycTy5ojOPIxOW0dwmOxY69qSsMbN4T6Ml+HPsO/RXyJNeQx8qZvWmnpCWVkk?=
 =?us-ascii?Q?Kdm8gNaxVT9MV7i5+YUDWDdAl+nfT8qI8H0dKXL7IRkMfJH8xSC5+3DHup/U?=
 =?us-ascii?Q?XFIx+KttqsT3VxQcT7rL6HngYxfoJ04Lkekw5R3Xxxc8ZRrhLg1deqcRmt/x?=
 =?us-ascii?Q?l4M+aEEnt0SUTH+mTYQjL/msFYoenalEacCQtko1QATB3gV4sfvDjUUvjmBP?=
 =?us-ascii?Q?w+R+P8E0ohd2r/JLGR643xQj+8Ed/0impjpQA1lrfPcndteU3hcTBQRpd/LB?=
 =?us-ascii?Q?Upu3ii1XhNj5KXLBnVPkY3sZ8Tbs7eARZsCnNozv/+vP/Kr6BnttrwZQIBXp?=
 =?us-ascii?Q?iokKC6YrlrdOZANZj9Jc1HbPZCkAzA6F+lUODivTTOelTXUeemk9iBHjgtNd?=
 =?us-ascii?Q?IgJ0/gDK9FgYFwzBb8ziJaRYj//Ozh4ThvEOKAJzrGvP7K1l0qoCDU8mLp/e?=
 =?us-ascii?Q?bzFSPuZ3KqwqdG5PiLLzD4V70cSjuSKyw2dQwqdvKpuLML7mvFv2x7ANpL6C?=
 =?us-ascii?Q?D1eidAKCF/NHRRM+5h4YPngFyfYqlVbgDIK+l+013vv6A5WtirUzHvy7oCEF?=
 =?us-ascii?Q?cAH+qeJ4G96/BXCWUDpUBMokkXU0r2l1pkgI5H425f2awOP54UqnuqKU5RvL?=
 =?us-ascii?Q?ExBtOf/P/A+MwVCaIzMietb7Nmsb+nJ6VM5stJeGOzzUZyppexJVFJ+6yDiD?=
 =?us-ascii?Q?+5uYHUmZqayT7ckT4jA1XY78/1n4CiUjBigYO55q5+n3SozO0KqdDUVlTeyd?=
 =?us-ascii?Q?jOvFEbVzaHC0a1Ik8Qs7GgQ+/vkPbzWVWmIYw5Dlw4q5qp5pkscTlh5if+Ke?=
 =?us-ascii?Q?/oSPJsI0Q4b5pzFLGhV3fi170cTz0+vK2cC8VuYUyRm01f4dbUbG/p6VWErj?=
 =?us-ascii?Q?7OUjuhNPx2d8E9MGjur0n7aGY0rzZs+RRFFOMFcoS1flMVd7yw+jE7kLTACf?=
 =?us-ascii?Q?zgvgoe7ClCrs31lbqVWLd5yzM11c5h3IWse0pS2MJoRmt/GKV/WsAIdmnJ/f?=
 =?us-ascii?Q?qDc/yDPUBQh1zUErExD7yshqwPKgDgD22FsC7jlQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 188fd12a-1ee2-4020-3dc3-08dc4e2d2b03
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2024 07:11:48.1726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pxPBoid3qqlmR8zwf7aZsbZNSk6mPc0RMaEmYeHj1xI5ropOYxvWw9aZ/cswpI/T/LmSyrPYnk6QaJ1ralKKjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7350
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
> From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
> Sent: Wednesday, March 13, 2024 3:07 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>
> Cc: Simon Ser <contact@emersion.fr>; intel-gfx@lists.freedesktop.org; dri=
-
> devel@lists.freedesktop.org; G M, Adarsh <adarsh.g.m@intel.com>
> Subject: Re: [RFC 0/5] Introduce drm sharpening property
>=20
> On Tue, 12 Mar 2024 16:26:00 +0200
> Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:
>=20
> > On Tue, 12 Mar 2024 08:30:34 +0000
> > "Garg, Nemesa" <nemesa.garg@intel.com> wrote:
> >
> > > This  KMS property is not implementing any formula
> >
> > Sure it is. Maybe Intel just does not want to tell what the algorithm
> > is, or maybe it's even patented.
> >
> > > and the values
> > > that are being used are based on empirical analysis and certain
> > > experiments done on the hardware. These values are fixed and is not
> > > expected to change and this can change from vendor to vendor. The
> > > client can choose any sharpness value on the scale and on the basis
> > > of it the sharpness will be set. The sharpness effect can be changed
> > > from content to content and from display to display so user needs to
> > > adjust the optimum intensity value so as to get good experience on
> > > the screen.
> > >
> >
> > IOW, it's an opaque box operation, and there is no way to reproduce
> > its results without the specific Intel hardware. Definitely no way to
> > reproduce its results in free open source software alone.
> >
> > Such opaque box operations can only occur after KMS blending, at the
> > CRTC or later stage. They cannot appear before blending, not in the
> > new KMS color pipeline design at least. The reason is that the modern
> > way to use KMS planes is opportunistic composition off-loading.
> > Opportunistic means that userspace decides from time to time whether
> > it composes the final picture using KMS or some other rendering method
> > (usually GPU and shaders). Since userspace will arbitrarily switch
> > between KMS and render composition, both must result in the exact same
> > image, or end users will observe unwanted flicker.
> >
> > Such opaque box operations are fine after blending, because there they
> > can be configured once and remain on forever. No switching, no flicker.
>=20
> If you want to see how sharpness property would apply in Wayland design, =
it
> would be in step 5 "Adjust (settings UI)" of
> https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/color-
> management-model.md#compositor-color-management-model
>=20
> To relate that diagram to KMS color processing, you can identify step 3 "=
Compose"
> as the KMS blending step. Everything before step 3 happens in KMS plane c=
olor
> processing, and steps 4-5 happen in KMS CRTC color processing.
>=20
> Sharpening would essentially be a "compositor color effect", it just happ=
ens to be
> implementable only by specific Intel hardware.
>=20
> If a color effect is dynamic or content-dependant, it will preclude color=
imetric
> monitor calibration.
>=20
>=20
> Thanks,
> pq
>=20
>=20
> > Where does "sharpeness" operation occur in the Intel color processing
> > chain? Is it before or after blending?
> >=20
Thank you for detail explanation and link.
Sharpness operation occur post blending in CRTC ie on the final=20
composed output after blending . Yes Pekka you are right as per the=20
diagram it is done at step 5  "Adjust (settings UI)").  I  will also docume=
nt this thing=20
along with documentation change.

> > What kind of transfer characteristics does it expect from the image,
> > and can those be realized with KMS CRTC properties if KMS is
> > configured such that the blending happens using some other characterist=
ics
> (e.g.
> > blending in optical space)?
> >
The filter values are not dependent/calculated on the inputs of=20
 image but depending on the blending space and other inputs the=20
blended output gets changed and the sharpness is applied post=20
blending so according to the content user needs to adjust the=20
strength value to get the better visual effect. So tuning of sharpness stre=
ngth=20
may be needed by user based on  the input contents and blending policy
to get the desired experience.

> > What about SDR vs. HDR imagery?
> >
The interface can be used for both HDR and SDR. The effect is more prominen=
t for SDR use cases.
For HDR filter values and tap value may change.

Thanks,
Nemesa
> >
> > Thanks,
> > pq
> >
> > > > -----Original Message-----
> > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On
> > > > Behalf Of Simon Ser
> > > > Sent: Monday, March 4, 2024 7:46 PM
> > > > To: Garg, Nemesa <nemesa.garg@intel.com>
> > > > Cc: Pekka Paalanen <pekka.paalanen@haloniitty.fi>; intel-
> > > > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; G M,
> > > > Adarsh <adarsh.g.m@intel.com>
> > > > Subject: RE: [RFC 0/5] Introduce drm sharpening property
> > > >
> > > > On Monday, March 4th, 2024 at 15:04, Garg, Nemesa
> > > > <nemesa.garg@intel.com>
> > > > wrote:
> > > >
> > > > > This is generic as sharpness effect is applied post blending.
> > > > > Depending on the color gamut, pixel format and other inputs the
> > > > > image gets blended and once we get blended output it can be sharp=
ened
> based
> > > > > on strength value provided by the user.
> > > >
> > > > It would really help if you could provide the exact mathematical fo=
rmula
> applied
> > > > by this KMS property.
> >

