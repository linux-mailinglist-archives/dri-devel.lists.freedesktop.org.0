Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 746CB67A9CF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 06:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BC910E710;
	Wed, 25 Jan 2023 05:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDF410E710;
 Wed, 25 Jan 2023 05:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674622948; x=1706158948;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WkmRsKw9E1FsJeF0ISRcRQKoEf3oy3CUS+RosQ+RQ14=;
 b=DmrI9a98sKlnWa7KLaQBnHGO700O5GTR042TW8AOAtdYp1nRncxTWwRg
 222bdnh8BbHY/73owiw8nIhMJnfsyncAQsVKpm9DzhliifWdjMaLLSnt5
 9Pl2v7pPW1bo0+e6BwfGxoaJFfH7G2cg/hY2YedJq8txcuTK7TTJtRxp4
 XO0lz1Po0PUTM9A6PtqHbeAd6kEoVD0aPl8VP+KUGEuxNDldwTDpkf6Xy
 sXFw7OYQuiF9mt7Z10x5WGUnngkXGFUaRhZfIrFvON0aUVxdAh4PUSg2J
 /6JJ2egpIWH/FGOmUuuHQf3IqSsJBpd1A/m3grC7nJIoa188A4A+hPjNI Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="314384978"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="314384978"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 21:02:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="612297861"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="612297861"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 24 Jan 2023 21:02:27 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 21:02:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 24 Jan 2023 21:02:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 24 Jan 2023 21:02:26 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 24 Jan 2023 21:02:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cql3IriO9bK54Dyzk6bfqqRe+dCAOnrKQwqKXGq0KaDPclDsgEQJmfHCHZuKfbyua8G3rl4JJyOCIZurQK/skYU6oWRu+6zqGXwA1+jRjssDI/Udh6LRaRzOre1DWtDB9eKC+JEBZLV9J7inR8RgvbEwhC636nERqreubEKWbfHK5GDRSyNVwYae3aOHJnbt9wr1ekwz9lD7TtlaaP6ntY9sz9YmVtXUfRwZ3egtk13WhWZY299o6Xg4pL2GxZVk6XfuHC1Y0ihiQXNXatX9WFDSchOAMTy75ypSB8np8QDX+HNPqGJEYEEuixxoRV8DR0rVpbIqjpUli0rugdXa/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muchiH7VuVZKj6RmEoGfVsGfEriMJ99IaxGfku3PhVA=;
 b=PCHRy1uwQZl6ysQXxvvrcuZnFqzrdIFLu6eN2DDFyiTdrmCu67/ZwIT8Q3NwQZO0s/7ZTx+PQhlBIGfWB3JC8Ka3cdZOz26doVmngOYyZq0J6hPrfrjpbIs7Iq3GZXcMftGfKYjH3f/0oKK3XFnnt+GvqXN+23VQIq1FVKzUNVhIzcv/NuLDSUGDqXUHM7raWirhRSOJWmdeFCTN7G2WV3zDVEttswlz9AY+ebckNOU+JdumOu65XWsoDmZ9a6YAIyZGymYhn6u+vv73uMpY9q7QJazEDwMnEQY18Wf/Tw29ae453wSQATMaam67oAQENqroArdBfyhkpjUVvY83fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 05:02:24 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::3998:4e46:9501:2786]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::3998:4e46:9501:2786%9]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 05:02:24 +0000
