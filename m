Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC39310E88
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 18:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38BF76E33F;
	Fri,  5 Feb 2021 17:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041C26E06E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 17:23:17 +0000 (UTC)
IronPort-SDR: PDBngbPc1yiSu5WaCqcNQxIvXLw5oU8iJPZ+UF6412g2/Ek6Fw/ObIcaGvmJNTknimqUDcQbSs
 xZMAjho/ZM4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="161216270"
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="161216270"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2021 09:23:17 -0800
IronPort-SDR: NVg/z/bgmJV4wZO/Sbma8nGmvjmNNWAuY/EYKv7AJA0YWRpBhF7I6ksJ4XugpMeFu1hCNFw7A/
 B3JgSSrX+4ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; d="scan'208";a="434538024"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga001.jf.intel.com with ESMTP; 05 Feb 2021 09:23:16 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 5 Feb 2021 09:23:16 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 5 Feb 2021 09:23:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Fri, 5 Feb 2021 09:23:16 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 5 Feb 2021 09:23:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ax8DV/aZFpOFYjIXnuuurFx3kWCmQuk5mZRS/TL9KkpG4ArrZGi4OtqRwbvl71Vt61dMcY1KJahwvVNKmDYc1VSDk6rLgoXWsSnzBs9cyeTtO3jKiHkS6EsUIIUMV7pQ4Jy+LxBwfEkwcdNRANfysP9x1PbyNfCmLJBXQPvzG5QjMA9IXrRxG2KvHVA0bsn0uHQjKhjGi3VbsZrdy2uO76DqA8QKhYFsvajMdsqa5atec3cei8v4kk3prh5bjBMZMfv9gWVD+BDroiF232Dl99uG/IzFWvhBOom6t9zUcskiFNG88xfJxsVYAkQGk4ndSOVpifSpxJ41MoTQII1vyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPt4qok7zBiZjSmUx4WBahTC6NOURlWTlIh0XNCuCoU=;
 b=SSstut9UYZUfFnIZ2Pk4qsjnTpHYnmX72M6n/+TQJHTvY2tffaODldvIJlm+zvQeLBfvduD8u+4PERcSknD2bhPo3HoKjsrylWR/L7UKZhSTUYRY3RFmMAGl0ONo7CrfcS0WHI9NTyVGBuTLfZOrI1o9F8Dn4NA10rvPon61d7a3h7JD6dydy5rHTbqIpg2GrjyqywxQ67wyDJ/f+rr6CeREGypkiM/kETajlagbyvIRlK/3/LmrArnYHjDGJz9Vm//UNH2dg65SRonZ1rq719rOfQN4PlCyc4FInvRkseoeuqvNTmubthK4/CjuRUxIajo6cIdutss0Z8PQo/2MDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPt4qok7zBiZjSmUx4WBahTC6NOURlWTlIh0XNCuCoU=;
 b=LktL2PH1hqf7aQDMFBBk7eL2kpvNXyUosLgKaxbx0om0n+AmnXn59fVcVii0q8+982Y5QERDizjfv9SmgRy/5Z3+C+7eX740dXYtoNCmL+5vlZmOsZi7ZssLhcPXWevb8piyvkPNuJ1rkN86jvlrCunx/rhiGgvQBZ9SLqttFQA=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 17:23:14 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28%6]) with mapi id 15.20.3805.033; Fri, 5 Feb 2021
 17:23:14 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH rdma-core v2 3/3] configure: Add check for the presence of
 DRM headers
Thread-Topic: [PATCH rdma-core v2 3/3] configure: Add check for the presence
 of DRM headers
Thread-Index: AQHW+1PeGZRkK9WaZki5kJTvZ7J+3apJjTkAgAAI1oCAADRZsA==
Date: Fri, 5 Feb 2021 17:23:14 +0000
Message-ID: <MW3PR11MB4555B63081B758D1E4A8C798E5B29@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1612484954-75514-1-git-send-email-jianxin.xiong@intel.com>
 <1612484954-75514-4-git-send-email-jianxin.xiong@intel.com>
 <20210205132224.GK4718@ziepe.ca>
 <CAKMK7uG4M3vBVB_gH4gJOOATdCk9HfUWEWAP5g87mDVM78P23A@mail.gmail.com>
