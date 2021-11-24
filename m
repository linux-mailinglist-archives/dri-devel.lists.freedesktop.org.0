Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B8545BC39
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 13:26:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608A06E885;
	Wed, 24 Nov 2021 12:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1343B6E885;
 Wed, 24 Nov 2021 12:26:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="222141909"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="222141909"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 04:26:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="674843655"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 24 Nov 2021 04:26:19 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 24 Nov 2021 04:26:19 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 24 Nov 2021 04:26:18 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 24 Nov 2021 04:26:18 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 24 Nov 2021 04:26:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkzRCQqDLHYB9k642Smxt1oAoUifqvuTDAqJQDygXG9FqOAlXASt9+UkLi9WWWvlj7Nfkxml3eVL5y8qbVjQaiycU5UsLeJITZ2VNOezi+p/XptiLzsrWFwG+KdEBkRybjx5ZYrfyXsTp4RjfnP1quxV1kWxg8pKxaaYltb8EI5wEa1G5OrB3JjFRO/a9vIC6gfQjTMyba4vbOzvi3BZyBCQXRtcrof2J/B+OAWYEljj7RsGVE8UzswwWcXfAsYZSCG6gOBUlwO81hohw/BgDD0z9y41UoxyHZuDR7XgZ57v3aRJSAv3/+rYvihe1rmiz5j0WFfSj+LIRXSfZ76tnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeOTfjnrDG6ffXA/iauLtVpwJaoOLKGK+95DQN6YRmA=;
 b=YT+vYICyvi7pFQgfF2U69d36DgG+4nE4wdA6VqqBMdtD2wnOTWYF7rdtqixMz34wfML2Oc8dSGtw+787ecAm2Q9myvtm/TFd7UEe+yhyBpHRkoi8DbL8Q+v4CSTMbkJnUuBkSr8xwMyL9GYIYqxZ3DJN44umY8OcZUP+rShSoEvL9Z5WqX0EocsH6MfjuEQEDV2glo1JPWIWk7WNY05rwa19ty7m3rf96pRV2U3G4ghBJx5L6KBEdQNlh74oRfoXH8db0cdhUHwZv9LRAhIOcTS7JPSnXG22JZl1DF35j6dcnOVmyh7qLs1PGB1DwToAGAa/lM/BrqQWSjlS2KAPXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeOTfjnrDG6ffXA/iauLtVpwJaoOLKGK+95DQN6YRmA=;
 b=r7wXuXdWxsj9Cx+YNLB+hqfF6pkrSUNASfT/Uk6VXWG0xsrp5SuShk6eqbhw4jY7qAI4eD0WPYKXbDfAQ4dpl7FHkqxR3P+SefQwIH/R6TfobAHWEyAdT8swNzkKCXaqPQ6S7E9ByVL6TzdvLoGkBxUH/cghbfyy7BufVIxL84M=
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB5628.namprd11.prod.outlook.com (2603:10b6:510:d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Wed, 24 Nov
 2021 12:25:41 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::68d8:8332:4e66:914c]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::68d8:8332:4e66:914c%6]) with mapi id 15.20.4690.027; Wed, 24 Nov 2021
 12:25:41 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, "farman@linux.ibm.com"
 <farman@linux.ibm.com>
Subject: [RE]: [PATCH v3 10/10] vfio/ccw: Move the lifecycle of the struct
 vfio_ccw_private to the mdev
Thread-Topic: [RE]: [PATCH v3 10/10] vfio/ccw: Move the lifecycle of the
 struct vfio_ccw_private to the mdev
