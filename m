Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB3F405FA9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 00:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708636E941;
	Thu,  9 Sep 2021 22:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F72C6E93F;
 Thu,  9 Sep 2021 22:37:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="201126225"
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="201126225"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 15:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="504670861"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 09 Sep 2021 15:36:51 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 15:36:50 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 15:36:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 15:36:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 15:36:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBoOFcD9Am0OwoqA1O26JbzYDJ/gI75KgoVbhiLURAOVYo0ZFMDS5z8bK70dshht1Ob9asNIpRq/IpZoru+AtPOx3hmWUKExNGnGbdGMmrB96hfNMSr7WFSW+AvBObTypAmjaGVzqECWaLaj5Bvc3fbd7snaLADz/mLXR/YgAPfKO5mZdBrWXWgEhJQG6EEaTW2eXTOFAGXivSVXHP5DHnh9To0kbBhNvoSud/wl+9hROK7e56i/sWmQwRKpeZVIQ8mbaBQheyPX47sDO6E0XmN/KfLOnwkpvDoKRmzvdc+GHgeWD/06pF/ZWvrw2a/aNyZSdc4pwzvrdFlGa+CleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=d58Q/gjwURP81t800j9Otyfr7NOZa9W/IK668XjPyl4=;
 b=VKqpjb01lOGzegU/EQqMwfsfYRdFwGlchAaxCFXoX53T9UKCvnGqyIprR7T7x+dRlcYr8mTYLn1rgmlyag7D3nK3Smli0z7P1zjmrFvoM8jv4wcXCCajIcoKecqLwOdq5gnL8D+itYJvPolqXJE+OZY0bnVYds0md8eeUxLROQ8j4zATwfhQt1YLgGEvsRimo651FWRSXdRQ1IrhuduON/var9cGhpDwr77DVyPWi03pxxFstHVOrEtNjYHarDLw7ZoGUaGP1wEjIhApzIPEjViOGWTilGowjM5JKWrmK4ObBsmklU4euloxYRaoTEjAriALtaYNM3RjSdb/GNtGoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d58Q/gjwURP81t800j9Otyfr7NOZa9W/IK668XjPyl4=;
 b=skVKTn0ZRgPFtoe/UoAwsCe5QYK9UJmD/yDw6ynXVECNZG1kzKQLV0a3vcAWT8llWp1aESEdKy0wy73P1VuRXhlnKx7WJuxmttKodo9Tjp/j7DGLGoHIOJ/Mi6EbIJqWEZa53Q54BctdYiXJTiB0ejyIjZ2E5F4NP+p5l0t92Vs=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 22:36:47 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4478.027; Thu, 9 Sep 2021
 22:36:47 +0000
