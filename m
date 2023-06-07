Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B40772563A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 09:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFBC10E45D;
	Wed,  7 Jun 2023 07:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8728910E454;
 Wed,  7 Jun 2023 07:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686123973; x=1717659973;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PIpMnvP9RBOoQXkZ2/abuusgZqf8h2whBwjoGVsVcFQ=;
 b=b7kvtrJp0dWEHgSisvv8aD80umMjqsY+EOBinMURC0FEIYUkQ5GsyQCj
 OQ9jQopZ5adWc1w5rGxxfkS9Aw/maonKZJDOU9zoyaa7qaZYWUv+3msvX
 7WWRvKxVeZmKlx54P8KcOuqww2GskKZZYx8eOHrdX03/SCqX8piTe4xjN
 kKKQOrYp2iwF3ISXeTd//FTgmuu/1jJ2B9cAfAW7VgLp4bx6+ReNM4pTa
 /l6+4NqWoa108vckd9eHpkvsNaDHeXqINSY3Ebbn9gNW5YthTMMe1cQES
 3l/2wATLqt2jldfqbOXCWehz/0V6X1UPNjV+0vsjHOrWBMz4KtPR55c6F A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="360241424"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="360241424"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 00:46:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="742504705"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="742504705"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 07 Jun 2023 00:46:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 00:46:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 00:46:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 00:46:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 00:46:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VO8e/i53k0cJxMdhfkyXJAZS2ZxSVQnjF57jN/rYUyi7nWLrThKoq4aWFjzXwojn0UiDzwpQIY+8KLt4lP+2SN9zbNlUr4Hbgf9hrBBcI95lcJXDtCWHlyszU9K3NKa9UGdMTxZml0U/R+4ckuUEkTNnS5MzEfmTiohenl8UIMA2hcZzN5+TpisQ4oxVbIXOrKDOpsQW0IOgvouIshr3Vw0cdhJIDFU+8gBNUJkWllpbDKtyXw5gCtlG0LRI88573xNsVrpolG4zuG4qsfA9kowyonq1Fc73KTk9qxxKyGw4Whv/k5zJ2xaB4gT0b9ytduGwiMpd4R5l09sKpEwaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0SgF3RNqaxuSOpdfFzVdU3Pt4YPtiB6dt3nVIQt5T8=;
 b=dZozOPyEjlGc39p66USyn2t0rQvAbW6/i515L3lfauJ3oeiT66fQUeaZ0e1k4Nu0gIUxNVg6BgeRv5UBBwigCmrCp6038c30TheKtLYobc8POdfA/fvjHTdM3WQ2icgmJSUeucjOcSSHjf5M8OEHFG1aK+jrzTZnruxbbPURoiw1xO42BHFCL8rPvAsQYieZqzMHvQ7ZL++tyDJZS0gP4+WQQps4WJuCfmGY13vNC7JSGHN4QwQ0gof6aw7VIFnojg9rhz3NuRaAGkCTm/UUX6dxZG+FNDTfVuMG5Ld7K350D5Pps2eQQDN9QRqTsgh7fL9kQsb4PWc9ZSxq5Z9COw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 07:46:06 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::bd76:abb4:db3c:58f5]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::bd76:abb4:db3c:58f5%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 07:46:06 +0000
