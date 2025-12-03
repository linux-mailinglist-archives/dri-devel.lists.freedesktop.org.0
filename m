Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 305BAC9D7F1
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 02:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A9210E527;
	Wed,  3 Dec 2025 01:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSvkdwEr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A451010E051;
 Wed,  3 Dec 2025 01:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764725031; x=1796261031;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bnP/yCyw0xVWeB9dZwBhhbyvzNrXts+0iDCxCHkc1KE=;
 b=fSvkdwErBoK/YDUY8nWtHkm3amEysD47yIxNJlu23Qgp5qO3pX29bSn7
 CwYvZ7I3iyYLp+ACk50ps5IILq0XmQ9ssHp+o6lHo/fXtP8k5GEqHsfVA
 Br9O1zpItHHJgbm363YL7c9Qd5tlCkF2Zgh4gDXERhJTCRl2tkJYiErTU
 Pcb7u+uJv8GewXqLeG+7Rp8TdbCQP3kXp7XYQ+Avp57fAe1uNJseO3dvk
 WypmY9t7v9hhDd3WxBtvKnFDyyJXuAdvwrgEwMZAcYhuOJtsFKT1rsJ2u
 0M614/EzeuSHDgFtAVSH+plNVlpSDvJvyT379MW9IGChDXK/l7U82rsVC A==;
X-CSE-ConnectionGUID: m4gtINUlRFKg9kLg0RZVOQ==
X-CSE-MsgGUID: XuAzV4L+TAWBnDwoSJ4/Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78177094"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="78177094"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 17:23:51 -0800
X-CSE-ConnectionGUID: 1UaSzTVVTlm8SWLF7UXi+Q==
X-CSE-MsgGUID: imqxGgOyTnyYmpHHqNwvJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194768588"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 17:23:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 17:23:50 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 17:23:50 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.17)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 17:23:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySsjcstBOZixd+JnrPiA2Za3c0Mqyb76DO31fBK5Vx5Gu2dJg6uhQ3nGDCpGIKii/zaR58QGxjdnMm9ntuNrFU9yFJSbE59NNMWT8b4muQRNEw5V+EMCByWTboOuwAoZKZy1RlawauQd7kwX5ySmBTraROQfZZIcgUhGrvRCDGw2w8aORFPWS93NXcgb7CSXaKSudDG3CGTb1b5Z4oa8x/Ys4pXeQeel27GV6ecQBVqf3XlbdOkhnN/k4RBBzQm+lghVnMbitIVuoJFVbQbGQ1S2RTAfwmNDUaagpWX+ZvTKB6fX9tOpDoVns/qsAZ6uKtRWsUWtzuWDO9yssoYFEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FKYls9XsQ7fuV+nuobnepU1nnrYXei/kGHMLEEr59E=;
 b=SaO9BlEOyiMoD6XlH/2MVWr70K2uSucKSsdDADWdlqvVJU3mn43Saeh8wMuaOhRb1AziwMVegoGplmlAfEklT/dpk/vxz9eB3yCQYMr5uFCPDIPdTTxirwWLFOZPgkTRWmel0ZZkubu1gULaAMkTJ1YDJBt3rKyrKabwVYM9EiViGkArfCIDLeytYYuS5a9yYQUcBgyjqdh6cTAzovc+imLmk3EhfYjvebe2Md6ghg84Qq24jQ/RfoQN+fyp2jBqitMgH46LRiSMvXuSo/X8EiP/USjxw0NGTVo2lvPe33znjTJMc7w2lPBy0NaykXbTismxEWTiZjGvAQb+zBnLMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 01:23:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 01:23:47 +0000
Date: Tue, 2 Dec 2025 17:23:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <phasta@kernel.org>,
 <christian.koenig@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v7 0/9] Fix DRM scheduler layering violations in Xe
