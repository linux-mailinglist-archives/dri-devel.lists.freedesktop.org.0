Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C1287670E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 16:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F130E10FA41;
	Fri,  8 Mar 2024 15:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C/D3Z3hY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01A210E1C8;
 Fri,  8 Mar 2024 15:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709910623; x=1741446623;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ClKJu1Ya0hAqa3wlOXsq/b56C/QV1EuUarXV2zfhk64=;
 b=C/D3Z3hYWNHVuUzWSlDcxvoNp3gabvdKl4t4VrrBuGK5d211bpL/urdJ
 l31npOwtUcbRKstJ7JxJ39LUvuOY/WDyB0IeAeTdNsVK7j3UhgXD7MAtz
 UzDtJXxm+JUKTFWg6r3JI77z/9GMsqYxl3ShYDZ4BCF/zrEl06q3Ofk0H
 okP1IblHv78yxmDhQQ40Ajd86hHiT81kWgCDiiuR2GEHOlvL4PTaV3jvJ
 mbIyQpOoa2UBW7eO3oUm+FRziphnWJGn/d4R6/6b892eWZHy4Ulst1JFu
 TXR7wQg7aa9zo9+EAdMzCMvP/cItyTP4x+9nnO5Yh0QTJmCEp8AWpRm9n g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="7578462"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="7578462"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 07:10:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10590514"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 07:10:15 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 07:10:14 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 07:10:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 07:10:14 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 07:10:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Av7VeIsa34WWMVurxdpKkMfJTtkrkd5hvLCprYNBiQKhiwkio2WbEj4fkHSX3IU7glNkqjDvN2Lagz/F54WQOWhGaDO9rymkUhgO98zApyS37zSkMcGhvNEcirK4xyfYYKlGRi7YxqfsWOnArJTBgLQW1a8TVXcmSbaPgj7uzNeXRGaYRRY6wOZA4aQDMaHM2pGJDs0ULxVmZJj3bwsew0BiF19bRjzYRbs0GT1J1ORmMOwYMHP1VKeL197KV9BcntNAoKW8wJrep4pFz9NJMoK43GPuuSJR+H1hTsasEEPt/o3ZZQUT0hVvfNEhl/HuErEQkOnYB17LQUs2TmESyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uh8IUpTaxpbH+E5gt/SmsCWTn/ilvZ1IYOhgVcC9Apk=;
 b=FOranfXPqv7xxvudy0mm542ulfpzTcYntipS7wpgUAYYYcKf0vVsIOmnuy8enlkd2JzMasHEKfKOLPtUq+8Tshvwe98LobUPoo+RTjh76cOKVuYn66/bzwzYl/KtPumdj2HqtHbVhZWabhCUISc1lSPhIKCjUdHSoVi0/7QXUoZmpVX5aAlpZY756HaQ4g0GsiCbzWWgiJJY7WTzqQcKiICrEMRde8oOHxdgO2hqszcDxohcJstFxlnj+U/6tmWCF+3H08XgKWl7oqgNF0xXs0VuOpQJjzR1oFDly0M0zasOFwNmOxF20xrChomu2u/SPLN5JZPhrcQ3uSQICqPugw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Fri, 8 Mar
 2024 15:10:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 15:10:11 +0000
Date: Fri, 8 Mar 2024 09:10:09 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Masahiro Yamada
 <masahiroy@kernel.org>
Subject: Re: [PATCH v2 07/16] drm/i915/pxp: fix i915_pxp_tee_interface.h
 kernel-doc warnings
