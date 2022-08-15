Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C025942D0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 00:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5421D62B4;
	Mon, 15 Aug 2022 22:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84110C39ED;
 Mon, 15 Aug 2022 22:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660602441; x=1692138441;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OnR8c5YdvHsOjajobxhmxDRBdlJtudfAEZcOvylsoq8=;
 b=gnKhMmDCNDHDNmFp9qRJyRWpPCRJgQqIrieRpUU1c9sBbzfOHV2kTnH1
 oyMAO+x/xCW53lUjKHalXX6LyPWJvL2Uy44NyyEC/kOluvbGUN/2bV4oL
 16gbQutDirBD8xQ5TBAmfusp1oLxo4bTDk+wPd15qeESCzIH0yzCBJXUk
 YMLM66uh6UbSi7OOEx7nBRYc9FO0o5FszSXzhzCli3aXx4LWkXskHJV0X
 ZxVUp8tq2uyGCqgb5Rn93eGPJMYyCIJDosSy4qRx3RK0S/YnHfR0NOPuS
 zhJ03/9MQ4UfDzWTWrgxPC7jLEVih88/SsSyeRipqyeY4DbxdxEnrlO/Z g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="353813224"
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; d="scan'208";a="353813224"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 15:27:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,239,1654585200"; d="scan'208";a="934647739"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2022 15:27:16 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 15:27:16 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 15 Aug 2022 15:27:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 15 Aug 2022 15:27:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 15 Aug 2022 15:27:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UP1SGCNQhZxoEsnVf/6xRkbKJYq1qkydSewt6OeOzh5epjPgKRONoh2ydp8/wHEg41gfF5oqZjR+Leywh6GlbI8x3bMLmnsmX76x+C1kxI/k+mu/uV0EDb9RLluoIdkPl0f8WG92UU+NWqU5PFh0QospTrksmYDCVuVTRSwekjGLcr742ioTMM2QdwXPPAuTwiw2QR4A9mADsYHffdApy+tdsngH0wAxT+BWkN1G24OAKciZzvSBYUrR6CmiL2TeMiV4Onb7zwP0xlFQRSe3je3t9HwAHhVZqofyDIbzvZYlkGX9imgj+JwcVstSLgAQI0rIEI3A8MUjAuJHydSy0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0s3uji01zpoaPIiAIG4E4+k+i161j2eHiz3yMVluhik=;
 b=I6bOpOHSHiJGozxLDosVYplqucfmVckcBvMyVvBVPNxNOeBnldBkZMnlJNp9p6Ndw5TT2qB1W6VDL+NrBoW+Pcsud3Pq5THAb5ZkmuUwmw3HsjgIdVkPapjmIKeDFp7uMTO8xvOjYWXi6XO7+jeiQpH1Pl2MmcXY9MARJVvobX60x18ReorwduK4sXB8bVFCCxRQvmuHLkeWqCx81N7MiWFZ6ANEMeTwtnIbdI3KoVA/YGBWJPBg0goYshqUSKw0VfGKWqsd0tG+LaRE4g71WhUwXGycfouFGhMnhERGqvrRysVTjV16TIWI6CXTP1mJuv9kT7Eb59g9RghQ4myncQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 15 Aug
 2022 22:27:13 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::4db8:1f01:f830:305e]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::4db8:1f01:f830:305e%5]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 22:27:13 +0000
