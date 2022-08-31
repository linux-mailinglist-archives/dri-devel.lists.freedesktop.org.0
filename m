Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AB15A7271
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 02:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C0F10E40F;
	Wed, 31 Aug 2022 00:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF8310E40C;
 Wed, 31 Aug 2022 00:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661906038; x=1693442038;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NebhFDtK3gBm5Bbt4XRePcL7oEOi6bmc+d5hEX08ToM=;
 b=VnQRGMR6U1layoCnpa75gmOYbBHsoH0pXDlXJuCF6WO1EQ3Xsl7Zy1/c
 YQ5j9DL0wBgVei9dC18UPQnHqe1M3GI0yJ591pYOTwC8BA77ro+izG5KJ
 TSQY0v1+f9xHD41vS5++DX4nFEvGOo0IpIz/WthYOG2QqLfHjfMoff54g
 exx7YABu67b+f8I5Ok9rSi1czpP3Zbd6Aw9z7i09VMN4JzVn5Bdj8aDOz
 VyqP9rRcgLyHypIWCP6cCkBUnvoTWq2IWJnvOb3+IkMa3rgiZIVAyDwPh
 8749GpYKGF2US6WsybdVKeFoyCDRYUJgqyYlJ2tUoe9qZwmOBmdsW/oYI w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="275740574"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; d="scan'208";a="275740574"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 17:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; d="scan'208";a="562862931"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 30 Aug 2022 17:33:58 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 17:33:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 17:33:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 30 Aug 2022 17:33:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 30 Aug 2022 17:33:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdGvKiLbpYy0FKp/fuX4SajzixhTdtCWvvFz997Ub6BG+DrR4xbLqekgBn+34mQwRBdhQmUcgJzusiZvh0HcXlctN63G6S7LAkmCWvNtlIt/r/FTmd/YsHwPh5g0d8C9sH4lsUAIIX95zXrXWRI2uNp7le4BuLQjqwm/pHxY6bsQE4Lz1SpaRyhADM8W9IWuW6k9X7SjE2mQjZ1yr+nXMElaHBnoMjKgH2Y9F95l61jpP/2PsYV4EA+POFQD7zDGwEiBqa8R8GjO3Vr1RVCrjt3y3ofT46PMCWU/kL4whmSTrSu2AUamZzyDaG17mgMU6beZQI6sy8EjGNJ2E2R2FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VygCPAZY8V1CI0UYY4r9Uj2HYCJNyq9LaMY7sVUI5L8=;
 b=YKxV3BMPu5GBVpsr5pU58VwiSTR/ODXJasOZMmsTKx4NBbNeNRUdn2c4lRB98Qk6Mu4kTqE0S+R0vo7ziR4tZoeW9Buh6MTmL09qvSer7PN+4X7CIgGjAkJ1ssDNRosbh7VCpMUoJERnOAmaswDCdslrjqtM+yLgNvPj2Vi3gM/c5XFLCjOCQY9fQAHfxotmFM3WvJXR7uUkJVky1vRSbROIEGUHVYbFkMIal46/V619lZQfPzkGKvSZW5A82M2jSozm008YoJUvqmVCsj9IhrdbskNwBIr4L5kL5F2+dUSOFjQgtjpFB/O9p8ni/Z6YLDoE+AgUFjNF3/CWqS1nWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Wed, 31 Aug 2022 00:33:47 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa%6]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 00:33:46 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 5/8] drm/i915: Rename and expose common GT early init
 routine
Thread-Topic: [PATCH 5/8] drm/i915: Rename and expose common GT early init
 routine
Thread-Index: AQHYu8k1VkcEuh0j4UuD9bka8Nki+K3IKtiA
Date: Wed, 31 Aug 2022 00:33:46 +0000
Message-ID: <DM4PR11MB5971152F9532B839CDFAB67D87789@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20220829170238.969875-1-matthew.d.roper@intel.com>
 <20220829170238.969875-6-matthew.d.roper@intel.com>
