Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1696B57B34
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 14:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858B510E47F;
	Mon, 15 Sep 2025 12:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKde6aeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287FB10E47E;
 Mon, 15 Sep 2025 12:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757939809; x=1789475809;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yUzUVUOoOlUnOIRuDTvzrT5QR2ccC6Qb18Cbstq0FCs=;
 b=LKde6aeDhvkwtaghutafUCba7uSU9257CZJhkRxv2MYQZV8wv2bgkmlt
 zShHbCElfFnqeGBoqfrHlllBAilUhsNPe2ErJxmf1Hvpcwd/YJin23+uC
 F4k6x0ROVJyKbrtmoG30QvR9tNJLtoho9iKQ8L+RvRt6WX7EDYdQF59+Y
 SUeQjbWtMFqNNBh5wVaKljfT143o2AKIa9LQrepPbJdfx7MPiSbJl5h6w
 pukOm7K0kzZmh1zufbCXJOKLBpbELopl16nEseGsQzmohBGzw+7/5Z5Gk
 KSc290jk14jY0izjv76QnBvOB2YEfNA4ygzWZ2JeRy+AHs462vhQI8MfH Q==;
X-CSE-ConnectionGUID: J87MYCsiTVSLEB46TYLJhg==
X-CSE-MsgGUID: HY+P6dvpTKWfHqm5ywsqUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="62819946"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="62819946"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 05:36:48 -0700
X-CSE-ConnectionGUID: 05mZ+FAqQjSxAw17sOiNlQ==
X-CSE-MsgGUID: nZ74D9GwSUKDsG8E1PiiEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="174559981"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 05:36:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 05:36:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 05:36:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.23)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 05:36:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4BPxg8V/pYUnC1IOSx1kjIMydsTFOSCn4IujNQ19aPDCh7kTgakpOJ9Z+1a4FMHVQSS//C7QnwLoLc1FJOaiQuWpmFfFoapvq9w713cgwhhsjbrwfqPTJLdlt4rpL66nSN16xXS8IvAWE9VfepRUxjf2SkTyVRjF/6a6IcTo3v+lsyJX3UjW621EcSB97CzzzBqkDEy7sYRlVkMkk5UyuEyvBmsIzT1pbDBYpvbfxt9YzbR6hakVW3hn1mDqgAKJfz8JU9UUgJJtABvgLI0Q1w1iDzpclW2w1aG+VP4TZg+nI1e4m6mVdMD0P5ajhuy5M+Vees2C2bo2wPS1NzyHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKOzeEGz4sowVZJXy+hHITK6vkfXbWWd80GIY2P1mKw=;
 b=GcitAA6ho+7H81cbWxAIn63lZXLmnGdvy2Dnv8ULeE1AFs8/f7bL7cTCYrm/7wRMuhTGx1/MmeoOC3meye3+mh2hM9qsfDXqtVqYzDWIsNQ/EdJhA1bLkPotiB1wo8MplK0fkC/zyon462Ge1Z4nCjtA0ha3wIY65s6LK74yuvXC4z3VOBD54CJTMFgMGCsrJed65ogWEubWMStb6kVVAP37N+wwbu3uNuXzt5jnNMm0Ce3Bp3LafaOqecak7oaWnUesTC0CmDMFp/VdCSYorXfnyI5f0VaB7u+7DXxJpAliZuT/S0t10Qp471njOn4TIScuVbIKi6+/lCWjWnrooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ5PPF01FB7113C.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::804) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 12:36:45 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 12:36:44 +0000
Date: Mon, 15 Sep 2025 08:36:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Yang Li <yang.lee@linux.alibaba.com>
CC: <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Abaci
 Robot" <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next 2/2] drm/xe: Remove duplicated include in
 xe_tlb_inval.c
Message-ID: <aMgIV3JkpxyZKCkN@intel.com>
References: <20250915080647.669569-1-yang.lee@linux.alibaba.com>
 <20250915080647.669569-2-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250915080647.669569-2-yang.lee@linux.alibaba.com>
