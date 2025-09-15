Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CACB57FBE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 16:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C95210E4DB;
	Mon, 15 Sep 2025 14:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZEEV8Zm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C5510E4D9;
 Mon, 15 Sep 2025 14:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757948325; x=1789484325;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aDkivjMWwWA4VBOgXqwT2kM2a+AIPuN/+95Pa3QbLSI=;
 b=TZEEV8ZmRkFeMaoP9yvHGYIyfPhEXtLjqhhjGRpwuNVcU8KHj8U0EXZg
 6HyfLk++Z1mjqAAw8PWQOM5UR5G3/UfM5ypBVPgPyHqXC1on7E60465E4
 wur5MlIaRck6tJN+lpGK5tg2jWBoaLjKxF0S08ZQc6pen+mV3HwkB2AkQ
 gijXkiSZ8f46YIaeFb+3dBaESOKOGL14a07IvjFbB2C3A8+oE9hLLjAg/
 KHhpth/l4W8oUh0uELWDFiazaE8IanRJCh+yl7q9CRxxw8O5rnHzoucJ7
 plU7zmEvic+RRm8g/S6UTt9a55qmrxE+4LRFqIIbrpWtY2pGXO4QzE2ZH Q==;
X-CSE-ConnectionGUID: H7yiBW77SAu+bBH4taj0TA==
X-CSE-MsgGUID: y/NFJkEqSjGkK2cJgPC3Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59248148"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="59248148"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 07:58:45 -0700
X-CSE-ConnectionGUID: ryYt/KGtTyaupTfJ13Eq4A==
X-CSE-MsgGUID: a33pzcQITxmQ+EOp4IemGQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 07:58:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 07:58:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 15 Sep 2025 07:58:44 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.28)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Sep 2025 07:58:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWKVssf/6ZmMFb/EyRDETnt/vzneg5H30xC0W2/HY1lMT42yv5kyVb1+lzViz7eKC2Z8+P7wZnIeRoz8Kg3fltO0ph/t8lt5kXpX478YrqbY490bzB95xGkq3eP/0db9DCOPNav1643983Ye0aBe8rLCcq/Gc/IfdyqkYMI7Rgj2Etg5Lup0BJbV/bYqnUiC0mDIWSH4/t1658kvg3IevfNY9WKTJFm7BrbvUsDFUPE+STkKAldMk3Phfsj+fJtwF9xXPA+Rn+BXAlU13uRUngy36xgQz8SEbxeW/56N+76ApHLf/UPRS5mLlbyNoFjjTIJdE1c3H1DKaW9yQqX3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/KwM4xPeAGM9TSgjsbV6p3GwhdH5OYDE001p8PvYo0=;
 b=QDLk0ZSjxH23nyiDG4CIhZ29gzJZEG+6UAryNZbGUnUji/oEEU83N+xyGJ6DC1tBdG3BUjwaJNethU0Fgvvztdgis8zEyHi9Aq0L+4z6EHragg52jEhwsH7M/OxVPDN1wNNE9CCeTzpvrXhud3uB6Zm2pDUmFzHHFfjL8nNnaekrYbxVtN8CGqJyaSlMiXGBIZf2PevZrXIuiE+AkQ2TkYeNgS5wZWHYjyrck6RtWvELhG3ip0bvb0FIPA0tgFdqTp/9dUK1DTR5VynHkyr5tEa/aPhdc6KyXg6MXtq0YdnpE1fbvTC/WGnQQ819BnUtBk97CQ81RqbpFHm7/vg8BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6793.namprd11.prod.outlook.com (2603:10b6:510:1b7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 14:58:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 14:58:40 +0000
Date: Mon, 15 Sep 2025 09:58:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Yang Li <yang.lee@linux.alibaba.com>
CC: <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Abaci
 Robot" <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next 1/2] drm/xe: Remove duplicated include in xe_pt.c
Message-ID: <2jjvkn62gootdauxy5i7nzdrfnfzuk6mepponuoloron7zo564@xte57gyl3xmm>
References: <20250915080647.669569-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250915080647.669569-1-yang.lee@linux.alibaba.com>
X-ClientProxiedBy: SJ0PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: 066c76db-68c1-4db4-e191-08ddf4685b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BKsHR7SAwQWOtpN6bWH7t6FaW0CKG2JCQ/RIgOH434PPsvKkRbC4yQYJr5N3?=
 =?us-ascii?Q?aVkIQhtMyRKXTU6+GCQDQ6mjAOJk6lkej4sVuDzlzLkJf7KIBDvCP9rIAmZ6?=
 =?us-ascii?Q?iLZZryAgUIlRdBMLRv7lJU+9DL/5WMrW6H7FVt/0nqKLMyLJyUjplXEvmIsD?=
 =?us-ascii?Q?Vx+TkO0btuq/5wuwASMh0i/YwFBVPWtNSAC/CIEYuvAjKsTFnPN/hARdpJR0?=
 =?us-ascii?Q?JG/Lg+7CzBJa65EhJjUR3EueQXPCfYaf37hjDZ+97ZIvNctl5OUh/7NjngiN?=
 =?us-ascii?Q?qj1s37mfbyB9LCj/Ql0Wlqd+mu5ld3ksQJ9BQ151czz+qt61qWOEtu2y2t7K?=
 =?us-ascii?Q?WdNusE2X/3vMMA73bXLHj3LmTB8aEawK+1EYsfDSCF4FQpSGKJLgg2TLDFTA?=
 =?us-ascii?Q?ykpjTOiWmDduvZYPvxTnDWc8mHIjfe3XvpXXgSUGoNIcr/rB9qLzXwwIZ176?=
 =?us-ascii?Q?hvEJcbVdrbVruNhUM4hJHFgFrKPbYaLt/eb1pVElu8AZ9VBbwaNUwpttgzPZ?=
 =?us-ascii?Q?cnMD95dZj/cFvekbKvmztCp+rabvbUaYVOUTNATuBDKERVggtTuLP321FGAZ?=
 =?us-ascii?Q?f7NwGzZP0YCgYFr6DNYYfex4ajHLovR/LBow/pYZ+BmPBez+r9t71+Hmq8KJ?=
 =?us-ascii?Q?Kit81PhtbewY4vFTvnZLvFDA6K5W4Vmga2P20OcLDY7dklPd0wUkRq3WgoIx?=
 =?us-ascii?Q?OTtS2DoGnC1iTh3b5Cu8eMrXhYd1V/MmQw0DWAqkDoO+qC9HY5gQZjZWrljX?=
 =?us-ascii?Q?NV3n9Aftz6maiGSKvltq/QYrvyCjYelMju1UY7/HBb56TgtQYvaVl74iZY26?=
 =?us-ascii?Q?Uye9f/AjiZa49g+DgzeNf94JDq9+4QiCjlCHVp9j7ubFW/otCVx/eTZFSlwR?=
 =?us-ascii?Q?Op/CWcm2CzDbdBdRCzfJhzELnS8lMA7KP6cPxTalHg5zTvXFSvsSZOUDl48o?=
 =?us-ascii?Q?KmNjFriw1QL453j/QwLcSauEYW299JHHIJDBBbyN+l7brMwU148kod3qWDk2?=
 =?us-ascii?Q?8yR3UXJ1MUtxXGf5L5y2195sV8gOFdENrrdjn2JaVNouV78GCSPyBXp5QZrk?=
 =?us-ascii?Q?f2tuEkP2Rmsyet5GnkKLiiLcblMCVu5kxvH5ihbvPcssdx44GJkvD+eSlj9b?=
 =?us-ascii?Q?csAYcRufNwocusZic3ouU02ViVi2POZ1YFcYHANIp3wvIBPCWtlm2NwYFOQs?=
 =?us-ascii?Q?0LW5DWa4/Pajsmdr5FwhKJex1qHV2MNmdIgK/OZyLeTKf6rD/2xRzkwXwwpo?=
 =?us-ascii?Q?QLXDsuiHZfymbWN8qYFyyAak3KNEQE4j6mZVanGavE4pPGdWZjXCpmDKB4cK?=
 =?us-ascii?Q?SgSO6xLPfYUYh3uuM+I0XIEXIdX5reHOwST8/3gtX7SYI/rNAZStinukRxqD?=
 =?us-ascii?Q?Etk+PuU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cvS07bZISke80N5Z6l1HtbOWXlJjQ0jiaQKJxZ6y30FxO7DqUgqGg7N2VQ2W?=
 =?us-ascii?Q?qMnmz8/RiY9n1qvXymGSjnakjWb43tQsLf0CRcKOTmcLmPhmeZ4KdCDySbXW?=
 =?us-ascii?Q?/Pi//jlhxa2ZLBXZ88gvGx7veTuEVmur58AGKbwaaQxDOBgoA6yasWh4WC40?=
 =?us-ascii?Q?ytuffGbHrmRsPXbeBylCBhVJuw87Jm3HWtK/2I3eyyuGVcADAXJZ/9JgLd3F?=
 =?us-ascii?Q?Dy82EXT+dPsHEUvMDGUgSTMZEtIIo3ReRCHK3a09/3KcJWyF63YB9oVBoYQQ?=
 =?us-ascii?Q?mjMWqFSLoZiqcvJhkDwUBq6F1N2geOdL5CdlqQxzFvv6algtQLDWDH0bsEdr?=
 =?us-ascii?Q?Hfn5K4ZtrtW5nYMiax3S4ybVYAlwJ0p/7ZFHr5OLcM2RGJ9esbAH5B7/QnI1?=
 =?us-ascii?Q?ouHom71CzqwxltoVhEC3zLYyBFM/+c3KpTY/VZTHHtfko3T/5EuZ3W2KNUwX?=
 =?us-ascii?Q?KJDji/h/0sRYajkV5Gub0cL+PQY+hKW/hC6vc/JVdp7G23TVAzdd6s7bKb/I?=
 =?us-ascii?Q?rHySnsFOlOpxnyHVPQyCRUMn0Ppt7TgGEzzTZylR7gPVSPpWKhwJ96tWlI7a?=
 =?us-ascii?Q?ysqIQ3kKsfNAzXaAJt5/LhtKpxLjiRBbIceDPLsJ1S508astB+1x5CNCKwY4?=
 =?us-ascii?Q?GZcAypOuyi6vT22YujWnlkxEHa57I1+0A0cKsv8Kl8jC/72a2X9wIGyMjzda?=
 =?us-ascii?Q?ifU80RwLCe1dQbs0rbXMZIEFWMzBpQnaBb9XstDtsXG6LI3VIzh1y+H3yGwT?=
 =?us-ascii?Q?F280OCKGTGbsvH3Dckeqwlxb+64r5Ji8NnUrpTlFFC9Wty42bHYq0zWUaxFr?=
 =?us-ascii?Q?M25V9/SdZj2rjo+n1f5QejNai5WuenJiN49ELGnF37Re38z51I3qFYbr4T9D?=
 =?us-ascii?Q?yOxIIxFxFMy5nvEDvmJZbaRNZjkSbn0wNtG2z30vQJaPh/ggwkUOLeFCJXc8?=
 =?us-ascii?Q?k9mg0o5SeVs1bFf+T/QM1iv4NKI0uIlrzWArKFhriFa7SXoAoAUEXJI7uva0?=
 =?us-ascii?Q?65sugvwlZwGDKsb13c3KqplP5CGT+foQBbHbYqBAgtCLywHch0WmE3kzmFBi?=
 =?us-ascii?Q?mGFXL4kbGPRxZ/+urd7N8raIHtwScgPaYQS5jDd+A8HDxbaGBEyG6Zz+xedN?=
 =?us-ascii?Q?A9tMb1pQdrTKymI8S/Rr93mcxXzTSQcu5KazGTxlcZPIpEU8dLqbB4ib+t+w?=
 =?us-ascii?Q?Wic/K4dH/ug4n+z65StBcbHoo7QN5JD8gXPgX4T3kx8mRhm4TJaij9kWCpkv?=
 =?us-ascii?Q?58iqt4WSsdhQhYUltv7OGmn3cMZoepWis1sRgobSj4xUOjgd4ZEX3pgYT3SH?=
 =?us-ascii?Q?ytg0eFt8IO3EKokB575hPjjdD48H5RwIH8u5993A607Nj6Ly4ezFdEN7o5PS?=
 =?us-ascii?Q?oyY8e5NR8SSqOqAEa9R2j2CcwsqYW6cVXo5eepQZ/SN9L0gtlkOdRXdvmkFg?=
 =?us-ascii?Q?lTtFN7Jpcw76BIHlrv78AmiRZtVp2lnGFfpfPeX2KefUk5NxWAzvMO/sijus?=
 =?us-ascii?Q?kNDcq2QV3mVkUheHR3WAZ6d8YgbKFwtlyVwxAcqnfn1nztItM1Gcwpp5lPar?=
 =?us-ascii?Q?rZzpgiALSiiow8y2GmYnWlV+H5Ogpjjn33zBmwa8k89iNcPd6kXgJA/pYxsc?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 066c76db-68c1-4db4-e191-08ddf4685b4b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 14:58:40.4311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9rARkk3K77163aL9GUHTXTbpuAUF8RRJwX+bUzBfFxrLoBmPA36h2LwxJ4PQr76v+R3PdGAImYt+K2KOrgCuwnSGfnD05oqdpcS4LtSQB6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6793
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

On Mon, Sep 15, 2025 at 04:06:46PM +0800, Yang Li wrote:
>The header files xe_tlb_inval_job.h is included twice in xe_pt.c,
>so one inclusion of each can be removed.
>
>Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=24705
>Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>---
> drivers/gpu/drm/xe/xe_pt.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index 01eea8eb1779..3e33b10e7ba9 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -21,7 +21,6 @@
> #include "xe_sched_job.h"
> #include "xe_sync.h"
> #include "xe_svm.h"
>-#include "xe_tlb_inval_job.h"

however you removed the wrong one. `LANG=C sort -u` in this include
block would result in this:

| diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
| index 01eea8eb17795..a1c88f9a6c763 100644
| --- a/drivers/gpu/drm/xe/xe_pt.c
| +++ b/drivers/gpu/drm/xe/xe_pt.c
| @@ -13,14 +13,13 @@
|  #include "xe_drm_client.h"
|  #include "xe_exec_queue.h"
|  #include "xe_gt.h"
| -#include "xe_tlb_inval_job.h"
|  #include "xe_migrate.h"
|  #include "xe_pt_types.h"
|  #include "xe_pt_walk.h"
|  #include "xe_res_cursor.h"
|  #include "xe_sched_job.h"
| -#include "xe_sync.h"
|  #include "xe_svm.h"
| +#include "xe_sync.h"
|  #include "xe_tlb_inval_job.h"
|  #include "xe_trace.h"
|  #include "xe_ttm_stolen_mgr.h"

which is the preferred way to maintain the includes.

thanks
Lucas De Marchi

> #include "xe_trace.h"
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_userptr.h"
>-- 
>2.43.7
>
