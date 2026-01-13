Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EBBD16606
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 03:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2281210E450;
	Tue, 13 Jan 2026 02:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/s993y8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239C010E2FD;
 Tue, 13 Jan 2026 02:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768272896; x=1799808896;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y41fQAEXT4OrsPbaEldkYcQvAZ+JrTT4jGb2czmuEwY=;
 b=J/s993y8CZowpabL4nvbJLyNVKPyTm3noRMVCJq9ihwWMv+10bfDrsjr
 d8hPQ7pFc9rsNo/ACG1tCQDfczPHnquJW4xxEaNQUo9ccN+OuqrBeICl1
 g/Vdv0YmBvTWyI4RFVGm/0MhgXEhvmFlwZPyh6Tqix4scdIDNZBQombIo
 bgb1KjbCpy6nYMgA2P1UP6qg1a0pyvAcc7l4XWv6O6gFOoqa08n/3KE4m
 tXQwbiUTDEPViUDRfD4VtiGhDGAzO7n4Ck7H6pwke60SfkMpm+XNyMK4z
 IyA1co0Rpw+oVHerw4BlNoJ9J/CD2xTWVbUS5Nn34ilROl43lvtxdDwRy Q==;
X-CSE-ConnectionGUID: 23pA48QJTca27E+a4pH9hQ==
X-CSE-MsgGUID: VKBFXOXAQ26vceL8omHNVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69714718"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69714718"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:54:51 -0800
X-CSE-ConnectionGUID: qXl8BZaxTbybjcfOl7+nVA==
X-CSE-MsgGUID: mLgquTIjS8C5zTTvmh8r3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="209321583"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 18:54:52 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 18:54:50 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 18:54:50 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 18:54:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AquuMdJqEMsmTRX3PuM+GXvLZ0qHgTb8oyqen4EguEpQ0zRhtuM0KD98+9PtYHNuPtXpzGjK/qgZE/N2cJpsAdD+GfluLM4XVcaJJP6lUWl3AmHSxbGcv0It5RmCWVCK5Rq6O41GjqCq7+nLeWj8siiUUgteenPaSna6U2d/D3yc+DISvdMmRiaEyAzAMnQ3a3QRPGXiwTzo+chgB7SDMi52hvm2RtE+VrkcgOnCGMluQiQhmijE1QvwjsgfVjeKtmLcEwIHyne8uayDpB/YghtUiiqH5CkFkoe0Hp8Y5TrdxwfK4MKiLHBrdDBxFqNBoSugnTlIAhRqMAhMYUfoxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6srI69t71EAwRvM/V8CozZhqr0H5Of4sDpZ4eyzZr4Y=;
 b=PWQnQW1KEkoquMfRBrrwBxuxL0a51kwZEDLZdI859pgBmK93ST659bkxs12ZiIbCYO132xZAHpNsVU/lDQUJZSR5zMh896VYfIHDnJdu/mlaNjokPowhhczlWrly/DpD71O82dYN2MN8AJiKDeShU81TE/zOZ6J2RjM0r4QwCvbVAgCqLwghd+T4qi4YTytJO1m3zhUKKkAj9UPfjKAbrcnU/pffF/YRxh9P5FVaBfaE4+WAndQZnr+KFNO5f+ozYDb1ec5odgGIHJSgdEiW3KG4/3Xln2+r6JBl7nbisU5WdopLwKd/mEqCbJWi7l2fWuEI387Msj8Gp2aT8S0HMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL4PR11MB8800.namprd11.prod.outlook.com (2603:10b6:208:5a7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 02:54:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 13 Jan 2026
 02:54:48 +0000
Date: Mon, 12 Jan 2026 18:54:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3] drm/xe: Replace use of system_wq with
 tlb_inval->timeout_wq
