Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15B7622284
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 04:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE2010E56C;
	Wed,  9 Nov 2022 03:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFEE10E568;
 Wed,  9 Nov 2022 03:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667964095; x=1699500095;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cvsguflE5ft10Y3WwAyy7DV0rhtxP4xSNLA3qrxHy4s=;
 b=irofgHBwnltS6S0u+11x7r4uNtftiLlHj2Ek1/UekwjiTz0JzY2cB3o3
 A3S8M83vqGb5y8/v4ShCau3HZJ9rb8heokRzcE/241fQ6XIwierE8U+8D
 jJrb/kI69Ygwn1AD2Zxssae2OEsxxnPfEcuIV28eUZ5FESLMt6eKcDha2
 o7iI2V4sLBR5Cxu1ULaQhd1Ft8CsMU2U6/nuGwDuUIUnJHsAILnamZetX
 TG6EEaPMWYdj5OUNKOqtTX70inA1r5HfjveWeyyEc5UgYB5gEZiyVRGAA
 n0d0mE4Ie8eoGiztTJNXyh+1qEI3FbctW/LVShkKQDr2d4oDcGCcN2o2q Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="373020304"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; d="scan'208";a="373020304"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 19:21:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="965831717"
X-IronPort-AV: E=Sophos;i="5.96,149,1665471600"; d="scan'208";a="965831717"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 08 Nov 2022 19:21:34 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 19:21:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 19:21:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 8 Nov 2022 19:21:33 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 8 Nov 2022 19:21:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qu/xxCi/Q2qJR61D8RboNffkAiQDI/l0XoHn8H214kEdI+LRbgh+3c+eZFVVumARmrLqiPVXUj7O0/tPen2dzFSTMOMiAkCx/mjmoedjPdlqohGTejl7ggqu5Q5zuqcdHnkL2K2yT2Anmhd9Dpt7ytQ1EAGCmSvl51VNEX/5d+7uUXhrSHSlf2jZKODlm040NHZKZtwD2AKmiTrdbYk5FhXtsGrXSUB+3rCZew9gkCPEAZ1VXcetYSPQzJjsacTiIhBJM48xBOfWmYkZfr2pNr8CcynjCiE2PBw1TxKSDyDjU7/bbFJTvJjUAzaraLcstfoPhvZ+NqigaWXkKkpW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ga01TfMQUmyAcLwTbcbYtsK/nPV8B7zjIRUJAM3Jh4=;
 b=GmcXpiavJ9yyOMbUeiM06oJ2CUvVZzU3oG1zZhp8htitsHx9DnKBoMBU9Ha05JdH+H8IvVUpQdZbUz4PABCT0993BffXkon+JiNiLddBGz0nDWTj4elejPxZrvX/hid8HUHrLFyruhRWx6H2QaL76Np22ZPw2ZMQxQus6/uSEY5Ew4J9278QiRn+AFNiBtAl7EoVByyGoCuPlqaDqaMAkyEOBArBnutP+D73U2fX/gCglwwvacjOjWifGFtuGxYtf+wbjdOUOZs5kBFEGb+nNsNgyrq76D3Foa6gIDmM41x3dDtFGFqLraKn29YFdbsLjBpbVewvTeney7z26RWyqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM4PR11MB6455.namprd11.prod.outlook.com (2603:10b6:8:ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 03:21:30 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%4]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 03:21:29 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>
Subject: RE: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Thread-Topic: [PATCH 04/10] vfio: Move storage of allow_unsafe_interrupts to
 vfio_main.c
Thread-Index: AQHY6J4PZiG9ZpP/vUeWinRFl1HtUK4hMXwAgAL2sYCABPuGAIAKYkOAgAAhS4CAAAPaAIAAKpkAgAALaoCAAdgAAIAAJFOAgAAkXaA=
Date: Wed, 9 Nov 2022 03:21:29 +0000
Message-ID: <BN9PR11MB5276121DEB01705B9A25D1208C3E9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <4-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <20221026152442.4855c5de.alex.williamson@redhat.com>
 <Y1wiCc33Jh5QY+1f@nvidia.com>
 <20221031164526.0712e456.alex.williamson@redhat.com>
 <Y2kF75zVD581UeR2@nvidia.com>
 <20221107081853.18727337.alex.williamson@redhat.com>
 <Y2klGAUEUwpjWHw6@nvidia.com>
 <20221107110508.7f02abf4.alex.williamson@redhat.com>
 <Y2lSZwNT8f/RMoZf@nvidia.com>
 <20221108155520.4429c2e5.alex.williamson@redhat.com>
 <Y2r80RgytKpPtK58@nvidia.com>
