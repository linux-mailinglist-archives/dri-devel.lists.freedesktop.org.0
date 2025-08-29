Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D342AB3BC81
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 15:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4307010EBB7;
	Fri, 29 Aug 2025 13:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnSsq04z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07A910EBB5;
 Fri, 29 Aug 2025 13:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756473943; x=1788009943;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kOF6EFlYmwmnNRsRcg0Thz8UK9IWjOzJyjbqsKEn8IQ=;
 b=MnSsq04zvS+ywLw11G+GDQjYRhUpYNb2puw/Ql6GlV32SVEAdhKWszQQ
 uS6c3BUU9XUhcj9mHoKvyAmXabaKsQ31q19g+bSE+juh1FzLCjCw8rnFw
 Z5+gbo/O1aGguUJbS9XDSaKcUwJI1XQlwX8m8mvhsf/AwrBrisRRefP/i
 YJqGrNzJgygw5kasXodgchXZniMWWmb15tm36NPzhssqlkxmPKUd8ZU0/
 wMiOGDEaHb3ra/1+m525P7ow6WQ/WgpFGVHxJ0OWr5iNfgrI4hjWBv7xp
 eGyXV2OzRsrW3c1dHKw5Ma8f3msoHRb3CRQFtRKSc7pjNXwHU5xUTahMV A==;
X-CSE-ConnectionGUID: pJWd9ATWS06GtIyrvIFSbQ==
X-CSE-MsgGUID: FvGurPdiQ3i45qjL32EMWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="76211212"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="76211212"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 06:25:21 -0700
X-CSE-ConnectionGUID: eCGaFlVVT8udYaycXPLIuw==
X-CSE-MsgGUID: daT6VAsjTx6zhpZ3lzdGEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="201294796"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 06:25:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 06:25:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 06:25:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.83)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 06:25:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ucl5MX5O8EQOCDyWsqAjSZNbRzuuTQ5N5ARAsSPs0IZEg6EAeFNqO8cVXQ+LJioip36MTLVf0VfISIcdQVrNEWP+vh7Uc5jckzXFh50Iqyn/Cmy6pSJBq3BrMrr+Yz1FcivW51roZ0rkGUwCME2mr/wJKHP7qkAtUmePbnKUl+sgsN5vHXe5Yb8+bhEph++FCK8XJz6X0oKxz80S03n33Zerb9LqTLuZmo5CVazLSMjadao2zy1K98BN5U1cu+c7w7nk8Lm1QuO9/XVGdk3cuwxnfC/mjNCP+pk5zlLELs6BhbP+z+Spv7cpVg5iPR3vc2Q7Y3jNDEaDVteA0lflEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDqmHbM/jZmdwZnjGmUpp2UefA3ag3vzsCOXxTEbWnQ=;
 b=FoWlLxosU3ubjzVwiZMV2yJysNh2TN4GSucgfy+8DuXHcg6Zky16nJ9aQMmUhg1MT1sN9V5p6pdRVJCivItDLmPq2bSdvTHRcMcDiAXJliYNVSJ4xkaeNkD8CsZ5fmwMx4YWRsMSynYMpoW4kiV2ZZDCEVwPcn5Psqo8glNqr3Fdpd9x5SPxAbFnrkmUqwPILmUTN2mHJyLwjCxrGpF+boUvu2Pjfq4T7ok7HwOG7g3Ku4zMg8arV2PgKYi0cYS5I/fBOpSU2mw7UZCEiEHkEdymCOI3SePOcuR78zDInEk2oIbJoQjnhUpEgB87zgaWId08V1d+qpmofDrvY0zePQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 SJ0PR11MB5815.namprd11.prod.outlook.com (2603:10b6:a03:426::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.15; Fri, 29 Aug 2025 13:25:12 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::31fd:4de2:2775:396f%4]) with mapi id 15.20.9073.014; Fri, 29 Aug 2025
 13:25:12 +0000
