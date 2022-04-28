Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE38512B1D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 07:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D9810EAB8;
	Thu, 28 Apr 2022 05:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDFA10EAB8;
 Thu, 28 Apr 2022 05:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651125110; x=1682661110;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3gPOGxHlwJ51Y2pd/ovJN5gx391z/rHFQP4c3HLUeIs=;
 b=GMNpr35RZXy+9yYVl24dAYZtGExy+aO4n7zvxODpmPRw9ErUGYG2jY1z
 3BSBTOGN3UH9LkNUq9CfS/moJvX5WuhvMXqp0wRzhnEiDMwUslnN139Nj
 IuH0OhuqRL0GR2432gHg5iU9OD1sAQPup5hSQjVyooD5qvuReBzUxJby9
 ZUYMjXXQvTVpszd//RKXy5B6qXFvf/c4DqosSIphsg6JuBj+HcI3TI1HP
 2H/d7Os6jmmJR3iy8oYbKdxJ12dLgDEdVOzYUClsj3NeWowC9RJ8ScBDS
 ya10RZarBEPT46jLb6oSjL+K3wLe7kXft6B3Kt91NYKT9mAQeSuHKUJaK g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="246728420"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="246728420"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 22:51:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="808422338"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2022 22:51:50 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Apr 2022 22:51:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 27 Apr 2022 22:51:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 27 Apr 2022 22:51:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDB7UwafnkTs4Mnx5jAGCCYx6Dbrd+SyUKxgJ/NkViLJIggQ4PR4WSIcH3zI9BccmIBef0Zi/Lfh13QzLn7tPxgpSSXuUbD5Lvoq4BetN7G/PA5pXXir+kyelFiyjE2cxv6bPn1nTdzDFiWmegz3wmea73EFoL6oZXLFwspgtSmh+vm+M2YGmSlunxGQiGC+JyxnigbqWkpVUqRxFAK8RJwbOO+mDKniWDdP+I72k953WHBr6K0PHmV4NyvLOi+xSDAnizSct17xy9HpYrs6Qj2W9euVTbvO81WpYTBtz3l6cDmJb3I5F4We8z1q3t2vm2q8heZdx8CtpzisnhTemw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkJ/EK3Xc1h10igwoe3sfMLgbXY7trZaOU2abe2OYY4=;
 b=EPSQqTtmYp7CXLNSbotP463XejHFuYyzBXEJUEBTn/7rruEgGd87Y2HTi7qJtvOAeDp5gQj5Ax9FCwI7rc1SEVi1FyieoLc8J0ygnYaY12IJ5/DSYAdUlhc9Gc/OCthWut1P2jbzrqql7LiriJi3h09Kl7NgxWPlDIC5yymXAnaslcvzb0Hk5OwZ1xaNfvM1uqdCgGnypEVBhu3uyYN9xr6zu1aCon7ldP+m/RdcB5T7ZMY1AlX8WmuML+E56+E2FKgsUEe13juhFQh1LlSS1gR+BnJ6oGmTxVPq7u1WZ1H/i3Y0cPDOwt6/olBSLBPjdiit/vPra5MpljaTIdK84g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1739.namprd11.prod.outlook.com (2603:10b6:3:111::22)
 by SJ0PR11MB4926.namprd11.prod.outlook.com (2603:10b6:a03:2d7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 28 Apr
 2022 05:51:48 +0000
Received: from DM5PR11MB1739.namprd11.prod.outlook.com
 ([fe80::8c3b:8a54:d186:b555]) by DM5PR11MB1739.namprd11.prod.outlook.com
 ([fe80::8c3b:8a54:d186:b555%11]) with mapi id 15.20.5186.021; Thu, 28 Apr
 2022 05:51:48 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC PATCH 0/3] i915 writeback private framework
