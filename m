Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C81F6674913
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 02:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D66D10EA05;
	Fri, 20 Jan 2023 01:55:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC92C10E0DB;
 Fri, 20 Jan 2023 01:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674179707; x=1705715707;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d8V1IZH+VTVG6+f+zxSE4NPnzKgn1SfylFGAtwoa0jg=;
 b=Fs+13jt04ebSBb2wEME2QRgPU1ipiHGwa80Gdbvc1fUDfVdYDRgB0YP8
 jLQRRKmFf7Bsj/C5lZnf1XMA8RMG9sqD3QI6bagm7zth7l/Kjk/4VOKX1
 vs6iNQQWcKSb/nHqmZYd2SV7oNXrxloC/fafUgBZ2Cp/Gmx3ebJPrSE09
 IBHWuXHmLcNmtOiaBUXBE1yuhONVMfqqHuvvF8L9F731tI7wHMMNbVaKD
 D+zzo2y2wuJ4NNuWvoU2/FIoAjSmIqn6snCTYbiRJ6YtLdCEyDQQzOkht
 NXw96buxN7DA5g7Up5OtsXatpCUjAKHxtxJplOkOVU3JRPcYM0jRTDvuv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="352743030"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="352743030"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 17:55:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="637992452"
X-IronPort-AV: E=Sophos;i="5.97,230,1669104000"; d="scan'208";a="637992452"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 19 Jan 2023 17:55:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 17:55:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 17:55:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 17:55:06 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 17:55:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxSruwMGkHcvEgTT+q39GEHP1Wi3itCeX8CRYVaUEMUIFBJPiNq9flLZ7e5Hs4eYRSCnD0d6v3Dkp0fKYGVRp8hAmYjMTFjcvRnFNIpw+JZcTZet/7x5N0oNSb6giCCBbz9h2fm2TbO/JGQXwjOW2h/yxTUaDPv1OyKP8KBGpDYv8EsFzDlTDzDQMZ/wXa2s7JPmnz8nruJoJuH6TCONTqzjFk3Zk7fYvjqZmH59Ryu0ROhN2rVD9yjcy/WL8QSu51eF/Ax6G09EAO8WvnPCn+HvuLflWxPJqrHssueXJwrtlXaWljN5YbLvfuf/CtsETyI3Nlb1tE4NAFPcbR81jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+RSn4pJHZ3ao+zt0SFCuBIdBAa8Lvwcasa4MltxIBo=;
 b=a8kikUwqb5N64rGeOuq52lUKV8FCj0z+va6q3ik/SEo4T8hMqxkgdhiyq9aW3/+Bap3T5bieariTk0buKNiOANLSssyjK8k3H2XLtFsS2nfb6lqAZxd8qxibz6ItXalxhX0PzTQRPTsMmLdCgOl3w61M3wrFxS8Nsapz/U20n/suRT38oWwSXLKn55S/Vm2a4BfnaLyTymwwBwHDwcuuGCvh5EECcFLuKQlg7r52IjRl7j0DsWIO9FJ/3o8Rb4PHRrpZ3RjwAaHDUbLPcdh6iGjFGQh/nwCluczK/nEqUwn/uEZRNSheBNDwjN24PoKaxT1n4j4yyJLoBG37k/haqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 PH0PR11MB5109.namprd11.prod.outlook.com (2603:10b6:510:3e::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Fri, 20 Jan 2023 01:54:59 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a%8]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 01:54:58 +0000
Message-ID: <8580bd3b-e65f-73e6-dc55-edd99bfaa6f9@intel.com>
Date: Thu, 19 Jan 2023 17:54:55 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v3 3/6] drm/i915: Allow error capture without
 a request
