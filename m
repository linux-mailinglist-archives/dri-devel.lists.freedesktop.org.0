Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A735614669
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 10:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F82110E343;
	Tue,  1 Nov 2022 09:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8CE10E33F;
 Tue,  1 Nov 2022 09:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667293909; x=1698829909;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K59X3Mt14TudHyl+9MwWkzMQnymoXZZFMnysWa8sZh4=;
 b=GJ1AfypLgAMW1jBy3SgwD69MNr0jN2T8hkhJzGV7YYv/izEmphGNbeCe
 CbtjWdB8jd/cNIxlp3S0NUdENkNV+sPCfg1xLXwDuaF/N+l4Wz8QNJGc/
 R/1AQWRkLSCPzwvU+mNoN4LZAvFg9ypSC163AMZjqwoP5ikdyAYp5Pqol
 OyooRMBe2nF602X7rNWy9x7fufWSOrnS1ZnyUQ4g0liMcuw8XFEOZqkaK
 RYZOfmDaR9z1nt8pcF5SwVRxE9F2HD9mcqb5W3U9Nlj6aFEhxXz2ZARYM
 IBDLUc0N/RGdK2MXBLo3RH08kCLKyHBulUqlqrKhkLh3Dfh6M3ItJExRr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="373313504"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="373313504"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 02:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="879034719"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="879034719"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 01 Nov 2022 02:11:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 02:11:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 02:11:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 1 Nov 2022 02:11:42 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 1 Nov 2022 02:11:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1l+wSBTK3uXEu83/YbosIAAgSUdQ1T+IneFucJS50Q3d+z2plZSvxz6mEVGox9sppZTsRHp6Q30XQX8zgfPEVHpSIUlJeWrm/YIILvayclmZNNa27AUvvj5S72+f8WEMxDza3kWR+XWxRy4SX9OTdrcb61p7HfE7RAUHE6DRt9FXTnqt+5rcQ60Igr3g0PkQwC045Qz1fqXfgY1bTloy/Cpwhd3liiMvvi2zB+SdlEPcxePJnyavyoH0vBw8eVvDg/g+k2H+53PQ9QcSxBd4qJ8f0OBALbLdE/YHh52oxUtmtv0BERAt2cEw9e8kfCL4lMAgnwyVQ0slWEYI9C1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K59X3Mt14TudHyl+9MwWkzMQnymoXZZFMnysWa8sZh4=;
 b=DKhRRsF5f03kFW+nBpdeNB4WYmjUmeY2V6+H36lNH5efolSplZuKFm2KjNQXALyQae5WsMOmnMEKhtl0Ah2/AVuog0md7pRt8p+2tslMjMjjnlweoSMmAaHa0X2id24htE3arH6A2kyiD23EaGVvr23MUlc1mnQWHsto1gvW3vs/JUDED4KgcB2TkYWrDrDCOY8G42ioeJ2bWqKSfo7hsZ+dvHiAfnBNeai1AKpWy7aeKKS9Oh9Z2eIRUAsgQ7OrnLqmJ6i5ntyF643ocC8p+g4WSmC3D1bbPfVYRBnZdtti2Puy0TeGfCfVaa9oV6rrBmsAdvAd74N+KMUM2hKpaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Tue, 1 Nov
 2022 09:11:41 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%5]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 09:11:40 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Eric Farman <farman@linux.ibm.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, "Liu, Yi
 L" <yi.l.liu@intel.com>
Subject: RE: [PATCH v1 7/7] vfio: Remove vfio_free_device
Thread-Topic: [PATCH v1 7/7] vfio: Remove vfio_free_device
Thread-Index: AQHY49cc6IlfQ6/8HUyTbs6M71+22a4p3CKQ
Date: Tue, 1 Nov 2022 09:11:40 +0000
Message-ID: <BN9PR11MB5276DC6065E67B0AF6C4127E8C369@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20221019162135.798901-1-farman@linux.ibm.com>
 <20221019162135.798901-8-farman@linux.ibm.com>
