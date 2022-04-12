Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4094FC94C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D76210E632;
	Tue, 12 Apr 2022 00:35:50 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7966610E297;
 Tue, 12 Apr 2022 00:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649723748; x=1681259748;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BxSs7sIv6vrEp9lAPFtyAM83Atnv3sGsCAMjZh3FD4o=;
 b=JMsmX6MWw4P6TusP2rOcSlWrJ1oxIDRFALb9ww35QKUX48kV0I6W+RW/
 WM7q/A5GfZLbNbnCfiLoqKwvwhK3iE+AdEulo1VsluAOWgFyTi3LTqST1
 077wmsh/av11KduD5IbXn0q7Lsq2lY4tZYBOVE7uSvKPxhX+wmpZd01zn
 vzjU7eWoqyLyzs2f/hGqcc6YIIUSevPQfLIJCr1kSzDllHAzJ8bHmi1Qq
 lfiwCrNqBS0sgnPHSb3miOOe7PIGYjeBd4Pj81acgrm2+FkjQXORvHXBo
 8bI2H1DYX9GVJBk3fFPyFqhQstH58uSjHp8M5is2rnBRVaknTrr30/Rys g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261093525"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="261093525"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 17:35:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="551465449"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 11 Apr 2022 17:35:47 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Apr 2022 17:35:47 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Apr 2022 17:35:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Apr 2022 17:35:46 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Apr 2022 17:35:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hs+iE7S/D4+sqrt2G9LXOD435m13mKts7/+qozWmSND1DRFUTQ1S/Deg9G7wJTUotv+nH3j+2eBH9BXRa+DRWorF+j0J0QlP/4oIld4d96lOKwhuY493B5ApUD+2s8AiFV1GsllUe+UFCimjms1/HvitzNkBK9e6K1is/zC59GLxAaxc4rSd++P2nVh6X04clRfG8FirW6gGwerJCcyLhTsqqC8cOa512+8kI+FxdM9J0xRQu8mNo8iUnU/fe6K/mKP7CqlD9fLXbxtk2DkUX33o/an2YhHIU6roooj6vMKY18bXnjunaxbHkc/g03LGaV2m4Qxq3Z52Nl+FpbTPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzIOwqXwZsh83qUcPP8tJTjba6VEnX5ADjchrMpuqtE=;
 b=jBz8LX39X55p439vXbc9c5W6c0Vjh5cFOkd+VWM84Auml6qcKa/AdR/0VWRz4bjnrnRHli5Ev9bMgBjRW6OIcEC56yqG/71smdVbTtGUwUtjRnaK2t02rzsbCG51EW9LF4CVrwvF0/3ACViAG2oFYeof5dmRiuH5qMyJ30oeo/urIEBGF+BD+h78UQzLL+bkRe/cP+dp2yELeu89s5N5FYCwyPsweJTqV3HNbFPUPv3b8KQfgJFujxD0tXHLi9Rbg/zfj2gRXzGWO96uOEl+pYf14T1moVD/LZTIX4Ax77JncA8VeBAzziHtr+ozf9/dk9KCeqWWOvfcen1hTqqJzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 00:35:44 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b561:17d8:3112:913f]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b561:17d8:3112:913f%7]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 00:35:44 +0000
Message-ID: <cea6c3e9-5d0d-b4c8-653a-39085745497e@intel.com>
Date: Mon, 11 Apr 2022 17:35:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/guc: Update scheduling policies
 to new GuC API
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220408180326.1454951-1-John.C.Harrison@Intel.com>
 <20220408180326.1454951-3-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20220408180326.1454951-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:74::23) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 387f63b8-c3a8-4a5d-073b-08da1c1c6140
