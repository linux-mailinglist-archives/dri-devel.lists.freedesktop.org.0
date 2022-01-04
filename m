Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B41484B09
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 00:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB1810E1A0;
	Tue,  4 Jan 2022 23:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F1010E1A0;
 Tue,  4 Jan 2022 23:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641337517; x=1672873517;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TXytkrx+UHldTf/tC4yEXlKjbCSp7y0K8a/Rqxo5szI=;
 b=a4l7ZyrbPqruFLg9rr0fa6SZTRBAeL2Ng9/jCEkhHQPaYUSCN4yLd3WJ
 9TBeNCfU18kj26Le+EzXbOa5Qs6Fm6rc35NOfmId0sBJEow6IXSt7KSyI
 6uqiMckWw3cTF1fGb0rw3DuIbZkpa8TFk7brUCG0574V4rEkItcEU5EDE
 g6c7VNHD5pOKZr15QOSjWQuNus6Ehu6JiBGyXA38gPMQYHkytRQHB0mVp
 1xSR2ff66WB6zitPKpyvzqkHuwP4DXzWyU0bkgbuVSuzOKAMZg1hex4Cl
 6p+v21pqnBAodWHVvH3gM9mqsyusWwQYJCSY1TYK0wbnqs/1kUYp6s/1o A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="303070441"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="303070441"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 15:05:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="688752229"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 04 Jan 2022 15:05:16 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 4 Jan 2022 15:05:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 4 Jan 2022 15:05:16 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 4 Jan 2022 15:05:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUhY0YrCYJMY1gg6FJfG9vfX9sw7qRGgSb9dSUlvnkOH42hnccwZUJTpebWom+8WRu1NKxG/JdZ8iEkw3RCYpg7iAUoTqR77RSpp8DadDdRAKCF6aNg78iKgV/Q1SXNlmRfWmpbkqu92dljqwTbFTtH+orw6wvk2uCbWFR2K3E8KXr//oz5BoHQliOLa9Zhyt5mlXkYitBfSX+q7wtqLyxZP99TtZL6j8mnihy2PssB8RVa23SOraC2mHlPob+/x4ccuXvR2IbBoO9T3qRGdXMCcEtRse+/En2qVlcOnWJXNEinsjtJlSMHMQ4e+X86840RwjRN5SnaN7RFrKqmKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9VAlvqg/bbyU6rhESe2buDqjgV5OkMKbTHdraZANw8=;
 b=An8RTl49t1oO2FJrDhWoeEMiDgMOlmkFG8I2cPcjzoZvUXvnoOvh9LFjU78g5tg8E0Gi0UauUwB3AgdBntTonaxwcbocF8htqOqpMSINolFjc6kSqI6vJG5aFWRi/i4p5rTPxRGNsja0HkP6q5QWW8MYFnFKn1MUB3vGxANC+swCzXmnrpQIjWklH9XMBQSE0l2uv+VLkk8TOiOtVoRt4V1VtYlau8xL3wZ9d2MVuoQiJpCokodaFYDJ+bDbapMCDsS+jDuP7lpErnf4B3ONtd2ez5xQl8+zPyJSn2piE7tS3qyyxvLifLg6WOkMg0NJUlgdYYD+dkzS5udEmi8BlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BYAPR11MB3606.namprd11.prod.outlook.com (2603:10b6:a03:b5::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Tue, 4 Jan
 2022 23:05:10 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2ce1:2a7:cd07:81df]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::2ce1:2a7:cd07:81df%7]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 23:05:10 +0000
