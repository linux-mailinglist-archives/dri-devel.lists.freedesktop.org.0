Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DBE5A32CE
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 01:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDD210EA9C;
	Fri, 26 Aug 2022 23:54:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9FB10EA98;
 Fri, 26 Aug 2022 23:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661558080; x=1693094080;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lOVd1PrI8Xcx725Svi6U/9gJbmyStUpmvsNJ3TjjdY0=;
 b=k7cgI867Ld0ekKNMAMFcqYfackmIgisQrlbLZ9kwI7RRh+0WZvrZH701
 6PHOHg70Kxki0RM66wPvUHS1yaTvMTcBeGjOD1JpgTAZngtux1hTDmCWW
 H1RPfPWpcgMZ3Q/6EQragRA/fF/D7xDAIjoK9TYNVcetwY1G4NjAfL6xT
 SLnSI2kktnkH9s18FC7cjsEOdr5WZ7KBuvyb8MVy9TPCQrMhjkF9EQbAE
 AMNwlPlCP8PnXfqaGOQxt2zWuxwdp5yGmiPPBaJDI/q+0JPCfCQqEfBmB
 PrzJ9jfoqkTMqctd38J2jBVB1s/uzfnxgCDN4zAR/yuKFZqJWHYJZmEw9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="320725527"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="320725527"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 16:54:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="700011574"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2022 16:54:40 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 26 Aug 2022 16:54:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 26 Aug 2022 16:54:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 26 Aug 2022 16:54:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpmcTycSK2S8urtKadmIilN7hsf5nDVbQhM5GMYW/kQJQ1sOy3zFWJkezkHz4SoVjxjeZ8BXbACwPxtY6Z2zcjnhPYDxS7jlEIGmm5IvCsSXMC//bTgJYan1vplIJ4PAdyluU1/UCi0RTjTSUJ9HWh3KxriPTVcBn4HO4PEp3HHRwPil5dS3tRjjh9hhC7FngO/XksIo42mKKhv0aQ3So2/4DpLEp1hpFTkTsFsNde89ZqPSe/8JxRHhcmWcfdsafmirHjqz5pV0ANCINJ7tls/xEcnxbH2fy+k37rYKHcCO/f1ocfjHHwUKgmi9Z3U8NEAIUhCb5q/f3XsIv9topg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P268x82D1IbfE3PgJSk5l6AWsRNrf1Pn16EVu3dUVXw=;
 b=XvhPy1OmA+DZN5CRP2v3ux3E66HxzzGfriOZTVHToiiBc31OpyBnFMbfeQBTdkL2gxRyDAwSiJ7BN+ssAsbGEK9T9sQ986c3e2DG6Uu1QmPxdwpFh98m5uL8goid+Si3krRwDj+6wN76FDz+bJq1AvilqbsQdYpaSYN/tl+KA4SKe06vptWuE2Gq9lljpHB6SpUJIrg+RXHCy0LLyQekp47r8ALnN+mPcm9/dskvxtTc/3liN7x2Yg763yubRTZ7pu4Un6MhlQ3vYRjadguJAUQpLPo5jFWpncsPZBl22DcCP2thoNVrVulvyOLHNqgTHiDDRbTqdNzy33oRhX2pKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 MN2PR11MB4629.namprd11.prod.outlook.com (2603:10b6:208:264::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.14; Fri, 26 Aug 2022 23:54:38 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::1977:59e7:5a28:24e1%8]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 23:54:37 +0000
Message-ID: <9445b047-b358-23f4-a9c9-75b3b19dead1@intel.com>
Date: Fri, 26 Aug 2022 16:54:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] drm/i915/uc: Add patch level version number support
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220826030553.2611574-1-John.C.Harrison@Intel.com>
 <20220826030553.2611574-3-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220826030553.2611574-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::23) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d492b5ff-9a37-44fb-6ac5-08da87be5592
