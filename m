Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF413502089
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 04:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B1010E2CB;
	Fri, 15 Apr 2022 02:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF6A10E1D5;
 Fri, 15 Apr 2022 02:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649989933; x=1681525933;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ztm2X6lXqHlRfeTmLJypS+M6IXCx6nk4rNHkM8CWr4M=;
 b=JAGpyMlg/PtOE1uxp9EfnRdHrG874GgRdaqhqj2PJ4HJkmRwufOVxTvv
 svPElzk2kdwPQ4NHdHOJJQn/wFWVI5RmnZFU3/hKyAYN6ZJsP5NU5EbO6
 Dvz9IE38PmQre6fHctq2fecgLcI0y0Ro/lhx/xL6kjiz3cZ3D5vPN1TDF
 FXcDQVkxWrXoiCRjw2Hb/xQcKlM8zb3Hah0/a/oFRpNNTkO/4fkAXHkGN
 f5bcxO7/vyKjiWUeIUFPa7UVEayybxpRy3z13hRQwC2yzLkDxdDvXdk0n
 +hl5W3r8aV6ZlOtd7eLGpg7TW8ZkA/bgnVFM8iEH8lADV/g0vlCSInvpe A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="323522005"
X-IronPort-AV: E=Sophos;i="5.90,261,1643702400"; d="scan'208";a="323522005"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 19:32:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,261,1643702400"; d="scan'208";a="645850720"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2022 19:32:11 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 14 Apr 2022 19:32:11 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 14 Apr 2022 19:32:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 14 Apr 2022 19:32:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 14 Apr 2022 19:32:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1c8frIe9MwOj8YaKqRg0qtPX1i+4WZX0r1jCDqXPxU5AaGq7b63tGZtCAlQKYS3uEAhrdK7Z6npTQpHjPXWKuUZ15sKGutdx5nCxJZF8shJITnltpVsVf5NhtvsTUI3ADn9/+0j90L/j34nHZNkIfZ9ruzsm3hMTaUxL7KRoTvoxbuqAkrxJgUN1n+t11zIKWL2oojxcTmozBtcfsUbDU8inSxgOROPbSaafVMaK2SgV6h+DD6EC1OdJhYP6njoI8hvE5VHwHvisuNyOIhbdyWuYIr8nY/sHJn4//yvujp65yktyJsxYeKldMd6fZVVPVcAeu4qHvA34sTnorI4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERYwitSJXcpFQLJ3H9rCGhzB8sQZcHn0QH9fJ8z7C+A=;
 b=C1Dw/QYNsbQWd+6HW1IcHDBE7wAeZqkNE9H0h4KmycCq7PwgtTN3RdNn6LOADmoqfO9sASGbnAD5CkBzFiXa1uhr4vf33yvrRoUKNxqC2Woz/OnIpXNJehkRYGiAFGxq/XeePmDj4QXIpRKW+Gw/9IpxFMwGQ6StSZygrmYboxfnUyubATQsdMI7RQ+jKWwDkuVAaqCZVzvk6nHEbxrP00i56dJEG6AelgogUq+gR9xHze5h/TBv264UjkC9OAqpAtbj87a38oIFTH7/2/xrI8IyuQ+bxosie8oMnTkStK/JrQi8iQpMPFDm5BGT2JGc9qjixdvEo5wb+39tqfP+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM6PR11MB4219.namprd11.prod.outlook.com (2603:10b6:5:14e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 15 Apr
 2022 02:32:09 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c4ea:a404:b70b:e54e%8]) with mapi id 15.20.5164.018; Fri, 15 Apr 2022
 02:32:09 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: RE: [PATCH 9/9] vfio: Remove calls to vfio_group_add_container_user()
Thread-Topic: [PATCH 9/9] vfio: Remove calls to vfio_group_add_container_user()
Thread-Index: AQHYToWALOjmn4an1kSZ0RkA8dFDlKzvcIiAgAAIewCAAMWwEA==
Date: Fri, 15 Apr 2022 02:32:08 +0000
Message-ID: <BN9PR11MB527672B82DCFAD2C9B28E8CC8CEE9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <9-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <d6e2778a-01e4-6468-2c2b-3b718d924e65@linux.ibm.com>
 <20220414142210.GE2120790@nvidia.com>
