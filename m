Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF7AD676A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 07:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7542210E18A;
	Thu, 12 Jun 2025 05:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDCnCT8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462C510E070;
 Thu, 12 Jun 2025 05:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749706854; x=1781242854;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ciQ6XCS4pt0uHgpLAW8P07tIoXpBtR0nHRI9eLkcmho=;
 b=SDCnCT8FMMMowHSP95NowmzuxgwS3dqPm/GkVuSc+FTAy13c+0HEO/Jc
 Sm8bKvFfWvqflu51ofprZaZW936KMjIf5qyhnDZvb1yVICKmG3OSblI1a
 cmkqqBSKNU8o6p6MqCY4gxfnp3SnS/uMtZekzSx21QX7B6kqZpwDbmR44
 vk2WI8bXPXNC+tRR5ggtv3XMp7N3heCQ+4RMUDiEOvmUgfFNNArT1bQQw
 iZSZ01HGl0kvdxAprM7rDAtDlQVaMmr7tUCvXfjT2TC7faU74j8mH/uRI
 /hlKLR2h2v7U1/BHqHKHpzanAGdVVmI4AvQjFBH/7FQ8saW/DeXBZV+/X Q==;
X-CSE-ConnectionGUID: rdhZan+sTOqEb6Zse9aK2w==
X-CSE-MsgGUID: bSPU3zf+TO+dW2kuqpel6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="74404121"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="74404121"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:40:53 -0700
X-CSE-ConnectionGUID: WGXXmyz9RyqjtjtsZ8YSuw==
X-CSE-MsgGUID: YvFJWUqVTuG8h7shSryFoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147400751"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 22:40:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:40:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 22:40:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.82) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 22:40:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJ6sA/y1LxJiK71mBl0cRQgy4wcj/i/QNOtZeO5aCyMxXzzAY/xU4wOQiFOxTXlw0g12QwVHg12CaWMI9jkR3tX/5nm2KpeiaQHP3mb8XkHyi+kZPdmVpwhWj5dt9mKwXg/jbdId92ieCJ0qnj+RyYPO3WkMir8s+Vk90zC24tyGM1/DvLzGJl/VxBPAmi3yEld/xRHBjTRoHMREatrQN2SG5piz/R3DioGMfTNjoBCZkIyeFHsAKNOEVcVvEOEbjIf8NTy3dsl4LvPUViGa0XnYoivTlcihZZkFPjVKU4qgzpkYpApvIfYne/02vJSChk+vmeZE8EEVFfMeowNjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQ7YRRxmdSqq0dIvTGBKxOVKtk22XcEj6e3miipk2ak=;
 b=syyTk7rG5Eku6QzQN08Nq/C4uSXuXzYa7VDZsb6MxMsVkeeVYiUeBUpUTfGTG/Zb7KbtiNPHCIfrIODb7CVHWA7eLNN4knHq6M8ooPSdENjZto4ykLxjBvSudGz773qXdBfxCwRG9ru16Zi39yA/tsPX+N2zY3c1ppy93QIPD6AvFrx3HYqd+DBrGMRpeYG2FdsbCowGE6fcVI1ycoBjw01rHKpB4YkBvuNdj3zfnQaWYY47bUZPNlo87oMUKhljp/A9e2TfAEpSTcu7+gEnBhCX5FdmMx8VHFdimEmwyFkXHQf5xDtYIkfceWlcAQU8I+LccIOsZaFczukUSg1jcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8765.namprd11.prod.outlook.com (2603:10b6:408:21d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.33; Thu, 12 Jun
 2025 05:40:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 05:40:29 +0000
Date: Thu, 12 Jun 2025 00:40:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Juston Li <justonli@chromium.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 2/2] drm/xe/bo: add GPU memory trace points
Message-ID: <mrfsys5djmsbotxlaahed5ogmofn4pkmgqfhl47rj3bwxdtlbv@7xbekwpkte57>
References: <20250611225145.1739201-1-justonli@chromium.org>
 <20250611225145.1739201-2-justonli@chromium.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250611225145.1739201-2-justonli@chromium.org>
