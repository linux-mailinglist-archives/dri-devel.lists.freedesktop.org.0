Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA2C5B2F21
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 08:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD8710E518;
	Fri,  9 Sep 2022 06:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1728810E422;
 Fri,  9 Sep 2022 06:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662705517; x=1694241517;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DzdNFGFCGzwS2TpQzwRgwG0nQUjZjuJnJlGiLxwOB78=;
 b=Bi0wy75NjtACr++WuyB2NnRR1rEJmv7BB+P3wF3O9was+FIp/VvPerCo
 CjJyL99zIqtsg/C+FpzlNQiq5WXuyPqn9lsBV+HXiOcexJSioPi13HjDU
 L0xUxPcCD6sxQPi2tBeSVfq6xEDfezgHDdcw4DUE43lQcRY18wnuc6x5v
 8bHemNOUromyccQXcWL0yVCR1WUCyvGMXJbgiR39u4NohO+3AmcSGBMfE
 ZyMm6WxQk0MZ1aPG5v8wwBoyNVobm2oPnMFLFNRLfRm9wr34cFhh3MvT0
 owEwKEjMPUo7Xt2fBCtaoZ7Hxnxbtq/x9meigMayuB/zj+SgGKgLvdWwe A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="298748184"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="298748184"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 23:38:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="757498149"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2022 23:38:36 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 23:38:35 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 23:38:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 23:38:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 23:38:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/DhsAqNiURvdI4KpEMuCrTzPNKe7e6Iaqy/DVHdZigtgyJ9m+xDBCy5p+5FWMofGxDb3tz4AXhRZD74kTg2WgV7GUQCeG0FGNczgm83RNUWDCBtMV2nlXF1zFipkSPasBfcIj2CP7B+LTneLbcQ2gqggvFZs2cvpeAWI2mbztp2vXws+WLso3nTtCMdvvX6Bf4rpGTxLCqescMQDndSa7PlpIBJCu5JqnYUYeaaedbfDvBCgSO/hhRrmR/2z+zwH/bakWVBW/iSRcdiUcL8uYW5LHdGZQaWNoTXrMAb7POtThxl4vxzT+HfMvmwlh4zKruetJouaO7cbQeobmkIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNYa9zXnHxFJqtSZrhbLyYpA/XPrXS7ViMQ3Eq8WGgE=;
 b=OfqVPvlSVQnh4hvZAIqe9s1muGelGudoVKn/7Yqb2XVPPzY4fxAfp66WX+GjOT/WK1ucSmcvL99S7gRKBuOw3Um83LYXEpXoykqoXTXzrw3RFG3mBj330M2BtwW7dDQOit6r8RNZ8OIoE97tVngkf++ozWrm/5HcCTN4nTV4++ZLEBqbx9lko8h7iyd8xmHht/qyigyMQ0zCYBhH5mTmGOynD9rtvcyD31TD7mdTDyM55sIV8hJsBiZMcCj2t7iFvEOypvI3oSkgpmYQFvQGkKRDM6O7HggvD4mv6w6wy6Ra8C01GYRVWgCPRoqeDwBaIhi76sBucgSGlxV2kkRbSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4093.namprd11.prod.outlook.com (2603:10b6:208:13f::21)
 by DM4PR11MB5375.namprd11.prod.outlook.com (2603:10b6:5:396::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 06:38:33 +0000
Received: from MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3]) by MN2PR11MB4093.namprd11.prod.outlook.com
 ([fe80::f18d:2e17:c60e:5aa3%5]) with mapi id 15.20.5588.023; Fri, 9 Sep 2022
 06:38:33 +0000
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v4 05/15] mei: pxp: add command streamer API to the PXP
 driver
Thread-Topic: [PATCH v4 05/15] mei: pxp: add command streamer API to the PXP
 driver
Thread-Index: AQHYw+F5lxpIc4tF1UiCpESP2c97qK3WnvKAgAAE1pA=
Date: Fri, 9 Sep 2022 06:38:33 +0000
Message-ID: <MN2PR11MB409371E657AFC2777F8BEF0BE5439@MN2PR11MB4093.namprd11.prod.outlook.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-6-daniele.ceraolospurio@intel.com>
 <YxrZqW2l7cNF5OTI@kroah.com>
