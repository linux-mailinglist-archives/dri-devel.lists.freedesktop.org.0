Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 916A25B57D1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 12:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7191E10E34C;
	Mon, 12 Sep 2022 10:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A723F10E34C;
 Mon, 12 Sep 2022 10:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662977162; x=1694513162;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A+k1zdnfIUILSfZv59XdQVjB+YccXO1Lm6gi0maxWZY=;
 b=TfBEf0cTquId5U21CNvSQzQoEKATrH7ctoP/0+OJzQT0+NWidxDakCWO
 BvpkNgYQ3uLTnpyp3yNRAdIcIfoBhn6EUNXs5uOSSTPKJ2+Th6qhtmSCR
 oPdDI+AMCrJU5eQnHGXJP1imY8nFH1CPqr8MKYQjtSb3r12y3VsaswT20
 AygnM9QuwAqXAKsv12mulHUtNRoncWqX3w4SM9XSDPDymNRdA7l/Tu/3q
 zcoLkdevPdn2PrX+h6DDIdMfpeFHK8uJ7r9FF+Ax7D0eXyiK2Y2OO+tJS
 yhhlveEytvGEi0Sdbllpr6deauqEhN11DlUH/9MB2A0cUsNYp/5eog1+I w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="361780541"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="361780541"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 03:06:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="567108151"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 12 Sep 2022 03:06:01 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 12 Sep 2022 03:06:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 12 Sep 2022 03:06:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 12 Sep 2022 03:06:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 12 Sep 2022 03:06:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmuhOgqz6WqcgiJGnwVuImKRqO1OhAcCnfqR833klOIcsoCbxHMUl/0FbxDchRjF96dVUBHSGZG7zbs8BSqf7v6KGQvx2BpoO15rxAYSo8t7I8spUR+Rk77U7RyyT02yqMSaeiFaCJxJGZdkwLpHDIJPFBhlBDsFa4Zc2EzvyNBFR6JgX4mR5RskanOlwvkUPfP2rLgzl8ORGHeHTny+mITQL48STTYZvqmHRvjeCpOxJnO58B3ktdPDLOIgSefv4spRX5ek57xP6qEhOXcl2JXEs5zlsMHFFIkVjuyQNsyp0aIv3e0mCJclMGg7oxCh0COLo04QNQqNM5pLtOjznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvkbqgcHR5KmoY0EaO/nhzENMM+JukwV5o8ESgB2ALo=;
 b=DTHnfdejhupwG5o+V/wRwURvSLi8uok7YOttlhcGIImOvCBbbF0ertrhy8KeADHOnC8apYZBQv7dRp0x7lPqDeIbELxU/aD1zPVHQ57n4MpvawbOxCvTVXeshi6qpRJwv1rlfYLr4EPx6/p2RD1WsYbkxXFJRe1uQde4wXZ/KRj3otCyxehu7R3445Qo8HQjhM0F4h5ELS8XPFSyqryhNt1kpeGuYdCxmPy7cIjAqLSxu+PYejyM3m24iLCGxYtcyyWBiWhvpaA9YolnrAzPv8k34DLxz6Rb0IANBmS8K7t/RIhx0COERrmciUuiqzdZR4x/55h1tYYG/ZVGH4+q7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4093.namprd11.prod.outlook.com (2603:10b6:208:13f::21)
 by BL1PR11MB5509.namprd11.prod.outlook.com (2603:10b6:208:31f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Mon, 12 Sep
 2022 10:05:58 +0000
Received: from MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3]) by MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3%5]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 10:05:58 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v4 06/15] mei: pxp: support matching with a gfx discrete
 card
Thread-Topic: [PATCH v4 06/15] mei: pxp: support matching with a gfx discrete
 card
Thread-Index: AQHYw+F96fCkMiIHjkeCNF6nKqanGK3Wn5mAgAAGijCAAAWNAIAAAgHggAA18ICABLGtoA==
Date: Mon, 12 Sep 2022 10:05:58 +0000
Message-ID: <MN2PR11MB4093E71EE15A20770BD4F30DE5449@MN2PR11MB4093.namprd11.prod.outlook.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-7-daniele.ceraolospurio@intel.com>
 <YxraNUiyfH6NJiq5@kroah.com>
 <MN2PR11MB409318EA31363B2E749700FFE5439@MN2PR11MB4093.namprd11.prod.outlook.com>
 <YxrkWotjObH6zAca@kroah.com>
 <BY5PR11MB40869BEBCB65489E21A3F650E5439@BY5PR11MB4086.namprd11.prod.outlook.com>
 <YxsTR4spD5btac1/@kroah.com>
