Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0497614652
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 10:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C4210E339;
	Tue,  1 Nov 2022 09:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6EC10E33E;
 Tue,  1 Nov 2022 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667293767; x=1698829767;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d3cL9Cibzyvv43VzarDema9esnf82VylamgRc8ofx5k=;
 b=UPr75SSxnEjUTLTPP87UdE3NrkwSpEtYx73uMNo70dGw4AXQvMHnFEqJ
 bnOUlnflsAVGw81AYoGmJ9GLjvIhGDC+pXjhI+DH5z6ZUZRWsNRaG2NWs
 wpiCumgWTy8ZQytRcb4Lukk2XaMEHviKNKqU2k5u0SM5e51gIlwLR2SsT
 KUwRRWShO5o3xAEvptGQrAmfAHp81oCu/NAUuocxAaLmdYXUK2QPbvCgH
 58YZ0V2wICmx+JUBA1IbFNKGVVk0NTfmFuYmEbJTkv0Ynfbo48Kwnym5F
 QpUpRnPMDUBHozK8xZdpyaFupJqsTOTNev7RI8l37sXhlIU3h8n6CgPb/ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="395411278"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="395411278"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 02:09:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="808846000"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="808846000"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 01 Nov 2022 02:09:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 02:09:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 02:09:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 02:09:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 02:09:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpEJAVDkr+goZikCeCJrHQ3JAvdMhZy8XIITq+sYiNiWew5BVDUr+nGkWTfdEMDbs0KN0JhcD1VsGAOINZGnu2wnpQqSV6htPer7sxVI+IYgDmX1dKZYmczDQWMuartrSBf7pGoP28cf+4nmBuU4tW29xPHutcvBrIB+GCH/Tws3Zy6/7WAR7OjGY9Vsy50mEWDfMqgOStRYckSeWniUmGFYKWeCifncYlnkdHMgdU+ZAWE2bz23ZieKzmoXspx75ccZkuWED9QyXXlTRSLT3Ydkmvi4gUQ+c9jFLJe5FlmS5lfXIIo3Ww38teZW0zLFOaiFXPZMbzLv4qyMtHpehQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3cL9Cibzyvv43VzarDema9esnf82VylamgRc8ofx5k=;
 b=dGVBV93XWidGLVcwdpR/awrlpm7NihmlF3OF1PReSbsMbNOifOFEYulAkOrjmvk56wlnLYKZyQ+JvqTVYgM5TJwVOSL17yE2XmnloGt8xD8jE1ijfK/Yk0lILs1OcCb+A8II5rEks+5+QXalPFhRlEf6WUyQlo/lQGYdgGWOC6K76tSbET6WXmQJEe+8MPGXj++rfdODxHkl+ohkmfHxb+/je1J9KgFetkgo3dBmecUCqmpD+umz6IWMgHThKvKcBTD2HZDRZMhpzT8S3E6Og74crzREfCTm7myugSOJPZjTL+jFObZNxLu9vAbVRXK8NOwEGUdPC7zlZH7m3MA+2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Tue, 1 Nov
 2022 09:09:16 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%5]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 09:09:16 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Eric Farman <farman@linux.ibm.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, "Liu, Yi
 L" <yi.l.liu@intel.com>
Subject: RE: [PATCH v1 5/7] vfio/ccw: remove release completion
Thread-Topic: [PATCH v1 5/7] vfio/ccw: remove release completion
Thread-Index: AQHY49ch09fbxb5+bk6wNsLTkwW1Q64p23EQ
Date: Tue, 1 Nov 2022 09:09:15 +0000
Message-ID: <BN9PR11MB527609A5BD1A652D2108B1CD8C369@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20221019162135.798901-1-farman@linux.ibm.com>
 <20221019162135.798901-6-farman@linux.ibm.com>