Message-ID: <f3ec1334-7449-c75f-2c63-f832188cddb2@intel.com>
Date: Wed, 25 Jan 2023 10:32:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 02/16] drm/i915/dp: Avoid forcing DSC BPC for MST case
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
References: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
 <20230120043844.3761895-3-ankit.k.nautiyal@intel.com>
 <87357z7vgn.fsf@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <87357z7vgn.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0124.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CO1PR11MB4804:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b7e6b1-ada5-4428-f51c-08dafe91586e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GwNC+OY9LPkGnqOBoK15V0u3w35rLEefgbyf9d3jhvY7Qeg4cEZGSlqgB3udR7nrQNB2o7VKUW7jiFMncHkpJ9wWyEpO6Tjh0LywlgZ3gAyBcEZbkUcpbpR3+DWOe69RJX/Z/fqFhfKLxV9aIM5Bju3b0/o3IorZb45zywMXrlQNtrZGT/p1sL0oJPypIbt/P8k0tcjGY99XtLtC0q++uuDV7RNpxmxdBbNi242x2Uh8fuG+ShoQAm6oXmSJRuBvsCG8llMmEvLAlm38HGk7moB4qT5KNG7XmfGko3TP/GDGPq/CA2yD9IzS1LZP9JHPN20RmeZx0wRvwLg4MTbcJf5dv1EsTox2FFTuRuaQ3R5P1XWVvMGKkyonPRXwG62+D7Sbi0bSq/zX8r1IALkLI/xZsk1Ed2ffuR9Vzc8RSweSN1Lek9pIQsPTWIxrhLXkqy2DqcgsjEHHT18REr4QQdAAX5oxAWmUQaoB2u3HSQ2Q5pblFBKG61i9EfNcsAkH0sqDpu5030pQhmfjX0GHdPJmpaQWB6lRC2p51mn5fE160kHqwzjHRxFiqovlJZT0/zI97VOYf040odRfs6jM9gsRV81cYxwaTyyEIxTE6JTz/HnBR66kxBx0vajdeOv12w1U5GBXHzNAT6YFLkLx2gZRH7W9P1DiIbKfs4iIkmFnWHIhJFNcHw69SsjXa9ILYVpXWpH6KB1Kjv7ofb5+SDU4ZbmCbUUvyhHPlxGHID0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199018)(38100700002)(86362001)(31696002)(36756003)(82960400001)(316002)(2906002)(31686004)(41300700001)(66556008)(4326008)(66476007)(66946007)(8676002)(8936002)(5660300002)(53546011)(55236004)(26005)(186003)(6512007)(6506007)(83380400001)(2616005)(6486002)(478600001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUptMDNSc1J5VjlyUllrZ1czSlp3SEIzcEVDaW1DWjE4UkRwZXlnMjVLVzY3?=
 =?utf-8?B?Mm1mdlR6d2JTWHNueUJRNXVYOUh2bndrbzBqMkEzSDFubTRYQTM4emtCRzE2?=
 =?utf-8?B?V0owWGt0OGt5Vk80QlhIUU5sNUhjK1RyVVZvTXNDUDRrMGRNeXdCd1AxMmIw?=
 =?utf-8?B?b09LYk1ORm9ydWhLWW0ySjA2elRzRGFoMjFwdnNhSGptZ1NsU2FjUzhaY2Q0?=
 =?utf-8?B?WUg1VDJEcjlhL1laRkNFWW1XT3pHNlZxNjdJNlR4b1JTbnNmMkNQT3ZFSjFx?=
 =?utf-8?B?Ni90cEE1NWJxYVpqWm5Zcyt6R3FwMW1uU1dJVDBubUc3MWxRVlBXbHhLMllK?=
 =?utf-8?B?NGo0YWU1RExhRjVYZ0swazRoY2NraFZER2xuckhHWGF3MWFFaDlpNGtJcENW?=
 =?utf-8?B?aG4zYml2dVRWV1F6VlNDL1dBSzI0dU9FN0VVaVBqNzJwQTFsQjdpVXJNODhZ?=
 =?utf-8?B?K0VuQjhRRXNRVFlkWE9WbmlaTW9vc3hQTENUMlg4Q2F3SGp6S2hDVTJhR09E?=
 =?utf-8?B?ZkhlSkVLdU41VFdDQm5JMUdQV2V1TWwzR3I0NGt0cWZOWFEwZU81Z0NRRGRI?=
 =?utf-8?B?WU5Sd1Bjem9reVVzOG4zUitCR3l6d3hzR3ZQNzlxTWxkZFFCMWgvdWxZOSsy?=
 =?utf-8?B?c3NVdFZpOFRXVTBydzJxQ2sxTEVVNmR3R2xDd1BueXRUa0xaelZhOW11WS9N?=
 =?utf-8?B?RzhRdlkvQ0lvUU12dXVNSVAxVWxnN21kczhRVnExMWo5V1J1VjJqZlZOOE9L?=
 =?utf-8?B?MkNIQ1pGazdadTVhZDg2QzV6SlV5MFdKVUtpV3lJaUhhMTM0b2hKMkR6MzE1?=
 =?utf-8?B?UHVMOXV3U1RkMnFYWFdqalAzNFcxMnJnMTVFc1NWWDZrL1hGa2g5V1d2UktN?=
 =?utf-8?B?T3NicUQyODZ4SUx5UmcvNC9hVnkvN2I5NWd5R1dqU21tTWx0L1ZDNXlEMnB4?=
 =?utf-8?B?bW9FSC9oYlh0d1ZwTG9udHBqSWhtRE8vNVg3U3ZBRHhLWVpBeXIrM2U3Y0la?=
 =?utf-8?B?VDVHODBKc1ZIME51N2dxVEZzS29YbEU1bkxiMkNSUHNiaE03NjEwL2RRcjNv?=
 =?utf-8?B?NnRxM1VUVDh0d055czAveVFQWS91cE1ZZGVnUlkrN3o5aVVGZ0hsNDZoUmZG?=
 =?utf-8?B?dUlGL241ZXhKeVJ4bGtVdkdqQ3NWdjNJZVFmb0piM1BXN3kyZzVJZG5VUjBx?=
 =?utf-8?B?dFVEaVRGMUFqR1I4QXZjUDJvSXBnbWFLdEp1WEdzR0E3WkVCOWg0bEtjZE8r?=
 =?utf-8?B?TUVUelgvOVZpc1NxODRYRjJrZ0lmUm9zQWtUMnNveHhtM3pPQ0s3WjZPc0Q2?=
 =?utf-8?B?em1FR1l1ZC90aFZROWZSWG95MXF6S0FJamtjMUx1KzhaTWVmdFRhTVlXcHFT?=
 =?utf-8?B?L1I5SS9rOVIyYUp0bUtta1VRRTFhUkRWc09aNitnbkt4c25FYS9OZFV6amFu?=
 =?utf-8?B?NUNUU2h4eEt1NU92KytpaHZPbnpmQkdySVR1VGJPcWJmUkp4VzRYRUd1WlJP?=
 =?utf-8?B?enRFNy84N1l4RnlPMVBWTWVndEo2QXUxakZQRlFDZm03R2RCYUdQQndnZmRt?=
 =?utf-8?B?N1F1UTlveUUwYkJmSmc1NXA1bWVieEhyeFZwbm5TckxsbVhHakpqRldBRGw0?=
 =?utf-8?B?aUlDQVN5Z2QwM05sYVlQaklROHUrdnBNY0t5by85M0oxSDJQUUUyZ1BuNHVY?=
 =?utf-8?B?anN2STdld09yV05jaDgwdWtwdDdSUEhkV3hUcTcvbkxmeU1jMFVFSHdocW9C?=
 =?utf-8?B?Y05lNmtLdzhjYzBpQTZJTU84VEJBa0MxaDlMMTBVU2JqaXhUemY5V3M1bGYx?=
 =?utf-8?B?QW83WUdEb2NESlZkcTJDSjFoL3dSZm9PSDFvQU16RnBTWkthYzNhWW1OdHdp?=
 =?utf-8?B?OTNBWjZvM3pxN05SY0N3YW1VZW1DdkhmazdoWS9hRGh4YUl6NkZ5UGJINjFF?=
 =?utf-8?B?Skc5aEV3THJ3Ti9QN0gxN1pYWkZkclN3N3RZQkJhT01mVzNPUXBENGhiRmQ4?=
 =?utf-8?B?b2RJcEtEUU93Rm1KUE5Xcm50R09BbW5MM2xUSWNaQTJqU055N21xWnFjZUo5?=
 =?utf-8?B?OGxZcEdmY3hNQXlUUDY1UWpuUFdkcUlZL2RxMmk0RnRtZ3pIVSszdzROY2Yv?=
 =?utf-8?B?cnc3cUFkb0hzY294aEVCeTlEbmpEZkY5d05QM0QyTzRhUlRadElFVmxBRFNU?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b7e6b1-ada5-4428-f51c-08dafe91586e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 05:02:23.7787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wikwhgcfmtq5x+zMg5Nz0LqUJmXWv4O7oFI7GVZKDG6yhRk8KhRgz5CDo5TMiJIoHE5vqC0KK06jUVWnsExjQQyDtaRwbbPPRZDlgCc6Thg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
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
Cc: manasi.d.navare@intel.com, vandita.kulkarni@intel.com,
 anusha.srivatsa@intel.com, swati2.sharma@intel.com,
 stanislav.lisovskiy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/24/2023 9:53 PM, Jani Nikula wrote:
> On Fri, 20 Jan 2023, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
>> For MST the bpc is hardcoded to 8, and pipe bpp to 24.
>> So avoid forcing DSC bpc for MST case.
> It's likely better to warn and ignore the debug flag than to bail out.

Hmm..but then the test using this flag will not come to know that bpc it 
wanted to force, was indeed used.

Currently there is no way to read the bpc that was selected by the 
driver, and so the test can try to force DSC, and the bpc and rely on 
whether the ioctl passes or fails.

Regards,

Ankit

>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dp.c     | 11 +++++------
>>   drivers/gpu/drm/i915/display/intel_dp_mst.c |  8 ++++++++
>>   2 files changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 93aebd3683a4..3d828ea0894d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -1500,14 +1500,13 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>>   	if (!intel_dp_supports_dsc(intel_dp, pipe_config))
>>   		return -EINVAL;
>>   
>> -	if (compute_pipe_bpp)
>> +	if (intel_dp->force_dsc_bpc && compute_pipe_bpp) {
>> +		pipe_bpp = intel_dp->force_dsc_bpc * 3;
>> +		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d\n", pipe_bpp);
>> +	} else if (compute_pipe_bpp) {
>>   		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
>> -	else
>> +	} else {
>>   		pipe_bpp = pipe_config->pipe_bpp;
>> -
>> -	if (intel_dp->force_dsc_bpc) {
>> -		pipe_bpp = intel_dp->force_dsc_bpc * 3;
>> -		drm_dbg_kms(&dev_priv->drm, "Input DSC BPP forced to %d", pipe_bpp);
>>   	}
>>   
>>   	/* Min Input BPC for ICL+ is 8 */
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> index 8b0e4defa3f1..9be04c60cced 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> @@ -325,6 +325,14 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
>>   	/* enable compression if the mode doesn't fit available BW */
>>   	drm_dbg_kms(&dev_priv->drm, "Force DSC en = %d\n", intel_dp->force_dsc_en);
>>   	if (ret || intel_dp->force_dsc_en) {
>> +		if (intel_dp->force_dsc_bpc) {
>> +			/*
>> +			 * FIXME: As bpc is hardcoed to 8 bpc as mentioned above,
>> +			 * Avoid force BPC for now.
>> +			 */
>> +			drm_dbg_kms(&dev_priv->drm, "Cannot Force BPC for MST\n");
>> +			return -EINVAL;
>> +		}
>>   		/*
>>   		 * Try to get at least some timeslots and then see, if
>>   		 * we can fit there with DSC.