X-MS-TrafficTypeDiagnostic: BY5PR11MB3992:EE_
X-Microsoft-Antispam-PRVS: <BY5PR11MB3992FF050AB5CBD59E93A216F4ED9@BY5PR11MB3992.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VdyMcdNzHvoZWV/ufH9mu7WEIREoKl+6qJ24ukx5e4iuzCJlGhXOK0XNvVyxFhV6+KfUg3PvOfIE7O/EDEPOowJRN7NWFr88xM2HxQLAAQ5X1+PGegPuyx45Yj4TIRNBiGvkflX3+aAw63ntOK9TXBe3TRtIDWXyTI5oUvH78djQPT4jCBJfierSh10aPHal+FUWZoPlDEnfQviV8VSWpza7eB2Q8KF09+PQwhlzIzhZTYFt4A/wYMU4/i/l7fQemIshJda9GpDvPML2+D1S/6HtjNgdKxqY+8HgElJWkHht3HFgZMxyCeZfwkrEB6pdwngvHCZFTvBraG4RJcpYpbPJ5dc68y4IpjgIcHPPf0FKn2oZxHfOhXXGVZ4vgrlaJpqpP4swSDBdHBf1RfozPv7ac96drGoxwaeVI9zMhc8CdNNT32JLCEWahOeCAMhepgXkSG4HxBPrpM9P1CFzLEhKwfmm/FvZIVJB1KsWtcrX+XLlYvxG1bAI1ZrnEokTeCPCrddXIyKsQp9JOJCkJNknWhrmX0/yhIE1OE/sEFQBNW2ajJ7CLOScCaBAAMFeU6ZQolyRoWMvhR/Annk8H7NX5rQO8G99hWCX/442Vn07xhWVChVS440gsQO/QRQIOgumxIM+xhB1B4dN8S4ozmpcYQKIdm8VdZeIhtiQecE4t0rSl4fWfMNHfG3r9F4H64IInWpMCoNFgUdwAOJztJdQHv+uuphedWmw5D3CaiY4HWNubW89bFAkT3uxOTty
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(30864003)(31696002)(5660300002)(66946007)(82960400001)(2906002)(6486002)(8936002)(15650500001)(86362001)(6506007)(6512007)(53546011)(83380400001)(6666004)(2616005)(450100002)(26005)(4326008)(316002)(186003)(38100700002)(66476007)(66556008)(508600001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkVIY1BkWmFKOGtyRjBJMnpkTzlmT09namhLQnEwL1hhQzhRb25ueE42VUVz?=
 =?utf-8?B?bTA5MkhiS0JhK2JXYnAwcWVUM1BNOENqZE1wLzR6S1hVQkNuRmM3bEhBazdz?=
 =?utf-8?B?QjVDdVM4TitJQmJ5RjRYcFdIMnhOQ0o4TS8vVHFOVTVmNjlYK3BNcW16d1hW?=
 =?utf-8?B?bDdvL1JFeDcrWmdiVTdRVXlqbHArUTduVVE4UXY4OGdyQjRNZGp5VmViL2NJ?=
 =?utf-8?B?a2JFdXo1dUxOaUVxMWUxbDcvTmhDMStZKzc3VkE5N3BEbjVRUUE1NG5RL3pT?=
 =?utf-8?B?eHZBWk1vZ3hlVTBxTmZxd2F5OHpBME81MmNITW9PRy9mbUNkT0VyeFQzRzdz?=
 =?utf-8?B?cC9CeE5kNEg0aFlXVlpOUks5akVjbWo3b3VWQm95aU9JZ0dmSnVRMWpnQ21r?=
 =?utf-8?B?UERsSmVQQkdrMFUxSmxHYUJrZHJkR1FFSCt4WHAycUlDZkczSmNITnplUW5P?=
 =?utf-8?B?eHBQK2oraGJ2MUlXWGVvR2gyc0dCVFFJTnh1NUxxaDZMdmU5ejJPSFBmUzFH?=
 =?utf-8?B?U3RXTExCeHQvbW8xL2wrMmUrRmhaNXBMdXJZSUtIdFUxQ2RjRE1RbEJMTEtV?=
 =?utf-8?B?Ynk0RTlKY1F5N05sTUxVK2gxZndPdERzdkxKNUgyd3VUUFYySjRuWXZ6bVZh?=
 =?utf-8?B?TzZ6NzJjY29LTkxKaGk0amg1cktYT3p3TEJ4NjVCUHB2Nm1IUUE5clA5eFZG?=
 =?utf-8?B?RXZEamt2UVpkL1d3MCt1aFB3b0VPa2FiVElPUE11a1VIbUFUQTl4TWdDWkY0?=
 =?utf-8?B?SlRMaS9zYTJuakZyRVZMMGtKOUVzdSsvdGp4MmRlSzNsQUJmRFVZZjJXZnhx?=
 =?utf-8?B?WWd4STdWNmxXRnpMK25tZjVEM1JFeG9YYWg4SmZFVUdDb1JpMEViSUdNVXND?=
 =?utf-8?B?WkFYYU11U3gzcW9KVEpYa3ZNbzdudUxKRUxZRDB0cHArM2NGV2d5bFBkQ2hT?=
 =?utf-8?B?UGU0dlBHOWRFbmtHUnBNZkY0eWFCbDZUNXpWdXAvVFV3d0VocmgvaDdqL2lF?=
 =?utf-8?B?UCtPejlGWDRFbFY3KzQ5eWQ4TmtUVzRmam9zam91dFFkSHA0MjVMZk1ad2Fm?=
 =?utf-8?B?dnNHOGttL3F3SnlaOEhaWk9IaExJdE5kZ2Q5ZDZJcGZ3RVF2a2lpU1RtMlhQ?=
 =?utf-8?B?ZjFvUzdMMXNUMkFUcHcvNzBhYTNKeHdYUEp5RHdFbEFCNUVZM08rL0VERzZp?=
 =?utf-8?B?WTVCN3hMSEp6NDlYOWl1SDJZVm5ydEVnWG9haDlKMTlPSVc5RHRBVmIwVXdP?=
 =?utf-8?B?UW1mVFc5MXlUOTluSHJXclllNW9DcUdkMDRCYzdJK2VsakZ4WlM4MFdNR051?=
 =?utf-8?B?eGJYVEpjeVpXcUFwSFpEZUc2SmNHVjhSRDQ5Y0c1Rk9OYjk2RGFxTzhsSGxU?=
 =?utf-8?B?Wm9lS3N3cWZpeWZpd3duZnZ3V1J0T2V4eUoxbUUxcDBpbUNJdVlNMGpLbkNs?=
 =?utf-8?B?VlpCUWhGZXdVL3lQWTNhRU5WQURIWEJwRHhTZjNHWGRESzZZN29ERU9qdFpO?=
 =?utf-8?B?QzBNVHFvSS9qTWxJSXpGSm5yOUFMdVkrdEZKaTh4SFRGZ1JEN25Ea2dqeWRh?=
 =?utf-8?B?a081Vm5JcTVhZDc0dGFXT1NpNkcvaFRpU3ppSDNvamlYQWNPTlpOQzI0MmJ2?=
 =?utf-8?B?Q0xaZUdWYUU2aEs5Y0pDKzRlempDaldtSVJFOXpJcHg0RnI1ZVFpalo0MlpR?=
 =?utf-8?B?U1VNQkJpMTVtbCtTbUxlQVVFUGFXZno0UnY4bm9rWDdRUlo0YUd4Y3F0a1FJ?=
 =?utf-8?B?VSttNVJtMDlHTU0xSk1KZEJoYXZrQjVXV3FNNEJTVVlzd05QYlNqZlJzMVpr?=
 =?utf-8?B?SGVuUXArcFdjemRTalhhOFE3TTcvWHc2bG81dWU1a0lsaGRxVGxHNHNoVkJ1?=
 =?utf-8?B?TTJXOHhOM1R6b0lBTyt6ZmNOWlM2eUtoYVZBTXJtNVUzcjhheTRZTy9BRTU1?=
 =?utf-8?B?ZHcvYkNuY01tc3RzekYxd0JFUnczenk4QU5RdW43MjJ4dCtDYkpidkNVeTho?=
 =?utf-8?B?blRsSkVYNDlyanRxMGdCQUhQeDVDd0hkQjFyNGM5Z3ZCSmhxWjRKbDlwZzhO?=
 =?utf-8?B?OTNodDdmdkczM0U1NjVvaXcrSHBXRWx1WmJLQjUyMjFjMHNuRDY3S1l0VWQw?=
 =?utf-8?B?TjgydUdGcmFyblh5QXNwV1p3WDhiWU1zSldyMUh6d2o2b1lpMVQ3QjJwMThG?=
 =?utf-8?B?MmZDeldsdWVQSExyckpVSWYrYW1hNWsxY2pNWkU5UlFValp0UklpTDNUUnZJ?=
 =?utf-8?B?UXdwZ242Z211VFVjTzVhNnV6UUoxT0szVHBzQ2VuRWt6M1pYT1htYmYxeGZY?=
 =?utf-8?B?VW1Wc0toY3NMamhVQ3g2VXNHb3V3Y2NESDg4UCtBUVV1VktoY2JOaFlIUzJD?=
 =?utf-8?Q?/9WxYInt2WhPU8dS/tLndal08y8BsVF4sMbVg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 387f63b8-c3a8-4a5d-073b-08da1c1c6140
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 00:35:44.4483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tgjk1LBG+H3byEjvijjsJD4atjepWguZWwjYaiv6U18m2Ffk3KYWToeojiunTgO2aEJCajFz8AbJ4kKWAIdb2nsiDvBJj0SGZmvkQyG3j0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3992
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



On 4/8/2022 11:03 AM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The latest GuC firmware drops the individual scheduling policy update
> H2G commands in favour of a single KLV based H2G. So, change the
> update wrappers accordingly.
>
> Unfortunately, the API changes also mean losing the ability to set any
> scheduling policy values during context registration. Instead the same
> KLV based H2G must be sent after the registration. Of course, that
> second H2G per registration might fail due to being backed up. The
> registration code has a complicated state machine to cope with the
> actual registration call failing. However, if that works then there is
> no support for unwinding if a further call should fail. Unwinding
> would require sending a H2G to de-register - but that can't be done
> because the CTB is already backed up.
>
> So instead, add a new flag to say whether the context has a pending
> policy update. This is set if the policy H2G fails at registration
> time. The submission code checks for this flag and retries the policy
> update if set. If that call fails, the submission path early exists
> with a retry error. This is something that is already supported for
> other reasons.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   4 +-
>   drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  15 ++
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  19 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 176 ++++++++++++++----
>   4 files changed, 175 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> index 9ad6df1b6fbc..be9ac47fa9d0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> @@ -122,11 +122,9 @@ enum intel_guc_action {
>   	INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE = 0x1002,
>   	INTEL_GUC_ACTION_SCHED_ENGINE_MODE_SET = 0x1003,
>   	INTEL_GUC_ACTION_SCHED_ENGINE_MODE_DONE = 0x1004,
> -	INTEL_GUC_ACTION_SET_CONTEXT_PRIORITY = 0x1005,
> -	INTEL_GUC_ACTION_SET_CONTEXT_EXECUTION_QUANTUM = 0x1006,
> -	INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT = 0x1007,
>   	INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION = 0x1008,
>   	INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION = 0x1009,
> +	INTEL_GUC_ACTION_HOST2GUC_UPDATE_CONTEXT_POLICIES = 0x100B,
>   	INTEL_GUC_ACTION_SETUP_PC_GUCRC = 0x3004,
>   	INTEL_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
>   	INTEL_GUC_ACTION_GET_HWCONFIG = 0x4100,
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> index f0814a57c191..4a59478c3b5c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> @@ -6,6 +6,8 @@
>   #ifndef _ABI_GUC_KLVS_ABI_H
>   #define _ABI_GUC_KLVS_ABI_H
>   
> +#include <linux/types.h>
> +
>   /**
>    * DOC: GuC KLV
>    *
> @@ -79,4 +81,17 @@
>   #define GUC_KLV_SELF_CFG_G2H_CTB_SIZE_KEY		0x0907
>   #define GUC_KLV_SELF_CFG_G2H_CTB_SIZE_LEN		1u
>   
> +/*
> + * Per context scheduling policy update keys.
> + */
> +enum  {
> +	GUC_CONTEXT_POLICIES_KLV_ID_EXECUTION_QUANTUM			= 0x2001,
> +	GUC_CONTEXT_POLICIES_KLV_ID_PREEMPTION_TIMEOUT			= 0x2002,
> +	GUC_CONTEXT_POLICIES_KLV_ID_SCHEDULING_PRIORITY			= 0x2003,
> +	GUC_CONTEXT_POLICIES_KLV_ID_PREEMPT_TO_IDLE_ON_QUANTUM_EXPIRY	= 0x2004,
> +	GUC_CONTEXT_POLICIES_KLV_ID_SLPM_GT_FREQUENCY			= 0x2005,
> +
> +	GUC_CONTEXT_POLICIES_KLV_NUM_IDS = 5,
> +};
> +
>   #endif /* _ABI_GUC_KLVS_ABI_H */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index 0e1e8d0079b5..c154b5efccde 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -221,11 +221,22 @@ struct guc_ctxt_registration_info {
>   };
>   #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
>   
> -#define CONTEXT_POLICY_DEFAULT_EXECUTION_QUANTUM_US 1000000
> -#define CONTEXT_POLICY_DEFAULT_PREEMPTION_TIME_US 500000
> +/* 32-bit KLV structure as used by policy updates and others */
> +struct guc_klv_generic_dw_t {
> +	u32 kl;
> +	u32 value;
> +} __packed;
>   
> -/* Preempt to idle on quantum expiry */
> -#define CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE	BIT(0)
> +/* Format of the UPDATE_CONTEXT_POLICIES H2G data packet */
> +struct guc_update_context_policy_header {
> +	u32 action;
> +	u32 ctx_id;
> +} __packed;
> +
> +struct guc_update_context_policy {
> +	struct guc_update_context_policy_header header;
> +	struct guc_klv_generic_dw_t klv[GUC_CONTEXT_POLICIES_KLV_NUM_IDS];
> +} __packed;
>   
>   #define GUC_POWER_UNSPECIFIED	0
>   #define GUC_POWER_D0		1
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index bd0584d7d489..2bd680064942 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -162,7 +162,8 @@ guc_create_parallel(struct intel_engine_cs **engines,
>   #define SCHED_STATE_ENABLED				BIT(4)
>   #define SCHED_STATE_PENDING_ENABLE			BIT(5)
>   #define SCHED_STATE_REGISTERED				BIT(6)
> -#define SCHED_STATE_BLOCKED_SHIFT			7
> +#define SCHED_STATE_POLICY_REQUIRED			BIT(7)
> +#define SCHED_STATE_BLOCKED_SHIFT			8
>   #define SCHED_STATE_BLOCKED		BIT(SCHED_STATE_BLOCKED_SHIFT)
>   #define SCHED_STATE_BLOCKED_MASK	(0xfff << SCHED_STATE_BLOCKED_SHIFT)
>   
> @@ -301,6 +302,23 @@ static inline void clr_context_registered(struct intel_context *ce)
>   	ce->guc_state.sched_state &= ~SCHED_STATE_REGISTERED;
>   }
>   
> +static inline bool context_policy_required(struct intel_context *ce)
> +{
> +	return ce->guc_state.sched_state & SCHED_STATE_POLICY_REQUIRED;
> +}
> +
> +static inline void set_context_policy_required(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state |= SCHED_STATE_POLICY_REQUIRED;
> +}
> +
> +static inline void clr_context_policy_required(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state &= ~SCHED_STATE_POLICY_REQUIRED;
> +}
> +
>   static inline u32 context_blocked(struct intel_context *ce)
>   {
>   	return (ce->guc_state.sched_state & SCHED_STATE_BLOCKED_MASK) >>
> @@ -593,6 +611,7 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
>   					      true, timeout);
>   }
>   
> +static int guc_context_policy_init(struct intel_context *ce, bool loop);
>   static int try_context_registration(struct intel_context *ce, bool loop);
>   
>   static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> @@ -619,6 +638,12 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   	GEM_BUG_ON(!atomic_read(&ce->guc_id.ref));
>   	GEM_BUG_ON(context_guc_id_invalid(ce));
>   
> +	if (context_policy_required(ce)) {
> +		err = guc_context_policy_init(ce, false);
> +		if (err)
> +			return err;
> +	}
> +
>   	spin_lock(&ce->guc_state.lock);
>   
>   	/*
> @@ -2142,6 +2167,8 @@ static int register_context(struct intel_context *ce, bool loop)
>   		spin_lock_irqsave(&ce->guc_state.lock, flags);
>   		set_context_registered(ce);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
> +		guc_context_policy_init(ce, loop);
>   	}
>   
>   	return ret;
> @@ -2191,21 +2218,111 @@ static inline u32 get_children_join_value(struct intel_context *ce,
>   	return __get_parent_scratch(ce)->join[child_index].semaphore;
>   }
>   
> -#if 0
> -/* FIXME: This needs to be updated for new v70 interface... */
> -static void guc_context_policy_init(struct intel_engine_cs *engine,
> -				    struct guc_lrc_desc *desc)
> +struct context_policy {
> +	u32 count;
> +	struct guc_update_context_policy h2g;
> +};
> +
> +static u32 __guc_context_policy_action_size(struct context_policy *policy)
>   {
> -	desc->policy_flags = 0;
> +	size_t bytes = sizeof(policy->h2g.header) +
> +		       (sizeof(policy->h2g.klv[0]) * policy->count);
>   
> -	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
> -		desc->policy_flags |= CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE;
> +	return bytes / sizeof(u32);
> +}
> +
> +static void __guc_context_policy_start_klv(struct context_policy *policy, u16 guc_id)
> +{
> +	policy->h2g.header.action = INTEL_GUC_ACTION_HOST2GUC_UPDATE_CONTEXT_POLICIES;
> +	policy->h2g.header.ctx_id = guc_id;
> +	policy->count = 0;
> +}
> +
> +#define MAKE_CONTEXT_POLICY_ADD(func, id) \
> +static void __guc_context_policy_add_##func(struct context_policy *policy, u32 data) \
> +{ \
> +	GEM_BUG_ON(policy->count >= GUC_CONTEXT_POLICIES_KLV_NUM_IDS); \
> +	policy->h2g.klv[policy->count].kl = \
> +		FIELD_PREP(GUC_KLV_0_KEY, GUC_CONTEXT_POLICIES_KLV_ID_##id) | \
> +		FIELD_PREP(GUC_KLV_0_LEN, 1); \
> +	policy->h2g.klv[policy->count].value = data; \
> +	policy->count++; \
> +}
> +
> +MAKE_CONTEXT_POLICY_ADD(execution_quantum, EXECUTION_QUANTUM)
> +MAKE_CONTEXT_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
> +MAKE_CONTEXT_POLICY_ADD(priority, SCHEDULING_PRIORITY)
> +MAKE_CONTEXT_POLICY_ADD(preempt_to_idle, PREEMPT_TO_IDLE_ON_QUANTUM_EXPIRY)
> +
> +#undef MAKE_CONTEXT_POLICY_ADD
> +
> +static int __guc_context_set_context_policies(struct intel_guc *guc,
> +					      struct context_policy *policy,
> +					      bool loop)
> +{
> +	return guc_submission_send_busy_loop(guc, (u32 *)&policy->h2g,
> +					__guc_context_policy_action_size(policy),
> +					0, loop);
> +}
> +
> +static int guc_context_policy_init(struct intel_context *ce, bool loop)
> +{
> +	struct intel_engine_cs *engine = ce->engine;
> +	struct intel_guc *guc = &engine->gt->uc.guc;
> +	struct context_policy policy;
> +	u32 execution_quantum;
> +	u32 preemption_timeout;
> +	bool missing = false;
> +	unsigned long flags;
> +	int ret;
>   
>   	/* NB: For both of these, zero means disabled. */
> -	desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;
> -	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
> +	execution_quantum = engine->props.timeslice_duration_ms * 1000;
> +	preemption_timeout = engine->props.preempt_timeout_ms * 1000;
> +
> +	__guc_context_policy_start_klv(&policy, ce->guc_id.id);
> +
> +	__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
> +	__guc_context_policy_add_execution_quantum(&policy, execution_quantum);
> +	__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
> +
> +	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
> +		__guc_context_policy_add_preempt_to_idle(&policy, 1);
> +
> +	ret = __guc_context_set_context_policies(guc, &policy, loop);
> +	missing = ret != 0;
> +
> +	if (!missing && intel_context_is_parent(ce)) {
> +		struct intel_context *child;
> +
> +		for_each_child(ce, child) {
> +			__guc_context_policy_start_klv(&policy, child->guc_id.id);
> +
> +			if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
> +				__guc_context_policy_add_preempt_to_idle(&policy, 1);
> +
> +			child->guc_state.prio = ce->guc_state.prio;
> +			__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
> +			__guc_context_policy_add_execution_quantum(&policy, execution_quantum);
> +			__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
> +
> +			ret = __guc_context_set_context_policies(guc, &policy, loop);
> +			if (ret) {
> +				missing = true;
> +				break;
> +			}
> +		}
> +	}
> +
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	if (missing)
> +		set_context_policy_required(ce);
> +	else
> +		clr_context_policy_required(ce);
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
> +	return ret;
>   }
> -#endif
>   
>   static void prepare_context_registration_info(struct intel_context *ce,
>   					      struct guc_ctxt_registration_info *info)
> @@ -2234,9 +2351,6 @@ static void prepare_context_registration_info(struct intel_context *ce,
>   	info->hwlrca_lo = lower_32_bits(ce->lrc.lrca);
>   	info->hwlrca_hi = upper_32_bits(ce->lrc.lrca);
>   	info->flags = CONTEXT_REGISTRATION_FLAG_KMD;
> -	/* FIXME: This needs to be updated for new v70 interface... */
> -	//desc->priority = ce->guc_state.prio;
> -	//guc_context_policy_init(engine, desc);
>   
>   	/*
>   	 * If context is a parent, we need to register a process descriptor
> @@ -2263,10 +2377,6 @@ static void prepare_context_registration_info(struct intel_context *ce,
>   		memset(wq_desc, 0, sizeof(*wq_desc));
>   		wq_desc->wq_status = WQ_STATUS_ACTIVE;
>   
> -		/* FIXME: This needs to be updated for new v70 interface... */
> -		//desc->priority = ce->guc_state.prio;
> -		//guc_context_policy_init(engine, desc);
> -
>   		clear_children_join_go_memory(ce);
>   	}
>   }
> @@ -2581,13 +2691,11 @@ static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
>   						 u16 guc_id,
>   						 u32 preemption_timeout)
>   {
> -	u32 action[] = {
> -		INTEL_GUC_ACTION_SET_CONTEXT_PREEMPTION_TIMEOUT,
> -		guc_id,
> -		preemption_timeout
> -	};
> +	struct context_policy policy;
>   
> -	intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> +	__guc_context_policy_start_klv(&policy, guc_id);
> +	__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
> +	__guc_context_set_context_policies(guc, &policy, true);
>   }
>   
>   static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
> @@ -2832,16 +2940,20 @@ static int guc_context_alloc(struct intel_context *ce)
>   	return lrc_alloc(ce, ce->engine);
>   }
>   
> +static void __guc_context_set_prio(struct intel_guc *guc,
> +				   struct intel_context *ce)
> +{
> +	struct context_policy policy;
> +
> +	__guc_context_policy_start_klv(&policy, ce->guc_id.id);
> +	__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
> +	__guc_context_set_context_policies(guc, &policy, true);
> +}
> +
>   static void guc_context_set_prio(struct intel_guc *guc,
>   				 struct intel_context *ce,
>   				 u8 prio)
>   {
> -	u32 action[] = {
> -		INTEL_GUC_ACTION_SET_CONTEXT_PRIORITY,
> -		ce->guc_id.id,
> -		prio,
> -	};
> -
>   	GEM_BUG_ON(prio < GUC_CLIENT_PRIORITY_KMD_HIGH ||
>   		   prio > GUC_CLIENT_PRIORITY_NORMAL);
>   	lockdep_assert_held(&ce->guc_state.lock);
> @@ -2852,9 +2964,9 @@ static void guc_context_set_prio(struct intel_guc *guc,
>   		return;
>   	}
>   
> -	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> -
>   	ce->guc_state.prio = prio;
> +	__guc_context_set_prio(guc, ce);
> +
>   	trace_intel_context_set_prio(ce);
>   }
>   

