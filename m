Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF38AAE8BA1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 19:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50ADE10E7A6;
	Wed, 25 Jun 2025 17:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZub2fFC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EB910E7A6;
 Wed, 25 Jun 2025 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750873186; x=1782409186;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mgXojBcMb1lnxBabrw5GWxKiP7vhSxwb7/g/KIHTrJo=;
 b=LZub2fFCzIcVSxc6RBUVjgWaH6CponcEKi9K9EcQHF05plA288xcBd/I
 IeTl0pvDYMceLA+/1AxDlNUp0tfstdhfuEo2gIs8KK2WI+4ZR3bRTN7ru
 tLhaSLG10UHa6dFs5pbCE9jIV9qk9QwVgfKDzi8X04kfCSpOvR7VXPkJt
 ahGbHXk7w4hzoslR/Oz2s+608OiCuGOuYWBA8ru/tf/wXJxO01nDBvEWk
 RvxZN25FQR6TeELOqT25rgB2IVWHwm0jsI04kZrnqTtlb9q52jVrjcTY/
 7uC//R0c5t0tDo9zhwrf+7gWXfnS+oAlNYaEtKz1WS4zPCZANXMBi76p6 w==;
X-CSE-ConnectionGUID: dvrJdbTjTL6zQfHSR7fTZQ==
X-CSE-MsgGUID: 4qieirrLRGW2yQ8QWDReZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53294315"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53294315"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 10:39:45 -0700
X-CSE-ConnectionGUID: 3FGTlKzYRlSOrayzq7Hxfg==
X-CSE-MsgGUID: bwVAum0pRH+RDt+0t0cUNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="189466629"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 10:39:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 10:39:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 10:39:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.72) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 10:39:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzuFngai1h2OoH2WpcC5KgXdHfRElp534eEGAXa0eq0CFfPFJnB22sD3hLrPkqjNeEFMx4bPRD0t84uuLwc75Gwh7DKr9HgsTyqnU9g7B4G5c0fZQ07iclxjYw9URfE0aFaQnlNKepTvM3aIpvIKGa7Bal/5bz73imJfStavVUX8kqQJtSIFdnsWMiRkKLH0Ho0e3U660++myLsP+Ef2jXIcQ92yK4HqBf22UpSyi9OSJPGS0TBt+umaT4UpOuQl9UlzpxIncPZ74UWxROwyCDNEGGkSHC5vv6W28UrOcJkgG8xRdUuX91kF8+6q3l7jdiBD6EodrkvCHQFM28xvAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6cXwB+wZnX7c8Tr7lm6x+RD/RN2UeRQ6rBndrLJb3k=;
 b=ejcz/0/jZDubm2LM7xxMS/nqrqw93T/eBVTwgaEhICOz+ckYH7Ywm6wQz/oABCY6uUqTXdRB+jZbZ5naVtbjhiupOmsxB3E7iSpPm45buw1K+c9BjFMXn41igncr9yU/fM7bu28NrC6f8ReystTnPNokbQ8fJtOjUOhnGmidLpZ1je+9CSEozwzAow457iZIPNRAZ/ZoRLYD5bBIJAbDXBr0REwDsaaFdtcm6l9GyCrSFn5beY9Fx27iQw/dirP0c48kd+wR6pjJ5eX8eFGjV7Tdi/XwDF8k2pgt3lkejdx/ONv2al9Yytl547IkJbJVN1hUbgSRyCr0iDDAqIdPbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 17:39:41 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 17:39:41 +0000
Date: Wed, 25 Jun 2025 13:39:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Frederic
 Weisbecker" <frederic@kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] drm/i915/selftests: Change mock_request() to return
 error pointers
