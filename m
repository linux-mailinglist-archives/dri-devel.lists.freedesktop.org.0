Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA675420DF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 05:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8321E10E6AB;
	Wed,  8 Jun 2022 03:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E4F10E440;
 Wed,  8 Jun 2022 03:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654660063; x=1686196063;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vl1hS6+UjH9ShrwQJZkRf5OgJ1tSvFIw7341+XDCTbk=;
 b=TT47k6EVN4lWEr3vmH1lkzApFvNQl1SUKyMmqopcdt0hbnOeWBL232e1
 /mSIA30RBkTQvZbf3gnHa4muuHsGx5SlPDzYsqTRoccCRpyv8kmnYhGRz
 Zmcuy7NG2Vf6ueLNXeqFgaxjvxYJESTPFuds+Ud7rLm83+DtYU7TsPbDX
 zjfQXIeraIHEBGE7ezY8ppErPwhBFnS8xHRjMAiz2AkIegmKh90UBDgnY
 IvcNw8u1YW6pj8R7UkyZUwYJdMEdHF0R4+knTGxZx/ocvkZ+hkthTwx/3
 so7cim+gsx73fsN7VS0oWN2ZHuff2a1qYBE2agZls6ThWSr9TWFhE0Iqi Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="277560989"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="277560989"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 20:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="683092629"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 07 Jun 2022 20:47:15 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 7 Jun 2022 20:47:15 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 7 Jun 2022 20:47:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 7 Jun 2022 20:47:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 7 Jun 2022 20:47:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MccEzLwrAD7+Lp11aZP4OYJ7+FnriGcvbohmVzPLmiA6TGJGh8oM+KoGbAJskbKngbHBztMD8rqD5ZbGn3HvcHOGYuG4r3zbOFPjUKOzbuzlNjDYqY9eKw/doSyig++LZeHTL4F0wGPBpD15gJ7VTRgAsszmfACqCQOgUzAzTewNE8K4Mi3dGTkEIp3+DvxYL0XOuADAe9G9Mold8kjz2V8uDwidnkBp7UR5C0i6XIrShWaOQLsmShdFwN2cIAMVzPsHqSrC+a9uluID4MwwlFNRSUrS1SS+454IA55TX0R3izea7aGzIqZC0vzExGo1jsNOpvFwXCk/KUL9hvuFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1sP42UksNXfk57PttoWxuRs7YIN/6hlUb2MsIQE2DM=;
 b=d1pht20LEFXkGNTi3q0DvOpLF3lLGPvAdCguTob7Hk7cDyMdYDdYxOs52/41TWpnP8by5HZ7CttVN5wEG1AwXxBiVAHxelGI2neBMYWdd9R1DCIzvBjKcQuCE7wiA1au0h2rPyO0cJsOmO/S9QmRVky9QkWISTijGsuQ0NhSy+iXKnL8/k8sToVr0MAGPu5HMfcw8L8Nk8kPv1IITREo4r+Av8hcaRaOQDKJteGvWjoI9decFJsnecHlolf/EH2ldmLlY9WY7QlBKLspFDxXyo8+jMD/uXYIpM66+LSWfi/2zKHJ4VQAmA7C1v2yj7+LEt82XlSITn3wNA2axc+/wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN8PR11MB3555.namprd11.prod.outlook.com (2603:10b6:408:82::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Wed, 8 Jun
 2022 03:47:13 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a1cb:c445:9900:65c8]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a1cb:c445:9900:65c8%7]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 03:47:13 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@linux.ie>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Eric
 Farman" <farman@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jason Herne
 <jjherne@linux.ibm.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, Matthew Rosato <mjrosato@linux.ibm.com>, "Peter
 Oberparleiter" <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Sven Schnelle
 <svens@linux.ibm.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: RE: [PATCH v2 2/2] vfio: Replace the iommu notifier with a device list
Thread-Topic: [PATCH v2 2/2] vfio: Replace the iommu notifier with a device
 list
Thread-Index: AQHYesKsP6nJeS6MEkWdYepTqHDKIK1E3a+w
Date: Wed, 8 Jun 2022 03:47:12 +0000
Message-ID: <BN9PR11MB527600F9745D1AE27150CF938CA49@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
 <2-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
