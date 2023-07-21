Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F06EB75CCAB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 17:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0E410E6B1;
	Fri, 21 Jul 2023 15:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC3A10E6B1;
 Fri, 21 Jul 2023 15:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689954812; x=1721490812;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m0Ty5uMs1TjO4tXq8y8eCgyYHXZyQfEyhPZaRT37rAQ=;
 b=AZPqAnFqN/cgUwd8GhnuPvIVbshmcUJx1+6i+pltcDqQExw4a0SLjtlg
 IwyYTVVOtVDP5TGuHF+PxLgonSnIhRY21aAVOkytsx/vqAhPUCisTZUNl
 uJLv4KavNpjODp6nZUwuTji/tdyXc+qxgFrO/5YWwaGZH56h+hRHzrBie
 NfRZ8uQpaFdmLhW3vyZtPG10W0Yf0kqflWiSWFpC+kSX4+bHy2pZMCH5E
 CS+O4jwsrJJcpIazlB0/tH9CWZk+XUKWPYzAwHA4rkWOcmwEIkgEmZ8H0
 gljP20M2QakHZF/s5GruHjrOuNRL+sDuZAfKNn58bAivzVk8Tt0pbOdP5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="351931945"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="351931945"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 08:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="838604819"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="838604819"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2023 08:53:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 08:53:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 08:53:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 08:53:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bh/XWj7l+7cSkwZzGG69FOJTZvfoMUUDygRxeBTQYWSwdhbec35lMT1de5x1Cgav2/6EVn60lvDDHNNDlvJOxGNzafg8gjbJzlc4945cJwMFdwnfSGKgjblWd2y5ZK4usa9SWX8mm5n28EYAN0ly1Fv5xINoLJRHnVub5shnBJshCBUrYEQxmP6fJ/2fFodgw84b6YQ91T9IJ8T9WfaAIkn1oKrK9RVtbNxNiH6hysWRVyuPw7OIvbZh+m9wqpdLVerA3bK3qH6tqOqHH28vRPbELta51eWD2OzfUmBO8k0l3zUba42oWgskfsdxBp0Akcc7AKsloKeB7wWb/f66FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6qeRaFKqrT1wGaViWO8/H/AX0p1+hqRpD4YYuyZVXw=;
 b=Z87kGMOVLuNoSCjuOyL9WPHhLRvIT38q+ftIh8neB3L1tHtB0uwHDqkwjMID8vWZ0YSXzUEsG9kSa65qRiDqpwTWJL9PYCD8jaMyh+4Tk621quITXXvH+yj8bwWJ6VGqVNXY6UyGm/k4c9pOf4naeXbWRS8P2mPciP8QjMoY9Uh2DUl9NYpJGmYG1JEv6Uqew4g6nobZjgde8vSIWS+AkLgeM+YInz4/KpqFPPt9Nb6BVGuZ1vTApm24qc4WELOECPfUCQcL0jBoW8MK8B8uXRx1YMdb+7SQE4tloVKaMsrkO5NrzXMhD+7UQ37N5k8jZMTwjlNKpQOGKR/Ar7mOIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 DS0PR11MB8207.namprd11.prod.outlook.com (2603:10b6:8:164::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.24; Fri, 21 Jul 2023 15:53:29 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::8934:bc24:bf8a:2316]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::8934:bc24:bf8a:2316%3]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 15:53:29 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915: Use the i915_vma_flush_writes helper
