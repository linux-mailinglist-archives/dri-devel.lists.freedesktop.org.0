Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB935B157F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 09:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCD910E98F;
	Thu,  8 Sep 2022 07:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0D810E98D;
 Thu,  8 Sep 2022 07:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662621596; x=1694157596;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hIlXPrcKd+v84DVCKmWw8md7HZOMZ9cOW0gQnhd70mc=;
 b=c2U+pKWC6W7gwLBxyCHjns93xtvXCc1yhvSd0/Z97WFd+anDVSNBBUHh
 CLDdZF2T6ljliKyok6dm0G3Rh2Z/81AS1M5h+KbDMwBx1R2DTPvDgSjFs
 r4rSGo8H6upcxiTUZHO+czz6/d7XxzfrNZ1sUWdGhyfETlcA0ut9hkr0V
 UQckEf3NVJlv6G+Io74KmKDUykffHt4L/l7MqAOsiikanZaMlaz4KmNQI
 glWKyyZ3RB5kDK2BEjq4XUDn8W7L/2AKiQ0LJTgE1BfwiY7x8v+YLQlV0
 xJjSdsNs2XJkiXZ9KAUj80NGbKhSqG9oqSOLV0z4ViNPWM4yysrOzE9Do A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="298429584"
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; d="scan'208";a="298429584"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 00:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; d="scan'208";a="740572612"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 08 Sep 2022 00:19:43 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 00:19:43 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 00:19:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 00:19:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 00:19:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZhHWjH0kkwR9gH8UKAmoe1XDU06ayygXZPEt/jfeOdFxla6P6CDpny58fVkrXyrIdwhwrPPih9u2HPeIZyS6xIDUv183qyJuAarGaJh4QsHADdJOBl3pm9G3Wp53sG4pgr5kGbJ9l0QjFq0naSCYQMb17ttLglLz2GgOg2ixwQbXKDPCSIlCIQYbI/TpkCv00H5ky4qdrfDsIPoioqYTRc0KFVg/n2UAh1FSoY3tsGEGDd1Pb72dGk9gwfyV0+A8W2Xpj2hSf0GeJg/24wdyZnMUo9+zIyeBvms2K1Bd2HFG56eQJHyqo9dc3P3zHJlliQ7XZZ9FGUkx1fypCXWew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RA0OGez+N5ZA2rkX7+VkUzEZe1SbbubDh1gl2fV7m78=;
 b=F4i1lG5SluoW5Gsx7qv4TdEGMRz+j9eoYKvEwaJ0o1K1CDwQBK+LvxeAGA9XhEZZ2FtdtEXgTcg0eK+p2uNvoijbvp4GZxB4Y7CNJ5B2541pIsdDm5jrmtikkWE1xSiEu4wahmkLpe3B7WAO6VX+CntChY7jOs4QledoXlNcBFTCwtgcGIN3T1xudLThqm93prWGndUv3gq2XxNilcqZeIpt7lRXbswFPRQhb2RApej+GeW5nQ2pZMkAGMlP6k6M4T156xmFQd5KKgfNMl3tiVHU2+B0KZPS2T4QN4ggZvqRaFAmao0nYH40v7t5LJJzQA+txNhVOz0Y7jFUTOEo3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB3737.namprd11.prod.outlook.com (2603:10b6:5:144::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Thu, 8 Sep
 2022 07:19:16 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%5]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 07:19:16 +0000
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
 Wankhede" <kwankhede@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 "Abhishek Sahu" <abhsahu@nvidia.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: RE: [PATCH v2 13/15] vfio/ccw: Use the new device life cycle helpers
