Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A68F6C9BA2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 09:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F97010E235;
	Mon, 27 Mar 2023 07:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331B210E222;
 Mon, 27 Mar 2023 07:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679900848; x=1711436848;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l08M3+hZXfpaXzpAkDp55i80Sodt7yTAyHWPGuEJ6Gc=;
 b=G6zi/6aBQ1OPzYh66Cx6gNnlbdVipsAgxYjqvCqbu4NPL8FAWGTjS0/w
 /t7LEKwe+uhSI/GhiIw0hpj1nHkubjza6BLjw/6kvyiJDUcyw/0kAaSsr
 fyxZtHua69VDtJEFpzwl9ag6kVQLMQVCcTzMgEJ0f1TCJz3NIeExyjdvB
 xefSHVxN2yd+36BAM6qkRMt/H6Z+kLYtNjoOA+CiVx/iIwRoX09HXpq4H
 53MbywrxXucM6D8iotXcRoDo0Sicoa2hUXHIb6b5zzaLQkOyWLcPbKdoT
 XoIo5csMDoWFZlV5adPrkMkqCEFPb2EKyCj+j6JMJQc+v2BzAnMcglQwX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="426457075"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="426457075"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 00:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="807374297"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="807374297"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 27 Mar 2023 00:07:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 00:07:27 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 00:07:26 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 00:07:26 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 00:07:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqKNYOlU6j9gyr4zmayYpn+VvmRa6P3iWebTTFuXlEeR13A0bc65LAZwiIPxO04E9hsZDEGr3nyIupQu/jIiciAWLFV7jFdRppViIxOc7RP8irq6yIliuDuxa8NFLJu4xxaqT0xuOOhcbMnhqMbUO/7dxFqp8GTUz9dC4TXt7kP5iVb2qYKXDXolQqyZsG34dqS/gVO46NxjyFHvsCys5OHQkzRWupeEP9iKbS7j8IoxpeFJskQXA2fzCWcU3UO2hzhTpwEFX4hJWerntChsWUw5EW8RnilZ8CU/bCDiel2KrfjMnBhm2pgsXQO49nerQc87SW0LyoHywuG9KGPnpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kW0s/xTD5QKfe/J1QpyeEmYCTIMYYqm6p3d9br89+iE=;
 b=cVK6EzvHFnBoe4bESagM2Lx80X8DIal6KL75R8leOnEQ7u+CWoyrToHNTpv6xx1oBXjMZPQx5rTAbzysLzMc2zcMHP3yWThLw68dc58hHfkyiqHZ/AsCQsItA1BJ47dBAgkJjt65ZYpqsjhJcpB/nrsRvq5vmrRCLjmX7oToawrtJm76f8Se5zms7+Rs2BqXzPUn+muz0jQm0c21Xe0TfxvjqqEhIY/ECaId26WkJ9lTHkex3rfGfF7jPXvdBznEIFMFfaF6aPVahPTkW8bCDEStaGRqEroGczFI8if5K8FIAa+DsqNEKqPL0w3mJfCpj2czcRuoN27G0tv0+hSvwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 07:07:25 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a6ec:a0c7:4dde:aa7f]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a6ec:a0c7:4dde:aa7f%7]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 07:07:25 +0000