Subject: Re: [Intel-gfx] [PATCH 05/27] drm/i915: Add GT PM unpark worker
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-6-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <3d07a1aa-811b-2862-40e7-3556ce8588b6@intel.com>
Date: Thu, 9 Sep 2021 15:36:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210820224446.30620-6-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: CO2PR06CA0053.namprd06.prod.outlook.com
 (2603:10b6:104:3::11) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 CO2PR06CA0053.namprd06.prod.outlook.com (2603:10b6:104:3::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 22:36:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df7bf23d-78ef-40b7-1af6-08d973e24ece
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5658E04CD772A3F04F1FC5A6BDD59@PH0PR11MB5658.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dUAhwilMdW93JgTb0P7Ow6CUZTls4bs6bSlOENInJ/6KZM7+c3GNxRw0bhKUpWyvw4CmGyCh4rCAF+CF+PSUjyagRzCnBr3jCUPaTbkLl45gBTHU0KCY6wzmNRqI92S2fYwkDX0awEbk0ZryW3f8aJ1jtvaLw8mVV+VNmicyYxosUtfNMdcewiltENOl0+LZKR6E53FdL42aEA5keg009HVeB14OeEbT8Omno6S1Mti3H+rz9x9u6gASzjOw29WldTNDL+kLKyIigjV1tdHtC1BpcEU1bdkIHxcpjOFG9L+jiTPXqeIESX1VGerbeEjv7hiJq1M2Gwjj94uDzuuI1hibT1UhhhixQaxJQHe8Ea3Hb9N73XMFt8978erzWg1VwIQTJ8mU6q50UVinJ/GYdDSCOyMTL83D9S/AI149YgfMkZ1I+x3OeyYpyVb3nBxv/Mnul2gMzVDIcJLN4DXNf4OPnHwtULMV3L95WCS16Epx8GtTSKmzk8y5Fvy0ea5GoTbh3F1Sjak3JofHhbaxToWwOAA9HttzkstRB6RA16yvgCqd/nttO05RKNZ/mXslQDG2n0J2Oz9425U3/L17/BlpFOwdmn4nja1+3uAWsFxSEzLG3C+LcqSo5S3HyFDUXcLCsmRjXzQBWL3++eiA+suBBz8Wn4FvC+d/SU/5xr3nAVcNUqPLZK1KJDP5rcAsnscPoLmkF+oaTiwjRpZw6Sz01mIsfKBwNpgutqIXD7LFLsHY8KqWUtxIF/wUilWp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(38100700002)(31686004)(2616005)(8936002)(4326008)(186003)(107886003)(956004)(2906002)(66476007)(5660300002)(66946007)(66556008)(86362001)(36756003)(8676002)(83380400001)(6486002)(30864003)(26005)(53546011)(16576012)(316002)(478600001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk1uRWJIc1BmaXZncmxQYk1kdzIxNGZ4anU1c1pnbGlGN0hMTWFIWEVoMS9h?=
 =?utf-8?B?UHpMZ1RLaCtreWZlcFNtZnRRRnVwdzlsUm53c0ZrRDczU2xSRmtuayszWWlO?=
 =?utf-8?B?NmJ1YnhIWUlHamhjWlliSm4rTS8va0JURG1UdDI2NUtvaFVxNDJKQzNpc2VL?=
 =?utf-8?B?S295dkNxSkpYb0g2c21jVDRCUXVZcUxFMXVMa1U4T2h5Mms3VmRhYXM1Y1Rw?=
 =?utf-8?B?TnZxNXk5clpDampubmQyRmZRcWIrTjRwV204Ym9wTG5QeFdsMGpxLyt5eWts?=
 =?utf-8?B?Wktyekpvb0g4YnFXSGsxcUJKWkxoNXUwWWNBeTF6OWtuZTNMY1NIZDd0dkpj?=
 =?utf-8?B?U0JFRmpyTng2b1UwUjJ1eFRJZnJ3b1NaVC84cERmdTNwL0NFMDNKUzBRR3o3?=
 =?utf-8?B?UFh0NGJJU0swN1VTNFZKNG9JQ2E5Uy9rZVR4LzMvQlJNSDJNZ1pvckkzWWM2?=
 =?utf-8?B?ajBDR3YycExzZEhYYU1YdG1Gc3lLQk1rbmFnaGR3eWNscEVMTDRoK0gvWTNo?=
 =?utf-8?B?Rk1YQlVmZ0ttSFhOOWZzMGs4MjlZcW93TUFzUTExcndmS1lhNDhLWUdQYWxo?=
 =?utf-8?B?NzBDUEVEMDdURDNjM0hVemVyUlZIUm9RSjNlR0t1eGMvOFh4R3NzbEwzNldY?=
 =?utf-8?B?OCs3S2hBSmV3OU5yU0hKakd3YktIL2toNy9xeVdYZFd6WFBwQ2I3bGZtMzJ1?=
 =?utf-8?B?dkxHcWdOekJyQllobnAvbDBxQ3lpWC9tY1dudUx1dWsrMWJuOHJJeEN5cHI2?=
 =?utf-8?B?Ni9jQlJaTWtqc0pUZndxeUI4V1NLVmJEc1VGOUZTbHBoSmhrTEdpZUR1MCtV?=
 =?utf-8?B?ZmpwbnAza3pJclRQM2JvdmpobWxDUzJuY1ZaNFBka1ViaGV4TDk5UDV4aVJP?=
 =?utf-8?B?WXg0a3g2dTRYd0JqRi9ZdWd4NXYrSmVzdVhzMzBUYVptZXJPQnFFQWhGWDlu?=
 =?utf-8?B?TmUwSVk0NVUrSDNIc09NVUh0ZTBDVk1sWWxIUkdIc2tYM3gwWmVBUTRLK1ox?=
 =?utf-8?B?RDZmL2M2Qyt3RFRpTnEwNG4rOXNOeEcyMGtqdVVzbjR5Zk9vRVZXdzlIbHA4?=
 =?utf-8?B?ODdtcGFpbVRtZjF5Y3ZjTkZ1VU9COERwcG1PRzAwYVdGZjlFQ1NtaFFjc0l1?=
 =?utf-8?B?Yk9NSEwvalMzMWJ1V3h5VSsrQUhHMmt6TlV0ZXNjNDlvTGpYb01EY2l6c1pI?=
 =?utf-8?B?b1k1Ukl6ZXpqQ3FaY1dpOFNzd3pPT0pvbVZyaFllRHMwMWczRVpSOVN1YTgw?=
 =?utf-8?B?MDVXaG53SWZHOXVEQS8zb0w2K0lqQWFteU9oYkdLV0tYU3dCS0cwMWZ4a29s?=
 =?utf-8?B?WTdNa2lyVTlHMngvTnBVZFdSWUFpUndmdzVuWHY4S0twRm5KK0RxS3NkWVZT?=
 =?utf-8?B?eUxrNWpWRC9yeEMyUFg1Z2MydWhoTHVjWm1wVzZKdnVkREorL0dDczVsL1VH?=
 =?utf-8?B?NmJ2dXRHZ0hrMk5wemFOUkdqZ3E4OXBIQlFDZi9YYm5hRlNMQkY4Mjg4WXV0?=
 =?utf-8?B?b1BvZVRnQnl0Y0RhRlE5RzhQcitoMTNaVFVEZkI3eUl0cHhWRGxHK0FuYjM4?=
 =?utf-8?B?TjBVQnZOVGxYdGVJQkdVQ0diV3k3bm4rK2NocDlzYTZSOXF2LzRLVW13V0Fv?=
 =?utf-8?B?OExldU9TbVREZG5tdnBVQlg0eGNhaEJtYW94NnVBMG9PNURld3ozWkt0RFZY?=
 =?utf-8?B?a3FoRWl6Mkx6dGsxOWJxTjZBK0I5QnppSVhGQ1Azci96MlVVNWZRTTZGWWQ3?=
 =?utf-8?Q?2k2wqn9ZMioqWWxC+GOO92JQ/KnS0c5AhZb+9VN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df7bf23d-78ef-40b7-1af6-08d973e24ece
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 22:36:47.4456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8knk39O3oXfnSk8IB5P/BM9CXIDmNSAonTPIHHZHHzWqyikfohwjxbME8zw1HskAVye/PO3UQZdTxuy2hjS/LsUiiREA6n2ggQj10Ln3uE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5658
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

On 8/20/2021 15:44, Matthew Brost wrote:
> Sometimes it is desirable to queue work up for later if the GT PM isn't
> held and run that work on next GT PM unpark.
What is the reason for doing this? Why is it important? Why not just 
take the GT PM at the time the work is requested?

>
> Implemented with a list in the GT of all pending work, workqueues in
> the list, a callback to add a workqueue to the list, and finally a
> wakeref post_get callback that iterates / drains the list + queues the
> workqueues.
>
> First user of this is deregistration of GuC contexts.
This statement should be in the first paragraph but needs to be more 
detailed - why is it necessary to add all this extra complexity rather 
than just taking the GT PM?


>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |  1 +
>   drivers/gpu/drm/i915/gt/intel_gt.c            |  3 ++
>   drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  8 ++++
>   .../gpu/drm/i915/gt/intel_gt_pm_unpark_work.c | 35 ++++++++++++++++
>   .../gpu/drm/i915/gt/intel_gt_pm_unpark_work.h | 40 +++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_types.h      | 10 +++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  8 ++--
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 +++++--
>   drivers/gpu/drm/i915/intel_wakeref.c          |  5 +++
>   drivers/gpu/drm/i915/intel_wakeref.h          |  1 +
>   10 files changed, 119 insertions(+), 7 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.c
>   create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 642a5b5a1b81..579bdc069f25 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -103,6 +103,7 @@ gt-y += \
>   	gt/intel_gt_clock_utils.o \
>   	gt/intel_gt_irq.o \
>   	gt/intel_gt_pm.o \
> +	gt/intel_gt_pm_unpark_work.o \
>   	gt/intel_gt_pm_irq.o \
>   	gt/intel_gt_requests.o \
>   	gt/intel_gtt.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 62d40c986642..7e690e74baa2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -29,6 +29,9 @@ void intel_gt_init_early(struct intel_gt *gt, struct drm_i915_private *i915)
>   
>   	spin_lock_init(&gt->irq_lock);
>   
> +	spin_lock_init(&gt->pm_unpark_work_lock);
> +	INIT_LIST_HEAD(&gt->pm_unpark_work_list);
> +
>   	INIT_LIST_HEAD(&gt->closed_vma);
>   	spin_lock_init(&gt->closed_lock);
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> index dea8e2479897..564c11a3748b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
> @@ -90,6 +90,13 @@ static int __gt_unpark(struct intel_wakeref *wf)
>   	return 0;
>   }
>   
> +static void __gt_unpark_work_queue(struct intel_wakeref *wf)
> +{
> +	struct intel_gt *gt = container_of(wf, typeof(*gt), wakeref);
> +
> +	intel_gt_pm_unpark_work_queue(gt);
> +}
> +
>   static int __gt_park(struct intel_wakeref *wf)
>   {
>   	struct intel_gt *gt = container_of(wf, typeof(*gt), wakeref);
> @@ -118,6 +125,7 @@ static int __gt_park(struct intel_wakeref *wf)
>   
>   static const struct intel_wakeref_ops wf_ops = {
>   	.get = __gt_unpark,
> +	.post_get = __gt_unpark_work_queue,
>   	.put = __gt_park,
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.c
> new file mode 100644
> index 000000000000..23162dbd0c35
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.c
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#include "i915_drv.h"
> +#include "intel_runtime_pm.h"
> +#include "intel_gt_pm.h"
> +
> +void intel_gt_pm_unpark_work_queue(struct intel_gt *gt)
> +{
> +	struct intel_gt_pm_unpark_work *work, *next;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&gt->pm_unpark_work_lock, flags);
> +	list_for_each_entry_safe(work, next,
> +				 &gt->pm_unpark_work_list, link) {
> +		list_del_init(&work->link);
> +		queue_work(system_unbound_wq, &work->worker);
> +	}
> +	spin_unlock_irqrestore(&gt->pm_unpark_work_lock, flags);
> +}
> +
> +void intel_gt_pm_unpark_work_add(struct intel_gt *gt,
> +				 struct intel_gt_pm_unpark_work *work)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&gt->pm_unpark_work_lock, flags);
> +	if (intel_gt_pm_is_awake(gt))
> +		queue_work(system_unbound_wq, &work->worker);
> +	else if (list_empty(&work->link))
> +		list_add_tail(&work->link, &gt->pm_unpark_work_list);
> +	spin_unlock_irqrestore(&gt->pm_unpark_work_lock, flags);
> +}
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.h b/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.h
> new file mode 100644
> index 000000000000..eaf1dc313aa2
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_unpark_work.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#ifndef INTEL_GT_PM_UNPARK_WORK_H
> +#define INTEL_GT_PM_UNPARK_WORK_H
> +
> +#include <linux/list.h>
> +#include <linux/workqueue.h>
> +
> +struct intel_gt;
> +
> +/**
> + * struct intel_gt_pm_unpark_work - work to be scheduled when GT unparked
> + */
> +struct intel_gt_pm_unpark_work {
> +	/**
> +	 * @link: link into gt->pm_unpark_work_list of workers that need to be
> +	 * scheduled when GT is unpark, protected by gt->pm_unpark_work_lock
> +	 */
> +	struct list_head link;
> +	/** @worker: will be scheduled when GT unparked */
> +	struct work_struct worker;
> +};
> +
> +void intel_gt_pm_unpark_work_queue(struct intel_gt *gt);
> +
> +void intel_gt_pm_unpark_work_add(struct intel_gt *gt,
> +				 struct intel_gt_pm_unpark_work *work);
> +
> +static inline void
> +intel_gt_pm_unpark_work_init(struct intel_gt_pm_unpark_work *work,
> +			     work_func_t fn)
> +{
> +	INIT_LIST_HEAD(&work->link);
> +	INIT_WORK(&work->worker, fn);
> +}
> +
> +#endif /* INTEL_GT_PM_UNPARK_WORK_H */
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index a81e21bf1bd1..4480312f0add 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -96,6 +96,16 @@ struct intel_gt {
>   	struct intel_wakeref wakeref;
>   	atomic_t user_wakeref;
>   
> +	/**
> +	 * @pm_unpark_work_list: list of delayed work to scheduled which GT is
> +	 * unparked, protected by pm_unpark_work_lock
> +	 */
> +	struct list_head pm_unpark_work_list;
> +	/**
> +	 * @pm_unpark_work_lock: protects pm_unpark_work_list
> +	 */
> +	spinlock_t pm_unpark_work_lock;
> +
>   	struct list_head closed_vma;
>   	spinlock_t closed_lock; /* guards the list of closed_vma */
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 7358883f1540..023953e77553 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -19,6 +19,7 @@
>   #include "intel_uc_fw.h"
>   #include "i915_utils.h"
>   #include "i915_vma.h"
> +#include "gt/intel_gt_pm_unpark_work.h"
>   
>   struct __guc_ads_blob;
>   
> @@ -78,11 +79,12 @@ struct intel_guc {
>   		 */
>   		struct list_head destroyed_contexts;
>   		/**
> -		 * @destroyed_worker: worker to deregister contexts, need as we
> +		 * @destroyed_worker: Worker to deregister contexts, need as we
>   		 * need to take a GT PM reference and can't from destroy
> -		 * function as it might be in an atomic context (no sleeping)
> +		 * function as it might be in an atomic context (no sleeping).
These corrections should be squashed into the previous patch that added 
these comments in the first place.

John.


> +		 * Worker only issues deregister when GT is unparked.
>   		 */
> -		struct work_struct destroyed_worker;
> +		struct intel_gt_pm_unpark_work destroyed_worker;
>   	} submission_state;
>   
>   	bool submission_supported;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index f835e06e5f9f..dbf919801de2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1135,7 +1135,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
>   	ida_init(&guc->submission_state.guc_ids);
>   	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
> -	INIT_WORK(&guc->submission_state.destroyed_worker, destroyed_worker_func);
> +	intel_gt_pm_unpark_work_init(&guc->submission_state.destroyed_worker,
> +				     destroyed_worker_func);
>   
>   	return 0;
>   }
> @@ -1942,13 +1943,18 @@ static void deregister_destroyed_contexts(struct intel_guc *guc)
>   
>   static void destroyed_worker_func(struct work_struct *w)
>   {
> -	struct intel_guc *guc = container_of(w, struct intel_guc,
> +	struct intel_gt_pm_unpark_work *destroyed_worker =
> +		container_of(w, struct intel_gt_pm_unpark_work, worker);
> +	struct intel_guc *guc = container_of(destroyed_worker, struct intel_guc,
>   					     submission_state.destroyed_worker);
>   	struct intel_gt *gt = guc_to_gt(guc);
>   	int tmp;
>   
> -	with_intel_gt_pm(gt, tmp)
> +	with_intel_gt_pm_if_awake(gt, tmp)
>   		deregister_destroyed_contexts(guc);
> +
> +	if (!list_empty(&guc->submission_state.destroyed_contexts))
> +		intel_gt_pm_unpark_work_add(gt, destroyed_worker);
>   }
>   
>   static void guc_context_destroy(struct kref *kref)
> @@ -1985,7 +1991,8 @@ static void guc_context_destroy(struct kref *kref)
>   	 * take the GT PM for the first time which isn't allowed from an atomic
>   	 * context.
>   	 */
> -	queue_work(system_unbound_wq, &guc->submission_state.destroyed_worker);
> +	intel_gt_pm_unpark_work_add(guc_to_gt(guc),
> +				    &guc->submission_state.destroyed_worker);
>   }
>   
>   static int guc_context_alloc(struct intel_context *ce)
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
> index dfd87d082218..282fc4f312e3 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.c
> +++ b/drivers/gpu/drm/i915/intel_wakeref.c
> @@ -24,6 +24,8 @@ static void rpm_put(struct intel_wakeref *wf)
>   
>   int __intel_wakeref_get_first(struct intel_wakeref *wf)
>   {
> +	bool do_post = false;
> +
>   	/*
>   	 * Treat get/put as different subclasses, as we may need to run
>   	 * the put callback from under the shrinker and do not want to
> @@ -44,8 +46,11 @@ int __intel_wakeref_get_first(struct intel_wakeref *wf)
>   		}
>   
>   		smp_mb__before_atomic(); /* release wf->count */
> +		do_post = true;
>   	}
>   	atomic_inc(&wf->count);
> +	if (do_post && wf->ops->post_get)
> +		wf->ops->post_get(wf);
>   	mutex_unlock(&wf->mutex);
>   
>   	INTEL_WAKEREF_BUG_ON(atomic_read(&wf->count) <= 0);
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
> index 545c8f277c46..ef7e6a698e8a 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.h
> +++ b/drivers/gpu/drm/i915/intel_wakeref.h
> @@ -30,6 +30,7 @@ typedef depot_stack_handle_t intel_wakeref_t;
>   
>   struct intel_wakeref_ops {
>   	int (*get)(struct intel_wakeref *wf);
> +	void (*post_get)(struct intel_wakeref *wf);
>   	int (*put)(struct intel_wakeref *wf);
>   };
>   

