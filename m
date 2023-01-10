Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC9E664C71
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 20:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1103D10E1AB;
	Tue, 10 Jan 2023 19:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3311F10E1AB;
 Tue, 10 Jan 2023 19:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673378917; x=1704914917;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lOdKiAA7Ift7v3DrOfWTz539CdQJXhPjjnhivEV9RKE=;
 b=ZLi9ZUBfZQz4Lib9pR+9cx+EfYV6tWgSBUHRKM73D/HzTYSoxGCkcmCu
 smzsA9IAOjcdAVFdj51n1rsK9j4xFA+7xIUkmAxIKL5whAYhMOwilhGgY
 M5lnomQWl33C51LAYRx6db+rC4B1CorZ53/zdkNaB37WZv0Zi3saDK3nU
 K1dLqOlp/4GI+9MLkt0b8itOHyLx7fX1iJy2juTFhBmi/lsHI2VWCqhuW
 lZ2JQ6JgXOpSyzUMbWtngMU9VKaI09OSo+LwHM6AryG5G6XB+dNWdqbHp
 vekRHYbzQve+GBHx0LU0Vss/6o/QefaJIzNAjACla/2GmZUtTACbEFe61 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="320925750"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="320925750"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 11:28:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="745893468"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="745893468"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Jan 2023 11:28:20 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 11:28:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 11:28:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 10 Jan 2023 11:28:19 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 10 Jan 2023 11:28:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGebx1QwKnp+CIealjF4hI0WtNfSX+xtE2tqZ/OaPOWxHgc/cuHHeX+5UHMBtRYDJAAqNZWgI6ONFx9pCCG0tiphQ7rHjNWor3sVHjEYJmrZ3DLY/+lBqWIQzf8vYtkKodFDAajrm3a/0CHWiP4n1MKalfenYZwxMLSnRWaEfdePHNyz7Mg4N5OyhVmwaGdUWFjmJl7cGOJH7AUNWxVaUwppN2qjSNggzyJftpmVZ27pr5m83WPpg1QF157E7PoX2oRAI1MFyVO9QSdzmtPgHPPuxQWHZ8Or9g+mp0qWFuRtTdKPEakAPpykeo8mxCKfZWQVBaR216eAD1v6ap+Mdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1F1H1kf9+qNh/uWypsjQ21jMyQlrW0E7q0d0Tz2txi0=;
 b=SfujPt7t0qx4qF/tiaeEsSKcI4LBtaYLoVrUvE02QXEJkIvnBgNmbX/c1AOURqHb3u6jvf7wxGuPJkueYiFBMkkJhAtk5VF31e+Xc/efq34s2OH91cN2eUWKv5JhtMuolc20ijnbpgDDj9VUdw4R6yubozlNCGri6+H+0eS6clwVgoDxCqrtjmzgpKmDGEdjUyO9hCnPuk2LM6Ymy1FB3D8wcaOzflO2L96kgHjPBuRt2BiJf/gYuwCVlaylVFDIrfdLXhhNG1HdyVlEnjNksSOsmFVRAd9C4vpfdBWAAJxoDNeuhCmFlBxiCU9Prl/0KucBbKO1JMPmqk4O1gmUCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 19:28:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 19:28:17 +0000
Date: Tue, 10 Jan 2023 14:28:11 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] drm/i915/guc: Replace zero-length arrays with
 flexible-array members
