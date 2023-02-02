Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D21687B6D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 12:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A8D10E055;
	Thu,  2 Feb 2023 11:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7FA10E055;
 Thu,  2 Feb 2023 11:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675335767; x=1706871767;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RcFAh19GaaZfzX6ysYf4/t0VRwLsKRoB1jKRN4BWum8=;
 b=PQcDUejnt4q5rRy/VxFRh+4Yd26e9SdTUHWOMBN0S3GvaLFHio/Vw6mD
 q5kLpgpgXvUPQ1Xg2o/V0+3iBoXnRfh6Q8ddfjW6SeonSCOYo3+mk0pb+
 UpgFCBKsG6YxQPQf2srDCSZY4MFEVc+7rjOP56Hckp7Gob+U+xirbFiDm
 ONJaPzOu0C3VHOJtq5UozpaJKF92uLEBYShT7JBJpLbrVkf9s7seg+Umq
 s2hNxMyBIugB9HW+agH04JFTBqzshoTXjqyN49PjDaJBU3CWaQenK/dZD
 UF9mfFw8200bnRcs/Bzzh6c8McxAv1L8qPN/PCugaDRSsAZjppkyrxjoX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="393000202"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="393000202"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 03:02:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="697642396"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="697642396"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 02 Feb 2023 03:02:46 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 03:02:45 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 03:02:45 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 2 Feb 2023 03:02:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HI4G64CxZu+u2ZkD0V/pC1O9vlExgT6NpqLYfNDwZtnbfGSzdvElc9yEuDG9Ws1Qw6oqb2CtNyojDtvftc/ZnMA7AzcPdUMOeHM1gbuqqWZsvysrYFvkUJMKwOIEa1VyMQ1SzO/fEHgmtL3wS/1XEqo+Z0W9vLEXY7tRk6eLUZGZEbs7M7+ctrGgNikEEDDwQ4GsRtPQtDPZyUsk5LjtAK+uodubhd4iykJiy0K9iR0WdlaYCffbT0yTWszJ94h46itQNHChTw9q7n0hj0lvjMwYtDIHnzupOFhY2WOBbIBwq1Ov1SAZ5rWV/8AChZ+BxZhWCDvAAeE+6jjjL1/6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zIutPrM4C9yA8Trd8QH2b0b8eGEoarizcWkHFWWg8c=;
 b=Vb9RbowLriteF8TkfLPfd9G2j9SrMsPpDwfgsGho0zHeYijaF8Tu85lVMNStyhEomWZz2U5EnEV1h9Efy0cM0PPVGFPKlUMvzFtKGRUUR3Oa1whEPT3LaQWfQwNq4hfMFGw3pvkXUQQOW/2rrOPdhj6Rk6yyLNfMbbNB6qmrjSSQ9JuhJMtsGUqKlHCh0pjlwRchXw3zBZohaRi7oOxDwOAPj++78aUJ8+8AEk8M0n88YW0PlqFM+9xKBV2fIxPBvYiEQFvUFZ82NN+4oaj7tKYRohJm9327ECevZWbljy4BuXIZU9PCEdBcEb7fFSdAdcoharS9DXczRRIIPxE+HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by IA1PR11MB7679.namprd11.prod.outlook.com (2603:10b6:208:3f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 11:02:43 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::5d07:eb02:7913:fce2]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::5d07:eb02:7913:fce2%7]) with mapi id 15.20.6064.027; Thu, 2 Feb 2023
 11:02:43 +0000
