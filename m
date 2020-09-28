Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6275627B1ED
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 18:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9E789E39;
	Mon, 28 Sep 2020 16:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2204789E2B;
 Mon, 28 Sep 2020 16:32:07 +0000 (UTC)
IronPort-SDR: mD1iCOzP+P4KVOAg4DjHV7RKs8a/N0BRWIHQtTwTgWcDLujYQzxF/L/oilCPm1hkNwrlCZrLmL
 Ns6I44zRvIuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="162080889"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
 d="scan'208,217";a="162080889"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 09:32:02 -0700
IronPort-SDR: r+BVsx7+fRSR96KGZZnRQbLO2vNIHepOMohfyXUyFwD13Z2YHc8NO2ew8P+gD+fCjkWD1884Dk
 L545swohoL6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
 d="scan'208,217";a="415029002"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2020 09:32:01 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 28 Sep 2020 09:32:01 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 28 Sep 2020 09:32:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 28 Sep 2020 09:32:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 28 Sep 2020 09:32:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAoBz24+8zMNtFAZts3azksBPecah3z7DhQlUz1PPrNSwyciRBhRhpmhDTdDcosiszOGx9lmN7JhRHIch97sKY+8Mv6VMpun8VdHIGZ8G0w4TR1ndYy1w68xvT3oiE+pwTRzhofS/pTxppGQ8H0hdQ55DAe6I/IxFnxAoPMYtYRpqWOG1XQ85HLSUBGmRriEthjWd2wTmDDg6jKz9FZW9HKLCu1ihFziSB8uCp7cm3QAbVzCYaABe/jwrDPCwMsFqzdixAOnlwcNXP3CvnL2RVQ5d9aM+CO6WFbXCqrLYQoaoXdESIFsvgQaWk4Swq4r8iR6qaUM9gvaF97axW9Sng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xV4uiUXbkJFZTxiKA3dwvzTfXIRavasrlz/HnMVLed0=;
 b=ItqH6faAfO42gYkI1aVtJaAOQqhz57kSH1wZp8oYYx+vYuzMMBx2kTaUJLiJj8s/Thp1Q9l3StAJgJfBaEfit6Og+hDrCQR29turog9GO7r9a6SWesj3AZoKk7UqXDFxJI5htz4ImKSouDphqSGcKLIEFzQ9MAszKRTT2MYpqPyDQEZzvqxqG0CIwi4sTXhGm55Rw6VhwU91pL7RTyP33y7lydihbVa5sTWySqvygHjOa1S6vJYPBYh+VljlzQl1Zt4Y2T4vVelL9znhAsnjJ0wIEn1m8afJit2dvkhQVVbQVIfOZhJSkwwbVn6GEweBkEoNin44mVuMeZ08+J7dNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xV4uiUXbkJFZTxiKA3dwvzTfXIRavasrlz/HnMVLed0=;
 b=ogAtnckbzJlpMNy+07DX9d5bfwW7+HDPYR1oxz5wR2YaJcXWvHXwjqcYKOGvUQ0EAlvoA9Q5xO8/Ngbcb9pB9wvm6KR7LWes7wMzz/gSpkqBUVU4dsvcPRgJaLvcqZBy3UUBD9Z/au9OacOdPppOXR3eCNDghXgBxMFVMnqu0ls=