In-Reply-To: <20220414142210.GE2120790@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed736cd2-c4bd-4768-ac14-08da1e8823bc
x-ms-traffictypediagnostic: DM6PR11MB4219:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB42197AC158578827CD3DED928CEE9@DM6PR11MB4219.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IuE8jSX1mgerRRp3Od08bkYAfr79qtoiHIpFeiPTPykSKxd4SQ8JHbU9h+IYntq5DbbI59qFwAFIUKEey4n1govNvDbUiH2MrvDIsGr0SqojIPkNAzfXj6V4aIVth0SpxsQza5VQOI3qW+zIgjKVU8vkrFC/bqcQ9n3boZ3mMq1qxlGMddoKhhOCPEJnyzcp5ic20TJ6rCpsrWZHPlUMU9kKdnpZfcndeHJGq9fQyD2SRWh5MVfCQIXQhU9zaj9uk8XLx4hBkSfcSTKCYssc5yt12Ljbg25lR9+lzZ5mMd1naqzFgOQk/wkPfQS+vv/+sX/YXi86yZDMNoceJ9slQIyX2BldfEFfPV5ZAcCvcdn6y6Uw6UivAgfUGOQJsauZ6zD6uwhp7MRGrjq5Pkzo+TUBSYZfJo+orWYVrtIz6qhga99Srow5g/69myjXcelu8nu+xtuaanOoCrSeWNTMC+EUf8xAjtEoAJZ2yxS/grgmbehESrOUZ8nxAKCPJoZHMuWbIZMBOJF8CDYLOcFxzcg676oxXS8L6+NdZSzUiSJQIfgLQiGcdyZvgXLax0nLsltnRdkiTSIktOxIXG689zkPbav23yiu09dGsCYBWpnnaoSUmcAOXhpq3vUBhrK2XRzG8zpf1Rh3ZYB5FIURX55x9NLMZhgWgGoETRMI/M93Mz8ZGH8lfOvQD1ftSxJI2rP/XDbjNTnzpzkL2isZvg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(6506007)(7696005)(71200400001)(9686003)(5660300002)(53546011)(33656002)(7406005)(26005)(508600001)(186003)(8936002)(38070700005)(2906002)(52536014)(122000001)(66946007)(66556008)(66446008)(55016003)(7416002)(38100700002)(76116006)(82960400001)(86362001)(66476007)(316002)(54906003)(110136005)(64756008)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qIgyzoS1s+MmkXzbDXEOm/AVChFbhJiLtOAzW6URNzX/32hf5qlBhqsquDNj?=
 =?us-ascii?Q?YSmapyhJp1MV7oZOSfknquI1KfkHELN68ev26McvXKY5B8fjtIiHTm5Ih5KF?=
 =?us-ascii?Q?s9IoG18gIrXJpIaSbIvLVSvWid0dKE9deWoZmdcFpF/LDAMpilIA6AByvcsd?=
 =?us-ascii?Q?xuEbkH7HFc8y9Oc+GAHMLY6x4ucA6yllAgTkfMOXgR62y3VkKth/n5OgrZyM?=
 =?us-ascii?Q?obOit37TXSsyNtXH8OpHyZ+pEwaoCgoIQDvXkqbITZWIKUHAjAu+PHyFy3LI?=
 =?us-ascii?Q?kCMDN0W1HEKZKpqAdJRcpTjyk60ZFB8fPkVMFbvWfCOG+6NHy4Ic2w4jCZOC?=
 =?us-ascii?Q?09IUKlaSRO+ayUkcc29l4VyfDI4AyxE98Vfwcv2epC2DUBWLvLn/M0hD4Ggv?=
 =?us-ascii?Q?NhO+S1oPLJm1YyfIMEHWNrc+WXdUmal+uJXTmEBMY31WVrO8LTwcX4kY99kw?=
 =?us-ascii?Q?1E1hzHZ5Sco7/XO7nmYYqfx6cXFpGXYF5kTzfU0QLpM4Qx34PXHH6qM7/LD6?=
 =?us-ascii?Q?Hhpg84lm+YGUa0LXlmGimhSjcsSC10Lpj6V9AbzTGXr3SgPMSze88jcJWmyD?=
 =?us-ascii?Q?2dpcREVpAJKN8ag8YPYtL7qcCMdTlMr5nNZJNqfhsSUCjTEaRmHQSjn0IJcV?=
 =?us-ascii?Q?4MTiLkgAm+uN2zw2I3DFGcw2DtzMuRkEpcK0tdDyKXA8m2uBnjqh+seRW21w?=
 =?us-ascii?Q?r/7QeuEdhr6PPUepXbZCPGkoEWHattGk69HcuhwE3ig1LcRm+CV33QXABoqk?=
 =?us-ascii?Q?fMUcFxIAJVjAa8rTSD8gGxJX7Jsr6CF3qJuDBuNrs86oP8j+0H5/THiGEuB5?=
 =?us-ascii?Q?Li+iKW2wBRClVBBkjE6m3nCe8Eew8hP+atRv8bQoQhjCHOZxuYDtj2KOfKGe?=
 =?us-ascii?Q?HIhi2ue065icqkyJyKZQ8LbwfZRlFNzOXHfIwUEu5AJKh7aQBLxwG6Kaspnz?=
 =?us-ascii?Q?UMJQ9dod7Ss+y9v0X2zO0zvULQ8A94wn4AOfqmfq7q7SLMRAEv1gJ42jzUIU?=
 =?us-ascii?Q?0/L+9UFiRfmzHhe9htVCZVBGvScdo5pHO2TDyw2vC3RHQZyK1RtNLMk05Pyd?=
 =?us-ascii?Q?EG7zV7eBS+ncDiC1Zh2hkltUNE/2usABC7uvT0mswzC5TL1tnVK+GEfHzS6L?=
 =?us-ascii?Q?fi4yXSq0cELKM/nooW19doZFeAEaKLcEUKpeiCggNncfHK7QVRyjIIWK0kv+?=
 =?us-ascii?Q?ZfQFxXo4r8iCz7yYtZrDSHOOKNW1imGfUcdLqBvPKRhgmsbPzlsGVQXBvrT+?=
 =?us-ascii?Q?r45P/XXh1GHK/ymNMhI06aBY06KKHO5FXlOwUpJ5JxPz1Fn77yCK62o9Yn2I?=
 =?us-ascii?Q?MWR8jpz+TrT8Wh8iGNY5nrVzDFfgf/8M/hwQcfaX36aI3jTY+7hw/pu16QIO?=
 =?us-ascii?Q?fti1toxttLvXL5KN6vuxJCGEJlSlNHcc0+uiTYfl7Jtq9MOQ1tnaMc/cF9N2?=
 =?us-ascii?Q?mKowEIhQTNQSkiCc6ZIjsUXCrQoSOTVoPTvNi7z9D8ZsZ8JccaD52+j0FMuP?=
 =?us-ascii?Q?SB52RjFYyqiRWPnLqpSE//bKAg5+eI7BN+Mv7ByaI4kmEHZDbhd8n4Hyrena?=
 =?us-ascii?Q?+JdId7hbc0BHKmzMmVceXIBK5qSe1EVa61kd94xxUz0xaxm4uK+sug3mjt6n?=
 =?us-ascii?Q?tqPi5RFEG/a74N9RwsVTzM1z+yGqW9SYA8gf6YEVzWRrFyZNgPWFtSSHhjE6?=
 =?us-ascii?Q?/aaWQzwb7qQrkTE8OYHBZFm89De2uUG+1DYaf4aVviOptEy2uoNs6DmwPMJ7?=
 =?us-ascii?Q?oMsqeLFkdQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed736cd2-c4bd-4768-ac14-08da1e8823bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 02:32:08.8423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yWrSTEAItul31Vv6r0wihD1r+WiSurYGYzcU9F52RDUUinYu1pIvC4E+X6WlTeOxWqtga0WCMZQMSCWm9ox37w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4219
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
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Jonathan
 Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>, Eric
 Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, April 14, 2022 10:22 PM
