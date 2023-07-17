Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AECD0756BB4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 20:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D335910E29B;
	Mon, 17 Jul 2023 18:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E83D10E2A3;
 Mon, 17 Jul 2023 18:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689617899; x=1721153899;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Klg+jz8gOo5EkP5bPrZHRjGX09MyYRBxRlvjGVvSRq8=;
 b=OnQqidVs+RnihLjkDXtLvoBs9MSuBS9KHo8UFNju0hdSsLqXVdVaWqQu
 WxzyrNtn+CVHoJUSDlto1dr8ekrIwXt4EO3Hszu6mUAjKUX1gkIZaPSit
 5eZ5nXFC6LRUQa/A6I8DDyBaw3P8YGLbZtkj9HgWfoStsXzZ5XpLBNL90
 tFgTeHnbMvLrevcDkTm30XsgUFPtTWFMlMvZlbywToCfb7mO8GqYjzX1K
 91jq5N+sTtSookm/qLjf6/u7hUy4yR/TGfAmVjg4cUhK4nfftwaZPPec4
 qgQlFxpsePQwzieE9GamY17/WHFFYArhCwbJ0wuOmtkF8WeX8tlsIhpVH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="369556357"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="369556357"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 11:18:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="752996758"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="752996758"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 17 Jul 2023 11:18:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 11:18:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 11:18:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 11:18:17 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 11:18:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ks8GUsgZ0twSbW2Nd0bDGGXEzCGvM4k/wkHSTKEJiI+VrN3gCGJPzm/RANDOehcsaljOlAkbrf5h+Fk3F35Z35FKjwA3VNPi9xDpnT3geX418qXGfEmu978Qs9RHlb3l96EFWBPF3Ymt8qBXZsR7Bx3MbNbxrmf/ThKH8PF1fNDmYYpnDW5RUAi3rE7I0ZXXws3AGEuLlTGgYJ02gW36AcwTOzReBfldK1Ut1Ssbv/0FsEXtPfBr1Tl6ad87vGvhFvrc3lWeiw/JmbyDeNGr28zDZShpPf0mKwwNFeYT0wudV1EeyzQ9dc2Z98zKpkvMJ2Yh1LOYYd9okTJsPPZYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cx7b4aJjFhtpHEfyrM6FyTlrlK9pkZ4zzClbahsznRc=;
 b=dAHjkpmnGqkEkBL2Kn+FVDuj1oWFg0kP0U92+m7JF3cj06CIjc9SNkPnt83pCrUgf6Yp1KWl8UC2Loaz/p0SYawqXv4nUpd+jCY/QY0RpP6nE1Y+ky0uNxdfo+PL/2HYUd8BSqcPI4LtJHtu08gmt2f1OBwKFHe6KMhleIp2HC7gFVJdKFnO5EtrvMVzGuXLLydyQpuarLXaXjWlQA/IQJiG6iuMPkxNsv190GffbeLBQyP4NR6NlnYLzDc533+o6zWvWAuBU/7NBqHrj8YGS6AowdLU4ghTYsRwzYixBuZ0mVMpy4fH+jzvvss/ysaggGueztIcLu99Emjmh5UsNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH7PR11MB6883.namprd11.prod.outlook.com (2603:10b6:510:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 18:18:15 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ff9e:f1d6:dad3:53d]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::ff9e:f1d6:dad3:53d%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 18:18:15 +0000