Message-ID: <aWWz9pJ30Hxa0USG@lstrano-desk.jf.intel.com>
References: <20260112094406.82641-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260112094406.82641-1-marco.crivellari@suse.com>
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL4PR11MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 48fde36c-0eef-4292-eb8e-08de524f1da3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9rip63UgjFkF2z5hXhwbTHj31Lkcqf4x+TzDxkYfLBX1J4yV0N6RaDQrTeml?=
 =?us-ascii?Q?R0LbQXAry9B86H8jIk0y11abmUxknCujKT5DgMTPg3GlWQqSU6YvYCzEUge+?=
 =?us-ascii?Q?qU7tEdTgAsKJjG8Ip4YBjmGlE1zPnAGejzrx2oIGfMOO0yJVBCllcvGx1zX5?=
 =?us-ascii?Q?eGpwVH2tikb836LEYLLNddJdBYZKVNDZS54k+rhhbQ19XA/91NTHPfBSohHR?=
 =?us-ascii?Q?zSJ6XppQM6ErElztnPwfgRnGBscXHnNelWJqLBHCtf4vZzewztv3X77izSFH?=
 =?us-ascii?Q?fE73dTejjIx1Hakn5dS2j8A8FO2Hjw7Brh8gYtXNktMKTcjOqWvliILvsvRa?=
 =?us-ascii?Q?Y9ntttpKWiw7ZfeW59Nvy8KLOclxkQNLefG/Zql89W2ISUXGyV45u73H8H39?=
 =?us-ascii?Q?5m0KEDC0XAu20XaQ0axbKYSVfaM+q4wTHKRvYvUX2zUWahNimh8rMXej3pWP?=
 =?us-ascii?Q?zNc2c15iB43UlwjxuFkjxNAFG1CDNtjRuqBvQrHhcZKC3dCamjB+TYV1IUDR?=
 =?us-ascii?Q?EZLJdmlAqC/Ho7Wh8ZeXdbgw9pldL8qz8grY4FRqb2njM1oqGnNoqfz+jNva?=
 =?us-ascii?Q?IQF6/Zv+i0lOyaNmfmvRMbZWZWgidYuf4So6FGFrYMP0IkcLeQDM/Zq42RTD?=
 =?us-ascii?Q?yizOsUPT6UqiCF50uYg5NVGozwE3Dv82mRNlIrNiY3Avk5oyjFEF8lHMPoLk?=
 =?us-ascii?Q?+j9u3dZhFgD92M0zAqj3U6qJQd56arFRipZqtxA0R4aqfQpk7XcFR0r8C5yE?=
 =?us-ascii?Q?5C/MROotF9ZWqBJupJYyUI1whp9hOHKMxh1X9EkjzXYFwLA5nfUs1PUWivlQ?=
 =?us-ascii?Q?mY+yV5k/kQ4JVoczwxIUe4Oqp/3qpr8gcOhuCmIXvE5O1x+iniHJF0vHVnIo?=
 =?us-ascii?Q?VTnRX8KwpEqDD/SwmY17Gjtx2D/SphU1u0ouUl9aqAe2yRkzcOMrQNs+JqAP?=
 =?us-ascii?Q?djoHLUTh7opy3nKg25D8CDQXsWDYtIy3CEqxvokoiPcGcQ3xVfjJZbiiZo/k?=
 =?us-ascii?Q?eSRGB7a/+JpMHXxEKmLrYuU2BGZelpGF9gyjgFSXctzEFAyhcYrkAbG8lk2w?=
 =?us-ascii?Q?igXRNu6bTa/CpugnBgfPVp1qkb+G5cU5LT3R4peL68zYmnKERd05VH7Y7bdn?=
 =?us-ascii?Q?h2mOpYgBKWemx2Xw29+qmCJoR0FGNXijDBkeXvx5+p5EH5uJGc7kzgZECOto?=
 =?us-ascii?Q?z5aKc+Oj1U0+OQdDTB95OKR8z02/E58zYQOz8cXtR1DiWUmgD36QorES+H+N?=
 =?us-ascii?Q?sLdubOUhgT0ZnQ4KHh1kTQJaArFoLyCCBM9dQ5xBbZpYw5DS/AvOX0WAqDnf?=
 =?us-ascii?Q?vk3JDI/cvZOCAeoMFY6TLjGWE3iv53na+mrLtTYdiHeHVc+MV4w5u222MLOu?=
 =?us-ascii?Q?yOJn7ZNa4jrSxlzJ9CI0xkj2GguK1Efndj/woBJD4K349bR3BaDwTGW5Iq3W?=
 =?us-ascii?Q?ilNOza0VVMfSNNqoIVaSIc0WwNwUdsK1l6thOrxhKJK1qoInmwR5UQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mq/SmxaF1nEo1yKKUfXmiTI3bsUaFrtHepCarQ5HOO7Qn9kdVv+RVWUDhul9?=
 =?us-ascii?Q?U+dV2JPV+lzPEGgEzlpB0d5JpUf11J0/Kw/x8WIO0E1iaNF9aRTO48tEO7Of?=
 =?us-ascii?Q?vrlDxssEOkFTsaJEhjBjrznmZe7v8etdRhgWxkyJ64xnBqpx6N67+RltG9gK?=
 =?us-ascii?Q?o+RiD5gwpN6+X+JJ2i32M/G1wzZmvkLagWSo+B9Mi3NNZ8Jhkk/JH59vfWJ1?=
 =?us-ascii?Q?Jx/6kxxllw9bPdh26ttRHAEOA9rEuLNJjLY7WDsLJVlAdJhlcdnpTdankvQZ?=
 =?us-ascii?Q?c8RQZmE95ZigiBh7Vqh4R7FtNCM9S2xqXT+YufF3ba0YfvAQqsM/wsJsrZL+?=
 =?us-ascii?Q?kh/BXJqWY72DpgQKDfQsxvAoU6BK5wfm9j7rZtLoM1AtCgRI7n6GyZpyWZVG?=
 =?us-ascii?Q?l0Od2EfimdgNzAC2g8/X4nuYgLfM0jqHO8vHAhbTYmV3gzrML7Lj0yJOsgjt?=
 =?us-ascii?Q?YzdJGR00n1t3LOoJqvg/+orYnay9G5qiRjhj67bG/Jus7qKHOhMZQRAYcohR?=
 =?us-ascii?Q?2bW1R9iSMCvT/9RxTsNoM2oQ+OiM6trmPHBOxa0F2ac81TeNZ333lzUH3opR?=
 =?us-ascii?Q?lB20vFAAFZB6p46XoXwamgcRkekWC4eFL+haaETUf5HvVSpjm16T/3IIyq6v?=
 =?us-ascii?Q?8QFOqjkQ3IljyA7aMIwZrODoWXag3FGe3whS0EY3szO7kc5B/qqjdB2N7UG3?=
 =?us-ascii?Q?pMIyXPi6HfJEc1WaRg3UhOsljUJF573Vf+wZBjduc5HsksMrnuqCNQ6wuBNs?=
 =?us-ascii?Q?0sfxMz1JF3ER8/JCzv2i8G9WBdauecsDO9mA18hAj1eGjAVVZLMeN5kNRXRW?=
 =?us-ascii?Q?i5K3bbe21zz/qxQ7iqVGjTbmiDsvHbQd6O3spGO9yBdI3ISvYmTTaXlvxR2a?=
 =?us-ascii?Q?xzyFlQ4v7oUWAaztrmfN/QLNtMYYpvB7HZRKndWh2yhhrHRwlkrhs2VQcOTK?=
 =?us-ascii?Q?1bHz1AupmtUhGycJ3KV4KPuT4UdYJyo8CidVuZrFXEn0Ds7twn8lqb5ZPZnU?=
 =?us-ascii?Q?XjR7wJwZ+CC8G/ffyBA/TjO+d5KgL9b1nawCPJc2v/CQh9bSU5Zj3pVaWnKU?=
 =?us-ascii?Q?FnOA57ndAEdA8zIfaAGZDKHspvxP47wg04juREfZEadsOS5JjczaU9HwTZlT?=
 =?us-ascii?Q?cGYFJqB3AOWplhxmlLk+lYhGeR1UZG5YzOlwFcGLHBwixO1qBklziX6D01l2?=
 =?us-ascii?Q?nhmmGfXLVhz9fd8Hrw2OY1KBIiv3hE2ExnmhsexmHjhIk/ygsvelJeh+1pOu?=
 =?us-ascii?Q?KUO9Urm17+/9m0rtrEMgiQ3ec+VP8IoXo9F59AFd9Pvb45EBaQeSC9E1j27m?=
 =?us-ascii?Q?AKgI3YYNMlt8DXaTsZf7qO5GIfhdmlmpgQOd3i1PWufvbIHIP00yBgFukzMp?=
 =?us-ascii?Q?y1k7TBE+RHK9U2RwWjGraSrZk931xLWEyJ8tzRnUxKemHvF/Iio1XMmlVm0I?=
 =?us-ascii?Q?R01dFapbM6Khmlum9f0RFUdjJkRT5ZRFEcr6058ZrLnBOvc3dV0PT/8eDlZq?=
 =?us-ascii?Q?D5G8I5mf5KSEuFAZvz66XuWfSYEahJnwRCwxub6Ri3APR46HtHaLPNkc1Vit?=
 =?us-ascii?Q?B00A0YTaFTwcNVwtfl4UIOJkF/y+hIXD/3EZQ3+Dj2nm2G6IxfbFJZaP5AtH?=
 =?us-ascii?Q?bPv97h9Wa7J9V9Ho8oSGZCX+GSxP3PwY6OiPcbl8W1zFJU5K5dcAvZaeRhUM?=
 =?us-ascii?Q?szrUF8WglshQhIj3z+6T1uOKfdXKRcK45q5QiitKC6DBOlJW3pH4VeEl2Kb6?=
 =?us-ascii?Q?su8RLAYeA8hMCr3r8MSdoFjTef8vivQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48fde36c-0eef-4292-eb8e-08de524f1da3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 02:54:48.8092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHVmqrBtW/Q3ztH2VO6quLLn7M42AzuuIhdj5rWoiwINC0DvIYuKCPEUEbFJj5jBqbdlT5vSjZs33xcMhgmybg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8800
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

