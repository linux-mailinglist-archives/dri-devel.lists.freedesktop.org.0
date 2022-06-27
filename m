Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B2955BC60
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 00:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5D010E370;
	Mon, 27 Jun 2022 22:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B07410E370;
 Mon, 27 Jun 2022 22:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656370339; x=1687906339;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2v2LeH6CazF1L//vvNOqAq4DyrMYNgm4ZnuXCgvSfzc=;
 b=a8WHDjZjEya/Iv/xa5G87pyW4SqR9sleJGKP1C7of01EH2A8hcXyng5h
 xMMkR5hc4uNG92AfC4QyI+Df+GKmEqKpr/8GIbKeJhiSiJr6R4tb3zEBx
 qDZOGnHjvUhUMlEyHAv1D0TRWmr1AIgZrQHaJvthQdJBbg2ISHFdZoLQK
 EN0v9Udbzf7v0sUhWgKIyVTJ2dTSxpKwGPR9EsuoknZn6LSEtYgnAFbG1
 GIkvZJbHAJNoUvZa41/MaDXQ7biViZkP3g1L3jBElWQjvEAPuQCupcx95
 jkD+WW3cVtxsc0tpMV3uuKUCfz5qk/NAiUODssEyLdcAZbXhWHQkk0LNC w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="282315056"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="282315056"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 15:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="692822952"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga002.fm.intel.com with ESMTP; 27 Jun 2022 15:52:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 15:52:18 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 15:52:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 27 Jun 2022 15:52:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 27 Jun 2022 15:52:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9tTmvczu0NhUcilhCCZUzE3pbpoVVaIsnPUbRM3Hm6LwexLCopvjR0Xu1zPwurXb1j6Dqets9fpwdDao/1UYQ+hFaktMqFRxrrIAHb9a9ceaGy/z1vxumByG9WbNt45DDWlAq8YTSG2MP/HPbCBgMYyKiidblybZ2dOOTNm0X8H3wx+b38FJtQBDCANLS60rWvvP0rjXM7GF46Fg3lBvsUHpyJUJ/gvWP6VFpTsusw6OTOd75lJtJHGs5Cp9UoYVDWMBJQzPo4tP68HJeylRHkXiTRQNaVYjZVHL5mDbscD3JHAGMFEIpd9NCcbfcAF8FdKH4NbaxduoEzSlwOHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZ90ZTDmPj9QetHyN2QAxLwZd7F6mD9mj8zWw/tUnac=;
 b=D2GVostdO1PaRNDAyeiVtv4M7uhCCvGTiQ1nbnoFi1DpRTImI6jCjJUluYBtpcFmLqQo8fV5ctmr29jz3mk0DWhZIFUxJgBarnUcVurFZXmLkr3EgitR5AesWi29JMDQ++HS1diYKRPaVCx0McIrns0twLLmzGENRHSuabjTiRNr3j8ij/LEDGFS5Puo6ojZsj24qcIecK8SQOjWIQ9f27kbLFQN96Vp76BBGt8MfhZhVAZmSr+D4MomOjGrL/0UKzQwFoNeYOzr3JAEA7PK0+kBhRQASzHoyODeqCs18qrKbB7tanmI+aCIIdddo18+kjKLwSwQ0IXCj0V7XxTNRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.17; Mon, 27 Jun 2022 22:52:15 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f440:6688:c682:21e7]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::f440:6688:c682:21e7%2]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 22:52:15 +0000
Message-ID: <a309b7f8-a1ba-d5b7-a3cf-00a379808c39@intel.com>
Date: Mon, 27 Jun 2022 15:52:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/i915/guc/slpc: Add a new SLPC selftest
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20220623233320.11041-1-vinay.belgaumkar@intel.com>
 <87k0958kb9.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87k0958kb9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0072.namprd05.prod.outlook.com
 (2603:10b6:a03:332::17) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30d3a5cb-1de2-47a9-fdb0-08da588fae4d