Date: Fri, 29 Aug 2025 08:25:09 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH][next] drm/xe: Avoid dozens of
 -Wflex-array-member-not-at-end warnings
Message-ID: <rskjz3ylzfvccujrm7mxsg6adcbjdtziuxedw44sukeny3msm5@2pcsyz3g2dsm>
References: <aLGA3RVR2JIEnNhc@kspp>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aLGA3RVR2JIEnNhc@kspp>
X-ClientProxiedBy: BY3PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::21) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|SJ0PR11MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: 6134c71a-5c2b-4e09-e65b-08dde6ff7ba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l1JE3E3ziNU6Mxz5s8IFD0IgFITKaF7bGRVkICO5Gs+A63c99njY/QiOQ78G?=
 =?us-ascii?Q?AHIfdYECG0bVrdCI8b/Gfl+zaXFzZVfmFGlsIX6iZJD6qTAged5rHlHXoIdv?=
 =?us-ascii?Q?0vd6dNUlnQFdSgVAVQglau3JXE0mDPFP91BJPpn0A13O/eKf8v3ur0aIJHnW?=
 =?us-ascii?Q?VdMtRAXp9nMaWRbPJLe7GqI4ru+umBYxiQDT6hB+5AjjEYMO6woRteyRBFFI?=
 =?us-ascii?Q?08pLAr5ZoO0zHbLyycqABnCqUwe8V2WdRmxVoJxTJ30PMWIOCFrohUoWbbVi?=
 =?us-ascii?Q?TFZ2n5nXpNZtZzceTuK1WGMVI0qoMgFI66CjVNF9wOBHEsZ6StSc0bBZSnR7?=
 =?us-ascii?Q?EAG9/KU7BfgEESEuzSKu3EykLtWF9Z5PX7BWaAcWp8fADsMFD1onddE1tjEK?=
 =?us-ascii?Q?61mdQbMBfNBjWZkrccDjyyrHKh1H2z3JWws0jjWiWh1pfB9PTF8/PlGjBKyq?=
 =?us-ascii?Q?njFuZLpNI49HmVBK3Gk8Fd1W7VyJJKY1HZx3vmoph28LQbOLkVf8Y0oyOK4w?=
 =?us-ascii?Q?LRfj8eQsednxmC3v+LiJLeGx2rsA1ikEbotzihKVyqpiREcY2IeUT0BEAjVw?=
 =?us-ascii?Q?yb0IdQXaRo/RTjm4frDU7l8SgyZ/Gps0Y3OFBhJgaLCi6vl6Q4fAovAIOXff?=
 =?us-ascii?Q?FKOhtz8lmLuKtnQr4Au0vsnWX4haUHIMDVv5/+yvjVi/3ZgEeT0Y9hS5osrh?=
 =?us-ascii?Q?Vfeo6a9IWws4QH6pF7/B60ged4+TMnV6BEVJbAKZWAyZIwvqcnGQcXCrMivB?=
 =?us-ascii?Q?UFl2603Mmdtur8RcltiZdIOqkld45a3pKQAyv9acGqmhXSRDI+MSyusQr8ex?=
 =?us-ascii?Q?ifxCOj4n7UArwBpMXhs/Aq47Nzz7nHtVjKVOAIbMmFB1YEcRFrylb1x2VA1d?=
 =?us-ascii?Q?oPs1u3yQzAKOoBpY0JUd7g38jNwJuW5A8Wie5QeYfQQNebajyyin6VEr103J?=
 =?us-ascii?Q?XpYqnMGJSuBPnCNEA/6Lxej0slEYz7JpYyY0RZzH+3FLxMal7dko36CqDc/p?=
 =?us-ascii?Q?lidjM6oBXBmd821ntzWAu0qrCXL44Hfj7ItSrgnvN4N89WEsQftNNAJM0/+j?=
 =?us-ascii?Q?8WdgrvILBe5HQWXpGSjq5zMbsB1eum0c8Ksm2Zp+6CC8cAcYcdFOj0tRdKHf?=
 =?us-ascii?Q?ILuN1dBO5xO0Td3HZxCZYm6kWewzayck8HWGsx67PwVzWTTvHKuwH6zzSPns?=
 =?us-ascii?Q?/8YPCKvQASyhFtLIPWTpGgeC/iU+m7hTkKSjrHMknpMlucnTP6z/F+ayN41k?=
 =?us-ascii?Q?2cFwGBaowbrAZQXyTtrQFUGU/XWkAZsxK3TulfgcQZxfsiOJT6m6qQ/yLwFE?=
 =?us-ascii?Q?qeYPiUlmbRuGCQ2L33q0BlslojrURjspFtG0rlY6mlX5RXrhkWsMHWByV0lA?=
 =?us-ascii?Q?ggyE9tcVASF6ax2eudA+VoRX6G7NiaR2kgMfoLbFcUxGZgcZsEpOa7KuMqXY?=
 =?us-ascii?Q?S3c836N1Sr8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kv6AcBMCV7WcvKck3dry4158sQOSduG5H5Fk+NLC1SHcxVxxrdcbcoRoC8tX?=
 =?us-ascii?Q?YUmpyeJ6nSg3AW7VIveSAn4McT1iPUdl4aaoXWJ53Iu7PF9oZ3ENcoBPennq?=
 =?us-ascii?Q?N6JNF5BoTe3kbYZflohqn29gaJZzOSgqqIq/f3a+TQMrAtDk2i9AUYyk36j+?=
 =?us-ascii?Q?QZLepqEAcNkaBGzJlzW0sRwjJJC5Ak1kjissef/M2jk9rzvxpLge4bYx420l?=
 =?us-ascii?Q?xoVU+HcG8Lkzr0IuPih91bHQSTFJne9u05MZJIXWDixJe78Qf/g0LaEK1NhE?=
 =?us-ascii?Q?oU8vuq5wO/EHQGjnSZvuZCg1+lmkjIjrMKnn1l05sJxqOaKmnqRJndvH0GS7?=
 =?us-ascii?Q?Xa8J+A70q3U1FAnkebiJI4VAn6Vkwd9sIaGHPMLh/FCY9IKRXPxyX+xosB1D?=
 =?us-ascii?Q?Cea3pJv1RinTX7XtmBgJebFGZOk1FA0ph6aQ1f8neDUNC9OX5cgd3ZpuORn/?=
 =?us-ascii?Q?QHImUX53LDSrl2l5X16MO0+7+TQd72FOAu60I+ky+nJoNgg20zeW25xk7X9Q?=
 =?us-ascii?Q?cHNCAtnMfgxuAeebXeH0JpqPzE4KiSx1R4eV9SM1wx8xkkUom/MTgB+HZy/j?=
 =?us-ascii?Q?SXjvuCUtYAbhIogIQ6OHukZ62hzOJr5qc/pp1Jux6D8Lkxrbk8zRhFt2rnw/?=
 =?us-ascii?Q?50+BxOQ7LwMI+BVC+ta7y1gIvJlCcYB8vsMpWccf38nxHi015Bvi+95Z1ukT?=
 =?us-ascii?Q?bPKcqrvIwTaoAheffE4O2+5u1+P+ypyk8Dh+1WgElWJGkRjkoIyGYaI3rBDi?=
 =?us-ascii?Q?MrrZNsipt6/M0wtgn8SRFFSYqTdmIlkSnAgnW8oF912uMnFFyAVjLr8KoxTE?=
 =?us-ascii?Q?Q18do2GPQZnV5xrjAcbYO9hRU0rUSEdBZYiM/F6NBTk9v+GC8PESSpeo1hs9?=
 =?us-ascii?Q?yMP+tSlj7x7iF+I84OX/iC8/MeqsX1Ya21I5ayKWjxM6cSS3TQDK7ZqX3OyM?=
 =?us-ascii?Q?ZKsw5dyNXoVDLjtTu+3H/X8mEgHATGc5PSmob2ZLlhnKy4NWOi6qx8/7vD2p?=
 =?us-ascii?Q?csl2eMu+Ic8HZTUqWo4yqi1mo8f0aaMIXcRZD5j6EzMKAFTFttLouXCDVs19?=
 =?us-ascii?Q?yDqJYyGChMZV8+GbYOaLmXD7gw80HvGqE3pyASqGauPys01AM/yS0p+X23Vw?=
 =?us-ascii?Q?qW+jIexYQMoVoqddP6ta3fk8k1Ea2iyFU9ArYAVU66WzsrsjSLGw9Az3C/Oj?=
 =?us-ascii?Q?eE9ZYERfqy233G2dWJh9Zzd6GxUWLLxlCNVeTjDH5VQt/9w2Xy/TEY1cjubW?=
 =?us-ascii?Q?kGAYt/A18dFTLIqeBFwx/8PZmwyTFLxVGnmHi3vkIRWpuQXioowyrN+H5rp7?=
 =?us-ascii?Q?gWW8dUsyo1X24LyE0DDti9arq164iKB2XjSDCRxwX2T6pKk8LlwjDeRjNStW?=
 =?us-ascii?Q?9LSseH6nnsSdiCu5yhxvzF5zQAlvje1IhvdxcQV2ycrMYU1cxuBKlke2Y7q1?=
 =?us-ascii?Q?ISEnpsLw/atBcjiQg0qkT72gvhNjD2d0J/33fo1KtbKViFX8vHsqgVwlHgUf?=
 =?us-ascii?Q?tGVEkXGITUIjrtdmHPNhLs0uKB9WsB/ggQ2jNnjCwLzQ/9sCbJ0H3OBb6UVF?=
 =?us-ascii?Q?JXlG9FYhzfPM8e/HxBsoeDFrFWwieJICkSDTCUSXAIruCqoTVV01c3ThDdyI?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6134c71a-5c2b-4e09-e65b-08dde6ff7ba1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 13:25:12.5256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2TQVXhl++POqmowvqoQHnD3Tf8z5VuctZUzMPPoMowTHjnh62WHFJ2yDrRSegFYpnlWJO1cYSgXopsNQRSjU6YPb5HlPHY5vZf+jHr0Sso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5815
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

