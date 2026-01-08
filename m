Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E53CD063DB
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 22:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D71610E7CB;
	Thu,  8 Jan 2026 21:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PrA871h7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB7210E7CB;
 Thu,  8 Jan 2026 21:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767907080; x=1799443080;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+35zHgp1LNolsiPqji7ysB1bLpwt9v1BBVTTK5J5M2E=;
 b=PrA871h7URZCWDOZFREKxNtG7mmFvgby4f76vqBj1tqgv4oG/qpYxUPc
 Z/08DRBEA6agyieBVXp6DlMtCoZ+L/sh32lrSUsxbUoKi/Op43BwAlioA
 ny29yjBdYzEgmYCicMWBRj/IdXbPIdZcS3n+WabAjd8B8w73QUxADWQjT
 6gWooCqHs4iLpBeGIgqmYeDI/9lsA54i+nY0JRVxlod6B+2Y5ugTLHADP
 fMwkM9fZ/w9jOZqJHJpBZ40zUsO7lDYtHQ+DLDFkVOzgFUWPKb2IZAoW9
 vZK8qxpKRhEdiD9ZEgj74HGkTNzhWVBgxVjOvHuqlNl75yvRAQ2mM79VX w==;
X-CSE-ConnectionGUID: yMOOVto8SBWGe5gVQaaMHw==
X-CSE-MsgGUID: OuofZ6XQS8G9iYGbjSVvEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69206071"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="69206071"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 13:18:00 -0800
X-CSE-ConnectionGUID: TN9kzgY/TqCtMu5UONjWPA==
X-CSE-MsgGUID: 8KEm7g7dTMeEW04tQxcYSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="234480675"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 13:18:00 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 13:17:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 13:17:59 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 13:17:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8yFBcueip95O5qC1+wu6tcIYTjCiYTNVbM6yu5EDHZnSs4pkTzTyoNdLhbBNGt1KfMHyrMW1dyhV1HswoaC8E7Y1a+q2SgkKIlwd+RgzXtG4LMIa8bXJiSIIWs2SedzD9aLUZ3ZlX6BDIYrxoegodBvijlevHmz8q6QMEWGVsDWE0OwYFOBngn30y8Kne87pM79Q36hXrWLQmZII1UPZR6enDhojNkxsEFVXJRBN97F10C8faorNCElp283dXrnGN+EteZdCS958GV+mUWpS7lG1TK7vGYGQTGtGTUJ8ROjF6+fLXCDd6tRSRXO9eU0nUOSJqOGIQybE3Xs3H/WWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22oNlTYF79TpdfMeDBLP9l6m2Vvf30i85evQZpoOYiM=;
 b=B/760K6z5EFvOmPxT/I2sk/Jp13L5zLb7UqgI3qEwhOVTcHtIW9e4YPPfx4f2sAEtWm/otjW1wNSWZxPo3iyuiXY1vnyclq90Dcs7+e0XWVOPIG3uoBoWNSf//qKN3yFcPHvX1ffptl2NkorSdaqqfHr1Q4I7//UOsJQ4ZWsj5izytvrCbi52NBz44qmwHoI0yqGcpQyHFsHzq0QaPs99y8TRm4+gFLZNbEqvsGiA/5NJOL77j9aR2P3ME112xXPK+zdrfVVM/xcpdDkxA9CJQpdCXTuigjOgGtduumNTKMzItckW09NN+cZSvH+PATi31clkFsEhwQ2lRZJJq6dUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA4PR11MB9345.namprd11.prod.outlook.com (2603:10b6:208:56c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 21:17:58 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 21:17:57 +0000