Message-ID: <2jsd43trhsa3vocvzzp7q372dwmzm4xxmktumc74z64o2a2os2@swaaolrrrn4n>
References: <cover.1709898638.git.jani.nikula@intel.com>
 <7c26256dc00f970f94d145b73e341c36f553dfe4.1709898638.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <7c26256dc00f970f94d145b73e341c36f553dfe4.1709898638.git.jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f02e2ad-24dc-4951-7b4b-08dc3f81d9aa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ml9XD7fyGoDhgrx201kZhn6fRd0aQorPZDjF6BPlXvmtv+RcVVbJOtDcUPHzEneWXsmFhGILnFWg4zvzAkoNLrB3GqFcIYEun+BMAbjoAQ4f+TmWlNu9hDFbCi2uoXYvMJD/acBwM6mwaPt7FYpQzpmEeae9PrVDhKFpXqCQAoBBW12cJ5shp0mmSpZqeOw2Kp40b5Slt1oRlF+ToORe78Px1kdIkaJC7gZipfvfPYl7spGo8JArvrtZk5+7WGf2gtjiCJu6Wwl1jLoJKsrCL7/s1Xjg2kC+tjeFRIoAoDEevn5lj1k7BhiOWyLGkVm+OfQB8/UtQMSb0Fz7h4LU/KcQWLsfWhNoDXQHnQFeqjrA2vOrc5Xjy6H/ZkDVvHR+9hVVAM0KMJ1bQN/8e3QbONUtUEWrYCjw03Ny7M8N8n4ir54w0j6V1Hgx9O4ZTd3CPtUofPjS99gRnUyRRFtjVVJsowkJZ53nlw8K4G03W4gToZ0P1SeQPlNYfijZEcxpYin0uMzqA8wunbeLVWrrS2rW6/FPIX6qDckTY7RHzMgVyDFonTGLTQLU7MzJxTRcYvhnx2qt1dDJOjNedfs8k2XmnhYuGyrEjCCSgAPOXxghlLWX/PXut5Y3YKfvohUbzqhta/+yzB8llirLz4aYqo2yxDDkrJBOuvDjXncNeq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oe880WghoRE7J2Ecky8mNMfxv7kZNZ9GoAAu/BGH8aK55qicmoiVL4K5w/7g?=
 =?us-ascii?Q?DiLKomv6Ldgq1vNJmR51Uy60Suogu7DdKrKZeutg2KyQtBRiYElYK3GjOrOj?=
 =?us-ascii?Q?4UF0Fy7RngsAGVPyFveq42Tfy04EvjvuDpP3LK6A30jx53z0WTQ3oscqFgH4?=
 =?us-ascii?Q?EZdePeXGgTf0HRM8PxIQ13xvsS0CGOAIUpRfJdtiWk6FpoBJxUbCe6/gNbdz?=
 =?us-ascii?Q?JZp+DXBtp+cFOz7+Z0gq5BdLAS4sbkGssl07Suo4HcFI5hw2btdapzTYSLBY?=
 =?us-ascii?Q?hT6rdbn1rjaQg3CITzTRRh3oM7WITJawMsb5xY3bpeAKZ1FmKb0Y7VpaXxQt?=
 =?us-ascii?Q?cbdCnCbPQZtzHRH6rTPWbvpii/mhr1pMMWCCRYlp6SJM1PuLygMhi6LpDBMU?=
 =?us-ascii?Q?1PR9RqaPMf2De8HK1Xuq1QH8Dufgq4J9L0acngpHCSxppJR9Hfea6uG7hJwM?=
 =?us-ascii?Q?U6LjZFFho1Px9dHiJE4/JPM6hThe9mKQVFEvd1rqQqIWNy37eT6U2XVAvHRE?=
 =?us-ascii?Q?HDqrE+BIuq63PjZzHZrLC3UoU8m2RCa+DB6WBL42K5lOVRCb5E+OPUsWH1RY?=
 =?us-ascii?Q?cg3MAIeM61tY9g+nSn+UFFQnlkqTM8gc+OeS7rweVX+h8im8CPH7Q5J8pOQ+?=
 =?us-ascii?Q?ae/7u5jBsj+b2Efis/RnL/9WuSX45qU88tdwvp45KLtg4c8FAZA3ooUryaP+?=
 =?us-ascii?Q?RSLVSySbpTNUfyEVeLblukl6y56kevvD1ltE1lMhYXUKIRGPUsta6NTXzHpt?=
 =?us-ascii?Q?8lU8BliI98svZzWya8phn3f8RN3wk5fNGH34DbcN9XaMKv1D1vc7Br2+N5W8?=
 =?us-ascii?Q?KYptCtBWEtvHQO5l1Fz3riE9907jqfIr7R3TdNa2UkA+OzlV6lit0e6JfB8R?=
 =?us-ascii?Q?JifWcQFD2l5rzpby5YxKM0HbtJqbPmLCD4levQp/wyBEpQf0+fTflcDpBEc3?=
 =?us-ascii?Q?e7ZS3/WLWeoAvnwjDUBUlXBFoPbqMGkQJapyjfkhMgAoDc9yROmJFZ11owLe?=
 =?us-ascii?Q?tZgZzz94sH1OgpA+zBh2cmjuduMh3q8dMqjfE+akLtcKvbpUGnDv1JKDsS+/?=
 =?us-ascii?Q?lr3owg2hhU03lBHiYkMgMzhD1mtx5IWXxljFOrenk6Y1+xqvA/qrYrPxuesr?=
 =?us-ascii?Q?YRD6LBh3wrIHpLgInsAuvad1AJW/cQfA1OzEqt67AR6hgxF8PyQHglWfVFlJ?=
 =?us-ascii?Q?b58hFGaW233IW5seC9Y7nzcFLt087DTDYJJ4R3xtSlDm4pqM0doHM6XKi2Sq?=
 =?us-ascii?Q?Q4ee50FZz1F5UGypRfqoMZ0n5f2HHZXWzJRkUaTCiJj59dlWnUgufxwZMRa8?=
 =?us-ascii?Q?mbR5tyDF9AHYV/yV2pyYqT4kOzynSPs76UcpgGeYWtE+w6ATF3CnR7DukhVS?=
 =?us-ascii?Q?gGRZY3ml3P++seNAPMngJeP551/uql0K7TMkQmY2CeMio430RPGVWyz4AYVm?=
 =?us-ascii?Q?JePQVo3IZLrAAvtCLrf59SJkgA4GJumhdP/Yj0Ri4Q553GicpCZOnLAX+LxN?=
 =?us-ascii?Q?Ysx6GL90yxKM61nc8Sp/+uuoebnlRYJJ9Awu00HBboeIPMG8TrHVUtSN+pjy?=
 =?us-ascii?Q?tOIysbw7VBCOBjoYcXs0HJFrd46n109jx3io7TlYSI8TXiUEwujPmBaw68sv?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f02e2ad-24dc-4951-7b4b-08dc3f81d9aa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 15:10:11.6634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPvssCGMetsTsL3DCm7iYalbLqi9xvwXeeuloZ3ZVrAmY9jU/GzQnT/pYQzJ04yi8bawqqfJBNuYGSpGc0ogvBLDD2pXG0fepRQWEIrARf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6362
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

