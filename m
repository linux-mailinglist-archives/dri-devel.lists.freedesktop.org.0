Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE42F9F59D5
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 23:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E0610E194;
	Tue, 17 Dec 2024 22:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S76tUU8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13AF10E194;
 Tue, 17 Dec 2024 22:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734475779; x=1766011779;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N0Mpjd9QTV3172Vme+Icrq1lXhCgTitRzmEx70VniK4=;
 b=S76tUU8KbD4Uxj996/T0Whf7dYtadQ2Pe4GnbG3GI7qPRWnWD1o53Rfd
 d2fKhFrbeAT+8r6AZBJnrUJB6e282Iwx45yid7Jud1++7C9XNgHwSA0ap
 LUMdUeWBf7G9hdNZ9VNt+c8i6WEeLxgCY+JNf2n8b5RzK75XHKX98s0nL
 kwygbJKEKhmgTTuin8geooebZqBoIo1k0/gxpNyBSeX43mxKhYQeiRdUB
 KI8Q2g08/mUYvm2YcsFEJHU/eSUB9IezBYZU3BnsWo1L7ZOzRQT7GEdBc
 fBm/Q0dJrINRX/YC+UQkid+OETI5GF7Gk2R6LX7dHwWVfRUzbO9XdQekw Q==;
X-CSE-ConnectionGUID: /vB0QRDZTbaxnKEtWz2sWw==
X-CSE-MsgGUID: bejd2MdSSKaig7imVSks5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45620935"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="45620935"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 14:49:39 -0800
X-CSE-ConnectionGUID: rEwo5IyCRUuQr1jL670i7Q==
X-CSE-MsgGUID: Dua/X8S5QL2R5AM00CTb0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="98249798"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 14:49:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 14:49:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 14:49:38 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 14:49:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rO73QTEznb5uQg0qRLxWJakfi9ITTjl+FEfVDNuK5FGwa+qAJxyEQylPMZL8Xii//9HtMz05uY3X+Y5fuOiwP0ihjsfTpDzhe+Kpob1P8l/OO+RX/DFt7JnA7rFCJ0IN5MychbPvIPJ1QY3Cw6wn43j+SS5ErzFSSyywlC5R4zsmObxliyoaKC+0Vf0egqPYOjwtBziW17Tsh0/7M0/f3mn3yHKZnqHJbMLIbetAdmbKk5qSp01sn+vWA79pwOq8YFROVKHXEuubv8lqCgWneHu0nqLQ3fs0Ot4/BcSKVE/yuj5UwI1AhxNBRlv7vL4xKirE+wPoZffnz9EhVzRs6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nN03e2FlgTP8ePakXdnoGQ7OuC0HkBnw+nRv/BVlYIw=;
 b=FAkUA9p6gJnsj23UoKKvV0YA9i5j+FNLRNZOdQPuKXWBpsViQfogYCQyHmwot1zArIEdfEAydb8DC8yx3SWTQd4lc10jFOCRkGBI0N7Y5bdPNjNx/ERHt4fsfGZ7zbPaxR8p8NuBpOAL3LEdMhOZ/Z8O7pNf+wyBDPi50k1Gssl8SJiU58jcZKGqxakcfudm5OtB4lSRRrfXELXuIxS0YRG+g2IUWKBLwz4kzZbgIu99YnVlqYjecFnQj3iN+1C99ZnwJ5faHHAe0hyX/vqes0hMDUurAVtqe5HGXfoiZeJXTQFZ8GumMs5cuchecGOhzlTdk4xaD8Kjpw6VXuLbYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by DS7PR11MB7740.namprd11.prod.outlook.com (2603:10b6:8:e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 22:49:22 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 22:49:22 +0000
Date: Tue, 17 Dec 2024 17:49:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Oren Weil <oren.jer.weil@intel.com>,
 <linux-mtd@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 06/10] mtd: intel-dg: wake card on operations