Thread-Index: AdfhLVFmZ0XHPxlhQzGj9kpPq8pmyA==
Date: Wed, 24 Nov 2021 12:25:40 +0000
Message-ID: <PH0PR11MB5658A7BB11922E5B6267892AC3619@PH0PR11MB5658.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 501d3b5b-423d-4a82-31de-08d9af45877f
x-ms-traffictypediagnostic: PH0PR11MB5628:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <PH0PR11MB56287D9088EEBCF9A3D2B36AC3619@PH0PR11MB5628.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:109;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gbSEuuf+Ky9DbmO3T6kP+YwWTW6c7jcrH9A7slVQICluYtqa6fiMmTx/gPLxkzIM5jStLvZdfUXq4tGohi8H4/Z4D63cC1NN3PbsqHXolIbXbBXnLW7ug83fNWctk0bO17G6s3iPNnhU3Sxn2xOG4gvIqmsVitWH77eyGhVpqi/DVWyK+u19AimkmHPpqnyEwGFbeJyIZjxBJv5aVoBCo5lq/TooWWetWmYsyy8gXYiJJZhSUm0lnudCiX96TCd2KV6hmZ8DDhAUK3Fs37ebGuSH2RJ/ekNzhPj1axseX42c2piXZpr70FTyIjxNs50NBdwisrImQHOUnD22uIV9X90a8nV7Nv746h6TxedFF1LaGR1WIC0x9r9Uxh3sgw56RRVoc1NeAraUIkZ1EdipugzVOkJ1kNOdSt2t1nWvogNKvXj53MtZSXUY4/PdVFVx0zjHtTdXeTfGkFrX4a/GxpEJrWnd2uNaNlE35S6sX1fekbgHqSkY3JMFdDdWXfp+B+xOFiphSMe8BdupvIOp78Nn/16JoQME8Ij3HSIPGDVwlvFhzzUl1GhgLUKNtfyQS+yMsKCWqrD+alFUopvgM47QG4B0oUscEvs9+yE/Q6zuhbVAmEtmJ4FM14+WhDdlHzlhTxslX03YjsRK+o67ePx1dCC8Kg01urwfXln08B0NC5kIxG4W8nZFmQ6BWCJE8lGmtL4xijYlVBm4MV0Npw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(6506007)(7696005)(54906003)(66446008)(7416002)(66476007)(2906002)(33656002)(86362001)(26005)(82960400001)(8936002)(38070700005)(71200400001)(8676002)(66556008)(64756008)(9686003)(316002)(122000001)(5660300002)(55016003)(110136005)(66946007)(508600001)(52536014)(186003)(83380400001)(76116006)(30864003)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gvDrkeWQS+UMSLOWrVZsQ1wRUidbRxeyj5XBmXrKLTW0Adrg74Y3qvwWLTX+?=
 =?us-ascii?Q?rQZKO07mZ9/NLVHf9N/Ri47WNLsZ5y8IWfxr3ihvZntCk8Vb86gMZ4SjgC2C?=
 =?us-ascii?Q?pu6PZVq8ML0R/uXrqJrh4RPsN/YhYMvMUjcbyW20seCqbkuoZuzwmMeM8M6E?=
 =?us-ascii?Q?qDkDjcSVa6p8BpdEiRjSB/uxeEuKH1rJIKbUbEXq1qeEprq0Qn57LQjDIgCG?=
 =?us-ascii?Q?su5xOL9tF+475dQED6BAznw41OcChFx1SKM7/fZNEyI+0eMrXrskMKkigXux?=
 =?us-ascii?Q?qCYkl0JP+Foq0YNVSot1Gbo9OkQJHgJyUoSllHU2Vcua70ZFmObvAnT4ocyV?=
 =?us-ascii?Q?xWf6Ak6QLOvFWN2xmRAIFDy28LhytHHiz9ohAOarHqueT86QCJFJwHWPfdYo?=
 =?us-ascii?Q?GcT7YtPtBPwSy+eBVvtbuq5B2AG+vU+8lXZkm+yXIXqmqCMfRSJchLtQvdte?=
 =?us-ascii?Q?jXozhNGsmH4QdM4n+ILAM006l0Ho3cUBK1SL5jBLLY1xfJ7r2r5CJeqvWqaO?=
 =?us-ascii?Q?dvuFqgli8yJ0nKr2OH8KCUomdN8E0KBvTu9dBho2QqW3lP16Zu+khECqIy5n?=
 =?us-ascii?Q?e1UKV4uycQCw73dr43mdCEFnCAti7o4b7NkdPlt8DYT/JwQz/CM/HM8/yNyl?=
 =?us-ascii?Q?B3ModZhLkBvB+1Ny5ieuCmm7pdbJcxx5ii8RaV5RZdxMl6s4NT0Fy3dc7Tt8?=
 =?us-ascii?Q?PbCWEjgzBAzRTqcEEyDXxEee+BvuzQPUq1DlkA3zn7Rc/SHf470gX360yliw?=
 =?us-ascii?Q?tiHBxQShJHUvpc7PiSXh5Wpg5jqJYVKXCdTWKroDseVWCZJJSwF0Ej9PV1S/?=
 =?us-ascii?Q?99LKsZHpyYlNmQW00QDF6yymk6+qfXXhRQNqStxh5nPxuEg70XpsEDiQEO2G?=
 =?us-ascii?Q?qCZMGNnrcSyssKXhGsm5uQVpGnn/1bHKiqctyRxhEAupzuG7DnL4dGUj9CkC?=
 =?us-ascii?Q?8EDYfEM9bQWI81XrDMUqoVzBwuPyqDsZAB4IkKF4Oaqt2Ji1/+9ssGNIog4K?=
 =?us-ascii?Q?28xMxpsaQkYnVQx5TYVJJsRQDalvMuBYiWp90kfAfhc54knG0o8C9K8XAwHS?=
 =?us-ascii?Q?nUmxUWxJV0kjctEK/eC+nzVE35D0rlGkRCMddGA1u+fkwGOhzC6rMVbpDkgH?=
 =?us-ascii?Q?gf9NQuSIEf5bi9uhrPTpiW7o0eKbhrwgevGVJkQZNNVhk0WFXTF9s/LBJr8s?=
 =?us-ascii?Q?d7SdOOIrcKH5ywHwLktYCGEHvcqBcqFNEKLDe5Wxo7cCfb97gnEbxh9hMuxi?=
 =?us-ascii?Q?eRPUzDwStL9MIjjMaPN/DcgKg4If5/qvytNJID6UBC6Cv18EtTTMibIzZvTv?=
 =?us-ascii?Q?zDiO1i7/sZIvZLR2RnbK7811GD2Dnfa/XM1ioAXUau3bvQ/BGyY0cNW3WcME?=
 =?us-ascii?Q?4bMr1GVOJPNm34568miWlWips8Rfj8LnAPHS8W75f9z7MHHhrGHtMpX6U80Q?=
 =?us-ascii?Q?MDcehVV2omh8aBL3wrvKvQ2z9gHi5GW7aB2wuN+uHffnSAbZQES6b9SJWfFO?=
 =?us-ascii?Q?OKeEbR5XuZ2ZGIg18OShkPesRStuAr6HcbIw7lzhmC6DOH5nnogumvPWo40/?=
 =?us-ascii?Q?XzaUrUQ6G2QxS3V/UZGWjfIvbOFH1bu50Qu526p+yZXA69HEdu4VM2kFNltj?=
 =?us-ascii?Q?FA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 501d3b5b-423d-4a82-31de-08d9af45877f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 12:25:40.9076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LgEoCZkFRGh2Lcaz0Q44eYFDRV6/nP0Bn/MmkPN8gK8ye7bijF97VR1tEf7lrbtYc3v25mE0QKgQK7SmqMh/Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5628
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
Cc: Matthew
 Rosato <mjrosato@linux.ibm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>, Eric
 Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Fri, 1 Oct 2021 14:52:51 -0300