In-Reply-To: <2-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cd1e9bc-7eed-4c72-8634-08da4901928e
x-ms-traffictypediagnostic: BN8PR11MB3555:EE_
x-microsoft-antispam-prvs: <BN8PR11MB3555652845FBFE9E22BDFD1C8CA49@BN8PR11MB3555.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LqHcmVy5P8gXE1Mlz6bDjAPSCaE4EJC0BILiZlSmBqj4p/qLd4YqRS4bY0+qKePy8CS/s492SIWbOKlebjn2+kevJUsO3CWkuI5OWL2qV28yjX4GNJvDtRu6OmeoBqNV63G740dc+0qgjEIjqBIOk87ktWF6CgJEg03AAhvUyBhVqTY+VpcpaKgqqb4SeyGYvNH35fz5unf5ohnF423efO5nak6duRNkmDIAMQhuVAMnF8LrFc9xtYC/9zpu22ojU6JRM2bnwF20QDa7R5sxOOo4ACfEscYeMJMNkKjE9rIoEOS7ZwcTzW4SbKGqDvyb0eape8vZR6GvRjoNjNdvREU7emwK0TNS4evalDENGKndYMITmcLQWghGiVwY0/E0jn0Ebnzr/jcdegHqX/ha9m32hmuF9ltu9F8twuX336JNpjY0CIlbHI5SgVWgjLUIA9nPJq0f70gNZNftlhnntkG2mT0MYZW12Cmal7IivJRvP6SJi7E3J7ZzNKSsXiGCfDHEdyqtBAukm4sIzkAp6X4LVDHCzFnlyKcxxKrWmJ8W5pxaEiW6fLDDT64UKsiFJjlBxNg5jfXfCpGDr5fMQRD8vr0ZelggImIhQhmq1nW47ArMBKI+nTxx00kvj1GShIuV2vYEAb/JeOJi6z0/HsBUTJAYdVW1mUuE87/SVu96gRViJ/G2Mv7ZZPyQZp0Wu3XyuBScuL2hNEDyFvqNJCP3FxSCUG0YE0QL3HGIPm8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(55016003)(110136005)(83380400001)(6636002)(9686003)(33656002)(4326008)(86362001)(122000001)(66476007)(76116006)(52536014)(26005)(921005)(82960400001)(8936002)(71200400001)(5660300002)(7416002)(508600001)(2906002)(8676002)(64756008)(66556008)(66946007)(186003)(66446008)(38070700005)(316002)(38100700002)(6506007)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mc54iaQrzvKJ2HGFuesmsoXF2Iy90gW9HI8cxCzVax61lhiA7gvo56An4oLU?=
 =?us-ascii?Q?uSA2oKI+G5gpsqJfY7OSskUe2YNtnhrnq2z46KcEQuSpH/MxX2fT2qa8ln0+?=
 =?us-ascii?Q?pW73QdxnKH9Q3eHGs15CmB8plTgie6XCcfnITn1kEKisd1J0UPMXmW7NckBf?=
 =?us-ascii?Q?M6XlHG6gvPPD67Ky7aGyiFuowXwGFfWNv5SxlNgfK5k+RAjDDTldYaFq1uwm?=
 =?us-ascii?Q?sz3/cvU0l5BqkYYnXVCwWkwKTJUwM1zNmho7VQt34bdI4mYzEMClYtsYQw87?=
 =?us-ascii?Q?fil3dfXgFedw/zAvPADbVDe0YPyfOuOZbM65LLigOXqHPUtpUhwhGlH4FhcK?=
 =?us-ascii?Q?pJGPl9EEzdCTPrpZg+ehJiAOxPbeSwswAM70bzeFrKLuBGWgXUKlZhJcJKg0?=
 =?us-ascii?Q?G8H94Iqx85jDB2YVyyji5pmn4kBMJVotdRh8H8mTQv2TDXr9U0tR0OWttLWa?=
 =?us-ascii?Q?Jkb+MlVZunKR/XYFESda29Zl41GNeUSTD0WbM7ttsW+C+4go/7l+QKAmDZaO?=
 =?us-ascii?Q?0aMmEn0XFrzp5VQ9Vrg73mpY4XuKX6ZG0Fk2iM4lR36T+ebKDQD+PDgEi+zI?=
 =?us-ascii?Q?R9EI9wte1kEBwL5RysX/jWtSv0XrsKdVkw0P5RB8bGPj7VbGS0JDUrZD3aL1?=
 =?us-ascii?Q?MpvwJOhzdL4IqyUKA3gq2S5xl/EkctIPsul5pZYAmUFvCTTlUrIAEpkgB5W/?=
 =?us-ascii?Q?77hjUgJyVLRZFMdm5RFKIkxbhCxPlnHzpQ2Rgymo+1T/6DvZpN+i+OQgzvAQ?=
 =?us-ascii?Q?/r/V8i6XwFWKvDUcIkj0lX4dnCN2gzuh1ePpMN5HkxKq6dUPGZJHK6//Q81U?=
 =?us-ascii?Q?v0NNvmy7MUukv8BIwrjbdv0S/UddJcJXSKKykvGVHlP4PLvV8DnPHUngSV+c?=
 =?us-ascii?Q?fDI1Xwt1NPHggBlHAB2L0FpFRoCfvbtdL57OI6aXamShBxF8KnblgqUqAwJq?=
 =?us-ascii?Q?J+lhEDr/TjThkYyYHccyLwa+MqPSMFRbMS3oMx+HaUtfm7GdoerRx7q+KFT9?=
 =?us-ascii?Q?wO0kcYkSAOBmYmH9H3ClDhhEoqHF0nFA4Uj2nnVs3etOghvslh3ZlEbbDS7z?=
 =?us-ascii?Q?z0TvIeiGGwKa7bzbGRgs+s8LyjwdIu51DRJnNJKdbjyYuOwSd+5/1PPoJhrh?=
 =?us-ascii?Q?UEcPZiDPlbgroJ/SxmKimJfv1j9DPdKJq4vUP8ObmEusOiTzDOFH9oze0SLq?=
 =?us-ascii?Q?vvhdwzVDQMNRCy4H7BuMQHXoEtSSBhafBTM3oIPs3C4oNnaGzvNlW9pjmm8a?=
 =?us-ascii?Q?IJX4hYkw1puaRBTjQWUEcFYwfPjTHBQyEJOFHJgyIxBN3E5Dozjq+i1gRLOA?=
 =?us-ascii?Q?mP+/NY5JDnEfY+j8McJuZ+naDiUprJ2KJkGHlzAiVExwyBeeZsuFCBH6LUlb?=
 =?us-ascii?Q?UtkwfbKVK6Sr5otWLkhsdSyLq7VI/vPtardaHYKYJYF7dNZvI+jA0EqjzqRM?=
 =?us-ascii?Q?aKHAIW1QizY0TvMw2qZsg6EwDo6gPSa6kC5oKIO4RmQgrmriFIWTz1sHnCMe?=
 =?us-ascii?Q?1glWmjTsGA0k1peHjj5daFG/f+/JKxx31el3mHpP2Lss7Q84NWr3umo9fPIE?=
 =?us-ascii?Q?QQPG+pRVFLbpYymnhV9E2W7R7OCqatugcIQb5m8jx27xmFblneRc3eqwzRYT?=
 =?us-ascii?Q?OObBNzGtzG7zuv6sstXTmdCTzsUX24F0blMfYZAqrD6rLZfbXLH1XnHo/kJj?=
 =?us-ascii?Q?qHgJnOonia3jy3kocNdf7V3cJ+F+MIPphKYn5DEp6U/ixpSL9OMFTDv19wmS?=
 =?us-ascii?Q?Mx9rOQPYCg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd1e9bc-7eed-4c72-8634-08da4901928e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 03:47:12.8799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z3Q0m1t0jyCxxh1JuAhy51dU105/iMvceeNx/5yZaZuEk9bUu/zdPx0mqPl8G2rdOfBOmDtqDS0Ln53uP+McIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3555
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
Cc: Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe
> Sent: Wednesday, June 8, 2022 7:02 AM
>=20
> Instead of bouncing the function call to the driver op through a blocking
> notifier just have the iommu layer call it directly.
>=20
> Register each device that is being attached to the iommu with the lower
> driver which then threads them on a linked list and calls the appropriate
> driver op at the right time.
>=20
> Currently the only use is if dma_unmap() is defined.
>=20
> Also, fully lock all the debugging tests on the pinning path that a
> dma_unmap is registered.
>
...=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> diff --git a/drivers/vfio/vfio_iommu_type1.c
> b/drivers/vfio/vfio_iommu_type1.c
> index c13b9290e35759..4ddb1f1abd238b 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -67,7 +67,8 @@ struct vfio_iommu {
>  	struct list_head	iova_list;
>  	struct mutex		lock;
>  	struct rb_root		dma_list;
> -	struct blocking_notifier_head notifier;
> +	struct list_head	device_list;
> +	struct mutex		device_list_lock;

emulated_device_list or unmap_device_list, to be more accurate?

btw a few lines downward there is already a emulated_iommu_groups.
the two sounds a bit overlapping given mdev's iommu group is faked
and singleton. Wonder whether it's cleaner to just reuse the existing field=
...
