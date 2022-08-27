Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE2C5A3710
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 12:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE92C10E768;
	Sat, 27 Aug 2022 10:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EB310E66D;
 Sat, 27 Aug 2022 10:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661596749; x=1693132749;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dc9JABO9trpUkMP1D+9natNZCFqu9asROURbPxiBDXA=;
 b=VLZ/lvsZ0Wn8xKisrYyXOuNipEvGs1vZALDB0c5jf7u2wTJtlHVGY3lG
 vhF+mCoEj2qrgfDYlvgbsgy7tXuon6PTcNJzHbpJjmYcQPoAt3VdCZPT7
 3dSwkoAOJhoPKkB1+f89+flISre1HmFhtHaxytRYWnogHtFFZfx/3gIho
 Ss9iYbfEjEbo9+qP+9k7ljDDHQlYv8j4eX2XmkMErMuCPldsc56eichTg
 YliHHhP5+I0kyRttgwTTtf7Qr7nrH8D3hRHbMKWZK6jIyWpFEREBTVTxe
 k7H1Ga6q7GFDBzY7jforuoSadETYsG8/1hcEo+R6qtiZB7iIGePOeDTki w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="358619241"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="358619241"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2022 03:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; d="scan'208";a="679132159"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 27 Aug 2022 03:39:07 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 27 Aug 2022 03:39:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Sat, 27 Aug 2022 03:39:06 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Sat, 27 Aug 2022 03:39:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxJ1bkP4e4pyMCmKH1mKomTmODFFgXbk8jR41DSlHz2Q3KEdIj85aQfRMLwAnEZc0Aw2m2EBTQXF7Y2NUwNkbUvjdquw5lIfQ55DdDfyBbZe7k04Ag5L9yYiACSUVRmLL7sQUnTYRJGwRGhsQz8B3GrcaLZVBDQs6dVAg2hkbqnQd6xYxslUUMjZdlbiRx8UCtrqjqsTKoC4eqzZ9BQpX/REHjf/avmvcgs7ailRumNJV03ud6JdNzo9fdQ9ZNtwHvTeS60VQlnpf3hJFV+fqSSEqFkZczRH+YYOdKnkjykUH6xsk43y+VCE742qTkEFpFDjU/jARpKLCY/HKAEAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sICO1wXCP/lnlACTDKv/US1THIU7jGYJ0369QumN76Y=;
 b=NNhp+A2m0B6LEKBVBlvEq41/M+9PI6x0N+ph6WUq96pI2xlKgKpZ0uooimwIwRTAArFiCNw9XkMnsEhutsjmRN77COyfH9ZE+VlgL/FzAmDjJkFaw8CwdLze2ghMWQMaRkgB0NTMNx9GYg+qt3NjbjfC/xrMFJFJotcDhjXLhjIlhRirMu6Z+YaK4xwCYgBMmd0Ex/0R4po0+LGboMvwuA3dc5NnFWiCz28uscEwgROkcqCbzi4mHFMR01ll+sv7ylf5tkWoPq8+Q1MR66tab0Uo4KXDt3reZg7GbGDaL2Vl8IIHwDzonNN6MYg3cwOhp2lt/k9x1XMtawDpeQTDNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA1PR11MB6289.namprd11.prod.outlook.com (2603:10b6:208:3e7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Sat, 27 Aug
 2022 10:39:04 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::3432:5d61:f039:aae6]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::3432:5d61:f039:aae6%4]) with mapi id 15.20.5566.019; Sat, 27 Aug 2022
 10:39:04 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, "Wang, Zhi A"
 <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Eric Farman
 <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, "Peter
 Oberparleiter" <oberpar@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger
 <freude@linux.ibm.com>, Diana Craciun <diana.craciun@oss.nxp.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Longfang Liu <liulongfang@huawei.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Eric Auger <eric.auger@redhat.com>, "Kirti
 Wankhede" <kwankhede@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Abhishek
 Sahu <abhsahu@nvidia.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: RE: [PATCH 13/15] vfio/ccw: Use the new device life cycle helpers