Message-ID: <67a00902-0cad-7138-97c1-bb044f81f7a8@intel.com>
Date: Wed, 7 Jun 2023 09:46:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] drm/i915: Fix a VMA UAF for multi-gt platform
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20230606202755.8719-1-nirmoy.das@intel.com>
 <f125ef17-631f-17db-7b8f-b6e6f0a75429@intel.com>
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <f125ef17-631f-17db-7b8f-b6e6f0a75429@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::11) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2961:EE_|CY5PR11MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d809b48-8c19-4a6d-0eae-08db672b405b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IkQ3JoWIr2gY0lUApFHm1NbOnBIMlWiHc4pv2FQdnpKHlyZW5O33nCPSN24kTMNU7mFfwydcwDxiivZCtenRHLfpRNaFw/bvMc/Qvg0/SsdRQewX7QfBauMwOXeYd6TuSiuG/qERhQSnYNboUSs4VUCd0SsRBv84Q6K6FVlytbziN23b3uwjgfAxHMoeDDuURmAfwMHRSfcpaq9HIibl6ffmrcJdYA08mrFqJ7956+Tj1KZL3AL4qs7fI0m/GqPYQfZwQ73/qHjG5BxC8YghSCWsgaSlm3lDFcatotWZrudafwxj/J1aXeqfbOsxFF0ME7idEQnXwrAGcGAjzyzLVZFBqQYaXhzkqbKLcbIkMBPKAAa6v2VjkBYljfXwD/hgJUmL48kIOXmEiR5CWm+u/RhFQHAoDLLGRYL7DCsWVwRmxNpXzn2jjoXdrgyRIiZ7/poWeOLIAgUxe5GDYcLAtbEJLev97Cdz/a31isnT0Tw+81zeKgWcfdeWToz8YQS8jJkS85MWPLfqc3t749z36fRPHrBJysqtlbfN+eYBoVJBACs3+c+/PO3C8zIYJS3z7k3hc40z3xqbx0/DjIHIT2VykE3qneWETjJOVhPOicleygPMNZjkAUdlC2SD7WNnKYG3DFIAdmHnkCnCVjIqMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199021)(26005)(6506007)(186003)(6512007)(31686004)(53546011)(2616005)(83380400001)(66574015)(6486002)(36756003)(6666004)(2906002)(8676002)(8936002)(82960400001)(44832011)(54906003)(478600001)(5660300002)(38100700002)(31696002)(4326008)(86362001)(316002)(41300700001)(66476007)(66556008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWNhQUxyZXA0VGhCeDdCSXlBazE4dldSRXhqZkxMQlBmazZQSnJHbDVzTVdI?=
 =?utf-8?B?QkJDNmQ4eDNUZW02ZHl6REF2dTcxRFludTJnTmNBNGREL1p1ZHZCcHc0TEZW?=
 =?utf-8?B?ZUhVekNOZ1Jibm9xOGtwZldLZzJLV3cvWUd0MlJhSGhpV2trcjNubEtnd3hW?=
 =?utf-8?B?cVJQL3JFT1JZYVoxaTQyS2QwMjM0Tnp4Y3QxZ2lkUDVZN0lhREJVMjVKZnEy?=
 =?utf-8?B?NHA0RmxGUzJmT1BVYU5NSFNaLzR6dlRaZlVsQkZ1aHkxdHl5cEZFWmFTZ09L?=
 =?utf-8?B?RGoyN3ZYMExCbEZBa3RCQVZKaWVObXo2UHVOcGo3bjN1Wnc0Tkg0WU5NamhQ?=
 =?utf-8?B?ODZ2c2duMndhaklaUVlId1ZadDAwMHl6eE94alV3TXVsT1NMVkdZSzBDanJW?=
 =?utf-8?B?OW41dUJwaHh1bENSdENDWHpuK2tnc2FCZ0NUQmxUOGhVcVNuSlNNSXQ0Ykpw?=
 =?utf-8?B?VlpaTDRsTXFhV1lRRlY2dE51clBuYTZSYzRzc3g0aFI1TlFNV1ZWdVFKY2xM?=
 =?utf-8?B?TjlIdEMyU0UwTjdtR3BSVUJlanI3UlFqTTZoQ0tsbUJYUm9Md0k0a1lkVDR2?=
 =?utf-8?B?d0M4cU9Lb2FnRWVGaisyQSs5M1hubFh1SUdWUE5hdklsZTl4ZnlXZVJEc3Vt?=
 =?utf-8?B?WGRTdWxuazJteUEyZnFqZlJxTVFKSjMxanFjN1pXVFY1RDJLTTJWTXU2ckRn?=
 =?utf-8?B?Wit5SE9YL0FHSHJESytwRElhR1NmaU8xS2s3eldTMXNNSlNKTkxuVjB4cE1G?=
 =?utf-8?B?WFIwYU9RQ3hTNWFUeWJDdmROTFRQSTdVbDc3TElLaVdjZ3ZxUlVIYisyM1oz?=
 =?utf-8?B?NDB6NmI3T0NKZWZZcW9YTkJDbnEvc0tYMFJINzI1YStWWWhDWVRYek1lWElW?=
 =?utf-8?B?Mm9mL0Jhc1B2V3pac1ZWRlViRFBzWTZ2bVVXc0FJMTc1eHh3YW9ZejdCQzM2?=
 =?utf-8?B?UTVEaTJVbHNEMVVNeEw2UVlJem84cjJWM0wwWmpISG9ZTzFwY2JJR1V4Kzdm?=
 =?utf-8?B?RGliVWtqNXRCbkFmbDlhejcxRTRzYVkrQzdSSlNpSktocVI1QjQ4d0VMR0Rt?=
 =?utf-8?B?ZjZnVndJaWhTNHU0VnR1Q2RjMjV1QXdicytuM2pLZDN2aHBsTFYrZ3F1MGRN?=
 =?utf-8?B?ZktoS04zbU1FQ3NsdnhTTUdCMXpyNzBJbUxmRDBpOFBCZ0dDc3ZhdGJIRnJQ?=
 =?utf-8?B?MS9QMSt4emFWRTFycC8zcm9Db2EwOG0yRVBsTkFNWnlKc0hnNUd0enl5cXhK?=
 =?utf-8?B?bVJZSUxXZmtVcjk5RkpIek1rL1FQVW9yMGswRXBNUjI3akJqTzZvM3JFMUpr?=
 =?utf-8?B?NEZTK2IzdWpIT1ZPSWhuUG9DMzFlWmVtREFwNXY1eFhFZUxyb28rSHJZWkRR?=
 =?utf-8?B?ajR3NXJMZ3prdEluY3VGT2IvZFozcVhaMHhlaG1SQVZLTkpiZTFmd3RGTDc1?=
 =?utf-8?B?Z2ZVWjFLTk9JaENRY0xNckZZbEZnRjRsc1NTL1o4U2ZxRjVTQi8xMktSYTBu?=
 =?utf-8?B?djFkOVFXQ3ZJcHN3SEVCcGo3WmRWa00zVENSMXkvdWY2ZS9GYTJxY21vU2NE?=
 =?utf-8?B?RG5Oa1NHbjFaU3lIMmt4eEhkY0VUZ1h5M1hzckFYV0ZRM0poY2FEUE9ScWd1?=
 =?utf-8?B?RTJKL1FsRFNIc05ieDZ1L1VteXpJd3lTcld6V2VlNzdaRTlyQUFTT0s0MUY1?=
 =?utf-8?B?MjRSdXNJQ3BPY0Vncm84L1JNd3loK0hFR2hYZXMzdmgrVi91OTR3eHZDYUc4?=
 =?utf-8?B?MnlyZlhpV3VUaGJZQXIzS2pkclE1Tm1YanFjaTBoUXBtQXFHVEVLYU90d3V0?=
 =?utf-8?B?bkpvT0lKMk56WHBJZU56WC9jNXkrQTFLWndJbDlKS0Q2alZiYUtuM243Ym4z?=
 =?utf-8?B?Uk9QNGhyRVhOS0Y4WDRHTDhZaWgrWlhYNWM4ZmdMaEhNQTZvaUowc1lsN2ho?=
 =?utf-8?B?UHIrMm1HWU0vRDVFVXBwT0VhbkZZTTdNZm5TQlc1RVFzZ210Mmw4SVBGWkF0?=
 =?utf-8?B?cTlvTmhtVzhJZzR2c2VzZ0RHdE01ODIwR2QycHpqZ20zOERrenprZkVOYUNt?=
 =?utf-8?B?elVmNFpsckdibS84RUNoSXV1aCtxWGJnVFY4NGVWbCtvYzEvL1pkS012NTVC?=
 =?utf-8?Q?0mOKnzllrPWcme6ZlSxNgLv3P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d809b48-8c19-4a6d-0eae-08db672b405b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 07:46:06.5773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQspQm28MbENY39nKSxRQhOBeAjOpOFbbaadPaIunY3VzPtrzYZMeLi3pWlA0Ql/eGl/GxBcyUOix20dCJ2GfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
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
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>, Chris
 Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/7/2023 8:20 AM, Andrzej Hajda wrote:
>
>
> On 06.06.2023 22:27, Nirmoy Das wrote:
>> Ensure correct handling of closed VMAs on multi-gt platforms to prevent
>> Use-After-Free. Currently, when GT0 goes idle, closed VMAs that are
>> exclusively added to GT0's closed_vma link (gt->closed_vma) and
>> subsequently freed by i915_vma_parked(), which assumes the entire GPU is
>> idle. However, on platforms with multiple GTs, such as MTL, GT1 may
>> remain active while GT0 is idle. This causes GT0 to mistakenly consider
>> the closed VMAs in its closed_vma list as unnecessary, potentially
>> leading to Use-After-Free issues if a job for GT1 attempts to access a
>> freed VMA.
>>
>> Although we do take a wakeref for GT0 but it happens later, after
>> evaluating VMAs. To mitigate this, it is necessary to hold a GT0 wakeref
>> early.
>>
>> v2: Use gt id to detect multi-tile(Andi)
>>      Fix the incorrect error path.
>>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Chris Wilson <chris.p.wilson@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
>> Tested-by: Andi Shyti <andi.shyti@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index 3aeede6aee4d..c2a67435acfa 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -2683,6 +2683,7 @@ static int
>>   eb_select_engine(struct i915_execbuffer *eb)
>>   {
>>       struct intel_context *ce, *child;
>> +    struct intel_gt *gt;
>>       unsigned int idx;
>>       int err;
>>   @@ -2706,10 +2707,16 @@ eb_select_engine(struct i915_execbuffer *eb)
>>           }
>>       }
>>       eb->num_batches = ce->parallel.number_children + 1;
>> +    gt = ce->engine->gt;
>>         for_each_child(ce, child)
>>           intel_context_get(child);
>>       intel_gt_pm_get(ce->engine->gt);
>
> intel_gt_pm_get(gt)
>
>
>> +    /* Keep GT0 active on MTL so that i915_vma_parked() doesn't
>> +     * free VMAs while execbuf ioctl is validating VMAs.
>> +     */
>> +    if (gt->info.id)
>> +        intel_gt_pm_get(to_gt(gt->i915));
>>         if (!test_bit(CONTEXT_ALLOC_BIT, &ce->flags)) {
>>           err = intel_context_alloc_state(ce);
>> @@ -2748,6 +2755,9 @@ eb_select_engine(struct i915_execbuffer *eb)
>>       return err;
>>     err:
>> +    if (gt->info.id)
>> +        intel_gt_pm_put(to_gt(gt->i915));
>> +
>>       intel_gt_pm_put(ce->engine->gt);
>
> intel_gt_pm_put(gt)
>
Will change both.
>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>


Thanks,

Nirmoy

>
> Regards
> Andrzej
>
>>       for_each_child(ce, child)
>>           intel_context_put(child);
>> @@ -2761,6 +2771,8 @@ eb_put_engine(struct i915_execbuffer *eb)
>>       struct intel_context *child;
>>         i915_vm_put(eb->context->vm);
>> +    if (eb->gt->info.id)
>> +        intel_gt_pm_put(to_gt(eb->gt->i915));
>>       intel_gt_pm_put(eb->gt);
>>       for_each_child(eb->context, child)
>>           intel_context_put(child);
>
