Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA134B2991
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 17:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC14710EA89;
	Fri, 11 Feb 2022 16:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B810710EA89;
 Fri, 11 Feb 2022 16:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644595387; x=1676131387;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=t40V1P+MEuCz8dq4W2GfOSyTBtG2N7dgBffVRoFTkgs=;
 b=gU0PEBB7cF+6URdHsjRx1H6BVaFfDLD/sIjsKmy22rOBhMilIKgnzyzL
 nXZvN09bTv9ALLUclt+ehkhwqdRY8e0CBQKexxRfjshANZPdLb/RfC7wv
 t+HxI6enDgNYNR0c+ll+6d/m+2ahChKHntSptHnPK6sG7wW14kKMJgL2T
 agH2CNoUW6EI+KJHR1W+2VY07mfM4wenbZFdoz7JxvnajTGT/lZNY+Zx6
 dfZeCFGwzDcCD/ULVvKUzoKfsPkceRbE7ZQFQYmc06IXoAhPDz7bT5WHZ
 MDfDwFsBmAwxzeGPRAcDZzplCJyG9wWly83ytsLH0FHnfW+C+oT2UyAmI A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249962553"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
 d="scan'208,217";a="249962553"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 08:03:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
 d="scan'208,217";a="623254917"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Feb 2022 08:02:59 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 11 Feb 2022 08:02:59 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 11 Feb 2022 08:02:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 11 Feb 2022 08:02:59 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 11 Feb 2022 08:02:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2U8kVDb9Aha+Vdp/SzDkaOYOiTnA+06M5w2oE9Rl0OH5bLdRRTHrgnvOO62QuBYNUM/9gyExm9MaCGjUyHk0+UhoJUC2iLBK+CSE4mPgDGPpP0NHoVt4Recwz1sj00V1gKJ4+h1ty0ahKEcJB05MpH3HWqyR4EDHU4r29f2HbIor3DNShsJgBUxEV3ov2asdyvpXuZu6V4uOKs6JOiZkmcDH4nOp/l+NNTSZk5/d9sxpRz//KzQ9OSBrEmxT34qpddARVGy2+vO/DTLtJDGFynyS83svt7Zz9n3oFZh4KmjBZuAtfjFLtZQd+nbogjs/J0g9CRdgySBjzr2Zz/nzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcAbN7/zmZpeek3/sSxOTajqyNDBjrXGux0sKs74YZY=;
 b=UqOttZmVsXkOEHcF83+2ViKZvXv72g2JFJCZKTvDyvrEcEnUDvm16RN26V872GMwSH5e0GbKIWyy7BJAtMFugabgYncz+TNXHTRbU9Ixr0/vlliyFP822pUqNtWKcywTChqXXmXOxBIJWD44FXVG2bwhxGcsxX89+OcDdjgiT1eeNR7OtwQ3U5ciJwHE6SRtLBtWS6TUQm2kYhYR3sHb3zoandc5gzpdYldLU3RU7G84cSCN+XAs/e64b3q5fdWtqUuZRGqVqqkLeD3plYiOdiFhpfWjJeks2ZCZjYF07hgQ428TB/R3xFfIp/9c9sClC3mG5EEIBatghWRjU9Rdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MWHPR11MB1645.namprd11.prod.outlook.com (2603:10b6:301:b::12)
 by BY5PR11MB4070.namprd11.prod.outlook.com (2603:10b6:a03:181::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 16:02:56 +0000
Received: from MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0]) by MWHPR11MB1645.namprd11.prod.outlook.com
 ([fe80::3db4:813a:16:ba0%7]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 16:02:56 +0000
From: "Cheng, Michael" <michael.cheng@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v1 1/1] drm/i915/gt: Move wbvind_on_all_cpus #define
Thread-Topic: [PATCH v1 1/1] drm/i915/gt: Move wbvind_on_all_cpus #define
Thread-Index: AQHYHscaV10LLE2LPkGZTGzFu29rc6yOWmSAgAAo4f4=
Date: Fri, 11 Feb 2022 16:02:56 +0000
Message-ID: <MWHPR11MB16453F9D6D8C085B94D8DD43E1309@MWHPR11MB1645.namprd11.prod.outlook.com>
References: <20220210214216.1227694-1-michael.cheng@intel.com>
 <20220210214216.1227694-2-michael.cheng@intel.com> <87iltl7cjy.fsf@intel.com>
