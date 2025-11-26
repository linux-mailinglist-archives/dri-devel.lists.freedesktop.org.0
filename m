Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D600C8C012
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 22:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C7810E6FC;
	Wed, 26 Nov 2025 21:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMBGC1W2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC88A10E6F6;
 Wed, 26 Nov 2025 21:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764192105; x=1795728105;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VucyHi+Zx8AL5XbAShPOjcE0u9zEoiH8v1uYNphpd2Y=;
 b=HMBGC1W2/cLJZZdcnavuHISrjfJBmlxiZnkTTDduVZwzw7IEOVCO5Uk1
 lGST+OF7/XRSRHoyfqpjSpBbFjTqF3mIhfflg+2g7RXQQ99kQ6KiS0MSq
 vcBitms5xokzIfak9QkYfTXinqCuGc4l1XdeDvKGhhLxQIIQBIjNBYoEw
 NDJIVXOKSmfgca0lpor962inKFJLMRdE3PdyokqTUyF8CK6Sd7STwGBSk
 OgLHXRFL2X/t3NWhsJsxIkFbuimFSBNoKUrUKl5amqi6iG+dfP/KYxEcb
 CMfFPHknx6P/9OCLmF17SycXLGm8fmegWgEb8hhJNB36jpcVokTOBjB0x Q==;
X-CSE-ConnectionGUID: IBImB4UVS3m1bKeSngCayw==
X-CSE-MsgGUID: +K9q/SGRRHWYMf+xg620hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77712911"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="77712911"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 13:21:44 -0800
X-CSE-ConnectionGUID: 6zDtNB3hQJ2N5J82jDOR6Q==
X-CSE-MsgGUID: uRn7Yz/VRiaADtxsGIqWbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="224011622"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 13:21:44 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 13:21:43 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 13:21:43 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 13:21:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxyO23EuNaITJgN83D/BIK7eMaZSgyrG5G2ljV3u10sy/CbKDnny33sYB3ro52cwborXeBgNzVqi1Rn+f8S8rIO288DGVzqxLZLz7zctEu9QwnTrv7F9g218kAc+G+dgZ01SJLjsl6SQi1gEBEFXD/TQRrt5SyTPF99L1r4VVXL47m2vr2TUdYK+35Vp3guc8KlumwViPbYWUnsBCFQGOim+EIdy47XrhOy7GEZMZslalVPOdP+pe1BKKqrfnEZhEt9qWMM/X3Vt0smPuUlc7+cTq4BaXpWPCp/hqfCxXoEopl/8KyycxxXsxEUYDGQNdRnvt+9PeBlB3oVaVrchLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j395wL/1caAqZVraVIsHJt6rKG1LLfd8H5q7PBOz/WQ=;
 b=QLdxPcxrbrnuOIecf9tg2qT9S9ACJg3S+QJ5tZxxoAVtre+sXFt9eP4Y1PEzjLpJzomZI8+6DFZzbxilkH9ZpIJh4DqVNpntJnAhsfuDd76Uz9Z/ESyDyYuNKDML9W9j9qblZBdx8xbRKCa+elzHAK4rW+4SKDZag4mNO4my+p5anra2MCPZq+jdBMQBhgvZwQA4AwSsuVAq2FiVhBOOny8tIqsuNOr+/Psjl0a3IlaOTiEpNldqWHPkCvYDE3RezoUHaywk978zDNeGtiunQP0abd2FEBsDO+w5kF04o5k9kZ3MsmwSRonoKQo5rJsWnQZgeDax/ma5VKf/t2Nung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8351.namprd11.prod.outlook.com (2603:10b6:806:384::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 21:21:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 21:21:41 +0000
Date: Wed, 26 Nov 2025 13:21:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 8/8] drm/xe: Avoid toggling schedule state to check
 LRC timestamp in TDR
