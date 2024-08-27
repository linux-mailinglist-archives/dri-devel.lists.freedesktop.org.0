Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDAC960026
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 06:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4893610E15D;
	Tue, 27 Aug 2024 04:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktsz8III";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B8D10E044;
 Tue, 27 Aug 2024 03:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724731199; x=1756267199;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5BHgKCwoNX81KLi+Tp53KHY3MHxRwZTbTKkA7OwR9FI=;
 b=ktsz8IIISdo9jb321gymM8Qo0cJNZnx8RMo2vF9zdP5aa4xBHxRFYiOa
 gcGA6xa1n2UxnA8cFqyJbY2iTdH/JI5BT6zFY1UX4JDs69dgt5fRNl1pU
 39KlVCjQRuGyQQgC6MOIVJ/S3hrOvsPWMRkySwd7uP590U7eHKqyK4U7m
 B63+j67AiDCwZ7iYrH97pqmjr5v/UJkDThK/jvPZ3EkHDCC+fw5FlIYb7
 hUGLGwMhOQrxP/Vr7/ollXxiv27oUw3HNxeZAJ+WYMjooOWuBa3wEgb9M
 394N5/xunTxEqCGRz9zsCdxn9UFZq5r/xx/IYrCWHgmFkAr9DL510AvVA Q==;
