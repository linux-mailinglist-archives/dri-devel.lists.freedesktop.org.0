Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61885FA882
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 01:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C971810E750;
	Mon, 10 Oct 2022 23:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29B310E74D;
 Mon, 10 Oct 2022 23:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665443644; x=1696979644;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ffquk7BD2QK0dssCkLpnzzFb3ltEHkKa2O1bNUr4eZE=;
 b=FiAYBLNPa3EZB9c4XIzh3y3SswZWC0IyQ1mjdzHhi//dyNAOtuUzp+E7
 d98RL9a9qeb8pjls+m37Cj0XcGxpyMGqv7wU2L9qipbhy/tNyFRmjUKnn
 8oRH+dOl0IBMtzVZCYXKQtP1go49A/LcNX/Owwu2zVbIBvkGOYYj7Rk9c
 Rz2Rbm9TlsY2DgdCwRx8luCNLf7noDfcuo1ZVdC3eSBsfvtLsiLMbopiw
 PcDHGIzt136Y/nDpQ8ALjalRwOnnGCnPiw0xbj3l89WDzSGTtQcmuds3V
 O9RQicFdhZLsHGtGiQnc6FDbssjb1dNij7vg6XEuGyEOtXYm8QIbTK3tV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="301967793"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="301967793"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 16:14:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="768576071"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="768576071"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2022 16:14:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 16:14:03 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 16:14:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 10 Oct 2022 16:14:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 10 Oct 2022 16:14:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0LiOjDq7O+eGyzAKnMQZMJaMLUgQuoWPJuNYCT6R1JDvgqicD9hfEMG/ODnnP75KsNzVxMfpomX5ZqrliPG+/TQLtItGjTPM6Ou3RZKQDcJMKpJZX1z98xBUEVwwjElGzDia7aMaBnQPbI99S6Lln2dxJGurtYTysxvfx6wBqo9MuTCGhdj5DLEbP6t67883Uh4EPdiH8WN22xCacldMTc1YxbtrRHOZfsUtW8lhem1gJkxalQcZ2S9iXny+X7OK01Ed0diJ4jqnbqVG3NcUT6DgW52hjJfeB3ILv2+YpIePt1Z82hCis8gFCH3E1EZk3Pz6Y1CmIRPqSZXfbXVWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7hH/eKMS4VfKEVwgIakMkPNynOr/PNpczjPukU3vzc=;
 b=PlHCsFsx9LIvD39JgCFU+qDJ6KGFVRRw72xinWQ9XT92N1ksynyNE9Bhx0HheFVLodzMjz2EhkHZV+KOKqF6SfOBnISZxk/cMQRH32BXWxSDMrtQaYWJ3ugSyIt6GoM8P5chJCC79zHRZj2HVUB+XURjRPr/cu2UC0phko4eosdAnyPCncmv+cWlMffBRnYGk3uB8/8DSE2v/J51HQiF2lkDvYmYqlE07mMdw+6x1C7j8PhisT4xIH0OUNqPbY+LuGD3nYlGdQU7SmhiOrGrgEo49wTE6yVOJ9VBh9fh7pYB++sMuv1hPywO6RVRNJeRlajDIJbv/kkSTWWOziq/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15; Mon, 10 Oct
 2022 23:14:00 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b2db:19f5:f440:f6a2]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b2db:19f5:f440:f6a2%8]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 23:14:00 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: RE: [PATCH] drm/i915/gvt: Add missing vfio_unregister_group_dev() call
Thread-Topic: [PATCH] drm/i915/gvt: Add missing vfio_unregister_group_dev()
 call
Thread-Index: AQHY1CvD04pCQF3zs02055qhA9FU4a4ARpaAgAAdzACAAOM2gIAAc7sAgAaX7dA=
Date: Mon, 10 Oct 2022 23:14:00 +0000
Message-ID: <BN9PR11MB527665E22CA6471EEED70E0C8C209@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com>
 <20221005141717.234c215e.alex.williamson@redhat.com>
 <20221005160356.52d6428c.alex.williamson@redhat.com>
 <Yz695fy8hm0N9DvS@nvidia.com>
 <20221006123122.524c75c9.alex.williamson@redhat.com>