Thread-Topic: [PATCH 13/15] vfio/ccw: Use the new device life cycle helpers
Thread-Index: AQHYufqdG89toCl0rkuK6glG361jx63CjkLw
Date: Sat, 27 Aug 2022 10:39:04 +0000
Message-ID: <BN9PR11MB527674E51B4FFCB384DB57698C749@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-14-kevin.tian@intel.com>
In-Reply-To: <20220827171037.30297-14-kevin.tian@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74e06990-217f-43f0-ab6d-08da88185cc0
x-ms-traffictypediagnostic: IA1PR11MB6289:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LoiRzO76g7izmbbuVMoUYd2t5KjsoY5trnLaCvvWXOl+rlGi9IDawK62n1cbbXGwcBaH0Xk37QH9qZzuTtGPfS+16vvFce/iiUbrDvZabj1txe3eXIuxfQfWfSqX15bQCsD6A99EHMWyukhn5Vq4QnldXry2dSibAqYbOO5DdfEA0c7TX/NbJq/wGX9J+zenjDNTTLsZhaFup+IAxvf4GN2sYxfDNZe/RLeXmBI5cyigoTkEKGmiQY/5kpXe5zXYs28FiBFmgwCp5UJDbdXnMusxMLN9F+VftpBnhx2rDrYymzYMtc/ugdpKRnSojBy2gfGguIZzx6s5M+qUCfE7+V3945MPEyN7/nNrA8WSzOyPT4tHqBd0MZiocKX0whZo7rMyZ9P76ZxNUUNAOkEbb6ELhlJSJ53eqBj0eB8137mCxOpbXwxgtRBq82ygbERmUSihw3EAnE8b1wbH0+UIaoDX4wlWY8R7eJGY/B206Gov4NlBK6U+tAJDMwrkl5WzD7uVdthBEtG76WDiSWQSc0NDqz0etgMnUjFiEyp34RGuXOBAJN2R3qq32PtKVm4NnF5krE8Hu3Km6lQDlusxYUk9DzfzebgVL7xpOOQrP+gkAicE0PZiJKVfy0HCM4AjVC44hgkDBr8OxBgnI5viP9r/wHRKq0EQCURKkaX6c0GWMguN8AxkHLtse0919ZsPVTn/AAkjFth9Q1eaFtLMzWvsqyf118YamDziFdvpYx8B82wpfkx8xLUmmJqW3rJzeS6cUSAssDfy5j4ik9Qtts1TZEkNJ4PxDcJJ0TlMBLk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(376002)(136003)(346002)(39860400002)(186003)(83380400001)(82960400001)(921005)(38070700005)(86362001)(38100700002)(66476007)(8676002)(122000001)(66446008)(64756008)(4326008)(66556008)(66946007)(55016003)(76116006)(316002)(110136005)(7406005)(5660300002)(7416002)(52536014)(8936002)(2906002)(478600001)(41300700001)(26005)(7696005)(6506007)(33656002)(9686003)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PKHFH5ZDyuoq9+Tjt+9THYWsh8ymkPCJRaPt6oONTy9Mb7lk6LIwiJVpLUIK?=
 =?us-ascii?Q?fk6SDUf0izSbQgpAm6aX8Bhr+xkTQeGGzR8ZqTYdfk4Mbz5ilmIjP3Qwa6yo?=
 =?us-ascii?Q?W38F6mzmPy62Ia3o6KXtEU6zg+zxazyJUon3Ffve5nzKlWqlGRfRCI83Ox6I?=
 =?us-ascii?Q?A0Aouks83Z7nyjlNf46+d6kexCv3QvinrsAGmp2XBRtPdSusYeoZZo9KOAYJ?=
 =?us-ascii?Q?kAg6TRchnpP++KrVKwAWKsil/BWJnazdAFilmERyG3KaoE+zbFhyWrpQdL3V?=
 =?us-ascii?Q?8mmBRfvVs4EQEeXKhc9y/5KFK0WSCXL2LlSp1VrIR7arzejrESFcSluet1zW?=
 =?us-ascii?Q?KaSt1SXGDpJkhUBfVXXABEq3iesR5irVMhWbyPgofa6EVwCq7ZuPGVGdRQeK?=
 =?us-ascii?Q?Ut/nG82G8voRFqvv3HsO1h8QVfaQTHfUuKVMKn9eDoR6oPERqOiB9MV1MK1U?=
 =?us-ascii?Q?Ncf2vY4uSz/daCWWKcWXQ/gQVTlGQHJPPcWEkcL5AWLK7rvVUqQ/xHV+Bzpg?=
 =?us-ascii?Q?x/aB/8LjR93CQq1kNXQYUV1FvnXlQ3DvIP8Hw+zBam/JGGzhsDqfENeg/i7t?=
 =?us-ascii?Q?iIIN6FXb11LP7j/APLUl/pQm2EQL/agrkAKBmYPDB8O3gA3SJeQH5qUveg+v?=
 =?us-ascii?Q?/jaDyk+Gh3rmzQSsjFjb8UW9a83bgePnQflKDcSJwsDb2c15m4pTZBQQcCGa?=
 =?us-ascii?Q?ViHijFxptDXYWPrXDzB+7bun+c26QFYosibZwNAbuaA9nj2CGd3oO36dVp9k?=
 =?us-ascii?Q?OlT60kkiPc8xtCxy2z7bAY8UASgmBurCM5EHvSURvgMqxxRqoZGpPnbXL08S?=
 =?us-ascii?Q?MY3Qu1WOltEIW6oHdu1Y/fJXq/ck3e612uQFHHHKv2rkd+w/tbAU/GWOx5as?=
 =?us-ascii?Q?j7DEFH00IIJ/NXROUqGojkBwBNlx6VlqSa6MK3oHPMs2xfXzCEqBQ1rCEfM9?=
 =?us-ascii?Q?CzU/Z+D72Pyafs6OEi2JaRdzgORqdXhWcOa5gOsB5UhJC5MpiL4e82ZF1BjO?=
 =?us-ascii?Q?T/MORO9My822SHJAw6/ldw96YNd5luJfzn5xHXFrEn01G0Nk7D5RsDK+NtFa?=
 =?us-ascii?Q?EjHDhUbK09ddWM8r4qZ/uoQAQIwOT1fmM8WPLbqU0CSp7iIHXYSnLETVea93?=
 =?us-ascii?Q?4mLQszltQyIYeHH/7xdv4hNgdluXOGkF4s/BB3dsO5tiwVCYCKNEGmz/Byex?=
 =?us-ascii?Q?nP/3QcbaFekns7XZNnikkCyRw8zDs7kqLBkFD+3NWs3YugQtiMVlrjxCgxNd?=
 =?us-ascii?Q?XVgP7/oM69TAirYzN4LJlNrCUwdQbRclN/vmMKqS9VTRpVwtwxl6PRGjaBY3?=
 =?us-ascii?Q?K9WfKTmmG04TNVxMknUbneWR29iDt/X9sF+leqKnCK6hcy/IUuknfx5Qag6n?=
 =?us-ascii?Q?f9aIK0sHGKMcvDrkD7ui/Q1TGgt2wRcoX4rTzczD+yO+szudZ+xa08OVk/BU?=
 =?us-ascii?Q?dMd7xPsDSBTL6m30poJP6WGDLmVtIGBpaiVOybwDSy9OUIWUEOHeIfzfmcjG?=
 =?us-ascii?Q?l9lnJ+q/aVb385rVewIw0rMTAoEV3xhQdweN/7TcT1pWuVS+umHsHmjYaZp1?=
 =?us-ascii?Q?aS2pw7qVgkASL3LJB2W8QSXCUsCy8p9RTlZ2+5q9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e06990-217f-43f0-ab6d-08da88185cc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2022 10:39:04.2913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Qo6QVMmf62ZSZTGw9CFrV9ZUwAu+0C19fcX+U2cX4ZkK1WODeieb8sat1Z1O/H84/cMrDC2A3Q6lzrYvXANjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6289
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This missed a Suggested-by from Jason. Will add in next version.

