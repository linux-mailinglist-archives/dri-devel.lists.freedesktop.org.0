Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E576550AD62
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 03:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7757C10F430;
	Fri, 22 Apr 2022 01:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C27210F42D;
 Fri, 22 Apr 2022 01:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650592206; x=1682128206;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZzjMMKinucrv4qtPkboqfRexDjikQQN+wGl0TN9DwXQ=;
 b=KzzFjjHEPhxAhGhrnvrtHNs/GLLABvOaPt2Z3SNIqdtSiCdjUL+XqwdD
 8HNlHni0qRCXFqeGn9UodbNBnxtqQgVHW1Ya+XjegxyCwonZwp5kaYTg9
 oEmLGR9SmikzZ1cIXcZAfaAAokU9b1nWbfdbx9tWWe8gSn6omLiRZZdjp
 Op2XGQxsEOr81RryrBlO3EVEecYl/14DwrOJ7qBKg+ruF2tlfA6NxC60r
 Fw67IPLx2jpxUVRPW0CPjrxp/yMnVDtaiC9z1tz+AxmuYK4uk0sl2ckih
 k/IV86jzT/SwJ/CnX6IXZFTteF3wkSGHT7Q4IfbubyVQmyUqfXTAfJ1Dr A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="264314272"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="264314272"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 18:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="533846792"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 21 Apr 2022 18:50:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 18:50:04 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 18:50:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 21 Apr 2022 18:50:02 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Apr 2022 18:50:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnr1SYmi1aHOLoxSk6ROpYf61uYwTG50JVyx6btap28MRmpinCiDq1Vww1YMaP8abclAk4+yIy3OuWKRk2Kca572RLQyGsVFFoBBGsZjR8N66Fr1iwmHEDfcP8jn6UVlJVqui1jy5J+1hgN9rmwxewdFnNJsXUplFEddFY8R4BGHFw1eZ+h5ZdIok9+gKi8orkkBkJmUj2iATRn7BduWzaCZGdH0MKunKjwAJqj38WyhPQ2NbAgcj+dXQHlC/ohyQKt/tcX0wDqw9kZ1XxCTg1aXeBkPkVfryzgQXUh2U/I0h3ayXNf8tVs7gx/xpG0OfHgNf68HSy0rEka55laacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75EpGACxW6bwGwFFgj964Y6OE63uKphCru+mZX37tqM=;
 b=PhPEETHgqEpR4HUqQC507SNCSspkSEyhWVwDHPELBbDjlhzSoxw6OV084qgq9SVKJe72VBh2b1LrvnhOGRk74sVaJa/6RJlZuPO+pdFNL8jUV+uKKEhYzxA0imWuDHgMQ6pmrmU//FTzgkfekLZm+u7gpsMrJJzH4uAAmAVrDiLCOEBD2RDM5ciWx5bhxJdQ31MciVdroFX5XLg03YbphOpX1gEoJnudHacGYNKv4JINhbK5wuscLafWmTPwJfJJkEN2ZP0maPUP5HHVv68tJBv77m/aBoJ+WWY2DrnyCJSPcqoQgWw20MFW5JC0WZwkEAPjQ3xpcb/IisCazqhnag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 01:50:00 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 01:50:00 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@linux.ie>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Harald
 Freudenberger" <freude@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Peter Oberparleiter <oberpar@linux.ibm.com>, "Halil
 Pasic" <pasic@linux.ibm.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Sven
 Schnelle" <svens@linux.ibm.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: RE: [PATCH v2 4/7] vfio/mdev: Pass in a struct vfio_device * to
 vfio_dma_rw()
Thread-Topic: [PATCH v2 4/7] vfio/mdev: Pass in a struct vfio_device * to
 vfio_dma_rw()