In-Reply-To: <20221006123122.524c75c9.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CY8PR11MB7241:EE_
x-ms-office365-filtering-correlation-id: 5cc31ce0-4357-488e-e8f4-08daab151d86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lHGu0bHlqjCveYJtFLhaz1LF+rzbR1u0HpCpZ2UjthL+lZhNel05lWLxX81TGcu+hQQz7hpd1diDUHHyFWouTBD/nb09inMOlfeUGIGybWgRHVyClshfsZ/+d9s9tI3/EdwZPmN7GlSJAsexOIcafg6qxSwWIpyF04RiZDaXYlhn/In2gBmTGCzhpZFQWG9gUg6hlTwk0o4Mb3j/o2TYNhv3UAfTqZxwpBjn+hRnMXbWR4+2twk4+KaXRhQNIPNHyiBBLsEw4bDqpRiiWgqO/RmTlOi54/Br1QJzylleqAcVnXll2EyzfJetdYuBP+wzMOYA4nBZLhBNbRyLY71XHOUZKzm7GlChyt+lbYN7IRdEv7IKxm8frpGV3hubSUUsrD8uHwIrGGd6veOdzH3g8syDZCQN1RmHcoVDlTBEu97QXrCwaA74xhMbn2yHu0C6/pl4PbmHI4aDUoghVZImzFoxeJxuOCbye1vcCIYVIzwkyKVsq1CDMSf6Ze0f5olvi8haYCRUqhqQWw0zWko/FCyt1Tz/msRMgDDwLV+D1SXlhbsVG6zdFvUB3fKdT+MCFnhsQ6lP0+aByJJdpWCsGgsZ0X7GVle1XwYlWikH8rlFoE/BTnnX8VVsUNfhMoNnjjNVTnpsVoHDdoh82pnvEnbNT7jJX8kUGGDFgE6tAGb7nkzWvcBIi7sy9TCzbU5j/KQEsL14ojpkDBsSepZo5k9SuLPJonvo1axjCFd1uuoWeh2xzr6agtuuRZohe8XZredGWeuPgicDxVrA6fm6NQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199015)(186003)(54906003)(64756008)(316002)(55016003)(83380400001)(7416002)(66446008)(66556008)(122000001)(66946007)(82960400001)(110136005)(8676002)(5660300002)(6636002)(33656002)(41300700001)(76116006)(4326008)(71200400001)(38100700002)(66476007)(38070700005)(9686003)(7696005)(6506007)(86362001)(52536014)(478600001)(2906002)(8936002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?65gDzFMC+fHFmnnj+l6mMwZrgRP0QngSHWZ43xr4spAJl2Rqw1pYtv/+v3Vj?=
 =?us-ascii?Q?iHGj5srWwg3xzG+IG4eOo2bbFFc4f/0uSOM+szlbEhcLt2EUiBXddXKKu0Dj?=
 =?us-ascii?Q?gc74D7m+ZVvZae0doJFRoYRt1Xc3ygc6aZS3IvGSoZG+160LvtfxG/PSDsb+?=
 =?us-ascii?Q?jsN2sVGuAt25H7RJL6xL9RKUBRmV/h0+sDfaLvAL/ptsKwAMajuz3HQiFf4y?=
 =?us-ascii?Q?YoGNmMbRm0EmInE0TDVNhlhwE/fJbfrnlgKqY+dgIlzdoTBtYUboiWSx3CPJ?=
 =?us-ascii?Q?hyGCduxK0vA+4d2577Ahz5MlDgal/dateAire+NgEt34LU9KyQEmvvtaRXYZ?=
 =?us-ascii?Q?pPS6ilwBzCi4fFhiBmABsGdkih9uua39vW9m3MIaSfn/j4kNEDrlV4H4ViDQ?=
 =?us-ascii?Q?J0oOJzK5/xznFS0U+AZ9AnAhIH+IHxi4i/tSycggtO2aH2FNkmx+Ydm8So1F?=
 =?us-ascii?Q?UaI6xCqO19Ffwlzds5FKymhjPcgdQPWi9fp3UgwKNi89QSO6Ze6OSTd2NQAx?=
 =?us-ascii?Q?rJuZ44Exnh5P8th7UkpH5IVW8l3URLulb0kuBFxOHh6KctcDadkqWklw9r1W?=
 =?us-ascii?Q?+fZxq5DL5kL6CNDeWArR+THG0P0+q6jEV5EeJ4GDP2mD0Tco2p1Hi+pf1aca?=
 =?us-ascii?Q?yTQXqQ2nQS28Fwe8ClkYziWZMgxoAdoXIbfEQOEZQiWoNU9TUBvcAxA5wjef?=
 =?us-ascii?Q?O/zSQMD49ySNSAxo6jJTAMkLGABQkFoi16OoeBWqvJ6RUhnjUKx84QG7/gSt?=
 =?us-ascii?Q?h0gtGnYf/tvlKhD0opkpDk1tJ8OqXzSzCUYmH6nYnrXYTPME2PbB7gVOC675?=
 =?us-ascii?Q?IBvUtR/sUgd9lDIkRoEqc1SjXxreolzYQW1J2eu0vv6jr4Nh5JgQyNZ3+0tK?=
 =?us-ascii?Q?YVdcoCKEH9t3RXNq6QhnmToCWV1xJV1oEtNhLNJKvAupwbyApN9rRWsw1KCx?=
 =?us-ascii?Q?GED3nahGeavB515HSEiUZjRODXBQyf6ElvXMmYQMWkVSWsWmj0vDQg3U+qxm?=
 =?us-ascii?Q?oNeK/KslnlJ4n58bzm6AlV7sjKesJibQHfRtj9wjT8lxDeosQSlZfHePpnVc?=
 =?us-ascii?Q?cOuXAWHr7gSJVQairCGoeBl9oskUpuA0vhaIWR51UAsEL4YFlR/TfRE5x9ww?=
 =?us-ascii?Q?mGYsY8ptRV54wUomhq9858T5nwM6PKqvJ5qO3NaLtn9PRx9aUT2q0o8yXsfx?=
 =?us-ascii?Q?HjJeqj11ryzjKuw2XoImj9AC2fjlswZNOouTYhuHpeFGb6bTcliYn9MAx8Dk?=
 =?us-ascii?Q?ww1F1jTAt1AN3UzA8WgEQ8sctFaAH0dIiIcKkMVuoVbigxrgx04uxjJAH5u9?=
 =?us-ascii?Q?xVqLCwCPtCxivofzC8niwa9j52RGd2/FtSgEXmM/gPA9zM0iQBPS42Ur5ZwD?=
 =?us-ascii?Q?MYQ3OLfb3Tg5lKfQq8OC4EJ+7/qs/duK2BNXqp6IJtFuE+x4qDjX+wCTlQzO?=
 =?us-ascii?Q?PebeeH+xnyXKvnjy56PszQENNlx59c4nX2iGb/6Y3zM12voAMax8u0oMLkT+?=
 =?us-ascii?Q?Q3AO9soOiAOqoFWZBNZfCVcAerZ8ZyMa/5UjPDCM7DUKhQ1vrCW8xVx2Y9cC?=
 =?us-ascii?Q?Y2vfg0kFXAt4NYD17nAJZ0qfjD4iN0Dnkm+sNzMV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc31ce0-4357-488e-e8f4-08daab151d86
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2022 23:14:00.4233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eSi9dbkbQ/kByleLt33Ox9eN53hTB4Gl8bwWOuRYDhTLbDXQgMlAqVMd6LXI/AAQF27U7V2UQm1Qcv6l75ajTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Friday, October 7, 2022 2:31 AM
>=20
> On Thu, 6 Oct 2022 08:37:09 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
>=20
> > On Wed, Oct 05, 2022 at 04:03:56PM -0600, Alex Williamson wrote:
> > > We can't have a .remove callback that does nothing, this breaks
> > > removing the device while it's in use.  Once we have the
> > > vfio_unregister_group_dev() fix below, we'll block until the device i=
s
> > > unused, at which point vgpu->attached becomes false.  Unless I'm
> > > missing something, I think we should also follow-up with a patch to
> > > remove that bogus warn-on branch, right?  Thanks,
> >
> > Yes, looks right to me.
> >
> > I question all the logical arround attached, where is the locking?
>=20
> Zhenyu, Zhi, Kevin,
>=20
> Could someone please take a look at use of vgpu->attached in the GVT-g
> driver?  It's use in intel_vgpu_remove() is bogus, the .release
> callback needs to use vfio_unregister_group_dev() to wait for the
> device to be unused.  The WARN_ON/return here breaks all future use of
> the device.  I assume @attached has something to do with the page table
> interface with KVM, but it all looks racy anyway.
>=20
> Also, whatever purpose vgpu->released served looks unnecessary now.
> Thanks,
>=20

Zhi is looking at it.
