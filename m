Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEB7860454
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 22:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FBA10E1E6;
	Thu, 22 Feb 2024 21:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chboBoqG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458E010E1E6;
 Thu, 22 Feb 2024 21:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708636037; x=1740172037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XAm+xwP77Iy8QebtOvuyDDy1jRmwjyy0JTzP3SyljE4=;
 b=chboBoqGJuTQa4CDqXfJgsC8F4g1YPpCHJUY28sH6g5zmUQdIh8DUwdI
 Z5Z3NIaL7a4yNkUGgiOeQ2LtZiqli8/Ad8BsKCaBW0IJZDcGDmn+y19ah
 vxsYDZLRyauWxNvohOo0sY/mZ4bVMwX70yiYgnOhOW5reVpbU00PbChDq
 EGxRTZRb+KXmkK/7d3QxC+PZ3vndpqmiwUT9RelAWrI/Pv0K96rHLBpV6
 qVu98lfV+ckEzBFRa7X+eY5M/wMIVZA5YP+aFVomSeSLBRF/nD1sK7wPP
 Hg41H/jm7pGhrC/MsdITWqtz1IKKA2xD+E0vGqMOyc/DlnsEe+q3C8wzk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2754663"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2754663"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 13:07:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5559320"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 13:07:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 13:07:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 13:07:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 13:07:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 13:07:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgM7HCcyCVWx5Pe9+jLPWcsjrjBflb2A8Jbm6SCnz8TPEg4AsTtVvp1bSplQuqtDmK84JgRNI1f0JSsFzdYlWs5nmdMXwZXltfieDzDJUI6+V0uoC2tk6NdyW7TxjAtWYZ/F7cB5JMhI17isjstNjZSC9/rzNl/TaAxD/wiYICOFLoF5yzPlPJJG+uCnT/VhSXWNsrGzMZtCbljqyMiyvVO3cf3LeAOmnXYo8x3kiNVyt9xeeuvQWzD9bH481VZZXoaBsDx1aRLJzZuEjo4LhfiN/ZYOwOxloAwsYWHMCitukQ8qqGtBfHnD8gUNAXr49KJH+QitKpz9eofoeY5XnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJUaZNeFK0anPlYkpxNLpSOC20q6azhjoyZrPk0+67Y=;
 b=hV9ntPbqmPs2gRAGtNokwNwuBSp6sDOgTdeUeAaH362oVAQxlNQKnFxs7OKGlJYBdq3MtUC9V+y+dOZRMq/i86BNWVHy6uTTD7BGRJlxA4Rw4q63pBJt3u9mzL5KHB4DK+BVuWUSOubAyAFAA5/wrc6CvOYtXJay+ttO6qqCw6qLN3ldfCg/IMI1MYZ6Q7T5mHg+nCwSCi6gXPezw78KMjiWLTrsHboSDwr4SLBP5cHY9WZTdk2TwScsTLtNQG69b2CT9E2PIbxkSB5gG4Xtlqqq+CskbpYG6wRJiZ0H8X36lGutq1QEDZjQUJjq7Kpd2oieNMZirRTrc0+R1FMzhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Thu, 22 Feb
 2024 21:07:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 21:07:11 +0000
Date: Thu, 22 Feb 2024 16:07:07 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
CC: <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, Carlos Santa <carlos.santa@intel.com>
Subject: Re: [PATCH 1/2] drm/i915: Shadow default engine context image in the
 context
Message-ID: <Zde3e0KUTTF2hGyY@intel.com>
References: <20240221142245.2331484-1-tvrtko.ursulin@linux.intel.com>
 <20240221142245.2331484-2-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240221142245.2331484-2-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5427:EE_
