Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52748580BF0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 08:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4729113FB9;
	Tue, 26 Jul 2022 06:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE691113F86;
 Tue, 26 Jul 2022 06:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658818227; x=1690354227;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UrKWy6+YW8aTcRhtUXaUhKfIVu8dp5wnlYbxb2iRBwg=;
 b=JVdhx2d4tdWzpvW6afPV3K6gXWYZdxvu9Uk2khhzYdjD3yi78l6tcteB
 OJQ/PwIltfeGHqvdnMa56QZ+tBTZJBe7f5+qkMHJFoxpZZsRI9DKNlafV
 NQZVJdB6aTnEycSAo+SgEstgCfz2pDQ/dICiFxXyeSN7lzNll7aSQF/F5
 i8USbRZBddOnpCs7kbIo1VDaqGA4nWU8ZozHKRwoXgFqULVqc9CmkbU2X
 PEbS6zYTMO7EeZeAQUM7JV0jyM9K9a8MbCvkeuYjic/C3bpJPe5oBUGTo
 DwGBJ8DBmElEm4RUN0BedBqrPTDRnLzPyQGZJkE4mJHTCAbN9Sj5CTkkD A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="289065089"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="289065089"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 23:50:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="627774069"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga008.jf.intel.com with ESMTP; 25 Jul 2022 23:50:27 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 23:50:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 23:50:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 25 Jul 2022 23:50:26 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 25 Jul 2022 23:50:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKdkUYDhMpwYfrB/YeKabKTNUBiM76NBD6A3JHvN+QSv//YjMpp4R328UWdzKeDWx6sbdkTug4KSPvkpX/j2Z54Bi1U87mM+myylh4HULBP5tGy5r35KltyiDLqv0duq5cRNqLRD4zazfEXtW5ivGAd1CXKkqMMdnR+BQvPnO3iM3iDxA1zd+XJEDGuuBYKmF3Gz86Z0cXlu17In1DFTy7R2vf7kxp7oPEE1UTNhyM38O3rZbLSiDecBZXjoypexzApi+3ZKrrrPreZtiq9CQxDj/JNIv0YNe+gp8K6TleFPNruADKrkQxyzimaeoFM/KOo1wiApyGeJnVSC9bsQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrKWy6+YW8aTcRhtUXaUhKfIVu8dp5wnlYbxb2iRBwg=;
 b=HxQPlMg4TxeWD/cpuJbxKAK8eq4GJlo3DaA2zq+f3Mt+MaJ4Ahbbdii7j2VJW6C4aZC2YVROfYlR/S7SV7DqlaieUCzD0pbZB1S9qSh7zj23tAh8l8bVfwHapkm+f5Ax5w+FjHahz7y8uCU31xQd1L5efgkRmpAbmik/PyMG2LIVs1SXwIG3yZ6XtEmr0P14ErxZD7rL3OZVCGVL645wkjCZcjylAeOKTrYIljHGGsdJL9QG9QbNZR3XaLwoZJmR6cJBDtA/rQR4DpRRz3PcdtGF39mfnZ3RJikN/S7hHBs8KvEHz64LThZBiEYaSrc7TtZnhaT5rxYNpljgTclCEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 MWHPR11MB0013.namprd11.prod.outlook.com (2603:10b6:301:67::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.20; Tue, 26 Jul 2022 06:50:22 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::3546:7df4:c8d2:1152]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::3546:7df4:c8d2:1152%5]) with mapi id 15.20.5458.024; Tue, 26 Jul 2022
 06:50:22 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v6 4/4] drm/i915/fbdev: do not create fbdev if HPD is
 suspended
Thread-Topic: [PATCH v6 4/4] drm/i915/fbdev: do not create fbdev if HPD is
 suspended
Thread-Index: AQHYncnit7f/lYR5Dk2cYWkyNObnFq2QOmRQ
Date: Tue, 26 Jul 2022 06:50:22 +0000
Message-ID: <DM6PR11MB31771854BF6B7C900FCACD4BBA949@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20220722125143.1604709-1-andrzej.hajda@intel.com>
 <20220722125143.1604709-5-andrzej.hajda@intel.com>