On Fri, Mar 08, 2024 at 01:55:45PM +0200, Jani Nikula wrote:
>Make documentation match code. Slightly fix up the documentation
>comments while at it.
>
>v2:
>- Move comments next to members instead of struct comment (Lucas)
>- Small fixups while at it
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> include/drm/i915_pxp_tee_interface.h | 27 ++++++++++++++++++++-------
> 1 file changed, 20 insertions(+), 7 deletions(-)
>
>diff --git a/include/drm/i915_pxp_tee_interface.h b/include/drm/i915_pxp_tee_interface.h
>index 7d96985f2d05..a532d32f58f3 100644
>--- a/include/drm/i915_pxp_tee_interface.h
>+++ b/include/drm/i915_pxp_tee_interface.h
>@@ -12,20 +12,26 @@ struct scatterlist;
>
> /**
>  * struct i915_pxp_component_ops - ops for PXP services.
>- * @owner: Module providing the ops
>- * @send: sends data to PXP
>- * @receive: receives data from PXP
>  */
> struct i915_pxp_component_ops {
> 	/**
>-	 * @owner: owner of the module provding the ops
>+	 * @owner: Module providing the ops.
> 	 */
> 	struct module *owner;
>
>+	/**
>+	 * @send: Send a PXP message.
>+	 */
> 	int (*send)(struct device *dev, const void *message, size_t size,
> 		    unsigned long timeout_ms);
>+	/**
>+	 * @recv: Receive a PXP message.
>+	 */
> 	int (*recv)(struct device *dev, void *buffer, size_t size,
> 		    unsigned long timeout_ms);
>+	/**
>+	 * @gsc_command: Send a GSC command.
>+	 */
> 	ssize_t (*gsc_command)(struct device *dev, u8 client_id, u32 fence_id,
> 			       struct scatterlist *sg_in, size_t total_in_len,
> 			       struct scatterlist *sg_out);
>@@ -35,14 +41,21 @@ struct i915_pxp_component_ops {
> /**
>  * struct i915_pxp_component - Used for communication between i915 and TEE
>  * drivers for the PXP services
>- * @tee_dev: device that provide the PXP service from TEE Bus.
>- * @pxp_ops: Ops implemented by TEE driver, used by i915 driver.
>  */
> struct i915_pxp_component {
>+	/**
>+	 * @tee_dev: device that provide the PXP service from TEE Bus.
>+	 */
> 	struct device *tee_dev;
>+
>+	/**
>+	 * @ops: Ops implemented by TEE driver, used by i915 driver.
>+	 */
> 	const struct i915_pxp_component_ops *ops;
>
>-	/* To protect the above members. */
>+	/**
>+	 * @mutex: To protect the above members.
>+	 */
> 	struct mutex mutex;
> };
>
>-- 
>2.39.2
>
