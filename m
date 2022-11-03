Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 709516188D6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 20:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374A810E0D5;
	Thu,  3 Nov 2022 19:37:32 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E13510E0D5;
 Thu,  3 Nov 2022 19:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667504248; x=1699040248;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xXNJq5iHRtWS2/GBKTxwnfZY7z6ouHVWkC7Vegl6yG0=;
 b=XEcFq+8OcZOaKcUqyapPvxQ08rF9farzMaktnfzwdUYZbXIbleXcm6s8
 0/+Ap6vI1+Ckx2lHKhRkBZDUJICgHbLfsLDBodXgbWwuTzb861UrcJzfA
 j87aEmwxtG6GutyQtugg4OI/jCjS8+0Y9t8BuyycUrthtJ94O/kJPfdg4
 kK4CGaweR6thsTTgR2q6YVIC9fokivweAwerNF7V+15g2Pa7XSdCkXeuq
 aEpeCytofNOfNy0iNj5NFLyf80CcwhjmNEHD/HrhoNbGzln+/X4x1VwTI
 xd6sB9x9bebsJGuCPJdGizRAZyqI65/xvyLV+if8u8vt732lS5PwPlGC8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="308501979"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; d="scan'208";a="308501979"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2022 12:37:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="880014331"
X-IronPort-AV: E=Sophos;i="5.96,135,1665471600"; d="scan'208";a="880014331"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 03 Nov 2022 12:37:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 12:37:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 3 Nov 2022 12:37:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 3 Nov 2022 12:37:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2wzvPRVhT7WqeeE3RkXQngIV0qRTtsnOJVU1BXv2rhNZ4tY3W/hK6Xnq7GnRD5JMSjseu0fpaxyDcd4FlXZ6avWEyD4g6eY0ybmGGtRR6yrkfed8ZGEwLJEgN10Ltg9eSe93ndEQXpLzj9byuDcfL1PdHXqhnBqVn3LpYA4g8rLP+5uKoHQRoTSQ5ttY4r4sEhg5tTowr1MhFL8t6+RWea3asFxU81Q/TOll2ya0U2Q8Sd14QzK2haG+X+NK7iGz6FTPGuKdFnsHofS3oOMMPuwfCj7pO0MjKNI3iyY353J9eRg6nqz0KP1Lw73NE+duUeHLjwcD2+248ub1EQe2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wU4ek98jiUqpGHypROdRw1haKqv43Jth5+PATBRuBc=;
 b=Uoxf0YOSD5zH0eAqo/enEtsLxoAbJPtOXTBQY/QCponZN8U9Wx7wDoVQpnur1cgis61od1mcvuIhBDzY/Khuk2m1KW9A2t/X9ih6+MCthKuMmTnFpXXtCK5F6pvpfJjmVlMMaV05CRi75ni0J9HFxZKk4Rr4BZLK2kSf3mBh9EfyDkIvZr1iCmeFEMx9waf2GchFQEdGIDG3T7BTR73qVkU1hXUdeqyFo66Kc7rgP1wjVIQA6q04yJkGcKIkTQmYuoleONL9QmHm7Wjqha3Zp+d5t9wueqUl76Yl3XFmZ4RUu+6ggnnjL6x5+DQVghifM3cWKAhlm7dws5UF8eWtlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB5972.namprd11.prod.outlook.com (2603:10b6:8:5f::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.22; Thu, 3 Nov 2022 19:37:25 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::87a1:bf2f:7377:3036%7]) with mapi id 15.20.5791.020; Thu, 3 Nov 2022
 19:37:25 +0000