Thread-Topic: [PATCH v2 13/15] vfio/ccw: Use the new device life cycle helpers
Thread-Index: AQHYvdM5RUa3xQeyw0Gckqb1cQ4Gx63VKjKw
Date: Thu, 8 Sep 2022 07:19:16 +0000
Message-ID: <BN9PR11MB527631B53DF92D47B18F42448C409@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-14-kevin.tian@intel.com>
In-Reply-To: <20220901143747.32858-14-kevin.tian@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM6PR11MB3737:EE_
x-ms-office365-filtering-correlation-id: d20fe5fa-c0d1-40ff-5f00-08da916a708f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fab+nh4ee3P9tN9hSQCuWb3LXDdyMOIC1CwSdE9Mler0CWFd/mGIbt7SIslHE7WdXTCVw9H/eeOLrFwyPqmOfD9GikgFrjXM/cilknBL2azl2g9UWz0KldbUEJjM/KFgAZIErHCgCjhi/kEZvDmS4wKLTBf4XMurrua+/IZ7d3xsEAsstqyfOJOgpjcBvxU7n45sxHeBG2gML7Qd7vN/2iaintltSVJr67TvAwKPqmdWzXgQU77r2niFuObkfY8g1awnIgF6QZv+bhaM4e+3vsKV2aUn5vndkvt9XZKdHns1JMwueKLF963EEhdzOXAxDxrbpfTxnq/57i35loeMdCpPLvL9Do74/YSg8RYfT1lsvjF0sqUSkZ7uxXI7qWuk1obOjEb+R12ZU3YkpEYApZX3NSPCDNKUq7tH2XjxYUNAnt2yTE2RP3Q6TPMAOjn4Um3PgokngPP09hu9zT8e5MmOu5+GBfK/UMGwhILjeRigJvdy882irprKNCS6QqFbm1cKCs9y1TOKl5s7KKA9gkQnAPz6ocUFoW6i1G78vfQXvpJt15wpKqw5O5cgJql0BkxSN6yDx4egyP+uuwiF/UmT0etgFV0FP4RmZmkgY1Xa0zPxAxXJwLOWjFb/Dm+v848f0kuPVsqF83qxnnZ5N+s+n2tEvAF//ymwmKOSrd3nYespTWYoSzJ2cGIeW5e4Z5h+EsUXmBbiAi5F9NqyxTMfBJ1J9Gn4+RcrnvlkGREIUQr1CktIUVFLE/c8AHT+GvyTIlx9vWpLn2qRVfVLtVomqD3Pov2GU63NgL1WGzs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(396003)(346002)(136003)(376002)(86362001)(478600001)(71200400001)(316002)(41300700001)(38070700005)(82960400001)(110136005)(38100700002)(55016003)(26005)(9686003)(921005)(6506007)(7696005)(66556008)(33656002)(186003)(76116006)(83380400001)(66946007)(66476007)(66446008)(5660300002)(2906002)(8936002)(122000001)(4326008)(7406005)(64756008)(7416002)(8676002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BW7L7rD/4GLuL63CZkoEkzkJ53QNdsQSLaI8/1vs0XvkeYuh/S3dkJIXazxT?=
 =?us-ascii?Q?34Vm9OC/Kd8Kwmzkg8iAfZi+0WS88DpfA3Sli8HZX/JS779mMsr6kQPnBocF?=
 =?us-ascii?Q?bAb+O1eZUXUSKLwmhXMA7iGQpuCq6GQTTzdU1pZHOpBINtLqZw9ntSZWcHjw?=
 =?us-ascii?Q?7nkWplcS/CGlD7lNrQqAkK7UQ60c32VqZA2OcHVvfl+q+gS2bmIRvHOTDY5Z?=
 =?us-ascii?Q?p17o0iAvTrmDF1D7qQz4K2E9eLsvyo5v1LKYfcCmcG2UISeCBzWemsqsLzmP?=
 =?us-ascii?Q?rR31751yHg1nseeYKbh9dXjDpyZGXyTP5m0xaTfGBrKzBiI7acvh7H6VH6r0?=
 =?us-ascii?Q?raMaVaAv9OlpevvREmgzZF5OjxA9h4wnwzybbYU+QGDMrIx3qf4f7yniqRUQ?=
 =?us-ascii?Q?bUK9SnUMpugejFjxBILw6Dm2tl7OKmWGFlUh/LjFPkUtPm5HG+WKAF2ZapoK?=
 =?us-ascii?Q?V3hNknkLksd22hUAfHyJJHryMlWYV9I+j4be7xYAZYD0iFApOiCJAagXEJXF?=
 =?us-ascii?Q?DNMximd3AxJvom0knPDu2sGs2zBT3VVtWkTlVUzz7zHss0uVbtBkqMl6cymS?=
 =?us-ascii?Q?seau/6HlEabnpotcz+wqNolTL7p7RvVo3ZKw9H8PdqHP16DXFEjxbmfUvNZ1?=
 =?us-ascii?Q?giI/G3ySvGICsaLBcraHofV1dDFTpFrSvqoW7eT2FKuFMDytSu+s1WT/apnV?=
 =?us-ascii?Q?WDNjqQk5LQPzguFI4oYFlP6CdUvJ1QaFkgvkJ/P7lB7RfHV48yQtxBlOb69G?=
 =?us-ascii?Q?73PhRbTKw5wI4mPCAml1YGxqeAjwwdFV2FhCk4zH+wAKA6p990xzPvgKoQJq?=
 =?us-ascii?Q?zYrcJzKH1q+yBKb1TpGXTCLZBlobiesFT02CDlwrHNwmyT317XqMYw8wSSdv?=
 =?us-ascii?Q?Q4CpiH5afyS3hemcvuehdBKkHmVIlU9Vhm21MYT4Z8gflnk2naupCBcFzkW8?=
 =?us-ascii?Q?wo6Xhdss6gDin6buWsCTJFTe7r0801YJ8cv1BwDXmdpO3mPNe1i3GD3qIktt?=
 =?us-ascii?Q?db/IIB8C3SJdnLvg6CdMWJmJAZE6BaCd45LTwMSvlClOjQD4oMw7QjinE0Kn?=
 =?us-ascii?Q?jf4EKmz+fwd9ZgEUhPDlhMkkVe2x8h/B4pIGVgrpAVR3670g831eAubL+TRz?=
 =?us-ascii?Q?Q0Kxi9sCNh67m/gUx32qNiLOMKnwZwEXqhyC6LmCuauiqTpJfyV2Rd9QSZUQ?=
 =?us-ascii?Q?/9U1Nk17S2irPMn0KdVDwT6Twt05a4hOcKh8iG0yEiUAWeQqZPqmYDZNMBlf?=
 =?us-ascii?Q?EN+PPyob/AZPWubMBLOLrFPDD71DPUlf7lPD0G1hvMWt6KvnYB+nbwg9y1Qc?=
 =?us-ascii?Q?L0dOeT5QOShAzQmu3owQK0tBkiMiQYgjj/teVsdzq6GX0p2ayeuJX6lFyaJj?=
 =?us-ascii?Q?diISZ7z+pBIJB0Xb6C4ha9zmYvqArgT9cMb2MEEXy/9QNNycAj/7NfFMaXmo?=
 =?us-ascii?Q?CpExyVFemJ5IWglOim25LnUKuZMWfxlJEh631m64JiqiiKUDCg0WtNOLAu+a?=
 =?us-ascii?Q?C929cmjIQ7CHwX72PlFBN9Bz8nrz1+439haYR6wfhth0lmzGjeLYu8guXTaW?=
 =?us-ascii?Q?fnVgFnS3s2InmMfzlD03qPiaC9F+xCs9Ipc7XFXA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d20fe5fa-c0d1-40ff-5f00-08da916a708f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 07:19:16.7039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 76DO9J4sbwuO1L9t0i9GEwvEREh0fL7OhMyxZK1aFY6KnFKjLehEboUugvADK9Ux3nlp4cbAdJngrTa7Wptp/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3737
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

