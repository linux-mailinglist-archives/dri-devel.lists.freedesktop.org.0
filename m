Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1952699F81
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 22:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B8C10E38D;
	Thu, 16 Feb 2023 21:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C403D10E38B;
 Thu, 16 Feb 2023 21:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676584545; x=1708120545;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=psA8nG2XqHJZvv2HVMOjw80kRuVnHI3cNfAwMN47g/A=;
 b=ZbloLG+4MNt6F+mYl2zb0cDGhRSBy2V8iiizM1QKF1E/OzWjMIs+UqrJ
 o8Gx2G+SrqANNaSeB7w1vq0f8sDHYs+FG9qkAoDGPqHTgnQf88kLbdqea
 fL6Nk39c68vPWjBKW/EFhFEjgQhzJXvDrZfDES84JssYA/UYLSvTgnNIX
 xDn+07jCWCVeKwQA+mwLwD0XAeYAgh3KLAkELwJbJx2mNQN8D9lv602vi
 ZrEHqcBDkOHDej9yopURKL5ki2Q9BwTWPZ/1tT4WxjYogxf5jdpxrQkaM
 X/uhG66jtWi2p9izU66AaADQKeJsZB7sue79S3YL0dxTyOJSj9e6WDdQt w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="394321699"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="394321699"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 13:55:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="915849955"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="915849955"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 16 Feb 2023 13:55:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 13:55:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 13:55:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 13:55:43 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 13:55:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g10l2ZXntrc3aKj4dRjA4BVwyMixsgBleK3Y/8oUJajVSwTm4Ko7OIOXFvr9hkADd7Rh/6PPq7Mt06eOZrpENbm/McO18RDOVGJTlTq8g8LxXwspghSmOo4lPPuHgGlnXJmIhq72bT84BZIINxWwNTrPDIxuvs4svTY/9OWvc8oq0SLdcU90NBivFm62x57y0R9VYWUJ9QxzJYEZQRHZBiM83bCIY2dHjDodeDfIaHfc1QYDPpF2uv1u4Hal2O6dnwFWajamEANqZlav3CYYraVxjAxQ7lcZ67jz0TaWM2gWR/MfhNAxN/KL5ihndo3XjCcYbE84OqiUFC1lJRPNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpjxjRMmTAoL4CxHUa3JTaAsITmXo7i9aGsJCU9WxAw=;
 b=giJc1JKmW1cMGev5cg6FKQtRHjzaGK14UkXfY2qPtc+Jvnb+F4H5EwEzz5edBjMz4TguJHPK0PJE53E/Fv04gpcRB96f/GyudmcyrUToHAJSTU+Yyf5eQXC6rVjIde0O1eLD658kU0N5EwPvKwm99K/auG/G/fRzH5sfdsfdoGWj+sTxKC/xe/ZI0+e1MJ46BZNyPzF0fnqo0ayp/Pr6Vrvdu4wUKZJl2A4IxT/bnAfOWnrL3/1Pm/QqacWizDNRr74iJPMwSiVsv0JJlzvZVFQV5+6LWXATHi8Xoh9G+PV1HUp9H5UVQBvDpnwg/hTvBQy63JhtV569Z7rbBG66nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7687.namprd11.prod.outlook.com (2603:10b6:930:74::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 21:55:42 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 21:55:42 +0000
Date: Thu, 16 Feb 2023 16:55:38 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 0/2] PL1 power limit fixes for ATSM
Message-ID: <Y+6mWiPNgvYPfCoj@intel.com>
References: <20230216164944.2366150-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230216164944.2366150-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0168.namprd05.prod.outlook.com
 (2603:10b6:a03:339::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: d9afb8ad-bc02-4bf6-00ec-08db10688c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: biEc9ozq7/80JxaR7zwaXFsHMwVmQrxxJQz7fTB+nJ7eOBWSvBQtsRX7UMH2dF2DaVP1lqWNDSugS23/++QCgNxTPGd7QDE+ofqh7KgsXyymGx+M90lIcZFvoIwXa13P3ztgaA4MM5h/Sky3Bo4PEXkJBGadKczTiuCXZPZlqDE28pV8bZPDLOImPtqYLTkQqdc9WcsnU1MEEyhjd23GTLLEy80G7/NurssVy0IXzCvObUFMBRcXMvoP1AuzpNd7NZPrto9Dha8oKixABefE5vxRT+8N6c10HlGBPhVEmPEqX132DF5NnR/mY5t1qQVFYxUFvjMbQstBWc+2uJqk41/0Ss5cKY6dvlW0tIFiHku1m5SYE4eSLqJDAmy37IEgrQL3/05mFi99dFeLLvsV4tYFmp4PWRHEOKOpyRZoVmljld84Zj63unxYW5utvAPwwZYdohxRl6yScDdirt3Wi6QxjoPqtulPIfliuM3OzuCrpv/W7CMLYAg0I65VKXQQ9TxejRE0e/10at4bGZLSV282/ua+NmQhu8comFPIRxygfMu8l8kBoLsFNnkHAdzFkGq8BhqqA3bPOGZL/Ksw7QpRpEMmSmalQoqg8EahFcPjRK/oeB/61da6idiP/q+dC+jqh/ak23iMwOyGhDYYEXf1Qr6EpeC2CYAjnd8q4ek3IIkOWsNXZ/GDKnCBoarl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199018)(4326008)(8936002)(2906002)(36756003)(66946007)(6862004)(44832011)(66556008)(66476007)(5660300002)(4744005)(41300700001)(6636002)(450100002)(8676002)(37006003)(316002)(186003)(478600001)(6666004)(6512007)(6506007)(86362001)(6486002)(2616005)(82960400001)(38100700002)(26005)(83380400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TiVwSv4G1mZkyv600Mym9hNdFxLispYO8j3AJ/t3t8GlBOqciCNP5Vca3osF?=
 =?us-ascii?Q?lcm5NAs4lxQr27pa22SB6WJziQqhaST6uf1O6So20JdRK1EKt+U7qTLYAHcd?=
 =?us-ascii?Q?kyuMIvB0ChbFcyeupv18/q3XfTcP6QoEAkceT5oZPkMwlmWIHpeHEMwcOpGJ?=
 =?us-ascii?Q?JInlcO4x2an4XWHQRCNrADjeUzn6Mhn5mWgYB80v+8Hviba5m1xfx2KuEi1h?=
 =?us-ascii?Q?Z6YkPszNglpaEUaHJSCeMzjUP5k1tKsMMMVJtUJVEnb8KEOX6Er1AIIgicci?=
 =?us-ascii?Q?cCGz7pKwpxZUDadHgB0gHLvjKVPtaF12R1QrT+HM+aDgBPwbRQJoBnlOqOej?=
 =?us-ascii?Q?+I9algNFOxX2kQcUVNxzEqNcPjoWMBw0KYrlx+gJsv068LC2mpgF53bRs3ug?=
 =?us-ascii?Q?6YSQZvyb9pevfwD2coPU5jzeeDgkbHhzzBuoWng8ZJlndWdVhydlrDIHa6IE?=
 =?us-ascii?Q?9rafmFy7LiW9CqrA/azNVNTSVt6WCwAQMJqKkb8Y9LSpoWEDDwEYwmkgnuKn?=
 =?us-ascii?Q?k9l/y0gMbkzXO3twv+5bxRBCR+vBArtvDjMun9RodW6R52nTYsF5yG7Yfx0x?=
 =?us-ascii?Q?kSy7ni6E0l4e1YDE2Rq9zZQkYAgHcC/mPMi6kp348hnYrWqvjtMB8RZ5RngA?=
 =?us-ascii?Q?lEe2H1k50lnUfhYK9LHAio+AR+owO2SwuJVAlp6ybdmfSdeu1HbwVtHygGE6?=
 =?us-ascii?Q?Aml+ebotaejgOGaiOYeaWAJSfDim66KG4x/ZbWvKqv3/mQfuXRewQ9xsspMG?=
 =?us-ascii?Q?a4znBf6xhe1n3w0lyvNP1EiYHr5oSIESUxcyUyoCXDxJvISckzto4fSXbxDX?=
 =?us-ascii?Q?dK0oDeC0xCMYL0DRgfldk1KZ1mgs3rY5fL/JFq4LZhMbHMBUNRMicTgS9PID?=
 =?us-ascii?Q?LlHm1HRb4PqioNPFaYE7PbeM86MiWZ2+DA0sJoZQ452Cm6D3qUvMCgvdJhjo?=
 =?us-ascii?Q?2a533R7UkH+HF/NpIRcJqg21e7a7WHZCjcwO8T/DtTE2a77FeH47TXM840bk?=
 =?us-ascii?Q?+5O4RzYGC794VsemXq3iuhU96VyZEjrs9MQUcJbvR/YTgbBGekUMiJTyiRMv?=
 =?us-ascii?Q?dfr0uLW3E7NuyvH0NsypJYq+98kIMwZFglHa76D+Jz7n/IOWH8TP9yiOuR+1?=
 =?us-ascii?Q?e/xGChNi7czByog0wXrYth/tZCMH+KTyDBUCwq7sdqARcvbVlMVI4safsSBi?=
 =?us-ascii?Q?aCCvPkTNeBWvNmjn1+s4+KNrnoOy05sl8cqJiSQiOggDQpzipUGoNR0RfnvZ?=
 =?us-ascii?Q?TC2ZLsYGGpYhvGVZahALYztJjV8m167+E2EiSv8AyGt/EFajOwUMDdHCVH+T?=
 =?us-ascii?Q?6LfxUn5+0hQXzovkBPtT1vlc7It8PvvFUh3a/3+AA8zlSTP1aHmMDRJa0AcH?=
 =?us-ascii?Q?AOBX9T8nSR4wbDvwkp71nSQnbNFfycpj3EwZVT6V4tDJD0ThvTLkRWv6F40s?=
 =?us-ascii?Q?XumtyD1n8dGGnnotIDpcRvRp23Lj6nbEGwY6Wsev5Q6Y8pLhZ4btwWpGVNXn?=
 =?us-ascii?Q?J1JWaGAcAWKeLSmywwosRbgYp//7lZdSpHH9kyU4/4pdTBq2XMQlgCwdGuhh?=
 =?us-ascii?Q?ZiT5T2pbpBS6TDh2oiSsbElB3dwqz/GFieXPfEh6+PvyPpp4JVO5HDJQS3iz?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9afb8ad-bc02-4bf6-00ec-08db10688c62
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 21:55:42.3745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRV9TSdmazQB77YNguNVSN9I/0zIjnqgJtBjjxo/mhCojiga/McmBwfGozIbSTZzapxmR3ap9FOYj5Q/tz9lUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7687
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

On Thu, Feb 16, 2023 at 08:49:42AM -0800, Ashutosh Dixit wrote:
> Previous PL1 power limit implementation assumed that the PL1 limit is
> always enabled in HW. However we now find this not to be the case on ATSM
> where the PL1 limit is disabled at power up. This requires changes in the
> previous PL1 limit implementation.
> 
> v2: Dropping Patch 3 (since it is NAK'd by hwmon) so that the first two
>     patches can get merged. The first two patches are sufficient to fix the
>     main ATSM issue.

pushed both patches to drm-intel-next.

> 
> Ashutosh Dixit (2):
>   drm/i915/hwmon: Replace hwm_field_scale_and_write with
>     hwm_power_max_write
>   drm/i915/hwmon: Enable PL1 limit when writing limit value to HW
> 
>  drivers/gpu/drm/i915/i915_hwmon.c | 37 ++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 20 deletions(-)
> 
> -- 
> 2.38.0
> 
