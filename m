Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0590B4FDE8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A25A10E755;
	Tue,  9 Sep 2025 13:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9/0IJ20";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF0F10E255;
 Tue,  9 Sep 2025 13:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757425679; x=1788961679;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5MtjVbD7vXuZXqcu73rq9tEkjvd5hUjrA+KWZt2is4k=;
 b=X9/0IJ20DqV7jkY/bQMZpnlhnckq0qcgQVmnI/7BOipmtmWlYHRnzP7h
 wW4ujZBVYe6IhRzonTy+YjRIqE/pQw3gNolKNQSEjxBcE7p80cFD8551v
 VugdH9dsQEbxJLp8q1rQiObeABxXvoNNBUoyMPRSEtea4INeLtDCb1RBV
 q755Z+hbcXOAh7tJtSKSGAyZDtv5XJYDHG8SXfAyrEfZXreto7W05qpe4
 YbWMd4ORi/1RhS0vC9Ab077BSmKBXoQHQnLTZftXYpxsd3kOvC/eCZYht
 DACgc0B+PqNw8pFgt+zcFlcu69nENomC4hgsgqX2BTATGYnk0IhAIUfJw g==;
X-CSE-ConnectionGUID: Gt+JD/39Q+KVdsyclpvDvg==
X-CSE-MsgGUID: XGn7v/RaQf+A9cszpBt6cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77321250"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="77321250"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:47:56 -0700
X-CSE-ConnectionGUID: NyG7yFG0Sz6cnD9lKGI9Jg==
X-CSE-MsgGUID: SZuDQ96RSGKhJBfgMJQ7/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="178313411"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:47:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:47:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 06:47:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:47:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHQdvJclIT+cK1EV/hUkzifXOj0DmbLb09CZVh8bjWRzR13C5mZI28i+PA4+k5mlF5P+tNoWwiFPa4MPcNOT3NK++powOP9LGcSHTO1a+iJzGB8T38mIzAGbiQU5QKUY3MuUdnDmfxPtDmpsIHukxHAxPK00VS/IfYygilwpBH794omBeCSJHJFEHEIpMPlmK6srRUCewOiTYWBjsL/xSE3zcYCd0oDoK99V8mzPbikMR2pNjfJ7qy1YcoKECLLHLvW4crMIv3CwJTO0WUZsgnhFoGrsinxnfVLIoP7mdIfITHGTmZ7Q7u53LggChSlCbbeSKMrqx5A2vMNRqdVXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTnMovACkyCrnUgydpqVAsbR7HNN0S8aEXH91FKnim4=;
 b=siq0++6+KZoginf74mmSV1qhDdMLVmEQmenKkvB2PhlLSTYkhSYvCyiSgiNKrFuux6MxIm+LAbT5Nt+3M88ggq4RG3suf1xHlUK6oCxnsHXyvaEF7BFW9da+RhgbBssy8VInN/ID10a6JpPNyaf/Zi+nBmW/sYX5xuFyXShXnsNSxjof2EEPIgbvzU0qFz9KoOYe8n/LZiTquO4Z4t3JBQxOUa6751VS222rln6CtMHtIw2lA5VSEv8vpdKOvajN/xlNMEDeLouD69nqRaxcjPiwVmqjukUIfbAbS6iTEhfQw8d8OzMRK+msg/qFgSyk5g8ilBvGYEze6kdDlnDvqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB7068.namprd11.prod.outlook.com (2603:10b6:806:29b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 13:47:50 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 13:47:50 +0000
Date: Tue, 9 Sep 2025 09:47:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona@ffwll.ch>, <airlied@gmail.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <mairacanal@riseup.net>
Subject: Re: [PATCH 1/9 v4] drm/i915: Move struct_mutex to drm_i915_private
Message-ID: <aMAwAlp_zm4bis4x@intel.com>
References: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
 <20250908131518.36625-2-luiz.mello@estudante.ufscar.br>
 <b6c5dc00-ecbc-4654-9d0e-efe8d2ae36e4@ursulin.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b6c5dc00-ecbc-4654-9d0e-efe8d2ae36e4@ursulin.net>
X-ClientProxiedBy: BYAPR01CA0034.prod.exchangelabs.com (2603:10b6:a02:80::47)
 To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB7068:EE_
X-MS-Office365-Filtering-Correlation-Id: c29cfa47-2c2b-4ad6-b7c5-08ddefa777ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?klZ2UFJ4DPWrb7WXKkYvv+7pKYOoc9u/+MNWwaVZpeOP103zt0+EeoHwPIsi?=
 =?us-ascii?Q?FXcJ81NC2TnHXUMcvtO1Ss/YGwrPTUhxgEgytkfvTbffBy0o11rHT3qXSHgA?=
 =?us-ascii?Q?eX9ROAXHnWzZ4xYAYYoKPC0eMdkBuHBVmIg3bzQvY2PTwwVsgUCf+39681xC?=
 =?us-ascii?Q?jiZlFynlJLA++S8NfxPA6GGPHqZJD2Lmo5H/9V03YMeqjSHOLZVSKZ3+ZwEr?=
 =?us-ascii?Q?/YrPkUAnn8xpdbubvs/yiSvZCBuX6P6GxHrhvBmq0kVXSPxgdobwbp0EaRQi?=
 =?us-ascii?Q?7r5MwkNf07ohDY2DVpl0boDiCHjbaH3UQ1Rm/BoPDmeUi0prqCDJiyvpb+MX?=
 =?us-ascii?Q?lem/w8W686bE/75WTAL751KEuJbfXohZoMfrBznwS1qLt6zlyV6u97qZmQx8?=
 =?us-ascii?Q?9eN8dAZope+pvkcC31LuhTJocRvsduMNCAcAxmKCgWOjgsDlLuU3pUmChCpd?=
 =?us-ascii?Q?3sSpyg3HVEskPsPQN2wfuJqVHf+WoQrojj4DmxNnI/RpbuGxPiP+KuCKdxKY?=
 =?us-ascii?Q?NPRWQIqZvfC8WkgFaYj+p/JO0ntC/CSznHlZbog2XsWrNwGeK7AJ8SeYtsZh?=
 =?us-ascii?Q?A59volsJqwBFxl0+z1yN12GF1RfBDaxKMyLeDdHl6s7QnYIvRaqsL3Dg6Q/r?=
 =?us-ascii?Q?scpY4P4AxMluCppKYq8OK5PN6K2JfEuueIAkYw931s/etSQDVlRIT6NDtcn7?=
 =?us-ascii?Q?6TBmpLrG+/ozsLBwZnZ5cl/7uHYivc2hS0biuIjScwsJrpL7XvdVm50aOoWX?=
 =?us-ascii?Q?ZV/Hg5KeXZllkl8fBEsJUS09kBZFv7J/6IcMx6oTA/aWTR0PYrvig06wYP4v?=
 =?us-ascii?Q?fR/LFGoOr/idzCsFTM+CPFadEry/DxocwgEHbSImY7zLP4NfUNI/GNrk2ujt?=
 =?us-ascii?Q?/AWAjx66+bcyWwBRwTn5/ffnZZStDxdXRXcAtM7dMHYWc7np+UUESh9/ZmwR?=
 =?us-ascii?Q?U/1UYvnMQTsewMJrkhTXvtO8PheEP+s1NFy4TTWWXJwt5XnFHFXHcNjwBspE?=
 =?us-ascii?Q?EvNwqMJU769NarEkVb9kng5xL/gJF9jcz5uUN4gQ04FKNIj8e+N/2PuEmnWx?=
 =?us-ascii?Q?CDt9qHJFkTLzF2x+Eiq2rohJwMDFGdN0EJOHgdlWc6KfMpQVC3hdQSpgbSrM?=
 =?us-ascii?Q?uoElCN7cGV3koQ7IYJNKMdjbo9N2vfnhPROcZNe4qJcY+kycmOC7v4A48oIG?=
 =?us-ascii?Q?trAmjP0JjzRwstmg3ANlGAfWGNo38kzo5P5l+tohEN16AuHrEyvXD6YxMfnN?=
 =?us-ascii?Q?WyMUCGhEDz/127TmZ71Vcd8W4M2igstDkqIozO4gla4fC2b3CB/t5eSCqn50?=
 =?us-ascii?Q?rH6+YMh+zt9+v+HARadWka0bc9IlTWo+uLzlf/UFTF00RokuwknDd7Nw/iJu?=
 =?us-ascii?Q?balpW45sEkYNh8k1tm2pzvwa5XCceVy7GM5tschghX9BVBzw4wWLSv2tl7mp?=
 =?us-ascii?Q?UEfr+n/RJmc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Aw3LADXAGDcnZK5qU+5pyCYfuFriSnzqsLIEsIg+934kDgbnVBMMxWCK2qO0?=
 =?us-ascii?Q?TGa2jqTW3dWoxK7XZIJ3obC6SPV7mYycdXQ0NxOCuvZRQ3geuThXp5vKYKdX?=
 =?us-ascii?Q?iOOx0xCFvwZOl4rhwmIuN9o3vyfuI57NUlYM+BHQp1bzGftTuLKIdgM4eTLC?=
 =?us-ascii?Q?NnL+VED8rK5nws/T47gXvDe1XQXtnYPCMSnV+hempYu0WQLLD5mLAhUdVm74?=
 =?us-ascii?Q?rX22xcLvdUju0ME2CFzNoFmHJsrAuRUj51ObKAjmUTWiPsNVM/ae0QQ1dBUK?=
 =?us-ascii?Q?ogOoyZQzB2lfHZVkPuksItNye2WOMXZZpi5EJ7CkBYmmntPFkkpqzbFF1MN5?=
 =?us-ascii?Q?R56zb6hmGbuShP05Xqyzff/NBe0MeLo7ubcCB0U2eVi+Vh+5c5O/0kUntVc2?=
 =?us-ascii?Q?sHxWPE8K0fSnUbkMX3aPcubKjdQuCeQfO/xJNZshvrq47XjQETW89YHm6gtE?=
 =?us-ascii?Q?wz+CcVa3NSptHIwCjLtcs/uzRIrBYLraJfJKxQEz92RvWT7vIa83GlARJ4h3?=
 =?us-ascii?Q?Gi5Vt4oLMCTDGH8vfmDxOh3iP6jVCh5EvrrQ6oUw84VMocOVLZSAiX1jE6gx?=
 =?us-ascii?Q?Npy63a8e5fzr3xAU6fOpylOZR7EWG5KiwVanjcjjWppLZtb+86S8rTUvCa6n?=
 =?us-ascii?Q?AEzTXxpjGMRBHiFk54v/EIwSCY8dr/4CdEryu1kMOTUt/XOgHyprJ7xt3dQt?=
 =?us-ascii?Q?uNfHoKZJN1rvJOwLeCdSNZU3pAk337J95llGkcuHe25NUuvQS42mUZmIIJVU?=
 =?us-ascii?Q?DJZG+R/VzjqE6Gm9dGkq/LfvN+T8IWE8iv3z806AQxBzDnZyYdV+vzIsp2Of?=
 =?us-ascii?Q?Zs30bdRC8+AU5dSCgQXvSV0TM4cDsk/RwQudOZPFjGLzT1mpJSNUUqWKWjm6?=
 =?us-ascii?Q?dCQinApoN81d2JvsZtIF8hA/VTN2Yv77Mr1Eo5S/YDj0tUcChOhH2FoLl4nG?=
 =?us-ascii?Q?z4GiER4Vi4cxXKvAlnK7LquZJU2j/lxYNjq55CKdSygZgZYPrEUtKckG1StH?=
 =?us-ascii?Q?eVBhLjKFCR+saOw2wwjhPvtGu7/N0If54aKlBRKY2t69i56pjpszqvgXtU0U?=
 =?us-ascii?Q?anP6TOvjMkJStCfolVBq9Q2rzQ3XTV3w8iMtyL00XkDNonit8ouGd2EKxucn?=
 =?us-ascii?Q?iYbKPVZlvWBP8HwFJshwCCYxuf9748mqEyFodsgmUbNWbrMaP9nAltpJraA2?=
 =?us-ascii?Q?8qt/Vo6zN3Osfk4h0eLHcXFMda/85tQZNIJp56ojru5HY8W/lu4NipKL9p+K?=
 =?us-ascii?Q?ZW3pKlhqAXTTS8ucedikbn/zVtvd/FOMKnt8WKajh5RJFzdSz8vfC8/ZwUy7?=
 =?us-ascii?Q?6NavvBz2skUSsT1S+RuQflSjeee9EgZAFsDFaF8T0eZSgUDHYixJ5CvqKbMj?=
 =?us-ascii?Q?GyL3khjRWUWG4ofVldsT3ZVaEA42HoqpsPJrbtryWotna87zds4D7NbmobMW?=
 =?us-ascii?Q?DNcoVHMdI3SdPORhvLpDEbCu1p0SMxN7Clb0uPKoAdmnnYdT7YqDMar6UMOR?=
 =?us-ascii?Q?1y7wFP1XteU+gS+yBcon77SlZ2SIL8uhvbF8UD2+ckBNHNiCffzYNzLZOlX6?=
 =?us-ascii?Q?FCwawMI3z1XKvoxMO/d46gOHfchQV+mrbxewADETVk8ThcBQAuo/FMyS6zPk?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c29cfa47-2c2b-4ad6-b7c5-08ddefa777ab
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 13:47:50.4729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2b1M2HOX4m0GHR9pJrZdZz3/ZeF28ZXi2RcYa8bFK7qSEOkwUOd61yvf9XOcVO+mOo0dv/XRuf7VQLPDTCkvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7068
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

On Mon, Sep 08, 2025 at 02:32:28PM +0100, Tvrtko Ursulin wrote:
> 
> On 08/09/2025 14:15, Luiz Otavio Mello wrote:
> > Move legacy BKL struct_mutex from drm_device to drm_i915_private, which
> > is the last remaining user.
> > 
> > Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/drm_drv.c                  |  2 --
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  4 ++--
> >   drivers/gpu/drm/i915/i915_driver.c         |  2 ++
> >   drivers/gpu/drm/i915/i915_drv.h            | 11 +++++++++++
> >   drivers/gpu/drm/i915/i915_irq.c            |  4 ++--
> >   include/drm/drm_device.h                   | 10 ----------
> >   6 files changed, 17 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index cdd591b11488..ad3aee354ba3 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -694,7 +694,6 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
> >   	mutex_destroy(&dev->master_mutex);
> >   	mutex_destroy(&dev->clientlist_mutex);
> >   	mutex_destroy(&dev->filelist_mutex);
> > -	mutex_destroy(&dev->struct_mutex);
> >   }
> >   static int drm_dev_init(struct drm_device *dev,
> > @@ -735,7 +734,6 @@ static int drm_dev_init(struct drm_device *dev,
> >   	INIT_LIST_HEAD(&dev->vblank_event_list);
> >   	spin_lock_init(&dev->event_lock);
> > -	mutex_init(&dev->struct_mutex);
> >   	mutex_init(&dev->filelist_mutex);
> >   	mutex_init(&dev->clientlist_mutex);
> >   	mutex_init(&dev->master_mutex);
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> > index 09a64f224c49..65ffcaeee4b9 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> > @@ -677,7 +677,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
> >   	if (level < GUC_LOG_LEVEL_DISABLED || level > GUC_LOG_LEVEL_MAX)
> >   		return -EINVAL;
> > -	mutex_lock(&i915->drm.struct_mutex);
> > +	mutex_lock(&i915->struct_mutex);
> >   	if (log->level == level)
> >   		goto out_unlock;
> > @@ -695,7 +695,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
> >   	log->level = level;
> >   out_unlock:
> > -	mutex_unlock(&i915->drm.struct_mutex);
> > +	mutex_unlock(&i915->struct_mutex);
> >   	return ret;
> >   }
> > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> > index c6263c6d3384..d1559fd8ad3d 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -233,6 +233,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
> >   	intel_sbi_init(display);
> >   	vlv_iosf_sb_init(dev_priv);
> > +	mutex_init(&dev_priv->struct_mutex);
> >   	mutex_init(&dev_priv->sb_lock);
> >   	i915_memcpy_init_early(dev_priv);
> > @@ -291,6 +292,7 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
> >   	i915_workqueues_cleanup(dev_priv);
> >   	mutex_destroy(&dev_priv->sb_lock);
> > +	mutex_destroy(&dev_priv->struct_mutex);
> >   	vlv_iosf_sb_fini(dev_priv);
> >   	intel_sbi_fini(display);
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index 4e4e89746aa6..15f66a7d496d 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -222,6 +222,17 @@ struct drm_i915_private {
> >   	bool irqs_enabled;
> > +	/*
> > +	 * Currently, struct_mutex is only used by the i915 driver as a replacement
> > +	 * for BKL.
> 
> It's not a replacement for the BKL (i915 does not use the "good old" BKL
> since who knows when), but just a mutex (ab)used by the GuC logging and IVB
> parity interrupt work.
> 
> At least the comment should be improved, or even better, if not too much
> work, consider splitting into two separate mutexes. One could probably live
> in the i915->l3_parity and other in struct intel_guc_log.
> 
> [comes back later]
> 
> Never mind, I see that by the end of the series you get exactly there. I'd
> say series is a bit churny and typically you wouldn't be adding and changing
> so much just to remove it, but I can live with it in this instance.

Yeap, I had made same comment and got to the same conclusion.

Can I get your ack Tvrtko so I gen merge the gem/gt related patches in this
series through drm-intel-next? or do you prefer to take this to gt-next?

I have confirmed that this version is the same one that I had submitted to
CI and got positive results.

We just need to add the missing acks from Thomas in the both patches
touching drm files.

Thanks,
Rodrigo.

> 
> Regards,
> 
> Tvrtko
> 
> > +	 *
> > +	 * For this reason, it is no longer part of struct drm_device.
> > +	 */
> > +	struct mutex struct_mutex;
> > +
> > +	/* LPT/WPT IOSF sideband protection */
> > +	struct mutex sbi_lock;
> > +
> >   	/* VLV/CHV IOSF sideband */
> >   	struct {
> >   		struct mutex lock; /* protect sideband access */
> > diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> > index 191ed8bb1d9c..cdfb09464134 100644
> > --- a/drivers/gpu/drm/i915/i915_irq.c
> > +++ b/drivers/gpu/drm/i915/i915_irq.c
> > @@ -167,7 +167,7 @@ static void ivb_parity_work(struct work_struct *work)
> >   	 * In order to prevent a get/put style interface, acquire struct mutex
> >   	 * any time we access those registers.
> >   	 */
> > -	mutex_lock(&dev_priv->drm.struct_mutex);
> > +	mutex_lock(&dev_priv->struct_mutex);
> >   	/* If we've screwed up tracking, just let the interrupt fire again */
> >   	if (drm_WARN_ON(&dev_priv->drm, !dev_priv->l3_parity.which_slice))
> > @@ -225,7 +225,7 @@ static void ivb_parity_work(struct work_struct *work)
> >   	gen5_gt_enable_irq(gt, GT_PARITY_ERROR(dev_priv));
> >   	spin_unlock_irq(gt->irq_lock);
> > -	mutex_unlock(&dev_priv->drm.struct_mutex);
> > +	mutex_unlock(&dev_priv->struct_mutex);
> >   }
> >   static irqreturn_t valleyview_irq_handler(int irq, void *arg)
> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > index a33aedd5e9ec..016df5529d46 100644
> > --- a/include/drm/drm_device.h
> > +++ b/include/drm/drm_device.h
> > @@ -188,16 +188,6 @@ struct drm_device {
> >   	/** @unique: Unique name of the device */
> >   	char *unique;
> > -	/**
> > -	 * @struct_mutex:
> > -	 *
> > -	 * Lock for others (not &drm_minor.master and &drm_file.is_master)
> > -	 *
> > -	 * TODO: This lock used to be the BKL of the DRM subsystem. Move the
> > -	 *       lock into i915, which is the only remaining user.
> > -	 */
> > -	struct mutex struct_mutex;
> > -
> >   	/**
> >   	 * @master_mutex:
> >   	 *
> 
