Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C775F676B5C
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 07:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC6310E164;
	Sun, 22 Jan 2023 06:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31C910E164;
 Sun, 22 Jan 2023 06:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674370648; x=1705906648;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mw2a+LFsNSAQPVOcaGYUv105B7npN/15QsHKOlaxrGo=;
 b=J12x1XI5AIx253+2NKYUUnw/1nFdoZYOqBT9DfMrF8fJ6W8HGIjypspe
 e1D7jPzEA/+vf9m1QW4ILmURlYjzgOoiq8sr3lYjWDd99SopGneJEN6Sv
 VaO0Y31cp9q9B5A4qnfUSGS6yO6zY32luzju82wTZGRaRkodvMEsUGPh8
 4w8/ASvbSasUGQ90SpCmpTthQ6lrky7xzk+XOesDzNxDx5CdUZUGcFbFB
 kcqb933CENZfkzb0hvjLdS7NBrQlQpQaFWla88B5yiHpLREKVSeGXXxBC
 59MI+5GDHdyqU1p0FbI+Ry+u2peTIm6L9rO0xaDo8XQUQhdvMlT2+TSaK w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="309446148"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; d="scan'208";a="309446148"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2023 22:57:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="769211684"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; d="scan'208";a="769211684"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 21 Jan 2023 22:57:27 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 21 Jan 2023 22:57:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 21 Jan 2023 22:57:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sat, 21 Jan 2023 22:57:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sat, 21 Jan 2023 22:57:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOHa7dbuFBjUKXxZ9Cxt1LQolczamXyuvUtOoNDzU2LQYIUIG8Hhl+4aehvj2lNdsx5Gdx24GgJcGsQnuEH7o4xP5SbjbWCJw9Puu43cjIWV5ELQ0PK2RoNF1dvnIcajmQiX2f6DlS1xnWejeKr5oUZxeYTecDkxKS/gw8/rKCWtIxyIiTHIiTn/RHhnNmDUUN5/JPhb4ZQ6Gv2LftJSFeWxXgWb/8IqkZGHl6P+iXZpXWC/PibvpTTmekIOOm4sxA8t8lTsje7zjciZlt5p1C+VORdkhK6jOXSBd1looDKd+I+p/UBt2h7o1mTKnlKJW9GKGysVXplP+IF5ichMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WafH7ieG/pTCP/VXOImbj9Ty5Km0oCOiqLid/X39S/I=;
 b=j3AhyYOFEANIshLfCLaAow9eeE9os8UQvPCMqpO5qPnBTwrwjmcnkPY2VZApywPNM1N80BLGoLF19vLjrYO0Jdn+JfqPgLzF86Nz23XINAlhzRt0Yb4z2pX68a2RduVfEPdl6GrlGK+sk6NBPkZDvcESzdRYu2y61dzcfSe6OGAX+eOHLAb9Xnjg+c0TGsH0D+XBZuQwhAtTZegyXfUagEgFJosHI68BpD9itz1k3BKFvHjc+mx4LHigJ1bWQN/BXdB9onFuU/p638sXLhc42H2G/woZz+FnXuecM/KszEfHDAGkxYGUJ1Xt+RbLAnbiCKLbuPW2FKHfQgoFb4ivYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.31; Sun, 22 Jan
 2023 06:57:24 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::4b3:1ff:221:2525]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::4b3:1ff:221:2525%5]) with mapi id 15.20.6002.027; Sun, 22 Jan 2023
 06:57:24 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>
Subject: RE: [Intel-gfx] [PATCH v5 2/6] drm/i915/pxp: add device link between
 i915 and mei_pxp
Thread-Topic: [Intel-gfx] [PATCH v5 2/6] drm/i915/pxp: add device link between
 i915 and mei_pxp
Thread-Index: AQHZJu0FbNfcX0rHKk+hbojIPyvvM66mKaUAgAPkKwA=
Date: Sun, 22 Jan 2023 06:57:24 +0000
Message-ID: <CY5PR11MB63660409E141F1D0E65A9B95EDCB9@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
 <20230113011850.1463965-3-alan.previn.teres.alexis@intel.com>
 <Y8mZGMjjlTW3U0jA@intel.com>
