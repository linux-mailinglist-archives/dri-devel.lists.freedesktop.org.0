Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDAD3EF67D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 02:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0456D6E283;
	Wed, 18 Aug 2021 00:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C136E24E;
 Wed, 18 Aug 2021 00:08:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="196485142"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="196485142"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 17:08:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="449471540"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 17 Aug 2021 17:08:07 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 17 Aug 2021 17:08:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Tue, 17 Aug 2021 17:08:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 17 Aug 2021 17:08:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liAhmFEkbb8HB6VUPi1GVVWDU0xUdYujpAX2NU1cZ9wbqPgBRFjf921QxAwfUAOSVr/Bi+Ewuc5MY9Fh9TCri9q1iLWfnNOnaKKeECjMFm5vP0Uhq6r+5ABXc7X8a9Ap1DgerjzeNI1yyHnTszk3p/d4MplUzDvsFAT+eTpYhEohqubCLsVHmcroaiSRsa1iHMRNQSFilsH7ELYAO2Mve7C8CGKUoxed+/WN963SrJmAFEi1SmckxgUz9e2mmH81d+rpWcHV56DECXZWGdkYoV90JAWSvvQqo7I102oDdOjhsfH3jB8CtSmZTlvhCWCz8YLHUDgPlTfnKvZ9mdIgEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/JHjKqyBPls6kO7VDY00XJHUF+DrKUw7EIKlCNf5ik=;
 b=PbTLxLXjmGkUOu9WAgGmraYMoD1zCNQEklGTlwFHNHYfkgcBC/UhavP7ezwAB4BYlCpMiOdkMznCrR1w3njX6vcvoj8E3Id3h9mylvMW3KWqDYrnfLh/TdvD0Y+hQOg7Ua0ovPDl8HKEC4L2LyY4YoRIFETXalq60VXg5yQjclbwt9wQNstpMckGmzRGy6qIo2D54T/yvaf8eDUYWdcue5CgHH/YpiELPPLtjGbRK48getwtkQIlJn7XlFurnXpMPsj/UNtE3KrZlhTPLcDV7Z6tPzbVBDVqTUltGVT3oGL7zIl131g5hzLAiAa4Z26LrbNwiugLShP09ApwjIgYhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/JHjKqyBPls6kO7VDY00XJHUF+DrKUw7EIKlCNf5ik=;
 b=Bv9tkWcqaoPeB7GKeQKqevReFcMrX2VR+9qQabsXu3Mv50EX+OtP6iKfmc2DmIuvT/IfhS3VW/gJA1NzVtsVP8eszHPqdciL+XgZxpdm4V++DuL87lroIn6UYp6k0iUtwP2ztcfG58gmcxrPUZgFFEPUxmdQqjL/SNqAXrFx27Y=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Wed, 18 Aug
 2021 00:08:05 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::20c6:723b:4f13:3110]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::20c6:723b:4f13:3110%6]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 00:08:05 +0000
Subject: Re: [Intel-gfx] [PATCH 0/1] Fix gem_ctx_persistence failures with GuC
 submission
To: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210729003400.151864-1-matthew.brost@intel.com>
 <YRIe8jEI+0TLreAI@phenom.ffwll.local>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <669f9d98-8128-eb4f-60f7-342c79f7f428@intel.com>