X-MS-TrafficTypeDiagnostic: DM6PR11MB4074:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oxljno636H9JluzM8h4xtaBtX2FjZQY2HEOOUEZknbrqzTd7Rd1thusueghuJ2JdpqAT3CGgcfnoJd3pbFbnvmYP3k2tbFPzlRd8T43cYbqwdP51wi4NBZ6sH0bXyO+Q2GQMbCu0rbfZb4Aa6Jmat412L2EJoW33jzqC2+KhRSDdulalWhPYmJCY6LDWSYMNRAbRxVjhLCk8XmXRE5Lpz4++MswUbVciIw+vT/JdpjMgn0OT3jWm8JOeKLs1cUwxmrXqvtFaEmATR8e71jxqkQh8ueYO66xg6d3lgAayTEXR/nyGBpS3WDjnILYk7qoaHIAVUIBIaXLV8B5StqBC6Yb3YFM+IGh91B1EUjdtEkaAcY+zqMvSq0dZlf06UwLtX6HfvtZAGl8OONoanlicVVH1RlZrt9hVMRkjB4KgRjo4mJ0V2IemJivjZYfnbaNONWdgsFcToBHEU3Zv6lSPqBDAdhpHdc9/H9ohBcq3/CsfnHPWGfSueH7/clFUpvMJTVYX9Z5sAsKsUGDVzN9v6SbAugmyIJ7Kb8wbbJugacbYYrf28FeEbtzT0yI0yLrpw2hv1UXT3hRC3KicZFAbYm8SqceEVBNXBI1G6aCZGMB7F8+y/kxFPQzfjxEJJm9geIX7+CqsIo/mrZ1Jh0FetGWE3jmNsHQCzToioVWU27RB733qjuPdQdx9GcfpPECIupgyp9b0/whbbrqvMBp2rMN6DBKhx8BEQ0etmqmyU+qHfHYEDKvLyy/eDp9fKt/GBG0rA4lEimO7AntabklOBqwmAJIzuPaNETwQ9IlTJDuRIfPdACGTukTiflQJX807D5/g+x326XWpWG3/mY5jwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(396003)(39860400002)(136003)(346002)(6506007)(36756003)(53546011)(82960400001)(86362001)(8936002)(186003)(66556008)(6862004)(5660300002)(26005)(31686004)(6512007)(66476007)(450100002)(38100700002)(83380400001)(37006003)(4326008)(6636002)(41300700001)(478600001)(2616005)(66946007)(31696002)(8676002)(2906002)(6486002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVM0eVVmWXBzUnVGOGN1WldiZXBjeWQxYit4b0JuTTBGR25ZYXZuQkR2Z0xV?=
 =?utf-8?B?TWV1Nmt4b1FxK3h2QjQ2K2RYNStWL0pSeFRaOUYrN0VSMi9na3JQL1NHZVla?=
 =?utf-8?B?Qm81aHMrbThiRDBSQ3FYM0lnSEp3WlUxZ3lUQ25aUFc5cjhSNmt3ZmJnVC9Y?=
 =?utf-8?B?eDYxUVNXazlpT0xhcDFQaURUdzVqTmo4ZHhQQk1FUEIxcEoyYXdJMm9qMG9E?=
 =?utf-8?B?M244bjEwRmt1OGJGMVZZc3Z4bm5hVnlMcTdOVTFXRkhXblpUdlVwR2F3MDdN?=
 =?utf-8?B?YXdJRkQ2VWFZSDRkYnlUeFhOWnR1NzFoVzlER1A5SUJzL2FtM1VXeU5weHpL?=
 =?utf-8?B?TEU5Nm1yTkFpVVM2eVorV3FRZGpNZEtNVThKM3Z1bXRxbTFGT21BTklsWDJ2?=
 =?utf-8?B?RXRHUlllTlVlMTNQQXk0NXNmbWd2MjlYSmVsVlVsVTVnM0xRNE8vaU01ME1U?=
 =?utf-8?B?VWc2dVR6c1FpTzF6aUR3R3lJWkxHSk9BeHhyTUFMVUcweGdKVHF2dEFiM3Na?=
 =?utf-8?B?RlAzaGtPUUo4dDd0dUFWaGs5VUtNWDFtR2RoOU1FWUoxVDYvQ0M3cDBUelBL?=
 =?utf-8?B?NzRZazR4S3oyaGZCV1hpLzFiZ0U0NkdmVEJGR3h6Y1F5clhCZ043eUw1a0Nk?=
 =?utf-8?B?QW9IaXN2VGxScm1YUWs2Rk1JVEpEQVlhQ1V6WXNyZFJkN0RZMjhUd20wNytO?=
 =?utf-8?B?SmppaHd4V1V4MnYrVVV0MTVTQzZ2TSs0ZzkxY0o5eHVGb1kybTRZZ0lOcXJO?=
 =?utf-8?B?ZUdOQWMrT29uaHc5Z0p5OEhhSGJadW1mSCt0ZVlrVWRTVVNVRVo4YjFPOGVH?=
 =?utf-8?B?S0VQTDVrRlYrdUM3TUE2Z3BPc2MzZnJ0eS9aV28vVWxJdzBrbC9VaHN3WS8x?=
 =?utf-8?B?NWdQaWpyb3dsMVQ0S0lqTS9odXBRQTFDU2luWHd0SGNGQzNQT0lBWmVaZVdF?=
 =?utf-8?B?N2krSjhPRDNkYlFiWWg4ZWdrWUJaTWsrVW1reTR3UlFISzhzTm96bHREbnRN?=
 =?utf-8?B?MUlZd2RocGFsUkkvUklhM1BPT1VzYkJoZVRXYzJ4c0JRTG1LWE1VM3g5eTZy?=
 =?utf-8?B?T29kNUk5K0VlWjkxN3d5cXAvd29UQWswdzRaRHdKd3Y1N0VoOXhYeFYvNDlp?=
 =?utf-8?B?SWE0dWN3SWpRenYwaDNQb1lXYVNHdW84Qm5OYUplMGpmZW15VGdXNXdodGEx?=
 =?utf-8?B?TmdkeVFCNDJTN05wdHlGQnk3ekM3K0JVSjNyS2JBYzVMclBKUlJVTVZzVjNR?=
 =?utf-8?B?SWV1SGovbmdua1hmRUd3YVVUb1h0N3JiYWs0V25SU09IbjZxUDZwamEydXJC?=
 =?utf-8?B?bHJBSDU5dXFlai9WZzQrYWM2ZC9pTDZnTi8xSGJKSmhkdXVhcW1Uc2JQenFk?=
 =?utf-8?B?dXlaSDVZTzBhMUZBWE1pSDNHcFBMWGRVeVRGOXBraXFJcTl5cWh6SmM0a1Zm?=
 =?utf-8?B?TjYzczhZRHpvbTFPVGZnTTRrdkZCWkJuM2MxV3FpV0syRWZCbkNhSWJCNWxj?=
 =?utf-8?B?ZHV0VWU4SHpoMHNseGkvUWk1cG1ia2VrZHlCMGhad3FZSENvS3lZV0lBeEJp?=
 =?utf-8?B?VXBQay9LS2E5b3dMR0RNOHJIdFJJeXc3OEVBOUhFeXBRdFltR3RPbERPR1o0?=
 =?utf-8?B?b3NQRlZZU0hYdUZwR3A2UGtGVjl0Q0I2aGo1VmJJQjlxc0hxSm8xK1o1cHlj?=
 =?utf-8?B?U1hSN2FmTkt6b1I0SzNjbkhialZKOXFHczVrWUNXaEMwS2t4LytxZ0FWUnBa?=
 =?utf-8?B?TGoxV0l4UnhITDdUNTNhMWJjd0Fpak5USWNZd2FDaDg0VUZmTnVYM2tMT0dn?=
 =?utf-8?B?VWg3OG9pTVVxSXRjMjNQWmtabDJxY3Zraldub21adkJVYWQ0TUI3RUJTcmFj?=
 =?utf-8?B?TTY5ZnNERkxXMEI3RklKeU5jTFNvalpLY2xuVEExMWJ3Z2JscTVYTE1EQVdM?=
 =?utf-8?B?S1h2V2FsOEFzRm5HL2FUYnI0MGJhS3FmWFc5Tk52RTBQYnVyREMxbWRCVHpp?=
 =?utf-8?B?eE5WcDBkRWNUbnIxRUlPZmJjU1RUVWdrSUx4d2RTdFN1S29kWHVSUnZyYjdY?=
 =?utf-8?B?YUZ5SjZRSVVYU2dHb1czMUpId1lzbWw2cEJZVURtL2hvTjlWeGFKZm5yR0Iw?=
 =?utf-8?B?eE9XMHBYakpTZkJKanpPbXJlOGtxNWVMYWR2RFJWNjBsUUtjY0E5bE1WbmZa?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d3a5cb-1de2-47a9-fdb0-08da588fae4d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 22:52:15.5823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3SJ3tQisxd1rh1vcXvuTLYE2zgwVA2C71gjt9DLdqo1KxEupU15rPiyjbxYyBVGYo9mRh6rCEDZ1RkIA5TZPiv6QhDkA2e1PiqxzUK6Wl4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4074
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


On 6/24/2022 8:59 PM, Dixit, Ashutosh wrote:
> On Thu, 23 Jun 2022 16:33:20 -0700, Vinay Belgaumkar wrote:
>> +static int max_granted_freq(struct intel_guc_slpc *slpc, struct intel_rps *rps, u32 *max_act_freq)
>> +{
>> +	struct intel_gt *gt = rps_to_gt(rps);
>> +	u32 perf_limit_reasons;
>> +	int err = 0;
>>
>> -			igt_spinner_end(&spin);
>> -			st_engine_heartbeat_enable(engine);
>> -		}
>> +	err = slpc_set_min_freq(slpc, slpc->rp0_freq);
>> +	if (err)
>> +		return err;
>>
>> -		pr_info("Max actual frequency for %s was %d\n",
>> -			engine->name, max_act_freq);
>> +	*max_act_freq =  intel_rps_read_actual_frequency(rps);
>> +	if (!(*max_act_freq == slpc->rp0_freq)) {
> nit but '*max_act_freq != slpc->rp0_freq'
ok.
>
>
>> +		/* Check if there was some throttling by pcode */
>> +		perf_limit_reasons = intel_uncore_read(gt->uncore, GT0_PERF_LIMIT_REASONS);
>>
>> -		/* Actual frequency should rise above min */
>> -		if (max_act_freq == slpc_min_freq) {
>> -			pr_err("Actual freq did not rise above min\n");
>> +		/* If not, this is an error */
>> +		if (!(perf_limit_reasons && GT0_PERF_LIMIT_REASONS_MASK)) {
> Still wrong, should be & not &&
yup, third time's the charm.
>
>> +			pr_err("Pcode did not grant max freq\n");
>> 			err = -EINVAL;
>> -		}
>> +		} else {
>> +			pr_info("Pcode throttled frequency 0x%x\n", perf_limit_reasons);
> Another question, why are we using pr_err/info here rather than
> drm_err/info? pr_err/info is ok for mock selftests since there is no drm
> device but that is not the case here, I think this is done in other
> selftests too but maybe fix this as well if we are making so many changes
> here? Anyway can do later too.
>
> So let's settle issues in v2 thread first.

Thanks,

Vinay.

>
> Thanks.
> --
> Ashutosh
