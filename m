Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7795A764B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 08:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E8D10E1DE;
	Wed, 31 Aug 2022 06:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E5E10E1DC;
 Wed, 31 Aug 2022 06:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661926256; x=1693462256;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pkqc8/mTfO9ZiZWwI5u1CPZCNDoK9Lhxq3T5l6T09aQ=;
 b=mcnK47ZWXV0FkuK2UeyyrFVSf33hkdJYz/6x3DGO85/FoQoSNcsikXkZ
 avP6VDpC1NHDOqFZZluHoSspRk8ZmHlU1cF8Es+bbMllPfX+tO1huGgwS
 Nb0HlcfYCJbrtpga6BZRdYF4Q+JjjpetrvoZ8T6Advu9Yn5bxflYHYsZl
 Vty5vmJHDpkqWcj8n8aRRssHe2j2CzxwqrQLAL4XV+PYm6Tf8Twa2wyoI
 Cq5aQV2uvRGQIPlB1MUyNhjo4PZcXLT27AB5nPC8YdwUNQydEK+5/TrO1
 heAhn3CpiE4OVuBTLHEWaCoJPc/Mtn1ZAQvDt6rU+wlQLP0KbJZtbta0K Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="296659875"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="296659875"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 23:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="588920413"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 30 Aug 2022 23:10:55 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 23:10:54 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 23:10:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 30 Aug 2022 23:10:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 30 Aug 2022 23:10:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZB7cErs+ylMYEehxpIcW7PFXjayAWfE5Xl0H0PKm2MrqBvHbpApl4CrSogShoO6sCiE+S7dY/V5jQbDt7qdpoYB24rRNATk2jdxjDg0MP+6FZ3sZT098ARAnRt0nElb1ust48yy7fw0zNNRhLuIWyqCaD4GTHct3qjHVBZmaQC5N7675XDlVpuUrny5nOR9t3gsrxSvw2skdTjj3mqVWUuRSiO1VkvufdhmAbjYmC9oyLj5RbJ238DQb6OGXEk2YnyrcsZvA2l7hZ/dr1NA/tmUNKTluDUbdEP7i/edtypI+XG6r3Q51Fex0nmxl051q6NHTv4tXWi/0BT7KD2RkBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIrqZaChcAxyEpEUlCYfEGoCiTXu+1VW5ZiGMS2v0k4=;
 b=f8TEbV7bEXsA0FDlaYcKfqO4tRwkHRgS/nlnzNU+uCshurofuKuarjxXb2j++4BKN7chkgRI6y0A6QIqUuNBySdUI9pdU8e6l6wz7zEfAlQWuc8BpiZ/ZQDHi7RUGvuddY8bROIX1MZhqqXw95k4y3U0OE/gYChMgaHRwByavP7lg7W03gd1P4qMrmWLqfEk2hj3fJmQVNqPcI/6HjBIEs47OSOYA9Otz6anmeIDEfsT4ZKoJYn+/PFtoRDmlHlxtHYnAFPqciJf1UypE9psOot6roWNzVyvY8E+dJnlU2GsxRu/Nu3s3d0lm8uJBsJnk7S3Z6XhE6g6GOaRXIvPgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN2PR11MB3725.namprd11.prod.outlook.com (2603:10b6:208:f9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 06:10:51 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%5]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 06:10:51 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Alex Williamson
 <alex.williamson@redhat.com>
Subject: RE: [PATCH 15/15] vfio: Add struct device to vfio_device
Thread-Topic: [PATCH 15/15] vfio: Add struct device to vfio_device
Thread-Index: AQHYufqqXjqbWwGvv0ujITvL457lEa3ICPIAgAAacoCAAGT9wA==
Date: Wed, 31 Aug 2022 06:10:51 +0000
Message-ID: <BN9PR11MB5276BF3B8D65B66DB292CAE58C789@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-16-kevin.tian@intel.com>
 <20220830161838.4aa47045.alex.williamson@redhat.com>
 <Yw6i7btDKcUDPADP@ziepe.ca>