Received: from SN6PR11MB3421.namprd11.prod.outlook.com (2603:10b6:805:cd::27)
 by SA0PR11MB4621.namprd11.prod.outlook.com (2603:10b6:806:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Mon, 28 Sep
 2020 16:31:58 +0000
Received: from SN6PR11MB3421.namprd11.prod.outlook.com
 ([fe80::85cc:7d43:b53d:33ff]) by SN6PR11MB3421.namprd11.prod.outlook.com
 ([fe80::85cc:7d43:b53d:33ff%7]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 16:31:58 +0000
From: "Surendrakumar Upadhyay, TejaskumarX"
 <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Ausmus, James" <james.ausmus@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Pandey, Hariom" <hariom.pandey@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/jsl: Split EHL/JSL platform info and PCI ids
Thread-Topic: [PATCH 1/2] drm/i915/jsl: Split EHL/JSL platform info and PCI ids
Thread-Index: AQHWlW/hWatVdsGmgEqBxYS63h22F6l+DhuAgAAv1YY=
Date: Mon, 28 Sep 2020 16:31:58 +0000
Message-ID: <SN6PR11MB3421571FA9A490C67E0E9D82DF350@SN6PR11MB3421.namprd11.prod.outlook.com>
References: <20200928080931.246347-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20200928080931.246347-2-tejaskumarx.surendrakumar.upadhyay@intel.com>,
 <87d026owdq.fsf@intel.com>
In-Reply-To: <87d026owdq.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [103.240.170.163]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcd436bb-f383-46b2-fa91-08d863cc054a
x-ms-traffictypediagnostic: SA0PR11MB4621:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4621DB4CF181EF64091C2715DF350@SA0PR11MB4621.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yoebpBz5pJxdnZ/O3ROO8DYK6LQ9PvpSpW2M68/nHuHInBRV/jezHBfRkiw0s3NKZ6YJTrAaJpsMHTYNLwvTeayxF+8i2q3lDPL5Wd/nr9XCQ+99SYv5ogFaa1fzzikfEs4+isOvO2O/yMdaRbcCBZ7PjNb5Rxm1s+MgVeNYtom0U508CXu3K/c25J1Tvcv/SMaVQ3ImzAKM46YO19qE7v03BEYXXMud/y4rEo73RWtCoHsKoz4yG8JCnqbKZBxvtosuHIZgB+eQ5w34uL4S8jRUHvkiV3hk8z+5izxoa5fMAHfYu9xoRNh7teon/d/tzmxs/9RJGpMKNISw9wLPhfynyaV02ymV1hYItqdZL6bTT0S8VtE1KqVnfXbqAbfm936E0R7ot0HJ8poEWni/9PzyfM6uf1EP8pTjsnzFtcM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3421.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(66946007)(83380400001)(33656002)(478600001)(53546011)(86362001)(6506007)(7696005)(91956017)(26005)(76116006)(19627405001)(66476007)(66556008)(186003)(5660300002)(316002)(55016002)(52536014)(8936002)(110136005)(2906002)(9686003)(6636002)(66446008)(64756008)(71200400001)(8676002)(921003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Vl3SJoZf4XbZcUfnBM2eAPByL47/mkp0bpF83FuZehvikzuoaQO/BnaLvRZb0VrOXc1z9eqU7Y7mZJu8U9eIXkOaq9Jr9dB0y6cAE94d/wQy9zSTG5gQ2WyTQxWcHnIaXLiTDWMtglhuIB3pKLGcY/3u5s8RIooMBH35hu3KEDMtK9sHcozaGNtkT7hx+us27We+bkSR2bw/x7mz0kDvg0f3ITIJA77Tt4K9wNW2YMOysjnSDzKzkl/hsHAMgYd3iBodiMt6ngqgILHuztrqIo0EWTW3h5IJm9K5WWcv8pkyjv/VS2U41n/Dru6buhrAg4ccRFSxxSIxc7tYrnN84ErjNwTM5UlVPKaSV5DyOvTERb8IlUHYcua2pa7aG17SdnVebK2OIkl8ce8Eg25FoMwZDB75KleYOk7NWmNe8WWRbVnGu+W5mteDY6CX2gj/ZEi3kR/RK64ckYpeOVdNCLWfh8sKXFOMQComrLyw1hNmpi+HPY+CItlrjKxbGBT5py4nY0OYUPADpwff7s0VJXtq2g9DL+7AaT7APYm0Jxw6FPAw7Bwxkks1rxBHcrIqPPI8ZPWvEup9zgWQigNS7rM97ivh9e6V87WCOOJNvGBBMkO/FsJIxLCn2/CTCVO371fp47tf6PKG80Ch+4yb2w==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3421.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd436bb-f383-46b2-fa91-08d863cc054a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2020 16:31:58.4374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 32hdc/prk9xvpbE02ejP67rRZsPJwidE+HWCerYJKNEFVdRg7qEydw96hZ3UxxPpH3+weubEUkPKiA/jnRHAaQKP+kiaeEwleJUW2t7I8pkpwkCNQgSHVwNThujoI9LS9Q2z5FbiyAVsWFYLoD8tRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4621
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
Content-Type: multipart/mixed; boundary="===============1766080178=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1766080178==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN6PR11MB3421571FA9A490C67E0E9D82DF350SN6PR11MB3421namp_"

--_000_SN6PR11MB3421571FA9A490C67E0E9D82DF350SN6PR11MB3421namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Jani Nikula <jani.nikula@linux.intel.com>
Sent: Monday, September 28, 2020 7:07 PM
To: Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay=
@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; airlied@linux.ie <airl=
ied@linux.ie>; daniel@ffwll.ch <daniel@ffwll.ch>; intel-gfx@lists.freedeskt=
op.org <intel-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <=
dri-devel@lists.freedesktop.org>; linux-kernel@vger.kernel.org <linux-kerne=
l@vger.kernel.org>; Ausmus, James <james.ausmus@intel.com>; Roper, Matthew =
D <matthew.d.roper@intel.com>; Souza, Jose <jose.souza@intel.com>; ville.sy=
rjala@linux.intel.com <ville.syrjala@linux.intel.com>; De Marchi, Lucas <lu=
cas.demarchi@intel.com>; Pandey, Hariom <hariom.pandey@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/jsl: Split EHL/JSL platform info and PCI =
ids

On Mon, 28 Sep 2020, Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@int=
el.com> wrote:
> Split the basic platform definition, macros, and PCI IDs to
> differentiate between EHL and JSL platforms.
>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.c=
om>
> ---
>  drivers/gpu/drm/i915/i915_drv.h          | 4 +++-
>  drivers/gpu/drm/i915/i915_pci.c          | 9 +++++++++
>  drivers/gpu/drm/i915/intel_device_info.c | 1 +
>  drivers/gpu/drm/i915/intel_device_info.h | 1 +
>  include/drm/i915_pciids.h                | 9 ++++++---
>  5 files changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index 72a9449b674e..4f20acebb038 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1417,7 +1417,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  #define IS_COMETLAKE(dev_priv)       IS_PLATFORM(dev_priv, INTEL_COMETLA=
KE)
>  #define IS_CANNONLAKE(dev_priv)      IS_PLATFORM(dev_priv, INTEL_CANNONL=
AKE)
>  #define IS_ICELAKE(dev_priv) IS_PLATFORM(dev_priv, INTEL_ICELAKE)
> -#define IS_ELKHARTLAKE(dev_priv)     IS_PLATFORM(dev_priv, INTEL_ELKHART=
LAKE)
> +#define IS_ELKHARTLAKE(dev_priv) (IS_PLATFORM(dev_priv, INTEL_ELKHARTLAK=
E) || \
> +                             IS_PLATFORM(dev_priv, INTEL_JASPERLAKE))
> +#define IS_JASPERLAKE(dev_priv)      IS_PLATFORM(dev_priv, INTEL_JASPERL=
AKE)

