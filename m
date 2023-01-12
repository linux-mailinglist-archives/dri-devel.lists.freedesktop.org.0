Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1666666EBC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0887310E8C0;
	Thu, 12 Jan 2023 09:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBE210E8C0;
 Thu, 12 Jan 2023 09:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673517294; x=1705053294;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=302CF1eZ4wuIO+OFdfilcYVSro8XnANJhBlz5dkl8dI=;
 b=d99BIRJ44TBQmegODO+2blYzXFPhuhe3N+Zj3MryBsgH6O5oY+SgViGL
 kKQ2BaouGDU1qP+OpIjU0x/JQNPQKxao6+zfP29dSmlhRZf7CnyvgkLhr
 V9osQP3aALt6jzNg0byRuQ/qIi9QCCTTX5JZ8nIJEtA8Z6Fv34hOWQgzQ
 H2ksgF5bUSd2/Q6VF+b7iRx1FXkb6mS0wnFDpQFr+Ca9GRWaSngp665yF
 /18rT4G0YoCKZDh/7jO4A2g6bOeqP7kgTWOFN0jaoQWVm7p22CfOPzRzj
 umOTHEDlPibj0ilfcXkXK5AYNuD93ht1YEnS7SRTLTnDXQ08X8YB/v+R4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="325686050"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="325686050"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 01:54:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="746498241"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="746498241"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Jan 2023 01:54:54 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 01:54:54 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 01:54:53 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 01:54:53 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 12 Jan 2023 01:54:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkR27Pf7HXQXDp67wVfRdw4tbuUUJkjmIjs6ouKwYyGYTC0D7sK9JNPtehloF3thcvpsMs59MO6A+/PKNvPtQP3TJrRmg8NG+Kp3gZG/g71bTaVdyFYQ2sCBfUg2RDqSH6Hneka71XAy//ykoJYUJR7kTZoTsjY6v0GSRqBB4TieeJpiGB8fgkclZvZx9w9Raqo58rfw9BeaMjrFpdIj0yMg0MjA3H1f8WbPfW6WmusOUHgBUN/udDkp55rJ8U9iJIcV3/9OLwSDDDtNBt0yogJqgCZWIQbXV9wieSdN14Pg0WWyaGv4a6RIQWNUSqNccsda/yBDO/whKqrYoJMPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=302CF1eZ4wuIO+OFdfilcYVSro8XnANJhBlz5dkl8dI=;
 b=WNk744csRRDKhJSoj5nfh4vCa6qpQbqsB37bC3jTqOEUroOIUr5I906R7ulhZLrXYTzGo03MzlQTIuhi++LaDbEjfzRM4o5q1DE+bqgp+GjIXgH33F/obpZHzEeC5KG6Q7aNejhoKdvZlOgNlQgBb9VzL02ROrbMhg73L/u4goem+FlNFLd2OXmZ3EM9nBOQlx7zfGuxcT+9qS5jlihcR+FOSH3RJ4/UcExpNfRJ84vcbBt5LttFyraKEl+GJ3KRwhc91hoGCIieN92BmR5R0MZVs/K+cfGHhJ9OFWHZLLGquEijtWg7O6XOk41oVdjIOzyrgYXnwRw7pznb+2tS/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7872.namprd11.prod.outlook.com (2603:10b6:208:3fe::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 09:54:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%5]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 09:54:46 +0000
