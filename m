Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A87C6ED245
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 18:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A697910E2F9;
	Mon, 24 Apr 2023 16:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C9C10E2F9;
 Mon, 24 Apr 2023 16:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682353002; x=1713889002;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kbrClylxDPrK6YHmNBNO+L/DmKydGq9AUhPn+OyC7eQ=;
 b=lyEqhXSqbOuPP39idSzk7BBRE1wQvMKY8lLwozx05lqfpMH5YplT/NZ/
 GFQCP/i1/Ufzinq94coq5GdvMksgf1pEyYBMObtv9h6EUSizzCFwer6jG
 +UXuYFFW3Qu2o/BP90NwU8U3WY1UM6HcjLj7aSed60E7Rb3S77bVIMbli
 naTjbXT52uCcmFsffCyHpHFnbMCXHGCz13LmWcX4D3XZOCOiDJeg5QoiO
 DESfOKeEdIlw/ixoonMz1VWOcU+AO0P/2KCAIqfZfGwYlMINvZKogUYns
 xpIiB8M/MciMd3hhSRKsz40qakYhh2yXzye/cnjpsvWAnZe5luyAiykvK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="326810578"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="326810578"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 09:16:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="695824061"
X-IronPort-AV: E=Sophos;i="5.99,223,1677571200"; d="scan'208";a="695824061"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 24 Apr 2023 09:16:41 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 09:16:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 09:16:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 09:16:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaEKBEgDW3RmlY+Lvl0EuksSJN9H8B4WBo2UlEeb62PzYrfGBoxucR13bzAu/3T0eyJ4IlP205cLpTPx1Y5SpHzhP7X4eaGH8xkg+pPe9MzBcXa8aSAvuAxaRJvQPLAGvOrZAfG+MEqPw2QizZYehSG1O/Fb23O6OdXLjuia2am2AqccHkNMhXqfleAmONdSHYz3w6MYvFerjUUlQ2t+h0CNsc7M+N//4L0iAaQQ9FIdaYYPUeVnZphTZp1M8R/6jrS7/iJSe1CxUqgLKQ53z9/0VupTyOwC9lrsK4FVHRaORBVl7tmcvJh4R7o8o6j8wxMcEN8H5544Kz+YyqFjEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFSwyS1ZEctYN16kAvbDvcR6ctYJE6J+j3biaevFMb8=;
 b=hjVvl4gm0BEc9sCYwPhYroSay0LIblppj7qfrXDX8HuFDg//DaeJpf3FMYRn9WeJ9XrC1rUlIJQeZQNsKD37M7P9AaW/lFE9G9TxXsXC/a6iRkC1DT+b8ZhR7xCoBRtjh/Ecj56Edza2LUMNfUj/O9ldkq0goF9BZ1djI4LOqMCDRZ0xnBHJPUTXNF09j7QuzekR0mjuwILoZGLyXo8HnSlltMztZp1iaVN20LRikdcGY+hQKMxlSxu1EKtpIpVXsBetTfpG0uigPYNZC1FSbNC6P78QFl4mbrYRdE0hafkjf9dZ1ovgOm+D7UC86SBloeFevIxW0ct20tD4HAdCRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by DM4PR11MB6287.namprd11.prod.outlook.com (2603:10b6:8:a6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 16:16:39 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::fb75:ab6b:697:f2c8]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::fb75:ab6b:697:f2c8%4]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 16:16:38 +0000
