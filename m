Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18E624EA2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 00:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8274010E143;
	Thu, 10 Nov 2022 23:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0692910E16B;
 Thu, 10 Nov 2022 23:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668124712; x=1699660712;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v4yLk0izUnlaIlMjrMV86bkCA0Hp3Be40jQ8sb3xkV4=;
 b=KPhHKmokLJ6pUcRokhd64C39nlCwRP5AiHlxmA+wdRo+Zw4tucRV6p90
 TfZQToNR6sqOlwJocV7QFnEPkqLGpjyVqv1IO3snI9vaNgFFoxOaHgaFJ
 PhVVdTVQdo6kzY5PY+y60i0E+bifTWW+6w9D+eSVoow3P/u/Ul0jq1k8o
 KCCXQYnt5i08+kHS8eDcUJJ1/5kcA7bWw24iW7va1na8U6zH8qwSpZzev
 7mEinDsuQiU2wo1xNB+9cAPP7H2d6DeCPkv96BAuYeMe6zMYBcFQbTuj3
 xOKmjiGbGtGvVuV51ihTPV10t38KO/w5eB9cJ6DhSTOkfMAuv1sKV2HcZ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="312613477"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="312613477"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 15:58:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="615297689"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="615297689"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 10 Nov 2022 15:58:13 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 15:58:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 15:58:13 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 15:58:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0aFPEbL+3zxfiBzKGJ9sPlbqoFWTVSM+gk26Cj9s6O20uRdSbh69+WqOA47nZMLAtvmnxkX4C2J5H5Lh7wOsGANeahxS9OdWYblBlpSpifBevsgjTKHo8s/7d0K0XFXXyfOFSy3tplXZa/xBIAJMjlXOBIKd5MF9BFyXVSNw4HbOtJdiLAk26Mehns/ljijLsGpF2frrppcwzpaCAVuiOHekt8nnhhvPGsZWsY8RevMeaKKLP5lQzQKV6aKUxC/GL7+EkSOdYfwJtfmbHtmWGiCKGwOZpqBtV4fL9YJFxYr3n9nn1FZjASus0dR+jauVRYOtwIKpXjl7gplcJhRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiVN2fTijuAGMdFT1irA1KXhiLAJq/HNCORNZE5lk78=;
 b=DgSiNDGEg7+S4N+JAIL+UIOvTPWwL5w9qUNiJMkoclwg/kGmdc8XJ/8Xo5n35Tc1Bgzy1JMgMaQyuIZaJktSyvD8PqF5844v2rDFH97aMdqYobGO/NKdPrcyaHVGFiYDU1fLJRpYB51Q615VG5oj9AIFEOJxSe/jSGezXZCCgfhZfVrQ4za8l/SPI0VCLuW9rg/P/8c8kXU+oqNBYuVPsVyR9l+VXSs8AaVFSR3iM69rm2J0yv2U/RybK8AeQUQez4Ek7ZjiFJ9QeMKhklyL8gUxBlppYAhFcl26FLg4KOwSJiG4x805LH3+2kw3U6rwxoL9ihZC0gV5PonXGA60mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Thu, 10 Nov
 2022 23:58:06 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 23:58:05 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v2 07/11] vfio-iommufd: Support iommufd for physical VFIO
 devices
Thread-Topic: [PATCH v2 07/11] vfio-iommufd: Support iommufd for physical VFIO
 devices