Message-ID: <b21a2165-224f-38ad-9efc-5c2a6a1fe02a@intel.com>
Date: Mon, 15 Aug 2022 15:27:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH] drm/i915/guc: clear stalled request after a reset
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20220811210812.3239621-1-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220811210812.3239621-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::7) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b906e1c-ec30-487a-3d3d-08da7f0d4cfc
X-MS-TrafficTypeDiagnostic: SN7PR11MB6678:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /mDhPbibHUpkR80UA93Wb+SpsuwGDag3hEQaa5nQIh5zxxiriFcb0luDdgNEUNTHg8Q8vhyLGr3ovMF2kw+552AcaknMfWvnFA5oid7AFc+WYMAGE+NWiM2q+NiwP+yJmnOB6wBdE1jgQDjOXSJV4kZ+N1pg3Iqt6j/X4T1DGc+OJjFeWTMvpdJdx3BMLb7pVd7e8RHmWBVwVHg4ft57aOqPSNBYl6v2JxBB/KK9K32srPas07tnNqRJAAnJMo/tv2Nc5V/Dsdg6/1oXSqn+eWQFMt0qbz7ucZ7Qf2MUFHNXRV6+22A1xDl4OTgSkv5ndeFmPr6E5c5JoD/7OHsKvPQy2sOz5IaKhKYPP30mXvY6Wk8q2qNvlbaz34RNSruq2bINz82OSSXFk0dw5VyL8MkqYDe26Wc4JPQ9SbS6QKlGR6/V5icdKeA2a0zUuVjsdnnOWo/n7THjv24wEbFC2cXTnhsVJ4DWfObahsYZPb13cSyrtFdZbeaD1zKaKFgb1eiGp3SkhEwZkKp0GZQcqVlr9W+BIPctTP20NaCcMYmzxZuOmhARl59JBwPY29UfQoI49mIrhtZpahQD6r8hBGHrSv51h6zXIMnOjB++qNyZw6wGcoKZRWZiAuA3VBDUlLVisogaWjoHimRtfV9XNvqB7ycJcF0hIZWR+vEQ4ARvMpKm7vFTPOEZK/013zMKd4KYqTgxxaZsGIAP/SbfBzM5JcV6/SUgOrIK5E3l6set9goV94H3M+u0pxbxfpeROCETufMNqdRuKb7/hkDTnvYQ2WQV4Q7pPphH/3aCBzM+xHafBnGRpdR2B9KrAorlsqSewLXvolpLBXwuED8n9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(366004)(346002)(376002)(39860400002)(31686004)(316002)(6486002)(83380400001)(4326008)(66556008)(66476007)(8676002)(36756003)(66946007)(6512007)(26005)(6666004)(2616005)(31696002)(5660300002)(8936002)(38100700002)(186003)(86362001)(478600001)(82960400001)(6506007)(41300700001)(53546011)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmNmN25KQ1VkNmNCSmJlTWdabW9abi9CZWJ2VGJQeFhNMkdXSTdOYTlXQUhN?=
 =?utf-8?B?N2R1Z3pWK2EvOXA2YjBOUXZCZXNEaGJYOGF2REh5ZExKelRIK0VSSTNEMWZB?=
 =?utf-8?B?cG1URGtXM0doaGlDRVhwb1ZjZ2RLeWE4ODhiOXRoZmFBaHpjWXdFYW5jdWRk?=
 =?utf-8?B?TTRReXlNbFpTb2tuYldIVWcrcEI3ZUJFVmRsQk5pd2lrODN1bXptaFZFaWdK?=
 =?utf-8?B?eUE0TStWaUpFZHNrRE9wN2luZ1NJRjRrLzdDVDhMS1pucTJ2NmVqcU82NUFx?=
 =?utf-8?B?b3NxQVVoVnFkUXlhamx4ME1zVWpzQVhvVnlFZWk1TjRtY3pGTFM1ODJjUkNu?=
 =?utf-8?B?bU8zWlRJVUovWTlNd20wYWhJOVVPakV6ZzZEdStSa3hhZEZJdDdBSkNsekcr?=
 =?utf-8?B?OEFqc0RXbC9scWRjb1RXLytLNzlDc2xoNXNjTitIYzAraTBhQ2hXTEVUb3g3?=
 =?utf-8?B?bmV0SWNXYWhkTEcvSElIeVZtazBzcEN4Q3JSbzB1SDAveGhWYWN4UWFFMFUr?=
 =?utf-8?B?dlpxQTFGMGRnRnZpZGdtZHBZTHZmRDJiRVFoSnQ1TmhpVlpXK2xESWtGd2Fo?=
 =?utf-8?B?c3VaYXlSV29GNTZrMDg2N1pQUEp2c0VTdGtHbGEzL05SWGdEYkM5blE0Sjc2?=
 =?utf-8?B?ZlNYVmZjN2ZGL0ErdUZPUHJCb1FvK1ovekRYdnVxcjZYYWM2Q253TGdkZVJF?=
 =?utf-8?B?cEt0ejZMMmlydkU2QzY4TWV6blh1anFKc1NRQ1liRXprNlFPd1pSZFdieUpV?=
 =?utf-8?B?TEMyN1c5TGY4ZzFGRUJJTG5sRis4bWNvb3JZb0JqbUFlQkJEZ1RUWW1WWTRC?=
 =?utf-8?B?T3EycXIxTmwxQVllUU9XWmUvdkFQUUpuTmxsWW80NWJxSzRza3BmbFMyYmhn?=
 =?utf-8?B?MjRJd095RkdoV3JoV0Z3SG1qSThVYU1iNm1ZQ3R0WFJqd3J0TDBlUlV1ZEhm?=
 =?utf-8?B?NllvVDRsRzVtYnhhY2JTbUxya3hhRlI5UUQ5MStTTE9vSVpiK2QxWE5PUElh?=
 =?utf-8?B?cmlKaERJR1lLSFc3MTA5Zit0dFRwOWRSbjNxN1hZa0VYVGMvbUxKZzZYRU9F?=
 =?utf-8?B?MHRkdWFDUkR4NEpzNWFaS2FIQlQ0TEtjc2loQ1Q0SmFoZm5JZzkwcllXdCtR?=
 =?utf-8?B?LzFlYTh4ZGtIZTBBUlVyaVQweVlucDM3WGFObXVpNTA1SGJYUTFGZzRlRjZG?=
 =?utf-8?B?TFNYamlzcTdZaXNzaSt3L2kzV0lTK3UwMDZtalMzbkx6cjRtSnYyRmh1cjZp?=
 =?utf-8?B?M01nRjZtL3JIQU1saEIrdHEwUXcrVmxVZE02VTJmcmxEVjlZbTE4eGptMlBu?=
 =?utf-8?B?dEdkajBkZ0xkQzlCeGdQeW1GRUlyK1l6TnNPSmI5OEh5K3lTd2wxckdlZXMy?=
 =?utf-8?B?cWxnekc3YnJuWmRvSVlrMVg4a1BQRXVZZmRPZmtuSFlFSEJUMC9jd2sxKzhL?=
 =?utf-8?B?RHVNVHowUlZtZTBiUUtkRXcvVS93cUcwZTZqMlZvL0JrNWNlV3pqOHdLaGhi?=
 =?utf-8?B?OGVXendOY0VITXJUUExEUlpLOU5icGVwUk9RSGNJUUI5NlppRnZnemxBKzdM?=
 =?utf-8?B?UGxVZUtEZEtNYmYwa01UWUl3eHdsZ1N4MUoyWDl2TW0veDZVaHlnWEgwY3B2?=
 =?utf-8?B?a2hrVWUrdXBpaEprZU1SdlYwNnFFSnBpd1NFaDZINHNkVlIyMFpDK1Y3SDVu?=
 =?utf-8?B?dFZ0U0VKYktPOTk5YmFUMi9ZWVgvdlpGbVlYeTlPOWFodTA2VEY0dFVrL1Bp?=
 =?utf-8?B?eUxOUWtJaHVJb29oVWhXdzlSb1kzRTVybEQyR0RqLzN3b0s4K25GcUtlZGVD?=
 =?utf-8?B?WkMwazFWelc1Y0NKWjQwYlBKOWZJcXdYTlhuamxWVU9XdzNyWkFyeDFCMFRC?=
 =?utf-8?B?M3B1WkloYnVDaTdEdUtaNTNaZ0UxV3ZLZERIZXRvajdaRlFmSXVONVlxR1Zi?=
 =?utf-8?B?eGtGZUQrcElTc3MzV01zc3cvU0UwSzZSNHVSaXQxUnZESVRKeGJiVEkwRXNk?=
 =?utf-8?B?bHpmek9Fd3ZpM3gwNzhvbk03ckkxa1dmeDBlUDRFNG84U0NTK3Nsbm0xaU1Q?=
 =?utf-8?B?VCtTWjFBL2xWRkVCbVR5Y2FRc2hhcjlIdkszdUJKU0crcDhxbTBGQTJvT3BP?=
 =?utf-8?B?T3VMODd6clJuTE9DTGgyVkdYcU5uSmlZV3RoVUEybHJydDdMNW56SHNlR3dF?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b906e1c-ec30-487a-3d3d-08da7f0d4cfc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 22:27:13.0341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNrrdl1Q2P4TU6mXDiJWZdlIbgGO6DlN12aNwivHW78aEWgpWTlWOkkUZ8GGqREk9UeRm9qLd3mR31+acxeJX2+QZf9lPiz53arWr2Pejkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6678
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
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/11/2022 14:08, Daniele Ceraolo Spurio wrote:
> If the GuC CTs are full and we need to stall the request submission
> while waiting for space, we save the stalled request and where the stall
> occurred; when the CTs have space again we pick up the request submission
> from where we left off.
>
> If a full GT reset occurs, the state of all contexts is cleared and all
> non-guilty requests are unsubmitted, therefore we need to restart the
> stalled request submission from scratch. To make sure that we do so,
> clear the saved request after a reset.
>
> Fixes note: the patch that introduced the bug is in 5.15, but no
> officially supported platform had GuC submission enabled by default
> in that kernel, so the backport to that particular version (and only
> that one) can potentially be skipped.
>
> Fixes: 925dc1cf58ed ("drm/i915/guc: Implement GuC submission tasklet")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: <stable@vger.kernel.org> # v5.15+
Seems like a good thing to do.
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 0d17da77e787..0d56b615bf78 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4002,6 +4002,13 @@ static inline void guc_init_lrc_mapping(struct intel_guc *guc)
>   	/* make sure all descriptors are clean... */
>   	xa_destroy(&guc->context_lookup);
>   
> +	/*
> +	 * A reset might have occurred while we had a pending stalled request,
> +	 * so make sure we clean that up.
> +	 */
> +	guc->stalled_request = NULL;
> +	guc->submission_stall_reason = STALL_NONE;
> +
>   	/*
>   	 * Some contexts might have been pinned before we enabled GuC
>   	 * submission, so we need to add them to the GuC bookeeping.

