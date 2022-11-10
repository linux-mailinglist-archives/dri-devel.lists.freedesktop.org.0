Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 481D9623C44
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 08:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3DF10E0F8;
	Thu, 10 Nov 2022 07:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC28B10E05B;
 Thu, 10 Nov 2022 07:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668063680; x=1699599680;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SSXv5H3QF+EkqjT/YIeW6K+nzRF+XJnNaXraPkMiJGw=;
 b=WBnH9gYb/ozwnAwXrRrwgrO/5YfcYzSghCHm1/9R1wVDvzLfn5jH/lkm
 m53Z0ZTsVljPcPfmf5eY0yxNMHDOo4jmlZfZoVSNI8M5q0v8oXzt8yfoN
 ndOXsRwcsFowjpEpGq/ATYLPUvUNFAeL2ePXQtLRY0fXDdo62coudjozj
 +RjJ6xxzIbS6lMhwNM25uOrb8O2DSnNmPbE6NvKoLBorZoYFOdZWXQEbt
 MAQpg5XvCwEAULoyd2tktqB5gS6QqLr8gZZS+vKf1V5bbH0EQ78Cv0gM6
 lv2H4jXgHAautTXnkS02IKyL25PUMviVvD/vL3QSy2ViruLb+J5c2PqXY A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="337983164"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="337983164"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 23:01:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="588062568"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="588062568"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 09 Nov 2022 23:01:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 23:01:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 23:01:17 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 23:01:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAH2NWvhZ9udrY3dMvp2Rw09Dc/yK14lQGtDe5hFZ/szaRuYno9D3HpJamekLoJ3+Il7lX30mbFjqE+2oqntNKhQfhF4oXxrrneFIHvfZm5SJ2+hvAZ6kpaivRtWRCnNlVsdq8/g+w6Mw1McmMfM9X3dc0NLh8kAUs76gkl8H/ymPZvm5paAGLMhobKAYRJWk8nzdB95QAOqyYghIkMtgRiO/3gG+iwMUGx+1hOOtT8JLyZGcR8BlGMGFAeTTCie1XLohjEm/KUpzHmJZFhNxEPdPqeYRZDsie5CkwmCNyRKLm410sDygWtod8xo5O9epW6qUO97wNi8cWnE5na5jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSXv5H3QF+EkqjT/YIeW6K+nzRF+XJnNaXraPkMiJGw=;
 b=IxydAHuJGNOnUtl1zLolM8eM/beHq75cAoqhbT71/hc8y0aBrXb5Xcd4tjnq506cPQxcs6VNexy2Hei2O31OJ0VfQCl0Zaf/TlKvj1PZljoBSUSS+A29iuljh+ZmVBaGsevNCSR9aSkVVTjPq/j7c4e+AdgZzfChxyw6u84gskSrsmwuQvGLPNs411Z6QDcUx1Kn5u4kcLOu3o+e28AJjysd7yR4Jsf+lahnVfOPZ6xJB1aXFRCO5H1Wnf4wC806Md5raJPUmsBHTCXu3PriDKRFiXkCWjlFdp6Z3EB35Yyr5jk0yOkYPkTo8ruoqPEAXzsWNLl51FeoMdy3ZC5m8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN9PR11MB5546.namprd11.prod.outlook.com (2603:10b6:408:103::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 07:01:15 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 07:01:15 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@gmail.com>, Tony Krowiak
 <akrowiak@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Diana Craciun
 <diana.craciun@oss.nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Eric Auger <eric.auger@redhat.com>, "Eric
 Farman" <farman@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>, Jani Nikula
 <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-s390@vger.kernel.org"
 <linux-s390@vger.kernel.org>, Longfang Liu <liulongfang@huawei.com>, "Matthew
 Rosato" <mjrosato@linux.ibm.com>, Peter Oberparleiter
 <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Robin Murphy
 <robin.murphy@arm.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Shameer
 Kolothum" <shameerali.kolothum.thodi@huawei.com>, Sven Schnelle
 <svens@linux.ibm.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: RE: [PATCH v2 11/11] iommufd: Allow iommufd to supply /dev/vfio/vfio
Thread-Topic: [PATCH v2 11/11] iommufd: Allow iommufd to supply /dev/vfio/vfio
Thread-Index: AQHY8wx25haQHfxwOkytlxiV0y81cK43vkNA
Date: Thu, 10 Nov 2022 07:01:15 +0000
Message-ID: <BN9PR11MB52760CFBCA7D61C58135338E8C019@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <11-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
In-Reply-To: <11-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|BN9PR11MB5546:EE_
x-ms-office365-filtering-correlation-id: 48a74b44-e0e1-4499-6793-08dac2e95bfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uQwBIXD45KqPaf9wJXBt4DftEyUOWFM9PvqXNrc7SNr2fLUM+g3bEPsbdUPItzPBc+s3DNagYXIA7UThKKG+i+WAvuxiYcM4KFFcFtUxvVo+nUA89m/E9Ue4+4A6ah6ikIbJhNCdGoFADc83HrgI23xHTaYtlLD8HHSaPk/Vm3TQZ21gWT1eMy9T2FAFPH/D2CxsilTvyPqgB5vKAcHx0F28lsi5gWF20HZYw/naQQRe4vDXmWsO6IRoWQVlLRTnpyBAoHaxYoBxvIJgjG185WFZHsASLLp+Wjh6h+urdEL9e1yHP7SGfNtKCgQECZJUJsXhN9OOjM0U2+X8BSWFouxnTyx2VpRmVBX9rfgVJ+0quhNka7syYPNuIjM0G6WCsg68q6BkvgzDILPtWAreB4QPTM36gft049UpxPKaAwH5pMIgPICLO2QrVb9uPxpTqiuEQUW6L43wFRt8qR9yX5s+B12YtXvhtx8UOppLDm1a2+pz3QuYAPbJ64bK9/SYG1P394dxJngxQMvA/h9hD4WE/Oixp9ngQginC0az4Vc3ZITfJYSI+OhW2TAUrXhIQ7R5SYqBVsa0MCP+W4RNbXj1JElaBhF82CG4UFKh5ZAVBTg3nwq2TmlVe4bEz2fwFNppU+3YA8knUwUv1GXZ1RnuQ5GGbhinn3OctlTrCdeMkSEQwRHLa2LawNexUdhLY1U0lfZhQ9SDiCxA9U81nakxNSu6rVCAjEBBYFym9NDnZKsgIBcOKEOwKt/JHSmBeb9HrWVjm/c9wklyqb/OOrR9WHpqy6olu9QgtdF9S+Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199015)(6636002)(54906003)(7416002)(7406005)(4744005)(110136005)(186003)(5660300002)(316002)(122000001)(26005)(4326008)(55016003)(8676002)(66946007)(33656002)(83380400001)(66446008)(64756008)(76116006)(66556008)(66476007)(86362001)(2906002)(71200400001)(82960400001)(478600001)(41300700001)(921005)(38070700005)(38100700002)(9686003)(7696005)(8936002)(52536014)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LJBMgo7Nbc9OteAHM7XUq0y2N1GnXACKhNnt4GS63d3IXGs4qvXV5wokafE8?=
 =?us-ascii?Q?MQV3wFNeG288FHTASOml5JF9av4ATCQojUlzF1K2jRsr+CpjPk3Ndfll2ANd?=
 =?us-ascii?Q?sMRg9s37OtV9DFSGK/+ybFU/yjR+UVV1mZrqpvliYWnB4ZCyA+mtThNFr8XW?=
 =?us-ascii?Q?fS6voh0HOiR39uPQfgws8ZiKaIr5NUlP+ehdua3kFurnqsm+FKU2sf9z48gR?=
 =?us-ascii?Q?I6YjwFSClxfVXGUUBdTIo6bOLPwIQyGYvR8IKWK7mDsVqPxtFGBndJC6NSYH?=
 =?us-ascii?Q?+GQ4BI4Pb0FvSqJ58oRy/KRNJBTJbeAFfV0CBF/j095XpN7raNHc/aZ00qyA?=
 =?us-ascii?Q?nY5lovCMI0RgJ85RWM7FgX46P7WYLOweiiFQFEs6jFIFvChvnuPMh+cnvFF9?=
 =?us-ascii?Q?qj3fxj0inUVLK9Nxp+NGPQwHKKu1xQzZ4fQX0a2ooheefSp6RDUs/swHvjES?=
 =?us-ascii?Q?2ytTs1dzZie6nixedD4MkCPZGzTmp09MrIAXCugfkvo5xyVAE5M2nMU4KevQ?=
 =?us-ascii?Q?jqIpQRvB9RMxG+glEbFwS3Yr1A0Xc47bpveRspGNdNuGM3z6/b+kBdrl1V3a?=
 =?us-ascii?Q?QQ72cv2/ktN6+Om9dmePzqysG3toIhqt6/vJLVIG6AopYWMei/dMScXJZ9yf?=
 =?us-ascii?Q?xzBCrC+77gx+TGz75K7gJ1YUQp61fx81qQcWxxhwc8jaUQlNFqpK5Yx2mV/c?=
 =?us-ascii?Q?IXfxNnghaGbRpcINfSoIW6Gx5ovZZ08+JHg6dSXJB9FGRYw/wHAh/DF7W2b4?=
 =?us-ascii?Q?mS90zSxi1NYMZ/L8whyJ4lb3PL4A64rqGLsAlsjMXBNC6Y4fEq5Su1iCw7LH?=
 =?us-ascii?Q?fOw+iKSrGn7na1MjKYkkfm5E/lpEvOIT6ZkyH7lQJaaFHeUw6oUxqfTc/+rG?=
 =?us-ascii?Q?opCra9ZwVGPk/6WVjpL1OfoCQO3ck+WF2t5CgallPyNUTJVCnR/m4T6p4bQe?=
 =?us-ascii?Q?8XDfwCDrrgShGl83mrXn5PH+MmWAEPrQH98l/T+XW/BS5JjF/dhbj1qPdZoU?=
 =?us-ascii?Q?QQG0h59iSKMorYBrsjcgo7GEt3AfVsCojDq1wP7Frmxzfw0TlGlmHnj0nobP?=
 =?us-ascii?Q?kq+fNz73d9rHctfEifFBHPKSFyMh07Ed8TQeHL1BBiDtcJmO3rQE5gXQnRdm?=
 =?us-ascii?Q?7DdjbZ7uxlH2zPqLvZIbPwRjlQnRPXT60jbBOajZRVgmjhEFLxHKhI9PL5Ne?=
 =?us-ascii?Q?n+bX9MzUyzJv1jhAQc0EDhCCE1evVPYixq0tWB0bTgyZKikU8EMrfxORsbeY?=
 =?us-ascii?Q?FaFLLiOJ+qfI9gLLSdl4iLzE32FckEkMLgTS8Mo3nT5kISYbHuJLQFdIquU6?=
 =?us-ascii?Q?OTc5/mK5dTV3xpbU5/8sFspNHlWmYOQwcqBAIpKKbCMHgZH6TAv9RVqZ0gwX?=
 =?us-ascii?Q?4i1ixKIk/b+QhZiQgrXZvS4IDckj+d3+lr4MDJHhRUcJd5X5x0w+s9CSSRBf?=
 =?us-ascii?Q?Q+EmcdaUKy4RVvlit7CTP2Djq3p4z645PZCUVgsNEwUNMjyo0h9tO/n38Fmg?=
 =?us-ascii?Q?EOqtyMENZPco+g7KssfTfgp47f8RrmTVYJXEbud9ZdNDlh4CJMndDL38Q5kk?=
 =?us-ascii?Q?Ehk+hodzdotmnGYmAxLkn4PSfZTdN1Kqsr/n/77d?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a74b44-e0e1-4499-6793-08dac2e95bfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 07:01:15.2314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tuHEkvKZOJdfeM2hzrYmyJ0Hsrl402rxIXV2pwKKI1MRCqghm8A6XMy22Pd05CvOi9ugG75/qzv+P3jo/DyaSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5546
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Tuesday, November 8, 2022 8:53 AM
>=20
> If the VFIO container is compiled out, give a kconfig option for iommufd
> to provide the miscdev node with the same name and permissions as vfio
> uses.
>=20
> The compatibility node supports the same ioctls as VFIO and automatically
> enables the VFIO compatible pinned page accounting mode.
>=20
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
