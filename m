Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240A26108C2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 05:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE1C10E74D;
	Fri, 28 Oct 2022 03:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C9D10E74C;
 Fri, 28 Oct 2022 03:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666927923; x=1698463923;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Abs6AoYYsZ3a6aWW/DTRQ9EnLNu/+55/JLhGDpgzLQs=;
 b=fVmk2pyHt37A9MBH6ymEDvdzxZXa+BReQWKgSpvHDJBFn30kyIUUq0Tm
 9pWyX7fJGUTGrh+7kR4geU4aNzDPtOHXCg2t86uDgXgRuZbyHvFrXWOVL
 M+AnKxCBtXYtc65eTpnxhJhYbDzssmW1t8z4fMTwRhJEoaZEoG+RCLmos
 UUhZ955hKgnH4CIV6PIbt9pezJDjQ+XJBH8odbFABcQamFZ3A1fEr508o
 UzExS/GjOeK5h9noewA560ewWBsUO/WR+jGZBvpGPasn2g9tjGuQH8reQ
 gmCNvCuFO1zit2OembG9hleJdfJXBUgE26Tt3UpaDk5hsgGjh4+wheDRL g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="310097542"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="310097542"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 20:32:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="701586855"
X-IronPort-AV: E=Sophos;i="5.95,219,1661842800"; d="scan'208";a="701586855"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 27 Oct 2022 20:32:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 20:32:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 20:32:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 27 Oct 2022 20:32:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 27 Oct 2022 20:32:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGrwcJ2fEqPpo1GePQLOgBJBbmmf7vte+iTQxdFm9sPF+fQaWXfOs/6lTrljaVVHQLrAQyhS7KKsSckv/IvoTzAyLA52kIrIsjNFzcd+qmuboxy+UyE+frOlvsJ4HC/iSAUErNRdWM+NQL6bsiqzn6ueO5Jrdoz/AX90IYpDbQGAhizmO1VaBrbg30S0YYPev0RhSt8EYFNBS517N+FycHOuccN9u2EMV9V6pmVA2cOGX8ZuPNnykUxwqRe5wSrJN5Ngu5cmZOtdkGW+0D0UinPQN++4ERNEOQrxJzf5+q+vllhltyQ9eGWIiQdbu4m6mq1n9Z5/n/4EYta+PYADKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjAZCTaLc4WHad0VkKjq79AWMMvoVyj23n7EEtpjtfc=;
 b=mfQ442YpgrrX9iDV+rlQY58p/jSxFpzgjrcoT7GeT2lUfY+8UCype+OELqkJy8G1GVc1Pj5Cr+YgxnzcOxgT0v8ioFPxJBqa/yBxrli7FWAhuwQWvq/xPsgGxRTabXhEIEFZ/vmeC9MRwKs6bHGK6ZdfqxMfi3WJp7WTcBGEJGJrOYS0NtJF3lgkt9HP1eJN3LfoNBUqvNqoOk/6TptLCcMUJNFv2AJFQbQEjFwZWEbxs2Et02h+mwLkbA9JE4Fegq9yzfu2OKwtwdJyaaxKJXdg2NLx0SniaaPvHOccHVPLjKnsxL4qRREHvrpAODg3DQ/AtKh0Xk0c7p06OUSHfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by PH7PR11MB6499.namprd11.prod.outlook.com (2603:10b6:510:1f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 03:31:58 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::8007:140:f87b:ce57]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::8007:140:f87b:ce57%5]) with mapi id 15.20.5746.028; Fri, 28 Oct 2022
 03:31:58 +0000
Date: Thu, 27 Oct 2022 20:31:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 4/5] drm/i915/mtl: add GSC CS reset support
Message-ID: <Y1tNLBzyLTMgnWJM@mdroper-desk1.amr.corp.intel.com>
References: <20221027221554.2638087-1-daniele.ceraolospurio@intel.com>
 <20221027221554.2638087-5-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221027221554.2638087-5-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR05CA0173.namprd05.prod.outlook.com
 (2603:10b6:a03:339::28) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|PH7PR11MB6499:EE_
