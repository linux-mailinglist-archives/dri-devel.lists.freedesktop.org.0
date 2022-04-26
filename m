Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A867950F505
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 10:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E3410E5CA;
	Tue, 26 Apr 2022 08:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A662D10E5CA;
 Tue, 26 Apr 2022 08:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650962281; x=1682498281;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=7MPbh3R207hOTAtgxS4en4sL8d7hFLPj84StDsAjo2c=;
 b=BH32DMsYJhUV+eLDl8coVIUkQxeDinVEXrmYKij++yjGgqQQ0xPLiGhc
 LiNKKqZJo2G2zFQeMZfqbzo+Q1UlZf0C+95KP+NhVh062HgXeylnGbEnG
 0Uv1n/SjIF51VDIKFwOLcsJNv/AoXUWhl5hEJMGJwe+53JR3kJSBDOz3t
 VWxqgDxLJYN0N/sa7ngomZZi3OGzgWpJ8OmQ0TVksHw8/W3oc2sN261Wa
 vS6vtpwFedakeBnSXwE/yjyDK7hViIxWj/Powgy6rWzWoKK0ZaGcN0UOC
 21kSRVMzWG4CsKyaWufiu5RXGrJ+VZH5qEesJOIAv/31npnsK/renK60Y w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="290642357"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="290642357"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 01:37:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="538426928"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga002.jf.intel.com with ESMTP; 26 Apr 2022 01:37:58 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 01:37:58 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 01:37:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 01:37:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 01:37:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixTKwtXEu21aDshYYghlz3VdCQjxxgzRgeUOssheYmvhAwhEmveYzg9x7kPAw8CdpXNpzPP4r53qEaTPjNc55Rwvtx6DTMxnxyiB1JSN7W9ZaDYIGS5uik0aY0AFvbRVLZNn3/jxGP62z4Ka2LVSK2+21bwKX7qRlp8rqKUqU1ycxIembQJmnO0X5B6wh6ibUx1Ik8qRbNiASj2lCzqw6TKVcXSp/I3ZshgovHivhAN4dL9LBQq/zFbu903Z1HyWW5EMdYU+67puW5qPwbIXTVUk6ceLH/MWmYCZbXd+0TOIswWdElWGO7/9dH/u+BtaQbGvV0tbRZiccRcyct6G4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7gQEhB6sYpNG+h8gRThZvoATjQofvYOMH1Jb5Ssxac=;
 b=lnhWSdg4B9f0t3K+ptYagDeMfu3hwpRt7nBAFz+GNh3WPXm4Oj9kCPfRlYCcp5JSFdMbyrYSwGYC0Ac0kvtzySVejxYT3dypNx++yMnOZqUcPlt+oNB/4k32LXJRKKSQs3ZH50nQAF7CAufXN1R4nyrGkTA2hJrt0X6N//WyRkVqeGxDgmAVRGKdGX2srPN29syMZcGUTNLgBbHPVd0nCPdwaXpM4EqpBH1eJVIllIYNkgBBBhFCmL2UnAG3vHBdz7HEtax3upx8QlDDVoSrrOaw3qhFsfwZvKVESXUnEyQ/lVgXQoZ8x5LLxYBCQPO03nqc7MwLF3Fa9OtSJSXOUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 BYAPR11MB3622.namprd11.prod.outlook.com (2603:10b6:a03:fe::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Tue, 26 Apr 2022 08:37:56 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 08:37:56 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: [PULL v2] gvt-next
