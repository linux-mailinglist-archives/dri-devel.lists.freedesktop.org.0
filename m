Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AE55A7263
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 02:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CC810E405;
	Wed, 31 Aug 2022 00:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0984910E403;
 Wed, 31 Aug 2022 00:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661905653; x=1693441653;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u99Oe2ovJcKH68Vg/LgBjk3qgk9uwUzbX6zxGwDefTw=;
 b=ITveAg5BqEE0apiCCwtNUS+4Z/J4wwHq3wznT5/pDjHpHaOGVInUxdMH
 Y+FZI2QVudeekshqOIPW+m9gRX4beMoRjUsAak+Z9XfG2EVqkh7GFVDtQ
 6bjkW1Pt0gKvRCNGjENltmEAZJj3z+v/po7ZNX8PF2gvxhO+7Y2NYBZLY
 kYJ4H5IJSLls/2z7F7CYCBSOI+mzwQVwVxLDnCA3jM7n9ax3sXWbtX49s
 c4NXaaVY2vea6nCj2ZM9BIcR+FD1dAPQIiSeDizEm6BaVHsdqYipiIukD
 gb1sOZNJvq6xx2k6dC/fHsX904XNZat1usxWUSEaGFFxSJPWNtiLk2V+p g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="359298522"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; d="scan'208";a="359298522"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 17:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; d="scan'208";a="614819382"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 30 Aug 2022 17:27:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 17:27:31 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 30 Aug 2022 17:27:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 30 Aug 2022 17:27:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 30 Aug 2022 17:27:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOx+sOaEvJP1yxxC5mg5aDHQhGIC3a1FuPMKP9rOxHuXRFQbEuia8zlVJsmZn2UPPZC59jFGz6Z3/GDVMr3KeXgE9UAj6qvfPzk9JF6eSp59hUi1DXqVScRhjEhLXm+hY4JkN+XlvBVI3PzH+ngFDMgGfHkiFLqEaubD2bEuaqSLtWjKANYpi9C+M6dv8eH/DrPqO1k/BbSRGxz3s0SMuxqVSGV7rfa95DuX5aL9gLYCeePdhlOCd9k9MqTCWo/7cokCFsODrxkcQLW8gCIvj3rB4UAc0xdaM6tGeUc1Wi8KvVaIkdwTcC0jrH9SLEB244MUNo0J1aYpyMX2KI3yUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnPZylrvfD6wx/jf0EZ3SkUWYM02kCiju5cATyoIYJM=;
 b=QS1pai7rsGyqI9TvOfVg7v0fvhdEWuByBapr/Z0FxFjczurMopofHvL0Gz7GVjnMHuIn+Q2XLQK84e7/5+TBWP9lmf2WIDbH9Pl0mBvAEcCLIGJmdbqQDvZ1KNQDdVb+RqwmN2KUiHvMOjIo6rGTBFgeVx77hRwGRd4pSO2aSiTUBsn9C9979Pb1IxRE4wDHJT0Mb2BFM87iO7CrAdMXuQmye1sTgyzJ6RK8gpiSyli83cVCqB0AknwY3NwhK5osBZM3yfivoieEJTYV4Phib0fzWtK4+mpB9CXpkJpUGIZi+Tf2vDA5565O73H2stbKa73G7Z1v0iW1tksupnhpDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 DM4PR11MB5246.namprd11.prod.outlook.com (2603:10b6:5:389::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Wed, 31 Aug 2022 00:27:29 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::5041:7722:96be:d8aa%6]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 00:27:29 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/8] drm/i915: Prepare more multi-GT initialization
Thread-Topic: [PATCH 4/8] drm/i915: Prepare more multi-GT initialization
Thread-Index: AQHYu8k2dmHh35X4DEmhNEh4j43LD63IKQZQ
Date: Wed, 31 Aug 2022 00:27:29 +0000
Message-ID: <DM4PR11MB5971D828B3D75D6F08599E8E87789@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20220829170238.969875-1-matthew.d.roper@intel.com>
 <20220829170238.969875-5-matthew.d.roper@intel.com>