X-MS-Office365-Filtering-Correlation-Id: 9272fdd9-8a69-4778-63e4-08dab894f84d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YNhip4Guvz2815lM8/PM0L3duEBS1Nf8bCw3xyxfycBvSKaEqTScjxXcbODIxGLIUnpmBNaKz+JGhF86egZOTUNduQiA6zflD4xuHTa7hRvED/f6DhvO7SShWiBTcIievdEJubvOLVJhlPmvVeJsOudgwJlJLBNIravDmxRZ9eZE/cV7aIM5xqfHCcAN36QL6eOS15ITTYJKg6OXdjvlGJV256mQBlbYweuZSSUIvYgNOKa80RpioqxnsmVH+0UmrmrnjcdFiPrIc13NRSro1SwokYiwtjlosQF3DuvtkTTI4t0jglFEjWCOWpwnXws8OOl8BLBg5xlOVfughM6I2bL+RIDGHfUb0de4RSUg6PIyhIc+rzpePHvGxRvUmq3hhjHODSHq3wDyqp/XP7nwe3A1R1YbAaPFE70OdUSlY6lZ+A/LcQLafcRr4j7uWGZ/9FbTkWBWPC0lzdfpHlqPyFEHSI7O1E3/PlUoit0BmoRcJma9D/4mc3qAPGpTzASnBRcmRqXUk0tL2iFw/+3x0CKKkzyNKVe/8uqtaQDnKQoF+BkGa8aarSeY12d/gmuaTz0IT/xrxoKCwqC2D8JI7dOafAvDAbWhH0Hs9QZdV7Ugp0TTXUpfxBxwNA4V/Shdo9r57269ATHL+5qsnRKr264BrrBDwni9yZA1oerVmeQkp+80uZOCYY//ESRb/O+dYCE8TNjXKnZQUUhMTZ2nTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199015)(41300700001)(8936002)(2906002)(6862004)(66476007)(66556008)(66946007)(4326008)(5660300002)(450100002)(8676002)(86362001)(316002)(82960400001)(6506007)(478600001)(6486002)(6512007)(26005)(6636002)(186003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HVMzlC7CXPhQXHgIKf2Rxf/2mjc7O+nAhRsvCsIVJREzVN0Iby2tDkqGayAX?=
 =?us-ascii?Q?T5ymuK0buKqr98fBGBM3nKHHmXDxAEPUtGwcxBrwccd73xFQurQsRqF7LjR6?=
 =?us-ascii?Q?9jYaenOuwREG7SR5KiP8srBcH7iq3gXpqVPR9G9vpTCZUPkJQU9JhWGehgQH?=
 =?us-ascii?Q?JVQaRfjfk0ampttZu+U4FDIPInNV8gn/8kKn5SyqazLoYZmdotrCzwaJorij?=
 =?us-ascii?Q?AZ9dt+asa4h+iXOiFqx9K8GorOsFjVA4Z5a2k2S6L85qYWITH+W+AanWGPnt?=
 =?us-ascii?Q?NfjVLwr6PWY2cbNrflmuR51F06jvN5pzTTzFuJtXVk5/oVAQvsITwkC/WiNL?=
 =?us-ascii?Q?ehg0n9oWRu6HgmqSJFsfpr/EEwgbb3O/sHDVxNu0bsZPIALUmWUCitXP5rb+?=
 =?us-ascii?Q?JlNEPtV5hASY5WsUWdLuPekt/d+VPjBxkl3+IvyaYBUO4npWY9uVLnhBuUbx?=
 =?us-ascii?Q?IFJIBIeW+9ChtKVVDhqhaG2PYLqnymJr02s0duABDewJHbYUlD8R2gcjtc24?=
 =?us-ascii?Q?zEM4DL19lgSyR8uSxNGw7D210P1HAJA7ld2EdGgNDreml6PoNORuKeynUTa7?=
 =?us-ascii?Q?oFQUMt53kbtCvEd5Z0ZJVugR++a9Zh0s1BeZExaq1UJifbbekW4+jB6OXe7c?=
 =?us-ascii?Q?dzFeugJfCcBCV8jG8+bIRO5Habwpzn+7dLvOvHOFjEaytkXJM0gDiMZQ10Tf?=
 =?us-ascii?Q?d8xf10VHsh4GbtYfOH2mZksEZPRjAuUwIT7pTNinUtCdi8vdq8GZ/HzNtR4w?=
 =?us-ascii?Q?RKqzG1NRGnYDvugdiHw109P14MXo0rWogUm5HEmMk0AtUmSg6Aj4gBRz4dDm?=
 =?us-ascii?Q?d9D0agbp0mROhNUBz4rcVbsUN5ezIWos33hAdnyWuZALsn3YyWKwMPNfcMPl?=
 =?us-ascii?Q?ksQsm+9+dGZfO2UFBpvNrKXRYgJ1PWDzrENCA5gHBp+8/LjXNqPJDxOkxIZ6?=
 =?us-ascii?Q?9KXuGGPU8akZpHhv3VCK7X8Ss25/Q+u6NtYmZzuZATK5haSvJwskNCzMTtZK?=
 =?us-ascii?Q?0q62bXH1Rbw3N0c9CcOFEzgzK6RtZF+tq0GunKHLlnpwtS2hee4mO76mOgM+?=
 =?us-ascii?Q?Cmv8FyZapzyFI9PWc01H6mohSo/KWbPMCHx2I5J5d/OuipxVdHSkNd3NKFa/?=
 =?us-ascii?Q?7/oLLb6KjpGI74s5lmJbrMpnfLdDdfz3czEWzy6o2kA4S+6CuX+qy4pbpjeQ?=
 =?us-ascii?Q?YChvJd7pwJrmmyCWO5duMNtph0ZuQje9fwg+CEVQiR7Vf0tC1j5rEnW6PBzQ?=
 =?us-ascii?Q?qrGrkeyBqQ3JsTJHIiAdBdCdCxtWo34bJxYiSBpyYQxK+n1u1rFDtOq+gH/c?=
 =?us-ascii?Q?rK63MjaWUKY9a0QriSytNeuNXNWJKrPwoZsneWygTQmqrmr5k/CBoyZcqRjU?=
 =?us-ascii?Q?pCN7MJdXZMn+vb0YoGwEPg9J2xT/KbUah7wpvfyAlcfWSzDxCY+3yMu7uvhl?=
 =?us-ascii?Q?0nXj6+eE40KCJqhOQ8en3v01Wtfrkcw/1sndgk+YUn8Fty6zLWohqfNWSkT6?=
 =?us-ascii?Q?4atf0h13vvQtrC7gcP2j4FZv5q08U1KNi0tOK0A38z7CEfvFukse0BlVJmdf?=
 =?us-ascii?Q?tfyyTrKDLgUWtKMPt+DZcIQYSLVG50od+8JWDFFFz5POdgQiTSe35YW7VJ8c?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9272fdd9-8a69-4778-63e4-08dab894f84d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 03:31:58.8557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVOJ0z+MapUQNwWkUY/uOloax7+gDa7E5UydbBb0syDomXbZN3JGd1fG7NKJIslPi7DDH6bbC2QmUgzKssU7Bk3xwtmdHZWgVhr2gmoqVVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6499
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 27, 2022 at 03:15:53PM -0700, Daniele Ceraolo Spurio wrote:
> The GSC CS has its own dedicated bit in the GDRST register.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Bspec: 52549
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 1 +
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h   | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index e0fbfac03979..f63829abf66c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -423,6 +423,7 @@ static u32 get_reset_domain(u8 ver, enum intel_engine_id id)
>  			[CCS1]  = GEN11_GRDOM_RENDER,
>  			[CCS2]  = GEN11_GRDOM_RENDER,
>  			[CCS3]  = GEN11_GRDOM_RENDER,
> +			[GSC0]  = GEN12_GRDOM_GSC,
>  		};
>  		GEM_BUG_ON(id >= ARRAY_SIZE(engine_reset_domains) ||
>  			   !engine_reset_domains[id]);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 23844ba7e824..16cf90306085 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -640,6 +640,7 @@
>  #define   XEHPC_GRDOM_BLT3			REG_BIT(26)
>  #define   XEHPC_GRDOM_BLT2			REG_BIT(25)
>  #define   XEHPC_GRDOM_BLT1			REG_BIT(24)
> +#define   GEN12_GRDOM_GSC			REG_BIT(21)
>  #define   GEN11_GRDOM_SFC3			REG_BIT(20)
>  #define   GEN11_GRDOM_SFC2			REG_BIT(19)
>  #define   GEN11_GRDOM_SFC1			REG_BIT(18)
> -- 
> 2.37.3
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