X-ClientProxiedBy: BY5PR17CA0011.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9f9218-a833-499a-f85f-08dda973a3bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8yZl2YTkQIDj0gOgy3qJSuea6ks4KMzVi6PpSvbVL1O58dwAOjQZT20imkVk?=
 =?us-ascii?Q?X/Pn/0dwITPo0my8DUGFffI6MJfwcJGyLHuela3DmPOfpQq9SJmdi4tesA0A?=
 =?us-ascii?Q?f+KN9dYerW3qKOm/pdmE9dC1/J3CaTfLXjHq25+CWBw9FxZfpAw1mILywd14?=
 =?us-ascii?Q?07aifomRMjiCKjrPubzCErmjzdE0SJQQRU2OObhB7bwJONijr5JFkoe9wObC?=
 =?us-ascii?Q?u8dJIVylNMg+nM3OQc/tkTKvvncD6bQSqXXthn2IxJ79Y4PPkqKIV/D0Gv1T?=
 =?us-ascii?Q?emtjy+OQbSyx3dPlv8zVP7McGyccLSAIpPZ+w9iy7pMb41Xnq9SIRDvOb4vz?=
 =?us-ascii?Q?YBKQqPCI2OCLw6ey2h6gvwYKEv7HZ54LjFEOxcf54TJonw4dUj+hCH8VG7MG?=
 =?us-ascii?Q?8HngzQxHcVaasb/YQLGHR9T9y/a2Nb8JMHobErKWsP9YclQkJVJE8yDfazsf?=
 =?us-ascii?Q?Ahg/EVpAhV2n72HlxIqGTVwJc3yveVgqSL4GrIc53/aA6hO+qLayV2ulpCsZ?=
 =?us-ascii?Q?S+T7NIHn08aALrNWdS1bJTM9boM4solwArYXHGCqVsMJwXG4yo4aXuY4O44A?=
 =?us-ascii?Q?1UzAMUPTZEoR2oYOOC8HiFmdcXSWcD7dNa6mfD6bPRy45F5AI4ywkG9jJyPI?=
 =?us-ascii?Q?bv7rdkLfbnThLDUjrh2EptK8Jtdo8QnoKgdg6u0UyAlLRYxRyY20nKoL1KlF?=
 =?us-ascii?Q?8aiLqmHUsLV1FnMAhbeL4AzGerL9/Bm5vonaU47gYXsiIlzf2FEH9PnZcF5Q?=
 =?us-ascii?Q?1oYWh59fh2Wp6vV8/RQiBRKI6sAUSMC3YYjDHT0g4yqN2Q09GjQsn4uia2Vx?=
 =?us-ascii?Q?PhqfX3vSesTdE+AOJerdf68/7NVa3M6T/nVoLQHroAMRMR3RtBZUN9S0UIko?=
 =?us-ascii?Q?FptPwmklPWkhESdt8sVU1wzuhpnhbY2k66v+MKQlZIHJirjIeoyRDAYpc9kr?=
 =?us-ascii?Q?N7kYU7OO8yl1ObTHtTqiY9MSeDQOiY7e9CuEskJZA41LbalJFuuan/L6+r7f?=
 =?us-ascii?Q?BM75e2h5AvGrlVbByZjecfTVxXo4YMrLaetvaNCeegZP+Bz5hmK7NZ+Kksgt?=
 =?us-ascii?Q?SbOKeP1+PN1Rsgf4QphAvlr09wVdBAT+/9sidCxGUpJqG3UumSYCuMiemzQh?=
 =?us-ascii?Q?+MaZoOa+1QHNJDPh7snJYgfWsxw/Ff/iFRGXZL58N9QJUq81QMFXFaR2b6y+?=
 =?us-ascii?Q?4+rTJoMyZRfrUoVrJj2FhBq1P4lgx4JPfkLHrzZ9lojUW/UTRk6j2tTCat9o?=
 =?us-ascii?Q?gtBUZ9qMMzvh0ba6avzanQNMj3mNemZUaCgu2EgdKfBPGSPh9L03OUkrgWe4?=
 =?us-ascii?Q?y4rRIdrNvcli+M9ZzU863ILlBYC3CMGbfCH5kqIwk0YHPzU9O2yeBd4W1GFw?=
 =?us-ascii?Q?QhwBBJrb/09fxC9RU7CzFeIZKZNvmnce1tG3nJO8Fy1DFQ2xKE+gtMMH5MZl?=
 =?us-ascii?Q?Hpv/e5eWcUY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yhiGledMokvLg7rYC0dhPFJ4zwKtBLL/EhO9BehT1SGlHlmtq4a4YOknL2k/?=
 =?us-ascii?Q?k260aEHqsDUruuNCdtci9YBiDnTFqXLxOgvm3aXLxAEO1RhU/8hE/9iM4f0U?=
 =?us-ascii?Q?SWrGqGKS1wotFRDC6GIfKdrN6JvsLEcw/cWSsvg1FTZkZSRH1aHZumTUA5TN?=
 =?us-ascii?Q?54tZ94OU6EcvL8XoinIC2nhQZMFh0DfI3WIgEWqcl4ValyzXZV97iO0JPMjc?=
 =?us-ascii?Q?oXwaReknXQJDCJTkFd0BQUM3XjseLz9Uk7L8pcVh0EDONKxX7rPTHXYA/T7i?=
 =?us-ascii?Q?Ll+CrybzgV7PqI7KVksRGsfTQ+c6gdrLcfKBKy5SnO35kCDHhsPvQxnrl1wU?=
 =?us-ascii?Q?MapSrap6rl4p/5RShgzwQ61KRbJFvfXvRiWRrEi4FXtwzKQqzOVl50WZpneo?=
 =?us-ascii?Q?UWWfjtXgMyJgP/uNs9Cm/FEc+ytfybZlw5aQagAmqmyd/Le9a/1DkeDC5VsB?=
 =?us-ascii?Q?ri8JL2NKTNI5bma0Jov0wlZhZqZwg2h3TOLnb70zbBuBTvP80fioAYxbMuNf?=
 =?us-ascii?Q?8CHOBisCK9sJKAHcFlSNK5bIma256n/MMw+MgRa1lfZ4ZMN3IUj6+6WOOiub?=
 =?us-ascii?Q?2WV9uRV0AcZyvktkeUBtoBZGmwjrisgqdQydP6iUsGJgnQlwg6E8EAdP5ohb?=
 =?us-ascii?Q?GYEsS13j9VTolBrlLeQpzupN5ERRkXPjx8bmGG65t7FKqkUf/ViQJL1SsYea?=
 =?us-ascii?Q?obAVW28LGUH+/Ty+vsVOnwhLhSSE5T+KJwI2qcq3ePEwJ9LarWMcqgiLZEjz?=
 =?us-ascii?Q?wTfBgijoVqcj0ymkTanlB3ORI94ybDA3HY70iiDDiCz317ZGij2yTBcJVCBJ?=
 =?us-ascii?Q?VvAdbFxDGqZAx+5dB2f9ZSMXgjGztGldGavjYwFjtbNvT7T+k0SoQbcIYSTX?=
 =?us-ascii?Q?hy8TqdSAS2vMD4xTM60aOTt5kJAguQO5+4mDnUMNcRKe5zisMMYzhLT5smVG?=
 =?us-ascii?Q?KXC753LsIEaoEbjyb34fQZOTAwZBHLnBsKZfS5zwKT6Xs5/wssamLDlcQWuU?=
 =?us-ascii?Q?2mtrwbDtye/3hEKfpnyBsRRscPO4VSF7DQi40cMtzJXAC4oc0G2twpsr47KW?=
 =?us-ascii?Q?yngvK+CpyjBWk2tGQ/zuEhgAB8DQFjl6TpdDsMrTnMeLu9o4OEPBwy1PQWF+?=
 =?us-ascii?Q?ejKcfNxgNoOJ37dMLYvajpKabLNndrsPR1jxHXcZz6ZhllV4ko66nKX82qdg?=
 =?us-ascii?Q?K8Ims+onx28AESY5bOk7jl0zlzTYuyMVOAC1pal8E2Mc0PXDl8ZtDorHyhIJ?=
 =?us-ascii?Q?TG2MumXLqOyw5B3uK7Kp7isnPfAP65F+YwmajoHB1rbi5n4bzMOJOoPat0JU?=
 =?us-ascii?Q?iCNsC12TW1esKPOy7dpET4Uf8CGoQmoG2FUDnRbAO7EKIp+ew8Qrshz3ZVKV?=
 =?us-ascii?Q?UKipwDN/Nf7DUiDIJsJGhpipzmyihNW4JX+og5uMJgjYKQiEtOxX7ecp99Da?=
 =?us-ascii?Q?DPHkRytbM09fWM01S+VBf+fOWpfBAc8rFLFVVLYmlZnXw4WY/WSPlJ5/t89S?=
 =?us-ascii?Q?BLTL6Uo3p89Ojj/FS83p/TRzBjiO8l4SHT/gFSDwWVqr1twAKx+xxMw4Fk1t?=
 =?us-ascii?Q?kWUkJiJ81WnNoZnKkXn0fP7fYLCfc9qsu4mCA6HJW4tusqPbNEgo6pR7e9IP?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9f9218-a833-499a-f85f-08dda973a3bf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 05:40:29.1684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0iZgWUeRhqQU2Dvn5X5QNECe2uz/D451mOvjaIfLTZVzrWc6MZmQ+Jz66+usT/vP2jHv9qFTCibXCUD6aFKy6I8DpXnIlAI29RRqmX+hso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8765
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