Message-ID: <Y728SwYZeThQzohb@intel.com>
References: <Y72WBTUmh9r1lvKN@work>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y72WBTUmh9r1lvKN@work>
X-ClientProxiedBy: BY5PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4894:EE_
X-MS-Office365-Filtering-Correlation-Id: cfaab432-7eac-4584-01c9-08daf340d30e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EcLvdXSOdWXiHXwgYxLu7TE1OoPhxZ1hVt5gntoAZH3OEkMaY1dQ8uSyKIpufbbPxT2cgh3WJNr8yRvIXrELjdeOBfb0cZpVjweDREmuGkwMjW5sXuVLzYsMQ270O+q3p/r0sXnWHINuWmJqX/izjMHstleF83mAYruhKs6DJHhvg9pd6oBnNjLNyKcZbKE2Bmy8s2TEFcnXWua4Hv9lgYYE1A15NKYLZfXat8aGqgQ/22KWU92/eZRdQ0YKdQG3yoqhJc7p0nZ/N4Qog1+F3hSzzUvN5FQ/1YFX7DtHpc2OmvIv6TjfNP9lRronep2yvNnkDEc3GIHpkw/svG+BWU02QGSYnosEEXBLzOk8lrX5V7QXc7ES6Ct7HlC8+phq1ne7HZYDGe1/XwJga3Y3dTobqOyM9tARxPcC/vN1SRaDsv28ZBwDfK3233+hKqqTaRlov4bWLay/hH7cLnz3C3XNpjoWfxkPy2E9J6/pEb48s9SUIb2ZJVHnm+T+kPBKp/0sULxbuoJQTsgCv5ZwWIfAlrfb+h/1mT31rw5LexiBQ+COjw69HvPUxL9Umm/krNB6TfRKM7tMRUrn9ZEsCf9GOJx/6gjsKNbZ+qvtlw3ofA4iWPr7wkx2Tldtx6KXqsj4m57I9oNhLpgF1Pro+rFcJI/gN+SdxlO5QIGUwdcKeGwvBrhPfQDH032mIXgSlMBd0OOngag4//Fg8Is6gQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199015)(6506007)(6486002)(6666004)(478600001)(966005)(2616005)(4326008)(26005)(186003)(6512007)(66556008)(316002)(8676002)(6916009)(66476007)(54906003)(86362001)(38100700002)(82960400001)(83380400001)(41300700001)(66946007)(7416002)(5660300002)(36756003)(2906002)(8936002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jQ4ZzYowF6pAbt7L2GtBAUnqH4KjAj2J5kXqDq7JvFU9Q2fSp3tsebKamebV?=
 =?us-ascii?Q?KsEdRlDhayk6Ta3rKjxnkE+y/Bsvhfs42Cmiw+DPlSN1EsnysAMTh2T8J5t5?=
 =?us-ascii?Q?CAhC7+sSdYTWjmtGaBiX4b8ngOW2xzbBcXTwHyxRHigAeGuBiK69WZoNGcBl?=
 =?us-ascii?Q?HP/7DjBy7HH8e3kgGXoTTvlRLKP6yV0HdWo24XeN2XiYQYcDkulzRSdT6cSt?=
 =?us-ascii?Q?iEWg611gPaUdGZZGtOSw+kYS2oG0nLSO6SqBb2nQZObFfrpKzqy4WhjfEpvk?=
 =?us-ascii?Q?6Ort6PqB8KM4Nl/zfpRlnwEe/KVb0ZYzvh3rSIy24VRe/+qkuioU9znR6y7f?=
 =?us-ascii?Q?1vv1BfcO0MyDQL9l6L9SCOwE04Ksda5ryKZ7XfasjCIf0ykrbfZUEDYNGCI7?=
 =?us-ascii?Q?YCNEuAkIboacfAfzDkjApqxRtDw0GPPiYWIeLPtxUHdKD6mSAU4erdcWuXg+?=
 =?us-ascii?Q?ZESXSrC+dJJx2lDWD8A7WTOLpKBcmaq9/CSx38htVJ7VeEAmVLZUY+/tigc1?=
 =?us-ascii?Q?sieIx3c77/18EntYR7Xh5pyN2+NGByt4hGZ8AV3hVXCuK6uG/J2x/BL5NW+P?=
 =?us-ascii?Q?6Q574yWE22KrDQyspHw/2z/IJd+jZuKAgsCi3osCFaxwsd4s+HyNk+CUUgae?=
 =?us-ascii?Q?qbzYVUIg60lC97JlUzNuj4O8p36awxdwNBp4GzO+A1sQnpSkKqIBFKul15WU?=
 =?us-ascii?Q?kqAsKYKcLPjP/y6skDMoPeqfBxDV9Msn2er508FPyuNEIIwA8bfcLrEjnnoX?=
 =?us-ascii?Q?/xiF1BSTvZie3SzQ6Eij0r3iEWwxR0LXmOtxHc18B/YFUoMVzM5dVx9X3Ctx?=
 =?us-ascii?Q?+6QIcVJOuMZ8lcv1Fch9nmWcbibiqA/mp8fPm0M0miRyACyWhzq0HKyY+JWX?=
 =?us-ascii?Q?V5ctuNiwDmPKThVJhswvjJw6Nt00CCkAhS0bjxzOhNJwfhoh6hqNinZpMnnC?=
 =?us-ascii?Q?ME+hYBR7rR1Kv3ADXLBAAegx2XIDbip1HbYodj6iokhyJEkaaO/gIFTnbKD0?=
 =?us-ascii?Q?Kp13fAimCjGkxATLAjVnCS4MY3+bLLbip+h0ZZiqTclpOoNVhTzVtcvxqAs/?=
 =?us-ascii?Q?ChqCPFvbh2trbVc9tQPcwhK9w/Vrb4gw1VZESE/BkMmwgfaKb0Q3+GtTzm17?=
 =?us-ascii?Q?E9Cijw5v/TVilFbKTZ0cd/nVabBpr4iko4XVx1PBJ+ae0LcRZoMyiZN9rhAA?=
 =?us-ascii?Q?tgOYJRK7Rq+8k9O7jUBMsmOoqvC+lo6PawRjLQjmFbzGT8+nzybZ6HRqILKu?=
 =?us-ascii?Q?/iY/fYNlL8LlY9Ew1hMLf+AwlpNDP7u9WjK+MH1TDMQ7gXwsRKy+YObIGLBI?=
 =?us-ascii?Q?AVu/IFPMP1cUWZYCRHxi4d89aDRHDwZh9SKJmblhngJZqHV1tkGsMRlqw1dB?=
 =?us-ascii?Q?iz6hnqkxEZ4RUqf3YlKI6aB/pyYU/E/M8NHj8/4TZhO3ZafmlbZq2Cbu9pVC?=
 =?us-ascii?Q?eQFUsQy71WQv+jp3pmM5yuK/iNFf0PUz7nOuIGN8kJ3ugFOHjD9ESLxk6Co2?=
 =?us-ascii?Q?K0NIYBBul8H50DYr/R+RkDhlgH/w5mwd7rUhXyn55OmOVFDPOjd10jkai3NU?=
 =?us-ascii?Q?zQ9aQgkNKoxxbzZxjjs1m2rXcfFMON6FOHfmtAk43AaNXRulyNgsWxS5/PdP?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfaab432-7eac-4584-01c9-08daf340d30e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 19:28:17.3056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zbprlyQm30O2gAVhoirqufQmMYUg7nNElvUd2Cx5l7OY6of/dh8e1X7QJu6trkW/AgpDNuNfPyF3SQHKZPMkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4894
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, Jan 10, 2023 at 10:44:53AM -0600, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated[1] and we are moving towards
> adopting C99 flexible-array members, instead. So, replace zero-length
> arrays in a couple of structures (three, actually) with flex-array
> members.
> 
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [2].
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays [1]
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [2]
> Link: https://github.com/KSPP/linux/issues/78
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