Message-ID: <3545d4c8-08ef-7382-d25f-0c16e256eb63@intel.com>
Date: Mon, 24 Apr 2023 18:16:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/2] Restore MTL boot
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>, Fei Yang <fei.yang@intel.com>
References: <20230424160913.19886-1-andi.shyti@linux.intel.com>
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <20230424160913.19886-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::18) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|DM4PR11MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: b4de518f-9e49-4a10-8a5f-08db44df4861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kqxJPpt6dachGd0NocW1TlyhPprEOKarHyQtQOt6uHYxmnFCFptaysmA4uM0bNTWK0UQ16knHFnKf2CdF3qRMpYg70nqpapJIbSapgrUXkr4Fr5Y6qoMuwmck+Y7/jy0MSG5YwG22SqEnqCZLd497pMYD3fIC9Xcj/cjIrcBWMrP5VrtmRfKQLOFvnTkcBk8Xi6KzrAYY/bKYuTzS4ET9Z9SfnXTal8OeG89mVFPJCMPxbDWaU+YCjtyEK4U/AXQkbhw1lHEeiDpazH1Q4umWlryqV3S3NG/di5E0PynhezX1l5sTwCWWag+BMi9wCQb5zn+Ire/T4EW/tUdyQ37TwG0XjgvY0BxZ4fVT6qYUSSXYVgOff1mEAontjkKzSJGLBnm9cvsy8J4mvwca+A8tPXQdF2yLqgBcOTjxCbc6Y2eG7Nn0FxPhJJObXICvZo5pXngms5InGotU+SMR8nlYj4HhL7D9RAZBPAnQwUeIPfyA03a9Dk1E0ZYWVXIafaVd3tDWfTYEbMZwcZ0Zo1WY1yYOM5stQ78+0Gg9TN5KePLGVaXylW/0omgc1P0T4k8KJmMM0HXI50d/N72/ORzXQSZDeZXcFDNA5L6p3hhwlYl8abhKP3rqo0cuMuAziowmAWN3amGanGLCUgPFXgxug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(53546011)(6506007)(26005)(6512007)(2616005)(36756003)(83380400001)(186003)(82960400001)(38100700002)(66946007)(31696002)(478600001)(86362001)(66556008)(66476007)(31686004)(8936002)(8676002)(6636002)(54906003)(110136005)(5660300002)(6486002)(41300700001)(4744005)(2906002)(4326008)(6666004)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnpMQjExZ2J0WE0yYWJnVGFtM0FNYXNxMzBjdXVzUUFpQlVURWFQZEVzd0tT?=
 =?utf-8?B?dVBQY1pkbFFkSUhNa1lBaCtvN1VDWlNHa2JHaEVMR2pvZlY2eXlmWlhKdzNK?=
 =?utf-8?B?anM0VUZYSXNHOXZZSFpMUzQvYStvZE5KR3VoVkZlY3h6NU92eDlKeTZIUnJt?=
 =?utf-8?B?ditoRmxndStwenlrcHRxYmhRU1ZXNWluS0pDNkd5c3E4TmdLRFdjMEcwWlFD?=
 =?utf-8?B?d2g2aEtXYjJKWlhCMFpwcHdLYjArOTl4NWwzT2tOZSs2ZG1iUkU2NGRCTkZ4?=
 =?utf-8?B?QXVNZDJWdEY0NzJRR3kzRGdKRkx4YnFXOHp5SFQzdGw5ZzF2dy9VV3ZLb1dT?=
 =?utf-8?B?VEpjaW1LYitkOXkrdzBRREplV0VSM3RrZDdycWpIRlRkcWUyM1NnZnJZVFlh?=
 =?utf-8?B?aEk0d3VXQVYvWk5TcVExb2M3VFBrclBBcnpSR0p0WFdlcFZxL3NKcG9QRmc5?=
 =?utf-8?B?YjZ5QTkxUU1QcjVZTWhUWStWUnlOcWc3VE5oUXlnLzBmNGVnOEN0bUpEN3pG?=
 =?utf-8?B?UFFYTGw4eHpXOUgwbUVhMDVUQjdNQlRXaG1ZbHBKUEZYK2hmTDdxa3ZWYkYx?=
 =?utf-8?B?cGkrY3R2MjNXQjdEQXVVNExzbDd1c1N2MXg0Qk9xaWxnZnhNNm5IT2tQSUt5?=
 =?utf-8?B?LzZvV2o3QWl1QW5NMFRneW43NlplM2F4RFUwc1BPbEl0V0ZHVjF4V0x0MjVU?=
 =?utf-8?B?eS90NXNGVmdZY1NEcjdMZ1JETDNDVTdzQVpDbDRGWndybUc4UmRzNkFIelFm?=
 =?utf-8?B?YkFINGh0TEpGaGt3bFY3L3BjelRaRHdIUGloZ2svTVJkdHROQTF5WEFtZCtN?=
 =?utf-8?B?TmhLcjlTTXFVSTNBM29TRzJPQXpVYVlmZzQ3VksyS0tsODhiUE9DUXdXT2p6?=
 =?utf-8?B?eWpwR3NNcTJVaTRPUEFveHdKTTd2d3NCL01ZZzJPaGRJTzllOGo0MzErRjJO?=
 =?utf-8?B?RUZUUWQ2cG41MFJ4aTNXMStOKzJ4TkxaV0prd2JoQUxJaHdnNWxkc3I1cmF5?=
 =?utf-8?B?eGw0dkJTdGVvWmpKdlg0UTJTMkd4eFdEZ2RoUUplTFFYMzlnTkJQcmNsbTlK?=
 =?utf-8?B?cmRLc3JkTFVZUktmVWN2a0EvWjhITHk5RWtmN0M5NWVLOTVrcHJEemVza0Zs?=
 =?utf-8?B?cFFwblRkTzRtY3NHa1lXZExybmNCczJkczdxek5zc3BVaVNKK01zdkN3dEtv?=
 =?utf-8?B?NXVSdTZLVWlnSDhrdkxRb3BqS05JSHVlbGlscitwZVdxWXB5VUVDeDhHNFlB?=
 =?utf-8?B?bFFOWkxnR3hJSVl5YStNVmtHaHgwN01FTmUwVmJSa0RCaTB2SmpHMy9jdXNP?=
 =?utf-8?B?QjdZWWt4UEtQekl3VWF4QnZlOUlINWJpT0lZVi9EOG83dlpabGJnUDBscjd2?=
 =?utf-8?B?L3RsTzZreG5tWWg2dzdmS0pJQy9KMnYrekpQaFlnVUhlVEZzcmVIbCtaQlUv?=
 =?utf-8?B?ZmpxcGVKYnVveGpuYm5iLzc5WElZSGhnSk0waEdJd2tLaW93U0VoaHNnT2NR?=
 =?utf-8?B?Yis2M3lFTnhKVE84Y0s0dG5iMXYrLzIzdkU3WDFvTHNITmI1TmVKOW9YRDJq?=
 =?utf-8?B?RDl0K3JxSmcwMW5uMi9YdFZ1NWlZSnJzUnoyaVpjRmMxSzNFbThJSkh3K1BS?=
 =?utf-8?B?cTUrZVdwQVJpU0NJQmh4cVZvZmRwYlkxYjl3ckQvaFFEN2c0cHFycjhpQ1RD?=
 =?utf-8?B?dXFsakVSN3dHejBhNTYxTTZCNWdaZFNZN3kzZjhOT1FJcTBtZlJMcFJ2aDVW?=
 =?utf-8?B?aVpTZFhRTnZUaHo1S0FoY3NtN0F1bnhvOUdOK0EyNmNRMnVhbzlZSmUyNkcy?=
 =?utf-8?B?eXV6RnYxaS8wZjA1TE9yeGd6dGhzSHNJbEMvL09HQjU2YXVNYmVZTEtPN3pl?=
 =?utf-8?B?OGFIVUViaG84WmttSXZIcExVUUdrNU5YV3ZNUWtFb3Ixc01ZVmFWS01HS2hF?=
 =?utf-8?B?V3puZnBlODhaT04rbFdrN0U4UGR5Y3BGbldiTmdhT3JFdDdid2FOZFY5dXZX?=
 =?utf-8?B?eFNIVUtwalY1dDhDUkM1NjVQOFpZWmdQUnFxbnFkM1FWU0lvWGdSNk10VHRj?=
 =?utf-8?B?Uk54TzlSTDBhRTdyMElWNnZwMEVtNTVXQTcxbGZtdWNxUzRlcmVGaU5SSGpq?=
 =?utf-8?Q?WWnc3NVrAeCtv69OBPDB/I1Jd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4de518f-9e49-4a10-8a5f-08db44df4861
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 16:16:38.8242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1lx/3ky01S3c6/8irvMWXpApIDj/1LSbBD1hHC7+Nlnob9F4tSxGgdstk9y1inkHoxxf3EuRL1T1lPulZDprg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6287
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
Cc: Lucas Martins De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/24/2023 6:09 PM, Andi Shyti wrote:
> Hi,
>
> The two patches reverted in this series are, together, preventing
> MTL from booting.
>
> Revert them until the fix is deployed.
>
> Andi
>
> Andi Shyti (2):
>    Revert "drm/i915/mtl: fix mocs selftest"
>    Revert "drm/i915/mtl: Define MOCS and PAT tables for MTL"


Series is Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

>
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h |  6 +--
>   drivers/gpu/drm/i915/gt/intel_gtt.c     | 47 +----------------
>   drivers/gpu/drm/i915/gt/intel_gtt.h     |  8 ---
>   drivers/gpu/drm/i915/gt/intel_mocs.c    | 70 +------------------------
>   drivers/gpu/drm/i915/gt/selftest_mocs.c |  3 +-
>   5 files changed, 4 insertions(+), 130 deletions(-)
>
