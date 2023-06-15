Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5716730E2C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 06:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E8110E178;
	Thu, 15 Jun 2023 04:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408B710E00F;
 Thu, 15 Jun 2023 04:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686803734; x=1718339734;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4Ygr4W52i9hKXdwk5eHt5y0isLOjM4bhzQ6dQQQo+m4=;
 b=lLfa3c2oFvOmbGCIO2838fdYHUjRw5xS4E5O0RsUwjuZWG3bUyY5xxhn
 8tQFZTH6Lh8ZyWBucfhqKX7sB3EiRlmC/OqHqJcQzPUPaEd7XFHbDzJi3
 uFGoSurUy/3bfJLPazEDUv3JgtsdHWTjoHNQCF5zWyrmE3AKYSdUBZrzu
 0uL2RkJzVt3ukWCYtgKvLTzqI7Oe/srxA9BhQiz0NPjv+30hIzp03AX0i
 nJItj4HcDZgaRfrnQkWy0aivWD6+/vOHM+Yk36K/tJj04aG7eEz3W0szH
 Pw4cI6oOLbKDmsK951dRiiZgq/yuOyMVeFjXtQuwed2OkO0jlqQVr7z+0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="338437652"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="338437652"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 21:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="959024262"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; d="scan'208";a="959024262"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 14 Jun 2023 21:35:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 21:35:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 14 Jun 2023 21:35:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 14 Jun 2023 21:35:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 14 Jun 2023 21:35:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTJTgZBlt+vdJcLaqebSUaUBkmFsj2R3BXTyu9s/sVgIwlkZVTwf0Pfs8Qm9ucDR/MvKKLDr6M3d0+/nEv2Txw8HqLgZpX2cC4h77RdimuR62Xzimkf3B4wYfpuRn6WzMg9ebJ76vrK3hEnuk2qoo4ktHr5ApaoitC7lrh5FZvxbpDIyYhBIGcLmze1YNLu/TbTQ8Y255zrPD3i505wBjqNrFwLRs4QHTZPhOW6WYykQprezmmWMaxn98rS8UHn+ds50h7jJyvz5Xt7xduEUxeHrWX8xbeuWCvsJ3efSLr+joou633NiKmq1qnfciwmaNDLV5tpj5d20JEWrFPtSTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9V3gWFBlhahuowfC5RWN9zdrOct09UW56dm8B4WrvB8=;
 b=f9qTDHDJ7Yf01BQoWsVCbq8TBiaiYqB83HyaX+cR2jOSXvnewnhF6r0OjcoZp/Nb7bbne083gS7qzpgUomBO9yC/VCcYi5td1BWG3S66+xb61rGIFYTUzlseTnGCH72exD7/WsNkNLfjkZ8in2OnJRyczUCS1zh9eewVK+90RBSJltrxbvhHNdiJnmPXa50K8xFlfULNW85l/wTnnPL3ZY8d3jst1vnB2AaDAlTa1tFBz2tDdqYbjeiS4g8zk3SifC+3nv6qvz8Jrh8Vc57ThR0MMrswTNGrbrKxDIxi8RR8tSct6WjmF/M9BCYJfEszI1ufrs6KrgOINkIe+VVRyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB6421.namprd11.prod.outlook.com (2603:10b6:8:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.27; Thu, 15 Jun
 2023 04:35:22 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::ac26:baa:8950:d3ec]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::ac26:baa:8950:d3ec%4]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 04:35:22 +0000
Message-ID: <6b49563d-e9e7-ae8e-582e-f4aead06de0a@intel.com>
Date: Thu, 15 Jun 2023 10:05:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/display/lspcon: Increase LSPCON
 mode settle timeout
