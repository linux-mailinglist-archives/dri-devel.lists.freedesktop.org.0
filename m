Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA63E5ED1D2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 02:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E620110E1E8;
	Wed, 28 Sep 2022 00:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F5510E1E8;
 Wed, 28 Sep 2022 00:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664324568; x=1695860568;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7w3HGPwxCeeK87lubQ3sfY/WMccJbPWpVgArw0aIjOQ=;
 b=dtHNNzZpKQqxEsrjbrKnsGBfj+7O/jDQbLMn+hsXdz96FVxQchCDspzD
 NITkru7bpccMj6lS2yrZE1N9u85rv1BYkg2cB0QM7VLrtkFkaOJKxPjIK
 dhSkaOeqV18up1cjMpa0HNAvvjPaW0eWWekF9jxniqY364VZ8RF4YUMwj
 CHU5AXlU9jf/QzXGqEloENuBfMRrP26jNekm0rpQt2BugNXR11lH7afER
 tNkFWYcIQPsOXMXghwftkZeuHsb6GVq2zfxDhDbwDEdsON3rkZQfj7Y9z
 OiTxemnq+F79gO2Rxs+qeL658/G9tgN9sicQb0OO/H6mtKLEtXyyIvL9G g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="302947204"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="302947204"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 17:22:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="866763546"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="866763546"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 27 Sep 2022 17:22:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 17:22:46 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 17:22:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 27 Sep 2022 17:22:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 27 Sep 2022 17:22:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSM5upCMgFF/7geLp7NIjsSJkh4H8RWkJQiRj5zPnE8TUTDEaYzfv3P1l1CkCj3nh9UjYA8dSJAvEos7suJOO3n1NMIuizuUSWmxhLqJzwGzGtVUryl/OuZg04qsDPgf1WoSARp+EuFuG8jkFm3VHz4Dxw3TJMBWpzL3dY7Hyf89TTpQ8l5Tb+yBxHh2UD1NGJ+3S3uUCrTuzIR14FetvQSx5IcpC3Vczc0vbAciQiV0mUWVJFP3HuLCHGQfZSbtA4iGoaa3caOc+AlcZwi/fkWYzSB/3bZnMTykyKGHPwsFy6dioUq+AknIFh40fzUGizDpI6iYZS3oOOfzmd5uxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KK11DXOYTnfDoNsLpQ/coNJIIH5jAU56YHtrQiOlXcg=;
 b=ib4wc94ARmKr75+B6JGOTyqqQtd2PV4Vrd7LikzYfxTL4KnUMBNibqR1GI5enNuF6KNV82/sbtjCbyfQNpqwoSaaJQZPshxuXP8zx6bQD1N9w7jNe/jDtP/8ovkPSK9oZwgavOducWiSCSVaGeIDIw2Bdf6bloZcYpUo8d5r1EgTtvAVMsoQN42yKkDBt5dL7fzwK+vl/DWOlDf+yxkhPhVKeOqIJRSGNDiu5DLpUvngcGB0NAJlPCfVGLPXQ3znHXML2gpK5y0pv3VpVPAGuQVXQACuMtUQRHOWMuAJ1WngfNiPFYK8Kk9P2j9NQeq7U4bym6YGH0cQbPFILu1w2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM4PR11MB6238.namprd11.prod.outlook.com (2603:10b6:8:a8::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.18; Wed, 28 Sep 2022 00:22:44 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::280f:75b5:17ad:1668]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::280f:75b5:17ad:1668%3]) with mapi id 15.20.5654.026; Wed, 28 Sep 2022
 00:22:43 +0000
