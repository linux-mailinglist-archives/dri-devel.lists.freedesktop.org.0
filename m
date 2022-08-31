Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D240B5A7228
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 02:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265F510E3A7;
	Wed, 31 Aug 2022 00:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C93D10E3A7;
 Wed, 31 Aug 2022 00:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661904071; x=1693440071;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wQUI853bpLWHtqTmW6wVEdkVB+FgwAW6gJvACb0Bs94=;
 b=Y7Spyyndb9LQxnbY5OhBsOqpt7C+Yzo8Bo2cyVeXbNRvexFryjNjoObm
 pl8LhsKvDT5XpVIZt4k5dibCIDihUTLhtnWSvhBC7XVTrnEtOa2IzZh0m
 aWR66aop7y0+SHTkR+NJ0WwGkH2v4LPjsUt0p3a/pFsVJtLStQiOibb5J
 nsskP7V6ATSJog36v9SYpwgBTxVBkUMhceItkghW78JVOV+6eG6zh4z6E
 sK+HJ9cSIjrzOmJXb2nnnmoGZuSMZ2P/2kkgB5XhPJv9fAiUUMcxsiXrh
 ahLPGE5049BoT7+m67qYmHTHB5dxJrP5gd29Y3G94+Ljw5qNqmZhiOVYS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="296119474"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; d="scan'208";a="296119474"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 17:01:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; d="scan'208";a="857297137"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2022 17:01:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 17:01:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 17:01:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 30 Aug 2022 17:01:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 30 Aug 2022 17:01:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJYop4xh1G+NO9pxHNba63s/9dms3CIdbl6OJP+pFwWBEACljl7vKuC2TBStK7ch4oPjeKHe+++UUVldcpw7GWNupD5TdOSq3W/GnfUmImf/PX4ZqfTeLCw+owMp/eh8+vFVoSNi0FsPZRLuX8FkHMjn65DXCS4J/7OJm2ST4+6YFllCiwBRL6vYJ5EtQIa2AyRTsX2L1vXOKKWj/HoAMyYjn+M/lgE44Ygy/weRd56dL6dAqIQu/rmPwO5jyehsuPsgTMtuOAkmdpZux28OvzdBRdPG28icJE5iA0frHal5SRTRk7pn7Ej1dcqp3Mr2mhvG0rdrT8FDcAYv8CfOag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bv5rxyoKH5mxqnxwxD8bBlHNbbT4gMyx4v6SiPcrBI=;
 b=ZaUvK6BTokALWLFj7Fv9ghYxyo4Tqv8GhGb+uNi+5JnyD0M35xs76coB30VFZm2kJyV3M0whIHfvG+NE3EMNTZZVzc0jsdFFif28iFU4qe2rcHCNOtNoUXFaW4eR9t/NP8PJ6LJ0GdSjKDjRD4DN0OoS8yNlrl9xqzwCfJkBpqC3DJIR55+R+d/t7MSRxBe8VBePeW9VWYEp3eDS5hbsH2AjiNv/pImQAGtCVzM9agLaj2+Ea+DfNqYKC3Hmmnh4ZsP0Qg4V7rIKq2+gL4ZVw7CMy0KXrQolbGnEBclJwpywRYuyUBkhHilC8SvALSIF/+04Z9dzcyVpzYjnv3m4vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Wed, 31 Aug 2022 00:01:06 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa%6]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 00:01:06 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/8] drm/i915: Only hook up uncore->debug for primary
 uncore
Thread-Topic: [PATCH 2/8] drm/i915: Only hook up uncore->debug for primary
 uncore
Thread-Index: AQHYu8kuOCFFtmtE7UW3yuPPYfIqYK3IEyiQ
Date: Wed, 31 Aug 2022 00:01:06 +0000
Message-ID: <DM4PR11MB5971DE2920F55A7D271C594687789@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20220829170238.969875-1-matthew.d.roper@intel.com>
 <20220829170238.969875-3-matthew.d.roper@intel.com>
