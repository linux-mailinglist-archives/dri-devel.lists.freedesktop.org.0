Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F1F6239E8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 03:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9592110E64E;
	Thu, 10 Nov 2022 02:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C785E10E64B;
 Thu, 10 Nov 2022 02:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668048305; x=1699584305;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CfFtFv9X9ate4Rx5Svz9M0whlUzJSXqNZj8oSZp/Yaw=;
 b=dmEYuKyOik0vdYYyHLLwRY0XqZjHfamiaolZEqufFHCKmiSSHwjSnMeo
 I0LokbGL5/gMawcECMw6tQAuKHd/XcNfy1Uadp99bWJGLH/EqPpp6jzRb
 aBF8E1XrwdR5GhzwFxDE02A4dXnvI8c66x1NbbSbfZ03G1mi65/FZHjal
 u4Okm3UDqT3GL5fEgvoCwNXhRT1BLaRm71xiZZC6lLziQ+dKxtSup045M
 nHPY5035na+Idd97WPCyoKk2gvaOHi0ZD4siiowkVTiaMzxRyX/PsAB7H
 rlPaYloyTnXGJQbQQIDZwmWlgIu3a8nHSEBKBee+qUy+H5bgqQNqjgxlv w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="298682403"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="298682403"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 18:45:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="705964423"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="705964423"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 09 Nov 2022 18:45:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 18:45:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 18:45:03 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 18:45:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Og1WXXXo3ONbb1kxKQLDSvkZJsoNMHb5aBPfZSqJPu7MyUbsDqi00OD6I1Jm+ERMYOH38rTwTlFGMq7v8aoGLFjld5Fs3ljClO3rl7zR7qassYvFC7EiFPkpupysaE7kQfOwe2SBFKcIvuiBf6yb+BZWmGSp5Iv+qtcbf3QFhNwZuyPYxIQXmpT/znuG4zCzeRzkdlQiB7XrRSjESQrFvnJdlaoHwlU7oKmdJ46rjenp+4PArfEYtY01Uch03xQEN7sLk6O4loIgnYVI4VtwKOPyHQT8VxnzPsS9VM/Zq5VI7Zto3ol6EijflfjfALvNERYVSO8VZuE1eT66oyyDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfFtFv9X9ate4Rx5Svz9M0whlUzJSXqNZj8oSZp/Yaw=;
 b=HGP/mPI80w5VdAcYrZrXPNNEoY95IkhxqHn721luqtPFaTdpCSJbQGclfM5l0lcYn4tKD9Ljo/c4XWd5wjJJxLTbrDt96FhrcYIQy5mkk77Ay9GpLDt1/xfTP8oN2P4ZY1iWPxOvR9vjVrXTZmZUOEqUHebdA8vAPEn8vd6ffZt49UDxoLDpGCmN6SR8qhx9pqb3KyeVG3/sCTADWbl1lwuFdVSDBNMc+MxcuUkojPYDLhB8lcBNS6ge7+vvsHVZODGozeRl2gUYwPcg+lXcabUrP4oAZeXDE1pIqvv6CAiev9he6WukSiRutIG5QX6l0f0qnhf/rAXqGtYZ+y0hiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by LV2PR11MB5997.namprd11.prod.outlook.com (2603:10b6:408:17f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 10 Nov
 2022 02:44:56 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 02:44:56 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Thread-Topic: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Thread-Index: AQHY6J4PZiG9ZpP/vUeWinRFl1HtUK4hMXwAgAL2sYCABPuGAIAKYkOAgAAhS4CAAAPaAIAAKpkAgAALaoCAAdgAAIAAJFOAgAAkXaCAAKZ8AIAA4THA
Date: Thu, 10 Nov 2022 02:44:56 +0000
Message-ID: <BN9PR11MB5276B97B20E5A7259AF2BE4E8C019@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <Y1wiCc33Jh5QY+1f@nvidia.com>
 <20221031164526.0712e456.alex.williamson@redhat.com>
 <Y2kF75zVD581UeR2@nvidia.com>
 <20221107081853.18727337.alex.williamson@redhat.com>
 <Y2klGAUEUwpjWHw6@nvidia.com>
 <20221107110508.7f02abf4.alex.williamson@redhat.com>
 <Y2lSZwNT8f/RMoZf@nvidia.com>
 <20221108155520.4429c2e5.alex.williamson@redhat.com>
 <Y2r80RgytKpPtK58@nvidia.com>
 <BN9PR11MB5276121DEB01705B9A25D1208C3E9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Y2um+i8+H4z4/qR9@nvidia.com>
In-Reply-To: <Y2um+i8+H4z4/qR9@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|LV2PR11MB5997:EE_
x-ms-office365-filtering-correlation-id: 9648f7b0-b809-432a-e9ed-08dac2c58d64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9+Kr1Iabezji1njVVXKj/e6vclfnKOOvfeLb0QDsE/V0dKza7RoR5w9WtT/aouXW08egjCoyG0fGYETBVvxISvRsmZnVB1VD3ggkzKqJFvdvoq/8r+XboZxj7s5Wq1PYHIq5tz8fzKjkKC9Xsde+I708AKrcZrwrSO+VLkHw3vKFMNnbOcx8g6YZiWy5P6kLM8HDZg3Znkxg9slLf3LQKdxglI7pMCzs+KvZB/Db7NjjPqxkGQnH/SkAnSV50/GxhyBMFKg7GyM6ps11aRQcEXe71hr6R1t9iHJlyuJsFexRwXYKsYygvhrlZiQiUquSJxfhpxPnCTA98+P8SVKNG/3mzwH1sXqJYbZR6LapmJhBclOTz/AwLRswT3BK/OYGZs0uXljztRY520QBNdcpg84y3+tM63VvSMe9rS3h4DD2TSC0DgqiCVGPEuIbbWAFln+ebH9IqWU7uYW2+GRwATG+ug3HqZvDhsebtahLl69BejUlHQT4td7W9+HE1scOCy6I7oeB3s2egyh61z3G9GhmEEq+6f+l81hL76Je71Fbf+nNmw87uU6DfqEMETJmE60IR7MoDxcxjXFE2DrtzUE/S2s3RdG8lHKEpHowOZHv3sdp1Ijn16UOeiMBhiRYv+/NKhdvHZuqx8xCaJJtblCjR1vWzk1iPGQ9ykOTtiJnYEGnnZEvoHpx6DcdwK0CfUKXtwH2aiUZQoK0MYFqUnROMV9lSzmzvpzXilprGodw/47Yy6AwPBKzNZVaD4qbZoolvsg49u7Cux60Vk1Lyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(396003)(136003)(39860400002)(346002)(451199015)(33656002)(86362001)(38070700005)(26005)(4744005)(7406005)(122000001)(7416002)(82960400001)(2906002)(83380400001)(5660300002)(66556008)(64756008)(76116006)(41300700001)(8676002)(6506007)(8936002)(66946007)(4326008)(52536014)(66476007)(7696005)(71200400001)(316002)(54906003)(55016003)(9686003)(186003)(6916009)(478600001)(66446008)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iOcMuFe3TCzTBNRAmGW/SGhaLgQq6bqzPJGgxgnCOm9Et9g9Ulb6TcKFn7Qs?=
 =?us-ascii?Q?EGYqu3EsN64UPfryUFvfTaeTwVetSy0foEpJqKZ9ScbUWnDvnMiXnkLLEWIX?=
 =?us-ascii?Q?htJgXKwXz5yChD5pYCL0CdbjN0QNgHyuNUxe+jl+Py2rBMZvvxpqkO+nzrPS?=
 =?us-ascii?Q?uiBE8QWHvZ6/5T6rInNOva07zVBw8cSiVTnWt+IJbD7PMVtL0NKabezJi48I?=
 =?us-ascii?Q?IQ1xKkIIPQCwwzOwJ0YwobQQbz1H1bV+9r8X+ts56WceVv993pCD4I6w0r5o?=
 =?us-ascii?Q?kA3EyEuQcj+fPjYWEXGKNoOClo6hkOgYwDk4Yl7S9ZwjCunzvPuiAd0753Gk?=
 =?us-ascii?Q?L8ePAOy6oW01umRYIPvE3zVai6z49MuuHhwsVwAVTg0McAK09EzbF0LTszcf?=
 =?us-ascii?Q?OSPfXxmR4Qq+ZWQ0wubBSnFTaiDrlO940fPJh8CbbjEFcPM4nSNa92kYZsqi?=
 =?us-ascii?Q?9Q0FHiKsoouN4m7RFRmwuAHgA8AIJxHQf3hSNyU3OT6u3APl82SgDOUtBGUo?=
 =?us-ascii?Q?BBqTfuRwbfUErJ6E1Qurs5LAcUQhoo24dIH4Kus5Q/sKHSIiJ2gd/8r4xL6j?=
 =?us-ascii?Q?6iCyYBFItrNqJT4xLmYlffT5OqDw89wuSqbyWZgw2OTbwRbxWISXG1ID5eoH?=
 =?us-ascii?Q?nLkjOHhyLGfzmxVAfLgeiVehaTweEKbIMh/FTVE5r7F3Bi9Q7erxtwhuoy/N?=
 =?us-ascii?Q?p9BhP2mo9NDE6Prws0dS9P0sYHKzOOZA0Y5CrzScbglGlceJGOE9JHAi1WsZ?=
 =?us-ascii?Q?WOLz0dLAt5UCHKGUYZOR0gGkSGbTRAyvys9I8Txv+ngjRvW+I7ckzj1Brkfn?=
 =?us-ascii?Q?yNJir50+ajGdMZ9i55V06Jp9CZAn0mZk7b5bceR63S4XwD6lSnW9i2UBcmxq?=
 =?us-ascii?Q?QgOfttUYyhOO3H1TrS2+Z8tmApxb0gOPkuXx/I8QWL6on72zSBSy+CsTqvly?=
 =?us-ascii?Q?TcpkWQFJ/5xKgysbNr/wNqHN71EADq9vdJ2h4fldacI3F9jM7ZC7vwribmFC?=
 =?us-ascii?Q?N1wOIWO/+4UNUsBCptj7HZFMd4gh7FvuGcnAfZkSsF+2Flz/j2tNHX18mmCk?=
 =?us-ascii?Q?VTNmqWFCEhIvXNpBSWhfrbb/KH5Mop+i5KzGibymKVMMN1z/PoZEqb6W+apK?=
 =?us-ascii?Q?EM6GZm/u4A8AKBIpm36FT69bOdvCfS14uXBpRnour7s7ZfgRqiU1D1TFvUHx?=
 =?us-ascii?Q?GK6a1+bxOz8toMFVDAq1cMz/Tkr1w0bEiP8Y9QNvWlkxMUb5NJJXV+HqyiCn?=
 =?us-ascii?Q?Whnz2MmaWoEuGPGz60oi4fThHtDy2/EdkvpbsLRJ2lOZK/YYCsPJMcfvtE6k?=
 =?us-ascii?Q?jDqSTc32TvYYMtXSgGVwqk5jTUTK34n736wg6ZA2gOKrdJLDEmkUYxvbJPME?=
 =?us-ascii?Q?AXp+nXWmf7ur9lUznlZkU5frLwE+5jCKrtpdU46HTtTABtiXYNgFRNoYyZJF?=
 =?us-ascii?Q?F6j1a939otlDqfDl2sjNRYHe04QZ0jgapE5RI2e9x1Jmsb2HvWpVk4h3+Oaz?=
 =?us-ascii?Q?ut7Klq8/Ljzc9ePrK9QLQvqFQXlhobv5VHMvhrCPMEXYToRbQ07Q0sMPYqBF?=
 =?us-ascii?Q?58T8bVuqmHcINaBf5ijelxXslzJQYWB0m5Bs41Kp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9648f7b0-b809-432a-e9ed-08dac2c58d64
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 02:44:56.2737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d9TqpHHt8ecpUsOaM4XMKdX7/EF7n9BdMU8y3xXwen4gY9jIlSuq2aWKcu7LQ8UY2J1F6YbEL/yoBYibjJb3mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5997
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Eric
 Auger <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Wednesday, November 9, 2022 9:11 PM
>=20
> > If all agree that VFIO_CONTAINER=3Dn is a process to evolve, does it ma=
ke
> > more sense to remove this patch from this series i.e. let it buried in
> > VFIO_CONTAINER=3Dy for now? Then resolve it in a follow up patch if
> > no consensus can be made quickly at this point.
>=20
> This is worse, it would make iommufd completely unusable in situations
> where we need allow_unsafe_interrupts. If we belive that is important
> we should keep this patch so existing systems on kernels with
> VFIO_CONTAINER=3Dy continue to work after libvirt/qemu are upgraded to
> iommufd.
>=20

You are right. I kept a wrong thought that v2 has moved the option into
vfio_main which is what I commented to hold before consensus was made.

btw is it a good tradeoff by making vfio-compat as a module to carry this
option? anyway it's not necessarily to be in iommufd core when VFIO=3Dn.
