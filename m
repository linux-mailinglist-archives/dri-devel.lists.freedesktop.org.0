Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2355A450DB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 00:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D335610E819;
	Tue, 25 Feb 2025 23:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3tTebTP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A079A10E811;
 Tue, 25 Feb 2025 23:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740525431; x=1772061431;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C7Rx3iGsatYmU8B/woO9I2/yLK3gzu6qh6c8dUUPLWg=;
 b=X3tTebTP/IejdIZ4cxbE7G2FCqvuYNb5F55g3ZJeKj2Sqwqp4BM2WiF4
 5eVDlC3XxH+CMhM0CJzytAIdp47UVWsBj8vUZAQ/Kd4lkkFBonm3HwBkQ
 R4m9IV986UrVvG9DwBPFgE/1NUu73+CLPO7kMi2H1lnxOAcwZe9qJp4s/
 t+kF+bJL2/1dnxMHbuItUytQrvVj8PdJ4B3PHCAkKR70YAbEzdCMLYDC/
 pbFAFHjN4zNEykgWXLXTg7lH5aBw/wQZSAa3AM0wuMtcXCDEdCBoqqi+g
 auEXcoJFeQCcXyj/RVEjOne1eHfP3ywLJPdd1btyWpqrsalhXvcRArPsF g==;
X-CSE-ConnectionGUID: MF2jX5v0Qx+5f+egt3YjoA==
X-CSE-MsgGUID: 0NBcumfSTVKiASbqf9y01A==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="63821036"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="63821036"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 15:17:11 -0800
X-CSE-ConnectionGUID: 3GSHjCZtT8SvmiN0UG5kEA==
X-CSE-MsgGUID: cQE4u/e1RZywGZ7tfucg/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="147443175"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 15:17:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 15:17:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 15:17:10 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 15:17:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XI2hDocDCG7zj9CkzAz+6Qz3PWkJUYmbOChMYM+gTUzvHKwgvIJuCeHem9SA4lY09uAzriRnkjP+owJ74kVA8L0n9y1E+DdMnnN0CAnys6m3RPB4jd6y/iTvM1zp/EeinvmHPJn6pPl+RW1W5vNO4fzkTT1hJ7ZqKaGwPe+wb0K0CCoCeeanMYW0W7z/J+doFqIDTtue5wvm84ixqwZMqU3fzIGvVWbNY9ezoxRwXaChDr+We5yqqv06+R+FNpUzO657K5iWEO3QATeb6JV1a/adc8pN+awrW0oljImUQ7M4kQCfFZ1CfM6o0XtRLO9uOYfTH+DRfj/73R8Wzpnyqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8N8J2BHJIrASUu1JQVU0sy6vyld7Z0g8VWtS+zFiwo=;
 b=a8TJPKC9PBE8SUnU+IkwAaWWlK4vJKHkzaf1z4kYaYr2H/miUJd4C0+ZMLC6Q0WGG0X4D1SPiPHtIWv2khkyszZY0yNW24/FaD0mhwRtBpLcU5mepjnJ/wk+ceqWEBN3rSnLuEPnWZ3g63yvbDEpaFqB6BOlua84Oa2PWsHFxTF+tXNWUyZhcnbzRTZ/Nr82B8uvEYNuFTf1LvTmb/nbF6PncGgfLO2zbK/qnTEF0qu+cmyyZzG/pcF5Masco3jdabHRGDynPbWv8zNn4VZvmn1CWclj/E+T20t4jX/yD0cHgKwiYcQh4raL6XLuITa9+83xLfzBryh0Lycox5Kg+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8795.namprd11.prod.outlook.com (2603:10b6:806:468::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 23:17:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 23:17:06 +0000
Date: Tue, 25 Feb 2025 15:18:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <tvrtko.ursulin@igalia.com>, <lucas.demarchi@intel.com>,
 <dri-devel@lists.freedesktop.org>, <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 6/6] drm/xe/xe_query: Add support for per-drm-client
 reset stat querying