In-Reply-To: <YxsTR4spD5btac1/@kroah.com>
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
x-ms-traffictypediagnostic: MN2PR11MB4093:EE_|BL1PR11MB5509:EE_
x-ms-office365-filtering-correlation-id: 43b6e465-47b6-462e-5076-08da94a663cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e7Z1N9xa/RWkIWqX2PNe3aN5dF4Jy3sfNc1Lwwi3j74PZxs8+vABfRlTrcfcAN017TrqQGlY9juWHj7EZWv8qu5dVOnQYCrnCM74WzEQVpi+QCrKAks2cTY2HeLb7AmaNkVlZIkgQ8I+UOAPBXzYxaJm60VTVVWKDyf4UcM4iqXs1Uf99UhWyyNw2WdEAbxQmy5+tXxJCOdysl0WBSJzaDOw1IO66kK1i/CDFqxfaYocJoXTqgnf1bLxYWrOYxgZW/nawPd2bHX1pvr5ok6ZyUvdETVEfTBZccOnPvmr3Fch3WYfw0mhzoDSsfSHt1yu+4F1+jE+ogwGsKjGqFh1Ij5dbpNXRNyvZd4V04e7671O3mjVFhPB6HYtuyiHVobWUsx4RGFdJuH4+sVJuqenNZdXab+dN2gYMZoVfoAY9g+rsUjMB35piCaQAvR2NRizF6a35TZX4d+64gsHN4fZKtTqMuHfqozpeSMxKWgH65Ssg3dYXj9AgqYWflIHXyi4o0MrnJsBFuUvN+UEi6+S8xAKfLZlsKZ7Xf+V3nYEdCs9SyL6XD43nepo37Cbj+0i3IMHIw2S203Xkl5hLg5BKcUtq5eXJVHxSmGvsqX+nb9nPDYCpUWQVrjqi+VI3d0Lf7ZjyfMsBlm0FPeM9Wobkujs3isWwdZ4IKseW4J9fmZeB2bn4oGSjXUykUVJ1qBKH9011zF96LD/Oj8hspd5sRbXMHA4Ev/F5ccRDfYhumo2RV0ER/5jmBg60BtucG/BxQA5phhJAoobz68Zg9WDpcYjjZN/16ukvERV5HL2BdQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4093.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(376002)(366004)(346002)(39860400002)(6506007)(53546011)(186003)(7696005)(107886003)(38100700002)(122000001)(9686003)(26005)(41300700001)(82960400001)(33656002)(83380400001)(86362001)(76116006)(66946007)(38070700005)(8676002)(66446008)(54906003)(66476007)(66556008)(64756008)(6916009)(316002)(55016003)(52536014)(4326008)(5660300002)(8936002)(478600001)(71200400001)(966005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FkxgF9mz57cWs8vz1VyGwQlZlMHC3WW/DFmlV2dzkUtNS1/Eoznz0fQRGAF0?=
 =?us-ascii?Q?U83FI3SvRIUYRPIH9URkSTFwYoDywtbNuaNC7iAWxoaUv+jSuD6LNbbGVW4l?=
 =?us-ascii?Q?2psKk1TC/+FKdNSTUwgy4Ldh//0uafRfymknOJ3q5bJj7VJgR2xMZHTMzuNL?=
 =?us-ascii?Q?VaF6IUNGN9Cn92I0Lil5ZIzMfUH0po6AEd5MGuWRR9rj41qrBkgfLzSLY3Bp?=
 =?us-ascii?Q?ii5/FeWX85IAt1NvxEG/Xx+O3M++t4vRYcOoPJdK6UWx/0YhYVdswhma0dZM?=
 =?us-ascii?Q?6ifHwAeggYRMn22MMUAbErgS4b6z+3eK0PlAM4s0zisvIHToe96KqeOxD7qV?=
 =?us-ascii?Q?GXVcQDSi8AVrtOdN6PiyPYLp0PaFvpO0YwllVPj+w64JsvGIx+Jp1hDaUTDo?=
 =?us-ascii?Q?yrZIirxWEEPQzfTPT2wgeTA6PlaPBsIn25d1dYm7XvsuY27f8MIWpj258kQz?=
 =?us-ascii?Q?+l2WJ/CCPu2A7I287yOU17PsPLWK+vOga2arp+cKI34sYK0tau+Pufq1bvEi?=
 =?us-ascii?Q?blNJOOsd151qaRHuqin8P37KcgLwYyJK4IzzaubOcIo2cQ29jmKbjo3az59y?=
 =?us-ascii?Q?zf5efEHr8ilEd6FyJiv7UakpNltIU8X9wa6R8L9tV0ody+ZkeGJsfS7diPoQ?=
 =?us-ascii?Q?RmBRsxPI2AKYieG7O27nsO8eoBkQQkVr11RupAZfwd+oPEKPe4ZsKjfCLfTY?=
 =?us-ascii?Q?m+uTYXUR5lpFeD66xqwWJPZIb4T759TEKhEIAyms/yWImALKKrda5B2BBPt7?=
 =?us-ascii?Q?nAj6j2c6RfYWw3fy/xp8ungPNq9fvzJwtYfgMFit3H0GzaVsf/MojA066+Mr?=
 =?us-ascii?Q?SozO0J+1z+B/1NIsv9ZRESTQE4xp+cUx25iAvstUwgZHj02YsvZCd45o4Xwd?=
 =?us-ascii?Q?Y2tUEqi5AtLGo8Fhw8W5qNLyHCHtEDbkElNqx9p1pDLh2Xre+3oTjzraBzIH?=
 =?us-ascii?Q?Go5Zs/UrKnRwa3xPTXWsFiu3CA7IpQCuBI0uX+oQXXQj/8M2sed5Yu6vaofk?=
 =?us-ascii?Q?a6FHTWvxznVnhdvacXuVDw3oL8t65fseni+MpJB9Re58lFfJwcQkJUdB98Ei?=
 =?us-ascii?Q?O7yoX8tLxdD3XQizUKvuZEjOnJTLB3I3p6Xi8p/UWYMNB3+VPXF03cz726fK?=
 =?us-ascii?Q?S7NLrntc0K4qm/DA/jUTNmMM39UJg+FXCE1mP3EmnFumrQ8e1rAGB+bYBtBF?=
 =?us-ascii?Q?vSw+LvV+X+ZlyW+Jv/mvlFm5c+g/k1EAOS3vo8FbqBRRw+T1tnS3x7WuYAXh?=
 =?us-ascii?Q?O0SE+mR4gPIXPFjcgy6Duk0qOTWudS1U+aZ91jnxTQoF7Yo0Txzmqy/UdSwn?=
 =?us-ascii?Q?hk+cnPCvdQ5y8cIjU3doqGjeer89KjN68tRawzQxV1hEqgg9X+xwzty0H6yr?=
 =?us-ascii?Q?vHpM6VajTVzrP5JdYvqGELp/2vMHxhmOoGY6l5vPlQubV1yLACEwauEA3mn3?=
 =?us-ascii?Q?VMWzMOtHciecdRV4X1hVHVB6sH/tY1lGA2K1VN9tuYZr4Jpq19Bfz/Cl+55v?=
 =?us-ascii?Q?Q1yaYyrJP/xgmHJy3RgQ8/a8HOTv+XXN6JJF+MZyWO9cB928HihPAycPBwAR?=
 =?us-ascii?Q?W3y3oyjo/ClUvI7XeYJoSyKOgPf9loa5aNSaquWc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b6e465-47b6-462e-5076-08da94a663cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 10:05:58.6006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tnoHe9l3IIbuSD3vkjc5gFUiA2hFgkHI2v2CXPvPPamBOOn/BoZRrykt6tvac2gdphNmv14bE+0n5sb+v3ND2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5509
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
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Teres Alexis,
 Alan Previn" <alan.previn.teres.alexis@intel.com>, "Lubart, 
 Vitaly" <vitaly.lubart@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> card
>=20
> On Fri, Sep 09, 2022 at 09:21:30AM +0000, Winkler, Tomas wrote:
> > > >
> > > > > -----Original Message-----
> > > > > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > Sent: Friday, September 09, 2022 09:16
> > > > > To: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> > > > > Cc: intel-gfx@lists.freedesktop.org;
> > > > > dri-devel@lists.freedesktop.org; Winkler, Tomas
> > > > > <tomas.winkler@intel.com>; Lubart, Vitaly
> > > > > <vitaly.lubart@intel.com>; Teres Alexis, Alan Previn
> > > > > <alan.previn.teres.alexis@intel.com>
> > > > > Subject: Re: [PATCH v4 06/15] mei: pxp: support matching with a
> > > > > gfx discrete card
> > > > >
> > > > > On Thu, Sep 08, 2022 at 05:16:03PM -0700, Daniele Ceraolo Spurio
> wrote:
> > > > > > From: Tomas Winkler <tomas.winkler@intel.com>
> > > > > >
> > > > > > With on-boards graphics card, both i915 and MEI are in the
> > > > > > same device hierarchy with the same parent, while for discrete
> > > > > > gfx card the MEI is its child device.
> > > > > > Adjust the match function for that scenario by matching MEI
> > > > > > parent device with i915.
> > > > > >
> > > > > > V2:
> > > > > >  1. More detailed commit message  2. Check for dev is not null
> > > > > > before it is accessed.
> > > > > >
> > > > > > Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> > > > > > Signed-off-by: Daniele Ceraolo Spurio
> > > > > > <daniele.ceraolospurio@intel.com>
> > > > > > Cc: Vitaly Lubart <vitaly.lubart@intel.com>
> > > > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > > Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > > > > ---
> > > > > >  drivers/misc/mei/pxp/mei_pxp.c | 13 ++++++++++---
> > > > > >  1 file changed, 10 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/misc/mei/pxp/mei_pxp.c
> > > > > > b/drivers/misc/mei/pxp/mei_pxp.c index
> > > > > > 17c5d201603f..afc047627800
> > > > > > 100644
> > > > > > --- a/drivers/misc/mei/pxp/mei_pxp.c
> > > > > > +++ b/drivers/misc/mei/pxp/mei_pxp.c
> > > > > > @@ -159,17 +159,24 @@ static int
> > > > > > mei_pxp_component_match(struct
> > > > > device
> > > > > > *dev, int subcomponent,  {
> > > > > >  	struct device *base =3D data;
> > > > > >
> > > > > > +	if (!dev)
> > > > > > +		return 0;
> > > > >
> > > > > How can that happen?
> > > > >
> > > > > > +
> > > > > >  	if (!dev->driver || strcmp(dev->driver->name, "i915") ||
> > > > >
> > > > > That's crazy to assume, but whatever :(
> > > > Explained here:
> > > > https://lore.kernel.org/all/20220418175932.1809770-2-
> > > wonchung@google.c
> > > > om/
> > >
> > > Still crazy :(
> > >
> > > >
> > > > >
> > > > > >  	    subcomponent !=3D I915_COMPONENT_PXP)
> > > > > >  		return 0;
> > > > > >
> > > > > >  	base =3D base->parent;
> > > > > > -	if (!base)
> > > > > > +	if (!base) /* mei device */
> > > > >
> > > > > Why does this mean that?
> > > > >
> > > > > Where is that documented?
> > > > >
> > > > > >  		return 0;
> > > > > >
> > > > > > -	base =3D base->parent;
> > > > > > -	dev =3D dev->parent;
> > > > > > +	base =3D base->parent; /* pci device */
> > > > >
> > > > > Again, why is this the case?
> > > > >
> > > > > > +	/* for dgfx */
> > > > > > +	if (base && dev =3D=3D base)
> > > > > > +		return 1;
> > > > > >
> > > > > > +	/* for pch */
> > > > > > +	dev =3D dev->parent;
> > > > >
> > > > > You are digging through a random device tree and assuming that
> > > > > you
> > > "know"
> > > > > what the topology is going to be, that feels very very fragile
> > > > > and ripe for problems going forward.
> > > >
> > > > I don't think it is random.
> > >
> > > Today it is one specific way, but how do you know this always will
> > > be this way?
> > >
> > > > > How do you ensure that this really is they way the tree is for
> > > > > ALL
> > > systems?
> > > >
> > > > Yes we take the topology assumption in PCI hierarchy.
> > > > There is a case where both GFX and MEI are in PCH and you cannot
> > > > stick
> > > additional PCI extender or anything else there.
> > > > And case where MEI is child on a standalone graphics card this is
> > > > set in software so topology is not going to change unless we
> > > > rewrite
> > > everything.  Be happy to hear your insights.
> > >
> > > This is ripe to break in the future if someone makes a differently
> > > structured device as there is nothing forcing the current layout to
> > > always be this way by hardware designers.
> > >
> > > The goal of the driver model is to NOT have these types of
> > > hard-coded topology assumptions because, supprise, assumptions like
> > > this have always come back to bite people in the end.
> > >
> > > This is your driver, so that's fine, but really this feels very very
> > > wrong and you will have a hard time guaranteeing that this will
> > > always be this way for the next 20+ years of hardware designs.  So
> > > why not do it properly from the beginning and pass in the correct
> pointers to different places?
> > >
> > > There is a very good reason that the driver model/core does not make
> > > it easy to determine what type of device a 'struct device *' is,
> > > because you shouldn't have to rely on that type of thing ever.  You
> > > are taking it one step further and just assuming that you know what
> > > the type is here, with no real way to ensure that this is the case.
> > >
> > > In short, this feels like a very bad design as it is very fragile.
> >
> > I believe I understand your concern but I would need to invent another
> > addressing scheme to associate hw components that are already
> > addressable by let say PCI hierarchy.  We've changed two subsystems
> > for this work components and aux bus already.  So let's have some fun i=
n
> the future.
>=20
> Why are you trying to reach across subsystems in the first place?  Why is=
 that
> needed at all and why doesn't MEI just provide a generic way to do this f=
or
> any bus type, it shouldn't require any specific topology from what I can
> determine.
>=20
> What am I missing here?

MEI on PCH is hardware-wise  associated with the on-board GFX.  And MEI on =
GFX standalone card is  hardware-wise  associated with that GFX card instan=
ce.
We need to couple MEI with correct GFX instance. So it is either sibling on=
 PCH case or a parent device in standalone case.

Thanks
Tomas



>=20
> thanks,
>=20
> greg k-h