Message-ID: <Z2H_7Xry3R2fWpMZ@intel.com>
References: <20241119140112.790720-1-alexander.usyskin@intel.com>
 <20241119140112.790720-7-alexander.usyskin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241119140112.790720-7-alexander.usyskin@intel.com>
X-ClientProxiedBy: MW4PR04CA0146.namprd04.prod.outlook.com
 (2603:10b6:303:84::31) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|DS7PR11MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: af9e9aee-e295-4596-eff0-08dd1eed0cb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VCdhop9gH4SHU4y9jHE97hn1rlG+Z6PVrE+bhVXaC1hAsgV2vzZPBsh6A0h1?=
 =?us-ascii?Q?DyGE4rybxj3s8YqRSedPWY/JYk7aJfZCrd3KFcb8F0ldx7mnL7a9dg4P7yp3?=
 =?us-ascii?Q?wkfqhwM1MaL+O7Rkg/dmv0jRTXRID9PuCQu+rVLsLz1sV51C6cjIqRUXKhWw?=
 =?us-ascii?Q?ouefAd+xYyfSqQdbkclPih6LxRBUwcoPp5ezgTzrRQLea39UKSWsm5jhq+ey?=
 =?us-ascii?Q?Y19mqgL5XFC87e8MugTWF4j85HpJhxdfD9p5v2YtAvqHsGn8Gp8asJj3uDbV?=
 =?us-ascii?Q?owbGCSw3SCAXKURSjk7uHZ9DKHdLXNia4RHtYN+swZAhXLaT9B0D4wiVPKp3?=
 =?us-ascii?Q?V2UonnCEwbRCYFL3MZv6tG4Tc0LaH8kP1uIUmZH64oU3EReMEv+Q7fuhldj6?=
 =?us-ascii?Q?+5hHnZtJzMuheS1rA0p6fqDwWTlrJHxS9RlngKM+MxXkOEEANbOm/E0qvn3w?=
 =?us-ascii?Q?bH7fRUMe92DNpCxp2I555SNO3fztVjC2Ndc60DS1MmyucBBcU/KnBkS1AoTm?=
 =?us-ascii?Q?oLLXS6Puap2QLKQb0ATFv2hmujLR2qxbXxt/G++gwmMqEXU6UIbkdzfEod73?=
 =?us-ascii?Q?5UmW4RSJKKBgWurOs9u2sGdhQRmLb8TNcjLlamfETQ9liXcrP3kWwXB9TXhT?=
 =?us-ascii?Q?GRgh+FW9WwHD2mPWbqCElUa7b/SRXnu0NhdNcd8eAjgqkYR6fSytNpzGCnkQ?=
 =?us-ascii?Q?qiHFNspuraBHKV5nRkCyAm9bipNKMrtk+SQ10tcA7B1AFsUXTE1Pr3fePkEw?=
 =?us-ascii?Q?zuvL9XOWqIjEXu3c8rO/NsMVtHz5SbK68539eBm3ZxCELU0kUoj1a1jCXffW?=
 =?us-ascii?Q?kjTFkiY0MrqQKJGMGz7EZQ/V44hLCYPpPMzP+DJqUeA/7GpzkAb0bTtBqQlW?=
 =?us-ascii?Q?5DMyzzNUrCAI+ktI+JAq/LZMnY3itT22niXPlyzNelhNCxBPuhtafk5+WOdJ?=
 =?us-ascii?Q?Q/QbrQIUhCHJW4A+HIXW6Y82MeHN7tU/NdZY1aHk3kQre/L6mVfdY1CWRkUm?=
 =?us-ascii?Q?Mm7i3qfTD3dwVbAd1Inz+KmgbjcjBhU49NwJ32dy79A2Xc0CaWExaGwAERTo?=
 =?us-ascii?Q?XkHd01dNfVIi6sMBgGzwyMqWja0Qg2JoPnqHWA/EhsNtTP5SCjyUS98jjNkR?=
 =?us-ascii?Q?jH1l7c6Oek2B+FrKojMDe5D865RIPpGY56tvz9T4s56htQLyFklWX3k4sSgZ?=
 =?us-ascii?Q?uL3FBCeyNuVdnMXsTDDTvziWt16s0OmPqz7dFQZTxnxdvVmDIMfmrJf8muMU?=
 =?us-ascii?Q?4Ef/uNt5TLnbGD38pVt2pj70Bq3kHBhtAWLfxuH3IPzy8k+faTbDIKrjAs6y?=
 =?us-ascii?Q?WKVKyMdbaGz7kM9Kk8nfUfb24WvUVQKkWzBspbgqqP3ZyMB7EFHDYK7JZPS2?=
 =?us-ascii?Q?S8jopwthfGKvPDiH5vXEVlYWCS+H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qlO8+kNMQRgd4zDvLuWDOdb1KZaziXx50I5ssyoPTAS2DmH+w71GD948N2zl?=
 =?us-ascii?Q?ephqSNuOg5kvayul6/Zi64Z2wiw6uO9Fx4VIDtkoxP+WXc0OfQlNgMraHuqM?=
 =?us-ascii?Q?e09WxRXaRiRhzdTpnFGuKdgf9ULdgF3F4RFQ3IVIGmIn1BJoblScRfhYufcL?=
 =?us-ascii?Q?FmmXhO1HvJnJcpOBhWugJiFuX8+JSYNcJTQ1hqfNlqtM1ZaWXUbrf1YuCC8f?=
 =?us-ascii?Q?WBgXkJAYUzPuD9ggO1of+wxfsWL6g578PkkLyH6YstF/xxpVSla8i7ousI2U?=
 =?us-ascii?Q?2KxPHPsAfEMkKqjTROfqlAvhkk/1RQvuCMwI13NQuD2FMiHM1O8yHtZ9ruST?=
 =?us-ascii?Q?ixE0mvGVwl9Xz97eibTMtxLBq8b5r519gTtM5HeItfONTBYeD2GRswunTdFp?=
 =?us-ascii?Q?pspcHmeQ2LahbIN6ZKdFbZfueMZP0e8uNxQy0Cwbs6Hg2V+1/PTn9x2DoRUg?=
 =?us-ascii?Q?CoBBScSN/zRKtLhQvNEkzk4BppVxzo9UlzzeXdB3OzSwKELMCE/NmWqHQtbF?=
 =?us-ascii?Q?miQ5vODtXheo3pM08XZwIkOl7IwkcTE7nhvpV6gcc92pzi51uN3nWsvUZMJA?=
 =?us-ascii?Q?hGGoNha2gShBij2h25Qnx9NjGNJDAGOQxb8vTS1+js2kvaupGajfHAUvCYUW?=
 =?us-ascii?Q?1BqM2xKHsLAtxFINaMXzsuFCvfxQp8lUkhZ4uNHZ9b7+5ARCJFC/ftO9UfsE?=
 =?us-ascii?Q?Z417ww4SnWavTKBg1IifM9gl08Mbba5L5e/976R1LaQhpOC2kJWKfC8oJIUG?=
 =?us-ascii?Q?P8ourv/Md9SoI1KNsBhhdTxTvmfxcgUX0ajojmKoT1NQAJ/6eiscpTK6V6Hj?=
 =?us-ascii?Q?yy0IFgHQEnDC0WJz08N53Sel+mFZTpltwSHJEwjYO+vH5gqIOi1HrOZvzAHd?=
 =?us-ascii?Q?LUBgUfUGJ6clt4J4fFsKiatwHlFiBw/aSxJE0tSQ4a6FRZyZEpZpECCaI/Ux?=
 =?us-ascii?Q?YEnHazoGpWldcxrGHWJNwZpC5lDh9ZGUDAG5paclPvgjRUhyC+ziyCEo4u4e?=
 =?us-ascii?Q?VJLUdFTf1cPqVKFMCqMMzUy38Qnl+Px1NJcxxWNp4PkrgB6PTTMJ4j3p6S2f?=
 =?us-ascii?Q?HyQMUTXeSWw331UMFFYsXuCZH78MIGWuJj/+rk6ve2/reeMeqi0tBpqJlZuW?=
 =?us-ascii?Q?gq6Sbp5MetH//CRKQz1Ye7jvv/wUyIUMKkSyGpcY34xEh2mhN3avGc5Poy5d?=
 =?us-ascii?Q?ngYurNabo3x8UppWtAuNf7io6S+64yK7t7MzhP9vMbj50IZ1yH4j5eUZb2Rx?=
 =?us-ascii?Q?2XVFSaV65IJUNkkTYmTxzJ/Lb1fBZuKGAvx7SCNH89a7OH7SEJEQiA41olSD?=
 =?us-ascii?Q?x6eQR0nzZfiuMuArr9qezxGoo9quIWcDuguacGbLcEzQ7M7wZyn9/c9hjNgh?=
 =?us-ascii?Q?c44EpXHYzSgp/+z6Sj1IhSkbv1N2WZfOrv0P1QyNYtw20uJ4xUJIT3okwlc8?=
 =?us-ascii?Q?SAvx9a+mj14KXDFS8o9NG1S+e+1OCveo0Bp3YWfsGuByqxpNMPnoK4odh5UQ?=
 =?us-ascii?Q?p864IRlCh60WFAvH/sSiLq/liXaeG3tQKTedP5wspHw+9f1k3unF5M0aIZz1?=
 =?us-ascii?Q?3QYh2FM/kvkD2ICJ7k69D3KGgkA0758wlOb5lV0lUdogCggOOMSF0SK/CcoL?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af9e9aee-e295-4596-eff0-08dd1eed0cb5
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 22:49:22.7904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ifsppdlbbctne8rlek4bPIkBYEKw1QiAXiwNxujHSCDvz+luoXYJB22+XFQZlZe0m/ytQuP9rzehdnC4FtBwHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7740
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