On Mon, Jan 12, 2026 at 10:44:06AM +0100, Marco Crivellari wrote:
> This patch continues the effort to refactor workqueue APIs, which has begun
> with the changes introducing new workqueues and a new alloc_workqueue flag:
> 
>    commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
>    commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> The point of the refactoring is to eventually alter the default behavior of
> workqueues to become unbound by default so that their workload placement is
> optimized by the scheduler.
> 
> Before that to happen, workqueue users must be converted to the better named
> new workqueues with no intended behaviour changes:
> 
>    system_wq -> system_percpu_wq
>    system_unbound_wq -> system_dfl_wq
> 
> This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
> removed in the future.
> 
> After a carefully evaluation, because this is the fence signaling path, we
> changed the code in order to use one of the Xe's workqueue.
> 
> So, a new workqueue named 'timeout_wq' has been added to
> 'struct xe_tlb_inval' and has been initialized with 'gt->ordered_wq'
> changing the system_wq uses with tlb_inval->timeout_wq.
> 
> Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> Changes in v3:
> - refactoring workqueue name from fence_signal_wq to timeout_wq.
> 
> - rebased on v6.19-rc5.
> 
> Changes in v2:
> - added 'fence_signal_wq', initialized with 'gt->ordered_wq' in order to use
>   it in the fence signaling path, instead of system_wq.
> 
> - rebased on v6.19-rc4.
> 
> 
>  drivers/gpu/drm/xe/xe_tlb_inval.c       | 10 +++++++---
>  drivers/gpu/drm/xe/xe_tlb_inval_types.h |  2 ++
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
> index 918a59e686ea..084d996b818d 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> @@ -94,7 +94,7 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
>  		xe_tlb_inval_fence_signal(fence);
>  	}
>  	if (!list_empty(&tlb_inval->pending_fences))
> -		queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
> +		queue_delayed_work(tlb_inval->timeout_wq, &tlb_inval->fence_tdr,
>  				   timeout_delay);
>  	spin_unlock_irq(&tlb_inval->pending_lock);
>  }
> @@ -146,6 +146,10 @@ int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
>  	if (IS_ERR(tlb_inval->job_wq))
>  		return PTR_ERR(tlb_inval->job_wq);
>  
> +	tlb_inval->timeout_wq = gt->ordered_wq;
> +	if (IS_ERR(tlb_inval->timeout_wq))
> +		return PTR_ERR(tlb_inval->timeout_wq);
> +
>  	/* XXX: Blindly setting up backend to GuC */
>  	xe_guc_tlb_inval_init_early(&gt->uc.guc, tlb_inval);
>  
> @@ -226,7 +230,7 @@ static void xe_tlb_inval_fence_prep(struct xe_tlb_inval_fence *fence)
>  	list_add_tail(&fence->link, &tlb_inval->pending_fences);
>  
>  	if (list_is_singular(&tlb_inval->pending_fences))
> -		queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
> +		queue_delayed_work(tlb_inval->timeout_wq, &tlb_inval->fence_tdr,
>  				   tlb_inval->ops->timeout_delay(tlb_inval));
>  	spin_unlock_irq(&tlb_inval->pending_lock);
>  
> @@ -378,7 +382,7 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno)
>  	}
>  
>  	if (!list_empty(&tlb_inval->pending_fences))
> -		mod_delayed_work(system_wq,
> +		mod_delayed_work(tlb_inval->timeout_wq,
>  				 &tlb_inval->fence_tdr,
>  				 tlb_inval->ops->timeout_delay(tlb_inval));
>  	else
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> index 8f8b060e9005..e5ff35226826 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> @@ -106,6 +106,8 @@ struct xe_tlb_inval {
>  	struct workqueue_struct *job_wq;
>  	/** @tlb_inval.lock: protects TLB invalidation fences */
>  	spinlock_t lock;
> +	/** @timeout_wq: schedules TLB invalidation fence timeouts */
> +	struct workqueue_struct *timeout_wq;
>  };
>  
>  /**
> -- 
> 2.52.0
> 
