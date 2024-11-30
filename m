Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DAD9DF2AC
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 19:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC9C10E162;
	Sat, 30 Nov 2024 18:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLu0AkBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF3910E035;
 Sat, 30 Nov 2024 18:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732992463; x=1764528463;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0UDPm6i901YjypYKKHFurqq+4yyabJl+h4JHPATHzgw=;
 b=KLu0AkBT8MiPucRcWqhXKkFcEvTi7SN7M5Wq/ndrnpHv0HJYz6zEIJ0L
 V5PhTLsILEsBpLgLSJgQmT6A5MzHRQTVVxkjn52Jakf8K5sIQ/igrsmaS
 3yo2m+DbRqpxCrj6uA3/XlzYLt+Om38tvt/flenfJd22veXeu+rXtEcLZ
 10GQiZRHIifgCzOWE3KxUe+s632pOvvnf1x5EkLebpoj/wOETGLX6vqPm
 Csl6tjE+KgfHTKVDvsx2H3be9hiww6ztKzyk0S5schCRb/rjNMblLaeqW
 dfp5zGgJ8Qj69g0G/wvKXyJ1bbAH03FwmCgAZoITnafwGFOn5rBGkWOyK A==;
X-CSE-ConnectionGUID: +ro9V7oISEOJzl7Ljn6+yw==
X-CSE-MsgGUID: VQLAF3IWQ5yr8TmJmbU3lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="44570534"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; d="scan'208";a="44570534"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2024 10:47:42 -0800
X-CSE-ConnectionGUID: DrEpfb+yQVaf5nFaLYQmAQ==
X-CSE-MsgGUID: f5JVblM8SiCAYaC0tyeytA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; d="scan'208";a="93112466"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Nov 2024 10:47:42 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 30 Nov 2024 10:47:41 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 30 Nov 2024 10:47:41 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 30 Nov 2024 10:47:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMF2cVnDWsH5AjLgh2bndC2gCwKq9sRHuq14teawbazwkP7jGTyPzED34FguTBkcpu7RbO1RaxhC4gkkOV6fU56YvL98psq3tCNAq27tFSyWm6Y95JvrMwcBhqhxZW6Zs77+tssRSzaBW2zEVjJwvQ43GOy/nkafZVf9mYlnbue/2KfBtgmbc6qIARygcU/6dbzRhOYTHSiwK/c46ncc4yUAO+o8tP7kjRPIajQO0PHNkzDJvOBHUHl4rhpTugKbvO0mWNZUXUsqpGA50MU0Zt0XyZNNBbwMWu2oy7tBAGy5zmTqrgtbiRsuzxiEVzE+33Sz765J6rFVEIHmOfqk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FV5GLXhO9XbWNKtB2NGpUO8C5nE/vKCixZ8R5mTMlCU=;
 b=C29jVLJu8Q68uDcDzio8q1amT4PGuHB0cYLjsjmYsYBx9JimQnBVYIEtDEwWfAIOdIFxhHP7jwS53fKolQZCup8OfPK5vcdcBA6WbD9O/GHpo4XrYdJmtzHieMiCNA3mEwRkieRTIEV1THi1NLZJ1qfeGbng/sH34K/HWBk7NSHtXns91OCid6P8hug8v8FLe2HGqRHCmkp5PDBWWEAm86Jn2W+DUdHNF9uiUzafpEzem9vdiRHz8y9n7ZfsnuaUb7JYRUd7Mzeh+P/1ymUpQ2Ae6eelSCliAOQW8k02A38KeFXBy9fLJ4/UgA+TW7RoAtAZn1382bLyRTfjeqYkQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Sat, 30 Nov
 2024 18:47:38 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8207.014; Sat, 30 Nov 2024
 18:47:37 +0000
Date: Sat, 30 Nov 2024 13:47:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, John Harrison <John.C.Harrison@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v2] drm/i915/guc: Flush ct receive tasklet during reset
 preparation