On Wed, Jun 11, 2025 at 03:51:24PM -0700, Juston Li wrote:
>Add TRACE_GPU_MEM tracepoints for tracking global and per-process GPU
>memory usage.
>
>These are required by VSR on Android 12+ for reporting GPU driver memory
>allocations.
>
>v3:
> - Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
>   per-driver Kconfig (Lucas)
>
>v2:
> - Use u64 as preferred by checkpatch (Tvrtko)
> - Fix errors in comments/Kconfig description (Tvrtko)
> - drop redundant "CONFIG" in Kconfig
>
>Signed-off-by: Juston Li <justonli@chromium.org>
>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>---
> drivers/gpu/drm/xe/xe_bo.c           | 47 ++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
> 2 files changed, 63 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index 4e39188a021ab..89a3d23e3b800 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -19,6 +19,8 @@
>
> #include <kunit/static_stub.h>
>
>+#include <trace/events/gpu_mem.h>
>+
> #include "xe_device.h"
> #include "xe_dma_buf.h"
> #include "xe_drm_client.h"
>@@ -418,6 +420,35 @@ static void xe_ttm_tt_account_subtract(struct xe_device *xe, struct ttm_tt *tt)
> 		xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, 0);
> }
>
>+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>+static void update_global_total_pages(struct ttm_device *ttm_dev, long num_pages)
>+{
>+	struct xe_device *xe = ttm_to_xe_device(ttm_dev);
>+	u64 global_total_pages =
>+		atomic64_add_return(num_pages, &xe->global_total_pages);
>+
>+	trace_gpu_mem_total(0, 0, global_total_pages << PAGE_SHIFT);
>+}
>+
>+static void update_process_mem(struct drm_file *file, ssize_t size)
>+{
>+	struct xe_file *xef = to_xe_file(file);
>+	u64 process_mem = atomic64_add_return(size, &xef->process_mem);
>+
>+	rcu_read_lock(); /* Locks file->pid! */
>+	trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)), process_mem);

