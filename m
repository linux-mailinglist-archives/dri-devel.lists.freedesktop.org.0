Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278A25F6F04
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 22:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E131410E89E;
	Thu,  6 Oct 2022 20:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1C510E89C;
 Thu,  6 Oct 2022 20:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665087950; x=1696623950;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jyHEhT4cl+/+W4CV+3PnV5G3uEKHXrW53gg73lJOm7o=;
 b=Ly0iGCaWiRtpQHuOq55/YpG7fMOn9Oco93yv25wUEfFslZSsYLH7lmLd
 XwnPiToUCK7hB35yri4VvH0N+u2jeo15Iov458heByDhW1OtYxKFH80pW
 zvwOoH4v2T4OEBqE0NY8gKBlQWPI2RBrw/n/W3NOVpRpndItbGIEOUeDt
 Hcyf50fryr5EwLeSgSWNlXY7//HUXouequfndrmzznvLZ3ySeA7tDWxbZ
 dryVDiRE9h4rq3ffo2UhpXkA4DO0LxDJdZEPNGW3GoKrM7+V19ZzJegyv
 wdMfYAmgFjjSOvyrkJByE9aDUJQb/KlfPLgPHD2RomFs/waoywv0RrKYb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="365503438"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="365503438"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 13:25:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="693502073"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="693502073"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 06 Oct 2022 13:24:54 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 6 Oct 2022 13:24:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 6 Oct 2022 13:24:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 6 Oct 2022 13:24:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 6 Oct 2022 13:24:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyFePlGlSyNA5FN7pNwcvZMXxCENqE9zMxxReIWseXNcZ7FPXoH4fFVwBoS1+rru2vy5Yx1xl/rB304WTyVFQNxgUOPdNNMzdcndWhd3x43Vf+bD2sTeRj/VQgM9Nb5DTonghj5Dbgj//V4+42v8AJEZvnbKMC4LPDPaP3Hmhb75Tb/Py728lm9OeAv93zFG0iMg80yEEkJvvCAq96iS0z8RYrmNnFkJ1df1A46OrdWCB4uP7C0OaAv/Ncu73GwAEXjo46SW78V5S6bTWW+xQZLQG63EwZx93+UkqL3Iy8jWzHopgysOiPQFVWo+UD+TaKvL2YTRfqjo/11FfCDwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2V573XBzlUvIi38Q11HWAPT9zwnopeDcATizYRJk14=;
 b=cnmkakbmq5iqVdUmJ0ox9kWZ/JPgBnw+wTEH8ZfN1G/lGC0JqoCSVWNnce0zXzx3xJ3uIv8kTkux986KYasfsR9ytWNNJeEPzk1FhIQKqMNDZ5EGlFHB6ycxD/cmQtq3odFKEbqK+qI2p14SXOwinAgHRHPsaAsFtaQAtkFuLtcJDdQZbXbdV7e2idVn1fUgK8ToZcgtgNAytBwe3Ef+szuw2BTVZSgAj8oW+zJEsfcBV3WLQCBSjEkCZsUCOMviy9yfnt08b+u8RJXfR7q7/1PlbYCIcS5njM24vzGNljpfdzloXuFGcH0TnDVCxN5w6OWRqg93fIGKkUs31uJimA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SA1PR11MB7088.namprd11.prod.outlook.com (2603:10b6:806:2b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 6 Oct
 2022 20:24:51 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::7750:dd86:4ef:afc6%7]) with mapi id 15.20.5676.036; Thu, 6 Oct 2022
 20:24:51 +0000
