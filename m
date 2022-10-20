Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B5F606C08
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 01:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2382F10E447;
	Thu, 20 Oct 2022 23:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E717810E40A;
 Thu, 20 Oct 2022 23:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666308263; x=1697844263;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZvIEvBVRAcYWlKA4t/LG30BTzgBkktOdr5r1TanYXww=;
 b=UIDJbPUQN9xPBZ0/cC4QeHdNSYMuig4OqjvNOIbSz+0bT2JpW7mHm+YL
 ir8TsS/+kWjYtXmVYa/gYGDs3TwiXSHqRv3HTx+9SmmXMkJC6hxS/yIs6
 +7q3lsOrAMmkZycCRtMS53/LrBxSmORTJXaMwu8BMT+YJ4d6YS4ZjY1ST
 Z58x6Kvff+xdzU7HRXIrzlc+MiGb5pDRsjWiCJmFsTskb9oKsi3ymK6ne
 YdyOSBhfQL2ufbTId0TEyaIB3jc4xE2TDKcvoy2tMeqGaJVUFDOqy6YNA
 BWJxu8bznVAECL/3Df4HLGukp4Bp1d/sk0+UHqht/fobhQEjPLyO4sT57 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="290166190"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="290166190"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 16:24:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="959258977"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="959258977"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 20 Oct 2022 16:24:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 16:24:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 16:24:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 16:24:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNvWTtoIhMmWweLEG34llRap11bwJBSJpNDDxPFdEvmvtdsWxNs/3L668nYfAt7E9OjeKxqJEPdFfYYTos4140YJ8dzQdnhudw9m+tcuFCJb1Zl3Kigmoq+Ehxnd+FzmI3OeTwGbSEe3dL+CLq565uZWPm6BjAcZgEMDyY3jAPhr5o92Rx0yahlK+LZy5rZl8E+YpyuKFAaox2NhjkGtCeJwII8uwf/GEBWpGk7HXzbxs2qL8Y17BSZfTSvOeAHQxXvD/VYZsRhqpTo0E2uiwy89yzpMG318zlfOAlLNo7eumB/pKekDU7n2EUEyqcOtsAUS6C6A/bEP+cNcA/ni7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NhYuzIukNtUyM25SMO7ZUVLKL8S9FozbMww+c7ZR7k=;
 b=h3mkhW/jji4VIBrVuGxSskpNM926xWv1+W5i2Eaqcec7ACSVYf8J1LBIFY+AOJW75qme94T5xcGVCaheK0bvNe6QOI8sdzanDIVLwvH+RIH9issrYqmwjR2t9qPjYnTL6ZqH069IZMNPOzldANRV1LeoAmWA0M8TJaL6KN2rTqMeK7AfLxgAskWjXZDnhdcazBiS39o31TOlqcvLGP7yXHTv40m5SOIbgvZTLiP+yhmuHqctSSWAAuDRA0Ueqr8ACu1KPbOoPsUI8o1nHCsHRJa8znVFZMgYWQZsegS9BTzmzZusnUqzqtKI/X23/ho5MagEoMwpygQGG+WNyF+Vxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 BL3PR11MB6337.namprd11.prod.outlook.com (2603:10b6:208:3b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Thu, 20 Oct
 2022 23:24:18 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::bff2:8e4f:a657:6095%4]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 23:24:18 +0000
