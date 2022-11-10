Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6A9623C3B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 07:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B6B10E0DF;
	Thu, 10 Nov 2022 06:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A697010E05B;
 Thu, 10 Nov 2022 06:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668063488; x=1699599488;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=roHCUOXubl3nWVhtz/c1TLOfI7oq6l2osWP/y4XwYrM=;
 b=JEdNz6I2oTe4fBgnHFyk1HB/Mwr8XLaIXWeC26bb4VqB3YBfasMnTFxA
 eVP3PDRpjmT6RU0O5jPfEs5xIdresWazQTxyOTrZp8ZL3pWo13pNbb6Pq
 i7upgklV1R23WOzhFTpNJasU1UWBnCdh2gVTsPkePA/V8LP9v0EKV6Rcb
 IWUGVywDupAXvkJZ5b/k2Wig9HrBhCGoBPfL3bPTEifKyNB7aBZZStWrU
 cct1qVOvrzBQxLSMr1pc8m0szg4bBn3QQ/qXDXTjsa3Wu9hm2BR4hWL5F
 Q7JAQuzIIS6E7ZVqfxnrDjB+6940w9xVPRyVilmlloN7rwhFmwPnxH6yt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="298725471"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="298725471"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 22:58:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="588061441"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="588061441"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 09 Nov 2022 22:58:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 22:58:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 9 Nov 2022 22:58:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 9 Nov 2022 22:58:04 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 9 Nov 2022 22:58:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6XbT54cPdtg4fZaJnQBfYPD+ruWY30haJLXNlpmjqEVzTCRB6uvb7x53d/08hjZLM24cub7s9pb6/8KOI2WNh50yUQZ1qSowaqvENNSbAv5uASd4RSLYAFLh2GfBTMUXBFpaN5D35Yx9T4jCV71q5dSG02RcAduEPM1pg/AS7WIs4jx1AcQjdh7U8Dufg5ylJGteIyGO1LZ7hfUqYR1kDFmnmTHgR/CM4X5Qd7mKv7WlqnLG5KGC+6JSf0FRmXWC9+4+q5WWhy6MuoEeH1zkRprCCZoqpDiy26wfEMYfLRpB9X1eqAr8C/6xS3AmEcf4bzp2FFsJJm83bgYtqtUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKp5qaoDtN//HLV9V5qBr+eVxIvJAOgaS5U9mxMhhRs=;
 b=gSYpF3Z1dUdY8GUt3CKw0gcr4vfF5y0GK427NFG5oLueG8C068/MQyDhUxzEUcZD9MWul8+ks0nMKhgH9E8wlPmKzpIiInpxiBGWOq1XnSVvT7T89vz6qydr2exdsMrUmoain3c0YJJ4S0pcG4JyP/h/PQXBcoTUyp/8OIxGkxmvTQ+TzVTSPu5y3hesv1314fK4AffT0V/0FXF8AX2f+zOBPFwNTwHOkhz6d2/y9IYx0uWcouk2tHApafiynnpM8mgjPFRveOROkPo1Up1Q+XrFZuiY/ynQZYQpfVoSCltROtT6yZN1xXPDHXb+rCLPsZtGocgQ06KwZcPQf7Xtvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN7PR11MB6922.namprd11.prod.outlook.com (2603:10b6:806:2a9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Thu, 10 Nov
 2022 06:57:57 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%6]) with mapi id 15.20.5813.012; Thu, 10 Nov 2022
 06:57:57 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>
Subject: RE: [PATCH v2 10/11] vfio: Make vfio_container optionally compiled
Thread-Topic: [PATCH v2 10/11] vfio: Make vfio_container optionally compiled
Thread-Index: AQHY8wx+I33WD0lOPUKtA2Qt1ZCbh641nMOAgAAo6wCAARKzgIAAKz2AgACvFSA=
Date: Thu, 10 Nov 2022 06:57:57 +0000
Message-ID: <BN9PR11MB5276494548F01A42694E366A8C019@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <10-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <20221108152831.1a2ed3df.alex.williamson@redhat.com>
 <Y2r6YnhuR3SxslL6@nvidia.com>
 <20221109101809.2ff08303.alex.williamson@redhat.com>
 <Y2wFFy0cxIIlCeTu@nvidia.com>