Message-ID: <Z0tdwOK9oZ6oI6E2@intel.com>
References: <20241104214103.214702-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241104214103.214702-1-zhanjun.dong@intel.com>
X-ClientProxiedBy: MW3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:303:2b::17) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 81077e44-1c23-4b9d-8981-08dd116f750a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iJg+e+cVSSgYUPr9kdmZniu/Ig1cutKaSWQ2ykg4tG2u1OCrLM1RdtN15+fQ?=
 =?us-ascii?Q?ajW9oZhwsNJDQeKCbdZZhtopJvZfm0lh8LvcgVjeytYG3IzOgkbJkU/qlFvB?=
 =?us-ascii?Q?3Az+Rnh0vixQ7LDtnDOFN1ki4oGSWd51/tu8UEtLXv0W1D1yK9sJwhwG48Jh?=
 =?us-ascii?Q?cwr89W29vgQ/LMfdN2Vk4qqXosW5Xyn74IFdry2kpBU6yjk772BtOC78c+Md?=
 =?us-ascii?Q?4P0t2hZERHOWtuw1FZXRHAryeyd6dZvDR8N+Nc0//EVDDXmnzl/LGiEdgm5f?=
 =?us-ascii?Q?qvNviv8s3ACn3A/xHyuy4LrHxePlHcJ8JFqI0B40LKjS7iYPW/xkPaNFm/QF?=
 =?us-ascii?Q?Bbx3XjKSH0o+zO13ZMLH1Yg0NtyoRuumRoGXG1+Vo8DVrKh+s/AxungsH6H/?=
 =?us-ascii?Q?+agyc5G8HzCh1tnDOsUuKomQRc6n0ttwFdz3lKQMpfmmdms7CzqTe96YypXG?=
 =?us-ascii?Q?sLcNkjQnCMsO9SevB86hDeTkdAu8si/Z8e4eIveRWI0NEvcy6Lg06JKj9dH7?=
 =?us-ascii?Q?6CoadKyJfQ/BymM8PIw6S8qHNKtoBaCirhhtuFZNeuOwNUBd+PUfsG/LXcKj?=
 =?us-ascii?Q?PD2RxgtZWbHjcrBlgH5ELgnSU1l9Ash10k01vDEB4iAEmvqeBBzCrkumUcU/?=
 =?us-ascii?Q?tgnmSojQTBiIwSmEt/SaPYm4ra9/yvG0//W8PWHuDmRytbVvkH5TmMZO2NBb?=
 =?us-ascii?Q?p4/iZJA+Xd7Hpvs5DsxFcu/+eIRXFAFvaZRiynPAyjr6p28hzdhTv2XyMIbX?=
 =?us-ascii?Q?U5vnfQLBCfjJuwDK5qWRJDkHig8WDDDPUByKMG1EfM2z3Y8PvTCCIqBfL+2t?=
 =?us-ascii?Q?e1jIQySRX87Jcvu2pTLux22YBEO5ZlLzRqFb8v9+sq1xEKzkUvAPiPAp8psy?=
 =?us-ascii?Q?lksZRn2Hnv96uf/w/qyQQqNOVqs0KKBmPp74q5k9jatKqxaqtfnayzyNgyS0?=
 =?us-ascii?Q?wC0hdO1OAJuw5CQ9gExt3EwoQf3TLjPakjhykHPAllXiW9rNSryuM60IOjJj?=
 =?us-ascii?Q?/BOo0KkhY2kNU+qyxsu24qEK2Ml1u/aN4MkiJbmk9E3UKHoEOSOYWmJSzqaR?=
 =?us-ascii?Q?cB8+MxG9oCxuHdoWAQNShFpg9Dgbi9hk91yRy6Jsq5044J2jK/xuwnzLji/A?=
 =?us-ascii?Q?nRtKPKhX+T+SXdiMeAnyIaiz+6ho4fcXpOSfYFrntjfuWXIot/myGmKQPOAW?=
 =?us-ascii?Q?WoZHnbOe2UWa2lO0erfWn5ICXqpHOhdQYpWHb89rzl7bCL5tjSTihVpOXzyU?=
 =?us-ascii?Q?mdeZXzGpZ/X6xyWfKdvuEfcaxaOM4agRCdSRSFHirurnvYc6sACuH3v5WNYv?=
 =?us-ascii?Q?7fbaczgBf0adsbWRcnd1hOsk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ux4cuiPSiN/ub+opWgFwCeQGVJAtz87zDA3HvWi3NYGLjvlg/LV/9t9+2Efk?=
 =?us-ascii?Q?icAqYkdgvZQ7122nUfdAj2xkilafpK4LTATrmdGp2BqKQiJule/y4Nz0CXAw?=
 =?us-ascii?Q?rXznwcKQfoKs84ITiPtmVF2UkJJSgldCA0p/KnCWcPnnXASdePpc5OzPi4bS?=
 =?us-ascii?Q?z4FceAROzSsMm9Q3YD1G17M7awuc68KEQmnDPDe2x6ftAlPy9YIR8Hc1ebSv?=
 =?us-ascii?Q?41WhHkf7WK3Zoc68TbshKRs0+s2W4JManQOuWKjm8G1DeYOZkpxIl187y2Io?=
 =?us-ascii?Q?6xZwEdPhRhmjqWBaqBkrnIn3xfAYksUaRKtdlfuPs4DQPu7qL+PUX1WyRrPx?=
 =?us-ascii?Q?zD0vZKioTk43MqLnvrg4D6YRSx4Z+BUqDEPlSfEe0TF+W59hdswIdCTtxg5Z?=
 =?us-ascii?Q?qQxYm0hqOr0QdegOQLtd2bJJW8vfV0XPtsTQ8TejAPeMasFWbJm4BSFQSUB8?=
 =?us-ascii?Q?saewjE5WkyvvPGDaeEP46KkgiSNbLu6crfSmvoCqd7jVLyhoLpnFE4H7t/eX?=
 =?us-ascii?Q?bENIFXuMHxFLHLMblUlBEpxC9GrxjSUUc+cytY37qNHIREIMW/aVt/VYMRHe?=
 =?us-ascii?Q?s/fWadF9lguN5jf09ARH/HkRstgAbvKdkGodypvWUMDjcOQPVJ9UJJFDUQsw?=
 =?us-ascii?Q?n2A1zQsOiFEOcrjUhEpFiSNxfYmx5LLQVskTJNv6darTRjnu86dUEWjSlTe2?=
 =?us-ascii?Q?R9wrpidCtoYifFCu64GRXcl3u44+Yvje95rfLym94liULGbIQbcswB9m8l7k?=
 =?us-ascii?Q?SFHWY+MoDv9WQbClrasn21LFaJx5QB6kOVKoMRQb3NHh0c76jbPCjoVN886W?=
 =?us-ascii?Q?Aig1KRcWsbzifES74a4X02S+3oPaIPlad2RYTutqjeElTQD17MzLA0/l6WyB?=
 =?us-ascii?Q?c4xsTzrIClC3saqOInObxOT92RTwgNf3C4qOC9HEG8aUucwaEaiGKnlgjEU2?=
 =?us-ascii?Q?H8OIM7pWeuKErWmR7jaf4eDPtBzq1bb9+8o0nu5bfcxi9K4egNIwJNvv5NBS?=
 =?us-ascii?Q?YCvpBfS2l1jRn/uLwF2VScBV8Ate0qd3BWiPf0AjVfp37D5vmYbaMQhrTau4?=
 =?us-ascii?Q?38QjNro2dTZVYKdfgVi+mVgdFDUPb07lvazSVfGfPe+YIpAldSvy7BLWLT/G?=
 =?us-ascii?Q?2WCMNXEbWJ7nwtpMjR6a2THLVQKz+tzgCSSXQCkl6gJk8L8o+bAX8xndI0hG?=
 =?us-ascii?Q?WipdYwSURv2J8awsv4x3gSG7MwdNKCUmhJ2lU8baXCLCYb322Pg19XSFankx?=
 =?us-ascii?Q?FcnIor9AL4oY6d1U1G35BqE3lE4mKHsHabh4bAYtI+MURD/1MAWs7j29KpBO?=
 =?us-ascii?Q?biP9OkUlg0CG9UPOpVBrZJXNz2SjIYarocVOWZfizVSWntiqrY6/fnd0+jSi?=
 =?us-ascii?Q?2BMd0IBTO6JQuDg6bH6FQnoAm2bh16p3M3YABMwZnBr1DsbMv4/3TtyC6DPP?=
 =?us-ascii?Q?e5yO6MF0/NnMNw/W5i/ZHK0L83f2XPkT2BAPJPy+N9zJmpaSQKULOokzvZ7z?=
 =?us-ascii?Q?eNHDe3T79LPF+ariqY3mhP2SKH91/xHpdi1yU41BlS5KSLuWP+qbQ5Ld+REt?=
 =?us-ascii?Q?cSNiyzOvLjkr4oUgda3+nclY33HcD3ZXThbDoUX5nV6bdOCOOhMcaIxmv8rq?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81077e44-1c23-4b9d-8981-08dd116f750a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2024 18:47:37.5170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kA6nXhdvWsJL0I63HeO1nELWL6zIgef/E7EKjCttt7ONUVBAZtSUOOfDWJsh/h0pV72KVR3rh67OOkEs5QlG3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
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

