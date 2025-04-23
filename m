Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C348A98D0F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 16:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DB710E039;
	Wed, 23 Apr 2025 14:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWwcsRCF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D8210E039;
 Wed, 23 Apr 2025 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745418560; x=1776954560;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9JuDQHbWe7hMnMo1HJ4NM174GINqBwRLIErHUFjXm+g=;
 b=KWwcsRCFpF7hQ/KCy1KSppPiV/+H7yW6nNJjY6UJqCqGf4T7GHMICiWY
 i/OMbmAp5Bev8SrL4aj6AaipIL019Et+6jG/86fbKBOLcuLOR03hrRzLc
 LsAOkWifrUlb/f0BXzBOd6MxchfS4mQ669V6W8vabpAIKVZ8htQBVTHHA
 4Ve8Q/mTBjlvR7TBuJe6O67UrpP0Xp8o2sgMYtUqn6LCjG6oNumV5HACq
 91PU7IMEYuxUx+o60JOAbP/UNzkCu9AgXBgFe692PIbQINGQBSCtgWz61
 j4cititlqkwEPgaODRMxNJhi/56AS3m4AU7ISaiukRIkXu3mBX3+KkBHW A==;
X-CSE-ConnectionGUID: x3W5SWt7QkuYh8mGHjUMNg==
X-CSE-MsgGUID: bAGILucxRqGHk5Od70pQow==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47113415"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47113415"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 07:29:19 -0700
X-CSE-ConnectionGUID: +5Wl/iRUTLK+ml3yzt/O2A==
X-CSE-MsgGUID: pmqM9DF+Tu+EaZrMaQpj5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132863048"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 07:29:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 07:29:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 07:29:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 07:29:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HB3mp8Sd3cr/IYe9b6jWSfCKjYW2QvOeTdr6E3XugSyeTzfeLKLh611DsGf4cYQ/H/SMY9XDP5IfkGtby2KcsZTIgnsTgMB040d9DGVVHfZ6tKUpXRhthv435xDLDLLWPD+xRhA9Y1K0201jT8jd5OSBt50b7oqUYp8q72IWmpuOweNKFeA1ilKbYM5x7j+B9jf4guzD7SlXZ1qXvsZkhS1zubZ/buNL586oGELTgvuLAl7FhMuPQ6uiJS//r3pXUpGZ4yAo22s8ZltqfpmGcRMZsotguAs5Li2ly7FyuaqNvrtnCGm7UhdKH6HqYXQM79EdGWZ6niU4xL0j0q0xYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMxoVZvTDQGKlqCk+JsAuJ7HXAbcX0rv0fLj893E4ao=;
 b=Sh5IBEKg4d4DL+V9JIWkWKKRRQdrJ3ZAtq+gIbrDskbk9sDBzfEraQUEc0MM7Egty5n9LZSt2NtFfh1KeIenr07yl5KasOGzjWNebJDYPbDIsH2aar2/sRCOMrpsJ/pd4Me1A5ixAJTFpLdIvf8VKRWO223b3PFNEIRpE6SEN5FShX7Q0Vq2/NO63QMlGv8n1y0SUY+/8Ju2FUItwCFnlfi5BrsgGYgLmErOnbtmz4617vkx5Lmvsxm/p7P401/96H16teEiyRsKZoisfaSQE4SU0hBOXYhTYdLj3FFiINLiDjRLuzHOkbFU31CdLIAtyEYVbqN1Dw2zhtZ94mKHrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5059.namprd11.prod.outlook.com (2603:10b6:303:9a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Wed, 23 Apr
 2025 14:28:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 14:28:55 +0000
Date: Wed, 23 Apr 2025 09:28:50 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Arshad Mehmood <arshad.mehmood@intel.com>, Michal Mrozek
 <michal.mrozek@intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v4 01/15] drm/i915/gt: Avoid using masked workaround for
 CCS_MODE setting