Message-ID: <cbfbab9f-8c1b-a07f-767a-be87b6646dbf@intel.com>
Date: Tue, 4 Jan 2022 15:05:03 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH] drm/i915: Check return intel_context_timeline_lock of in
 eb_pin_timeline
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220104173100.32342-1-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220104173100.32342-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CO2PR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:104:1::21) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8959c0a6-24dc-42ec-00e2-08d9cfd6a7f4
X-MS-TrafficTypeDiagnostic: BYAPR11MB3606:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB36068E202850734BD86ED309BD4A9@BYAPR11MB3606.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: crNPxCYtRujySowadMkHX1i327i41IBekG7tJgoi+j7+8fwENsGUvW6bf0HA6zmP48fOJeO0TkomWAtN2Y/hP0EAXPvkdOupKQ+pWbCUIRiLuO/ZS5Tpp+Z8dSUuBtbz5S6W79vMz53TilT3rjyrA3F8lrWkVfxKI4IPcf6164ISD9MTa2HnSFDSXRvwCLj/gp8BQha4cyGixd4TWPMQG5to+weoLaYmF3BXpCq3omvWPOMk5dpfwXmwur+oRE46Ny9pJpQwaEQF8/ZK17kl34lLVZFqL1FgtDLHZ0SKKLHbhlztTyI4NIKObH+dn1zepib7s1bLTKrAoZkLb7VKIvRqLLPoSPaC2cCM3IT3MIrJtcl7rx+s6ydBRlEvZIZLZXruutcpBZZmD376m72DTSRRfwTYTraQTngfpGRl+ByudZvm/3L1cMV3qUTR1/SJ4FnyyCCZtEFPI7sAzL/BkPG0qyq0TKCbXFlStRkkF9rZCcXd7YIpXriuaA3hXF9zleBvEkFGio5CNEST0Y/Gg/VA6MYnMdkb1IMdhlKvw7FZTEHEzGFckx/Tq0tqYzDh8kI2Cr1ObuIJLoH54Ai4JoTxewbFXNfraiu98BGUK3TczZ5cKv9ZAoRykkIypXhOU1n/d8Ps6yq+cjmZeOz1YoaTCOj28WnSRNxTLe6VPYeKCjse2NMh2VRnbsnP55mjcT8k+kzeEWa8CwaABAvaWIttBB1YnSqKAN7+RknUwoA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(316002)(66476007)(86362001)(66556008)(83380400001)(31696002)(508600001)(82960400001)(4326008)(53546011)(66946007)(2616005)(107886003)(5660300002)(38100700002)(6512007)(450100002)(31686004)(6506007)(6666004)(26005)(8676002)(186003)(36756003)(8936002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2svWnRjMFBXYTRLUWZ3M1pmZDJzZ1hrUHFuQ0lMQ2ozU3pBYUFQQlpOWllt?=
 =?utf-8?B?dXRna0RtWHRla1VmZUM1YTNRdnFpUVBiTXVkemlRdnBnekFGU2Fqa0Zma0F4?=
 =?utf-8?B?aGk0QmlKenJzbzBUWFdOWnRYaDlyRmFEMmJDTnNXWWVJZGZoQXNlNnZISGd3?=
 =?utf-8?B?cUptVUpjbk42UVFEQnc5SVdKOHZwVHQ3UkU4djhuRVZPSGxiMHZkd3NtNDJB?=
 =?utf-8?B?eU5mWWRDcjdTNTd1S3NhN3dSV3JsTTRibkRUYU5NUzhxZE9EaUFkb1RBb0pE?=
 =?utf-8?B?QUtHYm0zNVNpSWlyenpaNUo4RXRDWFNoRHZQdkdUQ2RqUmsyMVZ0T1RuVHJu?=
 =?utf-8?B?YytNdXhsdHgwV2ZVd1R3emtxTnNiQ25pcFNCdWpOZmpoa0lmejZhS05pbEZl?=
 =?utf-8?B?alhFQjdPRmR4SWhQWEhKemY2REh4dGFLQUJDYW9mcFhRM2ltS1laVTVmQUNn?=
 =?utf-8?B?MEJ5YlVvZWpBT3VHUUhWRkg1MjFSM21sa01BWkFjQmQwMHJhbjI4bkl3dHFB?=
 =?utf-8?B?T1ROcko4bjJLZ3ZTMENlRTZoR0x5cE9TK0hCUTRxRWJPUGlZdEVqN05GSTZB?=
 =?utf-8?B?RDB1c0ZlcUlZQm5NRnFmYStRNmFyUmFWS29VRUdIcWNMbmR5Rm8reWNBVC9Z?=
 =?utf-8?B?SGZSOGhUeDNnVGFHR25hUkRVMktMaHlsL1JNUmN1ZXR0T2RuNkgvazJxcUY5?=
 =?utf-8?B?a1ZPSkRWUm4xVlFEa2wvN1kxQzY4VWVyWlVlTFhLSWREblFUUmc0MXhTRzhV?=
 =?utf-8?B?R3M1UjdDNmY4QTRRTWZ5M2VVS0NnR3lqancybHdQcndrdzNIWUdOZFUxUkc1?=
 =?utf-8?B?NGt4c0NYM1hBRUVyaFIvNml1YVNRL0Y1aG9HSDlGSmw2YjEzQU5kdnQ0Q2pw?=
 =?utf-8?B?SC92WUVQZDQ0a0tqbGs2RkZiUjRrZlc1QlI4WmI5Q0JxM0pwT29vcVA0SnRN?=
 =?utf-8?B?b0JuaUdnSDF6OTQ3ci9PU005U1RSdmlCU2RXMDU1K3VuSFZMbGN1SFlLeVo1?=
 =?utf-8?B?cVo3QUFRNkYzWU9OeDVqMXkvY09wRU9rd00rRVRLcDlTbjY4MzIydjlBTU9M?=
 =?utf-8?B?Wkx2Q211TDNlTWVnY0NSejFMam42ejQ5NTUvWmNZT2kxaXNZTXhSSlU0OUYv?=
 =?utf-8?B?djM3OEFjbmFVdEtwcXlwRUswSlBkNlNjR1FtYWpxYU9QQXgwcFM0aDdBcUhk?=
 =?utf-8?B?M3FMbGJZK3lsbHM3K1pYeWtPMFJ4UmlFQnpaNDB4ckV6bGczdW9ubmFBSXdp?=
 =?utf-8?B?WXNOdk84NmtSL2ZjUjE2ejlTTGhJREdBamRhRVBiYk1yV0dKVngxcVE4T0lU?=
 =?utf-8?B?NkJBdXNGQVpJOW5KQTlUV0FZQWU3VHp1dyt5ZHVtMGJmTWVjalRxakl6UU9r?=
 =?utf-8?B?bkYzUW5xOGxpS0t4eXZPbEh6U0tOc1VudmxUaGtEYlNrY3pwc1FUeWJibmNS?=
 =?utf-8?B?SE5YKzlUTFhwNU92Y2U4cElMRHJkR0ptdlJnbXhoUmZGUlVaRy9WMWJhR0hG?=
 =?utf-8?B?dU92aXRYMGM3c2dGZzJia0xRZUc0bW4rdng3b24vQTc1VkhWb1U4TENMWWhh?=
 =?utf-8?B?SkUvWmR6U0w4ZkxrbExsM2Z6dC9FWXhKdjlvNjFGS2lPYjQzcENxRmhFR0NZ?=
 =?utf-8?B?RHJXS0ZqSEcxd3hkUVlRZmJ3Q2JSWWJBYThub2NId0RQb1MreGdyUkVmMWJm?=
 =?utf-8?B?ZHZtbU1JTXF4akZMdDBucUxRTi9paGtZcno1TDIwaHZ6b3hmRis4QkNRM2FO?=
 =?utf-8?B?SWdINnZqbzkxTkVUV1ptd01PZ09uc3lqVFF4UXc0Vk9lSFl0Nk1vcTBacnY0?=
 =?utf-8?B?cUVCUmVEWU5tRUU4QUllck5iMXFsYzR6Y0tlaVAzRHUrZEkwSHpQM1lqNTMv?=
 =?utf-8?B?NEppejJ1dHlhUVpkbFpvRUdQd3ppL0dTa2ZYU2FNNzhYTEhDVnNKRHBjclVw?=
 =?utf-8?B?bzJEWnZtdUEzMkNZMFRCZERWQ1JEUEpFUGtrM0pheXZFUHpRbzF4OWtsUWU5?=
 =?utf-8?B?TGFkd2NhRHRianlZU000dXFkd3YxZ0RGU1lFbkNrdVhyT1d1Z2g2eWdHa1pP?=
 =?utf-8?B?TVljMnhIME4yN29zN3YzcDNLemxKSktBVEJLWUtMaVhxRGdXVktsMFBhZVpy?=
 =?utf-8?B?ZFZ4TDhLS09uUDl6ZUNjMktzSkhRYytudDQ0VVZoemlIT3RoWmRZQVQ2TWJZ?=
 =?utf-8?B?R0FyMXVTU3NqbW1IN3IxVU5XNEp2SnAwU295OHhzU21ORnVQQW5PdEtKMWlY?=
 =?utf-8?Q?+MTFc+upe+1unIrZdlhkUrDx6aje4rK55SJJ7KwLyw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8959c0a6-24dc-42ec-00e2-08d9cfd6a7f4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 23:05:09.9247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G313xPo+UnH+UA0xPISP1B+rOdY41uPz8uP8ThU2sYLlkNTq1yGCnD9KBX/NQw74skguq8mBgiq28Ial4iIhJJBqaAVqW0bL48pmwPAXX0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3606
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/4/2022 09:31, Matthew Brost wrote:
> intel_context_timeline_lock can return can error if interrupted by a
> user when trying to lock the timeline mutex. Check the return value of
> intel_context_timeline_lock in eb_pin_timeline (execbuf IOCTL).
>
> Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index e9541244027a..65a078945b00 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2517,6 +2517,9 @@ static int eb_pin_timeline(struct i915_execbuffer *eb, struct intel_context *ce,
>   			i915_request_put(rq);
>   
>   			tl = intel_context_timeline_lock(ce);
> +			if (IS_ERR(tl))
> +				return PTR_ERR(tl);
> +
>   			intel_context_exit(ce);
Won't this leak the stuff acquired by the intel_context_enter() above if 
the _exit() is now skipped?

John.

>   			intel_context_timeline_unlock(tl);
>   