>
> The css_driver's main purpose is to create/destroy the mdev and relay the
> shutdown, irq, sch_event, and chp_event css_driver ops to the single
> created vfio_device, if it exists.
>=20
> Reframe the boundary where the css_driver domain switches to the vfio
> domain by using rcu to read and refcount the vfio_device out of the sch's
> drvdata. The mdev probe/remove will manage the drvdata of the parent.
>=20
> The vfio core code refcounting thus guarantees that when a css_driver
> callback is running the vfio_device is registered, simplifying the
> understanding of the whole lifecycle.
>=20
> Finally the vfio_ccw_private is allocated/freed during probe/remove of th=
e
> mdev like any other vfio_device struct.

Hi Eric,

how about the status of this patch? I found it is a good clean up to make
vfio ccw behave same with other vfio_device users. Also, I'd like to do a
clean up to consolidate the vfio_device allocation which needs the vfio
ccw private allocation happen in the mdev probe. So it would be nice to
build the cleanup based on this patch.

Regards,
Yi Liu

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/s390/cio/vfio_ccw_drv.c     | 67 ++++++++++++++---------------
>  drivers/s390/cio/vfio_ccw_ops.c     | 40 +++++++----------
>  drivers/s390/cio/vfio_ccw_private.h | 23 +++++++++-
>  3 files changed, 69 insertions(+), 61 deletions(-)
>=20
> diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_=
drv.c
> index 18ad047811d111..c5582fc9c46c9e 100644
> --- a/drivers/s390/cio/vfio_ccw_drv.c
> +++ b/drivers/s390/cio/vfio_ccw_drv.c
> @@ -86,13 +86,19 @@ static void vfio_ccw_crw_todo(struct work_struct *wor=
k)
>   */
>  static void vfio_ccw_sch_irq(struct subchannel *sch)
>  {
> -	struct vfio_ccw_private *private =3D dev_get_drvdata(&sch->dev);
> +	struct vfio_ccw_private *private =3D vfio_ccw_get_priv(sch);
> +
> +	/* IRQ should not be delivered after the mdev is destroyed */
> +	if (WARN_ON(!private))
> +		return;
> =20
>  	inc_irq_stat(IRQIO_CIO);
>  	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_INTERRUPT);
> +	vfio_device_put(&private->vdev);
>  }
> =20
> -static struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel=
 *sch)