In-Reply-To: <Y2wFFy0cxIIlCeTu@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SN7PR11MB6922:EE_
x-ms-office365-filtering-correlation-id: d42e308c-6e53-42bb-6ae1-08dac2e8e62b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s+Pig0COExQhV0fhMPDa2eMzuk3XQ1bGKRrltrK1LuZaihgLXiKbv57wvUle8xCWFyIUY5dpLlOJiLrAnA3uL3m2ZBIoEDfwjWYQ3hL5+PvNPOiPKD5PqJ7G/KBsBhbG5cDY5CkzpQ0d7vYOSdQnGAjWCrtgyb0k8Q7D7NCJNtHz2XJQqXaOa0Bzhzea1V6rVvSHZ0+j0oJgr9tQgOQH4qe1Aqo4peChJTpdBn2A1QY1c0kEFiRv60ZQuwb/qr/HO8cejwsAPkEh8NIQhFSGsVuhaZKnfrXy9oIX1AkQFbI9oKEZs7oASLpflyRwaankTRhai2mhC+USe5nLYxL8cM2Pben+m1Ag3PL6r79rxZczrHERCoA4e1g2bvyMvyhERVsyoM5AWOcPWYdu/PvGek8CTWwMau+PJB6nw7jBKT52EAii68oxHQ8RqDpC/ttsyu6DSfy6ZfEagpjOulJiTNyZ1AFUrot2WB+u0qvsGBp2zySu4R/qVKd3L/vjIXHS2vZ2b3oZRM2Xyvny6OOoMwzUfuv3pJ00v3ncjM+cyL1/7nro6PCs1Fq9hdvYSn8be2eIHiSTL5YCtPNeoyC7/BAWRRD/PniBvD47IP1S7zEuQaILle+yu3TMayu4PzYL470vw58JXkqdGmK+FhExHJLg3WycNeeizY08ayOFtuj9s78AOl/sc+YB9K8rEQvKV5P+4lwxz/NyuYNI9JceH53+xJW9nNmWN0Ly/ekHxY53ATMFhbjXw415x/qsaZO6jnu8GEX3IOs05neJ/3VRrw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199015)(55016003)(122000001)(26005)(7696005)(186003)(83380400001)(6506007)(7406005)(8936002)(5660300002)(33656002)(86362001)(52536014)(41300700001)(7416002)(2906002)(38070700005)(82960400001)(478600001)(71200400001)(316002)(66946007)(9686003)(38100700002)(4326008)(8676002)(64756008)(76116006)(66446008)(66556008)(66476007)(54906003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5UKr64EYwRyuv3p9t1GDWvWcbOiA6R9Lj51ciD4TJZqI4XlantxpHLC++BDV?=
 =?us-ascii?Q?rrSMsnb5e20nI69pak75Me00n9qaPr7RHYzHBZbOC9saBuDmR8Ok9kT3myFE?=
 =?us-ascii?Q?nlga88L9/Xpur8uOMIt4Qr7AXMqhpwEisyq7ZqJLUdAsfweEg9gt8zTjTCNQ?=
 =?us-ascii?Q?AVl4p0xYaqjLPtIRVhKu02lVyVs35msSy6X2GvpnNcBqLdOUPCndiWZEA8nW?=
 =?us-ascii?Q?9a+HGeFFd6z7Z5wEgz+Tb+SDIajzmKAgHO6cmnPIMS95cYiC1CizX38OnkVO?=
 =?us-ascii?Q?kg5C+sBttFISjrJsk+MgdsB8cMQmvpYPK8D4nyDeeime7gNi5Wban6WVrWjz?=
 =?us-ascii?Q?sqFMnBJz88EDVn6jh7NxmRhEPFTjKx0FZLWjzn8VX5gQjAuD52rIra83SUAO?=
 =?us-ascii?Q?no1Qs/4SuG7avo9qoK8onZWc4kQ7Jf1ubHI+57AWhioIPPxKG4LiHXvwjfG/?=
 =?us-ascii?Q?3vZilUY+7qw4VniRogEjS0DT+B22WgwWomrJjNvbLoE4jQR2hWPdSAOeBBUd?=
 =?us-ascii?Q?2I78Ex6VbtW/Y2Z2zZOFaeNYZbibo1paa37Wchc/vLTgDJal5hXyCkQtHrph?=
 =?us-ascii?Q?z2NKhWhUCRRk3D0cHU50oLZe4cFoamXNZQzmyUd3qF9k8r7IwVBQ0A80JyFD?=
 =?us-ascii?Q?6C6UaurTGLrzkbC9ae62WaTy+oJwpPVKPiXBUn8gHASlIQ6ssKxwmkFYFwww?=
 =?us-ascii?Q?a9LET70cKQq2t8thUimOH4y1WKsshCFD4NzCyk7NTba9GrBl63dyL+0Wd6mg?=
 =?us-ascii?Q?AmNE3X3fxUNViTV6ubQDiEcJ5Wcflr5Svooo6y14nMitRCI1qQET97eI0DKn?=
 =?us-ascii?Q?O1i9wqfz4+c6JIr3ZgC3oVHFT4GDhTb/F4NMrk3giQPR+c3aQSy9JWOEDJdp?=
 =?us-ascii?Q?RBthaYbOkImUcFKbZ7ZAvKpkdLOqomaeolTP68J3YbcFTqU7Ma8M+/pYEX20?=
 =?us-ascii?Q?ihD3ZOrf6A/+sZgKWxxYyF5p1xSTNPrbNyjpEhjNnA5JFSlSvqTu5Jz0u9Zo?=
 =?us-ascii?Q?k0bBRukpiMqq+tyondFtEpjdGh8J9PpS4xFVED5gjwzpw7TP9max0AZYQBNY?=
 =?us-ascii?Q?3PJX8QXUJho7IPUkh/1byF7wpiK5/gGuWCzstMKo66t4VUEPCXDgo82vWvSz?=
 =?us-ascii?Q?c4oJLyTux8CRUjjeCgIXPG5vbI/2TpIZ8yU2yaKG6ePkcN1fHr5wzZ0Vn75P?=
 =?us-ascii?Q?qkhl44WMJ7bxla/JK08Qbc9m1oxoCQWJU/7deIJn7yzfQOTFszqi6wHPAUXg?=
 =?us-ascii?Q?QNoIojax1xlpDykToIXgJPRAABdFzp6xIuIFx2c7RWY0Hm8o4tHTg00pAt1j?=
 =?us-ascii?Q?ep8lz4ZTECUyHlchVfHuFMNqn77xADEmS0QnXcXhTWqJOPcqHyx7utyicpop?=
 =?us-ascii?Q?i2lcuHWe79EUP8lJ2xnjUKWDpMKIC8dznFBhfj0Qe5sixBPwQHaG0NljS2Fe?=
 =?us-ascii?Q?2BZpVhdH9u76N5Vkpa82XBW1Q54Mer3KNTN7LhYKX8h0Xpvj5PKawXNyhRLu?=
 =?us-ascii?Q?B3rh0/vu1oBpoCfIQsPjmjOWun/IYdHOaFKbJC3EHu/QEzY03aRxRqVvEeeU?=
 =?us-ascii?Q?mssStaUoWjIcKP3MWgJPr23Njsgk3SVEvJkHCAnN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d42e308c-6e53-42bb-6ae1-08dac2e8e62b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 06:57:57.5996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jrWjg1awGvNkYp2rI5W6Kwz4ggJQ4DUZWyQAsqYuNuR7JxjLKUVFbszSiWWFBDKru2vDfwTvP+q4WQMFIPOmkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6922
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
 Nicolin Chen <nicolinc@nvidia.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason
 Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Eric
 Auger <eric.auger@redhat.com>, Harald
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
> Sent: Thursday, November 10, 2022 3:53 AM
>=20
> On Wed, Nov 09, 2022 at 10:18:09AM -0700, Alex Williamson wrote:
>=20
> > DPDK supports no-iommu mode.
>=20
> Er? Huh? How? I thought no-iommu was for applications that didn't do
> DMA? How is DPDK getting packets in/out without DMA? I guess it snoops
> in /proc/ or something to learn PFNs of mlock'd memory? <shudder>

iirc dpdk started with UIO plus various tricks (root privilege, hugepage, e=
tc.)
to lock and learn PFN's from pagemap. Then when migrating it to vfio the
no-iommu option was introduced to provide UIO compatibility.

>=20
> > I agree that it's very useful for testing, I'm certainly not suggesting
> > to give up, but I'm not sure where no-iommu lives when iommufd owns
> > /dev/vfio/vfio.  Given the unsafe interrupts discussion, it doesn't
> > seem like the type of thing that would be a priority for iommufd.
>=20
> Ah, I think the bit below will do the job, I'm not sure without doing
> some testing (and I don't think I have the necessary Intel NIC for
> DPDK). The basic point is no-iommu literally means 'do not use iommufd
> at all, do not create an iommufd_device or an iommufd_access'. VFIO
> can easially do that on its own.
>=20
> The only slightly messy bit is that uAPI requires the SET_CONTAINER
> which we can just NOP in vfio_compat. With more checks it could have
> higher fidelity of error cases, but not sure it is worth it.
>=20
> When we talk about the device cdev flow then I suggest that no-iommu
> simply requires -1 for the iommufd during bind - ie no iommufd is
> used or accepted and that is how the userspace knows/confirms it is in
> no-iommu mode.
>=20
> > We're on a path where vfio accepts an iommufd as a container, and
> > ultimately iommufd becomes the container provider, supplanting the
> > IOMMU driver registration aspect of vfio.  I absolutely want type1 and
> > spapr backends to get replaced by iommufd, but reluctance to support
> > aspects of vfio "legacy" behavior doesn't give me warm fuzzies about a
> > wholesale hand-off of the container to a different subsystem, for
> > example vs an iommufd shim spoofing type1 support.
>=20
> Well, I will agree to do everything required, just let's go through the
> process to understand the security situation and ensure we are still
> doing things the right way.
>=20
> > Unfortunately we no longer have a CONFIG_EXPERIMENTAL option to hide
> > behind for disabling VFIO_CONTAINER, so regardless of our intentions
> > that a transition is some time off, it may become an issue sooner than
> > we expect.
>=20
> We can add kconfig text discouraging that?
>=20
> diff --git a/drivers/iommu/iommufd/vfio_compat.c
> b/drivers/iommu/iommufd/vfio_compat.c
> index dbef3274803336..81f7594cfff8e0 100644
> --- a/drivers/iommu/iommufd/vfio_compat.c
> +++ b/drivers/iommu/iommufd/vfio_compat.c
> @@ -259,6 +259,14 @@ static int iommufd_vfio_set_iommu(struct
> iommufd_ctx *ictx, unsigned long type)
>  	struct iommufd_ioas *ioas =3D NULL;
>  	int rc =3D 0;
>=20
> +	/*
> +	 * Emulation for NOIMMU is imperfect in that VFIO blocks almost all
> +	 * other ioctls. We let them keep working but they mostly fail since no
> +	 * IOAS should exist.
> +	 */
> +	if (IS_ENABLED(CONFIG_VFIO_NOIOMMU) && type =3D=3D
> VFIO_NOIOMMU_IOMMU)
> +		return 0;
> +
>  	if (type !=3D VFIO_TYPE1_IOMMU && type !=3D VFIO_TYPE1v2_IOMMU)
>  		return -EINVAL;
>=20

also need a check in iommufd_vfio_check_extension() so only
VFIO_NOIOMMU_IOMMU is supported in no-iommu mode.

> diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
> index 595c7b2146f88c..64a336ebc99b9f 100644
> --- a/drivers/vfio/iommufd.c
> +++ b/drivers/vfio/iommufd.c
> @@ -18,6 +18,10 @@ int vfio_iommufd_bind(struct vfio_device *vdev,
> struct iommufd_ctx *ictx)
>=20
>  	lockdep_assert_held(&vdev->dev_set->lock);
>=20
> +	if (IS_ENABLED(CONFIG_VFIO_NO_IOMMU) &&
> +	    vdev->group->type =3D=3D VFIO_NO_IOMMU)
> +		return 0;
> +
>  	/*
>  	 * If the driver doesn't provide this op then it means the device does
>  	 * not do DMA at all. So nothing to do.
> @@ -53,6 +57,10 @@ void vfio_iommufd_unbind(struct vfio_device *vdev)
>  {
>  	lockdep_assert_held(&vdev->dev_set->lock);
>=20
> +	if (IS_ENABLED(CONFIG_VFIO_NO_IOMMU) &&
> +	    vdev->group->type =3D=3D VFIO_NO_IOMMU)
> +		return;
> +
>  	if (vdev->ops->unbind_iommufd)
>  		vdev->ops->unbind_iommufd(vdev);
>  }
> diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> index f3c48b8c45627d..08c5b05a129c2c 100644
> --- a/drivers/vfio/vfio_main.c
> +++ b/drivers/vfio/vfio_main.c
> @@ -749,10 +749,13 @@ static int vfio_group_ioctl_set_container(struct
> vfio_group *group,
>  	if (!IS_ERR(iommufd)) {
>  		u32 ioas_id;
>=20
> -		ret =3D iommufd_vfio_compat_ioas_id(iommufd, &ioas_id);
> -		if (ret) {
> -			iommufd_ctx_put(group->iommufd);
> -			goto out_unlock;
> +		if (!IS_ENABLED(CONFIG_VFIO_NO_IOMMU) ||
> +		    group->type !=3D VFIO_NO_IOMMU) {
> +			ret =3D iommufd_vfio_compat_ioas_id(iommufd,
> &ioas_id);
> +			if (ret) {
> +				iommufd_ctx_put(group->iommufd);
> +				goto out_unlock;
> +			}
>  		}

with above I suppose other ioctls (map/unmap/etc.) are implicitly blocked
given get_compat_ioas() will fail in those paths. this is good.

btw vfio container requires exact match between group->type and
container->noiommu, i.e. noiommu group can be only attached to noiommu
container. this is another thing to be paired up.
