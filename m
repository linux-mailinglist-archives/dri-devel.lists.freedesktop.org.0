Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E6264AD61
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 03:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D14C10E1A2;
	Tue, 13 Dec 2022 02:01:22 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB2710E2BC;
 Tue, 13 Dec 2022 02:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670896877; x=1702432877;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IOLUDq9SFj2iZr10RtOrD0osRcBqSKxckFJPFAC8M0g=;
 b=U6bVO30ucPnDe+DfaokyD9m2I0Tvll+MX6nw7/GLRJsoR/5nAVR6fq29
 tMXXkOudpwFk81jyGss9S+VUlLZsLFDBeQohcEKeBRBo0+ChmPJn1Efki
 zdlkQhbXlf1ChRHmwbNaCn5O1B/YVqSHFxqB2XUpWC6iYbyG9uKG7b4pO
 tb8mUBrriXBuZQg8MSiDAJ6vB1hRi7cAyUw3dp9vCgHTGfsecOPJua51T
 EJWnX7i9949TAe8/9t30rfWtLX1GuCkH43PNRq+DC8Hw+By5w7oIw5yhR
 TG2hko22q9bjQGhRFvuuzBv5J5QEr3cujGrmGRKjzkrM/fYJUyR2ioJF+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="316719608"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; d="scan'208";a="316719608"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2022 18:00:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="641945619"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; d="scan'208";a="641945619"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 12 Dec 2022 18:00:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 12 Dec 2022 18:00:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 12 Dec 2022 18:00:27 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 12 Dec 2022 18:00:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USYbuhGA95SAgD+PcwaRwkDyd+wGdd+KYTnSq/N+851bSLxCPhesKALSTrL5zGXYba9MjCIZx8bXhU2q2PDZxcYQVrFJPiF5EQFFlPW+iexuLfIE2mGur0gGoMqCPSH7T2d7B3L6OCUQxyRfxzy/la2ge0xTYIaRD6NhUH0gQHPhTmj+Q2e3Uo+Gmhxl9LVALcAIVYct0ui4x+L8TpRH6fU3biVu4s27Z395ieCXM+k2Mvr6XbNzU5vYnrYDiUyHAhk1+SvrTzoJf5sGM/dMfQ1RsdyywDe9lY4rV/ftRymc8jCBSg0tPXiwaPsE4gZl0ECdnMUbfHQJjc5Gw8tMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5lMfgfwBfKT1J3x/AOlbomydwPekuziGA6+Uf72jHc=;
 b=g635nMTo4FluEFPVg9DhPxBF8OnMBLC4zvtLa5i7VfJ1QdR0PQmC62tGYjawITNNzhAuLfRM9lrsIlVn//RzPONIzHnjbYDHnBg1jdUTPQmhniCXW3r31TW19lAvdH/W7HryR767OQpNHZ5yT7HSdZRQoA6wDxzK62YEgE51luYhBhXX5ddRInEA+WsJlEZtE+1+VpC0FdUsIwartdMykUUWOgdGcq6kci9n1LO/ZVb7rMKFLGiBIPB6mhLTgWsOEb3GDwgvigMhJPlGwep6U3ySnTTpsRn5C1LTKJureEsFEaRVRAHsYo1qZlsUva+7lec35eE4wxppqjjw9Oyc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.19; Tue, 13 Dec 2022 02:00:25 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::78e2:5141:1238:973a]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::78e2:5141:1238:973a%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 02:00:25 +0000
Date: Mon, 12 Dec 2022 18:00:23 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <John.C.Harrison@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/guc: Look for a guilty context when an
 engine reset fails
Message-ID: <Y5fct8rRG/n09gP8@unerlige-ril>
References: <20221129211253.3183480-1-John.C.Harrison@Intel.com>
 <20221129211253.3183480-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221129211253.3183480-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::30) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|PH0PR11MB4776:EE_