I think we've learned from history that we want the platform checks to
be independent. I.e. if you need to split ELK and JSP, you need to make
IS_ELKHARTLAKE() match *only* ELK, and you need to replace every current
IS_ELKHARTLAKE() check with IS_ELKHARTLAKE() || IS_JASPERLAKE().

We've been here before, and we've thought before that we can get by with
the minimal change. It's just postponing the inevitable and generates
confusion.

BR,
Jani.

Tejas :  Replacing IS_ELKHARTLAKE() || IS_JASPERLAKE() everywhere will make=
 lot of changes at each place. To avoid huge change and to differentiate be=
tween platforms we have taken this way. Do you think we still change it eve=
rywhere? Do you have example where it can harm this change?

>  #define IS_TIGERLAKE(dev_priv)       IS_PLATFORM(dev_priv, INTEL_TIGERLA=
KE)
>  #define IS_ROCKETLAKE(dev_priv)      IS_PLATFORM(dev_priv, INTEL_ROCKETL=
AKE)
>  #define IS_DG1(dev_priv)        IS_PLATFORM(dev_priv, INTEL_DG1)
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_=
pci.c
> index 366ddfc8df6b..8690b69fcf33 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -846,6 +846,14 @@ static const struct intel_device_info ehl_info =3D {
>        .ppgtt_size =3D 36,
>  };
>
> +static const struct intel_device_info jsl_info =3D {
> +     GEN11_FEATURES,
> +     PLATFORM(INTEL_JASPERLAKE),
> +     .require_force_probe =3D 1,
> +     .platform_engine_mask =3D BIT(RCS0) | BIT(BCS0) | BIT(VCS0) | BIT(V=
ECS0),
> +     .ppgtt_size =3D 36,
> +};
> +
>  #define GEN12_FEATURES \
>        GEN11_FEATURES, \
>        GEN(12), \
> @@ -985,6 +993,7 @@ static const struct pci_device_id pciidlist[] =3D {
>        INTEL_CNL_IDS(&cnl_info),
>        INTEL_ICL_11_IDS(&icl_info),
>        INTEL_EHL_IDS(&ehl_info),
> +     INTEL_JSL_IDS(&jsl_info),
>        INTEL_TGL_12_IDS(&tgl_info),
>        INTEL_RKL_IDS(&rkl_info),
>        {0, 0, 0}
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i=
915/intel_device_info.c
> index adc836f15fde..e67cec8fa2aa 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -62,6 +62,7 @@ static const char * const platform_names[] =3D {
>        PLATFORM_NAME(CANNONLAKE),
>        PLATFORM_NAME(ICELAKE),
>        PLATFORM_NAME(ELKHARTLAKE),
> +     PLATFORM_NAME(JASPERLAKE),
>        PLATFORM_NAME(TIGERLAKE),
>        PLATFORM_NAME(ROCKETLAKE),
>        PLATFORM_NAME(DG1),
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i=
915/intel_device_info.h
> index 6a3d607218aa..d92fa041c700 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -79,6 +79,7 @@ enum intel_platform {
>        /* gen11 */
>        INTEL_ICELAKE,
>        INTEL_ELKHARTLAKE,
> +     INTEL_JASPERLAKE,
>        /* gen12 */
>        INTEL_TIGERLAKE,
>        INTEL_ROCKETLAKE,
> diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
> index 7eeecb07c9a1..1b5e09cfa11e 100644
> --- a/include/drm/i915_pciids.h
> +++ b/include/drm/i915_pciids.h
> @@ -579,15 +579,18 @@
>        INTEL_VGA_DEVICE(0x8A51, info), \
>        INTEL_VGA_DEVICE(0x8A5D, info)
>
> -/* EHL/JSL */
> +/* EHL */
>  #define INTEL_EHL_IDS(info) \
>        INTEL_VGA_DEVICE(0x4500, info), \
>        INTEL_VGA_DEVICE(0x4571, info), \
>        INTEL_VGA_DEVICE(0x4551, info), \
>        INTEL_VGA_DEVICE(0x4541, info), \
> -     INTEL_VGA_DEVICE(0x4E71, info), \
>        INTEL_VGA_DEVICE(0x4557, info), \
> -     INTEL_VGA_DEVICE(0x4555, info), \
> +     INTEL_VGA_DEVICE(0x4555, info)
> +
> +/* JSL */
> +#define INTEL_JSL_IDS(info) \
> +     INTEL_VGA_DEVICE(0x4E71, info), \
>        INTEL_VGA_DEVICE(0x4E61, info), \
>        INTEL_VGA_DEVICE(0x4E57, info), \
>        INTEL_VGA_DEVICE(0x4E55, info), \

--
Jani Nikula, Intel Open Source Graphics Center

--_000_SN6PR11MB3421571FA9A490C67E0E9D82DF350SN6PR11MB3421namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Jani Nikula &lt;jani.=
nikula@linux.intel.com&gt;<br>
<b>Sent:</b> Monday, September 28, 2020 7:07 PM<br>
<b>To:</b> Surendrakumar Upadhyay, TejaskumarX &lt;tejaskumarx.surendrakuma=
r.upadhyay@intel.com&gt;; Vivi, Rodrigo &lt;rodrigo.vivi@intel.com&gt;; air=
lied@linux.ie &lt;airlied@linux.ie&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch=
&gt;; intel-gfx@lists.freedesktop.org &lt;intel-gfx@lists.freedesktop.org&g=
t;;
 dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; l=
inux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;; Ausmus, J=
ames &lt;james.ausmus@intel.com&gt;; Roper, Matthew D &lt;matthew.d.roper@i=
ntel.com&gt;; Souza, Jose &lt;jose.souza@intel.com&gt;; ville.syrjala@linux=
.intel.com
 &lt;ville.syrjala@linux.intel.com&gt;; De Marchi, Lucas &lt;lucas.demarchi=
@intel.com&gt;; Pandey, Hariom &lt;hariom.pandey@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH 1/2] drm/i915/jsl: Split EHL/JSL platform info a=
nd PCI ids</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Mon, 28 Sep 2020, Tejas Upadhyay &lt;tejaskumar=
x.surendrakumar.upadhyay@intel.com&gt; wrote:<br>
&gt; Split the basic platform definition, macros, and PCI IDs to<br>
&gt; differentiate between EHL and JSL platforms.<br>
&gt;<br>
&gt; Signed-off-by: Tejas Upadhyay &lt;tejaskumarx.surendrakumar.upadhyay@i=
ntel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/i915/i915_drv.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 4 +++-<br>
&gt;&nbsp; drivers/gpu/drm/i915/i915_pci.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 9 +++++++++<br>
&gt;&nbsp; drivers/gpu/drm/i915/intel_device_info.c | 1 +<br>
&gt;&nbsp; drivers/gpu/drm/i915/intel_device_info.h | 1 +<br>
&gt;&nbsp; include/drm/i915_pciids.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 9 ++++++---<br>
&gt;&nbsp; 5 files changed, 20 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i9=
15_drv.h<br>
&gt; index 72a9449b674e..4f20acebb038 100644<br>
&gt; --- a/drivers/gpu/drm/i915/i915_drv.h<br>
&gt; +++ b/drivers/gpu/drm/i915/i915_drv.h<br>
&gt; @@ -1417,7 +1417,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i9=
15,<br>
&gt;&nbsp; #define IS_COMETLAKE(dev_priv)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; IS_PLATFORM(dev_priv, INTEL_COMETLAKE)<br>
&gt;&nbsp; #define IS_CANNONLAKE(dev_priv)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IS=
_PLATFORM(dev_priv, INTEL_CANNONLAKE)<br>
&gt;&nbsp; #define IS_ICELAKE(dev_priv) IS_PLATFORM(dev_priv, INTEL_ICELAKE=
)<br>
&gt; -#define IS_ELKHARTLAKE(dev_priv)&nbsp;&nbsp;&nbsp;&nbsp; IS_PLATFORM(=
dev_priv, INTEL_ELKHARTLAKE)<br>
&gt; +#define IS_ELKHARTLAKE(dev_priv) (IS_PLATFORM(dev_priv, INTEL_ELKHART=
LAKE) || \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; IS_PLATFORM(dev_priv, INTEL_JASPERLAKE))<br>
&gt; +#define IS_JASPERLAKE(dev_priv)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IS_PLAT=
FORM(dev_priv, INTEL_JASPERLAKE)<br>
<br>
I think we've learned from history that we want the platform checks to<br>
be independent. I.e. if you need to split ELK and JSP, you need to make<br>
IS_ELKHARTLAKE() match *only* ELK, and you need to replace every current<br=
>
IS_ELKHARTLAKE() check with IS_ELKHARTLAKE() || IS_JASPERLAKE().<br>
<br>
We've been here before, and we've thought before that we can get by with<br=
>
the minimal change. It's just postponing the inevitable and generates<br>
confusion.<br>
<br>
BR,<br>
Jani.<br>
<br>
Tejas :&nbsp; Replacing&nbsp;<span style=3D"color: rgb(0, 0, 0); font-famil=
y: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Se=
goe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Ne=
ue&quot;, sans-serif; background-color: rgb(255, 255, 255); display: inline=
 !important">IS_ELKHARTLAKE()
 || IS_JASPERLAKE() everywhere will make lot of changes at each place. To a=
