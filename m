Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3146D63A45A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 10:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F8010E2C4;
	Mon, 28 Nov 2022 09:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948B710E2C3;
 Mon, 28 Nov 2022 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669626667; x=1701162667;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ljleg32SF7uh+ikYgWEzgiJdUuviTTMwhFw5hMe4Ij4=;
 b=lBxE+Ge4PYhBCoNmPE0iSNwJob1RyaG2YCyerQRPmTuZOuD+QP5kzlxX
 +gg/5RbnVlONckK6zyn+3gonco3MlOaJm09u9HycV6WxtTM6+JTFE65X1
 GbLhifRPxNJbpNwhfxVhasK1U/FDsACQvqNB2MLyfRwyvSYAHkBpxcP9Q
 fOX+Rn6IXOsUIi3qUsvl79gnvO2OSh2mRMk4bOGlaXGC2gNvpn5srTR9i
 FNptP50VKvBMiuksILEMVdNcsWD9e4pyW9CouBnHkDc4TOHxw3cBNCzJi
 av+6UZ7R2hvrnTXqPp/I09ULWVxgVRutKEBBYrTceeaN6q6r+Rtryf+Fe A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="294487786"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="294487786"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2022 01:11:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="972186190"
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; d="scan'208";a="972186190"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2022 01:11:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 01:11:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 28 Nov 2022 01:11:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 28 Nov 2022 01:11:04 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 28 Nov 2022 01:11:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCamYKoAXSC2IvhLKY0d3zw4S+YX2zL0HNGORl0/wR9Hx3lFG2jPJWszIQeMiSY4BFwhcRw3egiEV5ZHPBqPLKfAfdEho+7UnLunHeXU1zcHvEqQUPCCmmmAWLMzvz5ap1d470jPnfWhVwJITSQjwOadRMyYWZvVPhVK5CP8whuJIkdDwAFdt8cJv0lg8QpuTmyMxn4GhBTlOl0PYn0rmwLWa1yugr6Vqe1naaNu4Fn7XIbzcav0J/q8+4z+9JHwQcyjgp+VOlG2siwYMyfc8fdb7EyFJ2xjTZDYeudaLNbyQV5FwquAgzv4coqXpTnhGe1uwGJItPhQubvm1eIkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REgQGkhU5DPbrFthpLdPW+TJPh5LfRi7JxgLU7tMB6Q=;
 b=FXltVDva9rIuJjBZyajHEtUUPbFzRqBlKOaJp3cldqxxpmZoerrHGkcSUlwQA1Dbn24W2RlTCTFOb1YZyIZZgSR246Oi8GHsKGoyqSj3ib9FHu9SV2gNnQ1byu4JUJnMcnI3h1mq2xyfDr4WZNbUgLmsiqN3CgF+gfVkxVwSkKZLXx6iIIup+786jw0hW9f3wDw0szr9g/nK7TAN5czWJ3Juuqf8Rcj+fO+x2b0clcv5Xin8pwJi902+NaKFCwoZdaYfGe0SyxVoTC7E1TD22US/dBBfOpVwpvu6DGCEV2exuI4KgpF3BbrR4/NJhx4q/INeEAWSzQjPCMi6yS4YxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 09:11:03 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::f7a8:6d03:2464:2afd%6]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 09:11:03 +0000