Thread-Topic: [PATCH] drm/i915: Use the i915_vma_flush_writes helper
Thread-Index: AQHZu9Ric6UfZ2yq8U6V3Rby0fqv9a/EXulw
Date: Fri, 21 Jul 2023 15:53:29 +0000
Message-ID: <DM4PR11MB59719ED1F73A13854954AF05873FA@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230721130741.1306563-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230721130741.1306563-1-tvrtko.ursulin@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|DS0PR11MB8207:EE_
x-ms-office365-filtering-correlation-id: 632cd155-8533-471f-f278-08db8a02a0aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OvCnuiVv1IJmRZtvYvwGQGLbiP8Uee+b9vNXgzRe63MqBkMjcfqUjlz9v/FPWgiv8aS2fNIsZoLGx2AoqmmPzxraxUtbAQVupWE6HOTqpKeSNiLJM45r38HNkzXDvPyGdvQdcoLvRsBvDzSKPlAepR/mVL2w2yr1Ad1JycT4soSH3SNDsmr5icIKBRxd4ztFOL0gUZGqX6NkYC4Q/VV5otJaKzlHTdEFRDmr/rd7dpk69s7EBxmsSOy1759wo7sIXCeEVBAOuZLUQ+zayUwadbJwk0Y9X5kXzz65ou1Jp7dXlFyA5Gq7Bimpx/6z9JCRkmB5X/YeaC9nDuTAzkg0ZwCJYfVVPPIEQUYPNqO1zMotvHNGo+DajPAOUm3KyhqWINITI1Z5JjkM1ypO3t0Kfpn0aPZWprdgw3tAjDNLascs2ve7yeZyHkKCW7BQwP0gvKNiJXRafv+sZfgZIY0pLzaSQg2YYYxr+J7nNCE1dAuKY8+ZzULwhg9p3VzbvSdL9Cg8IoSViB5dOq+l5iYhroh1aGY7DxCve4EDO4Duwi3IyzK4Kw/cGmzotPJ2yosaFYJeLRZe102vi0Zq6A5p36UYJASQayQph4iea+MK7FGzXr/BXIn00ztRjq7RIzbe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199021)(5660300002)(52536014)(38070700005)(66946007)(76116006)(66556008)(4326008)(66446008)(64756008)(66476007)(41300700001)(8936002)(8676002)(316002)(86362001)(33656002)(2906002)(55016003)(71200400001)(478600001)(7696005)(186003)(6506007)(53546011)(26005)(9686003)(122000001)(110136005)(38100700002)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z4trq1UCm2oKibL+SuE7Oo5ZdtHRtrnLXoPng2/1dRZ7f2iDxy7zKgD3OIt3?=
 =?us-ascii?Q?QQOaMxWrYTB1posfdvwpKetM7iNWHgxtvdUr9Dc+/lu/TLkruMSCZjUDefQ/?=
 =?us-ascii?Q?ABy/QPIWXByZliUeYar/cYkChjlAGt1YTlji6Yd86oDAkcGOOkIduuqh9NG1?=
 =?us-ascii?Q?Zv5EUiq1tAJhnej7cjsNssYuNLK5rnouGyRkhihiLgx4OIIaJwNgGn2pcqZJ?=
 =?us-ascii?Q?A37hnXTQym081hfQIeUY+6HdkZq8b5REurxzm2r9aptpsnjRHB1PEZzUEb0/?=
 =?us-ascii?Q?aJubEpmonY4wZLVUC6ECDgEkf5TxVIjiIQGa5+b5T1LptulJaYxFDrjd/Cev?=
 =?us-ascii?Q?7kw0I0218/RIo4EX3Kbb8PXCGyIuxQSeyIQlFPsujvTNUI++H+FLK+IdI6Bu?=
 =?us-ascii?Q?ZRsFcb0yGOq2KCwzSJCKrrtrnN7jTZg3WyIs5qmxVg7ELZ50LtMuEqDsYZtI?=
 =?us-ascii?Q?J1bjRayKkfA2GKcEvpw9EH0/2biRlqLRxAjzYkY8y0weHZJ52vDYAaWaPLv2?=
 =?us-ascii?Q?EF4Kbr80otpu0TYOlnkHOnNJu6z6Ajfo3mh/IszF90mYJ46BEtM1Fj+5uneH?=
 =?us-ascii?Q?ee/7KwUTS78xvM7C3Yg/3/R7YsgllafhrTgL0uSx2SuCGkhDcfiZ+4JipARj?=
 =?us-ascii?Q?eylZ39OefDmwhigDfjiAU62l8+2t6XPVe6vxXsnCMAaC1SUSK+HTslNRAx1K?=
 =?us-ascii?Q?80bZmtt28ctq/Yfkjs45/9LSEVLtc3m/gtukgW/BXWFYF49y9c/Y3kovb9Vt?=
 =?us-ascii?Q?h8txI0TvVs7aLZFh8d+T2Dge+jjDKuX3FkfqCu+karoiKNtrQg1YHe1KjgOb?=
 =?us-ascii?Q?9nHGRy+oOZ1H7/Z6hAnSVLL6QGa48wpym814EGCWG756RbGB41tI6PtoTb7X?=
 =?us-ascii?Q?jt1p7QWy7VrHPrAqhwpR6x0KXPSy2q2lfxgEfYYs/feZlAhyEl+BqUjflEfV?=
 =?us-ascii?Q?9cHRuHjG/v5wVo93W1pDPVSa2NR7P/HWs11GxE7WSPvm4U3G6Qc5JsXYWrfB?=
 =?us-ascii?Q?yNyDwv4+OA1dVqz7NWFKS+DD474c5SiblO6LD69Nf5p2cOg7Lo2ZzY+lDiig?=
 =?us-ascii?Q?13pf+HTrVUMui8EucU571dOdDDpjCOKuFPxfTjk5vm+BzL+Vc6Qe/bKCcRMh?=
 =?us-ascii?Q?4a2jZC6H8uuw5uc9QUwvcSaZskIwZGoobBKXymRhi+kxWOdKjchKsM7ICU3Q?=
 =?us-ascii?Q?DOgZZJ9e4MkQchdUmHBFdmp3mvU+PVAdY77jk0jl8Gy63KRDyXIRQktiENAs?=
 =?us-ascii?Q?8Qmezp8KgJN2qgLMjYfTi+3nmi7hwwZDk5Q/xFeuXK+mJCZqsiTSqH6rVHmb?=
 =?us-ascii?Q?SPiBgicswMQHKSPDB1mhZg3sTdvHCqjZ6S3tpYCQTjQ6+yuDR90xckxWxVUJ?=
 =?us-ascii?Q?PD0DhvJDekCPxRzqNYuHevdUvHSKGHNI5Rpqt0NOuFBTtOA90aaRPSnLA0T4?=
 =?us-ascii?Q?jg7adFz3sxopyUHVYMd+9aNY8KGFNH86Kx70jnxbuQtRqKal3XnPKQlQ57p1?=
 =?us-ascii?Q?u5LZy2Lp44/CKvfkdCr3xpAV405Xx3cWjwpUrdatAkk0OYQ/IAWxh5nuLncW?=
 =?us-ascii?Q?aPNNwaqlzBltid5Gl9MrRNarXfFBnwkwK2YAsLQwbcP1B6LTcQNCeoV91tTz?=
 =?us-ascii?Q?QQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 632cd155-8533-471f-f278-08db8a02a0aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 15:53:29.3006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: puswAyAZiBWtqhQqgRY9KJuejLBJLjMUlgatNtIHmOJm62y3PqvXlkKMhBAMqqGWttSK4CaaVjn4I/oOHxkuKuVPzc4xYtB4bNnArRQsjmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8207
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Tv=
rtko
> Ursulin
> Sent: Friday, July 21, 2023 6:08 AM
> To: Intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Ursulin, Tvrtko <tvrtko.ursulin@intel.com>
> Subject: [PATCH] drm/i915: Use the i915_vma_flush_writes helper
>=20
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>=20
> We can use the existing helper in flush_write_domain() and save some line=
s
> of code.
>=20
LGTM,
Radhakrishna Sripada <radhakrishna.sripada@intel.com>

--Radhakrishna(RK) Sripada
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> index dfaaa8b66ac3..ffddec1d2a76 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_domain.c
> @@ -68,10 +68,8 @@ flush_write_domain(struct drm_i915_gem_object *obj,
> unsigned int flush_domains)
>  	switch (obj->write_domain) {
>  	case I915_GEM_DOMAIN_GTT:
>  		spin_lock(&obj->vma.lock);
> -		for_each_ggtt_vma(vma, obj) {
> -			if (i915_vma_unset_ggtt_write(vma))
> -				intel_gt_flush_ggtt_writes(vma->vm->gt);
> -		}
> +		for_each_ggtt_vma(vma, obj)
> +			i915_vma_flush_writes(vma);
>  		spin_unlock(&obj->vma.lock);
>=20
>  		i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
> --
> 2.39.2