On Mon, Nov 04, 2024 at 01:41:03PM -0800, Zhanjun Dong wrote:
> GuC to host communication is interrupt driven, the handling has 3
> parts: interrupt context, tasklet and request queue worker.
> During GuC reset prepare, interrupt is disabled before destroy
> contexts steps start. The IRQ and worker are flushed to finish
> any outstanding in-progress message handling. But, the tasklet
> flush is missing, it might causes 2 race conditions:
> 1. Tasklet runs after IRQ flushed, add request to queue after worker
> flush started, causes unexpected G2H message request processing,
> meanwhile, reset prepare code already get the context destroyed.
> This will causes error reported about bad context state.
> (https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349 and
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12303)
> 2. Tasklet runs after intel_guc_submission_reset_prepare,
> ct_try_receive_message start to run, while intel_uc_reset_prepare
> already finished guc sanitize and set ct->enable to false. This will
> causes warning on incorrect ct->enable state.
> (https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12439)
> 
> Add the missing tasklet flush to flush all 3 parts.
> 

Tvrtko, Zhanjun has later found out that this patch deserves a fixes
and cc-stable tags.
I wonder if it would be possible to manually pick this to drm-intel-fixes
and while at it add:

Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
Cc: stable@vger.kernel.org # v6.1+

Thoughts on the inclusion of the tags while cherry-picking for the fixes?
If okay, could you please do this since you are in charge of this round of the
drm-fixes?

The merged commit is: b939a08bc378 ("drm/i915/guc: Flush ct receive tasklet during reset preparation")

Thanks,
Rodrigo.

> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9ede6f240d79..353a9167c9a4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1688,6 +1688,10 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>  	spin_lock_irq(guc_to_gt(guc)->irq_lock);
>  	spin_unlock_irq(guc_to_gt(guc)->irq_lock);
>  
> +	/* Flush tasklet */
> +	tasklet_disable(&guc->ct.receive_tasklet);
> +	tasklet_enable(&guc->ct.receive_tasklet);
> +
>  	guc_flush_submissions(guc);
>  	guc_flush_destroyed_contexts(guc);
>  	flush_work(&guc->ct.requests.worker);
> -- 
> 2.34.1
> 