Message-ID: <1e3d4f0f-f09a-cbeb-5fdc-a16ee3004aef@intel.com>
Date: Mon, 17 Jul 2023 11:18:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/huc: check HuC and GuC version
 compatibility on MTL
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20230711203150.4140313-1-daniele.ceraolospurio@intel.com>
 <39c15fad-92fa-4414-11f5-b7a8e60ac5d2@intel.com>
 <069965c2-75da-3462-3559-4c2bf00c044a@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <069965c2-75da-3462-3559-4c2bf00c044a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWH0EPF00056D05.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:e) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH7PR11MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee047eb-eaa8-4d87-5097-08db86f22ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: limTj0tksRJANrPbUxVWRKONEMDY7KxXuNM9s0roWCuO7+FM6YjCNBx2BNNJiww8US/OO9NVZw89duG0SDqpmVJODiQVE11f9JZUtuF6FJUH/FBy+7F6TXT+fEQIJowUcZ5n9um9FRjlgUVM3LSBv086tuJRQCmy6qQPckAD9vsU9WSSstYFfvxLNlgOxt87w+S+76A/Ql2VtpFjEWPK5NVJI1Rf0a8ET/8afCYXFRcfCOiWWr9NFjjOEWN1LviCu5oB9hluyC55SGquJy5oo6IS8Ikqn00hZgXWM+fjcvSU3K4zmh/YdflpE9OiP/hu5Hwt+sqKA1nh+O+iYaxqKOZ75m74VeAUTmKLGRJ5sQROiOqezftXmmO+FomWfBVIDXQLAACGefRoVkrrN4r/0hsBYpmEH5JSzDj8fUccJ0lGm6FCVTo63SCYGtNjgESzJVEMHRfBZbh+DLHg6EYe6mDvqvKply/b4k8HMSNKM8FsbZ0deH2Xf34lm804hzN2Z43z6xQ39ulH8OQ+W7Covcigle3vfLt7WdmP3EkRNqO9w7oFig2kOl68+/mNRBnkRQTbD0hHxHGYK1qM3VoLh8Tle683EF0z+P1XMBgMuSWcYtN+5Nmm0ylb//UCvjyWkayc/pluNqP6gBs4eMB/pQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199021)(31686004)(86362001)(31696002)(2906002)(36756003)(2616005)(6512007)(83380400001)(186003)(6506007)(26005)(53546011)(38100700002)(82960400001)(450100002)(6486002)(6666004)(110136005)(316002)(4326008)(66946007)(66476007)(66556008)(8936002)(478600001)(5660300002)(41300700001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkVCUkg5Q2IvUnQrcGxKS1pwR2VYa0VCWlZoY0xyZ2d4bDZwaVJGZ09TeHRz?=
 =?utf-8?B?ZjIzcEYwTkcyYW02bGc1eHNuMU1CSWQxbVRCejUrRVFnZUpsVXpVNHdRaTND?=
 =?utf-8?B?NGxqaS93aUg1UXZBVWp6VEhyZWE4RmZ6cThnQ0xxYXpTNUZQVk1hYTlZVUwr?=
 =?utf-8?B?NkxZOEN1ekVUdGhCVHlWY3VZajRieCtpQlFJV2ZjRi82b2tXQXdNRERMN0l0?=
 =?utf-8?B?a1RBb2o1TEN5MkZ6UHRYRzdGZDVid1Q1SFNPamR5ZFJnQnNtT0RSbXYrODUy?=
 =?utf-8?B?ZlMwZUNrTW5aZy9vcXFWTXdjVERHZlFnS0ZGTTNycDVBaDlCMXAwdS9kRlVZ?=
 =?utf-8?B?M0dYYlpONk0xZTkrQ3RKd0k3Q29MMkMrWkhvVXJ5OFgySDQzUWROL1lIc2Ir?=
 =?utf-8?B?YjVBakVzWVkxN0RJUEpsUlljYS9VVldkc1IzRldPeTYvM1U3dDZ2QWIyOUZ3?=
 =?utf-8?B?VGpiZFJYMmk4WVZZbmFNZnhYZ2hsSmZnRkZZcXY0TlY2TjNmVXRjS3lWbVRH?=
 =?utf-8?B?YjNucFBzeWxES1ByNUdDU1p4Q09STE93V1M4azlqRUJTRHUvRkdydFFLQWJZ?=
 =?utf-8?B?WW9rMVFJclV3aHVJRGx5MVMyS2FjZzlnS2R2OGJVcWdTcHpnZEJnelFnamFr?=
 =?utf-8?B?ekFQSk5udkt5Mm9STUdiTFFMMW9sVDF4cFNyMlZJUmZoZUlHNzFIQ0taREdl?=
 =?utf-8?B?Z3VnUjN5SWM3OXhSc3N2dDNqaW1Cb25hN0JIKzNURkI4OTRxTVI1ZTdJLzJT?=
 =?utf-8?B?NE4wZlFiVDNjSGtYV2hKRm1BOEpXOHlQandsSHZUbjdXejRYV1BIUmlxc2sz?=
 =?utf-8?B?MTVmSDkrK1VrKy9aaEdYOEJqaExQS0pjQ05ZUFliemlPZ3VVWmFUK01BUjVo?=
 =?utf-8?B?SkEyVFFycjh2TVZLOUNUc2tXd1ZVYnplNFZvY2NuVGg0dWM3N0szRWQ5VVBl?=
 =?utf-8?B?elFOQVRsa2NmUzdoenk4aDhTUzFSVjR3cVJ5eVZxM2JNWEtXL0VGbFpGRTd5?=
 =?utf-8?B?bVJzcXYrTTRPZ1RURy91emVBbDBWSHBFdEQyREhGVFhwRFpYVFJ3SFpQUG8r?=
 =?utf-8?B?RER6WjFZRUwveWtYZVNNd3d5YTM0YjJhTklKanF3a0V2QTl3WVlGWWhwU3dT?=
 =?utf-8?B?VXBwWlhDd1drYlU2bE9SanpHa1lyUkhLVlI5WERFODdtY0tSaWZpQm5kTTFk?=
 =?utf-8?B?ZTI3bUxMa2JFS0JZUks1WjhYVnpIRS9EUE9nUENFWVR2eUYzTHdDVEcxTWEx?=
 =?utf-8?B?WkxZZi9LN2EzQnBXR1VFSDZBd3lIVFd6KzVpWEtITzJWUDVCVzZ6M3RaQTRu?=
 =?utf-8?B?RGRHQjB1MTJtaXV2d1lZNEVYaHBISERsTVJueU1lVS8rNWhNTitYTUlrTTZV?=
 =?utf-8?B?Q2RGdzJkcHI0cHBXTmRtcVRzN2ZKdjB5Q0E5WUFGL1VtRXdPV2wxSDJVaUkw?=
 =?utf-8?B?L084ZXIxN1paOC9ySHhXN0NWRUpJaEE3eWxqVmNlck9QZCtLaGQwcDZibWlZ?=
 =?utf-8?B?QUtFUlU5V1dQWkl0TFVjVjAxZVVBaWxQR081Y3BOdS9tc0RES1VqUmUxY0s4?=
 =?utf-8?B?Z3FQUWs3dno3MnJPY25MMFRqTmRwSEFkZlJVb0x3VFl0ajA5amIyZEhKdEFW?=
 =?utf-8?B?ZnkrdnlaM0J3dXpFRzZQczlmdENEYmF0Z2M2MkdITnl0ZWdlWC96Z2lhV2dq?=
 =?utf-8?B?SEtSVW9Ea1BWeXVXOFYrQ3Z1STRzUkFIelQxK01VTHRpSjdOa3ZYNm13QXho?=
 =?utf-8?B?S0lnZU56MC83MG4rdHJCalJCK2NPRWl6Umk3Z3FjZ3M2UkozM0RiTEVDUnky?=
 =?utf-8?B?cjhVNHM5S2tGdlZrTUxiVTVjWmp1dE85NGV0MzBMZ0JDNFQybzdQYUxJdk5R?=
 =?utf-8?B?UlZ1MG9KRnd5MmRzOHZDT0FFTmZmODhtbTFHM1lNZktFNGJsemhNVGdRS3hX?=
 =?utf-8?B?c1kvVHhEN0xtVVRmcGRaeUZjbEVlMW0ybEhOMy8wRzVuYmp6Sm9IS2dxa0Jx?=
 =?utf-8?B?VTlJaDlzbnFwRTdtU3RLTGxqaDBYd2kxeCtZeGp3OTVPVXlLWXRSRU9iT1BL?=
 =?utf-8?B?U2dWME1taXk3am1SSjdZbmdRckJpMHVEZlZDNklNdDIvRkpjUWg0bFVNODBq?=
 =?utf-8?B?c1A5WUVtWk5qRkdFb1IzSUhNWmJERE96S0YwRjdFL3I1a0RMMmh2SE9wMTRK?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee047eb-eaa8-4d87-5097-08db86f22ffc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 18:18:14.9693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gtaCJKVNAc44Z1weWcLZFu6fwos4yuJFgxP0CesZeGGNNTLKNGHNmwhR1543L3LxXx1s7r2dHXdT4auYPO0K5SuCHS4lxDar6n8MwiEkarw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6883
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