In-Reply-To: <87iltl7cjy.fsf@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3749340f-68f4-491d-d805-08d9ed77f7ea
x-ms-traffictypediagnostic: BY5PR11MB4070:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BY5PR11MB40707E263996C89EC1031D68E1309@BY5PR11MB4070.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V0qKR58kgteQdcrOX52RpvIsyjWWAXH4dS/scIz64Nno183IpzpAZw7BnCXr4V/E2k5z4Y53oCpHOBLUuylvogtsEY280/Uf/NMfKQVb4LnzxpXsZw8KMv9HDU6odNsBb0mmj4OxUlxmnhPyDgIwoD3C8nhKb3uAUfZM7kJYDVNm/afECIYlsXVwDFh2zw9T6otQKV1/lPnJvZ5wUpEfLpMZCG4x+MSuUYsv18+42cCwhfP4pSbAccs7gilnB7D07cc9fCeyF2a2gqpIhU1x3w5/YiaNwjYk+bAfgU56VdgAqE1DRAB0imloW2q3J3S173oHRi/J+iAl5CuH0ECo6W9+kIM2ceQ0MiG5oglMoB3MM0+gx43rCeZuJRVip1dw9OmyVy9nrne3hhJ1yFBc1RlUZnEnOt9ozh3gv4fu4BnfKBRyQEKuoSJVUzo3UfVI5cvohLwJ8s5mCGcanFWRkEBiaGcDyKAuGgnZAD2Fm8YQZWo6ijCwU+bgIt79lKQoVrsdQANEr4qAHI9Js0piHMq+uFmGvqmOs2bYfcoDyG0a0CX/kkHWjk1brx9v1ODpLnJWBYpxOV5z+LgaH7RCfLUb8oFJOYHeYYu0smiunXPStNl0oYvD0OkWg4gaHAhYiMGbh/gbfYWprFRq/hwoGSPb/KjOeovWUg2D/W/JHnFZG8BGSN2RyfpSqPldiodj+yhKBVx7cWDVZaV1nMxIWg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1645.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(38070700005)(86362001)(110136005)(2906002)(54906003)(33656002)(8676002)(508600001)(82960400001)(8936002)(71200400001)(186003)(5660300002)(64756008)(66476007)(9686003)(66446008)(66556008)(53546011)(55016003)(83380400001)(122000001)(38100700002)(76116006)(4326008)(52536014)(6506007)(7696005)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JwQcMOZMmW2NOftEUCPfzFLbp44UWuwQ12xECpgkoYJ8vUg1Li5zHKjTod2N?=
 =?us-ascii?Q?///ZbLmM4KuBdT9dL/rp+86/gSYv2HLo+jG/HYPJSAKLAo1oKuIZ+oZk3be+?=
 =?us-ascii?Q?dfHUD0uAxB+cUhwB2DJSJMz183A4uF1B64B0N2vqhK4AD3wZ7FPF5QVunqLh?=
 =?us-ascii?Q?lfcpaSQ7KptdLQUNYhW+IsAhws2oH8AXDSQnK9vTRHwLv+eE792w/tXUTdTd?=
 =?us-ascii?Q?OghA1kuBGv+o+8xQke4GiwA0JWci4yS6J5LBMutkqVz7IU6kv8TrpEBA1h4h?=
 =?us-ascii?Q?BGxBxAm/L50cLOtvn3YvYAaeNNKZnGy2ZZ+t1BI2FaUEwLpDXoI5/UyqXwXd?=
 =?us-ascii?Q?wi7H5MVYGKcpoMhC6wyydqAn1ber795P1EujBnCUyI3FFBkNN3ZaWrdnUPE0?=
 =?us-ascii?Q?1jw2BQTh97sMl+1kgzVQB1UJ2M7S8X+7E4Zfhgn+ma+KsUXNBnOFwdTzkt5g?=
 =?us-ascii?Q?cgDSsKhuSel41F4Juzlixa7EBHGeuhuTbuqZDgtKa+WDCE1J/lyNyN+Pb1kR?=
 =?us-ascii?Q?hZjeAIvO96OkxuEmy4qMgnASM5GNbU0KgK0nwycBmgBZlSDorPeCCoqGRRUZ?=
 =?us-ascii?Q?0+wyDV4y9JLc1cu6g/N85CzfcY8YXl0EuEvCuQQ7C8cLRb50arGaDd2h8E9o?=
 =?us-ascii?Q?chfCLwBJ8iqwEDWM+5Tp/cG669oGsDXY0hx4ZtwBPbTvpW+0dCIiNmmjRIpt?=
 =?us-ascii?Q?iyqolJRz2MscU4LXrj6l6BecXhaJZvHlKJFizkS/8nw/fc5bOGVpFIpc8lRU?=
 =?us-ascii?Q?eGPlBgylVUGFr4ravD805jrwbX670g53KywfgjrAiuerm0KcC8oJu8a5TMTS?=
 =?us-ascii?Q?h7fcAW5FUqdMEkLSsxu2PuokbZwoBaB/676ft+YJBHIlVVAuSEmnrvP4vt3k?=
 =?us-ascii?Q?/yLq/9VgyPYL080EStSx214fMeqv/m/d31iKV2PaSfAC2w7XdyOm6IGVIu2C?=
 =?us-ascii?Q?g0nT6SpbTm8Agv0tolxqRu1c7tuGjAUuF13Vm1+HA1Iy6eeE37zmENuAV/tC?=
 =?us-ascii?Q?aVnoXYacnc7MiPVwo1hhR6q/PhSDrWVBmwnoPoQ+eypQ80jSVWhrhyga5loW?=
 =?us-ascii?Q?7kElsFArbPCWjWbgeAPqSG5gqb141TZ6cl5oIQh+trIyyxHufw7Nu4764Bmt?=
 =?us-ascii?Q?0GvDOXHMRiX2P/uFvJFVN19dPbH41ybu51ksQXY5bG+RALY+8oQKhc5XeVyG?=
 =?us-ascii?Q?6V/kgOS37X4oW5gNgyU7+VluTGSoqdpk4Ng/QBKzt/54FeL5YZbACCY0L5pA?=
 =?us-ascii?Q?MiFKzdla9xqXbdCvPmVwHk1jfnCl9GWeveHiH5RnhvedWvn2dCW0Ngrp/eCn?=
 =?us-ascii?Q?xhttPCD1LFFVRf9/mXEmJYnrMiqlB6gQ/IgqAeQGq2vbFXiA4heONkGTLh+W?=
 =?us-ascii?Q?ZMBj01Z4VD/HAM8d7Nk8WdqAnED93IE7AvcCinjHZANX8VhrQj3+faXpZ8h1?=
 =?us-ascii?Q?Z4gP8VSFH7PmWyKZlE3DbvNL9TwPG/1Y+0/hDtlqj2v8MkCTVyNijGYapiHK?=
 =?us-ascii?Q?oWfSG7NvKSB49r21rlQmLUUriZmgBT9TCnlt++oi5dNraOIJSS2WbmskNAo7?=
 =?us-ascii?Q?Dk4ddIX/BTUTZe+T/XOd3SaSjpkct3jevysjdA3lbgrp2a/U9EEdNEFxobLS?=
 =?us-ascii?Q?9mH2LvR3Iirjf+cQsn8JxZMKMmG5NQwxpo5Axh+PesSqIgEeuWdlmjG9jmZh?=
 =?us-ascii?Q?CPwC2w6i0BI/p5yx0a1dK/B55pI=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MWHPR11MB16453F9D6D8C085B94D8DD43E1309MWHPR11MB1645namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1645.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3749340f-68f4-491d-d805-08d9ed77f7ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 16:02:56.4483 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Itg7xrsnWbmclCr2pIy4DCcla5VbJgdF/ZDYxCcMMdtCwzMRRa5qPQx1xGbS7BagK0gfbBrDFf6CLnuHH2HYXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4070
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
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>, "Boyer, 
 Wayne" <wayne.boyer@intel.com>, "Bowman, Casey G" <casey.g.bowman@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_MWHPR11MB16453F9D6D8C085B94D8DD43E1309MWHPR11MB1645namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback! Another idea  I had that kind of align to what you=
 are suggesting is adding a wrapper for wbinvd_on_all_cpus within drm_cache=