In-Reply-To: <20220829170238.969875-3-matthew.d.roper@intel.com>
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
x-ms-office365-filtering-correlation-id: 252aa769-08b4-4da4-e915-08da8ae3e71d
x-ms-traffictypediagnostic: BYAPR11MB3320:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fxrcJfsRKgkE6lhpWOM8S7HkdQze+LgESHV1afuFq2DvKIDspHV0ugugFwwtFg9Es1FRCKW5HjLBOYEWrGGQtH5gfY4M4FxlMcJo0GZLIQu8KfwczKiYpJ1qNkl5AxrFMsNU8l981rOsqr6PA38Vcsmimpkw70O1c1KH+LiGSMfQfkaGS3fmwwoqD+F50jDlerMrIbawg+aZF/MZ7c8rQ5JEAJ6kM1Sv9yy3fD0+3lyjo9YIx2yMv/TUHlmEp2NgtbScyNGs1nWua3DylBqNLx0Vr+9uFDtUJ2097jOV/1EQyldxWJa6nyzFZgsV8tkxn8qi6b6LKEORVCDrkASZ2QNCrBsFbva64ZJ6fZtYfJlb/VPq9X8i4iTo7vxie2DhRpofUvhFQPZ4+FB9dahSbpHQDCDqzY6PgVbvG8QBnV0fJcrCnHeuKGco2F6t3VYqTPYwyzRgCyWpVhkqAP00gLItXOcLFDYv31lDXYWqmsqAXt0e8NMP3+C9theYVonkF6ivn1jRscGGZijdyDeucMphdsL5n4iZSs5aFfuDIlxuLsWTn9cFiCQB2p1RLul4YocUV42qz41YsPjnbjSG1kTfnji82nzLs170gV2Q0rz717RBGyqpiAPWJYO5tNtHo+UQ8/iBNiqg3m0FzcVkAwVvB4mTBD44bNiBXhMYebwtqyUT0V0ZiLlI3hOE3CbRqOCGqwwX2GzaEcvl1Jqsyy1Dk0cuI4S/PMmf/gFjXYEAP+Lnzb6NQcjFgHt5NyQXjN+kAmKgZ8UpumpBC8QWJvDV+26Gc/wD2PXPyd02I9ffZ/YwaFPf8RVcduccTPow
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(376002)(346002)(366004)(396003)(71200400001)(450100002)(316002)(186003)(33656002)(26005)(2906002)(6506007)(53546011)(7696005)(9686003)(83380400001)(38070700005)(82960400001)(122000001)(55016003)(64756008)(76116006)(38100700002)(8936002)(41300700001)(5660300002)(478600001)(110136005)(86362001)(66446008)(52536014)(4326008)(8676002)(66946007)(66476007)(66556008)(52103002)(158003001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KLZjqG0bUhFEUmAdQa0MwBBknVyhlPnkr4qisWZDxz8fI5q2KVN10omTnx0N?=
 =?us-ascii?Q?ToUkYi7AiD0coj9XsC/SZi9yA669IMiPELuxgZvfAek6dCZtvC5sDmGMm+n9?=
 =?us-ascii?Q?FLBpeY4K27GiBhIgBn6ihOKdEwj777YjnumVk1dQbb6qeG5OXfHslkVrpBvJ?=
 =?us-ascii?Q?4sknPdE+1wGoAaB1AB3W3yk1etHqiNqqVthXiepfRvwtadKy2OIFqj6d74Rv?=
 =?us-ascii?Q?p8ASWMbD1lsSgLKoWvjirUgfg3dZ8a7CRoPHRS8H2gOpPnDSeHBm0nbKf4WD?=
 =?us-ascii?Q?nJKDXOd9qtzIjxMIbI3rP1PWQGizpsCDEl4E8jA12W/a4XyTHPlzONSuXZas?=
 =?us-ascii?Q?v3m8KJ8jlTWEcSRGthSt0eTdgtH6vhnlWv3KvsOCB0uM7U8YYgXm765A+TmH?=
 =?us-ascii?Q?7MY78xdA0tAeuQsqd6EPgCWz9eBI0ae4EJ3vu9h7wf2qomaYUxBtaeJFFD4f?=
 =?us-ascii?Q?nBBt5kMyFHZeW9ilodhy30CHcjUbus6onn4NwfgdFUffQ2haYb7FkTUkM+6d?=
 =?us-ascii?Q?mSNctmsCR2+4REdKNxpoQu7FJVGsioTXz8q5kfI3fqZzqywUp9yLeQoOP2gl?=
 =?us-ascii?Q?jMPOJjKi7eWTZobp0A+5FqgbgOD4QutkQtRdCCo7gRP9aU/2O75fcyWKGi3F?=
 =?us-ascii?Q?nrAnPfrOhE//A+Xcv72WuU0Sq9F1juAObefdVltS3P9Ez1VDObAQUVJ0Rn/y?=
 =?us-ascii?Q?8ScGfTwMHoQ7weez80dwMlP/m85ZR3TTmfp/c2qkEUxBowLm1YmZhuobNl/k?=
 =?us-ascii?Q?mP8i7sre3K8Z97gFrT0hcpfK5WiZmOnUHwr9byIlk6hMO75MRe80or+ve/QQ?=
 =?us-ascii?Q?W1zC/zYOfc3flfhjPbIsqPix6u0CclYBDqB/mojb6wj3gIiEp4O1jHHap5fA?=
 =?us-ascii?Q?/nGaXPWDzUAeVSzrmkhXRkwXCHW0oJ8Xo2i6EP9oIkqZEJx4i2i/orW5TAzq?=
 =?us-ascii?Q?VrJH/AKq9LozRreASX3hu+BoWgrR5dlOI3zI9l5OmA7KIJ+4wB06J92AnVnM?=
 =?us-ascii?Q?bbmVcKNfUIkGgzQROqf9LMqiI+CdOwTIsEAdQpFg2KgCBjGW12orioGrDt74?=
 =?us-ascii?Q?uvFUGCyJytaz3GYRmwCTzG3YaBx77k4kAOATfpc6Xw3T10dEwS88uggVdfBk?=
 =?us-ascii?Q?j+kYXiDzCP8GxfwdTaW7RUjIdKkg3OYdoWKh9VVW0PioNNOE7EuMC/eNhzZ8?=
 =?us-ascii?Q?TZk3spfzLCRGdAOqyTtj07H5NWpLLWBc324pHRGbtliEFiZL9gW5757JEt8V?=
 =?us-ascii?Q?O2Dq1N/CzmWSLRGKhCb0IUVHQv628o/Ubb0FqcC8iwc9TQKk4KfBNWvolt56?=
 =?us-ascii?Q?Ifo5j5JXej6v8fbbpyBQIjm78NA39OTRzT8NGpm5L5Hyfb4b0U3atLJq/RQH?=
 =?us-ascii?Q?kWNZkk6Pg1BFb8Cxjpi/q/5qoVYVeP6EItOQezAtdY1n0p/28CsScYrYIlWx?=
 =?us-ascii?Q?Vq0iWd8KXfoL/XIIuLPypUgfTleFI68HBjRbrT8OLIzW14M1Phy15ud8qrmD?=
 =?us-ascii?Q?JsFdEaFrRNJ15YQF+QqTT4s8pFzwHvUk4JhzGePwd/HX+vp3reg199ArGYgV?=
 =?us-ascii?Q?P/OsR7/R4n/VJLUnL/vQGpZa8VmaYcGiHG200ZUv4I23RVyb017+L71Xp96a?=
 =?us-ascii?Q?3A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 252aa769-08b4-4da4-e915-08da8ae3e71d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 00:01:06.5428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DxbcHgdiTLY2kQPtTHgmGtxwfn+KRCRJeu6lWiQO/06lboGTzs3NxUimg15na71YYuhfCcccxsURhD2wtKD0SMPwZ8+QQkK+eKiNNxmeZGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3320
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

Hi Matt,

> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Monday, August 29, 2022 10:03 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Sripada, Radhakrishna
> <radhakrishna.sripada@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH 2/8] drm/i915: Only hook up uncore->debug for primary unc=
ore
>=20
> The original intent of intel_uncore_mmio_debug as described in commit
> 0a9b26306d6a ("drm/i915: split out uncore_mmio_debug") was to be a
> singleton structure that could be shared between multiple GTs' uncore
> objects in a multi-tile system.  Somehow we went off track and
> started allocating separate instances of this structure for each GT,
> which defeats that original goal.
>=20
> But in reality, there isn't even a need to share the mmio_debug between
> multiple GTs; on all modern platforms (i.e., everything after gen7)
> unclaimed register accesses are something that can only be detected for
> display registers.  There's no point in grabbing the debug spinlock and
> checking for unclaimed accesses on an uncore used by an xehpsdv or pvc
> remote tile GT, or the uncore used by a mtl standalone media GT since
> all of the display accesses go through the primary intel_uncore.
>=20
> The simplest solution is to simply leave uncore->debug NULL on all
> intel_uncore instances except for the primary one.  This will allow us
> to avoid the pointless debug spinlock acquisition we've been doing on
> MMIO accesses coming in through these intel_uncores.
>=20
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c  |  9 ---------
>  drivers/gpu/drm/i915/i915_driver.c  |  2 +-
>  drivers/gpu/drm/i915/intel_uncore.c | 23 ++++++++++++++++++-----
>  drivers/gpu/drm/i915/intel_uncore.h |  3 +--
>  4 files changed, 20 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c
> b/drivers/gpu/drm/i915/gt/intel_gt.c
> index e4bac2431e41..a82b5e2e0d83 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -781,21 +781,13 @@ static int intel_gt_tile_setup(struct intel_gt *gt,
> phys_addr_t phys_addr)
>  	int ret;
>=20
>  	if (!gt_is_root(gt)) {
> -		struct intel_uncore_mmio_debug *mmio_debug;
>  		struct intel_uncore *uncore;
>=20
>  		uncore =3D kzalloc(sizeof(*uncore), GFP_KERNEL);
>  		if (!uncore)
>  			return -ENOMEM;
>=20
> -		mmio_debug =3D kzalloc(sizeof(*mmio_debug), GFP_KERNEL);
> -		if (!mmio_debug) {
> -			kfree(uncore);
> -			return -ENOMEM;
> -		}
> -
>  		gt->uncore =3D uncore;
> -		gt->uncore->debug =3D mmio_debug;
>=20
>  		__intel_gt_init_early(gt);
>  	}
> @@ -817,7 +809,6 @@ intel_gt_tile_cleanup(struct intel_gt *gt)
>  	intel_uncore_cleanup_mmio(gt->uncore);
>=20
>  	if (!gt_is_root(gt)) {
> -		kfree(gt->uncore->debug);
>  		kfree(gt->uncore);
>  		kfree(gt);
>  	}
> diff --git a/drivers/gpu/drm/i915/i915_driver.c
> b/drivers/gpu/drm/i915/i915_driver.c
> index 053a7dab5506..de9020771836 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -326,7 +326,7 @@ static int i915_driver_early_probe(struct
> drm_i915_private *dev_priv)
>  	intel_device_info_subplatform_init(dev_priv);
>  	intel_step_init(dev_priv);
>=20
> -	intel_uncore_mmio_debug_init_early(&dev_priv->mmio_debug);
> +	intel_uncore_mmio_debug_init_early(dev_priv);
>=20
>  	spin_lock_init(&dev_priv->irq_lock);
>  	spin_lock_init(&dev_priv->gpu_error.lock);
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c
> b/drivers/gpu/drm/i915/intel_uncore.c
> index e717ea55484a..6841f76533f9 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -44,14 +44,19 @@ fw_domains_get(struct intel_uncore *uncore, enum
> forcewake_domains fw_domains)
>  }
>=20
>  void
> -intel_uncore_mmio_debug_init_early(struct intel_uncore_mmio_debug
> *mmio_debug)
> +intel_uncore_mmio_debug_init_early(struct drm_i915_private *i915)
>  {
> -	spin_lock_init(&mmio_debug->lock);
> -	mmio_debug->unclaimed_mmio_check =3D 1;
> +	spin_lock_init(&i915->mmio_debug.lock);
> +	i915->mmio_debug.unclaimed_mmio_check =3D 1;
> +
> +	i915->uncore.debug =3D &i915->mmio_debug;
>  }
>=20
>  static void mmio_debug_suspend(struct intel_uncore *uncore)
>  {
> +	if (!uncore->debug)
> +		return;
> +
>  	spin_lock(&uncore->debug->lock);
>=20
>  	/* Save and disable mmio debugging for the user bypass */
> @@ -67,6 +72,9 @@ static bool check_for_unclaimed_mmio(struct
> intel_uncore *uncore);
>=20
>  static void mmio_debug_resume(struct intel_uncore *uncore)
>  {
> +	if (!uncore->debug)
> +		return;
> +
>  	spin_lock(&uncore->debug->lock);
>=20
>  	if (!--uncore->debug->suspend_count)
> @@ -1705,7 +1713,7 @@ unclaimed_reg_debug(struct intel_uncore *uncore,
>  		    const bool read,
>  		    const bool before)
>  {
> -	if (likely(!uncore->i915->params.mmio_debug))
> +	if (likely(!uncore->i915->params.mmio_debug) || !uncore->debug)
>  		return;
>=20
>  	/* interrupts are disabled and re-enabled around uncore->lock usage */
> @@ -2267,7 +2275,6 @@ void intel_uncore_init_early(struct intel_uncore
> *uncore,
>  	uncore->i915 =3D gt->i915;
>  	uncore->gt =3D gt;
>  	uncore->rpm =3D &gt->i915->runtime_pm;
> -	uncore->debug =3D &gt->i915->mmio_debug;
>  }
>=20
>  static void uncore_raw_init(struct intel_uncore *uncore)
> @@ -2578,6 +2585,9 @@ bool intel_uncore_unclaimed_mmio(struct
> intel_uncore *uncore)
>  {
>  	bool ret;
>=20
> +	if (!uncore->debug)
> +		return false;
> +
>  	spin_lock_irq(&uncore->debug->lock);
>  	ret =3D check_for_unclaimed_mmio(uncore);
>  	spin_unlock_irq(&uncore->debug->lock);
> @@ -2590,6 +2600,9 @@ intel_uncore_arm_unclaimed_mmio_detection(struct
> intel_uncore *uncore)
>  {
>  	bool ret =3D false;
>=20
> +	if (drm_WARN_ON(&uncore->i915->drm, !uncore->debug))
> +		return false;
> +
>  	spin_lock_irq(&uncore->debug->lock);
>=20
>  	if (unlikely(uncore->debug->unclaimed_mmio_check <=3D 0))
> diff --git a/drivers/gpu/drm/i915/intel_uncore.h
> b/drivers/gpu/drm/i915/intel_uncore.h
> index b1fa912a65e7..6100d0f4498a 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.h
> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> @@ -210,8 +210,7 @@ intel_uncore_has_fifo(const struct intel_uncore
> *uncore)
>  	return uncore->flags & UNCORE_HAS_FIFO;
>  }
>=20
> -void
> -intel_uncore_mmio_debug_init_early(struct intel_uncore_mmio_debug
> *mmio_debug);
> +void intel_uncore_mmio_debug_init_early(struct drm_i915_private *i915);
>  void intel_uncore_init_early(struct intel_uncore *uncore,
>  			     struct intel_gt *gt);
>  int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t
> phys_addr);
> --
> 2.37.2