Message-ID: <9c445857-9fe5-58ed-8271-1488154b2403@intel.com>
Date: Thu, 20 Oct 2022 16:24:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 5/7] drm/i915/mtl: Handle wopcm per-GT and limit
 calculations.
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
 <20221013000332.1738078-6-daniele.ceraolospurio@intel.com>
 <bd37abdb-a9af-3f30-17ed-7a13a9652389@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <bd37abdb-a9af-3f30-17ed-7a13a9652389@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::23) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|BL3PR11MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: bd41d272-561e-4211-7c49-08dab2f23603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IktsVTSGs1LyoyDm4PQIpx3vt85nS2zeICvMiVO+WJ95buzjk8McyomGIisI5UeLrjVAJehpPTTbdjyO1O0L/b5WDybTGxyEzZjCbYZ2V37Pzt+EXRHYes/7cgXxwkxhJUQbGTJ7jFk2X5JgI5bhC3EVvFlD1YktIQsXG+MR9ApY7dFRVVkdLpD/5fG9aYPHvVlWTptOFhdDo1i25zCf1HAOqpDgDuXGDytom8zgp90j/15CQDjabma4NWM6mByi/Ahix5q1THEwrkvvxatiHCvOJjdl2riV8tDlxZNAa6z/nedtukBtCeLk6LwJDb8Ve2sfiy75uyEkCj2wzWBGKX+ZvKjMAyCWnx+IeeDyYMcHAZl8iLD73Ty+EUlJnjfT4mBwp0UWD5KuRFKZmnKxBY2hIXbTebrZaA2C7uumSiDtktCrc7EgIFlBgPnU1XcOA4YhpUa2YTEjTHt+5z+mk5P77KyA0oWPnTi1x/U4YkOXH0V5nIWSAYcq1D/3H0UjwuxWQWzPNwNNZ4u7s0HQ2Jt4w0dotHlWyixDM0soAsRmL29lomnfm97tEAR6RjmUH33OuA0TM6GPVTxDjxFMMKEYE3XSaGzdJM3bbGGQWRRmaeZGgd6ko0XbINtHFf2iYsnTiKnYLrCNbaA+LXO5l507dXJ7MoynoytSvvgumo+LAfR4Iiiiic2bUKGRLA+1Zw8qU8xAdKguK+8rRmOUEYT709asoBmvIao5KJQdspf9lX60hDf7U2kj/nTpo5R9GgjviHETFmhrXL6G2/T0zQwkSy7qg1Bi4znptTe14ME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(31696002)(66899015)(36756003)(86362001)(82960400001)(31686004)(38100700002)(186003)(30864003)(2906002)(5660300002)(6506007)(6512007)(478600001)(66476007)(83380400001)(2616005)(26005)(53546011)(8936002)(6486002)(66946007)(54906003)(316002)(66556008)(41300700001)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHk0UXQ5aXBmS2tFc1VBZ3hrdWtLdFJWWml4RExkS2dpN2RtTzNRdVY0UTR3?=
 =?utf-8?B?b0NkbFd2OE50UC83UU4wT0dibEMzeXFrdUoybXRrQmFxbEVydldyUjJFbHA2?=
 =?utf-8?B?S0FROVlHajYzWEpOMndVVkFaSFk0WERKV2VtNzZCM3FGZEUvK3IxMEJTcjRP?=
 =?utf-8?B?eTNEZXJlZ3lnbHZkam1wYTZwbW9EUTVIbDUvNGt2Mkg3UytCZUU2MDBQbkU3?=
 =?utf-8?B?L3ZUbStacllBcS9JUE5MK0xLb2hjamFPcnN2VGloTFR5QmFWb3AwbU9WMEpp?=
 =?utf-8?B?VFdoUEZHMVBaVHRXRUZQTHRPZ1UyWll3Q3VaaEZjR1VZRFkrNUZ4SWdHUDJ6?=
 =?utf-8?B?VlZaVWwxZXZ5aGNtRzc0MGxoeTJlUFNKamJxN1RsRGtJb005TEJvQU5wWXRD?=
 =?utf-8?B?VWdFY2QwSDZjMEdYOE1Ta3dhUXFlYTZwMWNwOHdsSUViWXNSdkRIREtIcW85?=
 =?utf-8?B?ZTVwdUpsb0I4M3BsQVNkTUxCSjlwZFpFZm1nUVZNVk8ySUc2WEY4c3YzNGdq?=
 =?utf-8?B?MGl3TWZxVHYvZ0YxWW54cTJPdVBBYmttOXVycWFmZWtsQmVGRGphMFl6NTQ2?=
 =?utf-8?B?b1NXcDBzRUhTUjNxSEhMbnQ4aEhuMFkzZW04NURva3Bad0wwYThnVGdUK0hh?=
 =?utf-8?B?dTRoOW9FVy9jS3FwY3RjUHpLUFREcU5VcStJNEFJRnpUSVZUSHZrUHplWWFw?=
 =?utf-8?B?Skw4K2JoQmxOOHJZb201ZUE0bi82c2lKOFhGcEFNMVJMbGc4VENMT01HbFcw?=
 =?utf-8?B?VFFqSE41RDlpc0FSUlV3Wkk4Y0RqZmVrS0QraW5ROEhQTU5hQVhyQW1IN2RX?=
 =?utf-8?B?b1lJeStzS3JLK3pJMThnaVRXSnhnQk56Z0prbXdIb3RucUZ0NjB0MTN4cVU4?=
 =?utf-8?B?TzN5MjZSQ3o3WkZ5YmhzNHdmS1FUSUl0ZGhLc3JWTXd5dnBhbXFBZWFmTEZp?=
 =?utf-8?B?UVZhb2ZobytCMmIyUlNCU0w4QWUrRi96OUNvWm9aT09GRDNuRU9TYTRYblNl?=
 =?utf-8?B?MDhFV1VmNlpVc1lSM1lFVXJ2eXluVW0xRVNIQW1nWHI5QzlMVEo2WkJmN2tG?=
 =?utf-8?B?Z3c4bjBMUDRDWVNSZnU1RUgwSnY1QzMzbERuc0RIOFkxMUhLR3NMeVpjNU04?=
 =?utf-8?B?L29WU0FFdFN4UDhBbFlHbFQ3WGtSQURLZGVVVHlVdnA4bEpncEVaa2dQVXhq?=
 =?utf-8?B?U2tYdHd3cFdCekdlT2NHcDl6Ukl5emdnV1dYUGRxeVJwUk5lN0EwaEtnWU9Q?=
 =?utf-8?B?dC85dTAwNzd5VlZkUWUyY1JCZ2w5bEZKU3JlN2FncU56VnhXQ3k2VmdIZjRG?=
 =?utf-8?B?cXE4SFR5Q0IyOXFZK1RwbEhYd2pmbDNTN1NDQThUbUZEYURoZ25KRnhCOThO?=
 =?utf-8?B?NkMrRDU3NUtmZEhpc3NDeEZhMHdScmtRdnlPdThtbStpc3BPV1VnZVFjMDhG?=
 =?utf-8?B?YlFEdTV2c0hiZWxNV1ZjWnRYOEZHaFQ2NisyMFZUbTBOUDVWYTc0dnh1Rmlw?=
 =?utf-8?B?OXVvYmVqRXdtdWFiM2R3VFNXTHFkRWVjandHdGFWS2p6eUNva2wrTEZESElP?=
 =?utf-8?B?bExiTW9HMEdxcHBVK3l5Qnl1MURqRkNwd1VFeThrKytQU0g4MGlUT20zMGli?=
 =?utf-8?B?Tnptcm9NZDBRMzVNWXZkWTVJdnpLOGNUT1pPTGNlYjFqell6emsydlZaQlVR?=
 =?utf-8?B?SFhzdm9mb1VnUmNoMWE4R1Urc05mUWhTWGp5N0ZQSzNvaGZCelJHZXBlTFFl?=
 =?utf-8?B?SHppYnlwU2JqUWl3Rm1MeDBsZFJWa0xscGY0clVpVXh0T01iVEdvMmJ4a1VO?=
 =?utf-8?B?ZnZtblNXVWJSNVJCS2Vmc0svY2JBY25XZW1pTXNSODRxMTM2dExhTjd2NWpr?=
 =?utf-8?B?c29nYW1ZZXRSdDQ4S1FGMkh3b1FLbjFLeTcyYktqVTlmTzJpSlZYbHpXWlV6?=
 =?utf-8?B?WndLeGV1ZEFpOWc0YVo3aXlnN3UvcVdHcFprd2kvUXAzTGVZaGZWWlFabUtW?=
 =?utf-8?B?a05HZDdTTS9kV0cyNnU2eWMyZTUrWCtIaEtteXlRdWNSTC9rYUYxWkNlSmgz?=
 =?utf-8?B?QnpHK2ZkWm9KaVlzWjZiVVg0ajFnQ0xJU29OdDNzSkw2OGw2aWhXK2xZbm1m?=
 =?utf-8?B?YllyUTk2eVY1M1E4Tk1rR2F6cWdsNEtZWm1WQXZDM2E3UWZsMkloWktKWW1J?=
 =?utf-8?Q?nibaKJ53DDt+CMq4maQ35FI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd41d272-561e-4211-7c49-08dab2f23603
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 23:24:18.5624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXCBvm5WN2/Ei3I+xsUWJJf9seS/bCLB5h8iYomZl4nlYN97Ot/4g3zoQUdq2+ywfskYJLOqZ1tr96E3YdAICV8tkjKlzIGbOH87TZ84i2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6337
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
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org, Alan
 Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/18/2022 5:44 PM, John Harrison wrote:
> On 10/12/2022 17:03, Daniele Ceraolo Spurio wrote:
>> From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>
>> With MTL standalone media architecture the wopcm layout has changed with
>> separate partitioning in WOPCM for GCD/GT GuC and SA Media GuC. The size
> What is GCD?
>
>> of WOPCM is 4MB with lower 2MB for SA Media and upper 2MB for GCD/GT.
>>
>>      +=====+===> +====================+ <== WOPCM TOP
>>      ^     ^     |                    |
>>      |     |     |                    |
>>      |    GCD    |   GCD RC6 Image    |
>>      |    GuC    |    Power Context   |
>>      |    WOPCM  |                    |
>>      |    Size   +--------------------+
>>      |     |     |   GCD GuC Image    |
>>      |     |     |                    |
>>      |     v     |                    |
>>      |     +===> +====================+ <== SA Media GuC WOPCM Top
>>      |     ^     |                    |
>>      |   SA Media|                    |
>>      |    GuC    | SA Media RC6 Image |
>>      |   WOPCM   |    Power Context   |
>>      |    Size   |                    |
>>    WOPCM   |     +--------------------+
>>      |     |     |                    |
>>      |     |     | SA Media GuC Image |
>>      |     v     |                    |
>>      |     +===> +====================+ <== GuC WOPCM base
>>      |           |     WOPCM RSVD     |
>>      |           +------------------- + <== HuC Firmware Top
>>      v           |      HuC FW        |
>>      +=========> +====================+ <== WOPCM Base
>>
>> Given that MTL has GuC deprivilege, the WOPCM registers are pre-locked
>> by the bios. Therefore, we can skip all the math for the partitioning
>> and just limit ourselves to sanity checking the values.
>>
>> v2: fix makefile file ordering (Jani)
>>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: John Harrison <john.c.harrison@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/Makefile               |  5 ++-
>>   drivers/gpu/drm/i915/gt/intel_ggtt.c        |  2 +-
>>   drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
>>   drivers/gpu/drm/i915/gt/intel_gt_types.h    |  2 +
>>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c | 48 +++++++++++++++------
>>   drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h |  0
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c       |  4 +-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    | 14 +++---
>>   drivers/gpu/drm/i915/i915_driver.c          |  2 -
>>   drivers/gpu/drm/i915/i915_drv.h             |  3 --
>>   drivers/gpu/drm/i915/i915_gem.c             |  5 ++-
>>   11 files changed, 55 insertions(+), 31 deletions(-)
>>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c (86%)
>>   rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h (100%)
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile 
>> b/drivers/gpu/drm/i915/Makefile
>> index f8cc1eb52626..4101b3507346 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -127,9 +127,11 @@ gt-y += \
>>       gt/intel_sseu.o \
>>       gt/intel_sseu_debugfs.o \
>>       gt/intel_timeline.o \
>> +    gt/intel_wopcm.o \
>>       gt/intel_workarounds.o \
>>       gt/shmem_utils.o \
>>       gt/sysfs_engines.o
>> +
>>   # x86 intel-gtt module support
>>   gt-$(CONFIG_X86) += gt/intel_ggtt_gmch.o
>>   # autogenerated null render state
>> @@ -183,8 +185,7 @@ i915-y += \
>>         i915_trace_points.o \
>>         i915_ttm_buddy_manager.o \
>>         i915_vma.o \
>> -      i915_vma_resource.o \
>> -      intel_wopcm.o
>> +      i915_vma_resource.o
>>     # general-purpose microcontroller (GuC) support
>>   i915-y += gt/uc/intel_uc.o \
>> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c 
>> b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> index 5c67e49aacf6..b30560ab1c1b 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
>> @@ -560,7 +560,7 @@ static int init_ggtt(struct i915_ggtt *ggtt)
>>        * why.
>>        */
>>       ggtt->pin_bias = max_t(u32, I915_GTT_PAGE_SIZE,
>> - intel_wopcm_guc_size(&ggtt->vm.i915->wopcm));
>> + intel_wopcm_guc_size(&ggtt->vm.gt->wopcm));
>>         ret = intel_vgt_balloon(ggtt);
>>       if (ret)
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c 
>> b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index b367cfff48d5..a95eb0b656d2 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -56,6 +56,7 @@ void intel_gt_common_init_early(struct intel_gt *gt)
>>       seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
>>       intel_gt_pm_init_early(gt);
>>   +    intel_wopcm_init_early(&gt->wopcm);
>>       intel_uc_init_early(&gt->uc);
>>       intel_rps_init_early(&gt->rps);
>>   }
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h 
>> b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> index 30003d68fd51..a23cd3af5bf2 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> @@ -30,6 +30,7 @@
>>   #include "intel_migrate_types.h"
>>   #include "intel_wakeref.h"
>>   #include "pxp/intel_pxp_types.h"
>> +#include "intel_wopcm.h"
>>     struct drm_i915_private;
>>   struct i915_ggtt;
>> @@ -98,6 +99,7 @@ struct intel_gt {
>>         struct intel_uc uc;
>>       struct intel_gsc gsc;
>> +    struct intel_wopcm wopcm;
>>         struct {
>>           /* Serialize global tlb invalidations */
>> diff --git a/drivers/gpu/drm/i915/intel_wopcm.c 
>> b/drivers/gpu/drm/i915/gt/intel_wopcm.c
>> similarity index 86%
>> rename from drivers/gpu/drm/i915/intel_wopcm.c
>> rename to drivers/gpu/drm/i915/gt/intel_wopcm.c
>> index 322fb9eeb880..487fbbbdf3d6 100644
>> --- a/drivers/gpu/drm/i915/intel_wopcm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_wopcm.c
>> @@ -43,6 +43,7 @@
>>   /* Default WOPCM size is 2MB from Gen11, 1MB on previous platforms */
>>   #define GEN11_WOPCM_SIZE        SZ_2M
>>   #define GEN9_WOPCM_SIZE            SZ_1M
>> +#define XELPM_SAMEDIA_WOPCM_SIZE    SZ_2M
> XELPM? Isn't it just XELP?
>
>>   #define MAX_WOPCM_SIZE            SZ_8M
>>   /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top. */
>>   #define WOPCM_RESERVED_SIZE        SZ_16K
>> @@ -64,9 +65,9 @@
>>   #define GEN9_GUC_FW_RESERVED    SZ_128K
>>   #define GEN9_GUC_WOPCM_OFFSET    (GUC_WOPCM_RESERVED + 
>> GEN9_GUC_FW_RESERVED)
>>   -static inline struct drm_i915_private *wopcm_to_i915(struct 
>> intel_wopcm *wopcm)
>> +static inline struct intel_gt *wopcm_to_gt(struct intel_wopcm *wopcm)
>>   {
>> -    return container_of(wopcm, struct drm_i915_private, wopcm);
>> +    return container_of(wopcm, struct intel_gt, wopcm);
>>   }
>>     /**
>> @@ -77,7 +78,8 @@ static inline struct drm_i915_private 
>> *wopcm_to_i915(struct intel_wopcm *wopcm)
>>    */
>>   void intel_wopcm_init_early(struct intel_wopcm *wopcm)
>>   {
>> -    struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
>> +    struct intel_gt *gt = wopcm_to_gt(wopcm);
>> +    struct drm_i915_private *i915 = gt->i915;
>>         if (!HAS_GT_UC(i915))
>>           return;
>> @@ -157,14 +159,18 @@ static bool check_hw_restrictions(struct 
>> drm_i915_private *i915,
>>       return true;
>>   }
>>   -static bool __check_layout(struct drm_i915_private *i915, u32 
>> wopcm_size,
>> +static bool __check_layout(struct intel_gt *gt, u32 wopcm_size,
>>                  u32 guc_wopcm_base, u32 guc_wopcm_size,
>>                  u32 guc_fw_size, u32 huc_fw_size)
>>   {
>> +    struct drm_i915_private *i915 = gt->i915;
>>       const u32 ctx_rsvd = context_reserved_size(i915);
>>       u32 size;
>>         size = wopcm_size - ctx_rsvd;
>> +    if (MEDIA_VER(i915) >= 13)
>> +        size += XELPM_SAMEDIA_WOPCM_SIZE;
> This should check VDBOX_MASK as well?

No, because the total WOPCM size that we must verify the settings 
against includes both the root and the media partition. However, this is 
not really needed because we're already bumping the size to WOPCM_MAX 
(because the register are pre-locked by the bios, so we only need to 
make sure they are within the boundaries).

>
>> +
>>       if (unlikely(range_overflows(guc_wopcm_base, guc_wopcm_size, 
>> size))) {
>>           drm_err(&i915->drm,
>>               "WOPCM: invalid GuC region layout: %uK + %uK > %uK\n",
>> @@ -181,12 +187,14 @@ static bool __check_layout(struct 
>> drm_i915_private *i915, u32 wopcm_size,
>>           return false;
>>       }
>>   -    size = huc_fw_size + WOPCM_RESERVED_SIZE;
>> -    if (unlikely(guc_wopcm_base < size)) {
>> -        drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
>> -            intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
>> -            guc_wopcm_base / SZ_1K, size / SZ_1K);
>> -        return false;
>> +    if (VDBOX_MASK(gt)) {
> Should this not check for VEBOX as well? Or is it guaranteed that you 
> can't have VECS without VCS?

This is to check for HuC support, which is VCS-specific. I'll switch it 
to intel_uc_supports_huc

Daniele

>
>> +        size = huc_fw_size + WOPCM_RESERVED_SIZE;
>> +        if (unlikely(guc_wopcm_base < size)) {
>> +            drm_err(&i915->drm, "WOPCM: no space for %s: %uK < %uK\n",
>> +                intel_uc_fw_type_repr(INTEL_UC_FW_TYPE_HUC),
>> +                guc_wopcm_base / SZ_1K, size / SZ_1K);
>> +            return false;
>> +        }
>>       }
>>         return check_hw_restrictions(i915, guc_wopcm_base, 
>> guc_wopcm_size,
>> @@ -228,8 +236,8 @@ static bool __wopcm_regs_writable(struct 
>> intel_uncore *uncore)
>>    */
>>   void intel_wopcm_init(struct intel_wopcm *wopcm)
>>   {
>> -    struct drm_i915_private *i915 = wopcm_to_i915(wopcm);
>> -    struct intel_gt *gt = to_gt(i915);
>> +    struct intel_gt *gt = wopcm_to_gt(wopcm);
>> +    struct drm_i915_private *i915 = gt->i915;
>>       u32 guc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.guc.fw);
>>       u32 huc_fw_size = intel_uc_fw_get_upload_size(&gt->uc.huc.fw);
>>       u32 ctx_rsvd = context_reserved_size(i915);
>> @@ -274,6 +282,19 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>>           goto check;
>>       }
>>   +    /*
>> +     * On platforms with a media GT, the WOPCM is partitioned 
>> between the
>> +     * two GTs, so we would have to take that into account when 
>> doing the
>> +     * math below. There is also a new section reserved for the GSC ctx
> ctx -> context - should not use such abbreviations in comments. It's 
> unnecessary and makes the text harder to read.
>> +     * that w would have to factor in. However, all platforms with a 
>> media
> that w would have to fact in -> that would have to be factored in
>
>> +     * GT also have GuC depriv enabled, so the WOPCM regs are 
>> pre-locked
>> +     * and therefore we don't have to do the math ourselves.
>> +     */
>> +    if (unlikely(i915->media_gt)) {
>> +        drm_err(&i915->drm, "Unlocked WOPCM regs with media GT\n");
>> +        return;
>> +    }
>> +
>>       /*
>>        * Aligned value of guc_wopcm_base will determine available 
>> WOPCM space
>>        * for HuC firmware and mandatory reserved area.
>> @@ -289,13 +310,14 @@ void intel_wopcm_init(struct intel_wopcm *wopcm)
>>         /* Aligned remainings of usable WOPCM space can be assigned 
>> to GuC. */
>>       guc_wopcm_size = wopcm_size - ctx_rsvd - guc_wopcm_base;
>> +
> Extra blank link part way through calculating the guc_wopcm_size 
> variable because?
>
> John.
>
>>       guc_wopcm_size &= GUC_WOPCM_SIZE_MASK;
>>         drm_dbg(&i915->drm, "Calculated GuC WOPCM [%uK, %uK)\n",
>>           guc_wopcm_base / SZ_1K, guc_wopcm_size / SZ_1K);
>>     check:
>> -    if (__check_layout(i915, wopcm_size, guc_wopcm_base, 
>> guc_wopcm_size,
>> +    if (__check_layout(gt, wopcm_size, guc_wopcm_base, guc_wopcm_size,
>>                  guc_fw_size, huc_fw_size)) {
>>           wopcm->guc.base = guc_wopcm_base;
>>           wopcm->guc.size = guc_wopcm_size;
>> diff --git a/drivers/gpu/drm/i915/intel_wopcm.h 
>> b/drivers/gpu/drm/i915/gt/intel_wopcm.h
>> similarity index 100%
>> rename from drivers/gpu/drm/i915/intel_wopcm.h
>> rename to drivers/gpu/drm/i915/gt/intel_wopcm.h
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index dbd048b77e19..4cd8a787f9e5 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -357,8 +357,8 @@ static int uc_init_wopcm(struct intel_uc *uc)
>>   {
>>       struct intel_gt *gt = uc_to_gt(uc);
>>       struct intel_uncore *uncore = gt->uncore;
>> -    u32 base = intel_wopcm_guc_base(&gt->i915->wopcm);
>> -    u32 size = intel_wopcm_guc_size(&gt->i915->wopcm);
>> +    u32 base = intel_wopcm_guc_base(&gt->wopcm);
>> +    u32 size = intel_wopcm_guc_size(&gt->wopcm);
>>       u32 huc_agent = intel_uc_uses_huc(uc) ? HUC_LOADING_AGENT_GUC : 0;
>>       u32 mask;
>>       int err;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> index 021290a26195..57eaece6dada 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>> @@ -478,10 +478,11 @@ static int check_gsc_manifest(const struct 
>> firmware *fw,
>>       return 0;
>>   }
>>   -static int check_ccs_header(struct drm_i915_private *i915,
>> +static int check_ccs_header(struct intel_gt *gt,
>>                   const struct firmware *fw,
>>                   struct intel_uc_fw *uc_fw)
>>   {
>> +    struct drm_i915_private *i915 = gt->i915;
>>       struct uc_css_header *css;
>>       size_t size;
>>   @@ -523,10 +524,10 @@ static int check_ccs_header(struct 
>> drm_i915_private *i915,
>>         /* Sanity check whether this fw is not larger than whole 
>> WOPCM memory */
>>       size = __intel_uc_fw_get_upload_size(uc_fw);
>> -    if (unlikely(size >= i915->wopcm.size)) {
>> +    if (unlikely(size >= gt->wopcm.size)) {
>>           drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > 
>> %zu\n",
>>                intel_uc_fw_type_repr(uc_fw->type), 
>> uc_fw->file_selected.path,
>> -             size, (size_t)i915->wopcm.size);
>> +             size, (size_t)gt->wopcm.size);
>>           return -E2BIG;
>>       }
>>   @@ -554,7 +555,8 @@ static int check_ccs_header(struct 
>> drm_i915_private *i915,
>>    */
>>   int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>   {
>> -    struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
>> +    struct intel_gt *gt = __uc_fw_to_gt(uc_fw);
>> +    struct drm_i915_private *i915 = gt->i915;
>>       struct intel_uc_fw_file file_ideal;
>>       struct device *dev = i915->drm.dev;
>>       struct drm_i915_gem_object *obj;
>> @@ -562,7 +564,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>       bool old_ver = false;
>>       int err;
>>   -    GEM_BUG_ON(!i915->wopcm.size);
>> +    GEM_BUG_ON(!gt->wopcm.size);
>>       GEM_BUG_ON(!intel_uc_fw_is_enabled(uc_fw));
>>         err = i915_inject_probe_error(i915, -ENXIO);
>> @@ -615,7 +617,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>>       if (uc_fw->loaded_via_gsc)
>>           err = check_gsc_manifest(fw, uc_fw);
>>       else
>> -        err = check_ccs_header(i915, fw, uc_fw);
>> +        err = check_ccs_header(gt, fw, uc_fw);
>>       if (err)
>>           goto fail;
>>   diff --git a/drivers/gpu/drm/i915/i915_driver.c 
>> b/drivers/gpu/drm/i915/i915_driver.c
>> index 24d3d2d85fd5..4ebb4ef982e2 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -370,8 +370,6 @@ static int i915_driver_early_probe(struct 
>> drm_i915_private *dev_priv)
>>       if (ret)
>>           goto err_ttm;
>>   -    intel_wopcm_init_early(&dev_priv->wopcm);
>> -
>>       ret = intel_root_gt_init_early(dev_priv);
>>       if (ret < 0)
>>           goto err_rootgt;
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h 
>> b/drivers/gpu/drm/i915/i915_drv.h
>> index 90a347140e90..24cffe4f9840 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -62,7 +62,6 @@
>>   #include "intel_runtime_pm.h"
>>   #include "intel_step.h"
>>   #include "intel_uncore.h"
>> -#include "intel_wopcm.h"
>>     struct drm_i915_clock_gating_funcs;
>>   struct drm_i915_gem_object;
>> @@ -235,8 +234,6 @@ struct drm_i915_private {
>>         struct intel_gvt *gvt;
>>   -    struct intel_wopcm wopcm;
>> -
>>       struct pci_dev *bridge_dev;
>>         struct rb_root uabi_engines;
>> diff --git a/drivers/gpu/drm/i915/i915_gem.c 
>> b/drivers/gpu/drm/i915/i915_gem.c
>> index 9093d2be9e1c..7a9ce81600a0 100644
>> --- a/drivers/gpu/drm/i915/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>> @@ -1140,9 +1140,10 @@ int i915_gem_init(struct drm_i915_private 
>> *dev_priv)
>>       if (ret)
>>           return ret;
>>   -    for_each_gt(gt, dev_priv, i)
>> +    for_each_gt(gt, dev_priv, i) {
>>           intel_uc_fetch_firmwares(&gt->uc);
>> -    intel_wopcm_init(&dev_priv->wopcm);
>> +        intel_wopcm_init(&gt->wopcm);
>> +    }
>>         ret = i915_init_ggtt(dev_priv);
>>       if (ret) {
>

