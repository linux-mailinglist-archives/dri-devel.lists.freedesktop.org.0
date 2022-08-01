Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390C4587054
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 20:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4063B11293D;
	Mon,  1 Aug 2022 18:23:15 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E41518AD4C;
 Mon,  1 Aug 2022 18:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659378188; x=1690914188;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z5I1kqtj9VNxN8xXmXTsnWRzS3SnD5otJk52Bb1aZ5Q=;
 b=fv/2VCxxtS3qCq2ITP2Zmm8+85XalU/PlSknsN/06eJnyPlpnhsoX6ta
 qaktco0gStj+Ogdwi1SW7fRbOCUwDWOsm+jYdMS8ufhJhUAGeeciIlvtv
 neXJhTTtrcbhi8XVEvXxjusZ/d8xqGx0GB0JP/XH2+nEObitxJZTCBami
 qUQ3jD6/OYmwqhFdDYaMJqBVtMq8ep0jlOIQtepCirPdY/Sy2EZkElDxw
 i8tui4FwYioAA4yKxV7nR3trgETrxbDHedHHYPK3URLGAt8Zbyjd+rh+X
 8ym9QU/CEO1305AO3kfSoVfi0reo0/eAJO+GbES1ThLHcH0iiTqKt9B9n g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="272259250"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="272259250"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 11:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="847921486"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2022 11:23:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 1 Aug 2022 11:23:06 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 1 Aug 2022 11:23:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 1 Aug 2022 11:23:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 1 Aug 2022 11:23:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lP2BdX9oTWyEj8qn6WSm63D0P8jF0Ijbg/ai+YtK+GiPQiVPjjVD1WWQMvfjZmY+hOuhC1gf/Yn8BH3Yv6gV/MXBSMFtipSh92HMftN8tsLfBrvsv8HmBZdoWb3MPyFcPXFNXw6s7p5xFWEaMn7JpJce6uvd0ywPKR4pcnhIEb7QUu9m1CnXDgP6V+IfRkdYGZNsTP/0Rx6OE3bjExyw1Vpjf6q2dqGlrQ3It7BV64ffIvBe/Q80Yrs2cnzKf98lmdTeq891EdBBxEKHPTJ3mqPprItnpZOnIAOXMBJBlo7uhsrgQm2zQCCz9YlhQwa0K8+bfeX1fkqTbbeT+JL8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyeUNYe5FXLho+7BDBNBOyS6CuocvnF9z32C5JORsBk=;
 b=OpKI6d9HRqKK037nM4Urw4zS0X6G7H8Q8nFcHIoyfFr9CWt9ROoHKaB0kZ6Wk7fbfOxW2i5zzAWO4BoD1BPVVx4TydVWvPlL3kCJlf4p4qy0gYacIm2rI1k3bFPxO/hAw3lJSj1R7w49n4hCZXKEwBV9lf8j+jrjMNsJsTbMT1PCbKdkZvH/R5FC0fDYud9ZyX4dmg7yhJn//Y5+osFVmkHlAN3YaMswmBSJU+4LSyRRUs6i8VPxbiHFILdDmwAtJazlayS1f09bVhnY/jF4Q7CsrieWHUhz6HqiIprLl49TgaBTmrAaDXh/5y7jpho9Pa2rkcULWPLtPEXvTYnwfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL0PR11MB3427.namprd11.prod.outlook.com (2603:10b6:208:7b::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15; Mon, 1 Aug
 2022 18:22:56 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 18:22:56 +0000
Message-ID: <25030057-a63b-922e-f5d6-72100922ce23@intel.com>
Date: Mon, 1 Aug 2022 11:22:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 0/1] Move DG2 to GuC v70.4.1
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20220728230722.2749701-1-John.C.Harrison@Intel.com>
 <20220801172829.GJ14039@nvishwa1-DESK>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220801172829.GJ14039@nvishwa1-DESK>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0079.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::24) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba9b1578-7c93-402a-d001-08da73eadafe
