Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3551F81C236
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 01:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A97F10E716;
	Fri, 22 Dec 2023 00:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81AC10E73D;
 Fri, 22 Dec 2023 00:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703203692; x=1734739692;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mPey7IuIzJILZ1TtG54jAGkSC+kFg9PTIjuqDnr2kp0=;
 b=V/QNeIu1Rh7pE6NVkxD8ix+FPT37Aj6y/2zla1TGEXktd2dCtU9RwFjM
 HRSeGeCY9v4cemy5P5r+QjubQi80Q8+T4Q9Wyf7tCak7ZcLPGTx83LckV
 Ca8iWH9aKBU6pwPtKZ+TQ0T4RnnWbgwFZav4x3YzANEABRVXT1cMEm9ic
 EJjg/yoFHDcUj9uO+mKmpQuqwYfCTSCO9okc2TP5qSh+UPXSUnvWX2rTu
 vHq/gOqb2umhDVG8R6KieVU8oK8EsSnROHSmvLCha5F0aLdJdnZL56Eig
 sbrWcg6PNvRmQGQONS4acaokRB0MHJqk4jaOFOrmgXXHovFw4jKKauh8G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="395788684"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="395788684"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 16:08:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="867481164"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="867481164"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Dec 2023 16:08:05 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 16:08:04 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Dec 2023 16:08:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Dec 2023 16:08:04 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Dec 2023 16:08:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FI9RW5h9slYjI59vhfjRNS97bBLNZkGJ4NKQsc9o5gFM473ByZSaEYoLgOQRtPy9UJ6X+G5eWbtqhIJ9EUrIw5AFjnMbqN++CG9HQmBoA/5dvZE8pdCY70Zjlm/zj+QIMvcyf6FJxef2jUTdqaRC/RPWpovxqH0akizZ3NveOvNaf3TGedgqn6y7JeQC0wyzMFuqlCBNtypgqCA3RcK7c4o3xwhSvcjzmkinC7M7OZhE/ckYT+JltjoPxj3N3gTyLb7ejn7dNNq+EzKjKOTItgErK6u5ea2RIXf5uc8Cv061luYyObdU0F8nd82L8wMjew2LysY9dQSJrgLIs3Hktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEb4vnvWrUY8HcUdTlEaPUr6n8hsY8Lj/MoF7KxDNSI=;
 b=SaxG/tZU+LQGnKo7AWKFq9vadkreGwNeEXbsKbj2aXpDCgxnEqjJYr1iAjzI5Om6XcyKniwNDRg5lAmHhrWrhsJUzd3Ib7bMz5PLtPuvD4dMkSRFnBeYm2mCHrj1VkRJrrz+JKguhSYqwJOEgTUHmTxrZ9UFqO5yxXivGnKj0GnC8d6NiQui75ek8zYlBot4DBLd/yFRXejrgojvmhyrDBrV/28kgzTvdcAugmnkwQ4aTfPCtZZI3WclQr8knVdQB9Vjzk/Zd21dqKI8bpbkIfl68xBOuYp2TX1VpLfOMsG08zocCin9ox4tzvnQoPvVLelKWyIyqFOKM3O1ZSyAvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB7548.namprd11.prod.outlook.com (2603:10b6:a03:4cb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Fri, 22 Dec
 2023 00:08:01 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 00:08:00 +0000
Date: Thu, 21 Dec 2023 19:07:57 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/6] drm/xe: Disable 32bits build
Message-ID: <ZYTTXSkfpt2wFKQ8@intel.com>
References: <20231221222809.4123220-1-lucas.demarchi@intel.com>
 <20231221222809.4123220-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231221222809.4123220-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd0fff8-c097-4cd5-c007-08dc02820f5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6C1rxH1LZ8+YoBiNiDac9ElC4+wMWggWcFESKwZbGvfOqvGK1F53wF/bgitxzw0AfZ8/IU5AzscmagABIzrnMwyNKnXXBEr7ep5TkqRkUA2nNqEbxQqT/eC4e2VSXDecGaUKYOT/+sxX5hFa1fPhJxhGdd5/T0Lc1DD6kXxmR0RHaehCHCd/6FyZ1RKamXzeSW6MA6wpPVuSHdILd0dYmKJLSNlEn/UzdXj/eScoM981gcomPgheFCuOw9lu8WOHZ8uiGHbnQyHGdPsTTGCYnrQtvRTb1hibGiSwRQwamcQaxKBtZw0NEjkmir+IsQoMPFjK3LK+nbDfJWasnLpywz6mgG6OEUwe9Xj4wbJEGfOd1wORTy+YExyjUXJDMQjm9DRh4wbJ5TgpS/0tfPbkFvhMjg9IygywGYz42j4UP5qJh+kiFaE2LC5TLIrso7FLiAOq7mlBUfWCcMp9msWolJkJ+GggL3ADS1nqMMLeLjkVrNEvAhIQ8BSlCOBFUW1lX21kzXQFMLolJ+m0P33gFRuuj2XpAYIsNYaup9DxG48w9N/vprWDnsXCdco3ob5i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(86362001)(36756003)(5660300002)(6512007)(6666004)(4326008)(8676002)(6862004)(8936002)(6506007)(44832011)(2906002)(4744005)(26005)(2616005)(37006003)(6636002)(316002)(83380400001)(66476007)(66556008)(66946007)(478600001)(6486002)(38100700002)(41300700001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OvOwXVBtoVu0xyCJjFR7Z/tooGeUo9C0ARWiaBcvCe4CqT5M6c9Ra5QUvRTO?=
 =?us-ascii?Q?o9HUekbSFPwNmltMNuBuXAVMneVHZv1a7ybrfKWXomZ/f+JasjhyApQni3nX?=
 =?us-ascii?Q?BdEXbq2bQ4gK1jcLjt8d64els2aP+C/9eOlRK76veqpZSzpVd4rAL44uLWcq?=
 =?us-ascii?Q?dnxEwivjM4UjEPvVqNRrTZIrBnXmGHbKFqa35cL5obBrwWKC87YyYrzXDIuw?=
 =?us-ascii?Q?xIOa6blVktX9Amj62Xq53HtBbDmOhrTlhMAbVRh5432bMAoa9vSwZ6DSllJH?=
 =?us-ascii?Q?1/m9LkuSA5YsE5AbllEKkxW8sjM3CwBfXTLrBlzrJiRw8EqZm6pFUdZcMxDP?=
 =?us-ascii?Q?vLGatMrjFI9LQJhgeopJkDS+CKy/BPYfPZQX0zu7yHjKYJOppI5Kc27gPsFD?=
 =?us-ascii?Q?wbpdPbudRQtFAOsyWKsqHVdgayXFyxX3eouaOk9JDx+pWx2SYtBHO7svLZFH?=
 =?us-ascii?Q?8nG1fZs4NAqiYwjad1v94/DTpoPASwmAH90tFz4rPwGBk4rbEswPLsIW0beJ?=
 =?us-ascii?Q?TftLyak6TxKHkLAUMBeafDwVE/J+OnGSHZ9aPDdZfk72ZM9tRCFPHAkiV5ql?=
 =?us-ascii?Q?LqIw9ldoQUXBDbAX9hH4KZZH9aaLgHsWCHrDBqT7JdyKipj6d4/Y66mBZZd5?=
 =?us-ascii?Q?6vLEuj4Sf42ao+ufPNiApFAxTwR8UmOeYvHpfYDLIDuuVvgX3V6yZD+qZ0oN?=
 =?us-ascii?Q?PrrgeI7iqGQ58Zf6cpyfY0ol2OOpciWS5lKv5osi95e9tMtNaiERRqqC9pjq?=
 =?us-ascii?Q?2rqOJlwDCHSVH3tOzK6/BXZ9qOCcQqOmX+nexbB9T4Lk5JL2vV/sd6ki8URE?=
 =?us-ascii?Q?fiOmasXtIQ04nBkhs/rQlC53oSdeohswtOLdA9Rgg94boNyiubeVI9SpAyZG?=
 =?us-ascii?Q?eHxupJcvng3g3nhnsPH+ihS2rnxGGz8M56mCOnb8nC08OAKQschZrKSCEeZ7?=
 =?us-ascii?Q?ktBL4s1DhYlfzU9uSosChdAtiityNhzijSaN4WWDGIwE6gp2XLZoYsSRce/y?=
 =?us-ascii?Q?4glJdzbLha89uKO6jrrVOuxGHxVZSDopmwc5t+Prq0V0KLHKys8Fa+5DsUyB?=
 =?us-ascii?Q?Ch6ZWeI198pDjeIlp473sdIvXO57wPJc8SZKRmh5xKzZrauFIbfey6kynGTs?=
 =?us-ascii?Q?1PCNwfcFrtbPagNQ/WVUf4k+fUseb0bObeSqiP2WZgoeXTeElmc5XJOMPEQb?=
 =?us-ascii?Q?5iXmeaLnt/goUbDsTDihoxVlzUeZDRxQvGrD+3HkqSukzK46WNInY1hfjw2/?=
 =?us-ascii?Q?5xPeKhhLb4ktZTriLE0BKxjeDVEGzopv7r5zcc2WUVRlQ64oISr4OFHNoDyO?=
 =?us-ascii?Q?/W6ZmlN+YfrLT3iTGXYcbagwVZf2hTW2FMLrFveh7nnTywSsrXMBKRrv0PNI?=
 =?us-ascii?Q?XGeFZXXalLi2DPxjiW0McE/Qqp9cBJG0WaPwTE/4s8wk4vdzA2RIwZ94wbOf?=
 =?us-ascii?Q?cZ3rOdULDF7nOcsFm3APWCV5DwaghzPJsT8ubdHwy6MFmfxuSE5DG6ufIci2?=
 =?us-ascii?Q?Egj+SQ6hIg9U+gL+/bxI0C65mC6WRzmIFaS6uKgwDbrqJkjaDu6B7DCGFBPT?=
 =?us-ascii?Q?ymc8yi9VG7TRxeoW3S3qj9MIZO6gptFTxVwXUfYi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd0fff8-c097-4cd5-c007-08dc02820f5f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 00:08:00.8908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GH+L4fC6HRndiHIwZV5CrlPYBjZDZDkTKS0ko1+JZNDCHZzT1MWYwPnXpaKxx+eBD+a5tDpJfz+k05FI9dXr3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7548
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
Cc: thomas.hellstrom@linux.intel.com, daniel.vetter@ffwll.ch,
 ogabbay@kernel.org, dri-devel@lists.freedesktop.org, airlied@gmail.com,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 21, 2023 at 02:28:04PM -0800, Lucas De Marchi wrote:
> Add a dependency on CONFIG_64BIT since currently the xe driver doesn't
> build on 32bits. It may be enabled again after all the issues are fixed.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 5b3da06e7ba3..a53b0fdc15a7 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_XE
>  	tristate "Intel Xe Graphics"
> -	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
> +	depends on DRM && PCI && MMU && (m || (y && KUNIT=y)) && 64BIT
>  	select INTERVAL_TREE
>  	# we need shmfs for the swappable backing store, and in particular
>  	# the shmem_readpage() which depends upon tmpfs
> -- 
> 2.40.1
> 
