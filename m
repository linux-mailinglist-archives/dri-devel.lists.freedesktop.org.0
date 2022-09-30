Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADE45F025B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 03:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274A210E71A;
	Fri, 30 Sep 2022 01:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED8E10E132;
 Fri, 30 Sep 2022 01:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664502432; x=1696038432;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mtQxMJfZ0TTOzEckiCsvjImu1igtU8g+7cy/x31PzGI=;
 b=AUfUo0yhWIkejkq+SZoMWfFacVFRbfb9wI2kmmXTnr2vhPFpuP49TU3h
 7M1eY10NBnYDGFxpRpvqC01g3cXxFvUzTuKdPx+1ifBqFdLdR1JWzMqn/
 EYl3prQmm2RRIQnA7rgsgCIkUX31SjQ8AEZO2r5+mwn0Tz9XO72cSAzA8
 xyDW4z+mrvxsR38p3NAdCRwjxWND3KwtRjfqb16HqytJcbyP7lY4o5JI2
 39HOxAj7mk0YihrX3XIxdoBa30zvSoqvEH+WFWFFvVO5Z9/7GT8xlcQzZ
 crL6ljlYiKXCT+ZqChj23U5mhxmAFat0dvvyxL0nhCI4Oqs6IZVh8pLY2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="289239573"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="289239573"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 18:47:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="867632763"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="867632763"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 29 Sep 2022 18:47:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 18:47:10 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 18:47:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 29 Sep 2022 18:47:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 29 Sep 2022 18:47:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2LiPlRCJaponE1cPJM4eavATVtI6Q8qqqTJS6mVSIVClzaXvyTRZKqYSWuj4z1upFbZxtFuL07Gp+r0wCXr1P6YXbatiYrhOqRIrbcjjYYwdYJmI4XIDxhlQvmBJ1oR4uinstEoX0KTygtY6XEtWdzsQcChFBbk/+iZX2h2u4TcWtnrH90IbeM4EUtIRjILF5/oWt8zyXGzvkeMVpqY+UU0wEavDPgjB33ZjJtvKCzvri/JTBVxTNourMBooj6wAO4GWWzBvRdKiAaAkZcgUUfdlOz6ZE+wKHtBvtCgriqRtWV1z8XZ3TXSNHIvDXU3n1hAW5Ri9AzS2n2wxyKKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtQxMJfZ0TTOzEckiCsvjImu1igtU8g+7cy/x31PzGI=;
 b=BM5L7RStglNG5lS+ajzJofZcZ+tb60OFQQIQUAX5IDAQN4k85077gL1+i5ScljcHDwRXkAZR2lZ5PRmLKx/fG/1TCjXjimM0UqPj3Exo4DXGxG2z0Xd0MPFwrebGChoKkLQeJihtv0gnjocBW/6h0C6teu2UDhTUcpICXj6SWeeJarlXGUgEsoPWP9TCY0BWnMbWDS6F5rh/MF0RrZsBcvFupE26DNhhAiK6+cRGTSCVGk5LxHihQLfU9eY8I2N8d5fLOSctcCENoPpU2WhKGWrOyjy706EIX87FKYQMFedXimZBIADaYBvK3XTfyzd3QeQCzS0HqClznPYyg9cLdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA2PR11MB4955.namprd11.prod.outlook.com (2603:10b6:806:fa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 01:47:09 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::ff76:db8b:f7e9:ac80]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::ff76:db8b:f7e9:ac80%5]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 01:47:08 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>
Subject: RE: [PATCH] drm/i915/gvt: Add missing vfio_unregister_group_dev() call
Thread-Topic: [PATCH] drm/i915/gvt: Add missing vfio_unregister_group_dev()
 call
