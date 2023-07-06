Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2336274A421
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 21:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47C510E0CD;
	Thu,  6 Jul 2023 19:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D4B10E0CD;
 Thu,  6 Jul 2023 19:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688670343; x=1720206343;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=lfFx7a6AGuwg2l+V3pbehmZQdRRMkz9GKcH+l9Zko4Q=;
 b=UR9uBLPi/3YGHmbVcc1ldzJgTcN8DEOr+XbnrhFN8B56pAZYgJdadyaY
 gox6dYFmlYv5woQDROGzANpqo9K79gylU0g+RZ41wCfHw3+lWlR3TasJe
 87hC5W8aOf0YRBvI0OxVReMzmpVhHhqdABElDLT7W06Shf8BPyqeCIyC8
 nbMRu2BWtgbjHx5OvKOGy8eB3khTZq/q4rbyqLCRiUUCjCPBIbpdWIE4P
 9UsGIR08cxRp6TpoD7TJaTA67NwDsKc1lQfNc5deI1NOOSjJ+Y2Hgoq6d
 agiVMXJ+r5tOv7SKQZ9fcGl24M19mX19cS9aQsQqCzIt1mZzXctH9p5Qg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="353533412"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
 d="scan'208,217";a="353533412"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 12:05:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="966338185"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
 d="scan'208,217";a="966338185"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 06 Jul 2023 12:05:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 12:05:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 12:05:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 12:05:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 12:05:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaW7rRh2sshveV1hEUibhl3nV7+BoUNcy3aANgbwM/mMJXYh6+KzqNgYE0mXFbZzxwBRK/QfC5efCauYSp4qyJckm4M07QzhO51KjCat4gBietyCQzXZUfhepbXeSxqVEiTZi5Pku3IEXRwMUw+UTWHZFe/KtLKWx4LIxLM3FbBqZTmxJ++zRXpZKsR74b9ETNGfMrgTcgCkMQP0olj1Na3JDI1jHLegC4rQw+oOqNvq5JzVVsYOyDIlwJFJbvxnWSoqeHqXqOs2MR0sP+561jGd9heI8s+P0QJvxTmSDSeHxkWx2WGYUlHXZhnqf62TB4iw1/kdyZa+ht7QzDCJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZLgQTD01KptTe8lbgDICLVa6njF/m+91ka+Ofl8+z4=;
 b=TMcNeM4YodfNON1JrNJtTm2DmFR1OCuzMvTXr9ESMIiLEUwG/YM67FvaOsRL2KjsI4eIW1sQeINEMyk5lpFfPsmd/05iY7IRm7qkPB1DfEeB3MN/8+NZPJL9o6jQWeyVN/R1b78UDu4hgZtlB/acGv3GB6tB3UcgRlYINaPxGnZhQ+WFFCnhk6kCLyWpqk1Yq+oZv/iMx0onnYYjMpcUBsY88fjjCUcjc9UJXKgCYd+M6hf0fzrTxy7YtOD1g+YryUAdCdUP/Ss6qvOOi5A/TOYVrO5ZvW7UXjnZFRCcjHLb3OcyQF0dn3Sg2Z3CRqPj/fYurau2D/uzRbkJgcCY1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by PH7PR11MB8124.namprd11.prod.outlook.com (2603:10b6:510:237::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Thu, 6 Jul
 2023 19:05:37 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46%4]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 19:05:36 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/mtl: Update cache coherency setting for context
 structure
Thread-Topic: [PATCH] drm/i915/mtl: Update cache coherency setting for context
 structure
