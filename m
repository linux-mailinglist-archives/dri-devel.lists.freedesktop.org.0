Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC66950AD6A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 03:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FF010F47E;
	Fri, 22 Apr 2022 01:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC3210F47E;
 Fri, 22 Apr 2022 01:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650592290; x=1682128290;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xiFOi+lvjb2cTpQ6FVCqzPoamIWok8yAmJZl9YjmJi0=;
 b=aSD5hed94c8lbC41zaD9WxFCrfO8B0RmNpd0jhijawAXz7FffIG7gCCz
 PcOyStbkM0SafXy7dHc7Q5LtZDvP13hDvtvgFuvWSMl9iGagXXQkJPHBc
 JEDumSD61ERCvRdo5nBhYnG578EvU/CLCV0L0HvWGNmVsj21QWx/G+M1H
 l0sW5kD3yk9asr6CUZGG4vVw/xolP7B3Avxak/zz+2jHdD62TtThcVTde
 qOz7J2VB/LdXQUVOkh4MZXAETlmv5URkNyNU6qqNYaZtOVg57HkxiyXen
 8DelOeSMkuKa3kkUrLNeY09nA6f9z5I2TVXvAQe7xLNa+5m1ShZRpdKSc Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="264706590"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="264706590"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 18:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="615191057"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2022 18:51:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 18:51:28 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 21 Apr 2022 18:51:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 21 Apr 2022 18:51:27 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Apr 2022 18:51:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JO9D5cVgNTDhAaZgdtLhIYh3uvg6zBoeo/Hz1kgzja93Aj+PqIRiH5uBRFKEV9BzcXy4+/g0jRFQVs3Ctx1u6Sz/t1ewklQd/wMQQEJexjfpXdEocw1dGaDdTFRoTHiWzfHQkaPAJK36LPJjjcoGXNOUUuLryHnb+0Zi9HGxbuDG0eVZO1rPN8Kn5zcn74lWURBzN2AemFaDcQFcmSPdNkZa+ZkrT1GMHmunCb4slftgV4RkpTpwClOAeY5qstguBfe22PpPT0uTYREamXlyFbFNux1pYnOt1kbmLsrB9pvt0jTHoBQLyaQyhiCdPIZfQjOjHPHW+lUJLKgsZrB0rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRtqa2T6avGRFYCdnu70ik13h961A9I8S45nLbRLDPA=;
 b=e5G4PdCI74wbFWMIphRnE7dUd6cxBxbgOpuxvgguntTPYaVtLtDQzEb0DSDKQxIJBtTIPORFfb4wWPxmZWHPRrJqSAjqNc5UA6NDdVhPD5cxQzfmYFqotcGvZUR/EDfCV8S+FpX6B4H7dRU2SOpOkvoQeqYxmciM2Wgj3q8CH2r++xkTqU7qO05ft8daYp7Yk4P+8J/HYj38xv0C1gC9I3Rb9ucO/Rna89kSf89d1THelhbbkNNtrwImEshzTLgZx3WeUzMb6yLBa8OXTx5yQa1je5Q9Ti3ey0y/OwLtIk9VTFSvq5YMSDQndNslxqnp7ltsh8nHGH8JeAOBxCTo6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN7PR11MB2548.namprd11.prod.outlook.com (2603:10b6:406:b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Fri, 22 Apr
 2022 01:51:25 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 01:51:25 +0000
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
Subject: RE: [PATCH v2 5/7] drm/i915/gvt: Change from vfio_group_(un)pin_pages
 to vfio_(un)pin_pages
Thread-Topic: [PATCH v2 5/7] drm/i915/gvt: Change from
 vfio_group_(un)pin_pages to vfio_(un)pin_pages
Thread-Index: AQHYVZzoJU9fVf7Kyky1s7+JqG5VLaz7K6Lg
Date: Fri, 22 Apr 2022 01:51:25 +0000
Message-ID: <BN9PR11MB527667D72F82CC52AD656BB18CF79@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
 <5-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <5-v2-6011bde8e0a1+5f-vfio_mdev_no_group_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b334a9c0-cdb7-49e8-59d7-08da24029c3a
x-ms-traffictypediagnostic: BN7PR11MB2548:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN7PR11MB254875DA1C3598BE42F561B98CF79@BN7PR11MB2548.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ad8/9nKE7FIWsT2AXis6rVJo1zMrbYURD2hHjf6VEKsNUsHqvokr6whrWYQWMeXaox1j9R2aFgZLKxnzOLCwS7nMzYlFapiZdtwf575b4T+J9cPVaiK9h2epJGIIPEWmiIoAJ0dikBLZiOuJDM+2fn68hMrWrhLsc9VzcikjX5hyOEvPV8RW6XRyTJ6cY27vmMB9j0RLfhcOUyAOh6WeD6kf+FrKfbi69jA3wFepixNr2f8lIDUSi715xAhJMaWyjZgL0kCcNoOul1eZdQmVsJ3Nw0tbPuQ8dGSs6Y8UZm7iW6UpdvDfcGPWeinfUvGXA/l1N6DQSmMQpoDw+WJl+SIywEp70VH9I79bRr4ACMgAX3Bdq6kfnlPwa3OlNsp6mQYFDzy/KyFKejg8Ummu0mife42IXuWs8UI0+nkY1R5AluLt6A47OFfe92Eoo5C50f38MXKFYYf9gPrRQ1bsL9juBBC92Ryfv1zTgs1PF9Mi3KQiweHpWoJMpfnr5EDbsb2w4I/7TyrjhTYroWm3TexMfbI+6HvVLKKqa5eUciS1KMK2lqX4PYG7ON3JUrnnf4yK77Zxo13BkoXzLVUat+S/59p9CGa7S1UZBGAyXe2t1OaP+GYeXZ77fpwLrZFLkcpt5IbYuwQ7+yXC1QlIgsy+MltfWDJmyZAkZfg9eOwX1gzTLZGyzUw7KMxBPTDbRZ3mzh0BEUQSgbr/4bT1v8VwU4/8HCqP5O5j8/qF65s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7696005)(9686003)(110136005)(26005)(186003)(71200400001)(6506007)(54906003)(6636002)(55016003)(33656002)(508600001)(316002)(38100700002)(66946007)(7406005)(7416002)(5660300002)(52536014)(86362001)(2906002)(64756008)(82960400001)(38070700005)(921005)(66446008)(83380400001)(122000001)(4326008)(66476007)(8936002)(76116006)(66556008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9+FTaa7F7rXdDCNILFBhHtKQhKLxmMzhfEbTFz4yg7AetoZA0GgHjdckANwV?=
 =?us-ascii?Q?uNx2H67Iul8JCk1s1KJSSYB89mZo5lmx7S8VyDOVqB/i6A7q1ZRSonZ6Y+iP?=
 =?us-ascii?Q?/SvD0oPfzhceznsZCf4Gnhlta/0MLNPl6plPT8Tb88qJHe4BFJHZ5zYUDhFC?=
 =?us-ascii?Q?Zsn2EMseSxWftDMyvW+N3TP/v7Imb4F4pdTGtvaLZzj5Udtioi3GYc76pKWz?=
 =?us-ascii?Q?0Kxlbn5jzU2+aSqBY+kzEwbP5UAGjCAGZMzi751YP2gyeUWWaM6Unj0bl9f6?=
 =?us-ascii?Q?ZXggzmXkAiPeSjEY8v5udY7EKtvBI7+d0UnCwal9fNXpKWCXDj0b9oNjc1Pd?=
 =?us-ascii?Q?/qAJTIlak96xShVaFruMPZn5czgyfzEPZfkzU6yZqOwyvSK4HlloLUkwdWDt?=
 =?us-ascii?Q?2DmNp1FOmcSq2UTXfsLSqAxwmYXzQt51NxTu4SI0RM2WFQgZvfvYhFifHgfk?=
 =?us-ascii?Q?k0yXQV4BIDQiF6Sat+E3uzepLwHdyvYONWOd521CEV/IYpGldAL9Unp2nzCW?=
 =?us-ascii?Q?Ihc8sc28hiXqCZA+me4/3OvT475x/ZEw46bapyDU2+5bqYKr4yyepcNArSrY?=
 =?us-ascii?Q?dXOq9a8zkxf6FMZHYSyQ/LRJgRjDZP2RXvY9wjyDR5CGGCy2E38meFLBNrdf?=
 =?us-ascii?Q?hbhKomozFFmdRLX0v8+N4kLIL8Fm5lWThgbcnR23lK2Y5UTWV5E+8pXhhLca?=
 =?us-ascii?Q?AtAYIufHSDXeRqAuHZ/Pp2zPAxzHtRTmIvoYuKqvr4g/kSbR4r7VPuc7NR39?=
 =?us-ascii?Q?BEpUAzzgNKVwwBv3KqCKnEcalX3JLSzkP9zX1ZxzXC0hf0t9jT/p++/l5NUm?=
 =?us-ascii?Q?hsot+bPuKnGabroBEROWSW40GfI9MPyDeyEV4Dv+Qj6r1TNOulbh8GquCRQV?=
 =?us-ascii?Q?4EoI9Q3wEwSmVnhWJdc7GvEvgL/B8XjBBmmdYoA/scQr2DDqFaQqiqjhqb+9?=
 =?us-ascii?Q?POqtxSuUHefzaTXI7Klvya4akho7pr3FydyXNmyP6SlFGC6AWmVQCuzVWZcR?=
 =?us-ascii?Q?A4tKn8nnmHuDQrkQPr3CXVvBKUdM3jAWdtdxZYkqVH5ebS6RaVHcu/VpibAq?=
 =?us-ascii?Q?aglTRy/U/6UW/GoZJlqtHfVDXsnMT0i7OlBsaMI+C2wQ2/rkAWKJr0wBApZQ?=
 =?us-ascii?Q?WhXn6UZL9lkpA9Jhg16XL2/uhO1UnsJaKKHfqJfKLeKMHjQvpXf5VwNdE/Zl?=
 =?us-ascii?Q?zNEwbFF05KniUMSY9+STG0XZJlLbVnMyIUE9mjz+mDGKHnUI8yW1qCgHDdqU?=
 =?us-ascii?Q?t/AWn5voAtmiZwF7E9QbqboHzeNt8WEov1U5RmODFXuS9Ke2HdoeTxGzKTyz?=
 =?us-ascii?Q?rQ+dXx6quLYlQLenh1dxqCofGctM7saBtXYuddEf1YBPCiWM0zB7uyHIYfTi?=
 =?us-ascii?Q?2ZzTbIPXTdz2CCzKjrkl735XWtarkPDLWx3Bvc564WibW2x6A3RWeC6STaok?=
 =?us-ascii?Q?KghVla4Pob6/Hf4DczhvREXYJtZS9rmEraQMOimzx5HcsGAArf0aycpOrVhf?=
 =?us-ascii?Q?yNLA/uTVxhd2pU86LI4Av5wNph4L++6A8fic9tuWIcRlE5hnL3j1zXJ93GHr?=
 =?us-ascii?Q?TLJJ/nuQfDx+pcvcAxh/I5Sh2UTJQZofvpUV9Qhgd1zAj7p0Ldh7t8q/27hJ?=
 =?us-ascii?Q?Ohh8h5hXLLA3ilv4Kn7INwzRG50PIkMU3Wp0u7sJzy17GLmU4JF8mHyieyGL?=
 =?us-ascii?Q?/ncHoMTQV8XIfqetXr/s1A4ToGcpwllh3jIBHW06UcgPYRvms6XWZ6ilJI2V?=
 =?us-ascii?Q?OYooQTPEBQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b334a9c0-cdb7-49e8-59d7-08da24029c3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 01:51:25.5638 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l8JF4nqM93bDisRmMqxI+Oip6aGGWCZcx5n3SH8GvThapr5a4wc+Y0BAX8KGljcYgEWvLoOplz27nbTI+Xo/Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2548
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
> Use the existing vfio_device versions of vfio_(un)pin_pages(). There is n=
o
> reason to use a group interface here, kvmgt has easy access to a
> vfio_device.
>=20
> Delete kvmgt_vdev::vfio_group since these calls were the last users.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/gvt.h   |  1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 27 ++++++---------------------
>  2 files changed, 6 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 5a28ee965b7f3e..2af4c83e733c6c 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -231,7 +231,6 @@ struct intel_vgpu {
>  	struct kvm *kvm;
>  	struct work_struct release_work;
>  	atomic_t released;
> -	struct vfio_group *vfio_group;
>=20
>  	struct kvm_page_track_notifier_node track_node;
>  #define NR_BKT (1 << 18)
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c
> b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index 1cec4f1fdfaced..7655ffa97d5116 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -243,7 +243,7 @@ static void gvt_unpin_guest_page(struct intel_vgpu
> *vgpu, unsigned long gfn,
>  	for (npage =3D 0; npage < total_pages; npage++) {
>  		unsigned long cur_gfn =3D gfn + npage;
>=20
> -		ret =3D vfio_group_unpin_pages(vgpu->vfio_group, &cur_gfn,
> 1);
> +		ret =3D vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
>  		drm_WARN_ON(&i915->drm, ret !=3D 1);
>  	}
>  }
> @@ -266,8 +266,8 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu=
,
> unsigned long gfn,
>  		unsigned long cur_gfn =3D gfn + npage;
>  		unsigned long pfn;
>=20
> -		ret =3D vfio_group_pin_pages(vgpu->vfio_group, &cur_gfn, 1,
> -					   IOMMU_READ | IOMMU_WRITE,
> &pfn);
> +		ret =3D vfio_pin_pages(&vgpu->vfio_device, &cur_gfn, 1,
> +				     IOMMU_READ | IOMMU_WRITE, &pfn);
>  		if (ret !=3D 1) {
>  			gvt_vgpu_err("vfio_pin_pages failed for gfn 0x%lx,
> ret %d\n",
>  				     cur_gfn, ret);
> @@ -804,7 +804,6 @@ static int intel_vgpu_open_device(struct vfio_device
> *vfio_dev)
>  	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
>  	unsigned long events;
>  	int ret;
> -	struct vfio_group *vfio_group;
>=20
>  	vgpu->iommu_notifier.notifier_call =3D intel_vgpu_iommu_notifier;
>  	vgpu->group_notifier.notifier_call =3D intel_vgpu_group_notifier;
> @@ -827,28 +826,19 @@ static int intel_vgpu_open_device(struct
> vfio_device *vfio_dev)
>  		goto undo_iommu;
>  	}
>=20
> -	vfio_group =3D
> -		vfio_group_get_external_user_from_dev(vgpu-
> >vfio_device.dev);
> -	if (IS_ERR_OR_NULL(vfio_group)) {
> -		ret =3D !vfio_group ? -EFAULT : PTR_ERR(vfio_group);
> -		gvt_vgpu_err("vfio_group_get_external_user_from_dev
> failed\n");
> -		goto undo_register;
> -	}
> -	vgpu->vfio_group =3D vfio_group;
> -
>  	ret =3D -EEXIST;
>  	if (vgpu->attached)
> -		goto undo_group;
> +		goto undo_register;
>=20
>  	ret =3D -ESRCH;
>  	if (!vgpu->kvm || vgpu->kvm->mm !=3D current->mm) {
>  		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
> -		goto undo_group;
> +		goto undo_register;
>  	}
>=20
>  	ret =3D -EEXIST;
>  	if (__kvmgt_vgpu_exist(vgpu))
> -		goto undo_group;
> +		goto undo_register;
>=20
>  	vgpu->attached =3D true;
>  	kvm_get_kvm(vgpu->kvm);
> @@ -868,10 +858,6 @@ static int intel_vgpu_open_device(struct vfio_device
> *vfio_dev)
>  	atomic_set(&vgpu->released, 0);
>  	return 0;
>=20
> -undo_group:
> -	vfio_group_put_external_user(vgpu->vfio_group);
> -	vgpu->vfio_group =3D NULL;
> -
>  undo_register:
>  	vfio_unregister_notifier(vfio_dev, VFIO_GROUP_NOTIFY,
>  				 &vgpu->group_notifier);
> @@ -925,7 +911,6 @@ static void __intel_vgpu_release(struct intel_vgpu
> *vgpu)
>  	gvt_cache_destroy(vgpu);
>=20
>  	intel_vgpu_release_msi_eventfd_ctx(vgpu);
> -	vfio_group_put_external_user(vgpu->vfio_group);
>=20
>  	vgpu->kvm =3D NULL;
>  	vgpu->attached =3D false;
> --
> 2.36.0