X-MS-TrafficTypeDiagnostic: MN2PR11MB4629:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uVJjG9BCQ28slY8JVLOfqnW3qjJ3UzJ/UX8dWbNJ+iJ7dHi9MhgUTKBMjzo/Iip16nHeBUk1zfE6u2w3LVkFh/05DTG6YXfYP7VS4oqQt0THPySzXKlwAdJoLhg5oSII8ScFdgwoak434oAn9g32d+XgXU3ZwOpV5B1UiGhs5wO6AVyvHZpDg3XiBo1t5hEOGsJSKa/NW1OXL2GL674zjj6+x2MPioj1Qtlo9hkwS+4X1muaUe2hfapN0Fh3OP8ztVnVyKcIROoktbIrqHKScds2F7Odabz4aQHQnRHm94w/mGlNWi3JWfatJ3eXluVLsPO+Y4pMWu65YzfUfCF5Yt4zwwGfXdhawt2aQ4rS6+7EOt4JWwYnq1lT515Wo3HOPlDL3MSMmhZtYvvTnQtzEpnAfuq+jaJqr/DbcbdqRXyjVxeXIOPsme7I8Hch0zSOGAkQG9myYke1WrmaVKshErfPybccSif050Ub4WZoMOH6iFFxp3piLffPCJL1i/LtXOKS+OERW4Q/XDYqwX34mXFHQXL3YliNqcYwRDM3PNuRLaYlENBL0aw6qSix8XfmWPM1vepzBVPGg8HTWOOVM7f8gpR+IMq8RRE6XDO/WLzcYCqbICLtmARYQBKFZoKWuOYEAFbVIc0s1U0ecfIk18DVRMncaT920K7Nx1lTEJkP16SaMh8CRw6dxz7awci6vd3qhGqqlxah+yGZPVlkhrYS+lPDC5jIsn/JmPIYXilHrbuQxU7s7sPd25nPBJHxWE90kmSTiFj5ZdTvWnTzeRvo6UcDKZlRa94xthIeh30=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(376002)(396003)(366004)(39860400002)(31696002)(86362001)(8936002)(450100002)(4326008)(82960400001)(66946007)(66476007)(66556008)(6512007)(26005)(83380400001)(8676002)(316002)(2616005)(6486002)(478600001)(6506007)(186003)(31686004)(53546011)(6666004)(41300700001)(2906002)(36756003)(38100700002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHRiQWpyNWsyd0VMOW9DQWkzNTZQZzdiTE5sYjFuTTRDbXJOaXRieGVTUU9m?=
 =?utf-8?B?M2c2ZEEyWDY2dm1PbUgxQ2U5ajFwWi93eUFxZElIcFNmWFhzM0dNVXVldHdl?=
 =?utf-8?B?U3YzcmtiZXpJcjlPdkU0bm9hbitwUW85WUQvWmo1L2tLZTArVThlUXpxRkJX?=
 =?utf-8?B?dlpNcnJyU1NqOG9XL2hFNzlNV2Z5eUIrWkJ2b2lXSy9jYWlpYzgvNTZJMVI1?=
 =?utf-8?B?dkI1QU9BU0VKWlB0aTBTNmRDK0hrSHdFYXlNb3FnQkM5bkRBRW1kSkc4VGw1?=
 =?utf-8?B?SEhNbDBzTTJSRFErWStSalpibmY5ZjBNOTFXMGJCM01ubHhjTWZKVUR2NEZa?=
 =?utf-8?B?dGJZVUZxdlpydlJSYzNBNFR5TFpzMHpYdERzRDRpNFpXbk1QUGtTaGZFRVFL?=
 =?utf-8?B?bnN3UEp3ckl6bS9RRVA2R0xMOFgyZ3loZnp6RTl5UDRmOGtRTlZ5bXZqWTBB?=
 =?utf-8?B?bFUzYllnWDdlaG9oQ2c3dDh3ZmtoUWd5RVVLTWR2ejNhNzlDeXVsd2lTMkkv?=
 =?utf-8?B?bElOdU5GTDZaeWhmOG4wTEFyWGs0NFoxek9sZU95bUZGVDdRYUFvMUNjZTR1?=
 =?utf-8?B?eXZOS3AwSnBHby90ODhHa29nSVRrdnJZRjFSUTlMU3Y0NkdxVkRsRE1SQU1z?=
 =?utf-8?B?UU84VXJ5VndmQ0pVU09qM2d4V29XekJuZVZDR085c3NDZG1yZnIrOUptUENx?=
 =?utf-8?B?UDR2eUQ5bHpydENrMEk5cnhzQ3I5RjRRdDVmNjhKaFpGUU1vZzlrOG5taUtP?=
 =?utf-8?B?UUpMOUZGZGMzcTBEUU44amptUy9Ua2dEVDNXbDMyUHcrb1d3djQ0Q3RoRHhl?=
 =?utf-8?B?UTMzYmdFR0g0YVMxQlNMYVVtZmpuaGVUSFUzTXBYZlZHemFtc1JnUEJTZWdo?=
 =?utf-8?B?MktUTXpORlNhMzNQbTF1N0s2QnRoNWdxU2QxT0ZEb040a3hqemxBdVl0emc5?=
 =?utf-8?B?eC81Z1g3c09vaG9pTnNMa1ptZ1hnL1BxaTE4MFd3MVRtQjliK3JyNzZuYndX?=
 =?utf-8?B?MVRUYUQ4a1JvL1V4di9JMUo2NHF3Mno1eHhhdkZFYWphb2lFcXlpcVdqL3BB?=
 =?utf-8?B?QzlBbTF4RldnWWVyWE52ZHZKM0xFQ0xxMitCMXUzSDRiYlJlWWpqVHVvL0hE?=
 =?utf-8?B?KytBSFFidGoxbjBPeWs1Z1RrRHZ2ZXgwV3BDSkZyK1kxbEdWdDg0Uis2bEVv?=
 =?utf-8?B?TjA3c25xUjlqZUVuV1NqcU1rOUcvdWhtYlBveGMrODBGdzJGS0xYVWFkbE1o?=
 =?utf-8?B?a3VZd1ZrazRTU1VzVlZBcnU5a0VBdDJBaDhjL2wwUUg1SGJPdG1tVU9CTjB2?=
 =?utf-8?B?SWltVkVXU3JuVVBqa1JnZHBLbVNRb0crSk10T3JTZ1NIbzRHMFQ2ZkJ5UUJt?=
 =?utf-8?B?NWFBajVNeHhlY2s4L3NqUGd6dm55UDZyK3dOU0VyWVdKbnRZOWVNTFh5UWI1?=
 =?utf-8?B?enlQdDhiNmpjTkVkU2JaakxWaXdGWUNzZVh2Tkg0dTRITjR3WFU1VElvOExE?=
 =?utf-8?B?Z1JFdllHYm05a3FxRDNKcHhzZk9yOVJVaXV4NldmUWZVQ0doKzNTMFJsL1l3?=
 =?utf-8?B?NUFtMmpkcVhDaGpXOFlyU2tLdHNZVXdqcTlqUU1CTHl1d0RHd01iaDNlRTN2?=
 =?utf-8?B?N0RFRmp3QmhOWVZTZW5Ec0xBTlRiNU95clNtM0R4U2tVaXFlOG1JNlUreDly?=
 =?utf-8?B?ZGprVURFbUVvcXBWbzhwdlJtZDh3MmNSc3k5aGY2cU9MYUIwTm56NC9KbW44?=
 =?utf-8?B?bnhFRFU4STNWRUpmRUpwNHVmZkwrTnlUR3RiMFhNQVFWa0M2cU1ERmRNaFBz?=
 =?utf-8?B?dEhKSmdXczJtMUoveG81ZkNReEx4TFZ1YllmNCtLa0p5OUlvNE44Snd6UDdF?=
 =?utf-8?B?cDVRbGwrbWJRSVNVelluWko3cUdrN0phZjIyK3piK3Y0cTdDbkh6RUVoVlY0?=
 =?utf-8?B?MnhsQkdLdmt2YStRd082KzlBek5xUGFsamh5S1BEZUJub0p3eE9IbERXTFdm?=
 =?utf-8?B?Uzg0VjNmQmFQNWxHcTRVamZ6UHhnVW5YNHZIa09relZiTXYwOVZYcEltZjZO?=
 =?utf-8?B?cHdINzI1M285L3ZZeEIySExlZTBZK0xqS2JGamdtZURkMVJSOVdSUGdwVHhp?=
 =?utf-8?B?NTBsMFVWT21ET0FnaithdjBTMWdTZXFSdnpDcHZweTZTNHNDUEJXaXovZGxj?=
 =?utf-8?Q?CEGi07wzlqT+HwQWnWLZYCA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d492b5ff-9a37-44fb-6ac5-08da87be5592
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 23:54:37.6791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tCKQCYz18UntsiEk0MRD84T7bTYJhMP564/lWOPhjuAElI1cETEgjZnK96gespHXnaxWWCdhoNC9VDH/RFhLpq2M9KynCUvQyYUudpxFlDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4629
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



On 8/25/2022 8:05 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> With the move to un-versioned filenames, it becomes more difficult to
> know exactly what version of a given firmware is being used. So add
> the patch level version number to the debugfs output.
>
> Also, support matching by patch level when selecting code paths for
> firmware compatibility. While a patch level change cannot be backwards
> breaking, it is potentially possible that a new feature only works
> from a given patch level onwards (even though it was theoretically
> added in an earlier version that bumped the major or minor version).
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 10 +++---
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  6 ++--
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 36 ++++++++++++++-----
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  6 ++++
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |  8 +++--
>   5 files changed, 47 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 04393932623c7..64c4e83153f47 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1868,7 +1868,7 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	if (guc->submission_initialized)
>   		return 0;
>   
> -	if (guc->fw.file_selected.major_ver < 70) {
> +	if (GET_UC_VER(guc) < MAKE_UC_VER(70, 0, 0)) {
>   		ret = guc_lrc_desc_pool_create_v69(guc);
>   		if (ret)
>   			return ret;
> @@ -2303,7 +2303,7 @@ static int register_context(struct intel_context *ce, bool loop)
>   	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_register(ce);
>   
> -	if (guc->fw.file_selected.major_ver >= 70)
> +	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0))
>   		ret = register_context_v70(guc, ce, loop);
>   	else
>   		ret = register_context_v69(guc, ce, loop);
> @@ -2315,7 +2315,7 @@ static int register_context(struct intel_context *ce, bool loop)
>   		set_context_registered(ce);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
> -		if (guc->fw.file_selected.major_ver >= 70)
> +		if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0))
>   			guc_context_policy_init_v70(ce, loop);
>   	}
>   
> @@ -2921,7 +2921,7 @@ static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
>   						 u16 guc_id,
>   						 u32 preemption_timeout)
>   {
> -	if (guc->fw.file_selected.major_ver >= 70) {
> +	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0)) {
>   		struct context_policy policy;
>   
>   		__guc_context_policy_start_klv(&policy, guc_id);
> @@ -3186,7 +3186,7 @@ static int guc_context_alloc(struct intel_context *ce)
>   static void __guc_context_set_prio(struct intel_guc *guc,
>   				   struct intel_context *ce)
>   {
> -	if (guc->fw.file_selected.major_ver >= 70) {
> +	if (GET_UC_VER(guc) >= MAKE_UC_VER(70, 0, 0)) {
>   		struct context_policy policy;
>   
>   		__guc_context_policy_start_klv(&policy, ce->guc_id.id);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index d965ac4832d60..abf4e142596d0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -435,9 +435,11 @@ static void print_fw_ver(struct intel_uc *uc, struct intel_uc_fw *fw)
>   {
>   	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>   
> -	drm_info(&i915->drm, "%s firmware %s version %u.%u\n",
> +	drm_info(&i915->drm, "%s firmware %s version %u.%u.%u\n",
>   		 intel_uc_fw_type_repr(fw->type), fw->file_selected.path,
> -		 fw->file_selected.major_ver, fw->file_selected.minor_ver);
> +		 fw->file_selected.major_ver,
> +		 fw->file_selected.minor_ver,
> +		 fw->file_selected.patch_ver);
>   }
>   
>   static int __uc_init_hw(struct intel_uc *uc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 94cf2d4a46e6f..7c45c097d6845 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -447,10 +447,12 @@ static int check_gsc_manifest(const struct firmware *fw,
>   			      struct intel_uc_fw *uc_fw)
>   {
>   	u32 *dw = (u32 *)fw->data;
> -	u32 version = dw[HUC_GSC_VERSION_DW];
> +	u32 version_hi = dw[HUC_GSC_VERSION_HI_DW];
> +	u32 version_lo = dw[HUC_GSC_VERSION_LO_DW];
>   
> -	uc_fw->file_selected.major_ver = FIELD_GET(HUC_GSC_MAJOR_VER_MASK, version);
> -	uc_fw->file_selected.minor_ver = FIELD_GET(HUC_GSC_MINOR_VER_MASK, version);
> +	uc_fw->file_selected.major_ver = FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, version_hi);
> +	uc_fw->file_selected.minor_ver = FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, version_hi);
> +	uc_fw->file_selected.patch_ver = FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, version_lo);
>   
>   	return 0;
>   }
> @@ -512,6 +514,8 @@ static int check_ccs_header(struct drm_i915_private *i915,
>   						   css->sw_version);
>   	uc_fw->file_selected.minor_ver = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>   						   css->sw_version);
> +	uc_fw->file_selected.patch_ver = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> +						   css->sw_version);
>   
>   	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
>   		uc_fw->private_data_size = css->private_data_size;
> @@ -1000,6 +1004,8 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
>    */
>   void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
>   {
> +	u32 ver_sel, ver_want;
> +
>   	drm_printf(p, "%s firmware: %s\n",
>   		   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_selected.path);
>   	if (uc_fw->file_selected.path != uc_fw->file_wanted.path)
> @@ -1007,13 +1013,25 @@ void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
>   			   intel_uc_fw_type_repr(uc_fw->type), uc_fw->file_wanted.path);
>   	drm_printf(p, "\tstatus: %s\n",
>   		   intel_uc_fw_status_repr(uc_fw->status));
> -	if (uc_fw->file_wanted.major_ver)
> -		drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
> -			   uc_fw->file_wanted.major_ver, uc_fw->file_wanted.minor_ver,
> -			   uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver);
> +	ver_sel = MAKE_UC_VER(uc_fw->file_selected.major_ver,
> +			      uc_fw->file_selected.minor_ver,
> +			      uc_fw->file_selected.patch_ver);
> +	ver_want = MAKE_UC_VER(uc_fw->file_wanted.major_ver,
> +			       uc_fw->file_wanted.minor_ver,
> +			       uc_fw->file_wanted.patch_ver);
> +	if (ver_sel < ver_want)
> +		drm_printf(p, "\tversion: wanted %u.%u.%u, found %u.%u.%u\n",
> +			   uc_fw->file_wanted.major_ver,
> +			   uc_fw->file_wanted.minor_ver,
> +			   uc_fw->file_wanted.patch_ver,
> +			   uc_fw->file_selected.major_ver,
> +			   uc_fw->file_selected.minor_ver,
> +			   uc_fw->file_selected.patch_ver);
>   	else
> -		drm_printf(p, "\tversion: found %u.%u\n",
> -			   uc_fw->file_selected.major_ver, uc_fw->file_selected.minor_ver);
> +		drm_printf(p, "\tversion: found %u.%u.%u\n",
> +			   uc_fw->file_selected.major_ver,
> +			   uc_fw->file_selected.minor_ver,
> +			   uc_fw->file_selected.patch_ver);
>   	drm_printf(p, "\tuCode: %u bytes\n", uc_fw->ucode_size);
>   	drm_printf(p, "\tRSA: %u bytes\n", uc_fw->rsa_size);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> index 344763c942e37..cb586f7df270b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> @@ -73,6 +73,7 @@ struct intel_uc_fw_file {
>   	const char *path;
>   	u16 major_ver;
>   	u16 minor_ver;
> +	u16 patch_ver;
>   };
>   
>   /*
> @@ -108,6 +109,11 @@ struct intel_uc_fw {
>   	bool loaded_via_gsc;
>   };
>   
> +#define MAKE_UC_VER(maj, min, pat)	((pat) | ((min) << 8) | ((maj) << 16))
> +#define GET_UC_VER(uc)			(MAKE_UC_VER((uc)->fw.file_selected.major_ver, \
> +						     (uc)->fw.file_selected.minor_ver, \
> +						     (uc)->fw.file_selected.patch_ver))

Might be worth saving this in a variable to not have to recalculate it 
each time. not a blocker.

> +
>   #ifdef CONFIG_DRM_I915_DEBUG_GUC
>   void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   			       enum intel_uc_fw_status status);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> index b05e0e35b734c..f214d24fbcf0d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
> @@ -83,8 +83,10 @@ struct uc_css_header {
>   } __packed;
>   static_assert(sizeof(struct uc_css_header) == 128);
>   
> -#define HUC_GSC_VERSION_DW		44
> -#define   HUC_GSC_MAJOR_VER_MASK	(0xFF << 0)
> -#define   HUC_GSC_MINOR_VER_MASK	(0xFF << 16)
> +#define HUC_GSC_VERSION_HI_DW		44
> +#define   HUC_GSC_MAJOR_VER_HI_MASK	(0xFF << 0)
> +#define   HUC_GSC_MINOR_VER_HI_MASK	(0xFF << 16)
> +#define HUC_GSC_VERSION_LO_DW		45
> +#define   HUC_GSC_PATCH_VER_LO_MASK	(0xFF << 16)

AFAICS the patch version is in the lower 16 bits here, while the higher 
16 are the build number. e.g for dg2_7.10.0_gsc.bin (available in 
drm-firmware) I see:

[00000b0] 0007 000a 0000 0574

Daniele

>   
>   #endif /* _INTEL_UC_FW_ABI_H */