Thread-Index: AQHY1CvD04pCQF3zs02055qhA9FU4a33NJ0Q
Date: Fri, 30 Sep 2022 01:47:08 +0000
Message-ID: <BN9PR11MB5276EF442E0321C0D1B704E08C569@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com>
In-Reply-To: <0-v1-013609965fe8+9d-vfio_gvt_unregister_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA2PR11MB4955:EE_
x-ms-office365-filtering-correlation-id: b093cd0f-eade-4766-a3ce-08daa285afb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q1bAPXQmw6ZgZQG3V608QnoDzxXNcVgbwetYD38lD+9E6wuLw+3ChTLXII6ejXueHLlRBoWOauvXxfQZRO6sWbepyvnZia3FEcDuLWyw5L43d+GBaj/ajhhpNvQbPrUou3BFru12IEV81zOS4fKJIbsN7qVeZgrOUJezBvaZcr2W1MVjUqn+Pw6v6O9J+mlx/MaFquoaJziDvztsEIiuYoC1XTeG+2B8z7A80k9qyLmtYTnp3IXwd3lXiPIFWHwiHsxAiKmPWH9C9lb2oYgd7BpcOr0YDL+2p3qaD/KbmhIylpyvRKZroVAE7OAQCfBhyB3VgKNE1cBRTAzq2c8+920LlvXU/jOJVreheasVWxkR+C2DNxvwb9at8sq1tpFvnnxaXkLOV6I4chlLT7jInU5pTfQq44LQQXMMYjAfqvqIkZoYrQ1a713tgQ+K7OEs9Od9nveVW2sXTJDx8rMnSUheuKefar4tBlPC9YNMoEX/D4xdcPS9lg0AZZOmTC01kycJJ15ztpYAU8wBFiRoHqSeLVrN/xRmmWSWlCOFdyaXnA/084c8Xge1b3RI4FstNu+DsIXjZLRWvnuWHbwRZTWR4uUOC/HptA36QXsIieq/1yknbQ3XQMy6Tel79b+HyFTbOQx5UF59sIqHILbgyODucCav+JpdXQuJmRHGS642aECpvSmZQ820lya/Z5wu2g1QJzFwLyuKpq5m2PG5xWZ8QLnfQLAYcCqdkzzUKfnugohifBnl+VfExG56raNj5Ic3db4m6+Crr0rwk+4uRbBkUqUqIDKRdUdV+XIR6bM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199015)(316002)(110136005)(54906003)(52536014)(71200400001)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(7416002)(5660300002)(8936002)(8676002)(4326008)(41300700001)(7696005)(6506007)(478600001)(4744005)(9686003)(26005)(38070700005)(82960400001)(921005)(2906002)(186003)(38100700002)(33656002)(55016003)(86362001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YMxCld/w4+hPAAdPCQMTFiOYNGjFl9EyklHFSdDIW1jZZ+flTfRgQ4qbCHoP?=
 =?us-ascii?Q?tGjAP6lhc0QywzvNGNL3sONx8hX0X2F6xRnrcyVPSVWwrwRGgK/EF/HrqsIj?=
 =?us-ascii?Q?dKKaN78qCF09w7kP1Ro6C0ZS9WYkVJKMvf0zZRI8DJxX8BCXzddjco0tL+OX?=
 =?us-ascii?Q?gAHrmCIwmQoaM5SR01ogtlVivu3LWtWuG55RgTISZ4e81Sz+/TxrN82cN+EE?=
 =?us-ascii?Q?BncPJmH+s5IIDfHveqwvkzY+j3L48HvPIJDvsaTqRgoMS53MnsGHOXZCpna7?=
 =?us-ascii?Q?g2M23IpMxCgMIeHJ+p3QAj//KRl5N9LKp8FYeIeqJV7W3W6//QEKU1mjrYw4?=
 =?us-ascii?Q?fhP+F3Dim9npea7+/v5BwD+X/JX4kF4XO+OM/ZeFgvvZ/9KxwNJqIl057XqS?=
 =?us-ascii?Q?HzVfeZHp61k0lt2Io39Dal9Jlu8WtrOztm3kl6W+ZrgdJsoxPg8bLAsFT5l/?=
 =?us-ascii?Q?fR5LwjH+T465s0M3qwlxHe5u/VRB5bjCvJZjdZP8VrJTiz/ZWQZp3msyZ28s?=
 =?us-ascii?Q?7Rgb5eGDHs/03sJwyYvTJKAbYOvJcu8fyKp6S8eE9n4/YLviJ6A8MT9h9g9x?=
 =?us-ascii?Q?Yob1mD2j9KO5cAdU+vwZqisdGm5uAmvfPkTG101WJsM5tKvwLkaqrL6o03xq?=
 =?us-ascii?Q?HH2SzoGpgKICW/hFsObUr90yoy4NpsgWT1BDARTMjkBFAs16RWrEwPYwRPWE?=
 =?us-ascii?Q?2EpyA9JDl2RWMAdCj8/QF6FH3amhOfH8/0fxbCvQIrD/4dNMY3hgSnVcNPin?=
 =?us-ascii?Q?vsTqE+TvZVm52jCeccsMf4mRIvpZ6gCjy8DH6ckRrJuAxp4lhivZDlS8xhCV?=
 =?us-ascii?Q?y3WlhQx3MB5EFtsd7JabguV2R6seoHdhDFhQpcnyZGLrKBAVY9J3iJ/ib70A?=
 =?us-ascii?Q?zj2uGlUZs3ntEhtS5VuWVg1ykvulet7w0HCHjk3DbypfBUkeiTgEwOyPQ7eF?=
 =?us-ascii?Q?fuHYsZjHjeG4ZS29/1Zr9eChLEn6UCYH8Pd/S0LGnSkxZt1lzRcSZVcKipVO?=
 =?us-ascii?Q?+Xg1flrZymCWlgY6orSVWU2xsDNtTnbdm3pL3SQ1k0otn9q/bmcwe8Ey7nNi?=
 =?us-ascii?Q?WVuhlXKKxe9vtCDI6m16kSWK3Z4W+ZySZ3ogKNOn22xQoQo6tVKP9A2DiBfa?=
 =?us-ascii?Q?PojnqTIVhhb5PBECOohvng1PaRaQIN5PxMEdwO13rw/e31zQ0weo68GSzcrq?=
 =?us-ascii?Q?at660C8SKfUzX34cJ2TIZmnf7/PbbnWvzZmrryQcYDBpmFKoNEYZl8RxIQFU?=
 =?us-ascii?Q?lQXebNd1q5rrg/QKsz8RQHEWiIGorwz1hBOSdoVN96hdqxHIu75um5bpQpNn?=
 =?us-ascii?Q?Rs+zAWRL1D62iES2wLLkwA1txWer7tL6agDt/2PrRiQtUNVvV2X2JPSr8eHZ?=
 =?us-ascii?Q?YpT8mf+zs4EZBJ1iYBacIoMeFc31LwBZxFnhyKdDv78edww7SBUHOls/gUXs?=
 =?us-ascii?Q?FLm8jgOE/jIxgR7buKlA/ECp4v38sinmtF144XKU1Esr7AVAbP4zNn3Xeg/L?=
 =?us-ascii?Q?knc5Az/tmEoUdX3XtN9kr9SvOXu4Wf4YHbvXEHdbh1pD6zfvh2c+qZgJRTTx?=
 =?us-ascii?Q?CMoiSjiTt92l017EIhBEaiOs19sLUZtQiRDkV1P4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b093cd0f-eade-4766-a3ce-08daa285afb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2022 01:47:08.7972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PseIyDa6ubA2zaqn6wmD/djPRR1QmE0g6rUk6Ru3wY0NJbqChc/p2xKxZEksbFfXJ/fmYTBJrLsZB2OR7jx2lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4955
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
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Christoph Hellwig <hch@lst.de>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe
> Sent: Friday, September 30, 2022 1:49 AM
>=20
> When converting to directly create the vfio_device the mdev driver has to
> put a vfio_register_emulated_iommu_dev() in the probe() and a pairing
> vfio_unregister_group_dev() in the remove.
>=20
> This was missed for gvt, add it.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 978cf586ac35 ("drm/i915/gvt: convert to use
> vfio_register_emulated_iommu_dev")
> Reported-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