X-CSE-ConnectionGUID: GEKbR4npQ9aSlcX9c8ZiAg==
X-CSE-MsgGUID: 8G02SvV2SOqdFOodkCNyJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23055342"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23055342"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 20:59:59 -0700
X-CSE-ConnectionGUID: d7uLLEGRQQ6RRNpV3uOIbQ==
X-CSE-MsgGUID: Xr37euO6TuO3BaKUf3IiIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="67614619"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 20:59:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 20:59:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 20:59:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 20:59:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4F+tt9rXUdtjmwug9Se2vOEISTJNWNvrcJUVwBqevM0y5dypFCWXqjaxaWA70aNAk6UKZmvn+T+KhSTjuUrJalbnFKVYz6YT/NfBo+C9klAW/jbLY9yX1fZDraaukMuXG15AGKZ9XScyatMpONH8FjL5NP26pmn1n7EWWTMiuzW2lmbnSA6XrM/plPF6FEaFgOcgclhDEEdA9o/GP8IB98VG0GVN5OQdso469688zyZfiYBZQAE0jg+qXXpiGXA0A8JGH0ymVGIyglaiWmLvtZvNzU28jQIGyip6dLRMEtrUPqhKsT1BK0UaCI5QXrenXuBpxPb6ji2ZC2/6TQlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdz8WO9n+DVgSSmsqTWkNvtRDER0n1seHA0T9HfXceQ=;
 b=xBccE+T47ro/un+MQQQ8+A9IH7Khz2sw3bCoM5CQgH6rHJsVkGAZTIXVXVqAJ63oPytaPsQ351TVfy2r2lTLHFtfV+dK8DGF0WFgmGEB+9VxG+byNU7fquqrUi5mSukGUjS6W7qrRfEtYnhDAsW2ksnRzfSiOLdwwLGrJ2mruQNlm4wwXsR3yYUeOezhv8nkdpYNROnLUeYe3wQa7fCQrsvRohD1cHuEnVQ5PNCUgWWI3FZz5wFgVsls6naXrMDy6D7XEwV/3IaGxi9x904NW8JptBjd1lgv1T+jLyAUZsjKt+BhSmRFzfZdhvq1BxXcvo3JTYEzW2pzypwJPpPDbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7069.namprd11.prod.outlook.com (2603:10b6:510:217::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 03:59:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 03:59:56 +0000
Date: Mon, 26 Aug 2024 22:59:51 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Gustavo Sousa
 <gustavo.sousa@intel.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <rodrigo.vivi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Daniel
 Vetter" <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/xe: Support 'nomodeset' kernel command-line option
Message-ID: <wyulgaj5eu7nefctyr4htepihk2hxv6qvghma2r6czlr75raf3@3t7vvv4fhec7>
References: <20240821135750.102117-1-tzimmermann@suse.de>
 <172424976000.2071.18125280900868355577@gjsousa-mobl2>
 <87plq23q6m.fsf@intel.com>
 <35a03177-28a8-4d8f-9e56-d48298a4edab@suse.de>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <35a03177-28a8-4d8f-9e56-d48298a4edab@suse.de>
X-ClientProxiedBy: MW4PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:303:b9::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 3627370f-1252-4d4c-2ace-08dcc64cb65b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0uaeVigAnxS7lS4qxnmQhDSIFexCIcVi94uJkVQ2++vYtYFAdi9lxjIwhhCD?=
 =?us-ascii?Q?HJ1QCOYSf85XgW4M0YqiibrGRWrrSGYdTSUTTl9uffpctrneO1R4iORMaq3V?=
 =?us-ascii?Q?bodoR3rG8IvW/zeaZE3hcyMq7xz0kmOoLKT25kJ4it+9B2ZzTrztzVBKg8Ou?=
 =?us-ascii?Q?QhPpYHY1YPRhNG4uZAun56wK+qhlvfy2vQrSgpoWessQdleBV1jwfSaSnO61?=
 =?us-ascii?Q?ByQuYFCtNTPxCPwUDLxTk8rDRXGLfF2Hk3d7KGBY5EbfGJbLJbP9TopiFgjp?=
 =?us-ascii?Q?r/cQvwfvGoShaNy6qfXXwGzVpVa+2mQ99qfB+9DwpDXiHj58/j6uk4HmUexM?=
 =?us-ascii?Q?GMOY6w1LvCGIFvZ7wlwCkLxpO7LNY97Y9/2rBb3VRVj/KQgWF6AysOFR4E94?=
 =?us-ascii?Q?SQUTmEnz9qt6w2sqYphSlKt9h0sdnJ1vr2Dpt04hm1nYsGJEiIM9zzx+1pyo?=
 =?us-ascii?Q?atQh0eRbU5FAiX7atPOixjJMVleXISauLNLiatmu8Pvl2zewaYB/tzT61Z/f?=
 =?us-ascii?Q?NaATsrB2Sp48zp6s2gpSjdSR1a7rnFTsy7LQPmEw7vt9wecGRJruoixubxFt?=
 =?us-ascii?Q?gTpr7jgbgaZW6vMbR68XP6yQpDH+tL9u6xm2VJN4RvDCDKcLOx/FcxoOBJl2?=
 =?us-ascii?Q?cwaTpdJsN4L95NM/waJ6V7KGsrINVQ5eBcqH/5fkjt9Km2lZvgmTv5M5JlQk?=
 =?us-ascii?Q?GxLE/A72ykHMQYacKS1ZBNgNgU+jC2Oyy55jMKT+vOTlX20weEUHKTKflAT8?=
 =?us-ascii?Q?9oemhwoK774kL2TVn5YZ0enS1atAb4j9imLOlLoWX51CreiMyQE3kohOcrDn?=
 =?us-ascii?Q?ooN6iGS4fiHGGSNyRqRmXuWaNfNL/VaYKTJIKujJLN/cBnTS0ixCRIjqVjbM?=
 =?us-ascii?Q?2US+XQy3x3cACt+oZh+FMWdHFzMdI2bP3LxjYidMtNVq8RjioqL63UXuSQPD?=
 =?us-ascii?Q?Dqm1tA+voXUjEWWXpyb1q+OX+N9HqW9YuUfk3s9Xxv/UvR4AmVrdjArmzcGO?=
 =?us-ascii?Q?+AxeDEENwiG+vS06Hj2kMFY6ugfyCGFNG5rfOe5uoXe8Jg2OErR2LWxwkmgG?=
 =?us-ascii?Q?oO3fo3g6V7Oj1Vu2AfORVtLYtaFTJqYs4cQb0l1Zq85LZgxkn5OjqDnQNCU5?=
 =?us-ascii?Q?V7maTYXUhcnO++UlS4ddEvcUB3rRss0zIJRl1FFwOLoeSCOITH14xuqCesLL?=
 =?us-ascii?Q?zINtPb7t/SJ4qIMIp2BpM6JkpCMxVyJcOsRWa6ECViM/eZHBzj68Osqoxn15?=
 =?us-ascii?Q?+iwm4qZWZXy1RSDeWtrguQJJBBkYqd3e1U8gX3TwM9cXQSg22I8j8tJqX9jw?=
 =?us-ascii?Q?8hyyTnQaMsoB1hG79NjhzSGNWf5OULMWYW7l05sVKKIF/Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?00q5xCNVlF3Pl2fAwvUJNNfPq6oVMDFCVa3XMu8v13VnqwUV11bcv+YQXvWD?=
 =?us-ascii?Q?9rtSom4uWece0Rr6reovGFBPqyWeaTMJxQI5VjjVYXM7E6L8EGD8EYqrR/Kd?=
 =?us-ascii?Q?DxWS9loqgWjwJOD+2CuCpKP7awNcPd0nLscZ+GYLEEePr5iBoPlt9iKG9DDu?=
 =?us-ascii?Q?rNAmo6HHHgnNaGhUGuhpKCewuQ1yGAsUKHNia7RM754QlIevnIzWvl8dS8cI?=
 =?us-ascii?Q?VFZa/OhbNtwk4mnJqeqqwxML2xuYTz4Y26efBrIudX/Uf5uRbDaA+PqmuY+O?=
 =?us-ascii?Q?X/mYaF5nOLheHuLkfvO3UVYTwjjxLKI7385ictU6aPGD4XTepRjDV7e1OImT?=
 =?us-ascii?Q?bUTkS643pGpkb7za7gjV2cWx8CdHshKwykmHEftiOJDXzcpzGJ6tUXGAk7zb?=
 =?us-ascii?Q?3mt4fKKQofYdlpjEsqxztFwxwwFnH6aSRxWeYKwvDmHRmwBY3v6iFWu0rUMF?=
 =?us-ascii?Q?nIfGJ1EbjBMWm5wIQ7nSh4p1VMShltmaKEJldPIf4DrcCoaUxCHtnYM5hlmi?=
 =?us-ascii?Q?Ac+QG4iR/wLu2HLJwTyLDcMXdiesPw7koRvw/LeKk609TP0N2LuqtiTt6EZX?=
 =?us-ascii?Q?9gsphggKjKcpnCI31MllvutLH5FUKLXH/6FBuJKHCsg0ePbR48BKmgKqOMRA?=
 =?us-ascii?Q?Ljy9IsS0ur5on+dck8Zrj24GrXhA1RZLuTLq376xQJdRTP1p3n8LIa8QKTAf?=
 =?us-ascii?Q?zi+27mbUmSxFRI3y0fXVDAzkSlzyLfkED2ikughYh4ezbA6aXUJgUIm26bPO?=
 =?us-ascii?Q?XQofecyOKBrCbYxNTUOr78h00IcvtXYdLaRlhAaYzMJt39LFQ58uwBZl2Pv0?=
 =?us-ascii?Q?lZjZRSCQrCtZ9cc5S6ri6RIq69e4W9ySWeFgCnIy4/nV4lK0HpGy5j2tapcw?=
 =?us-ascii?Q?r7KXMeTR9cPqS7AMiUXI68cgpQk6FMFpRqprXWOtUgcvu339A58tEx6QQ8EF?=
 =?us-ascii?Q?RK9hUpQMjObpfGZCPtrFzGqdveAsAbrxwUmX2+zORzZScIQVZInzTWdXWLNJ?=
 =?us-ascii?Q?/ySOHvX+/Ak5Xu5ZZE3pjsoX/APs2poJK72doj/21ex+5Mf1HW8Bwd7SxxFA?=
 =?us-ascii?Q?J7QXJ06DfEJh+zp8+05HkMh373IATffvC3r1EsK/FASKermApPW/cFIA/ItD?=
 =?us-ascii?Q?bkcaps0vaqG2OUdkila9/GHNPYSA0NkvleUUYHjbwDtOyNsa28wU+YC2QVFE?=
 =?us-ascii?Q?ryNYYRiM2xQSFDT/GUnckt8kIvsTrtm5ALeG6652rVE3ubDIgnF/fjILQDeO?=
 =?us-ascii?Q?Qnd5g27EEn9jl8h0V2yCuW20J4GB0NuJypydKVCttpL1MFJaP8oRgiJXn7A2?=
 =?us-ascii?Q?AsydGbxeJ7nNoM26MRvPVkN8ljPgO7x671M8qyWHXYvXthj5MQY/cRGN0bY0?=
 =?us-ascii?Q?RYl6hpFOi4c7xLj4VbsxM1TnH2wQdoU0xCl7DmoD7fCBaBkgbW5azr7IkAtR?=
 =?us-ascii?Q?ijlXkqTnd3D5DHCwn6YLZYCgbVXH0dpdvSoQPL30K9GYltBYY8xWpRHYDvCB?=
 =?us-ascii?Q?D8oxv3yHNELMeFO+99KSlvHG2lEh1VMDEGgs8t2EuzII2aGsUp7S2k78B6xn?=
 =?us-ascii?Q?sVC9iPUE7UC/nXKVc6jH7NHykeDsKTPHWWIFmB3jq9QUxYMvLiDvRYChXkZQ?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3627370f-1252-4d4c-2ace-08dcc64cb65b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 03:59:56.1031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNjPfPpDU+Ie1R5Ozuc6ItT4C7dINZZLwkk5S55lX8HeC1y5dWTajdOycAaGvAKZrleVbcVGMSQ61P6S0yAnmYqRlAFlWREcTAjkByt1D2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7069
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

On Wed, Aug 21, 2024 at 04:48:23PM GMT, Thomas Zimmermann wrote:
>Hi
>
>Am 21.08.24 um 16:29 schrieb Jani Nikula:
>>On Wed, 21 Aug 2024, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>>>Quoting Thomas Zimmermann (2024-08-21 10:56:59-03:00)
>>>>Setting 'nomodeset' on the kernel command line disables all graphics
>>>>drivers with modesetting capabilities; leaving only firmware drivers,
>>>>such as simpledrm or efifb.
>>>>
>>>>Most DRM drivers automatically support 'nomodeset' via DRM's module
>>>>helper macros. In xe, which uses regular module_init(), manually call
>>>>drm_firmware_drivers_only() to test for 'nomodeset'. Do not register
>>>>the driver if set.
>>>>
>>>>Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>---
>>>>drivers/gpu/drm/xe/xe_module.c | 5 +++++
>>>>1 file changed, 5 insertions(+)
>>>>
>>>>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>>>>index 923460119cec..60fb7dd26903 100644
>>>>--- a/drivers/gpu/drm/xe/xe_module.c
>>>>+++ b/drivers/gpu/drm/xe/xe_module.c
>>>>@@ -8,6 +8,8 @@
>>>>#include <linux/init.h>
>>>>#include <linux/module.h>
>>>>
>>>>+#include <drm/drm_module.h>
>>>>+
>>>>#include "xe_drv.h"
>>>>#include "xe_hw_fence.h"
>>>>#include "xe_pci.h"
>>>>@@ -92,6 +94,9 @@ static int __init xe_init(void)
>>>>{
>>>>         int err, i;
>>>>
>>>>+        if (drm_firmware_drivers_only())
>>>>+                return -ENODEV;
>>>>+
>>>Hm... But what if xe is to be used only for compute or render? Shouldn't
>>>we handle this somewhere else?
>>The question becomes, what does "nomodeset" really mean here?
>
>That function's name 'firmware drivers only' says it better than the 
>option's name. We used 'nomodeset', because it was there already and 
>had the correct semantics.

agreed this should be on a module-level to maintain the behavior already
used. If we were not maintaining that behavior, then we should probably
not use "nomodeset" and choose something else :).

Also we already have the other 2 as module params:  probe_display and
disable_display, with driver still registering as a drm driver, but
leaving the display part out.

Thomas, are you going to send a v2 to use the init table?

thanks
Lucas De Marchi

>
>>
>>See what i915 does in i915_module.c.
>
>i915 and the other drivers for PCI-based hardware don't load at all. 
>Drivers for external displays (e.g., SPI, USB) ignore nomodeset, as 
>these displays are not initialized by firmware.
>
>Best regards
>Thomas
>
>>
>>Cc: Sima.
>>
>>BR,
>>Jani.
>>
>>
>>
>>>Taking a quick look, xe_display_probe() might be a good candidate?
>>>
>>>--
>>>Gustavo Sousa
>>>
>>>>         for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
>>>>                 err = init_funcs[i].init();
>>>>                 if (err) {
>>>>-- 
>>>>2.46.0
>>>>
>
>-- 
>--
>Thomas Zimmermann
>Graphics Driver Developer
>SUSE Software Solutions Germany GmbH
>Frankenstrasse 146, 90461 Nuernberg, Germany
>GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>HRB 36809 (AG Nuernberg)
>