In-Reply-To: <Yw6i7btDKcUDPADP@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 296258f3-5005-490d-7e3e-08da8b178e1f
x-ms-traffictypediagnostic: MN2PR11MB3725:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 20y6SP2dnZ/oM85Bf4P+zwX1EuS37oPAR2M8OoXcoh8LS6icERi3OoDlFeu2ZRuqZA7OJuA8MP/R2gONJCpDLWYuSTBZXWuOASaXaPqCTwapZal37h/MEwPplIxaOiKrcZg/dM2fYcC8xgPhh8/81tHWhk1z3d1Xu5tbB+S62BaAkrE2K6LoBLzQ0ENYNhs2rE5891OgVoskQ0QEHWvcFjf54WWDreXrOMwE+uVGUJtn27G+rTet2prcbaEsw6PanHEMJlPMHekUWYUQQ90pcI9xoQobByKQLyX97zylBq54v7NkdTILoYY5aT9aqQeozM8tUfSI0qraivtjlA9e86GgiB58mZYi1j1AsXQS7tqjAzERShpDqScDFAo8cLDel2/APSnJm9AS+/B90ohIs5+of9Yqnk+TvU2YN9oHAAAq5ioJq9G1harVe8invWx7IZcwnzob1MCH/2nCk8PoXeH1lZm3NhruqAx0QgmnY+zunPljjZq3/uqaU4rwU004q3qYpf2Nfh+nrX9dsy5Csky+vptfdhmq8YZGLqWSBSHU/KMazyMi1S/WIyIIj5ozwUDiPEPJhVddntPJ5pvPHV2bL4izm+PvZ/Z/C7krdYjZ+knjk6SRkRGEneGCQKpS4dwtP2TbOWm6pwJQB78vEYpBVDT+VPqA2DERDZnlYNrlfPd84roqjTmZZxdYEgh8qmaosCbviPCv8Lkua4Ygm5zN6SKx/cnoeZPfI1i2CdEZRllerClwSU3szy48pbEbnpcmOWqxssCImuBnWE8sNA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(396003)(136003)(346002)(366004)(39860400002)(186003)(316002)(54906003)(66946007)(71200400001)(66556008)(4326008)(66476007)(8676002)(110136005)(64756008)(76116006)(66446008)(86362001)(478600001)(5660300002)(52536014)(7416002)(82960400001)(38070700005)(8936002)(41300700001)(7406005)(7696005)(122000001)(26005)(38100700002)(2906002)(6506007)(33656002)(55016003)(83380400001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WXAVl2Y9AA38oxSE3yrBgHGjA1hMPl0yHi6Jn+l7IX7wpRR70jE5Izlypvc5?=
 =?us-ascii?Q?ucuFy9RfWBKwx9aQ1nZgHLyE7H+8iqtuoTNs+N4DsNzU/idcA0I6JUfdqdiY?=
 =?us-ascii?Q?GNlv4iwVBnAs4EZzlgy9qOT6fGeysS9BwU/7yE86qM2KTVvLY6YsM4VQjLhv?=
 =?us-ascii?Q?UN5aXiqe1Awfnwh1meoaDMVt81HFUEvELiIoqoT5LLhIUGDA+fz9fOM6Lx5j?=
 =?us-ascii?Q?en7YkHG/dx4SU1posDmKSisfQdlZ7Y0pT1wmRXtpDQ27560yxvis1bJUl+4s?=
 =?us-ascii?Q?mi1SuwZ5Mh82GzRdqnYhMvt45YGTrgtmxumiGR0MwOYEBfFHRaP4OGD/3zbe?=
 =?us-ascii?Q?UMZ5kpMEbmIeo9Ub4WmOH+9dgOOwwiD5uqMtNG5sBX032rsJfLccBZEuQL2c?=
 =?us-ascii?Q?8jj+9HMt3G52iWl9BX5XDLoo7/Covt7SUNHjrXyQAisG+YDnO6XSq/0zu/gv?=
 =?us-ascii?Q?5iyKef1PyFQvcc9LbDFsg98DA/Y37eX9l6pR6SiSsuOY/z3n5EJZhUCud3pa?=
 =?us-ascii?Q?M+WrLjGGGjFx+jIAeDGbmdQroPg4Ag1HK8mfSuSfiHneg3dhi9q48aYk+VX7?=
 =?us-ascii?Q?e9JOVQ1HtJmNytQV6m+GitTSKdJSUiJNFSowxAHc5bEzTh79wkE9BSUNAJpr?=
 =?us-ascii?Q?gq9oCe8NCywIrktjsg6xnQcJeXa3LZzRgUvfrICH4bu+xPtIpCWqiRcmZjCQ?=
 =?us-ascii?Q?yp2LeTniraEC0auqcvAG274ipyeZc+NY4gw69M2x1WF2ghCp7SS0LVoAHIDD?=
 =?us-ascii?Q?f/X8dBrktxnSnDEd+NRNgEL3b5TM8JEMt05zmvh7yMXXamILNP2xXuDApuj2?=
 =?us-ascii?Q?g1zGTvWfY1omTLIWAkwKXKqq05m3jVHvjstCNFJEjGlfDiPZ8zhhTzPLsu0k?=
 =?us-ascii?Q?GRSrjEBWcXShhI4Ww8l6J4Ag2JR0SzxyIUjq1QJ7/Itd8ESrBFa4ub0er04E?=
 =?us-ascii?Q?a5Nf6wCWmTbJmLpHPmoMBcg6ThIiKborpZLZn+Ms/UivofbfSlxIxZ93kOT/?=
 =?us-ascii?Q?KS+OiMakgqw+04UCzL2Y5gysOzv1295diKH7/ZnL20zEEc4M36Kdql7JhpG4?=
 =?us-ascii?Q?h9Y45K1zoY3um6ilcuzaiiIRH9HNCMClrLJB1OeNfTqaOKeENKWEH4Ftv9/U?=
 =?us-ascii?Q?+dlwyAztY+hQr5O25dBXPTcjdTdXj69AI1POkXa4JrksZ1fEVt4KjexBLe+h?=
 =?us-ascii?Q?KTKAtpYMlKY9DNTjjzeD/59EdmngzGmWNwmdbUg9cQxB79dLxLqmPjF1QKZO?=
 =?us-ascii?Q?HiA2/wp/BK9lbOekmUPWMExmvd3eh7k1Ms7ZEu0aKDz9eF0ksGxuIy2RBZlW?=
 =?us-ascii?Q?TlOUwsNCrPHzuCAObzs3B18zp39/BcKuniHPvuks9JCrjo+vb4X5PAHTdICM?=
 =?us-ascii?Q?Tr5/bin4jAQVEn+DHO8CaxTOW2TGuShUq90bgwCZ7+3kjjSkppz1cIYVm2BG?=
 =?us-ascii?Q?agk/wIU7qJkzFaLDDSwoiictQNK2MlvaVSVg8hOserIH8AfNM7HgPKAZL5sR?=
 =?us-ascii?Q?Tb2gFLf94cOK1d/tb/19NSpbxEvc5SiMF5TDtE9KamsjHdHNouCjPMSje0Oj?=
 =?us-ascii?Q?maWTtXf+PumyoDa+UliQvoN1KHKJ5xQHVEwziHM8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 296258f3-5005-490d-7e3e-08da8b178e1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 06:10:51.1127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u8BURVAaephkP4WRMyzRlWqcREvTqjTiXd/Xb4WRPWB4GGNd0ntaJkT0FYSSA2R6QmnDPA7iQpXpVWbMKFAz/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3725
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Leon Romanovsky <leon@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Wednesday, August 31, 2022 7:53 AM
>=20
> On Tue, Aug 30, 2022 at 04:18:38PM -0600, Alex Williamson wrote:
> > On Sun, 28 Aug 2022 01:10:37 +0800
> > Kevin Tian <kevin.tian@intel.com> wrote:
> >
> > > From: Yi Liu <yi.l.liu@intel.com>
> > >
> > > and replace kref. With it a 'vfio-dev/vfioX' node is created under th=
e
> > > sysfs path of the parent, indicating the device is bound to a vfio
> > > driver, e.g.:
> > >
> > > /sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0
> > >
> > > It is also a preparatory step toward adding cdev for supporting futur=
e
> > > device-oriented uAPI.
> >
> > Shall we start Documentation/ABI/testing/vfio-dev now?  Thanks.
>=20
> I always thought that was something to use when adding new custom
> sysfs attributes?
>=20
> Here we are just creating a standard struct device with its standard
> sysfs?
>=20

There is nothing special for vfio-dev/vfioX. But from pci device p.o.v
this does introduce a custom node in the directory, which is probably
what Alex referred to?

Anyway if required following can be introduced:

diff --git a/Documentation/ABI/testing/sysfs-devices-vfio-dev b/Documentati=
on/ABI/testing/sysfs-devices-vfio-dev
new file mode 100644
index 000000000000..dfe8baaf1ccb
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-vfio-dev
@@ -0,0 +1,8 @@
+What:		 /sys/.../<device>/vfio-dev/vfioX/
+Date:		 September 2022
+Contact:	 Yi Liu <yi.l.liu@intel.com>
+Description:
+		 This directory is created when the device is bound to a
+		 vfio driver. The layout under this directory matches what
+		 exists for a standard 'struct device'. 'X' is a random
+		 number marking this device in vfio.

At the start I thought it might make more sense to add it into an
existing vfio ABI file. But looks it doesn't exist.

Curious why nobody asked for ABI doc for /dev/vfio/vfio, /sys/class/vfio, e=
tc...

Thanks
Kevin
