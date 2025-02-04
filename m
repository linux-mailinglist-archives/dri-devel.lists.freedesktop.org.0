Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D16AA2783F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 18:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3290710E6CA;
	Tue,  4 Feb 2025 17:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PI60/4XC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC9710E6C7;
 Tue,  4 Feb 2025 17:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738689866; x=1770225866;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ouM63RFLjqWffI1xiU0AVqUFn+5U2etZN4bQY+sEq9A=;
 b=PI60/4XC+Jl0iZzBKoOS9OAi9hMpe4Q10oj6AJWRl2FzD21KGqAQLfiw
 zNop+QvgW/ZWZxoMlFaAZ682pd/KqPb2//Sp932+2uVxV/c+BTsop+cq4
 i7NR2C99+12NMOYKvFJ6LIQaFvP4q/X9gCQCXpVnfjO8hP14jgqL4rszM
 N9qEkubEH1mHrPJ9WgMZN/iYFoudbgztIrjumBmhOvZpzEdVhjt8z+4p1
 uwZaFpu6L1e8j7HRT3ZKR/SCpVeL+j1jlKPQHYXawn3y7UyOI3ig9BTfs
 xgzdVIBb6GFvRDiGMaNKt2B2yb8t2h/k3lNAgOXrK7/1Kv0ijWz/UEqEX Q==;