Message-ID: <aSdvYomeRmDSQdEb@lstrano-desk.jf.intel.com>
References: <20251126201916.618996-1-matthew.brost@intel.com>
 <20251126201916.618996-9-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251126201916.618996-9-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:303:16d::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 88edd25e-c4d9-466f-ffd9-08de2d31cab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HAETnUngZTnIhy4kDsAiG+60qDP6RG3gvY/A6waPrBut6FqOjz7rZiMFeygT?=
 =?us-ascii?Q?FnF2VtnY+iCU5A6JZM1h7xIJ7pOp61+hxfybrR+KAqmSO8tdi8K4T5Hgsi1i?=
 =?us-ascii?Q?af5fi/nnxoRjw0iZL6xYydH9kyHzspQor/BKolxk1fehznuwTpTnO8/jrFOD?=
 =?us-ascii?Q?D4/4c6QaIbxWh25ETRO20PWQZE7rOgagHur25oahz1HhLqtFXNfSytAZpw50?=
 =?us-ascii?Q?BBFrhkVkfaAWTEOk/nIJA/+7jZaFqR4eul5fAhikLsM/Qg1SbuP6gQOOrN8H?=
 =?us-ascii?Q?yFNPP8vWnsvKbCdPZfHHeIAXTeDuZtWFW8n0sAXaLf0kqCBkFf7z7CrnrD/T?=
 =?us-ascii?Q?E0aBuPW2G6bEiUnd18YKvkZwOFHbn0YzMoLaUsvNJnPdD2HxZPNGT719bz22?=
 =?us-ascii?Q?lv0qTC8ROsLMTDr48NHAbPEUYywqR5keolmkXPTPRM2AL4Wc3+8d+QfwcJf5?=
 =?us-ascii?Q?UXrJasl13A/EG5MJZkjL9VLyPYI0ZaPQzGXHqSBNiTzirwSI0swxBABRfka/?=
 =?us-ascii?Q?zceXZfZli5BX2w/LRWDmCeehe+aJGpNUetIAGoUP/JHP2//rxyqthh+BWvt7?=
 =?us-ascii?Q?WfNVinnbOAOHyzh4/wxdnBHtRHxGuaVjVX1NyIROl04XL9cRG2LFP5u3jJJ4?=
 =?us-ascii?Q?n4I2eEAQwsdGSVwESkTA0xdNdeKK8K0gjXbr1tl8VqIW0VQE6syAsn41ST1u?=
 =?us-ascii?Q?Q2VxII6PplNlhRn6QVabgKtKzpSC8ytJKhD07hR7E9jBatv4T9DPNgH/fwtc?=
 =?us-ascii?Q?XttskMNUAYUsWnZebYLRl4fEbSWoRXetlgTmCc9tYQKTqnUAdTyL4wBOuloh?=
 =?us-ascii?Q?cdTqwacRmL4SGCVFh2amghAGf7jkAELgBMopKR+Ct2CY5N5AOHDnntvWV6wd?=
 =?us-ascii?Q?SLG2nLKgSNfKjWy/GlPB/uaUUKE3dXS6ngQAvQ7sOLlH3P/OkubtiT8yfKYg?=
 =?us-ascii?Q?hX5IGwmMvW5IYygmNUGL9E12fxXOiXx5LgpfE5qY8XlQY0H+c4W/XVKcVGFF?=
 =?us-ascii?Q?zK1fEN99AmuF25PtAPIC6F8+kVk/EWKKvHGlhs4hmFdQ5nRXNiG3jmwqEjN5?=
 =?us-ascii?Q?15B/iEgoiTyY7+em2Nu2dUs0cT6fmrt8HLH71Xi+j+6f352HML6v284JBItl?=
 =?us-ascii?Q?Hl+Mc6MO7nOqhg4rC5bf0IFMk3lV810l1BnLNDlBMdsTKrCG2P0b38rp/k8g?=
 =?us-ascii?Q?WPDJ8Gu+VIbTfUD+wMKb0KoWvnihlPwn/TiM3fpYyx1sh+y4tA5Ug40MP992?=
 =?us-ascii?Q?9TzVj+EXJtOQy9kuu5xGezdpSaoVSSxyye5Uu9y1QsNWf4bEgAXTX9YWef7/?=
 =?us-ascii?Q?+fs6izmcbcF9g2IR1csIE67BOqNvfOBMg+jMahzEHW0g+8hGQ2M5q74hp3Ie?=
 =?us-ascii?Q?CUrYn5SKI+/q7YxEK9f1IP89GwW5quJzd+C9gMTbwVnNIAs5JC2UpU68dLqH?=
 =?us-ascii?Q?sMfKvkKR/rc/DxGtIc9x4mVXzXRZGO53?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uHbTJ9RUVJelXopBiIy4vJETWVFKLRjSPlon5SU8DGbdFUsJXuaZDSCzLKjI?=
 =?us-ascii?Q?K6KpLaqxjT61Q7GVXJ8q/KyIMzMfkxKmq6zOx1KkKCWhQZIhytTfI8d+AgQ8?=
 =?us-ascii?Q?fc6xmxlkmkvo7JEWFbiFFw9SPQyH/dWISgCQbLgIkl3YTFT21fw0pzfIHFQx?=
 =?us-ascii?Q?bySwJ/qjVXjYjhs2s1vdkpxq4qVjj6S70wefKnPDSD+KWap0Bj3dGmqb8bm9?=
 =?us-ascii?Q?zDLhV8KldBtNy5akVfznFZX4uGLYp+kem65PXnq1R60DzAgs12C0kkmKV3JF?=
 =?us-ascii?Q?ZrOtNgIFnp1v4l6n/iMunKVAo2my7BDOGtDu2HpXxBg+CWq1GcT1JciYcA/t?=
 =?us-ascii?Q?mCM+2JF+wp8BXOhnhsXGn+eQ+vcxhERpyxPCrf6uNU0fO+NEpaWbE4ry7oik?=
 =?us-ascii?Q?HYqHiD2RwgBvWXqUznNxnd36fKQYt1b6y4NFGKsfmRd6v0X0E+4MTq9Wj6QB?=
 =?us-ascii?Q?1O/b3xv19O/v1QcwsWL3y21e4psEoipUok/ZI2B9fw0ZhjcjyZWPcZAP/ypz?=
 =?us-ascii?Q?JaKdk+7pygnJ+5BOoHNfM3z3uMWKcxCXc+bazOLZXWMM1VSedma1ZHIkIPND?=
 =?us-ascii?Q?o6o3es6PAfxgD1B+fce/v/AS8SJX2ytlF9MWXPvjGlhUiv1qZPUoANzElwXj?=
 =?us-ascii?Q?dVmCGJRB3HICKjdx4U3337rR9Phm9X2SadFMZpeDZbc9sQg3h+nfI8Fy+wVW?=
 =?us-ascii?Q?7L2YvP6H8wjE8PQq4ducFej1urL0N5jsGUCj+Q2J32M8uV3rVhFv5Z0eso3y?=
 =?us-ascii?Q?H4wyquWI7y0doUpjqSfAC8hx2fcAF6Ntx3Y/dNiLuCCJnCACxpK774D1YXbb?=
 =?us-ascii?Q?5keCGk97y3XjZIK4/HD5ia98A7DSo8rMkE+Fv+Q0jKNgGD2kDN18iAwbFsDu?=
 =?us-ascii?Q?HDHcuqtTVoY7/V1HvgIaqJqCIukg+awocLTqd/NX3razC7rStmpyQhGFycs9?=
 =?us-ascii?Q?xhlXx65P3teg6+CvWOc17yZw9ayghlV1nbAi5An5RHYuvD3a/sJmXzUtcztL?=
 =?us-ascii?Q?rfcL2fW7eN5t/PkseifgjnaoX4KHHuJGf5bcNbcTMvvxZFQupc/v4fkG8290?=
 =?us-ascii?Q?MXpKWfEkt1wL+P99Dwl74T+4uZY+9X7iUd3erOm/Gd9lINQibrdy35wVxQfl?=
 =?us-ascii?Q?OF6v0E6L+EvdDzdevGX4nJ8fsorjmSQxdR/5Zvg23YlSfmZ7Bu5wFuLUuvRY?=
 =?us-ascii?Q?4n1b6DjY17iRXV3o1Dst6fY0eG8z+vswAtg4K1l8h9vhEtQprN07oRN53Av1?=
 =?us-ascii?Q?yFUmSGfZe9d4VLP8pksc56HFIyfCgF/OQ+K3zyxiJRyZwphib4+bU9OB/AIK?=
 =?us-ascii?Q?S9lCY0YEC55bhZB+zcQrtc2ri9iylVwWob8HFNyHkjjX2EU235KSiqZ8+Zxl?=
 =?us-ascii?Q?/BnxsawGpLNxS8GHRpiWrKztOO6392zZVDoR4JWDcoUQ1qOjFPjeTqFI6Ljr?=
 =?us-ascii?Q?uJZ3sbiJHNwcEpJv09zl/3HikaShkumXPpDmxxlNoPJip3lGJbAUfyER5fz2?=
 =?us-ascii?Q?1SWN9P27u8m1NbCbcQj37yfASL1v4ws8PLv9LqX8YL0omV59qO1NPZVg26f7?=
 =?us-ascii?Q?ox6+mB6llN266UcOxc1jY6Y9qwS9ysH5Pg0t651p+vi57+V8dBsQWiJc/6ky?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88edd25e-c4d9-466f-ffd9-08de2d31cab0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 21:21:41.1471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ViJjm1NHiMdYRGGflMuCjHmEg61sYMc3q4lkVtlfBF0ADE5ZMRqPkDmUuNK+9/ww/h/mRjsF/DLhXlPWiXmVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8351
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