Message-ID: <e320994c-2ab9-cb04-2249-ab00e6c11e3e@intel.com>
Date: Thu, 2 Feb 2023 13:01:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pcode: Wait 10 seconds for pcode to
 settle
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <b3d4b882-cb0b-a3c1-2609-6065f379ed15@intel.com>
 <Y9OSyhWHWu8iliP5@ashyti-mobl2.lan>
 <bfe11cf8-87a5-3768-92d5-3415145d8c8f@intel.com>
 <Y9eEX95t1i1YRVOk@ashyti-mobl2.lan> <Y9fXFrJp/N0cit18@intel.com>
 <Y9fsgJd7y6aEt/sT@ashyti-mobl2.lan> <Y9fySWFQwTPC1VAM@intel.com>
 <Y9f+sGkj2/rJpaMD@intel.com> <Y9grflHnhExehDO4@ashyti-mobl2.lan>
 <cd3ff678-30a4-172a-fa68-d4df1636c46e@intel.com>
 <Y9uCP2ejUJOw/J5t@ashyti-mobl2.lan>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <Y9uCP2ejUJOw/J5t@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0100.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::16) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5409:EE_|IA1PR11MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 5366bb45-9b9d-4fc0-ff02-08db050d01bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IcvAuMxubBGxBxN6v153dW4+AtRHm4XjM4leAZWJyjnyN9shG24tRj5U4/Gld3G8YpP9hNpObNxUIpKr9pTIomKzpCI7yM/cPZCrVnpWBnGsa8+bQk/p3XJhYjX6hX2pXDOK1vxPFpEAZCQ3hYti9pOGweHO3+uWyNYbdmJ38nKHeMnqBzLfaCbfSK+LWuNFa8bf9af9Qb4pDsxI2dKoBjdrpr8ls/QMpDG9uWnzSUG0N6iMD8qosbbmLHG4ZD0Z/ZjM+jo57JDUSR9DvMAtsrq5qWwPwZJ731lUZq7Wr3o5TZjeXnjth3iqFZR2SZN0VaFIWIv9B8od0UjajjD++45hx+iVZN0JeZTupIJECV7PfuxpmYNiUJO/UQuinKTgHUFK+XDfpTzapUhyTAUF9vYW+aahF4LF6HK7Nm2Lp2gy9xdJNdKQe+6kv99mnd3yKV33XLcOku9iZ4KU2hUmdBds57EY2yUG8zNguLTfAaVWMWkun1AwC2r6o7VHkntoVUJFu6r1/vthS9s/uIzODVdVjyOlX40EmAoLFEl1qhI4RkvwQOeF8V4dV91BgFVcRz/aoHXg8h+NzjVgHeTpdwilnDNUyufCxsEPQjnbB7d7ePwKG1EgBHIBa08ddv+8S/cggU89owg1uGf/0pctX+1mxVnE9+1PtR4n/mPSDPmML8ShaofTGRacjRB1bPiAFD2yj4JFqh9sV9FH6q62TzwORk6M79LEr3H8ebua82ri5CdZ8McwGUTAhraNIaD5SLylGFSRRmKPJDaXOGSgqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199018)(36756003)(478600001)(66946007)(82960400001)(66556008)(38100700002)(4326008)(6916009)(66476007)(83380400001)(8676002)(54906003)(316002)(6506007)(53546011)(26005)(186003)(6512007)(966005)(30864003)(6486002)(5660300002)(86362001)(41300700001)(31696002)(2616005)(8936002)(31686004)(2906002)(226643001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekhWUUFZNGUrM2RqS1BpcXptaFluTWw5dWZldXJydktOVGl5U21VdWU5YTVo?=
 =?utf-8?B?RnVSd3AzTUxscVVCVXRLQkYwNjd0N0FtYUxJbHAvWXViRElGem02YzNtUUJk?=
 =?utf-8?B?cjdQM2p2WVhIUmxPeWEwT0k1aUdwYVlEWENFdU1pZzhrZmdtRmpPZ3UvaDZE?=
 =?utf-8?B?QklTTlBUL0VyV0JkZEIyWVpqV04xd3dHQktwcm1TdkZ5cXhWQXRveU1FdFcz?=
 =?utf-8?B?dVBhV0VOYXA3aFBra0xySHF5bjlyeHhoaGZLeTE3ZkVheVpiNUJESFhsTG8v?=
 =?utf-8?B?OEtoWE1tcXQvaEZkNnpBNlRjY29Gci9SOW1oakVNNkExQjVGZHVLUi91dUls?=
 =?utf-8?B?L2NMVkcrVllwNVV6QWRsYWVoVFAwNWdySnU3SEVjdkFLYkJpNUtxbjZTcnQz?=
 =?utf-8?B?dUdKR2dLNGFpWUg0N0pJTHhZbWRCQk9WdDgyRHVDRDZtNWdTMVpDQVNzbVJ3?=
 =?utf-8?B?TG5OR3lWdGwvU3FQQmFabEh5L1RUS21QZ085L0hXRGNkTzYxRDRWUXpmNi9C?=
 =?utf-8?B?MXdISXRqUC9SaDFGNkVKK0RQZTZ5S3BWS2FvbmpnRForUGh1Nmx4ZGJ3Vmdh?=
 =?utf-8?B?Z1V3Z00ycytWZ0MrWS96NmFlNm5teVJDVFlqdXpVTnc2aUF0Qk82UU13R1Vp?=
 =?utf-8?B?TWpNTFNrRXg2cUY4b3l5Y1FFTUcrWnhodXcrZm15a2ZJQzlHenRPSzBiMmp5?=
 =?utf-8?B?aTYwbysxVFprOVEvTnFkRzBmeFdVOVNmNHNtYlpHVWsxV09IbmtlRUM3ZTZH?=
 =?utf-8?B?czU3dGh3dHo5WlhFR2h3VXRFT1F5Z0RGVHczYVFEM2FpRU5lUjFpTUlpYjhQ?=
 =?utf-8?B?ekFxZGNxRTltdHgva21leEZ6c3VRVS9oTzB0RTFkZHBGVjVtNWhWODFTRHdH?=
 =?utf-8?B?ZTQ0K3l2TVpiM1UxWGk5Y0JJUm1LKy9oWVpYTGxxVEtzcGRnUEJNeG05Zmlx?=
 =?utf-8?B?cnEzays1ME9lZUNTelpHeTZUeXAvczBIV2dLd0xpMURGQ1J3UUE3ZmI5RUdo?=
 =?utf-8?B?SGwySGdPSFFKZG5qWjV1Zk1DUDNIcTA1M2dBYW9nRmVGeVhwR2UxUEVONzdG?=
 =?utf-8?B?OXdyc2VJUmVZVU9TdVA3dzMyRllJN1VUSGM4SnZjWUc3RGE4ekFzTmRFZ29a?=
 =?utf-8?B?aWV6LzdTcDlLVTh1dlJzTjUrWDYxd2liY2ZLQ0paRVBlZHl0QWV4Tkxjdnpj?=
 =?utf-8?B?ajdwUEJHSE5WSWw2NTVHaUtIS0laK2xnaEpiYW04TnM3YXJ5LzBwc3did3cw?=
 =?utf-8?B?VVIwQ0QzMUhOUEt0MWNmNXBYWHFpL2s0VjJxU1FpTHV2d0Nhc2xXUGpYMmo5?=
 =?utf-8?B?TUEwMSswTys3VGJLNFQxaDJZdmJJalQ3dnFuVDBnenRnZTBxMzVUK25FdDdX?=
 =?utf-8?B?Q01uM2VtdnBEclUyMFJWbVFtU0RYYmhibVVHS1p4VExtVjdNV0laelJEazNr?=
 =?utf-8?B?a2JUR3BOYlF5aGkzMGo1T0VyR0hpeDZEb2J1Wnl3YW8xV0NJV3hodFp1YmhM?=
 =?utf-8?B?SHRQZnY1ZWw1YnExSm4vb252QWcwUjB2eUNEUWRrb1VoMmNOYVhDeVZiaS95?=
 =?utf-8?B?dU1mM05MQ3REb0c5a0lsbjEvUVRNd0JyOXlPc0hZS0doM1dkTlU5WlBxVEor?=
 =?utf-8?B?Y3lmaFRyV01hWnI3NTRDZlE5ak1MM1g5aGg3akJhT0FsYm8rQTNmQWZERnJJ?=
 =?utf-8?B?L0JZS2tkSCtnQkFtaHZYTU02NFJ0bWtMV014UnVqODBlQWpXY3VnN2tMaUZk?=
 =?utf-8?B?eElDT0svNFVRYjNzOFZES2cwN0RpL091ZzVIOFBMMVRzdEpHeEtvOXBmSFhm?=
 =?utf-8?B?cGc0QUNvS2Y5QjlDemFldlpZQXpGOGxSVHYwSjZrN0x1TmhZSkNuc1cyS00r?=
 =?utf-8?B?bmptZTBFT3hzbnRrdkVTcnl1eWdoTDdsc0lSU0xYQVc4Y09RMVc2ZXpPR0k3?=
 =?utf-8?B?bDY1WlZWMWgrYW5PS2o0Nm5DbGszWFdCZWJPREVmbUFFWlV6R21DdHd2dWJN?=
 =?utf-8?B?aUtmRkMrRTk1c3FlYUJpSmpLUGVqaEIwektxWm1ubmJZRFVML3hXRHJ6Q1ll?=
 =?utf-8?B?SXd6TEkxM05uc0dnL3h6dHlIOXNKNkQrWkFyQnRqbHpUb3hwbVlRQ3BUMUda?=
 =?utf-8?B?dStnclRhbVRxTnZZMDBveVJPT09qNTYvSy9jVU96YnB5K1RlVldDbm50aWNi?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5366bb45-9b9d-4fc0-ff02-08db050d01bc
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 11:02:42.6965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pa2uxD97N2SiNC7sZ+KBuwPfyJB4+ArDZ79I01kV89u9BAFRBonoB9MzgWOuNbHF58IZC2hupZHxXs9VWpvhS5mScg2OMtlMcEMAjsmSY7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7679
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/2/23 11:28 AM, Andi Shyti wrote:
> Hi GG,
> 
> On Thu, Feb 02, 2023 at 10:22:30AM +0200, Gwan-gyeong Mun wrote:
>> Hi Andi,
>>
>> You gave a lot of explanations, and confirmed that this patch solves the
>> problem, but the root cause of this problem still seems to be unclear.
>>
>> In the logs where this problem was reported, the logs were output in the
>> following order.
>>
>> link
>>   : https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_1294/bat-atsm-1/igt@i915_module_load@resize-bar.html#dmesg-warnings17324
>>
>> [log]
>> <7> [268.276586] i915 0000:4d:00.0: [drm:skl_pcode_request [i915]] PCODE
>> timeout, retrying with preemption disabled
>> ...
>> <4> [268.276942] WARNING: CPU: 1 PID: 1678 at
>> drivers/gpu/drm/i915/intel_pcode.c:196 skl_pcode_request+0x242/0x260 [i915]
>> ...
>> <3> [268.329058] i915 0000:4d:00.0: [drm] *ERROR* gt0: intel_pcode_init
>> failed -11
>>
>>
>> In other words, -EAGAIN was not returned when the first
>> skl_pcode_try_request() was executed in the skl_pcode_request() function,
>> but the logs confirmed that the _wait_for(COND ...) of the
>> skl_pcode_request() function was executed.
> 
> I'm not following... how can you say that -EAGAIN was not
> returned, it's written explecetly that pcode_init failed with
> -11, i.e. -EAGAIN.
> 
> Besides if we get as far as to receive "PCODE timeout, retrying
> with preemption disabled" isn't it because we failed twice? And
> apparently with -EAGAIN?
> 
> How can you say from the logs above that this
> 
> 	if (COND) {
> 		ret = 0;
> 		goto out;
> 	}
Hi Andi,
Because, the log outputs "<7> [268.276586] i915 0000:4d:00.0: 
[drm:skl_pcode_request [i915]] PCODE
timeout, retrying with preemption disabled"

Br,
G.G.
> 
> has not failed with -EAGAIN? The logs are not telling us how the
> calls to __skl_pcode_try_request() failed. I am telling you after
> I tested it.
> 
> I hope I understood what you are saying. Otherwise, let's have an
> offline chat.
> 
> Andi
> 
>> And, I reviewed bpsec in more detail to see if I missed anything related to
>> the status and restrictions of the initial GTDRIVER_MAILBOX_INTERFACE
>> (PCODE).
>>
>> I've reviewed bpsec in detail for the two below where
>> GTDRIVER_MAILBOX_INTERFACE is mentioned, but I haven't identified any
>> additional constraints other than those described below.
>>
>>
>> Pcode Driver Mailbox Spec: 34151
>> Driver Initialization Programming Sequence: 33149
>>
>> RUN_BUSY: SW may write to the two mailbox registers only when RUN_BUSY is
>> cleared (0b)
>>
>> My suggestion is that the HW should explain and analyze the root cause of
>> the situation where it takes more than 180s for the Busy bit of
>> GTDRIVER_MAILBOX_INTERFACE to change to 0.
>>
>> And the method of the proposed patch, the newly added line
>> "__intel_wait_for_register_fw(uncore, GEN6_PCODE_MAILBOX, GEN6_PCODE_READY,
>> 0, 500, 10000, NULL))" succeeded, but the existing method of trying 180s
>> with checking intel_uncore_read_fw(uncore,
>> GEN6_PCODE_MAILBOX)&GEN6_PCODE_READY) failed. Therefore please review it
>> again.
>> (Checking the code, it appears that both call usleep_range(wait__, wait__ *
>> 2); in __wait_for().)
>>
>> Br,
>>
>> G.G.
>>
>> int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
>> 		      u32 reply_mask, u32 reply, int timeout_base_ms)
>> {
>> 	u32 status;
>> 	int ret;
>>
>> 	mutex_lock(&uncore->i915->sb_lock);
>>
>> #define COND \
>> 	skl_pcode_try_request(uncore, mbox, request, reply_mask, reply, &status)
>>
>> 	/*
>> 	 * Prime the PCODE by doing a request first. Normally it guarantees
>> 	 * that a subsequent request, at most @timeout_base_ms later, succeeds.
>> 	 * _wait_for() doesn't guarantee when its passed condition is evaluated
>> 	 * first, so send the first request explicitly.
>> 	 */
>> 	if (COND) {
>> 		ret = 0;
>> 		goto out;
>> 	}
>> 	ret = _wait_for(COND, timeout_base_ms * 1000, 10, 10);
>> 	if (!ret)
>> 		goto out;
>>
>> 	/*
>> 	 * The above can time out if the number of requests was low (2 in the
>> 	 * worst case) _and_ PCODE was busy for some reason even after a
>> 	 * (queued) request and @timeout_base_ms delay. As a workaround retry
>> 	 * the poll with preemption disabled to maximize the number of
>> 	 * requests. Increase the timeout from @timeout_base_ms to 50ms to
>> 	 * account for interrupts that could reduce the number of these
>> 	 * requests, and for any quirks of the PCODE firmware that delays
>> 	 * the request completion.
>> 	 */
>> 	drm_dbg_kms(&uncore->i915->drm,
>> 		    "PCODE timeout, retrying with preemption disabled\n");
>> 	drm_WARN_ON_ONCE(&uncore->i915->drm, timeout_base_ms > 3);
>> 	preempt_disable();
>> 	ret = wait_for_atomic(COND, 50);
>> 	preempt_enable();
>>
>> out:
>> 	mutex_unlock(&uncore->i915->sb_lock);
>> 	return status ? status : ret;
>> #undef COND
>> }
>>
>>
>>
>>
>>
>>
>> On 1/30/23 10:41 PM, Andi Shyti wrote:
>>> Hi Rodrigo,
>>>
>>> first of all, thanks for looking into this!
>>>
>>>>>>>>> In the call flow invoked by intel_pcode_init(), I've added brief comments
>>>>>>>>> where further clarification is needed in this scenario, and a description of
>>>>>>>>> the suspicious scenario at the bottom.
>>>>>>>>>
>>>>>>>>> -------------------------------------------------------------------------
>>>>>>>>> intel_pcode_init()
>>>>>>>>>    |
>>>>>>>>>    +-> skl_pcode_request(uncore, DG1_PCODE_STATUS,
>>>>>>>>>                          DG1_UNCORE_GET_INIT_STATUS,
>>>>>>>>>                          DG1_UNCORE_INIT_STATUS_COMPLETE,
>>>>>>>>>                          DG1_UNCORE_INIT_STATUS_COMPLETE, 180000);
>>>>>>>>>          |
>>>>>>>>>          +-> skl_pcode_try_request()
>>>>>>>>>                |
>>>>>>>>>                +->  *status = __snb_pcode_rw(uncore, mbox, &request, NULL,
>>>>>>>>>                                              500, 0, true);
>>>>>>>>>
>>>>>>>>> -------------------------------------------------------------------------
>>>>>>>>> static int __snb_pcode_rw(struct intel_uncore *uncore, u32 mbox,
>>>>>>>>> 		          u32 *val, u32 *val1,
>>>>>>>>> 			  int fast_timeout_us, int slow_timeout_ms,
>>>>>>>>> 			  bool is_read)
>>>>>>>>> {
>>>>>>>>> ...
>>>>>>>>>           /* Before writing a value to the GEN6_PCODE_DATA register,
>>>>>>>>>              check if the bit in the GEN6_PCODE_MAILBOX register indicates
>>>>>>>>>              BUSY. */
>>>>>>>>> 	if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
>>>>>>>>> 		return -EAGAIN;
>>>>>>>>
>>>>>>>> what if we fail here because the punit is still initializing and
>>>>>>>> will be ready, say, in 10 seconds?
>>>>>>>>
>>>>>>>> GG, without going any further, we fail here! The -EAGAIN we
>>>>>>>> receive from the test comes from this point. We don't fail with
>>>>>>>> -ETIMEDOUT, but with -EAGAIN and the reason is because the punit
>>>>>>>> is not ready to perform the very fist communication and we fail
>>>>>>>> the probing.
>>>>>>>>
>>>>>>>> It doesn't mean, though, that there is anything wrong, we just
>>>>>>>> need to wait a bit before "taking drastic decisions"!
>>>>>>>>
>>>>>>>> This patch is suggesting to wait up to 10s for the punit to be
>>>>>>>> ready and eventually try to probe again... and, indeed, it works!
>>>>>>>
>>>>>>> As GG, what I still don't understand is how this extra 10 seconds
>>>>>>> wait helps... have you tried to simple add the 10 to the 180 and
>>>>>>> make the code 190 sec instead?
>>>>>>
>>>>>> maybe I haven't been able to explain the issue properly.
>>>>>>
>>>>>> I can even set that timer to 2hrs and a half and nothing changes
>>>>>> because we fail before.
>>>>>>
>>>>>> Here it's not a matter of how much do I wait but when do I check
>>>>>> the pcode readiness (i.e. signalled by the GEN6_PCODE_READY bit
>>>>>> in the GEN6_PCODE_MAILBOX register).
>>>>>>
>>>>>> During a normal run we are always sure that communicating with
>>>>>> the punit works, because we made it sure during the previous
>>>>>> transaction.
>>>>>>
>>>>>> During probe there is no previous transaction and we start
>>>>>> communicating with the punit without making sure that it is
>>>>>> ready. And indeed some times it is not, so that we suppress the
>>>>>> probing on purpose instead of giving it another chance.
>>>>>>
>>>>>> I admit that the commit message is not written properly and
>>>>>> rather misleading, but here it's not at all a matter of how much
>>>>>> do I wait.
>>>>>
>>>>> The commit message was initially confused because it looks like
>>>>> we are just adding a wait, without doing anything....
>>>>>
>>>>> But looking to the code we can see that it will wait until
>>>>> pcode is ready with a timeout of 10 seconds.
>>>>>
>>>>> But if pcode is ready in 10 seconds, why pcode is not ready
>>>>> in 190 seconds. We are doing absolutely nothing more that could
>>>>> make pcode ready in 10 seconds that won't be in 190.
>>>>>
>>>>> This is what we are missing here... The code as is doesn't make
>>>>> a lot of sense to us and it looks like it is solving the issue
>>>>> by the 10 extra seconds and not by some special status checking.
>>>>
>>>> Okay, after an offline talk I am convinced now that we need some
>>>> check like this in some place.
>>>>
>>>> But the commit message needs be be fully re-written.
>>>>
>>>> It needs to be clear that underneath, the pcode communication
>>>> functions will do a check for ready without any wait, what will
>>>> make desired timeout to never really wait for the pcode done
>>>> and prematurely return.
>>>>
>>>> at __snb_pcode_rw():
>>>>
>>>>    if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
>>>>                   return -EAGAIN;
>>>>
>>>> So, for this reason we need to ensure that pcode is really ready
>>>> before we wait.
>>>>
>>>> Other options are to handle the EAGAIN return and then wait.
>>>> Or even change the __snb_pcode_rw to ensure that it is ready...
>>>>
>>>> Something like:
>>>>
>>>> -       if (intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) & GEN6_PCODE_READY)
>>>> -               return -EAGAIN;
>>>> +       if (__intel_wait_for_register_fw(uncore, GEN6_PCODE_MAILBOX,
>>>> +                                        GEN6_PCODE_READY, GEN6_PCODE_READY,
>>>> +                                        fast_timeout_us,
>>>> +                                        slow_timeout_ms,
>>>> +                                        NULL))
>>>> +               return -ETIMEDOUT;
>>>
>>> This works, but the difference is that you are putting it on any
>>> call to the __snb_pcode_rw(), even when not necessary.
>>>
>>> Putting it in the schema we used in our offline chat, the
>>> original implementation was:
>>>
>>>    +-----------------------+
>>>    | r/w -> check if ready |-> r/w -> cir -> r/w -> cir -> r/w -> ...
>>>    +-----------------------+
>>>      probe time
>>>
>>> (where cir stands for "check if ready"). Because in the first
>>> r/w we didn't check the status of the punit we added:
>>>
>>>    +-------------------+
>>>    | cir -> r/w -> cir |-> r/w -> cir -> r/w -> cir -> r/w -> ...
>>>    +-------------------+
>>>       probe time
>>>
>>> So that we are sure that the first r/w works. What you are
>>> suggesting is:
>>>
>>>    +-------------------+
>>>    | cir -> r/w -> cir |-> cir -> r/w -> cir -> cir -> r/w -> cir ->
>>>    --------------------+
>>>       probe time
>>>
>>> As you can se we have two "check if ready" in a raw, which might
>>> be a bit of an overkill, it doesn't hurt much but it would look
>>> like:
>>>
>>>     if (__intel_wait_for_register_fw())
>>>     	return -EAGAIN;
>>>
>>>     intel_uncore_write_fw......
>>>
>>>     if (__intel_wait_for_register_fw())
>>>     	return -TIMEDOUT;
>>>
>>> and this for every single snb_pcode_r/w.
>>>
>>> Besides some functions might need the first wait, some might not.
>>> Check, for example icl_tc_cold_exit() where the -EAGAIN is
>>> handled. With your version the retries would be quite ponderous.
>>>
>>> I'm sorry, but I can't take your suggestion as it can have major
>>> consequences along i915, it requires more changes and and it
>>> needs to be carefully tested.
>>>
>>> On top of that I like Ashutosh refactoring that is quite an
>>> elegant way to gain more flexibility at boot time without any
>>> further impact.
>>>
>>>> In the best regular case it will not change anything since the wait
>>>> for will return 0 immediatelly... in the worst case we would double
>>>> the timeout value, but this would be only in this insane case of
>>>> 180 seconds anyway and if it goes really really nasty...
>>>>
>>>> But anyway, now the motivation and the source of the issue is pretty
>>>> clear, I can add my rv-b there, but I really want a better commit msg
>>>> at least...
>>>
>>> I definitely need to make a better commit message :)
>>>
>>> Thanks a lot,
>>> Andi
>>>
>>>>>
>>>>>>
>>>>>> Thanks, Rodrigo!
>>>>>> Andi
>>>>>>
>>>>>>>>
>>>>>>>> Andi
>>>>>>>>
>>>>>>>>>
>>>>>>>>>           /* write value to GEN6_PCODE_DATA register */
>>>>>>>>> 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA, *val);
>>>>>>>>>
>>>>>>>>> 	intel_uncore_write_fw(uncore, GEN6_PCODE_DATA1, val1 ? *val1 : 0);
>>>>>>>>>
>>>>>>>>>           /* In this scenario, the value
>>>>>>>>>              "DG1_PCODE_STATUS | GEN6_PCODE_READY"
>>>>>>>>>              is written to the GEN6_PCODE_MAILBOX register,
>>>>>>>>>              so that the Busy status of the GEN6_PCODE_MAILBOX register
>>>>>>>>>              can be checked later.
>>>>>>>>>              (When the value of the GEN6_PCODE_READY bit of the
>>>>>>>>>               GEN6_PCODE_MAILBOX register changes to 0, the operation can
>>>>>>>>>               be considered completed.) */
>>>>>>>>> 	intel_uncore_write_fw(uncore,
>>>>>>>>> 			      GEN6_PCODE_MAILBOX, GEN6_PCODE_READY | mbox);
>>>>>>>>>
>>>>>>>>>           /* In this scenario, verify that the BUSY status bit in the
>>>>>>>>>              GEN6_PCODE_MAILBOX register turns off for up to 500us. */
>>>>>>>>> 	if (__intel_wait_for_register_fw(uncore,
>>>>>>>>> 					 GEN6_PCODE_MAILBOX,
>>>>>>>>> 					 GEN6_PCODE_READY, 0,
>>>>>>>>> 					 fast_timeout_us,
>>>>>>>>> 					 slow_timeout_ms,
>>>>>>>>> 					 &mbox))
>>>>>>>>> 		return -ETIMEDOUT;
>>>>>>>>>           /* If there is a failure here, it may be considered that the
>>>>>>>>>              "DG1_PCODE_STATUS | GEN6_PCODE_READY" operation was not
>>>>>>>>>              completed within 500us */
>>>>>>>>> ...
>>>>>>>>> }
>>>>>>>>>
>>>>>>>>> int skl_pcode_request(struct intel_uncore *uncore, u32 mbox, u32 request,
>>>>>>>>> 		      u32 reply_mask, u32 reply, int timeout_base_ms)
>>>>>>>>> {
>>>>>>>>> 	u32 status;
>>>>>>>>> 	int ret;
>>>>>>>>>
>>>>>>>>> 	mutex_lock(&uncore->i915->sb_lock);
>>>>>>>>>
>>>>>>>>> #define COND \
>>>>>>>>> 	skl_pcode_try_request(uncore, mbox, request, reply_mask, reply, &status)
>>>>>>>>>
>>>>>>>>>           /* the first trial for skl_pcode_try_request() can return
>>>>>>>>>              -EAGAIN or -ETIMEDOUT. And the code did not check the error
>>>>>>>>>              code here, so we don't know how far the __snb_pcode_rw()
>>>>>>>>>              function went. It is not known whether the pcode_mailbox
>>>>>>>>>              status was busy before writing the value to the
>>>>>>>>>              GEN6_PCODE_DATA register or after.*/
>>>>>>>>> 	if (COND) {
>>>>>>>>> 		ret = 0;
>>>>>>>>> 		goto out;
>>>>>>>>> 	}
>>>>>>>>>
>>>>>>>>>           /* In this scenario, skl_pcode_try_request() is invoked every
>>>>>>>>>              10us for 180 seconds. When skl_pcode_try_request() returns
>>>>>>>>>              -EAGAIN and -ETIMEDOUT by _wait_for(),
>>>>>>>>>              -ETIMEDOUT is returned to a variable ret. */
>>>>>>>>>
>>>>>>>>> 	ret = _wait_for(COND, timeout_base_ms * 1000, 10, 10);
>>>>>>>>>
>>>>>>>>> 	if (!ret)
>>>>>>>>> 		goto out;
>>>>>>>>>
>>>>>>>>> 	/*
>>>>>>>>> 	 * The above can time out if the number of requests was low (2 in the
>>>>>>>>> 	 * worst case) _and_ PCODE was busy for some reason even after a
>>>>>>>>> 	 * (queued) request and @timeout_base_ms delay. As a workaround retry
>>>>>>>>> 	 * the poll with preemption disabled to maximize the number of
>>>>>>>>> 	 * requests. Increase the timeout from @timeout_base_ms to 50ms to
>>>>>>>>> 	 * account for interrupts that could reduce the number of these
>>>>>>>>> 	 * requests, and for any quirks of the PCODE firmware that delays
>>>>>>>>> 	 * the request completion.
>>>>>>>>> 	 */
>>>>>>>>> 	drm_dbg_kms(&uncore->i915->drm,
>>>>>>>>> 		    "PCODE timeout, retrying with preemption disabled\n");
>>>>>>>>> 	drm_WARN_ON_ONCE(&uncore->i915->drm, timeout_base_ms > 3);
>>>>>>>>> 	preempt_disable();
>>>>>>>>> 	ret = wait_for_atomic(COND, 50);
>>>>>>>>>
>>>>>>>>> 	preempt_enable();
>>>>>>>>>
>>>>>>>>> out:
>>>>>>>>> 	mutex_unlock(&uncore->i915->sb_lock);
>>>>>>>>> 	return status ? status : ret;
>>>>>>>>> #undef COND
>>>>>>>>> }
>>>>>>>>>
>>>>>>>>> ---------------------------------------------------------
>>>>>>>>>
>>>>>>>>> If you try skl_pcode_try_request() for 180 seconds in skl_pcode_request(),
>>>>>>>>> and the first "intel_uncore_read_fw(uncore, GEN6_PCODE_MAILBOX) &
>>>>>>>>> GEN6_PCODE_READY)" call in __snb_pcode_rw() that skl_pcode_try_request()
>>>>>>>>> invokes always fails. if then it does not make sense to me why this patch
>>>>>>>>> fixes it by just waiting 10 seconds.This is because if it was called with
>>>>>>>>> the flow described above, 180 seconds is longer than 10 seconds, so the
>>>>>>>>> scenario you mentioned is also covered in the existing code.
>>>>>>>>>
>>>>>>>>> To describe in more detail the second scenario I previously commented on:
>>>>>>>>> skl_pcode_request() tries skl_pcode_try_request() for 180 seconds
>>>>>>>>>    1) In skl_pcode_try_request(), the GEN6_PCODE_MAILBOX register bit is not
>>>>>>>>> BUSY, so the value is written to the GEN6_PCODE_DATA1 register.
>>>>>>>>>    2) skl_pcode_try_request() returns -ETIMEDOUT value because the operation
>>>>>>>>> of 1) does not complete within 500us.
>>>>>>>>>    3) Scenario in which the GEN6_PCODE_MAILBOX register bit is checked as BUSY
>>>>>>>>> and returns -EAGAIN in the last call of skl_pcode_try_request() invoked by
>>>>>>>>> skl_pcode_request()
>>>>>>>>>
>>>>>>>>> If the reason why this problem occurred is because of this scenario,
>>>>>>>>> shouldn't there be an attempt to increase fast_timeout_us used as an
>>>>>>>>> argument of __snb_pcode_rw() to 500us or more when skl_pcode_try_request()
>>>>>>>>> returns -ETIMEDOUT?
>>>>>>>>>
>>>>>>>>> Br,
>>>>>>>>> G.G.