X-MS-Office365-Filtering-Correlation-Id: af83a39d-bf85-4299-9143-08dc33ea3c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: daPtrtdd6Pb/03SD4TXfui5gYbGOMx2FEXVLy+gNfzaj7pTLBgcL/hvdhXDz6sQab3xfeMmVoV8w8r2BUc5V4MH9ZB5fcsGoqFL2ia9T/WucdxuDAv1sMUDimDU+fW1gUd+pN9PNBRrQ37kyZXw2a3nnGbG8jVEQwATLsNfyCAb1DZDgkbVKx2J3/ST8YGZFIsQGHvDXqxfvxeWlv2U+MCF5dzlBnQ127VGM91fHlnuNs9DMCwKqK8RmQ4ZwkNK2PPxnsX06ybKFAPNkHouIkxsdS1g93wBf0XSUuWt7ljJ2y4qZgdsY208m03TLWkfDtMYdRgrwOWe75tcDEWKH4bcGuohXbeGSLBH3B7efLav55vtG793KzoGRwzLZqneqGtI3gQupjeorDNdt1mou8/Sgx3oVSnSW7nd22QXxi052IyvJ1LZs7G3LlEB4shuKY4wFnWnTSKrAiixtQfY3p+IpDqK7E86pCCNXSOHsU440ETXrW5He8XQ7bh3Xs1aiRF+3p5pQvEhKWAcogetfnGIQMRrftdlvhzkro2ig4G4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0e0Fw6px4tvM0FLYFeL6aC1MxzaN1YrnlBjO3WcfIdcwU82sqUACkYc5acqc?=
 =?us-ascii?Q?LMZs1VH1R8LHvo3R/atoJwrl5ydFxAYWkc7oH3lXMLCrXpIrjSPj2R+u2gNs?=
 =?us-ascii?Q?zk5SajaJ5/fJwCb3qSOc74brpVfoYxWgID4CSC4Bqdi0LA26o2XDefWJmaot?=
 =?us-ascii?Q?TI9C9IBoN1QujK68+9RXMeQQ/o83Zu0CF+AcOP3wGQfYoClubOk6D1hP851p?=
 =?us-ascii?Q?sA/TWx4cSu0Oq1EWlmN5TJCecVnuN2uR6EgvCKbzNpT8FREVSz1wWZ0onFXA?=
 =?us-ascii?Q?4VSDgmk9SZtIvI03Zrel1/R1D5IuVkFm48rgT695Cds6FsIGDwbtVTRbaU26?=
 =?us-ascii?Q?Pw2vXqE8kzGaOZxXOrR8AzSiii6ATG7ZOeBExwj6z0ECivs6PCqaSXqsXxye?=
 =?us-ascii?Q?f7NIeqIQAOrxDrtgWrsisGtyChFqGbwg4dC6Vz7ayM8mtojdwr4ndqKnT0Na?=
 =?us-ascii?Q?TGFYR1JhlFn4uuDkoEpV4yVLOKpiT4sQirgWgdpwXrK3/sIc5xZ8a8zrHzbe?=
 =?us-ascii?Q?mt+woAKBm4bmQ2naGyFQiHt60G4xORfxI7/WDg95Zb/YUsa9h++1v6RoWq63?=
 =?us-ascii?Q?TZ9ZYvvSEHrsnzLEt/4p76HhQo5fP+NmaCo0Qi5mUtkC4IHAekEwsrP+pkiv?=
 =?us-ascii?Q?Qk0CaPKpUWtiKtsMM/G69w2QjBCUhlJ9lLg5ikzX/0GrlKzKKCvRXMcr7pfH?=
 =?us-ascii?Q?z9hYaUF1oy00PwwmR+3sJsbqLSPV5NmkISdOARz7ok+qPpZzyWz+I4llm6hZ?=
 =?us-ascii?Q?ao++kSbPYPYtGmWdpOJjxuq1574pcLqm86aopNAlN/CbeyWlSysSzTp6rJUi?=
 =?us-ascii?Q?6FyML04VMVWQDLdJMgkrdzCDxyAnUNBHyfqiGVvQRiJcNXFBv7zbElcTr+vP?=
 =?us-ascii?Q?RzPj0p8hgRMaTnsrZyszP+VKcecHrxffILLIU7djwfeOugLRyyS+2EhGYdxy?=
 =?us-ascii?Q?r2h722qCzfceuyci6m61ohkZqeNohb9CTT9pSJqA2hREVg7sOUo56/8z6O4a?=
 =?us-ascii?Q?P8/xJ7oCBAabsr2VoSUgDkXJj7uVw86nFXQaxblMmq8WPw0oos/qdLv+gESn?=
 =?us-ascii?Q?m0LtK/fGjldrLYiwJtBNxXhghQUHzOaz3uOmg1hOvG5YitciOxHFHDKwjG+D?=
 =?us-ascii?Q?RzQC+gyL1GJ4FWEMdMQdxnziewOjtZAejovv8lWFBTaAItLvWDljePbOmA66?=
 =?us-ascii?Q?ktsICzdPdEuGgf3pWLFa9MvVW+bKDOpDx/SqkDiJSjYNle/ekL/Zn7seaH/s?=
 =?us-ascii?Q?F3BrDqkRSPewawmSrkNpeWikEdF74mlMTeDipVehK7ppkL6jpYQtToIFc0t2?=
 =?us-ascii?Q?qrcStsVpY8bDwb6CV7ZblmSnePBBDip0ezWMfgCF6l9++JWzp2MSpVd38tFG?=
 =?us-ascii?Q?CjDtRc9PcYFNKEbSz2e2MCHNsLTWRBbZ3GCUIxnLlDTnih4BppAIdH/AZZ59?=
 =?us-ascii?Q?WmGNL2dvDAyifl4kd6079fwwynKQfHTx8DIZZnj2xhMCjd8RQ50cd3NL0Lst?=
 =?us-ascii?Q?9nNO6LjdwAQxtKkhajlTCdgAmXk5VzYzYdwxBPw5De1BtvqaSrTSj3PhI4JC?=
 =?us-ascii?Q?38VUOPQXS2vhGJ9Aj1BaZwjOFIVqPgteFBZAwyx65St0LNviN10HcO1eIgTo?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af83a39d-bf85-4299-9143-08dc33ea3c98
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 21:07:11.4891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyffBa6Sors298TglOu8s/Tj6jF3KEPMi/SfmlB71OVowqLd3qq8qb+hE5p16Zl/EW/yqsR+S/oQeulQjogG4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5427
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

