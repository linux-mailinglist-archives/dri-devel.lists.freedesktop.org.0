Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2E854401A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 01:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5481010FEF2;
	Wed,  8 Jun 2022 23:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C123D10F53B;
 Wed,  8 Jun 2022 23:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654732249; x=1686268249;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ft1ymLJfF9ha1l12tzFi/MUFwmpGkLkrK6OS+6oxnjk=;
 b=g/EDk0wfMh0wQp+1+JNI0o48ALjtpL0K1sPhN6rXCehACyO89UB+fZq9
 6mqx2u0gtM6itoRkOc9QhzjUbNdjanesFb9YxML9oUR1cAGb45k0AoSSR
 lthGjvhK91uqwet4zTTCBoKCDBnzU3p8rJuinlOBR+b3Lw78c4/4PFgPn
 2+YgC5PHdJO0h89q1fCr8If+9ILhnSVOri9Ac0DmOiRCqUL05dZxX8F/i
 /EccK8pFPAKqAC4RG3iMoepPiOJJb7yBsgbLFNJpXRX1yOj+qIWWLeSez
 gW4lKhAWzMlJI0HwtoCLjjoCT4lwtBnf7r5LpNOFKY6qN0qs4X0j4iD7z A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="277911569"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="277911569"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 16:50:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="724123434"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2022 16:50:48 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 8 Jun 2022 16:50:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 8 Jun 2022 16:50:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 8 Jun 2022 16:50:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEtT5StNYXGt1OupEZ9brIDS/tML1IlQbpILN1iYsoW5UAM9ubyLLKCSNTcEc4lWctDFaobJ9tgC/PTRPPWWwJOF4D5rZpakI5JBPRbHTVqNqBWunzUT/dq2DypUV3hPdzvEgbfqihFEfzc5GxwoKo/b4rDr8hCr2Gtq8slfzFh4pWnYfo+kbUA+nqiuSgKUH+PkwfRIqNv+BB3z9yRjrWNm7oMsnaciJ8SlKvqFNQ2tSn2R3wnXhfGol1n5YwKEnQRuO1gsZ2FBOloDtpsWnAk7+IZzz+IgFvBasl9DwVy0V9qeday8LRTMilZBjdofKA4rSfCN/dh9lLz28vNw/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIAUiU79DWeMWyuF/PIMX4tgNlO60v6XivbGw3pRsjg=;
 b=V12Kb2Bkivfs/Mgf1h26+4mmdPrKBpgjBOzQJIS8Ub9yOGK1L+XaE26FoALWdRdj++RKWT3qfmgjx0ZDVhLfXrpnltNCACCoo3htE4URzUXcQhj/wZCTQCA11t/uktqyUX6SrYRQRgN72dV8a99J2VSdYrXpJNMvX3imQ3zyX47+ZUOEU8bcHjuHpKg+QsX1xjgjyKLqUWpZeBLY4mpR4Bn6RDHJw8aT4k0VhlgszvftB05j4Sj+3c1mgcDel/69lt+RT+2ITYOLeXlgjECCKxzxPyCDL3YWVbpxaow/D/GWfMwFLWVIBh51qVpiym7ha++ajei/PpBiapgJZxFDUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5278.namprd11.prod.outlook.com (2603:10b6:5:389::19)
 by CH2PR11MB4389.namprd11.prod.outlook.com (2603:10b6:610:3f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 8 Jun
 2022 23:50:46 +0000
Received: from DM4PR11MB5278.namprd11.prod.outlook.com
 ([fe80::c5d1:fe18:c2f1:2885]) by DM4PR11MB5278.namprd11.prod.outlook.com
 ([fe80::c5d1:fe18:c2f1:2885%6]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 23:50:46 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH v2 2/2] vfio: Replace the iommu notifier with a device list
Thread-Topic: [PATCH v2 2/2] vfio: Replace the iommu notifier with a device
 list
Thread-Index: AQHYesKsP6nJeS6MEkWdYepTqHDKIK1E3a+wgACCC4CAAM+/wA==
Date: Wed, 8 Jun 2022 23:50:46 +0000
Message-ID: <DM4PR11MB5278EF91D8AC48036F675D938CA49@DM4PR11MB5278.namprd11.prod.outlook.com>
References: <0-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
 <2-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
 <BN9PR11MB527600F9745D1AE27150CF938CA49@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220608112641.GM1343366@nvidia.com>
In-Reply-To: <20220608112641.GM1343366@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03c01613-573c-4dba-e540-08da49a9b561
x-ms-traffictypediagnostic: CH2PR11MB4389:EE_
x-microsoft-antispam-prvs: <CH2PR11MB43894340A5A2AD5190BEB2AA8CA49@CH2PR11MB4389.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: it9pu3Qhvl1BhR7DPsQ1X6SKUFgRM5iKn/5qPzz+j+TKlKF9btuB/up36+e5qFFkr0CDmlUwDifI2Gu2KcEkdPvWTL3RN/fNfgOfZohbPQ9ODUq+mqDrfASlB1N5oNSfl0z2tDwrdI4DimrtsbW6zY0cP/pATVcgVQW7yCcq1Y60Bg3+ecpSkW8ONiXj2QwyxxlPCJzH4dgYq7Bwou+r8Wii/ziqYI7gpxguRlE8qM92qelyGmWsmz9b19UUJA6VeLY/QNFVMC1Kv9/MJxd3Pc2qC3BAinkqq6pR2LAKUx1GDeOrMLHyDMJPExVllRUBt4SKBu3xN9904NhbPRSPT44ecQJEuhBKQydklp01qmBNVzg/tVGEhryuZd1UDnWrle9bZJcGMeG9uko+jjP79w184Q7dPH66HOZmzzBqhhsezHfVdLW1qd76eEuwZB2DL3PxLwgYaO8uTFakHvYUpdyoXRSQaSMH8tBnbZY+JkmRJnHykD0cE5VZMyCNLNrvdnDBcMDspWvouQxrlBsfwW3f823qpYy7qdRvyus2uu6/7i+PCl4FyV+bAg0awokVINZ9akWp9yb0rjQC126W/4AO01oTQgvGepOOG5RlZ7BBXBcmB3YiVZxF4CM0IQE01hUUnUG2D8N5ay1n8ZNQrKOr28CC7LHZdRH4UFQqOc9iAe02WfKVy3rfsO5/5fAeBoAL9UjVu1/VCifM7HM2Mg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(54906003)(33656002)(9686003)(38100700002)(4326008)(76116006)(8676002)(5660300002)(66946007)(66446008)(66556008)(7416002)(66476007)(64756008)(122000001)(7696005)(82960400001)(6506007)(26005)(6916009)(316002)(8936002)(186003)(38070700005)(83380400001)(71200400001)(55016003)(2906002)(52536014)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+g8SQeHmhO6oGbkFaQR/bL5BGKPfkRLTJfOSbRviU1bBWNMAI5wLjyiNEQns?=
 =?us-ascii?Q?aGCCpOwwyaEQKlXWc87FD7B1vQbTN6Glly8DRmrHeKA4Ql0nzm0UmOvrUN6B?=
 =?us-ascii?Q?a0VA4xxrOlo/qaX7xPTVL1Eer3me1cgs5t7/ji5OMInRNU9MsG4eB1N9jn4x?=
 =?us-ascii?Q?y4W1+yp5EPwXdw/NO+lLha4hsWfPtLUPozuDaiWV8UyfLnv/V8Mx/XPziXge?=
 =?us-ascii?Q?WGcBVHkkbMlVRqrgLF1AFIcAeQkNsZXT++qf2vO1V1eP8s7ZU6H189lz4cl9?=
 =?us-ascii?Q?hw8QTZQ6H47///ggxcTXbN8sIJdUFPHa67Ng8Pbn4jBtIMdQ/F4jHtT4+xWd?=
 =?us-ascii?Q?SxaUIpIRSsfbXd04rHHqOqUpzyWrMzhH5xyighvzqCQ0shxedS3+6NHHRpID?=
 =?us-ascii?Q?FG6zWc/hVOa527ZLdLKeTJbwBa16KMwUg9ED1YlYZ0Av8b8Wf6GGHDC8aoT+?=
 =?us-ascii?Q?7wIjga4/mWWBq/IsoTMgWlZlW60aM+bkgXWZVmeFfOMxYCm2xcTlr1jVXzWv?=
 =?us-ascii?Q?C0IWIAkwlioMHw+RBs81BvM3W/EMbdweqJF6alBmyp6Dp6ic6ReMU12JTnp/?=
 =?us-ascii?Q?nQHStbspzVfctXJvXcqcncbDix9FEc0LcoOOH7VNW19QEFy6hmzWg7uKsrc2?=
 =?us-ascii?Q?sc9/B/zgiXovXL9BmiP8VBoccNjK13U/IQ0gBE2qwGlUOrOV4J3r4384e4bf?=
 =?us-ascii?Q?v5x3cFV+aKmf6hq71HP5t58PPM4nBodS5AzB5yKVEEim2GNKzjRMmzCn/ksK?=
 =?us-ascii?Q?H4R+hT9e+1LSjJWtLHEZntgAxRDprhyqtA1M2u87dieo5NSTsU8HS+Gn9Hep?=
 =?us-ascii?Q?dm7p+OGLlMR3qeY1JhLBauDJxJVhVdMFz2Vs3C+d6b8U3KbgfrQYN2HaePtT?=
 =?us-ascii?Q?wEPTkLdjCoS2S2c1i0PdqeIk5foM6RIDEsZd9ERa6Zwv8r/P/92jNVGEusV5?=
 =?us-ascii?Q?WsERaDLGZaQsAxfR/RvNWrzB/Jq+82roGnnWMdeRJMg20A8yece+xk6P5Oz3?=
 =?us-ascii?Q?XJxl7Vf4VvER4E2aTsoxcCg55X9NfqmLXqaFK1MXk3rN98ecZLtv2/XQUmBF?=
 =?us-ascii?Q?KJw94JRrkAB5w00s6vneSIFqHGnabwFYb39mIlclJ5+I95T+omw6n74v1H8C?=
 =?us-ascii?Q?djoZMha4fjc+/rwpkW3qNfiXomsbVSwugzAtaTjgIx0OnCHUjELCGjvmULir?=
 =?us-ascii?Q?tety2t9uQ/9S8YdNNNL0bkPpr69XPoZEbbkJCQ+XaasWAzLMCKCUZNHbx7AR?=
 =?us-ascii?Q?kzjS/hkKfX1NurgwRm3W0qxktO1cnL+rYfBF0Q+ILq3oJMG9cUXOcxQ/hxoV?=
 =?us-ascii?Q?XVbZScJScYtarHR3ijVjW6+w3yybZPEJIWfqTx1UU71fFz59qeXFVBXM1JGy?=
 =?us-ascii?Q?fn+XsSJR1r73ciwu87SBFsLtAsgb7JbmsWeJ7sUhvWgcAMv4whKTh7z1nAvH?=
 =?us-ascii?Q?RvWinA2EBA2Xeqan4yLfUAx4MgBTnF+L7xWvvQbupxWtecdjopPL3Qao5DFC?=
 =?us-ascii?Q?3fF5BWBbha4Szuo5TzMsr+fsbL0iu11RW+5IYcBVsEXaqF7yJoqYhhsQ41k0?=
 =?us-ascii?Q?f3VwZ/LvzmCgY3opoyquACWXoSYtel+kgqUou1VXl7U5QxmHaQVDweNYcrTR?=
 =?us-ascii?Q?zAZ9Hw3xhLYyiTnYCfU8VKtKjWb4eek/GHOhM9V76fM/Aj4uEGCnpEq/7opw?=
 =?us-ascii?Q?pYanf74Xd5Qt/THVcQJdcWHUK/WbspTDyafjf0tD0czscBYPvOpfmC/HvXrk?=
 =?us-ascii?Q?YY9apnj78Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c01613-573c-4dba-e540-08da49a9b561
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 23:50:46.7270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQvdBbwlaZGpQ7+0dcb/Bzexx6XgtxNG+Qw2NejRIAzC8/CG8xZMIVL6zmgrewRtkZuhRr3+vB24xdmdxccXEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4389
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph
 Hellwig <hch@lst.de>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Wednesday, June 8, 2022 7:27 PM
>=20
> On Wed, Jun 08, 2022 at 03:47:12AM +0000, Tian, Kevin wrote:
> > > From: Jason Gunthorpe
> > > Sent: Wednesday, June 8, 2022 7:02 AM
> > >
> > > Instead of bouncing the function call to the driver op through a bloc=
king
> > > notifier just have the iommu layer call it directly.
> > >
> > > Register each device that is being attached to the iommu with the low=
er
> > > driver which then threads them on a linked list and calls the appropr=
iate
> > > driver op at the right time.
> > >
> > > Currently the only use is if dma_unmap() is defined.
> > >
> > > Also, fully lock all the debugging tests on the pinning path that a
> > > dma_unmap is registered.
> > >
> > ...
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > > diff --git a/drivers/vfio/vfio_iommu_type1.c
> > > b/drivers/vfio/vfio_iommu_type1.c
> > > index c13b9290e35759..4ddb1f1abd238b 100644
> > > +++ b/drivers/vfio/vfio_iommu_type1.c
> > > @@ -67,7 +67,8 @@ struct vfio_iommu {
> > >  	struct list_head	iova_list;
> > >  	struct mutex		lock;
> > >  	struct rb_root		dma_list;
> > > -	struct blocking_notifier_head notifier;
> > > +	struct list_head	device_list;
> > > +	struct mutex		device_list_lock;
> >
> > emulated_device_list or unmap_device_list, to be more accurate?
>=20
> I don't think it is worth getting too specific here, the fact it only
> has dma_unmap devices is a bit of a shortcut to save some work.
>=20
> > btw a few lines downward there is already a emulated_iommu_groups.
> > the two sounds a bit overlapping given mdev's iommu group is faked
> > and singleton. Wonder whether it's cleaner to just reuse the existing f=
ield...
>=20
> The locking is more complicated on this since we still have check
> every device in the group if it is opened or not while launching the
> callback and prevent it from opening/closing while the callback is
> running.
>=20
> Since I plan to delete the dirty tracking which will drop the
> emulated_iommu_groups too I would leave it like this.
>=20

Make sense.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