X-MS-Office365-Filtering-Correlation-Id: e133fef8-3341-455d-078c-08dadcadccfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4MoA6XfSk6AuOoKTv+PK68c1oQYR3w8uzvLL6HWilevL+/5O3HkMgS62zpCUsqhiOG+ni0MfBE9KLEnGKQV7x8pb/m7VbqFN7SwAMmNyImVmhQMtsNZMVc7sMcRC88jUnDz+2k3Ni7kPxvBpe1jKWzvUe8NdzTrykTgwobo7W6ioMyA4uJcrF6uOrtx/mlviAzYY9aYhf1fGiy7aTkIpFtb5tRIkOZPm9b4vmyWQj4khzgbClvZdymwknuPkpBS/3An1rpaeZVTJnQn6f34yQgUAUc1+jcGKJcgqRI4s01PC6QLTsSBKNEfOsljuQVqvOi3GzusZuZOUK/c6fCgcvuxIKNhXDb2gLk0WyTlusbD9+X4gCJETmYqj/FDcog3KWKgI+ZjP2YsuNHYWufDwo+9XMgqk6ifz6vDZFDXBwdIXffB0URsALlXwHzPZXHyhXYwXlPKUJWrt1Hc6rP2DhYfYyXfnch0/Q2Pps/UYKCxzAiJqOXv2vnZm+R4lypZLV2m40rf8NTwrO3Uq5G8p+hswEKj6NHtW9exxIyQYQDzAaeEUrmqoTr5tjzH8jhRq/yu5ncfj+aNpweSGo/Fi/Yir+maQY8IbYN5mjpk+lAhfNgnymHR04ZCuxZU2osVs5Ijr450hKUxAihWTZ771Sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199015)(33716001)(9686003)(316002)(6506007)(6512007)(26005)(186003)(6636002)(6486002)(86362001)(83380400001)(66476007)(82960400001)(8676002)(66556008)(66946007)(4326008)(38100700002)(41300700001)(478600001)(5660300002)(34206002)(2906002)(8936002)(450100002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGVvT05saVVVYU1mWkJ4MXk5enV4cmZFMkIzRGtXQXpzYWFaN2VmNFo2a1I0?=
 =?utf-8?B?YlVqNlpycFkra0tuOEd5Y2czaUlpd0RQWTRpY0UvOFZsNk55Y1RzRE1RRE5t?=
 =?utf-8?B?SXpobDhKZVZWM0x5NnVpVjJJK2tNTk13NXdQMTB6Y2cycHM3ckMxSDAvR1ll?=
 =?utf-8?B?Y1A5UCtNUWx3SUNZV2c0aGYrL0N0VXVaZVNqL2dmMmFzY29JNFhiRGpkb1Fi?=
 =?utf-8?B?QW9TVEhKUkc4ZWg5SjVrdWwwbUl4ZGhSc3k3THJiZUxvdXNLS2tFU2hYVTZX?=
 =?utf-8?B?ZkFhcVR3b0IxcHVkUEVPb09rd3VnNEdvUktvSFo1M0dNZGV4M2hjVlV6amhX?=
 =?utf-8?B?QkpiL0N4d3N4Z2xmeDZpeUNTeGZNTmx3VUcrQ1hpMElZVTJtL0swR1gyRkx6?=
 =?utf-8?B?OFBwVmlkNG4rWmdIdXVxMVRTOTRib1FJNEFpb3UwQno4MU1CMWZ5REdtZzF2?=
 =?utf-8?B?WnJsS2ZpMWhvc3QxM0NJVmFQR0p3UkhZdUFISXZ5eHd0VE1xVzVzbStySG5G?=
 =?utf-8?B?VTdpcjJDdGRwbHZtdTE2SlZrcFZaWjJIWDA2OXluSmg2WVIwSzFsNEJQUzVm?=
 =?utf-8?B?R0M3UXdXa2luVEluQjdBWENhWVJ0QkVlVk5jODFRTG5JUzIycFE5TEdpWmRE?=
 =?utf-8?B?Z0ptYVVPbTJyUDZnY2FEQTNtYWNGNmdDaFhZZGFiN2xVTkliVmF3M0JnMkxs?=
 =?utf-8?B?aDN6eFhycnZad1FsQ1B0WEVrVXVIS2pKZHBjZGp5emJUbGdGVzhCNFQ1amVh?=
 =?utf-8?B?MmM4aFd1Uk1qQlRaREpDaE9UcVN3KytxZ2U5ekxVMjJneEVtelVNT1d0OUJx?=
 =?utf-8?B?R0RSSjNoeWtlVXUzZnlKVVpQSzgyNEZxZXJjaGVYMTZTQ25pYm96OWU3RGZT?=
 =?utf-8?B?NVdPdm9ocFlqVGtlUWFXbGFZR29ZVjlBT3phL3lJSys2VS9lbHpHOUtXeVg1?=
 =?utf-8?B?djlZdFlndWFpOXpwdXF3bGJscm01RjQ3eGhzLytmNVZ6NUlGbXdMZXk4eFN0?=
 =?utf-8?B?aUN4djlnUjlWMW45bU5GQTBoYzd2Q3lFZlVQT2V1QWpUMDdua0hsSnkrUWV1?=
 =?utf-8?B?cEZJa01mOEJWWHJUdndoWXR6c2RaY2FkZ2hyWGJTc1NMRWxMb1NyaU5zUHE5?=
 =?utf-8?B?elY3MER5dEhFMm1GTUxZOHh0ek1hRVN2MUs3UU1PdmhnbWwxdktUeXd5VExa?=
 =?utf-8?B?NTBBTlBKZHhLb1FRbzQ0Y3dhcE5Iek1hMiswNmRUL1owWkFNU1BPZzBJWTRs?=
 =?utf-8?B?akZ4U0JIRjg3aVFUVGNjNXgwU3hveklHTnFjY0k2MHAwZmxvOTBLWWR4YkFi?=
 =?utf-8?B?dFRDaTVGL2FUaCtBSmhpc21UYncrV3NwSldFM1g4RXE0ZEtHWitNOUhDMzNi?=
 =?utf-8?B?MCtHZFZoWDlZdkhOdCtmMW54MEdvRmx6RzhaVUIvbGZTMW14UDJ4TXNkNmY1?=
 =?utf-8?B?Q0ZzMHJ4YlRvUWIyaUVuVGVUL1MrNHhKUVQyVzBjVzhpTFB3TEUwYTNUd3pC?=
 =?utf-8?B?NTVtN0NxZWxNTzVvTEpSRlUramwzWTdYbWtQcEpFSW1PeVpTeHhyNmNuckwx?=
 =?utf-8?B?STgybHhVZHBUMWhnTmYzRzBzc0s4K3ROdWkzRDc3R2ZUUmo5dmwxQmF5ZDdx?=
 =?utf-8?B?QnViaU5hMms5ZmlWOFk5dFVCV1I5YjNrc1llUnppbjZBcW9zenBDNVUrMlB2?=
 =?utf-8?B?TCtWV1NCTHpPcXAxdVExN0hZbjZuK1lXcWt0anBFZDVmUW9aai9lbUhIV3hC?=
 =?utf-8?B?SXZkK3d5aEc0OVVJckl1dzVQN0ZPRXFyWTB5MDFQZWtnYW1EdUNFRXg4djB1?=
 =?utf-8?B?ZDVFb1ZsSjhoQXBmZnhrTEk1T3NzbFNQY1d2b3N5QWI0Z0tFVVZLQmRsbEpS?=
 =?utf-8?B?aVVmYVdNY2RTdEUwZUhJVS91VEhwMDNEUkhTM2VDaTg5dCtBOHJ1WGtSRC9F?=
 =?utf-8?B?NTh3L2NOSWhZNVNyZ3ZFa1dVVUhMUUkxWGJFZk1EazZkc3ZiZFBydlhNeVpa?=
 =?utf-8?B?TVMzTDNmUmhJTG5uS2d3bTVLcnMzWllUeE9qWkJLcVc5blptdEloTXA1c3hB?=
 =?utf-8?B?a29yenhxdWZnMm4yVDVlMmtMQXRiUjFsZkZTTXJ2aDI4UVlhejdpaHJlT2ps?=
 =?utf-8?B?K0taZURZVHRTNUQ0cXpFM2xvZ2tnVy85S1lBQnNCTUVQYVJUaU9Ic2RQUWx5?=
 =?utf-8?Q?zgc73OoV5NSy9lAM2V3Y2Tw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e133fef8-3341-455d-078c-08dadcadccfb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 02:00:25.4209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tvevyk82Pbppau1OE4B2M3pncJTL43Nmv+0JVOacoYsKdl9lE2T2tLFsP3nXqxK0qQ9ZpbrQRU9jGQjDZjw7sjZfCQ+IJh/DBEJ1PbuoF44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 29, 2022 at 01:12:53PM -0800, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>Engine resets are supposed to never happen. But in the case when one
>does (due to unknwon reasons that normally come down to a missing
>w/a), it is useful to get as much information out of the system as
>possible. Given that the GuC effectively dies on such a situation, it
>is not possible to get a guilty context notification back. So do a
>manual search instead. Given that GuC is dead, this is safe because
>GuC won't be changing the engine state asynchronously.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>---
> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 ++++++++++++++-
> 1 file changed, 14 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>index 0a42f1807f52c..c82730804a1c4 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>@@ -4751,11 +4751,24 @@ static void reset_fail_worker_func(struct work_struct *w)
> 	guc->submission_state.reset_fail_mask = 0;
> 	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>
>-	if (likely(reset_fail_mask))
>+	if (likely(reset_fail_mask)) {
>+		struct intel_engine_cs *engine;
>+		enum intel_engine_id id;
>+
>+		/*
>+		 * GuC is toast at this point - it dead loops after sending the failed
>+		 * reset notification. So need to manually determine the guilty context.
>+		 * Note that it should be safe/reliable to do this here because the GuC
>+		 * is toast and will not be scheduling behind the KMD's back.
>+		 */

Is that defined by the kmd-GuC interface that following a failed reset notification, GuC 
will always dead-loop OR not schedule anything (even on other engines) until KMD takes 
some action? What action should KMD take?

Regards,
Umesh

>+		for_each_engine_masked(engine, gt, reset_fail_mask, id)
>+			intel_guc_find_hung_context(engine);
>+
> 		intel_gt_handle_error(gt, reset_fail_mask,
> 				      I915_ERROR_CAPTURE,
> 				      "GuC failed to reset engine mask=0x%x\n",
> 				      reset_fail_mask);
>+	}
> }
>
> int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
>-- 
>2.37.3
>