Thread-Topic: [RFC PATCH 0/3] i915 writeback private framework
Thread-Index: AQHYVT3SkVjWXRIJm0OM3eeLndIkEK0E3P3A
Date: Thu, 28 Apr 2022 05:51:47 +0000
Message-ID: <DM5PR11MB1739991ACAEF173E24B53CCAE3FD9@DM5PR11MB1739.namprd11.prod.outlook.com>
References: <20220421050756.2036609-1-suraj.kandpal@intel.com>
In-Reply-To: <20220421050756.2036609-1-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb7c3c53-b58a-4b6b-7edb-08da28db2f2c
x-ms-traffictypediagnostic: SJ0PR11MB4926:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <SJ0PR11MB492636B409A199DAC6449B7BE3FD9@SJ0PR11MB4926.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZVjj5EYdDF/140Io9oxdjEzx7PnnCdFKyEZClT3DmNP1OjcVLJb/pl2KqVbqDH2u6wX2TePoFUogwjXo5Hwi/TVgy5pI2V77jc4iFjmdNgBBQKWyXQo7eIhHFiLtwhFVdnTOY8+G6KxGs2tem6xOMj+u8F2rw5uwZX63H5ObDsG2HA9U7PcKu5oPG5S4RMkdGGeATjEXmfG3fxiIjeu9UbuuCp56SX1yVHsDKT3Tzo6Gg3zYdmBrgZ4NG5RUEijRkQ5DaPsRzQ57W5O+iI+fYY4pr5QwhfomeUgRNXBFuvgNFAlEbNpLpPiDv0WfVzTvZQxNP5yNnB3+mKBTR3j4e3BYYTYDha2q3DQvZLZan9kleQOgSyEkAOrTLViFW7FfkBhwFB/XVCgA5agMB6pXPmCdqq0Pjba+fb5E1VHw95KVIUH8uqEuaB7kzosxTQolelD2Wna63C0HkqYBg5B/bMQq87sNVr17RYBbjpSxO/n6VDDsA1g7tD0jIz0QwoSLueX2Bgwe3kzxocSaSzIHGRwbeQQslp8YSmgNIzKVGo5vHSV8OKPlP/tPL7Hw1qbmqmDckJncRlz96t4unHvwC9mgcfZFdiFb7Ao3dbLALIBoerLLQGHp6FmtM4qW2b8jy6vBMeu3kYNp30kEMG1O3qL7MXMlQ9Of3gGQwX/tHHEoawe4XxyUEAHytbgc54//1IOG2MmEZcLGsl7UZ7ZJhBH7xQ7aDV9L1+sBcLeYtNYACt+DpxT5hK9QdYR9KzpOdQ+Y9acde6+IHiEoADjsDN8FCG/BLOKZhMlkpEPcwNFoZ2QlvNXmXaTrxSSSowxA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1739.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(26005)(110136005)(71200400001)(54906003)(9686003)(7696005)(6506007)(55016003)(33656002)(508600001)(966005)(5660300002)(38100700002)(86362001)(316002)(2906002)(82960400001)(83380400001)(8676002)(4326008)(8936002)(64756008)(66446008)(66946007)(66476007)(122000001)(38070700005)(52536014)(76116006)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6k9HGZcg3iqc11zynplbh91F1xKY0K8FAONSy6iO1ESgSFtneodS36oM4j6R?=
 =?us-ascii?Q?Kiy0wQvK5PijDSRb0PrFgApJtsmF76TJ2e7efl1Bwngjd0gsn5PEDZvG7ny/?=
 =?us-ascii?Q?VI7XMPbuTno3KI/c/0Bh3rRlC2FsuYewn0SFdl5NOlPZsV0YmWBqloNunqoy?=
 =?us-ascii?Q?l9R71ZXHzEB6k3FMEHmV6BYBd+XsynG1gfktDxTUZy8gnaqFd2vSZ/sQwGEe?=
 =?us-ascii?Q?Z3wF6zoa/E9Y5ZdB0IsYCyBTlcQSQa4z1RVV0ifiupNCZoSblOuaQSnu2uFZ?=
 =?us-ascii?Q?wOxN27aT4R6tik3EbmLZjmWhZOdek6HjTYR9BrdBKacxFTL1Ixu4y9+CwHIz?=
 =?us-ascii?Q?e72evoHgi77PvLXmkIAeE6aqTzcKP0KXWS8jxDlpZUNEvHwQe5oszAKHTgeq?=
 =?us-ascii?Q?ELRp4cnSM54M0iOZ/aZTscpGWqXfZB9wLewya7PMBi96L1Pt7S2imMnBSJe2?=
 =?us-ascii?Q?XOwxQT1Lx1dNgSbo//EDhKDT4inWDz23ndTPteWiLbZLVBK3+Z1w1ra2dOjl?=
 =?us-ascii?Q?6B7/rUARjDw97lVMDlCVC6EEX+4HPRHcVpho1hUtO8eJSN4vLrVeOhLEQkPd?=
 =?us-ascii?Q?1Jeq7zCi8D18uInMoRfz+1T8W5ZOAGSNEftRdkonfK10t1YLbkwiwbFBCM5C?=
 =?us-ascii?Q?+YYJViBT2do31MMy4gbu2lyDe93Vd0M9ZI5ZWA/B5gREuqS9RJZSm0dVsk6R?=
 =?us-ascii?Q?RdR4i92IDn5trSok3EVk0Tb5xRRZeu/mpWHE0FnAaazni1s/K8afQtmg06MK?=
 =?us-ascii?Q?NEoJarRTLQos6IFS91kNGicL+j1RTqPpzMqD2zrBhxB4Jtv/Xs90xWX7BKmI?=
 =?us-ascii?Q?lXlaDNhsSwO7pDFpGgf8NApK6WNySH9XfnJ7Ro6hdYmsSZFef94V6ePinU4w?=
 =?us-ascii?Q?UMiEU/OTXI1ToF6VuowqkrzZJzOeKW9panpFZKXTKNoreT70k7ongBTenUVs?=
 =?us-ascii?Q?83AFClxiGCHVvIkU+FXBtigeHebTrRYaNXZdF86jo2HiPFv4BNuJwJF8h798?=
 =?us-ascii?Q?jgRAe46kSz1xNNM63/j6kGhWHs4McgWtMGR/VLbElerfoiuKKZTypww+WxYX?=
 =?us-ascii?Q?2WHWcVmDkPj9prhZivLd7W1sfpEbzqQiV2uPY7wG4FGNfTs2CsUxzY/ZmaYa?=
 =?us-ascii?Q?lB6R7VuVEMLKs2sL0Y2rgOpb90qjCTBiW+eITN+cxzwL/lY3mjz31iyL2dtA?=
 =?us-ascii?Q?M309OZwG4296G7tvDltlSocDwuRb5R/mYYoPsbS3EGy+8WMcWpCiuoBtAhX9?=
 =?us-ascii?Q?eH9o9URYnROH28db1uuihHQqYpXm353nEMPYMRq3Lr2y+7fG8UD4VdIyAcD+?=
 =?us-ascii?Q?6tWGoIJwflyzRW2iFg/29qDqASXuxp3g1DqbGVkQe5jFdDMvoTgAV6GuhYpN?=
 =?us-ascii?Q?mkOu4m7ihOGfV54lGnW/9YjBe8ec0N13vop4L9QkhqZFGe3kt8L6YHwE91qJ?=
 =?us-ascii?Q?ja9fIUPoPp0t14zoyqxzRi7WVP+7YZViR0d8rVJ8qjv7IQ4/wIRGQMKORExz?=
 =?us-ascii?Q?RlC1wG+fruFHVGxC/wHcOBXb2qUS5ok8zflO99azcaTtZSTYI5VHMqbRbJTo?=
 =?us-ascii?Q?u4G0uJ78oqDhJxhz4i4I7VMUqZNvSb/OcoKHsVyancHgjGsGxVfg8GsfeXxc?=
 =?us-ascii?Q?FG6qg6ukwMqTN8Az5NyfLRe6b/UR0xLnml3LBhq8fZS9lHHQi7xIrwkCVkly?=
 =?us-ascii?Q?/Mj7x8e+jW6AC38sNr0HGXZYUNjKLFEWUPh93UxTDWTfY6M69nP+vSbML2q0?=
 =?us-ascii?Q?gINwpO0w3Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1739.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7c3c53-b58a-4b6b-7edb-08da28db2f2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2022 05:51:48.0584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uH6a2GwlZyxDVApK6Mvk4WpZ2eXuzg45vKTcCnd8PLFEF/pFmxtjNGVbFwX/h0GWyps9ulV8lUBWXPHlU/wdrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4926
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