To: Pablo Ceballos <pceballos@google.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230614235452.3765265-1-pceballos@google.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230614235452.3765265-1-pceballos@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef41b6b-8fdf-4314-e470-08db6d59edf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PGEFoBpqtsby1M4RoDHFXPysrjXWlWGnQ4CTTutU/OILJ7aZUKQFZdjSTmQdMzULqFE9ou56M9VpNFjcQKJ1+qB2rhzJOymio8yHHPF+t+Fnp2QW2+jsEbEk127S1+D28vZtgm8Ljl80VP+drxF2XHRWk151C18iU1VzynGYSK4CpUr1snnWwQa2f17jL3q+uY4/Iuz/WOBmcvlURKMPZSw1DqexMwynvpVu5rrd+1nSm95sxQtbQe3nwjR14lOb6SQhBm2ACQ5sU4ICtPnCgofTC/U0M7MMUC1w59Zd+bPSCwdVnUivE/psV7/hoFNwze/lUxpCxLqSAPkgISbEsNpqPsvJ0PHDGSTrCIFMJg/oSSZ8Jp5hUYUL0JRtZZa/1/0zd14IzV0efQ0j3OI6ovyhen4q6AnvM63GR7MA6XGYfrUBgKQVHNFVuMPVKupQz3KCqDprI2toeVkTuIs1/eEvBlttDsWMPUjb0bZzCkSzhad8eScSAuvpDwjKTqZLg6/+IXYZP9nP+MoqOFxGuDNIWzG/5mYVQMDvHNJt1/b0khZh9W45zgXzEaXBEEUrc8CFQ9Nt+/l0HQon6ab2WkidQQ49Y8ROKkeu5Cf6Zxc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199021)(4326008)(316002)(66476007)(66556008)(66946007)(6512007)(26005)(55236004)(38100700002)(53546011)(86362001)(2616005)(31696002)(6506007)(966005)(6486002)(478600001)(186003)(82960400001)(36756003)(110136005)(8676002)(2906002)(8936002)(54906003)(31686004)(41300700001)(83380400001)(6666004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVVhN3d6bFdrdEVYRHVNYU1uSWZSZUttbU1xVS8rK3RHN3hORVNDYzFSTjM1?=
 =?utf-8?B?MHZHMHlKZ0V3c0FWYzQ0VENMY0p0RDk2ZzQ0RWo5SmMvZFpIQlhvQlVkTlh0?=
 =?utf-8?B?a2NuQktlMVo0VnRTTmVJczN1dFI4STR4RGQ4MWtXd3lLaEorTDhzZzVDRzg2?=
 =?utf-8?B?MXBKeitWaHJWdzRrQ3hYckZXR0M0V2x5OTE2dmtjSEtZblNjYi8vK3E0eUlB?=
 =?utf-8?B?cG5KQzZCeXptQ0xJVjNrbkZ3amtHTVBHcFkySHJiSE1KUWlmNFdVN090VVpq?=
 =?utf-8?B?T3JuSERsQjJPRk9GcHVmRUdnNTZuYlNqOVJnRW1RRFZOcW85dHlYUUh2RlJP?=
 =?utf-8?B?QkI2TXN6WTNxZ2xFUlliNmxrd3NKZGhQMTBMaEN5YkszdjFWaXQydEJUWHhx?=
 =?utf-8?B?NmdEakxoaXpPRUN0WkU5dTRDU3NvMktIRG9XWkVkbGkxYk9ETXV3S3dHNk9X?=
 =?utf-8?B?dTF2L2pVZGs2RVM2Y2ozeHUyWU5uQkt4c1VaaVZQeXkwWVk2RjFhdzRwTW0x?=
 =?utf-8?B?M25jQWFIeXVuelh0Q0pDVGp5eTRySEhsZmZzVjNCV2ZadHVQRUJQQ1FkT3Rt?=
 =?utf-8?B?VGhWbE9sMWFMUmQ4RFdXdG1nbkdLc3Z5MTFWMjR2L3JLeGlnSzZMSWZ2QTF0?=
 =?utf-8?B?WkVCWTdsbThTOVBBb1ZVQUJqQndEU0pqdUxESm55M2dRaTJ5UGxxZUZ2VW1s?=
 =?utf-8?B?by9xbzFJeC9MS0lTSHNVUlBBRnBHa0FqbHVRTjUrd0tvNXNnQTY2b0MwTDlT?=
 =?utf-8?B?UzB5TFhVMFdjcU9abFRGYkg3QzUxSUpqZFNkMGNaRk8wRHNVVHRUOEhIUWR6?=
 =?utf-8?B?WGVqQVUwbjhHQTJMQzdhZ3ErZnJZZXcxSXhsZldCQlZtU1dDcnJnc3VWa0RL?=
 =?utf-8?B?RHozeWY5MWlnSkN3L3lHd3BhWkNTamw2dHIwV2ZuMFNORUZlalFlN2tpUUUw?=
 =?utf-8?B?WUU0N1Y0Sk41TDZuU2JHRnlWZUlEeE5WS1E4UENWSSt2TkxxeEpUN2Q0bG5B?=
 =?utf-8?B?NmdzN2dwc0k3L25xVkdNTHE1VXdGV2h0Qloydjd6TGR2TWdQNWxKeWo4Y3E0?=
 =?utf-8?B?ZHVxNGQ2UFVaM1NiR1hQOFM2RlkxS2JNQ0t4Q2FMNWFJYzFvcy8zdm8vTVdx?=
 =?utf-8?B?cGx3MFJKdEFxbEQ2eGVkclhGTFNoVEdwTCtvc0FnL0UwRGt3L3NFUWJWVGZK?=
 =?utf-8?B?eFIxclhtemYvOUtSbzNVRW9vRDlCMW9MSlpMa29RT1JCbGFhbWY5SUFKSnly?=
 =?utf-8?B?ZkErVXlQT1ZIQWpnb2M1RGY0cHJGdTdUNHozZWpBdjZ6OC9JWG9CUmkyS0s1?=
 =?utf-8?B?Wm5RRzg3bkRBekJFN0c3SVJ4Y1VrQVVacnNtNmlXZFN1UHpzWklZTFV5VVY4?=
 =?utf-8?B?emVjWitUQm9EL0poREJmMDVVZG5RUzdMVjBYL0RLRGsxaDFmM3EwYmNEbW5E?=
 =?utf-8?B?SXN0VkZib3JGcWNXbWhtYzluUnFTZUd6NGtlN3NUK0o5ZmRmNVZRUktRVmxN?=
 =?utf-8?B?SzJLMXBaUm9INjlnemRLbzZ1NGpYaXE0N2QxUDI0Q25rM1ppRFJBV09MSmFR?=
 =?utf-8?B?UzVzdWd0N255ZVozQ1kzemNaUWxCaE1RaGh4MUowcytrR3UvNEU3NzZoK2NI?=
 =?utf-8?B?Mll6anVGMnd2Q1N1KzJmUkhSenNNUnFoWlFkSmVRSDhkZU1TRTlvTmlGUUw5?=
 =?utf-8?B?d20xeElLLzZBSFV3Z3c1R3J2QkNiNWNCVmxPc0hsb3kwSmNWamc1REtLSk4x?=
 =?utf-8?B?QWpKTGdzSlRxcUFLUTQrOHA2ZHJjUkJab3ExVEdJTVdqZytlR29qVFpsTGNB?=
 =?utf-8?B?d2thMmZVMGdJK3FhNmM1V0MzOTh3RFFqS1Y5UndBV2tBVGhkRERPcUJ5R0dK?=
 =?utf-8?B?TE8xSk1CdUNwYkJRT2o3Z1crRnEvaHFEdmJ2UlFlSVUxYkVudW1pY2V0MzVV?=
 =?utf-8?B?dlpITkhwZTZ3eTFHMXhSeExCRkhnSDFqa1pKQmZtcXNmZm5Zc0tBYk9GckVW?=
 =?utf-8?B?aFc1RW12TGNFM0o2cmU5b21YUHM5Y1ZEZkY0QnZPL0RKTXl3YytJbE5QajNE?=
 =?utf-8?B?czdOcFpGWUU0b2o3MjdmQnY4aWJqREJaZXVsbk5SS0daN1QwQUttRXd4b2Ny?=
 =?utf-8?B?ZXZ4WDllZkl2Wk1PRUFPZFo2eXdnWmFKeStyelZOQ1BpTGpRSGJJT0dMZjl6?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef41b6b-8fdf-4314-e470-08db6d59edf1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 04:35:21.8302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqiJqYYrWpi0Tb2E6aXNFpAqCp7MSxnWb0RRBVjeAWiEAVDFBcqoahAQKIyJWnuwvSNyo7nK1VwMrpVzW0SDH7pupHMY2/ul4aldAhlVvlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6421
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
Cc: intel-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/15/2023 5:24 AM, Pablo Ceballos wrote:
> This is to eliminate all cases of "*ERROR* LSPCON mode hasn't settled",
> followed by link training errors. Intel engineers recommended increasing
> this timeout and that does resolve the issue.
>
> On some CometLake-based device designs the Parade PS175 takes more than
> 400ms to settle in PCON mode. 100 reboot trials on one device resulted
> in a median settle time of 440ms and a maximum of 444ms. Even after
> increasing the timeout to 500ms, 2% of devices still had this error. So
> this increases the timeout to 800ms.

In one of the gitlab issue, it was tried with 1000ms as well, situation 
did improve, but issue didn't get fully resolved. [1].

I was wondering if trying to set LS/PCON mode multiple time will have 
any effect.

Unfortunately I do not have access to machine with Parade LSPCON chip, 
had suggested in yet another git lab issue [2].

I have a patch for this, sent to try-bot, though not sent to intel-gfx 
yet [3].


The timeout value was already increased from 100 ms to 400 ms earlier too.

If there is indeed no other way, perhaps need to have this solution.


[1] https://gitlab.freedesktop.org/drm/intel/-/issues/4516#note_1406500

[2] https://gitlab.freedesktop.org/drm/intel/-/issues/4458#note_1922654

[3] Patch : 
https://patchwork.freedesktop.org/patch/538819/?series=118208&rev=1


Regards,

Ankit


>
> Signed-off-by: Pablo Ceballos <pceballos@google.com>
> ---
>
> Changelog since v1:
> - Added more details in the commit message
>
>   drivers/gpu/drm/i915/display/intel_lspcon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
> index bb3b5355a0d9..d7299fdc43ad 100644
> --- a/drivers/gpu/drm/i915/display/intel_lspcon.c
> +++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
> @@ -167,7 +167,7 @@ static enum drm_lspcon_mode lspcon_wait_mode(struct intel_lspcon *lspcon,
>   	drm_dbg_kms(&i915->drm, "Waiting for LSPCON mode %s to settle\n",
>   		    lspcon_mode_name(mode));
>   
> -	wait_for((current_mode = lspcon_get_current_mode(lspcon)) == mode, 400);
> +	wait_for((current_mode = lspcon_get_current_mode(lspcon)) == mode, 800);
>   	if (current_mode != mode)
>   		drm_err(&i915->drm, "LSPCON mode hasn't settled\n");
>   
