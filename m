Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C91611EBF
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 02:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903C510E90F;
	Sat, 29 Oct 2022 00:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD7210E90F;
 Sat, 29 Oct 2022 00:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667003860; x=1698539860;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MMfrCegjmVcCthFg4RzYBwFFLAxw0EI9LRuuj3b8uiU=;
 b=iY+qgs5YMgXjMOcz5UFNkpE7JrVxu1tZhslTLNRI6/2hatAOkJAzIHUI
 xPpP5r2ILghRrsjzYXzT6iLn3XEktbg0bujh+n+xmidb+mi72SdOyApJO
 1usNWdNau5AAudE+FSawNpUg/9fe8sPHCVXwXUptLaeQrDdURI49wK8zy
 pfo6HVgYfzuBkx3XGxdE9g/sMZrr7dGYGWyY9A/UCd6u/fseRfkEu+s6K
 0PU9TtJ9HZEswchymkmcpYJ0gEtIQR5/DsT3/JCwSeV/dGlOOPqWUeoec
 ttCDc3ar3WcBqywc/52dXd2vo5HP3gBjPP4s65tELyAL4/jSGsXUE+tPO g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="372832369"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="372832369"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 17:37:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="701927743"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="701927743"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 28 Oct 2022 17:37:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 17:37:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 28 Oct 2022 17:37:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 28 Oct 2022 17:37:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 28 Oct 2022 17:37:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jq3NacTmP2YvClZ4Hl+iWHdZzzAVkLJQgnSfJ1mrmKiJ21awOh1YIIrjk68Hs7Tug04xaz8dwGOqePMDvb6ru+lkfDh1uuKV+tM7rEX3iOznfsDnP/x/Q0cU9VBOyKcNZlK7fJ6nsodEH0wL/7gb/+ANL1Neg68Ztc97l2P7vzuNhOZmiSwxoPmBpg/2C85pAjUgdQQldWojP8+c/hUBd6PubY1mVTBM14lJAa21X0hcpky0kPgj5j+qsR2Sdd0D2QjnTLlIjuMiOBunLNVoWUcxk4peKiee5PoJezWCmBhuPW5nJkwLM/5M4PX9lrE29alkpK0JAL8xTAkfN7IhDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQ+9IsgbGWJoL+fdbJ/wcEMqP2eB/9y6AE1bDE0mXPw=;
 b=R6nrjNnKVqzJitbmhXyP+Dss/46JU39dmIUUMg3y77ZVjUZ9n8nn5Hfmnbq+NoQ7h+N7PCfsnfgzIIdcXNR98/PhCiuOHOBcVxuyKcHmpqG/xa2BR7NsJrcImYLD/QwdAiD29fRZOpLliRRJYzwDjauBE0WGtkQu6/avyLPBYVNdsLK2IV4K9TkrNa8yJyXSHATX1iSDuPJz1JG8nnm1AUB9kIwVfXEd8o3FbdZaWbKMTw+L7QSMq78KIiXZC1oyDDrEnnLg3lz6f2CQWCclDCDU39ehgNnEz3rYlz8BwXif0Gouuw8HF4Au97mejJFjzc0Liwh2cJB3liXWXxvSsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Sat, 29 Oct
 2022 00:37:36 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::8007:140:f87b:ce57]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::8007:140:f87b:ce57%5]) with mapi id 15.20.5769.015; Sat, 29 Oct 2022
 00:37:35 +0000
Date: Fri, 28 Oct 2022 17:37:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/mtl: Add missing steering table
 terminators
