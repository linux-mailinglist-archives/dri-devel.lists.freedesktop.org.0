Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 368636EF95F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 19:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6175C10E8E4;
	Wed, 26 Apr 2023 17:29:19 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59EF10E8E4;
 Wed, 26 Apr 2023 17:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682530157; x=1714066157;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=EMYkBWhE2ooH47n4D8CcPL6JXSnXhdaF5ETvx8c44tA=;
 b=Yt21dU/QOOnPZztqiu+I8jaF/p9oPo4HPDdxLl5UEG70n3TC2LhvCKg4
 umUoy5UlbCa0qtD4SVBIy2yvItDiNJMq9oY/Xmka5DdsrYLiwABD43NX+
 gWKVQQMn4LQD2ruV/l8wVRNJiHkLKIglbH1Q0y89o1gr5ub/U1WdTv1WH
 2PBxeOPs/M0lVm5w1bRsy2uRj/oiNEr694wwToMsDnhrFB2hsJ1GVRIdR
 ce/gmWQtF0I9yPbx6CFyrUmrwJRaqJOS5a9KWwfldzdWYIdDyi2DjAfer
 5b/yx0wVhizwGDZuV3t2j0Uc+YSzy3YeAWH2HryjbC+g4bw4cKIZzvYu9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="326786078"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; 
 d="scan'208,217";a="326786078"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 10:29:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="1023713034"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; 
 d="scan'208,217";a="1023713034"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 26 Apr 2023 10:29:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 10:29:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 10:29:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 10:29:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 10:29:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kop4B0pRwvUT626nr0NLaJ2fXPdYVVfoyHvJCOBz0qhG1qc+1ne4xX964Ie7I39urNoREicZjEeFurJoB6vv/TVXqfeKYvwzMdarIwDINaCQtNuUb51OKvzCRPLk1uUQBZrDBCakdqPayWbHK+/HY3xytHMvHDgU3JmMDtcWBgSnwjz/GU5mXW0gopnTAXLrjMH2oESuN4l4Ye/pPzF0AliLsRaPfTGs1V3G0y8zIKqcc/uDn44HiCcPlIs+hJanihl6xnR6O/9oP2vjc02MTwD2dsQf4ufm5Y5Y/SiU02t1VzBbbjFht8AbuXH0d8dpqLbUZ1lZAvkPXygj3NCxMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOLhzUdw1Irgj+G7wDu+QHo7S/GdLw+pCOrpFDP5vLQ=;
 b=G+JIYjjBnn61a/XNOzm5xr9LvulguhRGine88Jsj4YVXPATXoOWq8P+4VZPm81SNEYkC9DfUespwqfn0x6x8GynjUPWH7LK/aPq7kcC6Q+6fvRGQpZKRDfZO1gPXTx+vpKQC+V8S2N279iM2+UIiuMlKRipbAJZT3j1IrGzntj27c5tZzcHp1XKqbU1V6sktMECoTlejQicUhFbS6Jo9RyGfbweIrRUxhiemZzRRTTWD+eqiPAtmBxM5quhrDZaubwvySH6Ws+ZqFoXsfhxUZB5mQ0eBU5bph132/I8z3Nv+F9UJ+j8CM3TwOeqMN/+M6UTq+VRDB5Z1DjXnRHuKlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN0PR11MB5712.namprd11.prod.outlook.com (2603:10b6:408:160::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 17:29:13 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2687:6af2:e0ca:c1e3]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2687:6af2:e0ca:c1e3%5]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 17:29:13 +0000
Content-Type: multipart/alternative;
 boundary="------------Lu6UiyxcPulGM004mx01fMXl"
Message-ID: <413b6fc5-3182-d5cd-9a86-d7a4d814064c@intel.com>
Date: Wed, 26 Apr 2023 10:29:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 4/5] drm/i915/guc: Capture list clean up - 3
Content-Language: en-GB
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230406222617.790484-1-John.C.Harrison@Intel.com>
 <20230406222617.790484-5-John.C.Harrison@Intel.com>
 <9e0711a1e40cdeccdf6ae003e924dfec5cdbb77b.camel@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <9e0711a1e40cdeccdf6ae003e924dfec5cdbb77b.camel@intel.com>
