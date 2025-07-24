Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3452B10F92
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 18:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0C010E05D;
	Thu, 24 Jul 2025 16:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvKpsxp6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E704C10E05D;
 Thu, 24 Jul 2025 16:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753374075; x=1784910075;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pANwun3oMOJRKDHc1/qhsH+6OzahhpiGzo+Z9LJ7oRI=;
 b=SvKpsxp6UBbscoShtBR0uH8P/r+Pauh+81L631onF9dBM7/ur/PPTrzH
 YcnT8MD9AE7ivzvqySH7vNcQN305bYqudQK7Y5RfaUTMqlGdcNpeAj4Ft
 94FvbYiAKR/HM2OJvY9sBntBT/ZOmEMVPnR1wVY7YpW7GiZeVMl5S0MDb
 WkrEHZIPE2+46+CvPRlc57UFeaAkY+Utt0bWCW5VGO8Z6Of/1pHo0gmFp
 Ejm7X6gCIWIJWIFC8tyF8FZxgjjNEyGijLnjzkQ4qY4FiIpi44XklJkCd
 ztJTgCzju2uOmylwVuSuKQM80BnC4sFJodO68eoU9fGA7W3ZGuDqh+h4u w==;
X-CSE-ConnectionGUID: 6v924MJaQe2A6jopBQjfdw==
X-CSE-MsgGUID: QVdMBXWaQIqQEW4KC4K7QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55401332"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="55401332"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 09:21:14 -0700
X-CSE-ConnectionGUID: gL54J+aXT5a+och8yNAdsA==
X-CSE-MsgGUID: hSnJANkXQtitFd8nwZYWaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160073061"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 09:21:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 09:21:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 09:21:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 09:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zxe291CykVuKBk7yX8FhmPlXtk/Ht8w85eCvqJuWAFBJ8zi3VDHIZgGfbHX7AR2lGUomdkk4dwO4zwcOVl4BKNd73CeS8wP4jRAc+2OWgZD+M64HP703iCd4gZzqGf26gDvBtLUZ3a47sZyHSYlGl5RZZOaeKnpBvdwp5WGjRph3I9cBHbvO7WXWiqcPxQ1hbin2TKKFtxuFv3URUcw4Jq39fkACN9km2W3GIQ18m4vQ9Chx+uzwKYGhlEcrws4yhZrQ2ShbFDbjAPGl60RQUJ9RpE2GS5ieEWlkRTMe8yV9A+FJnW9LUu1tnvfOtgjFVWrku2blWMs2DNka+fVX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gt8KHCicErmmsT7qJASNRrGjIHhoTsN+M0ivB/A5VAE=;
 b=TguI6zSsgIYTIrHD46J88da/Rz7bqbUpTgrQxHfn13b5WoI4ipLXl/RmZ86DSOaIYkXq0bY014p03wRISLlL8WmtiWTpLirqAOZDJvjdHgAudRqYzzyeFQZnyRr0ffm77H17FuNOKAVtsvswipYOqqTSnLWiaq/mQXNREQDqtPSMXtfeiFEVCB19sCo9JJE4drv6d1OCUEJK70AHYzYE6sxJADdF4UezduveLDcrOEnjqUiy3i5cdW7IMCzx+PKrZrNUlDlYzazSaEtgOYbYv8QgKnMtuI0kkexdTQ6E9jX1/H9CzeeOO6qEL3MXG+V/NxJCrMPm+QI1S2PwrQ+szA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV3PR11MB8767.namprd11.prod.outlook.com (2603:10b6:408:215::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 16:20:25 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 16:20:24 +0000
Date: Thu, 24 Jul 2025 12:20:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>, <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v6 6/9] drm/xe/doc: Document device wedged and runtime
 survivability