In-Reply-To: <CAKMK7uG4M3vBVB_gH4gJOOATdCk9HfUWEWAP5g87mDVM78P23A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16338fce-8c3e-413d-969e-08d8c9fab846
x-ms-traffictypediagnostic: CO1PR11MB4898:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB4898DC6909EBADB55F34BF2BE5B29@CO1PR11MB4898.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T+XMtE2RF3GuVwcr/HBOi/5Bp7s7DQa/CRXdNb+Wukp+rLRgNBZjk4p1eLfjZYWUVa2IaQp/HgLUm5gYxYy4XOps07QODTRlgUIt012URqleW1Iu9Menle7u5Ho8vv/K6PnE2C4McauD/SUsYC9jLjj6FFtwyvJwxXws2/n7biav/6eOM0olH1rD3XJ/w+IxLhbD47bQvs4Ru9AVivCS920F5aJV0z7cjhLEi9vpgiJKcEtzNedcyD546cioqYFxHXbWowaD8B1sPe58Mjkn2w0T23vb5JN7rz3aGinJBqc1RW5+O5VYeYwDhQeAW+Hfr8qQA8IzhYXcVkjGtZwgpLRf3AY9mjxnCnpprfQh3sxE4hRHGlQZmztPG5ozRQXHeC1Qtf/4dbc1Fn2J+AFQtV2uEJuewH5WPVM0pzOAA9dvg7fhoCgUJYPflCf4XBlJxcupR5N7VWd/Dje19swpWWH/YmvE+ojRxDhe0TRD/iDhmECmch6mPqIY0ZfK8QuNhTbYWwaCnaSsOVxzomgrX6WjDXTyWdcd25I0VqmZszPC3us+REHV5oR3lNwHnOH+/LHDAjZjTGcDcAJA5RmbMTkhinyjYrfWd5vb/72ntFzPbXG+BF+qo4atw1lWMFMgxELTYmJhXSWc0v8K2IMHzw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(346002)(366004)(396003)(39860400002)(71200400001)(8676002)(86362001)(2906002)(9686003)(55016002)(6506007)(53546011)(33656002)(186003)(7696005)(83380400001)(110136005)(54906003)(26005)(316002)(83080400002)(478600001)(52536014)(7416002)(966005)(4326008)(5660300002)(66446008)(8936002)(66476007)(64756008)(66946007)(76116006)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OXN6MjRSZ25RelBJb2orYWNWdnBvN0hJVWtwbWhrcW85VmFRTWQ2L1NCTStT?=
 =?utf-8?B?TkJvUUFMSUljR0JEdmU3WVIwejJkVHRldXp1Z3Z5SEtBdEFUdVEyM0VFSVo3?=
 =?utf-8?B?NnNLRnNaZ2JNTG91dTNCNlJBRTUyM2FOL1V6S3lSMGV2ZHRteGZSbDlKZ0hR?=
 =?utf-8?B?WVY0MEQ0WUJuOHVJaVo4amlUdVpuNEZnUUx5cTZjM0syUFpEVnEvUXJGOHRZ?=
 =?utf-8?B?M0ttbWd1MzczM2VCdTB3cjAyUEdGTkpWTEpRbjhEVlJaOHNFWVh4RURyL3Bv?=
 =?utf-8?B?ZWs3TjZndk1PN043UW83M3FSTjBhVzZjbVRBS3QvRWpTS3VqbmZTblorNW1H?=
 =?utf-8?B?RWdrQVE5Q01BTkx5TzNXZWZST2RsVlZkb1h1a25EWld2TVlwQ1phVlVUa0xk?=
 =?utf-8?B?dFhEQnZKMUJ1NmJ3WVAreEZwOEk0TFk2TUMxUWhVcCtBM2xhNkE5MUNYWHg0?=
 =?utf-8?B?eXdmZGhBQUpjajRXc3EwTkF4S3BleHNHdytvUWg3R29rbUF1VkpSRHB2WURz?=
 =?utf-8?B?czE3dWZFYW02L0ZJYjBYRWFOYmlZR2VTaFFtV3lyNnZvSGpQSFJWVFJJa0Z2?=
 =?utf-8?B?SnF6aGg3VmFnOVNrMDhubWVKOTRwRlpmQmRoNVVYMGxVWHZ5RmJIWjIxNGZW?=
 =?utf-8?B?UjFoVGZiKzhNbklucHh5U3lHSmlKZS9LdDdDd1FueHoyTyszY3pUb0JxQ1pS?=
 =?utf-8?B?WWErdnV6OVdGTHZwdlVEYzU1d0kvbXFjOGR1N0pHZWpwTzJrWVRvUklRek13?=
 =?utf-8?B?NjBzUW1sZHNaRm5NaTRhdXFINmtTRzN3ZmxkR3Y3b0xFZjFNMlNKUENrYi8y?=
 =?utf-8?B?TGxUMGRCRC9kVVhEYlE2TFF1cmp2cnh5NW9CVzZuNXpsalh6RzljR2tIc1Bi?=
 =?utf-8?B?YTc1Y1J4Q2ZBQ1B4SzhvRHVCM1ZJTEs2NHFXaGdDVndPVFBWTFpBWkJpRVVl?=
 =?utf-8?B?RVUxRVV4NUxFU0lRaG5wZXY4Vjg1UlJCcnhVS3R2eHZPUHUwRUQyVUpicUkw?=
 =?utf-8?B?cWdpSjluK0xmb0lkM0NvVFBFRHlBYnEyc2t3cmpaRkdwRjV2SVgwUnB3MFNw?=
 =?utf-8?B?ZWVrck5SU1QzQmFHcTdYNVR5VkZKRkw4U0FteEdXZC9tVEE4WE5aRGhTVXVo?=
 =?utf-8?B?SlFqK3g2L2R2MkFXSUplS3ZVTFJIdUxVZk1VdVl0QVA2WVVZTFhkR1FqaEJN?=
 =?utf-8?B?aVRJTFFvZ3c2aFp3Q3VMVUk2YWlWZ2VWL21sWkJKcHZMa1kwRlNtMDErdmpv?=
 =?utf-8?B?M3BCb1ZYMExVeUphcXZwSFRieVd5ZEtvTzdDa0lxdHlyalFZZVpEU2F2VjYx?=
 =?utf-8?B?ZkJiVi9EbFltOURpRWsreHIyUWR3djdmZE1mRzYxblRBdWdiQVRVck1UdWRS?=
 =?utf-8?B?T3UxTjU0Z0cvZGZBeEpEdFpvU3ovaDZLSWUyem1FeEpWRFd4L3RWeWtKNjZp?=
 =?utf-8?B?QTJZckNLQjc3dUhWckJ4cG9LMWhHa3FGRVQzQWtqSmN6TGRpK0RNa1FhbzVP?=
 =?utf-8?B?c1ZDMWRFL1pOSmw0VVZRL1cySzZsY1dUUHVUTmd0NTJmYVdFQjVDU3VIYWxj?=
 =?utf-8?B?KzNkUGNvYXV2R05tbFJOTm1mOUY5RUkvdzdsNDBMblc4YktNWTNvbDBRK1pr?=
 =?utf-8?B?eWUydFE5cFhSWFR0bFRjb1hKOVVBR1dub3B1cWZjeHNoMWtKWFYyWjhXY01o?=
 =?utf-8?B?ZXdqZjhjaG1mQVFxb2psZXovWUpnMXB2NXp6VGNFanFuWkl4MWhwME0xeFl0?=
 =?utf-8?Q?wQU/Dw1Mk5j59mI274=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16338fce-8c3e-413d-969e-08d8c9fab846
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 17:23:14.2709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h3fewijp3/mpeJddqCQQnBObH/K60E5S2EJs8ZBCLdvzPrFiEe6nMXd+nve0VEOfOBwe/kf6UB6LkcztEOiOXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 Edward Srouji <edwards@nvidia.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, Ali
 Alnubani <alialnu@nvidia.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Friday, February 05, 2021 5:54 AM
