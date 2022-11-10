Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728106239B0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 03:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF74610E64A;
	Thu, 10 Nov 2022 02:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291B610E64B;
 Thu, 10 Nov 2022 02:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668046623; x=1699582623;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QhyD79hDSaJ2mqPkse9x0LnuPmDzakss2bdHxEUONsU=;
 b=cfPJbOY/SIY5Dx0W6IQ7yk5a2QBFKPmD+eiIA7oqgDC6gIyyK9dUxNg3
 ufk0yaJS6K5agm9o/CsrxOV50S22Z++LxcFXG9HzUN3FkPawxkVtbtuHy
 AbOUtLjjwBGdS18k7cZY/va14KOe+0dZfSpM5cNqh/5CQQnYXjaRFI0h0
 Bj5dj0fNcrWw0kesiLHwJ5cZxj3Wln0r9Usf7k+k4kojUF/IE4QirXnun
 cdPFemCgkX955qm8JOukCfzV8lRBpAEtEz/epxBlRWwOYdn8ObCNmA2gx
 BCg8ihtUQaZa1HZ+RaK23bJqdKhXZKNzFktSJMrSp2R0QZhsdzfpsfA9f Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="312954197"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="312954197"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 18:17:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="639430534"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; d="scan'208";a="639430534"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 09 Nov 2022 18:17:00 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 18:16:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 18:16:59 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 18:16:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVIa16QaeuOdBy1rrI6LXmpMyWn/DfnU1FFL51HF51CKr0zdPGvDAtM+ph1vD/qDS200DczWJClE3njIkOPTRNFPB6mhESupv7cJKJJkARwbPgZpZ8yC+HPSyMxw10fxVlbbvffY/zZFsvGFnjL8Lzv/FlNlO7SOOOtVGz+OGaT1wd7wc55mqY9C/mXDbLjZcl3D2WVYMdHDjFtChNC7tv3KGKUi0jpO+SvnQUcib5zIcq79miDQvH+WdpKQBsJg0ILhyvLwKDGhXFgVU/SgnT3dvSxSCy7zZ1LkP7aYp2lTuOpXu+bs3+vU8+Nkg41sW1HQywd9NXkMAo2p+412KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhyD79hDSaJ2mqPkse9x0LnuPmDzakss2bdHxEUONsU=;
 b=lJ9u8S1urSOpOr6zWYkHcmyI4NAVJiUl83FVQ8O2CTDgLtMwKhnMfzMo10cUx+D8JVq7fyuZZLyrfe8TQVGO885+oGrqS3TOqpZcypLZL5RCzNxgjGSQecRK0K/5Cd56eKXdpKccLI/MaBpj5vkRVJyroaKbLjriafKJghPMLTE+scWRPeDWA4aGyeVNR+lrRRbRhIQ/GllScg6WlyUu7uDGH2n4aXIRf/qqoC5NGDzQvZ6UE22zg6nsiBn9zoOPJ80uN3CgiLwPIcI2XRHVfQaDrmSBzMQ9MeeAWzi997trEO9kWp0uKJsRZzPcyn2Ph2QznEAWN4ak6CwaXZKeUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Thu, 10 Nov
 2022 02:16:55 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 02:16:55 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Thread-Topic: [PATCH v2 00/11] Connect VFIO to IOMMUFD