X-ClientProxiedBy: BYAPR07CA0106.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::47) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BN0PR11MB5712:EE_
X-MS-Office365-Filtering-Correlation-Id: d97e11f6-cb33-4c08-1525-08db467bc0f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MYa9uusDQ9EsCUYo++r4KMBKeK2CjQk/XBXq+v0azcSuUJxRbsZpkPUTw02VU0W7x9HTf4IL9S39h+R5Thkma2r8KLBZEwOYw8BcCfsY7MMaQQmn1EZlYQFUCljvpnsIADRSs3vJOUj9OV/sw11UdubxxyNkABnNljYYYSRzOxWR4h77Ax31h6Qt5SDpJwqa7e9QGUYFrHZVTLODBAbTKsRGPuZ4AxbnWGiox0SyGI5Oz2RU5FGnTQeHjaVTzDs9640Rx8m83EWd9FLMgP/bAiWZnHc+1eFqGJNZPCZ7kp/oGIVl0h57gzDQ2ROWBL+gVSRp/omjZhYrO33DtXsWPfddkjzoEm5cvJ4MwaPAGOYi2qTFefir4bNRpOipRZtWgSWka9Duiy/nnqljCAZTMOBjqUkhOagtwnQaoATu8bq9YC1LiWXJx91qCnFC+ZPWchvrT1RU2CMYY1eT4JhEQz6F9tCr1oDFtIqQyBxFEKsPIYGd6h7KxEb6grLWXyLpqBVPnrBQmWOEzvSK/3wY2uJGU32ihFtr2x7YRE3Q4l3EYtoUFB4UVVo7082KKpEJPNtYvA8JJTFm+6WFx0tVSLddNqxM87UahphX1oIMrFSum26H+rzfwX2EBmF8ckOjRgHwMM33tours63qJaBk6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199021)(41300700001)(2616005)(26005)(6512007)(53546011)(6506007)(5660300002)(82960400001)(8936002)(8676002)(31686004)(2906002)(38100700002)(4326008)(316002)(66946007)(66556008)(66476007)(450100002)(31696002)(36756003)(478600001)(33964004)(86362001)(186003)(110136005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2xRRGxZU2N6bEd2QUI3WXNtQjZGNVJrM0h1aVJHM2dNNEk2YXpmYmxwc0Zm?=
 =?utf-8?B?K2VDYUh3NjA0TmRkamtxMDFEZWpNSzBsaDVKSnAvUWFYUmJVZlkxakJFYzY2?=
 =?utf-8?B?TW9KM2FSRFlPdU5hRXdZTDloZmtYWkhNL0dMVHA0VXV0QWI3cnJaWFJzYXpV?=
 =?utf-8?B?UjVwS1NoQ0d1TTVvSE9RSmt6MTc5cnhoNlNEYUgxeU41UkhyYmhlamVYcWRJ?=
 =?utf-8?B?OWZSc3dJWUJYQlJCM1c1NCtyb0ovTGdzL2dNbkZ4dXIyRjY0Ry82Ty9vOXNM?=
 =?utf-8?B?QmoyTU1oY0FVZllXM0VtVkNBNnlzWGtJMUluOXFJTm1sZjBzdFRKbWR2SlR1?=
 =?utf-8?B?bkVXL1NuZjJMTFJvRUFmRjgwT0hXYWJ0bkh6ZTNXc3hYVFZta0xvUEd1SmRx?=
 =?utf-8?B?SnpkdldSd0s0SGhhdmFuVE9DcFp2alEzQnpCbEw0TmVxUXhGb20vdEJ2Mmt3?=
 =?utf-8?B?SGgxeFZkWjBVdXZBUU9nYWh3ZU5xdW04VXZ6VVdkMWU0WWVESmJkN2lJUXl6?=
 =?utf-8?B?S3BBQ0d6bFo2VkJzaWJGZG9hN3lHTnlZa250RFgyQWVFRjdOTUJRRU4xdkxW?=
 =?utf-8?B?VXFHbThuKzRwR1BRaUlTeTVYT1lzRi9UWVk3VFo5SnZscE95d21tS01GNlNF?=
 =?utf-8?B?clhGNElwZkhmTnl1OGdTQlNjcmJGVUk4WFlzbGVKSlZ3VkkybE5ORlJCcURh?=
 =?utf-8?B?QVlBa0xkWXhjeVEyaEN1THF1aVNaR1B0ZUdINmJ3YlVyb29uTjc3ZXNHaVJ6?=
 =?utf-8?B?WnVLREVoTURSUnBrQzhYeFJseVN3REFsRHp6RTdKZnNxR1gzMHYwQndGeE10?=
 =?utf-8?B?NzN6UUlrSlBQbWhKWG0zMnlwS1k5ZUE3SFBaazlGYUFJWnErSVRwSlh5Nml3?=
 =?utf-8?B?L3pUWnp0M09wYzNoU25HL2FReENpMHNPYkRXYXRuandWRzVIb2toaDVJOE8w?=
 =?utf-8?B?ZEZ3QUszQk1JS051WUN2VHRMd3B5M0xhWFJZc0pDbEkwVEgvbkgyemRyMHJC?=
 =?utf-8?B?K21DYkM2bURXdkhRUU44YkxmVXUxVEdwU3ZMZHVvQnN6Tlk5Q05OWnRrdUx6?=
 =?utf-8?B?U3ZBMWdnSHpRRnp2UlRmUDA5REwxUzhDcGpPYnlPeUI3MktrbXViUlpSUTda?=
 =?utf-8?B?b0hkZVQwYkFMYnVqOVdOYnVYaUkzd3RvN3c1WndJZXk1WVpvK1RvUVlmcDh0?=
 =?utf-8?B?OVphbG1OTlgrYzhJbnlRVUJoRlUzck9jVnI2OWE2TnFGMHIvbnNUa0oxc2px?=
 =?utf-8?B?WVpwZkUyNzVvamphTWRSL05XeWl2NTJyL0d6Z1ZwdzN5azkvZFFFUXRsUHZR?=
 =?utf-8?B?SUVOc1pCYkd3OUR0OVRUQVRLRS9nNTJnZUpoTm5YZTlYZEZIYkMxUGxxbkp0?=
 =?utf-8?B?dzlPK3J5QmZ6R2ZuNDBkQjVFc0FQMTJUQ0txWFJqK1oyUDdvUk5HRThvQzg5?=
 =?utf-8?B?M3A2S1B1dHBHUmhnRzJGbVEyOEdvbHAwNE5vWUJKVldKdndtazA1amgrMWMv?=
 =?utf-8?B?SGpZYkRGV25tYU9lNitjVkZhQWFvU1ZRUEljVGxWMURvYys1OHVzUC9rbzZD?=
 =?utf-8?B?Y2w5dnRMWk1iOS9VNzdEcGxYRW1PbWFIK3NydkRxaGtBUnhrdDRGY01LVTBw?=
 =?utf-8?B?SG42dFQ3cGtVK1VQaEF5NGxpNUFlS3ZqZlNaTlRwOGsvUzhqQmZFcHBiQWtk?=
 =?utf-8?B?cmo4eWtSdzcxYTFSbFR2bDFuRDdzcWVOUGNNK2F2b1dtUUlqMjBOTzRsazYw?=
 =?utf-8?B?NDhSOU1JSWVDTlRYeVlrZjVselQ5cUVpbFdhWGFENS9QaGF5WW5OdjN6VEdK?=
 =?utf-8?B?dTZVVEx5QWxqNkp0Z1hqUHJvR0hlVlYxQWRzNjBSYWVMMkN3clNqOHlGRDlO?=
 =?utf-8?B?U09DQzcyMnJPT3RnVkdEa1d5M28xaXRUREYzRTRPWHhhZGVMNGJIQ21tVjJT?=
 =?utf-8?B?VlJZaVdBZklJbzdrWUdBNDdnVUszSktMTjJOS2M5ZXViNUNBOXRPOGw3SnNu?=
 =?utf-8?B?aUVHOHNlMTQrYTlBOTNxdTB4NDlvcitvbHVQaWtzVXA4QmhycGhvL2ZhaU5S?=
 =?utf-8?B?aVZvMnVRdGxzOFgwS0FYS1R4cU1UK0R1RnpvcVg2ZjV6NFFUTE1VZHZ2MFVP?=
 =?utf-8?B?R01yY3NHaXNicCsxeFowZEJFKzUxNUl6NnQ4OStEckZKWGU0Q21UMU1CanFD?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d97e11f6-cb33-4c08-1525-08db467bc0f3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 17:29:13.6912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKi9AGuvtESSCNAIIJkwC9Op/tXPJuMWvGJpdeTvzvfz/sXGG7MI1eGndaXibA3Ctt/f4Z78n/GYeqBhdvld6oIWzkkCYoQeZovCMmhOl4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5712
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------Lu6UiyxcPulGM004mx01fMXl
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/25/2023 12:05, Teres Alexis, Alan Previn wrote:
> On Thu, 2023-04-06 at 15:26 -0700,John.C.Harrison@Intel.com  wrote:
>> From: John Harrison<John.C.Harrison@Intel.com>
>>
>> Fix Xe_LP name.
>>
>> Signed-off-by: John Harrison<John.C.Harrison@Intel.com>
> alan:snip
>
>
>> -/* GEN9/XE_LPD - Render / Compute Per-Engine-Instance */
>> +/* GEN8+ Render / Compute Per-Engine-Instance */
> alan: two comments on this:
> 1. shouldnt this go with the earlier patch?
See comment in cover letter:

    NB: The changes are being sent as multiple patches to make code review
    simpler. However, before merging it may be better to squash into a
    single patch, especially if it going to be sent with a 'fixes' tag.



> 2. i agree with renaming the names of the register to reflect the when
>     all of those registers got first introduced... however, considering
>     we only support GuC on Gen12 and beyond (we do have select CI-tests
>     that enable GuC on Gen9 but not on Gen8 and before), should we also
>     change the comments? I think the comment should reflect the usage
>     not just follow the same name of the registe #define - else why even
>     add the comments. (please apply this same comment for gen8_vd_inst_regs,
>     gen8_vec_inst_regs and gen8_blt_inst_regs).
> alternatively, we could keep those GEN8+ comments above the list but maybe
> add just one comment in the default list - see below.
Because at some point we might want to start supporting other platforms. 
My view is that the comment should be accurate. These registers exist on 
Gen8+. So if you are building a register list for a Gen8 or later 
device, they can/should be included.

> alan: snip
>
>> @@ -366,7 +364,7 @@ guc_capture_get_device_reglist(struct intel_guc *guc)
>>   	const struct __guc_mmio_reg_descr_group *lists;
>>   
>>   	if (GRAPHICS_VER(i915) >= 12)
>> -		lists = xe_lpd_lists;
>> +		lists = xe_lp_lists;
>>   	else
>>   		lists = default_lists;
> alan: perhaps add a comment that we really don't support any of this
> on anything below Gen9?
It wasn't me that named it 'default_' rather than gen9_. I could add yet 
another rename of s/default_/gen9_/g...

John.

>
>>   

--------------Lu6UiyxcPulGM004mx01fMXl
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 4/25/2023 12:05, Teres Alexis, Alan Previn wrote:<br>
    <blockquote type="cite" cite="mid:9e0711a1e40cdeccdf6ae003e924dfec5cdbb77b.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">On Thu, 2023-04-06 at 15:26 -0700, <a class="moz-txt-link-abbreviated" href="mailto:John.C.Harrison@Intel.com">John.C.Harrison@Intel.com</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>

Fix Xe_LP name.

Signed-off-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan:snip


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-/* GEN9/XE_LPD - Render / Compute Per-Engine-Instance */
+/* GEN8+ Render / Compute Per-Engine-Instance */
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan: two comments on this:
1. shouldnt this go with the earlier patch?</pre>
    </blockquote>
    See comment in cover letter:<br>
    <blockquote>
      <pre class="moz-quote-pre" wrap="">NB: The changes are being sent as multiple patches to make code review
simpler. However, before merging it may be better to squash into a
single patch, especially if it going to be sent with a 'fixes' tag.</pre>
    </blockquote>
    <br>
    <br>
    <blockquote type="cite" cite="mid:9e0711a1e40cdeccdf6ae003e924dfec5cdbb77b.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">
2. i agree with renaming the names of the register to reflect the when
   all of those registers got first introduced... however, considering
   we only support GuC on Gen12 and beyond (we do have select CI-tests
   that enable GuC on Gen9 but not on Gen8 and before), should we also
   change the comments? I think the comment should reflect the usage
   not just follow the same name of the registe #define - else why even
   add the comments. (please apply this same comment for gen8_vd_inst_regs,
   gen8_vec_inst_regs and gen8_blt_inst_regs).
alternatively, we could keep those GEN8+ comments above the list but maybe
add just one comment in the default list - see below.
</pre>
    </blockquote>
    Because at some point we might want to start supporting other
    platforms. My view is that the comment should be accurate. These
    registers exist on Gen8+. So if you are building a register list for
    a Gen8 or later device, they can/should be included.<br>
    <br>
    <blockquote type="cite" cite="mid:9e0711a1e40cdeccdf6ae003e924dfec5cdbb77b.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">
alan: snip

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -366,7 +364,7 @@ guc_capture_get_device_reglist(struct intel_guc *guc)
 	const struct __guc_mmio_reg_descr_group *lists;
 
 	if (GRAPHICS_VER(i915) &gt;= 12)
-		lists = xe_lpd_lists;
+		lists = xe_lp_lists;
 	else
 		lists = default_lists;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">alan: perhaps add a comment that we really don't support any of this
on anything below Gen9?</pre>
    </blockquote>
    It wasn't me that named it 'default_' rather than gen9_. I could add
    yet another rename of s/default_/gen9_/g...<br>
    <br>
    John.<br>
    <br>
    <blockquote type="cite" cite="mid:9e0711a1e40cdeccdf6ae003e924dfec5cdbb77b.camel@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------Lu6UiyxcPulGM004mx01fMXl--