++Laurent ,Dmitry, and Abhinav

Hi,
Can you have a look at the private implementation i915 is currently going w=
ith till
we can figure out how  to work with drm core .

Regards,
Suraj Kandpal
> A patch series was floated in the drm mailing list which aimed to change =
the
> drm_connector and drm_encoder fields to pointer in the
> drm_connector_writeback structure, this received a huge pushback from the
> community but since i915 expects each connector present in the drm_device
> list to be a intel_connector but drm_writeback framework.
> [1] https://patchwork.kernel.org/project/dri-
> devel/patch/20220202081702.22119-1-suraj.kandpal@intel.com/
> [2] https://patchwork.kernel.org/project/dri-
> devel/patch/20220202085429.22261-6-suraj.kandpal@intel.com/
> This forces us to use a drm_connector which is not embedded in
> intel_connector the current drm_writeback framework becomes very
> unfeasible to us as it would mean a lot of checks at a lot of places to t=
ake into
> account the above issue.Since no one had an issue with encoder field bein=
g
> changed into a pointer it was decided to break the connector and encoder
> pointer changes into two different series.The encoder field changes is
> currently being worked upon by Abhinav Kumar
> [3]https://patchwork.kernel.org/project/dri-devel/list/?series=3D633565
> In the meantime for i915 to start using the writeback functionality we ca=
me
> up with a interim solution to own writeback pipeline bypassing one provid=
ed
> by drm which is what these patches do.
> Note: these are temp patches till we figure out how we can either change
> drm core writeback to work with our intel_connector structure or find a
> different solution which allows us to work with the current drm_writeback
> framework
>=20
> Suraj Kandpal (3):
>   drm/i915: Creating writeback pipeline to bypass drm_writeback
>     framework
>   drm/i915: Define WD trancoder for i915
>   drm/i915: Enabling WD Transcoder
>=20
>  drivers/gpu/drm/i915/Makefile                 |   2 +
>  drivers/gpu/drm/i915/display/intel_acpi.c     |   1 +
>  drivers/gpu/drm/i915/display/intel_display.c  |  89 +-
> drivers/gpu/drm/i915/display/intel_display.h  |  15 +
>  .../drm/i915/display/intel_display_types.h    |  18 +
>  drivers/gpu/drm/i915/display/intel_dpll.c     |   3 +
>  drivers/gpu/drm/i915/display/intel_opregion.c |   3 +
>  .../gpu/drm/i915/display/intel_wb_connector.c | 296 ++++++
> .../gpu/drm/i915/display/intel_wb_connector.h |  99 ++
>  drivers/gpu/drm/i915/display/intel_wd.c       | 978 ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_wd.h       |  82 ++
>  drivers/gpu/drm/i915/i915_drv.h               |   5 +
>  drivers/gpu/drm/i915/i915_irq.c               |   8 +-
>  drivers/gpu/drm/i915/i915_pci.c               |   7 +-
>  drivers/gpu/drm/i915/i915_reg.h               | 139 +++
>  15 files changed, 1742 insertions(+), 3 deletions(-)  create mode 100644
> drivers/gpu/drm/i915/display/intel_wb_connector.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_wb_connector.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_wd.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_wd.h
>=20
> --
> 2.35.1