Date: Thu, 12 Jan 2023 10:54:25 +0100
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 00/20] Initial Xe driver submission
Message-ID: <20230112095425.77a3jhyoipvqtc3o@ldmartin-desk2>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <cd0e2491-92d4-58df-628b-985768472157@linux.intel.com>
 <Y7dA3cfSfKDuGkXZ@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y7dA3cfSfKDuGkXZ@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb1eca9-6ce9-4117-577c-08daf48308fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TFkPslIB0TC93x3a4zQirxkEbC9BYCoph1mWDXEx7Q4h4WvbDA3FmzB6NYSym+dpxlpysf/YAYiItJJ8VPyrTEG/O060svedk2V2gjzNYz2dpnv4x9cXd8C8PE5SalMqnqmWJCDCVaCU6swhQ/94rMwOa0v6QNhU6NLtCLR0hAK4G413uYk8u1IgmRtVCr202R3+zHaP04wl+ck4Oq13aSG4KfEnozbKF4HzgR0bmu7DSVGfbslInmQa3doBiU+5nVvKhdrBHRe96Tjxo4cRxgIFe3GChMJob5Fc2nuygreXZfO1SLimFjKhzDT97j6OAxq5HPjdLL0I3Gq2vEr7Rn6K7unO02sf0I+QBr+ENeX/1M76pIiOCy+lJXox/0TZLR4MKc7jtnR0Z8D5jRvrH/bTLsisve81u24OMBAH6avxMnszm5wLk2lC/Id5w0ySXPodtJXCH8TZ9SSyYr5V5GtM8IogCNwH6A6f2CN7Fczif5VODvbAnIWHosrEz6AaXZT9L/oHW+tp3lwRl9edcVovcEAE0eEAxt68uHuC8Ce/o9Nq205rYO7Wa9t9tnSggmaYcPqJdgeuf6ICr5GOzfqTZc8SWfM+4n533NQnrstt0nytKXcNpb0TN3XyrM+7lbA0bxKj8DU8rel/Gry8QA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199015)(6506007)(478600001)(82960400001)(38100700002)(53546011)(6666004)(2906002)(6486002)(1076003)(9686003)(26005)(33716001)(316002)(5660300002)(186003)(8936002)(6512007)(86362001)(83380400001)(66476007)(8676002)(6636002)(4326008)(41300700001)(66946007)(6862004)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MqfL2DYFbgbMe98wwYKrfoRMssjbWcg+FykltUitYg0DB65z3hq3SwbQurI3?=
 =?us-ascii?Q?kiU6tRRihQeGhBieMZP8J8/om4hDHdSMTRuOApkJnSryrfWS0tIDexm8hFEp?=
 =?us-ascii?Q?PFtG1vcL/r8jwhdMvAlSpK9jgZoE6SW/31moS5esKkFBWAImjPXshUqQm+GT?=
 =?us-ascii?Q?v3zt55C16pYup+/kUbOz7t3+TbW+qXriVt888+4bm/ACQ/y/wbAhhLD+i2Cy?=
 =?us-ascii?Q?eIw5KBHC9d4C5u4FWnfYi1T8qIbCWoTCEmVJwyEyDz02Gv+LtzT7JhewRBoZ?=
 =?us-ascii?Q?1T3UbluPUPPuYD7pBf55Q9e37OLD10LE13C3F3bS/oZeUNjVPPOwkLAZMOwd?=
 =?us-ascii?Q?CW/vNnIe1xkTzlJeJmStw+tooD17MmkV2j7F8NUls6gFWMk/87QqsBMUJMiw?=
 =?us-ascii?Q?dg5o1+hLp3NVX8cCJZoSj0jlq/D8G3EmICoGAe68T5vynnUkxN41nB7oyEb6?=
 =?us-ascii?Q?k/6QvlnvjofQTk1msePNu2sDV5D7LaiWHz48W4WrYxCGixsoGozxW903lLGE?=
 =?us-ascii?Q?yjXDXrWVOvhWPq7824xgcEXO7cCDFyad0wLvTEdYomUB+NN8k5Og4I6dukFA?=
 =?us-ascii?Q?tPcaVExPIT2u2Zc4Ub71YUpwuY4e1lTYNFKa0ktz5zb8Yv4/DNMe0u2izsZB?=
 =?us-ascii?Q?/ugwDqK/Pznvk4opYzmoZ2PnNRQwidrH5EbJ6lJkS2UABgmO1YEZGtvZuB8Z?=
 =?us-ascii?Q?8lzV0JDtKxhNY+ZlQ8ZUcySRbGHfunHmsQtKkKVxHU01+PASZRD2u7pho5px?=
 =?us-ascii?Q?McdKVXRiGDyneLQD84kPsHPAQGp+exZlYtBRRq1CaV9rfgTfnyiyMMtXFVi/?=
 =?us-ascii?Q?fLJGC8GxiRjZEWNlaqfaMwOT5jSf94pNTA1B9LWTys0OxVmwkyZh7gMtsnoT?=
 =?us-ascii?Q?4/Ai3/7Us/Uj1BorcFVZ6J+HEr+hi1Wht1Xp8e+e2NB68HZibtf3DAQ0XQ5M?=
 =?us-ascii?Q?AuwgCM3Qu+9XNtpVyzaZUdtiSQ6CTNbSD2FljVxqG4wqSDxGG2zuro2SygEP?=
 =?us-ascii?Q?0dOHo7P+bVPGlIFPJm2p9WzdNZG1g0xQIbTsYRyLNJaWlsZDqeBorggmJ4qg?=
 =?us-ascii?Q?5KztUXfwyeCfbE5WK45lZ5Ya+BkyLjslE3ZA63u0f5xUbPhU9xemWWQZxVqX?=
 =?us-ascii?Q?fg6C98vcftACxh5sqxLOCTE1PnFW67OaTA/wUDIrNawCLwSxUrxGNixUj8iv?=
 =?us-ascii?Q?DOeLeNTEgffamg4Buo1CP4j03UBXVn2jS5K0hXi/BjEjB6UVzefVP3qIXYtm?=
 =?us-ascii?Q?waXg+a0wfG6MG0k6pfX3qYGywuhogIHVignmrRZInsed2NvkBM2ZA5cjo7Vj?=
 =?us-ascii?Q?1n1EUVhanvvyG0hJ8f0ovcuXY86Y8M180WXGcKd8nAJ0vvvMh8X5AAlLtHoh?=
 =?us-ascii?Q?LSrtMkBfe1QF+WQ02/berib1cXSWGEy0t5uJfGzLw5f7PmD412dH9OfzAMiS?=
 =?us-ascii?Q?YBOg+u+aplbM0Bd6acLFnm7XRaKSNEZa4FSCAkOdi4cJ4WFNQ8A3oFFZjVsK?=
 =?us-ascii?Q?XXLowvEL+uyshF0waKlw9IP7NqCI3O9Flv2CYwnIB6hP1QWotQtcPPZzO90K?=
 =?us-ascii?Q?u7psHCvxgBPnX+8sCMJzhnN9GlnRC6s10JP46crSdWIP5Dz/uW3n/Vz+uhHG?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb1eca9-6ce9-4117-577c-08daf48308fc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 09:54:46.2024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Dr+HtCofRAQtPe0WtmBycmDDB/TdE4u5o1nRGSe9b0UpJ4WjFFiFh/MMiWml7x9PQ0NxYGDpqh8VOOIGE1LHHu21pm88OfdsbAis/ky8W4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7872
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 09:27:57PM +0000, Matthew Brost wrote:
>On Tue, Jan 03, 2023 at 12:21:08PM +0000, Tvrtko Ursulin wrote:
>>
>> On 22/12/2022 22:21, Matthew Brost wrote:
>> > Hello,
>> >
>> > This is a submission for Xe, a new driver for Intel GPUs that supports both
>> > integrated and discrete platforms starting with Tiger Lake (first platform with
>> > Intel Xe Architecture). The intention of this new driver is to have a fresh base
>> > to work from that is unencumbered by older platforms, whilst also taking the
>> > opportunity to rearchitect our driver to increase sharing across the drm
>> > subsystem, both leveraging and allowing us to contribute more towards other
>> > shared components like TTM and drm/scheduler. The memory model is based on VM
>> > bind which is similar to the i915 implementation. Likewise the execbuf
>> > implementation for Xe is very similar to execbuf3 in the i915 [1].
>> >
>> > The code is at a stage where it is already functional and has experimental
>> > support for multiple platforms starting from Tiger Lake, with initial support
>> > implemented in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well
>> > as in NEO (for OpenCL and Level0). A Mesa MR has been posted [2] and NEO
>> > implementation will be released publicly early next year. We also have a suite
>> > of IGTs for XE that will appear on the IGT list shortly.
>> >
>> > It has been built with the assumption of supporting multiple architectures from
>> > the get-go, right now with tests running both on X86 and ARM hosts. And we
>> > intend to continue working on it and improving on it as part of the kernel
>> > community upstream.
>> >
>> > The new Xe driver leverages a lot from i915 and work on i915 continues as we
>> > ready Xe for production throughout 2023.
>> >
>> > As for display, the intent is to share the display code with the i915 driver so
>> > that there is maximum reuse there. Currently this is being done by compiling the
>> > display code twice, but alternatives to that are under consideration and we want
>> > to have more discussion on what the best final solution will look like over the
>> > next few months. Right now, work is ongoing in refactoring the display codebase
>> > to remove as much as possible any unnecessary dependencies on i915 specific data
>> > structures there..
>> >
>> > We currently have 2 submission backends, execlists and GuC. The execlist is
>> > meant mostly for testing and is not fully functional while GuC backend is fully
>> > functional. As with the i915 and GuC submission, in Xe the GuC firmware is
>> > required and should be placed in /lib/firmware/xe.
>>
>> What is the plan going forward for the execlists backend? I think it would
>> be preferable to not upstream something semi-functional and so to carry
>> technical debt in the brand new code base, from the very start. If it is for
>> Tigerlake, which is the starting platform for Xe, could it be made GuC only
>> Tigerlake for instance?
>>
>
>A little background here. In the original PoC written by Jason and Dave,
>the execlist backend was the only one present and it was in semi-working
>state. As soon as myself and a few others started working on Xe we went
>full in a on the GuC backend. We left the execlist backend basically in
>the state it was in. We left it in place for 2 reasons.
>
>1. Having 2 backends from the start ensured we layered our code
>correctly. The layer was a complete disaster in the i915 so we really
>wanted to avoid that.
>2. The thought was it might be needed for early product bring up one
>day.
>
>As I think about this a bit more, we likely just delete execlist backend
>before merging this upstream and perhaps just carry 1 large patch
>internally with this implementation that we can use as needed. Final
>decession TDB though.

but that might regress after some time on "let's keep 2 backends so we
layer the code correctly". Leaving the additional backend behind
CONFIG_BROKEN or XE_EXPERIMENTAL, or something like that, not
enabled by distros, but enabled in CI would be a good idea IMO.

Carrying a large patch out of tree would make things harder for new
platforms. A perfect backend split would make it possible, but like I
said, we are likely not to have it if we delete the second backend.

Lucas De Marchi

>
>Matt
>
>> Regards,
>>
>> Tvrtko