X-MS-TrafficTypeDiagnostic: BL0PR11MB3427:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dlnu+wntfUPNINKjrJR6u4eyxBMQshi5WIYLoHe7xgEyLk3WvJlCLpXFljvGzZta6xRMJvKtkEt0yns1oVy+5CSyUgJH3expH7hbGHzP4Pck7yZilS1IAYCu/+oVJH8/igmMgHk8aYusskiTeI35lzPdx0itT55Kid/zNF0DAl3EKJhWz3+E0rdXTbXQkBORsSAp8ecnp1AJxrbIetDjr5Y2InathgDWFFZtdkJ0xP9GS6O4YaP+Q2v+4PwLcM3C2eg+n08SBUNQOrHF+Jn0dqrsVhV1tXbP9sN0YlQK80jCMpVW3nA9e1kjVNLBOqzHw6VEaQpnSBBf5yEl5meI7pgdJimFJ0qIXyOp4AeOOmbva3dhxnuxk+iUrMMjuVqKh3QfVW4Yx9KoaRHoSw9LQMpC/wbdO5h0dMyeiPkVKi0S9EeekzOulnpRKfFs8wXHYooICSNLeKVKoLMtda+rnq9tB6vpseVY5/bsQja7vPYvmK3lIIn2TPAbXkM7eueOdBlYh8kAnRgwardxG9jAmvNNS14ciT2ivgq1tmAiHNn90YJIp7LJ4CJGMBeTUm+3Dh3SR6PMuYNLBkDuEM8La/p/uS9lFkICkYfGD3wnlLH2ecdHeAjzksNNXKs1g7tThWrpxBc9XfF5lnwUx7KcDPicuQurlDfNvXF6py+U4E1FRbbmp21UrNJxdTz2GatYdsr4JOpeDTJe2c30wcJJpGfjqTjh3Fqp0y/iJz9YAvDiUEnQpBRA4b5n7koaBqE58QDHuovV4s8NmgY0erXNESHvEamNSd2NRjvTJVMBYC4SqoV/8jzygsLssozOAv5AF2gF58sZzMjXPdIErZ9bGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(39860400002)(396003)(376002)(366004)(53546011)(31696002)(26005)(6506007)(2616005)(6512007)(86362001)(38100700002)(186003)(82960400001)(83380400001)(316002)(478600001)(6636002)(6486002)(6862004)(4744005)(8936002)(5660300002)(8676002)(4326008)(36756003)(31686004)(66476007)(2906002)(66556008)(37006003)(450100002)(66946007)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1J3ZnZHcFVYMG1jNlQwZkJJUUpPUCtQbEovU2FGM2tqZExXRFlabDQrNUVr?=
 =?utf-8?B?REEwVDI5Mi80dUdpV3NqY2oweHV5QzVaSjQ2OVl5WUVUcCs2VnhmeXhsaUdC?=
 =?utf-8?B?bGtsL2o2ZGw0MituVkRTWnZoK2VXRVBJS1l5a1VTWXpKQno4aWxpeTJ0aEps?=
 =?utf-8?B?Q0Z2bWxyWDNmSmlPWXl5NDhxUGZZZ1laTWdvS3AyYjZQUk0wSjNTMFRCOUt1?=
 =?utf-8?B?T3h1Um9XU25hbWpRZkpOeHhsdlhRVjFaelhGNlNoelU4cnhPN3N4VXEyczVG?=
 =?utf-8?B?OFY1ajhrTlJNNXU2WTY1eFA2UjdVN3N4WWp1UmhGYkRyOXBGc0ZyeHVSL0Zw?=
 =?utf-8?B?WTNvWERITDY3cncycHk1M0tTcE9JRXZ6TzB0L3lSdXp1Ni9POGJQVUM4eHlJ?=
 =?utf-8?B?NG1wczlIUzBOWWYwWm5ObXUrTCtxTkhUcHNma1BBanpuaGErcDF0c0NRR0Z0?=
 =?utf-8?B?U2dRTlozQVAvRjJDN0RZTWVTd3llazlGTEl6Rzd6ZHIrWG1wSUVVL1Bpa3RQ?=
 =?utf-8?B?eTZqTlk4cU1LSkh0NG5aWXgxT1ZTNmJjSlhWYTRYYkNDOWszcXdoUlE5M1d5?=
 =?utf-8?B?eVZqV2NZUjhRejJjVGU3R0N6U0RWWC8wdUJLWTc4VEt4bk4xTS9qSHFXWUxY?=
 =?utf-8?B?eDRmenZ6Y1Y4a1Q1SXpna3IxY21GL1BkSzNObERLSS9hblI5aFBpYXNOcDhi?=
 =?utf-8?B?YTVYQkVOaXFYbzdzcXBCWDM1TkN1emJSTkRsZHVQblZiOGhiUlAyd2lGa0ZD?=
 =?utf-8?B?aU5yeStzQ1R4eFJndGhTSkxDc3RIR2dVVmlubjAvMUs1UEF1ZnRkRlVDZ3hr?=
 =?utf-8?B?QWFXR1hnQUcvODhsVXFHT2FKdENIVnNMV0RRTFFzT05xTGJEUWlaZEVjNEht?=
 =?utf-8?B?OTY4UDd4SEUzb0puWmgxdThKVGwrSmR4b2RqY0dLdVhNT3llWmkyNm9hWmtv?=
 =?utf-8?B?VHgxNGtiL2xsMVhLNkk2emt1YjcvUDhobDZmNmJ6L1Y0V3RFYjViek84d2lZ?=
 =?utf-8?B?T3dkMVRKd3JmZkR2dWl3eUlFbnZ1UHVycGRaTk5EOXp6R0daZDhkZzlPNUUz?=
 =?utf-8?B?ZVNiSHh4YTFFd2Nma2FURGw0MEhPam1mNkMwRitaUnJ3dzVGMzl1UTNRL09D?=
 =?utf-8?B?bDU0d3VoZjJGcVdwQUQ1TE0wVUxVNFVZU21MUmhmeThGdGNOWGpneFhDbFdQ?=
 =?utf-8?B?U241aXhmZHNqUG9sV056WjdiQlpaWm9BcmFiQnR3STgvSXo3TEwrRHFyNXN5?=
 =?utf-8?B?WnRwalBGWVI4Rm9Ub1M5bUhCNmNQOEUzTzVKZnQrcEZNSExkUUMyU2p4R0ND?=
 =?utf-8?B?U3FZaC9hTW5CaXg5TWFiQm51TW5FbU1lVUZzTnlNS3RVNVZ5bkk3dUVRYkxj?=
 =?utf-8?B?VW5tK0h4VjI2T2hPSzZFaU45dVdoR1FjN0RRSGV1WkJHZUFSTWQ5OHd2RHRz?=
 =?utf-8?B?YzJOR1ZFazR2bDBVTkEvMjdaZm1DVCt5V2k2eExhYU9FRU55WkMxSWY2WDY1?=
 =?utf-8?B?RFcxUG1LZFhnNHFsLzhBR3Juak1zRnhVNTV4SWJ1Ti9ZRHhvQ3dRb3VXMWpP?=
 =?utf-8?B?bFFCTFVWUVFQa3FKNnVVRkF6bjFhV0EzQWxLWWI3cEZjczl3dVpCdTNxL2hn?=
 =?utf-8?B?SXBLdTRCcThiWHM1S21KZnJRUVZRZ1VrS2d5RlZtZS9maUduV1k2S2l1UTBE?=
 =?utf-8?B?NExnWGZ6emNQdFpzQ3dKeFVXZ1ZQc1ZrNkJPMElGSEpkZng1eU45MUNJQ0Qz?=
 =?utf-8?B?SDFHb1VEWTlrY05kbm5zYjg5Z3pyVHdRWlYyS2hPc3BTWWRYeisxQ0FYRFpj?=
 =?utf-8?B?NjQ1NGgrcnBYSUdSTUgyNlFIQlc5ZDlTbmUxOXZpZ2M2TUhMSlovOXFoVnpx?=
 =?utf-8?B?SlRSS0hWN09GUkdXUlhCR0Q4ZmQwUFhTeXZRQlMvV2IreTJQRWlNUWt2dE9j?=
 =?utf-8?B?QmozZFZheWZidnR5MnNub3YrQVM4WVRQSnFLWXVYcFV0MEVwaXlZOHQvejNH?=
 =?utf-8?B?NnRCbmlCdGFuYWVqUDFxK20waWNnNE1XMTZVRzFJVzJCWlpOQUFUbGNzdDhM?=
 =?utf-8?B?TSt0bU5YU0luc0Uvams5WU9KYi9DRG96Y1FSTVpuWVROTG5iRFVrRGM2WG1L?=
 =?utf-8?B?c1NndGg2cURUR2prNjZ0MmJjeHJpbDNHb29zK1cxMWd6QUVMYUs4NnFNUU1t?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9b1578-7c93-402a-d001-08da73eadafe
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 18:22:56.1426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPDm5dY45D0o2U6KNiSriwvL6INvDEfXRuWpKMUZGYJF04msDW6+zg/UAqHfAFZ0fhAgwNwmrfDa2vTCM3Pn/cL6FZeVEfaw/sI6RlplREg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3427
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
Cc: Intel-GFX@Lists.FreeDesktop.Org, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/1/2022 10:28, Niranjana Vishwanathapura wrote:
> On Thu, Jul 28, 2022 at 04:07:21PM -0700, John.C.Harrison@Intel.com 
> wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> The latest GuC release contains a bunch of fixes for DG2. Start using
>> it.
>>
>> Note that some of these fixes require i915 side support which will
>> follow in separate patches.
>
> So, this patch series has a dependency on those i915 fixes required?
>
> Niranjana
Other way around. The i915 side changes require this firmware to be 
present before they can be enabled.

John.


>
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>
>>
>> John Harrison (1):
>>  drm/i915/dg2: Update DG2 to GuC v70.4.1
>>
>> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> -- 
>> 2.37.1
>>

