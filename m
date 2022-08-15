Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6235A0052
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C392ABDCF7;
	Wed, 24 Aug 2022 17:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748F7D6D69;
 Mon, 15 Aug 2022 23:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660605404; x=1692141404;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FGLyguguaOxvVk8U/ToM03CWX32C1xljrjXqZnmsc5M=;
 b=MraEZqFZ59+dQEdlk+5NnPOCF021FWbCH/hW+53yes1fxn2mWtYh8MHX
 i4AQFnuU3I2UI7hhWxwIE11TIVMgVZiQoR+IOgIT9c8TtzVo7/K8RBK9z
 fgeaoLQ5DSiROdfxWh4yxljbk3UHl1Df2BUBF6WuHRMiGuAXQh4xyPmPc
 FtAlDo3fLA7S4z11flHVeHN/2DZ3BH7NqiQv6Tc7TqQk7dbBPVRODCpwo
 lmtGUbR9qOwTYWI46EcOyAoA58BODaGb7FH03po+MNo9eJ5ucdQ/1UpjF
 fsQi5ae3jb1vdnt5K+fNpzw8wSzM8v7gj+GHoVFUvhr/uK/jorFbDMin9 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="271849837"
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; d="scan'208";a="271849837"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 16:16:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; d="scan'208";a="782815750"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 15 Aug 2022 16:16:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 16:16:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 16:16:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 15 Aug 2022 16:16:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 15 Aug 2022 16:16:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrDfqBIji21UhTbytb+NXd35XpizXGe3UuxKXGRT9W5wpDL34XMNHl9au6PCAbWkMhUv2PLZQafieVH8Jb0WwmF8ep+jREMsM0tKzlu0GVUfwI74Y8IPiXgUDqUcapp+5nB/be4Gb8EcI/fJX0UAM/W6IZe4z8wDgmf2pKGssVFMDT8kho+QG0ugaFpiQc6CErDzMEmxill+ToAK5ZHdKVq3EgkDW73B5/mRLyqUdGNBVKwSlWNgqfU2Lk8OYe2RzPg+buGHysEcpBcT1BzatjCqRDkuki/dtrqRnPoIOvk/qUZxkbuvsvX4E3vHpUZOtOQvdSL1079pKAGw+qOGVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRvQlKOsxvbGMuGNbCL+3BczRTdWz4qxAxePiHhadF4=;
 b=jf4sRWEww+Y9Z2gFVTN/TGe8WKkpIobBw7xmUzShem8PJmI3L7yuLGPLjxE7FA410o3x9gyKxplLrxUpF58BL0PSSGDTlQEfHHduNNFeMAFkAV7mH2mfdgm538UFIoS6S2xc4rGQiLLtX/DZNrF0VVT+YOs23ifzZB28InLXKPsH7bvSE5xjN6fsaqPLKqRjifdxW648Gm5E4r/upBt4cQxRilXGNrjjds0jY2fgOccUjq9MAN/ExI+H5fAldzM6zo6XyRqTm7AsFjQr5v1qmv2cBgmOq+Vaq4YFTJwt13d3fK4yDsjzWYsruEJRLMpcqdJvlGFIXzDItGzgdQVJXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DM6PR11MB2860.namprd11.prod.outlook.com (2603:10b6:5:c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 23:16:32 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::9403:806b:5455:c213]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::9403:806b:5455:c213%3]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 23:16:32 +0000
Message-ID: <740034a0-483f-c7f8-89ae-3a53d9be61e1@intel.com>
Date: Mon, 15 Aug 2022 16:16:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] drm/i915/guc/slpc: Allow SLPC to use efficient frequency
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20220814234654.34800-1-vinay.belgaumkar@intel.com>
 <YvqDJ9S1q2xEVzzZ@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <YvqDJ9S1q2xEVzzZ@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0041.namprd08.prod.outlook.com
 (2603:10b6:a03:117::18) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9edc11b6-0dc4-4fab-a973-08da7f1430bb
