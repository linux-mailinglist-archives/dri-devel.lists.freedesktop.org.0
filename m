Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D784E5A9071
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 09:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1265910E611;
	Thu,  1 Sep 2022 07:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1F610E5A9;
 Thu,  1 Sep 2022 07:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662017830; x=1693553830;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E0tjURMAVeo957WRs0WKwNwl2PPLitzga8gvJwF55UY=;
 b=fk/4JKuV+KGp1ilBGEL7TIpJeACQWPxNljbNpPP6VTUGKDH6lzfpCWJI
 V0C15kbgqkAoS5azcSZbelknvqVQsGDNfqa9ZoN0yiZg8SkjvwVE9B19y
 ho6vufehOyeibZZ6gkZ/TezhnGFw67HV1LyZOxpN9Pa6PRuMuNEwqh7YN
 wWxdlpPd1CBxPjqBI2O4vbtIZzcnUWY3cKoSHT5tQcVR5xzHP+pJ2Y8Z5
 16FfZq+sPHmzl3j8fOegJMgEstmnfz+dxk4fvGBU2qGsaKHUogHE0hzAw
 grRZBkuoa8Iv6kUDjOQXSqP7cA6NufML3R/hyxZ0ES2DSjOlst/NpRoQ9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="282620796"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="282620796"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 00:37:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="857736439"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 01 Sep 2022 00:37:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 00:37:08 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 00:37:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 1 Sep 2022 00:37:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 1 Sep 2022 00:37:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5j+gGloIt26NQDRyZfrDNP6h5aGNqeiVeOU1I2qfOOE0w/L+QjpOtrebARe3BIWPSMUgcHyzw1L1xd0tRiQaN96h1hAaKEmLuZ7y+P0H9O1NnTBzSxz9qxtor4xOzElkEJLygZps1HOh9/kvkVd/e+M4emkpyPVqCdXeMbsYZC8rpJMt1ldTnGRO2EA1nPKd/wMVMhcZy1S9uyWr4h19pI9rEVaOYH6syJPhfeP95M39v34tcIrgb3RB/SOqBz7c3pGUAQdcpPrKQYmff02MmecRYfll7yEQH41TYtsI6Ppfmkyx93sA9ZUML3+Ln42kqEYFd29FPohbJBlqY1i9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0tjURMAVeo957WRs0WKwNwl2PPLitzga8gvJwF55UY=;
 b=k74RRWt4Blal0gwr2e0betc4agQw6Xao9BHk0rNQbj9VGoN3EECBSuaQMVS5Mfg1gi0+YW/2RnJ35Ts7yTw2jWglT+u7ceUyAekC2JjFK5e/S9OvpTJQU+GykO0Az3N9CvwAORL7xE2F5NVA01AefF3RpJKW1HQLBndKHK2Xayn/rdwAoEsveM7Vln/X10cvntEFkOlQfMOOpyqtPgnbNxZTYdXEW+DBxm+s9cmM9RwfIH9YEq2Ah0fYkDS8U3zilRTDqQSVKP7ra/F8t5SnzAxrzvHPQzq+GsNt+0ZmaVXAAt89o0tFMArPsO7C0olOl6WRXcTW2ZqE9E+a3uJ8zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN6PR11MB1428.namprd11.prod.outlook.com (2603:10b6:405:a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 07:37:06 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%5]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 07:37:06 +0000
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
Subject: RE: [PATCH v2 12/15] vfio/amba: Use the new device life cycle helpers
Thread-Topic: [PATCH v2 12/15] vfio/amba: Use the new device life cycle helpers
Thread-Index: AQHYvdM1bc3iXCaPfUypseokfXt+uq3KL2kA
Date: Thu, 1 Sep 2022 07:37:05 +0000
Message-ID: <BN9PR11MB52760EBD9E07701E1C5D651D8C7B9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-13-kevin.tian@intel.com>
In-Reply-To: <20220901143747.32858-13-kevin.tian@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63b2371a-9553-4af5-ffd5-08da8becc4e9
x-ms-traffictypediagnostic: BN6PR11MB1428:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ymBu+g1eutbSWViypK9xrL0zxsPdlOKgvQW7l7bwPJRHUFjhc6dRbXaTCVLXRqJxCpRKOvdEPauVnHXthJMD+Jk8aPol8Xxt2g6HPbti05VKlt3j7TiH25diFQuZa1sLlFObSGMNMCOXCtSMkZJjGgbiuPEckbes4JrUUup4adUqVYg8aE2ibDhBriwHMPI1n5wMi2WiVO15ndylabMogdUGUtViFM87YaJZOty0E0/UT8KpgbrdivIdgLP/XhLct4JWu55sohatJk56CPf+aWKX+IHfTx2VktHYo7g16vODS4l0CAJP8FE9qYfV5tTDyqHNleOQxANFbqZr1S0+ul8B6n4f00ph0MgvlXz8UCeHK1B0fXpJXRg7GTw2F7mSS8urf0UqQtn71KS0nCzjvq/NZnbrqSrt3FUic2n3oV+98AL1xqJaQXu28FN3KqXRD39NwCEizdozA71bcUkr7XhKlxsR9kralDMpjiyeVPqX+xqc5uUbrPvUR0Rp0DFNPOHb+2xZcxokeGgsRINZ/0zQbofXhKZp9cypmieAT9C0IeZxzIQr/iRrFv/P55qktHzKR2JDcMk5fpULkNFurLsxNwlyOJdtdeosDGN/d3eT378lOH9K8H6HfFSkO022g0TfUB+NnxWDQq+NxhKwq4aqGtJpWy2CBaDWXnyuyIK02k87TuIvTM3RDU0zNmaDhPIuRipXYX8aZDet/SwMhK9zuxxu5dGPS9vMoQZbQZCoHR75wNOpoVAjmXVJPea3Oht1bZ4rmiAFN5G+O5ORnIhc1MoXQlhnOZjeICHN2gg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(396003)(136003)(346002)(366004)(558084003)(6506007)(7696005)(55016003)(110136005)(316002)(4326008)(8676002)(64756008)(66476007)(76116006)(66946007)(66556008)(38070700005)(52536014)(8936002)(66446008)(33656002)(921005)(478600001)(38100700002)(71200400001)(7416002)(7406005)(122000001)(82960400001)(86362001)(9686003)(2906002)(5660300002)(41300700001)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Be7RFIdTO0SP6shqnlo47Wxy96SjStKV4AM/jcbVDgAecTT37m8ySty9G5OE?=
 =?us-ascii?Q?zXOb0FvMlSc33ozlHYnz5UTN7ifi+skE7dONerYlydfrCVaTuzlNgQ3HS/lB?=
 =?us-ascii?Q?cw+lF3NBuQn1bCx8x4yO2eAP1YUWhu55zaN/yo9GXUs4dKLWN1I70VBmAVi1?=
 =?us-ascii?Q?idrRZkQNyO+tLbLlYkgSK1Gi3YN6WudE9EwdV+trR2Tyh/hpEPhhhPxQlHPT?=
 =?us-ascii?Q?/+e4ABEtU/JmWDildjwiH4ar4C/dx8aWyka7vkZBBQzw0Bxj+jycCnmAxOYh?=
 =?us-ascii?Q?wCQ5+H9CZ7qZXSBxdC539gmdsy4v6sE86njJOeB6YLn4t0Xk3Q+Kvw69tdf2?=
 =?us-ascii?Q?J8Q8z2VMzEa5rWWneC/Em2VNXZ0FwkzP3xuQ0cclBmAceGdSgpMMLSO6MVeZ?=
 =?us-ascii?Q?vi/HiuGZhMk5Wuc2aYbvI1Sw8Ucdlg+AM186scUUlm/G7e7H5akWPdD3Osz1?=
 =?us-ascii?Q?Ktew3eGvlegH0LNW+dD95egECi0aS3/uInkn/D4gpCABVOJ0zsOqAe27Py49?=
 =?us-ascii?Q?vomEbXQZ0XBtJLZovr+T/qUDZr4gxyGRgmELudFtKbPGalblWwBTuGhw2efL?=
 =?us-ascii?Q?HL2ar3GYw8BIi8KWXVOpSzkRKBzFSFBiG0svBsJEC1ckmO88ZaDvxD5r56uc?=
 =?us-ascii?Q?v0ajmas2492m1Twdmq+DQ1y7Z8QjmPHlQdkfO3Q3XzQrxnk6O/A+UdvRPPKJ?=
 =?us-ascii?Q?y5krKg/UJquBCuQF5m2obONqERZPvJPoiSRBnVegsQ0cfdX37LRhE/+1Vyg+?=
 =?us-ascii?Q?Bf6Kimn5Esw/O3snVuNEzWH7GnU8u44TAM3RZkEIPtqTtTEUWlE0/xOpPABC?=
 =?us-ascii?Q?UyYCluVWP31QlBUUC5CIuDXp224DbtDb71MTSQmV+kB+VPvQ5mEYF96uFvF/?=
 =?us-ascii?Q?GcFnxR63ct1u/8tCii+bCcLUdeGvKe2IZ1cdDpMnD+jTgLwUrqnDv0dkKXMa?=
 =?us-ascii?Q?G1qyA8cDH/a/Sob10OsFuTLJJwRb29vM9rj30Wi9xKcaFobi4QnDeUXNQfxd?=
 =?us-ascii?Q?3gdQpxJRxE4yz3X7C20Lzty6bn0qfHGshzW8M3MzPpQr35qTtaTFRN9lPSO1?=
 =?us-ascii?Q?jFEn423CmXKtWj9JkI0Ru1NwSFVSfcG1kgEEBLhUaj82jfxsNS3qPt5AaOKO?=
 =?us-ascii?Q?q5Wd0xzwpwK/TLyTPwkkrd2b3oik2tU3EsXJDDvwjDgt3P642CZFuBH6+Qyc?=
 =?us-ascii?Q?++nUFjMZPLzlofUs+CCuiz49IPX+slHTUArlhj+HLps8uMTk3eZqoQiLMcGl?=
 =?us-ascii?Q?j415ERtq3kFKgIIbszyZePzhft+LTId5PqVVqHZudeEBs3rg0WhT3ELfO2Lq?=
 =?us-ascii?Q?/LcM/EeR5HMo1t5oyGFe9NhRIms+p0ksvJxy8hqxt5ENq1G3UyyvP3sNMb8n?=
 =?us-ascii?Q?8iwma1smFMRBG4aFSLQL6aHZeNLIyFRFD/G7PiV1ZwUtviDUupOCT+8Yy7Bn?=
 =?us-ascii?Q?pvD6195eZZ+4TufgDYOkijESEZPrYgFZCO9hnj7NYDa2tJRCq69LH5ZhLLci?=
 =?us-ascii?Q?Dw3IhMFYWtNB7AfvAs0iYFC7ZtHwuXP5klYwdvF6sthIQZUGj3uPmaKYXS94?=
 =?us-ascii?Q?jVtH4KDBrsOQGZuSFNk98l68skTvFBKuChyo8GyX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b2371a-9553-4af5-ffd5-08da8becc4e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 07:37:05.8245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zDo1E8A3rFj8efaTFcC55Lw1jW2142olW9b6nrhfFwD6eFdBT07SkHu3H4ksKXnTQ9Q8tqFe63Rn3+pP1DcWyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1428
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

> From: Tian, Kevin <kevin.tian@intel.com>
> Sent: Thursday, September 1, 2022 10:38 PM
>=20
> +static const struct vfio_device_ops vfio_amba_ops=3D {

Above missed a space after vfio_amba_ops.