In-Reply-To: <20221019162135.798901-6-farman@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ1PR11MB6252:EE_
x-ms-office365-filtering-correlation-id: 01723365-9455-4351-bcde-08dabbe8c060
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kjZHyUm6BiNqqNP3zLj+EVUQOoSCljNdYF7osPrT8MPRj2qp6Bj930ZqbCsdR7AppSz/Js+kgmfRhUbAUofpP0SM9CR1T7FY3+x+nWj2Dug+6e5bd+/CVYryfcUf3cmvajYTzCMEYCrJod5kWFAHMl2g1a0hdrAv4jA+KnY/FugeIOsqEb6m7kCT3lyZjIhwwragDR0+2nQlE3ErZAp0//jjw5OCLtRu7Vm/D9TcpIp4lXccXpXN9oUYzIHXF1drkcNRIbAPliMGlinRrJB/JS3Qy6YMFQaHoqFS7qsZWjFL/cKT55HCxh4JPRonKccunXKu7cZIuqrCXA0I4XG4BUUnMcOOTPjJ3HpyEX2pzELxJ1W8IGaOYd9Niix4s+sG4ArdurE87U5eDBiZ16btGZxG/mpOaqNT3976yt9JKrfBISy9oNtdAaHZrvVYPFmcPQIXWI6lRr+xbIeuOCrt9UmMJ/mYlcfswzURWSWggWt6Aq5vEV0eygVsp1hbXdegiIZCZE5LzXsaiRNVSlqRAzYLTmBnvOIILevySa8VMR8MakMVx0oQmlZMXqO+vT8M2bdb+P3qa9ecDVhDt/2pbT9O4Rp4gy5rMvgFjAkVIQoVlzgmbxUgNuFMw2oZ+MkkLt3E43fMN3DzNpdMMa7cJzHtbJ5iL0+2MQzumOgscmA1rWJeWYzF13vYhRAJPLep008tm1X4OUow2c+aN7H4a9V7OG2gy4/GgzBGlGtqXjBpe8x0Juph1AoH1SH27h+cc9gQDNgHTkMlmDqZozH+Gw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199015)(5660300002)(186003)(66446008)(7416002)(7696005)(4326008)(9686003)(76116006)(66556008)(66946007)(8936002)(64756008)(8676002)(2906002)(66476007)(6506007)(38100700002)(82960400001)(41300700001)(86362001)(38070700005)(33656002)(122000001)(26005)(558084003)(55016003)(52536014)(7406005)(110136005)(316002)(54906003)(71200400001)(478600001)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vP9TMnQ6iL8VCLiUDG6ZMVvpd2cqgC/3ku7eg+e5OIU1RKj6VEZQ2gV2As2Q?=
 =?us-ascii?Q?00R+WL9osqD6v8yExM3rA2Ly+aginxHXGcsgfnZg6ZjzBPw83EjS2/dk54sr?=
 =?us-ascii?Q?o3VlFD+ZlXsiWWENmJa6wpIWOyr5zqCxzylvBY4OVMZjb6DLQ0Pt3RYHqM22?=
 =?us-ascii?Q?WLoZ+h/ngokTY9Qhg9oG5O0uH8jghQQGkssJtw6/YLCQu9ukIAJfgQTowD9e?=
 =?us-ascii?Q?9fe+TKu8+nHw/S7kLtB3cAGkz3qxPNzu4Za8QfHStPJay7viUyyAoFHrRnQw?=
 =?us-ascii?Q?TTHT96HOes910Xw/iM0Tl6K4B+t4sSyGh/4crkb/WLrYZcISI5xzdHdqu4q/?=
 =?us-ascii?Q?wbhALTUmXxV2k8SY11CWnu1gs5WIt2WneDWIDt+/9Qv0n+8JndbKPK4++Vb/?=
 =?us-ascii?Q?Um3SnHY5Z2KNjRjDuzvun0e1T+ZsKIv+83PuLN7QiPAtQ06LLC0G8qHbJdxh?=
 =?us-ascii?Q?tr2WO/PbyWYe+VN2sibisQpsQ8FgkikQgwOTv0f4Dp+9CUYfW20qw4iKqFcX?=
 =?us-ascii?Q?lXydQoAjWzUQvoVz8p9ObLG9T2WQNhNVKJtM0DUOxUuzjaX+rnFRnfMkh6w7?=
 =?us-ascii?Q?xgb4BWaSEqiOcqTXRGt9wDkO+W9jX49oi7v9hnjrgJz4lPpxUakcVyWFX3rP?=
 =?us-ascii?Q?G8j8uZiwj6l0kCSyK05s/VI5zKjmre9qzZJBIsBlKdr7DVmfnL9/ApZdaDgQ?=
 =?us-ascii?Q?tSAI1xje2RGsFysVMRJawcb7HkpIlzoHFUdaww/uMi14dTVBB/O7rkS6TE2j?=
 =?us-ascii?Q?W6b9ynh4DJPsMf70mDzH39sTnmy75Jqq32O0i1W6LbC4vkNQMUDHaeyyEQUS?=
 =?us-ascii?Q?Ot5nqDyDpMHqqicPWorgFtXIqmQOWA5Y94h+oCmaTKaQ8Y9EAA0n8Lqxvbz2?=
 =?us-ascii?Q?9EMZtMMAC5nqMqvWn1R92/cxZOfB7x+q75eWXp4RJv7yp0jJKYqyqozm9olP?=
 =?us-ascii?Q?fsKOUCdXSJZ8ZM6tV4PDuL3T4HwMQV+aA8Zemhyd1m59M12DHBunDzuXiy3E?=
 =?us-ascii?Q?wbg04kpO1TbyizgFjbSKwUy8ZSdCXNj4q9wIbwUgA6Ofi84TTsMeKXjpCPuU?=
 =?us-ascii?Q?RrUJi4u21gl7NEhquQcpoHDRrvbBx9eQ7FlPrQ5Exz+IM2YOw8W9kazdwdJ/?=
 =?us-ascii?Q?11EU7o2DpXNjD+GPi7mrOX2DuTI9MKCJhYeq5RnHGC/1MQZ/blNNAfjFo12e?=
 =?us-ascii?Q?RSH8WmNjHbcj2T4kJDvIT640MHW8w/CdK9RXz47uegtQN/rRTzHK83Ylpmk4?=
 =?us-ascii?Q?IM1l2wYjPVTxwNiCcOJIH5DbxMUOlRTYqgjyt6gNffAmrtUbnltot/Sh1pJ0?=
 =?us-ascii?Q?j24vvSltTy2ZOSNOm6qcub6yPrBZHsdj3YRvS1D30678ErHhkVh5Sjjgawbv?=
 =?us-ascii?Q?jqFoyVz6M4Mt3+q1q3D4uG0m1CN/NKnM7vAfOqBaRf66i7nKfPA5nBJqcYrw?=
 =?us-ascii?Q?KAQhrzfZ4TL61nGKldpjrX+1CqrobgPpYwks+HfNQ5TxVKsYNf6mWKsrllu3?=
 =?us-ascii?Q?na1SkCF2rdpBT9LKXQ0Dl1NZXwiaXz3KygYupgXu4a2Vq88U6hA5GDcc2tSG?=
 =?us-ascii?Q?Vu8WGMh/tzwzKprBAYYPQl3Yq/V4RP1iv2v90z8H?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01723365-9455-4351-bcde-08dabbe8c060
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 09:09:15.9936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QaS0TH4zY78Xdz4VqigkhiO+4fHNB+sXlBieS+jWVoUlFtywBKrUrnZcVDy1gMTC2Cmh4K14pwbLsfub7UqtZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6252
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Halil
 Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Eric Farman <farman@linux.ibm.com>
> Sent: Thursday, October 20, 2022 12:22 AM
>=20
> There's enough separation between the parent and private structs now,
> that it is fine to remove the release completion hack.
>=20
> Signed-off-by: Eric Farman <farman@linux.ibm.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