X-MS-TrafficTypeDiagnostic: DM6PR11MB2860:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xCHdloldi0K25M19QYkzrK5UGNO+cfk0PD6c447OMHv1ihDf3RJONt7t5TC5lSXhHSIEEwqZ4ptDBHmQdS6Fk1nx4Zo3VADjrMgr+sk5xbUj4KwW2OCAh3KN/x4oNgZVUHD10JKKSFfIhrq262rZQ09Lkoqq+fomzNxdJ/dHvV2ciHWxy2YxkcXfk+ejDOaWpwCaRTyrcsRV0sdgpElzst42bqSm/+X/BboI0OGhgA0zvW3j4c9Ufwhh6qOW8DdEbd0+YAzM8Mk+GrJOk0Y/J0Bm+LTZ0q3ylHqeirMZN99zOM68besf2PtOmy2DMVsOdBVHIWx3YIX2489I0PrH8Gak7d0avXkJqT5T0vAe8eJRC0EV24w9z9lHNxxp3aRzHEWCKiHVjO4+uAN23NYEqJYSrw8ny61C8tdVGw5z+i08Jof2xJDlIC6atN/yNdfJjHKwrALWYR7iSar006lEk0mXCWRERCwnT7gEDp/ErrfUYcfrjN1U4PRLPblAbyE5Yr9G8IEEAH6WNp8vHqx1tA8LnZfFb8pEZOTvqef3Bouhk8OCt8U7jQ1invj+yPhGumoBJmzjdz5ywYnbqTekRpxR3W5UW5McmdiqL82blPCKEIYmp2H1syEaV0U84WWxWtJTGTbrnbKkOQ3r8D09Pg9fz6ZD4C1P0qvHN8sunsivJ6j/VSNjo7n3vxui/NnDUpxCf4yQhq/JgFNy0Mcc1uQrsKXoi96VRqjVUDp2iWhWLFD3duS+0FcH1T3dUyWVvJGGj1tr3BMgWGOz+5i6F0+4OOPNA0GUTBMYTUTz+wM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(376002)(366004)(39860400002)(396003)(966005)(6636002)(41300700001)(37006003)(316002)(478600001)(26005)(38100700002)(4326008)(6486002)(8676002)(66946007)(8936002)(66556008)(66476007)(5660300002)(6862004)(450100002)(2906002)(53546011)(31686004)(36756003)(186003)(86362001)(31696002)(6506007)(82960400001)(6666004)(2616005)(6512007)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmdOd2kxREpUZ1dtK2Rka25MNmxrWUoyZC9Dd0g0aXJ4VmdNZEl0bkNVUU9z?=
 =?utf-8?B?dmFGRVNlV3ZKWldpMDRJdElQNmc0a09oNldNWU85SS9VcE42TGw5NjRSNnBu?=
 =?utf-8?B?ZnJVWmV1MjdBam9RT2FUQUhQSnNnVCtxUGcxMW5kZ1lnRmk5dmtwYnpoNUhk?=
 =?utf-8?B?dlJlblcxNFZPUEpzRCtSc1hrVmtscXRoa0I3aFdBa0RNVGd4Zk5XN1V5b3Zt?=
 =?utf-8?B?b1pLcy9mNDIyQm81RUpmNGZGdkx2d0VTT0pYeS9abTJRVWJIWTFJTm1BT1R1?=
 =?utf-8?B?WHp0aGFodkJ2K0sxcnAvNHpoMFljcjdGamhoK1gwQ3F4QU5zcWZmcmhYMW4w?=
 =?utf-8?B?VUk4ZExvYzRveVA3R2psbmFJcXJSME96WDF2QTJmYWFEVTlNMFRmektzMW8w?=
 =?utf-8?B?a3NZcUNDMXVYcXQ3ck5mTnliMDhaY2tXMEhpMzBXOW9VZ0xDS3J4bUpCMFQz?=
 =?utf-8?B?M1l1ZDk1VHA3M2Q2QWFZVEViVjBXa2dQaUFlZWRFWlZ3Q3d5bXcrT1VSNkdv?=
 =?utf-8?B?ZzRqZE9DMXJCRXNETDJSMjJoMUdHOFVFam1LNnhmUUVvNFBhNWxIakJWVmVM?=
 =?utf-8?B?V0w5SCtLR2hUYUtRbzRxaVdxVkx5V3Z3OUR0VlhIUFIyaUlDc0g4SFlRWU5i?=
 =?utf-8?B?TWhsbytGUzd0cEpqOWlUeVUxSzQxMW5nVWFiM0F3bjlqbDRuUW9WVEhBTlc3?=
 =?utf-8?B?Q2FNLzRRZjBGWjZEZHNkSXZvK0R0QVprWEhWeTZ1VEFHcUVuMW1ia2Nta0Zz?=
 =?utf-8?B?S3VNTHlESnVJK1BzRFhOVmlsUG1ORW80UFVnRjJoY0hTV0c2TVNyQjJUNlZP?=
 =?utf-8?B?b0VHM1pxd2haNFhXdHhrak80ZmRWSjlOeS9wajNOOGR3cGJsVG95aGVDY2l5?=
 =?utf-8?B?VDNrR2FieTd5cWdoYUxnVVdyTTJQV2x2UXVxNGxKRm1ZTHFzRDBBMnpoSjcy?=
 =?utf-8?B?NHJkcWxqRFhYcmVuc1FQck5BeU5HRGtML1l4d3V5Qk0vd1VyWnhZbVh0aXhI?=
 =?utf-8?B?dzBLY2ZDWTRRQWo3MlJkQUJ5b1lEN1YwWnhiZk80ZEV0RmhueUdOMHNseGxJ?=
 =?utf-8?B?NHZOcFFCNVNvV3VLQnlJd2d6L0RqeStGYTAyNEJyQVArS29UaHNsYnBTcmth?=
 =?utf-8?B?R1RzYlpRbDNQNUgraGNVTmowMEtUQnNwZldyeEhxRkMxV292a1I0NE93Nm5v?=
 =?utf-8?B?M1ZvR1lQcVI5YlJhaGxIaG1lT3p0a3Fxa29YaHc5SS91N0hZb25jK2hkVHpa?=
 =?utf-8?B?Vk0zMFh0WWJLRnVLYUhaWU5LdWpRRFByMllhWlE3dlhCUlF2bTJ4UnBDbGN4?=
 =?utf-8?B?dHF3ZExLeUdMcS81VnNwbDdyRkI3MFRFRXBKTlJET09RbjVaOUZjSXRaSmRv?=
 =?utf-8?B?OTVpMlRsY25zVlI5RXBoUTZ3MkZqYkw0QnR0V0pXSDdhSEd0WGU3Um9UOUlr?=
 =?utf-8?B?LytMZUFmQjJpQlg0ajZnTmV3OHhhakNzVEltMVA5dzB6Rm55Z1VQNWVpREpC?=
 =?utf-8?B?MXJMVWRSNG9hcisyajJLVW0yWkNjL0pCa0E2RDVHSFBQSXZyQU9LSzJ0OXQ3?=
 =?utf-8?B?NjY5Nnc5aFRmcGVRTnZPMmFRWGxqb05uR1p2T1hOcXd2YTkraDJIc0FxVzIw?=
 =?utf-8?B?NG5sSmFIUlpKK3c1NE5tMzFxR2sxTnROZE45T0w0SHdtZWZuYmlRM2ZOUjY2?=
 =?utf-8?B?emJjcEQ4NGFVQzBWZm50Zm9YVVdLMkVvTVJ2RUROcjdlbWZXdENmR3ZyeGZn?=
 =?utf-8?B?L3Nqc3c2WXNHYVY1UDk2RWVRVEdVVDV5NFNTMmVyWlQ0RytxT2hEVEFjUDky?=
 =?utf-8?B?bzlTYWl4NFRidkNkTTUxUlJEL1VXeExmWXkySHorekZEaG4vOURjSThEeGRK?=
 =?utf-8?B?b0JIb2xBSVI1YjlLN1VRTUkwaExSWnQ1a2x4QUpVaEpWY0lrOWFRRlk2ZE1y?=
 =?utf-8?B?S3FnM0JuMW53NTNGZTBjM2tYWUZpUG1qMERBT1F3T29ZNmY3dy94ZHBiZzJH?=
 =?utf-8?B?dy9kZkhHNXZvNm5Va0tQbVZBeXNaaGU3YXVUZTlHcWp3cStsbllUdXZ2VVc3?=
 =?utf-8?B?V05xY0duVDF6NFNCQTVDcHg3ZVAvMkZwZ2NsaXdYbXhkMElUVGp6azN1RUZJ?=
 =?utf-8?B?eW1GNC9HVUVta0NxWnlNVFNwU0xTNENMbnB2RHBjeFFqVk80OGx3eVowSTYr?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9edc11b6-0dc4-4fab-a973-08da7f1430bb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 23:16:32.3618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BnYwv/7ZIVisxcWK7wUZfR9yB7NaYt8WRqjSPul0lg+Eu+Bt3nv52H4TL14teT7th4fhk0NHRuANCEIckUBSB/N8HLqTdtHli9DWkZtURI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2860
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