Message-ID: <Z75PsulFVlyfNTMl@lstrano-desk.jf.intel.com>
References: <20250220203832.130430-1-jonathan.cavitt@intel.com>
 <20250220203832.130430-7-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250220203832.130430-7-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW2PR16CA0040.namprd16.prod.outlook.com
 (2603:10b6:907:1::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8795:EE_
X-MS-Office365-Filtering-Correlation-Id: 323016f4-8431-454e-7ec8-08dd55f28572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zg9bXfc05Uo2e2V5+4qQZLc1YOvHAaCzoH4yY52d2KwkK6BU83wv/5fZS34V?=
 =?us-ascii?Q?x8etEl9gRqhHlxrnMl5ggoGqPw9AhrjqCy+GrshA9OcmqJ2qFFxAgHs1ubqK?=
 =?us-ascii?Q?JUG/7pElXTy7wI7H+MRyU/MK9QjkK5FymQvOYDesloqxVcO9DSRSi3hLw5jy?=
 =?us-ascii?Q?wX0nCU8te4KW2qGE03ywMWQIZj5IDKEZ05rXBOMuvSgJ7s8mkluHxHezE+et?=
 =?us-ascii?Q?1hSpEttD7C05XdgfK1tiaRpyu7//J5rkDtq9tXNcBa2oxAyen62XgHSKRhrh?=
 =?us-ascii?Q?bX4a8nKPpKNtmR7bAbc72DMQJORM9/IJ6JJV2GBEHyJriR71tiBc+nh5oA2j?=
 =?us-ascii?Q?fkiXkSwrbT+3X6Ca35cLZhv6umh7ff+6vkEiSa52QN7P6M6RaYdxXUKghMIF?=
 =?us-ascii?Q?jX0mjm1tERM7oNLs6NCg6aiJqZewGxdsdZJGr4Zu2o988tfHB8bNzJH3H1Lb?=
 =?us-ascii?Q?sKbWcuv06sXS27fQCAqT6QIXL4ZVnBBDGCfyeNCXNJYHSJii4yT3vD4eWvhZ?=
 =?us-ascii?Q?FafKfoDscdPgkHd/w2NyLDPylX8ls9zpICWsRWjeUdCzHwy+80Nmmqsx0Kk8?=
 =?us-ascii?Q?LVeRGuoZrSG0VhR5oGU6AcQmoUc85NH/y+Izo8+7aHfYYzdWfBWXaaSah62M?=
 =?us-ascii?Q?GRf8pDU5wRCZfEVz+RHlCSWLI8HMXipMmJuclrI/xcZbYFTHTiH4Lye0ehUQ?=
 =?us-ascii?Q?Gk6yevGujsSW/XaXULnSyDZUDAPjA/+R5NbOdluqR5VZWFJE3H2Zx5aWDvZM?=
 =?us-ascii?Q?sOkcFR/USd3o6xGkm1qjSe8HzMLiuTo4TNh5JjJULiYpg1BRcJ6MrYFZSybb?=
 =?us-ascii?Q?XQtjk5YVtTgyLtCsdL+Ef7D2JYMEWsjvLRWGScehzRUedqb/tr7ijtPQSlay?=
 =?us-ascii?Q?4OPrwU7NNIvEBx5kOGwe0i0+OKXG98YxGgwhqTQVOxeqrowACJ9AmPgLX7Iu?=
 =?us-ascii?Q?MJZsEpAWwBql/+GYk5laV6Yu1js6r+ZbivlnI6p7B7lLC4XJP4EbFH3SWpwx?=
 =?us-ascii?Q?9umsyJLqrRvwN3hmSSulj3wqOp+r+cgVd5iRJBl4WetcaGY6eCTkbiaOKk9E?=
 =?us-ascii?Q?il00ue43lOEOtn8n0qSpR9WxgPVFl9nK+1/3Ucphi4xtagasumc4MElE+JH5?=
 =?us-ascii?Q?jrcMQG9hnMgtpv7PtVO6yemrdxtkYZXHYDP3UpLByUM2uX9gff2Gg4ZZ/PI2?=
 =?us-ascii?Q?e4e3Pjns73y8Tfm/KfyvHKKOgs6471zjLJWIx2yjVuQJqayRsozpVLAGnn2R?=
 =?us-ascii?Q?eBGjRyNHgpVw5vCP3aKF4S0YvSRRuHYM4tyiw9EnQHxd8LbO4BSWtLVjW3uk?=
 =?us-ascii?Q?AQGBg59Q3lkJjbc53PU5LYSTWLlEdt4K5pu74+Q7luk/5vR4+rqPoRv9H/Zx?=
 =?us-ascii?Q?MoTXgFHVZP017vfFNe6FUgUVdd2S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ulr4JortP6qI11dvDmDYo2lqLuzk3MdfiDyQDRfWodAA828yCrdmAtt3TBR8?=
 =?us-ascii?Q?0CkxCU5kNFhxARRfIiQ9TGmZ72I/DlRA1gPTx6a4QeLxOTeUrhJBirTpYzlV?=
 =?us-ascii?Q?ADy+8BvQCZdKyxJ/3r/+zftC2k52dvUIwijf0DSnu57QAbifV1NvOwA2IeEP?=
 =?us-ascii?Q?mHo6YPitepRbnj+iAqk83nGab6HBipUVdzWk3gdSkp8ocpDPZTwS44RBxOUv?=
 =?us-ascii?Q?8ymCmYSZl4wKWU8/jBA8TQzCE0GLl2LwiDU+BhZa+FcloBQYXv3AJUXELzIg?=
 =?us-ascii?Q?cusiFyHguAkdMve4XrMniQ+3tnQpM2V+sUTjhYe4RqIAwgFYO4QJwnzJRI4j?=
 =?us-ascii?Q?S4oFYZspEXXZxJL1qHyVGDFy/t21RMhkQaioLFPo4AW/dodLgbM6O3/sDbzq?=
 =?us-ascii?Q?suPCNSc9oGExggfHvxp522FAQK9DfYCEf/0tiBZOgaPfKP/7K3P+99gS8dm3?=
 =?us-ascii?Q?SPNg3tASkm7kAY3JqOpu98F8D8+xQTCUB5scPrZfbXU/0SQrtPJJmSpO3Bsm?=
 =?us-ascii?Q?AQq0ssvUftbztxgKJmRnFcQZ+TJim6wBl/MWqOkYCIHVO7JQdoTO4wDcUDaY?=
 =?us-ascii?Q?PiKeCiDZGLZLIMVn1E4WSB3Mp7S4sxMdkQ/Z/jg5C1zb95gh1PuJfqdMIBpH?=
 =?us-ascii?Q?CjWr+2HFZfxb4otsSruShUA8s88Jj3TT9rXPXhU12FBCSwu8IRwqEtMtxB5K?=
 =?us-ascii?Q?AMJK1e7Zxe4NBxK7y6WNSzcrIOat8RGFYMpTZnGKcvI/L/+IXCjDyfqr8XAT?=
 =?us-ascii?Q?9JHGCY2JewHYw7pePwqTZADUOAoL3fS/djuDM0RLJfszjdVxF0sBANFP9WX7?=
 =?us-ascii?Q?/0Jzgx1DHJJadLA4BzrWQb8S4n0cwXf/YQ23AwNIr51Yg1dBhsrn9kc0Byjl?=
 =?us-ascii?Q?9g9Hj4L4Oy30oe3nBkcVG5h19PRTw9Pndky/V3wJ+h9hHAy3KxIoUny867TE?=
 =?us-ascii?Q?JglAmhpSj8Hs908a8pn6JnuPjPKisZAh8D8KDBasYki8DQDho5V7E6oJX6nK?=
 =?us-ascii?Q?0PPWFKLSgy+GbCRHBPGhTeq1Ct993fFXdPt+nqmGeTWhYFEP1yoAFtZ/Apt+?=
 =?us-ascii?Q?c1V51ZcSVL91MnZtFrtGgtIWODCpI7Qjp9eVsuX/baKRwNzRy1CR2bmlChIq?=
 =?us-ascii?Q?zXfqNdl/EqiQD7xo5DXQ6LtkZq7II5Y+Ag3JG5uiHW8uNK/3GOBU5ZySPeJT?=
 =?us-ascii?Q?r6stiG1o62NgiTlHWthuwrk+c6An2zQPD6XvEEsMLhzRoWMpUYg4muM2/GWg?=
 =?us-ascii?Q?RoFuqtVzkra/Sq7GlThKshrJ9EYonT1OybA4cJzBGDY0Cx0nFOBckguJeCOY?=
 =?us-ascii?Q?OoCNqFgedHTIlg2wVumPtoKZ/vWXLTtHjLmykWh4c+ZM3OTgoSC+RH+mMUey?=
 =?us-ascii?Q?lQANRzOZyDHlMezwhJuJK7sKrmmv7YUMbWgMRDHTu8YS6RK+A9cj+2EeO4cf?=
 =?us-ascii?Q?G9y6nH86sKZg1wMQUnZLKWUAwB8bxktOVcvmuD9AgnivO3hUPyMgFOzwB4XN?=
 =?us-ascii?Q?lzpENilE8rMhpOGtf5LSbGPWSRb0PQR3FPH28vDxFzCiU5Eb4L+6Fw+JYTJk?=
 =?us-ascii?Q?OlZ1rZ8y8igmc1kgPqKTWdyr32Vp/RNClBK9lgGG4wbzUZ97/bsQBKog5Bpu?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 323016f4-8431-454e-7ec8-08dd55f28572
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 23:17:06.7629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJXI/LsMSzW8LeR7+ra8/o+NkIQ2n5lSawMRiMZx6dMv/gFoP8Gbg7lKIe+hepjneCPioR8hsJyTUWe2PrsapA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8795
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

On Thu, Feb 20, 2025 at 08:38:32PM +0000, Jonathan Cavitt wrote:
> Add support for userspace to query per drm client reset stats via the
> query ioctl.  This includes the number of engine resets the drm client
> has observed, as well as a list of up to the last 50 relevant exec
> queue bans and their associated causal pagefaults (if they exists).
> 
> v2: Report EOPNOTSUPP if CONFIG_PROC_FS is not set in the kernel
>     config, as it is required to trace the reset count and exec
>     queue bans.
> 

After aligning a bit on chat a few more comments.

> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 70 +++++++++++++++++++++++++++++++++++
>  include/uapi/drm/xe_drm.h     | 50 +++++++++++++++++++++++++
>  2 files changed, 120 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 3aad4737bfec..671bc4270b93 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -16,10 +16,12 @@
>  #include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
>  #include "xe_force_wake.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> +#include "xe_gt_pagefault.h"
>  #include "xe_guc_hwconfig.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
> @@ -740,6 +742,73 @@ static int query_pxp_status(struct xe_device *xe,
>  	return 0;
>  }
>  
> +static size_t calc_reset_stats_size(struct xe_drm_client *client)
> +{
> +	size_t size = sizeof(struct drm_xe_query_reset_stats);
> +#ifdef CONFIG_PROC_FS
> +	spin_lock(&client->blame_lock);
> +	size += sizeof(struct drm_xe_exec_queue_ban) * client->blame_len;
> +	spin_lock(&client->blame_lock);
> +#endif
> +	return size;
> +}
> +
> +static int query_reset_stats(struct xe_device *xe,
> +			     struct drm_xe_device_query *query,
> +			     struct drm_file *file)
> +{
> +	void __user *query_ptr = u64_to_user_ptr(query->data);
> +	struct drm_xe_query_reset_stats resp;
> +	struct xe_file *xef = to_xe_file(file);
> +	struct xe_drm_client *client = xef->client;
> +	struct blame *b;
> +	size_t size = calc_reset_stats_size(client);
> +	int i = 0;
> +
> +#ifdef CONFIG_PROC_FS
> +	if (query->size == 0) {
> +		query->size = size;
> +		return 0;
> +	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> +		return -EINVAL;
> +	}
> +
> +	if (copy_from_user(&resp, query_ptr, size))
> +		return -EFAULT;
> +
> +	resp.reset_count = atomic_read(&client->reset_count);
> +
> +	spin_lock(&client->blame_lock);
> +	resp.ban_count = client->blame_len;
> +	list_for_each_entry(b, &client->blame_list, list) {
> +		struct drm_xe_exec_queue_ban *ban = &resp.ban_list[i++];
> +		struct pagefault *pf = b->pf;
> +
> +		ban->exec_queue_id = b->exec_queue_id;
> +		ban->pf_found = pf ? 1 : 0;
> +		if (!pf)
> +			continue;
> +
> +		ban->access_type = pf->access_type;
> +		ban->fault_type = pf->fault_type;
> +		ban->vfid = pf->vfid;
> +		ban->asid = pf->asid;
> +		ban->pdata = pf->pdata;
> +		ban->engine_class = xe_to_user_engine_class[pf->engine_class];
> +		ban->engine_instance = pf->engine_instance;
> +		ban->fault_addr = pf->page_addr;
> +	}
> +	spin_unlock(&client->blame_lock);
> +
> +	if (copy_to_user(query_ptr, &resp, size))
> +		return -EFAULT;
> +
> +	return 0;
> +#else
> +	return -EOPNOTSUPP;
> +#endif
> +}
> +
>  static int (* const xe_query_funcs[])(struct xe_device *xe,
>  				      struct drm_xe_device_query *query,
>  				      struct drm_file *file) = {
> @@ -753,6 +822,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
>  	query_uc_fw_version,
>  	query_oa_units,
>  	query_pxp_status,
> +	query_reset_stats,
>  };
>  
>  int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 892f54d3aa09..ffeb2a79e084 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -682,6 +682,7 @@ struct drm_xe_query_pxp_status {
>   *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
>   *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
>   *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
> + *  - %DRM_XE_DEVICE_QUERY_RESET_STATS

So if we land attaching to the VM... Rather than a per device query I'd
suggest making this a VM per query, e.g., something like
DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY. Then an individual property would
be 'fault status' which can be called once to determine the number of
faults, and then again with number of faults set + user pointer to copy
the fault information into. At least that is my idea.

Matt

>   *
>   * If size is set to 0, the driver fills it with the required size for
>   * the requested type of data to query. If size is equal to the required
> @@ -735,6 +736,7 @@ struct drm_xe_device_query {
>  #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>  #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
>  #define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
> +#define DRM_XE_DEVICE_QUERY_RESET_STATS		10
>  	/** @query: The type of data to query */
>  	__u32 query;
>  
> @@ -1845,6 +1847,54 @@ enum drm_xe_pxp_session_type {
>  	DRM_XE_PXP_TYPE_HWDRM = 1,
>  };
>  
> +/**
> + * struct drm_xe_exec_queue_ban - Per drm client exec queue ban info returned
> + * from @DRM_XE_DEVICE_QUERY_RESET_STATS query.  Includes the exec queue ID and
> + * all associated pagefault information, if relevant.
> + */
> +struct drm_xe_exec_queue_ban {
> +	/** @exec_queue_id: ID of banned exec queue */
> +	__u32 exec_queue_id;
> +	/**
> +	 * @pf_found: whether or not the ban is associated with a pagefault.
> +	 * If not, all pagefault data will default to 0 and will not be relevant.
> +	 */
> +	__u8 pf_found;
> +	/** @access_type: access type of associated pagefault */
> +	__u8 access_type;
> +	/** @fault_type: fault type of associated pagefault */
> +	__u8 fault_type;
> +	/** @vfid: VFID of associated pagefault */
> +	__u8 vfid;
> +	/** @asid: ASID of associated pagefault */
> +	__u32 asid;
> +	/** @pdata: PDATA of associated pagefault */
> +	__u16 pdata;
> +	/** @engine_class: engine class of associated pagefault */
> +	__u8 engine_class;
> +	/** @engine_instance: engine instance of associated pagefault */
> +	__u8 engine_instance;
> +	/** @fault_addr: faulted address of associated pagefault */
> +	__u64 fault_addr;
> +};
> +
> +/**
> + * struct drm_xe_query_reset_stats - Per drm client reset stats query.
> + */
> +struct drm_xe_query_reset_stats {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +	/** @reset_count: Number of times the drm client has observed an engine reset */
> +	__u64 reset_count;
> +	/** @ban_count: number of exec queue bans saved by the drm client */
> +	__u64 ban_count;
> +	/**
> +	 * @ban_list: flexible array of struct drm_xe_exec_queue_ban, reporting all
> +	 * observed exec queue bans on the drm client.
> +	 */
> +	struct drm_xe_exec_queue_ban ban_list[];
> +};
> +
>  /* ID of the protected content session managed by Xe when PXP is active */
>  #define DRM_XE_PXP_HWDRM_DEFAULT_SESSION 0xf
>  
> -- 
> 2.43.0
> 