In-Reply-To: <20220829170238.969875-6-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aedd9166-6696-43e8-7c45-08da8ae87790
x-ms-traffictypediagnostic: PH0PR11MB4792:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g6OmNlEZnOnk9KSjZFdkeV5nVEI8eYMzC/OUVq63vnIin45JU+IZn3avkl9ifnRGbGykYVkAfTSAPqClB5eoRcAXRgkAg5zvmRlCiohAoFTAIH5lpzYBwqqjYsyRkDlirctKjnP/36SDiKRk1J5Rl3EOxQRQ7hwxdjEuWCMpGXAI9G89QRPeJCD6Bv3GvjGCkx/21EsHqpOCU/Y+er2LH767rRKJCi6BU4rwdlb/Ix9UjG6UHey9r1diQEfm/6LihWQC+ko8fXnGzSO6Q88ZIqy2o7h/63E/7t/ijlBOrOtgzGHEddUmuVW3f0AQ7klsNuG/oUjz9MdU4DH8vReL7Z3Xp3Qwsli7rhKFw0MxJeQoXH0fqhKq8GZudvBgo1Ui3e8fs9aOsEUu6hwjvCpOUMiVelAH16qMvlsmZfA3iElRLUItQ6Bcv/3x/lbpbTMuCUq32nCWqePSip2CzKPZTuwZYn4Zdcs2SR73kMu/y7CqZr8nxUm9N8rNXcuw+ni8/0gWs05qhYlGsULRXEyil8FGgqoalEMeGd4Zn+nFR+hqulO/zI1IplpZ+DcZTZ9lOIanC6GzPa+RbMZks99tXCms77xqcdRKHvsxiVAis6JqcjnkXj930Y8GFYhyzLGCSE8AfWu/vF0eIXBlwVzuKFxaX2UV18c2nm5KRpH8s1FagoBVSX/t6gi42B3X0Tc55+P22IeHCzwWmjkmY5cVWYiffsHRBAW2ndO17yFAQiId43lHD3aCtwd4Ht1NTCHz2V/HfkZJBbO24unln9xYRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(366004)(39860400002)(396003)(346002)(2906002)(186003)(450100002)(316002)(71200400001)(9686003)(53546011)(6506007)(7696005)(83380400001)(26005)(66476007)(33656002)(86362001)(82960400001)(55016003)(122000001)(66556008)(38070700005)(5660300002)(38100700002)(8936002)(478600001)(110136005)(76116006)(41300700001)(4326008)(64756008)(66946007)(52536014)(8676002)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AeG6pycu+PXpXEXGqj5VSijz82AoSCyGPstgQXqf/dgg1Ed1Ejz9Jv2s7l89?=
 =?us-ascii?Q?u+VYnlCbw7PdPsiX7kgXLBqlpfnVS+H7nm44UrGxx5YVKW0AUHAWSNLGqius?=
 =?us-ascii?Q?dVkL/9I343UO1e0CEK2wzcz6rUr9oDDG8tem/Q56K3iu2BUdg5yAXK5Czuwm?=
 =?us-ascii?Q?v2luFvfvvfUXPiWEXhlGGjh2vGFXhUMyiUFKGMG+h3KBdbRzl2N9I2xDZFY4?=
 =?us-ascii?Q?TxfLXvBWD+Mwr/ctDFJ/Dk7z9TPxgOiECZjwgDAfyUnmItj4VkDxmIFHY1b0?=
 =?us-ascii?Q?UOHAxJFz05UdmJ/osmCSAh8XgRieJ31+oPl9UaglsDVqhqCCxbXxjHp16X64?=
 =?us-ascii?Q?vPa7nlyRN6mWvXoDY6c8mNT8k8DHzwTg+o+PY2qXg7M1fmH0jt3AfCx8YVNv?=
 =?us-ascii?Q?ptDd2P7e30n3pcBWL5e2QaMRIpaKATyVVdm8xK9FA8pw6qkGArBhnbREr6tv?=
 =?us-ascii?Q?uqPkOBg8ihcmvTKx6A+GEx73gU74giQHDAkgSey31CZVHV8yCjDpHbHiUf5L?=
 =?us-ascii?Q?pMMQ7S0ct6po94EpdRTh1zU1Bhtt9rzcXTl6jQD8u/1Dwah/FXLJm1mncCyo?=
 =?us-ascii?Q?iZHJvkqyU7agK/L3SbSYE79SV8DACvWoREMOO49+qOVyyjbhngbQeJVMTpJ1?=
 =?us-ascii?Q?F4L+HNiHDl+CwzDJWTHcATfl2ACCA2ruaA8N+IxBGJ5lItf+Gmsoxwr64alT?=
 =?us-ascii?Q?d2dIQ95Y+/huBvqhzHK/3uIRyi7Lk8AMzCWWK+aNtDSNcys/gbcgc1dJdME4?=
 =?us-ascii?Q?MFtYF0vGQpp4uMv2rIW+hT23Q2NtAtjE+SpS/GEW5e/kuQxLmVFfqNJnF8HJ?=
 =?us-ascii?Q?mF91FhA8tsr1KEWWYc6xS2JOePJI9Fzc65Xgo4DFZbh5FMi37oLaTkWwP4Dm?=
 =?us-ascii?Q?V3QjpPTKx/tfkemLrf05mQMqUyryV/Wbkw8EpZ61GYdOy8Cmm320LQURFEGn?=
 =?us-ascii?Q?xykNJZTSymWy7L/U+iX3kbvNjRurtDxLvk7OWadEwr/8qqHr4oeAaaTBJ5mO?=
 =?us-ascii?Q?WqC+uXrBGxCfs6aaB2vYbcpt4Oa3evihR40MJL+MMBWuWW3UNtaWd55dudx1?=
 =?us-ascii?Q?kBHj1s4eNxvdlVqd348GJb6bmj5H7D/vsmAIshFIqQXruGLib21UJNfKcHac?=
 =?us-ascii?Q?VvC5XGvvqoynpmBfWKd3eH6MEIw9Yq6628BvvtEVFUZpnrhMancqnwRH3K6c?=
 =?us-ascii?Q?8vL7Am4b3ayJrwkvg/prv7rDaCvxfWjA3FJfqZ6rWAUYo4+/cFVtl/nb7qAk?=
 =?us-ascii?Q?gEzilrQq68ZqGDd9SQM8kSrfNaHeqFD3BUEKO1EF2XMqO2cZNVwL5aoju0o4?=
 =?us-ascii?Q?CrvgWiAmyIzsGNBKrhBv6VzDalnvjsvM7u/rrBhrglbDfFeiprHzg4x2YSbI?=
 =?us-ascii?Q?ODjjCYr2ZlHjavOR2cUvH0bVjhnfRU4/prA6tWjGd/tFH1tBLkXCs4xQMuId?=
 =?us-ascii?Q?S3H14Gikf2ilov6xrshm/o0yjBg1aCCtmBRLoBJQPrT0W51heu/yYTqM3KwM?=
 =?us-ascii?Q?4+FDodAIUNw5EmF541uEc9lwwdeEhQgULX8PvPkdHyBJZue4Df5Bgrf9zymK?=
 =?us-ascii?Q?fqlxHXxLHVtlI7d8PsX6uZDQA/lYTKEXhLAvL+Lh5wNfXGlN/dymtSp4e8cY?=
 =?us-ascii?Q?Nw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aedd9166-6696-43e8-7c45-08da8ae87790
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 00:33:46.9193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6a1CqTTdQjGNfdJ7i7Qr8eQzh2Z7AhCKHIEWhz95rT5Ib5sR9GPDmLZpAiTPTVCjiIuunvHwx1606aVWcfph06TMaGvS933zTofcK5Vzal4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4792
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Monday, August 29, 2022 10:03 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Sripada, Radhakrishna
> <radhakrishna.sripada@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH 5/8] drm/i915: Rename and expose common GT early init
> routine
>=20
> The common early GT init is needed for initialization of all GT types
> (root/primary, remote tile, standalone media).  Since standalone media
> (coming in the next patch) will be implemented in a separate file,
> rename and expose the function for use.
>=20
Reviewed-by: Radhakrishna Sripada <Radhakrishna.sripada@intel.com>