On 7/12/2023 10:03, Ceraolo Spurio, Daniele wrote:
> On 7/12/2023 3:03 AM, Andrzej Hajda wrote:
>> On 11.07.2023 22:31, Daniele Ceraolo Spurio wrote:
>>> Due to a change in the auth flow on MTL, GuC 70.7.0 and newer will only
>>> be able to authenticate HuC 8.5.1 and newer. The plan is to update 
>>> the 2
>>> binaries sinchronously in linux-firmware so that the fw repo always has
synchronously

>>> a matching pair that works; still, it's better to check in the 
>>> kernel so
>>> we can print an error message and abort HuC loading if the binaries are
>>> out of sync instead of failing the authentication.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 42 
>>> ++++++++++++++++++++++++
>>>   1 file changed, 42 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> index 08e16017584b..f0cc5bb47fa0 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>>> @@ -803,11 +803,53 @@ static int try_firmware_load(struct 
>>> intel_uc_fw *uc_fw, const struct firmware **
>>>       return 0;
>>>   }
>>>   +static int check_mtl_huc_guc_compatibility(struct intel_gt *gt,
>>> +                       struct intel_uc_fw_file *huc_selected)
>>> +{
>>> +    struct intel_uc_fw_file *guc_selected = 
>>> &gt->uc.guc.fw.file_selected;
>>> +    struct intel_uc_fw_ver *huc_ver = &huc_selected->ver;
>>> +    struct intel_uc_fw_ver *guc_ver = &guc_selected->ver;
>>> +    bool new_huc;
>>> +    bool new_guc;
Could put both of these bools on a single line.

>>> +
>>> +    /* we can only do this check after having fetched both GuC and 
>>> HuC */
>>> +    GEM_BUG_ON(!huc_selected->path || !guc_selected->path);
>>> +
>>> +    /*
>>> +     * Due to changes in the authentication flow for MTL, HuC 8.5.1 
>>> or newer
>>> +     * requires GuC 70.7.0 or newer. Older HuC binaries will 
>>> instead require
>>> +     * GuC < 70.7.0.
>>> +     */
>>> +    new_huc = huc_ver->major > 8 ||
>>> +          (huc_ver->major == 8 && huc_ver->minor > 5) ||
>>> +          (huc_ver->major == 8 && huc_ver->minor == 5 && 
>>> huc_ver->patch >= 1);
>>> +
>>> +    new_guc = guc_ver->major > 70 ||
>>> +          (guc_ver->major == 70 && guc_ver->minor >= 7);
>>
>> Wouldn't be more readable to define sth like UC_VER_FULL(v)
>> then use UC_VER_FULL(huc_ver) >= IP_VER_FULL(8, 5, 1).
>> I am not sure if it is worth for two checks.
>
> We've been trying to avoid those kind of macros because the version 
> would need to be a u64 under the hood (each version number is a u16) 
> and therefore type casting would be required to make all the shifting 
> work, which makes the macro nasty to look at and as you said IMO not 
> worth it for just 2 checks. Note that the GuC is the exception because 
> it guarantees its version fits in a u32, so there is some macro use in 
> the GuC-specific code.
Pretty sure I did originally try to go the u64 version route but it 
caused a lot more problems than it solved. I forget the details but in 
addition to all the extra casting mentioned above, I vaguely recall 
there issues with 32bit compilers/architectures or some such. Hence we 
only have the 8bit-per-version-component/32bit-merged macros that are 
for use with the GuC version and only the GuC version.

Given that this is (hopefully) a one off hack to cope with a one off 
bug, I would stick with the unrolled code rather than adding extra 
complications.

>
>>
>>
>>> +
>>> +    if (new_huc != new_guc) {
>>> +        UNEXPECTED(gt, "HuC %u.%u.%u is incompatible with GuC 
>>> %u.%u.%u\n",
>>> +               huc_ver->major, huc_ver->minor, huc_ver->patch,
>>> +               guc_ver->major, guc_ver->minor, guc_ver->patch);
>>> +        gt_info(gt, "MTL GuC 70.7.0+ and HuC 8.5.1+ don't work with 
>>> older releases\n");
>>> +        return -ENOEXEC;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   int intel_uc_check_file_version(struct intel_uc_fw *uc_fw, bool 
>>> *old_ver)
>>>   {
>>>       struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
>>>       struct intel_uc_fw_file *wanted = &uc_fw->file_wanted;
>>>       struct intel_uc_fw_file *selected = &uc_fw->file_selected;
>>> +    int ret;
>>> +
>>> +    if (IS_METEORLAKE(gt->i915) && uc_fw->type == 
>>> INTEL_UC_FW_TYPE_HUC) {
>>
>> Moving this check inside check function would make it more generic, 
>> up to you.
>
> This will hopefully never apply to any other platform. This is a light 
> breach of the HuC compatibility contract, so I really don't want to 
> have a generic function to handle it. I want it to be clear from a 
> higher level that this is an exception for a specific platform. Maybe 
> worth adding a comment? Would something like the following make things 
> clearer?
>
> /*
>  * MTL has some compatibility issues with early GuC/HuC binaries
>  * not working with newer ones. This is specific to MTL and we
>  * don't expect it to extend to other platforms.
>  */
>
I agree with Daniele about keeping this the exception not the norm. The 
comment works for me.

Typo in commit message and a declaration nit-pick but otherwise:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


> Daniele
>
>>
>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>
>> Regards
>> Andrzej
>>
>>
>>> +        ret = check_mtl_huc_guc_compatibility(gt, selected);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>>         if (!wanted->ver.major || !selected->ver.major)
>>>           return 0;
>>
>

