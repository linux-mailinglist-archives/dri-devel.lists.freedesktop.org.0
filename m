Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036F8672FBF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 04:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66A110E8A0;
	Thu, 19 Jan 2023 03:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA12910E8A0;
 Thu, 19 Jan 2023 03:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674100325; x=1705636325;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wnc7qRiD/7yzgTKNE1tb89e71DGTIElgexxNNmIYXj8=;
 b=J9uLONsE8Eslk69u6Bs8/Ukyrpukxg37saar1HJiLleb/WVzF5AUXVHg
 MQde5MAdGa30XOmSG/iz/l6T2OHca0KFWKRQur6DI0HTEyVRX5AEp0+M3
 A1YV0H2/YqZhfKHKxbF94kuP45Vi6PKrSdrVka5SdCuMLGExbvPitv18o
 YIR1kuvqN8gIYDgxEsy7xF3sgYTTWPeX2/3fAuddXERpw+BYH616k90hu
 FQ0fknVvz5zzPz4o7QZZ0ZK27c4OibeN/CLk688OpcYwRB2GtZQBG0O2Z
 LxyI9qlqnDl4WRUdVphKIxZoZyHp019Spicz1UEQ6bugJMIMApdJIvwxg w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411424383"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="411424383"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 19:52:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="988841666"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="988841666"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 18 Jan 2023 19:52:03 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 19:52:03 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 19:52:02 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 19:52:02 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 19:52:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9iOdZa4ffh3Zc4MkZxd4iF8qyld7eYv1dTmDrS1jm7HNrQ6L1+g4a7tGCA0EXfKS1O4ys3QCEg84K4Yth+Rh8bSF74IsMQ4druOB7unnIhGwbqOT3s4X5ZOyq4wKX83Klpk8uIjhldYd1IksECIKsk4W/7YyUHTHAmJZeavurQaqufH6OcxHBcCt9r6rX4+J3Mj8d4g7mozLb6Fb/GSJw2XRDWbQcSM8AgSWmY3bUScdjoXISw+v9WKEMS46f8dLzDsFDgdAIS6zpEmpJWq5kDrF1zdb57LC0PipIt/aGhGYGs4Ixj/ipcrQKJHHAzUem4UjSzSrgmki56FXRHO9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wnc7qRiD/7yzgTKNE1tb89e71DGTIElgexxNNmIYXj8=;
 b=fzV3KhlrJbU55o4vCwcsKdWngj0X72bBghjk5KK8A1q4KPls6Kidyzg9nkrPnrpYZBCj902dXurnPuWX2LmftlZKm9oxVpMyOdRHGqGbaEKIcgTHpF7+TbF4i6g4vJXVou8F6HaUUEClgxxDCgsQfER6NgliITbTaDujWCMM/MHmCTA72Zd7/6oO8Xe2S4ymAwFlu+cJKT2H0ijjJvyO+FZPANCl6P2z6xlMWnwAE3zft+OyWTN1qwX7NA3PPmgzvHC/OBvPud8Vx5blyj2qIaZ17oOHrWkM+x/8lYXsZ1sQNnUyRICsXRKfcPgGb9+uOc3jiNH+jQJFV6Cc6QyMEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 03:52:00 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%9]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 03:52:00 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: RE: [PATCH v2 08/10] iommu/intel: Use GFP_KERNEL in sleepable contexts
Thread-Topic: [PATCH v2 08/10] iommu/intel: Use GFP_KERNEL in sleepable
 contexts
Thread-Index: AQHZK2blvhJrGbu5mk2nje05cWz9Ma6lG9yQ
Date: Thu, 19 Jan 2023 03:52:00 +0000
Message-ID: <BN9PR11MB527652EE44B54F890754A1CB8CC49@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
 <8-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