Message-ID: <aFw0VyNuV5twrHIQ@intel.com>
References: <685c1417.050a0220.696f5.5c05@mx.google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <685c1417.050a0220.696f5.5c05@mx.google.com>
X-ClientProxiedBy: BYAPR01CA0036.prod.exchangelabs.com (2603:10b6:a02:80::49)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH8PR11MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 071fc1b3-81e4-4415-98bd-08ddb40f43b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aphzOVfc1PXvZZ2wP8SGk3rXbce1Wdi5OWcV2DUsktsakxWBlHfxg/cb1WB0?=
 =?us-ascii?Q?EG7CJ8OsdqteaN55/0+xLnmfTm813vgYKupfV3n7RFGjUuIIIjqfltMGhIn7?=
 =?us-ascii?Q?G8f3BUMy2jKV3vIg1ENtA1bA3ZpoDLnhZ6dGlIqLXfx6o55MhvpiaAD6G5KQ?=
 =?us-ascii?Q?GeCxFvS+ULcyvye2MyFa2ECNWWCHcygUnNV44xQkJKxChsL1+iq4psovAfFE?=
 =?us-ascii?Q?jZP2C2s6Ve0Iv73yecBmvMr0mYm4RNLW38vDL16YZZFNJWClQLYLnTZvV/2k?=
 =?us-ascii?Q?j9pFyGwjr1S7Qy90WZG86nwxwWguHT0KlzmlOO14Cd1LIiHgYgUVI5tNafdK?=
 =?us-ascii?Q?4elz5Og8EvOoJWUwlOvxchysg9wGin/KCUU8CbyRjJSIMv8huYfKYbd4tkRy?=
 =?us-ascii?Q?TcFlsdm9m12FuwDm8jsQ5gZmOwct6NJtAyC/zQxEBYAz1ZyhNyT+Ktu7nI3s?=
 =?us-ascii?Q?f1EPlohpZJeHA8UB8WB+U30kanZGrMjxrLJoKePhDx6RUCAS7MalEaG3N+2i?=
 =?us-ascii?Q?gND5R+iNuTcB9bUbQrtNjwJBoJgLMI9kPXCRoWI/fRZs9JkACj0ttV7tKqqZ?=
 =?us-ascii?Q?e3ixvQZN1LFoWqFkXnjVqvSi3Z9Grl4kqS5mtjQhDWd7pODefzYeXELP14HE?=
 =?us-ascii?Q?NEUBKcWp9ruMsMTTgv8Us7vktrMZNcDmbX7iUw1nsV62F/S0aOeDOlCoarXs?=
 =?us-ascii?Q?heqhEbgiFaP2fxY3y9G+20pxpndNjLEVHVQhP7MoaH6j1Q0D8uG7pW6K+fTI?=
 =?us-ascii?Q?Cw634/c3131o7XQLc40IEste7x1wYZ1Syo3kEOViPJUn9HCca4BVgrs5EiQq?=
 =?us-ascii?Q?pRAOvfSS8rfCz043y2fz0xH7IPWMR2OjeWUI8HK3Z2cfu1xpTkTAkJT5fqfY?=
 =?us-ascii?Q?HxLFip2NkNIkaZ+jq4PKzTaVDs6mFML9W9go+WoG/KJ2bQ9ioBXIHfCVnYOT?=
 =?us-ascii?Q?ecYg5gZNgcZBYZySWD7Vbf++DiwN1vU1wx6W11poUPJz9eDa270lvJezxpTr?=
 =?us-ascii?Q?2bz/u/pwV/wP0Yb1JdVeIRKvNT4DO/ykZqcCIM4g1pd0Fp1B8ZhAmG8SaWzm?=
 =?us-ascii?Q?JmaoB1VSUBu2gon1xtNDFwesdOMxEuyn3TlO+nPFtiDBv+vR5qpsQPMTAJvL?=
 =?us-ascii?Q?pGS2VktGmiFdREylJgYCRWfxiT5tW953/fu++v3fdOrKSxJxLsli1IirLzUi?=
 =?us-ascii?Q?uyZAqB5/QcRuS8PR95dM3GluGSmEr2GX1fTtnjsGOrSdX6x0Yz5klPp+NGKs?=
 =?us-ascii?Q?OE8tNyVXuUygKyo1YLxS1SfRP5AfeP1TBToafUi2A8w8StzxOKW7FFkfVwOR?=
 =?us-ascii?Q?z84rp5ylkNxrTdoxJqTDQQdHVnRI+6zhoD7LKI/V3d19NsgztGwIwIbZ9r7F?=
 =?us-ascii?Q?xB7ip6UkHJwOX0HsL6n54PqFXyHtLGN+wQKBnWjbaL9PVvwbKauTUDFW6/MD?=
 =?us-ascii?Q?V9g5phm6FvI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x8elEzMtAxOa7WLP63hU2gGuXCNzf8z2xw2rbiuSf+LfWVnydu7X5yrd7pbA?=
 =?us-ascii?Q?mUGiZQhle967aoM6zGmq5szOhzr/WmpWTvM++q7Bxg2GjGgS5IOJcFdqGeH4?=
 =?us-ascii?Q?fWaqRzz2Qw7859ce5+tK+mC5+lNstmOhTio1ptRCmKVrzkr6/oOB6byzSaJx?=
 =?us-ascii?Q?+Zylcydu7cNEnGuhbh4WriRSd+busv1XC4lAplsqhZiTDHGDt1Z0ZCgUdsRb?=
 =?us-ascii?Q?mTGdb89v2gC637hu5Bh8y9EhImOf+mKuHsuysxLJdc/TAN2JaCCvetua9Om8?=
 =?us-ascii?Q?oEDfqOwE6Zmwtzp7sUA/UXudyGx9VBrMoGXEwAlxQsZ58CV2a3lJb1v2lUsK?=
 =?us-ascii?Q?+wtycAZrHSZ76ERQZs/FFSj1DHyMKlIDUnZNoxxN1gNII76VOs++Gv1ka90I?=
 =?us-ascii?Q?UouoGvVfgX27uUjzXiyzytUVKjxApxQjAPzr7hYCHIjn9w9p/JmXcJsutg3v?=
 =?us-ascii?Q?nmFAy6nKB+53MzdI4JpH3kt+nXbJwUt58yXUrewKuatN97QEum22eRoDTpex?=
 =?us-ascii?Q?uX0EvXmIxMDZ8p5hShK25brK8fRqY+pFonD42R+bJQWIJfjm2Di6JykQp/pV?=
 =?us-ascii?Q?r/T4olGwWPoDDwsqUl6mPx1wEAdS/uuP9CJgHLA3cHfBojd0yHR1Mwp+Prs0?=
 =?us-ascii?Q?9eO9SBSq+xhVaTK/FNk+C6cy67dZ70YAXzq6BUFC1vLProTrdXvsOgPxMWxZ?=
 =?us-ascii?Q?JRul4KWWIY2Gjj94z2H4P1jfoEN0iYMGvpEZ/j3XGmQvWlkRapmeJVQkW8FF?=
 =?us-ascii?Q?F8nFGiRAqxN+SYYkxGOTc6sFygQf15p4r2Y689nE/dk049cDUx14flquK9vz?=
 =?us-ascii?Q?hmr3f1JFc/YQv1OynhaomOG0na+gUVtLIX49bPr6vvBBG3mtpKfPG4CrSWWE?=
 =?us-ascii?Q?AdBmjh47cv9bU+oDi9D+YzBtoca7hHgLFTGQg8xhW1nMfYhvA2XwuILpqGbb?=
 =?us-ascii?Q?anGzDF/h4jtLO5Q07mQWa1vKAbU7ccN1B3Ptq0E3aLgYqXpKBrcaPKi5ApM2?=
 =?us-ascii?Q?eqIQPEOKNg5cthOSykf1eZkw4Qnrp+hrNfNlJSGoOhNyyhuhMQ5WdCYz4b1X?=
 =?us-ascii?Q?tglCEUkLMmlKLpqm4T1nOTB4Vr2UnTJeHkkIW/yyWeqASdpIfoWF31GkgRVQ?=
 =?us-ascii?Q?aw/3YxejL/BwaEm8etkWkTNK501ID2Y4W+OnWMDF8OP6AaDEn46hV8BsvfEh?=
 =?us-ascii?Q?YIn4BZ94Efdud3k99mwS4bAZohx7DVV7qVDMHGevC10i8nsG6PRPE8et7tCM?=
 =?us-ascii?Q?Uo93Lf9IV7w0gTe9ZGVkcm5D6jTApUNazsHtN0XFM2XR7zPjp9XNJliCq6Rq?=
 =?us-ascii?Q?A/bAeIegnaRioSKhessD4pq46ZlyaXVbLq3sZIsD5Pl1FMJu6dnlYDoRvE0b?=
 =?us-ascii?Q?8XaxHU+WXstAnS49hr+9yCvKn8a/sBe7hpf8cuLn05kAWpUko/feuRruqqXO?=
 =?us-ascii?Q?cn6dKxNRE/mmFzLzydL/3tAWyYLuqXRJVf4h1u0sII0qWGDP+udKmZDJT8g6?=
 =?us-ascii?Q?MfXkw7ocl+D09KW6AOKTyYVk7PWXK1wwgtaTMwV8aAsoyanXOqs6dbw/jP7D?=
 =?us-ascii?Q?o9I6IJNIsTSkJdAAktP3Fk5LopXurvqc5eFt0VQz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 071fc1b3-81e4-4415-98bd-08ddb40f43b3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 17:39:41.1742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCZijaV6G+rY2tfOTOQ6xeVX6Sz4HgOt6Vu3Qp+PvxdvNkyJsDv1PYGLeeviJ0D1fMC5U9slk7qeJWexE1o9ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
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