>=20
> On Thu, Apr 14, 2022 at 09:51:49AM -0400, Matthew Rosato wrote:
> > On 4/12/22 11:53 AM, Jason Gunthorpe wrote:
> > > When the open_device() op is called the container_users is incremente=
d
> and
> > > held incremented until close_device(). Thus, so long as drivers call
> > > functions within their open_device()/close_device() region they do no=
t
> > > need to worry about the container_users.
> > >
> > > These functions can all only be called between
> > > open_device()/close_device():
> > >
> > >    vfio_pin_pages()
> > >    vfio_unpin_pages()
> > >    vfio_dma_rw()
> > >    vfio_register_notifier()
> > >    vfio_unregister_notifier()
> > >
> > > So eliminate the calls to vfio_group_add_container_user() and add a
> simple
> > > WARN_ON to detect mis-use by drivers.
> > >
> >
> > vfio_device_fops_release decrements dev->open_count immediately
> before
> > calling dev->ops->close_device, which means we could enter close_device
> with
> > a dev_count of 0.
> >
> > Maybe vfio_device_fops_release should handle the same way as
> > vfio_group_get_device_fd?
> >
> > 	if (device->open_count =3D=3D 1 && device->ops->close_device)
> > 		device->ops->close_device(device);
> > 	device->open_count--;
>=20
> Yes, thanks alot! I have nothing to test these flows on...
>=20
> It matches the ordering in the only other place to call close_device.
>=20
> I folded this into the patch:

While it's a welcomed fix is it actually related to this series? The point
of this patch is that those functions are called when container_users
is non-zero. This is true even without this fix given container_users
is decremented after calling device->ops->close_device().

iiuc this might be better sent out as a separate fix out of this series?
Or at least add a comment in the commit msg about taking chance
to fix an unrelated issue to not cause confusion...

Thanks
Kevin