In-Reply-To: <8-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SN7PR11MB6948:EE_
x-ms-office365-filtering-correlation-id: 2f1b1863-643d-44d1-09d3-08daf9d08514
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rI8k5kGbOHRTRCmYjT7t6hSo1lhU3kzBQMZ90itzYRq9oFl53RI41dX4Kl0EwmOvAhKO2Y1fejrrHCBIW+1TLdK/ehtPwmZOpAAUVmdO5pZUwgktDZuM85rAWXTlV6aCPtNhSWz4YD3ZsjijXppgwbYZTmtAmHYmbxl5NlvcTC6gnU7XI+FXw1KGkkIAxj4yrMrUwqAgKMGzMDSYYB0u33h/AosJFwACU30kOCkR3TGbM8iv9Iuk9XQrrQ60Lc4GM3IBGDD6bSIwjyXEa0q09wjNsGO0Pr8LlvlWvGjMSUytmdZS7O4AJ2UKA8FeMRxO8DT9VN6dGu1Uce+GqX/Tp0qIIIMzII3rxhZUJ6ERBXPW/kcfurGrDSPKUcnHUhMGy6jd52wgZ/8AWJehQPNAUO9qsHZwcvF9vm8LlhrT8jz1rMk0dqG4osVy6CsbMvK2pGdIpchUdxzvy3uAkT3K3NWVACxxCfWqusBeICdtx9cPeFJKCNhiLj8tK/FIW3dxrl7j4W6e/ymomN9RAgdUxs5jiqmtBKeelTfNU3Sqf1hVbUtgMvgEV9piEpJfUjLhA4UQuE69V7FjGa6I51CMuOvZK9BnLJ1PX/wYrAF4GlwFPVdrPOhsOca18cyELD0DG6XY7Bdi0xNYMlP7R5ApUitoHjQR4wQUIyTuFX7H67Rv723Eo+LMttQ1RM8ibYxj2oDkIlkKV15EV8LvnA3k5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199015)(6506007)(26005)(186003)(9686003)(7696005)(122000001)(71200400001)(33656002)(478600001)(54906003)(316002)(110136005)(76116006)(66946007)(66556008)(64756008)(66446008)(8676002)(4326008)(66476007)(41300700001)(8936002)(52536014)(55016003)(7416002)(2906002)(5660300002)(38070700005)(38100700002)(82960400001)(86362001)(558084003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a9UIMGOvc3+gEsDXtI5F/y1eqdLyxzZIJt+NbpAQ4bEvTjTvV3689PGvMviI?=
 =?us-ascii?Q?BHEEdGCbFI5T1StZ1H1+42TnbuHzR5UbX2it3CRQ83sprHJGpwcMgTj90iC/?=
 =?us-ascii?Q?TMfnnvKAepJrTgA1C6v7f9ystRb28w+HotLoMmYBDzFdDRvXm0Rtb1K0azq8?=
 =?us-ascii?Q?oHSkVjHXKgNEefVIY1IOL7PFzhrbq5dyJ3XPc40/WBrmHqSlbo7z784JPgh7?=
 =?us-ascii?Q?ofp8AXtGmv92poGbvGjYxHcDggrVmYaRd+D22JKHaUvOl0sJ2PSAoGtuAJOv?=
 =?us-ascii?Q?/2pzdc8x6RPut+0HUGnC0MaJYeAUW0qNu4NY6q9o8S8grj4gd8+vpainxQh4?=
 =?us-ascii?Q?zLtZqQW5vM7mMPMscItC9mLjlr3Beos3eLOrGftkM2VLmc9xzy7EBn+fyj66?=
 =?us-ascii?Q?NYeQu6aGQ1nuUGS1yU31S69yJpUp3optpvf+qPhHhwPsHl+aND5wCIk1K9Il?=
 =?us-ascii?Q?nvSFxBsZqVdLVMn5CX/T7bbcGFlGSfYV47lh15fB7pSVT54lqTwBkLqrHcZ7?=
 =?us-ascii?Q?lySS2sF0DEPwC69hJ47HNktwcuZe3GiSw72SRxaPsMLNLOL2pCa4hkzi0oiw?=
 =?us-ascii?Q?tKro/tUYneQ7uaRjMGNIH48L05aNU5I2MhzJtbsanPcWtccum7k+wLwRXE4B?=
 =?us-ascii?Q?b/d8roblWeLiIAkHa+ve5dV/ieew2hNRk3ENgZ+yXR7/TXY67v4fv1cGr1YA?=
 =?us-ascii?Q?A3X3x2/yl6wYQkAbT0q2ZLnwCJZF++IGvkwki9vOTBxKNZPprJ0dnVwosQoV?=
 =?us-ascii?Q?+1CShe5wtXYYZmRFy3R3Imvucmwe7NVGzA13UcOmxrdoTxHRjRghxB/YiMkS?=
 =?us-ascii?Q?ylv65ySxmUuqheVPTGnPq4hFfI685TGpyJXmsA45J02GT+GHkKPLp988qP/i?=
 =?us-ascii?Q?gsoZM6o5tedstBUSAIaicdEE6fQUsLQw9DZe2r1Rf01ddYm8F5WgDlk9ubYJ?=
 =?us-ascii?Q?CLbR/k4ClLE3j3HE5WpyWkI6RFUswXX1zghS3LNtoavADQzajyjXkXNACfyy?=
 =?us-ascii?Q?rzaph6jcuHmxiZus8TNl67vEhQO5jcUhEYGqmvNr3DbgPnEwN6TwzFS1G7ep?=
 =?us-ascii?Q?xr7fYtCG4po6BisWTP/3MHNgY5j2Vbdk20A1RmYq+JJ7KddTCYRexNAfPYR3?=
 =?us-ascii?Q?igv2GbGwRnoDnGfST6EBmRH26aMFnCaZLETgsA7e5DVVixwe4XtDpunn+4pd?=
 =?us-ascii?Q?9FbDp+vDWVq6RrYkTFJShYL6KW0mxQn7hcKyGESXlmy151XzH3RTXDwbZFJ/?=
 =?us-ascii?Q?tK41di4Qt6AFv5ZY7g2UWY4LGHmhdgU7gAwgFmIrCGYGidn+lRrmIUO+P84a?=
 =?us-ascii?Q?LC2/TWt+r8MBiRFSr3foq//jRq0c8KGd64rs44frzNFeywxHdgW7vvvSBPbv?=
 =?us-ascii?Q?Aagc9s91AEb+MBRMI/o/R69gv38sYU7zA/o0kzNfvCRiavu4eyvWD6bajZym?=
 =?us-ascii?Q?dS8EeyAEGYG6dNVQ0uaTvnXpbbRXf8vy7xiBOm5zEjTzzstojDb6jo8Zo9xr?=
 =?us-ascii?Q?y4AQxdQ331WrYZ4j7rwHlXzllOfCm3s4IdtVjXtO+gLks36n3rXc9jsYoGg+?=
 =?us-ascii?Q?BqwKdjDtZjHBQX8Rmb13C7YKWG9AW5K7ym5UUFua?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1b1863-643d-44d1-09d3-08daf9d08514
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 03:52:00.6918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ue9FlnWshb1mMsuFHuLMBLRuLQ5tPxzewkEJm7uagpvO5sfOr3u4cBu9y699Cf8vhwFqT7BVkR/2CoEtz/IfLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, January 19, 2023 2:01 AM
>=20
> These contexts are sleepable, so use the proper annotation. The
> GFP_ATOMIC
> was added mechanically in the prior patches.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