Message-ID: <119a95f9-9c54-d811-8c2f-f3ecd52258c9@intel.com>
Date: Mon, 28 Nov 2022 01:10:58 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] drm/i915/huc: fix leak of debug object in huc load fence
 on driver unload
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20221111005651.4160369-1-daniele.ceraolospurio@intel.com>
 <Y4DI+gq1rVQXDRbg@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <Y4DI+gq1rVQXDRbg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::33) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA1PR11MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: 9316ffbe-bab4-4233-a9d4-08dad1207821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wg5GRBWXam9AOjR2esBROW+5aSsMFqLWrMv/sNHIKZwZ9NKg0S45UxodtFX6owY+LEvvNj/4Vq8a6GpAN/95NJQ9F4x/c3v0nEce0GjG3way7srIiVdNkFuoamL7AzbQi0iEm2XWbaC9AP4VVLHzKYyiVGW/+l26lyePefXhXcuYgrsAnv7SKygTVcd0ES0Q0a//uRvxO58reguD+ktW6dB/t8WgrkLp5gCxgQS25/+D4mNcL1a3lG29O7KF6bKH1fQ9JzBvoGuigqW1zVISXQWCwwZVtkzdi2SmqBRcPeKA8npkkTpyC+C+cn5G40oeDM0AOc6PfFcYMwscU1exZu9cy2R5TCtbfG1gvwiXJc05b1muwzVQ0emcw7ySD2Rih/4PGJuL2sk9X6YJ8IsG6YvlQ31xAJQ3i9DaJljDZZSt+zarwihX5M7Vq4xPVzYghctkDmor8o78eh8n3CATv9+3kiMC+jGS4Fxe/E84oAXeKYi5VnB9qGY4ajrvxgn7chmxQDA5SjJLI09Sv/SWsg9YXNlHhAiiDGgugp44bWjI2v7dTF9snP4U8h6Q9Ox80O45b9uAF/P3NKWgi18C6WV+5KhUURhGb9e5nm7wIscvP+XyrTFi3T+Xj8bGtkfQPHBPKpHrGb38E10VRtB+Nh+MOCtcYBVujm6NE9uzl6M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199015)(2616005)(31686004)(2906002)(83380400001)(38100700002)(26005)(82960400001)(966005)(41300700001)(66946007)(66556008)(66476007)(8676002)(53546011)(36756003)(6506007)(6512007)(478600001)(6486002)(6666004)(186003)(8936002)(5660300002)(66574015)(4326008)(6916009)(86362001)(31696002)(316002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3lhc2MxcHdCVDRjZ2FwVGMzdTNQMkxwa3d4czcrM0pBRjRpanFqWEVkVVJN?=
 =?utf-8?B?SGR4YVpMVmdKMjRtOXVhcWN2Y1NxNERvaVh3N1JpdXlQVC96Z2x1bEhhcUFW?=
 =?utf-8?B?ZjBiSVdEeHl5RzVHVElTaGlxb0Z0SitJMVA2MlpXZm5iWFoyQjFocWZxMUpL?=
 =?utf-8?B?WlBncFRJa0Y2MDVoeG9lRVMxWWNjem5OYmRkYVlhaEE0WFRpdFlrN1ZIb3VF?=
 =?utf-8?B?S1pTem1zVitFLzJmbWJaWmpMdE1UV2FmaVpCK21OM25xSFVIRS9GNDNMbFVB?=
 =?utf-8?B?endEUTZtMnJ3WE45QzVteHh6Smt2QlN3TGV3Wjd5MFFNYzJxZVdIZHZ4SGNq?=
 =?utf-8?B?SzFJZU1uWlorcTZWckFCZVBrUXBpa0tuOHhRMXVybzFMTVg5dnlCYjJ3cmZZ?=
 =?utf-8?B?M1ZYNmRCZ2htRHZtTGQxOWVLUFlwcG4rb2dJbGo2ZUpiOVlwS3hKT1RsSklj?=
 =?utf-8?B?MDIzSnpOTkE1bDdNZmRXZDUrVVk1ekxmUy9MZGZObUlLczAzM0h1TGV6YTdT?=
 =?utf-8?B?V0RvZVBrNWpHUjdlUTB5M3NWMVNsM2pxQjlVdjJZYXNreCtxN2NsNDJFU29P?=
 =?utf-8?B?SzZWY0pjUFNyWjRBZ05yM01jSmw5WVJyTkNuQ0tEdnZZWDJTc1JPcUZIUzFG?=
 =?utf-8?B?cTJrZnJXQ3JmbDdHNVBJRTRxYzJIRWNQRURWeVk5VTNsdGlqVzZJVnRpaWwx?=
 =?utf-8?B?cDMzaFNxek1NbmxtQUFrWlVSSjdxdWhPQjFxYkFLMjg1RTJYcnR4UHJPc1JY?=
 =?utf-8?B?MnRKTGp4c2p6K0JraktweW95eDhtU3ZjRGVpd252Y2gwNllKYkZsSDdveHBa?=
 =?utf-8?B?K1VLajErcU9IYXF2WWVmb1VHdUtCWGtnOTErbzBTNWh6b3ZCOHIvNVVrTFc5?=
 =?utf-8?B?d21nTTZGYTRDSnd6TXBLU284N3FOQ0xIMXRiemVxcTNWVVdhZk5uWjBKREpt?=
 =?utf-8?B?N0ZYTlZ3elpOelhFK29zRTM0L2x4Y0poTU95eUpJcjFwNFU5dDVPcXpVc0ZT?=
 =?utf-8?B?cWVCdVJjb1lBWU42MldHRHhyQk5USUc5TDd6M29WNnhJSDlUNzc2ZFZZRnJo?=
 =?utf-8?B?OXJ3NUhpc0pmM3ZWL0VxNWROQ3I0V25YUktldDlXZEtYOXVPQ0RDR1ROZDVP?=
 =?utf-8?B?Wlp2Y0h3VFdsOXJ4Zk5aelV3LzZTYkdVL1VJRmRIdXRIdnRvZnJFd2hCZlFO?=
 =?utf-8?B?ZVMyQmZMcFM2cXVnL0twVEVaRWVBWjBSU250Y1BFbFVFU0R5NTBvaHJBRlVX?=
 =?utf-8?B?ZFo0ZFZxdlo5UWhOSTdXMkZlSkJDbzBxaVNDV2ltUjdMcFBBTXBHZ1pyZXBS?=
 =?utf-8?B?V2VWcG1pazZCazkvVFp4bHd3YnVCK1ZvZ3FhS3dDL3pHSnhtRHVSakI1Y0lw?=
 =?utf-8?B?VWVIQm5MR1Q4ZEM0MVVCUG1UWEZDcEdBMlpOMUN0ektQVmhZSUQ2di9xZFJi?=
 =?utf-8?B?YlF1dHpFcVBXK1ZGWThJb3MveUpUcERPRHRsK3krdktUUVA3RUhqS1pjdTd6?=
 =?utf-8?B?eEdUV0lLcVhuWEdMY09BQXhCREpSaXczdlJVa1RoMi9FMzhKeG9ETFNFWlJh?=
 =?utf-8?B?bElob0xGNzZNRm5yR1dHSVcwWXZ1bnd3Yi9HUUFjVHlWR1F3WWhUOFlCTENH?=
 =?utf-8?B?V3pXaXdrR3lhUTI1endGckVKQ3VBNDVLRVVIclNkUTFuSVFOYUdsdDdMajc2?=
 =?utf-8?B?OGxyUXozbjY1TnhScUVRc3Z4QmlINHE0S2tjVzh6aHNVbk9LUC9ubUg4c3JI?=
 =?utf-8?B?MFJtN3hTRWJxTDNTZm5vdXVEeW8rWDNJVlR4R0g2U2pzRTBibHZKeE5ObDkz?=
 =?utf-8?B?ckNSdm9mRm40dTlBaTNlZTlTNGpTVFFoZW1BakJQK2R6TDJEYmlEWXhUQ2sx?=
 =?utf-8?B?ZjFBNTZLck5kTDdlWWE3aUdHY0ZZSU1rZmtKUUxGaWFKQnh4aXUrcVREcHJu?=
 =?utf-8?B?TVRrNzFIZWRsQlpQSFY1RGpCK09MRFE4aUp1emFkdysyR0VuaDNKMVQrNlN0?=
 =?utf-8?B?UEhEMTYzR1hWcExkekNDcW9XWlg5ZFVtMWM5RGFjbFpXdWluV2hnV2k0RXc3?=
 =?utf-8?B?b0w2N0FOWnFVMmJtWmRwWFBSYWZObnRZbERxUk4xTXM0ODhkcEhKblJ0S3VJ?=
 =?utf-8?B?R2NMN0hUWHN2aVhGbWxhSGxva0FQRmVxZVZOVFRXdFFmVktiSUtFWGlMOEx5?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9316ffbe-bab4-4233-a9d4-08dad1207821
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 09:11:02.8961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LAmqV+WQekVl7QCzhox44GFombIpeTWHYfSZpd2nJtEkylSWb05R5+Pe56Cj6a8IlzhGL+rDfIYAglfnd93DGGvo7Dm8nT9v76Q9lU201Bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7014
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
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 intel-gfx@lists.freedesktop.org, Brian Norris <briannorris@chromium.org>,
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/25/2022 5:54 AM, Ville Syrjälä wrote:
> On Thu, Nov 10, 2022 at 04:56:51PM -0800, Daniele Ceraolo Spurio wrote:
>> The fence is always initialized in huc_init_early, but the cleanup in
>> huc_fini is only being run if HuC is enabled. This causes a leaking of
>> the debug object when HuC is disabled/not supported, which can in turn
>> trigger a warning if we try to register a new debug offset at the same
>> address on driver reload.
>>
>> To fix the issue, make sure to always run the cleanup code.
> This oopsing in ci now. Somehow the patchwork run did not
> hit that oops.