In-Reply-To: <20220829170238.969875-5-matthew.d.roper@intel.com>
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
x-ms-office365-filtering-correlation-id: c5a88cca-ece2-4922-c8d1-08da8ae79688
x-ms-traffictypediagnostic: DM4PR11MB5246:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R7RWbRy2vweucdiDXdAn2dd6UPE6TeFuAd5fJqmQvSAYtLr05gWnDIE/k6D37j9K5qdUrBDoPe/iBWu6ly8BwMCMwx4K2JBnxLsKsg2jxu/fdyDFdhw+986kN1HdjxN++sf0xAsfb1YYgBF29m7RbVK7xFcD8vcoGUVxStSRo2RQ03zJPyAGgAjzUYqv047ccXnMl1T9MI7FOoEtcgYnZlNNtTq5rDAZZU4+rNv5He97UsuYAzFHxmfzOyp+fd/XVpf91WK7e80ZxnejW5G21KYH+a8oSRQc7IhzRRY1Wpd0UryiQJpJAfbWyXsW1/QZXt1LbLr4O+vY3AFMAe1PYbDLs3Jqn2WHREuTh2RV+BpA4NmmouuQACaQUKlWi2zAMU5Edc8G+c5fdt8aNtXe/411kbDaVHswx8R7gmsLprrnUdiQFMET9WHnRG61IixjCsWSQ5mJpV0eCmnz0U66emDGF6XeKiwvqb3QKVgn9c/HPaOFxzhZVIcFnIDgAQtddqcUG1BFvp9EjNGmsziZqfiFdck30CLFQBy8K1cMlNX6tzMaIReh4O90CtaawaSDXIuKAht8ectB4+GUf1A/hBk3g6+yc2aNNadI+reG6mAruPUj3SHF1+owLT6ZNlook7b/EpXrBlpiQk8ub6KcxucjvDLpN5Dou/XMQ6z+Eds9qEUeCydVaYdvh0ord4ghGIoaF8YpZt9ruM++dhydkpHbF+2biGjCISxdACRnxjuJ3aXzN/7+FF5cCmxES9S9WjnCkimWxGRwWy+vuWkwiw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(39860400002)(376002)(396003)(366004)(5660300002)(107886003)(52536014)(41300700001)(8936002)(55016003)(186003)(2906002)(6506007)(53546011)(7696005)(86362001)(26005)(83380400001)(33656002)(9686003)(478600001)(122000001)(71200400001)(76116006)(110136005)(316002)(54906003)(8676002)(38100700002)(66946007)(4326008)(82960400001)(38070700005)(66446008)(64756008)(66556008)(450100002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5CKZqTe4InZAl8whQs9AdhD5QV5mKZmz40nEiJzLPs9kXOVBtClB9nKCCiMy?=
 =?us-ascii?Q?fWLA4mSumjbsW+VUPV+TUdlVoTNrIRjMXTpN/71Y6b/Bl9vkW/3m0gmmmkQs?=
 =?us-ascii?Q?9TG2826VuFQv2XSUu1ybJrqnVF8DK2PEHw2KJ2c1ve/r2wgchORTNmEHG3mJ?=
 =?us-ascii?Q?wTid8fsgoneYOE2YZ7GYUigY3LQZO+fX/Jots0KpdRfPi4Ik4ZuH0jl5cHRv?=
 =?us-ascii?Q?jNl6Lig2R8EA2sEde69uzXLxwq9HXty6CB7fLvMszousVI+r9vfQtQ+fIliB?=
 =?us-ascii?Q?kzipOD9DWhDPN3yrcGcqFadAeeIIJ2Lf2tobB2N7lrQta34ueOGKqUUeJTrl?=
 =?us-ascii?Q?kqG4+q+RLfX/jjiq04tPMZIfNP3lV5rXif84D5FGTClOu4JawAZVzNPcV/hP?=
 =?us-ascii?Q?vwGhkSfGKPB6ug4AsogL+ifVV/Ry9axc6AoFUxh2LeIoz/G3npwhXLiW29+a?=
 =?us-ascii?Q?Q8hx3z49DE0HnvLKHSONtzyNGioq8IUOLl11b3JUtfrWiKNZIguNAx/aXM6t?=
 =?us-ascii?Q?CdxpC2vUAXTAJEP3Kpe9mxEoMRc0s5NIKvOf+tOIxp7Ef32FFoj3B13ndS6N?=
 =?us-ascii?Q?6Gkz3XU+Y8HHOIMqoBQ9YXcNAmJc8j1HLhT+nPv9eNzMczzYxtXmE5MUm3Ai?=
 =?us-ascii?Q?Ma/rmOvbYN7iRfDlzWMfja0/bekrZs35BDaJp/h2SLpnEvxKq5wqNy/Cnq9O?=
 =?us-ascii?Q?+xoLHeQQnxM8Ym/MXgqXFA6zOoWN2PpQRVnr674Oi4maeXUyw+qvo2lPOqyH?=
 =?us-ascii?Q?6YOnb8AYN5NO/oDyChZEuTMFd+qS7OZTVEwhwrlC7s33xxlstADKT9OggKCq?=
 =?us-ascii?Q?gaIdP1vh6BggohdVy5FPKT3aigevdObCo6vSVPzC7JU3B994aaXJDLaSj/VA?=
 =?us-ascii?Q?TIZLu+9LvDWxQkf2dlmVplhxIH67iTrr3Ggn1i5Lc0lIPMiVTTUEiITVewX5?=
 =?us-ascii?Q?/1VN6ax5X9+9WJ0xZpAjeVtzQkPJtXPBlvMPb+AOcyPOoCi3Kbx4MMDuIoSc?=
 =?us-ascii?Q?fWbB+29076p2VhXtHUfRyCvo63Rafn2v7fwe6bWbro3owdvNjJkgR1mlu2GT?=
 =?us-ascii?Q?ElD6SyGIZZlIftx1Ou8k+wAjoZH24M3iQ8G1ptZ8zEXR9kA/8/l+XXOsv0mZ?=
 =?us-ascii?Q?B/gUDTegi2/Un+6FI9iXZ5peBLQhsZMwcdTEJSO2ExkArgzXmguUjNg1FARj?=
 =?us-ascii?Q?DEqlN1YeQAAt5bP4O1AjLbvUwYLbsUrCCfo1BC6yWzJBZMB9o2R6+ohZdmOt?=
 =?us-ascii?Q?H9u5k/1inKYRXYqJe4BHX/sD7RAdQjS7qKDZyLUcg/rf8fxus3gZFCdA7CHh?=
 =?us-ascii?Q?XiHNP2mmRHJHV712oW9+hVlQl9dsCKvNYQ360t73QPrG4AJKifVcY5M+tqkY?=
 =?us-ascii?Q?vznH5ijE8lpsGTs1bAobwFAJkD90qcNlZw013HzQOVP1IiHv90pqagqA5MWf?=
 =?us-ascii?Q?7kbcYHmdNRj6JngtpjoDnC2lM3Ta+/9qfqWT3Qid1pUUE3KpcrxPWSaRHp/9?=
 =?us-ascii?Q?FFa95qT5Mq2LHv8w/ktLmL9WI60LA017SRYkeZelgi4XiHGNMBUxBN1JigLm?=
 =?us-ascii?Q?oUbehWdlKyjYw+S96xHZBpSZS6ORPypLQr6vR5PE1BVny8kUr4eQGYvSK5bJ?=
 =?us-ascii?Q?kg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a88cca-ece2-4922-c8d1-08da8ae79688
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 00:27:29.3659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7BgxdOAtiIkGKKrN8Kz7Oafp2UaYEyOv8cCvsE5pr/1t68mwZ/6N7C7/32AsKOrhGdV0QBBDprXUjaSX9qkUQq8S7UI0wtffiO19kMmcdNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5246
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
Cc: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Monday, August 29, 2022 10:03 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Sripada, Radhakrishna
> <radhakrishna.sripada@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>
> Subject: [PATCH 4/8] drm/i915: Prepare more multi-GT initialization
>=20
> We're going to introduce an additional intel_gt for MTL's media unit
> soon.  Let's provide a bit more multi-GT initialization framework in
> preparation for that.  The initialization will pull the list of GTs for
> a platform from the device info structure.  Although necessary for the
> immediate MTL media enabling, this same framework will also be used
> farther down the road when we enable remote tiles on xehpsdv and pvc.
>=20
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
LGTM.
Reviewed-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

- RK Sripada

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
>  drivers/gpu/drm/i915/gt/intel_gt.c            | 48 +++++++++++++++++--
>  drivers/gpu/drm/i915/gt/intel_gt.h            |  1 -
>  drivers/gpu/drm/i915/gt/intel_gt_types.h      |  3 ++
>  drivers/gpu/drm/i915/i915_drv.h               |  2 +
>  drivers/gpu/drm/i915/intel_device_info.h      | 16 +++++++
>  .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 +
>  7 files changed, 67 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 275ad72940c1..41acc285e8bf 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -736,7 +736,7 @@ static intel_engine_mask_t init_engine_mask(struct
> intel_gt *gt)
>  	u16 vdbox_mask;
>  	u16 vebox_mask;
>=20
> -	info->engine_mask =3D RUNTIME_INFO(i915)->platform_engine_mask;
> +	GEM_BUG_ON(!info->engine_mask);
>=20
>  	if (GRAPHICS_VER(i915) < 11)
>  		return info->engine_mask;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c
> b/drivers/gpu/drm/i915/gt/intel_gt.c
> index cf7aab7adb30..7c0525e96155 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -807,17 +807,16 @@ static void
>  intel_gt_tile_cleanup(struct intel_gt *gt)
>  {
>  	intel_uncore_cleanup_mmio(gt->uncore);
> -
> -	if (!gt_is_root(gt))
> -		kfree(gt);
>  }
>=20
>  int intel_gt_probe_all(struct drm_i915_private *i915)
>  {
>  	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>  	struct intel_gt *gt =3D &i915->gt0;
> +	const struct intel_gt_definition *gtdef;
>  	phys_addr_t phys_addr;
>  	unsigned int mmio_bar;
> +	unsigned int i;
>  	int ret;
>=20
>  	mmio_bar =3D GRAPHICS_VER(i915) =3D=3D 2 ? GEN2_GTTMMADR_BAR :
> GTTMMADR_BAR;
> @@ -828,14 +827,55 @@ int intel_gt_probe_all(struct drm_i915_private *i91=
5)
>  	 * and it has been already initialized early during probe
>  	 * in i915_driver_probe()
>  	 */
> +	gt->i915 =3D i915;
> +	gt->name =3D "Primary GT";
> +	gt->info.engine_mask =3D RUNTIME_INFO(i915)->platform_engine_mask;
> +
> +	drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
>  	ret =3D intel_gt_tile_setup(gt, phys_addr);
>  	if (ret)
>  		return ret;
>=20
>  	i915->gt[0] =3D gt;
>=20
> -	/* TODO: add more tiles */
> +	for (i =3D 1, gtdef =3D &INTEL_INFO(i915)->extra_gt_list[i - 1];
> +	     gtdef->setup !=3D NULL;
> +	     i++, gtdef =3D &INTEL_INFO(i915)->extra_gt_list[i - 1]) {
> +		gt =3D drmm_kzalloc(&i915->drm, sizeof(*gt), GFP_KERNEL);
> +		if (!gt) {
> +			ret =3D -ENOMEM;
> +			goto err;
> +		}
> +
> +		gt->i915 =3D i915;
> +		gt->name =3D gtdef->name;
> +		gt->type =3D gtdef->type;
> +		gt->info.engine_mask =3D gtdef->engine_mask;
> +		gt->info.id =3D i;
> +
> +		drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
> +		if (GEM_WARN_ON(range_overflows_t(resource_size_t,
> +						  gtdef->mapping_base,
> +						  SZ_16M,
> +						  pci_resource_len(pdev,
> mmio_bar)))) {
> +			ret =3D -ENODEV;
> +			goto err;
> +		}
> +
> +		ret =3D gtdef->setup(gt, phys_addr + gtdef->mapping_base);
> +		if (ret)
> +			goto err;
> +
> +		i915->gt[i] =3D gt;
> +	}
> +
>  	return 0;
> +
> +err:
> +	i915_probe_error(i915, "Failed to initialize %s! (%d)\n", gtdef->name,
> ret);
> +	intel_gt_release_all(i915);
> +
> +	return ret;
>  }
>=20
>  int intel_gt_tiles_init(struct drm_i915_private *i915)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h
> b/drivers/gpu/drm/i915/gt/intel_gt.h
> index 40b06adf509a..4d8779529cc2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -54,7 +54,6 @@ void intel_gt_driver_register(struct intel_gt *gt);
>  void intel_gt_driver_unregister(struct intel_gt *gt);
>  void intel_gt_driver_remove(struct intel_gt *gt);
>  void intel_gt_driver_release(struct intel_gt *gt);
> -
>  void intel_gt_driver_late_release_all(struct drm_i915_private *i915);
>=20
>  int intel_gt_wait_for_idle(struct intel_gt *gt, long timeout);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 4d56f7d5a3be..3bd36caee321 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -83,6 +83,9 @@ struct gt_defaults {
>=20
>  struct intel_gt {
>  	struct drm_i915_private *i915;
> +	const char *name;
> +	enum intel_gt_type type;
> +
>  	struct intel_uncore *uncore;
>  	struct i915_ggtt *ggtt;
>=20
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index 443ed6dac92a..d45dca70bfa6 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1061,6 +1061,8 @@ IS_SUBPLATFORM(const struct drm_i915_private
> *i915,
>  #define HAS_REGION(i915, i) (RUNTIME_INFO(i915)->memory_regions & (i))
>  #define HAS_LMEM(i915) HAS_REGION(i915, REGION_LMEM)
>=20
> +#define HAS_EXTRA_GT_LIST(dev_priv)   (INTEL_INFO(dev_priv)->extra_gt_li=
st)
> +
>  /*
>   * Platform has the dedicated compression control state for each lmem su=
rfaces
>   * stored in lmem to support the 3D and media compression formats.
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h
> b/drivers/gpu/drm/i915/intel_device_info.h
> index 0ccde94b225f..e0b79dc0fccc 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -244,6 +244,20 @@ struct intel_runtime_info {
>  	};
>  };
>=20
> +enum intel_gt_type {
> +	GT_PRIMARY,
> +	GT_TILE,
> +};
> +
> +struct intel_gt_definition {
> +	enum intel_gt_type type;
> +	char *name;
> +	int (*setup)(struct intel_gt *gt,
> +		     phys_addr_t phys_addr);
> +	u32 mapping_base;
> +	intel_engine_mask_t engine_mask;
> +};
> +
>  struct intel_device_info {
>  	struct ip_version media;
>=20
> @@ -251,6 +265,8 @@ struct intel_device_info {
>=20
>  	unsigned int dma_mask_size; /* available DMA address bits */
>=20
> +	const struct intel_gt_definition *extra_gt_list;
> +
>  	u8 gt; /* GT number, 0 if undefined */
>=20
>  #define DEFINE_FLAG(name) u8 name:1
> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> index f5904e659ef2..915d58ba383e 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> @@ -115,6 +115,7 @@ static struct dev_pm_domain pm_domain =3D {
>  static void mock_gt_probe(struct drm_i915_private *i915)
>  {
>  	i915->gt[0] =3D &i915->gt0;
> +	i915->gt[0]->name =3D "Mock GT";
>  }
>=20
>  struct drm_i915_private *mock_gem_device(void)
> --
> 2.37.2

