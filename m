Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D07A5710E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 20:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D961010EC2F;
	Fri,  7 Mar 2025 19:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2M9GzWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554AB10EC27;
 Fri,  7 Mar 2025 19:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741374313; x=1772910313;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Nm2BIE8ttgu5hsoT72L3OfVttFaBxq1sofs5dZDbYQs=;
 b=m2M9GzWSng5vNCmBzJa8uCF16vJlRgOD4QaB9qLc64CuWCF8O87tmcRg
 h7kdwsAi7NzAyJdqwj8gBXlmDr4YcVTu0leyLWeF7l/Xs7ORqjIcfm+dZ
 lewWvs/fwp8viFOlZ+djoUEL4AJjO/j9MLGf7D6fbPN73tiD64T5aY8rf
 Y+MKbDvobxAnTUODE7jcuE5K97ehpukjbXr9Ct3EaBX+A5A29kauwUihE
 tTE+7TRfwrc/OA72ru+nuiJOSzZJ4nPa4F3QIyRdvBeQJTr5KYFLOaKWi
 Su6dvxn6utItf6QnMv+6wIotIV6Fh/XuPp8SS91qqwj46RhyW01QkAS3i w==;
X-CSE-ConnectionGUID: j9zRinE9TIqrfP+HpQ78CA==
X-CSE-MsgGUID: zWYyA4yTS0GYQEkdeavv1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42468750"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="42468750"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 11:05:11 -0800
X-CSE-ConnectionGUID: md3v2krMRHKMjGkEGrJGUw==
X-CSE-MsgGUID: m6Tz4pyESeuPDgfGzZm3GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="124002434"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 11:05:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 11:05:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 11:05:10 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 11:05:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovlrw9yhDoLCKjmAW5A/B+3vdwdt1iOadrw4b+SuV57at+cC0DKxCdalr3K/kEzTcEmUqghu8b6AATUJ/+gAJDqzxGM+vsOlt2GONzkUp5nvEdZIHPwsbFewK5rSvec0md4sB//aCdPJTvKLn032u9sTqS/k818TlXf4j1BWENYSblYtH05KC+dp4gtZHt5ZXwP9GqeBQPph6H3rwZOm36rx+f8y+LO3GWS1vMDDhJbZ1AJsSjBD27NBEm0CpvRfONT36KH8OV8Tx8ndooq+lRBnK+f8pOQqmr8nns1yQRj30t05pjU2f0KsJJ+h45Tt58tym56wS8KOW6KVChRdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nm2BIE8ttgu5hsoT72L3OfVttFaBxq1sofs5dZDbYQs=;
 b=yPmyxgHaYtRnSe5szu0HIfxZJPag7h7HRnkxEm7V2+YMy9aE2J1VXC0dHZO/fMQ0c5ep5nfgCon/DJVvR6fFB1LlbHh9v4L2IdaPFqQHF9pjeCP0xWQmwaTmWKXOK63SelW9H0dRhiwAwI2IJYQCkLj1L1hQC0+cq/FEUcgeTzNP+7bM3Jg8rObsIazx8QFss86kYhQodl0s9OWDbIo5blePPjCq0GiA7mFO0RoGBU1bmSKz2e/h3MhyAjc946KA1Qj0vCzPV9AzM37+TYjcEvFtycn9KOurt5m0+GIuPdem+8gDIpPb83iVUY2FqDVsLGUZeabHzpp1zPlKZQqcfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8361.namprd11.prod.outlook.com (2603:10b6:610:172::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 19:04:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 19:04:54 +0000
Date: Fri, 7 Mar 2025 13:04:48 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dim-tools@lists.freedesktop.org>
Subject: Re: [PULL] drm-xe-next
Message-ID: <rzqk5wbntjrgp2fzybtzs7avnn7vowusg5ehsoxhvb77ehamun@3h22bhef5ssg>
References: <ilc5jvtyaoyi6woyhght5a6sw5jcluiojjueorcyxbynrcpcjp@mw2mi6rd6a7l>
 <dzpjpp4ctdgbar6t7rcnlm5id4prs77koktzhe2sr5iyjwwl2b@3w3fom73utv7>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <dzpjpp4ctdgbar6t7rcnlm5id4prs77koktzhe2sr5iyjwwl2b@3w3fom73utv7>
X-ClientProxiedBy: MW4PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:303:b6::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe80980-e07e-4890-f7d4-08dd5daaf222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ABL+uHcrkx4Sri5RQhL1zgeq3bm27uBqO6zCzx+83CKDXm/AR3YPuJ3rPgZJ?=
 =?us-ascii?Q?lBinTRoeoT4+69RCKS6UBsMYaxVxyRJbceZCgXV9j2OgDxK6VxiMC4EO2pkX?=
 =?us-ascii?Q?KfldmaH0aD2J466AHpItuVYIy+I4419rIFM7YGSbGZcPcswKCKcmtbgsh0CC?=
 =?us-ascii?Q?UKZqFoU8QgI3N2Vfz/p4OQfWBgZESPqZJVMug8p6imMbQb7flf67ucDsDLWO?=
 =?us-ascii?Q?VDoyFU8gKWnuMDFR268udTZekjeFNIIW+1e4P1zJ/QEglEfs6MaPPqjK5MG4?=
 =?us-ascii?Q?PbJURo+gpg9zNyfABsJnn/eHh4DeDUTSpUzuhd5K1tNEUtADDPWa+BGLsK3L?=
 =?us-ascii?Q?A7a8/XrPEaqNDUKrTVAOMU4A5+1riBi57Bf3hnnYUM5t8C2u5xl39eYNNVba?=
 =?us-ascii?Q?12YmFOBdfEJOFsmZhkuVg5ABrJD0f0vzcObagg2py3nxM/DEKl63l6is0w6z?=
 =?us-ascii?Q?zTqr7vC1Y0pGyYyyTSsCYPz4NK7Xv2X/1P6/e1ieZ7RekGgnnzT4m7h5Zubh?=
 =?us-ascii?Q?mJExlhZX2RXItwD7GuF4VgdVXzx//DniGlKk9GF+aJE+zeZdc9SuE1ubnpi9?=
 =?us-ascii?Q?Kmu+Q6lO0SEQ7gMipwS7+6rPZbM/XqGocEN5QiOJx90qDXFWfUkpSGNKWTC1?=
 =?us-ascii?Q?LeJll4ZfzZ9Lrk35ukCygzkmzQlvymZ1hyGUXDhp8W/Z9SL5inFrHXUarCQF?=
 =?us-ascii?Q?A0xW8ha8pqT10xfi2Eje3jRXmuBE33AnSWEJj2IC87LyULNkDpuGeTX32TmY?=
 =?us-ascii?Q?6584OAg6AR0xgiCudDUffA6fJ6EPiNW4ybvjAKgQBLAausqcGdDDD3GYK0TI?=
 =?us-ascii?Q?/TkuN+OSsjqEVnCh3jWyqTLOFY38zOzbz7S+VscVrI9A1uQyBGNCsNrdbeU5?=
 =?us-ascii?Q?kevQssBDDrIN/ARMSx98DjsBrPe7TPQPwtUy+tZEQN43QxPD2s0zPpdwQgne?=
 =?us-ascii?Q?Pmmrp7Q1ozGnvh4JqIFf12vyLI5uLjfDoSNXDn4JJ7iGzAKcHbMoDC/IkXJe?=
 =?us-ascii?Q?IvTN1LrugmWcP9y/qH2SNR73RAHnHB1imPiWhw1YvnNCpYkNr4nC5FAOjCex?=
 =?us-ascii?Q?oSxEJzZJYbSjMppkxt7l02sbXgQ0P4X1LqgAy16JWLaTt17K/mvMPiK7ktHf?=
 =?us-ascii?Q?XIEJxzljb22qa1sWuLDBqqRX3bUFW6midtREPC9PzxRR34aN4WkB38ghOSUW?=
 =?us-ascii?Q?3IUvN3JIGf/EpDiSbU4acpBxkNB1G1sSHFrwAjCqF2pl5c+eXWVDlx40JJ+u?=
 =?us-ascii?Q?Kvz+gb/8MPRFTHdYaop4y9rZzugpcAXS+8c9mBizWEITbA8jGh2dpUrFIVmn?=
 =?us-ascii?Q?LcYwz9sUPX/bnFltYwvcWbDGz12bqbEQp9TN0J/gY357SOUdY8oFlPxTGT2a?=
 =?us-ascii?Q?HxyFGiysyPh9ZoRFdnEyqylnrXu691pgAJ/tJUQwRFgnQLgOzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tzhOobg5uSneB5zoObKIk78z7OrwMQJOFgStV689m5lE7NCqw9C+r032+Kt+?=
 =?us-ascii?Q?NJYPV0Gc4mGLzTMAto5JEu7uoQHbDsXmVFhhvONgK1XzkdbhuSsPLhEKhkmO?=
 =?us-ascii?Q?KG+ea7Fe4TPZzSyXnHBW/kG6cItbo3YCRK8i4T1dbUwjV+fGm8vln22+t9Zi?=
 =?us-ascii?Q?m0wOHiTmewwb3HZcbnMqhe8jLecQMq+oiOcrYwmxQWOS0y+TJLcyaW/k+nXv?=
 =?us-ascii?Q?mT5ThbnWy5KOPNn0SUumEHFIlMr63s4DsqKc0FkPhHVsOqGUx7vuj25T8+ZT?=
 =?us-ascii?Q?377HfjYYfPLN+DOUYe7ltuPVHFBhpz1uqCDYgxr4GNO7drPsijlS1STM8Sh/?=
 =?us-ascii?Q?AszUQJ5QiA7nJA7BX6+sGf7WWPIFKDsXg+tKKJQ1encJE9DzQMdyciziFXgb?=
 =?us-ascii?Q?UOVLDUpSttaiqB8+y+IAShVKcztdNf7raZ3JFPdilaxIECXc3o1xzah+V6k/?=
 =?us-ascii?Q?PEjsb0vVTIzP0eOzWnYnqtW+mCpxqgpqSO41U3A2p+Pv7CVmCH+p8pOaqzYo?=
 =?us-ascii?Q?LsH9mkeVd/CAv7+nz8brxaa39sEa9Q3lbWC5bKhaYebFNUvYg79vAEJPGTTJ?=
 =?us-ascii?Q?B1myGAugJB+vgFhcbPhzA1fCUFBvO+rpkeDZ2GUCo+NvbQfqQWCM6j8p0D8D?=
 =?us-ascii?Q?KIIneWzBsyEeDWYjpR1WxXbyqEE5qj9COOrjk2zKlBTkFO2WxTm3J2/tDNiD?=
 =?us-ascii?Q?+yAiHR2QUKpqtxirhwgjZVhD+baSNfw+XwjD215DjEBvGWZCpvDomUl2XvlP?=
 =?us-ascii?Q?s5jhtDP9IgR+H4x2P3SmOeG35IS3iqN5D2KFoqymLgkSnH4jgqBtX9xHUAPY?=
 =?us-ascii?Q?JDeuRAwPgzU5U95XnFf8voZKZXzlM0u6++fPgDU2BoShcNrnlwzGI390Ljkg?=
 =?us-ascii?Q?GisvL6S87raZxLNnOjNKWTvvn5T6rAfg5knDKFG26pgdohbGSdl590ZsjBUq?=
 =?us-ascii?Q?UEARms7Xe8raQJf5hRvQjM6yIW4uFTafHl29y/QkzpIVxOEmJqImSvPd7SFC?=
 =?us-ascii?Q?wJiKFoSrCpqAjsCRFBpTGXMNj+G4LeCkQup9gohnZKhNfA0x0PToN/OiE32n?=
 =?us-ascii?Q?s5anegXST5Y3DLQOYwXliFC/POiZm04UEDyM1/06RWCPUjqyqvGQdbM0lyaz?=
 =?us-ascii?Q?/6y3AZacOqubA8GU8CGzK8Faar6JHuT56D2tAxtIhTVpmvtJpr8LsiR0QJjQ?=
 =?us-ascii?Q?k2GuYENMKDpWieHrcX+e55q4/KfS+Ou6fegmuQeGs1Z8gfmlno891v57HlMI?=
 =?us-ascii?Q?OKwVUXoq5oFwrfs6QVUYkeINguA1rf+WLOpKW9ypQgSBjbWk6eZa/gdkIO2S?=
 =?us-ascii?Q?rL2tCVIoJ5bI2fX6/Zc5tQLw92IvUCZ0s4duxCw6/aGUZWHS91oZTR/QTiWl?=
 =?us-ascii?Q?2WMYL0jHsB/Y93qdaaN1sdIkp7HjH0y+U+8ZlfYq/Mr1sfZxEOm/LkAzX64Z?=
 =?us-ascii?Q?Y3LIbGMM++5nE1J3Zy3TyWKGlvfvLJWW+6Wt5fdO3sI95hTGcSw+XuGKL9yW?=
 =?us-ascii?Q?pHu52JHTFLeal/yQhQSf5Vn5BBRdWxmcMe2uzNQhV3jfQ4jfbkKu3jpa8pyk?=
 =?us-ascii?Q?0dNsH96dZLQXnnW0qNqPJAJAEg/MUf2riFsWkFr+/EBrjLYtkIFgqi+vxCgy?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe80980-e07e-4890-f7d4-08dd5daaf222
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 19:04:54.6690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DFDNkm8nj0RuZPwKcJRlumg2icWWOUanBayLkafr3CQBWaN2lpWcXsUuHqwRlH0z7Gw+DvFy7ayhNS5SAeXjQVE07KvXPItJ44/UBCR0XM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8361
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

On Fri, Mar 07, 2025 at 08:51:03AM -0600, Lucas De Marchi wrote:
>On Fri, Mar 07, 2025 at 02:02:15AM -0600, Lucas De Marchi wrote:
>>Hi Dave and Sima,
>>
>>Last drm-xe-next pull request for 6.15. It comes with some big features
>>that we have been working on for some time: EU stall sampling and SVM.
>>The latter also touches other subsystems and provides the common parts
>>in the drm layer. Low latency hints from userspace to improve some
>>workloads and more events exposed via perf complete the UAPI changes
>>for this cycle.
>>
>>Another cross-subsystem change is to drivers/base to improve devres
>>handling. Fixes, workarounds and refactors also made their appearance as
>>usual.
>>
>>Worth noting 2 conflicts reported by Stephen on linux-next. One is a git
>>conflict and the other is on build:
>>https://lore.kernel.org/intel-xe/20250307122954.1ab65809@canb.auug.org.au/
>>and https://lore.kernel.org/intel-xe/20250307132112.18b6ce90@canb.auug.org.au/
>>
>>These will probably show up when Linus merges drm. I checked the fixes
>>on linux-next by Stephen and they look good to me.
>>
>>thanks
>>Lucas De Marchi
>
>Please hold on applying this. There's one fix that I merged just after
>submitting the pull yesterday and today we got reports of kernel docs
>failing. I'm fixing it and will submit another pull request later today.
>Sorry for the noise.

ok, looking at the 2 fixes again, they are not very critical and can
wait next week. No point in rushing them. I will let them soak in
drm-xe-next for more time before sending another pull.

Plan is to send an early pull next week that should contain these.

thanks
Lucas De Marchi

>
>Lucas De Marchi
