Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F7FA2AE46
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 17:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46F010E8DF;
	Thu,  6 Feb 2025 16:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2Jtr6v5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFF510E8DF;
 Thu,  6 Feb 2025 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738861168; x=1770397168;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zBGAgPmn+VcJeylcMx45UdYrTyoVRF28IeOM7tr0BCE=;
 b=K2Jtr6v5envHJ8wHM98ogJ0LCKJ+d62gj3GgfUzH4TXaVwJucf4GzBJ/
 Wr0k55kqPBogNQ4EC86rr44HRw/w9iTVtJCBpc/xLcPyJCmGhpzD1Wn7C
 piWtjEcHoRX3kR4jdTQ6NxBO7i7929wRSWUMVc2+cV9piXzM75xtAwEE6
 G5NGjx7CLX9jrD9yUNvbEbmI1Ge5xRzItgtIZQhTgGeEynzG98nwLkt+T
 3qJARDf/ZafkhfCWl87DIzcaalgSDjrlTLpV4RPj7YVixcQwGZ6uZgDCg
 LDXhnO89cr4N/pg6ZIKRp8RaVZUiWJuwyA8VdguI8mzGYrQ4dNn5Q2LJa Q==;
X-CSE-ConnectionGUID: eDDSHQ46SA6d1u3IXYrr5g==
X-CSE-MsgGUID: PtwUABmBSbS0VFRwvdlQzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39348676"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="39348676"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 08:59:26 -0800
X-CSE-ConnectionGUID: XJfF8rg7S9iDkwUdIMkcVg==
X-CSE-MsgGUID: qs+FPc1GS4SWTZYHoqtLFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115354596"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 08:59:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 08:59:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 08:59:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 08:59:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNqbxjnpDpDKTVgHIg1Fqel1E3coMdmcj8zrVSzqH8aJnhusYDetzV5yMv4MlSJBGvHrT5OSNr5RnvM3m8LecPyhbSFXItSN8t+s36AGrYdZ+YEdjtIMyh5KaApsjAzQnHPagRoB/aOH52pwLdcAyZlcOV4raVuth5I4Vh4+wQdqQvxU7iwViAPq2h2g0FCeRr1Mmc7+GzSEM1blFgbCN+qQq9xKWSlyeYqe52ecgZEm47qmwGVnjTWVgC55nbWRf8UprM0Hu3RZWA4O+LYZ8xSe04lC+0cCWHy33tEz0cgZUjAJ1gAA5fvHH9xst24svd0N2iQwqfghmO7Hyezctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgqI/Jdik9C81NiOo7VkcsVW+QjgTqd7YPv/rWGUZNc=;
 b=dQaCg4uJgQTTzHsV5NPCjV8xJvxP3tnI3dOKXVRsCjz3byI7k6sosjRglIRbx9yloXxoWAk2tSSXdbj/gVo66Rx365SUGNlvjbjJAcVClS5jGAz1eB44jh4iAgqIZLacv3QROwcx4ft/zQwjJGgL76iS3/Lhl792CSsldazZq+CQY5t3VZB69JQSGDCE7Qvymp1f5ewH7mwoBTNXtfSRkSpA2VaTfuY7du8xtxii4aNwb/OgAews+pFNuffhBmnZqhP6L7tQVFE2qNpbqLLI6Ept4oHxX8dp1JqJrLN6kxaUTc0ZsapzlOdb20rG4L91Sn5RgVSVk1AlLlYOWoOsNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6496.namprd11.prod.outlook.com (2603:10b6:8:c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Thu, 6 Feb
 2025 16:58:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 16:58:41 +0000
Date: Thu, 6 Feb 2025 10:58:38 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
CC: <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: Fix uninitialized pointer read in
 xe_vm_bind_kernel_bo
Message-ID: <guahdobdjkqgkxiqmcabakdgtjsqhry7lfbfvd4yghbgqg66ps@u53z7leyikry>
References: <20250206134706.60200-1-dheeraj.linuxdev@gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250206134706.60200-1-dheeraj.linuxdev@gmail.com>
X-ClientProxiedBy: MW3PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:303:2b::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d19452-8aec-4248-5139-08dd46cf8224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kw4pNIxhqzJJHeaKW+pOt4YXV1xZEkYwtA6jmBMM2t7QXnIRu2qZ1fVG39Lv?=
 =?us-ascii?Q?QV1Uq4XyQtdIg+Bx8G1mdkJYMbMLstbMd9VdHfhx6vda/skhlWy/eT2kG8mU?=
 =?us-ascii?Q?7wptSWtl436mBi5s788fuOaHB8F7XTD8e+lRgnqSEiBD9IZeVRtP3Sf5kHQn?=
 =?us-ascii?Q?/1reKCzbtklaJCiWw2N5NOoIww/dXkOIP2KKmmc2HV9C3VoX90kH9N/cVJTN?=
 =?us-ascii?Q?v1ShZDS3nnqnm4Rsb1FV42m1Qz5CwhNtIYu5V9eTtAnr2H63OZhpf8sVqI6w?=
 =?us-ascii?Q?iM3dMIliTPCk/T+v5NnvSvnDhejMvBiNY0OPqUmporgGGYapt+5yTxMq4Zf7?=
 =?us-ascii?Q?lR1EBBHR3bDwtYRgM3IyUZ5dPEQJwJ57BORtaemEiiZvuqXZa+CGTrhNXBD5?=
 =?us-ascii?Q?ej0W29qGon2kBgciNdRGC5apOrxRLu2rFa6Ig2VvIEJWDAtyeI2Jbr8Yrnm/?=
 =?us-ascii?Q?kAIG3LiZHfGvTPeU+mLuZgfszbjMs7ZDO3joIy24xOncXwpqnlitVKjrHI3c?=
 =?us-ascii?Q?zGmp+lxnBfDU9OaRpeBwiaHwUmW/2E3coUJJz7fXT/Ke8Cj/UjLiK/KIe1P7?=
 =?us-ascii?Q?Ix+757zawAJ1pOhkhKmNFb3dwzGVonxQk5AnNVqpwc5uGa+Xhdd/ST9Fww6I?=
 =?us-ascii?Q?UOB1WSboydup5XWx8j2KNAxWCeHsJGmyiU6oQaYJ9LGBWvzdiDPhhe+96AnJ?=
 =?us-ascii?Q?iwbT0NTk8+1Qf6pkSSYvYs2yJHx5kivAF/UU/cw9eW1qVkWd4Q17XC4BVw+e?=
 =?us-ascii?Q?Dd36sF0F1NUAQ/xj50eEcmydXHR0RBNtZirH/E1/6npxIsg/Shpe18Z/HITY?=
 =?us-ascii?Q?bhYqG8zZL/bgM/L858ILMe5KbV+8rjlGquvuySyq+pGNXHvGfsLAuloQTwFQ?=
 =?us-ascii?Q?3BqR7W2fZ7glMcXSE7ogHCVP2tBrQjdZUe95rAjCBV0LzfgUgEtZnmbv1CDw?=
 =?us-ascii?Q?KiAUzFmVeBfettX1kCnxvDCy1I/tRkW3avSv/o5Bs4pvmuAT6nLL6UYz5gWH?=
 =?us-ascii?Q?aaoLhpFLYlbd1hTOBrSpYM0Y4QXrMK1qi3aO4I0ofGKVUxUY/bfd84rq+kRX?=
 =?us-ascii?Q?aUty6XM3eifXjQKqGylSST6/4TiY0MFLXYfAP6kqnV26cYvVEHJeznmgNoXh?=
 =?us-ascii?Q?9LHvLgDuINluv9DFJIDyRYuBQ22iKsxpgoaeLNPe3Knv1/F1mEFQ8nWrvJnx?=
 =?us-ascii?Q?k7gXo4QPG/V5bubwNixasuQhrS2WjgUl/cpyfw5ypKKXIg/wolAENl8StGkU?=
 =?us-ascii?Q?Iqw+0gkDUiRLpbKiaG/QjFdMUgn1avJwbnNX9jPZ5P4C4QeIhc7OsvPJhxba?=
 =?us-ascii?Q?lOy5xXpgOOYEYvuMiijm26SqYmdZ4JCEl6ijzWeOV962wY0J0ZH4P5JAAteq?=
 =?us-ascii?Q?M1w2fhGns4JNH4+LMiFcAQLHLRP9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2Mv59rcIvcoO02/2HUJ8YJ21NebfKj8WfxvDzdYrH0yz5A+/RuwyF63sGBB/?=
 =?us-ascii?Q?O/03OGn1uAKIbZa30Jnkz2/K22tMKzG9sTUqJfW0ewOZKVMhJ2IINDA/E1hm?=
 =?us-ascii?Q?PJq7Yc8BVI16mxCMisD3njBb0QINzIlu3cqs71hFFGFGaIPe6HWVBmpeXwGV?=
 =?us-ascii?Q?MIhSiiWAdJXjgran9Ic3ekQSxyT4fSRFYHU7PkFhTl5uhsDVsKg+FdIWRtBC?=
 =?us-ascii?Q?2yz/RT1/rJULszv+lGzcE/uLrUvHsXowefotfM1iRhp75GkvA8Pa5CWBYjeR?=
 =?us-ascii?Q?sluLlnxqbPBTeIb0IHO4S3YU2anyty5ih7ihzpHKBtkXc1aAsX4cAHRFwI8+?=
 =?us-ascii?Q?DstTadTO6cXw+I0JjGr7VB80dYG/3WE6lSLBsSsecgiSwwwl3j35gv7pane2?=
 =?us-ascii?Q?lZGyEGZ75gVEohPo589vavMM9xSTmP0M91N+1poPZuxFMyCw3LYKxgfA9fDm?=
 =?us-ascii?Q?+OXBT2Ne0tDjNbJhnalFT7GP15D666GB0BwdOUVgoPkjjHODcRStytupUncU?=
 =?us-ascii?Q?ZJxbCT0/xFyHj5vP5CVn8U1GRwJo7IyXOfXWY5LqohQbG6yz3uEzMXGKzRIn?=
 =?us-ascii?Q?BJiDhTYmF9Q2Y99sRn20JaMVp6FZ4LApr/A4TuTgudJmVshnVYen4AxJjxfg?=
 =?us-ascii?Q?xVFUNhERDftVLr0k8qhCeGV4SUC5b0EiVwT+riKI9vXJSc5ZIXVJl6j3q8R9?=
 =?us-ascii?Q?q7FTELYx9KOSb4AbxXcJ2IaJP5PVso4roHw8//zyrtxxoFl7eI0Hm89oy+a3?=
 =?us-ascii?Q?RRmWS+HZhowhN80jY8sz/gid9UWJHp9gt9wmAx5p3VKMpl/If0l6QYDqzZnI?=
 =?us-ascii?Q?ziwcMTaPeF0I5I4V6BJCBtEjgi9XTmaNwi0L4AXZSLxhmDyIiMIkdwDPu3jb?=
 =?us-ascii?Q?oq2XwYHDG+Z67/ZmkwzfO2xfp2bIqUYOfq+DVuq5hvVIM/VZ/Nm2rbTGfXnk?=
 =?us-ascii?Q?esRhg2xwmBGKj+vdStDa2d0g3U2LrxbkgmEtHVx8ye/mKH4awGp1V8Mioz+Q?=
 =?us-ascii?Q?2wVIwpOV5W21WFyYdlIkfnMJt+yAI+ZLNbuK8Mn7dFxL6OfAbL+YrcZhyQcg?=
 =?us-ascii?Q?dztoRuZz1fFiq+hZ+jrdLysz1FIHasD9qFWwY5QzFWlrplJxkTkzsLy3/302?=
 =?us-ascii?Q?P0x0QL6wAsB7fyekTxtxHEIzliHWndtXU3+D2G18s+gvh8KLRrMEICE6zz9g?=
 =?us-ascii?Q?6bKtFWKww/T6jBD/tD097KC4C2Z896zujUn9zBz1jxf/w794yFt3030ybEYD?=
 =?us-ascii?Q?xGhb0jqofkqrnrMrVu1ZiiR6YTi+y3G0YW64LIlZPLYUbcEeBJceMSD84X6H?=
 =?us-ascii?Q?ezepkuMKUQrxiPtC3IenI/PuFSI3D2IqscAKDDYSWcqSQfVZ0Q6sewQZ2pJv?=
 =?us-ascii?Q?PySyW1ITOK4s7o1YSAzighgIdq6ROHfb5XHpe8FLN4XI+QAwAQc0Sm1yjDej?=
 =?us-ascii?Q?BVladicOJk+dhb4jZq5kRm+a6v6ACenSS0DpAkWOYisHE2nCfYAJVgBod9K3?=
 =?us-ascii?Q?zO0Wbg1Kg+jo8KB1sEvfDQfjtFR1lDTNDW5wfsM187sjSsmHvZbkVQEKd00c?=
 =?us-ascii?Q?PRVflbTI+gGFwIro8ezGB52Elma80o4ETqYmBNmFIe+yt9KQzbEYnmH3Adjh?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d19452-8aec-4248-5139-08dd46cf8224
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:58:41.4013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njJ7wMOuTv/b5HlJUGVni/RLYEvfOpM+hXN8x5Im7ah1uaQwsYm1TKsbEaOsv8eh0hwn2IJmDlb2OgRc/KO0O+rTlTIN2POOEjXgmenNxZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6496
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

On Thu, Feb 06, 2025 at 07:17:06PM +0530, Dheeraj Reddy Jonnalagadda wrote:
>xe_vm_bind_kernel_bo() declares the variable fence without initializing
>it. If an error occurs before fence is assigned a valid value, the
>function may return an uninitialized pointer.
>
>Specifically, this can happen if:
>
>- vm_bind_ioctl_ops_create() fails, leading to release_vm_lock error
>  path

are you actually seeing an error or does this come from (static) analysis?

we are only on the error handling path when err is set to something.
Using your example:

	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,    
				       DRM_XE_VM_BIND_OP_MAP, 0, 0,  
				       vm->xe->pat.idx[cache_lvl]);  
	if (IS_ERR(ops)) {                                           
		err = PTR_ERR(ops);                                  
		goto release_vm_lock;
	}

all the other `goto ...`  before `fence = ...` assign err, too.
On the the error handling we do:

	if (err)
		fence = ERR_PTR(err);

So I'm not seeing the bug mentioned.

Lucas De Marchi

>
>Initialize fence to NULL at declaration.
>
>Fixes: dcdd6b84d9ac ("drm/xe/pxp: Allocate PXP execution resources")
>Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
>---
> drivers/gpu/drm/xe/xe_vm.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index d664f2e418b2..b6ca53ede904 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -3184,7 +3184,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
> {
> 	struct xe_vma_ops vops;
> 	struct drm_gpuva_ops *ops = NULL;
>-	struct dma_fence *fence;
>+	struct dma_fence *fence = NULL;
> 	int err;
>
> 	xe_bo_get(bo);
>-- 
>2.34.1
>
