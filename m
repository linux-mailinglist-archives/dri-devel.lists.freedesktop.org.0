Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC038C8A39
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 18:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6193710EF15;
	Fri, 17 May 2024 16:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kS6mWET9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DAB10E2F1;
 Fri, 17 May 2024 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715964026; x=1747500026;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5Y+oWfFk0W//Tq/xrIclSqsbAVLXtwLqmURBmf0BrrA=;
 b=kS6mWET9OvuMeRnMtQinAbNurMBbMMjiGqnSRZXBqx5fbB6BSjhXiNPL
 7CKtZQhZ86DbDGHHw1RJmPuITK2GG5j/kXGK+pVHLQPFsvbMHWRkbMcs2
 4xs8iiRFvsWs8gjz97NnnRD5IUlB8JXQZyxI8h4HsVCDMYgMnOpQdNnB2
 JNfvz5aHtJrSf9t3e5KkWnZNvZZNCZXABDVfIljwBOIhK9QIQ3j6NbZPW
 3b+LEtdVRE758KZBCRss68qXK/BrheeLHoJWCj+DMBrwAYf5O5EPTn+pQ
 8F3LI9g2iZe2+iy2Glwy+kb6LiwNyoxjy5e0+CAlCg32i0RDdGF4QMa4z w==;
X-CSE-ConnectionGUID: yAAhOZK2TeyiXHvlfNCIiQ==
X-CSE-MsgGUID: nF3WN9u9SvSmOxPK6lsHrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12366621"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12366621"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 09:39:51 -0700
X-CSE-ConnectionGUID: 0La4XKDoTda3gq7PvG74jQ==
X-CSE-MsgGUID: YcTD8caFQuCIkKHPffFmvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="36264150"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 09:39:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 09:39:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 09:39:50 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 09:39:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzgUUcS5G8tJj03SnDPFzZcnBM+m/wxhDF+i3M7XflC4+2YvzA0e7k8Zu3faif595V47SvcK/ctR0yI2Il6gQRAru0UqQPMbQBVrfyjI+BGTDyd5IQPg5NVF9PPPujn6a9xTDRal0IkFIQBkpotmw5ckGUSgPiXPuEULThL4wJtMEA7mAiZDihKDN8cfKGfjINJGzPixuxEQFsVNP0IxC1yYomzLLlQ7q3T8X5n45hhkQJwKt1w0Mb5mM3jVSCiP1lS6k8rpk30my3TKoz4Or31U98C7aldweSf810OLPUHTrPhtlkoLqfb2GxCh6bn7o4QaLdftTXOz52oAhcyPWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTOOVhEAAKp0HIW1gW4YwwEqts7QLrJZLdSxGWjn+BE=;
 b=iIOABEHBUdLSkdrEPZ1Azr/1gEJG8bV5WpiKxedlw4Au9KnEyrg23WAvlTbgoE7FXPUBW5t+c6kqzGovo3m2LSes02sKAlKWc48JKxoqBZKbwtRwnSGBzkCnUksFNOtwiRHgpA5pbxMdEuV4CewliAFv+J/HntiITSyK3R0cONpWJUYO0Hjgr2ZPX3BmDXOOLeEuguwl4TGVYJfadRMEmbv/Rhz67QsL6UmuGeYh9wmhZL/W71vSwZd2RZNE8FXr/maGXkDb/wo+LdBwm9chzhK8+xgd3jg8DYF61CSpzLBY+Pu1UNLBmz4Fjwr6svDojaDEAgimfUgCgIOlvXtHdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA0PR11MB4672.namprd11.prod.outlook.com (2603:10b6:806:96::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 16:39:48 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a%3]) with mapi id 15.20.7587.025; Fri, 17 May 2024
 16:39:48 +0000