Message-ID: <f541b8bb-95ee-f92c-4e25-2098cf59214f@intel.com>
Date: Thu, 3 Nov 2022 12:37:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't wait forever in drop_caches
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20221101235053.1650364-1-John.C.Harrison@Intel.com>
 <87k04d7dyn.fsf@intel.com>
 <c710a428-50f6-6181-3f93-4d7667a9ac3f@linux.intel.com>
 <5e22de43-d75c-fc21-9ae7-f27d116c5688@intel.com>
 <1855f0f2-8a1c-7bf4-76c0-76a4354ea8e8@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <1855f0f2-8a1c-7bf4-76c0-76a4354ea8e8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::29) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: bb079bbe-fef0-4988-44e8-08dabdd2d4f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yghyo3eHMhXSvCk9hPsW7732HISGc5J1oRENlR29ZW323AK5UvyBDbPJb7GssvcJwLDsV75sPxnXytlC/G2eUo1dXg3scjqA4sZ1cEsDJczsMUC15KOQr505pvsRSYc1AE+40BA2D0YkstwrSmVHPFBmxF4hOh/xDrLDfchMHHXzBLvjWebh9b928EDcwvw2/ppVgp1VRPIqXHZAfMu1Txb/iUas+ohdm0s+jt/wXN/bGBIgZ9QVd/G14Wu9Zyq3ZeX1O/CndTcb7qqWwk0p8YwTRg0GEby0IY+Soo6pn4FzRpKXvdKcFL5w7RlxJTMVoqpRikS+e3lKaXyknAuiHqEgLEQNOMadqbiWFLn0bj/0hLP3T69ho5rVUGxiz8eUNk8OMdTtiYOX4MaKpRRmLfXJYPihyaMcDKjk/hGtzmYH+aSBS3crRfgR/rFMSCP3DbQFsoi+K8hIzKVFAH4TlAXhSjQrg7c9bqlv5KO8gWsBdyBK0HUIeeOdUC5pt8hDJb+two7qJ8O6L9D2FvTRPFIm6aS3G0dKfUPAv285FwEzO8VRzJSqNJwWbZMDSyzVdx3+oPg512NlDGXwB9RXZ2Tte91qu7iJ6Ti1MDdJ0STqzeI0o7Vh8gll++yQYDyFEhFUECoInNVpfpJL5nRxUhDq3h7rfU9H/M9c54a1+TkLr0lzy3bX1/SqdROCbVwBwUhADgmLEHIRoKvUx5M6ppEUbcucoqS5NqtSDhS8o0JgftT4JC08vICPrd6irR7MS7TycLVa8S6H9t8s93S360N8te4FsyEujHeVfmAjbTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199015)(186003)(2616005)(36756003)(2906002)(8676002)(4326008)(66556008)(66476007)(66946007)(83380400001)(6666004)(478600001)(6486002)(86362001)(6512007)(110136005)(26005)(31696002)(316002)(5660300002)(6506007)(53546011)(8936002)(31686004)(41300700001)(38100700002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzFsWS83VUIweWg1MXg2S202alI0amQ1NEpQRCttYmZyeXVRSUFOMTFjNWNR?=
 =?utf-8?B?UTI5eXJaYndtU3pSZkJsQWR1Tk1IRDJGb2dxZXZpZTVhRzErRUxzQ2hjODA2?=
 =?utf-8?B?M0tLMGoyQ2dSNFJKLy8xLzkyNzRybW9jNWM0RzdJZTBDbmxDS3E1K1V5YlF5?=
 =?utf-8?B?QXl1eDdIV3VjTzh6SGEyQWRtSzJpY3A5MDlaUzBzZlRqeml0ZHBDWFUwSVo2?=
 =?utf-8?B?V3BvNFBJTE02ZndLUURhMVo0Y2tRRUZSaytUSEUzUDBZNEw4SktwOHlEcG9Y?=
 =?utf-8?B?R0F5L2xjYmFuRHhzUzhVYlhtblhPUks1ZDNUem5vWFRsa2lCMHRVcDlPOGg3?=
 =?utf-8?B?MjhaZFd2Q2VOUGpwbVNGelQraTZaMThvK21BVGVGSU1WSW1nS3g3YlllU1BU?=
 =?utf-8?B?Rnl0OTBFNndXNlAwSVlENWxvUjZQeVB3N0VoajdDRmg5Ky9aR004d1lzT0Za?=
 =?utf-8?B?VlpzQ0JCV0Z0dEg0bTBOdmNjdHQvZTdTYlpJS1Y3ckRmY2QzTFA5RFpVai94?=
 =?utf-8?B?STlJcnVDWThXRlRmbkNFbFkxSklrcHVIK3V6djcyZVI5dnhrejJONXh3ZGxB?=
 =?utf-8?B?c1U5ZGdvVEZ3c3dJWWRHdHFmbDV0bllpRTYzTjVjZURpd0VMVWxqRkd2NEdW?=
 =?utf-8?B?NU52a24xbWNIb3FxTURMYzNHYlAwUHpERFk4WllCcXB3dFZvNmZnUmJIOW5V?=
 =?utf-8?B?Zk4wck9kWDU1TGJ2akxaNFdDY0dsUmkrYnZVOXpmTjdEeG9rZ2pjN0l5N1RL?=
 =?utf-8?B?d3hPMS9vekpkc3M5RmxQbEpLVHRFZ3BQZUgyYW01T0U4V3VJNWt0VWVtdVFV?=
 =?utf-8?B?aWkzUjEyL2lCKzlzbkwwRWxubW12NTJIcGpXNCtpN0FkT3BQQVJYQi9pUG4z?=
 =?utf-8?B?RmdHOXR3dkQ3c1JpQ3hHZ3VTUzJwUVRBYXErNWVZYjVESXFYRGpKOHp3V1k0?=
 =?utf-8?B?TXZ1WXJWSHIxZy84M3oyWmYyOSsyUU5OcTJlcmZLb05mWWprMnFTVWhHZys2?=
 =?utf-8?B?R2NSbGIvYk9WZ0ltY0ZYby9WRkU4WnljUnVabFp0eExEYTY2NVZBdHg2RTJ3?=
 =?utf-8?B?M1kvUUk2ejZmM0pqZWEzOFRSbUtBeldBai9LcGh4MFlZL3EzN2xZa1prZW02?=
 =?utf-8?B?Y1BOOHF0bzJCTWZMeFgxSjhlYStGZTlYUkR0UmdsWUQ1NEs0TlE0Y1B6a3Nr?=
 =?utf-8?B?TmZpWWNKSU4xRlNkRHpjRW9KVHZSRlduNFlxejBybktvUjVaeGkzNVRLODhh?=
 =?utf-8?B?NGFIQXFxbWxNbDVxMzhxZjYvSzJBRlJNMURYZGZSaWRGa05kaFBFc040UE1F?=
 =?utf-8?B?R0xtbE0wYkNXREpOSUx3MW9DWS9UODl2TVFOWlNST3RHRzY4QVQzK3l0Uzhh?=
 =?utf-8?B?aUpWUDhBZytRbFJwaEZ3TUFwSXZnUHB0cVhRbzUxNXpVMnFNcGhZbGhoN2dS?=
 =?utf-8?B?UVNYby9WOXB0d3dxMWtwSlJ2elg5ZC8rQ21qcXpSSlIrWFZ1Und1STR2QjJt?=
 =?utf-8?B?TXJnWmsrQU9rRjlVeTFlbkRsU0MyNW9ua3BUQW1EZEtJT1czVDlhMnN5TVlY?=
 =?utf-8?B?NXFTUkFGUU9XbmJwdFd6a1JOU2lyMkk1SUVGTGliRGY3NmJSSUxVRS9aTHI2?=
 =?utf-8?B?ajluZUluWVg0ZUl0WkdaSXVIYk5yL09zeGEzM25Ubk9aVmFVQU9Xc3RXUFZ2?=
 =?utf-8?B?Zm9xQW9OdDAvZlQ0V3V1OHd0dlNRYmVpd3U5YXl5Q0VmT3lRMTk3YmFQNUpJ?=
 =?utf-8?B?UXBrMDNtWXdITnVSWWVSeU9QejZzWlUxNkZlT1dUaVNOUkFrOEdJTjhTaUZi?=
 =?utf-8?B?ejlpSFp4M05tNUV1cmdXVmk2MmZ5N1U0UDZjWlBjWWV6RTdMaDZ4Y0hRdlh0?=
 =?utf-8?B?aFpZUUNtSGlXM21VY0tWRXQ1bHUwc3EyWUR3d3pnUXlzMVZ5VnlWMUhnYWRa?=
 =?utf-8?B?VGdzWldsUzJGWmd3am5HUStSbVRZTmE2RURRT3N4bmtzUVo3RytlbklZUXlF?=
 =?utf-8?B?TDR0ZmFuTFV2cTBQd2lmN0l3U0xValBEbE40WnVFb05kaFZSUjE0UWdEMFBp?=
 =?utf-8?B?Y2ZQcTAyelZNajhiVzQza2dvSnZISVlnWmRDeFhzbEcwdVpXc1FyMTZoWTZv?=
 =?utf-8?B?QjFlMFk3YjZPaVFiOVZFWVlqMlJqVW85SVBackRjMGtFWWZrQTYra0FVSW5z?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb079bbe-fef0-4988-44e8-08dabdd2d4f0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 19:37:25.0268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A61jKtBGgEjrCwcZ206eD/eLiPYhXE3/aKiA13ff69hrm/W/OEA7sW9A6Wr7SSdOOtEGJsorvCCRqdIDYtjr50D3WboA1doEsW4mz+2Z5Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5972
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/3/2022 02:18, Tvrtko Ursulin wrote:
> On 03/11/2022 01:33, John Harrison wrote:
>> On 11/2/2022 07:20, Tvrtko Ursulin wrote:
>>> On 02/11/2022 12:12, Jani Nikula wrote:
>>>> On Tue, 01 Nov 2022, John.C.Harrison@Intel.com wrote:
>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>
>>>>> At the end of each test, IGT does a drop caches call via sysfs with
>>>>
>>>> sysfs?
>> Sorry, that was meant to say debugfs. I've also been working on some 
>> sysfs IGT issues and evidently got my wires crossed!
>>
>>>>
>>>>> special flags set. One of the possible paths waits for idle with an
>>>>> infinite timeout. That causes problems for debugging issues when CI
>>>>> catches a "can't go idle" test failure. Best case, the CI system 
>>>>> times
>>>>> out (after 90s), attempts a bunch of state dump actions and then
>>>>> reboots the system to recover it. Worst case, the CI system can't do
>>>>> anything at all and then times out (after 1000s) and simply reboots.
>>>>> Sometimes a serial port log of dmesg might be available, sometimes 
>>>>> not.
>>>>>
>>>>> So rather than making life hard for ourselves, change the timeout to
>>>>> be 10s rather than infinite. Also, trigger the standard
>>>>> wedge/reset/recover sequence so that testing can continue with a
>>>>> working system (if possible).
>>>>>
>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/i915_debugfs.c | 7 ++++++-
>>>>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c 
>>>>> b/drivers/gpu/drm/i915/i915_debugfs.c
>>>>> index ae987e92251dd..9d916fbbfc27c 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_debugfs.c
>>>>> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
>>>>> @@ -641,6 +641,9 @@ DEFINE_SIMPLE_ATTRIBUTE(i915_perf_noa_delay_fops,
>>>>>             DROP_RESET_ACTIVE | \
>>>>>             DROP_RESET_SEQNO | \
>>>>>             DROP_RCU)
>>>>> +
>>>>> +#define DROP_IDLE_TIMEOUT    (HZ * 10)
>>>>
>>>> I915_IDLE_ENGINES_TIMEOUT is defined in i915_drv.h. It's also only 
>>>> used
>>>> here.
>>>
>>> So move here, dropping i915 prefix, next to the newly proposed one?
>> Sure, can do that.
>>
>>>
>>>> I915_GEM_IDLE_TIMEOUT is defined in i915_gem.h. It's only used in
>>>> gt/intel_gt.c.
>>>
>>> Move there and rename to GT_IDLE_TIMEOUT?
>>>
>>>> I915_GT_SUSPEND_IDLE_TIMEOUT is defined and used only in 
>>>> intel_gt_pm.c.
>>>
>>> No action needed, maybe drop i915 prefix if wanted.
>>>
>> These two are totally unrelated and in code not being touched by this 
>> change. I would rather not conflate changing random other things with 
>> fixing this specific issue.
>>
>>>> I915_IDLE_ENGINES_TIMEOUT is in ms, the rest are in jiffies.
>>>
>>> Add _MS suffix if wanted.
>>>
>>>> My head spins.
>>>
>>> I follow and raise that the newly proposed DROP_IDLE_TIMEOUT applies 
>>> to DROP_ACTIVE and not only DROP_IDLE.
>> My original intention for the name was that is the 'drop caches 
>> timeout for intel_gt_wait_for_idle'. Which is quite the mouthful and 
>> hence abbreviated to DROP_IDLE_TIMEOUT. But yes, I realised later 
>> that name can be conflated with the DROP_IDLE flag. Will rename.
>>
>>
>>>
>>> Things get refactored, code moves around, bits get left behind, who 
>>> knows. No reason to get too worked up. :) As long as people are 
>>> taking a wider view when touching the code base, and are not afraid 
>>> to send cleanups, things should be good.
>> On the other hand, if every patch gets blocked in code review because 
>> someone points out some completely unrelated piece of code could be a 
>> bit better then nothing ever gets fixed. If you spot something that 
>> you think should be improved, isn't the general idea that you should 
>> post a patch yourself to improve it?
>
> There's two maintainers per branch and an order of magnitude or two 
> more developers so it'd be nice if cleanups would just be incoming on 
> self-initiative basis. ;)
It's not just maintainers that look at the code and spot problems. Where 
do you think patch set came from? It was not on my list of tasks to work 
on. No-one had logged this as a super urgent bug that needs to be fixed. 
I noticed a problem when trying to debug another issue and saw a way to 
improve the i915 debuggability. So I tried to fix it on a 
'self-initiative basis'. And already that trivial fix has ballooned into 
I don't know how many hours of work that has not been spent on doing the 
things I'm actually supposed to working on.