> To: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; Yishai Hadas <yishaih@nvidia.com>; Leon Romanovsky <leon@kernel.org>; linux-rdma <linux-
> rdma@vger.kernel.org>; John Hubbard <jhubbard@nvidia.com>; Edward Srouji <edwards@nvidia.com>; Emil Velikov
> <emil.l.velikov@gmail.com>; Gal Pressman <galpress@amazon.com>; dri-devel <dri-devel@lists.freedesktop.org>; Doug Ledford
> <dledford@redhat.com>; Ali Alnubani <alialnu@nvidia.com>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig
> <christian.koenig@amd.com>
> Subject: Re: [PATCH rdma-core v2 3/3] configure: Add check for the presence of DRM headers
> 
> On Fri, Feb 5, 2021 at 2:22 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Thu, Feb 04, 2021 at 04:29:14PM -0800, Jianxin Xiong wrote:
> > > Compilation of pyverbs/dmabuf_alloc.c depends on a few DRM headers
> > > that are installed by either the kernel-header or the libdrm package.
> > > The installation is optional and the location is not unique.
> > >
> > > Check the presence of the headers at both the standard locations and
> > > any location defined by custom libdrm installation. If the headers
> > > are missing, the dmabuf allocation routines are replaced by stubs
> > > that return suitable error to allow the related tests to skip.
> > >
> > > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> > >  CMakeLists.txt              | 15 +++++++++++++++
> > >  pyverbs/CMakeLists.txt      | 14 ++++++++++++--
> > >  pyverbs/dmabuf_alloc.c      |  8 ++++----
> > >  pyverbs/dmabuf_alloc_stub.c | 39
> > > +++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 70 insertions(+), 6 deletions(-)  create mode
> > > 100644 pyverbs/dmabuf_alloc_stub.c
> > >
> > > diff --git a/CMakeLists.txt b/CMakeLists.txt index 4113423..95aec11
> > > 100644
> > > +++ b/CMakeLists.txt
> > > @@ -515,6 +515,21 @@ find_package(Systemd)
> > >  include_directories(${SYSTEMD_INCLUDE_DIRS})
> > >  RDMA_DoFixup("${SYSTEMD_FOUND}" "systemd/sd-daemon.h")
> > >
> > > +# drm headers
> > > +
> > > +# First check the standard locations. The headers could have been
> > > +installed # by either the kernle-headers package or the libdrm package.
> > > +find_path(DRM_INCLUDE_DIRS "drm.h" PATH_SUFFIXES "drm" "libdrm")
> >
> > Is there a reason not to just always call pkg_check_modules?
> 
> Note that the gpu-specific libraries are split out, so I'd also check for those just to be sure - I don't know whether all distros package the
> uapi headers consistently in libdrm or sometimes also in one of the libdrm-$vendor packages.

