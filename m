Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C32A7BEB71
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 22:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9897110E2E5;
	Mon,  9 Oct 2023 20:17:52 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6FD10E2E5;
 Mon,  9 Oct 2023 20:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696882669; x=1728418669;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JyWv8neauPE8LnLyda/ChE1N6ADlhzQ5c7hKkQ4+Z2A=;
 b=cv0dtIv0PnGEQy7xk6YY4acCrNZrn0A8ZIAn2GhiNA0GB6Nhp4/9LYaQ
 aG22IMzgCzltTunthHlvcmZqo7iGU6JTTLT0D4fVdQKGKC0zpRp+BNq7q
 Ap4GH66pv7eDNArZS6Zz3pl4iku2Iw0e9Qobc5ipuBH6orO2g3hvyR/bd
 fxSsAHSe3VrVcIsxudxk1oRlK02KHV13UVUO6Tg6Hov7n6+8fEhG3GxGl
 ApouZ1LjE0YAXeg34+z3wLkVLetpyQX3ereBJJUYcThvEGrQkwqo7hvY1
 tPOcpKJqqq4pszJ2twlXERSBSrAO8W5KVCmQyKhMfV/en0zOJ7mTWfbTg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="363592124"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="363592124"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 13:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="876942181"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="876942181"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 13:17:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 13:17:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 13:17:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 13:17:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 13:17:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRK9U8XURJMiifn0PN7UpiifmQ/3efoGwDoFplPqN5meQnVv2g0/vsXwoqgFlL7FLaV0fb6eRzQr5qsMfOvl9qlm9trUj4T+tjaYIPphI2awONF13CmoEG0iroWEzG/1dVpMRaVKoHIwaGikkP2e+LWsl7HNRrawgFrquEpNfNMNkJhXD1Bjlde1EycEeNsxg89QHUEUU4/BzMYW50mxHRB7UXnwpiddXT1hP6eIYy7NxUKZFFTxRi5FSgKel+XBb93V6dvBUBenz3FrK5rS3Rpn1cRvbO1Dsw8H5NflqzKS5Devxz6S+lPlUqkOkfOz3SrVdczUuW1U4W/4TTySwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqoIrmeq80+8ISeQC3bQkLR7d3hNdsgxQngl5EPo10A=;
 b=IlLkLa1wP8yMOsVlgAcFRnMUJtrba+6hX2fs1nQgQdKCMdzcsbQkiT7YjhZbo/swSi0Tkr8euXZUbJKiD1oX7c4Dl1T8BFLph96jhkNmK1ew9tzYYxv1wLF2SIRV0nfbZnA/wxfCulPA+Iet2w2GZAmeCS21YZbawbCjbKH42PGxnjlIG9pMrm2Mr/tPaI95aYmJXMGf8KTqdOsTcgLoqvxwMOVZM1XERxm9jW/HTMXgQc49rtx3oLnOUNBy0ssbjilJqKzSu0BSBqRAlG0JniFZjMPB/SXG2OqQPQwXnUSr37ly48/bDyXrlclQj3z5Ag6IA6LHTV12+y5miYLvzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by IA1PR11MB7942.namprd11.prod.outlook.com (2603:10b6:208:3fa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Mon, 9 Oct
 2023 20:17:41 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::a782:6fec:8d96:27b5%6]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 20:17:41 +0000