Thread-Index: AQHZsDHkNiyvEGllPE2HEceyXCyNVa+tGSjv
Date: Thu, 6 Jul 2023 19:05:36 +0000
Message-ID: <BYAPR11MB256703C0275B283E3C3FD84C9A2CA@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230706174704.177929-1-zhanjun.dong@intel.com>
In-Reply-To: <20230706174704.177929-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|PH7PR11MB8124:EE_
x-ms-office365-filtering-correlation-id: c0c6031d-66e7-4805-a60a-08db7e53fb71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9b0F/kCqgb9ipsZc5N3bKWzONJx8dsTbmiYExdokcWzl04ELE+psT8VQdcHQIv/eykW8sY0Gt3er0ng7/nIDxT0VtVGU8Fx3FyPJSQP6iOiNO85/pPdTmyHOM/DU6B1vB0A2UklSSNYsV7T0mJBbAK7HO5wd5VrtcxOIMFS6IHpqOhjisOnAz6X6i5ERk8haYjYUQkDVMoNLjJtqRzAOciUQK5f1GT/3gDmm80o1Iak5PVHQcoQFpxSFsWXlbEo+jsEQ/c58yzBsDlf2ujhE3BcrCFvzQxrEWExuBYDhZ19KdvVuoxnmYaER8FIEujeT1zl68y+4oNKn4FCtUi54SZKW4o6YWe0vwQNWccLfyEnuQvCNrtezoAUc4V4zPcj99wruKzP4sPiYkswGHoSTUzBPmIFzJq0O0TyJQqL6EuzdbGS1K5JoC/lLG1ArW9L6LDNgf8UrodUl/T7EdzIDo2WhmNNDvGdlCS0VAI+JxKqPoqYmpoVCHQ5BB8/HmgKac0zcnU+rmXDursgybn8ypO/4ZFTN4QQYQld3WJv/u+06I4YFl+BOlUn7D8OuD3JDJuRXvwVDy/SdUJSb1n9Ym4Hev2yErtRuqqBn7Wtid14uDnMpM0Zm9ijagjqj2asE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199021)(83380400001)(76116006)(66946007)(64756008)(91956017)(66556008)(66476007)(450100002)(66446008)(82960400001)(122000001)(38100700002)(110136005)(478600001)(6506007)(186003)(26005)(55016003)(71200400001)(7696005)(86362001)(33656002)(19627405001)(9686003)(38070700005)(316002)(8676002)(8936002)(41300700001)(2906002)(52536014)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LqYhfhdAxBBnhNXwQvEYwkl5aaXUcK762eZO25yjUGZ2c9v283XoRgyr6+?=
 =?iso-8859-1?Q?jhk03U7cipj/TJDVaSqpO5FsapPDOzZYJLBg1yoCA7KrTQkFyolGZ/Qwmj?=
 =?iso-8859-1?Q?3L5YFT55A64A1QCXqPM8L8qdelEnx5jZql3ITJTALoaUhIFi46NPrM9k2q?=
 =?iso-8859-1?Q?0lLnzyPGxHlVBU2bORzxFJevAccZ7+xdR0yl/1CjYiyRUGlfV5uZJzWvm6?=
 =?iso-8859-1?Q?rjgqPBO0rJYrB/p8qbxdNhjT7iAbH1VxbqUG/LHWldRFKyWTuGEuEybDQ/?=
 =?iso-8859-1?Q?Hq7nmRsLyTg1050NrhnoDXUUScCX9bV8q9dbSFMj0sM/wyPyyX3ruF2sQq?=
 =?iso-8859-1?Q?0PN3FA0YyH2vwXlYcVBrdaUsMvZBGo23+YJNfxFwbSGwdKlZhIkXfMt9K5?=
 =?iso-8859-1?Q?agM2T1nt9xG6CoJGSL2UOcM04CxnuXDjtP1TyYC00E2VNkhDFSRTB/5adw?=
 =?iso-8859-1?Q?DZ7rrYC6eXd95lWctuvmWJ0W6iF6IVpfbbUvKYzsr11Wky0NI6zqOdO/YJ?=
 =?iso-8859-1?Q?lKMSOrArtPjI2pkzhgCSW8IfP5ycE/9yjI9q31mlK7qLbt+cu0dYadOXCY?=
 =?iso-8859-1?Q?WM61iQmxT0/eruT97xVts4K7eIdOZAywMT+y74g/epZ07Eo0sSEjrpSnIo?=
 =?iso-8859-1?Q?YCxE2kvhQrpbu+76PqNDucrlvDB765dyfOpo2RIjdOeb/Nsmboz6O1foTk?=
 =?iso-8859-1?Q?v80sEnhAvvTESETgBRAcefKsS2GQGfFxRo8qHGrwZIlc0GCGPsWJBqLEZo?=
 =?iso-8859-1?Q?Ic5SET/+I9DYxZryH5P1DbBkX/ys2DiEbrBws+mUnoCwq8pf8VHUnAEz8E?=
 =?iso-8859-1?Q?yi8YkwBLUtKft90hRwL019aw+mesBUsPmaDfaxwTrvBfCObDVJkQCIhxBE?=
 =?iso-8859-1?Q?ML2hwtVnriDtdEGWijmEgTwUeuZ6XKIYCPqAU9k1SPi/JfjQhAgPOYLZaz?=
 =?iso-8859-1?Q?a4pu0Qsl5k4xA1vMzLoo9e+RmWO8DV5wHoCscwMD9DDvy55rUMVUIyTUvt?=
 =?iso-8859-1?Q?PJuHnV4LDdFyV2/Xha5jtKqna25YqYrt20uCWw90PGIWUmWco6pPPcqWke?=
 =?iso-8859-1?Q?0Inb9hqMaUupNIs/rENb3VVS+YDNirp4dHUttI2ScgGT9EZLeJnnWo59pw?=
 =?iso-8859-1?Q?PTSvaJd5srcTtENpa4FJjdtaWTiQhiO/0EcR4joBgT1fJf91uivu9vN4eu?=
 =?iso-8859-1?Q?KXYWffOoVWIdI1enlXU5Y0/fJ7PZ0Xt5eSDbbo9JdFGeZ7GZYuYF0NVhjk?=
 =?iso-8859-1?Q?71wI+QD/CETNRGkqFWpZ+7TNCl6FoBFMfUvi2gpm9CaflIEcjZS9u2f/Nk?=
 =?iso-8859-1?Q?bKjGCFBMyBEvULTIAX4R57k6qMvnRT1JULURCwwvgrhgJBulENz78Z7+OZ?=
 =?iso-8859-1?Q?lNO145SLeeK9rrE2dPLuflQlXD0W0c13eEmpNCUq1UbfuC0q1XMzW4NV2j?=
 =?iso-8859-1?Q?SgFUSX+bsZgxkzz3Go6y1rhFRIOent+3IaKQ3a8ajC6NqeLZDmiM5RdLrj?=
 =?iso-8859-1?Q?B2iJxd+KhR/E/tgsqEwFhRteFLkgPpfyDf4CjSiEKAnA3/ZTN+2qeAez9V?=
 =?iso-8859-1?Q?4Ck8Kh7mw0eHlsSm66MKqF5QCNfuQq8IQR/UM2t9QIlO5wL+/oNikxrp5o?=
 =?iso-8859-1?Q?iKM2LUfy6m/mwCwBm53kNS6fqNf8j1/QTL?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB256703C0275B283E3C3FD84C9A2CABYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c6031d-66e7-4805-a60a-08db7e53fb71
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2023 19:05:36.8498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ein6bdXnEDs3CrfmsZ7kZ9A98VjQR4H7zaxrvfbBf+AgMY4y5H92p5mALrYY4oHDpYCV/GmXeuWfVygV7j7/+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8124
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB256703C0275B283E3C3FD84C9A2CABYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> As context structure is shared memory for CPU/GPU, Wa_22016122933 is
> needed for this memory block as well.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> CC: Fei Yang <fei.yang@intel.com>

