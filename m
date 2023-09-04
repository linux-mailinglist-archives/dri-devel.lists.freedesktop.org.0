Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8493F79197F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 16:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC2A10E14F;
	Mon,  4 Sep 2023 14:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C73D10E144;
 Mon,  4 Sep 2023 14:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693836953; x=1725372953;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/gkELmAvfmtwgSGPB9RbpkAbOd5fRWAz9Jrrkf5wXJc=;
 b=ChO1WcFk1ybmZgAVTcbpcC5Ey0FyFTEUJb4Rh9Vs+SNoigd8uc8Lqtqv
 qbxDSwniLT8VhIGUEfkIB2wBGjbiShfLLuMFkG6NKYTQRmC0UFjXCeixv
 0mnmqVIkclL5tTFaJc1yLYRsZ/L7xqVRlaolytjV3bAAlBWoSu5LR8dtH
 ymyyYcByt3k0qT95UXYEB5PvfxOj+VGxtwTDMl4gxJpQzTr84Ul2DOdj3
 Nncm4JS0Cffc1UbUQURQr+4tlO0+COACmqn2iDdf30xprF8RC+CVXIMu2
 ichhSNvlZdq1K7DYe2LN+2erVsSA14bTFklGM7U4n2G27bKwjSRjQICig g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="462983178"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="462983178"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 07:10:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="914521896"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="914521896"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2023 07:10:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 4 Sep 2023 07:10:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 4 Sep 2023 07:10:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 4 Sep 2023 07:10:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 4 Sep 2023 07:10:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvqjAZotovxOxjs9SaHhpMWLVhCyNzn5HYc/Tpz5JIhn95QdjH9OGiHUxKxTUODiw0JaYdGcNSLfv8pLVkfQ+totJOLo12jhHoucT8fuGPVru8v2lXuol7oxqkeQrhCZb5mSNh+etH9WDQUO9HIrS47cXHDyvmilVe2q4XKlhrV80VpEoAeUNfO13SQvjdk/lufRpbSGIDTl9MU2CMrBqKK5df8K6mvbOEDH7GhyE+IQb70eBmFiLF0wZt/+If4VwxtkOgdtoSyz5VI3FkU91Mjc8L+Q/YPGbmeYiArf5yjWeJ6LLe882p/QRO35SJ29glUpLdnKboIvRe58SW+UlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1Rixj1Qk7eQR3Ei9RRltcFCbO086spP9CWnRx/phaA=;
 b=OQGd2kmATWHQky0PvPx/vokB6++hKMV2LmbkySQHfBmzzeAzPU5r0gMwI35vespTovGn23EXbsdeIUXdeqgM+5w9GDQzP226LcnWS0N6QPPquyWGWuOaW5tqio0iiPt2LDreOAZL81+gp+qUesoJPDMYQEws8EGFYw78392mzUrlo8/vRUz44/d9PThokyxPtiRD+CJxzfiMyZIUUEreWgoi8vBv1bNLtjasMbhfi2O4JgY+BMJG8kzQCqxIPVMBKDGhPIL7j2gD1W7r6A6NaghNiMYO1ea7s/E6vEgSPmJPQ8KAMV65NZoa3f6RxeZt+XtnvBUO5wljmqVmnWJpHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6347.namprd11.prod.outlook.com (2603:10b6:208:388::6)
 by DM4PR11MB7398.namprd11.prod.outlook.com (2603:10b6:8:102::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 14:10:06 +0000
Received: from IA1PR11MB6347.namprd11.prod.outlook.com
 ([fe80::536a:e805:d12e:f302]) by IA1PR11MB6347.namprd11.prod.outlook.com
 ([fe80::536a:e805:d12e:f302%5]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 14:10:06 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: RE: [RFC 02/33] drm: Add color operation structure
Thread-Topic: [RFC 02/33] drm: Add color operation structure
Thread-Index: AQHZ2pG4HG89pktHTUOLcVmozNutN7ACzreAgAfqMtA=
Date: Mon, 4 Sep 2023 14:10:05 +0000
Message-ID: <IA1PR11MB634768E3C1B0F55ABD706F60F4E9A@IA1PR11MB6347.namprd11.prod.outlook.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
 <20230829160422.1251087-3-uma.shankar@intel.com>
 <20230830160019.19e67519@eldfell>
In-Reply-To: <20230830160019.19e67519@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6347:EE_|DM4PR11MB7398:EE_
x-ms-office365-filtering-correlation-id: 3bb0c28c-77a8-4833-283a-08dbad50a3ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F45pwSwj+nwvfp4GmLotPHMDEU7YSVZh1PzDC70MW6QeqnYVpg/kHYT6j9GOhbwtfgBCmVpolC12EXHekAiUb7ln1MbvQD97kyNHUbHtT5liJAhNl6NNUurw+8ddHWGfWPusl9cRovX51cZB4GNgP56zfmvaiK6m/C9zAXAtIQNZE4kbPHs0gJMfM7iHWXSLsQRqud+qccj0ORkoKl/A4QAEGsfCu02ALyMCZQzvRE1nxSCt9rnuYRFVPF1Au1D19cPU6lbtMRZCif4WY0ULErRIitGoKvFxSqeRZkseEWfBETD7uMgfTvMwuRu97CSdiGD5UzPnurJKzD9iTdTSSvnmxXincnicQXySbwm0WLmu+mRfFZBbPpT5RhIoG8Ek3npfDewZzWmD8e6VSk7AsyIvhSW2utwtyddrNfSyDPYtEIFPxCb/IU4EVdVcEwZbiXUG20HUixLndBF3veFaz46FP5dBgYIISTwoNF+bArzDmcGFcvA6R9LLiT66BcLwk00PzcnnodqF0HShGG5bVgo32C6ZQ1KZ6ZxnPx2rjoE+zMBto5Og/5m4VUDCY0ZiahTTRxOi3HP2aEjCxTyS+xMj7oun16XHKO8DzULYmm3uu6pDKnsnYzQzn4g8B85c
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6347.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(7696005)(26005)(6506007)(53546011)(9686003)(38070700005)(122000001)(38100700002)(33656002)(86362001)(82960400001)(83380400001)(55016003)(76116006)(41300700001)(8936002)(64756008)(316002)(4326008)(54906003)(52536014)(66476007)(6916009)(66446008)(66556008)(5660300002)(66946007)(8676002)(2906002)(71200400001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iIswnw2O2DNdDShqY7nw0nCBwjzDLXWVKoH94+w1wJrA9AEei/EkOl4Qm+TW?=
 =?us-ascii?Q?QsICxLt6HmmKPtW0/hyEFMf0E5qlDcGyAsNKlHymg9CIHejQiOPJZNxgbfb8?=
 =?us-ascii?Q?S7KPzY8Jbz8HSH17HBZ5Z9aXGRGZAuPrWr7qZeo7XuB2E7OWrmlajD0v5iZG?=
 =?us-ascii?Q?PuH9zr6ti2BWmlrLk0ocOzAcB3zmLJYF3b0ISqF7V6JeWl8u+G7e5M/LuWEt?=
 =?us-ascii?Q?meelpHOBGPbyI/fKfuuxv/AY0SizGGsjkFdz1Z6pcn17XtVKsXcrrsW09E69?=
 =?us-ascii?Q?T9/GHQ65OOM1zOPPYQQHyBB0jVvAlV+OnXRLCAjIZGfHJ5XMsVuRp4mgSyKK?=
 =?us-ascii?Q?FdpC2PsvleYuT1TDR6L8sRbkNQ8ris67JIqhf18QB6ggSzx2UctSlveZg2Ur?=
 =?us-ascii?Q?hPppvPNTB9LElIv0pZgymcnmK9crZCCyRgndn9DzePAYmjwCWCKy7oCZx+cH?=
 =?us-ascii?Q?XR13slJ19Eqp21JjabyZx/FcsS3yIfDVU5z6eZXx+kREDjiSl4XQlrGQ8UP6?=
 =?us-ascii?Q?xdp8t2bAVhNYBHCCw8MZ2pgTRZlVSi3rzno07ZnXo1bPNIDm+whHVzK7yJdi?=
 =?us-ascii?Q?yqocdK7cYOJVD3a0ONYe/ZyKXfid4DaRIkbK2PvWrmP7VsOp6Fe/TeoomYYg?=
 =?us-ascii?Q?6Y+wURc8zHHWjM1lRGifCg1nR7yLxU7gG576+qQIojuNLnv9sFxSxT4ZF04d?=
 =?us-ascii?Q?7XnURlxyOML9yRIu8DVbYwI8RgyKM72LyrLrQ1321EqCKavtEDerEZWM086s?=
 =?us-ascii?Q?CMaVWb31srz1NOZDAjZ5rq/3LVLgx795ZaRwomKAcRrS/Yx9cNmqaYfRdVhA?=
 =?us-ascii?Q?t0RLMy5NghgAh0SVf57rMcxhChLmUlN7YsR3iscWBgW7nh4Dro0OMD+M+Aa2?=
 =?us-ascii?Q?Cx2BgqrV9/zcRxmwv7xpM7Q4nFqPgYHGZHXpCUmmTKoz7vltfSqjcErp7RcC?=
 =?us-ascii?Q?tgtZpibGsPbjUz2riMQ35756JlCO0vIz4Jz9rFx9+tjMeYiBkf19f2M/2CfC?=
 =?us-ascii?Q?WldVpaqBhmiBS+1LMGC9GZQI1MGqWmIA8yprW7LPicC7SW9dk7DcnNRJ2ASC?=
 =?us-ascii?Q?YexerZ+IBuGzZuazKRWeVcmN3unJpBJgapz/JoyXPTfNnca/7gJIGl04WH7F?=
 =?us-ascii?Q?+/qTd0sAOhMvR8KJL5P/sJxmj65B/uav4kzL6QR9dAH67WA9AgdXtlWQzYgU?=
 =?us-ascii?Q?nLvghDIUVYjIugQP79IbyAkIRyXnHod+hAf1Vm8J2vZZREx7I8eZKQy/0DIX?=
 =?us-ascii?Q?W0cnzemwKyGooh0ck8Ai/tqYSe5Pb7GSW6rWpl1oE2CIX8auz3IKH1SaCpoq?=
 =?us-ascii?Q?nle3Za+KFql96tlXcX0KoW1roXzpYrpIFcBKQaC0BcoxnAvs4atOT462T23B?=
 =?us-ascii?Q?AIjQYMY2FSbOn0B7VN2G5WI36wMKcDREl4XL/KTGgCKZnFCbBGU3sjMhf4Xr?=
 =?us-ascii?Q?e8adjnhNVrWAGiUMbikToVJSKlHy4IKigX4t/wI45wMPIfjnK+3KVk6Rr7UG?=
 =?us-ascii?Q?NknFgsuWjQAjFHMFcCYjs9g2wUDtlt8kz1lGqQVdrhSZpNvu0832WZHQrDzA?=
 =?us-ascii?Q?WgsZxpLV4YJ1g1SP4LvFYhHzDu3C402fyqGfL4LN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6347.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb0c28c-77a8-4833-283a-08dbad50a3ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 14:10:05.9976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bJEURBKMSFS3NcbffGf6fB3CB8c9Gt2TWQYXQ2cHo+KsK3slIkNLDsmnbUhkmKhog1yaBIcYoWzzMdrOiqgnDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7398
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Borah,
 Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Pe=
kka
> Paalanen
> Sent: Wednesday, August 30, 2023 6:30 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; dri-devel@lists.freedesktop.org; wayla=
nd-
> devel@lists.freedesktop.org
> Subject: Re: [RFC 02/33] drm: Add color operation structure
>=20
> On Tue, 29 Aug 2023 21:33:51 +0530
> Uma Shankar <uma.shankar@intel.com> wrote:
>=20
> > From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> >
> > Each Color Hardware block will be represented uniquely in the color
> > pipeline. Define the structure to represent the same.
> >
> > These color operations will form the building blocks of a color
> > pipeline which best represents the underlying Hardware. Color
> > operations can be re-arranged, substracted or added to create distinct
> > color pipelines to accurately describe the Hardware blocks present in
> > the display engine.
> >
> > Co-developed-by: Uma Shankar <uma.shankar@intel.com>
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > ---
> >  include/uapi/drm/drm_mode.h | 72
> > +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index ea1b639bcb28..882479f41745 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -943,6 +943,78 @@ struct hdr_output_metadata {
> >  	};
> >  };
> >
> > +/**
> > + * enum color_op_block
> > + *
> > + * Enums to identify hardware color blocks.
> > + *
> > + * @DRM_CB_PRE_CSC: LUT before the CTM unit
> > + * @DRM_CB_CSC: CTM hardware supporting 3x3 matrix
> > + * @DRM_CB_POST_CSC: LUT after the CTM unit
> > + * @DRM_CB_3D_LUT: LUT hardware with coefficients for all
> > + *                 color components
> > + * @DRM_CB_PRIVATE: Vendor specific hardware unit. Vendor
> > + *                  can expose a custom hardware by defining a
> > + *                  color operation block with this name as
> > + *                  identifier
>=20
> This naming scheme does not seem to work. It assumes a far too rigid pipe=
line,
> just like the old KMS property design. What if you have two other operati=
ons
> between PRE_CSC and CSC?
>=20
> What sense do PRE_CSC and POST_CSC make if you don't happen to have a CSC
> operation?

Sure, we can re-look at the naming. However, it will be good to define some=
 standard
operations common to all vendors and keep the rest as vendor private.

> What if a driver put POST_CSC before PRE_CSC in its pipeline?
>=20
> What if your CSC is actually a series of three independent operations, an=
d in
> addition you have PRE_CSC and POST_CSC?

We should try to standardized the operations as much as possible and leave =
rest as
vendor private. Current proposal allows us to do that.

> 3D_LUT is an operation category, not a name. The same could be said about
> private.

Sure, will fix this.

> Given that all these are also UAPI, do we also need protect old userspace=
 from
> seeing values it does not understand?

For the values userspace doesn't understand, it can ignore the blocks. We s=
hould ensure
that userspace always gets a clean state wrt color hardware state and no ba=
ggage from
another client should be there. With that there is no burden of disabling t=
hat particular
block will be there on an older userspace.

> > + */
> > +enum color_op_block {
> > +	DRM_CB_INVAL =3D -1,
> > +
> > +	DRM_CB_PRE_CSC =3D 0,
> > +	DRM_CB_CSC,
> > +	DRM_CB_POST_CSC,
> > +	DRM_CB_3D_LUT,
> > +
> > +	/* Any new generic hardware block can be updated here */
> > +
> > +	/*
> > +	 * PRIVATE is kept at 255 to make it future proof and leave
> > +	 * scope for any new addition
> > +	 */
> > +	DRM_CB_PRIVATE =3D 255,
> > +	DRM_CB_MAX =3D DRM_CB_PRIVATE,
> > +};
> > +
> > +/**
> > + * enum color_op_type
> > + *
> > + * These enums are to identify the mathematical operation that
> > + * a hardware block is capable of.
> > + * @CURVE_1D: It represents a one dimensional lookup table
> > + * @CURVE_3D: Represents lut value for each color component for 3d
> > +lut capable hardware
> > + * @MATRIX: It represents co-efficients for a CSC/CTM matrix hardware
> > + * @FIXED_FUNCTION: To enable and program any custom fixed function
> > +hardware unit  */ enum color_op_type {
> > +	CURVE_1D,
> > +	CURVE_3D,
> > +	MATRIX,
> > +	FIXED_FUNCTION,
>=20
> My assumption was that a color_op_type would clearly and uniquely define =
the
> mathematical model of the operation and the UABI structure of the paramet=
er
> blob. That means we need different values for uniform vs. exponentially v=
s.
> programmable distributed 1D LUT, etc.

In the hardware the LUTS are programmed as they are received from userspace=
.
So once the userspace gets to know the distribution of LUTS, segments, prec=
ision,
Number of lut samples, it can create the lut values to be programmed.

This information on the distribution of luts in the hardware can be extract=
ed by the
drm_color_lut_range structure which is exposed as blob in the hardware bloc=
k with
TYPE set as CURVE_1D.

> If there is a 1D curve with pre-programmed (fixed and named) curves, we n=
eed to
> enumerate all the curve types somehow. Probably each fixed curve type sho=
uld
> not be a different operation type, because that would explode the number =
of
> alternative pipelines.

Exposing the lut distribution with drm_color_lut_range would do this job.

> A 3D curve in my mind is a function {x,y,z} =3D f(t), while I suspect you=
 meant a 3D
> LUT which is a {x,y,z} =3D f(t,u,v) - a 3-vector field in three dimension=
al space.

Yes right, we can optimize and fine tune this.

> A matrix element could be with or without an offset vector I guess.
>=20
> FIXED_FUNCTION would need to be replaced with e.g. your example
> VENDORXXX_BT602_TO_BT2020 to work.
>
> Have I missed something, how did you intend this to work?

FIXED_FUNCTION is for some descriptive implementation. Some cases where
Hardware just have a bit to enable and rest of the implementation is within=
 hardware.
Since type is used for other general hardware blocks, its not intended to c=
over vendor
specific implementation and a private_flags are used instead.

Thanks Pekka for the feedback.

Regards,
Uma Shankar

>=20
>=20
> Thanks,
> pq
>=20
> > +};
> > +
> > +/**
> > + * @struct drm_color_op
> > + *
> > + * This structure is used to represent the capability of
> > + * individual color hardware blocks.
> > + *
> > + * @name: a standardized enum to identify the color hardware block
> > + * @type: The type of mathematical operation it can perform
> > + * @blob_id: Id pointing to a blob containing information about
> > + *          the hardware block which advertizes its capabilities
> > + *          to the userspace. It can be an optional field depending
> > + *          on the members "name" and "type".
> > + * @private_flags: This can be used to provide vendor specific hints
> > + *                 to user space
> > + */
> > +struct drm_color_op {
> > +	enum color_op_block name;
> > +	enum color_op_type type;
> > +	__u32 blob_id;
> > +	__u32 private_flags;
> > +};
> > +
> >  /**
> >   * DRM_MODE_PAGE_FLIP_EVENT
> >   *

