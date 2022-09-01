Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 726E95A89F3
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 02:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B77910E176;
	Thu,  1 Sep 2022 00:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCA710E0D0;
 Thu,  1 Sep 2022 00:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661993217; x=1693529217;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9z3v1AyJXZogQKfomCKJhbXxWi5VQ0U4SQTw/p4UkZM=;
 b=d9Yp3guMsVnhn/pLOx3uoRpHve2QLW5jYosFbgAk7g1yuSdOuY8W9FWK
 359iGW1bxz2+hwFH1bzYpUpgqxtcUSZNFsCelqDSf0ch021VudN7AcVqm
 Yx3lTH1U1jRlxlKDrbyi0quOW4/evso1HJ1IEHPBDYaqn8ery1zYKvn4I
 lXY5zxhexVipc2jfUESDNh9zjnXfkvmnDQ2YE55eJUyfbCQvJkfutgNM7
 XCNh7uk9nitArH0nO46tt9bKGO/Wmoak5WW88lJOmm1S7eulug9TbCcUz
 3T0gHxLGg/fOP+zQCTGbWGyAQIPhfOxoSfRxW2hp8eAColZADVHoeG+cd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="296368615"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="296368615"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 17:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="645434052"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 31 Aug 2022 17:46:55 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 31 Aug 2022 17:46:55 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 31 Aug 2022 17:46:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 31 Aug 2022 17:46:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 31 Aug 2022 17:46:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iw1Muap6p1DYtKYfcSTA5VIqRJWid8iAx9ig7bTHggsB06wMvDcdM47rySWkUE36XS1dwZapyHjEb/PbVKDe4FEuIA9IOPIB2Z/sB7/9Ysmff3LAjpokbRglKTRkxria7wccxml9JCRNsLXkj7Nu9DDfl6/6NucBsVnZxh+dZl1wZrmzlHMndHgX6P5jJBUgwlw0zUALGKthdOrRLZjpxDCANoYuBd6H3sptkT96xD1FsBDmQb1ylVySQG5kGgwhXGMJbf4ht82EjcETjaIHIRSTeAmSmcYw9cLIzcgnH+9u52XWK9WMW5lftu3UdBTCEmuVS2tdDLdaM32I96UuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxKY323gFG9qW9iwi5YtqSVGBROZymgOkkOok+2l8lc=;
 b=jtA3fsNxcaQ8+efjgnUIK7gVjaWja4U/v0CCaRuH7bbXVVmnRfjEirxntgmXA7ZIi6h2ChAUyH6Nr/MCfHwE/ZdvMLsJpYLX2Wd0iYgPxPmB+LuyIfeizJw1OG4IyucfeGniJp2rz2gB1GGOYw9RPFrs8HHotxwDpJOSdEF4t5eFTnBNRsmNSpkXSWRtDZdKLQl+9FKu6mIMiV1tR34bNBCkPK1GbqyqQTagJVFDFtJWs7IRP+96d5hVhpUXDeqR69lDPKLncHuLUtxidoNgVdfExaXduvUJAZhOqrqMTMHR/Zjdo9k9nINhbSS1CBmZ0nFVqwaAco4ZI5wdtVcJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CH0PR11MB5234.namprd11.prod.outlook.com (2603:10b6:610:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 00:46:52 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%5]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 00:46:52 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH 15/15] vfio: Add struct device to vfio_device
Thread-Topic: [PATCH 15/15] vfio: Add struct device to vfio_device
Thread-Index: AQHYufqqXjqbWwGvv0ujITvL457lEa3ICPIAgAAacoCAAGT9wIAAvh4AgAB8a9A=
Date: Thu, 1 Sep 2022 00:46:51 +0000
Message-ID: <BN9PR11MB527652B0557897BDA08B5FE38C7B9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220827171037.30297-1-kevin.tian@intel.com>
 <20220827171037.30297-16-kevin.tian@intel.com>
 <20220830161838.4aa47045.alex.williamson@redhat.com>
 <Yw6i7btDKcUDPADP@ziepe.ca>
 <BN9PR11MB5276BF3B8D65B66DB292CAE58C789@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220831111512.4924e152.alex.williamson@redhat.com>