Message-ID: <aS+RIfD3mb7dAHRV@lstrano-desk.jf.intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251201183954.852637-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW4P221CA0029.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c80d7d-48a4-495e-67a7-08de320a9bcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KitN2jhIu2YlUGVQyeK6JwjQXgoAH3Z82dMZXzWB0OWEubNY2YYbB2+FYC2J?=
 =?us-ascii?Q?nZUqVeYql0b1d1HC4uV9fxQf4cEcSDvq0XVVVCOeRRoMBYoGyVx30biUrMEn?=
 =?us-ascii?Q?xDPvBWtbnBglJnVKPgUslIBAmY+RKoRuQC+57j5vl7SeX5ey0xjcm2zW488v?=
 =?us-ascii?Q?FEP85X1C+9LZxAYXevtcNdiP1EKr3yvDWyCTnKmWrvitYYLrm8VuZ467qCP5?=
 =?us-ascii?Q?OMxLs5xHzMw0/ZNV4xyBz57VRzRdk/dLySClM9kzdnilRdRaPljBfoqEd85I?=
 =?us-ascii?Q?wRBAhqBKPShZz8d5+SIxHAF7JlYBVqV07aNoQdoskSOsxVCpWWJslsq3mhn5?=
 =?us-ascii?Q?wMRM1th9/4Bh3kgFj9Ri+00hryrd16Xzh9dCoeL9UsKpldgsi6s0mG8uEy7z?=
 =?us-ascii?Q?MtZ/Lv6MRxHQ4TYeH1MsDaEKWLa8pGsXw7SrsDaLoojga3GoG+cwJBW9MEYG?=
 =?us-ascii?Q?cxAMoEuzrBl7jB5Cv08QFJNZvfUvhJ8bGJHA/UXVH9bl+OGVLtTAkOxOsj8e?=
 =?us-ascii?Q?p+MrVbj4b0OF7RCAeHHvhnGdkxRi60aPrTNkDTW4IY8gWQMHYtQAi2rlBDdH?=
 =?us-ascii?Q?1/mQFU87v5I9MYTY02C/oaT88XSl5d4Hpr/i2okkVzw0A9Y2TYUXjXm8DB+W?=
 =?us-ascii?Q?Z48oitYt0AaT7kjjX7pj4od3/JKIkPQbcjS3Xq0NO/i+iFyMmJUQDhv3ENYU?=
 =?us-ascii?Q?RjWaGyDywUkryphwrgSjfVS/xZHSvLHb1mptPpRTWErzk8u+gTVlP54m1Vz9?=
 =?us-ascii?Q?mQHf893XSD7eo8PMMsGWUwWO2alah9NeIXV/OeWeHrvGCK5dyHmRR69n8Hea?=
 =?us-ascii?Q?fHDVdCss66Xrs+/HKktNciOKGGZ1F5OFz4RrMh6i8U9b9nM6ZW/7T9JsKgf3?=
 =?us-ascii?Q?moOJ60avKI8FqD7KheFR94wjq/9+lgQlLHObPxlOPVLeycy04ixXGujfqbjZ?=
 =?us-ascii?Q?3TwbZiek1UlBxXR952o2ELaDsBe1shrja2haFziILc0UG+IDwRYEYCZ42DmU?=
 =?us-ascii?Q?J4/2DNb7B82bK5MSz4sJxfOpNrEsOz9izeFxD0oYgUjgpgl8/SylFgZoS4gr?=
 =?us-ascii?Q?MRCCfRxMsQMwONoK/iN+tYmv925ord2CDCz5laPlyBCoWbUI5mgXQrG3wey8?=
 =?us-ascii?Q?egVlCJIl7hLWJh9MfRhjiYJU3CvnaVwddn8lZsEMjzGX4zAkMhjQXp56/e/g?=
 =?us-ascii?Q?WXMzPFOwS5myq91A5w7qky8bCS6l/KvxASPGbdU8Adx/NGJlsxLLFLpKSD2N?=
 =?us-ascii?Q?zBrOt8RJC7qW0mB+JXmIIGjjZI/QGFUTbFCMg/UjHa7Ia2HtT4Ch2pRfBX8i?=
 =?us-ascii?Q?n/bDU+T6VTM63l5wTobhqADQNnj130pz5K28Q0TSxfSACue5Z/r4LJ0yUHpr?=
 =?us-ascii?Q?Qy80PgWR51ldPAlkBR0TUEjwjc6e3/Bx4762hB+Ixj09VvzdzZLDkxe3eW+p?=
 =?us-ascii?Q?ymnTOAhjTUKXLm+7JNZiIzSaCFnvyzCt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gsxuWSYTeEmTtpm0d6Ptgo7sGasqakud2RgVaAArYvLbvhfHBB2kdUxO/cmw?=
 =?us-ascii?Q?MrL2TjTw0sM1lHXGh3bXv6yg20vw0gHtGm8+/cSz8SKFU1//CdtOtnRtbAfa?=
 =?us-ascii?Q?QuksIxSjqyK5v9TKoCcPXvqQPJliHFPa3PJznwY6IeAWjkD6y4ZJEPNMd67g?=
 =?us-ascii?Q?MRtmIHRnwDZq3EgPhxGOuY26RpEX1F78onZ3qxd5IAjXp9eghDgOetBZW4xQ?=
 =?us-ascii?Q?y5GB/pPJAhgX3wfiH7imPOy1Ka+1BLwwgYXpcfz+mwAwCBrYrlIMUbExlDqL?=
 =?us-ascii?Q?v0Fqp6OFexYOnEzNOATC2z9dOo1/+bz4k+BmezQbfLthd218QcPjpbyQi252?=
 =?us-ascii?Q?yhe/nC6GUSLEmENcWwvFG88CPiCWDfSKMZ70GIjdOnh5KDomnvlWmOT6Axqe?=
 =?us-ascii?Q?p1Ct48jigRiViUH9DPYgxw54f1cQVBZe+QnnAFyN5ngSPBp/sUPI+IAxTtAj?=
 =?us-ascii?Q?T155am+RRBUP3ugMf1neBUMnnJaON0LoD8sDKo9IazgjeFp1gXErP+3VviY2?=
 =?us-ascii?Q?HFeQMiTpjBmRAFl4InqDvJXcEV1inZGuhQWzXE/g2rWSbzp4q/VAB11oBjzj?=
 =?us-ascii?Q?uuDrHxC2fvjeJdIvMctiRIuCWt7VLWm3ftFBUZeNFnClYJa72ey3ZdEkWGO1?=
 =?us-ascii?Q?87twL31ohsF9WBWQOglKYjY457AAQHq7itdo03BscspxnyMePqlJhS8/4UEV?=
 =?us-ascii?Q?WeFjf24bKp+3+01V9ZuYztqY1M6SMDWHi3BPijwwDVoKWh0eNYU98QrZGSJn?=
 =?us-ascii?Q?mAVrF5GajtzBmEHADhFPYjJSfzPQ2XnLSzwrrvojS4/L2nle/8xuUsmsLbRP?=
 =?us-ascii?Q?bn3D5C4hJkzSYQi2+75j7GC58J3tj8JyLa9NmbfV8aytQewjwg0c3mJATVX0?=
 =?us-ascii?Q?tiZHL0T/5dSdhbOOKw+QnnbLZgj00mCsfmWWkZoIdDivQ6+R4J2zs5KroLp/?=
 =?us-ascii?Q?CoQ6XlPCoFEnuKTTG3ZB0SfRKOhdnCvg5U22Uh4fazUvF9ZD10vaEb5KpoQv?=
 =?us-ascii?Q?U4ABF2vBZiP78xTP1sMNNro7oX8hSgYcW455dlDxEnlznMYCgYXL+ZmeHcPC?=
 =?us-ascii?Q?6YoUUdG4GReVssc3+KUdhsRvAxgBoSzuoh/vasBzQuuECNvcFdlzLXNd+E8g?=
 =?us-ascii?Q?8YG4w+AgqY1tIcqYJR8sCigACBmiqh0U4fZhxKpXPW5JAOFfR6grxvrXFzJq?=
 =?us-ascii?Q?DtFccpNDontOtZUj8m3aaou9zLzL8qAXYk1+P6yI8fYZ1y07y/vruAcE/MNP?=
 =?us-ascii?Q?K11PmTCvtxRf060ijvOjNy7NkjCyst0883H4UWG+zIHpbvoxgb4zKg594Flg?=
 =?us-ascii?Q?RGjqVy3N3iz+RLi1t6sRnnePP0KG81hSrIzVdrD3jGtv4a65ghPse1iUh4qc?=
 =?us-ascii?Q?byxtDX8GQC90KSbSsMt06o9ZZkakVbunUGYA45zbiYNSQtjHotTnoL1T1SYd?=
 =?us-ascii?Q?zhvoWDbxVii5Mx8xvk+dxBy4jQAL1Qd6/CeX/CnsQVNAYpJJAwoCmslTzX2a?=
 =?us-ascii?Q?onUUNUe8mGR7guIWa/Jd3fgCA8nrY/B8A8sUvjkpsjdaoXDeGSBlnY7XDiOB?=
 =?us-ascii?Q?Baaugni2Vg7JJHB8jYw95JjeKUkdPVFYRauXGMtbt1up4txnUl1PIGLxAXfo?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c80d7d-48a4-495e-67a7-08de320a9bcc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 01:23:47.9070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khrwRF9OsB/Fnq+MUPDlqERQhulWjA3SZk4Pm6Qq9kxJ13a1h83RJ3pnIhMPIdhmKp22k6ZXF3fNYEkPYlRXCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7846
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

