Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665DDAC0CFB
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DF210EE0A;
	Thu, 22 May 2025 13:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TEXCYB1Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975F110EDBE;
 Thu, 22 May 2025 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747921174; x=1779457174;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ufZEx4F4RTdsWscuGP1Rss4gpImpuBMFLaM+l4OVkTk=;
 b=TEXCYB1Ywcxiha1EDMgdjrjwgmLxYbh7VTv2VkFIowyeyFRAhhK7ez5/
 e9liU3BCe+TcgRVNv/lHFgG0UZ1ClK4+Zl/t44mRUtO975adFoDoVNIWI
 xs2invpjmpnCtsYjIXcqhTRP1QGFDr92VLJUHoDrLVORsu9ABS3BVIrWN
 fGh+HHyo2rH1gdKOjc4iyy54YsSVjHgH76s0IIjS5iDvIGUryOnYWNtox
 wYf3YAcYj9f7bgm231nr1EVbmosEbhUzVRkY4K2t93BvtdHwbtUpP1iZr
 QAwQBjIbxrcW+Gl6unfYl0h/3fknaZ4lyg5WHsc9pRwLj08MSM+NTyozf w==;
X-CSE-ConnectionGUID: OUel4WvxR8S7p9kA6g1vfw==
X-CSE-MsgGUID: yJ5xCTEpQU2Z8miolDHz1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49824684"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="49824684"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 06:39:32 -0700
X-CSE-ConnectionGUID: tcBprjgtSXiAv9MRbRmY+A==
X-CSE-MsgGUID: L4dGyo7dS9GqzLfIbYfJ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="140465176"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 06:39:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 06:39:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 06:39:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 06:39:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZI4egMED14iwJF9yHRkDv0rTwYcwPMi35mTQkTJKNQuRdq8UfzhqoXBOq1pTq1SByYW6vEnLK3zqmU6E30pQ5A+gJ9AO+Wl1zIGmh0hH/UdS5j6ByzeZDBvbEZq1yW+f1mGLSkiG9i7TQPdv88Pz5UzQXvEvi07eYXdgrgaaWymdAC6U4NBZjifbBLCx4HP1YzPEgjMwpPQ7XXuLNI4nmS3g2iHIs/pH2f1IU2j82VLt2sKGHPx3p84d9R7iFg5bPw8DhuKENVgGK2TzTsZf3cE1+nL0CdQmDWmGh0IiTtUQX3NyiiCVnwqCS4L85vgUHUE1ViT1lJBvQOR3wO1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAtxuGsxZTf+1hOrS0WMHW/GcY8lXRYJpUEt58zaFE4=;
 b=AFCl3KAN4mz06V6gqFk4OB2Xnq/Eh6u+5ZH0wm7OUSog5U8nfEkum7eRO19+HVCJLkufNJklinOhJRa3dqaf2bngM+cIG4GawNhx8dMsPrntsfk/kPzYN6x2EqpD+HKfIvi+NjdSl4WFl/8o1BkWI2c6hikaSrLSS6sxa4RS7WLdJji6y6keFYFjeChxy1us7+vHkBshxlCXq5156WmytzkRhQTqvOZSzH2OilAt6rmldu+2p31kZvTgp3WDXwUbFaMOMlEjKe7MxBRMgyyh8lBtlsOKA+xhthx4qMBxZ8FB+wUaRy57zgbObN7Nbiosf0p9DSDLHzMWoTEptfmcUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6721.namprd11.prod.outlook.com (2603:10b6:510:1ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 13:39:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8746.029; Thu, 22 May 2025
 13:39:29 +0000
Date: Thu, 22 May 2025 08:39:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <tzimmermann@suse.de>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/9] drm/qxl: avoid accessing iosys_map internals.
Message-ID: <5odmlq4j6poqg6p2b5t5kdtax2qbieqq4j7bufolq5daexxchl@425tg3vwmm5i>
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-6-airlied@gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250522065519.318013-6-airlied@gmail.com>
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d404d1a-0628-40f8-46b3-08dd99361372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rsv5dWXRDdQ/FqYuhynL+tD8Y8mrq6NrWU3Ie8VlTlj4sD5tGM+35vjsijxv?=
 =?us-ascii?Q?SoervYuPgD3ZQotrig6eUvRVTnKnH/W/Dm1UwdAsodn57LBwxZP+ZGtIlA/U?=
 =?us-ascii?Q?GT2yZbWasYIo4DYk+neT8q8NxAqpwqgXyXZHZXqYNi/tIxdA6ZIQUB05Bp5K?=
 =?us-ascii?Q?t9xkW0C9v/OrYKztBWpA9YHMiKbWjlA9nwO9HTCqNcBufzNoc2lEf+doWwTg?=
 =?us-ascii?Q?8yVL+EqEqDgAFpvd6Tn0zQP6HyJTDWxgSSDqc9y9QYX/mu4XmrKDu3O5mePk?=
 =?us-ascii?Q?VCeMMJnvfpXXvZVN3LgGuP9PHH5TxcvojAL624H44SiN/otf4TnuoFwZ6jw1?=
 =?us-ascii?Q?8xjLTAm8rdCrOANCV6ToNZctuNdOi9sPBYX0nklN3NnhdBm++27PGeDFRrxB?=
 =?us-ascii?Q?FAPQzffw3oPl03Peauxv2hZHLDvu6VR6u8VxdRMiwWGy0RIebBHAv1tsCjg1?=
 =?us-ascii?Q?qQ5W25LSB6fO2fN49KDP44LsQyunCcRrrMHT/qL9FRrEGBut6g+Jlv0Co0ED?=
 =?us-ascii?Q?80kW0i2/COlC1lRcyYVwmN2CcWqfccokNqjDUltzw5c/Pv1Zqv13ClzkTHx1?=
 =?us-ascii?Q?3aGojA/KnzfiRBSKN15jJmjVrV8uQa+Ir1k1iGUJGaM2vdv9/SJxJAnntiXd?=
 =?us-ascii?Q?QKgK560nwqD8NRjOw0tRVHIEg9YoRvWPCiGa7EI1Fg1Lgl3YC+K//SnmNadK?=
 =?us-ascii?Q?c0VOC6GZiXQ5spnpYSVrDpapD5nrFqRyW0B7NdKTTYm6/cRx87DY12/z1Fdg?=
 =?us-ascii?Q?y0QDewlzm1N6X2Bjrvm29gcXxtvi9gKMT6qn+yalU1utqf4Ajdd0/u4Wt+so?=
 =?us-ascii?Q?aBoJAjtCbbHlwffo2vSIlirY/eZZH6WVxOXtHTCf6otpXyiJKTAhwn5xjXs7?=
 =?us-ascii?Q?jt3RCesb7FWRhgOpGHne3xlW/KKro2HBqKC3xFmgHAgD4R0gZFS+YLgf4zD/?=
 =?us-ascii?Q?ux9pBYCXhPrYFHmkLnZrSUs34GCRnbtF9XX9Dc4KjAgOIg/DQzjWmieI4e+Y?=
 =?us-ascii?Q?4rnGFkq0H0yJ1o7dunjfy2WKWZsTTJDuiuBXmzbOfKaTvh4Fsu/RKj1yqBJ8?=
 =?us-ascii?Q?urUvLjoSgiXEqxbeRhI/IsLMOENlglTYtlHxW2S+VOjRUXnUh/YKSotzOoiA?=
 =?us-ascii?Q?5xitu0Vu+AnGVsFk4PFXRlq3I+oWFEYI/aNQM1IQAqrKXoyFSZz34mxWlbcd?=
 =?us-ascii?Q?aDqdWK7FoUHKKWEAbCnXHb1SVeAUMZNGWtjPH0iquQcA9V4m9WUow7zqfxSn?=
 =?us-ascii?Q?M4ouDJEzvtdtGpRwpBPkYQzGvs8Tu3NL+eZvqlTseGcIWSafKRtYJ4LWoncq?=
 =?us-ascii?Q?z7VcuMLzWFuTm2DcrI3YOTD+sQsXcCY5QpAgABmJrYGThaDpE79Tx2Slu/Xq?=
 =?us-ascii?Q?liDiLZN+y7yU9tTsVHmRJLHSV061znb+NCIn5WHoUsPaVnalKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EHnDDn7OTsGc4GcdcxRQr/Zfy9xlLEqnzSIheps68CRzJ9HGPUgY5llkXK/I?=
 =?us-ascii?Q?lR9L9W86tqFaG9RzsmoEaqqTrB9DmfCichpW+ECxIXHEGu7RNyeJs9pnyJRH?=
 =?us-ascii?Q?ubJ5u5mfKvJqA8UKjYevUAq6Coa58NE+VbDf/kp5PflxICXJrJFx8hDFCxfW?=
 =?us-ascii?Q?t4hmj8HdZLmHwl3B4oefGTjT1DdLPWdfN0Ah8ITg+PiyG9l0pmtr8z6GOY5N?=
 =?us-ascii?Q?GNOA9fbSfvLM3/hyEvihYtcFLxnIHhsOBPdwXvlsX8R5sLoCbfQsqjnKHW2v?=
 =?us-ascii?Q?9rIfGi5YNaMiufEz8ZBTxNvrrebpsbs0zjf3aeXwIpgUuuVPLJvXeFbtEd7g?=
 =?us-ascii?Q?9ESMmzMBgOPcvusFgYXcYPIc2ZYA8Okh/di+f3ttgupr+LDVgJl0dUmHRAVi?=
 =?us-ascii?Q?q6xyQOdplq9x1aWIk3rwziGbYK10MN0DjHzfJebMM/XtNTDExxhjknUv9Pkz?=
 =?us-ascii?Q?MHkfTy5DfV8IrhMxvf1oEiSDG2nHBb9Ws+eJfKxHnF3eUzJlgiBOJfDMTWXQ?=
 =?us-ascii?Q?+fhBRQGUSjc4bMNlpGc7aSdg0LcrITR7jtF66r4ALEXqVee50GQxpFuG0RjM?=
 =?us-ascii?Q?lc0alDTig9fRY1XRKlj8KLTdzakjEPRIsmju1yDC+IELQrrIOu7PGJ50+SSE?=
 =?us-ascii?Q?SDgJ1H74kAXt+uFqjlzsJuTYb3kpOlbeDOhBmSjiSEiL7udH2aObfemqL5xs?=
 =?us-ascii?Q?vWW6FshnzK2F5h5mCw6ofRSj8JxjqCK5FZYw/91ns3i2X+tU4Oas2Rq97CCm?=
 =?us-ascii?Q?JCq27gmjYRQYivCzXhnlqllJdsABENGaP5RJ5g+to8kagZbcK4hZ32owsHGJ?=
 =?us-ascii?Q?mslOolqu4MOGcrA8oHb0gwLgD0r99BjxY32Vuh2i98wf38ULuMsh2mgOWWTN?=
 =?us-ascii?Q?1At+QJH92OgXd706DisaIVfwtRvjh/wh1WXz87mg/+cDLOWauUMg095cr3pA?=
 =?us-ascii?Q?Ud5GA0sOJKalNOMOpJhBh05BuMKX5s9wORdi+5p2ukbaIgUV3rl+kjwA2HtG?=
 =?us-ascii?Q?mSgV/INopoqr2RTWbBqldFOwXhjqNUzpXYOYf+utcyCT0jpPVxhOlIVSof8N?=
 =?us-ascii?Q?DyGlBOxbXmkOdmmx8NAbjzFUCvk8DGu0fA51qgkG1h5R1+vkfRR7a7HshyAN?=
 =?us-ascii?Q?eN5gazCe2vc+/IBMDgx8JLQD85YewEhYZe3qd7/bF85vDzCDZxbCGOgcxCHz?=
 =?us-ascii?Q?A4HVKSFjFj6JJ5uIVBz/gzJzkLmvxxulrHdWYmQ0g1sG1wpyUpYlrymr6eJP?=
 =?us-ascii?Q?HjwnvCI5+maDlY9TfX/9vND1KKZMYap5jb4RxvRdeOCIfJ7mKSGsDwNHuvZ/?=
 =?us-ascii?Q?8s3jV1YpaZztuU2Qf8B2XQxfv9IEvY2Lhkkj7Xueb378uUqiOqQnJ7MHDZkJ?=
 =?us-ascii?Q?cNFhPvNeiH03ugjB7rg2aOuLMIPfhnpJFXoBD94ICqtAi3M+R0NeBaebfGco?=
 =?us-ascii?Q?GKevv2OTrsxmFNXScTVv+RZO31y110mKblTyGj5QBw4KbMYl1YSdVPi+YA7p?=
 =?us-ascii?Q?PUo6SCkf5rRYGJk1ffvgZBbehwji0d2EzrgbVEuInWjawXu1iHQHlWlDTD9f?=
 =?us-ascii?Q?gRk7o59Izmy/ptKLvChH3Jf1pQl8U/PMHnJJgigLX4nXvYn7f5ZnR0xttEBw?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d404d1a-0628-40f8-46b3-08dd99361372
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 13:39:29.1591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1eZAbzcv+FsJ3w3VmU0TcHB4ssVlXYV68w3Qoz0qujOjmNcwAdXixc/fwp3a8J71kFKq2JsLa8PP1NnM89laNPM6wrdj3SHrjviT7qfrXIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6721
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