The headers come from the libdrm-devel package, which present itself as "libdrm" 
under pkg-config. The gpu-specific packages only include the libraries, not the headers.

The kernel-headers packages doesn't have pkg-config info and can't be checked via pkg_check_modules().

One change I can make here is to use find_path() only for the headers installed by the
kernel-headers package (the "drm" path). The "libdrm" path is covered by the pkg_check_modules() check anyway.

> -Daniel
> 
> >
> > > +# Then check custom installation of libdrm if (NOT
> > > +DRM_INCLUDE_DIRS)
> > > +  pkg_check_modules(DRM libdrm)
> > > +endif()
> > > +
> > > +if (DRM_INCLUDE_DIRS)
> > > +  include_directories(${DRM_INCLUDE_DIRS})
> > > +endif()
> >
> > This needs a hunk at the end:
> >
> > if (NOT DRM_INCLUDE_DIRS)
> >   message(STATUS " DMABUF NOT supported (disabling some tests)")
> > endif()

Thanks, missed that.

> >
> > >  #-------------------------
> > >  # Apply fixups
> > >
> > > diff --git a/pyverbs/CMakeLists.txt b/pyverbs/CMakeLists.txt index
> > > 6fd7625..922253f 100644
> > > +++ b/pyverbs/CMakeLists.txt
> > > @@ -13,8 +13,6 @@ rdma_cython_module(pyverbs ""
> > >    cmid.pyx
> > >    cq.pyx
> > >    device.pyx
> > > -  dmabuf.pyx
> > > -  dmabuf_alloc.c
> > >    enums.pyx
> > >    mem_alloc.pyx
> > >    mr.pyx
> > > @@ -25,6 +23,18 @@ rdma_cython_module(pyverbs ""
> > >    xrcd.pyx
> > >  )
> > >
> > > +if (DRM_INCLUDE_DIRS)
> > > +rdma_cython_module(pyverbs ""
> > > +  dmabuf.pyx
> > > +  dmabuf_alloc.c
> > > +)
> > > +else()
> > > +rdma_cython_module(pyverbs ""
> > > +  dmabuf.pyx
> > > +  dmabuf_alloc_stub.c
> > > +)
> > > +endif()
> >
> > Like this:
> >
> > if (DRM_INCLUDE_DIRS)
> >   set(DMABUF_ALLOC dmabuf_alloc.c)
> > else()
> >   set(DMABUF_ALLOC dmabuf_alloc_stbub.c)
> > endif()
> > rdma_cython_module(pyverbs ""
> >   dmabuf.pyx
> >   $(DMABUF_ALLOC)
> > )

Sure, will change.

> >
> > Jason
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