.h, then having it be included in the three files that calls this function.=
 Thoughts on that?
________________________________
From: Jani Nikula <jani.nikula@linux.intel.com>
Sent: Friday, February 11, 2022 5:33:37 AM
To: Cheng, Michael <michael.cheng@intel.com>; intel-gfx@lists.freedesktop.o=
rg <intel-gfx@lists.freedesktop.org>
Cc: tvrtko.ursulin@linux.intel.com <tvrtko.ursulin@linux.intel.com>; Cheng,=
 Michael <michael.cheng@intel.com>; Vivekanandan, Balasubramani <balasubram=
ani.vivekanandan@intel.com>; Boyer, Wayne <wayne.boyer@intel.com>; Bowman, =
Casey G <casey.g.bowman@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.=
com>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v1 1/1] drm/i915/gt: Move wbvind_on_all_cpus #define

On Thu, 10 Feb 2022, Michael Cheng <michael.cheng@intel.com> wrote:
> Move wbvind_on_all_cpus to intel_gt.h. This will allow other wbind_on_all=
_cpus
> calls to benefit from the #define logic, and prevent compiler errors
> when building for non-x86 architectures.
>
> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_pm.c | 7 -------
>  drivers/gpu/drm/i915/gt/intel_gt.h     | 7 +++++++
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i91=
5/gem/i915_gem_pm.c
> index 6da68b38f00f..ff7340ae5ac8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
> @@ -12,13 +12,6 @@
>
>  #include "i915_drv.h"
>
> -#if defined(CONFIG_X86)
> -#include <asm/smp.h>
> -#else
> -#define wbinvd_on_all_cpus() \
> -     pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
> -#endif
> -
>  void i915_gem_suspend(struct drm_i915_private *i915)
>  {
>        GEM_TRACE("%s\n", dev_name(i915->drm.dev));
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt=
/intel_gt.h
> index 2dad46c3eff2..149e8c13e402 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -10,6 +10,13 @@
>  #include "intel_gt_types.h"
>  #include "intel_reset.h"
>
> +#if defined(CONFIG_X86)
> +#include <asm/smp.h>
> +#else
> +#define wbinvd_on_all_cpus() \
> +         pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
> +#endif

Don't include headers from headers if it can be avoided.

gt/intel_gt.h is included from 79 files. We don't want all of them to
include <asm/smp.h> when only 3 files actually need
wbinvd_on_all_cpus().

Also, gt/intel_gt.h has absolutely nothing to do with
wbinvd_on_all_cpus() or asm/smp.h. Please don't use topical headers as
dumping grounds for random things.

Maybe a better idea is to add a local wrapper for wbinvd_on_all_cpus()
that does the right thing. Or add the above in a dedicated header.


BR,
Jani.


> +
>  struct drm_i915_private;
>  struct drm_printer;

--
Jani Nikula, Intel Open Source Graphics Center

--_000_MWHPR11MB16453F9D6D8C085B94D8DD43E1309MWHPR11MB1645namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div>
<div>
<div style=3D"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" d=
ir=3D"ltr">
Thanks for the feedback! Another idea &nbsp;I had that kind of align to wha=
t you are suggesting is adding a wrapper for wbinvd_on_all_cpus within drm_=
cache.h, then having it be included in the three files that calls this func=
tion. Thoughts on that?</div>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div></div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jani Nikula &lt;jani.=
nikula@linux.intel.com&gt;<br>
<b>Sent:</b> Friday, February 11, 2022 5:33:37 AM<br>
<b>To:</b> Cheng, Michael &lt;michael.cheng@intel.com&gt;; intel-gfx@lists.=
freedesktop.org &lt;intel-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> tvrtko.ursulin@linux.intel.com &lt;tvrtko.ursulin@linux.intel.co=
m&gt;; Cheng, Michael &lt;michael.cheng@intel.com&gt;; Vivekanandan, Balasu=
bramani &lt;balasubramani.vivekanandan@intel.com&gt;; Boyer, Wayne &lt;wayn=
e.boyer@intel.com&gt;; Bowman, Casey G &lt;casey.g.bowman@intel.com&gt;;
 De Marchi, Lucas &lt;lucas.demarchi@intel.com&gt;; dri-devel@lists.freedes=
ktop.org &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH v1 1/1] drm/i915/gt: Move wbvind_on_all_cpus #de=
fine</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu, 10 Feb 2022, Michael Cheng &lt;michael.che=
ng@intel.com&gt; wrote:<br>
&gt; Move wbvind_on_all_cpus to intel_gt.h. This will allow other wbind_on_=
all_cpus<br>
&gt; calls to benefit from the #define logic, and prevent compiler errors<b=
r>
&gt; when building for non-x86 architectures.<br>
&gt;<br>
&gt; Signed-off-by: Michael Cheng &lt;michael.cheng@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/i915/gem/i915_gem_pm.c | 7 -------<br>
&gt;&nbsp; drivers/gpu/drm/i915/gt/intel_gt.h&nbsp;&nbsp;&nbsp;&nbsp; | 7 +=
++++++<br>
&gt;&nbsp; 2 files changed, 7 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/=
i915/gem/i915_gem_pm.c<br>
&gt; index 6da68b38f00f..ff7340ae5ac8 100644<br>
&gt; --- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c<br>
&gt; +++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c<br>
&gt; @@ -12,13 +12,6 @@<br>
&gt;&nbsp; <br>
&gt;&nbsp; #include &quot;i915_drv.h&quot;<br>
&gt;&nbsp; <br>
&gt; -#if defined(CONFIG_X86)<br>
&gt; -#include &lt;asm/smp.h&gt;<br>
&gt; -#else<br>
&gt; -#define wbinvd_on_all_cpus() \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; pr_warn(DRIVER_NAME &quot;: Missing cache fl=
ush in %s\n&quot;, __func__)<br>
&gt; -#endif<br>
&gt; -<br>
&gt;&nbsp; void i915_gem_suspend(struct drm_i915_private *i915)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GEM_TRACE(&quot;%s\n&quot;, =
dev_name(i915-&gt;drm.dev));<br>
&gt; diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915=
/gt/intel_gt.h<br>
&gt; index 2dad46c3eff2..149e8c13e402 100644<br>
&gt; --- a/drivers/gpu/drm/i915/gt/intel_gt.h<br>
&gt; +++ b/drivers/gpu/drm/i915/gt/intel_gt.h<br>
&gt; @@ -10,6 +10,13 @@<br>
&gt;&nbsp; #include &quot;intel_gt_types.h&quot;<br>
&gt;&nbsp; #include &quot;intel_reset.h&quot;<br>
&gt;&nbsp; <br>
&gt; +#if defined(CONFIG_X86)<br>
&gt; +#include &lt;asm/smp.h&gt;<br>
&gt; +#else<br>
&gt; +#define wbinvd_on_all_cpus() \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_warn(DRIVER_NAME =
&quot;: Missing cache flush in %s\n&quot;, __func__)<br>
&gt; +#endif<br>
<br>
Don't include headers from headers if it can be avoided.<br>
<br>
gt/intel_gt.h is included from 79 files. We don't want all of them to<br>
include &lt;asm/smp.h&gt; when only 3 files actually need<br>
wbinvd_on_all_cpus().<br>
<br>
Also, gt/intel_gt.h has absolutely nothing to do with<br>
wbinvd_on_all_cpus() or asm/smp.h. Please don't use topical headers as<br>
dumping grounds for random things.<br>
<br>
Maybe a better idea is to add a local wrapper for wbinvd_on_all_cpus()<br>
that does the right thing. Or add the above in a dedicated header.<br>
<br>
<br>
BR,<br>
Jani.<br>
<br>
<br>
&gt; +<br>
&gt;&nbsp; struct drm_i915_private;<br>
&gt;&nbsp; struct drm_printer;<br>
<br>
-- <br>
Jani Nikula, Intel Open Source Graphics Center<br>
</div>
</span></font></div>
</body>
</html>

--_000_MWHPR11MB16453F9D6D8C085B94D8DD43E1309MWHPR11MB1645namp_--