ping @Eric Farman.

ccw is the only tricky player in this series. Please help take a look in ca=
se of
any oversight here.

> From: Tian, Kevin <kevin.tian@intel.com>
> Sent: Thursday, September 1, 2022 10:38 PM
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
> memset() in @probe is removed. vfio_device is either already cleared
> when probed for the first time or cleared in @release from last probe.
>=20
> The right fix is to introduce separate structures for mdev and parent,
> but this won't happen in short term per prior discussions.
>=20
> Remove vfio_init/uninit_group_dev() as no user now.
>=20
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/s390/cio/vfio_ccw_ops.c     | 52 +++++++++++++++++++++++++----
>  drivers/s390/cio/vfio_ccw_private.h |  3 ++
>  drivers/vfio/vfio_main.c            | 23 +++----------
>  include/linux/vfio.h                |  3 --
>  4 files changed, 53 insertions(+), 28 deletions(-)
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
> index c9d982131265..957d9f286550 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -481,28 +481,13 @@ static struct vfio_device
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
>  /* Release helper called by vfio_put_device() */
>  void vfio_device_release(struct kref *kref)
>  {
>  	struct vfio_device *device =3D
>  			container_of(kref, struct vfio_device, kref);
>=20
> -	vfio_uninit_group_dev(device);
> +	vfio_release_device_set(device);
>=20
>  	/*
>  	 * kvfree() cannot be done here due to a life cycle mess in
> @@ -560,7 +545,9 @@ int vfio_init_device(struct vfio_device *device, stru=
ct
> device *dev,
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
> @@ -572,7 +559,7 @@ int vfio_init_device(struct vfio_device *device, stru=
ct
> device *dev,
>  	return 0;
>=20
>  out_uninit:
> -	vfio_uninit_group_dev(device);
> +	vfio_release_device_set(device);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(vfio_init_device);
> diff --git a/include/linux/vfio.h b/include/linux/vfio.h
> index e1e9e8352903..f03447c8774d 100644
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