Thread-Index: AQHY8wx+1dkxGcCaVUCBYAtF8JMX8q42TMwggABAOwCAAOCeoA==
Date: Thu, 10 Nov 2022 02:16:55 +0000
Message-ID: <BN9PR11MB52769655CD0F2D7AC35D3BD28C019@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <BN9PR11MB5276F10DA6C223B78CA5F2458C3E9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Y2uhnLeivWBR0wZV@nvidia.com>
In-Reply-To: <Y2uhnLeivWBR0wZV@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MN0PR11MB6034:EE_
x-ms-office365-filtering-correlation-id: b07a7df5-8e37-4290-3c37-08dac2c1a37d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9nQxzqYJtxSOqi+7bi4nhgfM+Cg7svewZX8sh2UG8nnu16RPLzGWe1OqtioI/Aj44LR6lfeaCFu7WCwV/w1jn0fOB5YtV60GiqwWU4V4Mvs3hVX8j0nx2Fg7j2AP7CU4TE4YmpsermVEL+rKiDTXhvqBjbwqvEymdb2lBsF8qY1x7qgexJ/9f91+porHyhapPwTUOZ1kpgDLlo7t/V1niR2EEu3xDF6Xc4b108uvw3yAxG/rAUAYRydIp+iMCkbdOyy2r5f4XBWDkKFa+89+0fu03Ej/LgRjausgHTSRjM3e/zOsvEK3jJw+yUTq7B9ge22XhbBwtF6uqLqaG1AtVLJcgdV1EluaRngKI0KU2nbEJ65LuyCVioGkGUZMWTw2hO59VTMBTTmTgB21L0/DEqt79hz0pBtSNQlSpvX3V0Pc4g2ZnDHFXgGb108jI52bumD7IHKiYdliiHRZllxmK1ys8wclsEM1mOoAFjfzWnXdve1jB6DK93fKuyWr349bvwgWLZQQR7iCcurUrwOUZAnBTE18C+9jh5c77H6aJtgTcyq1sKr4hpgzhO5qZzcZg8YZSfujdGR69YZInfV+QCTO847AN8y7dcEKZ/I9mAqT/PByqru6aMahTgkklwNB5zfijxSdY8CMPVMIsrjhhdOTnA5cA1pHSgDNCgOIHAWWFQpVRXaSFxAYzZHmvuyHR0Bned27quxycqHUFCfG1x1nP3rQJhSDJ2ykKVKcsI6g3zvHdvFNIsXu+4yLODBxNZ7cEQn3JEJVK+cg6/mq4ujdOoNhoQTvFXChbc5HsVg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199015)(186003)(38070700005)(71200400001)(83380400001)(6506007)(26005)(7696005)(9686003)(33656002)(122000001)(55016003)(6916009)(2906002)(316002)(7416002)(52536014)(41300700001)(5660300002)(8676002)(8936002)(4326008)(54906003)(66946007)(86362001)(478600001)(64756008)(38100700002)(82960400001)(4744005)(966005)(7406005)(66556008)(66446008)(76116006)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6nJHnQIUc5tLD5o/v3zI4dTR43hJndet8NedGkfCJSDYuLGm9oN2eamPoYMy?=
 =?us-ascii?Q?Xn1dYFdSuA9nOt4LfQPouM7qK6B/zkKaDjLaeQouykaINqRAi4YhweSDJvCy?=
 =?us-ascii?Q?dlG48q0PQ04XFPB2h8rvErHLu8UiqwT4CWGF3sRdGQXJQBdNCydWCgRHCmPV?=
 =?us-ascii?Q?WFdVkyOePglad6rpeepjZvI3RHDoreslOkTs1oGHL9w1oWQAS/FqPbVClLI4?=
 =?us-ascii?Q?JcekZ3hJ7mzJaCzzBVl0bldGTvIM3Y/k8gOJ51JyPH6nIacE3YwxnOJYCWMG?=
 =?us-ascii?Q?t9Dp/cdd60cEgn7Qwd4fhdK/dNS/AucGWU6gwNm+gOXZlRDJUMNNPnjUmVEX?=
 =?us-ascii?Q?TD0snvxksRdDUL7YyAgulyBSsfkSxcfmnAPxGzqxkp422B2h40jjFGr5IwPK?=
 =?us-ascii?Q?OX5I8Z1Da5vty1jkjUhET2kBZSEz6lf3Oo667TWLqr9wVKL+YEa9y2OZioHS?=
 =?us-ascii?Q?KT9QFAKQxoxjE2oZELWSFuA16fCg+WsJ/EDO1Ou+pfnrQY4ba4vF2iIjU3LY?=
 =?us-ascii?Q?NY/t6ig5En6Er9b/AL0x1ffG9KJefcYB0Aaq4q0LG4aEr01cX9+u0mECh9f+?=
 =?us-ascii?Q?20EpcEKMu5uTGPE3N6lKJDSZZ0jUUXmOIZBzc+Kkrk+HKllQAOEeEzW0xV41?=
 =?us-ascii?Q?o8PhdzkgHwrL8iYWMRRb1EksEve/tun5UV+gi3V7E3EIPKB47MBD8eAobwFF?=
 =?us-ascii?Q?498RYOnLxKthrqTxJXS0CCPr3+qLbp90XDAj34Pg4iuGjRLdx3p794mJ2Tvk?=
 =?us-ascii?Q?rj2MqrIyvmsKXc4iqb7TjWmF6FBgttYbtycNuVBEQcjZTyRpwasHZHc7qBTe?=
 =?us-ascii?Q?DzE3HcZwnJvXda4zqFszSSXnq3uei9/3N5pejOWsbjWWB+pdjNkSXiOb7Iut?=
 =?us-ascii?Q?wM7Plg+zfUTf3bwUWUZ5qJJkpI4uf0vMCAtjOLLJv7dvbYbpLTD5KExlb/SD?=
 =?us-ascii?Q?rObqrZEj8KvAmhe1J1fcg3Zz+0H8U4aWtffEafESAoxYwm8W7tXAsPmJKlxJ?=
 =?us-ascii?Q?QxPnocNdOhIvjfp9IMVqQHZ4nFK7QyUVtjCr9A0lUrPR3U7QaWmy8nB2pQ9E?=
 =?us-ascii?Q?/hab+/F6rcICONuK1kfR6HPlPGwrRxQUbK/h1U1PfsTsMv3H3jDhn8yUCJcC?=
 =?us-ascii?Q?HRYP8BN+zQksUhUVZq3ZOFXvjL7sb8TeRYKelec0GHzrCM1W3zRoVALQ646d?=
 =?us-ascii?Q?x6kI3Y2qslH6B4FWbFPt7hbMMVjx52zVtARCvMSHOes5RfmoiBRdYLcq7JAH?=
 =?us-ascii?Q?i76abXVExlo9ug6BBxsYcJMhfMVvKkZ/DnZlHOk1K/YGIKbbw9DSGfJu7WBT?=
 =?us-ascii?Q?XbLBY28KkbcoEi0bjFF8OVtP9nCB2beT9Iruj4Sxc6dBX/ajxfpnFtxIVUHX?=
 =?us-ascii?Q?ie7fw6ANYf3ynfamgvXDdpRvlQBmlXr86bUDpRMa0vtDvnoSfFBK7S/LbSw3?=
 =?us-ascii?Q?dGtutxGqtAvbc4v7NSzsKH+2a/aCqaRjjcyVwssGyeGBz5jWZgmsRiVF3548?=
 =?us-ascii?Q?6XfXEAc50HLKCXQatXoaJ/bnk8TZZLO/aT9RMT8W3j53C6/KlxyanzsLtqge?=
 =?us-ascii?Q?Yu/Y0DpPeyCXDwD4djpEMrLhkIW9a+Spr2aF0XSg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07a7df5-8e37-4290-3c37-08dac2c1a37d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 02:16:55.3091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cO4XddH7WVO/AwQWFo0yNcdpJ+pvAJ29EKnHa6OGCVSZrJWmIoESejJEDV/x+kdPn4HiJKsG6je44CSY5ORG4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6034
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
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew
 Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason
 Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Eric
 Auger <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Harald
 Freudenberger <freude@linux.ibm.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Wednesday, November 9, 2022 8:48 PM
>=20
> On Wed, Nov 09, 2022 at 09:03:52AM +0000, Tian, Kevin wrote:
> > every mail in this series is shown thrice in lore:
> >
> > https://lore.kernel.org/all/0-v2-65016290f146+33e-
> vfio_iommufd_jgg@nvidia.com/
> >
> > not sure what caused it but it's annoying to check the conversation the=
re.
>=20
> It is sort of a lore issue, it only combines messages that are exactly
> the same together. Several of the mailing lists on CC here mangle the
> message in various ways, eg adding trailer or whatever. This causes
> repeated messages in lore.
>=20
> The trick in lore is to replace "/all/" with a good list, like /kvm/
> or /linux-iommu/ that shows the original non-mangled version, and only
> once.
>=20

this trick works. Thanks!