X-CSE-ConnectionGUID: Y2hVb59CSHKHeJGoqOOMpg==
X-CSE-MsgGUID: ZxkKfj2PTWSwJKun4mW+cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38457957"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="38457957"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 09:24:25 -0800
X-CSE-ConnectionGUID: 2yA4+7SxSQ2XWI9lwklnQQ==
X-CSE-MsgGUID: 7dhkaDQ5SryZ3zJcvJ61cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="110535056"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 09:24:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 09:24:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 09:24:24 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 09:24:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqQv9HvAabOi7KJRxpQb0DZwgp5lHEKxVuIlo6KrsmJhYNeYhQjkkHNsZ/NDFZvesWDCbwtAxy9kruELVBug4OYbLpA73zN507UwovfWjN92pw40pg692YY7+Wf1nK+7YQE/l86CHrasDo9ME+0q2GRu3DuXemkha3WjeOoxdWaIyMdKa99gTQqRBMKO52ylPceGrBzdb9vv5i+miQAbL5cDzv7+2Hnvak61zF7EeEdV2SdVVub2WPKe0gtBeB18l8Y/ypOIRyuPPqo/8l9xoCCLPiLVTXTLUofgAvfMpupOhqCUohn2lvs1Q4X5l9Lq5c5xt1rZn67/vi8RBr43/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEpTBO7FwlE2PeJPd7ldl1QysScQN9aFZGBmE3pXiN8=;
 b=I0WVuadzMeMzuhXlS63Ei2tP+R655yBN573/7YW0411iSr6lO4kU2URZ5uvk6mQTMLueniMe2+oqrpA3kv8oZMEL9mWQVoCI0BUJkqFxHvbZxWHuJosV9cvPQRy0Y+vBuoP47ojddajn3Us5m6CVvlTatqqTKxG7dJb7jgtpDUO5oPAZRZBxQE/MnKR7cqWuJXqNrpms65kt9UUr6exDje2ve9TtbATD/UwrDaPDGbR1x3d3sR7lpItvTOz7Rz+KKnDcdIPaYZrlfCjZFyqZyjIFXz9Z+tAc2/KLpIjzKZ8SQ1cf81xvsCbHuT+fnAvM4RnWJcnpVNuw0vQmCRigag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by IA1PR11MB7344.namprd11.prod.outlook.com (2603:10b6:208:423::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 17:23:40 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 17:23:40 +0000
Date: Tue, 4 Feb 2025 12:23:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <lucas.demarchi@intel.com>,
 <jani.nikula@linux.intel.com>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <anshuman.gupta@intel.com>, <andriy.shevchenko@linux.intel.com>,
 <lina@asahilina.net>, <michal.wajdeczko@intel.com>, <andrealmeid@igalia.com>, 
 <amd-gfx@lists.freedesktop.org>, <kernel-dev@igalia.com>,
 <xaver.hugl@kde.org>, <pekka.paalanen@haloniitty.fi>
Subject: Re: [PATCH v12 3/5] drm/xe: Use device wedged event
Message-ID: <Z6JNFk5FiNtDIoiu@intel.com>
References: <20250204070528.1919158-1-raag.jadav@intel.com>
 <20250204070528.1919158-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250204070528.1919158-4-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:303:8d::34) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|IA1PR11MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 936bb27c-8863-4a1a-f122-08dd4540aad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d+ybJL7OA9njgEEjliLKrWy/rXDkVwJlEtpvKGkRZzqIgwnO/enoKR7m9UcR?=
 =?us-ascii?Q?yrMg+pfViLQDkOJse48bRY1R4IEox0mDfItKIS9xzb1EE+aQT3VKHM6HKQDh?=
 =?us-ascii?Q?9AQwL8bFs7v9VWSDzu+N9d3U9fAqHHTVY2G7QNXMuVIICE4uqQHxg4v9ywq8?=
 =?us-ascii?Q?KnARfF3+8XSLJPEr8OgR57zNY3Vt5uFunyqDMgMjU4PsPIpE1jxEWpTVQkAz?=
 =?us-ascii?Q?Q/fsnSBI5CQ0+YhRG9r4LaYFfBpdy7V/ezce+ViPnEQn8Jdm1DqstKfgvZlc?=
 =?us-ascii?Q?AJwaKcqQxTIIlakw1eLADEO0R3tTXpD0DbfVqA/RCCskUzEaEHdO6CG0Wc0k?=
 =?us-ascii?Q?4wQa9gZgrPBVJ+3DwL1mbxaKlzir0d594ZC/RY9eNacxTjbuFpXuGUL0xQUF?=
 =?us-ascii?Q?SsepOF808usc0hjnSuGxTnTJZeSD6prnj8panB1WSkDDwjUkbbwH2r4XIpwY?=
 =?us-ascii?Q?JEUe6TgYKBhksxygBr4bA3MneuhDld6z5ipWSCk4GAxbaZ0I38NF6bbQ95g4?=
 =?us-ascii?Q?zZYdh5nlL/Y+czcDBLcAMg2aQ7gBLTtiigFuOuSJCf+QC3EMocANJtdlBucH?=
 =?us-ascii?Q?oym2voZvJ2+n9n1IyKYdFAdoNOA5dPBeG6hELGgfK91wwHC+UQPk0iZPb5bi?=
 =?us-ascii?Q?xFzzNJD+mLiI5rCQLQhlvL+Xil0pnERJ+SdhnaqZOduU1HCGQDVNCSvKSN/d?=
 =?us-ascii?Q?oI1l25TGygqws7SOhWHOGvmwCpTTSJjiRHvbUFqsjKnaRJC5kCS4XXUjbHpk?=
 =?us-ascii?Q?Tt7DeUGUc+QFFyLHFRYCc/UVrfGHjrzVlsO1NvKMR6HtZVHQzmQ6sMWVuPUz?=
 =?us-ascii?Q?S17dxCOgK/iZmWOYZGVSPBiMegIFDPG5eXKHsdzyZbS8lCCRtRFbrp4fe+b1?=
 =?us-ascii?Q?G47hzm+YewNqxWjylwYe3O7MmaMko7YRiWMOfB92bvtYAPU5SCgbRRaYVxV9?=
 =?us-ascii?Q?tViTiepV67kw1KfM06XC43o338ZDyl1fZ1dzsT99FB/Bs6LP5sLtOErcgeOQ?=
 =?us-ascii?Q?hmZHoZOSJWaYfK7hAK5SFB0TG7CIrojn/RbTIOgVxInZGAvaY6IctnihtkUW?=
 =?us-ascii?Q?mzIRVAeiekB8UI8Uw/9otr5I1wMcaejE+Lb8EGHV3w1ZDKvu/zgxXtsj1z16?=
 =?us-ascii?Q?6+iOAF2s2n5nXiINRO+wAVP2Ytk+HAlgzB/5d1nBKYTdP0GqXHXHcY+Y5XLe?=
 =?us-ascii?Q?z4jzKVz5if8xRlzkJ/cSJE8dZZEPhW3UmozJd7JNlCkEYFEub03WGRNk5o+m?=
 =?us-ascii?Q?fCOpaz/EledkqA07imVcvmKYGOvorC5riMoL580wlWSvWKJRXeHYqhyjwh6u?=
 =?us-ascii?Q?06S6Hm+cbaX/jjBRivxoYKZKgPLoy1pXph9ibB9DIxOu/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0QTlzFMqeBqPC5GrpPJ5zlM+NjrWmwDOSdlsHFuJu2nmNbAf3R8V7QDrC2ua?=
 =?us-ascii?Q?oyjcTFdgz7vLUPXDb/Zw3BE39zWTh8HLOW6w/46EH08ikHmyiZomnown2NdE?=
 =?us-ascii?Q?edO256le70c0D/GAawmuHS4c+y5HTV8mtI5Q3Um35cEnOGR7FenO5NdfRcJZ?=
 =?us-ascii?Q?IcuyPSmYs83kFzytuCOyHoCDIOckoOD9h3PeIn1OFfND6ab/Tw+QMVIw4zS7?=
 =?us-ascii?Q?4lb1WWNV7fWGMPQPz1hFXbylrSfSIs8dWkRkxQv/GKmeot29CnJfRECoFbSQ?=
 =?us-ascii?Q?AheWkP6R9h6NntEM/LWkG7O8s8FACwwpYH8xL9a2nt9Pa/U6RwcJyuHBINJq?=
 =?us-ascii?Q?mER7NY05RinHUgQn+30KMcXQkmYCAwdxRSXi0Cw9M+XTXBHSNNKpaF0ayfqF?=
 =?us-ascii?Q?q+xWZVBjVfootBGuIyP2vFaevC6wF+7CVNKSvTWsucHdzK+uI5lD/uiPQvCO?=
 =?us-ascii?Q?so5pKuJOGAa5u+yFoBCNQWzmc8JNGc5wNCHA0M7lO4/Q+WDRu7509UIXFhV0?=
 =?us-ascii?Q?DPLg78UePSEjKbYn3rqv+D2RBxbAaVJdPMGBQerwrbpdBn69OBx9P9z5xyAi?=
 =?us-ascii?Q?TmUTVjGhHD1KvAN/vobuyzMT41zifFSpMG5skjgO/U9OhwfDA3sTt1df1BGD?=
 =?us-ascii?Q?QlAZtU3lJ8WY0e1djSCKLAJqaCvk/sFb1b4AepfBYGgcEuDcmsyXn5mPzdfg?=
 =?us-ascii?Q?so10n/Foc5h3TcVwVhB40KRkCxyJc8PRr/5wdIits5OVxMmksuZLNnYdvmGd?=
 =?us-ascii?Q?rpZZ6OcjgLSV6NaiXTicIj83iDhRi8wVCaQ6Z+EOFcf+oKBDedoV5YS1O/MD?=
 =?us-ascii?Q?X7DzFr0yTaMcDUd3NObKpiJ2yRfb91SC+F1V5LQAWjvIuyCkSOhgnxKgG+3y?=
 =?us-ascii?Q?fQTA3z9OREk6PrFdST6qU0TtOpSJlVgMt5jVynyH29U9rU1Nlwgdy5KARkIL?=
 =?us-ascii?Q?Xps2c1ZpiNpXG/AiriR2RC2kgysCryLO7oDvNP3Ofdx5/rE9+jWSWqTDRszR?=
 =?us-ascii?Q?iEs2/OWTnSD2wquefslXFb5JsYeU6NTEflR7r9zPZkY34rqlRAI2EQYW7T+m?=
 =?us-ascii?Q?fyo1+pbVFLG5uELzwxU3exJQOSHm0iNQyHVM2i4uCVY8N2cBg7kRhk3ia9j0?=
 =?us-ascii?Q?kITkr9G9KHfMoq8UjD6po7dgXF7Bxy3oL0mXjkrKeXhgQ6juhjh1q7ggb0oI?=
 =?us-ascii?Q?v983pEIKbEHl8yk+18KyXFajU7mkK6bp4Fd7WmEuNwQ5n7Bqe2/WYG1MFYZ2?=
 =?us-ascii?Q?6NzSjoU5wc4sMXxB/6QdIsGBT6MXrHLv1mEDSx+eTjyFrTiGWyeUntlgWugU?=
 =?us-ascii?Q?KJv4H6i+GR9xXmYx0V0kWimuMTgBZ1PPH6Nn+YOMvxmmUCq3n8S7A9VvydTH?=
 =?us-ascii?Q?Y0qkgrRfCdv3RynYJ0csOxEfxWCPQTSS0RgTBfRhz11L6j6D/uK0TFRFxZ0B?=
 =?us-ascii?Q?6pTZ6rMkV8oSivdhy5ZAkEw4mVMj+5QHiKeJWuqx6By+iQC2vXlGf78etOb1?=
 =?us-ascii?Q?nmF2+DAJ8NuKmRwUTIAAGzm0qDQAdrBffgGWbRsBNvVuxbl3Xg3SoK8X79Ia?=
 =?us-ascii?Q?ppN+7G2t2s4PVZbs8eQVYi5QOBnQTzs470E6kwkyf7XwPA2tPIwRyN9WlVbk?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 936bb27c-8863-4a1a-f122-08dd4540aad2
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 17:23:40.4786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fs2aOcvL53h13L+9P/fZTXdM/Anlp9QrP2dIdZGd4mWzAWy+kIleMUr7veLiMJEBYvx84+3Ya/lAxc/oLHAtVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7344
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