On Wed, Jun 25, 2025 at 10:21:58AM -0500, Dan Carpenter wrote:
> There was an error pointer vs NULL bug in __igt_breadcrumbs_smoketest().
> The __mock_request_alloc() function implements the
> smoketest->request_alloc() function pointer.  It was supposed to return
> error pointers, but it propogates the NULL return from mock_request()
> so in the event of a failure, it would lead to a NULL pointer
> dereference.
> 
> To fix this, change the mock_request() function to return error pointers
> and update all the callers to expect that.
> 
> Fixes: 52c0fdb25c7c ("drm/i915: Replace global breadcrumbs with per-context interrupt tracking")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> V2: In v1 I just updated __mock_request_alloc() to return an error pointer
>     but in v2, I changed mock_request() to update an error pointer and
>     updated all the callers.  It's a more extensive change, but hopefully
>     cleaner.

Thank you

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
>  drivers/gpu/drm/i915/selftests/i915_request.c | 20 +++++++++----------
>  drivers/gpu/drm/i915/selftests/mock_request.c |  2 +-
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
> index 88870844b5bd..2fb7a9e7efec 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> @@ -73,8 +73,8 @@ static int igt_add_request(void *arg)
>  	/* Basic preliminary test to create a request and let it loose! */
>  
>  	request = mock_request(rcs0(i915)->kernel_context, HZ / 10);
> -	if (!request)
> -		return -ENOMEM;
> +	if (IS_ERR(request))
> +		return PTR_ERR(request);
>  
>  	i915_request_add(request);
>  
> @@ -91,8 +91,8 @@ static int igt_wait_request(void *arg)
>  	/* Submit a request, then wait upon it */
>  
>  	request = mock_request(rcs0(i915)->kernel_context, T);
> -	if (!request)
> -		return -ENOMEM;
> +	if (IS_ERR(request))
> +		return PTR_ERR(request);
>  
>  	i915_request_get(request);
>  
> @@ -160,8 +160,8 @@ static int igt_fence_wait(void *arg)
>  	/* Submit a request, treat it as a fence and wait upon it */
>  
>  	request = mock_request(rcs0(i915)->kernel_context, T);
> -	if (!request)
> -		return -ENOMEM;
> +	if (IS_ERR(request))
> +		return PTR_ERR(request);
>  
>  	if (dma_fence_wait_timeout(&request->fence, false, T) != -ETIME) {
>  		pr_err("fence wait success before submit (expected timeout)!\n");
> @@ -219,8 +219,8 @@ static int igt_request_rewind(void *arg)
>  	GEM_BUG_ON(IS_ERR(ce));
>  	request = mock_request(ce, 2 * HZ);
>  	intel_context_put(ce);
> -	if (!request) {
> -		err = -ENOMEM;
> +	if (IS_ERR(request)) {
> +		err = PTR_ERR(request);
>  		goto err_context_0;
>  	}
>  
> @@ -237,8 +237,8 @@ static int igt_request_rewind(void *arg)
>  	GEM_BUG_ON(IS_ERR(ce));
>  	vip = mock_request(ce, 0);
>  	intel_context_put(ce);
> -	if (!vip) {
> -		err = -ENOMEM;
> +	if (IS_ERR(vip)) {
> +		err = PTR_ERR(vip);
>  		goto err_context_1;
>  	}
>  
> diff --git a/drivers/gpu/drm/i915/selftests/mock_request.c b/drivers/gpu/drm/i915/selftests/mock_request.c
> index 09f747228dff..1b0cf073e964 100644
> --- a/drivers/gpu/drm/i915/selftests/mock_request.c
> +++ b/drivers/gpu/drm/i915/selftests/mock_request.c
> @@ -35,7 +35,7 @@ mock_request(struct intel_context *ce, unsigned long delay)
>  	/* NB the i915->requests slab cache is enlarged to fit mock_request */
>  	request = intel_context_create_request(ce);
>  	if (IS_ERR(request))
> -		return NULL;
> +		return request;
>  
>  	request->mock.delay = delay;
>  	return request;
> -- 
> 2.47.2
> 
