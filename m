Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0070F6175C9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 05:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9418E10E227;
	Thu,  3 Nov 2022 04:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002E410E227;
 Thu,  3 Nov 2022 04:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667451132; x=1698987132;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XEc7wfdUie9Ei59UJD0oqAva/Dv9OGp5YJs8MvMiNRM=;
 b=VXWGmns9gztyP3eboNOC411nK/Q2O5Zgjfjv5Cc/tW3p0ychgWYfnGqe
 CPa4Pa/TSA7MNoZB2et98GTWt39KoVCzc6FOROHeFF3lX45XlcZsAzbFo
 frL22sfAeXEIrVh21t37WUbacvL0ZkT04k2w8CbMMKyuAlm4tYEVrQXlp
 i5DqtPxwFSj9jpZCn5/CooxuhJ7YVeqHhiUdX/JbF5jP7GKhJZOErEboF
 RORi6qTrL9E1uxVFDcIUNc3xrIfAOYNq/xQ5Qxy90iBTyZh8ydeRzJ0zF
 VvyYpWxzzir0F4puTugCRZztnaihmoaO/OpcvyYJqypmpGoi1uO9dw689 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="307201892"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="307201892"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 21:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="665820059"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="665820059"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 02 Nov 2022 21:52:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 21:52:09 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 2 Nov 2022 21:52:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 2 Nov 2022 21:52:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKs1+olJfk9hEo/zgSJ5sZ9CfIsk8Iw6bcuJNqKyLhd+SayHCg+JjkME5d6vQJR9Xb/faaTYeii5aAZyrVSVeRM1xD4ylg8aztfMu5QYSU6DKIMidLnoHONVR8tUkxqt5bm/0b7SmQG2aGGpCvdHEqiehoeuhvnd2ivZmdPO8X86TPaJZ/dvyyCVr80vZ6OOdf5uxtKeR88EsTq+OI23WpXouMK+i5GH5l7nI1b3E6Bnq0eRntc2USMcUrYpnFU9MIno8zJ+TpOjLRERG88+ZkM/5b/rCGk0EqvzsMboUUxtCN/4ru1opBX59RLNqkS0pajLp5vynEhY1PIyo096Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWV5EIS+Nq9Vb6RQYTfN3Gt6GWGbn/2/oFgw/r3xt4Q=;
 b=ZZKl2Z352FDhnm14tTU4h/v6p6sPcO9mo5MELzE9iEyMZ56z17AunMEH5a/AFfiLj3cRWYY9qHuP0h0fWEf4gY969DBSI4rUeRQP3lkTOXqEUdMZuLkFXf0UgELI/O7Upb3tniTBB2fVxStjnveGn2fKvN0aA7C+w3hjGPj96TJ8CVdJbZk1+H3+Y6fvRvSLmXvtPXo/eaCb+Dqct/lMb3zOok4ip1MxtYjl9d7eZWfGSwOrKzgw/QndAZubW1g8QRI2B4pXPVx52XKMaeSYh9ypqZ9hP3gielNhAjog6apUPzEPhBMBENz4VCsTWQ/fD9OTlp6e+axZ2pbljvLyog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA0PR11MB4606.namprd11.prod.outlook.com (2603:10b6:806:71::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 04:52:02 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%5]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 04:52:01 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH 08/10] vfio-iommufd: Support iommufd for emulated VFIO
 devices
Thread-Topic: [PATCH 08/10] vfio-iommufd: Support iommufd for emulated VFIO
 devices