In-Reply-To: <20220722125143.1604709-5-andrzej.hajda@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5fbc77b0-a727-46a5-c6e3-08da6ed31c88
x-ms-traffictypediagnostic: MWHPR11MB0013:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AKHRPHt6QlfYutnwGMVLlDn9BoPmsNpU6Ot2q3r7RNy0ZOxsETgZA2AxLiTDbg55isCB6o0h2TsAuebeJk8vWzkXrtOkBaJE4stC2Y3h9czpn8jeOq6adnV/pTTXTvDky279dYUQf/M+0TU9YGuNw0dwUwzLuw0+z0gmff6kTxro+vUroSEIh1k+ySnquDLrAiTpQEOjsajg+eOg9C+Sf6JXE4rQUzwzISTUhX/JoRHZoaGQILNOyxmn4ndM6aefBAIbQ7v40degmFnoNP2Nne3ZzpDCnLLii62Ps/OjmX5S7JFtMDZb/G5PRdYbGbNe9ToWS+fK/HMyMJL8d1653k1T+IbUJCg7AbrrTpl6u4rpi3XMpuJin6SKmFOUYnF9TRk/db9wKOpZ5RSS4FY5Y1aegMsigfuA3257zV7vi3JldIMCf/vrDXA0JOt52DbmD9NXmpsEXjeXfBlOJW+4k708SaD5+jYLyPF+9tTDVQC/MBNclH663a3xqMJMcBgiw8RBQAyPOhumtcrfhOiZCJWn3yTQwCp1gC2P1GH0MENCOVvQj7b32HLcfxBW5Lphp7ejX7sqxlPwOIfqB269+mVuRveRY3OF4eVBJLGLDKJPlJD+k/8/Uha5GmPRpDrcCfU0ucyo17CIX/dNf+rTU8xlNpEiaTpy4hJxo3alRSAFFWZ3pLpG7G3tdiR4ORpxtPxTEjaxwksByo0rWfe/+ahMRzWJdyAcKIz7RjNkXPMLpMNTqEbgsI1RAZKZbPg32sXrVsYNFHnu2o9TEiKMIN0+Y5i2U8WTeimLCk9bfZPE3WO6w8Gfnv28fwGOW6OG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(346002)(39860400002)(136003)(366004)(82960400001)(55016003)(122000001)(8936002)(66574015)(71200400001)(186003)(2906002)(52536014)(33656002)(86362001)(38100700002)(38070700005)(53546011)(55236004)(9686003)(26005)(4744005)(41300700001)(83380400001)(478600001)(6506007)(15650500001)(110136005)(64756008)(316002)(4326008)(66476007)(7696005)(8676002)(76116006)(66946007)(66556008)(66446008)(5660300002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?WkjF7Ypl3Bmzgv8FHOPBl5gHqcMZvDeZHHqZzf3RCgJ1grmxwPhXbEVr7d?=
 =?iso-8859-1?Q?GPb3S/CZEHkA2J1gH0EvrG+T6YPVCA2ms9f4hExIUr75gb06DLHopCXskH?=
 =?iso-8859-1?Q?h4CQWNhyyQraB6CfaMR4xQSji+G74/Dkd0cKnLy3Ov/RNzqA0J4KP4XcWq?=
 =?iso-8859-1?Q?2pOdoPeO+Dy/i0VQpLAIvGdEgqmmaZpnKMeea2qP6bR6IpaRfWNk/BPvRO?=
 =?iso-8859-1?Q?4cVr/c0/eMMv2seJdzN9Xnm8Dj0vNvHKQndNsaW48t1NwmHncg9PC2w09X?=
 =?iso-8859-1?Q?Q95nnERetfriH5eKms+RhfiyHUExoieES9T2aZ/CrI767v95vu0KV4BC3O?=
 =?iso-8859-1?Q?q2GfEspnPixhhaM1W5zqroueKFRSBoSP3PRW6VilLXj+K87gY8+v9t0jbY?=
 =?iso-8859-1?Q?tpv3sJJOGtEe0Ytr1cZc558iWPbiN/Qo0DdQRlB99DUGT4M5OGEn9iNdQZ?=
 =?iso-8859-1?Q?t2tpkQiqINhH7hU1XwRCi5LUpig/KRVnWAq/6j3okxNjY+eeBu6p2luI3h?=
 =?iso-8859-1?Q?dpf3XdW3voPBDjRGugTYVsCO4huU7O2sf/ZClIB1nYa88NfkShKAuUFlur?=
 =?iso-8859-1?Q?wm6CYd4f5e9wb2YKsS5/ww1VLVmX1O4i2pLwhOMZBTd/RqoFIZvr+WBZPc?=
 =?iso-8859-1?Q?IHnxmpwQQw83PELbnXsdhQv39CoviiymNCTIH7tU2ZOtuuu2b101jFyKew?=
 =?iso-8859-1?Q?JSog1kBQnnTWoE4lIbFgCZViuY5qtsJK3d7EGhtwSmgX0/EnLyQYSFMWGv?=
 =?iso-8859-1?Q?7TWfiHWR1hxu5ADRjxBMYsFIWoJa/iZcP8krc0LdwTbRtuFdZv0mESAB1f?=
 =?iso-8859-1?Q?8KePaWdRrkzYQYPsSrsL8gub2pSwRTt1f38E9Divr2gknvh+OEfjuKgQtc?=
 =?iso-8859-1?Q?iYHB5HYNPZsOvLi0hQ/D+SKHqdNSy/g08PTkK/F96I1VxUpjP/phY2vYxj?=
 =?iso-8859-1?Q?kmEsuIwe83zMaSIRnVs2geLiiK4JDQYCdytRr78/869Z1dzGD9eFJuJ7lP?=
 =?iso-8859-1?Q?0S0qoMYkgUP/4Fyef77O+Y7/9NajkMZt/x9HPrxhaO0KLE+17oev8LKJkp?=
 =?iso-8859-1?Q?lbX4DYkLty+B26aK7GOIMqzkF8CYbeGGEWopu0DMRCGp+j/XpprCmSb9v4?=
 =?iso-8859-1?Q?eW72D0yjrltzUi0enLA6sOawENjhpYNW9BiSMR4zXUBjECmEFGOrSCVzQ+?=
 =?iso-8859-1?Q?t0Y3GrtbB5P5vrMqbqOhWptmpbxbRg6RDt3ZAM3Qd3bS66IvrTymJbkXYx?=
 =?iso-8859-1?Q?Ww84MvtopV1oPoctXIikrfIYeLQYIs/yAndDsdhpRraLV0eg4L/2sAaZMh?=
 =?iso-8859-1?Q?sB0MJPOI3wwpxLmBf5mZYOx+tlhrYHKOMuRcCCpQ7esCL+ylUyAXdyhOrR?=
 =?iso-8859-1?Q?NIgTF7CJZMRW2cCJW39YyJVyaIVJb+Asi5r7waKHAH5KiWAtzYpczwOM/e?=
 =?iso-8859-1?Q?sR9J0UN6aq01snj3zuMsQ0VRCpOQGHu138lr69oCq8SBxUDgorGbawgeW/?=
 =?iso-8859-1?Q?akYI0rXJnK+t0+ttXRMHPy4IltHuCsi08wzaiz0NKDOOM7Z7H3pqXGCFN0?=
 =?iso-8859-1?Q?sZKjkSf26GdB/oBi4pDUCRA72q5ws7LNqNl/HFdD7kKVGccpHjZmTCXu7e?=
 =?iso-8859-1?Q?fLtn6BaE5wvNGU5w/alZNxGOtMgLJQCUnJ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbc77b0-a727-46a5-c6e3-08da6ed31c88
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 06:50:22.1914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mb/1s10ApU+5hYqQeS7Fh1g3zeuwPQ6O5BQOM1IcfQyKknI6p/n8VF4I2g3j5Mh8oPqNCbOqzK9HUZDND7IpRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0013
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Hajda, Andrzej <andrzej.hajda@intel.com>
> Sent: Friday, July 22, 2022 6:22 PM
> To: Jani Nikula <jani.nikula@linux.intel.com>; Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
> Cc: Hajda, Andrzej <andrzej.hajda@intel.com>; Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>=
;
> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; Daniel Vetter
> <daniel@ffwll.ch>; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Subject: [PATCH v6 4/4] drm/i915/fbdev: do not create fbdev if HPD is
> suspended
>=20
> In case of deferred FB setup core can try to create new framebuffer. Disa=
llow
> it if hpd_suspended flag is set.
>=20
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------