In-Reply-To: <Y2r80RgytKpPtK58@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM4PR11MB6455:EE_
x-ms-office365-filtering-correlation-id: c3d207d7-6fe5-446e-6e73-08dac2017e6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nvmNezP1btL034WZ8G+lEzd8ndz48X0tJUQcRGByL9Qpj/EcEohj1dmUcSAgmrVw9ZBhtlIPCM4uDQACOu1vfqtduDALGtrA/eQVD6h6Ca/oMeqa2wF9sn46d4+G68YZcmrMHjfBRUA/Fj3A5Q4XObA7oj2Kc5gTQkk6vjHPDAqy3NxLfRBjgEocvknj3UseFRHsQHa8xfL0t0xEmspnNGtjV7QxtwXzbwPUNjmi3aK7cI5x5sh2h6daFfJUj4SS6q4gLsz/5PZCFuBv8hyHB1zugTh31PYUr2zFomkb4PWpiHGv/JUk0ALY0N9N+WwOZ4fqSX7X8n8I7N5CAK0HTSS004n4N066OckMvt8S849GgAPoRfaZn1MseuQi9w8qgyAyRRMlOu7d9dKWc11IbQ3fFxZtUPHaDdAbVC8fF/cR6MByr6X7t5oJb4vLpJgkoBcFToYltaT8Y5JW2hS225bADGyTSD3uDyUFnJl6Gv2bFiK7Gq4j0fSWSDhZxFfG+N9CzlY4adv3w+uOGOHnS4mB1AnMLXTWDziyn0OykCG6UgehZ0k/8d5nt1aI7Skx/2xDFGhcELsgvU5iVUJS5tqO+M6ktP4htWrfPZLf7m518pboTuno/x9JPFpm5e7ugyzxH37/o6oBHYEG25BfI5LJ5daQTRmleMapPmuXH0Rq99i608QBiz184iZAn2QuGilJ+RwXxUHzU1KWcNKcl/HmrX97KGyn4ORfUwGI/qzxwC3uSav1cif4tqEHYHRbHu81M7kfth8S+X21my+ziw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199015)(9686003)(26005)(186003)(478600001)(71200400001)(2906002)(6506007)(38070700005)(86362001)(82960400001)(38100700002)(55016003)(33656002)(122000001)(83380400001)(7696005)(52536014)(66556008)(64756008)(8676002)(66946007)(66446008)(8936002)(4326008)(66476007)(76116006)(110136005)(54906003)(41300700001)(316002)(7406005)(7416002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4y5DL/JAYQ86p99rRwPK7HFk6oMdNPzySDSsglkW2yIcYkWeOg4/OjsOx7ei?=
 =?us-ascii?Q?sVJO1K8iqss85x7Lwf/LsLXGqjyp41f0xFWDKzlMoEGUAfDO9t/Wx29fgKu+?=
 =?us-ascii?Q?ss8D3WJJ6jbXqBJVOOhCXYkD7a8G+2UdedCwmQ6uKuAf8TxH3Ol/VVXJVTWL?=
 =?us-ascii?Q?WGNhbzgcAWXXzj2qCLmfpJ9B3cepVA7SDXTe3d//jwHxDytvcTniFs9grMcs?=
 =?us-ascii?Q?qQoCII/nCM9oWxWhswDgOPxJbubpMlKjhQ9KtXFFVoLbUXJ203j79mxffVNB?=
 =?us-ascii?Q?LIKJm/fxh7Q+pQalHaUhOrxOoC3RmVUBgyZ/lJD6PXutI26EeEXyylitqzNu?=
 =?us-ascii?Q?2HALFHcE6t/wJe1NI6ERznuso072A4464LVfyfnhSj0tEzuk6jTnwIvQRG9U?=
 =?us-ascii?Q?bjJ7+lElC0Qd05H+loilfqq//+om1/qXMvARjlEW0CIgmTkLibBIdJKHDlOx?=
 =?us-ascii?Q?12Vpjt6Uthfw7Qx4Kjq0PNQv+WMKilTmZ2g07SsY4ZAlw8ss8sPlz8rx3WjS?=
 =?us-ascii?Q?ekD8gZCafaf0E6Oua3RTi92CusFGXwbtMiRFgzRMroHwNy2eOSml8c5wBf9v?=
 =?us-ascii?Q?h6M/YUbXohDQUBFsA0306PjlZ32DO4iESlRraWNQN48f2O2vj+S8DbkqQXwG?=
 =?us-ascii?Q?Z63RfaQey6Axhrwo/1UlQj/VcPx5vplzneZUxrkaA4dHg2jcj9EqkmeK2Izj?=
 =?us-ascii?Q?Kw8pgxTxalHrr4BlESGWqzuPU61rQ41Usv7utgkQk4MHKLH14BKwoT5dZ1hV?=
 =?us-ascii?Q?cmRoHcsEcyCA4Z4N2IwH4D9WaafZ1pqnmM5x77atqIznf463EEqZe1wssA4b?=
 =?us-ascii?Q?iBWZlECqV5iV87/o1tYSxU002HnyS8KLdIQN4wk4BBm+LFXxk9IUwd/nLiJ2?=
 =?us-ascii?Q?L4POLFapH0MPhT+JB6Dbz6yK2LaSWSXGyjAPS9h8vdXVQktkcrAVsYXlPe5y?=
 =?us-ascii?Q?ZLalWvS0ZW+ZX9K9ul4bGYZSvjWDx4Ns1RPxteZ+3fIULLj6LeRSWsUfGUvz?=
 =?us-ascii?Q?Rt1G45EzaGsBNctNAI1nPS33ylz/kk9whUyZHPj4SHG4X0WF/E210WRLYOzz?=
 =?us-ascii?Q?1dN4DwD9BIlZNXXFrwU28atDJAzyaSi6floUhLVBop5uVMG0cJDC6XKl5znG?=
 =?us-ascii?Q?YOrC4CDlJS/hvP7yFvYSwrN1e/5qpHkUOw/0Vkc87tZzm18HA301q1PYHHND?=
 =?us-ascii?Q?wBpl7o3aa3++PXVjMWyIGuj4mjZEab+aONhVdlYsMjpEvCaHS8k1CoHVR1hP?=
 =?us-ascii?Q?AoXr1yT9vxQuyL3kOWiKhMU/p0rBpvVdXyku6KlAfOB+l4Opvq4AcWJ7QKQl?=
 =?us-ascii?Q?sRw79EAOc2OL+Og33AqHo5QVBL22U7Jdv20tXfaezegBZICGGnkUfxhglQB8?=
 =?us-ascii?Q?SM+cEa+GA31jbedUUXmeQ4t02EjZM5fwzPRtjwjpyyJ/LzdRseWeGopP9eXA?=
 =?us-ascii?Q?r0pNwpDJsfZmdi268G2FewT1IPgnXPc7hKFxF4dxkxIRwsSvx9U9JXmc6SNe?=
 =?us-ascii?Q?TXFOFQWEuktM/DR5br+w70mTHlvkDJAaesDyIV2Y92ZzFGLLuQ8xdrNcB+MI?=
 =?us-ascii?Q?yV87huigpT/5a2mzpZ+N4oFgRlLCA9fRGorMa7pk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d207d7-6fe5-446e-6e73-08dac2017e6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 03:21:29.8035 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qL6njKD07z8am6oK7UkeSHp95s23WGUqPmxafH44ogOFo/xjl4/maHkFvvnJAvYAeDtyMLfuRTPGxOKsOUX/hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6455
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Vineeth
 Vijayan <vneethv@linux.ibm.com>, Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Eric
 Auger <eric.auger@redhat.com>, Harald Freudenberger <freude@linux.ibm.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
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
> Sent: Wednesday, November 9, 2022 9:05 AM
>=20
> On Tue, Nov 08, 2022 at 03:55:20PM -0700, Alex Williamson wrote:
>=20
> > > > So why exactly isn't this an issue for VDPA?  Are we just burying o=
ur
> > > > head in the sand that such platforms exists and can still be useful
> > > > given the appropriate risk vs reward trade-off?
> > >
> > > Simply that nobody has asked for it, and might never ask for it. This
> > > is all support for old platforms, and there just doesn't seem to be a
> > > "real" use case for very new (and actually rare) NIC hardware stuck
> > > into ancient platforms with this security problem.
> >
> > vIOMMU support for interrupt remapping is relatively new, the nesting
> > case is important as well.
>=20
> This is where we got hit. In the end we fixed the qemu..

but the point is that old qemu could have a much longer lifespan than
old platforms then when running newer kernel which supports vdpa
on old qemu the same tradeoff consideration is then not vfio specific...

> > It's certainly not acceptable in the latest proposal, iommufd consumes
> > an option set by another module and when that module goes away, so
> does
> > any claim of compatibility.  The code becomes dead and the feature not
> > present.  The option doesn't belong on the vfio module.  Do we need a
> > vfio-iommufd module to host it?  Thanks,
>=20
> I don't know, as I said in the other email, these little things need
> work and discussion to resolve. We need to recheck the security stuff
> against the 2022 kernel where things have changed. We don't need to do
> it all right now.
>=20
> People who want allow_unsafe_interrupts to work will simply not set
> VFIO_CONTAINER=3Dn at this time. Same with P2P, vfio-no-iommu and any
> other gaps we haven't discovered.
>=20

If all agree that VFIO_CONTAINER=3Dn is a process to evolve, does it make
more sense to remove this patch from this series i.e. let it buried in
VFIO_CONTAINER=3Dy for now? Then resolve it in a follow up patch if
no consensus can be made quickly at this point.
