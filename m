Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6037A3F240A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 02:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23F16E9ED;
	Fri, 20 Aug 2021 00:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A516E9EA;
 Fri, 20 Aug 2021 00:06:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="196262331"
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="196262331"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 17:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="512317789"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 19 Aug 2021 17:06:42 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 19 Aug 2021 17:06:41 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 19 Aug 2021 17:06:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 19 Aug 2021 17:06:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 19 Aug 2021 17:06:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHQYSnmQkiz6eArcHGGTP5o8xcgV7evTwHxafu875ucNssuV0KuOanDee2y27hAnLxMg3gp4f2Mr/xZmhUjEex5YrkN8vRBnXZ06Bdp7HkAKqJ7VpCKlOtAB/q2WgwMXWeHwHMIOBt0FvlsuE4aP7j6TsxYP8hAt13ogCHbDMI0WctmiqWKi75RPL+vxjROtW5xA7MOd2yTAK5LtKyWgI74pfwjJSYNt37HOMnKG9xSNsELeM2VLoxbVnnAL/5zTXFGiy6zE1uAl0oL2Hrx+le/oKo8ZmuzxJx1HO/haKhIHg7UDGyVM7xcR5qF4u2GfNIEwZCBkhCmqCA8GEbMtEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oi15VhIVytswSVo+hO4UP2pTYbqDGpQ0zbx9AH8HkV0=;
 b=V0zevogVYtPyUqXd5LTPdzH1ZkBir8LgjYD37SiBO7rqdJ+1Hwq53XN5btsYa/5afw5ZHhdVZBWASKXHfs3nrTBTOflhDedQ2Ev6/rpzKnp36mD5Rnr4wSArr/QN7ygGrkKy+xBWQymxoUem2sed3ddiF7Ulji6VqfTKJKa9OY2prfK/OlfsMAKYP4r80gJtlZjzkodpmxObSbhEVJM/oQeRwvuMFQ8Jf6kmeoC1m8eB7Klg5hUNJm5fAVgySerJV/J9bxPL0xvGhSvwHl71KzhshrKol+ChyL2POGAJ3CzYLDXjKn3W1xQdYSBeFRCesCNeHzm9QxSvDo/FrxNv6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oi15VhIVytswSVo+hO4UP2pTYbqDGpQ0zbx9AH8HkV0=;
 b=p3TjbZAKJcQ5mBApWOb7giwrkuYhUYYfXyi2vS+po7x7Rco4K265RDrmO9fNcgEdAx/IrWfP3PWd1KQzvreTNDdT5B8ikg6xnTHiPYegh6x0Oimp27ladB1LyxUEHOIB5GMIasf/KSEtq/KemXVqf2d33HXIQcm3pS1avaTybTA=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17; Fri, 20 Aug 2021 00:06:39 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff%9]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 00:06:39 +0000