- RK Sripada
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c | 6 +++---
>  drivers/gpu/drm/i915/gt/intel_gt.h | 1 +
>  2 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c
> b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 7c0525e96155..d21ec11346a5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -35,7 +35,7 @@
>  #include "intel_uncore.h"
>  #include "shmem_utils.h"
>=20
> -static void __intel_gt_init_early(struct intel_gt *gt)
> +void intel_gt_common_init_early(struct intel_gt *gt)
>  {
>  	spin_lock_init(&gt->irq_lock);
>=20
> @@ -65,7 +65,7 @@ void intel_root_gt_init_early(struct drm_i915_private
> *i915)
>  	gt->i915 =3D i915;
>  	gt->uncore =3D &i915->uncore;
>=20
> -	__intel_gt_init_early(gt);
> +	intel_gt_common_init_early(gt);
>  }
>=20
>  static int intel_gt_probe_lmem(struct intel_gt *gt)
> @@ -789,7 +789,7 @@ static int intel_gt_tile_setup(struct intel_gt *gt,
> phys_addr_t phys_addr)
>=20
>  		gt->uncore =3D uncore;
>=20
> -		__intel_gt_init_early(gt);
> +		intel_gt_common_init_early(gt);
>  	}
>=20
>  	intel_uncore_init_early(gt->uncore, gt);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h
> b/drivers/gpu/drm/i915/gt/intel_gt.h
> index 4d8779529cc2..c9a359f35d0f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -44,6 +44,7 @@ static inline struct intel_gt *gsc_to_gt(struct intel_g=
sc
> *gsc)
>  	return container_of(gsc, struct intel_gt, gsc);
>  }
>=20
> +void intel_gt_common_init_early(struct intel_gt *gt);
>  void intel_root_gt_init_early(struct drm_i915_private *i915);
>  int intel_gt_assign_ggtt(struct intel_gt *gt);
>  int intel_gt_init_mmio(struct intel_gt *gt);
> --
> 2.37.2