Message-ID: <laktywvpcospenpsdjh6kqxojiqfvdzolbseh74wzf4xoby5w4@ao24ro3hxt4h>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
 <20250324132952.1075209-2-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250324132952.1075209-2-andi.shyti@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0138.namprd04.prod.outlook.com
 (2603:10b6:303:84::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5059:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e746de-190a-48f8-331b-08dd82732d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ud7R1E47Z9oQktgzOjsIDZoG2Te+xqPqKx3tKN8nNOKhdlwQyJf+kc3E9QoU?=
 =?us-ascii?Q?lLLQYZgKRi4dQYkuEpRVZ+l8SN8PXdufCf1gq8J8+dZ6c7WxcwYT0qiXIBxf?=
 =?us-ascii?Q?fzhvQbFpKJb/6/fIj0kudMXRUqEpeRw+/VerJHi48hmYDDQtKfXVdyZfo6MJ?=
 =?us-ascii?Q?HIgjx/bG/FPTbfDHIcJ+TKwwaFCdXWNJEESYt6RVWB5NiDdvXCHZ1nmFhGAB?=
 =?us-ascii?Q?TQNA51pJS/GGBqkxAhtpWf50yxxm7RU62cbBR2v9eosu7TarF6aOdOE7Gvg0?=
 =?us-ascii?Q?I3PfNw3xUrrDH8JqTYXrdNN8gGSmqeNMcJjv892YwAFYCYmTPHwVpTBZjqKa?=
 =?us-ascii?Q?Nsw0/nv5gAI3DQH3bOM8CnQh6Ri/yN5ULm257uQ97LbuAe847JHx4f9f8XRM?=
 =?us-ascii?Q?qWmdCqPm8tVN68/g2YRiPcrByhUhvyIXZm/O1YOBp0Yq6fff+k6TGbwcnRtg?=
 =?us-ascii?Q?ZD6BvoPVL6RHD4VhaoIm9vd1o4lSGvO9xFvDtgT+uHahccqLWPbo1h/wUzUH?=
 =?us-ascii?Q?ttyDr3/THZhv0PPPNnW2COHCB5cbJp4eKTn1MPDB7RwYCJnab3pF0LhUBXBO?=
 =?us-ascii?Q?ENOXkzwh/T5XPxuS/80vr+y2Nj6cfFKNvxlfX9c+wI0eGUiItW4omdBImSuc?=
 =?us-ascii?Q?HmCL9ulb41i/oCzt6ceet9JfxV54Q0BgA4ULU9WMiVr8oZj+LfntdWf2wqYp?=
 =?us-ascii?Q?oRxu+ux0CX/SwZdyVZdyp0X4OhUzjtgf6DljxycN3M4IX6g964hyezsPavXS?=
 =?us-ascii?Q?rfK1Ud/a6wRtckeBktJDI1XVlmc2eWLZglTnagLvYH0LFEBghptBid2FX+FS?=
 =?us-ascii?Q?X4JDHJrJXS4FIeUXkGetH2O4QOLny1WyeAVkIEZXbe3NrWJeF4bqG//CuhmP?=
 =?us-ascii?Q?SXS+lm8tkooa7ZQBObpy1JFnRhe6ekfx/mOZQ4oqt6NIzYe7BAkd+x7hP7U1?=
 =?us-ascii?Q?kt0dFwrfRdc3dNZdKFXgFq0+hlhWpDh+HBhwzQantyBHvM4mKMmfeFoTkR8B?=
 =?us-ascii?Q?nxgPZvTl4ObTl60yoBgHw163JF3VjpPLTAOeX/PJwHl1z7IlKvXuTIwUoqVw?=
 =?us-ascii?Q?kmmbADLopwl9Jv8tqMrzd5aTIvZGMimANAYPSgDCPpAzeSr22BWvYoKTHgum?=
 =?us-ascii?Q?NrYbPAU4/QOCgNjy+3c7kZmaSj/HHk1roTx+qtlRY+rIq9jdNYkiUX7OPfka?=
 =?us-ascii?Q?tTkKXergRVq3RWvCRO/WigKqV//X2cIn2xQs+j5KNXa/Xz9lBNvSH5mR/RMj?=
 =?us-ascii?Q?XJ9RWdqwwZGoZEcU3q/CL75Z2YiUJlDfrxlEX1lGWiWNPZAQbPgBz8dc+B5u?=
 =?us-ascii?Q?JDW7ZOsbFPoGHNBo1B234q92iKh2w38Qq8W1H2zMrdvh7MasCl8pxz+Jby7Z?=
 =?us-ascii?Q?5zWO38mzNdSeOrvfr0ja6bABgfUkXMNLbb/frpvIK1OsSIogzpKqsMAWRzIU?=
 =?us-ascii?Q?fXilqBH5/O8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J8RsM661h6uBWSWW03+yg6gU417AV/K4V07uYqiZELdf+XOUjBBQuv7iIysh?=
 =?us-ascii?Q?Zok02CB+ClJFF7Ci572qCtGMPoJ/xjbHfRbWtruh+Y+0afIxw17E7t1VSqt8?=
 =?us-ascii?Q?n482+iqr5gWU6nRREiNGmq9uawFz2hXBQk8K7EI1xv38vZLQwGXafbBO1qjc?=
 =?us-ascii?Q?W/mjIpnvnR8qQWFf90ZVE/in9QVexmXJ46m8DvFzYoF445wXVKRePTfAeBsA?=
 =?us-ascii?Q?94HicejwEKiaKVoYhZtDfHROPU7lYETk5D6e2M0CfGam7S4obmZZs6TCEuVf?=
 =?us-ascii?Q?Rg4P/6P/IKJx3YjkXNrBy234ow67TAO9fJLsauJueZCGcxyqeVPvKgTs20On?=
 =?us-ascii?Q?EGLMgZ0Ezvj0pwqHRlGv71NUcOOemJ2E9dyUTrPaaXGsZF90jkiEFKmFjs3M?=
 =?us-ascii?Q?MGMATPGOj2KPIJCN8zpALUjuZYEplCqCpE/wIbVwQFSNLOuLEmz2yE68x/4H?=
 =?us-ascii?Q?MJ6Xc5eSItrlT1F0GQ0pdINtJZBKTXVx6kgQhMfeKvec3tSKOfYW7dZkxH84?=
 =?us-ascii?Q?8EcfI0WhDU08YNst2QTaJOw3+kHd8qfdStzjEjregkhrf3lr03LPY9G9MTwy?=
 =?us-ascii?Q?RmiYNECDm1GDnX6xC/XaBx+RDytw7tTVpyhyCor2AR8K51F04XiIl4+RccOF?=
 =?us-ascii?Q?Z0KiiKka9SnjNIJ7Vn936x5ZQtQ8WyQPvATuLSL+Ceq7+QUJ2RpsiSNC8zh3?=
 =?us-ascii?Q?ElP335SDC/hAQNUh2u+9rdgsQEm/oQbZMy0tuCtmrCIuGXggg4bQWKvW2BcP?=
 =?us-ascii?Q?04CqepEVgCd01YPYuorUApqjAL/jC7/ILvLOlTB/XU/qu9oEvUWRU4KPjTLm?=
 =?us-ascii?Q?3HU7CqRZYkgn0IpYjNkeTVA00SVorvZaYrBRYpGtkFrJtaQQE6AUmE/P4OxQ?=
 =?us-ascii?Q?MJaVFRs/B7Z7rWWJmoko8/wzEYnZjYNh4bwYHXed2AwSSyXiHTwBadCnkRGE?=
 =?us-ascii?Q?dncYwNX/pBZ4QGiFoTsqXUzMyxubjgWy/O5utO4HKa6pMfQDeB1wTL/kYepD?=
 =?us-ascii?Q?FrTCX2u8mcnrv/XZh/3sdmGi30AoANABFyvYQje1kRAvLmnaMcsOffDcj/ab?=
 =?us-ascii?Q?dNAERBGXT+lWHARfld6M74Z3vYKP0Wz/ID1NICjpPPLdQSQRvcbhBlDBn+43?=
 =?us-ascii?Q?I5MGiJxkOo507kLWks0bxSSiXNpYv5D/fPANcEa44W073HIZjQVJgTkSMGwN?=
 =?us-ascii?Q?yvYhGR6ptLAaJBI1t7VlQDZOz2MpY0IVPje/MS5AkSaOaseNjCEyx8KbpkxK?=
 =?us-ascii?Q?nZW7BtQSOxgnms5xXuRDzWHZSS7eyig3lHfl7pCiHAfMz1dEKI+Vpa36ZgO3?=
 =?us-ascii?Q?DljmF9Ys1xkGfSN4QoYyZjMBd3gU0iKV6ayFROyPfiH4kalr3N8ybdFJryeh?=
 =?us-ascii?Q?+Gr2FmvndVmVcR5rZN1Q5x/AkVf1qX68yum61Iwh9Aihs/rpt1T+D3QgtT93?=
 =?us-ascii?Q?baTfBijELjGaGFkzuxrUbUouz5tznxvc5jJzchaKsipR27ux+X0EqJrpyKiy?=
 =?us-ascii?Q?sMlsdrmIfh4wCriWjuMRju35WVIi6rCqktxlOnyHVbyqyaILIuB5JPkojEKS?=
 =?us-ascii?Q?O2zBkTG25MX8JaFKiMYzoLsFpyPbWYMEFM5+GX/BpqLMrP0wq+8qzcHx+jIR?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e746de-190a-48f8-331b-08dd82732d91
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 14:28:55.8660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IESnbALnEpI5/5BHR81axoVTJHR8XVcFoIjYKoFFUstL7DHPq4yp7H1esuqIaddnVZr7j1Kp8gYbzDuLfZjrM/gIr2MgI2lFNOm4pxAhTqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5059
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

On Mon, Mar 24, 2025 at 02:29:37PM +0100, Andi Shyti wrote:
>When setting the CCS mode, we mistakenly used wa_masked_en() to
>apply the workaround, which reads from the register and masks the
>existing value with the new one.

That's not what wa_masked_* does. The use of wa_masked* depends if the
register is a "masked register", which depends only on the HW IP, it's
not a sw thing.

On the xe side we tried to clarify this by making sure the
"masked" annotation is on the register definition rather than simply
using a different function that receives the same type:

drivers/gpu/drm/xe/regs/xe_gt_regs.h:#define CCS_MODE XE_REG(0x14804, XE_REG_OPTION_MASKED)

Copy and paste of the comment from drivers/gpu/drm/i915/gt/intel_workarounds.c
that explains what it actually is:

/*
  * WA operations on "masked register". A masked register has the upper 16 bits
  * documented as "masked" in b-spec. Its purpose is to allow writing to just a
  * portion of the register without a rmw: you simply write in the upper 16 bits
  * the mask of bits you are going to modify.
  *
  * The wa_masked_* family of functions already does the necessary operations to
  * calculate the mask based on the parameters passed, so user only has to
  * provide the lower 16 bits of that register.
  */

If you don't set the bit on the upper nibble, it's the same as not
writing anything, so this patch basically breaks the setting to
CCS_MODE: none of the writes will go through.


bspec 46034 shows this register as a masked register:

	Access: Masked(R/W)

and documentation for bits 31:16 shows the mask.

Lucas De Marchi