Thread-Index: AQHY6KK36tKtoJuH5EW7rSfXhdk+0q4pxKMQgABK0ICAAp0j4A==
Date: Thu, 3 Nov 2022 04:52:01 +0000
Message-ID: <BN9PR11MB5276D240CE0EEF0A4F6DF8CB8C389@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <8-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <BN9PR11MB5276B6ACAE7E511770887BF38C369@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Y2EV0e1KcJMuEgH9@nvidia.com>
In-Reply-To: <Y2EV0e1KcJMuEgH9@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA0PR11MB4606:EE_
x-ms-office365-filtering-correlation-id: 1de28863-0921-4c54-f156-08dabd57254d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SOCq5NZrKX/RskvP9UxTNO9yoaHYeEeb6E8Rj8AE2uAVlojorFXQBD7xA5GReeX7pulPKRImCH1Y1CN2sonNLCwjShH9TMX34yfJ0YZ2sZcCokUSatVC98YDXBjyjVYR8OtwEwAlICv89F60oYiNEDUEBQFj7IVrLbnhhqH828sD5GuVRP8WYENkAyfxblqOqHP3DQCTkw5vcZGmUFapuC5yUzozERh6xAw9u2grMUoOn7Io/3pankWiKc2f+hIEWLsJMLFV+xBNiT4fxpnIRrfBCX7+CeJFNO5GQdYfJsBhgX/Ue8TVxzC5oU1noFvD1LMSD7QpiD9MhEcmwrLmFMTLMBfkvExplOfIZjQVGOdzzMOkfp4/LdK/UMYfwZPiqhOL1Bwlz6qL+JMD69Zo70igde9EsGyBy4CPqOpgQqXJS4XT72czs+RrVnYZzsaQJwf2kAFnJGwCta24U2DMGubrtvBMFJHA0SI8oXK4j9x7wxlbAi8ffCUb5t0WZb0Op/S4U3q3VOZOMngL5HIeid79R0X64bsl9lEf+sQL4OiEZsjmh+p9ibS4y1omYDllSZIfLPeQnoJBMPOj56WtkYQ71iqowWm2DYrmXgeuT4vsQswMHIX4BppDCkPmoaLsAfPkB4FThhzHPbhvfpI3Oy5moajdfq2LNf/F9ufHGNGUmpF/F2JGiRz/XMy0MvGtsTom5SggXOfEwJivofdbd3B5CIj6goXxwJ3e7cGNAzGXyJg1tu2ywSETkwL26AEEF/ckictV55mPcPGfp9MRIw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199015)(76116006)(83380400001)(5660300002)(8936002)(52536014)(7416002)(54906003)(6506007)(7406005)(186003)(41300700001)(478600001)(33656002)(86362001)(122000001)(2906002)(38070700005)(316002)(7696005)(55016003)(66946007)(6916009)(26005)(66446008)(71200400001)(66556008)(9686003)(38100700002)(64756008)(4326008)(66476007)(82960400001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9lGKYODyu0u5EiWniCNM/nmcg1G2AyBUo7TT4FJn8Y7B1lWSMRffsvcCO655?=
 =?us-ascii?Q?1IV7Bu+X3mv8iEL5uOeC5JY9ppHrvrvjIMm/xTmbzQ+bgM+4TiQvqEjrnODv?=
 =?us-ascii?Q?qhr/PaTLaf402wmQuGXNjybCIAl5EgNNN7PN444MrC97qFtLCu9m0n+13BsW?=
 =?us-ascii?Q?gSOZ3MNymYXNOpddZgr3kimMgdEmxq1HXFi+i79nfjtBnh4Vw6LcynzSv8j5?=
 =?us-ascii?Q?m+MA5ZtfELPjMn/FK1XuMmFZaMsmqGmaDj83u4v3Eu6jlnXaVUFG1j4cSzGW?=
 =?us-ascii?Q?cDyX2XIC8ecz1SUjtzhvRvtGqmlRosfuqWH39E8RwG86/KrieMACkggmS7qW?=
 =?us-ascii?Q?rCOzbonrZI8flON61d2Du6L4EjKlonccZGzThcjqZYTYUp5nZc1FK2oZ/ZN+?=
 =?us-ascii?Q?OjyB3d8fReJlSi+e/P/O4JFx62MN4q+Zgf0fhLws70vT60a/D5B97P2mOQo4?=
 =?us-ascii?Q?2o4Yl1R1kKuHK/rlhkpfiW3livQ1u2ouVjdEkh+ugrptihZnbVGaUuJJToWI?=
 =?us-ascii?Q?rE/WSVIL8na3QbGEm7qhhsc9B0+2vh23ZKTIohk7lKEZ32LCww6dmDat9hfl?=
 =?us-ascii?Q?xn2epoc7FXKyRJ181gxrgz29t7/jAzw/BBj4kREdUhlmHnj/VoBEszp57bJB?=
 =?us-ascii?Q?yXqZoEfhQuln1U7gADTMS54qG6+NsZh7cRCPcR8diZYKpap+3cLFxssBDm7i?=
 =?us-ascii?Q?U7hz9tf1UZQgFxDDeLS7MBgy/pt1SjT7/OifekjTYraMMNUVEEtPiQGZq7dh?=
 =?us-ascii?Q?v/hiw8bhv8MfB/f/BxpCdkDQYgU23ZpHrVt65uLPgOcZ+wfuaNG7An5B5dwD?=
 =?us-ascii?Q?2exE/7OCzc6Zd9rMGV3mDt//y4VZBzxe6ugvihuutQ/2RXsS9E9HXqqlg940?=
 =?us-ascii?Q?czADEpYy/18ipDPmuQ2GGI67Lr+DWbMEcvbicySd4z/4q3LktIUKs0bFV3eB?=
 =?us-ascii?Q?LdVnH1CZmN7c23k/+8niTPDNsiYnNCfZt2rYOexRerPRL4KvX/zuKpRQwVPc?=
 =?us-ascii?Q?2wKROHFy0vQu+Ys5v7+QIaJU7L0x7ImCBVqaGR337TSZN0XZLAcy/udnIrhw?=
 =?us-ascii?Q?9XVS7EYkMaKrY+BwRYYnlPcitpoeonW3eE3ZACTuA93184LElR0QQHxTbcZF?=
 =?us-ascii?Q?ZShSnA+P8GtDYQdn2PLcIHYbcUV95/i8xZRPmSmcuEvHqOnbKpx1DD2v/aCv?=
 =?us-ascii?Q?ARVNOABCCtf7CcCmqjCZzAWKKycJ2KL+mK9yMXJn7H8d0r4WvDkbRQ+grfOS?=
 =?us-ascii?Q?YF0z+qGUcCrJDaJLOuTY/zwG6bfkIGbKao+XfVtBMiIlmACmYQvWDWIfxrBG?=
 =?us-ascii?Q?jhzVzFm50SZ15CObFRob5n0KiTfyDiOoDCpMKn29JGZRCm1HHIzO8YO+p36o?=
 =?us-ascii?Q?tJp7hGGDE1MKG8Rdap0ElQeWZBF4XG7pW3/moEMzfYq2lMv/JLiUSc2sZT3o?=
 =?us-ascii?Q?fW7yFmUA0vEanhi7EvcBos64t9zNdlg3SOtwRP910uIFOAk7IYn5UtfGpM9p?=
 =?us-ascii?Q?gNGDiR/TmqHN2CgMT5jjMKTgLfe+XLibiRxCp+m0KefagfH7Xrko82ZCmQrq?=
 =?us-ascii?Q?cU0WI4/OFEEUIAKgQdCrdF1hsqnAK/xNOZd1uDPv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de28863-0921-4c54-f156-08dabd57254d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 04:52:01.1703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I6zwfP+yVFlFo0Uflr+DppWQXE24qWjcGRrlKptZ314ukxM3utPeWfKzSMKO/pl5Gh1+QJzIDeDGlaQpWZRcsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4606
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
> Sent: Tuesday, November 1, 2022 8:49 PM
> > > ---
> > >  drivers/gpu/drm/i915/gvt/kvmgt.c  |   3 +
> > >  drivers/s390/cio/vfio_ccw_ops.c   |   3 +
> > >  drivers/s390/crypto/vfio_ap_ops.c |   3 +
> > >  drivers/vfio/container.c          | 108 ++++++----------------------=
-
> > >  drivers/vfio/iommufd.c            |  57 ++++++++++++++++
> > >  drivers/vfio/vfio.h               |  10 ++-
> > >  drivers/vfio/vfio_main.c          | 110 ++++++++++++++++++++++++++++=
+-
> > >  include/linux/vfio.h              |  14 ++++
> > >  8 files changed, 217 insertions(+), 91 deletions(-)
> >
> > mtty, mdpy and mbochs?
>=20
> They don't call rw or pin_pages, so they don't need to do
> anything:
>=20
>=20
> 	/*
> 	 * If the driver doesn't provide this op then it means the device does
> 	 * not do DMA at all. So nothing to do.
> 	 */
> 	if (!vdev->ops->bind_iommufd)
> 		return 0;
>=20

OK, I see the point of this check here.

btw It'd be good to document in vfio_device_ops that driver must provide
this op if the device does DMA.

> > > +
> > > +		/* VFIO historically tries to auto-detect a kthread */
> > > +		if (!current->mm)
> > > +			flags |=3D IOMMUFD_ACCESS_RW_KTHREAD;
> >
> > Can you elaborate why this cannot be put in iommufd as the default
> > policy similar to what vfio container does?
>=20
> Snooping in kernel structs to try to guess the calling execution
> context is bad design. The caller should know its own context and it
> should declare positively what it is. Someday this should be lifted
> out of VFIO as well and into the drivers.
>=20

with the last sentence it makes more sense. otherwise I didn't see
why putting the guess in vfio makes real difference from doing it
in iommufd as there is no vfio specific state referenced for making
this decision.