> From: Tian, Kevin <kevin.tian@intel.com>
> Sent: Sunday, August 28, 2022 1:11 AM
>=20
> ccw is the only exception which cannot use vfio_alloc_device() because
> its private device structure is designed to serve both mdev and parent.
> Life cycle of the parent is managed by css_driver so vfio_ccw_private
> must be allocated/freed in css_driver probe/remove path instead of
> conforming to vfio core life cycle for mdev.
>=20
> Given that use a wait/completion scheme so the mdev remove path waits
> after vfio_put_device() until receiving a completion notification from
> @release. The completion indicates that all active references on
> vfio_device have been released.
>=20
> After that point although free of vfio_ccw_private is delayed to
> css_driver it's at least guaranteed to have no parallel reference on
> released vfio device part from other code paths.
>=20
> memset() in @probe is removed. vfio_device is either alreary cleared
> when probed for the first time or cleared in @release from last probe.
>=20
> The right fix is to introduce separate structures for mdev and parent,
> but this won't happen in short term per prior discussions.
>=20
> Remove vfio_init/uninit_group_dev() as no user now.
>=20
> Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> ---
>  drivers/s390/cio/vfio_ccw_ops.c     | 52 +++++++++++++++++++++++++----
>  drivers/s390/cio/vfio_ccw_private.h |  3 ++
>  drivers/vfio/vfio_main.c            | 27 +++------------
>  include/linux/vfio.h                |  3 --
>  4 files changed, 53 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c
> b/drivers/s390/cio/vfio_ccw_ops.c
> index 4a806a2273b5..9f8486c0d3d3 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -87,6 +87,15 @@ static struct attribute_group *mdev_type_groups[] =3D =
{
>  	NULL,
>  };
>=20
> +static int vfio_ccw_mdev_init_dev(struct vfio_device *vdev)
> +{
> +	struct vfio_ccw_private *private =3D
> +		container_of(vdev, struct vfio_ccw_private, vdev);
> +
> +	init_completion(&private->release_comp);
> +	return 0;
> +}
> +
>  static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
>  {
>  	struct vfio_ccw_private *private =3D dev_get_drvdata(mdev-
> >dev.parent);
> @@ -98,9 +107,9 @@ static int vfio_ccw_mdev_probe(struct mdev_device
> *mdev)
>  	if (atomic_dec_if_positive(&private->avail) < 0)
>  		return -EPERM;
>=20
> -	memset(&private->vdev, 0, sizeof(private->vdev));
> -	vfio_init_group_dev(&private->vdev, &mdev->dev,
> -			    &vfio_ccw_dev_ops);
> +	ret =3D vfio_init_device(&private->vdev, &mdev->dev,
> &vfio_ccw_dev_ops);
> +	if (ret)
> +		return ret;
>=20
>  	VFIO_CCW_MSG_EVENT(2, "sch %x.%x.%04x: create\n",
>  			   private->sch->schid.cssid,
> @@ -109,16 +118,33 @@ static int vfio_ccw_mdev_probe(struct
> mdev_device *mdev)
>=20
>  	ret =3D vfio_register_emulated_iommu_dev(&private->vdev);
>  	if (ret)
> -		goto err_atomic;
> +		goto err_put_vdev;
>  	dev_set_drvdata(&mdev->dev, private);
>  	return 0;
>=20
> -err_atomic:
> -	vfio_uninit_group_dev(&private->vdev);
> +err_put_vdev:
> +	vfio_put_device(&private->vdev);
>  	atomic_inc(&private->avail);
>  	return ret;
>  }
>=20
> +static void vfio_ccw_mdev_release_dev(struct vfio_device *vdev)
> +{
> +	struct vfio_ccw_private *private =3D
> +		container_of(vdev, struct vfio_ccw_private, vdev);
> +
> +	/*
> +	 * We cannot free vfio_ccw_private here because it includes
> +	 * parent info which must be free'ed by css driver.
> +	 *
> +	 * Use a workaround by memset'ing the core device part and
> +	 * then notifying the remove path that all active references
> +	 * to this device have been released.
> +	 */
> +	memset(vdev, 0, sizeof(*vdev));
> +	complete(&private->release_comp);
> +}
> +
>  static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
>  {
>  	struct vfio_ccw_private *private =3D dev_get_drvdata(mdev-
> >dev.parent);
> @@ -130,7 +156,17 @@ static void vfio_ccw_mdev_remove(struct
> mdev_device *mdev)
>=20
>  	vfio_unregister_group_dev(&private->vdev);
>=20
> -	vfio_uninit_group_dev(&private->vdev);
> +	vfio_put_device(&private->vdev);
> +	/*
> +	 * Wait for all active references on mdev are released so it
> +	 * is safe to defer kfree() to a later point.
> +	 *
> +	 * TODO: the clean fix is to split parent/mdev info from ccw
> +	 * private structure so each can be managed in its own life
> +	 * cycle.
> +	 */
> +	wait_for_completion(&private->release_comp);
> +
>  	atomic_inc(&private->avail);
>  }
>=20
> @@ -592,6 +628,8 @@ static void vfio_ccw_mdev_request(struct vfio_device
> *vdev, unsigned int count)
>  }
>=20
>  static const struct vfio_device_ops vfio_ccw_dev_ops =3D {
> +	.init =3D vfio_ccw_mdev_init_dev,
> +	.release =3D vfio_ccw_mdev_release_dev,
>  	.open_device =3D vfio_ccw_mdev_open_device,
>  	.close_device =3D vfio_ccw_mdev_close_device,
>  	.read =3D vfio_ccw_mdev_read,
> diff --git a/drivers/s390/cio/vfio_ccw_private.h
> b/drivers/s390/cio/vfio_ccw_private.h
> index cd24b7fada91..63d9202b29c7 100644
> --- a/drivers/s390/cio/vfio_ccw_private.h
> +++ b/drivers/s390/cio/vfio_ccw_private.h
> @@ -88,6 +88,7 @@ struct vfio_ccw_crw {
>   * @req_trigger: eventfd ctx for signaling userspace to return device
>   * @io_work: work for deferral process of I/O handling
>   * @crw_work: work for deferral process of CRW handling
> + * @release_comp: synchronization helper for vfio device release
>   */
>  struct vfio_ccw_private {
>  	struct vfio_device vdev;
> @@ -113,6 +114,8 @@ struct vfio_ccw_private {
>  	struct eventfd_ctx	*req_trigger;
>  	struct work_struct	io_work;
>  	struct work_struct	crw_work;
> +
> +	struct completion	release_comp;
>  } __aligned(8);
>=20
>  int vfio_ccw_sch_quiesce(struct subchannel *sch);
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index 9485da17f2e6..15a612153c13 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -482,21 +482,6 @@ static struct vfio_device
> *vfio_group_get_device(struct vfio_group *group,
>  /*
>   * VFIO driver API
>   */
> -void vfio_init_group_dev(struct vfio_device *device, struct device *dev,
> -			 const struct vfio_device_ops *ops)
> -{
> -	init_completion(&device->comp);
> -	device->dev =3D dev;
> -	device->ops =3D ops;
> -}
> -EXPORT_SYMBOL_GPL(vfio_init_group_dev);
> -
> -void vfio_uninit_group_dev(struct vfio_device *device)
> -{
> -	vfio_release_device_set(device);
> -}
> -EXPORT_SYMBOL_GPL(vfio_uninit_group_dev);
> -
>  /*
>   * Alloc and initialize vfio_device so it can be registered to vfio
>   * core.
> @@ -543,20 +528,18 @@ int vfio_init_device(struct vfio_device *device,
> struct device *dev,
>  {
>  	int ret;
>=20
> -	vfio_init_group_dev(device, dev, ops);
> +	init_completion(&device->comp);
> +	device->dev =3D dev;
> +	device->ops =3D ops;
>=20
>  	if (ops->init) {
>  		ret =3D ops->init(device);
>  		if (ret)
> -			goto out_uninit;
> +			return ret;
>  	}
>=20
>  	kref_init(&device->kref);
>  	return 0;
> -
> -out_uninit:
> -	vfio_uninit_group_dev(device);
> -	return ret;
>  }
>  EXPORT_SYMBOL_GPL(vfio_init_device);
>=20
> @@ -577,7 +560,7 @@ void vfio_device_release(struct kref *kref)
>  	struct vfio_device *device =3D
>  			container_of(kref, struct vfio_device, kref);
>=20
> -	vfio_uninit_group_dev(device);
> +	vfio_release_device_set(device);
>=20
>  	/*
>  	 * kvfree() cannot be done here due to a life cycle mess in
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index b0928a81b45a..a36a65b966b5 100644
> --- a/include/linux/vfio.h
> +++ b/include/linux/vfio.h
> @@ -160,9 +160,6 @@ static inline void vfio_put_device(struct vfio_device
> *device)
>  	kref_put(&device->kref, vfio_device_release);
>  }
>=20
> -void vfio_init_group_dev(struct vfio_device *device, struct device *dev,
> -			 const struct vfio_device_ops *ops);
> -void vfio_uninit_group_dev(struct vfio_device *device);
>  int vfio_register_group_dev(struct vfio_device *device);
>  int vfio_register_emulated_iommu_dev(struct vfio_device *device);
>  void vfio_unregister_group_dev(struct vfio_device *device);
> --
> 2.21.3