In-Reply-To: <20220831111512.4924e152.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc937e53-14c1-430c-d8e8-08da8bb375cf
x-ms-traffictypediagnostic: CH0PR11MB5234:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r0VDZcFEhwSNCvcTMsNYSpI3Hq19uuP4OW4BC5bj/5UeMif+YDtOar698WuNKlkvseNPB38CJpdSmc0trtgGbBo3nyNht/9zFyQfMJtYBnldenSJMz0n9Vhw/fWYAqaisoz/flxvjc4I/5IGhD+0HR2xKgGcEGKKU2vU8oUddtZ8/+V/JDMtIAOAPt6HC2/OGRx0P80nZJv1PD/muQ3rbEPJqdAUbQil96SF/vz3gkmsqjgZls//QqfklSuoPfb5delFIdKd5m5dLLcQhfKQDdOxub9TVrl7A5tnU6hDtFnyftVfXj3KlYHnj81SclYzgcr2ys6r/Dh0itXNvJQZabAJqynipilpXudnUiFpfAOld5lZxRVzzozJ8pfbdB1VPTxZmtqQZjR/UkwQCKy8MyOTqziDDWHSDcOMEno9HN8DEBwgAaE0l/cpPwQ/OEZF0kPLAvCcpcHlT83gXTeMVB1wmRUMCf3PYx1pvmA2rZjqkFfmnk0ZiuAra8Nppf4nejfZsi4KhvKb1XU6sVOzxAeVZm1uOLkNx8Pp9QVzgQi8vVhpVrrg09mRLcDTTDV8tgyL9zr0YfMucxsMVqMxUdCgb1B8mIY0gRDIsjXrPgXg8P7yaYwrqmEXnQZHTMN22fqeuyK0ferElb0M3PFy8vZGW9c507N2obhDHoVJO/6hmVhvXj00L6QvpnK+PW/wGxZ57TLTEN3FyZUZRVxob8Cd5D82MuZZziYbZjJuTetdER338eCHG4jBK4vYe3+MZr2GeEzDg76U3XS98wqcrw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(346002)(39860400002)(396003)(376002)(41300700001)(52536014)(5660300002)(316002)(33656002)(7416002)(8936002)(7406005)(64756008)(76116006)(66556008)(66476007)(86362001)(8676002)(4326008)(478600001)(66446008)(83380400001)(55016003)(2906002)(26005)(9686003)(186003)(38100700002)(38070700005)(82960400001)(66946007)(71200400001)(6506007)(7696005)(122000001)(6916009)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2tAN5jaXHGZRETiTGyZFXLF8adjGTYrHSMCzt464YZbC90hB1kMzasLdaYZI?=
 =?us-ascii?Q?2/LTfbbGqJMInhcf+HoqUELem3vP70VAgYwrOIYAnrFE4iKIqDIInqrMZs81?=
 =?us-ascii?Q?8Hlq3XEzTwONvAkdMP17Zf94ZqhETnpXp/+6I0BaWkUtHRskwE/GHAuvOM91?=
 =?us-ascii?Q?lDZrTW0leykKhX6OHM32e5ojLFxO0TbaFU1kkrJSjrQ6ROn1sSfCW050qXjy?=
 =?us-ascii?Q?bF6+Ap8HW3THwbIQZhdXJdcYUUM52z1u7I1yWklLzuyTnyPNKhnDhHFIeSbu?=
 =?us-ascii?Q?JQrwGChUyNJb3+GyjbWR4QglJTcK4zMeOlRT7BtPZT5r412x57sbGkqeEkpl?=
 =?us-ascii?Q?7nrEJyN6fQxFm7J9YwAobMOJ9/Ode1Ss5pi0+RqgNxAJRIAExnRk5ybNXNhw?=
 =?us-ascii?Q?MQrIf6EnwCDggrKgX0UvB8bkCuqPfVg4oGPQRPVPYCcfA+q3oAlpI2d7G4i7?=
 =?us-ascii?Q?89qhoidE9zydVfcvVJjnD0ni/5iIuUuyY8VmLT28AFqDWKE+f4FRN1ysq0HR?=
 =?us-ascii?Q?ONFk+H62bwl1+xpjjSjFQPcGIoKpw9/GSQXQ/DklKW2AcX2sPGpvyEGU7mGV?=
 =?us-ascii?Q?sQvHexv71fJv0kltkYEcnH1CzpQ2Ynv5ak5lX5WKEmuZWK6l0fodpXDU1ccm?=
 =?us-ascii?Q?+P5lvuef6g7omG3HTQPsdDtarrczjS6I/0mPyZbQopLPzbcRQctrcc20+uJz?=
 =?us-ascii?Q?XYORfY6QKHCDqgwXK/zfxzuNYlXgTpXhHC4FOKkNKHVm4f5FmGW7CwU62pTV?=
 =?us-ascii?Q?8tcnpTb9BdBx0OEVuEwTbBSx6RX9aIgyaxMMQbBTD4aGgRbfL5CCPZnBWEJb?=
 =?us-ascii?Q?rKlaS8J03b4g3O5LOIJutKmS4lPakM9AbHqPO7fTW+NULzKl8Plfs7BBVOgY?=
 =?us-ascii?Q?nKuretqKN2p0XOYESC1/jah+cydk0cVo24emZ7MuejEnBUb8AYqbVxqq7kza?=
 =?us-ascii?Q?8bgTYhEMkCgq+wuwQQcx4BH13aoWu7Kwdjba5Op6MHMmpgmio5HlfmTp3OSY?=
 =?us-ascii?Q?jIwdP6ZGLBrHYrY5NEEz6rGcIM4RZ39+wOHj4V4AFISL8e6YQlvS54q20qtl?=
 =?us-ascii?Q?GkMEMa7x7xPEhK2oJ4+UA33oT4Im0zwvGpJawjQcR3Et8Yy8lYkgoqIet/TW?=
 =?us-ascii?Q?ute7CnrJ3TChp+ksVh4BXXZce/wqBsdOPRk36Y06hOgT5WxAPGvEMpfd6FfA?=
 =?us-ascii?Q?hKRs1ilZZux50a1q1hd+uIvTdtP2PcYnuu1qjcnE5jWxJxNWUN05opkUCc7T?=
 =?us-ascii?Q?ZHYTT/jm6wlIKzKdCH0ufEgXcS+Dwp2SnxeYCzf4gEQIjKmoojBCtE/1apNz?=
 =?us-ascii?Q?uSA+9RGsR608fcPsJ4P652EHA/y2J+sBzom0xi2xaSFL/5U+Zw1oXoWnTxRi?=
 =?us-ascii?Q?Vo1C8nYFaZ43hPRrWDgNN/qXg5ESmgs9xA3VhFOHdOW5qc3UV2shg4HBMZnB?=
 =?us-ascii?Q?iZA19zoK9aCcHYNHZNniRGBN174awSjID+V5cxnfqN5NdFAzAnUl53M5BkUz?=
 =?us-ascii?Q?SiXw8Xiu9s/+6drrowBJ1+hIQUoCEHBH+JjSNNG3WJh9JI/+EN2WNYxQLEFU?=
 =?us-ascii?Q?HCvcqrD6BLiw40J0uGtwgVd54qnorZtAluS8NsIM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc937e53-14c1-430c-d8e8-08da8bb375cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 00:46:51.7840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qfhWhfJXCFsBQkcaA2EHAuV4bt0W4PA4uywKc7CLrCMdMpp+QPQNgduU15mRdn/Akd20Lhp1ZlEyTLBcIURLuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5234
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
 Jason Gunthorpe <jgg@ziepe.ca>,
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

> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Thursday, September 1, 2022 1:15 AM
>=20
> On Wed, 31 Aug 2022 06:10:51 +0000
> "Tian, Kevin" <kevin.tian@intel.com> wrote:
>=20
> > > From: Jason Gunthorpe <jgg@ziepe.ca>
> > > Sent: Wednesday, August 31, 2022 7:53 AM
> > >
> > > On Tue, Aug 30, 2022 at 04:18:38PM -0600, Alex Williamson wrote:
> > > > On Sun, 28 Aug 2022 01:10:37 +0800
> > > > Kevin Tian <kevin.tian@intel.com> wrote:
> > > >
> > > > > From: Yi Liu <yi.l.liu@intel.com>
> > > > >
> > > > > and replace kref. With it a 'vfio-dev/vfioX' node is created unde=
r the
> > > > > sysfs path of the parent, indicating the device is bound to a vfi=
o
> > > > > driver, e.g.:
> > > > >
> > > > > /sys/devices/pci0000\:6f/0000\:6f\:01.0/vfio-dev/vfio0
> > > > >
> > > > > It is also a preparatory step toward adding cdev for supporting f=
uture
> > > > > device-oriented uAPI.
> > > >
> > > > Shall we start Documentation/ABI/testing/vfio-dev now?  Thanks.
> > >
> > > I always thought that was something to use when adding new custom
> > > sysfs attributes?
> > >
> > > Here we are just creating a standard struct device with its standard
> > > sysfs?
> > >
> >
> > There is nothing special for vfio-dev/vfioX. But from pci device p.o.v
> > this does introduce a custom node in the directory, which is probably
> > what Alex referred to?
>=20
> Yup, but not just for pci, we're adding a node into the device
> directory for any device bound to vfio.
>=20
> > Anyway if required following can be introduced:
> >
> > diff --git a/Documentation/ABI/testing/sysfs-devices-vfio-dev
> b/Documentation/ABI/testing/sysfs-devices-vfio-dev
> > new file mode 100644
> > index 000000000000..dfe8baaf1ccb
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-devices-vfio-dev
> > @@ -0,0 +1,8 @@
> > +What:		 /sys/.../<device>/vfio-dev/vfioX/
> > +Date:		 September 2022
> > +Contact:	 Yi Liu <yi.l.liu@intel.com>
> > +Description:
> > +		 This directory is created when the device is bound to a
> > +		 vfio driver. The layout under this directory matches what
> > +		 exists for a standard 'struct device'. 'X' is a random
> > +		 number marking this device in vfio.
>=20
> It's not really random, it's a unique index.  Seems like a good
> starting point.
>=20
> >
> > At the start I thought it might make more sense to add it into an
> > existing vfio ABI file. But looks it doesn't exist.
> >
> > Curious why nobody asked for ABI doc for /dev/vfio/vfio, /sys/class/vfi=
o,
> etc...
>=20
> Oversight, there should probably be a sysfs-class-vfio file.  Thanks,
>=20

I can help add one.

btw I plan to respin v2 tomorrow. Regarding to this ABI thing there are
three options:

1) Just add sysfs-devices-vfio-dev in this series. Later merge to
   sysfs-class-vfio once the latter is introduced in a separate patch.

2) Do sysfs-class-vfio in this series, including both existing vfio ABIs an=
d
   the new vfio-dev.

3) No ABI file in this series. Handle it in a separate patch with
   sysfs-class-vfio.

Which one do  you prefer to?

Thanks
Kevin