Message-ID: <fef256a6-3027-8beb-0ef8-fddf972db441@intel.com>
Date: Mon, 27 Mar 2023 10:07:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH v6 5/8] drm/i915/pxp: Add ARB session creation and cleanup
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>
References: <20230228022150.1657843-1-alan.previn.teres.alexis@intel.com>
 <20230228022150.1657843-6-alan.previn.teres.alexis@intel.com>
 <fabe4123-53cc-005e-e0af-7683e0d45896@intel.com>
 <3b8091c51677878b968d1d275b9b16e5088d913d.camel@intel.com>
 <ZCAqDlUIp0YmCkyu@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <ZCAqDlUIp0YmCkyu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|MN0PR11MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: bfdce169-9d7c-4da6-509c-08db2e91eaae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TuLiXCMzEevjxrFtxFfiDiDMDzjZUt3riuAmCf40uIpKvFzHSmnP5xP6VaKfIyscfQOuJFb7CMoAEkQcpuU4r7w9fNyGFt1XZUfccZ7tOtPzL55NbQhB+T6xh4tc1VDGjhK27HLj/4Y6Iqdoxk+xjWhZPQs2bulwuKM06mJcjIRlxA2Jib4CMf+Gi/BU5zPGm8aUY7sx+Uwk0abd5UVMIcaZyt4qEx1qq35JN0JBkpwdDzKuAZKg3aI3enGNx5E+LtMjy6kcLpgBnCcG+/yqg/Y6+8SFkP/v+4hgGA6drdhfTb0NH/OF4wSCMUeVcoyfFd3xR+vKore/T+OnuuQzbZoTRLyF60gNAQgXQalm6utCC/Uh1jeOPkTljV9OKLmnbP8dc7zlXQWgzpHeYQWTTKL0WUG8IoOaQRJnIBW9+TpWODqOh/In7yqcxfB9Xe7XAXfnHuA2cAZaoYjLav3Jr1Xfo4GzIn244YetrmN6ANHl1zwjGHx2f6JLyvTnTSQVmLT14ZviPsYYDRO5ls3SnFDHOxIETJfY84sAAVV0HQtQh2JJMRofIsZsvr+YPooSQDC5JWtTc+oPuEclN7wbwVbyTcP2Qm9DBMVfIRVPdx1vHtaDMzGJKeGtiFpmfucA4r4lZ4or7P0ltRQ4Rgp93A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199021)(36756003)(31696002)(86362001)(2906002)(107886003)(6666004)(186003)(2616005)(53546011)(31686004)(478600001)(41300700001)(316002)(4326008)(8676002)(6636002)(54906003)(5660300002)(110136005)(66946007)(66556008)(66476007)(6486002)(8936002)(82960400001)(26005)(6506007)(6512007)(38100700002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0JENk5veS8vT1F4YnZYZk02T24weXlIMHJUZ2xZckFNU0JrR2lzT1crYTNh?=
 =?utf-8?B?d3A5S3NURUI4OS9oVnMwSmh1WDR1Q1ZQU2cxZUsvbm1rWlN5Y2s3MXNYeENi?=
 =?utf-8?B?S0NkTjFzNVJxK0lyVS9SWCtrWWpvTWFzNlA4TEFORm9BT0MzTWMvajZmb3Ns?=
 =?utf-8?B?MDg4b0ZVK1dvTGtObTZBdk5nQ1A3cDYxVjJ2MUZ0M0JVeUZhWjlnZXdPaVFD?=
 =?utf-8?B?bjl4bXBEdW5TZG9aUVYvVm9tMDFPaDdCd3hvb2ROSTdNYmh2WFhpYnNFOWVN?=
 =?utf-8?B?WHdsS1VLVzNteHdvcXpqTEFYNnMzbWlEelZiL0ltMG5RbFpZb1ZhOHZHUE03?=
 =?utf-8?B?aWY3cm11SWI3bk5GSldjK2Z1a1ptUXVxMWNBbzM1SmpEN2FiUjNZdW1ueVE0?=
 =?utf-8?B?eTZLMmYwRkd2K2VrMHVRVnlCa09jN3hZOHoxNFdYR1ZjOUlNTm9JYUdaWThH?=
 =?utf-8?B?cU5MMldsY3drYkE4cjBwZWJ5WG14eTRLUXR5bW9ackozbmoybitWR05BZVlT?=
 =?utf-8?B?S0hBQjlzQUszeHk2bGdwVDhYWEYvRWFaVkpPZTFqeTNoYTFZcHZiVFQzYjVo?=
 =?utf-8?B?QVlsK0NjY1QzUXFZKzJJWWhIOTRGSC9FK1djUlRXTHRUekxORE12SUlnclRr?=
 =?utf-8?B?TWlZcGRWTlRNL01KZU85aWZESkZuU25GVmxGdnNTOFE0dXFqNXhkRnkvT2p0?=
 =?utf-8?B?c2tKZU1JaTBIeld0Z3h4WE9yazZNYnRxaXdzUjMvTm1sczJzdU5UT25yZ0FS?=
 =?utf-8?B?anE0dXR5dnlFTlBnaDRPNldNZWdFc2ZzMlBqMWdxL3VWQndlb1hQMlRmYVgr?=
 =?utf-8?B?U2QrV1Zmbk9nK3R0U2JqejhGbDZtRGlmNm5wSWRabUFPQXNhc1cyRUIzblFy?=
 =?utf-8?B?OEF3NnRiRVRKNURmb1psU0pSSnZEMlVpUThqdkwvUGUzc2lyT1I5UVllRmJq?=
 =?utf-8?B?dWl4aFErUUdneXQxYlozSnZ4bEN3NUw0MkRpeEdmWk5sSURoRXZVMkIyb0xx?=
 =?utf-8?B?WGlzMzBlaFZRVG1kVjUvYkhDL1NMR2hPaFptRkVlYXRWTTBJVWRjSkFLcHlo?=
 =?utf-8?B?OFZrcFhqakg0OUx2NzF2ZGlvcU53b0sySEZFR3VCbHVkVVZGNzVNckRRSFRD?=
 =?utf-8?B?cXNqNkxQRVFORWhtYlY4b3pGOUZKdnp6eXUxMzlpejIzS2pGa3NITFFtc2E2?=
 =?utf-8?B?RnJrVHc2Y05NQWQ4SGhwREljeHJQK2Z2akwyQlFRRitDbkR3NjFwWGFPbTlM?=
 =?utf-8?B?N2ZFemFUcGdJMGVOdFdMRVRXOFo4YVJDWFVCWVhHdS84alcxU3dlY0ExaExM?=
 =?utf-8?B?bWN3cExjcSsxem5rVEZFNFNDeXFNa1poODRFUEhGSll4UmZ6MUd1bVl3aURK?=
 =?utf-8?B?QnBRSm5lb1hySS9ZQWp1M29nbmN6RjJpc2FFSWlPMGdlUHA0bHNuL2Y2cTFC?=
 =?utf-8?B?MlBmZWswcW9LeVlQMHQxdzI2bW9DcnVEaEltOXBMTTdaWnJxWnBPTkV5Skdy?=
 =?utf-8?B?ZHYwZWZnbS93VjZIUVd0QUY0ck01SDc3RG9UNXNaSS9LV3o2RERBY0xxOHNT?=
 =?utf-8?B?MVpHV1dsVTF1VkZ0cmtTZHpnUHoybjZuZTh2WVRJYjZnR3VSOEtUc0F3NWc5?=
 =?utf-8?B?Y25lbWpENE91ekNVUllrZnpFSnp2SnpsaW51eHFZOEs2bjZpVEgrNE52NzVL?=
 =?utf-8?B?aDlIYmoybUFYSHpLU09ORWRHSFg0aUZHc1FoUDBpNDdKZFo0UnRCOFJPbHNY?=
 =?utf-8?B?d3JSNENrdEsvc2Zpd21tRFB1VUFhSDZSaWVEOWxzVmx1RDBSNjNyV0s1TWVD?=
 =?utf-8?B?RVlzMFh3a3BNeHZIKys1Y084MnBRb3EvYW93YldzcU9zODREYXl3dVNmMnky?=
 =?utf-8?B?Y3JKaHZlY04wV1Y4Qk4wVVZYQkdkWm5qWVJEVnhMa0ZkUVhSblBqVFpqWnd5?=
 =?utf-8?B?THlxNUNsWjBtSElSWnVsSFZRT0ZJOVZnWkVhOHhEQTRXb3lOK2dsL1pSRVJR?=
 =?utf-8?B?VTZEWStOQTcwRU1MWHFBT2ZhS2lHLzZIOE1KMGs1aG9NRjljcCtVYXFNSlg0?=
 =?utf-8?B?T2t3TExsb0ovaktQeXJsc3BVVHZtdHRBM1JGRDM2VCs5NDZiZktYaVN5WlNE?=
 =?utf-8?B?QU1ERmhkYzFpNW1BdEtSNFJLSVdyRzFldEF2QUY4S1o5WHNoZ1dPUkhCZ003?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdce169-9d7c-4da6-509c-08db2e91eaae
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 07:07:24.8298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwCinGntKbfI1EgLZIt3C1yNmzuYz7f6Pjxaj9a+hh9G7ZbSW67n4fN0/MNutiFG+MAg4DT1sRSGFUpmO8EZRNbq+7wSJ5rNKw8CkODu9a0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6035
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
Cc: "justonli@chromium.org" <justonli@chromium.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lahtinen,
 Joonas" <joonas.lahtinen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/03/2023 14:18, Rodrigo Vivi wrote:
> On Sat, Mar 25, 2023 at 02:19:21AM -0400, Teres Alexis, Alan Previn wrote:
>> alan:snip
>>
>> @@ -353,8 +367,20 @@ int intel_pxp_start(struct intel_pxp *pxp)
>> alan:snip
>>>> +	if (HAS_ENGINE(pxp->ctrl_gt, GSC0)) {
>>>> +		/*
>>>> +		 * GSC-fw loading, GSC-proxy init (requiring an mei component driver) and
>>>> +		 * HuC-fw loading must all occur first before we start requesting for PXP
>>>> +		 * sessions. Checking HuC authentication (the last dependency)  will suffice.
>>>> +		 * Let's use a much larger 8 second timeout considering all the types of
>>>> +		 * dependencies prior to that.
>>>> +		 */
>>>> +		if (wait_for(intel_huc_is_authenticated(&pxp->ctrl_gt->uc.huc), 8000))
>>> This big timeout needs an ack from userspace drivers, as intel_pxp_start
>>> is called during context creation and the current way to query if the
>>> feature is supported is to create a protected context. Unfortunately, we
>>> do need to wait to confirm that PXP is available (although in most cases
>>> it shouldn't take even close to 8 secs), because until everything is
>>> setup we're not sure if things will work as expected. I see 2 potential
>>> mitigations in case the timeout doesn't work as-is:
>>>
>>> 1) we return -EAGAIN (or another dedicated error code) to userspace if
>>> the prerequisite steps aren't done yet. This would indicate that the
>>> feature is there, but that we haven't completed the setup yet. The
>>> caller can then decide if they want to retry immediately or later. Pro:
>>> more flexibility for userspace; Cons: new interface return code.
>>>
>>> 2) we add a getparam to say if PXP is supported in HW and the support is
>>> compiled in i915. Userspace can query this as a way to check the feature
>>> support and only create the context if they actually need it for PXP
>>> operations. Pro: simpler kernel implementation; Cons: new getparam, plus
>>> even if the getparam returns true the pxp_start could later fail, so
>>> userspace needs to handle that case.
>>>
>> alan: I've cc'd Rodrigo, Joonas and Lionel. Folks - what are your thoughts on above issue?
>> Recap: On MTL, only when creating a GEM Protected (PXP) context for the very first time after
>> a driver load, it will be dependent on (1) loading the GSC firmware, (2) GuC loading the HuC
>> firmware and (3) GSC authenticating the HuC fw. But step 3 also depends on additional
>> GSC-proxy-init steps that depend on a new mei-gsc-proxy component driver. I'd used the
>> 8 second number based on offline conversations with Daniele but that is a worse-case.
>> Alternatively, should we change UAPI instead to return -EAGAIN as per Daniele's proposal?
>> I believe we've had the get-param conversation offline recently and the direction was to
>> stick with attempting to create the context as it is normal in 3D UMD when it comes to
>> testing capabilities for other features too.
>>
>> Thoughts?
> I like the option 1 more. This extra return handling won't break compatibility.


I like option 2 better because we have to report support as fast as we 
can when enumerating devices on the system for example.

If I understand correctly, with the get param, most apps won't ever be 
blocking on any PXP stuff if they don't use it.

Only the ones that require protected support might block.


-Lionel



