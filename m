Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298A5C9D1CC
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 22:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6968F10E69D;
	Tue,  2 Dec 2025 21:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2BMvUa5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040DC10E69D;
 Tue,  2 Dec 2025 21:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764711917; x=1796247917;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xriDvBuz1ehLt4WAKdefAdeN/MMZP3zucmHU+YJUFRk=;
 b=L2BMvUa5jwwYOR+tnrPsk5Vgy+RoK9yWrkhrkYT/OvN+dOFHNaieNBNo
 Re7+KxgY2GP9kVk/h8jBQCLcp9SnR9T9QwDn/BoI3/+NJ8Y0l0LAXP7tj
 iH44YCg42SW6vthrGgtkyH3A3wTZmQhk51pYfi5OdiCTnDpLgnEo2IOey
 NlAbhBzDQsK08L64Cd2pE1CMGtnogb+O4Ygw+MYinuwRNSNRGuQF0KYaB
 occj/DSy8QRTWnJ+Oe+FbQ4S8M+cXy7AiLjUrQ2szN+E7uJ48Ivpe36Qu
 Yo1+nvEuKz8gBYe0sRCTHxkFaDVcLAukQ04AYiA7Dz2LymQ6B3FKxI/EN g==;
X-CSE-ConnectionGUID: VfqzCMIHSGSTrePlKJFf7g==
X-CSE-MsgGUID: HHil3W9sRxq39fOohdP+tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70548571"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="70548571"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:45:17 -0800
X-CSE-ConnectionGUID: 88CagWq0RsaXTXPIn67rfA==
X-CSE-MsgGUID: H25lYK3AS0GSUpwNGDmTGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="198966897"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 13:45:17 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:45:15 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 13:45:15 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 13:45:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3hN0WCt/uBmyOfKP6D9ucwWeGqKyAC4segYuUnNlwCoQrPljjZDDRfYubaZ+bOa5SfFiGJ6+nYf8QTbsmQUBhglSVaY3MdKNeZByqCgObXCbyyHE2RITuqfvHhQgAnwJMHz3nFmCiYpJbd/n8kZTeBktLdPv9KxnFYlV0g5O6aIsEs8oYDsAJ2OGl9UZ1mX7DPYa8Rt7ZHiL9RZb779h3FZ/oAmDrDZgdpE94c30l3pmUqw1jPoxzEIBHWLoXBQGcNa/XiNerOrYy/Cg8q5I2/7fX8dWn9jPYr96QeiUeJQw6z/UNYitc0VUvav7Ev6cZ32rcOwZlb8VRtqr324Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbDZ9rS+POXAFIjsZBFWEWcKahIQTKN3qTb6lyyhSNU=;
 b=BOCSASO+dxbZtnwd3ZRD2Dvgh/K4xRjfDJY405A7+Zfy1+Yb37Xhd41mA4iBWaHbvzNGhhl/Jaoo7v+BTpzpsodpt+gCURVliFgjfRM7i+oHHC02Ft2bLQmy9JZC7Sn3E4H2P3nIXdOAqDTkhcCGYqkfy80aTp6HRNMcPKoiaYognievFQMSQkDi4AqVc6mwhTAAL0YkK+hW41LZT1TdqvY+ttRLA2ZufBtKCF7GTiR88B8Z7w+39RXHB2eJQVFwkmDtG7SXHaK4StXWqEvabIabHItbGAmWxBlWSRfcXUfxnOIbl0U0gnQnjIdVOJvvQI1WVIhzr2jW7eyNfKhLTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4953.namprd11.prod.outlook.com (2603:10b6:806:117::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 21:45:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 21:45:14 +0000
Date: Tue, 2 Dec 2025 13:45:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>, <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v29 2/5] drm/xe/xe_pagefault: Track address precision per
 pagefault
