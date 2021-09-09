Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C43405F51
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 00:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FAB6E93A;
	Thu,  9 Sep 2021 22:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566076E93A;
 Thu,  9 Sep 2021 22:16:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="284629708"
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="284629708"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 15:16:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="607035405"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2021 15:16:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 15:16:32 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 15:16:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 15:16:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 15:16:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+yLkMA90N2R/UDPgHgxvzesq9BhWO8XtKV1hgxanbfk7SypI1LaGF+GrK7By8lUUWiyv7Bncwlt29voumCLFKsWfF7+x1Qq6tFsb5Bxyk0EV8Wl1gA2pE8AFGFOiQ280dk46M+jewS3jS6mlY3sTQnB8uUmIQ4Ft60zngsgYjm0EGA5CL9PVrnC3BswA9/GwhriyBgOWVcYH6dxB8Jw9P4zbUOflvSzkIUBzAU5cDvhgVjRlggb5a3HL7Tn6H6u2ePC7UXOQySdIR86ZCRmu9mPTDbDIBmJNlSuABPCSChRy3XSZusS/lRnVt6shnTenpCYAA6qYgOOFjCqWrFVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=hYeDUW4ybqiyvnoESvxGSb3Yel16bSAQvq4GwRt72OM=;
 b=dXWwO85QYFHclDfTxSOO2h9ggJJKLd6Si4ZaS/wolEST+7IaHynJkIN393SPxKdKI5iwJclPaJQGPxyJVXVNWQgtftjJMvDBP5SaZ/V14xpHHykA0GCbxkqd0CDBA+SgreAHqgltHliIhFLBlR81/w17nzm2mSZrOfaFeRDmqKtlSyP4Apst3Don6fo5tFT7CevbhiKYG4ficqknHsZiWuyeCVtAyjoW/enZpvktQJlReOYxHiSLDM3rsvRP0/Pb/5XMtWrnp9kFPY92cX/U3gGDwptwgYZZh9yHjc6vggWzA5pFLT3iMSCnwb6qchtLNNTZytly4f2HzvjMnblmLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYeDUW4ybqiyvnoESvxGSb3Yel16bSAQvq4GwRt72OM=;
 b=O20jte4/w7gyh+g73hdCKBvki7T6Ma2eS2PYLBRvRQcK5nM+CWZVJCXezZNeSF/u54eajahLJ+V7dg2JwBWJDeHGSUZ2LSJRSjx27/gG0tRC6E8RtY0ntxMMPDQlnsxL7/MvZH2gqL9A6gbiuGwv0vAPwMmQLb+Q76Pj3ibwcBs=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5578.namprd11.prod.outlook.com (2603:10b6:510:e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 22:16:24 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4478.027; Thu, 9 Sep 2021
 22:16:24 +0000
Subject: Re: [Intel-gfx] [PATCH 03/27] drm/i915/guc: Connect the number of
 guc_ids to debugfs
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-4-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <bc10d3be-2294-5fae-4055-999e61180015@intel.com>
Date: Thu, 9 Sep 2021 15:16:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210820224446.30620-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR04CA0031.namprd04.prod.outlook.com
 (2603:10b6:303:6a::6) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR04CA0031.namprd04.prod.outlook.com (2603:10b6:303:6a::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 22:16:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 372aa002-a5c1-44a1-b1cc-08d973df75f3
X-MS-TrafficTypeDiagnostic: PH0PR11MB5578:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5578C8891CEC8B1902B4BFE5BDD59@PH0PR11MB5578.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RrzYqoHCfvNuugg3ssbGK+GapexQugNpHB+fbGpWHTRLNlhMltU0p3GVhc39BJY4BKzIkZ6zt/0FYWtlgpILsDXObd9ZOJLF/ISjZLL4UMQ4tbJWmBNQmSKGErPHQbg2JNUGJGA5uiCMC93pMJD0KIk/Ey8hHb2HzoB1w3e15ev2bb55f0Er2VI+SHoNDoDBVhPeCD7kUDPjevG0W1hO7vvgjaXQOkCHrqUedlPV1AGhSbYLy0SbTf3cVLepHDKdVTuS2kME3Ih4MrL7N7D6z3ipYn3gutxFakbMuZrDNIystDTUOQ0xtazAAhA1OTQ+QmQZwkLpWA7yrmvHJqqG8r6X5qcv6Y3XbA5GMkyXOZFMV1GA0uCqYGC9VnCoYO0aGH2HohxRFPy/F55MD25Q7DXJsf3d8qJ0eaJIYyTrpxsSDlCxgbt3ZvgXDAAQu4wP6zdVhlJYCdWjvq9M4o7BKjivLUqU5nV5ov7gtOgB3A7W0pDYvIOSCUefyjybjp3wV4FY1WNQ3b3tvITCuH4XpACyabvqm0veQSmFB6jVOEByxffdkhYJxrFUfkJYFXplq/ciczNh09VEQJIDEcVQqCJnSUkQIvrY1X20G3Q+XKOuucy6H6sKKdtcW2y4FJcyM4qJzvQPBsKxNOwt87rK0ZVAX2T7k4rxnMoXOSoWfBHY5XSm6rCR51PxeehgGFzED2xfF3LfD3FG+8UmcvbIfWiM2h42KYt8YNxUrrOdyFSgtt76NuKAguip65T6QLJZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(2906002)(31686004)(4326008)(38100700002)(26005)(8676002)(31696002)(8936002)(186003)(6486002)(66476007)(66556008)(36756003)(83380400001)(956004)(86362001)(5660300002)(107886003)(478600001)(66946007)(16576012)(2616005)(53546011)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTMrZzhJbkZKTG5kWEdlNFJhbHF2SzF4SktGWkl6OG1FM2ZYRCtmbjdoaEt4?=
 =?utf-8?B?VTcxTFQyWVhCalVJbWJMRkZkTFZJcElkUUtYd2Y4dEJoWlRwem1zU2RXRmQ0?=
 =?utf-8?B?TzFZM2VTWXpnZDBWN0xyV0p1L0VTclJ0Rm54SDNob3gxUWw5Z3R5b0crK3dP?=
 =?utf-8?B?d0dHZ21JY1dUSllESU5EOVFyeDdheE56SmtmWmNmZU9tTCtmUFpxMXMzWm1V?=
 =?utf-8?B?RWNKckRVdjNlbEpyc2hQSjk2bGdRb0xON25Ja2FYdmxlMWl2TkdjK01kR3hu?=
 =?utf-8?B?ZHBLUnJlaTd4aFdEM2l1cTF0VFdsZmttOUxZRmZ3SXZwWE1pdFlyei9WQ1dD?=
 =?utf-8?B?d2FuVGlIc2ZLSC9VQUwrTldpNTZ6RlFqY04vTnpDRXFjTzBWWS9OUzJaaXpp?=
 =?utf-8?B?VFAxRmtVN0Q2SVdHZE4yNTF5ZDdLQXFtVlRNRm9WeGJSSXFvNG5NeXU5SU1z?=
 =?utf-8?B?RXJhQXg4TWdRR2VaV0VjZDZ0eWZHY3RnSFNFS2tzTXhDaHUvL2pXbUNXcjNs?=
 =?utf-8?B?b0VGRW5ZU3ppMnU0dFF6QXFBM2lFM0JBY1RRZ1hLV3hjaUlhaTZ2ZTF2blk5?=
 =?utf-8?B?U214U0Q2REJWdzgwbVFaMnFTN3NWUjdLV1A5TjhDd2Zma2k3ZkVPazhkc2FO?=
 =?utf-8?B?UHg3eDhvL1ZkZC9vN2Fwd0VBalAyUUNocmpXWWJxYkJkd1l3WGp5cEduNEdv?=
 =?utf-8?B?OEpiVWkrdjdlVnBJazI4MG40Uk9leG1YWnlPcUlXdEk4eGNyNFBKQ1ZYWnNq?=
 =?utf-8?B?QjI1MjV4WTZHVzdEUGlJUG1QNGtqbDRqTmQvYWFjTzVlbW1meXdEbHJzUFNG?=
 =?utf-8?B?MWtoSlI0STZncjBJQko5UmFrY3hLNzMyQ2R3K3c0bWF2ZWhmL3A1cDYzemtZ?=
 =?utf-8?B?c1RNU0cwR2tkL2xwdmRCTk0yNUQvcGJvdE9tTTdLUjMyQm1zKytIZGhQaHhV?=
 =?utf-8?B?YUNPNHYyd1dlMURWRzc5OVRjTHhWciszOGRvZEpCRDAwSG8xeTR6OVJtaGlo?=
 =?utf-8?B?Sk9YTHB0NVRUNk1CeGVTZHZHOEdkc0NpQ1hOWnUvMUgzTWRncVZJNjJpSHd5?=
 =?utf-8?B?V0RWR3hBRFV5VTZ0QjdobjJkWUJBWHZPWTZEend2N0wxcTN6ajMvVVlkNHJp?=
 =?utf-8?B?RkY0dlhHMmdoZ3paS21mcDAvK1VDaDZhdWR2eDdWaXFEbHBsT2tYTlk0UzhC?=
 =?utf-8?B?Y3Q1NTBvdzQzUDZhK1M3QlIxRmhnd1FySGV0ZEtlWUlYd1BXTVZTTm82Ty9k?=
 =?utf-8?B?aU1iRzVUcWlWT2dNQmRnbDFwODlsZ3p5M3JVNEJoY1JXWit6K1Q3aTJXRkNo?=
 =?utf-8?B?cXh5YnFBTXlxZjFmb3RNRU92MlZEZUtBd0RPQ243WDRHb2hlYkdFNmV5TDhQ?=
 =?utf-8?B?ZU1yVGZCTFE3ejJ5RVZiZ05QOVNxZW9kYmpmVW90Wk1QbXVKRDByZWJtSHha?=
 =?utf-8?B?UDhTMUtsVTVZWmtmUU9rWk5tRkluS1lwdUlQK0ZzOWhlNnByNDVEcE8vMG9Y?=
 =?utf-8?B?YlVrcTBpQnl0M0sraHdFWGJRLzNHb0xodWFyQzVpeE0yNTdsY1oyU0J2Rmls?=
 =?utf-8?B?b1lFcEdDS0dkUldBcC9HSHk3b2w2TGQzSnpuT1dTU0RhcFVlT3A4cEFPTm1S?=
 =?utf-8?B?Qk80MEorLzU5WDVSMTNzUmU2czhIcUJ6RXF6aGUvYWgwd2UxM3ZvU09wNHVq?=
 =?utf-8?B?M2hHQzU3eWJMUFpXUTJqN3lOc2FzNmFhWEJGTHROb2JJVjhzK2M0c040YXBQ?=
 =?utf-8?Q?DJ1Uv2O4PJrcJqFHC5L70ML120W+D9veZJmm8ub?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 372aa002-a5c1-44a1-b1cc-08d973df75f3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 22:16:24.7842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NO68Gm/4iUIlWlUCHzliAm7uaaE4Q4hv7fGoEw2NsEBos3VcTvjubD23wfFEEbiHI5INX6NrOMbxAAKCO9kIpYLSa/XuZK/MHYvhiofgh9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5578
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

On 8/20/2021 15:44, Matthew Brost wrote:
> For testing purposes it may make sense to reduce the number of guc_ids
> available to be allocated. Add debugfs support for setting the number of
> guc_ids.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
It 'may make sense'? Is there an actual IGT/selftest test that uses this 
and needs to in order to not take several hours to run or something? 
Seems wrong to be adding a debugfs interface for something that would 
only be used for testing by internal developers who can quite easy just 
edit a define in the code to simplify their testing.

John.


> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    | 31 +++++++++++++++++++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  3 +-
>   2 files changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> index 887c8c8f35db..b88d343ee432 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> @@ -71,12 +71,43 @@ static bool intel_eval_slpc_support(void *data)
>   	return intel_guc_slpc_is_used(guc);
>   }
>   
> +static int guc_num_id_get(void *data, u64 *val)
> +{
> +	struct intel_guc *guc = data;
> +
> +	if (!intel_guc_submission_is_used(guc))
> +		return -ENODEV;
> +
> +	*val = guc->num_guc_ids;
> +
> +	return 0;
> +}
> +
> +static int guc_num_id_set(void *data, u64 val)
> +{
> +	struct intel_guc *guc = data;
> +
> +	if (!intel_guc_submission_is_used(guc))
> +		return -ENODEV;
> +
> +	if (val > guc->max_guc_ids)
> +		val = guc->max_guc_ids;
> +	else if (val < 256)
> +		val = 256;
> +
> +	guc->num_guc_ids = val;
> +
> +	return 0;
> +}
> +DEFINE_SIMPLE_ATTRIBUTE(guc_num_id_fops, guc_num_id_get, guc_num_id_set, "%lld\n");
> +
>   void intel_guc_debugfs_register(struct intel_guc *guc, struct dentry *root)
>   {
>   	static const struct debugfs_gt_file files[] = {
>   		{ "guc_info", &guc_info_fops, NULL },
>   		{ "guc_registered_contexts", &guc_registered_contexts_fops, NULL },
>   		{ "guc_slpc_info", &guc_slpc_info_fops, &intel_eval_slpc_support},
> +		{ "guc_num_id", &guc_num_id_fops, NULL },
>   	};
>   
>   	if (!intel_guc_is_supported(guc))
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 8235e49bb347..68742b612692 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2716,7 +2716,8 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>   
>   	if (unlikely(desc_idx >= guc->max_guc_ids)) {
>   		drm_err(&guc_to_gt(guc)->i915->drm,
> -			"Invalid desc_idx %u", desc_idx);
> +			"Invalid desc_idx %u, max %u",
> +			desc_idx, guc->max_guc_ids);
>   		return NULL;
>   	}
>   