Message-ID: <Y1x1zZ5e6ziePZE1@mdroper-desk1.amr.corp.intel.com>
References: <20221028224022.964997-1-matthew.d.roper@intel.com>
 <20221028230418.y4czdjjzxro7gvcd@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221028230418.y4czdjjzxro7gvcd@ldmartin-desk2.lan>
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|SJ0PR11MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 953f8b02-ce7f-4d24-c30d-08dab945c613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hMDSwkkdR61mVNdXEsanuc0Qh9d1WOEk4EdbBjD+OnXM6kof6CD+pOfJZx2ellD9aw02Rv8+Mek8yiQMUmoBn0t5C6n2FaRDO+GZhSw8SruoHYcCvtm7BmzHsT5HQ5mGEcLIof4sMJ5ylL12h0cWtyALk7P2aspDE7ibQvPmXm1L5dlmsAqT8EWzKkrGFmJ7fisXl/L4CGjdpFqByuCV0El89uhhKxMGFJ/MlHHbIVR8Wwhp8aW8GW/LSyrWiIZA+K7u5eN9fMgEP1WoTyRbkmIvTZZQk4gEeVOGZgDXeBm5pVBSgLC+dZTu49I40Pr/IORjvfBftRnK2VUcw4rT18Pb6sKfVDyucMUSe27yWsh4VgaSVgRIBfkNbPHlH+U/njR/juOMHv9lDKSiH/eY9oKEkhUwi5iJSKRPA6iIYBsoZQfJ/+meZune99gqfSLZ0Hprn7emzr+a23czJyMfgih5VItGe6+eiaZERDjJNKdgzgJIcmo6462qHf3b+eTUobeVtFG9mCPbqPCWWSTYCcxkv/5UMwYWTozza/FJeADMQsww1heK1Cv+3i4RS+A/IiOLg1EPJfa52rlnLXIm+0bXz0qPl3lr27iz0lOOM55E5pDJPtV26L7i/AcHKm3TNuzMLtsjp1zPyIc4BlP7ApOax/QNYQu608dk+00TQDH6Xt7we3L8NtTUngRjTRVwrF7lNmYSa/zd75aYY4djVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199015)(82960400001)(2906002)(5660300002)(38100700002)(478600001)(83380400001)(86362001)(186003)(26005)(6486002)(6506007)(6512007)(450100002)(316002)(6636002)(41300700001)(4326008)(8676002)(6862004)(66476007)(66556008)(66946007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dZlIIV72Pmnxi/nWo+UcZqdClo4sxTjH0AC092gz41vZHGLlAYeKNvxpX0tv?=
 =?us-ascii?Q?0zFkgtQBHdIsqQrlUaHhcpIVcNQvA2tfI2hcxqojP20LuebE3+/Uu8l1xOIK?=
 =?us-ascii?Q?3OJEHU/H2Jv31g4b34qXf3uQjxDtQONe0EgEXNLthWkY2WrHxQcmjUavOFMf?=
 =?us-ascii?Q?a5pCZnpZTQFNVnlZdakjY8sQANGnAj5KFOiIoAx2yOw/qMNhBfY5jau0L18T?=
 =?us-ascii?Q?OQYHKMGXL6HveUHvYfNZF8wL2Mo5iroASZtxW89UqMI6Z+0TBIZzNU62NFLR?=
 =?us-ascii?Q?ZKl7lvxXBpFJKOGsjgy0dMlTwW/vp46Wvnw+io6Sutq9tppvaDVpXTrV/wyU?=
 =?us-ascii?Q?QgkmjuD7DdHg9GlBXIIImqCsJVXMysqVk6Et0OWyQmTJAwS0xF/Uh0UcYkNq?=
 =?us-ascii?Q?uq8MUXMhisr6t/yNXqD2gkgBg+ZSTVNflYZ0Dl7kMuvXMcOnS47aMt5qUhZo?=
 =?us-ascii?Q?uhCYy0UeZJ8+tnkTGPlI+Nhi6oX3f7OINzdhD8gCXx9Ihqt43N42bzG5AcZT?=
 =?us-ascii?Q?7llBI6i6J0F0+vY1aMnCHC96AWC5S9k0LUZd+cHd3BwdN/IuIwS+seZnJeiS?=
 =?us-ascii?Q?qOpCYT+Q7ffcCf05fpte1NJrVlnHIdQEBhQDd99t0Oy+hs0TMlPRKknopNql?=
 =?us-ascii?Q?bBL+W09C6lLOLosY2uc0k6mrXbwWL2dS92QUJ1/yN5rustxe18fjMJAINS75?=
 =?us-ascii?Q?D11LKWHAXysUTTvM9l1dyaGtCrRccMta7MT50wamDUWXxQ0if8YVz1rdwSIO?=
 =?us-ascii?Q?FXfVG0O3jJMM/ZnfMTpbXv9iBPE2YYrgPmPeKio3NpourmdZplBpwY7C7b7+?=
 =?us-ascii?Q?+7KkVoZZmxQWyik3g/tfBnR/yUtIcJhcg1sWD9rTrCIcTJlNDJNxZntwNfzr?=
 =?us-ascii?Q?K61FbZZghbeKJLZL+2P8lOE1Hoks8FOMAILttsGIygsk7x6pylL/0QRKMpeH?=
 =?us-ascii?Q?4mRIuQpcn8xsoTdLMfPgw0JO0REbqs5PYdNrbgJOxN3xhH0BlBdL7P46AVnC?=
 =?us-ascii?Q?vAjyYg+RvOnVr8oI1owzZ2QiqyX9eow1wIPIazF2Q8UfdgyNsh5H3wb3SFhf?=
 =?us-ascii?Q?Avn9NYRQqfE0o/cnb2qW9tN/it7SxqAlNLjqDwEjl4hC3HIvy8U7GCMZ9CWR?=
 =?us-ascii?Q?pwIyjZgdoqdVqr8wowIYk2Itc79FowVsmXAxvkn6gJa1zc1gKP1Kuq+rYjnc?=
 =?us-ascii?Q?nrXEIzEyqMA4NrOTqgPy2TBFXxSIaHzviJM9p0+2hMYJpiZiaeSvm5uuKCrE?=
 =?us-ascii?Q?Ditbb+411dTDIAj5rtqALQjcFnhG85aKASADVMZ7LgMisCgf2TmgSaaQi4JZ?=
 =?us-ascii?Q?ylHH3amUyuzUukNltB42SLzQqgbGxZtvEEEEgn4CBoUZqVBiJn7BT7ujYkfv?=
 =?us-ascii?Q?BYRpXCfOX8HYY+RDg7QQUu34vJ4wPWpU0WxulM/BbDpG4MT0TEM801bskMmG?=
 =?us-ascii?Q?eD0w3Q2TdWNZFhk0yKgE9dngeAGm54ZprzeXxBokIxqOrVxCoFedKaMP8rGv?=
 =?us-ascii?Q?dMQOakIgHE2wnMBeArSmLsZ2A3GpvGFqgL8tSjHlBG2QgZEaAUFF/bpaDUV4?=
 =?us-ascii?Q?6+2OxmIqSinz8+r8j/5WZeymKTFGGxPFmvK0MR2oHdpK9z+QIRooDyPMe9vM?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 953f8b02-ce7f-4d24-c30d-08dab945c613
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2022 00:37:35.4818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5X7z5f2iZY8qe3ge1PxAo3UpqiaewsH3mB7JY4AAWaN4yfFhYLOPi6pNHpwxomouQtr5SFEWdCsyu0RkRooqFFlkYxzYRXMJCOYp08vvfCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6814
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 28, 2022 at 04:04:18PM -0700, Lucas De Marchi wrote:
> On Fri, Oct 28, 2022 at 03:40:22PM -0700, Matt Roper wrote:
> > The termination entries were missing for a couple of the recently-added
> > MTL steering tables.
> > 
> > Fixes: f32898c94a10 ("drm/i915/xelpg: Add multicast steering")
> > Fixes: a7ec65fc7e83 ("drm/i915/xelpmp: Add multicast steering for media GT")
> 
> I was thinking if we would need separate commits so they can be
> backported independently, but no... those commits were very close.
> 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks for the review.  Applied to drm-intel-gt-next.


Matt

> 
> Lucas De Marchi
> 
> > ---
> > drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 2 ++
> > 1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > index 46cf2f3d1e8e..830edffe88cc 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> > @@ -128,11 +128,13 @@ static const struct intel_mmio_range xelpg_dss_steering_table[] = {
> > 	{ 0x00D800, 0x00D87F },		/* SLICE */
> > 	{ 0x00DC00, 0x00DCFF },		/* SLICE */
> > 	{ 0x00DE80, 0x00E8FF },		/* DSS (0xE000-0xE0FF reserved) */
> > +	{},
> > };
> > 
> > static const struct intel_mmio_range xelpmp_oaddrm_steering_table[] = {
> > 	{ 0x393200, 0x39323F },
> > 	{ 0x393400, 0x3934FF },
> > +	{},
> > };
> > 
> > void intel_gt_mcr_init(struct intel_gt *gt)
> > -- 
> > 2.37.3
> > 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
