Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D766EFC94
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 23:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6187910EA4A;
	Wed, 26 Apr 2023 21:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5607810EA49;
 Wed, 26 Apr 2023 21:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682545225; x=1714081225;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tuHS4zSUFUBwPaHLaT4mqrPdqTYT/x1+HNR00gGJPWs=;
 b=cM0X8435DjssM5WU5eThGFGlxjpXme02AFoCGB77ck7IYmT/xzCrxhZL
 p3l34ly15UJmgkiI0Wbii+ViSPOyPlXfchR8iON3ZpVaXf9i1vTLWAoz/
 fHsM9j77ixiHxDO+4AcixR5jgA9oGOmYPECNS5KCMWUqUaAgGtX0pXhjH
 g7S3s2IZgw2cJ2Oqs+Syml2VmVdQu+A5t3wRU0Ay5rh67X+Pa9sm+0sfL
 tio49Lrs1TRNWfdmkDBtmGXHqqZoEJKeGhKkVkHb4QN1oCDo3OMhjCeX+
 Rd4cwv//isyULtRw5fu8DA+HH9OwRyq2VFW5QyvD5xNxlwWWXZjy20F0W Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="412558848"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="412558848"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 14:40:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="696785078"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="696785078"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 26 Apr 2023 14:40:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 14:40:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 14:40:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 14:40:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 14:40:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSIPtFZgK1t0/LJ+BWgJS0OaN1OWquETWt1/5I7fxON9YWw+fF/mQRDjHWA1GPH7B7spPAGzEkSQ03bjf2mkO548KIWfLahopr3CC0ZVI7evfE70pAigVBOUbtt+H9XN2EvU7hUC85W466zzxiiu79daOuhl6qQJdveZKPeK8LovEEaOKsR3Rb6JjN73XzF+dAEYsKkyHSAyd3GrPmzSYgGdhsBWKGPPlX4Zb9nUurrEEzJPTjHBNevfYX6w7zBXu53sY79RmTog/uaSruIIglIVCZvSYZG4wPNOoxuTgHAYaCMB7nQ7dO7Vmu9GAjke069Fto8Otc11pqnGpMlymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0QI5Pb8d/RuupGT1qBwF3VqpOz44h8sesxFtcBtv0E=;
 b=hR2BGgX/mpESDYHdQ6lVq8UhfXTxGE9UPfTKkYuDNuAlucBnruBQYzRNv+EGSN91iiusBFkNRku9/xLjA8AqpNMMSr2+AHCUr7y1JaRH4XZI9TGLK45Y3H7J6ntMpLdzEmc60aTbwnSSUTO/TuS+gruR9RdxfPoMTEVfG0VPDAer9E7l2r+OvjlUMuH9k6plH962OVXHKpC/L7kUZe+qe1GWGlNusuvB5QW+YiLvfV3K05Gd8npg6bA1Nop+OEBI+aF8eB6pNyB3UhYW53zaZck0GUEjftX06bM9aIxaPQq7CAPKkalbIHqHqjmZoAQNRtJ3dZrDnrneDcd3B/n4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 21:40:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.034; Wed, 26 Apr 2023
 21:40:20 +0000
Date: Wed, 26 Apr 2023 14:40:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [PATCH 01/14] drm/xe: Fix print of
 RING_EXECLIST_SQ_CONTENTS_HI