Date: Fri, 17 May 2024 18:39:42 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 3/8] drm/xe/lrc: Add helper to capture context timestamp
Message-ID: <ZkeITiiyzFvZyZ9A@fdugast-desk>
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
 <20240515214258.59209-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240515214258.59209-4-lucas.demarchi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB9PR02CA0029.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::34) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA0PR11MB4672:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e224f9-97d2-4443-4be7-08dc768ff78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TXpCZJe05ROObHaf5nYt0pPlFUrYlkB1NQf4OX5ihlkSBdHZBBg9SVmaiTSR?=
 =?us-ascii?Q?vmp3jhP7NfuPtGl6jYJsqLAPbnUrfnHoHhIrEiJh0DMv6hue0nLfqUTsaXo2?=
 =?us-ascii?Q?oJ43nOt5atArzxTxRq3a4x+RySBupDuPrqSGLkokHlOP9ILhdIFUlY5gHLsb?=
 =?us-ascii?Q?vInHpXr4cNbSNrIAjpIBmYuepw5faBAdlcEmdlUilQurHOW5rlk4dy3OSDqp?=
 =?us-ascii?Q?Ke52w/DMpgO9nrjVzhM75/HSfRrU30Oqj6sdAYVW23Qx2S4rh7+ZuRUUtRzv?=
 =?us-ascii?Q?MsZHykFWpmdPSfqbfNuIXmPl8h0NGcaVBN1FwicNVlwCXtioHJalHJvgU2No?=
 =?us-ascii?Q?boFzukTQcaEi64O6A5FR2ijYuHGjGoW/bD9NLpzFzqUPMyf0FE0QFTtjZb1x?=
 =?us-ascii?Q?M/cS8AanmTroUd2McByXT2nUt8BdvQHGPblBnGoNwAe1tSZtmhrsY/ruG3pU?=
 =?us-ascii?Q?F9MvaCr2+t/HZtPJi8EufH4W+KWIqFm/iTHARpyw4r2ILQqHAL9XMxjx52Qj?=
 =?us-ascii?Q?jmI6g+1J0+c2FwsjsulUOvGPui77EcD0QAf0eK8sfD80ooY3reqbv1O3mq54?=
 =?us-ascii?Q?eOQcw0wIrxkAw9URXZtoP/L5QX7f8hWZzJmlsYpY970Jmn/pOYN8BsPvO8gl?=
 =?us-ascii?Q?uTyI6kDmwz8OVDivmFPyy3grhZS2q1P+bUJeyeouKMWEGwJ1LB9DHYtaqOXW?=
 =?us-ascii?Q?ZJ4uR6yFy4LpNbIuudeVUj1k19AltlqMnUxkgGVML0BC3gBWxUR14a9iTLRA?=
 =?us-ascii?Q?REgDaImA5/nKOZ0911kIpMABdcYhfcWu1HbYXpXYtMFYZNAP8U+BKb47fN+a?=
 =?us-ascii?Q?spZrIVmnzW2eCTX5S7JJeMaAyrbIOlaYmSoyWFqFXMiTggk9LLre567LJen4?=
 =?us-ascii?Q?4z2i+dPCt7CIaGPIqxcKH+FzJK3P9sZUNyQO/U+lpHZ6J9M0Sobd6pNYq0L2?=
 =?us-ascii?Q?UYAFUXGRXjkgJGXQohWxmj6xZsnjgVDVI13TADzMmToY+lCDxDm29MsuF8kJ?=
 =?us-ascii?Q?IOHycxqVbOM1qNP89REP4Zbez7pjn4FAsWNemZv45pzBtWfA3qYZgQOOL/tI?=
 =?us-ascii?Q?UXlgFmIsRpi0dzkV+C0QbJwQ/YXUs00g3pUgWSYNnIsVvek2BaYpKWUAr7z0?=
 =?us-ascii?Q?ReRbETJxLn9X5glwPtuQQfvrkKvpETaQKfF/1FrOR9ijMnyeDXfV+/SW/pjb?=
 =?us-ascii?Q?4fGSUNetM1wpwBMspdXlW+bumY0+N5htrbAgunZAqXfQEXE5+oClzzXHi18W?=
 =?us-ascii?Q?UiYljoOcckoPZl2cwYkgpUlZiEhrOqORVqh7TuEHww=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2kEekUb29P/Sy0EQ6Dd4aCZ5eNXHy0Muthc2XeARHfduqMTSh605ZWRP0uBW?=
 =?us-ascii?Q?RmCNUyattc8y1T8LQrivIDcV5jRj8oiukaMmiDYBMnRXMItJTsV3QoG/Bc90?=
 =?us-ascii?Q?69PrrIKuoSc7UdBg/dlfDol31NaqHmAGXSUGgA8jw7BaivUrAtN3HAP4en6j?=
 =?us-ascii?Q?Byeoj4EVjGooz+nUbZcCQXKae+KOTgVVP1VBhQw/i+2NX3VLvpCtIasRh6Ux?=
 =?us-ascii?Q?SWwh+zQfJ/ENxkjLpUUV+yOl7eEDftnHGbCiBKVBrqdNbRYkcY5tjG2mFvwX?=
 =?us-ascii?Q?zjPjRruGOcGJub7M+MLc7iql1bkVVbHIH2FqkRkcKqtBp0gJ+Nd4ab0A2VpO?=
 =?us-ascii?Q?25mqPcP3/1xuEFn/o6hh7/sg4ygRxCj99KMnuYoiCVEXLyqMiIbUkV8BgdDr?=
 =?us-ascii?Q?a6chAgOqhtPaIFepeBq8NV7T62uX1QOOSnTs0uMCSo6oq9zNyoWoaKQRB45k?=
 =?us-ascii?Q?P3AXOawkigrVpq1pEkK0hHwiR9n/9wknvM8XFByt78eQ2RlcKMt6jNfKnJXR?=
 =?us-ascii?Q?Igsaw2PO3L82mlQJCUmx+Uz+STLCXW2/SXZBZL8EyRcto74oLvxW7cJO0xra?=
 =?us-ascii?Q?M/fvA/xUQTpHDEt4m0iSP0MCEH3kIGwQJy5DG3T3C5xYhuaOeBS7QX4lnM4V?=
 =?us-ascii?Q?5MeXX5Z4WdqY9tB5ji2sPbZDXqdSr+Ny+n4IMrQEnSc2rTfJgXSINw1jUnMl?=
 =?us-ascii?Q?kjbWA1UDe1CZnVDYHZcABu8M/5wZG9aAVeX4GmXjEgymxcznALOoJQTkbBpD?=
 =?us-ascii?Q?1lHrnU/lkHdrAmQxJfrFR27kwMIgNeol8CBgXEAQBQHDeOGjDH/Ay0Q1W/nv?=
 =?us-ascii?Q?VwBA5tzKghk3CSwNtVOzBvu6HiiK0VMtt1BWyptnBHsGOdTFsHw17H6Z9r1d?=
 =?us-ascii?Q?HcOPS5x5voUpau65lnDPVpm0rdao5NTSKFOQC3F8uFIOT4yDCgOS2iKkVR45?=
 =?us-ascii?Q?DqanZc5yfWmn28b50U6r0WL1/Fl9UA5t89lN4dlSoIcHG/SttIRQu+YsyVI8?=
 =?us-ascii?Q?hlpBnfl8P7OkmJFnl7xCL4TBvfd4pO7wqW4EL/Ts44lK5Azm+/b1FvvhRmGo?=
 =?us-ascii?Q?m2UoeVby56hA9pCWH3+sByM/SHEK8DQzfQfUsCX5W0FR1r1kNOG0ag4bAJnt?=
 =?us-ascii?Q?ndtrwyqmpP3PEvBzJh8CEsAKny2GRMpJytfh1PzW6c/rVNrvzh9tTwRkbaog?=
 =?us-ascii?Q?joWdG4tmDchY3Rp1y9kU2PJbRkU+wEFQURs02GxFYnQKvu5It3La+XHdHD1U?=
 =?us-ascii?Q?DIO990ECZaj5Rkl31ofb3unjxlHFHZ9ir0WUZzxOOcMV8zuxyWEc+4Lcy9U8?=
 =?us-ascii?Q?d/dRnvdTlPiadHETki+FEvhQoJP5gRoBV70VzeGjotnWK7oYpXgpmFtUoukm?=
 =?us-ascii?Q?oFP8CXydtLvzwHe61KA7KfbmJ4PZAvjnW3GMqoywXh3cBRInsDqnbnMZLxuT?=
 =?us-ascii?Q?fjG0BMkXO5t+/8gcsXklzQc+O6YPP7a9Q6mkNDJ/ZerhTmeyi/QK/DMl6oDR?=
 =?us-ascii?Q?P8juAhA43LpIW+OBsMro2QRKptZMMaImyPhGgwZOAmowr/iMui00m5S4Zsns?=
 =?us-ascii?Q?rudDHalhibngdhwKmapo61CFgH+9MkVjOIKYFxadzi5Agx6gd5Vz4LzpZAgh?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e224f9-97d2-4443-4be7-08dc768ff78a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 16:39:48.6713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWtLJyszk0rPMBpiY4eecv6sRx/4+63/NgcCLbXg49PKm5PnTaICVJurFS2yxsUMC0K9n5hn4+eTQkRqgrVN9CYdSjzpHnyzfJhcuRANeAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4672
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

