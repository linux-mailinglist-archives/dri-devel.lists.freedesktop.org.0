Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3367D56B36C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 09:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF1710E9FF;
	Fri,  8 Jul 2022 07:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B377910E5CE;
 Fri,  8 Jul 2022 07:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657265091; x=1688801091;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=YUqGbP7+lz3NQpRl9b8aiZhY5n8rsZTXDs3Mn/Xp9Bw=;
 b=castl/+hG1loJIknvxUHPseoTh6nbo7h0dgriw9/2iZza8PFrVc82wFn
 /qkCjrNRI4tpCCGmbfsPURsNeheS+mBr3Q2IG32I3agybPhr7rbZXcbo8
 WPct8U0hIOnJBBB9xMz3ctUfsvO0V/NKB+2XY0o178O1e/Xe6pKp6Lq1Z
 83C3R+qFL77aewYLjeWcqw837doAziaEXQX10zzyCkyabqtlFJYn+CS/w
 hy96yuSr4WlcSdSFPpsyvhOWmnviEVYn8UJy0yHmXVY6o09QAmwX6OMD5
 r5YPce0JlAR4wh8EzHui+UqjunhlukY8ODYK38pREPd8K6EOz3Hr5qwn2 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="348201828"
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; 
 d="log'?scan'208";a="348201828"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 00:24:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; 
 d="log'?scan'208";a="594023717"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 08 Jul 2022 00:24:50 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 00:24:50 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 00:24:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 00:24:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 00:24:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtzUCoHljYlRxOj1ZziPrvMFYCWhara388rL24Q72HPbXGLquaVW08LQBnWt5JHQCG7tJbbP3NUhpIrcetCgZhI+qv0yOYuwumzk/bOWG771zf4fSEzFxT/qgnO0OnyziVJ3eexLfNclhngBW31ePW7S1WFuREMRCLMdnZHaM1Sm1KJruZAV4eQ4Zc/2VGCj/BFc90RfjDZN1GwVNJ5R2OmPsCilw5coauC3KMuZYMak8RVFcQwDVq5yS/RRZZfPILIpZnJocTo9Wg83zFm28gc2cZ7X29PD7Ke1PmpNQoyMLrcwEpcXvbwSHd2BqAy1FnfQgKZXek/cB5yTHWKjAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCdkdAFDKF2NN/R/O52q9lFlOei3U9vyse+n4ZeMHp8=;
 b=fpQZE6D9SGdH9WYm/eE1KgmcqVz7egjxMEPIgcBArRPkNKK3GcxygW4kQlf7fJK5iWVcVRcuOaNdKjLggTpOshIpS2RtOXG7eSjZBe1dRVTfXf2a3q9q9Oyzvsc8hAbymtj6O14zV2LmoEnbydSJsMEibMZxlMb9Sruj6crOl1QGn8iPrEO4a2BKGd4hK9jfm1ZNVZYyASnEIVANeBv3NwMJptAJhVcP5Ty+2M4+xaDvE+zGeOul4IldXjWgMuc8vvLOx5pqz31kktlhTtwNVd5U1VPw+Zadfx6lW0C8S7uvAS8wPPeIjHqNkCW+BeOAB70wImwzueu9HcPhUA4QUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB5873.namprd11.prod.outlook.com (2603:10b6:806:228::11)
 by DM6PR11MB3979.namprd11.prod.outlook.com (2603:10b6:5:197::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Fri, 8 Jul
 2022 07:24:30 +0000
Received: from SA1PR11MB5873.namprd11.prod.outlook.com
 ([fe80::2db6:aaf7:225c:9065]) by SA1PR11MB5873.namprd11.prod.outlook.com
 ([fe80::2db6:aaf7:225c:9065%6]) with mapi id 15.20.5395.021; Fri, 8 Jul 2022
 07:24:30 +0000
From: "Xu, Terrence" <terrence.xu@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "Tian, Kevin" <kevin.tian@intel.com>
Subject: RE: [RFT][PATCH v2 0/9] Update vfio_pin/unpin_pages API
Thread-Topic: [RFT][PATCH v2 0/9] Update vfio_pin/unpin_pages API
Thread-Index: AQHYkQGY1tLIdr6rZUStrRfBqeq2ba1ybgSAgAACgYCAAUYIsA==
Date: Fri, 8 Jul 2022 07:24:30 +0000
Message-ID: <SA1PR11MB587341B9F173B87A8459CC7FF0829@SA1PR11MB5873.namprd11.prod.outlook.com>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <BN9PR11MB52768822A11C158214C6A6A48C839@BN9PR11MB5276.namprd11.prod.outlook.com>
 <YsZ6h/XGX1RpXQQL@Asurada-Nvidia>
In-Reply-To: <YsZ6h/XGX1RpXQQL@Asurada-Nvidia>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c006f39-daa6-49c5-4be3-08da60b2e607
x-ms-traffictypediagnostic: DM6PR11MB3979:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZFxDM5etI2TOoPCi5kEdgPnbk9busgSTtZOi4lgBw8Y3RJKSWWpkWVuGLchexjZ5XH0a2efRdPTcdBUuAewvv8r+rBwFOa7o/7JqhSwhLFmrf0C+upvHC3MUv2TYnq7Pewji3njST8ddSmiyHj4MAaHKaP7askU4xu+JqppyF09GZqJuRujB5WaIrwBB/HHac4FtNCf4bGmBENmZP5fYCtnOPry6pvxF8ZBSfS50pNvd9ZMuJ3tp4coU4Q5jCDPzSZoofVzwpcdX3GxMElII2t7jVlnR06L16Ha04eyhgqMogNRAUJyKZCthSxsGTzJdEGGD37hpdY1oPTSwuNRjTksvX4ZKHWV6AGKyCx18eUd0/XSAlXCFKi1Q9JCdms8FWXFZUezC9LyLKiXuo7iheiDIpPs6vex24Z1ft9MXAPGhMzS10Dm5CHhX2eg0vcMW2SFz6zXBASG2KYcx0J2X+MELRr29RWlYQs7JCr/sPr0IkixsiV192VW6zVQmJvHVwhz2y92pTBITiWW2/qJr/IU1GrveHadmyALRsQwYYdWlb8DX479J5RvKznajdJNUtJxy6Y3b56R2D2cM1nbkkD38d3zoqKhk17jY7WoIOB/Oe0X3jN/+geQcUfSxcN4q5i87SlPkeAh2QHlRoMPuZiptGn5Zbk77y2lmAO6MgQ6SNMoa9Oiju5iPy9/mmN+xFhtNsGGo1fv490QjJEG436CsPs2IgvWnOauP2ezl6dFIAthQ0XcWSalHiNWZf8FlsQU/npB0k3u4mfT87BpMokoAfakfihgIlmQeAAnlobPOq0Hr7lEFNGpz1fo4M7b585PglwdW6zy0f9/Y899tJUmkTXRhYhH4FiDUKabIYcg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5873.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(39860400002)(376002)(346002)(396003)(66446008)(54906003)(71200400001)(6506007)(83380400001)(41300700001)(110136005)(8676002)(55016003)(4326008)(64756008)(316002)(66476007)(76116006)(66556008)(8936002)(186003)(2906002)(52536014)(38100700002)(966005)(7416002)(99936003)(38070700005)(7696005)(9686003)(7406005)(86362001)(15650500001)(82960400001)(26005)(66946007)(4744005)(6636002)(5660300002)(33656002)(122000001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hh6fXNRYhpSejt+PfY86kol50BxzbeSIpBLqKmqSCDbVB08+b7YiZlH2nb7q?=
 =?us-ascii?Q?fRrxmDHR+rPJuFL0CtTemG64UFquZRQBd5ej7qepRHk/41O4arIUQ8JDG5bZ?=
 =?us-ascii?Q?3EnWFGsoWOGrT9SkEEvdpLtFfFP83b/H+VlpOb9nirSAzLZhyXg59CLPrPxr?=
 =?us-ascii?Q?cu/dD8NH6UMRaEfsas5BOXr/XZuMAVspvS4VmLk2/nwm8tk2wiVPak5VcP4p?=
 =?us-ascii?Q?QN6Cp4IRQIiPBhHUtwJqddhvAeT/zfJSXwB4oBvtAZR8oc/rGSRaLyAJkGMi?=
 =?us-ascii?Q?CutqDL3+jQ2seBl0zQw/+yGJjU3KiNSY6OH2ff3OS4/zT9R/494jabeWMbHD?=
 =?us-ascii?Q?HL3jGUXifHXEeDQoXHFhT3EK6Z33uny9oq+/nRlNcoBbNO4/W4SlO7O66KH4?=
 =?us-ascii?Q?sv2pJL8dqenwMPc4DQY2UpD/UgVkW8HPWU1RMSdYKbmwfENhmUYp6LqKvMph?=
 =?us-ascii?Q?hGmssDdHAYA0Q97BcMouiU2bAgOyShX+2sQNuX1m+s9HkNTwKoQzqrTACkKt?=
 =?us-ascii?Q?af2IVlrkN+aTXy6OA2w4adj8t3HGg3EJkzYA6rhCdhpwONfMwVVhG+0Mhpne?=
 =?us-ascii?Q?NB+yVGrmTiVKqo3TaS0cDAd/O6VLXVQPgDIUVRyJ/EFhjoAirnGYYIS0Wj3L?=
 =?us-ascii?Q?BzEal+0UGUXLuDR3iGsFFYGPR1yOliDkeWb6yrcUEy+zSUV03x9rpqswEtpu?=
 =?us-ascii?Q?PQ+uTjmJHaoJUMKFu4fX8DVGpAXWab88xn+9XTszoJ42qAIGOcCiAsOSrXTi?=
 =?us-ascii?Q?SzBXLC0CIK64imvhbfMd374oVWcbHnSqO5l25EDA0cGPYAXOzc0uDcWbGAyO?=
 =?us-ascii?Q?5dFWMmVOIqM3POqVRY35gtoYs8S+TKpsadUeZzPEN+4GkkHiWjo1n507eIIn?=
 =?us-ascii?Q?wDp4hsisT6w6zAmwzBclxufuquV3c1I92pzsphiLV4rky5UiNGK7ZoqFiUsp?=
 =?us-ascii?Q?QVozQmziG3v8JOj7CWl54tffWZQtKNWX9HN4Yb0dUJZblipYugWjgrYXDzt+?=
 =?us-ascii?Q?NTsQmnz4kxcrLUeX9rec6iCObSX/NobFLUJVWrE0qLNzZ/OHQwJQ8R9jEcKl?=
 =?us-ascii?Q?Nfh9o801EL4F6Dg8ri+MfGrWDjS31MzIjVpS6lTW/iyNHiX2QmrrUdrPvuMX?=
 =?us-ascii?Q?+QUz56B9fUCEySBg8vHUf87biZ/aZp7VLPUbsGCScFftwDGkRQgqefCv6OoM?=
 =?us-ascii?Q?/Lvtt/98dfp4IR/Z8zgGNWBltX9hOZH+G0+Y04+eNTRpXrY2Lepx73Azrh4T?=
 =?us-ascii?Q?l9qAhee2IDfM+Ky6ozseGWBJyXlS9oshjoV0bwP+I5Gw56cqxEedfro5v5ul?=
 =?us-ascii?Q?01MTmzKv/DMMJO1YBSS20r9r2803GkFzcB8J+vCnj2mPGOtBB5wcUOwh93Wq?=
 =?us-ascii?Q?FPcoloC/PQpBPSaFk8NSt4faEgensC7xAvmt06L5zMXiUv1kQOKsOQOAqRpf?=
 =?us-ascii?Q?3rlQ0OnMUncr0ftavVB9aEgh4zunNPqyjJgos2EHMyKcZ8KSsUtm6EiYFhXQ?=
 =?us-ascii?Q?3X7AEp0tS/dS7jFshGDtVM8i5iC4qpTCA8b19IlDvjYKPb8QMvAEUyUXsinD?=
 =?us-ascii?Q?MefR3q2MLfInCaQqPMytOpnhOqHg3Qf0jcMrwBd1?=
Content-Type: multipart/mixed;
 boundary="_002_SA1PR11MB587341B9F173B87A8459CC7FF0829SA1PR11MB5873namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5873.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c006f39-daa6-49c5-4be3-08da60b2e607
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 07:24:30.5404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lMwEOPdXbCdCVQUrMYcVK/uOYuexnM2o3fVS7EM+yAfGRVFtDnpkefAhO0M4Hbkcp8LiPBRqwRua2VyoTJOHNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3979
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
 "airlied@linux.ie" <airlied@linux.ie>,
 "jchrist@linux.ibm.com" <jchrist@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "vneethv@linux.ibm.com" <vneethv@linux.ibm.com>,
 "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "hch@infradead.org" <hch@infradead.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "Wang, 
 Zhi A" <zhi.a.wang@intel.com>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "freude@linux.ibm.com" <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "svens@linux.ibm.com" <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_002_SA1PR11MB587341B9F173B87A8459CC7FF0829SA1PR11MB5873namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: intel-gvt-dev <intel-gvt-dev-bounces@lists.freedesktop.org> On Beha=
lf Of
> On Thu, Jul 07, 2022 at 06:08:45AM +0000, Tian, Kevin wrote:
>=20
> > > Request for testing: I only did build for s390 and i915 code, so
> > > it'd be nice to have people who have environment to run sanity accord=
ingly.
> > >
> >
> > +Terrence who is testing it for i915 now...
>=20
> Hi Terrence, would it be possible for you to pull v3 to test on?
> https://github.com/nicolinc/iommufd/commits/dev/vfio_pin_pages-v3
>=20
> They are basically same but there's a new DIV_ROUND_UP change, which
> shouldn't result in any functional difference, IMHO. If
> v3 passes, I can simply add your Tested-by when I respin it.

Hi Nicolin, I already completed KVMGT key feature testing based on your v3 =
repo, VM booted up successfully and run smoothly, but there is a call trace=
 during each time VM booting up, as the attachment.


--_002_SA1PR11MB587341B9F173B87A8459CC7FF0829SA1PR11MB5873namp_
Content-Type: application/octet-stream; name="call_trace.log"
Content-Description: call_trace.log
Content-Disposition: attachment; filename="call_trace.log"; size=4287;
	creation-date="Fri, 08 Jul 2022 01:45:29 GMT";
	modification-date="Fri, 08 Jul 2022 07:24:29 GMT"
Content-Transfer-Encoding: base64

WyA0Mzc5Ljg4MTc3MF0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tClsgNDM3
OS44ODE3NzZdIFdBUk5JTkc6IENQVTogMSBQSUQ6IDQwNDIgYXQgZHJpdmVycy92ZmlvL3ZmaW9f
aW9tbXVfdHlwZTEuYzoxMTY3IHZmaW9fcmVtb3ZlX2RtYSsweGIzLzB4YzAgW3ZmaW9faW9tbXVf
dHlwZTFdClsgNDM3OS44ODE4MThdIE1vZHVsZXMgbGlua2VkIGluOiBiaW5mbXRfbWlzYyBuZm5l
dGxpbmsgYnJpZGdlIHN0cCBsbGMgcmZjb21tIGNtYWMgYWxnaWZfaGFzaCBhbGdpZl9za2NpcGhl
ciBhZl9hbGcgYm5lcCBzbmRfaGRhX2NvZGVjX2hkbWkgc25kX2hkYV9jb2RlY19yZWFsdGVrIHNu
ZF9oZGFfY29kZWNfZ2VuZXJpYyBsZWR0cmlnX2F1ZGlvIHNuZF9oZGFfaW50ZWwgc25kX2ludGVs
X2RzcGNmZyBzbmRfaGRhX2NvZGVjIHNuZF9oZGFfY29yZSBzbmRfaHdkZXAgc25kX3BjbSBpbnRl
bF9yYXBsX21zciBpbnRlbF9yYXBsX2NvbW1vbiB4ODZfcGtnX3RlbXBfdGhlcm1hbCBpbnRlbF9w
b3dlcmNsYW1wIGNvcmV0ZW1wIHNuZF9zZXFfbWlkaSBzbmRfc2VxX21pZGlfZXZlbnQgc25kX3Jh
d21pZGkga3ZtX2ludGVsIGJ0dXNiIHNuZF9zZXEgYnRydGwgcmFwbCBidGJjbSBidGludGVsIHNu
ZF9zZXFfZGV2aWNlIGludGVsX2NzdGF0ZSBpbnB1dF9sZWRzIHNuZF90aW1lciBibHVldG9vdGgg
c2VyaW9fcmF3IG1laV9tZSBlY2RoX2dlbmVyaWMgbXhtX3dtaSBlY2Mgc25kIHNvdW5kY29yZSBt
ZWkgbWFjX2hpZCBhY3BpX3BhZCBzY2hfZnFfY29kZWwga3ZtZ3QgbWRldiB2ZmlvX2lvbW11X3R5
cGUxIHZmaW8ga3ZtIGlycWJ5cGFzcyBwYXJwb3J0X3BjIHBwZGV2IGxwIHBhcnBvcnQgbmZzZCBh
dXRoX3JwY2dzcyBuZnNfYWNsIGxvY2tkIGdyYWNlIHN1bnJwYyBpcF90YWJsZXMgeF90YWJsZXMg
YXV0b2ZzNCBidHJmcyBibGFrZTJiX2dlbmVyaWMgenN0ZF9jb21wcmVzcyByYWlkMTAgcmFpZDQ1
NiBhc3luY19yYWlkNl9yZWNvdiBhc3luY19tZW1jcHkgYXN5bmNfcHEgYXN5bmNfeG9yIGFzeW5j
X3R4IHhvciByYWlkNl9wcSBsaWJjcmMzMmMgcmFpZDEgcmFpZDAgbXVsdGlwYXRoIGxpbmVhciBk
bV9taXJyb3IgZG1fcmVnaW9uX2hhc2ggZG1fbG9nIGk5MTUgaTJjX2FsZ29fYml0IGNlYyByY19j
b3JlIGRybV9idWRkeSB0dG0gZHJtX2Rpc3BsYXlfaGVscGVyClsgNDM3OS44ODIwOTJdICBkcm1f
a21zX2hlbHBlciBjcmN0MTBkaWZfcGNsbXVsIHN5c2NvcHlhcmVhIHN5c2ZpbGxyZWN0IGNyYzMy
X3BjbG11bCBzeXNpbWdibHQgZ2hhc2hfY2xtdWxuaV9pbnRlbCBmYl9zeXNfZm9wcyBhZXNuaV9p
bnRlbCBjcnlwdG9fc2ltZCBlMTAwMGUgY3J5cHRkIGkyY19pODAxIHBzbW91c2UgcHRwIGRybSBp
MmNfc21idXMgYWhjaSBwcHNfY29yZSBsaWJhaGNpIGhpZF9nZW5lcmljIHdtaSB2aWRlbyB1c2Jo
aWQgaGlkClsgNDM3OS44ODIxNzNdIENQVTogMSBQSUQ6IDQwNDIgQ29tbTogcWVtdS1zeXN0ZW0t
eDg2IFRhaW50ZWQ6IEcgICAgICAgIFcgICAgICAgICA1LjE5LjAtcmMxLW5leHQtMjAyMjA2MDYr
ICMxClsgNDM3OS44ODIxODddIEhhcmR3YXJlIG5hbWU6IFN1cGVybWljcm8gQzdaMzcwLUNHLUlX
L0M3WjM3MC1DRy1JVywgQklPUyAxLjEgMDIvMDgvMjAxOApbIDQzNzkuODgyMTk0XSBSSVA6IDAw
MTA6dmZpb19yZW1vdmVfZG1hKzB4YjMvMHhjMCBbdmZpb19pb21tdV90eXBlMV0KWyA0Mzc5Ljg4
MjIxOF0gQ29kZTogZDUgNDggODkgZGYgZTggZWUgMjggNjcgZDUgNDEgODMgNDQgMjQgNzggMDEg
NWIgNDEgNWMgNWQgYzMgZTggOGUgNTcgM2YgZDUgZWIgYjMgYmUgMDMgMDAgMDAgMDAgNDggODkg
ZDcgZTggZGYgMTEgOTQgZDUgZWIgYTQgPDBmPiAwYiBlOSA2NSBmZiBmZiBmZiA2NiAwZiAxZiA0
NCAwMCAwMCAwZiAxZiA0NCAwMCAwMCA1NSA0OCA4OSBlNQpbIDQzNzkuODgyMjMwXSBSU1A6IDAw
MTg6ZmZmZmFkMDM4MzVhN2JjOCBFRkxBR1M6IDAwMDEwMjgyClsgNDM3OS44ODIyNDJdIFJBWDog
ZmZmZjhkZjIxM2ZhMDM4MCBSQlg6IGZmZmY4ZGYxZDJkMjgwNjAgUkNYOiAwMDAwMDAwMDgwMmEw
MDA5ClsgNDM3OS44ODIyNTFdIFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6IGZmZmY4ZGYxZDJk
MjgwNjAgUkRJOiBmZmZmOGRmMmMyY2UxMTgwClsgNDM3OS44ODIyNTldIFJCUDogZmZmZmFkMDM4
MzVhN2JkOCBSMDg6IGZmZmY4ZGYxZDJkMjgzMDAgUjA5OiAwMDAwMDAwMDgwMmEwMDA5ClsgNDM3
OS44ODIyNjddIFIxMDogZmZmZjhkZjIxM2QxZGMwMCBSMTE6IGZmZmZmZmZmZmZmZmZmZmUgUjEy
OiBmZmZmOGRmMmMyY2UxMTgwClsgNDM3OS44ODIyNzVdIFIxMzogZmZmZjhkZjFjODdjZjkwMCBS
MTQ6IGZmZmY4ZGYyYzJjZTExYTAgUjE1OiBmZmZmOGRmMWM3MWE5OTAwClsgNDM3OS44ODIyODRd
IEZTOiAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmOGRmOTFhYTQwMDAwKDAwMDApIGtu
bEdTOjAwMDAwMDAwMDAwMDAwMDAKWyA0Mzc5Ljg4MjI5NF0gQ1M6ICAwMDEwIERTOiAwMDAwIEVT
OiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwpbIDQzNzkuODgyMzAyXSBDUjI6IDAwMDA3ZmJm
NWM5NTAyOTAgQ1IzOiAwMDAwMDAwMmI1ODg2MDAzIENSNDogMDAwMDAwMDAwMDM3MjZlMApbIDQz
NzkuODgyMzExXSBDYWxsIFRyYWNlOgpbIDQzNzkuODgyMzE2XSAgPFRBU0s+ClsgNDM3OS44ODIz
MjVdICB2ZmlvX2lvbW11X3VubWFwX3VucGluX2FsbCsweDIwLzB4NDAgW3ZmaW9faW9tbXVfdHlw
ZTFdClsgNDM3OS44ODIzNDhdICB2ZmlvX2lvbW11X3R5cGUxX2RldGFjaF9ncm91cCsweDEyMy8w
eDU2MCBbdmZpb19pb21tdV90eXBlMV0KWyA0Mzc5Ljg4MjM2OV0gID8gc2VjdXJpdHlfZmlsZV9m
cmVlKzB4NTQvMHg2MApbIDQzNzkuODgyMzg4XSAgX192ZmlvX2dyb3VwX3Vuc2V0X2NvbnRhaW5l
cisweDRjLzB4MWIwIFt2ZmlvXQpbIDQzNzkuODgyNDE1XSAgdmZpb19ncm91cF9mb3BzX3JlbGVh
c2UrMHg1Mi8weDgwIFt2ZmlvXQpbIDQzNzkuODgyNDM4XSAgX19mcHV0KzB4OTkvMHgyNjAKWyA0
Mzc5Ljg4MjQ1MV0gIF9fX19mcHV0KzB4ZS8weDEwClsgNDM3OS44ODI0NjBdICB0YXNrX3dvcmtf
cnVuKzB4NmMvMHhhMApbIDQzNzkuODgyNDc1XSAgZG9fZXhpdCsweDM1NS8weGI3MApbIDQzNzku
ODgyNDkyXSAgZG9fZ3JvdXBfZXhpdCsweDM1LzB4YTAKWyA0Mzc5Ljg4MjUwNl0gIGdldF9zaWdu
YWwrMHg5NDYvMHg5NTAKWyA0Mzc5Ljg4MjUxOV0gIGFyY2hfZG9fc2lnbmFsX29yX3Jlc3RhcnQr
MHgzNy8weDc3MApbIDQzNzkuODgyNTM2XSAgPyBkb19mdXRleCsweDExOC8weDFhMApbIDQzNzku
ODgyNTU0XSAgZXhpdF90b191c2VyX21vZGVfcHJlcGFyZSsweDliLzB4MTgwClsgNDM3OS44ODI1
NjldICBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKzB4MjkvMHg0MApbIDQzNzkuODgyNTgyXSAg
ZG9fc3lzY2FsbF82NCsweDQ2LzB4ODAKWyA0Mzc5Ljg4MjU5N10gIGVudHJ5X1NZU0NBTExfNjRf
YWZ0ZXJfaHdmcmFtZSsweDQ2LzB4YjAKWyA0Mzc5Ljg4MjYxMF0gUklQOiAwMDMzOjB4N2Y5ZmZj
Yjk3Mzc2ClsgNDM3OS44ODI2MjFdIENvZGU6IFVuYWJsZSB0byBhY2Nlc3Mgb3Bjb2RlIGJ5dGVz
IGF0IFJJUCAweDdmOWZmY2I5NzM0Yy4KWyA0Mzc5Ljg4MjYyN10gUlNQOiAwMDJiOjAwMDA3Zjlm
ZjlkMjc1YjAgRUZMQUdTOiAwMDAwMDI4MiBPUklHX1JBWDogMDAwMDAwMDAwMDAwMDBjYQpbIDQz
NzkuODgyNjM5XSBSQVg6IGZmZmZmZmZmZmZmZmZlMDAgUkJYOiAwMDAwMDAwMDAwMDAwMDAwIFJD
WDogMDAwMDdmOWZmY2I5NzM3NgpbIDQzNzkuODgyNjQ3XSBSRFg6IDAwMDAwMDAwMDAwMDAwMDAg
UlNJOiAwMDAwMDAwMDAwMDAwMDgwIFJESTogMDAwMDU1NjdlMTdhOGYyYwpbIDQzNzkuODgyNjU1
XSBSQlA6IDAwMDA1NTY3ZTE3YThmMDAgUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogMDAwMDAw
MDAwMDAwMDAwNApbIDQzNzkuODgyNjYyXSBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAwMDAw
MDAwMDAwMDAwMjgyIFIxMjogMDAwMDU1NjdlMTdhOGYyNApbIDQzNzkuODgyNjY5XSBSMTM6IDAw
MDA1NTY3ZGY4ZjUyMDAgUjE0OiAwMDAwN2Y5ZmY5ZDI3NWYwIFIxNTogMDAwMDU1NjdlMTdhOGYy
YwpbIDQzNzkuODgyNjg2XSAgPC9UQVNLPgpbIDQzNzkuODgyNjkyXSAtLS1bIGVuZCB0cmFjZSAw
MDAwMDAwMDAwMDAwMDAwIF0tLS0KWyA0NDIzLjgyNDA1N10gZGV2aWNlIHRhcDEgbGVmdCBwcm9t
aXNjdW91cyBtb2RlClsgNDQyMy44MjQwODVdIHN3MDogcG9ydCAzKHRhcDEpIGVudGVyZWQgZGlz
YWJsZWQgc3RhdGUK

--_002_SA1PR11MB587341B9F173B87A8459CC7FF0829SA1PR11MB5873namp_--
