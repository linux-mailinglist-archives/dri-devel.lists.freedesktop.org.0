Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CB470A0A3
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 22:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D64D10E078;
	Fri, 19 May 2023 20:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B1A10E078;
 Fri, 19 May 2023 20:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684528537; x=1716064537;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F0Mj2GEF7Nvdy1jRKSjB+kIzZeClR0U5u/DB00ZIQmY=;
 b=Wf1+72pFAeV1VovK4IVvDX46mpVh90rzXiAtCuBfj5bPNGZIQPzY42bz
 SF6b+EAMhUBYYPbHWsVehhqitiwpVLBTHMoPpkdvgFaUnPVK9At5w9qKA
 ou5AYJCUVXXfjPzRad2qBAdRqefhWILwIO0jpAO8PdbSClgfqwS0pJ4jm
 xowm3Lik+UPJKF2zrpFy9LHdwGIHahdAW/HZ5pkPQHq274c5st6fnzbWF
 PNz+pf8ofwZJUPci89t32pzBo1e5Wwoejw25IK9G0q88ocfF001UIfoYh
 cRWF/KmuqfA+xLzwSU/I2xsRwnYoHThmLMo/xIlKKlXrOkVvbAzGfYAJa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="341923686"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="341923686"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 13:35:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="767735582"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="767735582"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 19 May 2023 13:35:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 13:35:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 13:35:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 13:35:34 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 13:35:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRK+yEoCMy6HAacElDrW4vdkaRIaoZqfu9YUaDHD1bskatKmnq9eG6agqtubsFmmlCQXLGJuGbM55nvQWKpZbFvFf+uZggvm55WK+xQXs0vHiYkw6N3BapPSJrmuH33VgkAt8Csnvrhep7CWYt108t0o/I9hbA2s+ftMiy03wKIkiOR/l504dOfgOaMgb+l1UYhepJq7GiMzmuKmi9Cu3vpkyUkajJ79Qd5jO2qlee6RU0Tv5QQ1rIoyK6hYfvvrOhAJkztxDw9fD20CQADR74yXeHz6KJ89H45kb0fZ1wGK3S0Fghw27vXvQMHs5eJLEWtq4INSe+6Vwu3MEHU+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQbUahesQysvPbugQebxnhfg/aMkFWmavlGDr6OX9cw=;
 b=mhOUjdmykwz0+tD1DfHXQBvCzMAmQNOxmGptzbr/HI8/XG+7oaoW9MmfpoESRkjtj0/MNIa30XVGEDsfcpd562ipaon8tSWjpRV6uO8mKS+4PAoZlFmtheQw9uzg1jnzoOvE6xBW+4ZsnRIs9jB0Qa3csWGR7VMfVjoXe5XR3pvspgM+UrMxeixgUlfPt4ZJr9Kw1QOWPuTWvTn1r4rLDUiM32+Kd+xoD7Dhp4vck7wfzxy14JGAFESOX3X1xLj2SR0ek2ZlKdLsJkMjghUrI783dIRe+t3QhhA3BJaK0o5Ebq4hfYQDDx1++705lCxxJ1RcAISo3hMbP+7gat0TYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.19; Fri, 19 May 2023 20:35:31 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4ae6:750e:a237:4eb0%3]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 20:35:31 +0000