Message-ID: <15878423-fa15-4885-a276-bcc1e8d4c851@intel.com>
Date: Mon, 9 Oct 2023 13:17:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gt: More use of GT specific
 print helpers
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20231009183802.673882-1-John.C.Harrison@Intel.com>
 <20231009183802.673882-2-John.C.Harrison@Intel.com>
 <ZSRZjS6YOrOcIEoY@ashyti-mobl2.lan>
 <5246139b-427e-4264-b21b-4562f55bbc45@intel.com>
 <ZSRcYYZrwZ+fatQv@ashyti-mobl2.lan>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZSRcYYZrwZ+fatQv@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0012.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::17) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|IA1PR11MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: 0646f958-76e3-46f1-b1c7-08dbc904c9d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /4yUF2xfpaNuMwpCPTM1B6ku5OPngyZDT7Vd0gtsoTLf1og90RPsrpxvB3NE60Jg+lFAmNtzV+O2idnX3WlJK5Hs+6sVHLsbeaw1EgV6BpahAVEwJnmbvrXMeAMI7m2o/G3gzMZEC3rHPw8PmheXGhqYA2tYA2KiRDuAChnCBnzCjw1a68s6FWqmYjSUsYVGqFgg3tAPeGNZ5VNgsfFaPN4ocCBegr1AfyP24iG9hzNFxiUa1yoBSWm9qo8eCMY2iPBrqLIHIciz7ItsW2UIKUOaJys8Nbfbp7S9J2W1NrsGZqS0UQoBLVeS0U0dfDM3kVed5cT8rutRec5XUbBugNYl6IrYBCft1For0lUzK+/J814+VAVP29gxCToPQKif2cvEjKBNuxRUBixZj3KsviySCcb4ul/X38PGrjIvNivyob0GjkARo3ciWuWoNqIANeRGaattxjaBK1vyfDP6eVSmyfj7fjo/9cGrY820pfzxClA3yWTWKacre2x7o9rHtGGhxfDMhhAU2t3edfUzRYwu02IQTWUYaDE0uWSHoRlgfu6+2ciiE9qF7vDZ6WGzykopxh/jiPnCf89R5wrAwEwG72IxhPp+fHIDZO6JMBMyv/UDPjW6QeE15cwWEa7ZkeTE8X4cvk9C0vUfB3U3Og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(376002)(396003)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(86362001)(36756003)(31696002)(82960400001)(38100700002)(53546011)(2616005)(6512007)(26005)(8936002)(4326008)(6666004)(6506007)(8676002)(6486002)(5660300002)(41300700001)(2906002)(83380400001)(66946007)(66556008)(316002)(6916009)(66476007)(31686004)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QncxcnJOQi8vNjd2OWNETytkU0JkMFMxbzR2RkhzQ2tWTlE5c0o5OFgyNWR2?=
 =?utf-8?B?TlhNdTR1cVJMMVNiZk5xNHBpbzcwYko1M3ByNkROdUlHYmdackVKL2ZtUDM3?=
 =?utf-8?B?L0RyZUJKWHN4WWRyTXdFSFBIKzdXTE81UVY1cmJlMStxMFk4dS9uV3I0RDZM?=
 =?utf-8?B?TGowaGlVU0pXc25BMGthb3V2cVJJVzRXeGZITGxOMjMxWWlacjU5VnJEc1dh?=
 =?utf-8?B?L3g1SldabU9NcG9wTWl5ZWgzbGxiY2NsL3I1eHk4ellEWTJWWXdDSXd1L3dH?=
 =?utf-8?B?WUlxNDJaWjkzWHlaVXVIQUZ3NitPdWlCd05JVEJQZ21PVVJGbHlCbi90cnZH?=
 =?utf-8?B?eThZMjJ6YWhjb0pUZnlNZ0VaYW9pWlVaYzBVUjhUQk9pV0pJcnRkVGF5SGdV?=
 =?utf-8?B?RW1vUEVGVkZKWm5Ya1ZEd3ZyRGJPSEo4ZVRoQjVMeDdJR1ZTUld5ZGRlK2RY?=
 =?utf-8?B?ZmsycVMxbkZGeUF3VVh6MmIvOEFoSUJ6S1pCWndNVTUrL3RzSVpRazBZeEhX?=
 =?utf-8?B?aVVzVkVhWDlDd0dVcGRYNjZ3WXh5b0FHYVo3VmdsVmNqYmR1MU9SVHgwaU8w?=
 =?utf-8?B?ZWJLaTNWd0JocW5CcGt0Mk9hajZpc29TeFl6REExaFVkOGZpbkV5cVA3dWxN?=
 =?utf-8?B?YTFNZGk4RlZHYzRJZ1pvbkgxcnBmOWVPMStyMDVjNmExNlloK204NnB3ZHJP?=
 =?utf-8?B?SDd0VVd4OUg3REFjTitiV3U2dVFkWHdRSDUxT1EvVHZqOTA1WC9mZm1NKzk3?=
 =?utf-8?B?akFmS25ZOGJUdHFLSGtUZHJpV2ZvSmJVSFRvUi9UU2dQS0JLa0YveFlzZkR1?=
 =?utf-8?B?WHZ1N2xpOUtsbTZ2MktLcDZwU01hQmcyK05pU2ZJZGNMUW5KVm02cCtBZWpP?=
 =?utf-8?B?TzhaVUU3NVI3ZTkzR1J3TFFvWDA0RVBqMVhxOTErZVZsbFhLM0xWL1hyNnRB?=
 =?utf-8?B?WFQvM0NiRlBnMG5MM2ZYd0hDUGZBS1JvU2UzWVFuTEdhWmZTQXBQVWt6cVFt?=
 =?utf-8?B?WVdUcDJ6ZG9GV0locHlINnBTY09jUFc4RUVoN2RkZFVqUm5wVjBwV05LUHRi?=
 =?utf-8?B?QlBDR0pjRFl1MUNrWmUyaDNCWGVOaTRoS09LemtXNW1mYTJSTkliL3pubHcy?=
 =?utf-8?B?WS9xTFlKL1F1cmdBME5OcW96eDhhamFGbWlJZDFnNVoxQmJkSzN5QmlaVVBt?=
 =?utf-8?B?Nk1Vb3Z4bzBJMWhSUjRONVNsbHNLWVI0b2wyeDlIMU1UcGNpU2hJeHJYQzJq?=
 =?utf-8?B?RkcrbWVmMUUxcVVHRFlkNGpHL1lJK2FhWmVoalIvTHhYcG5vWDYzS0VVYXpB?=
 =?utf-8?B?UW9rVmdLem93Z2ptdGpydUNTdmVGSUhhYWZ6aDY4VW1pQXpaS2V3QURHWG1t?=
 =?utf-8?B?RmVvMURrbEsxUmFvQXVoMlE5RWUvUnh5ZXdadm13UjJML2V5NmNwTkduWVVm?=
 =?utf-8?B?Zk9URUJNbTRPT3BJY3oxc1NXekxxb3FtSGJVejVIc2tnVDlabi9pd21uTlVk?=
 =?utf-8?B?OXBBckNYMzYxOVZRS2Z3K0E0NFNqR2JlU2tMWjhpWE5aUUF1bkpPYzFneXo2?=
 =?utf-8?B?SHQ0R0FaZTVzaVk1aTcxZWtoVmV5S0tHZmtYK2lvSGt6UkRFd2M3Y3JWUHZn?=
 =?utf-8?B?TmY0R090QngvbFU2SkJERWRER3VOc0JFM2E3bEIrYWhyMVUxYVIyQWVQNjNs?=
 =?utf-8?B?Q3hpOW1VN2NkTU12dFkrY0pRMXVaZjFGZ0psUURrVERkNTRrSGxtdkswVURD?=
 =?utf-8?B?eGZlMzV1WjUyUkJLVWtTZ1pKK0dJN3ROcWZXZHpLYU5XV2FNMVlrSEd2cWV1?=
 =?utf-8?B?clMvVUxYUmlxdmE1S2dRR2x0ekJ6UGxCc2UxanpzUFRnMHRmZTR5eURhaDgy?=
 =?utf-8?B?dCtIMXBwTW9KV2Q5NElieVVXRExISThlLytYVVF4NDRWK2JEWEJ6RDZ0a0hv?=
 =?utf-8?B?OUpVcE9PeGtxWkxvZ1I5YzY0aG5YZGRLL3J6UmEvc2dmSGJTVlFIa295UGhs?=
 =?utf-8?B?L1kvQU53ZEQ4a2p1ZjJCMHNrcTYydFRoTlVZeStmMVZsR01ONzdKRFdCT2Ra?=
 =?utf-8?B?SmwzcmZBbWpDZE5vb0xVMUNRMTJjNThlMkRyT2U3ditCT2RzUk1RKzRGeHdB?=
 =?utf-8?B?eWY0NG5PakhPSG1QZklsb1dSby9kcDVjYmE4SGJMVmMydnpJOXVpdmZMSDVo?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0646f958-76e3-46f1-b1c7-08dbc904c9d7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 20:17:40.7544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVGeY0ZKkKsmvUPyyt7pEAOi0RAsYj/l9BFV50Jt0N5vCKeVRVko4B3LIPl+7ycW8hrrz+dQ3RbSMZWByrpmyLFO+HqbJCyNdNVGafZWneI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7942
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/9/2023 13:02, Andi Shyti wrote:
> Hi John,
>
> ...
>
>>>>    	if (intf_id >= INTEL_GSC_NUM_INTERFACES) {
>>>> -		drm_warn_once(&gt->i915->drm, "GSC irq: intf_id %d is out of range", intf_id);
>>>> +		gt_warn_once(gt, "GSC irq: intf_id %d is out of range", intf_id);
>>>>    		return;
>>>>    	}
>>>>    	if (!HAS_HECI_GSC(gt->i915)) {
>>>> -		drm_warn_once(&gt->i915->drm, "GSC irq: not supported");
>>>> +		gt_warn_once(gt, "GSC irq: not supported");
>>>>    		return;
>>>>    	}
>>>> @@ -300,7 +301,7 @@ static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
>>>>    	ret = generic_handle_irq(gt->gsc.intf[intf_id].irq);
>>>>    	if (ret)
>>>> -		drm_err_ratelimited(&gt->i915->drm, "error handling GSC irq: %d\n", ret);
>>>> +		gt_err_ratelimited(gt, "error handling GSC irq: %d\n", ret);
>>>>    }
>>>>    void intel_gsc_irq_handler(struct intel_gt *gt, u32 iir)
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_print.h b/drivers/gpu/drm/i915/gt/intel_gt_print.h
>>>> index 55a336a9ff061..7fdc78c79273e 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_print.h
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_print.h
>>>> @@ -16,6 +16,9 @@
>>>>    #define gt_warn(_gt, _fmt, ...) \
>>>>    	drm_warn(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>>>> +#define gt_warn_once(_gt, _fmt, ...) \
>>>> +	drm_warn_once(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>>>> +
>>> I would add the gt_warn_once() part in a different patch.
>> But this is the patch that uses it. You should not add dead code. The only
>> exception being if it is something large and complex that needs to be added
>> in stages for ease of code review. But this really doesn't count as large or
>> complex!
> I wouldn't call it dead code if it's used right after... you
> could also put all the *_warn_* changes in different patch.
I did start splitting it into errors vs debugs but then decided it 
wasn't worth the effort ;)

>
> Anyway, I don't have a strong opinion for such a straight forward
> patch, so that I'm fine with it as it is:
>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Thanks :).

>
> Andi