> ---
>  drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h b/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
> index 3624abfd22d1..9d589c28f40f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/guc_capture_fwif.h
> @@ -73,7 +73,7 @@ struct guc_debug_capture_list_header {
>  
>  struct guc_debug_capture_list {
>  	struct guc_debug_capture_list_header header;
> -	struct guc_mmio_reg regs[0];
> +	struct guc_mmio_reg regs[];
>  } __packed;
>  
>  /**
> @@ -125,7 +125,7 @@ struct guc_state_capture_header_t {
>  
>  struct guc_state_capture_t {
>  	struct guc_state_capture_header_t header;
> -	struct guc_mmio_reg mmio_entries[0];
> +	struct guc_mmio_reg mmio_entries[];
>  } __packed;
>  
>  enum guc_capture_group_types {
> @@ -145,7 +145,7 @@ struct guc_state_capture_group_header_t {
>  /* this is the top level structure where an error-capture dump starts */
>  struct guc_state_capture_group_t {
>  	struct guc_state_capture_group_header_t grp_header;
> -	struct guc_state_capture_t capture_entries[0];
> +	struct guc_state_capture_t capture_entries[];

Please notice we are currently using sizeof(struct ...).
Along with your proposed changes, shouldn't we also start using
the struct_size() which already take the flexible array into account?

>  } __packed;
>  
>  /**
> -- 
> 2.34.1
> 