Message-ID: <5066c56c-173b-b1bf-4e55-e05168195125@intel.com>
Date: Thu, 6 Oct 2022 13:24:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915/huc: bump timeout for delayed load
 and reduce print verbosity
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221006172056.1381588-1-daniele.ceraolospurio@intel.com>
 <ab07d4f9-84e9-461e-d9a5-20ea852d30ca@intel.com>
 <d34651c0-f7ef-3cf5-fe30-0ce04163552a@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <d34651c0-f7ef-3cf5-fe30-0ce04163552a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:74::40) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SA1PR11MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f67883d-a278-4731-1909-08daa7d8d259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 56/QVtxMzYW0LXr4F44Mi/Dt7OtGU+uCaa7y4GwEbSzdI/iZATuFyHEu9Enqln1EKw5/YAJW9ZDS9uLnX2/uwChuO3w27fykwA2hmtjNp5yVBEDMWfR8DZ+R3FufQ/ftUd4nFfXwn2gylniv9GoZ1OEI4soU/r9wUz6sut3wDYUkMomqL8EJWELULv1NOIHSqwb7yzfmALdt54xU/6A+XjDkJ2gT7+fXNlbNiYT2Y3fZULvc7Da+CHKMGjCeZEiWZi4pFrVwevSKBsCLovSDGgXMPq4MXl7qGddbCXE1OoWWFlSaPvYbJ18WtiuOweiRHhGMng3XjsKb/OpXdSP/q6df9R3dr3vPwYpG3OrkvooypTb0NighlCZKDdJ7X5MI/DMCNblwOBOn1eUf3P53da9JZaAa+6KzQKMT231873lwLIyv+qghhLtXVcYmNQzUEFnPpfIiOF9PIpSxe4xgRPgrkGVmG0+6IjSAg3TPvh8MJlqOfTxnI4i4/R/d3Cd4FZiIIkLtJHBN4L07h7gr8aAZxy4GbsQQDb3lk8AMOuX2/4TUqK8gfaYSQvRB0wcO8jHQ+78bpG6GwamLXW2AEDxG7H/OLUA+Xu9scnVdOWx49v67UYqKBdKjMe5d/pCNECEFR5PQayFd6VPRpKf8jhrFrcRN65JJJFAM89qCpK5ALvQ1H9E3EdsAztJr914DDbeXRFsuu5MF9n5GVfqVkU7pFxGynWsbT8zdvgl1RGrJqz9R4IwFbD13yTuMX3J/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199015)(31686004)(2616005)(186003)(6512007)(53546011)(83380400001)(6506007)(26005)(450100002)(478600001)(966005)(6486002)(5660300002)(86362001)(8936002)(31696002)(66946007)(66556008)(38100700002)(316002)(36756003)(66476007)(2906002)(4326008)(8676002)(41300700001)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjJ0TEJXc0UyQXgwVTFJR1ZUaGg2cHdmOERqTDRXbFpTWXZJNlc2eU5aM0FS?=
 =?utf-8?B?Ly9HeHZ4VnN0STFBSlZCRXVTVFdhVVphTU9TYjRJMjBZTzZJdElZNFREZmV2?=
 =?utf-8?B?dE5wYVRYWXl1b0pnWFhLOHJKVlpLa2V1bThGcDVIcjlpK1VNWFo1TUNoVnl3?=
 =?utf-8?B?MzFkdmFrOTRacDhNR1JwNXVwUjlzelRPaEF6d2IxaUQ2SE1ZRTQ1ZldESnha?=
 =?utf-8?B?ajh3U2wrR0ZoOTBaRFlqZWlIaklsbGxCb2VIbTlnNWJ6TlJDaXRaMVRqYy9r?=
 =?utf-8?B?S1VMN2QvdUVQOVB0RkVubnJsMDNwL0hmdW9zOVJrWG9QTFdXcjFwWXNRZVNV?=
 =?utf-8?B?VzRZbE1vUjhCSTcveCtNQ21tTC9ZZFpHK05GWmIxSEZxT0lpTUowQ1JBRzNL?=
 =?utf-8?B?b0xKUnFzRDlucEhsSjZGejlhRzNHYVVzcW9iTVZ6UWNTQjFqejFUWHg0SC83?=
 =?utf-8?B?d3ZWa3JmdThBSnZGVTBUN0NLMHRsclpXSHA1SlhOTmJ0OGFpVzVlSWZTa0Fo?=
 =?utf-8?B?UXNRQjVCSisrb1ZWRUxpemVjdjlqaFFaWURoTWRCYVdmZVpsZDRGUWNqWGk0?=
 =?utf-8?B?ZWxZaHFHeWNKMWFnTWNLNnZhVGJWMnMvc0I1RHVFT2U0ekdVUzRtd3dvaXlj?=
 =?utf-8?B?SVRYQldQeHZwZXVmRXg0YUgvSnNpTVNKdHJNWERTVEcxeTh4TlkvWnRuK3hw?=
 =?utf-8?B?aVRvUlRlcEJIdHUzNDJqb1ZvSHh0V2g1T1B1N0twaHlKR29SRWd1SmZhYTEv?=
 =?utf-8?B?MUhkVVgweWJWKzFsSHRveTQzR1did2djZVhXUHRDM05mMHF0VXBWZEZaQkkz?=
 =?utf-8?B?Y1gyKzNkbTlHR1BkZkszUk5zU3ZsdTJjQytuREJlNVVYWjVUbXFXN0xBRnlZ?=
 =?utf-8?B?Z1ljNWZtaW9HN25Nc0N2eFJGMFlHaUdlWHRaKzFDWnR2QTIyeDhtU0x2em9r?=
 =?utf-8?B?RXJOK25HT3UzV1ZSbDIraXhqRXlwN2labHhGcVF2ZlI0a1VvMjlwL2ZtSVR6?=
 =?utf-8?B?ODhEc3FFSnczK0JqbFdlWnIrYVNtRkpxcEJIRFNPb2JVUEowNjdDTTdPOCto?=
 =?utf-8?B?dGtZenVqNmpJaTVFYStkRnF4NktZL1MyZStIemxVd0RBUVFYZ3VpSkVUQ0hj?=
 =?utf-8?B?NWpoL0FuYjNTV2t2VTFDUHM5WStDOU9lSExVQlRxQzJScXVBTTVPZkFLdTlj?=
 =?utf-8?B?V3JnT0tzWmFNS1MrMG1RZTZHeHFoTnZBeEhUclArK1l0Mlg5QU13RFhNck1q?=
 =?utf-8?B?cXc3dVFOSVVGT3lGd0pIZHJZVFI5NXJ3TS9tUHZ4aFZ0TW53R0tIaDAvTE1K?=
 =?utf-8?B?TCtNQU9qcWJpYnM2aXlEWDliRmo0aDRzL2N6eWtWanFBTDVrUnVLVTlibTFv?=
 =?utf-8?B?d3FVQlA3SUpLcmVRNkxlZFdxeFgzcUVwOVRURGlydC9mZkcwaksveUhncFpB?=
 =?utf-8?B?NUNLSE9ET085N1hkR0NoTWVMR3VVZHdhc1pBK3dBU2VjRUxIT2YyREc1UTEx?=
 =?utf-8?B?b0p4OFFFNmRDWmcrY3RaRnI1Ym9qUmhOSEVYbDZQcjdXNmxiVk93Z3U5Wkxl?=
 =?utf-8?B?eWI0VTREUVBKaVdhbTNBMmc5WWlndTNGVVM4VUtnYXZjbk9jTjJaRUJ6UWpN?=
 =?utf-8?B?Tm9iSlNXNlhIVHZZNWluYXRscXU5YkVTRmQ1aFJlZzl1eFBUSU11eEhnYmZG?=
 =?utf-8?B?M0hZcVgxZy9RTFNlY1BjaWxvTW5MdWVPd0pBdyswb1BBRThsTkpTNGw2Q0s3?=
 =?utf-8?B?Z0dUTDk4WkFDY0phUHVsZE4zWEkvaWxGZU9ubzM2aVN6aWFYckw1NXRHV2Fj?=
 =?utf-8?B?enFKODJGWHBKTHFydi9YUmVMU3NSU1RuZzBSbUFGcWl3cjV0WTd4VHF3WDVQ?=
 =?utf-8?B?M01weS9KcDZNSTRXakR3MEVuNGZSeUJYeEdLVWpHbDNYL25oeHBGbWJoV1hD?=
 =?utf-8?B?aTlHNkFndlFBZE44SnF3MDRjQVNHdEhZZGlUWUdkL2U3dFhhTXVXVVZNd0tW?=
 =?utf-8?B?V0lGRkpnYnNwL2hHY1R0b0dDckRrSVdrTWxmeDRpKzlCcVlOS3NWVnd5clE1?=
 =?utf-8?B?UXJ5S2VhYklQWnc3T3hKU1ZiZExwNXRydkRIbzRqVys5WWtqN25GR0pwS255?=
 =?utf-8?B?VEZ6a096dU1mVnYxNDBNUUg2UW81VjJ6R0F5SzE1elhlelEwYStHTy9jZVdS?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f67883d-a278-4731-1909-08daa7d8d259
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 20:24:51.1112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsVSyRIytz7c0cyywawX6XtgV8KJaH5XmoWVpwuYalP/6U1TMo+1EDQq+fEnKd7LZ12ef5pGRg1ofmX493+H/KxwV1qzv48aeqr2eR09QdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7088
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/6/2022 13:16, Ceraolo Spurio, Daniele wrote:
> On 10/6/2022 1:09 PM, John Harrison wrote:
>> On 10/6/2022 10:20, Daniele Ceraolo Spurio wrote:
>>> We're observing sporadic HuC delayed load timeouts in CI, due to 
>>> mei_pxp
>>> binding completing later than we expected. HuC is still still loaded
>> still still
>>
>>> when the bind occurs, but in the meantime i915 has started allowing
>>> submission to the VCS engines even if HuC is not there.
>>> In most of the cases I've observed, the timeout was due to the
>>> init/resume of another driver between i915 and mei hitting errors and
>>> thus adding an extra delay, but HuC was still loaded before userspace
>>> could submit, because the whole resume process time was increased by 
>>> the
>>> delays.
>>>
>>> Given that there is no upper bound to the delay that can be introduced
>>> by other drivers, I've reached the following compromise with the media
>>> team:
>>>
>>> 1) i915 is going to bump the timeout to 5s, to reduce the probability
>>> of reaching it. We still expect HuC to be loaded before userspace
>>> starts submitting, so increasing the timeout should have no impact on
>>> normal operations, but in case something weird happens we don't want to
>>> stall video submissions for too long.
>>>
>>> 2) The media driver will cope with the failing submissions that manage
>>> to go through between i915 init/resume complete and HuC loading, if any
>>> ever happen. This could cause a small corruption of video playback
>>> immediately after a resume (we should be safe on boot because the media
>>> driver polls the HUC_STATUS ioctl before starting submissions).
>>>
>>> Since we're accepting the timeout as a valid outcome, I'm also reducing
>>> the print verbosity from error to notice.
>>>
>>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/7033
>>> Fixes: 27536e03271d ("drm/i915/huc: track delayed HuC load with a 
>>> fence")
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Tony Ye <tony.ye@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 10 ++++++----
>>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> index 4d1cc383b681..73a6a2fae637 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>>> @@ -52,10 +52,12 @@
>>>    * guaranteed for this to happen during boot, so the big timeout 
>>> is a safety net
>>>    * that we never expect to need.
>>>    * MEI-PXP + HuC load usually takes ~300ms, but if the GSC needs 
>>> to be resumed
>>> - * and/or reset, this can take longer.
>>> + * and/or reset, this can take longer. Note that the kernel might 
>>> schedule
>>> + * other work between the i915 init/resume and the MEI one, which 
>>> can add to
>>> + * the delay.
>>>    */
>>>   #define GSC_INIT_TIMEOUT_MS 10000
>>> -#define PXP_INIT_TIMEOUT_MS 2000
>>> +#define PXP_INIT_TIMEOUT_MS 5000
>> If we already have the GSC timeout at 10s, why not just use 10s for 
>> PXP as well?
>
> They're different type of operations: mei_gsc is a full on aux driver, 
> so it is loaded only once during boot; mei_pxp is a component and it 
> is bound on init and then unbound/re-bound on suspend/resume. On 
> resume we don't want timeouts excessively big.
Okay.

>
>>
>>>     static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
>>>                    enum i915_sw_fence_notify state)
>>> @@ -104,8 +106,8 @@ static enum hrtimer_restart 
>>> huc_delayed_load_timer_callback(struct hrtimer *hrti
>>>       struct intel_huc *huc = container_of(hrtimer, struct 
>>> intel_huc, delayed_load.timer);
>>>         if (!intel_huc_is_authenticated(huc)) {
>>> -        drm_err(&huc_to_gt(huc)->i915->drm,
>>> -            "timed out waiting for GSC init to load HuC\n");
>>> +        drm_notice(&huc_to_gt(huc)->i915->drm,
>>> +               "timed out waiting for GSC init to load HuC\n");
>> If the failure is that the MEI PXP module hasn't loaded yet, why is 
>> the error message 'waiting for GSC init'? Or can we not distinguish 
>> between GSC load timeout and PXP load timeout? In which case should 
>> the message refer to 'GSC/PXP'?
>
> I wanted to keep things simple and have a unified message for both 
> scenarios as what we care about from an i915 POV is that something 
> went wrong on the mei side. I can split it up.
Or just change it to 'waiting for GSC/PXP init'? If we don't care about 
the differentiation then no need to make the code more complex. But it 
is worth having a message that reflects all the major causes of the issue.

John.

>
> Daniele
>
>>
>> John.
>>
>>>             __gsc_init_error(huc);
>>>       }
>>
>