> +struct vfio_ccw_private *vfio_ccw_alloc_private(struct mdev_device *mdev=
,
> +						struct subchannel *sch)
>  {
>  	struct vfio_ccw_private *private;
> =20
> @@ -100,6 +106,8 @@ static struct vfio_ccw_private *vfio_ccw_alloc_privat=
e(struct subchannel *sch)
>  	if (!private)
>  		return ERR_PTR(-ENOMEM);
> =20
> +	vfio_init_group_dev(&private->vdev, &mdev->dev,
> +			    &vfio_ccw_dev_ops);
>  	private->sch =3D sch;
>  	mutex_init(&private->io_mutex);
>  	private->state =3D VFIO_CCW_STATE_CLOSED;
> @@ -145,11 +153,12 @@ static struct vfio_ccw_private *vfio_ccw_alloc_priv=
ate(struct subchannel *sch)
>  	kfree(private->cp.guest_cp);
>  out_free_private:
>  	mutex_destroy(&private->io_mutex);
> +	vfio_uninit_group_dev(&private->vdev);
>  	kfree(private);
>  	return ERR_PTR(-ENOMEM);
>  }
> =20
> -static void vfio_ccw_free_private(struct vfio_ccw_private *private)
> +void vfio_ccw_free_private(struct vfio_ccw_private *private)
>  {
>  	struct vfio_ccw_crw *crw, *temp;
> =20
> @@ -164,14 +173,14 @@ static void vfio_ccw_free_private(struct vfio_ccw_p=
rivate *private)
>  	kmem_cache_free(vfio_ccw_io_region, private->io_region);
>  	kfree(private->cp.guest_cp);
>  	mutex_destroy(&private->io_mutex);
> -	kfree(private);
> +	vfio_uninit_group_dev(&private->vdev);
> +	kfree_rcu(private, rcu);
>  }
> =20
>  static int vfio_ccw_sch_probe(struct subchannel *sch)
>  {
>  	struct pmcw *pmcw =3D &sch->schib.pmcw;
> -	struct vfio_ccw_private *private;
> -	int ret =3D -ENOMEM;
> +	int ret;
> =20
>  	if (pmcw->qf) {
>  		dev_warn(&sch->dev, "vfio: ccw: does not support QDIO: %s\n",
> @@ -179,15 +188,9 @@ static int vfio_ccw_sch_probe(struct subchannel *sch=
)
>  		return -ENODEV;
>  	}
> =20
> -	private =3D vfio_ccw_alloc_private(sch);
> -	if (IS_ERR(private))
> -		return PTR_ERR(private);
> -
> -	dev_set_drvdata(&sch->dev, private);
> -
> -	ret =3D vfio_ccw_mdev_reg(sch);
> +	ret =3D mdev_register_device(&sch->dev, &vfio_ccw_mdev_ops);
>  	if (ret)
> -		goto out_free;
> +		return ret;
> =20
>  	if (dev_get_uevent_suppress(&sch->dev)) {
>  		dev_set_uevent_suppress(&sch->dev, 0);
> @@ -198,22 +201,11 @@ static int vfio_ccw_sch_probe(struct subchannel *sc=
h)
>  			   sch->schid.cssid, sch->schid.ssid,
>  			   sch->schid.sch_no);
>  	return 0;
> -
> -out_free:
> -	dev_set_drvdata(&sch->dev, NULL);
> -	vfio_ccw_free_private(private);
> -	return ret;
>  }
> =20
>  static void vfio_ccw_sch_remove(struct subchannel *sch)
>  {
> -	struct vfio_ccw_private *private =3D dev_get_drvdata(&sch->dev);
> -
> -	vfio_ccw_mdev_unreg(sch);
> -
> -	dev_set_drvdata(&sch->dev, NULL);
> -
> -	vfio_ccw_free_private(private);
> +	mdev_unregister_device(&sch->dev);
> =20
>  	VFIO_CCW_MSG_EVENT(4, "unbound from subchannel %x.%x.%04x\n",
>  			   sch->schid.cssid, sch->schid.ssid,
> @@ -222,10 +214,14 @@ static void vfio_ccw_sch_remove(struct subchannel *=
sch)
> =20
>  static void vfio_ccw_sch_shutdown(struct subchannel *sch)
>  {
> -	struct vfio_ccw_private *private =3D dev_get_drvdata(&sch->dev);
> +	struct vfio_ccw_private *private =3D vfio_ccw_get_priv(sch);
> +
> +	if (!private)
> +		return;
> =20
>  	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_CLOSE);
>  	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_BROKEN);
> +	vfio_device_put(&private->vdev);
>  }
> =20
>  /**
> @@ -240,14 +236,14 @@ static void vfio_ccw_sch_shutdown(struct subchannel=
 *sch)
>   */
>  static int vfio_ccw_sch_event(struct subchannel *sch, int process)
>  {
> -	struct vfio_ccw_private *private =3D dev_get_drvdata(&sch->dev);
> +	struct vfio_ccw_private *private =3D vfio_ccw_get_priv(sch);
>  	unsigned long flags;
>  	int rc =3D -EAGAIN;
> =20
> -	spin_lock_irqsave(sch->lock, flags);
> -	if (!device_is_registered(&sch->dev))
> -		goto out_unlock;
> +	if (!private)
> +		return -EAGAIN;
> =20
> +	spin_lock_irqsave(sch->lock, flags);
>  	if (work_pending(&sch->todo_work))
>  		goto out_unlock;
> =20
> @@ -260,7 +256,7 @@ static int vfio_ccw_sch_event(struct subchannel *sch,=
 int process)
> =20
>  out_unlock:
>  	spin_unlock_irqrestore(sch->lock, flags);
> -
> +	vfio_device_put(&private->vdev);
>  	return rc;
>  }
> =20
> @@ -294,7 +290,7 @@ static void vfio_ccw_queue_crw(struct vfio_ccw_privat=
e *private,
>  static int vfio_ccw_chp_event(struct subchannel *sch,
>  			      struct chp_link *link, int event)
>  {
> -	struct vfio_ccw_private *private =3D dev_get_drvdata(&sch->dev);
> +	struct vfio_ccw_private *private =3D vfio_ccw_get_priv(sch);
>  	int mask =3D chp_ssd_get_mask(&sch->ssd_info, link);
>  	int retry =3D 255;
> =20
> @@ -307,8 +303,10 @@ static int vfio_ccw_chp_event(struct subchannel *sch=
,
>  			   sch->schid.ssid, sch->schid.sch_no,
>  			   mask, event);
> =20
> -	if (cio_update_schib(sch))
> +	if (cio_update_schib(sch)) {
> +		vfio_device_put(&private->vdev);
>  		return -ENODEV;
> +	}
> =20
>  	switch (event) {
>  	case CHP_VARY_OFF:
> @@ -338,6 +336,7 @@ static int vfio_ccw_chp_event(struct subchannel *sch,
>  		break;
>  	}
> =20
> +	vfio_device_put(&private->vdev);
>  	return 0;
>  }
> =20
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_=
ops.c
> index 68aae25a0a4be0..414b11ea7eebf9 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -17,8 +17,6 @@
> =20
>  #include "vfio_ccw_private.h"
> =20
> -static const struct vfio_device_ops vfio_ccw_dev_ops;
> -
>  static int vfio_ccw_mdev_reset(struct vfio_ccw_private *private)
>  {
>  	/*
> @@ -88,26 +86,27 @@ static struct attribute_group *mdev_type_groups[] =3D=
 {
> =20
>  static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
>  {
> -	struct vfio_ccw_private *private =3D dev_get_drvdata(mdev->dev.parent);
> +	struct subchannel *sch =3D to_subchannel(mdev->dev.parent);
> +	struct vfio_ccw_private *private;
>  	int ret;
> =20
> -	memset(&private->vdev, 0, sizeof(private->vdev));
> -	vfio_init_group_dev(&private->vdev, &mdev->dev,
> -			    &vfio_ccw_dev_ops);
> +	private =3D vfio_ccw_alloc_private(mdev, sch);
> +	if (IS_ERR(private))
> +		return PTR_ERR(private);
> =20
>  	VFIO_CCW_MSG_EVENT(2, "mdev %s, sch %x.%x.%04x: create\n",
> -			   dev_name(private->vdev.dev),
> -			   private->sch->schid.cssid, private->sch->schid.ssid,
> -			   private->sch->schid.sch_no);
> +			   dev_name(private->vdev.dev), sch->schid.cssid,
> +			   sch->schid.ssid, sch->schid.sch_no);
> =20
>  	ret =3D vfio_register_emulated_iommu_dev(&private->vdev);
>  	if (ret)
> -		goto err_init;
> +		goto err_alloc;
>  	dev_set_drvdata(&mdev->dev, private);
> +	dev_set_drvdata(&sch->dev, private);
>  	return 0;
> =20
> -err_init:
> -	vfio_uninit_group_dev(&private->vdev);
> +err_alloc:
> +	vfio_ccw_free_private(private);
>  	return ret;
>  }
> =20
> @@ -120,8 +119,9 @@ static void vfio_ccw_mdev_remove(struct mdev_device *=
mdev)
>  			   private->sch->schid.cssid, private->sch->schid.ssid,
>  			   private->sch->schid.sch_no);
> =20
> +	dev_set_drvdata(&private->sch->dev, NULL);
>  	vfio_unregister_group_dev(&private->vdev);
> -	vfio_uninit_group_dev(&private->vdev);
> +	vfio_ccw_free_private(private);
>  }
> =20
>  static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
> @@ -595,7 +595,7 @@ static unsigned int vfio_ccw_get_available(struct mde=
v_type *mtype)
>  	return 1;
>  }
> =20
> -static const struct vfio_device_ops vfio_ccw_dev_ops =3D {
> +const struct vfio_device_ops vfio_ccw_dev_ops =3D {
>  	.open_device =3D vfio_ccw_mdev_open_device,
>  	.close_device =3D vfio_ccw_mdev_close_device,
>  	.read =3D vfio_ccw_mdev_read,
> @@ -615,19 +615,9 @@ struct mdev_driver vfio_ccw_mdev_driver =3D {
>  	.get_available =3D vfio_ccw_get_available,
>  };
> =20
> -static const struct mdev_parent_ops vfio_ccw_mdev_ops =3D {
> +const struct mdev_parent_ops vfio_ccw_mdev_ops =3D {
>  	.owner			=3D THIS_MODULE,
>  	.device_driver		=3D &vfio_ccw_mdev_driver,
>  	.device_api		=3D VFIO_DEVICE_API_CCW_STRING,
>  	.supported_type_groups  =3D mdev_type_groups,
>  };
> -
> -int vfio_ccw_mdev_reg(struct subchannel *sch)
> -{
> -	return mdev_register_device(&sch->dev, &vfio_ccw_mdev_ops);
> -}
> -
> -void vfio_ccw_mdev_unreg(struct subchannel *sch)
> -{
> -	mdev_unregister_device(&sch->dev);
> -}
> diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_=
ccw_private.h
> index 67ee9c624393b0..852ff94fc107d6 100644
> --- a/drivers/s390/cio/vfio_ccw_private.h
> +++ b/drivers/s390/cio/vfio_ccw_private.h
> @@ -24,6 +24,8 @@
>  #include "css.h"
>  #include "vfio_ccw_cp.h"
> =20
> +struct mdev_device;
> +
>  #define VFIO_CCW_OFFSET_SHIFT   10
>  #define VFIO_CCW_OFFSET_TO_INDEX(off)	(off >> VFIO_CCW_OFFSET_SHIFT)
>  #define VFIO_CCW_INDEX_TO_OFFSET(index)	((u64)(index) << VFIO_CCW_OFFSET=
_SHIFT)
> @@ -69,6 +71,7 @@ struct vfio_ccw_crw {
>  /**
>   * struct vfio_ccw_private
>   * @vdev: Embedded VFIO device
> + * @rcu: head for kfree_rcu()
>   * @sch: pointer to the subchannel
>   * @state: internal state of the device
>   * @completion: synchronization helper of the I/O completion
> @@ -91,6 +94,7 @@ struct vfio_ccw_crw {
>   */
>  struct vfio_ccw_private {
>  	struct vfio_device vdev;
> +	struct rcu_head rcu;
>  	struct subchannel	*sch;
>  	int			state;
>  	struct completion	*completion;
> @@ -115,10 +119,25 @@ struct vfio_ccw_private {
>  	struct work_struct	crw_work;
>  } __aligned(8);
> =20
> -extern int vfio_ccw_mdev_reg(struct subchannel *sch);
> -extern void vfio_ccw_mdev_unreg(struct subchannel *sch);
> +struct vfio_ccw_private *vfio_ccw_alloc_private(struct mdev_device *mdev=
,
> +						struct subchannel *sch);
> +void vfio_ccw_free_private(struct vfio_ccw_private *private);
> =20
>  extern struct mdev_driver vfio_ccw_mdev_driver;
> +extern const struct mdev_parent_ops vfio_ccw_mdev_ops;
> +extern const struct vfio_device_ops vfio_ccw_dev_ops;
> +
> +static inline struct vfio_ccw_private *vfio_ccw_get_priv(struct subchann=
el *sch)
> +{
> +	struct vfio_ccw_private *private;
> +
> +	rcu_read_lock();
> +	private =3D dev_get_drvdata(&sch->dev);
> +	if (private && !vfio_device_try_get(&private->vdev))
> +		private =3D NULL;
> +	rcu_read_unlock();
> +	return private;
> +}
> =20
>  /*
>   * States of the device statemachine.
> --=20
> 2.33.0