Can you point me to the oops log? I opened a few recent runs at random 
but I wasn't able to find it.
Note that I did spot a potential issue that hits platforms that don't 
have VCS engines (introduced due to a MTL change to support HuC only on 
the media GT) and I already have a fix for that on the ML:

https://patchwork.freedesktop.org/series/111288/

But without looking at the oops logs or knowing on which platform it was 
on I don't know if it's the same issue or not.

Daniele

>
>> Reported-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Reported-by: Brian Norris <briannorris@chromium.org>
>> Fixes: 27536e03271d ("drm/i915/huc: track delayed HuC load with a fence")
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Brian Norris <briannorris@chromium.org>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>
>> Note: I didn't manage to repro the reported warning, but I did confirm
>> that we weren't correctly calling i915_sw_fence_fini and that this patch
>> fixes that.
>>
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 12 +++++++-----
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c  |  1 +
>>   2 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index fbc8bae14f76..83735a1528fe 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> @@ -300,13 +300,15 @@ int intel_huc_init(struct intel_huc *huc)
>>   
>>   void intel_huc_fini(struct intel_huc *huc)
>>   {
>> -	if (!intel_uc_fw_is_loadable(&huc->fw))
>> -		return;
>> -
>> +	/*
>> +	 * the fence is initialized in init_early, so we need to clean it up
>> +	 * even if HuC loading is off.
>> +	 */
>>   	delayed_huc_load_complete(huc);
>> -
>>   	i915_sw_fence_fini(&huc->delayed_load.fence);
>> -	intel_uc_fw_fini(&huc->fw);
>> +
>> +	if (intel_uc_fw_is_loadable(&huc->fw))
>> +		intel_uc_fw_fini(&huc->fw);
>>   }
>>   
>>   void intel_huc_suspend(struct intel_huc *huc)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index dbd048b77e19..41f08b55790e 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -718,6 +718,7 @@ int intel_uc_runtime_resume(struct intel_uc *uc)
>>   
>>   static const struct intel_uc_ops uc_ops_off = {
>>   	.init_hw = __uc_check_hw,
>> +	.fini = __uc_fini, /* to clean-up the init_early initialization */
>>   };
>>   
>>   static const struct intel_uc_ops uc_ops_on = {
>> -- 
>> 2.37.3