Message-ID: <aIJdQw6X2F0thI8l@intel.com>
References: <20250724143440.232862-1-riana.tauro@intel.com>
 <20250724143440.232862-7-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250724143440.232862-7-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV3PR11MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f1a38c-723c-47ae-c864-08ddcacdfe68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3IUFV+/7rZEntu/JWGPMIGDzXjt0773owBMNM0AryN9CURl+8dUrG5pBDKg3?=
 =?us-ascii?Q?bDvzq6ZwHKgFLc8CMa+kzaCvjxRckLsRXhaKpSjDia8uZMA1F0Al6tFok1Xl?=
 =?us-ascii?Q?bsIVfZu0bg9K3DVdzvHVhuejYLnXytRCii/SHkZHt+zq0pRPNSTqYlGir1Py?=
 =?us-ascii?Q?rICee+LgzCWY7qqm2HFEnWVvu/XttqNhYvqa5xxupHqpcL1M4oRVoDK5Lz9u?=
 =?us-ascii?Q?np3f6QsV7EDCCvyW6W+on8P+KLQDdZ2oo9sZKM2OqKP+VHp5zNpBmMWBRJ8J?=
 =?us-ascii?Q?/eZqsVf/UyLJE1KPJQvzewRiueu8z1oEVWb/iaWzUiaWR3SvtFZTwxdM3oBA?=
 =?us-ascii?Q?UItrrFD+pempl9WxIGvmfW7QPxIx1cmVqwHmzMm5z3AXKxzfKI6WO94ihlCb?=
 =?us-ascii?Q?tK4B5YWw9WGiJyNlnv0+mGGZrIU+Uod0oJdhthlh4HHhlYhp9l71rWW9Uz7Q?=
 =?us-ascii?Q?pz+VUycpp/GVxYAbmQX9LIMcJ07R3TsRAhlfYGplJOg40E3RQgdkCb4P784b?=
 =?us-ascii?Q?W52gwHMDEZe4pQPkLtCmpeiw4K8mdjv+M4rUaEZf8nwXqvCb1hu0lF8LIw3V?=
 =?us-ascii?Q?QcLptpnBhJEY44Gr1A50pslNkGk0qHtSbepfB9cUNpATOGctTHPQdbcXRFmZ?=
 =?us-ascii?Q?2vcHn3qg/m8f4ViZ0Zd1MwD7c1L9359BbFNk8NFsOJk3heatVReOMsOObe5y?=
 =?us-ascii?Q?MJKxWtcFPaYou+oaHTbQKM4jKSdN6PQn7X73DN84cN16pxsBscqcUY6EPqwG?=
 =?us-ascii?Q?Fe2mWl/iPpAx0P1skG72LRLBHr9pW8Cw1kTGAsXTmKydExUGwrFCefpWi+2f?=
 =?us-ascii?Q?+AFaco5/+Y/KQFJfEcsAQYZQfx6dZyfiWS2qLNLBB8vehQiNmb+U8QddC0cT?=
 =?us-ascii?Q?/u83KKfG4pMVJ4+u/HKP0TrujnvHA7LJ4xwtmxBL/OU1ovkqziEXd0TTydm3?=
 =?us-ascii?Q?trDlalaI85/mJQ+nXoNBfcrmrSVLwpTZT07miBej/f7E1OA3IUBCaVmQD2Sg?=
 =?us-ascii?Q?fm3Lacp/uyq1jsMcUVfSJw/+sj543eh/J36sa2Uqq/NeubzbBt2/oLPWo0YY?=
 =?us-ascii?Q?MwYTmfYApiiuq4ylxdqngUSfBH+kHNMxCkhSsnKRMgt2cwrg3fZA5mi2Se4j?=
 =?us-ascii?Q?LBIzNn8mI7Tqm2vMEEH+J77HP/FycaqXFptoGopS8/F/rwPJbN8LuE02ASwI?=
 =?us-ascii?Q?zNsI2qIN25IXaCWl+OMBwsGsMkJGEF4q0tYEsX3vj2Trlr0ZVs+EJMdRgEMI?=
 =?us-ascii?Q?7/G1P4mwmQw9gxSb4ICaQsEA89tTaQW81mAVH3KLwKFQUSBN46tvzbdyxKN5?=
 =?us-ascii?Q?AO2hsXqmjDPFqpRGLG7MkA90cwL2HH2znPYI4oN2DNn5PRiYQQzkyVQhCc1A?=
 =?us-ascii?Q?R09grOW5y4gcotSYd5gY29Sxu3fYjPUx5CEveUPYxg/25rpPHh1x3OV6k67C?=
 =?us-ascii?Q?Mqs3eN9GXTs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+R39GGuWDrlQwxddCMqdc9wwsg1h3zTOKugLFcq0arPxEox1LrrSbFkr/mQh?=
 =?us-ascii?Q?LOMYm9S3OkRvUPTMPx05cyRPInaHZqfizW5SKTzVMcbpgEmpdI7ZoBWw/Dze?=
 =?us-ascii?Q?CVxe8Jl5uqG9o6joO4KwM4OXZPHa/aJ1Xl1aPs3jimqCY+X+bjCCy4oPYKYd?=
 =?us-ascii?Q?j0tppgSdjY3OLofQaAhctBIErMhoWsmzz4nXA0LHEBp9f1ZLk1bystPOEkTd?=
 =?us-ascii?Q?bFz5GM8pYnngdADYipL3sWhSn5RrZ9ucTQsV7lYdipwzFmN1ADS6ZI4wszka?=
 =?us-ascii?Q?Zrf70hCmVWyz2958dznE/sWDQbUQXptCdSKoBTnHFsn5wDfh6If5tYHdey3p?=
 =?us-ascii?Q?3uoRQ7WkZGOJwAv6aaUxL3oA1279dSigt9pln2iklHAjseBQoM8+G1oeQyxV?=
 =?us-ascii?Q?lqfxarsY/xa/VxXAIfDQO6BnZkAtn3Nv3wN3a28Go5COJ9xIuGszDTNBs7RP?=
 =?us-ascii?Q?l+FIHbOBXGC2bTHxyET76XFV3NcJaTzdmFxZYriTDUNABU+Ht0BraNxF8GQl?=
 =?us-ascii?Q?FDYH/i/ENi/mOZYkFsjei+Ml4qDHavylDg7i4to1kqyTDYVNPwpt8fvMe4gt?=
 =?us-ascii?Q?IKAdYT73PKo6QyLvEX5jWkv7OhNaprJ88AtaMGxNxKAQ1dSGw9/IIBYCbp9V?=
 =?us-ascii?Q?7sayxwS2ovWDr/wHDsaVw2Qzv21tenxAgEZW+4P6sC3qHJmyM2cnlXsJ1YAX?=
 =?us-ascii?Q?Di2uaifZyIjcaQCvu6IWgU+upOsmgxyDFUmL0PaBN2FG/+YyYeG6yclz+Ixn?=
 =?us-ascii?Q?LDHFI031S6m2VQMevW3V1RfJR9SczyNQYaO6W2/uZK3ZOFZhWEs0++lyh41q?=
 =?us-ascii?Q?Qe/ltv7IO/wpGuqhbrnVTVrLRd1F8ijJ9C2fp0QAnBVbbWpgwk2dxust2Dkv?=
 =?us-ascii?Q?Lo1ImNb5hNvkP6IlcjncQOo92LuhBQgPYO8pXgeiOSS3YMdu/4tdDGPYgJu0?=
 =?us-ascii?Q?/BBBMub/DK/BfAqnoIh5zYSp+Rdc5wp11SR7P2YzlrOO0meLfUjQoIKxJ315?=
 =?us-ascii?Q?QMz1WwDOEXqXYZyjZNkRb2aDbRnHibhzTmEq0gEsjaNUcSRtyGGOwMLmeFqI?=
 =?us-ascii?Q?kMQBdW8UZBhBFgGzrN+X9xZ68PAF8vGdVZaJhMFodHwvdNDF7JAo38+xgma1?=
 =?us-ascii?Q?NDstUlGfDPWauLnCP+kXBzXyHPcPRxSMW7gAlApdASdUnBBdE4QmnveboPMA?=
 =?us-ascii?Q?De67micOZHLEg1xnjUbCONkiy9nwJ4/tN2hTj3OaD7lB896wDGwcs6ux/IpJ?=
 =?us-ascii?Q?o4ik/BMk03RqhAwVypNy5drJ8N00Lg39DUKCQIngwdGJR9PEu3fI2jnpGJ6E?=
 =?us-ascii?Q?Mw0JbM7WjymuHkeoVxh2l0rvmotIvK6f79tA5OiuMThFy7YSbytfiMRs2N1i?=
 =?us-ascii?Q?qdThHInvsLmcIzoQxlJZiKq0mEMs6hDPAH2054hj5uCG3bH/nydZx3evEOis?=
 =?us-ascii?Q?xKz93uhcjI+V8adRFxv8793MHxTu1uGrl+aBKZ0K/Z8v2rvu+SO8QyBeMUIb?=
 =?us-ascii?Q?hQSTxmJg2ro4Y9+8f7hGDKJRIBD2pIUGypVu8YXd8jkU1q9Z0b8z7ruG2Mm/?=
 =?us-ascii?Q?wrshT6mEgjyRpKMcMltQ1QBspsv5WaxSz9nhcQZMwnx2Vrh/NLHryRCPd3ZS?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f1a38c-723c-47ae-c864-08ddcacdfe68
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 16:20:24.5202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /e8/i7Ks8ed/sLpwc4aESTQe+x/pWyEPFKoEP9cYIN2hpHgekJX+1sJlsVgbglZGZCH91MJlDt7K/RYcUQHpKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8767
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