Reviewed-by: Fei Yang <fei.yang@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_lrc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/g=
t/intel_lrc.c
> index a4ec20aaafe2..1b710102390b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1092,8 +1092,15 @@ __lrc_alloc_state(struct intel_context *ce, struct=
 intel_engine_cs *engine)
>
>          obj =3D i915_gem_object_create_lmem(engine->i915, context_size,
>                                            I915_BO_ALLOC_PM_VOLATILE);
> -       if (IS_ERR(obj))
> +       if (IS_ERR(obj)) {
>                  obj =3D i915_gem_object_create_shmem(engine->i915, conte=
xt_size);
> +               /*
> +                * Wa_22016122933: For MTL the shared memory needs to be =
mapped
> +                * as WC on CPU side and UC (PAT index 2) on GPU side
> +                */
> +               if (IS_METEORLAKE(engine->i915))
> +                       i915_gem_object_set_cache_coherency(obj, I915_CAC=
HE_NONE);
> +       }
>          if (IS_ERR(obj))
>                  return ERR_CAST(obj);
>
> --
> 2.34.1


--_000_BYAPR11MB256703C0275B283E3C3FD84C9A2CABYAPR11MB2567namp_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
&gt; As context structure is shared memory for CPU/GPU, Wa_22016122933 is
<div class=3D"ContentPasted0">&gt; needed for this memory block as well.</d=
iv>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; Signed-off-by: Zhanjun Dong &lt;zhanjun.=
dong@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt; CC: Fei Yang &lt;fei.yang@intel.com&gt;<=
/div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Reviewed-by: Fei Yang &lt;fei.yang@intel.com&=
gt;</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&gt; ---</div>
<div class=3D"ContentPasted0">&gt; &nbsp;drivers/gpu/drm/i915/gt/intel_lrc.=
c | 9 ++++++++-</div>
<div class=3D"ContentPasted0">&gt; &nbsp;1 file changed, 8 insertions(+), 1=
 deletion(-)</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; diff --git a/drivers/gpu/drm/i915/gt/int=