X-ClientProxiedBy: SJ0PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ5PPF01FB7113C:EE_
X-MS-Office365-Filtering-Correlation-Id: c15ce997-6bde-413b-5b64-08ddf4548795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6Ni1jI/Ttq48ToSTi/uyNtbznBurh3vbEu9wDBC2oIDwhWXs3yvcF9XbHsMI?=
 =?us-ascii?Q?9vUL4vwklV0QjRzTUZhL0UzhVd18RaLjdIFhylVSDCvT9+SIJKR2i0VPk/OL?=
 =?us-ascii?Q?oVx2ijrSgMr4GW8ky/mVmQg1z0vaLCPWGEpDeLepB3Nu+Y8bgSw5l9Djjo/2?=
 =?us-ascii?Q?k4/jZIP5CsMMVbNVMKeEJgTgYzB1UBAq4KoqCaKghMq/bjYHHGN0LG4Jtsln?=
 =?us-ascii?Q?P1a3mSkRfxKpDgKmhpDvZ02mHY6o4Ok4qgz+mJ+FHomSVN6m0IpWajVEsre5?=
 =?us-ascii?Q?nKPVFVLPQNGpSTBKUuKbyPx7ImWa2gPRP+EW/5gMK6dO1TIYcszqBrexvUAX?=
 =?us-ascii?Q?rdBegxfoR2SPqAg3ejXZMHcbGe1M86djV2BfSh2OrmrAWjnkHuV2worGdBzz?=
 =?us-ascii?Q?4/QLsAi2s0OhJhTQh+Zci8YAAIuaTzKLixuYRJ/oNsVfXSuW5bvNXw4Ox+Fd?=
 =?us-ascii?Q?0DUxea8pc06W1WfFLlrkXLcA5TpTxiKzFNHiUeaXxtSY1gPNtc346mT0kKdW?=
 =?us-ascii?Q?AJedM4AUHv5ifL0H+zIlyJqqfMJxeq2rQPhPFYQqfhRiQ5NKctcrKWPXZS7s?=
 =?us-ascii?Q?7B2KLNkKybTjpHFursAyBJiuumz0Yx7kw2Yx7jYec0Y6cC+5MmnVc3T/X7+q?=
 =?us-ascii?Q?UG4urFoqC1L5ph+3P6qdbqrkdGmb3QLFplr7RgdH5SOP9BzjIwFbLUmJAC8c?=
 =?us-ascii?Q?GEHEFg+OZ0Ii4HuzMlP6EaBn81ty5T2a7JCds9Z05Oz5Gz5iFoPJYKaIeJzJ?=
 =?us-ascii?Q?eA8YCjCEXcSPwXYRhT1xgTqpfF75xenpveKz3MgOHNob0ohUc+cK4bxitAMB?=
 =?us-ascii?Q?sNLmz/ig5Lv0AGhwBMPwf2c6ON8xy2b8Luujz0sKQR5oXV6FWGAq1+8E+bBy?=
 =?us-ascii?Q?kGeqaHvhdjp50pij7y/1kRx3XKlm7pUMuWKch1Ha//UhZaUAWyFpH0AxtEXN?=
 =?us-ascii?Q?b3IG1XrB7Lfo32l2IqeSQD8Lavq+0TcqZzqGENcazckWdN8vAIjpc10NL1OD?=
 =?us-ascii?Q?N+NB2yv177kEzLgaOeAnL7a/dqlQd4WkeGBx21O3oix6ncXwBQhXLmGK4Ttt?=
 =?us-ascii?Q?aREZ83HOVznfBLS8/EOgigH16rkZ0+gzR5hMldIcScRWjzRaihY7LQRLyTIo?=
 =?us-ascii?Q?TFZCv+CDvxshTAkYe33hkeQD2fvgFZp+mmJtXUV+KhJaBWb+ELFAeQH+vPn3?=
 =?us-ascii?Q?15QEh+zw7QLUJpZiwCh2G1ZMLXrP+lFtCfUjkWdiDDWE84sxT+Ft1IqIPO4X?=
 =?us-ascii?Q?X61FXpBZ7xP/oH0+jbbpDWIU7J9+mr0iXSH5PrHAC3At1leqMytMqbJubmMX?=
 =?us-ascii?Q?1P3qtRoSTvwjGlrfY8FYatwX2op/PCQ0N0Vv6TXvwV1Q0XDqOT0LoLFa4rKF?=
 =?us-ascii?Q?zhB4uxw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Knar00VYn6oHMJWoCE0UVIlI3K+xf8CRqIbHYmoqxpMr3esNffKktrGZvqGJ?=
 =?us-ascii?Q?3FpdxC7UDNcITSTUPs74yP+8ObcyfjtlgKAUGkfjhgOSj/A0mZDG9P3jCUw5?=
 =?us-ascii?Q?HLDR71HfMm/GFPlWun70hP1D4pTcDU+uOA5maIEjbknomB4sAjbKMJBnj4r0?=
 =?us-ascii?Q?A1BSi7Kv5mk0NffZ3Ps3xDid4SUQTpnXZMhohaNYrlo2xsaConK2EFosQHLm?=
 =?us-ascii?Q?EnG+y/TXRH2y3rpLGjiO/43Tla0WDie3KC3mP58eyDRWwdYIjp8GBo0AcjN2?=
 =?us-ascii?Q?8vqzdFsOXO9G1ovnymL8FHrIYQtc9OkPap+BiXopA7n5WJ7jnBJbhotRub80?=
 =?us-ascii?Q?WgF4HX+wacUTGWiZaw6H9V4IA3RHXzMxC3Z8QlTKnGkfW+sTg7AqjVFmR/3G?=
 =?us-ascii?Q?EThqvV0YGDKwJv+Gmskgh5vD0vZ4e3tV1ABVso1R7mfnhxEm9nF9qEMOV/jX?=
 =?us-ascii?Q?i+dCMSwztXl5oU3H6HGN8HreBhckBTEq1wu8zKzFdRRmS+sL8lvA9tNgmCl/?=
 =?us-ascii?Q?NDDv56NzpzM4Nsc8z3ovWwcJHu1pVbb2lOeyIkRgfE00Hcq+G7s46a8Bc28a?=
 =?us-ascii?Q?6wnbSRui+s8dZ2RHxIYwMiOIvteydO3IvHqoKVMFveah49Lmz8pBg7jSj1hF?=
 =?us-ascii?Q?swCYs0DE9l1d/2vMg27wTNflPVgPfTTWLshnLlPb09ah6IWo5DikENlSGJCu?=
 =?us-ascii?Q?VayEz4SC5n63xvKn7FLl5ls2t3/jBI0utQQD2FfdkiBWR65tUJnPrWe4TqF/?=
 =?us-ascii?Q?hIHKj42xIo83OCFmJ04ltrnHd+ZNjoto+6fm+YmOiN3eMgFem4GgGRuqiYhj?=
 =?us-ascii?Q?5Fmb3AWfIbPxuD8HsuOeKJ24iaAkCoGb0G7+mOb1M194uaeHFASRm7p29Uku?=
 =?us-ascii?Q?A6HdhNTSk89isBDeUTOoce+6ZEmhBd+I3UxICLf6BulC/0tMQVfuKYZDMUrq?=
 =?us-ascii?Q?wK9FogVY9tHXgaJE7S3+eLj/0fOEDrdX2d7zgrIsqrL9ZYdHVwsZUJE2i1WZ?=
 =?us-ascii?Q?L5bZHIqSM6u+WB9IKBFOV37Krs3fjrHJWEqPSFlJvCVTcK7b5IwqYi46nh9z?=
 =?us-ascii?Q?l9FYmypJwkp1kS9gQjDvYA/X8SCZdgfWmQlJuSjDJh7g1KrR6qRPNtlne3x3?=
 =?us-ascii?Q?kh85yTwKLQ4gf3Hmg5jC7EkBRXQvJSyXuw2umyqnzZfV36/7uoD/NZabKTwH?=
 =?us-ascii?Q?9fXlip8hHyIY+rEO4s/zDesqxa6vc6LvcDfnE5QtEtprPx/mcMnIGeMBpBNL?=
 =?us-ascii?Q?UWlWzW/pDdGL7osLdEUTBRhc9KC9fih51FKAN+Ning8FQwTPIq0fzb0ut3gK?=
 =?us-ascii?Q?+1iSVfDXmPKirBqAFR16QH0fORf98xPMsLcUjq+tWWqr2c98ZjFoZ/kTU824?=
 =?us-ascii?Q?15o1ya91FyMhzAmYjHqx5AvHLT+MwSrB24hN2cZbKq3r7HXQMDssB0LpQffc?=
 =?us-ascii?Q?ih385yiVtq5iD91toVQFgJ4/KkjsxwBounqD3PjbOfZK42PzoZODP7E8caEF?=
 =?us-ascii?Q?I0RP8VH8q01fIu2/eFy0G8lwro7GQm7JLfKrC+ulGb2D/Uzyb+sJSW8GIJWG?=
 =?us-ascii?Q?6TZAKJM6em0EqK+C9UiKaBAiAMQR8SvO87I0BFQP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c15ce997-6bde-413b-5b64-08ddf4548795
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 12:36:44.7981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgNnQuVvfMVLkiUHy4mSwy8+3QMi2MB8N1ctYGFbnM/1xKeYjmz9UCyjPBnVVnmGNICs8Zm995D1Varwj2P/QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01FB7113C
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

On Mon, Sep 15, 2025 at 04:06:47PM +0800, Yang Li wrote:
> The header files xe_tlb_inval.h is included twice in xe_tlb_inval.c,
> so one inclusion of each can be removed.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=24706
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/xe/xe_tlb_inval.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index e6e97b5a7b5c..41e80d609815 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -17,7 +17,6 @@
>  #include "xe_tlb_inval.h"
>  #include "xe_mmio.h"
>  #include "xe_pm.h"
> -#include "xe_tlb_inval.h"

in both patches, please remove the other occurence so we
keep the alphabetical order.

>  #include "xe_trace.h"
>  
>  /**
> -- 
> 2.43.7
> 
