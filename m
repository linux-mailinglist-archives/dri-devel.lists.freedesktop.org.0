Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51298A27841
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 18:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FE810E6CB;
	Tue,  4 Feb 2025 17:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cpk41Ils";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0ABC10E6C7;
 Tue,  4 Feb 2025 17:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738689929; x=1770225929;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zcjsvHyz4u7zeks9CtE8+WKfGhEnQb1vP37twOU4dBE=;
 b=cpk41IlstVozMb4rXj7qbsOmch+lNLviKoXrZfgj0DMqf0kg1vCFDMKB
 jce5cgyGaGtZXGAFpyJVPNc5PjF+cE8RYjQFF2eSSyAhecNjmh2e5OUZ1
 1EtRlE54IMIrGYegt/jsCljl+HnDftZbq0LtWyO9Fs60scg7kx2WHIfLC
 tTNMBPepHOXmST5XAulkau05e6/YMLg22JePrBd5/NEpchKCmsOA8jz4i
 H86oXhr4WsCWQcwOXQXr/0BO4IzuElNjb+b9Npc+OkZ6hVog9wR+AnqLO
 guoAJHUz2WfLfEW23T9Z8FkQxn1lgXP7dzuvAW6kD1ZzmURBbOc5xuNos g==;
X-CSE-ConnectionGUID: lEGCga5UShSWI8RQEEDEQg==
X-CSE-MsgGUID: n4qmcciyTAKJcm1ANV4Tsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56653932"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="56653932"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 09:25:29 -0800
X-CSE-ConnectionGUID: jH/qAI6GTLuzKpetZVm7tA==
X-CSE-MsgGUID: wvxXbLGMRF2b6MbOY7BcgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="141521460"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 09:25:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 09:25:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 09:25:27 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 09:25:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Npgal1rYtYtAdhVBxwfJ/w+l8D7k+abrxRgyw+ESesHBztPkodU5D2sHQA0sNIK21I3nbhME+ocAdlrG8Pl9n/Qms0SgTyNCY1SdL2UFO1OKhTlvrbJCzeIO4E11H3AmwANXDOGXXOyXZmQxp3le1Ebo7EQ2fX406AvODMRSxG6RFgge0FSmZykX4PwxgewPt4BCTNtfz9JBAGuP0z9v1nROfA0CCKjlhKpUj8YP6SCauKY4fh3i0MVAlp2yiwNuk5AWOLzYj3C/J2Z6crph7Foopgvw1qCGXXw61Fp8Nm6ToEs7XqqATp8No1dTP1Aom1DKQ1GMDZbTw5C9b22mgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCqwZO1NUy/CoLw+xLcKKgCLcCUwCzhrs0OwB/Fy6vg=;
 b=xw6Gpo69dc/Y4bLsDdo+Xb5qfRtDkQSToFFGht0+SYZn305Y886QHC58SJpIZs/CWftc7+GP+OUOjiLT6XVbnJ9PeGfoJ/FY9mcspIG2Odw29krsmZVQxJar4vRxX0Dk6WzaBbrVw2ab5cGmKJLEgvws6FYpWu5i8AlDJarvy88SnNtC9TxF9h9gsvoqUT5bhgEaAH8v1XXKO4orDo0JHEEJ0T6JEXdXrZSDmZxMs89kVU6/91lUjQhY5Dseeh8UcrGEmGT9pJvW+MbHlm5Wo2I0lvEpw9EbU1xH0ElQKPyXGmpF1v+V8YCq24/D/hhFpJ0fcElHid+IdU9wVF9KKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by IA1PR11MB7344.namprd11.prod.outlook.com (2603:10b6:208:423::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 17:24:43 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 17:24:43 +0000
Date: Tue, 4 Feb 2025 12:24:36 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <lucas.demarchi@intel.com>,
 <jani.nikula@linux.intel.com>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <anshuman.gupta@intel.com>, <andriy.shevchenko@linux.intel.com>,
 <lina@asahilina.net>, <michal.wajdeczko@intel.com>, <andrealmeid@igalia.com>, 
 <amd-gfx@lists.freedesktop.org>, <kernel-dev@igalia.com>,
 <xaver.hugl@kde.org>, <pekka.paalanen@haloniitty.fi>
Subject: Re: [PATCH v12 4/5] drm/i915: Use device wedged event
Message-ID: <Z6JNVF7O_Da8wA7p@intel.com>
References: <20250204070528.1919158-1-raag.jadav@intel.com>
 <20250204070528.1919158-5-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250204070528.1919158-5-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:303:b6::17) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|IA1PR11MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0a56fe-8495-4b7b-e1c2-08dd4540d022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Yb6zllOnly9LuNc9gI/VH3f4C5H06Wcu3ka7OqHUQSw1R4v6wL3y7tUBbMQU?=
 =?us-ascii?Q?1YqT5ckEFK+buK3xzxloswv6wzw9D+laXnp58BNx5ufOBCMVCv95oeRYu9v9?=
 =?us-ascii?Q?rscS8PMlXl9hPiG1rov4/yZ8WYRcXVXLgb5/98aKP8i068zBKKiYy7TM9uJd?=
 =?us-ascii?Q?H7jOW4mf+NBphY3X/WMNAntMeHDQ1t2FbjDAkd3rARgUJ7LyT3jyt8MQhtQ6?=
 =?us-ascii?Q?TIhrrihAeCf4OfHB4t7AlQlVskj4gTf9i9Y+voZdd68SaeAZ0R/viXHGrApB?=
 =?us-ascii?Q?KoZyo+Ipqk6BE8PsSfniMfujkWZegshJ7S9vA5679zAyBeI6HMIMLIhXj+lX?=
 =?us-ascii?Q?l8uYpWmBM5Rrr0jNpounTxIewB1K0b8HUyTgo0EydVIGLxNTU8yk6YRJ4Zxf?=
 =?us-ascii?Q?RsbVe24VVlh6Pho17o1Fn288yPPW/y9PTjfj80AfYKHqbuW75oaLrkX8MiN0?=
 =?us-ascii?Q?BP3d/PSFU0V6pdl9H2E4UwDjBr9PV1ThpxTIGCYDCKDl/o3QlYRKhZBbb0bH?=
 =?us-ascii?Q?SYqqFU4UgK9LFvAOjhpV2j+PBwGDsYCcqfJQ2N6VpdvmLaqSklx3wCzEnHb9?=
 =?us-ascii?Q?f1bSPEW49b+otWWz7B6Kx8KmcNtaB4ya7PuxAwY+0myYxOLoTAZ+jPFdZjzW?=
 =?us-ascii?Q?zRwWX9hSxMTYSYa5Q4RKnDEjrgQbMIy0Yl/1nuUC6TyFmuXvhFAVcjArjSw5?=
 =?us-ascii?Q?lE40O1PenQaPS8Q7Su+3GyQUwOLUHYhXeiOXo2l4dPne39v2R9yNXH/oEt4G?=
 =?us-ascii?Q?e5kRK76I+/AYomoetth8lsZyPnKWPUBWtr+Y2fhSHdSg4dC2Pa3yRmn+0YV9?=
 =?us-ascii?Q?xYVCPAONduehBrbcnLVjoFRaevkEGbqTYrgEl42iBckObKitD0EhvaI10+wT?=
 =?us-ascii?Q?gkNAg1b3l+lkjyvl6sr3xHXXdjagCh0TheuSJRFrkwPozdcmcPGAkXtN5pmd?=
 =?us-ascii?Q?0D0s/Ek6c760r4SFDQIoAAw94Xs/WjKkFtR46sTTGJ8XKDQNQgtMIMEV9MSY?=
 =?us-ascii?Q?ShPeOq0v2UN5/zXK7LKvG2dv7LLLjXOyvZMHDouhdEXRTEcDQemSJ5qvatBu?=
 =?us-ascii?Q?/Bhm+4jbQZAskP2I28Qadh2ped/j+/oIDvBuEtiXKGYKR+6L5m5ePuapCFMU?=
 =?us-ascii?Q?OmkAMKFvayf+PVK3lkdy5USo4K6vlnR2XHitvz0/0Z8JZZQkcDkbKhSD64OY?=
 =?us-ascii?Q?ymIFWg7/h4BlcFEn9WZQ1ecbP9S31FtpGPs9ZtgZQaD4pt5OegAx4F+o/MFE?=
 =?us-ascii?Q?fbbmiz/6SG2qnI5ecu50zX0eOs+OwQkSOHGd0V0C6/JbEFCJuI6YGR3OAafc?=
 =?us-ascii?Q?lG9O+gq2yst35N1qlRs3X7t2pmRPRBpXuA9f11l2m2UHjoxar4bcBhJgjtGk?=
 =?us-ascii?Q?dwT5CqlMNHaZUx0wyYFBx/k+H2Ho?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZB3PKE4pMX4zE6xpgVcPJV02fnOZ2HhhyiE1i4bRObbA3p6mkGjPnIWKorwK?=
 =?us-ascii?Q?J4LFqFUkPFYS8ckl5K+SGq/gKjpTL34kXIjmOqiXmnalWae656YhH8OhIqxf?=
 =?us-ascii?Q?absMalx1dlOqqtQcDpHGuk7XCvhm1Tkrp7fiY/nEKyo+LtA8bfpnL8l/raO+?=
 =?us-ascii?Q?nrXytDppXqWjVo6XzckN6bQEix05BZXFzyOoGkpysck6flJt2flgCQxlaZjL?=
 =?us-ascii?Q?lemenSSOavcOMTxnYh0MSSEATpsJKjVXIzb7fE+PAtfQ8/LbZKsmNAc963SG?=
 =?us-ascii?Q?y/FefRDyYSpaJsu5/Gfm6gaMLIZeJJpa8o88vJfE8gszhJ7kZjM6/o+6pmja?=
 =?us-ascii?Q?DFJvqUXiNR3eIsIC4bmJa6WasMVWa8/SOReONVt7Wx2Z6XAkCYVTtqGjpGWe?=
 =?us-ascii?Q?AqboTejB0Dqir2V+2Cgpm2O8WxD/DXWNKlZqeUhTtm3bHaiNVz269zP2A5Kq?=
 =?us-ascii?Q?RRGidqbEdfobqmaDfBH3PDiyTWmMTlLoUCDHP4dyNEL0Ilb7if4jdYPqLfKB?=
 =?us-ascii?Q?KAwJFy/SPXkUMNc7AeUq63EdWwzQFZcOlou0/P2xNAIibcjzwbXOoysz8cBQ?=
 =?us-ascii?Q?2aiXrJceFTE/edZO/VikD6lwcTaa3pDAFh68IM/9beB8uj6su7o/x0dd4FjP?=
 =?us-ascii?Q?aY9JmkORQnu1YZRY5RCQH9sYhGHLqJZ6tBWWpJoBOvSGGRdCRzG7oEdsrEbg?=
 =?us-ascii?Q?9P2xsc1xzCZ/naY/7rrfcnOIPMZ3aCm0sBkmQEcyOx6z73sJPIVg3/hLw14A?=
 =?us-ascii?Q?EHwZ5yn8J1zsRdg5lVCLTTaCEj6m/gBfcFat8Btbn97TEvn4tDJfFthpIJVd?=
 =?us-ascii?Q?bwXNltNrHRvDE4fYd91QXAyhzeaxDGLfV/TX1cHIT4ZMYR5w9UX1XqoUXBuZ?=
 =?us-ascii?Q?7/ff93Mw60dgh1ZqqylKMaaPMXylE8cjREfI3BXV9HtJQzjVs1xh8bJ2qGum?=
 =?us-ascii?Q?J77nIJaCdvbbwxuBe6FT/3PZKyP+XeRR8vBmeb5KVZlT2b+3HPjHXVZ+ldIQ?=
 =?us-ascii?Q?fFlm45R8WdK+hj5XATizrBYQzhE0Po+u78Z/zIyXwf5s2/A17ZEHdc1LjSAz?=
 =?us-ascii?Q?PQ38uDPCu8PX+enVSDqwl1+96bbYG4GrfcLDHMamTj4u4tD/6RXzSnFOgmx2?=
 =?us-ascii?Q?xoXhGmjTM21jEpOFDLpUpr5oMRYysDmYVXUTCTNDpdt//lsRa/+VZMbVeLaS?=
 =?us-ascii?Q?Jh5Fpo/UDERymyUv+onZ8ZACliwEOiLR6u4rabRHUjuFpG72AGI6Vb33/7DI?=
 =?us-ascii?Q?DQZEHIPKawYXJ5XW1hBSNW/M+K2Rg7YxuIWKI9z/YJWfK/BPSbQRDWBRfFJV?=
 =?us-ascii?Q?JBA1hjSjE6EaTBiX2BcZY9WUW+gbtWH+SrLgkI0rYOP5fb08mP8lPeMFRHf8?=
 =?us-ascii?Q?sbfkqXcPSTP2o0RgV9MMhy75n0+ZYigxAxU1dd0w7RnV1tfq2NlCgAlyJasm?=
 =?us-ascii?Q?YwL9MoLmVvrDEXeSC9XojKc9ctwq6tD0U4Kn4wT3UD1BuNDHlVNP+fdWwEdx?=
 =?us-ascii?Q?8jiBlwm4/wgsSEk7M4rwhagqe6OUw0mNmssH86vQdSEchD/2jDVInUextr7R?=
 =?us-ascii?Q?TisInZaUXgrOZSkMF7IwtKfwwhM82xOlrSmqwFVR9cmmFJrArsCr4dKriAcS?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0a56fe-8495-4b7b-e1c2-08dd4540d022
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 17:24:43.0386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhG6KjJWpD4BMvlfiSDJl+JfwA+PMFaRdrALRoG2fS5xRr4IaTFnaED7xVzVzX3lh7AMg0eQjghYiqO/0ldKgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7344
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

On Tue, Feb 04, 2025 at 12:35:27PM +0530, Raag Jadav wrote:
> Now that we have device wedged event provided by DRM core, make use
> of it and support both driver rebind and bus-reset based recovery.
> With this in place, userspace will be notified of wedged device on
> gt reset failure.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_reset.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c

Joonas, Tvrtko, ack on getting this through drm-misc-next?

> index aae5a081cb53..d6dc12fd87c1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1422,6 +1422,9 @@ static void intel_gt_reset_global(struct intel_gt *gt,
>  
>  	if (!test_bit(I915_WEDGED, &gt->reset.flags))
>  		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
> +	else
> +		drm_dev_wedged_event(&gt->i915->drm,
> +				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>  }
>  
>  /**
> -- 
> 2.34.1
> 