In-Reply-To: <20221019162135.798901-8-farman@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SJ1PR11MB6252:EE_
x-ms-office365-filtering-correlation-id: f6d7830e-af78-4757-890a-08dabbe916a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JI2x9prWE1ET2TokHhp2Yz2tRDgoX9UhZY0zCtjYHt5lOnUpDPHKEli4D8etEIJ6g/oQzfLmlr9xo4cDe1DEJsVUHj0TODfwVs2dSNi9gud1K/U3Gb+YIyHIyP9G6pD3+SE0zjEfBHmBhFhkP/LfA2FRY5jX8R/MFwQpskNGW4FGDNnaM5W2pnhBAnJVH8LhShFSf1vG5QS/qqQ6W9qIffJ8qjopbYO10VNBTDMVb9vNL3urpD4BJHGOV5aCrVkDgDt4fi68OYe6ocqP/0qVujSH4XMsrY8I6o8uU3T68XKXarpXjaR1w1+XBl1sedYrriHjfpOBb3knM/gisvZvG0eyEx17pKZT1Tjtc9fq7rhtus0JkHHd1B3M880MYWzHFdFr0dHJqTob+CKpNaD2llSkc5/Huptx/xEML397WfRVepmX5SJ7QOfpEzL3DgsMjIdfpXDlT74muP1QTI832d3nLSMI1pk2KBb60/HQG71dcsgN6KNfMH76OxRxPVRiVsY4bo3eMmfo/tZnYzThZ9EIUV1subPyZn5dO8++sjfRdjN8IM1ikBg/Gu6Dk7ZwyMtFXmQ00Svj7ljAt8bRohBm3X9D9JLW/or8B+mtlIjyI1JqoW68/Qk9DcC+fZYyXjaSC6jxx1JBLs9yB2Mci5CB+B2zhlvOLBAK2KSku9xlDw2/Gu+x4bMt14DW0AGdi9wPT16GxP/7Vw6LSmQNpeNXAuo8BqsajRT8uVSxh24eoJ1D6szWS6F7E8vVwvpVNnfJ13+JjPq7XrSkaWzfcQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199015)(5660300002)(186003)(66446008)(7416002)(4744005)(7696005)(4326008)(9686003)(76116006)(66556008)(66946007)(8936002)(64756008)(8676002)(2906002)(66476007)(6506007)(38100700002)(82960400001)(41300700001)(86362001)(38070700005)(33656002)(122000001)(26005)(55016003)(52536014)(7406005)(110136005)(316002)(54906003)(71200400001)(478600001)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SkyRIPOYxnZgMTm0248637MnkDRjWa6bn2/uL0MvqNOwweeRbMqMIKFLmZVa?=
 =?us-ascii?Q?1ir/YL261iQSVhVi/dJwKlUKQCaccFMctwIP48G78Ff1cLJzRRS5fVCTqpaZ?=
 =?us-ascii?Q?GSXT+3kqEH9ApIO8EQRDoWh0Bi7Zs9ZO+w0mumKIiewffhia42Q05nOtLvuQ?=
 =?us-ascii?Q?RopMGJtHcGYR1qjLWT8Ezzfrxp0ItlePco1b2MGKXluiTKWNBuVj4q5swNnV?=
 =?us-ascii?Q?INAlrB9TG9hT7MvP3zFw47BAbmNRL+2AYbP1y3h5dj2EzyoZJngYT74DRta7?=
 =?us-ascii?Q?1pJhs+SsDSflD9JrCWFYTkTHDAI4ez3tdtr3mKO2OEgbfx0d/3Dka77BoxLY?=
 =?us-ascii?Q?uy6fc/zt6raP9t/26i7DbA3gkPTd08dijgfWtydG9fDSmQZ1yOayGl/DSjpx?=
 =?us-ascii?Q?SpD5p08PQ+cjTCGN7S0b+0kXBQlIZ4rKqae3uwrUhlggZ/bGg/Pdn8uWOtAu?=
 =?us-ascii?Q?CzkoXG5/CDxJLx2WeoSzzvKrSXiZn8VRmZscbWPBgxZYURe1KPPNVJ2aK1Ea?=
 =?us-ascii?Q?mFqraTWSnQNSZsPn8jdDqp0iljmfN/gyYoWy6QVexLst2rjDIKyNmpcCh389?=
 =?us-ascii?Q?dOfm7d3wJMVGFvppJKpcQe+hwItg3po/4gLL3xlI9pLxb67D1zt4dqiXbTAl?=
 =?us-ascii?Q?H7FWMzLgwHc+wT6j/ardx8+D2HDRM9qjMedGi1sxj8S7fLS1O6hPDuXc1umI?=
 =?us-ascii?Q?dsQhTvXEfnzuZvvPTKGpga9zMKQbdqqhEsCAytlOpXLp0QFE/WgOMaP1k15+?=
 =?us-ascii?Q?TJ7VZOFs7FAJ75pLN8GMqrgqn1M0pB8gbS6U8mozwMHTlK4XlkyEofil7899?=
 =?us-ascii?Q?LtmbYegYnxCIQXItlvpJOYnZJ0YpTVuDr8/d62E2vX1uIiPGvHoiwcH8WduL?=
 =?us-ascii?Q?mVhty6DQMuEWvdsnr+1lYz3GtQxppnLWUUoIsW4uvsJD+KI0WGbmI8cE7zNU?=
 =?us-ascii?Q?SVsSnIlZEVI9c1AjqtsE0Eltn+22nz1GtrbaZk3xfDl/HhfIMu1U9TNJMkik?=
 =?us-ascii?Q?kqqFYLb3Z3SLLy4ZC4RkIU83CX6l9JfU9X9sb0wtGY3P9zCTy+wK9b7wt++e?=
 =?us-ascii?Q?5qQMS0bUhYa9UANgh0u2CwzZFm43VR41/V7cNXw3MQV7PyMFEQauR2ilirGO?=
 =?us-ascii?Q?Ky3ersqPnt8RvaOS/soGSgPYHPr3F5fteEoEGGI/0JMXEVKcZxocBeBVLM5q?=
 =?us-ascii?Q?mENKIvJ7qjxWYP49zM6sAn3ks8FBLS5OzlOUsm1GiE3X2mHo+goQq6gvb1Wa?=
 =?us-ascii?Q?MJjU7WncqObAEJoiXR7ITsBhAjO+aetIS/B0+h2VeEwxCkaFqEmTplOZzRi6?=
 =?us-ascii?Q?1kCNfEhoI231CIQbWiu+z/1KLrWQrD4D7i8t2bctodlOveddfvQkhjI3HXY9?=
 =?us-ascii?Q?OlLLln3bJ0P8nAidpyxosPo5JxbtMEBC/lyZuvSzFoUmgLWx+KsAi4sTdWRF?=
 =?us-ascii?Q?O5k3z6vH8OHD3nbCStteliWWE8/s1ajw16/1GvV8nv6Az6yZq/HNPsLPv4Jw?=
 =?us-ascii?Q?ptn9H/Dt63DPH6yelwg0ow5327dO+OSon4tPnkHOtKFI/zXqbKnCs922N/Lj?=
 =?us-ascii?Q?qYypRJDTKu64BlzOY2aYMkODP3dVnIhD6GDEijz4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d7830e-af78-4757-890a-08dabbe916a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 09:11:40.8173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UqGy64TBx1bi/4oAKWjo8RHwCKyqjnTOiDp8JVhO6xyoid7AzKgbZ8m8JKBxsupqiC9irUsHa0/C4QS0gZR9kg==
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
> With the "mess" sorted out, we should be able to inline the
> vfio_free_device call introduced by commit cb9ff3f3b84c
> ("vfio: Add helpers for unifying vfio_device life cycle")
> and remove them from driver release callbacks.
>=20
> Signed-off-by: Eric Farman <farman@linux.ibm.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