el_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c</div>
<div class=3D"ContentPasted0">&gt; index a4ec20aaafe2..1b710102390b 100644<=
/div>
<div class=3D"ContentPasted0">&gt; --- a/drivers/gpu/drm/i915/gt/intel_lrc.=
c</div>
<div class=3D"ContentPasted0">&gt; +++ b/drivers/gpu/drm/i915/gt/intel_lrc.=
c</div>
<div class=3D"ContentPasted0">&gt; @@ -1092,8 +1092,15 @@ __lrc_alloc_state=
(struct intel_context *ce, struct intel_engine_cs *engine)</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;obj =
=3D i915_gem_object_create_lmem(engine-&gt;i915, context_size,</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;I915_BO_ALLOC_PM_VOLATILE);</div>
<div class=3D"ContentPasted0">&gt; - &nbsp; &nbsp; &nbsp; if (IS_ERR(obj))<=
/div>
<div class=3D"ContentPasted0">&gt; + &nbsp; &nbsp; &nbsp; if (IS_ERR(obj)) =
{</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;obj =3D i915_gem_object_create_shmem(engine-&gt;i915,=
 context_size);</div>
<div class=3D"ContentPasted0">&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; /*</div>
<div class=3D"ContentPasted0">&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;* Wa_22016122933: For MTL the shared memory needs to be ma=
pped</div>
<div class=3D"ContentPasted0">&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;* as WC on CPU side and UC (PAT index 2) on GPU side</div>
<div class=3D"ContentPasted0">&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;*/</div>
<div class=3D"ContentPasted0">&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; if (IS_METEORLAKE(engine-&gt;i915))</div>
<div class=3D"ContentPasted0">&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i915_gem_object_set_cache_coherency(=
obj, I915_CACHE_NONE);</div>
<div class=3D"ContentPasted0">&gt; + &nbsp; &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (IS=
_ERR(obj))</div>
<div class=3D"ContentPasted0">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;return ERR_CAST(obj);</div>
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt; --</div>
<div class=3D"ContentPasted0">&gt; 2.34.1</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB256703C0275B283E3C3FD84C9A2CABYAPR11MB2567namp_--