On Wed, Feb 21, 2024 at 02:22:44PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> To enable adding override of the default engine context image let us start
> shadowing the per engine state in the context.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Carlos Santa <carlos.santa@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_context_types.h   | 2 ++
>  drivers/gpu/drm/i915/gt/intel_lrc.c             | 7 ++++---
>  drivers/gpu/drm/i915/gt/intel_ring_submission.c | 7 ++++---
>  3 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 7eccbd70d89f..b179178680a5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -99,6 +99,8 @@ struct intel_context {
>  	struct i915_address_space *vm;
>  	struct i915_gem_context __rcu *gem_context;
>  
> +	struct file *default_state;
> +
>  	/*
>  	 * @signal_lock protects the list of requests that need signaling,
>  	 * @signals. While there are any requests that need signaling,
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 7c367ba8d9dc..d4eb822d20ae 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -1060,9 +1060,8 @@ void lrc_init_state(struct intel_context *ce,
>  
>  	set_redzone(state, engine);
>  
> -	if (engine->default_state) {
> -		shmem_read(engine->default_state, 0,
> -			   state, engine->context_size);
> +	if (ce->default_state) {
> +		shmem_read(ce->default_state, 0, state, engine->context_size);
>  		__set_bit(CONTEXT_VALID_BIT, &ce->flags);
>  		inhibit = false;
>  	}
> @@ -1174,6 +1173,8 @@ int lrc_alloc(struct intel_context *ce, struct intel_engine_cs *engine)
>  
>  	GEM_BUG_ON(ce->state);
>  
> +	ce->default_state = engine->default_state;
> +
>  	vma = __lrc_alloc_state(ce, engine);
>  	if (IS_ERR(vma))
>  		return PTR_ERR(vma);
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 92085ffd23de..8625e88e785f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -474,8 +474,7 @@ static int ring_context_init_default_state(struct intel_context *ce,
>  	if (IS_ERR(vaddr))
>  		return PTR_ERR(vaddr);
>  
> -	shmem_read(ce->engine->default_state, 0,
> -		   vaddr, ce->engine->context_size);
> +	shmem_read(ce->default_state, 0, vaddr, ce->engine->context_size);
>  
>  	i915_gem_object_flush_map(obj);
>  	__i915_gem_object_release_map(obj);
> @@ -491,7 +490,7 @@ static int ring_context_pre_pin(struct intel_context *ce,
>  	struct i915_address_space *vm;
>  	int err = 0;
>  
> -	if (ce->engine->default_state &&
> +	if (ce->default_state &&
>  	    !test_bit(CONTEXT_VALID_BIT, &ce->flags)) {
>  		err = ring_context_init_default_state(ce, ww);
>  		if (err)
> @@ -570,6 +569,8 @@ static int ring_context_alloc(struct intel_context *ce)
>  {
>  	struct intel_engine_cs *engine = ce->engine;
>  
> +	ce->default_state = engine->default_state;
> +
>  	/* One ringbuffer to rule them all */
>  	GEM_BUG_ON(!engine->legacy.ring);
>  	ce->ring = engine->legacy.ring;
> -- 
> 2.40.1
> 
