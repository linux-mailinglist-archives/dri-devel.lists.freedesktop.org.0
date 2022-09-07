Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CC35AF911
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 02:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D864310E023;
	Wed,  7 Sep 2022 00:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B6D10E023;
 Wed,  7 Sep 2022 00:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662511428; x=1694047428;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u04aqMdnOB94il4dLinvsH8yANhdwgUr0G6Yi4qKvwQ=;
 b=OBBGkluRefDG0a6vseIu+X9LhgnqdzYqtcZ0KZZA7FH5PXM60ustLKRQ
 bzFZOk8pyyZaFMZFfu+F7F68AZwtq8T/gQ1Og1ByklAHO94QUsCn1irig
 HntKEoitOL7pMRZzBZGhGDIkaOjA1LnDnYAVnOnsEUDeJFa2vnVGl5ZSa
 rbTutskH9kHci4lNRrUMhbxIGD+Ssgth503WkPEHGCfUhNJg9t0YrC8jm
 grBAMgeqFLLcHMmho6JzY4kZqmOL0dVwUmXy8FUglr0UrKd9yqNp+ETaw
 uLIqnVChV51rhAfs/3QX5t4J+CjvDpGIAhwtWValwv9XCZw/Rb341mTQO g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="295479687"
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="295479687"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 17:43:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="717922857"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2022 17:43:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 17:43:46 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 17:43:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 17:43:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 17:43:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1sXhWmvgUiP2Mmn60X87ojTzkrX/aq0DFV3oiSGVpO36NLhaxaTpVdD9k3nXFY2xEVa9opN+oJnp4Mw7x4V6641S2rEt3KuGSuBG8SGmBeFz/y+o4fBzyKC5LdOZydd8iJRXIQH6rKi9EPjMnBPWlsn9cUdcR9Xbtz5hKnNfH3Didin+BylkyrT3Rf4EfQaKTEF5/FW2rPRgfquMXMwUEm+tr4nFMq0Bgjtlqgn8CZd1dKTAFY0LH9e4AoNvJ/Cc3+FhftdeGfk+U2rJ+veAwZh/Caz/5h3vXaNAOZB+MOnpoGu/U+eJ9xT/s3fT9/mX2dpJ+DSwxeg6g/fz8mrvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0YjOaPJoJbEx/hzu/ioO/3e5KVgLK6XcPsMTO1Fi+w=;
 b=To7wBMSV3Bt+xneEW/xFZsERuQvO0NXx8Yjwno2jUyOXPVPaCi83A/PJif6XmgOq1c+16kQfb6SoXcQotWQ51CDn2vmFOq3sp+V04H6aws7YiXcwLrzjaptvE7tDt8BuT0aLafVO0r+SjcyGmCwj6B6LDIFPL3v841La4z5hD0byQZUFfQKaLGPuwMYjfkBf4jVl1s6vKNET2730D/a1LASMx4TogLRG5LDrAFONbrXSqXquwZl8egpQ5hPRe8JE7Rij8Cdnivm4MYLhYkCrQ/ulTuHK1NP/HZpsSLkL3sycuzujfrPhqZYJnHCKlKRGm2xTppMprYLTC9OZ9uAF1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN7PR11MB2674.namprd11.prod.outlook.com (2603:10b6:406:b2::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Wed, 7 Sep
 2022 00:43:30 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%5]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 00:43:30 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: RE: [PATCH v2 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
Thread-Topic: [PATCH v2 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
Thread-Index: AQHYvdLyg4z9as64RUeGfBAXbmJkJK3SLhOAgAD5fBA=
Date: Wed, 7 Sep 2022 00:43:30 +0000
Message-ID: <BN9PR11MB5276EE6209C1E3D4662368DC8C419@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-2-kevin.tian@intel.com>
 <YxcV05AVN4kqdPX6@infradead.org>
In-Reply-To: <YxcV05AVN4kqdPX6@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbf490c5-876c-4079-c770-08da9069fc1f
x-ms-traffictypediagnostic: BN7PR11MB2674:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2ElGJf81cUtu+lOPMCOYEnzfh71krAvwAjX+twh93HMHq4Q7XHcUjDV1EqeAt/n4h0Ln4OYnlV0wN/0R0qMC2ks2YystrO7PPANABle2eAd8BzMNn8Nxg1z4a0BxJkqKNuOmO1Gvc7so2zB5fvGZ5hPMoZopQVij471wN4cS7S+i494FntbF7ESR8Pbsc6JZ2C91n+e1sIhK566SewVEiPLJZ0TxYK9dE/eb6K02wBRgbgao8j3ueLCMgr8gijzJLxEdsbevhuQBplDH8G9es8o+lfUS58Y4G7DKWD+MgU9lM1KIYUoaMid8xpmNDxeSBMKdNgYtaLdXoSbbROgTFBQCr21s7/JZNq8xD3jY9kWncqfoyuClsSYtBGymFtn/IVCNs76oBnC1oaUcichbdqiErY2O8RJnsGwTTR1ZYQ0h70dKUKaAlBCY33hGTXjlUXZoPaqtqx88DkEPFb65mttXgQUffmOUZ/OA+2+kAtGo76Qhu0303qS4LmSQ3k3fMiNisVZjAWVucN2yR59CipgPWf5aarLC0RCgLwCGpVLu8ewi8yJaVPDQ4T9r0GwpOmVcJ+u2jpymqn2hdNQTeE9T5TVGd0x8lasiXn8VtyLY7hPW07vLwABQQ1g1uLhmfWg9EXYawx93utqJHi/Z2RgPxpr4AyMUsEI6IfvptYMKX0rhKYwYhp57PUHso73+vYeSHQsxsv3soBnkmFCV5j6UNQcpHTcxxcx5CVdHanTrort/zsi5CkK+FDOx3gfodqMAFTasihLpNFztkLSSNQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(376002)(396003)(136003)(39860400002)(122000001)(76116006)(8676002)(66556008)(82960400001)(64756008)(66476007)(4326008)(66946007)(38100700002)(186003)(66446008)(71200400001)(41300700001)(316002)(6506007)(54906003)(7696005)(9686003)(6916009)(26005)(8936002)(33656002)(86362001)(478600001)(5660300002)(2906002)(7406005)(7416002)(52536014)(4744005)(55016003)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GTtuYcC0DGbWzmDsHx90EAwc0EuPh13aM9ZW6JY2QlSBauOac0FpGjuCGlc1?=
 =?us-ascii?Q?Ly0YkXE8RhZJmFzk8X0SnqIa3EnGIcQQsrC0M5TFX8fW6T9pldyzMYip6cMt?=
 =?us-ascii?Q?4RI+6G+QYR6WUr/5K8ha5DpT/GCWq5j9B68zTyAJpu0eQv0wno21zCjP7M9i?=
 =?us-ascii?Q?++n6Pk16OiGca4cTtLdsTQcmIKq7w0ioxBiXNzthpefACiqOlNmsUIEzimzS?=
 =?us-ascii?Q?4x+ZPVnCYxTcNRKuDsmsL743CJHtJu3oiTBmYj6jtXRNsG2n1Cs3rqTiuP7V?=
 =?us-ascii?Q?3Qs6g66xcR1gdcPhbtJ05DV8nIUP2V/MrkeKgUmRI+OHEsEIx7OnOP+DJQU0?=
 =?us-ascii?Q?wOvk1L2ox9fRbNWQSVs5TMFAlw6qCxzDxbIZx0TH4lBaWnzYrxLORCLAkDi8?=
 =?us-ascii?Q?Esr9M0wBLwFH4oATQZ2kx0SGFRpza+DfoQCj7xjaqYS9nv4MFPOlKZeIY6Zr?=
 =?us-ascii?Q?5QkFRk5cZnKDjsBjhvDfrLnl/41J6B1wBL6Wz4yIK4MrHdlD6jRtmmNobwUu?=
 =?us-ascii?Q?hQxlnpTkNkzs7MqW3dgnoOOUP85qWU/aH/eD4FHB0zFpDr3Yu06n/HhQGxw3?=
 =?us-ascii?Q?ssHzdt05Y5pXfzDmdu4yUiDpzTM+w2b+/FaXjzoKXX/LvZHILOs0L6Kdjssn?=
 =?us-ascii?Q?Cz/Z2a000WYA3d6v/DCDECGr2rE1i2XODyK78ENiTInAWx0796oNsf8Tdomr?=
 =?us-ascii?Q?X5oMCygw2JfLOGd0lNoTGq0Mo5gZ15jCOUaKY/qz4llTNBdRZ52Q3d5K2Avx?=
 =?us-ascii?Q?tD19pKxxZTCUSJ7BFqMj12ZtkMRIOH3f+vHlk+GmrLRCyIXO2sgFlKp5uHnR?=
 =?us-ascii?Q?SBbMoRlVTyDAGXjj9t8i4ONRGQi1MgaH00hTEW033yh7g3t2E6yhiesk0lXG?=
 =?us-ascii?Q?d4uQmJxJiWIQRtvVQ9fzka+BxF47QsREn4Xqn3A3BF/NVsg0f6mlpMOS05JR?=
 =?us-ascii?Q?2nVxsGx4nfHqrU8yCmlbCNbBwiLWaxqQaiygr4mgvFWYtlwwX2EJRsGrLuQG?=
 =?us-ascii?Q?IggzNAxBG0gfW7fw/klaOKCzJKpuOmTR/Gl3xk8SISG0aWjSZxBba6bra+9S?=
 =?us-ascii?Q?FlmlBB8llI9lwkrlZRtgsd0IR8ybZIN92TMUlAKE2EtdAqVYExj4MVjqCV6D?=
 =?us-ascii?Q?m66QLheNnUGG4DgT7mA+sMPblfwAQ5xx+1IS5rzM8cLB7+fcsrgTzN/8RAiP?=
 =?us-ascii?Q?m9net5dILAbViu6m2DcWaLcrCbHEc5TydASrjT46fR4vtQvCuhLq2cxFbZPZ?=
 =?us-ascii?Q?e/Pet51Q5WOKRfc6AC2NevEHzJFjbMiugLIhC7hsYTQ4chuXfqFk6tDO88MK?=
 =?us-ascii?Q?sWqEIpE027vwcPH68Y0Y5X9R+BijX0wWXgtNl/OKKQkvz+fgkJxKLB+IpP1I?=
 =?us-ascii?Q?PScvvSBK/Q0hBF+xONGp4N8WcKj4X6hGcXzeKtUNU7/4X35+VQmTSQdqRgzS?=
 =?us-ascii?Q?94PGOFc7cQByNMxRwhNQpflZrrCb6F7IQF8zIaETVlrR6i/tudZE/nLTh/MO?=
 =?us-ascii?Q?uXwUUZlpd0X+8G8el71sgmNHpYmun6J4DA/Wfl7ygDEpN2Xz2GsTQGWQ5p6a?=
 =?us-ascii?Q?VaSEdK0+EM6SBk4WeccyJXlUtV3VbWkAYm3fGT8r?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf490c5-876c-4079-c770-08da9069fc1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 00:43:30.2097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O8iSCugMjw6X4cze8kIKrHk7hUSSKW/+Wy1T8Yc5UlgBmLYdgT1hoeZ4xEGXFwjqs8QLIMrVIqHCQQRFNbwOlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2674
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
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Diana
 Craciun <diana.craciun@oss.nxp.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Leon
 Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>, Eric
 Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Christoph Hellwig
> Sent: Tuesday, September 6, 2022 5:42 PM
>=20
> What is the point?  This adds indirect calls, and actually creates
> more boilerplate code in the drivers.  i.g. when using this code there
> is more, and harder to read code.

The point is to align with struct device life cycle when it's introduced
to vfio_device. The object is released via put_device() then what would
be the alternative if the driver doesn't provide a @release callback?

and with @release then naturally @init is also expected.

Most added code is in patch1 for implementing new helpers and
patch15 for introducing struct device.

Remaining addition is relatively small when scattered in each driver
and most is due to creating new functions hence new local variables.

and IMHO the readability is improved as it clearly contains the
init/release logic around the device object.

Thanks
Kevin