Content-Language: en-US
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
 <20230119065000.1661857-4-John.C.Harrison@Intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230119065000.1661857-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|PH0PR11MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: d3cf635c-5c2f-4982-91c3-08dafa8955bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kE9+KCwXAYhZmXmmXBqM9Kr44Sv4q0y7Gw1PqwuehbqxIGMf7ycp9OwlSgfvYIAeNe9P2vzDkqNWsNreuyHU0Ms8XdcUESp3aQCYdyrdGc2wbpXOEcbw3c1uluJKZZylbiFuTT2KFAQIpLYqw2AbNMULllYD4zJU0xOAcfby6LG1a+4zaVmX6YEJCJ3iZFUbveFruNWNt8gRsuKJNeL+wW5bs4In10I1vrrQODYeiBOe+heeC5gXPUg+KlSZhzcSWCi3G9uKsbUGPHb6FM5a3GFznfHINqff9OjvF41uHElVmbHWhHlUpSBtqHLeSOYXkp7GkUqlfkXL3By/HkE4Dm8V0yOCgCnyScM3pTMrfqwQGc2ymN8vcJL3bxNO3FBt+P1Rq/nrAu4LiT4Wxq6zmYIoenE65K1y0lCCTDpmuNwFMXuWxCGDoejrdPU8y/wfzH/Tbpw95ZU9N8qYdvG/f7MDAsRZHYnkBz7FYS7HFWCvWRJYwFqv5WL++RfUHT3iH7vDWoC64dOu1dLUfWMxZvtBm/8D1Ed+0mZQHqRRcUF76yhdU3VrzYyKYzyV9a+RrJ30e1Y62uWKL8l16VynIwKcXlHMwYE9R4s3TsEXpaj/4CvkeuBz79n4aF6oYaPS8Jhh+pTWM30sVxkB+1dx94zC+TfDTyPan+CQo6Rga8L7E3G1l9iyRrNAwwV43QyhGnpCvCYjRcoNDDequzNt+ZWOGmbTjzhrXDn8mYcYQ0Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199015)(82960400001)(66556008)(316002)(31696002)(38100700002)(86362001)(8936002)(2906002)(66476007)(66946007)(450100002)(5660300002)(8676002)(41300700001)(6512007)(2616005)(83380400001)(186003)(26005)(53546011)(478600001)(36756003)(4326008)(6486002)(6666004)(6506007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3Y3YTJESnVrYTh1QktYdFYxVzB5TEJXaXdQRVU3QWUyeEtMck42SjJvWWtn?=
 =?utf-8?B?WFh5eHg4dXk3T1ByUjh6YkJlb1MxenFWSnBLNlVOVytlaTZpZGxmelF1UlFp?=
 =?utf-8?B?NE1PS0JRalFub1g2UnhKaEloaGU1dXFxdXVFb2RaTmZVOUFZQWl3ZW9xd0Uv?=
 =?utf-8?B?aXhGdVpoV2hSSzFWV21PczFEc21mSERsVFZBZG1IMkxWZWF2VTFQbU4rUE9T?=
 =?utf-8?B?K1dPZWJDZ0JRaWhWRkRMcTFaS0Y1SlkzelJoRGJWSVBERDlCbTBVcitwQWlJ?=
 =?utf-8?B?bGZMQzBRZlpOQ05ZcWpHQUlzSnRaU0pIa1Q3T2Q4RFAwVEx0SmI0NXNvbldL?=
 =?utf-8?B?cnhFbSt2a2NiMjZPZmhJNkhGRzlRZGtqQkN3Wm5kR0g4M0p2emFpdEVWY1RN?=
 =?utf-8?B?emUzZFIrczBvSkNJOGk2MFRGS0xJenM1dG5YSC9CL0dhZ2pkVURrc096YzY0?=
 =?utf-8?B?cFNEK0dzNTU0TmdqRWxSVlljK25SU1M3cXdLRUZnMmhRWnFkS1dGeE1vYUhl?=
 =?utf-8?B?OFlNWTNkdFlhQzVOTjdHQ0tzUXJwaUp4MWNKUHZyWGsxMWdOYnhWVG9hQ2I4?=
 =?utf-8?B?YmN2dVIvbXVUUnRTOTdjcFRYRTJDUEpkRFFUZWQyaW9iS1NCd2Nia0Z3Y3E4?=
 =?utf-8?B?bWdNWXlZM1A1YTJIUHFQTjdHR2NqaDdyT0FwQlpsanJGTi8vU2VQVWlqV1lo?=
 =?utf-8?B?cWpZaUUzS1QxZUcyOVlJeE15di9rSjl4L0o1d3BKenNWTHJGaS96cXl3bkJR?=
 =?utf-8?B?cnY1emFsZEVqNGhYbk45cjYvRHBHMW1rMGdNMlE1ejQ2dVlXNkZFdlBVc1o2?=
 =?utf-8?B?N1ovbjlUMWl6V3FCeVk3KzJsUmF0bXhMemlRL2hFbVphMWRhdDRxTG5jU2NE?=
 =?utf-8?B?bnA4MGhNOGR3RGVzR2xhc2tZbVVXallnS1hub3dtVEQ5TG8xNXlVQ0N5V0lU?=
 =?utf-8?B?cnVxMTQrT0RwQm1XOVQrZ0M5cUNDQS9JYytHVzY4Ym8raWFWOUpDT3dYbW5P?=
 =?utf-8?B?ZEhmUFMvcVJxR3M5aHMyOGlmME5WaXMySFA3V1RyZW5DS3VUR2Z4Z2RuVTMy?=
 =?utf-8?B?Y2RpUVhRYi95TzU5dmhvWExheGI2RHZ5bS9KK2N1VzZuT0U0YVVDK2lTZ1VL?=
 =?utf-8?B?UEVKTXZxRnpVeVNMQWd2eWkyWVZ2eXBqWXFJWG1EZlBZS05oVFFpWnAzTFBw?=
 =?utf-8?B?ZjFkREdlSnBoMmV4cFFhTm1ycFlnVVpaaVZpKzJzb0hWTWVRdXk2UWVlRktC?=
 =?utf-8?B?dExsL0lEYnJqOHdPcXJ0czcvQVdkR2Q3U2tpNU15LzZBeDBYVDRGU3BZbWl3?=
 =?utf-8?B?TmgyT3plb2xVdE1kNmVUdHMrS2pWOEh6citjNW1JREZ1MGM0L3AvanV1bzFa?=
 =?utf-8?B?c2RWK081RGNxRGlLWm0wNTJaSTVTdlR0Rk9mMVJTQnl3NmFMMThJeFJwd1da?=
 =?utf-8?B?bUJPQ3NwK1JjcFdiTXRGTnBieDZHdG1LQ3pHdWxTb1FhQUhQTWQrcDcxdkxk?=
 =?utf-8?B?Q05NUVYxaTcxS1JxNEg5alRidkpIREd2d2tWV0ltK1l1ZE5uTWJqTUVJbGl3?=
 =?utf-8?B?TFphdzlhdUF0dHhVaU50aG9oN0VKVjFydCthVkhwUEIwRGVpSzlKbWFXQi9q?=
 =?utf-8?B?V3NrTmdlaUdoeWdlcHhHZmtSRWRFYWNYVitGdU5yR2hBSEozRWRWcUZqbUc2?=
 =?utf-8?B?OTZRSDUzRWRqdGtsM3lCa2gvYjVxV0pLeEMxWUJJdFF1a3lsV0E2YlVCTXoz?=
 =?utf-8?B?ZWxzQWw0bU54OU5QMHdRMVpvWUhyUmsyemtxUXdNRkJJUVRlVFREMEtEN29F?=
 =?utf-8?B?VVRWdlhwSUNOVUtIcnh3YzYwcUwzVUV6MzBnMmhteFdXTmhlUEMxOXR4RHdF?=
 =?utf-8?B?WFNtY0d2WlpXTUYycWo1YzhYZ0VGTHZxenBSSUtkbFcwMVYyNEp3UVlTOFU5?=
 =?utf-8?B?M1hCeDRhTGFRSWVzQjUxSEJGVENhcXZ3dWRoWHlIQUwvVW5YZ3FuRHZPSGNS?=
 =?utf-8?B?N1JuRm5kc0UyR2Z5R1FNS0RHUDQ1ZUFnOTByYXNpWmYwQS9xdCtxc0F5ejVM?=
 =?utf-8?B?cnJpSzJRcTNaOGExVWF0bDVENk1BV2hEeXRQdE9FOFNiakNoVTJWaHQ1SHUy?=
 =?utf-8?B?Ym1xOVZFS2d0bUc1dWZkbERXa3crdGRmajNmd1AxN2VsTXViK0NvcTRkRFRm?=
 =?utf-8?Q?ot23sR6qJ3AXSpDqlHy61qk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cf635c-5c2f-4982-91c3-08dafa8955bb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 01:54:58.7009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //LFPjoAZJ1VTC6kjGSZAeybvwRB2wAHUz946p1ZAHjgvBGvYoc4lry4ihhA67d2Mf58VHaRKnIcuBMKJvtL39nIzjB+DpfAD+icgVdW7dA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5109
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



On 1/18/2023 10:49 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> There was a report of error captures occurring without any hung
> context being indicated despite the capture being initiated by a 'hung
> context notification' from GuC. The problem was not reproducible.
> However, it is possible to happen if the context in question has no
> active requests. For example, if the hang was in the context switch
> itself then the breadcrumb write would have occurred and the KMD would
> see an idle context.
>
> In the interests of attempting to provide as much information as
> possible about a hang, it seems wise to include the engine info
> regardless of whether a request was found or not. As opposed to just
> prentending there was no hang at all.
>
> So update the error capture code to always record engine information
> if a context is given. Which means updating record_context() to take a
> context instead of a request (which it only ever used to find the
> context anyway). And split the request agnostic parts of
> intel_engine_coredump_add_request() out into a seaprate function.
>
> v2: Remove a duplicate 'if' statement (Umesh) and fix a put of a null
> pointer.
> v3: Tidy up request locking code flow (Tvrtko)
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_gpu_error.c | 70 ++++++++++++++++++---------
>   1 file changed, 48 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 78cf95e4dd230..743614fff5472 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1370,14 +1370,14 @@ static void engine_record_execlists(struct intel_engine_coredump *ee)
>   }
>   
>   static bool record_context(struct i915_gem_context_coredump *e,
> -			   const struct i915_request *rq)
> +			   struct intel_context *ce)
>   {
>   	struct i915_gem_context *ctx;
>   	struct task_struct *task;
>   	bool simulated;
>   
>   	rcu_read_lock();
> -	ctx = rcu_dereference(rq->context->gem_context);
> +	ctx = rcu_dereference(ce->gem_context);
>   	if (ctx && !kref_get_unless_zero(&ctx->ref))
>   		ctx = NULL;
>   	rcu_read_unlock();
> @@ -1396,8 +1396,8 @@ static bool record_context(struct i915_gem_context_coredump *e,
>   	e->guilty = atomic_read(&ctx->guilty_count);
>   	e->active = atomic_read(&ctx->active_count);
>   
> -	e->total_runtime = intel_context_get_total_runtime_ns(rq->context);
> -	e->avg_runtime = intel_context_get_avg_runtime_ns(rq->context);
> +	e->total_runtime = intel_context_get_total_runtime_ns(ce);
> +	e->avg_runtime = intel_context_get_avg_runtime_ns(ce);
>   
>   	simulated = i915_gem_context_no_error_capture(ctx);
>   
> @@ -1532,15 +1532,37 @@ intel_engine_coredump_alloc(struct intel_engine_cs *engine, gfp_t gfp, u32 dump_
>   	return ee;
>   }
>   
> +static struct intel_engine_capture_vma *
> +engine_coredump_add_context(struct intel_engine_coredump *ee,
> +			    struct intel_context *ce,
> +			    gfp_t gfp)
> +{
> +	struct intel_engine_capture_vma *vma = NULL;
> +
> +	ee->simulated |= record_context(&ee->context, ce);
> +	if (ee->simulated)
> +		return NULL;
> +
> +	/*
> +	 * We need to copy these to an anonymous buffer
> +	 * as the simplest method to avoid being overwritten
> +	 * by userspace.
> +	 */
> +	vma = capture_vma(vma, ce->ring->vma, "ring", gfp);
> +	vma = capture_vma(vma, ce->state, "HW context", gfp);
> +
> +	return vma;
> +}
> +
>   struct intel_engine_capture_vma *
>   intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
>   				  struct i915_request *rq,
>   				  gfp_t gfp)
>   {
> -	struct intel_engine_capture_vma *vma = NULL;
> +	struct intel_engine_capture_vma *vma;
>   
> -	ee->simulated |= record_context(&ee->context, rq);
> -	if (ee->simulated)
> +	vma = engine_coredump_add_context(ee, rq->context, gfp);
> +	if (!vma)
>   		return NULL;
>   
>   	/*
> @@ -1550,8 +1572,6 @@ intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
>   	 */
>   	vma = capture_vma_snapshot(vma, rq->batch_res, gfp, "batch");
>   	vma = capture_user(vma, rq, gfp);
> -	vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
> -	vma = capture_vma(vma, rq->context->state, "HW context", gfp);
>   
>   	ee->rq_head = rq->head;
>   	ee->rq_post = rq->postfix;
> @@ -1604,25 +1624,31 @@ capture_engine(struct intel_engine_cs *engine,
>   		return NULL;
>   
>   	intel_get_hung_entity(engine, &ce, &rq);
> -	if (!rq || !i915_request_started(rq))
> -		goto no_request_capture;
> +	if (rq && !i915_request_started(rq)) {
> +		drm_info(&engine->gt->i915->drm, "Got hung context on %s with no active request!\n",
> +			 engine->name);

Shouldn't this print be inside the "else if" case below? otherwise if we 
don't have a rq at all we won't see it.

> +		i915_request_put(rq);
> +		rq = NULL;
> +	}
> +
> +	if (rq) {
> +		capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
> +		i915_request_put(rq);
> +	} else if (ce) {
> +		capture = engine_coredump_add_context(ee, ce, ATOMIC_MAYFAIL);
> +	}
>   
> -	capture = intel_engine_coredump_add_request(ee, rq, ATOMIC_MAYFAIL);
> -	if (!capture)
> -		goto no_request_capture;
>   	if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>   		intel_guc_capture_get_matching_node(engine->gt, ee, ce);

Are you keeping this outside the "if (capture)" below to make sure we 
consume the GuC engine capture even if we fail to produce the error 
state? if so, a comment might be useful.

Daniele

>   
> -	intel_engine_coredump_add_vma(ee, capture, compress);
> -	i915_request_put(rq);
> +	if (capture) {
> +		intel_engine_coredump_add_vma(ee, capture, compress);
> +	} else {
> +		kfree(ee);
> +		ee = NULL;
> +	}
>   
>   	return ee;
> -
> -no_request_capture:
> -	if (rq)
> -		i915_request_put(rq);
> -	kfree(ee);
> -	return NULL;
>   }
>   
>   static void