In-Reply-To: <Y8mZGMjjlTW3U0jA@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|MW3PR11MB4523:EE_
x-ms-office365-filtering-correlation-id: cc5ed95a-4162-49a9-6388-08dafc45ea5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yPYB+8jkrA5ECprjniHKzZ/6uLbYUWOZifNAxbRrh49MbuVsJBJBnrhGNZV0xWBP78PaLLu3hTyPrdp0q4wIJuzptyt99+D9JlCw+oXsvX3Mpd9kApQosbWzI9oWiYS2m5VH8GZ2u91j7zEcq8q5lgHFJOaAblMAUEVSidqisbLm2io5QFUAscZVXpDx3fESd4PFwC4DpTd88aXzhHqZgI5RRauL1VmIShWXXrGhruPwyEH4KJO9KvRKLhrpQtm/8RiJ+xutoqKw3dnrN7ACE99wqEFHG+FJkvRuGlOMxKkIwFWm6rrA11Fy0JWNr7LVYL/Xh54f8UW6acRUlZoeJdQ/mzSigZISNxTXHJcawIda60fAkZ3VeaDeTWXqSrhoBDXJOYeRvfUOcBtQk83b7ijAamra1hW96+Usz//7ecOpzeym/yojD2RK19kaLjA45hmo3J2oW3zF3rF7DIcJsdOUPORmhyqAIRt2gRnY5Qlb1QSuORIW4O24WBvhyUoTBOn4vA7bnlru5g1RJiKAdgxFJYaJ5TZxwY3j/6F+nYRpC3/+Elk22vrkNkhrVy3aUvlG6bCn/kRp12PqdfqXMj0PZSHf0xDrPPp2M43lPXK+P8nbs28ovYpqeDT7dZKx/aBWFnHgPx8oIf+fGh8L597DcWnfoZknV59ki8B9qkirIjnfciZJeRgbuwOssTtCmG0LFbWWjo0TVmq2G+wJXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199015)(38070700005)(86362001)(55016003)(66946007)(66556008)(66446008)(64756008)(8676002)(66476007)(4326008)(76116006)(5660300002)(2906002)(8936002)(38100700002)(122000001)(82960400001)(33656002)(71200400001)(478600001)(7696005)(107886003)(110136005)(316002)(54906003)(6636002)(52536014)(41300700001)(9686003)(186003)(26005)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?02c/zn6hD3k0NU/L+ZC6lO7dp36C2hQ/3OD5VdlAhDN2zowfmYKqfiQJtF1/?=
 =?us-ascii?Q?uysPe7dIkVHrXh32GEJ154wFvsTbYfJBxnOdOnm3LTo/9/UmB/tNYdxgnfYt?=
 =?us-ascii?Q?Gl/Xqi+MgWFSegTtp30LKRkQn+VfNj/G9NgZIDIua8ca7ouNE1D2/5Ud6kQI?=
 =?us-ascii?Q?p/xooX61Ir4sKqa5FSOOxYVdowTmR8th/2C91PWepQ+iwgL58wIVELB5Bb8K?=
 =?us-ascii?Q?dIrBxhwLFYa0c4sLk1KF6f3W9rtfh8tKYuFxk2qNQ2WVrshQtirQj7n4SNqe?=
 =?us-ascii?Q?KtopP6R78dWjK94tBMjCC08dtcK1m7xzrELni+bqkmg0z8cGVUUsfJLeFoT6?=
 =?us-ascii?Q?Ps1aHLe4bCFK1KdQGLquYBy9H/w20LulnqwcRJpXualeHSQvI7bJ0dTaEw8p?=
 =?us-ascii?Q?IDES3CE3CAzgNjb3uUJr4TQFKPTlFG4KgICw/0WCHf1YjGIg4RRz+xe/DGDP?=
 =?us-ascii?Q?hyvg6u0jOjfiO6s6dl9HmAlOR4sC/NqUXzR47uSM+r0ZFUlcodkhfUdhKfCs?=
 =?us-ascii?Q?th4sfXSxfQcug77ukZosrWYsW85l/OwE5E8YqqLkRI1ePEprBYhHqibJjAI8?=
 =?us-ascii?Q?i87K9fL6XbvABXx4yW2DNcLP4Bmjuac6JcO/0mnFxo0uGGoXH0d2dxwQILUw?=
 =?us-ascii?Q?ir4o4AJgcTdCseP0cziqVZ6O3AMX/vGD/Wyn3NgfgehJ4evkz9ohb+anaIhJ?=
 =?us-ascii?Q?z3JbqeyT/UNEW9eyNvL/EuD3aeRVt0t+elwCA1CAL3yRpDC9KeHbNDLgjqJB?=
 =?us-ascii?Q?FFqEZTBeoYIXzGaJUHmduYp3faRIpS99R2flFrMrrhSc5umUXwoNCPp1p6ua?=
 =?us-ascii?Q?/ibMlNy1jFH7re0cU+cRN9ZAfkByc/IVP73HslpQ7u833N+BF0HKsY3XYlJv?=
 =?us-ascii?Q?T1GAu8j4f9SS/T7kHyPO5ko44x77KGO9n2R0TkOrYp461YoZuNkEazcunK04?=
 =?us-ascii?Q?G1l68PX43wsxno/R9S3T34A8FoFffu0m2ITGVdYOJpHma/A3nU4yhoe/Xfj/?=
 =?us-ascii?Q?zEXJCtRSwx/nvegRTETqAC3cD3DueoH36honEAFSuKgK9Hw1niHxdy9r5NWq?=
 =?us-ascii?Q?jhc77TGm9ygFYmQ5fVKil/qvTEUloIr4DZ28W0mKIqg6L5dc+NHtUEkJuO50?=
 =?us-ascii?Q?t+mf/8gizjM42CfIMSEfHyrBcKi80sjJh70zKPPMp/geKBc5I1AdgPKvbkt8?=
 =?us-ascii?Q?RohkYemZdUxWrSZmUlI+Qc9SQeVB2cw8eL1IRhK9vwaOuw/N99hemfQgEMU9?=
 =?us-ascii?Q?xjmrXB1fD5+uM4FfK3S5Ni8b/lgcv1QQt5hTgAf14wmppertcpbqf+LkK0TN?=
 =?us-ascii?Q?d27NKijWDqoVFESTvKCl+SSY82T1DFOm1RuVpliymcfwbN9Rvz0e/TDqXYMe?=
 =?us-ascii?Q?M4Fqia4pDiTtCdzj6vq5u/UyYvDCt761yWlQGODAX7TeuU7GodhnxZF3ANUr?=
 =?us-ascii?Q?ZvOpdZRxumttJQt06T8pvXLMEWxgAZ6+xK7hsy3P8Dcopudmb8zYTl8ZRygo?=
 =?us-ascii?Q?6+ejOCop2b8T/FICCd3YF6tGSYeQv30NJmTXI7I/KSply/5oGhxABbOX7ItV?=
 =?us-ascii?Q?RVdOPJvWCPrbTcncg+r6sRblRsX+Nzm5njooJTpfWZcJjbP2f89ybALNo5FN?=
 =?us-ascii?Q?Bw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5ed95a-4162-49a9-6388-08dafc45ea5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2023 06:57:24.1253 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FWYZBg7SASOgsMbWEzaSdzYmmya1YUm12q0PiLHeByi99bL1Vt8B1h9EqNEtp9dYS2R3KthQsUMTDW9mxOHOFCNPrduzXbFgl7BecPFS7EY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4523
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>,
 "Vivi@freedesktop.org" <Vivi@freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> > index d50354bfb993..bef6d7f8ac55 100644
> > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> > @@ -127,6 +127,10 @@ static int i915_pxp_tee_component_bind(struct
> device *i915_kdev,
> >  	intel_wakeref_t wakeref;
> >  	int ret =3D 0;
> >
> > +	if (!HAS_HECI_PXP(i915) &&
> > +	    drm_WARN_ON(&i915->drm, !device_link_add(i915_kdev,
> tee_kdev,
>=20
> I don't like the action here hidden behind the drm_WARN_ON.
> Please notice that almost every use of this and other helpers like
> this expect the param as a failure. Not an actual action. So,
> most of lazy readers like me might ignore that the main function
> is actually a param inside  this warn condition.
>=20
Honestly, copy-pasted from drivers/gpu/drm/i915/display/intel_audio.c +1266
I don't have deep knowledge of drm macros, so thought this should be ok.
Can make it any other form that acceptable in drm tree...

> We should probably stash the link as well...
>=20
> pxp->dev_link =3D device_link_add(i915_kdev, tee_kdev,...);
>=20
> so in the end below, instead of checking the HAS_HECI_PXP again
> and use the remove version you check the dev_link and use the del
> function.
>=20
> something like:
>=20
> if (pxp->dev_link)
>    device_link_del(pxp->dev_link);
>=20
Not sure that this simplification warrants additional clutter in struct.

> Also, do you really need the WARN to see the stack when this happens
> or you already know the callers?
> Why not a simple drm_error msg?
>=20
> if (!HAS_HECI_PXP(i915) {
> 	pxp->dev_link =3D device_link_add(i915_kdev, tee_kdev,...);
> 	if (!pxp->dev_link) {
> 	   drm_error();
> 	   return -ESOMETHING;
>=20
> >  DL_FLAG_STATELESS)))
>=20
> do we need the RPM in sync as well?
> I mean:
>=20
> DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)))
>=20
> ?

No, the mei device should not be active all the time when i915 is active, o=
nly when pxp requires it.

>=20
> > +		return -ENOMEM;
>=20
> why ENOMEM?
Copy-paste from i915 audio.

>=20
> > +
> >  	mutex_lock(&pxp->tee_mutex);
> >  	pxp->pxp_component =3D data;
> >  	pxp->pxp_component->tee_dev =3D tee_kdev;
> > @@ -169,6 +173,9 @@ static void i915_pxp_tee_component_unbind(struct
> device *i915_kdev,
> >  	mutex_lock(&pxp->tee_mutex);
> >  	pxp->pxp_component =3D NULL;
> >  	mutex_unlock(&pxp->tee_mutex);
> > +
> > +	if (!HAS_HECI_PXP(i915))
> > +		device_link_remove(i915_kdev, tee_kdev);
> >  }
> >
> >  static const struct component_ops i915_pxp_tee_component_ops =3D {
> > --
> > 2.39.0
> >
