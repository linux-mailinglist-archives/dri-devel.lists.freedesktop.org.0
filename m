Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E305B415C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 23:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A0810E156;
	Fri,  9 Sep 2022 21:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CE210EABC;
 Fri,  9 Sep 2022 21:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662758440; x=1694294440;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8J9UKBbSu84yeFbaNvTbo9Zthy5f2IYuzo06qFk7PlE=;
 b=l+yZyTFN7tyXFJZ7keyHQBJqXYOpOF2s/hHwwMKBAZJFzUd4WAvSvtR4
 DyuWtADEAyizFUWHDP4gueDcTYDbjBoZ3PpJx0OvSPccMjK5RmyhbTml7
 j/Kcg7zCazpNtH+uG0lxYyQxQ/13tCJtgmFdFu76tWOR7j653MrDHMIIt
 pj91Q9ShYzGI1+Xmzx6MuSmAEY4xnE8guxUbbP1fL8own+hnVdLfpbEus
 oi6AXreAh2uj7XBDOYhCDWVmDCQMBg9qiViK7vdPghNwGEEaeCjFtfTa3
 r/ohGSejOu4evx2IzZYhekm+RuU8SAYc8gegBtXnFQO58TnnM2lA0SOie g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="284589314"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="284589314"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 14:20:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="683778830"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 09 Sep 2022 14:20:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 14:20:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 14:20:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 14:20:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 14:20:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMqCt1iIyGQ+XHWGzFzHDjQ6VrHbWmmPRePePUhioExPJcXUrHXyaE8ABL5P3uzHZac0EC4kXYwD4pdVLepffRh1jmrNKi0HRCTGWjBZ5YeRzORyRVAQCXg/efc5ToaP1T5vm8a0fOoCsG2WwqpBtgrNYOvapZ21mu4AD87uiT6GT56Z3jAXtig45MsYhkYc6r39yTXQYV0fSZc4fiXIuJ3Gwda0rbXUIN17w3yPkNjLh6s4A6mADpFfIAa1rC2mGjuVh+6EzFvhgcbDVgXOh7ybKdGGgQVxNaPJcLC7pIMdiFUCjntybvdyJNzbXq5LEW3K8bn8sdwlXGm8erPy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeOi3ZaQQpl0BRqwdKxEvRmLSrSWAYu72SY8kdnJKK0=;
 b=ndAYygLhWhGaHYCPHbQ7mEmpycrsqy8fqXez7lrV70Wr7nZMb+gh+N2H9p8XQBn6P6mmXaHxOukZtHUzDtZkyH7CCYXiy2RM7gZNLM+YFcAsUuzXsECbNWL6F0Ps2F3FOdHu1IMEjDi+wRMOp9Y+M1wZPEUC2m3EMqck4f053rz0p9UObg6IBueGIhjd1j3Df10iXYbGdnXHJ8ncF7mK/iiPyMBRgoQfTQFINhXnbpnZJ3TmYFpDAKA3QpXWAcyh/5SXSpuw/rqIcrdkExuo192QVX16XDHauHiJFv/TKah9mJaHP4wH+AHfcWipBy3uVb00vphKeQIv4JaGH2Zvnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4514.namprd11.prod.outlook.com (2603:10b6:5:2a3::17)
 by PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Fri, 9 Sep
 2022 21:20:33 +0000
Received: from DM6PR11MB4514.namprd11.prod.outlook.com
 ([fe80::bc32:de12:5ffa:c4c5]) by DM6PR11MB4514.namprd11.prod.outlook.com
 ([fe80::bc32:de12:5ffa:c4c5%7]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 21:20:33 +0000
Message-ID: <fd942c06-1b0d-311c-35df-8632ee96fce4@intel.com>
Date: Fri, 9 Sep 2022 14:20:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 12/15] drm/i915/huc: stall media submission until HuC
 is loaded
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
 <20220909001612.728451-13-daniele.ceraolospurio@intel.com>