On Wed, Nov 26, 2025 at 12:19:16PM -0800, Matthew Brost wrote:
> We now have proper infrastructure to accurately check the LRC timestamp
> without toggling the scheduling state for non-VFs. For VFs, it is still
> possible to get an inaccurate view if the context is on hardware. We
> guard against free-running contexts on VFs by banning jobs whose
> timestamps are not moving. In addition, VFs have a timeslice quantum
> that naturally triggers context switches when more than one VF is
> running, thus updating the LRC timestamp.
> 
> For multi-queue, it is desirable to avoid scheduling toggling in the TDR
> because this scheduling state is shared among many queues. Furthermore,
> this change simplifies the GuC state machine. The trade-off for VF cases
> seems worthwhile.
> 
> v5:
>  - Add xe_lrc_timestamp helper (Umesh)
> 

Ignore this patch, this is broken a VF. I believe I have a fix but that
doesn't appear to be working either... I'll have to dig in after the
break.

Matt

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c      | 97 ++++++-------------------
>  drivers/gpu/drm/xe/xe_lrc.c             | 42 +++++++----
>  drivers/gpu/drm/xe/xe_lrc.h             |  3 +-
>  drivers/gpu/drm/xe/xe_sched_job.c       |  1 +
>  drivers/gpu/drm/xe/xe_sched_job_types.h |  2 +
>  5 files changed, 56 insertions(+), 89 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index db3c57d758c6..b8022826795b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -68,9 +68,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>  #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
>  #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
>  #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> -#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> -#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
> -#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
> +#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 10)
>  
>  static bool exec_queue_registered(struct xe_exec_queue *q)
>  {
> @@ -202,21 +200,6 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
>  	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
>  }
>  
> -static bool exec_queue_check_timeout(struct xe_exec_queue *q)
> -{
> -	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
> -}
> -
> -static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
> -{
> -	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> -}
> -
> -static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> -{
> -	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> -}
> -
>  static bool exec_queue_pending_resume(struct xe_exec_queue *q)
>  {
>  	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
> @@ -232,21 +215,6 @@ static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
>  	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
>  }
>  
> -static bool exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> -{
> -	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
> -}
> -
> -static void set_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> -{
> -	atomic_or(EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
> -}
> -
> -static void clear_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> -{
> -	atomic_and(~EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
> -}
> -
>  static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>  {
>  	return (atomic_read(&q->guc->state) &
> @@ -1006,7 +974,16 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>  		return xe_sched_invalidate_job(job, 2);
>  	}
>  
> -	ctx_timestamp = lower_32_bits(xe_lrc_ctx_timestamp(q->lrc[0]));
> +	ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> +	if (ctx_timestamp == job->sample_timestamp) {
> +		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
> +			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +			   q->guc->id);
> +
> +		return xe_sched_invalidate_job(job, 2);
> +	}
> +
> +	job->sample_timestamp = ctx_timestamp;
>  	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
>  
>  	/*
> @@ -1132,16 +1109,17 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	}
>  
>  	/*
> -	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
> -	 * modify scheduling state to read timestamp. We could read the
> -	 * timestamp from a register to accumulate current running time but this
> -	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
> -	 * genuine timeouts.
> +	 * Check if job is actually timed out, if so restart job execution and TDR
>  	 */
> +	if (!skip_timeout_check && !check_timeout(q, job))
> +		goto rearm;
> +
>  	if (!exec_queue_killed(q))
>  		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>  
> -	/* Engine state now stable, disable scheduling to check timestamp */
> +	set_exec_queue_banned(q);
> +
> +	/* Kick job / queue off hardware */
>  	if (!wedged && (exec_queue_enabled(q) || exec_queue_pending_disable(q))) {
>  		int ret;
>  
> @@ -1163,13 +1141,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  			if (!ret || xe_guc_read_stopped(guc))
>  				goto trigger_reset;
>  
> -			/*
> -			 * Flag communicates to G2H handler that schedule
> -			 * disable originated from a timeout check. The G2H then
> -			 * avoid triggering cleanup or deregistering the exec
> -			 * queue.
> -			 */
> -			set_exec_queue_check_timeout(q);
>  			disable_scheduling(q, skip_timeout_check);
>  		}
>  
> @@ -1198,22 +1169,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  			xe_devcoredump(q, job,
>  				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
>  				       q->guc->id, ret, xe_guc_read_stopped(guc));
> -			set_exec_queue_banned(q);
>  			xe_gt_reset_async(q->gt);
>  			xe_sched_tdr_queue_imm(sched);
>  			goto rearm;
>  		}
>  	}
>  
> -	/*
> -	 * Check if job is actually timed out, if so restart job execution and TDR
> -	 */
> -	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
> -	    !exec_queue_reset(q) && exec_queue_registered(q)) {
> -		clear_exec_queue_check_timeout(q);
> -		goto sched_enable;
> -	}
> -
>  	if (q->vm && q->vm->xef) {
>  		process_name = q->vm->xef->process_name;
>  		pid = q->vm->xef->pid;
> @@ -1244,14 +1205,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
>  			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
>  		if (!xe_sched_invalidate_job(job, 2)) {
> -			clear_exec_queue_check_timeout(q);
>  			xe_gt_reset_async(q->gt);
>  			goto rearm;
>  		}
>  	}
>  
> -	set_exec_queue_banned(q);
> -
>  	/* Mark all outstanding jobs as bad, thus completing them */
>  	xe_sched_job_set_error(job, err);
>  	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
> @@ -1266,9 +1224,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	 */
>  	return DRM_GPU_SCHED_STAT_NO_HANG;
>  
> -sched_enable:
> -	set_exec_queue_pending_tdr_exit(q);
> -	enable_scheduling(q);
>  rearm:
>  	/*
>  	 * XXX: Ideally want to adjust timeout based on current execution time
> @@ -1898,8 +1853,7 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
>  			  q->guc->id);
>  	}
>  
> -	if (pending_enable && !pending_resume &&
> -	    !exec_queue_pending_tdr_exit(q)) {
> +	if (pending_enable && !pending_resume) {
>  		clear_exec_queue_registered(q);
>  		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER - guc_id=%d",
>  			  q->guc->id);
> @@ -1908,7 +1862,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
>  	if (pending_enable) {
>  		clear_exec_queue_enabled(q);
>  		clear_exec_queue_pending_resume(q);
> -		clear_exec_queue_pending_tdr_exit(q);
>  		clear_exec_queue_pending_enable(q);
>  		xe_gt_dbg(guc_to_gt(guc), "Replay ENABLE - guc_id=%d",
>  			  q->guc->id);
> @@ -1934,7 +1887,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
>  		if (!pending_enable)
>  			set_exec_queue_enabled(q);
>  		clear_exec_queue_pending_disable(q);
> -		clear_exec_queue_check_timeout(q);
>  		xe_gt_dbg(guc_to_gt(guc), "Replay DISABLE - guc_id=%d",
>  			  q->guc->id);
>  	}
> @@ -2274,13 +2226,10 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  
>  		q->guc->resume_time = ktime_get();
>  		clear_exec_queue_pending_resume(q);
> -		clear_exec_queue_pending_tdr_exit(q);
>  		clear_exec_queue_pending_enable(q);
>  		smp_wmb();
>  		wake_up_all(&guc->ct.wq);
>  	} else {
> -		bool check_timeout = exec_queue_check_timeout(q);
> -
>  		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
>  		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>  
> @@ -2288,11 +2237,11 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  			suspend_fence_signal(q);
>  			clear_exec_queue_pending_disable(q);
>  		} else {
> -			if (exec_queue_banned(q) || check_timeout) {
> +			if (exec_queue_banned(q)) {
>  				smp_wmb();
>  				wake_up_all(&guc->ct.wq);
>  			}
> -			if (!check_timeout && exec_queue_destroyed(q)) {
> +			if (exec_queue_destroyed(q)) {
>  				/*
>  				 * Make sure to clear the pending_disable only
>  				 * after sampling the destroyed state. We want
> @@ -2402,7 +2351,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  	 * guc_exec_queue_timedout_job.
>  	 */
>  	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> +	if (!exec_queue_banned(q))
>  		xe_guc_exec_queue_trigger_cleanup(q);
>  
>  	return 0;
> @@ -2483,7 +2432,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  
>  	/* Treat the same as engine reset */
>  	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
> +	if (!exec_queue_banned(q))
>  		xe_guc_exec_queue_trigger_cleanup(q);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index b5083c99dd50..c9bfd11a8d5e 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -839,7 +839,7 @@ u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
>   *
>   * Returns: ctx timestamp value
>   */
> -u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> +static u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>  {
>  	struct xe_device *xe = lrc_to_xe(lrc);
>  	struct iosys_map map;
> @@ -2353,35 +2353,29 @@ static int get_ctx_timestamp(struct xe_lrc *lrc, u32 engine_id, u64 *reg_ctx_ts)
>  }
>  
>  /**
> - * xe_lrc_update_timestamp() - Update ctx timestamp
> + * xe_lrc_timestamp() - Current ctx timestamp
>   * @lrc: Pointer to the lrc.
> - * @old_ts: Old timestamp value
>   *
> - * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
> - * update saved value. With support for active contexts, the calculation may be
> - * slightly racy, so follow a read-again logic to ensure that the context is
> - * still active before returning the right timestamp.
> + * Return latest ctx timestamp.
>   *
>   * Returns: New ctx timestamp value
>   */
> -u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> +u64 xe_lrc_timestamp(struct xe_lrc *lrc)
>  {
> -	u64 lrc_ts, reg_ts;
> +	u64 lrc_ts, reg_ts, new_ts;
>  	u32 engine_id;
>  
> -	*old_ts = lrc->ctx_timestamp;
> -
>  	lrc_ts = xe_lrc_ctx_timestamp(lrc);
>  	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
>  	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
> -		lrc->ctx_timestamp = lrc_ts;
> +		new_ts = lrc_ts;
>  		goto done;
>  	}
>  
>  	if (lrc_ts == CONTEXT_ACTIVE) {
>  		engine_id = xe_lrc_engine_id(lrc);
>  		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
> -			lrc->ctx_timestamp = reg_ts;
> +			new_ts = reg_ts;
>  
>  		/* read lrc again to ensure context is still active */
>  		lrc_ts = xe_lrc_ctx_timestamp(lrc);
> @@ -2392,9 +2386,29 @@ u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>  	 * be a separate if condition.
>  	 */
>  	if (lrc_ts != CONTEXT_ACTIVE)
> -		lrc->ctx_timestamp = lrc_ts;
> +		new_ts = lrc_ts;
>  
>  done:
> +	return new_ts;
> +}
> +
> +/**
> + * xe_lrc_update_timestamp() - Update ctx timestamp
> + * @lrc: Pointer to the lrc.
> + * @old_ts: Old timestamp value
> + *
> + * Populate @old_ts current saved ctx timestamp, read new ctx timestamp and
> + * update saved value. With support for active contexts, the calculation may be
> + * slightly racy, so follow a read-again logic to ensure that the context is
> + * still active before returning the right timestamp.
> + *
> + * Returns: New ctx timestamp value
> + */
> +u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts)
> +{
> +	*old_ts = lrc->ctx_timestamp;
> +	lrc->ctx_timestamp = xe_lrc_timestamp(lrc);
> +
>  	trace_xe_lrc_update_timestamp(lrc, *old_ts);
>  
>  	return lrc->ctx_timestamp;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 2fb628da5c43..86b7174f424a 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -140,7 +140,6 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
>  
>  u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc);
>  u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc);
> -u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
>  u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
>  u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
>  int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> @@ -160,4 +159,6 @@ int xe_lrc_setup_wa_bb_with_scratch(struct xe_lrc *lrc, struct xe_hw_engine *hwe
>   */
>  u64 xe_lrc_update_timestamp(struct xe_lrc *lrc, u64 *old_ts);
>  
> +u64 xe_lrc_timestamp(struct xe_lrc *lrc);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index cb674a322113..39aec7f6d86d 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -110,6 +110,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>  		return ERR_PTR(-ENOMEM);
>  
>  	job->q = q;
> +	job->sample_timestamp = U64_MAX;
>  	kref_init(&job->refcount);
>  	xe_exec_queue_get(job->q);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index 7c4c54fe920a..13c2970e81a8 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -59,6 +59,8 @@ struct xe_sched_job {
>  	u32 lrc_seqno;
>  	/** @migrate_flush_flags: Additional flush flags for migration jobs */
>  	u32 migrate_flush_flags;
> +	/** @sample_timestamp: Sampling of job timestamp in TDR */
> +	u64 sample_timestamp;
>  	/** @ring_ops_flush_tlb: The ring ops need to flush TLB before payload. */
>  	bool ring_ops_flush_tlb;
>  	/** @ggtt: mapped in ggtt. */
> -- 
> 2.34.1
> 