void huge change and to differentiate between platforms we have taken this =
way. Do you think we still change it everywhere? Do you have example where =
it can harm this change?</span><br>
<br>
&gt;&nbsp; #define IS_TIGERLAKE(dev_priv)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; IS_PLATFORM(dev_priv, INTEL_TIGERLAKE)<br>
&gt;&nbsp; #define IS_ROCKETLAKE(dev_priv)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IS=
_PLATFORM(dev_priv, INTEL_ROCKETLAKE)<br>
&gt;&nbsp; #define IS_DG1(dev_priv)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; IS_PLATFORM(dev_priv, INTEL_DG1)<br>
&gt; diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i9=
15_pci.c<br>
&gt; index 366ddfc8df6b..8690b69fcf33 100644<br>
&gt; --- a/drivers/gpu/drm/i915/i915_pci.c<br>
&gt; +++ b/drivers/gpu/drm/i915/i915_pci.c<br>
&gt; @@ -846,6 +846,14 @@ static const struct intel_device_info ehl_info =
=3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ppgtt_size =3D 36,<br>
&gt;&nbsp; };<br>
&gt;&nbsp; <br>
&gt; +static const struct intel_device_info jsl_info =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; GEN11_FEATURES,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM(INTEL_JASPERLAKE),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .require_force_probe =3D 1,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .platform_engine_mask =3D BIT(RCS0) | BIT(BC=
S0) | BIT(VCS0) | BIT(VECS0),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; .ppgtt_size =3D 36,<br>
&gt; +};<br>
&gt; +<br>
&gt;&nbsp; #define GEN12_FEATURES \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GEN11_FEATURES, \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GEN(12), \<br>
&gt; @@ -985,6 +993,7 @@ static const struct pci_device_id pciidlist[] =3D =
{<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_CNL_IDS(&amp;cnl_info)=
,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_ICL_11_IDS(&amp;icl_in=
fo),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_EHL_IDS(&amp;ehl_info)=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; INTEL_JSL_IDS(&amp;jsl_info),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_TGL_12_IDS(&amp;tgl_in=
fo),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_RKL_IDS(&amp;rkl_info)=
,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {0, 0, 0}<br>
&gt; diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/dr=
m/i915/intel_device_info.c<br>
&gt; index adc836f15fde..e67cec8fa2aa 100644<br>
&gt; --- a/drivers/gpu/drm/i915/intel_device_info.c<br>
&gt; +++ b/drivers/gpu/drm/i915/intel_device_info.c<br>
&gt; @@ -62,6 +62,7 @@ static const char * const platform_names[] =3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM_NAME(CANNONLAKE),<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM_NAME(ICELAKE),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM_NAME(ELKHARTLAKE),<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM_NAME(JASPERLAKE),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM_NAME(TIGERLAKE),<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM_NAME(ROCKETLAKE),<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PLATFORM_NAME(DG1),<br>
&gt; diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/dr=
m/i915/intel_device_info.h<br>
&gt; index 6a3d607218aa..d92fa041c700 100644<br>
&gt; --- a/drivers/gpu/drm/i915/intel_device_info.h<br>
&gt; +++ b/drivers/gpu/drm/i915/intel_device_info.h<br>
&gt; @@ -79,6 +79,7 @@ enum intel_platform {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* gen11 */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_ICELAKE,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_ELKHARTLAKE,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; INTEL_JASPERLAKE,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* gen12 */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_TIGERLAKE,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_ROCKETLAKE,<br>
&gt; diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h<br>
&gt; index 7eeecb07c9a1..1b5e09cfa11e 100644<br>
&gt; --- a/include/drm/i915_pciids.h<br>
&gt; +++ b/include/drm/i915_pciids.h<br>
&gt; @@ -579,15 +579,18 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x8A51, inf=
o), \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x8A5D, inf=
o)<br>
&gt;&nbsp; <br>
&gt; -/* EHL/JSL */<br>
&gt; +/* EHL */<br>
&gt;&nbsp; #define INTEL_EHL_IDS(info) \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4500, inf=
o), \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4571, inf=
o), \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4551, inf=
o), \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4541, inf=
o), \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4E71, info), \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4557, inf=
o), \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4555, info), \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4555, info)<br>
&gt; +<br>
&gt; +/* JSL */<br>
&gt; +#define INTEL_JSL_IDS(info) \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4E71, info), \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4E61, inf=
o), \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4E57, inf=
o), \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INTEL_VGA_DEVICE(0x4E55, inf=
o), \<br>
<br>
-- <br>
Jani Nikula, Intel Open Source Graphics Center<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_SN6PR11MB3421571FA9A490C67E0E9D82DF350SN6PR11MB3421namp_--

--===============1766080178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1766080178==--