In-Reply-To: <YxrZqW2l7cNF5OTI@kroah.com>
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
x-ms-office365-filtering-correlation-id: ebee7626-e18c-41a2-83a7-08da922dea81
x-ms-traffictypediagnostic: DM4PR11MB5375:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jL7rCJpENNMQb4GA0UIoiA1/aYDx2uewtUisouOvQ7eu1b7rwqTOo/7m1+p0JcRkUZojgE5R0q/3nTC31PyLwbQKe0lPcp/DRil3S3F5mCCN/Y9jcvwgYgC1qLbA+J1q30QcDqO3W72yQXXtFBp/ULe+pN4tW+3DJNOB3375Ga1iusoz2EB5WjvLIxK5JSqdC7nrccXu+D7eNmSvYUxmKrZJliDa9XZKsVF36PfcPon1MJTbJCq8CVbypIe8QRQbPoCX7uPcXiJ08hd6aJVx1s/xbfA07Uf6PDf9Hc7I5d6jQqFV5WJv3Mv0fE+X9HA84cpEpOBT9W+R4oQo0Y/d+M/IIBKS5KfQuCNdoi2gsPLahHwk3LwbduZlNOnAKvhLwrYb4r5RLxbLIv409U8Sa+K6TnWdN69h6U5sFvvAqTDM3+jOHSJ6Aw2YJtb5CZd30wo1FF8VwL9pXdf8O1n0jy8o5Bpg04wWyw1L+vw+7iL7euKhGXzE0F6Djt3Jk6+qEE5eOmvq8JDD8QuluIwrEvaVOk1UODzpMvVNUK5R4lvcJBcJ69C+3ylmwXgqIkmb33Yuy6VkzihrCjMVdhM/C7i+6j86qtGvUQdJH8ZyARL7HHwicPT0BqeaJ1M301n39AthJ8QH8gTr0TI7mvgQ3jYD9thHDBXsMY8zclAVMg4VdgDhoISX39qTRwkyahoxMlyNv3e0cgRzdGdvmqiaMMZGim+KRyodDhA2hCvycJ4Ed+jIOl5TwOB50u9VSMxpUgfNC/T9gSdhPwfCubovtQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4093.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(346002)(376002)(39860400002)(136003)(38070700005)(186003)(83380400001)(38100700002)(122000001)(86362001)(82960400001)(76116006)(110136005)(5660300002)(8936002)(54906003)(6636002)(71200400001)(52536014)(33656002)(316002)(66556008)(66476007)(66946007)(4326008)(8676002)(55016003)(64756008)(66446008)(7696005)(6506007)(9686003)(107886003)(26005)(2906002)(478600001)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/ZXVgXvLECoRSdbBHuMjM/gaH3RbYYT3fQ6FcLi+3vzca/uGjl0UIGnw7FEj?=
 =?us-ascii?Q?YgINrCB54impFvH3b9BOX5MSE3QH1yWSsPqdpqZk1zaD8GYGWPkfB0ZxYkhf?=
 =?us-ascii?Q?bCaBg+wrizq56vdY4yA8b0FnXOiD+vkW+hxGWnMU+4PvO1OjUmCB3+RU7tRZ?=
 =?us-ascii?Q?iIv1PZA6HJ3nEq6ho6tP4oPrpSqd/rJKE48GZW7mKQoPaIlk42Fr61gLxSF7?=
 =?us-ascii?Q?pJt5lxnPGEJVBl48Ck+H13zkxKhx3+CT9sdhvh0a2TuPwy/LGuwTtItLz3DQ?=
 =?us-ascii?Q?x2ONBmMGpfjC28QM8LVDBG7MkbdrkmPf+VOQp4D9OvQan9+sZs+Hp+F/LNHt?=
 =?us-ascii?Q?ZayrD8/E4by/gfeWpV9a5xJgBEn+dm3u0wjCd86rim4d2xqyC/5q/xpg6jCl?=
 =?us-ascii?Q?9zIYwZvLXh3Ay9Zh+JhHxa3+e6Qmcb4+ZpGsaJukB8rWplRfB1W0z/YQJKmy?=
 =?us-ascii?Q?G3HJXIVQ83qiiVVBaX+yUeuqZvJitp/s96XekkaJJmyyDKV0ECxOjLdqd0hM?=
 =?us-ascii?Q?OCcVK4ISWPIs0ucyo3yWWINK6XT62XAksXhx8UoXlLy7GJpnrLZQ9VhzMBFO?=
 =?us-ascii?Q?vR+zQjuvwq0WP8Tm3xYEt4mMsZkH4QvVg1q5jA4DcmJeFCShCpXR0QdDZr16?=
 =?us-ascii?Q?tbrwE3J5qGkKezGrCYLIOMQpI5THZegrFjdD1K4zK86l7HqqlvTtFVryjhMn?=
 =?us-ascii?Q?EtH0wrFrs1XGmBbOpxVU6XFYlNYVyjTATzgDGVxs1+bEtrQyMrOj4OHTXI1X?=
 =?us-ascii?Q?kvigf5rjtZSJ2acOnN9Op0mFoT4fgJdlAksPkQHgJggbsHQUexrZvj5BZr6a?=
 =?us-ascii?Q?ZsYd1dnS0ZYNm11ZVqMtub7n6TW3jwNtf9q/pLPIEWYtUGWY4dTMajJTCTtv?=
 =?us-ascii?Q?Bncp6k5CWjNOtnSUtppZ4qTtQDNb0G/knqpchKg0VE9BMKTV8VUSVpugWMCL?=
 =?us-ascii?Q?KPaZtHHFEiDCLAeUHcrBqeyRjPGST3kavkRGtLkWeaBLljuDzqGUBb0KNAj0?=
 =?us-ascii?Q?FjVDK6lRC/XRrgMQMt1/L1pW8BBpwIn09EHzXibSPphmeWqS56WUYjkYjFlA?=
 =?us-ascii?Q?OB/edljuTe7K59nInkdBLZqp7savj4jk+0KJUAIsWyFI6YvxtBCDZ/4TiHOi?=
 =?us-ascii?Q?k7ry3od4SCiqeqVVUkwmt+ThFxGZ5RuzNW7BPteGhBTtXk4Mf369Q/XS2kAh?=
 =?us-ascii?Q?EzuqfOvf9k4lfONzjaoT/K8pgslWY080v/sB7DGfDEEDhIF8T1elGlykZq4o?=
 =?us-ascii?Q?OVsGiLTlQBcAUEftRVl2uSQqP9+RXnN+FY6RtcRj7fp1xgIt2HCBEGfJ63A6?=
 =?us-ascii?Q?Sb3quULc22Af2h0BV8NOteYTYQP/e+m2d8L+6ER62d1VyGDNaRr0vRYbJh2H?=
 =?us-ascii?Q?V98TUwzbd6J/EJWDVmAGIMiF3ZCgB63jz9nde2KPNjhHqG3REhHr+8AWyuh+?=
 =?us-ascii?Q?QHxBvUIgJnIf1+ku2dWdEpUmoFwgXHUer3MYDU4EK15yQYiKAVjW/yvFA+Kl?=
 =?us-ascii?Q?SG0sE9TFNYhBd+ZXWXeYnIx4JiBhwy9I7Pt51Dw9mXjd+nH/a4RkzvgtgWbr?=
 =?us-ascii?Q?k8ryI83LuHQz8DfM1AvWkjHoLvXGKy0PRw0FdwM6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4093.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebee7626-e18c-41a2-83a7-08da922dea81
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 06:38:33.1574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6cs6LbfFzVyRtKQU901DYNgra+zbCJHRpk2FPzB1IXE/6n27alsh8sRkhhkWxffP2EZXdVn1J7bhP4mMGKWZAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5375
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
 "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Lubart, 
 Vitaly" <vitaly.lubart@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>=20