Message-ID: <vc7t6mi62cd5hchta6zm2swt7o32tjt3cisgcpev7ct6niy7s6@4xkq6hqya2pw>
X-Patchwork-Hint: comment
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230426205713.512695-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4845:EE_
X-MS-Office365-Filtering-Correlation-Id: 727776ac-75ab-46ac-550d-08db469ed56f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +DVpV02Axyj1tV04KICDZfrbVXUX3F2drT56fKGYsBoDvtiPXMN5A2aQ2KYAFxO3t16fbGMPUh75ik+7DN8F5oZ1fe32ByuEFb0GYVPXbEpnmgKNkeVZox9U9fMv2t/b9oaMjdTXBQtAAyl43EvEiekFdf6ppEi2C0XV8z7UkzrRg5fcmBTT20lN8kxmNb6zE1opVBaYc6LWnoCEp8vgmR8RcZqi9xPAb+LfifoxwEI3IyZC4WKxD/i39pJ3OZreS9xRGMmt+pOz3eeuBatrzaxQg140iQcPb5jC8IXo2zk1ezBtHAmjihPiSX8sKXGTjC2zIg3fiCRwCYJkFWe0taXR5yaGqTvsy1lxufHdO7ciXqQwXYybRGHkLH4z0/GML9XWvwF7Nj2cNuRiH4VAmLCsG+Y8x3cXXz+X4uX9hGKAyGcSNjbMNU5KIzcuioFyhqaxWn5Z5VwQlZNTXblSpAZB1OdkPnX0QE3eyRN7MVO/2vLWjhJGYCkFc51Y2nnzYb2r2/js4pz5C5Qaw8EckCEBYfV5D1siYVFUJeNQ8+fJDdVQqfYfVbRqBX2+4C6W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199021)(5660300002)(478600001)(38100700002)(6486002)(6512007)(9686003)(26005)(186003)(82960400001)(6636002)(450100002)(83380400001)(6506007)(8936002)(8676002)(41300700001)(2906002)(316002)(4326008)(6862004)(66476007)(66556008)(66946007)(86362001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Yg+iGwHQc80dyZJFMozZOeA7phSPkk87bEePSMwut4yoOGjiXUAhgpK6/q2?=
 =?us-ascii?Q?vghBqaZBgn/XaHoqXkOJ6vX2pa2VKBiaiZSXHhoLpfVMxo7RXPht5lOrg1jn?=
 =?us-ascii?Q?6a77iIPenRHzBFbfNRMXLek4qyyOyxX+AHvuvvPqlhJN0H6AX/nTNjYBZyz4?=
 =?us-ascii?Q?/CN3jg1tsHzFbbC66MIsMqwArniafwcO96WS7ld2rbfXOuJYXLviluvcIFtP?=
 =?us-ascii?Q?UUXJ6IAZnx3o/1qXi2NJnzvKTT/3nOLO+TLRaVUMvvJtT8I03DdQEQW6YADj?=
 =?us-ascii?Q?x6pa7CWlIkZuSZTqJV2ek7qL7YwhA01FC1oxC7H3Dv5p4Y5+xcYOVrJtr9CB?=
 =?us-ascii?Q?Dbvk9NmY5Cc4sxdNY7K4VpuYJeK3aKkysCpjrxCLN5aQdaggKx3iufbNL3AZ?=
 =?us-ascii?Q?qTDrjYGnSuYDiOdiHogCZ2rMFVWkvp2g2n71wZ8LUVDlSVHURDSyR5nWeNW4?=
 =?us-ascii?Q?NxgoDLHzqfsfxq1u9XzlE8zFzy+FEnzKY+GbC3pKJHZGTa0cBzfKkJqtcmXK?=
 =?us-ascii?Q?WxNC+Sf+Xch9DlCqmHTuSMj1wcvGWcvFrrmrqWSDjL4zV0UcINH8rbp+DoR8?=
 =?us-ascii?Q?5JGQwRzbALjhAeB53YSWUYxJMxNpeygs9R7xkHlHUHjOyE7PS/WShUNfLtBi?=
 =?us-ascii?Q?zVK01mi3k0Mo5fOnQNBYwrU03h7WqtKFm+nDKf1C/le83DS/lcZuc54IDmlf?=
 =?us-ascii?Q?sUfc6sm95Dl8JpFdZIxVi8GcQd0IQcijd2GvzEB9MGIOZo8+TwT/7HK/TG0a?=
 =?us-ascii?Q?69ETrvHcjGh6G5zob6gJEzsKMcGr/Wj6O8p/p3bKLwuIzV9wYD6V/9HG3+LH?=
 =?us-ascii?Q?LDq/YAIckPbdEpmvJaqkGpajx540JFNqppGJ9NhpnMvjUrm92SPKmyusaqEk?=
 =?us-ascii?Q?mvj0p68f0SvclssBwFG33j8rJx9vigOz/I+Uar+3MRouTd2j8CrBfDezKtF3?=
 =?us-ascii?Q?oio1ALjShy+sT58Eo20S6IIHxnFh/qf0JRFAzR6M5eSa3v43lY3+ZdJR9kxf?=
 =?us-ascii?Q?DkfZvtdfLcU92rqZvpz8h7DI0SYKicZiFC4g0K6ZpZiDgMVw5tky7UaroxyZ?=
 =?us-ascii?Q?MCJkQsjxyduCyx9kf19DK3yzZgEqkfJZGK0AJBKgehLd37V49/s/w8wD1VOb?=
 =?us-ascii?Q?tT7pDE4V8v7R9VXy9dBkyhMx7TY/TyAh90e4KlfU5mQHGS/eE8gbnUJAHjoU?=
 =?us-ascii?Q?/AHeeThbfTppGQU0Mki5DJdLTirpomFDFgEJHhMbV93BxAIS6OZXEHlSDHvL?=
 =?us-ascii?Q?ZEvaHSB42Lvl+yGHDj6CaWf0uaYZCQ8R8fk9S1/ByYPStqSa0c6BI9vbDBCi?=
 =?us-ascii?Q?jQRne//0WpPBYcHdNEpC7QrmkTKMZhawwsXz22qvPQsMYqzEsWZaDb/r4Hxw?=
 =?us-ascii?Q?ihsnA3mvdTFxaV99gZKn53U2fiPYnrjaCmEnR5m83XXOKVH5uVhkAEUgWXUo?=
 =?us-ascii?Q?jxNV2vAbdu88TJJodRK7f1uZ5dU2AgVO9ysfytjT688kWK8mVmy/jdZ5wLMK?=
 =?us-ascii?Q?7hoa0lexaKY7cMQILlltNdVrDVkUbAg/BZcEMuGNGd0Ha/k0JsdxcUIKT1PK?=
 =?us-ascii?Q?/wMrJLKsPTb0jQU2eb3flET5Gm6XQRgWQj5u5BJlSRJoP8YC8CClEXsrVAmI?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 727776ac-75ab-46ac-550d-08db469ed56f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 21:40:20.4518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNP0OadxjTAj/dYIhjxj8XZ/0E3JjJdrgwEz9Cm5aH+D9xcjx2pLK397m4+Cpn3Vlmk9YdZbl3Uh8PwNup4hOsJWS0+C9MKh9CIDLaRVMeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 04:57:00PM -0400, Rodrigo Vivi wrote:
>On xe_hw_engine_print_state we were printing:
>value_of(0x510) + 4 instead of
>value_of(0x514) as desired.
>
>So, let's properly define a RING_EXECLIST_SQ_CONTENTS_HI
>register to fix the issue and also to avoid other issues
>like that.
>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 ++-
> drivers/gpu/drm/xe/xe_execlist.c         | 4 ++--
> drivers/gpu/drm/xe/xe_hw_engine.c        | 4 ++--
> 3 files changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index 2aa67d001c34..a1e1d1c206fa 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -84,7 +84,8 @@
> 						 RING_FORCE_TO_NONPRIV_DENY)
> #define   RING_MAX_NONPRIV_SLOTS  12
>
>-#define RING_EXECLIST_SQ_CONTENTS(base)		_MMIO((base) + 0x510)
>+#define RING_EXECLIST_SQ_CONTENTS_LO(base)	_MMIO((base) + 0x510)
>+#define RING_EXECLIST_SQ_CONTENTS_HI(base)	_MMIO((base) + 0x510 + 4)
>
> #define RING_EXECLIST_CONTROL(base)		_MMIO((base) + 0x550)
> #define	  EL_CTRL_LOAD				REG_BIT(0)
>diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>index 02021457b1f0..37ac6473195e 100644
>--- a/drivers/gpu/drm/xe/xe_execlist.c
>+++ b/drivers/gpu/drm/xe/xe_execlist.c
>@@ -84,9 +84,9 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
> 	xe_mmio_write32(gt, RING_MODE_GEN7(hwe->mmio_base).reg,
> 			_MASKED_BIT_ENABLE(GEN11_GFX_DISABLE_LEGACY_MODE));
>
>-	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS(hwe->mmio_base).reg + 0,
>+	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base).reg,
> 			lower_32_bits(lrc_desc));
>-	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS(hwe->mmio_base).reg + 4,
>+	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS_HI(hwe->mmio_base).reg,
> 			upper_32_bits(lrc_desc));
> 	xe_mmio_write32(gt, RING_EXECLIST_CONTROL(hwe->mmio_base).reg,
> 			EL_CTRL_LOAD);
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 4b56c35b988d..23b9f120c258 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -528,10 +528,10 @@ void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
> 		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0).reg));
> 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_LO: 0x%08x\n",
> 		hw_engine_mmio_read32(hwe,

after this series and mine about register refactor we should probably go
and fix the coding style in this function.

... thankfully it was just this print that was wrong and the rest was
correct.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>-					 RING_EXECLIST_SQ_CONTENTS(0).reg));
>+					 RING_EXECLIST_SQ_CONTENTS_LO(0).reg));
> 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
> 		hw_engine_mmio_read32(hwe,
>-					 RING_EXECLIST_SQ_CONTENTS(0).reg) + 4);
>+					 RING_EXECLIST_SQ_CONTENTS_HI(0).reg));
> 	drm_printf(p, "\tRING_EXECLIST_CONTROL: 0x%08x\n",
> 		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0).reg));
>
>-- 
>2.39.2
>