Date: Tue, 17 Aug 2021 17:08:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <YRIe8jEI+0TLreAI@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:300:ee::14) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR04CA0028.namprd04.prod.outlook.com (2603:10b6:300:ee::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 00:08:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f79be892-164b-4c9f-1415-08d961dc4039
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5674C7BD178355AD39E8D5D7BDFF9@PH0PR11MB5674.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bE5lPYFl4XMkRFwhJnRU+RxI71Wnx5LamvASU/k549WYPbvMyMvAOBbko/O8t7Uwnjn9m0210fziSnZcqDVODeHwxMZa/JFfBeaUGRf8lh0nTohKq9HByh48rnudr073LPjj3Qb/LloO6edpd7QaJlwBh9V0E3xUXf3zmOL8M7VOzyNd/txJ7wka6Wzq8vVgCVn4JkVFK9iKu434RU+Zv66wu82mAgpnKzBV0GOWaLkc6aJr7EBMd6VKSZPbjHKIFtHGSC6DrMxmoI20LXqv59Fb2onbAdVkxDlJaIbbCA/leZ9QlG/r5XyVf4RD+U1rJOj8zVKnVbKY1sGata9QQgKcawdHqDftXkeXNXUeTT3v77aP5hzcywDu3XNosmUWFLA3eF16opd03xIceGswIRnFjXWX9ZQyPK8KR9Vj7Q4/XIxi5QEVwrshsad4J+BWxR0E4siQUXvm9urfPVpNWiGQ0gMNsGZBe69aE7tjmj1JfL8n6iCInIUEKf9NqX9nOWI5iyHSzXBFtfdcwRJoN4UyxB2LH5ToLZijLcugtlMuX7DCUeCiZxLoFlrA4oA8AZ8ytXAWcT/Tr7+UIfRz+TRvqdytC9KTI3oPL8tT9/MKPiQloY0zrrQL0yh8YBLQvIshTZAkCzPLazblzZvQFjJsjR/bXxmongLtcYhWyozliX976tZYyosjYsgbd3GyPumUYocXHMlpYhuAyK41+bGACf/GMaoKlFW1ItPWKV0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(2616005)(956004)(2906002)(83380400001)(478600001)(8676002)(31696002)(86362001)(8936002)(4326008)(31686004)(38100700002)(66556008)(5660300002)(186003)(26005)(66946007)(6486002)(66476007)(110136005)(53546011)(316002)(36756003)(6636002)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU9NOWp1bk9QMlRyMHVvTXljNW1ESGFtdGs1RnNEdWRtN21hTGovTUdTbGRJ?=
 =?utf-8?B?QnJBcGZMNlNkNlFWS0VscnZGVDA5ZGs4WkdBUWNnTmtLUHdIYVlhRWZUakVS?=
 =?utf-8?B?NkZHSXRNREZ5Tm8vUjllUUs4WVo2aERwOFQvOHEwQVl0cDhNMEZyc0cwSnVD?=
 =?utf-8?B?N0lDUWZCcVVNRFdwNkM0ZDFINzR3a09Hd0ZmZDExRjYxdlJNZE9oSjR6MW1q?=
 =?utf-8?B?bFRBN0wvallZOXVHektlVTVXTGlvUGtYVGRqaUhVVk5lczJqM3hXcWdCcmFG?=
 =?utf-8?B?RHQrL3F6clJxdVhaUE1oMGVGOTRESmhxdldGQzB6dlREa1VIck5kSmRkeEFO?=
 =?utf-8?B?ejRuWk9pa2VWdURiZUtxczMremV6blFoRHpyaW1qSExvZjlwM1dQdXpJenNj?=
 =?utf-8?B?R05EUm5lUndYQ3ZjaG1UM2ZKSFpVUlZmc3pCZ05rSzdhK1c1OWc2czNHZU95?=
 =?utf-8?B?MXdTd00vcWFXc3BhTU1IN2dBSWN6OG9YMnNjSStFVGZ3VHpYZ09KM2dwcnVu?=
 =?utf-8?B?ZmRJaDd5aWhRSUhscXFJbFRBc1J4R1pvM1Uxb1hyeDhzaklKc0pxdnBOTGdJ?=
 =?utf-8?B?T2x5MTJ2endMcUlQemEzNGNScmRTSlcvL1U0SWtNUWQrczlQLzNkSFVnaTRr?=
 =?utf-8?B?T1dkbW5mZnZqUlloTU5YN1Z1emw5NkFYcFlRU2RpVnZhN3FPTExEdEE3NXVt?=
 =?utf-8?B?TDVzZEc0b01vYlM0NWVySUd3TkFoNmZMc01LQS9JVG1ib1hwa2NnREd6ZVpi?=
 =?utf-8?B?U05POEd3Tm81ZEhNQTVvWlV5T0xzWTFHcElSYTQzczhIV1FyMkJMemlWNjln?=
 =?utf-8?B?YnFIYnJVOHdrQmJJY3dNbmpLUVJZWTZTRm1hNnRTSktUTStRNFVTU05GMW1W?=
 =?utf-8?B?RUhyeXRLUG5VdWVxUHM1V254eFNkaWtjTVJpYWMzRkZFaHNIUi9jVG9QcENm?=
 =?utf-8?B?Q1BEcTk2WVRiWEREc2QyMmpHcSszeHlneG1wNjR4OThlY3FyS1Y1NmRNRVgv?=
 =?utf-8?B?NHhCYjV0Q2tQN0JTRzJHM2JCTmUzeWxSbnVZdFY0VGF2ak1ya296NW9UeUsz?=
 =?utf-8?B?VXNXTDJNOElHOWNIT3dSMmxxWmExNGFVVElHSy9odGFnL09Mb1JQVlV0UnM1?=
 =?utf-8?B?YmZ6SlZiOS8xdU90MzgvQVBLZndBeGJqNkhwM1R4REJ3d0NYUmlFbmxmY3po?=
 =?utf-8?B?S2JnUlhBeStTdmZOV0Y0VlArUEJoQld4LzJuak5BOUpMV2xNZ1dYK3FJeklh?=
 =?utf-8?B?WDVDM1dTb1h6SmpkUURYNmo0d2FVUE8wZlVwdDFhbzR1VC9UVFI4WHY1YmJF?=
 =?utf-8?B?YWVzZEcyM0lkUmM2YWRzSjA1cCtVOEx3ZkJ0cVNjQmZhWFIybTBtSzFBL0Jy?=
 =?utf-8?B?T1F3b2xIdkVrbktmaXFMUFp2MS9lZnR5U3NNenUyT2tXTHhiR2dyNmRZNVk3?=
 =?utf-8?B?V1puN01yRGRtODRCUFJveEVPaEZ1UDl0VVczaUU4aWdKZXdNZmtzUERrcUVR?=
 =?utf-8?B?ZjZSdnRncjZETmlZcVFveEU2VnZ0MG45dnI4YVdnb3cxV3d5QTdnQlQwaEE3?=
 =?utf-8?B?UkpXN0EwcnV1TVNiQjJpMVlmTVh3MFloUjA3d2crQTVVLy9HblB1VmF5elRp?=
 =?utf-8?B?aTBYTXp4aHN1WjNvaU53QlNYTWd3YzZSb2l6OUJIUDIwbGF0dVpZNXl5R1Z2?=
 =?utf-8?B?OGZRamxWVVY0Q292M1JHQUIzakE0cGQyVFgwMDJDUEhnOTlTb3QvbjliN1U4?=
 =?utf-8?Q?H3RBb3ufSrci8wAXs3Jnt9TWw/r3B4goUgXyNdl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f79be892-164b-4c9f-1415-08d961dc4039
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 00:08:04.9898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QgmthRMenpOIuDMcMUqZj9O/V4Tu0c0H3GV+ZSOmITKBW9q1o/81pUMg1zIDIx4mv980iuD1FEqboqr9vxfnqA67tg+xtBUlio8bBiZUOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5674
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/9/2021 23:38, Daniel Vetter wrote:
> On Wed, Jul 28, 2021 at 05:33:59PM -0700, Matthew Brost wrote:
>> Should fix below failures with GuC submission for the following tests:
>> gem_exec_balancer --r noheartbeat
>> gem_ctx_persistence --r heartbeat-close
>>
>> Not going to fix:
>> gem_ctx_persistence --r heartbeat-many
>> gem_ctx_persistence --r heartbeat-stop
> After looking at that big thread and being very confused: Are we fixing an
> actual use-case here, or is this another case of blindly following igts
> tests just because they exist?
My understanding is that this is established behaviour and therefore 
must be maintained because the UAPI (whether documented or not) is 
inviolate. Therefore IGTs have been written to validate this past 
behaviour and now we must conform to the IGTs in order to keep the 
existing behaviour unchanged.

Whether anybody actually makes use of this behaviour or not is another 
matter entirely. I am certainly not aware of any vital use case. Others 
might have more recollection. I do know that we tell the UMD teams to 
explicitly disable persistence on every context they create.

>
> I'm leaning towards that we should stall on this, and first document what
> exactly is the actual intention behind all this, and then fix up the tests
I'm not sure there ever was an 'intention'. The rumour I heard way back 
when was that persistence was a bug on earlier platforms (or possibly we 
didn't have hardware support for doing engine resets?). But once the bug 
was realised (or the hardware support was added), it was too late to 
change the default behaviour because existing kernel behaviour must 
never change on pain of painful things. Thus the persistence flag was 
added so that people could opt out of the broken, leaky behaviour and 
have their contexts clean up properly.

Feel free to document what you believe should be the behaviour from a 
software architect point of view. Any documentation I produce is 
basically going to be created by reverse engineering the existing code. 
That is the only 'spec' that I am aware of and as I keep saying, I 
personally think it is a totally broken concept that should just be removed.

> to match (if needed). And only then fix up GuC to match whatever we
> actually want to do.
I also still maintain there is no 'fix up the GuC'. This is not 
behaviour we should be adding to a hardware scheduler. It is behaviour 
that should be implemented at the front end not the back end. If we 
absolutely need to do this then we need to do it solely at the context 
management level not at the back end submission level. And the solution 
should work by default on any submission back end.

John.


> -Daniel
>
>> As the above tests change the heartbeat value to 0 (off) after the
>> context is closed and we have no way to detect that with GuC submission
>> unless we keep a list of closed but running contexts which seems like
>> overkill for a non-real world use case. We likely should just skip these
>> tests with GuC submission.
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>
>> Matthew Brost (1):
>>    drm/i915: Check if engine has heartbeat when closing a context
>>
>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  5 +++--
>>   drivers/gpu/drm/i915/gt/intel_context_types.h |  2 ++
>>   drivers/gpu/drm/i915/gt/intel_engine.h        | 21 ++-----------------
>>   .../drm/i915/gt/intel_execlists_submission.c  | 14 +++++++++++++
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +++++-
>>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 --
>>   6 files changed, 26 insertions(+), 24 deletions(-)
>>
>> -- 
>> 2.28.0
>>