Message-ID: <aS9d5mOtJCEOC/SU@lstrano-desk.jf.intel.com>
References: <20251202184636.96142-7-jonathan.cavitt@intel.com>
 <20251202184636.96142-9-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251202184636.96142-9-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR04CA0177.namprd04.prod.outlook.com
 (2603:10b6:303:85::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4953:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8e6930-6341-44a9-b851-08de31ec1343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uGHmplmAHJXX3DgtgDP3lkqtxaa0dxSte5i84sVJjad2443g4Ke5uwlYMd5e?=
 =?us-ascii?Q?/BgNGt27qyEJsSQBWuB0j/0kAwNOsm/4TsvBordResLQU6b0/0dThX/6/1S/?=
 =?us-ascii?Q?4GM+j2zwnD7kiyxz875B7eDy6xn3mX0+CpxeRtsULTz5u5ezHsDCfxXrtWko?=
 =?us-ascii?Q?53HZ7adzXHKr90cmbf3i3fb/KHKfnPOXaYgf66j4D9QNPm3leNlhFE/81/60?=
 =?us-ascii?Q?Wtlc6tgPNhdf9ilJ/RDnK8zVWRRe67zSUO2ulE5ZFa109MIAqIhrRcSWYy+F?=
 =?us-ascii?Q?LM8EmiyKy9wW4PbuYWnR2ABDaxwYcgvU1LenaCW+SEyoKiE1vE+bSQQyQiEU?=
 =?us-ascii?Q?4z3Tu3vUFBq2/M8ezcLeTUiVEe9QtIQHv+LwtdcDL7nDjh8QNXpS4ZCafKAZ?=
 =?us-ascii?Q?k9pzj43GY6GA55I0lk4FI4REvJsRzqLlOdt9WA/jKtwEsAGE9GveDwhWdMZq?=
 =?us-ascii?Q?aP5RoWYpsLs4DMk4cngY9EFOHnkQCy3KlCZG5OMK9/2+05OvV/MW7QZg2cHA?=
 =?us-ascii?Q?pqnmCRqJ3Q058wjgnpDRpz62T7Kx6PTqpAwnlSNQT6rOWe4wwmw3SUv8DVRn?=
 =?us-ascii?Q?g1M8KnAUdYYQ5Ts4hVN490gbOEXgZfLhZSt4xVrvV4HfYOT+klcSp7oJJ3Rb?=
 =?us-ascii?Q?tNidSqr+iNwkkmH8Ny62hbLbYN8KJ2tQGJUmN+yMl/BU24oLSJxamJj+rD2n?=
 =?us-ascii?Q?LN9pH9eWXzQhQScgr/zcQr4yn+x1VOToZKoj+VJsEUqdb7S7qwQg+KYFJk6a?=
 =?us-ascii?Q?q/GFYKLU6xbZdT/Mgt8JMMuB5w6mbf1Qbz5UFPTmqBdKsGbUuU6UIbl347wd?=
 =?us-ascii?Q?jNBV31z5nH47vYqijFcwKGi85XiCnSFQPwlwJ5HMIYoXboaLluiY7lDU0ziS?=
 =?us-ascii?Q?PoSiESWHW4d3F14b5X0/BIDS+mt1k2v8CL/YeOfM3GX3wkRrMOSi+P+I2Xa8?=
 =?us-ascii?Q?hkiVpRz/dRPyT9Nfqz9cw/xJXzucQSMvJruRlMgIAAGktD9byeghXXBbUi69?=
 =?us-ascii?Q?/IPl5L/7sqfI/TYw51ubOJrRuOK8CaCXKyTdyM8SeszPL8Nm4a+SH9lvdRqf?=
 =?us-ascii?Q?XyTnebcghEx6btu3xDJGWv2+n4JYC5iXboqo/B2tLmE2yDbWn8xFe2UEOWMp?=
 =?us-ascii?Q?Bt18v/9pZgn5Zw8rYahGCBvulpuHjWSzonLXqCpDjD/39CdhzhjCk3HH5krk?=
 =?us-ascii?Q?m9udPNOGA3PP2iLUbXAhZ64+sJrKqvFUxil3e9gaRRah4/PIHt7BKcxUoEN7?=
 =?us-ascii?Q?QP+s4agY8GVjkkNxnPloS8FyStm8OKX87aqeRbVz37KXyUMbC+Z6cSn5UmNt?=
 =?us-ascii?Q?29dFCWOOx9qZr3A4MdOb6QflM93xsJ14WP0DUn/WACGEIVbKuhVnxMg4oxxe?=
 =?us-ascii?Q?ROvhjgLNq6jFSWHK+o5zmal2feUXMhBDzVFfBDXatt6tqEU3Es41vdq5f8Wa?=
 =?us-ascii?Q?/aD4w0hVmK9cueiEjLR8FXd55MuaAjjK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VYD8qQQCxNKCEXzzI+Xwy+pN2sxGn/IgM3Arvkj+dOgaPx6Jvpa/ExlICVgL?=
 =?us-ascii?Q?EBn9/9688P5zz3CRZ533o5z81x1TFvFnvw/KQgbBUQkASbqRFgEHhXflush3?=
 =?us-ascii?Q?eplvSpmWKNrxjiF7gHsviADFxJwafcoMd/H2M52saNS1VisiB1IupDJzre5v?=
 =?us-ascii?Q?fE0FFFOk648B3YsLSeZt35ks5kR19TKLs3F7OOppIJTqDDHfQfm8kSLXdBOo?=
 =?us-ascii?Q?WXh7I60IY3KBTkLuwbvWJu6Befht0wehWJQFYCmV7J8DBc5jKrNiU58YMJX6?=
 =?us-ascii?Q?8X9HJfYTfTrZDM3F3l1lQC+4p/mowOfmMp+e8s3COS6O94Z7AH7TR9CtE518?=
 =?us-ascii?Q?/C/2A/Cp/RJowxfECWOngM/9VBCgi84o80bwsroR7p+3S8ydV60QeY9eKNrF?=
 =?us-ascii?Q?N2pIYnY9rX/e3KsOHGWVoxtvT0KP0dXP6Eple/qlFpa/fTwB/rxjdtgPYx7n?=
 =?us-ascii?Q?loMbQjZWM7HaAOhnE8/H+oeP4boi/IKl6LiEO/rnruyvv0faxyjhQjXvuEmU?=
 =?us-ascii?Q?JU/0ugvuioJIcblvv5DKrh9MlmNhomgPtj+P5VbBtZWsulwqFN11aBZ/moK+?=
 =?us-ascii?Q?Kc1EOu0ZpEkt6qbTSD5P//fe9tXZErPECoB+LGdE2QfzkfzTHIYQ6IpXOSoI?=
 =?us-ascii?Q?2aZdlFB0DrzgEn7xfr826Zmy60RLkQkt9hzthiqFy1Eo/K92ezIfYXFq4uuY?=
 =?us-ascii?Q?PxQlNGeXqfuJcxscieyBKfzEMUzuN0LBmY0G3vTc5WyRCc8zeqT18w3rbyfd?=
 =?us-ascii?Q?oDmpwkfdC+wedeOFd32NRbCAMspA46lwJbrrouWZTOdP2aAuyrkKh3Lckf5w?=
 =?us-ascii?Q?mnrOEiv5mH2C90vLFZ5jzMzvSGILx4hSD1cAEoKAwoka3usA6O+xgQbJJiFg?=
 =?us-ascii?Q?TwGSjIdZX2tb+p2Onls4UGcQVnK+xkV1tHZ9EjKbjIJFgQxSkKtaWOP8w7cZ?=
 =?us-ascii?Q?SwEcLCXDuSiauPvkA3uTE7CgS7GbZZwgVBBfc8bnDVo8csfTkad7VOilkZj4?=
 =?us-ascii?Q?r5rKrnhQubcym0dV5DevI5z7yaQ5BYgw1GON5/7VzAOtbPpqZCLvva+pS3c2?=
 =?us-ascii?Q?aJm1FIN2RqteZGV0JJShirQvQby/wADv50XlJ6WeYX4vv3OwV2QrbE33AB6a?=
 =?us-ascii?Q?DJiUmoOkbkgt7V3oRu0xR85vv0foRCsurLM6RNmWda0H3nawlz1rLvCNaqn0?=
 =?us-ascii?Q?VANL5o9pW9PSu7XGY/yhdjbTiVR1dO7h7T/xvaWqwXmxp6SVZiqs24CaKyc0?=
 =?us-ascii?Q?9YRPIl/OBdtRAd0Zlpq4DLZjFq1KaWG6Za4c99+d8EZFJH+iBxCRaXfLisLh?=
 =?us-ascii?Q?44qFaxCjq/eGz4P0fOYCaKNtLpnbmvJKdGt9I9+oanHMBcrDfi1+dmUmRk39?=
 =?us-ascii?Q?MqvOsESJoMJ9YRxseLkAOayqIuqkLMcQA8v6FPt8NgUTgLlwagoavoCxV8wj?=
 =?us-ascii?Q?whlrK47EFfSp970ntGmxOOZOiwO1W+hpfNLXBiLMYQGJWwazRju6QGs/3m3J?=
 =?us-ascii?Q?FLqxcg58Bj40RtUKYz1oJcZf/c62r6lNJhL3T0K1x1wErnkNBBFmmr/LnUoQ?=
 =?us-ascii?Q?XfCEKiqzMmuc02yXnm1KtgbHYhlMpeKEuS7UutkxvnSHTIRZ2eqKoyGAkOKQ?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8e6930-6341-44a9-b851-08de31ec1343
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:45:14.0081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/kIQBoUek4wxWfeZdi6uTyiTFM1aq28IpgS/8mtxtNmxawE/7MjKcdflx2F6u4w2N97tRIXoyrN11ct7KJ8tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4953
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

On Tue, Dec 02, 2025 at 06:46:39PM +0000, Jonathan Cavitt wrote:
> Add an address precision field to the pagefault consumer.  This captures
> the fact that pagefaults are reported on a SZ_4K granularity by GuC,
> meaning the reported pagefault address is only the address of the page
> where the faulting access occurred rather than the exact address of the
> fault.  This field is necessary in case more reporters are added where
> the granularity can be different.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   | 1 +
>  drivers/gpu/drm/xe/xe_pagefault.c       | 2 ++
>  drivers/gpu/drm/xe/xe_pagefault_types.h | 8 +++++++-
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index 719a18187a31..79b790fedda8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -74,6 +74,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  				      << PFD_VIRTUAL_ADDR_HI_SHIFT) |
>  		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
>  		 PFD_VIRTUAL_ADDR_LO_SHIFT);
> +	pf.consumer.addr_precision = 12;
>  	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
>  	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
>  	pf.consumer.fault_type = FIELD_GET(PFD_FAULT_TYPE, msg[2]);
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 0b625a52a598..47dec46515b5 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -231,6 +231,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>  {
>  	xe_gt_dbg(pf->gt, "\n\tASID: %d\n"
>  		  "\tFaulted Address: 0x%08x%08x\n"
> +		  "\tAddress Precision: %lu\n"
>  		  "\tFaultType: %d\n"
>  		  "\tAccessType: %d\n"
>  		  "\tFaultLevel: %d\n"
> @@ -239,6 +240,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>  		  pf->consumer.asid,
>  		  upper_32_bits(pf->consumer.page_addr),
>  		  lower_32_bits(pf->consumer.page_addr),
> +		  BIT(pf->consumer.addr_precision),
>  		  pf->consumer.fault_type,
>  		  pf->consumer.access_type,
>  		  pf->consumer.fault_level,
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index d3b516407d60..2cf439658466 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -65,6 +65,12 @@ struct xe_pagefault {
>  	struct {
>  		/** @consumer.page_addr: address of page fault */
>  		u64 page_addr;
> +		/**
> +		 * @consumer.addr_precision: precision of the page fault address.
> +		 * u8 rather than u32 to keep compact - actual precision is
> +		 * BIT(consumer.addr_precision).  Currently only 12
> +		 */
> +		u8 addr_precision;

This is going to make this structure bigger, notice this carefully
packed to to be 64 bytes. I believe the structure will be larger than
that after this change cause the PF queue to view this as 128 bytes (it
aligns size to a pow2). This should be placed by the other u8 in this
structure.

Matt

>  		/** @consumer.asid: address space ID */
>  		u32 asid;
>  		/**
> @@ -85,7 +91,7 @@ struct xe_pagefault {
>  		/** @consumer.engine_instance: engine instance */
>  		u8 engine_instance;
>  		/** consumer.reserved: reserved bits for future expansion */
> -		u8 reserved[7];
> +		u8 reserved[6];
>  	} consumer;
>  	/**
>  	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> -- 
> 2.43.0
> 
