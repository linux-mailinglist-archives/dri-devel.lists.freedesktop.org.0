Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7CC5F6EC2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 22:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6434910E892;
	Thu,  6 Oct 2022 20:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E9C10E892;
 Thu,  6 Oct 2022 20:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665087408; x=1696623408;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2C4WGwL9xieQj5yyLiFQ11kYlzrFwlIN2aMTgs6hDO4=;
 b=cHyJHWZs1jmMZYehvq979sEr/U1Qzm4TIvLm9P/zJhYBms5b0LjSwTD+
 D/+g94S3kBF//etxtJTZc4eI0aHks2Ts2f6Qx+D2F5qP7v8/0ya08+NdM
 /xLlfTRJ3Wc/MdrBQcFX/C2LBitUdQ1TmcbnI8TSf5qy0hIYZqtsxxKQU
 RrBjgCFo1NAMQQxddNZ+mujG0/k1wld9PD0g0wTlGmNDx9qUQ0853xkbJ
 munFJIf6IuY96oslGEdqrQe9FajqWaEylxvdYdQQqhux/cGmRitphwvd/
 D0X9meNGC1mdsq8Yw5xjkCAyw90yllqe8QyxPLi6BA3gMZjC8Gys16lyL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="303538227"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="303538227"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 13:16:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="869991239"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="869991239"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 06 Oct 2022 13:16:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 6 Oct 2022 13:16:47 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 6 Oct 2022 13:16:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 6 Oct 2022 13:16:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 6 Oct 2022 13:16:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYsyZ89i70Z9/6Bi3VFjaIlFuEfBWosU0/zmGcCF80Q0u8TPVJ4BV6dZSK/Dem21621wyWhVP3TrwCEWgLgVi+WyAB7867oronoZ4pFHYH4dfUuIFd+w8hae3I/q8b7i/UYUoWTLYOXNZT889KWSOQjnumPFRfSJRdt7Cz89dM0LvQ30UsanS3TVs4/dH1WfKwJLF5VXyWn0HoBsEpJc1VmItDskCgmqDkomHg1HnxlAOGnGMeOQc5zMe2Juj4Gbs7lmTIakOq5PGRI4x+xqjrFuAXK008VY/LXxQ9ndd7hAMIwAnLn/FP1I8lymgv9qFryUBy0AWPwh5q83hRaeKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1jyF9hhbil38+wP9mwMXwRnUAXDgPYyDprHchnYkSA=;
 b=XWZ2p6x6k8VaHcHwi5A17zrqSQ1Fsp1sa0RLHPGrKpSkMOv9KCl++/ovuiv8hWbFk759CaEjsygcJ7CL7fFGwpY6lGEJR2nOtSE0odfCRtct1UlRIGyeodqbSmCZTi3mTllK9THPU+mkoDW9+PTsa1NVLLazbNftbu0alAdyYFFqfyrHwyMGmyVwbZvXbIplz3rbAAqgGEJxDPpoB03NXi4jNxw94xpp7fSWublUDAiYDLkwRsR8xSLl/CHeZ4C3t0ZWlr6o8xvJG30svpeO+fB9l6IIV4q+tf6f2Qw7m331Isay4H45YANZZ6xhu96s7a14uSRwQy/hCHNiJAs+mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH7PR11MB6378.namprd11.prod.outlook.com (2603:10b6:510:1fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.36; Thu, 6 Oct
 2022 20:16:44 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::e8e8:7e00:919e:7a44]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::e8e8:7e00:919e:7a44%5]) with mapi id 15.20.5676.031; Thu, 6 Oct 2022
 20:16:44 +0000