Isn't the first arg supposed to be the gpu id? Doesn't this become
invalid when I have e.g. LNL + BMG and the trace is enabled?

>+	rcu_read_unlock();
>+}
>+#else
>+static inline void update_global_total_pages(struct ttm_device *ttm_dev, long num_pages)
>+{
>+}
>+
>+static inline void update_process_mem(struct drm_file *file, ssize_t size)
>+{
>+}
>+#endif
>+
> static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
> 				       u32 page_flags)
> {
>@@ -525,6 +556,7 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>
> 	xe_tt->purgeable = false;
> 	xe_ttm_tt_account_add(ttm_to_xe_device(ttm_dev), tt);
>+	update_global_total_pages(ttm_dev, tt->num_pages);
>
> 	return 0;
> }
>@@ -541,6 +573,7 @@ static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>
> 	ttm_pool_free(&ttm_dev->pool, tt);
> 	xe_ttm_tt_account_subtract(xe, tt);
>+	update_global_total_pages(ttm_dev, -(long)tt->num_pages);
> }
>
> static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>@@ -1653,6 +1686,15 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
> 	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
> }
>
>+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>+static int xe_gem_object_open(struct drm_gem_object *obj,
>+			      struct drm_file *file_priv)
>+{
>+	update_process_mem(file_priv, obj->size);
>+	return 0;
>+}
>+#endif
>+
> static void xe_gem_object_close(struct drm_gem_object *obj,
> 				struct drm_file *file_priv)
> {
>@@ -1665,6 +1707,8 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
> 		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> 		xe_bo_unlock(bo);
> 	}
>+
>+	update_process_mem(file_priv, -obj->size);
> }
>
> static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>@@ -1762,6 +1806,9 @@ static const struct vm_operations_struct xe_gem_vm_ops = {
>
> static const struct drm_gem_object_funcs xe_gem_object_funcs = {
> 	.free = xe_gem_object_free,
>+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>+	.open = xe_gem_object_open,
>+#endif
> 	.close = xe_gem_object_close,
> 	.mmap = drm_gem_ttm_mmap,
> 	.export = xe_gem_prime_export,
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index e5d02a47a5287..b797e766ccbc2 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -641,6 +641,14 @@ struct xe_device {
> 		unsigned int fsb_freq, mem_freq, is_ddr3;
> 	};
> #endif
>+
>+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>+	/**
>+	 * @global_total_pages: global GPU page usage tracked for gpu_mem
>+	 * tracepoints
>+	 */
>+	atomic64_t global_total_pages;
>+#endif
> };
>
> /**
>@@ -702,6 +710,14 @@ struct xe_file {
>
> 	/** @refcount: ref count of this xe file */
> 	struct kref refcount;
>+
>+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
>+	/**
>+	 * @process_mem: per-process GPU memory usage tracked for gpu_mem
>+	 * tracepoints
>+	 */
>+	atomic64_t process_mem;

so... this is not per-process, it's actually "per dev node" open. Does
this map correctly to the intended use and how it's handled in msm?


Lucas De Marchi

>+#endif
> };
>
> #endif
>-- 
>2.50.0.rc1.591.g9c95f17f64-goog
>