On Tue, Feb 04, 2025 at 12:35:26PM +0530, Raag Jadav wrote:
> This was previously attempted as xe specific reset uevent but dropped
> in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset uevent for now")
> as part of refactoring.
> 
> Now that we have device wedged event provided by DRM core, make use
> of it and support both driver rebind and bus-reset based recovery.
> With this in place userspace will be notified of wedged device, on
> the basis of which, userspace may take respective action to recover
> the device.
> 
> $ udevadm monitor --property --kernel
> monitor will print the received events for:
> KERNEL - the kernel uevent
> 
> KERNEL[265.802982] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)
> ACTION=change
> DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0
> SUBSYSTEM=drm
> WEDGED=rebind,bus-reset
> DEVNAME=/dev/dri/card0
> DEVTYPE=drm_minor
> SEQNUM=5208
> MAJOR=226
> MINOR=0
> 
> v2: Change authorship to Himal (Aravind)
>     Add uevent for all device wedged cases (Aravind)
> v3: Generic implementation in DRM subsystem (Lucas)
> v4: Change authorship to Raag (Aravind)
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>


Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

to merge this through drm-misc-next

> ---
>  drivers/gpu/drm/xe/xe_device.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f30f8f668dee..1cacefcb5afe 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1120,7 +1120,8 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>   * re-probe (unbind + bind).
>   * In this state every IOCTL will be blocked so the GT cannot be used.
>   * In general it will be called upon any critical error such as gt reset
> - * failure or guc loading failure.
> + * failure or guc loading failure. Userspace will be notified of this state
> + * through device wedged uevent.
>   * If xe.wedged module parameter is set to 2, this function will be called
>   * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>   * snapshot capture. In this mode, GT reset won't be attempted so the state of
> @@ -1150,6 +1151,10 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
>  			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>  			dev_name(xe->drm.dev));
> +
> +		/* Notify userspace of wedged device */
> +		drm_dev_wedged_event(&xe->drm,
> +				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>  	}
>  
>  	for_each_gt(gt, xe, id)
> -- 
> 2.34.1
> 