Message-ID: <4ad60c42-5fe2-2386-6679-12d3b5eb7440@intel.com>
Date: Fri, 19 May 2023 13:35:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/huc: Parse the GSC-enabled HuC
 binary
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230428185810.4127234-4-daniele.ceraolospurio@intel.com>
 <20230502152743.304579-1-daniele.ceraolospurio@intel.com>
 <a856d7ca-e5a7-fe85-a96b-6db37764bbdb@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <a856d7ca-e5a7-fe85-a96b-6db37764bbdb@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0139.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::24) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|MW4PR11MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: d70d3f97-cba9-451b-cc5e-08db58a896c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hN/1WpQ//fxCXfObE04hQC2TPR8deXLZL8w46+FJ258FIxT6ZBkTE+ddRcIxLXDcypCS7gPIhlsANC74CkooZ4boPWt/1bB339xeIiHtYDrm7YwAxjmz1ix8LRXaPnesmQpcYZjtzpMtuiKxI/nT+ByzXKaLIFmZyyANNppgkGnIPn5A3JMwRlb8YRyuwOB7e9HFhBr9NmuEGwj2P51EWiJTgMfZUWay1GyQcKXEpOorNZbiv7BN4xcW8T6tcMIMkPfL9DJDg6gmsz1y/QszRplZZLL8OR+LyYskiHifwfFxXIBfXVX++DMV4jKZo9t+W6I5lISeFV7MyaGF0TD95KuR6lZe/3Hbs29L5eo7cZtW/M83CXU389okQD2ysvOX8q1mY7WtypeQ6zZ77Gl9WJNww9NPBV6auDa2iUM4q+obP4NY3RFQ4ZraIe3IAhL6miPpZoz2bz8tSmHf1fPDt63psrLzR42/ZPS2orVRmWrvY5dsABGcHQSJMTUuMzz8YH/7SMQn6MquHZaGUKFX3OyjCN2nTwausBPN+vKkGWnutl46d+cPDhAgsBMZLATWwR7eY8BBnpWMDtrQmmv0twC+HXFYj/8pMjdUBm4Ihk7+/Rf/xnKsrurqVW59kvgCgu8kLLV5ujxaf406C6xp4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199021)(26005)(6506007)(6512007)(53546011)(2616005)(83380400001)(36756003)(31696002)(38100700002)(86362001)(186003)(82960400001)(2906002)(8936002)(8676002)(30864003)(31686004)(316002)(5660300002)(450100002)(66946007)(66556008)(478600001)(66476007)(4326008)(41300700001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWgvOWU2ZVFGaGdxMzBOUWZyaCtOSTU0S1NJUWJHQU9MM2Q1MExCeVBmeDBs?=
 =?utf-8?B?RVlvaGVqRE5WbTN5TEpBYnNHTlF0ZTZJdWx3V3NQUzRxRXRUa3ZhMWJZTENa?=
 =?utf-8?B?WXVFckE0N0pDamd4VUNWRVRkam9uUkV3ZFFTOHJ6ZU00TjdaVVJ3SWNLaTBN?=
 =?utf-8?B?eUxwcE5kbTkxcWdOTkFacFdGYThpRytJTlM3RVN4V2VkQndmWjcwY0RjMnZ4?=
 =?utf-8?B?ZnF3bWpKZDZIUXB5NkVvUXgwNXBwczE3SXI5MVU3NDhkZUQwbSswOWdZNmQ0?=
 =?utf-8?B?RC9pd1ZaMVUzTU5vNHR3elJ0em82UUl4cVJzcUN3eWkzVFpBQkgvc0Y1V09N?=
 =?utf-8?B?Qy81cWhLREExNHBkQ2VTL3lTWVc5Qm16RlNkTlRSUmFXYVF6Mk02Ti9NMlNE?=
 =?utf-8?B?dGNkNk5CcFArL1ByRENrQ2Q1K09RYVAvcTZHYUFMU3NaSjIyQStCN0dYVEdE?=
 =?utf-8?B?eW1hVEIraXd3a2lzcC9NbHdtMTdnZFpldW9RcGx5QnFVampUclRkZk91WUQx?=
 =?utf-8?B?ZDBhVTVYZkNjQUhEZDBQc1poMWRFQlArWE04OC84YUQ1WkczYWw2QUFFdjZR?=
 =?utf-8?B?S1d4dEZYZ1QzWndWelovS1VnN3Jjb1pFQk9QWjlxQlZ5elRTRHlyNjJ5SE1G?=
 =?utf-8?B?RmxvNzl4S0pCZ1NFREZPN05meEtHekoyWEd1NkVhUFRBSFFUSFk5d0VHYndv?=
 =?utf-8?B?VEpkWXp5SkFnSW5tdjJ3U2RSWm8zRVJpVm0wZkdyb3o1TE9tNHhZdTZCbWV6?=
 =?utf-8?B?NEFrSm9oZFg3V0t2MXJqU0sxS1hZdThRQzRrbFpGTnM2YkZlRUoydXFBNEZ6?=
 =?utf-8?B?ZmpFdVdnYUpITFlCdXpzSCtqTUNvNVdhODg1eWUrQWdibHZ4dVZVbjJJMmlI?=
 =?utf-8?B?K3dQUmdYV3NwajZ6bnEwS1MyUGcyZ0lrS21naC8zeUhhUDI0NDNKcnc3UUVu?=
 =?utf-8?B?TGtnbkFQTmZOWVdYbm9MbktPTUpaWW0vbnlxRkJVQmI2dDA5L3dtU2U3WHVH?=
 =?utf-8?B?MTMxSXZaS3FJY09objRVTGVydEF5bDhhVk9ESGpFRUlid29zQXlvYm5VRVoy?=
 =?utf-8?B?dElQVDhxd2Z6NEloY0U4dEZmZ1NmeUZISmFBdHRaQzFnNVI4cFl0TmxGSmVs?=
 =?utf-8?B?MjN3cmFVcDNZQWF2ZFpWYktRbTlnU0Fac3pPTU5IRDNZRk50dlVsYklQZXdx?=
 =?utf-8?B?M3pCOHMrMG13THdFV0pFSUp2d0ZlVUplNDVOenBQTVBNcFFrU3FVWXFRRTFH?=
 =?utf-8?B?UEkwTlJSSkxVYXlaOG5XemZMRnhDM3RMMUNEcmx3L0pqVWx2dyttbXVVanNL?=
 =?utf-8?B?QmRrT1Ivd3VQc0E3Y3Rkb0VrTzBWaEIvTjVBemljTkQ2OWx0M21sMENQRjY4?=
 =?utf-8?B?aFJGQ28rM1hESXg4clNwcTRFUVd2SGhka0xTU0dOWk1Ta3NDWVZFeEMxZ0Jp?=
 =?utf-8?B?dWhLcEplZHplZUQ4UUNmRm9mbjR5MXVUdHhSenZCTHhGaUkrK0xsT0QzL1ZY?=
 =?utf-8?B?SHB6U3E5aXVBVG96ZlJJR252K1hYT0xQZ1F6MDVNOWViZFBMS1NId0VrMzdq?=
 =?utf-8?B?dHdIRnZhWmZhcVE2RFJJbkh2TVJ5T055eHdpMXhFenViRUw5UUxmNjI1UUZy?=
 =?utf-8?B?Z0VhbFVqckFqenlVU0JOa1NEYWdRK0NYMkh1ZmlKTStHS1ZGeTQ3bC9DYTJH?=
 =?utf-8?B?cCt1OERUZnFLbkVrY2RONGhjaFF2bUZDeUZXU3B4T1MrRy9qNlNwOWJaNmpJ?=
 =?utf-8?B?NEIwaHJVR3FmZFZlZHlWcGxGS3VnNk8raXUxdTdYVFpON2NHc1piUXpIUzZK?=
 =?utf-8?B?YnRRTXFTSzAyc1FsUW5ydlIwZllxL0NGZ3h1bEk5WE16WFFtQ1l0Z1p3RWZO?=
 =?utf-8?B?T3dXaEgrTHpZVDRBNkg5Nzh2MFBSaml2ckRRMEh6SEhnOTNQaEtzRDJ1UEhI?=
 =?utf-8?B?c28vaUZQS1FhaHZCVDJpUmo3WU5IRWpnYzhQYW5IVS9zNjJSbXE4SEJTeFZF?=
 =?utf-8?B?eWk2a0wzUzBkRUovWW1TUVBKZ1E2RVVLeDYxVEpmZTVZcVZSV3B1NHplY2F0?=
 =?utf-8?B?eTg0dXFEWlJHbldSQnAxNkduaTFnd0JZenpTb01IRXhMV3l0NmdNSFVLc0p4?=
 =?utf-8?B?bXlaZ2xwRndmdHgxcWRueGpYdkYvTXNvdjRzS1VqWk9CRWFkRzNhQzdXQ1o4?=
 =?utf-8?Q?ifR0AY9tRqBesgy+UY37Q5w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d70d3f97-cba9-451b-cc5e-08db58a896c3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 20:35:31.2725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: irZK8aqPdc0Nc8Jo0dU3qp374pmygInSiwvJlrYITUPizUCOsauLeqDMjIA2dnqTqvYIFYmexPz0OUHfU/E5rVJgTr/qfTEVxPdlW8oP5rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/17/2023 2:04 PM, John Harrison wrote:
> On 5/2/2023 08:27, Daniele Ceraolo Spurio wrote:
>> The new binaries that support the 2-step authentication have contain the
> have contain?
>
>> legacy-style binary, which we can use for loading the HuC via DMA. To
>> find out where this is located in the image, we need to parse the meu
> 'meu manifest' needs some kind of explanation. 'meu' is mentioned many 
> times but nothing ever seems to explain what it is or where it comes 
> from. Also, sometimes it is capitalised and sometimes not.

MEU is the name of the tool that packages the binary. I think I'll 
switch it to gsc_binary instead of meu_binary, so we don't have 
references to non-public tools.

>
>> manifest of the GSC binary. The manifest consist of a partition header
>> followed by entries, one of which contains the offset we're looking for.
>> Note that the DG2 GSC binary contains entries with the same names, but
>> it doesn't contain a full legacy binary, so we need to skip assigning
>> the dma offset in that case (which we can do by checking the ccs).
>> Also, since we're now parsing the entries, we can extract the HuC
>> version that way instead of using hardcoded offsets.
>>
>> Note that the meu structure will be re-used for parsing the GSC binary,
>> so they've been added in their own header.
>>
>> v2: fix structure names to match meu defines (s/CPT/CPD/), update commit
>>      message, check ccs validity, drop old version location defines.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> ---
>>   .../drm/i915/gt/uc/intel_gsc_meu_headers.h    |  74 ++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  11 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     | 135 ++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   5 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_huc_print.h  |  21 +++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  71 +++++----
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   2 +
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   6 -
>>   8 files changed, 272 insertions(+), 53 deletions(-)
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
>> new file mode 100644
>> index 000000000000..d55a66202576
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
>> @@ -0,0 +1,74 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _INTEL_GSC_MEU_H_
>> +#define _INTEL_GSC_MEU_H_
>> +
>> +#include <linux/types.h>
>> +
>> +/* Code partition directory (CPD) structures */
>> +struct intel_gsc_cpd_header_v2 {
>> +    u32 header_marker;
>> +#define INTEL_GSC_CPD_HEADER_MARKER 0x44504324
>> +
>> +    u32 num_of_entries;
>> +    u8 header_version;
>> +    u8 entry_version;
>> +    u8 header_length; /* in bytes */
>> +    u8 flags;
>> +    u32 partition_name;
>> +    u32 crc32;
>> +} __packed;
>> +
>> +struct intel_gsc_cpd_entry {
>> +    u8 name[12];
>> +
>> +    /*
>> +     * Bits 0-24: offset from the beginning of the code partition
>> +     * Bit 25: huffman compressed
>> +     * Bits 26-31: reserved
>> +     */
>> +    u32 offset;
>> +#define INTEL_GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
>> +#define INTEL_GSC_CPD_ENTRY_HUFFMAN_COMP BIT(25)
>> +
>> +    /*
>> +     * Module/Item length, in bytes. For Huffman-compressed modules, 
>> this
>> +     * refers to the uncompressed size. For software-compressed 
>> modules,
>> +     * this refers to the compressed size.
>> +     */
>> +    u32 length;
>> +
>> +    u8 reserved[4];
>> +} __packed;
>> +
>> +struct intel_gsc_meu_version {
>> +    u16 major;
>> +    u16 minor;
>> +    u16 hotfix;
>> +    u16 build;
>> +} __packed;
>> +
>> +struct intel_gsc_manifest_header {
>> +    u32 header_type; /* 0x4 for manifest type */
>> +    u32 header_length; /* in dwords */
>> +    u32 header_version;
>> +    u32 flags;
>> +    u32 vendor;
>> +    u32 date;
>> +    u32 size; /* In dwords, size of entire manifest (header + 
>> extensions) */
>> +    u32 header_id;
>> +    u32 internal_data;
>> +    struct intel_gsc_meu_version fw_version;
>> +    u32 security_version;
>> +    struct intel_gsc_meu_version meu_kit_version;
>> +    u32 meu_manifest_version;
>> +    u8 general_data[4];
>> +    u8 reserved3[56];
>> +    u32 modulus_size; /* in dwords */
>> +    u32 exponent_size; /* in dwords */
>> +} __packed;
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> index 9721761373fb..062ff914b274 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
>> @@ -6,23 +6,14 @@
>>   #include <linux/types.h>
>>     #include "gt/intel_gt.h"
>> -#include "gt/intel_gt_print.h"
>>   #include "intel_guc_reg.h"
>>   #include "intel_huc.h"
>> +#include "intel_huc_print.h"
>>   #include "i915_drv.h"
>>     #include <linux/device/bus.h>
>>   #include <linux/mei_aux.h>
>>   -#define huc_printk(_huc, _level, _fmt, ...) \
>> -    gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
>> -#define huc_err(_huc, _fmt, ...)    huc_printk((_huc), err, _fmt, 
>> ##__VA_ARGS__)
>> -#define huc_warn(_huc, _fmt, ...)    huc_printk((_huc), warn, _fmt, 
>> ##__VA_ARGS__)
>> -#define huc_notice(_huc, _fmt, ...)    huc_printk((_huc), notice, 
>> _fmt, ##__VA_ARGS__)
>> -#define huc_info(_huc, _fmt, ...)    huc_printk((_huc), info, _fmt, 
>> ##__VA_ARGS__)
>> -#define huc_dbg(_huc, _fmt, ...)    huc_printk((_huc), dbg, _fmt, 
>> ##__VA_ARGS__)
>> -#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), 
>> probe_error, _fmt, ##__VA_ARGS__)
>> -
>>   /**
>>    * DOC: HuC
>>    *
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> index 534b0aa43316..0ec48c2cd749 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
>> @@ -5,11 +5,146 @@
>>     #include "gt/intel_gsc.h"
>>   #include "gt/intel_gt.h"
>> +#include "intel_gsc_meu_headers.h"
>>   #include "intel_huc.h"
>>   #include "intel_huc_fw.h"
>> +#include "intel_huc_print.h"
>>   #include "i915_drv.h"
>>   #include "pxp/intel_pxp_huc.h"
>>   +static void get_version_from_meu_manifest(struct intel_uc_fw_ver 
>> *ver, const void *data)
>> +{
>> +    const struct intel_gsc_manifest_header *manifest = data;
>> +
>> +    ver->major = manifest->fw_version.major;
>> +    ver->minor = manifest->fw_version.minor;
>> +    ver->patch = manifest->fw_version.hotfix;
>> +}
>> +
>> +static bool css_valid(const void *data, size_t size)
>> +{
>> +    const struct uc_css_header *css = data;
>> +
>> +    if (unlikely(size < sizeof(struct uc_css_header)))
>> +        return false;
>> +
>> +    if (css->module_type != 0x6)
>> +        return false;
>> +
>> +    if (css->module_vendor != PCI_VENDOR_ID_INTEL)
>> +        return false;
>> +
>> +    return true;
>> +}
>> +
>> +static inline u32 entry_offset(const struct intel_gsc_cpd_entry *entry)
>> +{
>> +    return entry->offset & INTEL_GSC_CPD_ENTRY_OFFSET_MASK;
>> +}
>> +
>> +int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const 
>> void *data, size_t size)
>> +{
>> +    struct intel_huc *huc = container_of(huc_fw, struct intel_huc, fw);
>> +    const struct intel_gsc_cpd_header_v2 *header = data;
>> +    const struct intel_gsc_cpd_entry *entry;
>> +    size_t min_size = sizeof(*header);
>> +    int i;
>> +
>> +    if (!huc_fw->loaded_via_gsc) {
>> +        huc_err(huc, "Invalid FW type MEU parsing!\n");
> Not sure what this message is meant to be saying?

I'll reword it.

Daniele

>
> John.
>
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (size < sizeof(*header)) {
>> +        huc_err(huc, "MEU FW too small! %zu < %zu\n", size, min_size);
>> +        return -ENODATA;
>> +    }
>> +
>> +    /*
>> +     * The meu HuC binary starts with a directory header, followed by a
>> +     * series of entries. Each entry is identified by a name and 
>> points to
>> +     * a specific section of the binary containing the relevant data.
>> +     * The entries we're interested in are
>> +     * - "HUCP.man": points to the GSC manifest header for the HuC, 
>> which
>> +     *               contains the version info.
>> +     * - "huc_fw": points to the legacy-style binary that can be 
>> used for
>> +     *             load via the DMA. This entry only contains a 
>> valid CSS
>> +     *             on binaries for platforms that support 2-step HuC 
>> load
>> +     *             via dma and auth via GSC (like MTL).
>> +     *
>> +     * --------------------------------------------------
>> +     * [  intel_gsc_cpd_header_v2                       ]
>> +     * --------------------------------------------------
>> +     * [  intel_gsc_cpd_entry[]                         ]
>> +     * [      entry1                                    ]
>> +     * [      ...                                       ]
>> +     * [      entryX                                    ]
>> +     * [          "HUCP.man"                            ]
>> +     * [           ...                                  ]
>> +     * [           offset >----------------------------]------o
>> +     * [      ...                                       ] |
>> +     * [      entryY                                    ] |
>> +     * [          "huc_fw"                              ] |
>> +     * [           ...                                  ] |
>> +     * [           offset >----------------------------]----------o
>> +     * -------------------------------------------------- |   |
>> +     * |   |
>> +     * -------------------------------------------------- |   |
>> +     * [ intel_gsc_manifest_header ]<-----o   |
>> +     * [  ... ]          |
>> +     * [  intel_gsc_meu_version fw_version ]          |
>> +     * [  ... ]          |
>> +     * --------------------------------------------------          |
>> + *                                                             |
>> +     * --------------------------------------------------          |
>> +     * [ data[] ]<---------o
>> +     * [  ...                                           ]
>> +     * [  ...                                           ]
>> +     * --------------------------------------------------
>> +     */
>> +
>> +    if (header->header_marker != INTEL_GSC_CPD_HEADER_MARKER) {
>> +        huc_err(huc, "invalid marker for meu CPD header: 0x%08x!\n",
>> +            header->header_marker);
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* we only have binaries with header v2 and entry v1 for now */
>> +    if (header->header_version != 2 || header->entry_version != 1) {
>> +        huc_err(huc, "invalid meu CPD header/entry version %u:%u!\n",
>> +            header->header_version, header->entry_version);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (header->header_length < sizeof(struct 
>> intel_gsc_cpd_header_v2)) {
>> +        huc_err(huc, "invalid meu CPD header length %u!\n",
>> +            header->header_length);
>> +        return -EINVAL;
>> +    }
>> +
>> +    min_size = header->header_length + sizeof(*entry) * 
>> header->num_of_entries;
>> +    if (size < min_size) {
>> +        huc_err(huc, "MEU FW too small! %zu < %zu\n", size, min_size);
>> +        return -ENODATA;
>> +    }
>> +
>> +    entry = data + header->header_length;
>> +
>> +    for (i = 0; i < header->num_of_entries; i++, entry++) {
>> +        if (strcmp(entry->name, "HUCP.man") == 0)
>> + get_version_from_meu_manifest(&huc_fw->file_selected.ver,
>> +                              data + entry_offset(entry));
>> +
>> +        if (strcmp(entry->name, "huc_fw") == 0) {
>> +            u32 offset = entry_offset(entry);
>> +            if (offset < size && css_valid(data + offset, size - 
>> offset))
>> +                huc_fw->dma_start_offset = offset;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
>>   {
>>       int ret;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
>> index db42e238b45f..0999ffe6f962 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h
>> @@ -7,8 +7,11 @@
>>   #define _INTEL_HUC_FW_H_
>>     struct intel_huc;
>> +struct intel_uc_fw;
>> +
>> +#include <linux/types.h>
>>     int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc);
>>   int intel_huc_fw_upload(struct intel_huc *huc);
>> -
>> +int intel_huc_fw_get_binary_info(struct intel_uc_fw *huc_fw, const 
>> void *data, size_t size);
>>   #endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
>> new file mode 100644
>> index 000000000000..915d310ee1df
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
>> @@ -0,0 +1,21 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef __INTEL_HUC_PRINT__
>> +#define __INTEL_HUC_PRINT__
>> +
>> +#include "gt/intel_gt.h"
>> +#include "gt/intel_gt_print.h"
>> +
>> +#define huc_printk(_huc, _level, _fmt, ...) \
>> +    gt_##_level(huc_to_gt(_huc), "HuC: " _fmt, ##__VA_ARGS__)
>> +#define huc_err(_huc, _fmt, ...)    huc_printk((_huc), err, _fmt, 
>> ##__VA_ARGS__)
>> +#define huc_warn(_huc, _fmt, ...)    huc_printk((_huc), warn, _fmt, 
>> ##__VA_ARGS__)
>> +#define huc_notice(_huc, _fmt, ...)    huc_printk((_huc), notice, 
>> _fmt, ##__VA_ARGS__)
>> +#define huc_info(_huc, _fmt, ...)    huc_printk((_huc), info, _fmt, 
>> ##__VA_ARGS__)
>> +#define huc_dbg(_huc, _fmt, ...)    huc_printk((_huc), dbg, _fmt, 
>> ##__VA_ARGS__)
>> +#define huc_probe_error(_huc, _fmt, ...) huc_printk((_huc), 
>> probe_error, _fmt, ##__VA_ARGS__)
>> +
>> +#endif /* __INTEL_HUC_PRINT__ */
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 03f0b258aea7..da6fcfe1d80a 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -492,33 +492,6 @@ static void __force_fw_fetch_failures(struct 
>> intel_uc_fw *uc_fw, int e)
>>       }
>>   }
>>   -static int check_gsc_manifest(struct intel_gt *gt,
>> -                  const struct firmware *fw,
>> -                  struct intel_uc_fw *uc_fw)
>> -{
>> -    u32 *dw = (u32 *)fw->data;
>> -    u32 version_hi, version_lo;
>> -    size_t min_size;
>> -
>> -    /* Check the size of the blob before examining buffer contents */
>> -    min_size = sizeof(u32) * (HUC_GSC_VERSION_LO_DW + 1);
>> -    if (unlikely(fw->size < min_size)) {
>> -        gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
>> -            intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_selected.path,
>> -            fw->size, min_size);
>> -        return -ENODATA;
>> -    }
>> -
>> -    version_hi = dw[HUC_GSC_VERSION_HI_DW];
>> -    version_lo = dw[HUC_GSC_VERSION_LO_DW];
>> -
>> -    uc_fw->file_selected.ver.major = 
>> FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, version_hi);
>> -    uc_fw->file_selected.ver.minor = 
>> FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, version_hi);
>> -    uc_fw->file_selected.ver.patch = 
>> FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, version_lo);
>> -
>> -    return 0;
>> -}
>> -
>>   static void uc_unpack_css_version(struct intel_uc_fw_ver *ver, u32 
>> css_value)
>>   {
>>       /* Get version numbers from the CSS header */
>> @@ -575,22 +548,22 @@ static void guc_read_css_info(struct 
>> intel_uc_fw *uc_fw, struct uc_css_header *c
>>       uc_fw->private_data_size = css->private_data_size;
>>   }
>>   -static int check_ccs_header(struct intel_gt *gt,
>> -                const struct firmware *fw,
>> -                struct intel_uc_fw *uc_fw)
>> +static int __check_ccs_header(struct intel_gt *gt,
>> +                  const void *fw_data, size_t fw_size,
>> +                  struct intel_uc_fw *uc_fw)
>>   {
>>       struct uc_css_header *css;
>>       size_t size;
>>         /* Check the size of the blob before examining buffer 
>> contents */
>> -    if (unlikely(fw->size < sizeof(struct uc_css_header))) {
>> +    if (unlikely(fw_size < sizeof(struct uc_css_header))) {
>>           gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
>>               intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_selected.path,
>> -            fw->size, sizeof(struct uc_css_header));
>> +            fw_size, sizeof(struct uc_css_header));
>>           return -ENODATA;
>>       }
>>   -    css = (struct uc_css_header *)fw->data;
>> +    css = (struct uc_css_header *)fw_data;
>>         /* Check integrity of size values inside CSS header */
>>       size = (css->header_size_dw - css->key_size_dw - 
>> css->modulus_size_dw -
>> @@ -598,7 +571,7 @@ static int check_ccs_header(struct intel_gt *gt,
>>       if (unlikely(size != sizeof(struct uc_css_header))) {
>>           gt_warn(gt, "%s firmware %s: unexpected header size: %zu != 
>> %zu\n",
>>               intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_selected.path,
>> -            fw->size, sizeof(struct uc_css_header));
>> +            fw_size, sizeof(struct uc_css_header));
>>           return -EPROTO;
>>       }
>>   @@ -610,10 +583,10 @@ static int check_ccs_header(struct intel_gt *gt,
>>         /* At least, it should have header, uCode and RSA. Size of 
>> all three. */
>>       size = sizeof(struct uc_css_header) + uc_fw->ucode_size + 
>> uc_fw->rsa_size;
>> -    if (unlikely(fw->size < size)) {
>> +    if (unlikely(fw_size < size)) {
>>           gt_warn(gt, "%s firmware %s: invalid size: %zu < %zu\n",
>>               intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_selected.path,
>> -            fw->size, size);
>> +            fw_size, size);
>>           return -ENOEXEC;
>>       }
>>   @@ -634,6 +607,32 @@ static int check_ccs_header(struct intel_gt *gt,
>>       return 0;
>>   }
>>   +static int check_gsc_manifest(struct intel_gt *gt,
>> +                  const struct firmware *fw,
>> +                  struct intel_uc_fw *uc_fw)
>> +{
>> +    if (uc_fw->type != INTEL_UC_FW_TYPE_HUC) {
>> +        gt_err(gt, "trying to MEU-parse a non-HuC binary");
>> +        return -EINVAL;
>> +    }
>> +
>> +    intel_huc_fw_get_binary_info(uc_fw, fw->data, fw->size);
>> +
>> +    if (uc_fw->dma_start_offset) {
>> +        u32 delta = uc_fw->dma_start_offset;
>> +        __check_ccs_header(gt, fw->data + delta, fw->size - delta, 
>> uc_fw);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int check_ccs_header(struct intel_gt *gt,
>> +                const struct firmware *fw,
>> +                struct intel_uc_fw *uc_fw)
>> +{
>> +    return __check_ccs_header(gt, fw->data, fw->size, uc_fw);
>> +}
>> +
>>   static bool is_ver_8bit(struct intel_uc_fw_ver *ver)
>>   {
>>       return ver->major < 0xFF && ver->minor < 0xFF && ver->patch < 
>> 0xFF;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> index 26a9d6e0dc00..2691bb6bde48 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
>> @@ -113,6 +113,8 @@ struct intel_uc_fw {
>>       u32 ucode_size;
>>       u32 private_data_size;
>>   +    u32 dma_start_offset;
>> +
>>       bool loaded_via_gsc;
>>   };
>>   diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
>> index 646fa8aa6cf1..7fe405126249 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
>> @@ -84,10 +84,4 @@ struct uc_css_header {
>>   } __packed;
>>   static_assert(sizeof(struct uc_css_header) == 128);
>>   -#define HUC_GSC_VERSION_HI_DW        44
>> -#define   HUC_GSC_MAJOR_VER_HI_MASK    (0xFF << 0)
>> -#define   HUC_GSC_MINOR_VER_HI_MASK    (0xFF << 16)
>> -#define HUC_GSC_VERSION_LO_DW        45
>> -#define   HUC_GSC_PATCH_VER_LO_MASK    (0xFF << 0)
>> -
>>   #endif /* _INTEL_UC_FW_ABI_H */
>