On Wed, May 15, 2024 at 02:42:53PM -0700, Lucas De Marchi wrote:
> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Add a helper to capture CTX_TIMESTAMP from the context image so it can
> be used to calculate the runtime.
> 
> v2: Add kernel-doc to clarify expectation from caller
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM:
Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h |  1 +
>  drivers/gpu/drm/xe/xe_lrc.c             | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h             | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc_types.h       |  3 +++
>  4 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index e6ca8bbda8f4..045dfd09db99 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -11,6 +11,7 @@
>  #define CTX_RING_TAIL			(0x06 + 1)
>  #define CTX_RING_START			(0x08 + 1)
>  #define CTX_RING_CTL			(0x0a + 1)
> +#define CTX_TIMESTAMP			(0x22 + 1)
>  #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>  #define CTX_PDP0_UDW			(0x30 + 1)
>  #define CTX_PDP0_LDW			(0x32 + 1)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 9b0a4078add3..f679cb9aaea7 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -844,6 +844,7 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	lrc->tile = gt_to_tile(hwe->gt);
>  	lrc->ring.size = ring_size;
>  	lrc->ring.tail = 0;
> +	lrc->ctx_timestamp = 0;
>  
>  	xe_hw_fence_ctx_init(&lrc->fence_ctx, hwe->gt,
>  			     hwe->fence_irq, hwe->name);
> @@ -898,6 +899,8 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  				     RING_CTL_SIZE(lrc->ring.size) | RING_VALID);
>  	}
>  
> +	xe_lrc_write_ctx_reg(lrc, CTX_TIMESTAMP, 0);
> +
>  	if (xe->info.has_asid && vm)
>  		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
>  
> @@ -1576,3 +1579,12 @@ void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot)
>  		xe_bo_put(snapshot->lrc_bo);
>  	kfree(snapshot);
>  }
> +
> +u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
> +{
> +	*old_ts = lrc->ctx_timestamp;
> +
> +	lrc->ctx_timestamp = xe_lrc_read_ctx_reg(lrc, CTX_TIMESTAMP);
> +
> +	return lrc->ctx_timestamp;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index e0e841963c23..b9da1031083b 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -66,4 +66,18 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot);
>  void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer *p);
>  void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
>  
> +/**
> + * xe_lrc_update_timestamp - readout LRC timestamp and update cached value
> + * @lrc: logical ring context for this exec queue
> + * @old_ts: pointer where to save the previous timestamp
> + *
> + * Read the current timestamp for this LRC and update the cached value. The
> + * previous cached value is also returned in @old_ts so the caller can calculate
> + * the delta between 2 updates. Note that this is not intended to be called from
> + * any place, but just by the paths updating the drm client utilization.
> + *
> + * Returns the current LRC timestamp
> + */
> +u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
> index cdbf03faef15..0fa055da6b27 100644
> --- a/drivers/gpu/drm/xe/xe_lrc_types.h
> +++ b/drivers/gpu/drm/xe/xe_lrc_types.h
> @@ -45,6 +45,9 @@ struct xe_lrc {
>  
>  	/** @fence_ctx: context for hw fence */
>  	struct xe_hw_fence_ctx fence_ctx;
> +
> +	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
> +	u32 ctx_timestamp;
>  };
>  
>  struct xe_lrc_snapshot;
> -- 
> 2.43.0
> 