Thread-Topic: [PULL v2] gvt-next
Thread-Index: AQHYWUjt+5kTXeJSAUe3EdP3wW4wYQ==
Date: Tue, 26 Apr 2022 08:37:56 +0000
Message-ID: <c2ce1554-a025-7a9f-6337-6e6f847fecb6@intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5565b3ee-88d2-434b-d7bf-08da27600fe6
x-ms-traffictypediagnostic: BYAPR11MB3622:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BYAPR11MB3622F380E27BC8D35AE8F145CAFB9@BYAPR11MB3622.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KF+MmTP0Itz1tDW1TfKXM/NIlzKd619NCBUceXtbsv4g7o0I9vufwsu7hksvvWexJ2QH7APa+c6aCsNhfctJePjGfZ1DSmUc2HkGvmcgNqY1/L0GqIucbByHn1Qw6+nEVy2B7mWmY1KHpDE48F8bCRPR+ZvylOtP+TFBXsgFoJS23waOqaN0xniArt++5disNGhelVOQSslgtUinIzhI52e/A1MUvD3iBgof7yuuXxN4FodPuousnluqx+orDfRqG6av/KmnvvTm4hNOjFW6oYIXAb2LfwDTRIXI+ITSJ78q7NBJ08Ii5dqUyJKS/N8nGIUxm23O7xPYzPwmPAWKWbPwVYfmAxg2z9ZgMN1uYkRF4EbLHcXdAmqfK3geRloNpTTzzrkw9PDOicBZt6Y1zb4ENfxj6+Mfmf9TFUdn03lgW3cu1TTnx6Gy4nNrVstSHO3b5te0ZlYLR5gCPJykSpfeajbCuhEDii5iOHOKNYDoVxBvnuMyq53ciZgRLdkPSsVG5SP6fbLRskQWQ5C0lnnA7Zll0c3BWojJIS3WAoiVyPsKa8Rr1DRBimGmq2+ZdUWJOc2NrWZhNT7RUrq2N88s6VkN+uGIhsowIQbDNqOD53f+v+3IFCMK/eGk89LV0v9CXNhwRMMEGsPlnxnnDcWzCrqTe9LEo9lAOLI5FIZhlgC6npqZEqSMOXZIjHDjJnjBij/g/6ETu0qeSL1+WELJtO2/b9oEf1Sdvwc5js7E6+yflNKAzCjUDJqhHDo5I1QfQt+OPUToJel+wW3aDNCaR5O8DeekFLxXOrANqcrpPIrY2T1fWqNRipXLxrSufjRR5s1j8/v7ZDTCN1gqcQU55G/AjPNQTqrDAGUr0es=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(8676002)(4326008)(186003)(316002)(7416002)(82960400001)(966005)(31696002)(86362001)(6486002)(2906002)(122000001)(508600001)(38100700002)(110136005)(38070700005)(5660300002)(76116006)(54906003)(66476007)(66446008)(64756008)(83380400001)(66556008)(2616005)(71200400001)(66946007)(91956017)(6506007)(6512007)(31686004)(26005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?oA6jPmEz7iXkuQUoCt+BngnvApeDBdYAQXlOJRf9Pcekg5yMAHalBzsR?=
 =?Windows-1252?Q?w0ctit+DDi0KtR5gmypLucSDfYYTBGZjVQ8c+KOkf0LktO/QcTH/ebyA?=
 =?Windows-1252?Q?cLp8iUKymSNp/EG0aw8V3cndOBNtabdAIwvtvTzAwbDFMzwpXkd11z1j?=
 =?Windows-1252?Q?1GOdYtDij/otCHYQ8acGk2WiZMppnotN3ODMtGTMjdiBEr4usCuB7YG1?=
 =?Windows-1252?Q?eONOW7V8H0nocTChraboytCs72znENPjUrNYq4XLIL2D0NSqqohiD/1e?=
 =?Windows-1252?Q?ISz6zlkS6b73aSm38pFkFqxPvz1/uTfscyzBa1E27NRpwC+RAonbZ6o9?=
 =?Windows-1252?Q?6T2Abs23XhJS1lQsN1my0mV/dEQo758yMrw6LRxlXUzqFi3ygEgOPUtl?=
 =?Windows-1252?Q?tEJU5r/J3rcKDP4BLtRXCkzwpVdiFfkJsYUlcyAXr+WaqBGUWe/h+3JK?=
 =?Windows-1252?Q?5w7jhJChF2+LUzcMM3Xiwkfv6ncjoJptN84c938h5bdvw8Olw0P4+xTy?=
 =?Windows-1252?Q?hBp8ztqIddHzv1OvVJ6DSlyLHWH0L22TXvlP0HEWB0R93rzchhN7rVpT?=
 =?Windows-1252?Q?KPvrg/UQnZnJl6tcu4bfcrZFTjO0jjGP0bITce318MKzxwUHy3YVwsvX?=
 =?Windows-1252?Q?Fea9TAm2uWu9m2AA1Dw69PBWbbXBwmQjYScxYxto0TwpEqAi0HWq0v0k?=
 =?Windows-1252?Q?yaIDO4Mhe1/t73oPawE/ptBiQUz/ZfNajdAnL+lTXueMCw6J3PE/LjOB?=
 =?Windows-1252?Q?fxcd7S6weNT+Ub9pCE33GDSJouMFJyerk5vrehhemO6gl+mts7GUjExK?=
 =?Windows-1252?Q?ktXRVZaKur9jexKMykj2/mJvB2T4rxiRhWNGlg6LcKBLQknprXUcOOaS?=
 =?Windows-1252?Q?shrnGRL4CaO5d7DbB5dK6W91atp+YmLDBu+EQRScfRatQ7jMqJ1g57S3?=
 =?Windows-1252?Q?D5AZvI1gl3wPwCbS2lakJk0c6vAPh4+ktHIPX7U0HvjttTdLWMEU22eZ?=
 =?Windows-1252?Q?UGYiBbhfRKU81IPIMvB0kuwBHL/Vr+lGD1Nvxm+ZNF219bt2xKfUZwva?=
 =?Windows-1252?Q?EKkm5LFmSGj1YUW0D4frEVio9629KpxlOtH/vuSJe0RNHpDQ9R7Zr2Eu?=
 =?Windows-1252?Q?dZlo8HIhMJVqI1Aq+MMl3Vbdk/gFb0Bw0gQX6MIne6Zz3jiaYLdQYqeZ?=
 =?Windows-1252?Q?QhWTDDvWlxQmg9NtBDFyL3pxu3jCp/5c8CFAy/uJWUBF0ffP7j0DALVU?=
 =?Windows-1252?Q?nw4wcZflBBV/koI7ryDKvulKkgxXCgGkRuVkNfRoK+Dx4kRNgilvGLik?=
 =?Windows-1252?Q?g7EIqc9n6ax43NudgoGvxyPlWN5sfP5zpjsOFja+Wddi/kCFTgkRJdJJ?=
 =?Windows-1252?Q?Z0f+RE6uHnu2mfxJL0tXPIqyU+EfWzjl2wM5sHm7+YiFYhGU/uNfLD7n?=
 =?Windows-1252?Q?Lt6CWPr5DBqhXEzYazf5xZQ5zw7NCdtXeQHDDXsH5E2gBI4tIE1Ur1P5?=
 =?Windows-1252?Q?eTOJoNmp+Dt8ws53E/KCFB+KAYOizJpV2QeipDsbf4TWbLq1JMlgmIyw?=
 =?Windows-1252?Q?kvE/yX+Vb4SntvZinvpolWtAAhRNMzH6wjmia/+fLo6yyqtohGWHx3l6?=
 =?Windows-1252?Q?RlOsYUJoR2CuALG9ZJcBzQZaMFGezKQJgzJVsAc5ONEJo6uGTdojn4f5?=
 =?Windows-1252?Q?hbNlbWBiWZWqALjMS6RamdSLBbqbAlnyt3BP6D3EQUJrcFZpGjfutDxc?=
 =?Windows-1252?Q?b0+K/no9+l7+oGYhjve1n5a0vW85klRE+NIxPaUvoPHuFOQdlzhyBhUM?=
 =?Windows-1252?Q?j70BJzKAUDqUFkZVJe5V4OH/G40tNzQkkKvSGHUA5kUKVTw+NN6Sk6QH?=
 =?Windows-1252?Q?Kwn8bnBKML0naQ=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <0C4F8D5BE5BA1B4880629FE35D8F727D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5565b3ee-88d2-434b-d7bf-08da27600fe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 08:37:56.3320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 60jvk7BuSpX0KCR1Ol1LbwEVf6csBnf06RDeitAR9IkewoYOm5Z8XZ2iImg06tNhp1j6u/HbPuzIeHFYUu62Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3622
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi folks:

I updated the branch again. Please use this pull. Here is the pull of
gvt-next which fixes the compilation error when i915 debug is open after
the GVT-g refactor patches.

Thanks so much for the efforts.

Thanks,
Zhi.

The following changes since commit 2917f53113be3b7a0f374e02cebe6d6b749366b5=
:

  vfio/mdev: Remove mdev drvdata (2022-04-21 07:36:56 -0400)

are available in the Git repository at:

  https://github.com/intel/gvt-linux tags/gvt-next-2022-04-26

for you to fetch changes up to 5e9ae5c47052e28a31fb4f55a6e735c28d4c3948:

  drm/i915/gvt: Add missing symbol export. (2022-04-26 04:18:43 -0400)

----------------------------------------------------------------
gvt-next-2022-04-26

- Add two missing exports of symbols when i915 debug is enabled

----------------------------------------------------------------
Zhi Wang (1):
      drm/i915/gvt: Add missing symbol export.

 drivers/gpu/drm/i915/intel_gvt.c | 2 ++
 1 file changed, 2 insertions(+)

----------------------------------------------------------------
gvt-next-2022-04-26

- Add two missing exports of symbols when i915 debug is enabled.

----------------------------------------------------------------
Zhi Wang (1):
      drm/i915/gvt: Add missing export of symbols.

 drivers/gpu/drm/i915/intel_gvt.c | 2 ++
 1 file changed, 2 insertions(+)