From: "Ye, Tony" <tony.ye@intel.com>
In-Reply-To: <20220909001612.728451-13-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::23) To DM6PR11MB4514.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4514:EE_|PH8PR11MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d03841-9ef5-4749-65f3-08da92a92137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HA4kAe6KcwF21xwqea+3PYbYS0D94yMlSLZwH5qSrdu4n4uwqHYtZvCeo/wbkCWtkqOCyObxjBRp1PAMCXKljcoPzgcfFOSs9lTfu6C8I89MnCB2E4BL/2sAcNgLqFZA7ViFJB3T4doCigW+rn0KWesLe7KyRX23v++9MSRQZDiH/qZ0rcFBgehjzmeU5fAiygezWoXXgKyKIVkJheZ4oI8s1aFCLETBUDJlAKaNLFW9ojE+8YcaQtIpNu7EuRpudLuPPBFFHJpIr7d+GMxAASjqqm98ucied/5ZvZ7toQF4cxpg3LhpJJpVPhniRWQ0aTWrIoB9cdD4uu387ZbwFuJgmvqI3urGp+WEZmsWI+qBhq9g1BMIZhU8twXZCAk1CbmdJg4aEy2ZYf0r4nFKdfZer48s8MyZVpIjFogY7+iifMv/FldWUnTg0uDo7sME+ZRBacd+5P6qNcOE83Sq0GTzmW+TI3TBmhE70pY7t+mukzVfe8YYgTEg+DBMNnPD2D/NE8gFoJ6hBxHS2MH6CQroKCUfHawHEtN5irxQf87mY89szeMifqe3rOAKYkOZWUGya+7NhP+NpQf6ju197jKBvKuzk/bcz+jFrIts78ieophFxg+h/n1TZvqWspBtLUOdH6umR5QgqHoHZQ1w28ueHPzOAc0EUgtiNDXz4bcq6q+1ixswqb8GGYzVmD1M8EPiOSLsRSOIJtA7/9CVkbyzAjfk71FuY4uC8b9Ab4N0rscL2FUWDtv4557lQ0vd5/w50qwh7U/f5TSphFE8n08J+uQcL2+UI+Qo+Ob74oQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4514.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(396003)(136003)(376002)(346002)(6512007)(36756003)(8936002)(66476007)(66946007)(2906002)(450100002)(31686004)(8676002)(66556008)(41300700001)(86362001)(5660300002)(316002)(4326008)(82960400001)(31696002)(186003)(6486002)(38100700002)(478600001)(26005)(2616005)(6506007)(107886003)(83380400001)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkhDQ0h0L2Y5SEFESkErQXA4UWVJdnBnTjVJVXdtV2tsTng4Y3RhQUxwV3hz?=
 =?utf-8?B?OWNsSUVNQ1I2RVQ1bTRiZ2htckxMVWJBcHJHdDY5M1B5V01TWE4xd1BVUjBh?=
 =?utf-8?B?Y2NZQVpGMXREc0ozVG5BVWcvZTBDUUtINExQZ2Y1T0xiWDFxUTRFSmJjNlRt?=
 =?utf-8?B?LzA5TTA5RHQxOHc1R0t2ZGw1d0liNlF3TE5zMFhJakxLa2VGNkh6UEV0THRX?=
 =?utf-8?B?Y3ZIU1hOOGp1b25tUURpNGw3cjhvWmxhQW8vRDNPUUlxS2FOcVJoUFZyNUZG?=
 =?utf-8?B?VkNVN1lvNHBUa3hndnlVbDBUYmJMd3ZFTElxNnI2bjVYK1h1TW5KUEd6V1JY?=
 =?utf-8?B?d1dPaGtDNmhmbFpFL1NEV05vaEhVd08xT2JmZGVEUUkwTVlac2hlK3A1T0ZF?=
 =?utf-8?B?MS9yQkFaNU0yUnFQWmkyQVgzV3JTYVpNNXptOWxTT2dKaGlBTEF3dVRUcXV2?=
 =?utf-8?B?Q1E2ZnljMzNyN0szS0ZzWUM4L0RjN2N0WktPSmUzMmdEOFg2YTdMN1FwNThO?=
 =?utf-8?B?dkMrTnF0R3RDOWtqWFlLME5NeWtnVHN6aW9PZWNLQVN2UXBGK09jOFBkc3hN?=
 =?utf-8?B?U1kzNGYxRndGdlZ6UXE4Vlg0T2MwYXhBdmhhUmpHcFVOR0UvbGxuL24xKytl?=
 =?utf-8?B?RUFYWER5TC8yaDN5dnpWelJqMHpieTI1eUJjaENzcHBuRllybU0vS0YxUFhY?=
 =?utf-8?B?TVAyZC95UWJZZmxjQjJyeml2b09IUCszR3VPSmUxWWRHUVIwM3NvUVo0Rm9J?=
 =?utf-8?B?cWQ4VUlqcUdmYkFFaC9kUFVNbEZucHVkVEFXbmJTNGtTazQvYTZyOEo3NER2?=
 =?utf-8?B?Znl3T0N0V3VmK0VtMUlHZmhoMFRxVjZzbzk1RzlTUVFNQWFieXA5bllZZmV0?=
 =?utf-8?B?U05qZEZ3VDNDN3hzWUo5SjgvRXkwOU1mTHBCMVlVOEIyeHhwbVZyZnd0Qlli?=
 =?utf-8?B?SWJJMkhSS214VDBxb0l6UU4wR0xRUU5aS3VMZEFWYkFBTkVDQlRHNHB2MVBj?=
 =?utf-8?B?NzJwUGJGOFdlUTUwM01OTlZVbGxTSzNwVGlvem1KbDZ0MjB2OWVNbTVQaXlX?=
 =?utf-8?B?VGZ6Y3ZXZFhoY1FrbVZHZi9TcHhyREhERldHcHhHeFJnd3hRRis3WlphOVlt?=
 =?utf-8?B?VEtGS2lrSVlndlNxRFJFbytIbitiTlpJS2hjZTlrNzV0ejJDRWR6OVZFK29v?=
 =?utf-8?B?OVBLUFFLbkJrT1AwVnJPVExPQlkzWXlyKzhMRkZkNkY5SXE2YkVLRlkxaThv?=
 =?utf-8?B?aStKNWlDK2VJNFYvZUFyREJtVTlXT0JZd0R0MVpjbHAvUmhLTEk4K01oUnpi?=
 =?utf-8?B?SmowWHYwUzdTM2RMY2pQaDFMN3RpNWtHeDRlaFIrYzhXRU52VzhSa1JCb2RT?=
 =?utf-8?B?S0pXWUQzaFQ1QkhocHJqbXhYWVgzaFdqOGZobGdmc2tyN3J0Z1krSWJrQ3VY?=
 =?utf-8?B?ZnFiYlp5TzNPWDRPcnVQajRaa0gwTkFFNHNydDJISytmNXRnN0sxc3RWRGNJ?=
 =?utf-8?B?TUpkVG85WVFPaVh4VUsrVWFGMjltakYwangzRmpyRWR4Y1E3TStJL0F1bW9h?=
 =?utf-8?B?Q01tWjRNZFZYd09NMkRSb2tPNmxGc0FwK2M5QUpQSnp2bTcvVGd2cTFtSmx4?=
 =?utf-8?B?dzVqamNCcThEYjRFR0p3ODZlNkpSR21JblFrMlF0cytRMzZ1bkR1MytSeWZU?=
 =?utf-8?B?Y2VOZVlDc1E4YTRyWlBDY3dSMG5kTzkzbEV3TXlnVnZPSjczSlFwMFNMK0Fv?=
 =?utf-8?B?djlLZmU4bzJXeHNIVGhnbGpjUFI2R3ZoNjJCWEx4dWJUcTdmTHVraUFnRXRo?=
 =?utf-8?B?RXliaXR5ZEtBcVZ3eks0UmNZdVQ5QXlTQ3pnR0EzaDEyeFRBeXFIZHg2YkVD?=
 =?utf-8?B?V3NIRCtQWENXa0J0WHJjZmJFYjM0UzBuZk51UGZPek5Fd0V0Vk9zWE0wRCtQ?=
 =?utf-8?B?Qksyb3dLSmtITVJEWEJBSnJRRVRRRXZFaTMzaGxCVTRSZ2E0aUVjdWgydjF5?=
 =?utf-8?B?YU4wV2t3Y3pwM2hIeEZCTU04Yk1vODJ2b2gvQ3o5K21tclM1ZjU5ejgzbEFI?=
 =?utf-8?B?R080c3RTZXFNc21nSFgvUDJkTHpJcE1DN3NGbGY4ZW5hSndad1p1NHh3TldZ?=
 =?utf-8?Q?cLaGbgpO25fJCeMcVBoQqLx9a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d03841-9ef5-4749-65f3-08da92a92137
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 21:20:33.2159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7dxTwC84nerpe6Gpm4OniSD/grK+lJAL5kXp0ZW4YDV3qXBCfBSb+U6tQeKyFYAtM8qCrxvVY16wUAtRua9NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6609
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/8/2022 5:16 PM, Daniele Ceraolo Spurio wrote:
> Wait on the fence to be signalled to avoid the submissions finding HuC
> not yet loaded.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Tony Ye <tony.ye@intel.com>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.h |  6 ++++++
>   drivers/gpu/drm/i915/i915_request.c    | 24 ++++++++++++++++++++++++
>   2 files changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> index 915d281c1c72..52db03620c60 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> @@ -81,6 +81,12 @@ static inline bool intel_huc_is_loaded_by_gsc(const struct intel_huc *huc)
>   	return huc->fw.loaded_via_gsc;
>   }
>   
> +static inline bool intel_huc_wait_required(struct intel_huc *huc)
> +{
> +	return intel_huc_is_used(huc) && intel_huc_is_loaded_by_gsc(huc) &&
> +	       !intel_huc_is_authenticated(huc);
> +}
> +
>   void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p);
>   
>   #endif
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 62fad16a55e8..77f45a3cb01f 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1621,6 +1621,20 @@ i915_request_await_object(struct i915_request *to,
>   	return ret;
>   }
>   
> +static void i915_request_await_huc(struct i915_request *rq)
> +{
> +	struct intel_huc *huc = &rq->context->engine->gt->uc.huc;
> +
> +	/* don't stall kernel submissions! */
> +	if (!rcu_access_pointer(rq->context->gem_context))
> +		return;
> +
> +	if (intel_huc_wait_required(huc))
> +		i915_sw_fence_await_sw_fence(&rq->submit,
> +					     &huc->delayed_load.fence,
> +					     &rq->submitq);
> +}
> +
>   static struct i915_request *
>   __i915_request_ensure_parallel_ordering(struct i915_request *rq,
>   					struct intel_timeline *timeline)
> @@ -1702,6 +1716,16 @@ __i915_request_add_to_timeline(struct i915_request *rq)
>   	struct intel_timeline *timeline = i915_request_timeline(rq);
>   	struct i915_request *prev;
>   
> +	/*
> +	 * Media workloads may require HuC, so stall them until HuC loading is
> +	 * complete. Note that HuC not being loaded when a user submission
> +	 * arrives can only happen when HuC is loaded via GSC and in that case
> +	 * we still expect the window between us starting to accept submissions
> +	 * and HuC loading completion to be small (a few hundred ms).
> +	 */
> +	if (rq->engine->class == VIDEO_DECODE_CLASS)
> +		i915_request_await_huc(rq);
> +

Acked-by: Tony Ye <tony.ye@intel.com>

Thanks,

Tony

>   	/*
>   	 * Dependency tracking and request ordering along the timeline
>   	 * is special cased so that we can eliminate redundant ordering