Thread-Index: AQHY8wx4zHuY1VxYskGoQhcyiXm8Ka43ee6QgADxewCAAG3YMA==
Date: Thu, 10 Nov 2022 23:58:05 +0000
Message-ID: <BN9PR11MB527683EBFF79A8DAD22E1DF58C019@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <7-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <BN9PR11MB52766AA1ABD4EEDA30B696C98C019@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Y20y6MnCn+pqXcnI@nvidia.com>
In-Reply-To: <Y20y6MnCn+pqXcnI@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ0PR11MB5150:EE_
x-ms-office365-filtering-correlation-id: 46da331f-f953-4b49-ddd2-08dac3776911
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ki4FjmDu5dSlLofk/plbuN0lv5BGXbC9eppRWjryFOlBRowGyAcVB5bq0cucMGBqOYpgG7vj2rxToEWTlQlFQ1tKQpZtte6pxvC+7ztsHpaC4wpcN6qXA1BFwc0IY+OFajaKnIKhH7TQ7ttswYlds5L+igEsR7Ao1QCm8jVq1xjU7N/LhpYCXZZqTwuERwhTWjfd+szDhgjgF/yEwWdjItW3JowwSSs3l0KB/exLOxJ6AqA5Z4j9u51xBCMlCpxKKGoLWGgX5ela/l3fxqdqzmDOaoOcXWvcPG2KVCtnG/tOCnobeCRPa2RwYjy5y9CdzSnveGyiBeFMb1AM4yOHbcH4o9FvFl0W1QmLP2939ew6YOLqwcQH55BKiURjrZ2ZmFmKiMbt3QWwziT8lMNLnnGEPFy2wZIByHs9UwPWtqZbyIRm2niarBkM8fbEWmz1IIWudtMz4dYQ20zj83EerWi4sCAWDW4sz68/PMGD6UCM864+wf84nh46UtN4+6nQCsmXstmAApequpr2JVUa/StxfToPnf326M7zPOExzA4EjZGjfKZCb7VtJpoye0wWGf90WRDL2/2OReeRhjQBdh5nGNbEQOYuy0HTXwFH20PvIbMtH+mcXeON1jAGReeYhHc0QPsczm/MZUkzGVg65RYpd/AVAaGSW/N6bAlaUilWZf3D8Layg5LpNnhvE89x02rYalgR8s/zWhfk+3h8/0aXKYT1lZx32uBqF6Pw50MaA76y57xn88wdCCoSjFNn5ePgU/aKZsxB8oLnAK+ibFqa7ngiW/yM1swfwen1Z8Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199015)(6506007)(83380400001)(316002)(66946007)(5660300002)(64756008)(122000001)(66446008)(6916009)(54906003)(66476007)(76116006)(8676002)(52536014)(8936002)(4326008)(66556008)(82960400001)(86362001)(38100700002)(41300700001)(38070700005)(33656002)(478600001)(55016003)(26005)(9686003)(71200400001)(7696005)(966005)(7416002)(7406005)(186003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?00DVYmt2MevVyhMNadpbxRd46AHuYRZJAQjlGbaeePFL34nyHt59d+Ew4m2y?=
 =?us-ascii?Q?65OW+QH8ajDh5MIEiMDqwTXJfdkifWVsm+dC2OYLJwYJxXWJbxnwQ6j7aby8?=
 =?us-ascii?Q?B4Jn7sw31QH38jVKrbbx1gSTfU6VMI09kKsP5szfoHzrfLXmesmSzEA8F/h/?=
 =?us-ascii?Q?YSiF3OT7y2p8lnbijStEGVCy/m+9y1qGsU3IVc5cbXkGBAYPYN/duOYMYD3u?=
 =?us-ascii?Q?g/yJGOjBVVvdA+f9pdnaOwhLG9dJHjHdwD9yUkMFWEWcxgzoIL4JIyhV9j12?=
 =?us-ascii?Q?SMIJBhnGoUgAQEsul9E/JW70UaoYYDoPZwtBTRj+Nrf4RKenJSedFg+HUkz+?=
 =?us-ascii?Q?43AY8itHYp8Rlv1SoS87LX8v0egs5Fuo037kWUe0yLsjp1dFReOp/MpzVbJc?=
 =?us-ascii?Q?1hRC/IadisCKLoo1vCf4SJie4MeiSMV71NZgJsm0AOFqeIRZplhRgv1OMnQ4?=
 =?us-ascii?Q?pfCf2KFxZFbrtEy3MduVMyK+dwhigbzMhDBcM/1iUjGeP7Vrd6HeAEdtAtQP?=
 =?us-ascii?Q?j2ETmqxgyGDrLsC4cDf/8ASX16AvOzOTCi7I+/aHM13E97ztOfe9ALwZUGUg?=
 =?us-ascii?Q?uTEMi7n2/F700lp/nFuCVypVpZNWTxWJPQP5YVZyOTckJL1q/jVFZU7n072u?=
 =?us-ascii?Q?Ua23MdNESZD2p3ILOPXi0UfXQGcUI4hkTLgdKQAY8B5Hza79uMpLFZy74ZTr?=
 =?us-ascii?Q?nYAmUOgq3+DFJ6AxZQMzFk/TPAUUpLbGxBQjBvJiCHWpWqoeoaZIxX+sa4xp?=
 =?us-ascii?Q?rjAta+mWSrPEZ2/NkbZ1dkaspSeCxBULKsD44HJw6DApS8F+//hYTPbcleeI?=
 =?us-ascii?Q?FSv99q+HOMz4L7SLIFLSoSshhxzikqKjHTeZKjXgDo1t2Lt+/jqG7GPZ3s99?=
 =?us-ascii?Q?fNA3TyXnpLKOs9NXMOB9Jc/6LhYcosEhndmhETLqCwt3B8Pzf9ncS9sXejxm?=
 =?us-ascii?Q?pBOT4oAOYhlERzuaGSXtGDGxtXmyOambAf4Gl1MFLFV9OZiz6aPOz75XAvPR?=
 =?us-ascii?Q?4UqC8JhcNdIag2yuAbPK2eY0TwfTLsgeSZYtfMhu9a0yVSDikh/PgvnGZMs8?=
 =?us-ascii?Q?ArjDGx4cFTMOMleFOGi8E6zvE/GnuwShfhs/2bGVurzFZmjs7D+BW2oCJf80?=
 =?us-ascii?Q?7M+2pmPiu+hu/+/Ut7so38ZbPbBIFu/BbRo/RbLbnJXOm0PZLUDq/4PaT/+V?=
 =?us-ascii?Q?7WOQejCxk7+zVVPbTH9lmYm/+kZYnwQjuLuPh+8kSEsl1LWZVyObfX968fL6?=
 =?us-ascii?Q?8FFEnXOOFYHAKPKm/AzDoC5kVNlQ11OtFqTwz5+wobT0ydX+TDL6lFYHUHof?=
 =?us-ascii?Q?c+iJt7ZTHSJcxqUnD1bqY8P3aB0nuqQVXj/8+xyL8gQeHfYqfFyUIURyVRUO?=
 =?us-ascii?Q?5LN99rmkUEeWkm0OrFltomhPmLFAgOPRTfzZRWsLncRc+u8AubdEvT8Da18a?=
 =?us-ascii?Q?WXn7hsP0U0xzz+IXnosoaOyx0wCeiuDcTrjq0QQvMRH7zwQUn3gs9+0GnemQ?=
 =?us-ascii?Q?5qGmWu6POB6eGsOE5tintWf7nErWpCOVZ8ZBfda+XaHV/peRZq33RChx8LGz?=
 =?us-ascii?Q?tQ7gj5JvWkRiAm7HS1YISZUqOObWk2TMpQ9/xdKu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46da331f-f953-4b49-ddd2-08dac3776911
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 23:58:05.7180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sNPI0aXBWQcOmGl4/Wn29vkydOVPjUa2/9/1Nkd8aeW502mnR7Kapxs58W8oEL+EphbsPY67HJ2XwSRu8cpXcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5150
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew
 Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason
 Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Eric
 Auger <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Harald
 Freudenberger <freude@linux.ibm.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Friday, November 11, 2022 1:21 AM
>=20
> On Thu, Nov 10, 2022 at 03:11:16AM +0000, Tian, Kevin wrote:
> > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > Sent: Tuesday, November 8, 2022 8:53 AM
> > >
> > > +
> > > +int vfio_iommufd_bind(struct vfio_device *vdev, struct iommufd_ctx
> *ictx)
> > > +{
> > > +	u32 ioas_id;
> > > +	u32 device_id;
> > > +	int ret;
> > > +
> > > +	lockdep_assert_held(&vdev->dev_set->lock);
> > > +
> > > +	/*
> > > +	 * If the driver doesn't provide this op then it means the device d=
oes
> > > +	 * not do DMA at all. So nothing to do.
> > > +	 */
> > > +	if (!vdev->ops->bind_iommufd)
> > > +		return 0;
> > > +
> > > +	ret =3D vdev->ops->bind_iommufd(vdev, ictx, &device_id);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret =3D iommufd_vfio_compat_ioas_id(ictx, &ioas_id);
> > > +	if (ret)
> > > +		goto err_unbind;
> > > +	ret =3D vdev->ops->attach_ioas(vdev, &ioas_id);
> > > +	if (ret)
> > > +		goto err_unbind;
> >
> > with our discussion in v1:
> >
> > https://lore.kernel.org/all/Y2mgJqz8fvm54C+f@nvidia.com/
> >
> > I got the rationale on iommufd part which doesn't have the concept
> > of container hence not necessarily to impose restriction on when
> > an user can change a compat ioas.
> >
> > But from vfio side I wonder whether we should cache the compat
> > ioas id when it's attached by the first device and then use it all the
> > way for other device attachments coming after. implying IOAS_SET
> > only affects containers which haven't been attached.
>=20
> I can't see a reason to do this. IOAS_SET is a new ioctl and it has
> new semantics beyond what original vfio container could do. In this
> case having an impact on the next vfio_device that is opened.
>=20
> This seems generally useful enough I wouldn't want to block it.
>=20
> In any case, we can't *really* change this because the vfio layer is
> working on IDs and the IDs can be destroyed/recreated from under
> it. So if we try to hold the ID we could still end up getting it
> changed anyhow.
>=20

OK, this is a valid point.

So a legacy vfio application doesn't use IOAS_SET so the backward
compatibility is guaranteed.

a iommufd native application will use cdev where IOAS_SET and
compat ioas are irrelevant.

here just we allow an interesting usage where an user is allowed
to do more funny things with IOAS_SET on vfio-compat. Not sure
how useful it is but not something we want to prohibit.

