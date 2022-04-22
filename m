Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317E750ADA3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 04:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8199810F7F5;
	Fri, 22 Apr 2022 02:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF6E10F7EF;
 Fri, 22 Apr 2022 02:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650593497; x=1682129497;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9f9CqSkkYUsOe4n+SNlIA6E6YLnkx+bxzAP+sEVhSss=;
 b=Kk+GDP5oDd0xvAkiD4/OdsL41Gl8JsBYW1T0DJp1YuxoKRgcOtK9+Ie4
 lF9MWHdfz47gX/CRWCk5BOdOCTGp/cJHciPDuWbfjjRLEws5U77KofUvO
 scbHvlyvrQc+gtNxByeedG2sisPDJMPBQLmMmkFGSZtwinr312QasTg3L
 j+vb7S4Vhb3wtGxTSeLzSVkUAYLgh+p0EFIqDvuQQ3vH4A/Q1xEsakBlV
 klYH/gZPTjs6YqcSMGKXQheya5SOS3yy/Puelx+IVSB2A3QbxdcfPonf6
 +6qWXu/612F03bq3TFc6yviuBHApojcp6C4ZM96aHWT3Rr0dEwcOU68Pt Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="324991361"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="324991361"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 19:11:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="577599094"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 21 Apr 2022 19:11:35 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 19:11:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 21 Apr 2022 19:11:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Apr 2022 19:11:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfvHAbXIIwJ+3hdCud4bfiCzkeARAI/kL6/AMbZSrTUmtz4Chg62zzfYF1YndXxWV+hIiQd2eRXQGJnx12XejMo86PzMX4LpMRCbv5WwJ5wahwCauqym1my8kcaBtJ3YSFlpAWC2SRMCWSUT9Fhd+qgn6GHOvyaNXGLgighMczCwEsuSd7gkKqguU6oqVe1jvMnncCCTncaYZQhGVGN/ot4N8m7FC3rCjkHeUmjL8t9sTgU0gZqxYLqaGGkrwS67jO2EW185mNn0jx1w1Igae4U0xYLvj/pSu5oQyWGPcyr1uE66Tldrp9HmdJHoZ9fKsPjIkFbXyIUMv0yPIUSklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKmz10Bn7FzcGU7vxmrFwyVJWA0uBejXQDjeYhxZjD8=;
 b=JnBz90xONlGnkEwmv1AuJWGR+JhF2VPDFDeMnuP5uOhSqegi+VnPtFWsbgPqF5F4Z8f9loTqLCiJVA6+DIJqASa1KKApaW+Lj3+5JO0UJgFAyWXt2WuUOpp5szWm8nMTe/ezRHaJlXbSQVphXTdHtKXg2/dXFAud/4x80XYRk1Fbq342APcxaVLtBlQsQmhyYO2A/X0qnJprpAg/4BQpGVjUHaFko5r1dV26oLm/15hjaG9wM4Wp1cCeHN+AcOt4EVgyveuIphlMOBQMrujGUsP2wNz+tGjApeRwFPKiHuYi+VYMBnO5QLIhRJUy/FIWuIWlD7Vg/GI8lPSqsqw9nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM5PR11MB1946.namprd11.prod.outlook.com (2603:10b6:3:10c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 02:11:27 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 02:11:27 +0000
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
Subject: RE: [PATCH v2 7/7] vfio: Remove calls to
 vfio_group_add_container_user()
Thread-Topic: [PATCH v2 7/7] vfio: Remove calls to
 vfio_group_add_container_user()
Thread-Index: AQHYVZzretkXcd5b8UuO7Rj1vEUQ2qz7MHVA
Date: Fri, 22 Apr 2022 02:11:27 +0000
Message-ID: <BN9PR11MB52760B405E5F68C2155492078CF79@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <7-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <7-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d58144c6-9fa8-44ee-c24b-08da240568b9
x-ms-traffictypediagnostic: DM5PR11MB1946:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM5PR11MB1946EA793CE6573DF6C93A188CF79@DM5PR11MB1946.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lVnJcwyL7neIhJvIbRN1Wf57a7uGxL2nogXtKoTAfnpBUvWVgi03zCvfu1uChSE0THK8UcRE/TxO0unFYlDvQSe60QFPHvWJ6mF+SRj/hIwoTVJ3Szf26ErL8MK2Ygz2TzE2+DeEX0JBiqQB1Jr+LmnjuNwDym+hOS17efj+pgLuf4JiCKd68QbT+MDea+hcSreZlaVw6YfoJXArXGHNGLjINLUWVWVzU2sHUtSF7miFFTQh7638Nc2s12QZb0WdaxY2AnCqMqBYrv94EMfAZzfk9L+Vvnrvg5ffYgb/U6s15gzsneRAmd7qE3wP2qUoIqCAf/xeTeu6eUOu4dD/Q+ahZ7LEIq9HlY+gTPIjnkUOINwJHq6sYbUzsVm7HIRxi+bi9z4hvfuAgLKAVI0PgibxXXpwnvChmIvVQXL45LGYjm0LBn6EPTfuNA4Sdxg0Y1YUn20HKcYHa2ImgxxTy5jmE6pjjEqE0e5BdBrZChTAeI6lezv59/ERSO8i745QqJLKYTIprpMQBvCvPAZ+KcK5JTJkbKeGyl/Q1PBzM5HKWR0lMmuwZswrRH6VhZeEfnYQYgysNFKqUkz548Qyqw1Uka/FC9TMAxscGUBGiI2O9EfbUphnPm9k3y4XmrJzgdeAZfvwc5iZ/7lb2lwm+EcmPp83KozFTE+Ww4ZfDc5ZovEab9b3sWsSvFvq9VVwEHmMNzYmvFpusVlR8S+nt0zgLzqZVVMy9oq8GQdJNFs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(33656002)(52536014)(8936002)(5660300002)(71200400001)(26005)(7406005)(6506007)(66556008)(66946007)(64756008)(921005)(66446008)(76116006)(8676002)(4326008)(66476007)(86362001)(38070700005)(38100700002)(122000001)(82960400001)(55016003)(186003)(9686003)(7696005)(2906002)(316002)(54906003)(7416002)(110136005)(6636002)(508600001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hVeTUXZnWmSe2gdd1UqfaF8fRDc0qqRfn4Oc2rsrbDhfh6SqT+u/oDa8iCTQ?=
 =?us-ascii?Q?TMPkgHp52BYvaCxGvHgcIO5x7i1gagnp63mi3qvxikZTs1ht5Pkv2hDLSc73?=
 =?us-ascii?Q?nbHVMWM85YMltpElmn9H8D6raUdkne1yQYkaOMP4ig+D3iMtf4H02hq6hL8Y?=
 =?us-ascii?Q?JrI7rYQMqE+ttV1anczbV5mILakfuAK0zf1SfAQJMii2UXtz8s4tR6nA80O8?=
 =?us-ascii?Q?LaVm6EdyngKy0O+skigxn8hGFkhzpdJc2jCudB0ntsUkVtmcuD+O+ikIxr7w?=
 =?us-ascii?Q?E3YYqkPVIWYoIm3yGpa5tenl/lOsAN+vrJxEUYMZSdP1kTMY52GE+8EtjS/j?=
 =?us-ascii?Q?LbdZcwBfcRgFCJvfNCYyPBijV6H6j9rjXRmTQrxy6ucGCT4XRNuCUjXDTJoy?=
 =?us-ascii?Q?7tVdM2qEpES0jrOenJYE42bDgtwaIgFQYjvcYhuH+TJ5A51oGZu0Xb96huQF?=
 =?us-ascii?Q?GD7zpT09PAfwLCHXYusIaXKLy4siJ6sETpzQRlUJ/1Dlfb1sJwVgmLsSSIsb?=
 =?us-ascii?Q?vIL1cKo7Ao3PTOXJkb02nIaa9xS1VwMfGe0UftsH+ZrxaOiAwP/MToHfYhLv?=
 =?us-ascii?Q?H30sWjAHJ/k3EIZaQs+gAfk/kE7AKfvIg5O2dC69HTP+7QcNiYOP4FRow9ak?=
 =?us-ascii?Q?/HtLAhIDT4X9f2vqAcqehientkVDZn7h2LSjEDJSIdIwC19JC7CXvgocso8+?=
 =?us-ascii?Q?pSb8pw7cWxaexsqu5T2iKmZKEemdVmCKQImdBjFFcALANXoGfvENR39lyceC?=
 =?us-ascii?Q?HK3dJWhA3CiNcgYv7/z4gu/vF5MlVZoWFaLDNh5B4HbGzdxV28b6dIz7Pk72?=
 =?us-ascii?Q?CgcmaW7hUq8ZCXWr5PA0MRBQtxAT4ixbOnKZ2LEUwezpTGSp0TBP6pBbcFa1?=
 =?us-ascii?Q?FJRLJEx4DGy0Bdqog9uZdh2iSdFlR3XTkwCVubNzOnXQAHpLwMtklNdvb62F?=
 =?us-ascii?Q?NmzrZeAMhgSR6BpNhxsoaGIhxa3XKeTkj2sy4dKS+vOhmjs3vRvpeQuQFRJZ?=
 =?us-ascii?Q?fUX2ITokOPv4h4nDrX2yL4AybiEzNx1iAK0pGE4P6JFX9ZMSmimbKRCrFW8P?=
 =?us-ascii?Q?W5/6VFKRnKs9O3svtsdJqbGiGgACkqWc0aKkiE8fdzTJWtA0kJ8ka3TqX1ef?=
 =?us-ascii?Q?5AdOMRG5gtlTWY5Ouvd5PR8LxaUtvZcLBy4STJvC/l0d6lWynVG8/5R5dFvh?=
 =?us-ascii?Q?mTjoFFuJP6Af7SWqb4Vu1dEls9AakO74s7VPBSdepWjz1fnsLaKCQSEmNlMg?=
 =?us-ascii?Q?DME2TSg9sInbZT4zrRMWTNEgn0D7w5d8u/7cm0KoDjmKOcJN+2Kkr53Oke1j?=
 =?us-ascii?Q?1EewpZjBaY1SIJ9UYpXWGUmspZ1OSYwFUMfi3tsczuSDjOxkwVeSnhgylwd8?=
 =?us-ascii?Q?axV/BES1cXsD2MavLXUSMSuhKzjtXyRTgNdf/vaWBsa5l/RyGlm5TmOyPFf7?=
 =?us-ascii?Q?EW8k+h5fJoChgjuGp1Dn9qn0MzmOfKxPScgjmILycpLuWG3B14cneQ1C1icZ?=
 =?us-ascii?Q?UXJqN5amMhSPpmihJG92PoJmEtZ0/t/8NyCm057pcgz7dqfnmo/P+8+NVpg1?=
 =?us-ascii?Q?wJuPgr/Svq70pA1R1nmbz6JiPaizjordUKIs0F85wKz2a8yECyaj0cXIHqWo?=
 =?us-ascii?Q?P9IK5cw4Ea9jcpNRFrNHdvmNhmy3JCDpwdU8lgr6eqxBaDJG7T8Jsdsx7tCN?=
 =?us-ascii?Q?Yak9uD4vdLMZUgxz8myb+nS7VmtThe9PD1Y12efKajDGtxLU/1vf5r80LS9H?=
 =?us-ascii?Q?kazZLFrBcg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d58144c6-9fa8-44ee-c24b-08da240568b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 02:11:27.6474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6CAP1cCJ/rEzHrYHqzK46qymWLs2Ty0YO0lbuKmCFjCG/CFjQUpEnlOzds/QQBWNCJ7SjgrEvg/tLoWiD7H71w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1946
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
> When the open_device() op is called the container_users is incremented an=
d
> held incremented until close_device(). Thus, so long as drivers call
> functions within their open_device()/close_device() region they do not
> need to worry about the container_users.
>=20
> These functions can all only be called between open_device() and
> close_device():
>=20
>   vfio_pin_pages()
>   vfio_unpin_pages()
>   vfio_dma_rw()
>   vfio_register_notifier()
>   vfio_unregister_notifier()
>=20
> Eliminate the calls to vfio_group_add_container_user() and add
> vfio_assert_device_open() to detect driver mis-use.
>=20
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>, with one nit

> @@ -1544,8 +1550,10 @@ static int vfio_device_fops_release(struct inode
> *inode, struct file *filep)
>  	struct vfio_device *device =3D filep->private_data;
>=20
>  	mutex_lock(&device->dev_set->lock);
> -	if (!--device->open_count && device->ops->close_device)
> +	vfio_assert_device_open(device);
> +	if (device->open_count =3D=3D 1 && device->ops->close_device)
>  		device->ops->close_device(device);
> +	device->open_count--;
>  	mutex_unlock(&device->dev_set->lock);

Is it necessary to add assertion here? This is the only place to
decrement the counter and no similar assertion in other release()/
put() functions.

Thanks
Kevin