On Tue, Nov 19, 2024 at 04:01:08PM +0200, Alexander Usyskin wrote:
> Enable runtime PM in mtd driver to notify graphics driver that
> whole card should be kept awake while nvm operations are
> performed through this driver.
> 
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/mtd/devices/mtd-intel-dg.c | 70 +++++++++++++++++++++++++-----
>  1 file changed, 58 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
> index 230bf444b7fe..9dd23b11ee95 100644
> --- a/drivers/mtd/devices/mtd-intel-dg.c
> +++ b/drivers/mtd/devices/mtd-intel-dg.c
> @@ -15,11 +15,14 @@
>  #include <linux/module.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/string.h>
>  #include <linux/slab.h>
>  #include <linux/sizes.h>
>  #include <linux/types.h>
>  
> +#define INTEL_DG_NVM_RPM_TIMEOUT 500
> +
>  struct intel_dg_nvm {
>  	struct kref refcnt;
>  	struct mtd_info mtd;
> @@ -460,6 +463,7 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
>  	loff_t from;
>  	size_t len;
>  	size_t total_len;
> +	int ret = 0;
>  
>  	if (WARN_ON(!nvm))
>  		return -EINVAL;
> @@ -474,20 +478,28 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
>  	total_len = info->len;
>  	addr = info->addr;
>  
> +	ret = pm_runtime_resume_and_get(mtd->dev.parent);

on this, I really don't believe this is right and we should use
the parent child relation ship in our favor and only have the mtd
device to handle their own runtime pm... 

> +	if (ret < 0) {
> +		dev_err(&mtd->dev, "rpm: get failed %d\n", ret);
> +		return ret;
> +	}
> +
>  	guard(mutex)(&nvm->lock);
>  
>  	while (total_len > 0) {
>  		if (!IS_ALIGNED(addr, SZ_4K) || !IS_ALIGNED(total_len, SZ_4K)) {
>  			dev_err(&mtd->dev, "unaligned erase %llx %zx\n", addr, total_len);
>  			info->fail_addr = addr;
> -			return -ERANGE;
> +			ret = -ERANGE;
> +			goto out;
>  		}
>  
>  		idx = idg_nvm_get_region(nvm, addr);
>  		if (idx >= nvm->nregions) {
>  			dev_err(&mtd->dev, "out of range");
>  			info->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
> -			return -ERANGE;
> +			ret = -ERANGE;
> +			goto out;
>  		}
>  
>  		from = addr - nvm->regions[idx].offset;
> @@ -503,14 +515,18 @@ static int intel_dg_mtd_erase(struct mtd_info *mtd, struct erase_info *info)
>  		if (bytes < 0) {
>  			dev_dbg(&mtd->dev, "erase failed with %zd\n", bytes);
>  			info->fail_addr += nvm->regions[idx].offset;
> -			return bytes;
> +			ret = bytes;
> +			goto out;
>  		}
>  
>  		addr += len;
>  		total_len -= len;
>  	}
>  
> -	return 0;
> +out:
> +	pm_runtime_mark_last_busy(mtd->dev.parent);
> +	pm_runtime_put_autosuspend(mtd->dev.parent);
> +	return ret;
>  }
>  
>  static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
> @@ -539,17 +555,25 @@ static int intel_dg_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	if (len > nvm->regions[idx].size - from)
>  		len = nvm->regions[idx].size - from;
>  
> +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
> +	if (ret < 0) {
> +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
> +		return ret;
> +	}
> +
>  	guard(mutex)(&nvm->lock);
>  
>  	ret = idg_read(nvm, region, from, len, buf);
>  	if (ret < 0) {
>  		dev_dbg(&mtd->dev, "read failed with %zd\n", ret);
> -		return ret;
> +	} else {
> +		*retlen = ret;
> +		ret = 0;
>  	}
>  
> -	*retlen = ret;
> -
> -	return 0;
> +	pm_runtime_mark_last_busy(mtd->dev.parent);
> +	pm_runtime_put_autosuspend(mtd->dev.parent);
> +	return ret;
>  }
>  
>  static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
> @@ -578,17 +602,25 @@ static int intel_dg_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
>  	if (len > nvm->regions[idx].size - to)
>  		len = nvm->regions[idx].size - to;
>  
> +	ret = pm_runtime_resume_and_get(mtd->dev.parent);
> +	if (ret < 0) {
> +		dev_err(&mtd->dev, "rpm: get failed %zd\n", ret);
> +		return ret;
> +	}
> +
>  	guard(mutex)(&nvm->lock);
>  
>  	ret = idg_write(nvm, region, to, len, buf);
>  	if (ret < 0) {
>  		dev_dbg(&mtd->dev, "write failed with %zd\n", ret);
> -		return ret;
> +	} else {
> +		*retlen = ret;
> +		ret = 0;
>  	}
>  
> -	*retlen = ret;
> -
> -	return 0;
> +	pm_runtime_mark_last_busy(mtd->dev.parent);
> +	pm_runtime_put_autosuspend(mtd->dev.parent);
> +	return ret;
>  }
>  
>  static void intel_dg_nvm_release(struct kref *kref)
> @@ -720,6 +752,17 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>  		n++;
>  	}
>  
> +	devm_pm_runtime_enable(device);
> +
> +	pm_runtime_set_autosuspend_delay(device, INTEL_DG_NVM_RPM_TIMEOUT);
> +	pm_runtime_use_autosuspend(device);
> +
> +	ret = pm_runtime_resume_and_get(device);
> +	if (ret < 0) {
> +		dev_err(device, "rpm: get failed %d\n", ret);
> +		goto err_norpm;
> +	}
> +
>  	nvm->base = devm_ioremap_resource(device, &invm->bar);
>  	if (IS_ERR(nvm->base)) {
>  		dev_err(device, "mmio not mapped\n");
> @@ -742,9 +785,12 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>  
>  	dev_set_drvdata(&aux_dev->dev, nvm);
>  
> +	pm_runtime_put(device);
>  	return 0;
>  
>  err:
> +	pm_runtime_put(device);
> +err_norpm:
>  	kref_put(&nvm->refcnt, intel_dg_nvm_release);
>  	return ret;
>  }
> -- 
> 2.43.0
> 