Likewise, the a bunch of other patches I have recently posted. They are 
just things I happened to spot and spontaneously decided to fix.

And if you don't have time to fix something yourself, you can always 
just log it as a piece of work that needs to be done and add it to the 
backlog of tasks. It will then get assigned to whoever actually has the 
time to do it according to how important it really is.

John.


>
>>> For the actual functional change at hand - it would be nice if code 
>>> paths in question could handle SIGINT and then we could punt the 
>>> decision on how long someone wants to wait purely to userspace. But 
>>> it's probably hard and it's only debugfs so whatever.
>>>
>> The code paths in question will already abort on a signal won't they? 
>> Both intel_gt_wait_for_idle() and intel_guc_wait_for_pending_msg(), 
>> which is where the uc_wait_for_idle eventually ends up, have an 
>> 'if(signal_pending) return -EINTR;' check. Beyond that, it sounds 
>> like what you are asking for is a change in the IGT libraries and/or 
>> CI framework to start sending signals after some specific timeout. 
>> That seems like a significantly more complex change (in terms of the 
>> number of entities affected and number of groups involved) and 
>> unnecessary.
>
> If you say so, I haven't looked at them all. But if the code path in 
> question already aborts on signals then I am not sure what is the 
> patch fixing? I assumed you are trying to avoid the write stuck in D 
> forever, which then prevents driver unload and everything, requiring 
> the test runner to eventually reboot. If you say SIGINT works then you 
> can already recover from userspace, no?
>
>>> Whether or not 10s is enough CI will hopefully tell us. I'd probably 
>>> err on the side of safety and make it longer, but at most half from 
>>> the test runner timeout.
>> This is supposed to be test clean up. This is not about how long a 
>> particular test takes to complete but about how long it takes to 
>> declare the system broken after the test has already finished. I 
>> would argue that even 10s is massively longer than required.
>>
>>>
>>> I am not convinced that wedging is correct though. Conceptually 
>>> could be just that the timeout is too short. What does wedging 
>>> really give us, on top of limiting the wait, when latter AFAIU is 
>>> the key factor which would prevent the need to reboot the machine?
>>>
>> It gives us a system that knows what state it is in. If we can't idle 
>> the GT then something is very badly wrong. Wedging indicates that. It 
>> also ensure that a full GT reset will be attempted before the next 
>> test is run. Helping to prevent a failure on test X from propagating 
>> into failures of unrelated tests X+1, X+2, ... And if the GT reset 
>> does not work because the system is really that badly broken then 
>> future tests will not run rather than report erroneous failures.
>>
>> This is not about getting a more stable system for end users by 
>> sweeping issues under the carpet and pretending all is well. End 
>> users don't run IGTs or explicitly call dodgy debugfs entry points. 
>> The sole motivation here is to get more accurate results from CI. 
>> That is, correctly identifying which test has hit a problem, getting 
>> valid debug analysis for that test (logs and such) and allowing 
>> further testing to complete correctly in the case where the system 
>> can be recovered.
>
> I don't really oppose shortening of the timeout in principle, just 
> want a clear statement if this is something IGT / test runner could 
> already do or not. It can apply a timeout, it can also send SIGINT, 
> and it could even trigger a reset from outside. Sure it is debugfs 
> hacks so general "kernel should not implement policy" need not be 
> strictly followed, but lets have it clear what are the options.
>
> Regards,
>
> Tvrtko