On 8/15/2022 10:32 AM, Rodrigo Vivi wrote:
> On Sun, Aug 14, 2022 at 04:46:54PM -0700, Vinay Belgaumkar wrote:
>> Host Turbo operates at efficient frequency when GT is not idle unless
>> the user or workload has forced it to a higher level. Replicate the same
>> behavior in SLPC by allowing the algorithm to use efficient frequency.
>> We had disabled it during boot due to concerns that it might break
>> kernel ABI for min frequency. However, this is not the case since
>> SLPC will still abide by the (min,max) range limits.
>>
>> With this change, min freq will be at efficient frequency level at init
>> instead of fused min (RPn). If user chooses to reduce min freq below the
>> efficient freq, we will turn off usage of efficient frequency and honor
>> the user request. When a higher value is written, it will get toggled
>> back again.
>>
>> The patch also corrects the register which needs to be read for obtaining
>> the correct efficient frequency for Gen9+.
>>
>> We see much better perf numbers with benchmarks like glmark2 with
>> efficient frequency usage enabled as expected.
>>
>> BugLink: https://gitlab.freedesktop.org/drm/intel/-/issues/5468
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> First of all sorry for looking to the old patch first... I was delayed in my inbox flow.
>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_rps.c         |  3 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 66 +++++++++++----------
>>   drivers/gpu/drm/i915/intel_mchbar_regs.h    |  3 +
>>   3 files changed, 40 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>> index c7d381ad90cf..281a086fc265 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>> @@ -1108,6 +1108,9 @@ void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *c
>>   	} else {
>>   		caps->rp0_freq = (rp_state_cap >>  0) & 0xff;
>>   		caps->rp1_freq = (rp_state_cap >>  8) & 0xff;
>> +		caps->rp1_freq = REG_FIELD_GET(RPE_MASK,
>> +					       intel_uncore_read(to_gt(i915)->uncore,
>> +					       GEN10_FREQ_INFO_REC));
> This register is only gen10+ while the func is gen6+.
> either we handle the platform properly or we create a new rpe_freq tracker somewhere
> and if that's available we use this rpe, otherwise we use the hw fused rp1 which is a good
> enough, but it is not the actual one resolved by pcode, like this new RPe one.
sure.
>
>>   		caps->min_freq = (rp_state_cap >> 16) & 0xff;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index e1fa1f32f29e..70a2af5f518d 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -465,6 +465,29 @@ int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
>>   	return ret;
>>   }
>>   
>> +static int slpc_ignore_eff_freq(struct intel_guc_slpc *slpc, bool ignore)
> I know this code was already there, but I do have some questions around this
> and maybe we can simplify now that are touching this function.
>
>> +{
>> +	int ret = 0;
>> +
>> +	if (ignore) {
>> +		ret = slpc_set_param(slpc,
>> +				     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> +				     ignore);
>> +		if (!ret)
>> +			return slpc_set_param(slpc,
>> +					      SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> +					      slpc->min_freq);
> why do we need to touch this min request here?
true, not needed anymore.
>
>> +	} else {
>> +		ret = slpc_unset_param(slpc,
>> +				       SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY);
> do we really need the unset param?
>
> for me using set_param(SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY, freq < rpe_freq)
> was enough...

Yup, removed this helper function as discussed.

Thanks,

Vinay.

>
>> +		if (!ret)
>> +			return slpc_unset_param(slpc,
>> +						SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   /**
>>    * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
>>    * @slpc: pointer to intel_guc_slpc.
>> @@ -491,6 +514,14 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>>   
>>   	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>>   
>> +		/* Ignore efficient freq if lower min freq is requested */
>> +		ret = slpc_ignore_eff_freq(slpc, val < slpc->rp1_freq);
>> +		if (unlikely(ret)) {
>> +			i915_probe_error(i915, "Failed to toggle efficient freq (%pe)\n",
>> +					 ERR_PTR(ret));
>> +			return ret;
>> +		}
>> +
>>   		ret = slpc_set_param(slpc,
>>   				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>>   				     val);
>> @@ -587,7 +618,9 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>>   		return ret;
>>   
>>   	if (!slpc->min_freq_softlimit) {
>> -		slpc->min_freq_softlimit = slpc->min_freq;
>> +		ret = intel_guc_slpc_get_min_freq(slpc, &slpc->min_freq_softlimit);
>> +		if (unlikely(ret))
>> +			return ret;
>>   		slpc_to_gt(slpc)->defaults.min_freq = slpc->min_freq_softlimit;
>>   	} else if (slpc->min_freq_softlimit != slpc->min_freq) {
>>   		return intel_guc_slpc_set_min_freq(slpc,
>> @@ -597,29 +630,6 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
>>   	return 0;
>>   }
>>   
>> -static int slpc_ignore_eff_freq(struct intel_guc_slpc *slpc, bool ignore)
>> -{
>> -	int ret = 0;
>> -
>> -	if (ignore) {
>> -		ret = slpc_set_param(slpc,
>> -				     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> -				     ignore);
>> -		if (!ret)
>> -			return slpc_set_param(slpc,
>> -					      SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> -					      slpc->min_freq);
>> -	} else {
>> -		ret = slpc_unset_param(slpc,
>> -				       SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY);
>> -		if (!ret)
>> -			return slpc_unset_param(slpc,
>> -						SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ);
>> -	}
>> -
>> -	return ret;
>> -}
>> -
>>   static int slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
>>   {
>>   	/* Force SLPC to used platform rp0 */
>> @@ -679,14 +689,6 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>>   
>>   	slpc_get_rp_values(slpc);
>>   
>> -	/* Ignore efficient freq and set min to platform min */
>> -	ret = slpc_ignore_eff_freq(slpc, true);
>> -	if (unlikely(ret)) {
>> -		i915_probe_error(i915, "Failed to set SLPC min to RPn (%pe)\n",
>> -				 ERR_PTR(ret));
>> -		return ret;
>> -	}
>> -
>>   	/* Set SLPC max limit to RP0 */
>>   	ret = slpc_use_fused_rp0(slpc);
>>   	if (unlikely(ret)) {
>> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
>> index 2aad2f0cc8db..ffc702b79579 100644
>> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
>> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
>> @@ -196,6 +196,9 @@
>>   #define   RP1_CAP_MASK				REG_GENMASK(15, 8)
>>   #define   RPN_CAP_MASK				REG_GENMASK(23, 16)
>>   
>> +#define GEN10_FREQ_INFO_REC			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
>> +#define   RPE_MASK				REG_GENMASK(15, 8)
>> +
>>   /* snb MCH registers for priority tuning */
>>   #define MCH_SSKPD				_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5d10)
>>   #define   SSKPD_NEW_WM0_MASK_HSW		REG_GENMASK64(63, 56)
>> -- 
>> 2.35.1
>>