Subject: Re: [PATCH 05/27] drm/i915/guc: Process all G2H message at once in
 work queue
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-6-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <e97a2625-de59-0aed-ffa4-7a35f7272102@intel.com>
Date: Thu, 19 Aug 2021 17:06:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-6-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::25) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR05CA0050.namprd05.prod.outlook.com (2603:10b6:a03:33f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.11 via Frontend
 Transport; Fri, 20 Aug 2021 00:06:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3baed52a-65ca-4159-0795-08d9636e6209
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR11MB570396299C414A620D75B7D1F4C19@DM8PR11MB5703.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9TI2pDwZs6QZqTieH+F7WHPURjBKMFoqIoi2w/Qx7sQF1Cv2/LNcq3E7PFFjeLsvpHYMopjztlqYcRbjHQQfg2TIll4IE6MTIKOO6QRWhA+aH9pkaPF/bdQIXsWw0LVQRHRtqLpbOSUK5E3anWjOE6ZDyKOVoCwg/Lmhy7k7aDSvlFhYFfMY5a3d5iBA+lFnRiB66wjblJnttYGmXykdgZI8Al5G9+Y0Mt0VmGIequier2Pd2ZdQbfu01ZCwW+mZIlbyH5GiN7iOhi+5130bakqpfrh8Vy6PGKXNuxRYHl5BSl2hcSCPKxQPuJVYatTuHfJ6n/SwyHVkcr93IGRDg82c2X5lxBHCKAdmcaW2e11iDKYEQaRG6gMYAOZhifOy9vmaR0Y+PdAjB50HEc+XRJCzDylc6Vb1J7i9/hDO0t3nF8vdpogROdzsZYgg8cuOFs+XDwEhWDCq6lemsdxnQT7IfiKh/Qgjb4whKoyKNW+0xdnDBUvxw6wfO+n++qjYnH0wliEo3JIx8v0h1hWexX4RDifzNvABM03YYuHtPjfLfFqiAVr/oE7vXsHNHI18UtRps39uZ0YFGSqR0vbIHPQZViopulOpG3Vez3tXqcTSXyXvQ99b2i1rL5EyuAWVQTVGp7/eAxOOKauAjhz75TjoIWfdans+CaCh1066mbcg9QFpV0XXz3E6seWB/lSxdJskpY1c3P2wXgxJJZG0PLa9hz2eEY7hUWl8U8RyZhk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(316002)(15650500001)(2616005)(478600001)(8676002)(86362001)(6486002)(66946007)(186003)(66556008)(66476007)(8936002)(53546011)(16576012)(26005)(956004)(5660300002)(4326008)(2906002)(38100700002)(36756003)(31696002)(31686004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjFST00wa05HUm82WFkrTjBJSzlSVFJBbXFCMU50ZkpIc3B4YXp2YW5LQkRR?=
 =?utf-8?B?VjFETFJsbzBNaXN5eERxWUpERzJoMmZkMFpTZzBraG5sdkt6bHBkTGdISG9z?=
 =?utf-8?B?U0tNT1A4NzZwQkZhY1JxODk0RjNpQ1A3N3RBck9qWjBxSzEveCs3N0hBK1VJ?=
 =?utf-8?B?Q0Iza242clRpZlZjZ1RjZWJIM0tiSHFKWWE0Vzc2TnBGTU1mVXh6K0R6UkFt?=
 =?utf-8?B?SktteTRmWExpK0hFOTRnMURFaXdXdk1tRTJjNm9qVDZVVEZUSkFDVXQ2a0Uz?=
 =?utf-8?B?ekpud1Y4c0RhM2lNMG9wb2VJeFErTnU5NS80WU8rUGRKMzIvWGNsUS8zQWsw?=
 =?utf-8?B?bFdwK3hqNEczVm1NKzFpV21zT1FjM1BRSDdTOUI3bXIvOUJkZ20vaXBaTTFV?=
 =?utf-8?B?RHJwYnBtT3JQUmtCNGZiMGRqUXlLT0tDR2RPVW13U0lzQzZHVEdsNkNLZ3R0?=
 =?utf-8?B?TTNFRzJUWlJxSytYT0JrT2NvcVVrNXN4M3QyZUVyUm5OZDd2Y2pvdDlIeGNz?=
 =?utf-8?B?MUxtMFdWQy9HREZvWFpuZVRpZ3BVSmU1T1dmTXNWL0UyaU9jNGo5WmljZTB4?=
 =?utf-8?B?OWtTdGtjM25RTDh5ZEFxRUp3WlV0cWJzM0FQTFlhd3VMMkNkMWlOWXdwZnFh?=
 =?utf-8?B?MENKeE9Nb090WW1nR0VRWFJJRDRpbHVpclBiU0JVRyt1cmxtWk5oeUR0eUJV?=
 =?utf-8?B?ZE5FTmM4M3l0SlJ5dE5MVG50ckFwQ3V1RkRXZFNIUTdJS2Y0RDVLTmNTVHE2?=
 =?utf-8?B?alVQVWdSTUIzWUdPMXg4czVPN1lUWEZRbEorT3drT1VkRzRGYm5BNlU1cnRR?=
 =?utf-8?B?WENEWWF1RjZWSjdBZ0g0Yk1VUlJaMUtPRUFmYlhaNGNhNHIyMyszYkhkUEdP?=
 =?utf-8?B?cTVkSStIN05mdGdzTnV0RlRPNXZiYUJEOFUxNWFJbDdpd2R6QVZqbmZvMnM2?=
 =?utf-8?B?cFloaXJUYUU1ZVdwYmdLMlo2Q2lub2hESlJiRkdveVJtUjQ1MXpMaStTS0t3?=
 =?utf-8?B?b3RYalNnZjdPNkNPbi9TY0g2VFI3WWNNekNGaGs3K2pZbll5OTcvdk1NTWs0?=
 =?utf-8?B?RUpWclpuQWtqaGpOa1k5b0lYSmJEVkhOVThkQ05UK3poMGVBeTI4eUE3U2ZI?=
 =?utf-8?B?cFM4N0ZSTm1oRldlRlNwMWFJd3MySlI5dU9yYzYyZVBGNm1pVlBmRGVjS3lB?=
 =?utf-8?B?WUw0Tk9yZFBQdWs5aTQ4K3pKRFZhYjh5T3BURXlxNVIyQzNLSVc4YkNETUgv?=
 =?utf-8?B?cGxlMDl6VWFWbk9abGZYajFnVnFPUFRXSFVCeTFWL1MxRWMza21wbjlsY0dr?=
 =?utf-8?B?anNpdTJHQmJjck9KdFJRYWVGSDRLNlpDRGI1eWdOa2VwNzRFU2JvdHJoeUtD?=
 =?utf-8?B?UTJ3ZmhFTlMyUE9UeHA4QzRaSGFNUzlBVUVZN0t1cm5PMkRjemdxckdmK1h4?=
 =?utf-8?B?MkRHUk9TNDc2T1o4Umw3ZU9DazNEdGNtK2tWUWExQTlKS3k2YWlQNFZiT2hC?=
 =?utf-8?B?L3VMU2daZmphZVRoOWlXdmpFTWtaajJSYllmT2ZSOTV5UktCTitJSWg5Z0tk?=
 =?utf-8?B?Q2hSSUJhdTV6Y1gyd3NYRTlrNFhpVGY2YVhBMmxiSlZjR0hsU0VsejRVMGdK?=
 =?utf-8?B?VVZ6aG15UDkvVTNzTGRCR2dYUHdlTnNnckxQRklueDR3MGU4REdTSFRpRWFs?=
 =?utf-8?B?amJsbjYzeW9YZUNINFRwVXZ5bk5NeWk2bjJOWlRXd1VKTkxhQTZTak80b0xB?=
 =?utf-8?Q?QmSv+cfDqXWrEToYPoLQ+duOKgmvYjpdWrzTwtH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3baed52a-65ca-4159-0795-08d9636e6209
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 00:06:39.3858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWsLsYtBccTwIFTlJKQYFPdY1RUY2TxUZmLM2Nd3ImvvnxMq3/X0E6OGWfJ4eIm7yvi8kgxQVNh+oEGg2xxni6Ukym9lA/MyrfuRcdfmWq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5703
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



On 8/18/2021 11:16 PM, Matthew Brost wrote:
> Rather than processing 1 G2H at a time and re-queuing the work queue if
> more messages exist, process all the G2H in a single pass of the work
> queue.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 22b4733b55e2..20c710a74498 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -1042,9 +1042,9 @@ static void ct_incoming_request_worker_func(struct work_struct *w)
>   		container_of(w, struct intel_guc_ct, requests.worker);
>   	bool done;
>   
> -	done = ct_process_incoming_requests(ct);
> -	if (!done)
> -		queue_work(system_unbound_wq, &ct->requests.worker);
> +	do {
> +		done = ct_process_incoming_requests(ct);
> +	} while (!done);
>   }
>   
>   static int ct_handle_event(struct intel_guc_ct *ct, struct ct_incoming_msg *request)