Date: Thu, 8 Jan 2026 16:17:54 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: Add missing newlines to drm_warn messages
Message-ID: <aWAfAkkcpDnQUqsu@intel.com>
References: <20251224212116.59021-1-osama.abdelkader@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251224212116.59021-1-osama.abdelkader@gmail.com>
X-ClientProxiedBy: BYAPR08CA0019.namprd08.prod.outlook.com
 (2603:10b6:a03:100::32) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA4PR11MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3d9d24-52b5-4939-d863-08de4efb6545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rAtau9XULRonv1QyKfLyzQ78woNrG33Z3wvP5pbf1LCIFGMlsNqE4YJqalLb?=
 =?us-ascii?Q?NFQ6ELOePqIQ8Wp87nYL8pa58WYtrbAiYyqPfq27PYEOpW4jHgxKM2HkvnxX?=
 =?us-ascii?Q?EWAOy7h8XkbIYBlNLNz4+GaiH4IeyjwKfA8AFHfra+gK8cUJV59HKWtX+4K/?=
 =?us-ascii?Q?w44XqpbOLN1CTUm5yc8cBjMiVxts7TMAho6oDwkPM+btDdkTKJl2w1S/4Rw5?=
 =?us-ascii?Q?AKcDw71UFiyJQiW80JoHAzGXybDJ53ZnP203IiqQF+l4Ib+2WEI+qmkMu6Oj?=
 =?us-ascii?Q?S7o3QkAsSDxNLq/6UKqzp3eg8zzGzdLhgRKZIBa+LqrVvvmZlxs3di0AelA2?=
 =?us-ascii?Q?ohCivBDK8hQ+YB7uNG0bD/cbkGiCo5FTx+BIRkI6G4TlGumTnLkmuD47JyJi?=
 =?us-ascii?Q?rqLd3OjyGrkrJMGQ/34tvCQdGer/F0S1FLyUrAuxKc6eX/ou9d6wv35XaHIj?=
 =?us-ascii?Q?ZzFVlA1qnlVaNzbT+7BQ0Iye4/+QbAuQh/Wm1U7FTKhFn/sPiAEhRa1o14xt?=
 =?us-ascii?Q?zaCGwnPcu/IBsHwgN6dUCEIT642el8yi/7ARPVzbglHw2t0q0Qc6izOorKHY?=
 =?us-ascii?Q?czFZ6lqvlSefKenwX3hd1hVWOLKqn6J4MGz6vdcQMG/aLw9JtxDD9kxLoVIC?=
 =?us-ascii?Q?4f+CZYWHz2GIDVbPICWCbIRgAnxil1kw7XZk44Y7X8g5mMVIgYgf9nKCm/u7?=
 =?us-ascii?Q?3MxCCY7fa/HxsaX1tCuB5VWf7Gen3Lal3qfMuVzC1YLKF6bhtmOV1SmKbmq3?=
 =?us-ascii?Q?ZyhthFMI9pGEa5g5msj9XBi7XX6tqzS1qXKmxQM43RU5todhqTki4B3reLGX?=
 =?us-ascii?Q?bjbJUgh3DqAkESi0DdLJUcWlOwb4CYF6brY5PBBvYt9e91e5h2N47bMX4k+u?=
 =?us-ascii?Q?X3kPRrRLXnZOOaKJBvwIM04UKRYpbijnf+TyimZ1CPBLRFoRyvQPe5igFRsE?=
 =?us-ascii?Q?6LfF8OAO65kHxyiwgD77TkhCQvSfuRzncRkJbTFsCQXAPHNb86BjWDvD12CJ?=
 =?us-ascii?Q?pM0mDYsMyxbr6qyGD+Dj60CRGRBkXZ4w4ydgbImHYKPrPqe5HyrNdcXk2E5+?=
 =?us-ascii?Q?GjtfpVlaIxKLRRyF6hNez0AyAePLj/zA+QB/H07GUrdYlKof3H8lPujmBN7n?=
 =?us-ascii?Q?WJFwPbebYLo1mXset8MX/21/MQTiiYqEsbl4b5aFe8YxVg3LurbPuD0sbWRR?=
 =?us-ascii?Q?X7rZTwgkItRAQu6MdoGPIdUNYbXOJQvM62/VGgajToTX6PTdRmp7QcGoYkh9?=
 =?us-ascii?Q?mrH4aY0L3tYxASMOURBttnGKHYqRouIX0YiJJ8Lvr2l4Xc2F+LcY0ocx5JCN?=
 =?us-ascii?Q?ApCbMT8B4m/PK1baaLL2C63ZVvkhWPmQVK6ces1hGGgaSGvCRzOwkJWLfQwh?=
 =?us-ascii?Q?mVyBulPz9qJSEDglrlHNxJiwj5FnNmuRXmHtPr2CoQS2URmhG+dxHAZ82NHV?=
 =?us-ascii?Q?F31bt/i8u136Si/ctandBfKGdoCTgXCT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wyQpp1ugXHjSwLJPMV+6xWHXokuHPluwUv+0A4rKRblL1sgBDXQjjqd3OafZ?=
 =?us-ascii?Q?c+li7QFxyFtGsm4euVG2rxM5/Ew8Jo9U2qYOBncs6GOERuof8W7qpBB2KN5b?=
 =?us-ascii?Q?I9vyFFyIGFysXMhjezJlE4x2odI/JXdRuRKOGPGOKg72cihWXsC08FW9tNE3?=
 =?us-ascii?Q?DccBtL097I02dpPVBH4bvQlOF3Io1+qOo8ziRMGydm6Wmd10wYQzIgIDMG3H?=
 =?us-ascii?Q?2fsg2Pa2AZnJ/Zd2LERT8Khjfuhaks5vG5b7z/FhQTokadyAwbnDts8AjCWV?=
 =?us-ascii?Q?2dXW06vlKHTsUpnRQAXMRfQaR6vLTZ6GZfBJ4F1W4YqHBYZyhr8lRRyy1fW2?=
 =?us-ascii?Q?WteFhw20f8/Hkr0nfqjCWGhDkOhQGsKKIP2ReyjVM82uujmsfwq69J5y0rD0?=
 =?us-ascii?Q?iW4jk4OfZ28z6UrwzRl9e8UbzBH3faiQ/vWeZ/6EFmGpKcfZoEJfk7rEa+59?=
 =?us-ascii?Q?mrOIPhj+N7zbXAqc2Cm48gaJF3kr+XHxDd1ddZ6BWAiLCfkq0yEDSeHYPwEZ?=
 =?us-ascii?Q?N5iQhBlFXy5QTmhtP21CLqWz4aM26nUNAvHSQEo8khxCZhAcPmuCo43sqCNO?=
 =?us-ascii?Q?7UuVmfIEPHyL4EQXlO4Zk9+LN07drToqN4fflGOeMxA2SmVcozYeia8/8C4y?=
 =?us-ascii?Q?k/7a3hM/4+DwHUXz8729gaZ753yMbBgFRB4W6cNerwa7lt3BVdwGS1YuAmeS?=
 =?us-ascii?Q?bBvZe5HZyrfQcCD1EEbyvdpXH+HnfGJZ2hNQAcBjTcE78niztK0jVw5Pp4Yq?=
 =?us-ascii?Q?4wib/Oi/l+nLIhRwXIAHTes1GCT9d38VkPaQGQsO/dNs5rWkzjUXnuSOub9E?=
 =?us-ascii?Q?19Re/RzKGkSAMVv3LTprqWnJp0bpGJai7e50Ap0OFFrvQ2she3gHB4KWagPM?=
 =?us-ascii?Q?oULLTXpP4CxwWCLymYwC8hkhgBeVm41/DidFvrcD/pX1WPBZBBKRNsmVBx5P?=
 =?us-ascii?Q?bFSE3AAXvgyWny0DCZnFkKxPPw58A4g2JtH93a319HeDRYdbRr/NZCZY7XRt?=
 =?us-ascii?Q?4eWIEJaS9MsRYQWmKYgN6cazHZ2Br4aS6zldcqbpgaKBskpcImJOgBriHVAC?=
 =?us-ascii?Q?2GfyBTSp1u073eGiX+VwF6aADTfqKL14u7CTi3M124cxT3NDcZqB+ZhChCTi?=
 =?us-ascii?Q?WIM00Fvwq5Uc0zn/HeNPd1UCBwf4AQJt8no2m2opRfm0EMns6V2bajUUpnP4?=
 =?us-ascii?Q?0GFZodOcTmXJB64WK0qn40WHUEltqU0qyRM0/dNwdtXmuGdCne3eKoS3R68a?=
 =?us-ascii?Q?S3ooXXiI9dY+wMXzqAzvKbGr4YxBHeAJNKAUp9Z/SVF6vXw/bmIVpmVAOcI4?=
 =?us-ascii?Q?zwfr5e8oWHW7XYRZ+bRIX/XMAzaUX0GNRzhiUMRlfMqbZJgj/p7oLo7bPb10?=
 =?us-ascii?Q?uJOGvnGzBe6ZLxKC/jH1Nf2gCb8T885zDFAYbcsx29MRwxqcsOx2iYZQ65Jg?=
 =?us-ascii?Q?hYOxyIo2UWHTQ0f1A5ERlxp9IwxP7FXmDW5AdI7OZ3Ox3gzwNR8n7ToeX5Ja?=
 =?us-ascii?Q?XF5hXY0Mzia2Q1NSvQP4NOl570t2B2edB9JbmCtmqZI9R4WA6AZJ/LyPkoCE?=
 =?us-ascii?Q?f5bq9cmV+X/vjcVMJWO36teWscNCeP6YMWuFsduT4AaeuXDfYLbmm6i6fbxP?=
 =?us-ascii?Q?Swvw9xbgzEgP/3CmXugg7j0RmcEEHBL5ODvfjnD4Mz+QGWl0TbKc8a9Ozv1m?=
 =?us-ascii?Q?I6nCgWG6XblmbqEdD0WIuCRkhS+2pqrdrKjp9MsrT82BvWD9hpgwZl7Iiinu?=
 =?us-ascii?Q?nnZ3uLTIYQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3d9d24-52b5-4939-d863-08de4efb6545
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 21:17:57.8858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vkiiqdAewcg/1hdPgCkdskLJ+d1gxm6eNuwtnfOPaOmVgmQonk/CzJcEjtZC2lflPAGdmJ8dRLeQ5ATELx0tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9345
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