Thread-Index: AQHYVZzyHQpBjUiEn0CJxn5jCdiAraz7Kf2Q
Date: Fri, 22 Apr 2022 01:50:00 +0000
Message-ID: <BN9PR11MB52764597BDC02C88E855EA808CF79@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <4-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <4-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 693d3153-9b84-4bbe-0e4d-08da24026960
x-ms-traffictypediagnostic: PH0PR11MB5014:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <PH0PR11MB5014E4B7DBBB1B12CFCFBB578CF79@PH0PR11MB5014.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +RESf69iP9v14DpLTe6t3OnmTko7/H4ceoax/vt4L/lwGL1/6kWO9wO30zLxLvGmqoeNiXClnu9PMTJlnUhwsTKyJip3FQi+M8fV3kpldjsVR3NLLpu64YSV2lvzp30+EHi70yS5lND2ibYi+Qc0tmXMt9RRM0TpPa082H/+bdYXeKuTxVxiF0J3L3+ES9OFU3+7pbOZFhhgTiu2gP7lJ3eWwHf4em5iD6lm6vbsT3O/CxyNXirJW0bnV46awiB9Gf6okqQbWJeDYM2TzP7ulkudgU3HDkMITjFG6V8mgSOr6Juj0np3jSvU3Izh0LUcquzchXBfWRPZ8XKcNfKlTpgtonaUwEjV2B+d2s8Bop0mIfQEHfcPKOHjQb8Oiz6W/aBfrosfwaXdSJwXSLCiUmJd/VkEALKJ8aZ0JIuLIOD9hOrXE610sBBVAqLpjpTRCSdTO5lVAFGZIuVt9r8stGw7matuc2fosOVhJmmyyuMSQKwG3G4iIQnXqOStRkSm5hfwtP8FAZ45B9ow0Fg296KjlitZwTE5iOD3xiBo8j9kTJFMa2Y3fLBQ2+Iw3q7lxsC/k6dPFzy/cGK8KIG8vp/rQV0VLVAraBeCNTaeqtYrfdmQsBEJ1hNRS6m1QvOXup3QZL4SBRoAGXW3sxeaPvUBXRHJIdXRZzJmNAOq4+BEjb9VA+adaAwpqjZe4BK9JZAl0uNbl1thZGzZ6hE/HWDRpoF9Q+A0ynY8mqU8+eM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(7406005)(55016003)(86362001)(7416002)(7696005)(66446008)(33656002)(82960400001)(52536014)(8936002)(921005)(122000001)(316002)(38070700005)(38100700002)(186003)(54906003)(110136005)(508600001)(64756008)(6636002)(76116006)(5660300002)(9686003)(26005)(66946007)(66476007)(66556008)(83380400001)(4326008)(8676002)(71200400001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qFljrLha98Rg0lveg3lJuGZDZC6Ar45hzfCNZByhLlXxqm5txkYFa8ad4+ht?=
 =?us-ascii?Q?dvTC37zqVcG2SOsYUYyvc3d2a6wOwJLiKmTfz5iIzziuoJn/zMSlNKezO5J9?=
 =?us-ascii?Q?WnJJuODXXfgQjb8jKDrtUF8KyGbny2yOqGjVvNo8W7uQL4sKgrU7QWxRr55j?=
 =?us-ascii?Q?SS/WHgEvJAEMTad0tTDTD2TEu0Fmt9nXiVmOkAROJX/TZM4xxiRhrMhQbQp0?=
 =?us-ascii?Q?Ru70OqA/Aa8FZFJGebs/by1O4pg6ehvBH+hGQ9B608Dcy6e0c38+UPEI6hS1?=
 =?us-ascii?Q?zomEuqTGvrVHoRVbKJlSala6mle96+7P4+3Y3FkBtaMDRHZJkl2qqeb2N1I7?=
 =?us-ascii?Q?eQLE4lXdkaYBIjx5tQHqsuC/cx0iI3NgOsr4zrSHRPWUUn4bejMGEenOCq4s?=
 =?us-ascii?Q?YNMXRfgOIcg0CyW9irkBl/b9J/M9ghgGQM7gjzT6Jw0u58pVdV6oeNa7qnZl?=
 =?us-ascii?Q?KnpelRZYZSi/QvdEGWOeWv77FbO8pwfpnBO4Q9+nY2qI+1vJl1pMMwmJlMMW?=
 =?us-ascii?Q?C51OTX3wA9bbc/SMrgyEXk+4ubrZm/1lIeoq23x1CEWnLH/Hcu4R0e/3Rlqb?=
 =?us-ascii?Q?EW1q/fdnEA9Hgw2hkZMWTc7+8eYbFzg1+N02bdAcWgv9f7vUtTnIuwaYhcOh?=
 =?us-ascii?Q?hLT/1bPOtF9uVrbKmZbvrziH9arcueBz/WADNFWiwmSxS54uF/RXe76rZNr/?=
 =?us-ascii?Q?K1X/tBYzeiz+1TTEZyY2MUY1mHZ0ZaadAY3U8VZT3f3qzKUuIuRyZXk20aRl?=
 =?us-ascii?Q?8Spv+xuj0BuIIt522B2mApmX5s9BuLNx2zpXtbSi+aDYSkw+vHkdaaSpZ7lK?=
 =?us-ascii?Q?hfjn7za/9sLJ4YveyDX3Fi5DN1nduf2/KxmhfI+6AsxTUAL39+Ukp6LnrkwJ?=
 =?us-ascii?Q?d4RXiemIQA5HPNXxer4+61Fyw/Li0r8y6w4frC2+hBwZBMba/Hzvqp2bZ/uy?=
 =?us-ascii?Q?8Zz5Ymu5piPxFLhItYNJRp+BwAI8/njjFiProq+Tbsa5Y5Ykxt0grBkfVEmn?=
 =?us-ascii?Q?6TMPCX9gTl3X5rCNCkAK5fu7JTru9FjRMhPdJz5PtWxj+jClgGlp7IIX0yPM?=
 =?us-ascii?Q?BM5gGW2GBaDKaG2dnHEaLalYWdlAMONKmwqEPpLoXth2Mf6pNtrbFTRq+Mv6?=
 =?us-ascii?Q?QSruMEr7w1ZCey7bLqH5MELKvGutDbpGX9okN0ldut/rVpufsbrtZDrHAETG?=
 =?us-ascii?Q?zPEmHXkfq+VJHi61ERBpoQMWXgUgB+S/5bysCENOvHXJj6pe6aQBYRlmYKVj?=
 =?us-ascii?Q?0wGfEQ9EAM+BwPTb0i27/YV8VOQT6zLKcW2Cx5EX0iE0aIPJGrlCLFujOKbw?=
 =?us-ascii?Q?3GZvIpHU2P7KEyKrbG93w7ISeN0ZZ8tJP1bbX6h4iTgaDuyQcb/MNvGyzkOJ?=
 =?us-ascii?Q?0hJ+m/T0+jCS2n75iED5UNtFkokYzqBPQhO2D1yrBDMlUP/ZeomWZnUJdZ1L?=
 =?us-ascii?Q?GSzrlD3mZFoV7ZI0fSxCxTz+MZ+DJUX5CXr/eJxXLWNBTDhTtfg1obD9Eu6O?=
 =?us-ascii?Q?HWUal4CewpPt2yS1H7WahOEj6n4oMbt1umlnioq0TzEMgAi4sYwiZb6BPOyM?=
 =?us-ascii?Q?LIdb+IX9H4YwTMCgZPxY+FQHB1LQvfnueIxCae1YQiP8I0dTYsD1KQuLsh/x?=
 =?us-ascii?Q?HSXcwRFyHQ3qrS6MeRR8/Hct4nFMGa6ikN9ESqntOgg7mWi1yNrbjEfay8J0?=
 =?us-ascii?Q?rlEJEiItfaF0WwsNrENH8NCGcxCmDj6W864vwKHRLgXK3Kk5iCSCh2nnNqHt?=
 =?us-ascii?Q?kXdAS75DUw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693d3153-9b84-4bbe-0e4d-08da24026960
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 01:50:00.2158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ptg82tQlrN8pn3RnkeUYAvLWAsj6q6V6/+D1bUy8Up28syyAPeAZC79T5sQaDx4qfT3AAAANIgnCbIXUk5gW0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5014
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 "Liu, Yi L" <yi.l.liu@intel.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Friday, April 22, 2022 12:29 AM
>=20
> Every caller has a readily available vfio_device pointer, use that instea=
d
> of passing in a generic struct device. The struct vfio_device already
> contains the group we need so this avoids complexity, extra refcountings,
> and a confusing lifecycle model.

Using the same description as last patch leaves the impression that
the two patches do the exactly same type of change. But this
patch actually includes one more change to grab a reference on the
container. This is worth an explanation.

>=20
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

otherwise:

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/gvt.h |  4 ++--
>  drivers/vfio/vfio.c            | 24 +++++++++++-------------
>  include/linux/vfio.h           |  2 +-
>  3 files changed, 14 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 03ecffc2ba56a9..5a28ee965b7f3e 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -732,7 +732,7 @@ static inline int intel_gvt_read_gpa(struct intel_vgp=
u
> *vgpu, unsigned long gpa,
>  {
>  	if (!vgpu->attached)
>  		return -ESRCH;
> -	return vfio_dma_rw(vgpu->vfio_group, gpa, buf, len, false);
> +	return vfio_dma_rw(&vgpu->vfio_device, gpa, buf, len, false);
>  }
>=20
>  /**
> @@ -750,7 +750,7 @@ static inline int intel_gvt_write_gpa(struct intel_vg=
pu
> *vgpu,
>  {
>  	if (!vgpu->attached)
>  		return -ESRCH;
> -	return vfio_dma_rw(vgpu->vfio_group, gpa, buf, len, true);
> +	return vfio_dma_rw(&vgpu->vfio_device, gpa, buf, len, true);
>  }
>=20
>  void intel_gvt_debugfs_remove_vgpu(struct intel_vgpu *vgpu);
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 24b92a45cfc8f1..d10d20d393b706 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -2323,32 +2323,28 @@ EXPORT_SYMBOL(vfio_group_unpin_pages);
>   * As the read/write of user space memory is conducted via the CPUs and =
is
>   * not a real device DMA, it is not necessary to pin the user space memo=
ry.
>   *
> - * The caller needs to call vfio_group_get_external_user() or
> - * vfio_group_get_external_user_from_dev() prior to calling this interfa=
ce,
> - * so as to prevent the VFIO group from disposal in the middle of the ca=
ll.
> - * But it can keep the reference to the VFIO group for several calls int=
o
> - * this interface.
> - * After finishing using of the VFIO group, the caller needs to release =
the
> - * VFIO group by calling vfio_group_put_external_user().
> - *
> - * @group [in]		: VFIO group
> + * @vdev [in]		: VFIO device
>   * @user_iova [in]	: base IOVA of a user space buffer
>   * @data [in]		: pointer to kernel buffer
>   * @len [in]		: kernel buffer length
>   * @write		: indicate read or write
>   * Return error code on failure or 0 on success.
>   */
> -int vfio_dma_rw(struct vfio_group *group, dma_addr_t user_iova,
> -		void *data, size_t len, bool write)
> +int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova, void
> *data,
> +		size_t len, bool write)
>  {
>  	struct vfio_container *container;
>  	struct vfio_iommu_driver *driver;
>  	int ret =3D 0;
>=20
> -	if (!group || !data || len <=3D 0)
> +	if (!data || len <=3D 0)
>  		return -EINVAL;
>=20
> -	container =3D group->container;
> +	ret =3D vfio_group_add_container_user(vdev->group);
> +	if (ret)
> +		return ret;
> +
> +	container =3D vdev->group->container;
>  	driver =3D container->iommu_driver;
>=20
>  	if (likely(driver && driver->ops->dma_rw))
> @@ -2357,6 +2353,8 @@ int vfio_dma_rw(struct vfio_group *group,
> dma_addr_t user_iova,
>  	else
>  		ret =3D -ENOTTY;
>=20
> +	vfio_group_try_dissolve_container(vdev->group);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL(vfio_dma_rw);
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index 8f2a09801a660b..91d46e532ca104 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -161,7 +161,7 @@ extern int vfio_group_pin_pages(struct vfio_group
> *group,
>  extern int vfio_group_unpin_pages(struct vfio_group *group,
>  				  unsigned long *user_iova_pfn, int npage);
>=20
> -extern int vfio_dma_rw(struct vfio_group *group, dma_addr_t user_iova,
> +extern int vfio_dma_rw(struct vfio_device *vdev, dma_addr_t user_iova,
>  		       void *data, size_t len, bool write);
>=20
>  extern struct iommu_domain *vfio_group_iommu_domain(struct
> vfio_group *group);
> --
> 2.36.0