> On Thu, Sep 08, 2022 at 05:16:02PM -0700, Daniele Ceraolo Spurio wrote:
> > +static ssize_t mei_pxp_gsc_command(struct device *dev, u8 client_id,
> u32 fence_id,
> > +				   struct scatterlist *sg_in, size_t total_in_len,
> > +				   struct scatterlist *sg_out)
> > +{
> > +	struct mei_cl_device *cldev;
> > +
> > +	if (!dev || !sg_in || !sg_out)
> > +		return -EINVAL;
>=20
> How can these ever be NULL?  Doesn't the core control this, so why would
> that happen?
This is any interface function between modules, I think it is not healthy t=
o take assumptions here about how caller
behaves, this is not an inner functions. This is important even for catchin=
g programmatical mistakes.=20
>=20
> Don't check for things that can never happen.
>=20
> > +
> > +	cldev =3D to_mei_cl_device(dev);
> > +
> > +	return mei_cldev_send_gsc_command(cldev, client_id, fence_id,
> sg_in,
> > +total_in_len, sg_out); }
> > +
> >  static const struct i915_pxp_component_ops mei_pxp_ops =3D {
> >  	.owner =3D THIS_MODULE,
> >  	.send =3D mei_pxp_send_message,
> >  	.recv =3D mei_pxp_receive_message,
> > +	.gsc_command =3D mei_pxp_gsc_command,
> >  };
> >
> >  static int mei_component_master_bind(struct device *dev) diff --git
> > a/include/drm/i915_pxp_tee_interface.h
> > b/include/drm/i915_pxp_tee_interface.h
> > index af593ec64469..a702b6ec17f7 100644
> > --- a/include/drm/i915_pxp_tee_interface.h
> > +++ b/include/drm/i915_pxp_tee_interface.h
> > @@ -8,6 +8,7 @@
> >
> >  #include <linux/mutex.h>
> >  #include <linux/device.h>
> > +struct scatterlist;
> >
> >  /**
> >   * struct i915_pxp_component_ops - ops for PXP services.
> > @@ -23,6 +24,10 @@ struct i915_pxp_component_ops {
> >
> >  	int (*send)(struct device *dev, const void *message, size_t size);
> >  	int (*recv)(struct device *dev, void *buffer, size_t size);
> > +	ssize_t (*gsc_command)(struct device *dev, u8 client_id, u32
> fence_id,
> > +			       struct scatterlist *sg_in, size_t total_in_len,
> > +			       struct scatterlist *sg_out);
>=20
> No documentation for this new callback?
>=20
> The build should give you are warning :(
Will fix.

Thanks
Tomas