On Wed, Dec 24, 2025 at 10:21:16PM +0100, Osama Abdelkader wrote:
> The drm_warn() calls in the default cases of various switch statements
> in xe_vm.c were missing trailing newlines, which can cause log messages
> to be concatenated with subsequent output. Add '\n' to all affected
> messages.

As the lines state, not possible... but well, if the messages exist,
let's ensure that if that end up happening it doesn't get concatenated.

pushed to drm-xe-next. Thanks for the patch.

> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 79ab6c512d3e..1349dbc6f0ab 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2187,7 +2187,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma));
>  		break;
>  	default:
> -		drm_warn(&xe->drm, "NOT POSSIBLE");
> +		drm_warn(&xe->drm, "NOT POSSIBLE\n");
>  	}
>  }
>  #else
> @@ -2283,7 +2283,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  		xe_bo_unlock(bo);
>  		break;
>  	default:
> -		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
>  		ops = ERR_PTR(-EINVAL);
>  	}
>  	if (IS_ERR(ops))
> @@ -2552,7 +2552,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>  		op->flags |= XE_VMA_OP_COMMITTED;
>  		break;
>  	default:
> -		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
>  	}
>  
>  	return err;
> @@ -2750,7 +2750,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  
>  			break;
>  		default:
> -			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +			drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
>  		}
>  
>  		err = xe_vma_op_commit(vm, op);
> @@ -2812,7 +2812,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  		/* Nothing to do */
>  		break;
>  	default:
> -		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
>  	}
>  }
>  
> @@ -2989,7 +2989,7 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  		break;
>  	}
>  	default:
> -		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
>  	}
>  
>  	return err;
> @@ -3228,7 +3228,7 @@ static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
>  		vma_add_ufence(gpuva_to_vma(op->base.prefetch.va), ufence);
>  		break;
>  	default:
> -		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE\n");
>  	}
>  }
>  
> -- 
> 2.43.0
> 