Message-ID: <d34651c0-f7ef-3cf5-fe30-0ce04163552a@intel.com>
Date: Thu, 6 Oct 2022 13:16:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/huc: bump timeout for delayed load
 and reduce print verbosity
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221006172056.1381588-1-daniele.ceraolospurio@intel.com>
 <ab07d4f9-84e9-461e-d9a5-20ea852d30ca@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <ab07d4f9-84e9-461e-d9a5-20ea852d30ca@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::23) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH7PR11MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd3872e-d090-41cd-ca9a-08daa7d7b014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dp8ARo/XJbXUeb75CV58OcqqZmdrnHyTguwekPRZwZ1nUAR8YNt6svPe+lgt2BUskxIOX34rcZZKp4idGLO4BKkDUGglGdRKHtj5JdwLF/G2i1LInriQJlaj5jS8D3KywGo6kVvvjxNckaLYeMQBIvWL7GAUzEBXrrGmQwSM2uWDzFJ5MgbIFn9Sp75gVr+AL0Vi9WE75jzqgfHwdQ4RN5OVxfoPOuSoYcLiz/iLasvfT9UCOqROizQiFJLC3NJ8YNdFCjMCWnJAngORK+kNFT8IF/IO9xcp3L9xgNlRIzNzIY/AErdYiPb+BIm7I/A0PrhQBi7pSlqVWpAI+pWxgo4lvkivaux2wl5cefLbIw4BxZddjzgeas8GVbdf7JhGsr/uRKLRq1VSX0d4Tsw6bHOnjw+MwBaTdA7zrPr9sqD9wuhVdRgrrJhIjDwx2Is8J3Px2VZM2lfsrbaG7j3oQYUZlZJc3BT/b49rrgQbQoLyB2Fa6YIsWwtR+fPDGR3YKD/6E9+krJXFCxAGKcG3zWNVoRMDZGhSwXNpkzstYsJWw/sIy9QmvFtTXUVSoFilLi5Ch8w73IBAKeo5fR9X1TP4WXhEQLwTk1lWTmLw+xheYgXt7Kn9tU1DjLM1DUDLBmd/6aNb2eyn6R1+DziqyIaMu85wuZAuQoQwy6zsuZXUpTq7GgqIIyAdPZG8MKg1phb2DwJHjtws00E+iFnjD0O82sKwoF9FQIE348vV63pW3AehIlLvmgSPAQoRLARA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199015)(5660300002)(8676002)(41300700001)(66556008)(450100002)(4326008)(66476007)(2906002)(8936002)(66946007)(478600001)(53546011)(26005)(6512007)(316002)(6666004)(6506007)(966005)(6486002)(31696002)(86362001)(36756003)(83380400001)(2616005)(186003)(82960400001)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1FPY05JQlpxWE9qUGlHM2E1YThwS2NhVkJTeklaQ2JHZEU2S0ZldkQ3TENy?=
 =?utf-8?B?bi9rb0ZjcjJhN0lWRHVHcGFCYkVjVXpLa1JGTnZWUEpMT0l3NGxnOFNZamRv?=
 =?utf-8?B?ZVM3cWg2NUppYmZ5Z05kYkhPNnlEbEVaZjQxaFpJcDhicHpqUitad2wzMDJI?=
 =?utf-8?B?QTBjazVaQjRjcno5THcvTWhFTk5IVU02emI3cGU1eU5JVkMweU1OQnppb2pw?=
 =?utf-8?B?TGxKcGdiWUxodThoalhXQm8ycEhTMGpTTnpqMU9WWWxUUlNKSVU1Q2ZlU0Ux?=
 =?utf-8?B?SGgzUi9MQkl0WVdIa2FidmJWUk9NN0oxQnI1a3RxcEsrbjRWbUZ6V1ZtZ0dI?=
 =?utf-8?B?ZUhzV2VPSGh1U1cremhEZ2w5MzNVeUVyY1RxK25paUlGK0JIWUZ2WldIWlRp?=
 =?utf-8?B?U2E5OHVRcUZjWGNteFk1ZTMvaDRkNXhDaXFEd2ZOWG1hQnNlSyt4TnBqQnFm?=
 =?utf-8?B?VkFycDZ1NlFuUFVMUFZxTWVMd1A5UHV5M2VhNlBjbFp6WU1EWVdUcXJjZ2hi?=
 =?utf-8?B?cnVzYlc0b1prM3RXQnJ0KzFHbmJWcGl0dy90UkF3SU05anRSWDF0dUJrT2wx?=
 =?utf-8?B?Y1ZzNnVmZ2c4d1lidUx6U1BwQlc4Q1Fwa3VIdHRReWVYK3RraklnZUxCS1Fh?=
 =?utf-8?B?bEVXOXQ0alRVL1JjTy9wQkhNcmdEN0tndUtuQkdxYjYwZHh5SCtpTWVVNGJK?=
 =?utf-8?B?UmFTV0VOSUtUbllHdUR1WVlObGQxY0EwdEtpOXRmUksxSFVkRnJPUC96cEZq?=
 =?utf-8?B?RzJ2MFUwQmoyc25xR1RwdkJZbEdWM1AyalJPZk1xU0U5anhaN1BuSTY2dXQ3?=
 =?utf-8?B?S09DUUJkTzhnWWZKdXg5WFdVUWpsZVU5aGhSVGlaeUl0ZVY0eXViR2RYM0Q2?=
 =?utf-8?B?V2lTTzJrUzdNMUNDdW1oYXJ0Uk9IWTVjSTBTYmRwUzBKMklxazdkd2tKQmM4?=
 =?utf-8?B?a1ovQm10R3BOREJvMjF1Tk5FVW1WME1sZFZqTTFwWCtHWjhIRmdSM1JmbjhQ?=
 =?utf-8?B?Y25VMUxkZ1FjcFlsZERzWmpnOTdWN1V6UkFyci9FVUt3cENnUXI2bXBnRjhz?=
 =?utf-8?B?S1llNUpuV3E4Y0VrTG5jSnJpODFPc0lFTVpsWW1VVVppUVQ1bUtMbUpQRWVz?=
 =?utf-8?B?M2JFczU3SmhWZU96dForV3NiSHJYcU9GT3lCcE01a1VzbUtxcEtlMEE1RjBS?=
 =?utf-8?B?WCs1eTQ5aVR1YjU3djJTRTlaWUk0VitNNmN2MnJOcHZsekhiME9FT0NTUTd2?=
 =?utf-8?B?dHJGeVMwRGxFZ2pmZk9USThzUEEyWFJPaEFsa0VmSmlQWk51a0M4THZwajcx?=
 =?utf-8?B?VU1qMVhXSS9qeU9JeUtWRTkzUEtZMmE3Y2gwU3ErZnRENEdkbGpFNDA3UXV6?=
 =?utf-8?B?eDlwb0pjN1ZZUE9xNTRnbUlDOFB5aU5IbXUwdlA5QmhzbXM2ZmZ5U3JBaFhn?=
 =?utf-8?B?NU0zVE9XNTR5Z1hGbmFUb2daZFZVaG5qSXdaV2kvaXdUbDJHbjZKVTBhclo4?=
 =?utf-8?B?RHdRaGRYZGQ3cHRYZWozdjZMOTI2N0ZBNU12ZzFLS0dRdzJibmo2ODgzUXk1?=
 =?utf-8?B?Yk81T3AxT2QrSjhrckdqSElqWmFNblFuRW9BQTNKWWE3dE5TTzFXSUtDU1Nz?=
 =?utf-8?B?eTF5SVdVaXpyNFFJMVVtUWZWa2lRWGNMdVA2ZjNscGRvdHJNUFQ1VHQxZXll?=
 =?utf-8?B?Ynd0V0xJSmZiRjd1d0lPOTQ4YU5UODVjWGNSZkFiejFMTTQvWTFjRkdaSHVh?=
 =?utf-8?B?QStvcHhzR3VpbUVuQTFxaFhmRC9vMW5mallvQ1R0QTlIc0pSS2JTdnNSMmgr?=
 =?utf-8?B?NmVZVG1SZUxTSmJhdFFQY0hEakRwL0ZwTnhBOHdjZ3o0QXJFY0dLNFZVb21j?=
 =?utf-8?B?bFBmaWVnRGI1MmhEWTZoWlRpM1FCYSt4UWI1SWsxUnZiV2dLZ2tQcnY2ait4?=
 =?utf-8?B?cmhrMWZnRVBIOEJZQVVZc2htZmNocnRpeTJhNXNGdGFZT3dLZ2ovRmo3UzZw?=
 =?utf-8?B?U1l2RU9Xc1VvZWhncGYwOHVWelk1S0huNTR0NkxQK2U2dUlyWkFmM2l1OWxI?=
 =?utf-8?B?V3VheDBjNEVyeVhvZGhhY2dsYTQzS2hQWXdRTFpxdnZ5ZGdOeCt0M3hpRExY?=
 =?utf-8?B?czZONEYra29sZVdob0RxSVF6MXAzejFGbGRzd083Tjg0aE9LNnZodVk3SURx?=
 =?utf-8?Q?fh+6WeJo/QDeUANYfr0QbK0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd3872e-d090-41cd-ca9a-08daa7d7b014
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 20:16:44.2024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egyjVH3U1ypQWJWyzIomJoQPD3FCXjV27il1+VDk5b0daiQ5m5wKNDqynu7yEV1FgdTjp/zSknzi+m/9NLOzXZ/X+q8mt6BMJNmKOlLRl68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6378
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