On Thu, Jul 24, 2025 at 08:04:35PM +0530, Riana Tauro wrote:
> Add documentation for vendor specific device wedged recovery method
> and runtime survivability.
> 
> v2: fix documentation (Raag)
> v3: add userspace tool for firmware update (Raag)
> v4: use consistent documentation (Raag)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  Documentation/gpu/xe/index.rst             |  1 +
>  Documentation/gpu/xe/xe_device.rst         | 10 +++++++
>  Documentation/gpu/xe/xe_pcode.rst          |  6 ++--
>  drivers/gpu/drm/xe/xe_device.c             | 22 ++++++++++++++
>  drivers/gpu/drm/xe/xe_survivability_mode.c | 35 +++++++++++++++++-----
>  5 files changed, 64 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/gpu/xe/xe_device.rst
> 
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 42ba6c263cd0..88b22fad880e 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -25,5 +25,6 @@ DG2, etc is provided to prototype the driver.
>     xe_tile
>     xe_debugging
>     xe_devcoredump
> +   xe_device
>     xe-drm-usage-stats.rst
>     xe_configfs
> diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
> new file mode 100644
> index 000000000000..39a937b97cd3
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_device.rst
> @@ -0,0 +1,10 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +.. _xe-device-wedging:
> +
> +==================
> +Xe Device Wedging
> +==================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
> +   :doc: Xe Device Wedging
> diff --git a/Documentation/gpu/xe/xe_pcode.rst b/Documentation/gpu/xe/xe_pcode.rst
> index 5937ef3599b0..2a43601123cb 100644
> --- a/Documentation/gpu/xe/xe_pcode.rst
> +++ b/Documentation/gpu/xe/xe_pcode.rst
> @@ -13,9 +13,11 @@ Internal API
>  .. kernel-doc:: drivers/gpu/drm/xe/xe_pcode.c
>     :internal:
>  
> +.. _xe-survivability-mode:
> +
>  ==================
> -Boot Survivability
> +Survivability Mode
>  ==================
>  
>  .. kernel-doc:: drivers/gpu/drm/xe/xe_survivability_mode.c
> -   :doc: Xe Boot Survivability
> +   :doc: Survivability Mode
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index df29b87ffc5f..4a34b15f9527 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1157,6 +1157,28 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>  }
>  
>  /**
> + * DOC: Xe Device Wedging
> + *
> + * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> + *
> + * When device is in wedged state, every IOCTL will be blocked and GT cannot be
> + * used. Certain critical errors like gt reset failure, firmware failures can cause
> + * the device to be wedged. The default recovery method for a wedged state
> + * is rebind/bus-reset.
> + *
> + * Another recovery method is vendor-specific. Below are the usecases that trigger
> + * vendor-specific drm device wedged uevent and the procedure to be performed
> + * to recover the device.
> + *
> + * Case 1: CSC firmware errors require a firmware flash to restore normal device
> + *         operation. Since firmware flash is a vendor-specific action
> + *         ``WEDGED=vendor-specific`` recovery method along with
> + *         :ref:`runtime survivability mode <xe-survivability-mode>` is used to
> + *         notify userspace. User can then initiate a firmware flash using userspace tools
> + *         like fwupd to restore device to normal situation.
> + */
> +
> +/*
>   * xe_device_set_wedged_method - Set wedged recovery method
>   * @xe: xe device instance
>   * @method: recovery method to set
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 267d0e3fd85a..86ba767c4e44 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -22,15 +22,18 @@
>  #define MAX_SCRATCH_MMIO 8
>  
>  /**
> - * DOC: Xe Boot Survivability
> + * DOC: Survivability Mode
>   *
> - * Boot Survivability is a software based workflow for recovering a system in a failed boot state
> + * Survivability Mode is a software based workflow for recovering a system in a failed boot state
>   * Here system recoverability is concerned with recovering the firmware responsible for boot.
>   *
> - * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
> - * to be flashed through mei and collect telemetry. The driver's probe flow is modified
> - * such that it enters survivability mode when pcode initialization is incomplete and boot status
> - * denotes a failure.
> + * Boot Survivability
> + * ===================
> + *
> + * Boot Survivability is implemented by loading the driver with bare minimum (no drm card) to allow
> + * the firmware to be flashed through mei driver and collect telemetry. The driver's probe flow is
> + * modified such that it enters survivability mode when pcode initialization is incomplete and boot
> + * status denotes a failure.
>   *
>   * Survivability mode can also be entered manually using the survivability mode attribute available
>   * through configfs which is beneficial in several usecases. It can be used to address scenarios
> @@ -46,7 +49,7 @@
>   * Survivability mode is indicated by the below admin-only readable sysfs which provides additional
>   * debug information::
>   *
> - *	/sys/bus/pci/devices/<device>/surivability_mode
> + *	/sys/bus/pci/devices/<device>/survivability_mode
>   *
>   * Capability Information:
>   *	Provides boot status
> @@ -56,6 +59,22 @@
>   *	Provides history of previous failures
>   * Auxiliary Information
>   *	Certain failures may have information in addition to postcode information
> + *
> + * Runtime Survivability
> + * =====================
> + *
> + * Certain runtime firmware errors can cause the device to enter a wedged state
> + * (:ref:`xe-device-wedging`) requiring a firmware flash to restore normal operation.
> + * Runtime Survivability Mode indicates that a firmware flash is necessary to recover the device and
> + * is indicated by the presence of survivability mode sysfs::
> + *
> + *	/sys/bus/pci/devices/<device>/survivability_mode
> + *
> + * Survivability mode sysfs provides information about the type of survivability mode.
> + *
> + * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
> + * survivability mode. User can then initiate a firmware flash using userspace tools like fwupd
> + * to restore device to normal operation.
>   */
>  
>  static u32 aux_history_offset(u32 reg_value)
> @@ -327,7 +346,7 @@ int xe_survivability_mode_runtime_enable(struct xe_device *xe)
>  
>  	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>  	xe_device_declare_wedged(xe);
> -	dev_err(&pdev->dev, "Firmware update required, Refer the userspace documentation for more details!\n");
> +	dev_err(&pdev->dev, "Firmware flash required, Refer the userspace documentation for more details!\n");
>  
>  	return 0;
>  }
> -- 
> 2.47.1
> 