On Fri, Aug 29, 2025 at 12:28:45PM +0200, Gustavo A. R. Silva wrote:
>-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
>getting ready to enable it, globally.
>
>Move the conflicting declaration to the end of the corresponding
>structure. Notice that `struct dev_pagemap` is a flexible structure,
>this is a structure that contains a flexible-array member.
>
>Fix 56 of the following type of warnings:
>drivers/gpu/drm/xe/xe_vram_types.h:69:28: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

should this patch be together with actually enabling the warning (at
least locally in xe) so we don't re-introduce it? From the user side
it's not obvious that dev_pagemap itself contains an array so it can
only be embedded at the end.

Lucas De Marchi

>
>Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>---
> drivers/gpu/drm/xe/xe_vram_types.h | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
>index 83772dcbf1af..183d358da741 100644
>--- a/drivers/gpu/drm/xe/xe_vram_types.h
>+++ b/drivers/gpu/drm/xe/xe_vram_types.h
>@@ -66,8 +66,6 @@ struct xe_vram_region {
> #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> 	/** @migrate: Back pointer to migrate */
> 	struct xe_migrate *migrate;
>-	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
>-	struct dev_pagemap pagemap;
> 	/**
> 	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
> 	 * pages of this tile.
>@@ -79,6 +77,8 @@ struct xe_vram_region {
> 	 * This is generated when remap device memory as ZONE_DEVICE
> 	 */
> 	resource_size_t hpa_base;
>+	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
>+	struct dev_pagemap pagemap;
> #endif
> };
>
>-- 
>2.43.0
>