On 10/6/2022 1:09 PM, John Harrison wrote:
> On 10/6/2022 10:20, Daniele Ceraolo Spurio wrote:
>> We're observing sporadic HuC delayed load timeouts in CI, due to mei_pxp
>> binding completing later than we expected. HuC is still still loaded
> still still
>
>> when the bind occurs, but in the meantime i915 has started allowing
>> submission to the VCS engines even if HuC is not there.
>> In most of the cases I've observed, the timeout was due to the
>> init/resume of another driver between i915 and mei hitting errors and
>> thus adding an extra delay, but HuC was still loaded before userspace
>> could submit, because the whole resume process time was increased by the
>> delays.
>>
>> Given that there is no upper bound to the delay that can be introduced
>> by other drivers, I've reached the following compromise with the media
>> team:
>>
>> 1) i915 is going to bump the timeout to 5s, to reduce the probability
>> of reaching it. We still expect HuC to be loaded before userspace
>> starts submitting, so increasing the timeout should have no impact on
>> normal operations, but in case something weird happens we don't want to
>> stall video submissions for too long.
>>
>> 2) The media driver will cope with the failing submissions that manage
>> to go through between i915 init/resume complete and HuC loading, if any
>> ever happen. This could cause a small corruption of video playback
>> immediately after a resume (we should be safe on boot because the media
>> driver polls the HUC_STATUS ioctl before starting submissions).
>>
>> Since we're accepting the timeout as a valid outcome, I'm also reducing
>> the print verbosity from error to notice.
>>
>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/7033
>> Fixes: 27536e03271d ("drm/i915/huc: track delayed HuC load with a 
>> fence")
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Tony Ye <tony.ye@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index 4d1cc383b681..73a6a2fae637 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> @@ -52,10 +52,12 @@
>>    * guaranteed for this to happen during boot, so the big timeout is 
>> a safety net
>>    * that we never expect to need.
>>    * MEI-PXP + HuC load usually takes ~300ms, but if the GSC needs to 
>> be resumed
>> - * and/or reset, this can take longer.
>> + * and/or reset, this can take longer. Note that the kernel might 
>> schedule
>> + * other work between the i915 init/resume and the MEI one, which 
>> can add to
>> + * the delay.
>>    */
>>   #define GSC_INIT_TIMEOUT_MS 10000
>> -#define PXP_INIT_TIMEOUT_MS 2000
>> +#define PXP_INIT_TIMEOUT_MS 5000
> If we already have the GSC timeout at 10s, why not just use 10s for 
> PXP as well?

They're different type of operations: mei_gsc is a full on aux driver, 
so it is loaded only once during boot; mei_pxp is a component and it is 
bound on init and then unbound/re-bound on suspend/resume. On resume we 
don't want timeouts excessively big.

>
>>     static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
>>                    enum i915_sw_fence_notify state)
>> @@ -104,8 +106,8 @@ static enum hrtimer_restart 
>> huc_delayed_load_timer_callback(struct hrtimer *hrti
>>       struct intel_huc *huc = container_of(hrtimer, struct intel_huc, 
>> delayed_load.timer);
>>         if (!intel_huc_is_authenticated(huc)) {
>> -        drm_err(&huc_to_gt(huc)->i915->drm,
>> -            "timed out waiting for GSC init to load HuC\n");
>> +        drm_notice(&huc_to_gt(huc)->i915->drm,
>> +               "timed out waiting for GSC init to load HuC\n");
> If the failure is that the MEI PXP module hasn't loaded yet, why is 
> the error message 'waiting for GSC init'? Or can we not distinguish 
> between GSC load timeout and PXP load timeout? In which case should 
> the message refer to 'GSC/PXP'?

I wanted to keep things simple and have a unified message for both 
scenarios as what we care about from an i915 POV is that something went 
wrong on the mei side. I can split it up.

Daniele

>
> John.
>
>>             __gsc_init_error(huc);
>>       }
>