On Mon, Dec 01, 2025 at 10:39:45AM -0800, Matthew Brost wrote:

Fellow DRM sched maintainers - going to merge the first two patches in
this series to drm-misc-next two days from now unless I hear an
objection.

Matt 

> At XDC, we discussed that drivers should avoid accessing DRM scheduler
> internals, misusing DRM scheduler locks, and adopt a well-defined
> pending job list iterator. This series proposes the necessary changes to
> the DRM scheduler to bring Xe in line with that agreement and updates Xe
> to use the new DRM scheduler API.
> 
> While here, cleanup LR queue handling and simplify GuC state machine in
> Xe too. Also rework LRC timestamp sampling to avoid scheduling toggle.
> 
> v2:
>  - Fix checkpatch / naming issues
> v3:
>  - Only allow pending job list iterator to be called on stopped schedulers
>  - Cleanup LR queue handling / fix a few misselanous Xe scheduler issues
> v4:
>  - Address Niranjana's feedback
>  - Add patch to avoid toggling scheduler state in the TDR
> v5:
>  - Rebase
>  - Fixup LRC timeout check (Umesh)
> v6:
>  - Fix VF bugs (Testing)
> v7:
>  - Disable timestamp WA on VF
> 
> Matt
> 
> Matthew Brost (9):
>   drm/sched: Add several job helpers to avoid drivers touching scheduler
>     state
>   drm/sched: Add pending job list iterator
>   drm/xe: Add dedicated message lock
>   drm/xe: Stop abusing DRM scheduler internals
>   drm/xe: Only toggle scheduling in TDR if GuC is running
>   drm/xe: Do not deregister queues in TDR
>   drm/xe: Remove special casing for LR queues in submission
>   drm/xe: Disable timestamp WA on VFs
>   drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR
> 
>  drivers/gpu/drm/scheduler/sched_main.c       |   4 +-
>  drivers/gpu/drm/xe/xe_gpu_scheduler.c        |   9 +-
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h        |  37 +-
>  drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |   2 +
>  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 -
>  drivers/gpu/drm/xe/xe_guc_submit.c           | 362 +++----------------
>  drivers/gpu/drm/xe/xe_guc_submit_types.h     |  11 -
>  drivers/gpu/drm/xe/xe_hw_fence.c             |  16 -
>  drivers/gpu/drm/xe/xe_hw_fence.h             |   2 -
>  drivers/gpu/drm/xe/xe_lrc.c                  |  45 ++-
>  drivers/gpu/drm/xe/xe_lrc.h                  |   3 +-
>  drivers/gpu/drm/xe/xe_ring_ops.c             |  25 +-
>  drivers/gpu/drm/xe/xe_sched_job.c            |   1 +
>  drivers/gpu/drm/xe/xe_sched_job_types.h      |   2 +
>  drivers/gpu/drm/xe/xe_trace.h                |   5 -
>  include/drm/gpu_scheduler.h                  |  82 +++++
>  16 files changed, 211 insertions(+), 397 deletions(-)
> 
> -- 
> 2.34.1
> 