Message-ID: <87978a20-0f9e-62e8-63b8-9ffb94e71463@intel.com>
Date: Tue, 27 Sep 2022 17:22:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 7/7] drm/i915/guc: handle interrupts from media GuC
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
 <20220922221117.458087-8-daniele.ceraolospurio@intel.com>
 <YzOQ+bcBA+PwRZek@mdroper-desk1.amr.corp.intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <YzOQ+bcBA+PwRZek@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::16) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|DM4PR11MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 647329be-b3ac-4298-3e04-08daa0e78fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j2fBn4q0XhMCzEOSDwCR0V79MXjnAzcITsWj+5Z4zDFLcLjVwSJus8XwHzCWVQkRMmAtjoLy3xgYnltf19qo0FrOP4Ebe55Vd1w81pLEEeglpj/iEo7MnhDqEVNhhxbmEhoEa83MMn++GQeubrDMHBQpdPLVOdCanJx/5yaDxouIfRWkb0JOlaZDKTUuvL6b3Q9vlV8I9o/ceQ72th1QN9jMEp3mSTVrEfpo51WxQfHMPryWz48hKhHhMNZwuzdi7hCsekq9FAg8OcA3FqTv7ghw+aMheSZ3TVxgIKbH3JpG6NJtbREXl6nQHf1X+AjlB/LvQlT86TWh/NHEa+o/m8f0HetbBEGREeNaoEJAtNQccMxqyFkJN29YhgPsFVPl2+jyThWyWKTnG3KI4nmK8/1rB7VrHT4FCwPNebkddHgYcO1s3ZSpBAFcb5uVoXlRHW+lCMo3WrECuOdrF1EuAGdptG4UqH4u3NBRp1epyJw/qy8wJYKmb0x/hKHA85/sTd76HKkEKWfyRzxFWGkO5NCvPBfGh5jyKdp9Lp9Wo34xw7RWmZJtWo5HHhFf1ZCJJB0Q0jUj6dLpAKWWHo40uKAhgJhyKbkmHenYLS3mWoh5aJhDv4x/rWvZrozTIb1bcc/Kd1C60mJSPQ8kqhPLsp+Ya9l/3w6nHdD+haLI2A4Aaa7ocPrwI3W/J3CqVeomqARUkxVfPPQzksQNqtEDtVD2hEqzWaX2NtRNoQNlMYTJEPkpb0C/OeRgu6PELy8z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(366004)(39860400002)(136003)(376002)(451199015)(450100002)(66946007)(6512007)(5660300002)(6506007)(4326008)(41300700001)(53546011)(26005)(6862004)(107886003)(36756003)(186003)(2906002)(478600001)(2616005)(82960400001)(38100700002)(83380400001)(66556008)(8936002)(31696002)(6636002)(54906003)(66476007)(8676002)(31686004)(86362001)(37006003)(316002)(966005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk9rZmdZYkpqNFg2YlZlQmRWME0wSVFGMmx5WEZOMnpEOGxFa2dXWkZvUWpL?=
 =?utf-8?B?cHBTZmM5elg4c25DRWhxNUgwaGtPL0FHdmt2U0JtekVzOGg1TnRCdnJoZHJ3?=
 =?utf-8?B?Mm9NTWpmRGYrUnhaNDl3OTNWRGkzUnhLNEVMekVOcTlSVkdZdzVRWmFnU1Bu?=
 =?utf-8?B?TEx6c1hHYnM0U2J4UWVIRGNXejJNYytjdkFoY2wyeHNzQU1pcTdSdExNdUlT?=
 =?utf-8?B?YTRyb3EzWm1tb2U0L1JkMW5NQ2w0cG14YUprMms2V3hnK3YvR21DVmd5QllG?=
 =?utf-8?B?aG13Mk4rT0s4UWtaVFVpVUdQREY3enZrb09seWxOdjhZUlN2QXFQNkMya0pI?=
 =?utf-8?B?Z3FnbDNzR3g0Z2JLbXBwTERKTXQvSzhRTEpaUWg3MXpadVU0UzVqSVZaSUZj?=
 =?utf-8?B?Rlh3d056cER3WVlWbXdKVnVraGp0alBvRkl6MXBCaU5JdE5JWnRVQVNNbGFr?=
 =?utf-8?B?VHJuU2ZSSUJCUVNtQzAyMDd6ZWw1L0g1Ly9ZNkk3UEJpUnVLalVybVZvSUV5?=
 =?utf-8?B?bFFkRUJISDRxL2M2WDVRMkNJK1YzQXoyL0hSdUZKMkdwZG1BNGxlVWNtTUxJ?=
 =?utf-8?B?blNlcW5HbVNhSGZVUndvcW1KQmlzanFYcTBOaEtVeTQ2OHVId0l4cWpsTWIr?=
 =?utf-8?B?TTJoVlJsUUJiT283eXN4cjdoc09OVER5NEcwREc1ejRabE5xallnTWlYc0tx?=
 =?utf-8?B?WkFqd0FRNzlqOWd0SWhFcWtIVXdiVlhYRWdsNWpORHdRS0JUOXZMVk50MHBU?=
 =?utf-8?B?bjdCVSs5ZmkwWERETjhUbHNIL2VXaThNV3VNeXhLNjNLelRPRzRPZ2tNam92?=
 =?utf-8?B?VzA4cU1KV3hSU3BVMEFUZ3VITk5wTlpTSDBzSzJXYzAxdTJMTDNZZElDenUw?=
 =?utf-8?B?Szh4MFF6bHQxb3FBZVd3elRUMlJjQ21xM0s1dFcvUkptTVEvVHhmS2xxc05O?=
 =?utf-8?B?dG0yWHpMTHRwaXJFcXViN20rRmMrWS8xM2gzMDRxdUxkb3NMbGRKVHUrREJ0?=
 =?utf-8?B?aEg4dkJoV0xub0tDRzE3TkVpODgrMjk1eUZhZDU2bVRjMUlyQmljZGlnT01Z?=
 =?utf-8?B?cVMyOFZoMFJhNjJTRlVlQ0dWUEk0YTUvZ0FSTVFDd2Z5TWgwZTJCVDgwZHVM?=
 =?utf-8?B?dVgzaEFiRFJDdzEwRFA5OW4za0RuRUNhSnBXeXFPNi95YVZpNTN0YU05eWNv?=
 =?utf-8?B?SW5NT0gwekd3Y04vSngwK3pDejhsZ1lTSXlqb3crOHFRcG1Zek9zbmVIYmtJ?=
 =?utf-8?B?OVFFbk0vUUdNWnhuc2krZEZSblp0SVRnTHg4elpGMnhONXJrcXR2Ty90elpY?=
 =?utf-8?B?bHFOaVNZVjZ0UUhYODJrK0hOM2wzbEZoRmlXWGdQbVNveVJTN0ltclF3OTlJ?=
 =?utf-8?B?bFJiSXlTTjNBVkN1NmhiLzlpWG90NURBUHNrRDg5N3krWXd3ZlJSei9FWklo?=
 =?utf-8?B?MzNjd3JVMGxVcDBzTjluRkcwSThmc013cFc5N0FFY3d6MmV4a1Z6YlZYS01N?=
 =?utf-8?B?RGtDL0RxbWpTdW01Q0VNUisrNTk0cS8zcndJdW96S1EvbFlrR0F0eGlWV2Fu?=
 =?utf-8?B?R2dsUnNRNStVTjBuS0JXR1ViRUljM2NVR0l2QzhBaUw4a3ZOdm9nOWVsRWQr?=
 =?utf-8?B?M1NrK0d2UjVMSFBySXVlYis4d0dFNlJzL21OSmtSSG1aOGZvMFppQVBDQTdB?=
 =?utf-8?B?aVluazJadWwyeWlMSnJJbDU4N0J0Y0FJazZFckJGeFEwSHZ1ZnZGWW1yUitx?=
 =?utf-8?B?L0hISFY5bE9hOEFhbjZKR0RqVUEwMTlNTWdpSVdLTHVDTXhKVUhTcjU4RHYy?=
 =?utf-8?B?bG41R1hXS0FqcHhyeHFkWFVLeVlkZ094TG13a0diS1NxMHFTaWsxcG9QUkJl?=
 =?utf-8?B?bzRPblkweTQvWFE0cHpQMmJWb3R0MWlRZlNPbHplTklGd0ZOU3M0OHdaR0FT?=
 =?utf-8?B?aUZ0VitEa043bnBueTNvRlo0SXlDSW9OM0hXTmZEcjYyelY5QjdRUm80cFhw?=
 =?utf-8?B?dVRrN2FxWFJDOFd0YklKOWYwbEIyeHpHY1VuMG95aTN1d1ppWE1wTmtUdDBk?=
 =?utf-8?B?RjlyZWVjK2JqczYya3BvVFZPd2JjeER1cWlEeFN0d01SbmN3N1hCNzc4NmtH?=
 =?utf-8?B?N01wQThnNTRtazNaUE4zRXJQb0dTUmJEenJzMzdFQXZRSkQ4Z1FtVzdUMEY4?=
 =?utf-8?Q?XrS9JL+AFPlnMyJagWZE5Yw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 647329be-b3ac-4298-3e04-08daa0e78fce
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 00:22:43.8299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMkEcmaq3LV3WrNwc9lMtVkxNtne6S+0KpN2o+RoOe+mwTitZ0qgsvHPMoiEjPh3iFJqdeFkbCnmsajKfPNCgb5ZDEutRLJG9ItXaRVozTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6238
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
Cc: intel-gfx@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <John.C.Harrison@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/27/2022 5:10 PM, Matt Roper wrote:
> On Thu, Sep 22, 2022 at 03:11:17PM -0700, Daniele Ceraolo Spurio wrote:
>> The render and media GuCs share the same interrupt enable register, so
>> we can no longer disable interrupts when we disable communication for
>> one of the GuCs as this would impact the other GuC. Instead, we keep the
>> interrupts always enabled in HW and use a variable in the GuC structure
>> to determine if we want to service the received interrupts or not.
> Even if they have a unified enable bit, can't we still just update the
> per-GuC mask bit to get the same behavior (i.e., no interrupts
> delivered to the host for that specific GuC)?

We could yes, but we've avoided dynamically using masks for gen11+ 
because it can mess with rc6 (e.g., see 
https://patchwork.freedesktop.org/patch/207829/).

>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_gt_irq.c  | 21 ++++++++++++++----
>>   drivers/gpu/drm/i915/gt/intel_gt_regs.h |  2 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c  | 29 ++++++++++++++-----------
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h  |  5 ++++-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c   |  8 +++++--
>>   5 files changed, 45 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> index f26882fdc24c..e33ed9ae1439 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
>> @@ -17,6 +17,9 @@
>>   
>>   static void guc_irq_handler(struct intel_guc *guc, u16 iir)
>>   {
>> +	if (unlikely(!guc->interrupts.enabled))
>> +		return;
>> +
>>   	if (iir & GUC_INTR_GUC2HOST)
>>   		intel_guc_to_host_event_handler(guc);
>>   }
>> @@ -249,6 +252,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>>   {
>>   	struct intel_uncore *uncore = gt->uncore;
>>   	u32 irqs = GT_RENDER_USER_INTERRUPT;
>> +	u32 guc_mask = intel_uc_wants_guc(&gt->uc) ? GUC_INTR_GUC2HOST : 0;
>>   	const u32 gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
>>   	u32 dmask;
>>   	u32 smask;
>> @@ -299,6 +303,19 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>>   	if (HAS_HECI_GSC(gt->i915))
>>   		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
>>   
>> +	if (guc_mask) {
>> +		/* the enable bit is common for both GTs but the masks are separate */
>> +		u32 mask = gt->type == GT_MEDIA ?
>> +			REG_FIELD_PREP(ENGINE0_MASK, guc_mask) :
>> +			REG_FIELD_PREP(ENGINE1_MASK, guc_mask);
>> +
>> +		intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE,
>> +				   REG_FIELD_PREP(ENGINE1_MASK, guc_mask));
>> +
>> +		/* we might not be the first GT to write this reg */
>> +		intel_uncore_rmw(uncore, GEN12_GUC_MGUC_INTR_MASK, mask, 0);
>> +	}
>> +
>>   	/*
>>   	 * RPS interrupts will get enabled/disabled on demand when RPS itself
>>   	 * is enabled/disabled.
>> @@ -307,10 +324,6 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
>>   	gt->pm_imr = ~gt->pm_ier;
>>   	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
>>   	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK,  ~0);
>> -
>> -	/* Same thing for GuC interrupts */
>> -	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
>> -	intel_uncore_write(uncore, GEN11_GUC_SG_INTR_MASK,  ~0);
>>   }
>>   
>>   void gen5_gt_irq_handler(struct intel_gt *gt, u32 gt_iir)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> index 1cbb7226400b..792809e49680 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> @@ -1519,6 +1519,7 @@
>>   #define   GEN11_CSME				(31)
>>   #define   GEN11_GUNIT				(28)
>>   #define   GEN11_GUC				(25)
>> +#define   GEN12_GUCM				(24)
>>   #define   GEN11_WDPERF				(20)
>>   #define   GEN11_KCR				(19)
>>   #define   GEN11_GTPM				(16)
>> @@ -1573,6 +1574,7 @@
>>   #define GEN11_VECS0_VECS1_INTR_MASK		_MMIO(0x1900d0)
>>   #define GEN12_VECS2_VECS3_INTR_MASK		_MMIO(0x1900d4)
>>   #define GEN11_GUC_SG_INTR_MASK			_MMIO(0x1900e8)
>> +#define GEN12_GUC_MGUC_INTR_MASK		_MMIO(0x1900e8) /* MTL+ */
> Technically we should probably give this a "MTL_" prefix or something
> since we're not referring to new platforms as "gen12" anymore.

ok. Should I change GEN12_GUCM as well?

>
>>   #define GEN11_GPM_WGBOXPERF_INTR_MASK		_MMIO(0x1900ec)
>>   #define GEN11_CRYPTO_RSVD_INTR_MASK		_MMIO(0x1900f0)
>>   #define GEN11_GUNIT_CSME_INTR_MASK		_MMIO(0x1900f4)
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index b0beab44b34c..ab0263d8e1cf 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -98,6 +98,8 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
>>   		     gt->pm_guc_events);
>>   	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
>>   	spin_unlock_irq(gt->irq_lock);
>> +
>> +	guc->interrupts.enabled = true;
>>   }
>>   
>>   static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>> @@ -105,6 +107,7 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>>   	struct intel_gt *gt = guc_to_gt(guc);
>>   
>>   	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
>> +	guc->interrupts.enabled = false;
>>   
>>   	spin_lock_irq(gt->irq_lock);
>>   
>> @@ -116,39 +119,39 @@ static void gen9_disable_guc_interrupts(struct intel_guc *guc)
>>   	gen9_reset_guc_interrupts(guc);
>>   }
>>   
>> +static bool __gen11_reset_guc_interrupts(struct intel_gt *gt)
>> +{
>> +	u32 irq = gt->type == GT_MEDIA ? GEN12_GUCM : GEN11_GUC;
>> +
>> +	lockdep_assert_held(gt->irq_lock);
>> +	return gen11_gt_reset_one_iir(gt, 0, irq);
>> +}
>> +
>>   static void gen11_reset_guc_interrupts(struct intel_guc *guc)
>>   {
>>   	struct intel_gt *gt = guc_to_gt(guc);
>>   
>>   	spin_lock_irq(gt->irq_lock);
>> -	gen11_gt_reset_one_iir(gt, 0, GEN11_GUC);
>> +	__gen11_reset_guc_interrupts(gt);
>>   	spin_unlock_irq(gt->irq_lock);
>>   }
>>   
>>   static void gen11_enable_guc_interrupts(struct intel_guc *guc)
>>   {
>>   	struct intel_gt *gt = guc_to_gt(guc);
>> -	u32 events = REG_FIELD_PREP(ENGINE1_MASK, GUC_INTR_GUC2HOST);
>>   
>>   	spin_lock_irq(gt->irq_lock);
>> -	WARN_ON_ONCE(gen11_gt_reset_one_iir(gt, 0, GEN11_GUC));
>> -	intel_uncore_write(gt->uncore,
>> -			   GEN11_GUC_SG_INTR_ENABLE, events);
>> -	intel_uncore_write(gt->uncore,
>> -			   GEN11_GUC_SG_INTR_MASK, ~events);
> The modified postinstall left us with GUC2HOST enabled but masked.
> Don't we still need to clear the mask so the interrupts will start being
> delivered?

The postinstall does:

intel_uncore_rmw(uncore, GEN12_GUC_MGUC_INTR_MASK, mask, 0);

which clears the "mask" (i.e. the G2H interrupt shifted based on which 
GuC it is) in the mask register, so the G2H is allowed.

Daniele

>
>
> Matt
>
>> +	__gen11_reset_guc_interrupts(gt);
>>   	spin_unlock_irq(gt->irq_lock);
>> +
>> +	guc->interrupts.enabled = true;
>>   }
>>   
>>   static void gen11_disable_guc_interrupts(struct intel_guc *guc)
>>   {
>>   	struct intel_gt *gt = guc_to_gt(guc);
>>   
>> -	spin_lock_irq(gt->irq_lock);
>> -
>> -	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_MASK, ~0);
>> -	intel_uncore_write(gt->uncore, GEN11_GUC_SG_INTR_ENABLE, 0);
>> -
>> -	spin_unlock_irq(gt->irq_lock);
>> +	guc->interrupts.enabled = false;
>>   	intel_synchronize_irq(gt->i915);
>>   
>>   	gen11_reset_guc_interrupts(guc);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> index 804133df1ac9..061d55de3a94 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> @@ -78,6 +78,7 @@ struct intel_guc {
>>   
>>   	/** @interrupts: pointers to GuC interrupt-managing functions. */
>>   	struct {
>> +		bool enabled;
>>   		void (*reset)(struct intel_guc *guc);
>>   		void (*enable)(struct intel_guc *guc);
>>   		void (*disable)(struct intel_guc *guc);
>> @@ -316,9 +317,11 @@ static inline int intel_guc_send_busy_loop(struct intel_guc *guc,
>>   	return err;
>>   }
>>   
>> +/* Only call this from the interrupt handler code */
>>   static inline void intel_guc_to_host_event_handler(struct intel_guc *guc)
>>   {
>> -	intel_guc_ct_event_handler(&guc->ct);
>> +	if (guc->interrupts.enabled)
>> +		intel_guc_ct_event_handler(&guc->ct);
>>   }
>>   
>>   /* GuC addresses above GUC_GGTT_TOP also don't map through the GTT */
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index 4cd8a787f9e5..1d28286e6f06 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -636,8 +636,10 @@ void intel_uc_runtime_suspend(struct intel_uc *uc)
>>   {
>>   	struct intel_guc *guc = &uc->guc;
>>   
>> -	if (!intel_guc_is_ready(guc))
>> +	if (!intel_guc_is_ready(guc)) {
>> +		guc->interrupts.enabled = false;
>>   		return;
>> +	}
>>   
>>   	/*
>>   	 * Wait for any outstanding CTB before tearing down communication /w the
>> @@ -657,8 +659,10 @@ void intel_uc_suspend(struct intel_uc *uc)
>>   	intel_wakeref_t wakeref;
>>   	int err;
>>   
>> -	if (!intel_guc_is_ready(guc))
>> +	if (!intel_guc_is_ready(guc)) {
>> +		guc->interrupts.enabled = false;
>>   		return;
>> +	}
>>   
>>   	with_intel_runtime_pm(&uc_to_gt(uc)->i915->runtime_pm, wakeref) {
>>   		err = intel_guc_suspend(guc);
>> -- 
>> 2.37.3
>>