On Thu, May 22, 2025 at 04:52:14PM +1000, Dave Airlie wrote:
>From: Dave Airlie <airlied@redhat.com>
>
>This uses the new accessors to avoid touching the iosys_map internals.
>
>Signed-off-by: Dave Airlie <airlied@redhat.com>
>---
> drivers/gpu/drm/qxl/qxl_display.c | 14 +++++++-------
> drivers/gpu/drm/qxl/qxl_draw.c    |  4 ++--
> drivers/gpu/drm/qxl/qxl_object.c  |  8 ++++----
> 3 files changed, 13 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
>index 70aff64ced87..e833b0bbff47 100644
>--- a/drivers/gpu/drm/qxl/qxl_display.c
>+++ b/drivers/gpu/drm/qxl/qxl_display.c
>@@ -602,16 +602,16 @@ static struct qxl_bo *qxl_create_cursor(struct qxl_device *qdev,
> 	cursor.chunk.next_chunk = 0;
> 	cursor.chunk.prev_chunk = 0;
> 	cursor.chunk.data_size = size;
>-	if (cursor_map.is_iomem) {
>-		memcpy_toio(cursor_map.vaddr_iomem,
>+	if (iosys_map_is_iomem(&cursor_map)) {
>+		memcpy_toio(iosys_map_ioptr(&cursor_map),
> 			    &cursor, sizeof(cursor));
>-		memcpy_toio(cursor_map.vaddr_iomem + sizeof(cursor),
>-			    user_map.vaddr, size);
>+		memcpy_toio(iosys_map_ioptr(&cursor_map) + sizeof(cursor),
>+			    iosys_map_ptr(&user_map), size);
> 	} else {
>-		memcpy(cursor_map.vaddr,
>+		memcpy(iosys_map_ptr(&cursor_map),
> 		       &cursor, sizeof(cursor));
>-		memcpy(cursor_map.vaddr + sizeof(cursor),
>-		       user_map.vaddr, size);
>+		memcpy(iosys_map_ptr(&cursor_map) + sizeof(cursor),
>+		       iosys_map_ptr(&user_map), size);

these would better use iosys_map_memcpy_*, but could be a follow up to
this (automated?)  conversion.

> 	}
>
> 	qxl_bo_vunmap_and_unpin(user_bo);
>diff --git a/drivers/gpu/drm/qxl/qxl_draw.c b/drivers/gpu/drm/qxl/qxl_draw.c
>index 3a3e127ce297..6000936bc8d0 100644
>--- a/drivers/gpu/drm/qxl/qxl_draw.c
>+++ b/drivers/gpu/drm/qxl/qxl_draw.c
>@@ -52,7 +52,7 @@ static struct qxl_rect *drawable_set_clipping(struct qxl_device *qdev,
> 	ret = qxl_bo_vmap_locked(clips_bo, &map);
> 	if (ret)
> 		return NULL;
>-	dev_clips = map.vaddr; /* TODO: Use mapping abstraction properly */
>+	dev_clips = iosys_map_ptr(&map); /* TODO: Use mapping abstraction properly */
>
> 	dev_clips->num_rects = num_clips;
> 	dev_clips->chunk.next_chunk = 0;
>@@ -206,7 +206,7 @@ void qxl_draw_dirty_fb(struct qxl_device *qdev,
> 	ret = qxl_bo_vmap_locked(bo, &surface_map);
> 	if (ret)
> 		goto out_release_backoff;
>-	surface_base = surface_map.vaddr; /* TODO: Use mapping abstraction properly */
>+	surface_base = iosys_map_ptr(&surface_map); /* TODO: Use mapping abstraction properly */
>
> 	ret = qxl_image_init(qdev, release, dimage, surface_base,
> 			     left - dumb_shadow_offset,
>diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
>index 66635c55cf85..dcc1f6393885 100644
>--- a/drivers/gpu/drm/qxl/qxl_object.c
>+++ b/drivers/gpu/drm/qxl/qxl_object.c
>@@ -172,10 +172,10 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
> 	bo->map_count = 1;
>
> 	/* TODO: Remove kptr in favor of map everywhere. */
>-	if (bo->map.is_iomem)
>-		bo->kptr = (void *)bo->map.vaddr_iomem;
>+	if (iosys_map_is_iomem(&bo->map))
>+		bo->kptr = (void *)iosys_map_ioptr(&bo->map);

this looks wrong as we then lose the __iomem. Or is this dead code and
it's never iomem?  Anyway, pre-existent issue unrelated to this patch.

Lucas De Marchi

> 	else
>-		bo->kptr = bo->map.vaddr;
>+		bo->kptr = iosys_map_ptr(&bo->map);
>
> out:
> 	*map = bo->map;
>@@ -230,7 +230,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
> 	ret = qxl_bo_vmap_locked(bo, &bo_map);
> 	if (ret)
> 		return NULL;
>-	rptr = bo_map.vaddr; /* TODO: Use mapping abstraction properly */
>+	rptr = iosys_map_ptr(&bo_map); /* TODO: Use mapping abstraction properly */
>
> 	rptr += page_offset * PAGE_SIZE;
> 	return rptr;
>-- 
>2.49.0
>
