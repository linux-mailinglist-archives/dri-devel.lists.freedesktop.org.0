Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951873FCF69
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 00:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7466E0CF;
	Tue, 31 Aug 2021 22:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F184899E7;
 Tue, 31 Aug 2021 22:03:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="216729294"
X-IronPort-AV: E=Sophos;i="5.84,367,1620716400"; d="scan'208";a="216729294"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 15:01:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,367,1620716400"; d="scan'208";a="475867055"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga008.jf.intel.com with ESMTP; 31 Aug 2021 15:01:58 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 31 Aug 2021 15:01:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 31 Aug 2021 15:01:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 31 Aug 2021 15:01:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 31 Aug 2021 15:01:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULlU7l1PaOunR9bLNO/DLe9LJympAumGPT+7DM9MoaY/0YyP/2ZW/imfidQ3KM6fgNOSBperXHyIboDVpDY54YpI0ISuTlxDtAXR4YkVF9zzzfmUHvWRHKe55Z28+A2ee9MvmtiIyUVg2Y6P999fwiatdV/Ra97ruW42GPFOaMe5A4lsjc+3xmIXlUzoeNGEUbJ9UmkAgT+Zf+MenIaK9uSh0dB9OP7SCVrMGfkh7GKt78WYJ57kg5DQo8XXJP3kP1EYnc/bYdPz98oQZCsXqdz+zLX23faeUJhbFTuVvsEJAqGcgxWhEln+90KwMB/PpnugyyxoxqvyS/SuaQIImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZq/TnlLSq+tUyy0j33fuzyfBHcZZD+bmjZgFxYP8p8=;
 b=MElu1WabZzokcLga8blAGBdU7NAcwiI2/TRMl1RQOicEhjKQNjjJ0aQd3OU4eTmQYzr+1ojlVY/VXsp0bBsf52qFNb0XbL7crWmh4HYJvivRv5mHggqAUVQQrh+hbp5B3rH17M0x+mV7osYw7ZkIC9Sga3/8jkXBwKNyval6vKoHp43g3OQ+NtVEHfEsK7SlRpASrtGMdaYcHWjcbxlQXNdKAvrwmeFNvVotJptbi+3FmnZlhZBdU+TRmnRNUxMgKTX15C5jav5cAbIkYYTs+u4GtGTNHtvJxQjHGWD/h+LVj0SwOymd9ad6dt+o6kM5PHyJieF8/Wl8gOaZ6aHftQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZq/TnlLSq+tUyy0j33fuzyfBHcZZD+bmjZgFxYP8p8=;
 b=WZ8DvsopQ/j24eIhWI6yrE1hYtGM6z7lJNgGcp9f2kUtVm1eM6+UYbpAq64ocieVxJMRokEwrObNjDhN3T/+MibUiIrv9LR7qT5mh1MQb9C9KEXC2uNhnaOxxhfylJu0X4R7kW7JEATMpRzVT4ZzDuwwCXDD7xtSz10SpD1IAwU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM4PR11MB5231.namprd11.prod.outlook.com (2603:10b6:5:38a::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.23; Tue, 31 Aug 2021 22:01:54 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%7]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 22:01:54 +0000
Subject: Re: [PATCH v7 10/17] drm/i915/pxp: interfaces for using protected
 objects
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@intel.com>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>
References: <20210828012738.317661-1-daniele.ceraolospurio@intel.com>
 <20210828012738.317661-11-daniele.ceraolospurio@intel.com>
 <YS6fdOrnQ0JyoYi3@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <17361a26-3516-64df-0e47-3e1e025cef1e@intel.com>
Date: Tue, 31 Aug 2021 15:01:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <YS6fdOrnQ0JyoYi3@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR01CA0057.prod.exchangelabs.com (2603:10b6:a03:94::34)
 To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 BYAPR01CA0057.prod.exchangelabs.com (2603:10b6:a03:94::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Tue, 31 Aug 2021 22:01:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 231f73cd-d9c2-443c-3654-08d96ccaf1a2
X-MS-TrafficTypeDiagnostic: DM4PR11MB5231:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR11MB523168DE0DD098917F970511F4CC9@DM4PR11MB5231.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CJz4GrHTRK9mEinf8MARSVqD26XydZZoJXXPWVH6jt1+G8qSuexYGCbQL55AdWHvmpgXmteUoRUp1BZ2XJlbiMKX+unQeAAjzv1zD2FOSiE02EhPwPeozQ+sL0deBxb4KzKNOLWXP5Me/DDRpl7ZaDdq1u+2fgtJr6yq7lx8q4RMK3IZglnI/oNFb386SuvdbAI8wIsMQFuhc6kUwFN67D4G2lGozV/7uw2aIh7FLt6Vw08UxzS0/gVbH03ajNHkBs8UduN1W1pYKUAk+aqYPHv5UqVdyt42PbAWqxMLG4V+FLMpxIJYvom035swdBzStv7Q1BI+YCOSu5Zvj2mgVfjGC+TJKs/Ih9DaXwYHydiDCXbcXp4Nd4Bv06nmPLN9B2BaU6h83KiClXNFAAygobX4ZtItRIG36WkIxs7BEYX5HvULJ+5FIUeFYDDFPDMcr3+2mM5K6afBZwa4c2Xfy4MHtQiHq7P2ixeXTfiQfk3Fj5R12y+fkSeloRX7vo1RCzz95+X67ljcMcA0VyZ5trWIB152rlKs9YeAZ/K05IQJz0250TZ+MC97Sb2H/Yy1IGwpQCtnsnzaHj01WFPH8LMXsoKfCon4TkkjzVVZg1HNQH73EcxyN+KaZFDhtpD9btjaXg851KDFAPe6r4VFtIhIeYMMENsAjKDlcgrUMeXacdOPlep7v8vP4qX+/1Q4PKn3yJvfuwULxgUsvPi6cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(31696002)(2616005)(5660300002)(66476007)(956004)(478600001)(36756003)(186003)(8676002)(4326008)(26005)(38100700002)(31686004)(6486002)(16576012)(66556008)(107886003)(316002)(8936002)(86362001)(6862004)(2906002)(66946007)(37006003)(6636002)(83380400001)(54906003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnFWUkFZT29HWmlEaXhTa2gybmoycXZhRnlWMVlidkxDd1V0NG1PTTFHT2Jk?=
 =?utf-8?B?T0pPN3VYVkd2NzFGUlNIWWEyaWJ1NCs2MExqZko4cXplZk5hNVo3NnRuS0pQ?=
 =?utf-8?B?andMUXNCRStlUXJkcHZUNDBpcjltY1NuZnRxckRlNmtzZ3pTUnJBdWFCZDJD?=
 =?utf-8?B?U05YWDRWTFo5YVRjOWNVc2FvVUg3V0xMem5ieHRWUndJenVCUXlIVThOTXEw?=
 =?utf-8?B?V1MvenY5RjNZNzIrb2NiRlN3ckdVR3F0NEVsNzFtMzRpakg4L3BwY3lYckN1?=
 =?utf-8?B?MXl0R1FIQ0J6ZW9scjRNaGhCZ0xWK0l2WGJhcVY4TzBkOGI5UFh5cDJoVXlD?=
 =?utf-8?B?d3NqWER4YmR2NGF4emtTaVE3ckdUb1NIU0xUYXpiZlBGaUkxSlpVSEQwNExu?=
 =?utf-8?B?K2hhbFJOZlB6OGVxY3dRanJPeThSMFZkVktCWEZWQjk5UUpHOXp4WGkvRStS?=
 =?utf-8?B?bjBuNERxa0VlQ29kUEd0WmxQZTJkVC9kWlQ5eTBaSHlHcDg2QzhkeW9KRDhO?=
 =?utf-8?B?RnJDVjZ5SnZOYUhVKzRkWncwcmljNm9ldER5RzJBY252R00xbldXRWlKUjNr?=
 =?utf-8?B?aUdEdlFGc0dDQkdMbTB0UFMzdUJ3N0RSYmJvOFVKVnVMN2YyaEJuTU14TUhh?=
 =?utf-8?B?c0Y3VlEvU1YvcFZCcWExTTVpazlSa1lHd045cnkyMXNRcktEbmgveC9MSnF5?=
 =?utf-8?B?c0dEeUpHdzU0Znkwbk1NZVhONGhCQTFUM0FWdElwdWxSSlBEejVsdk9aUVZp?=
 =?utf-8?B?ZEJudCtsR1lOdDZqeEZWVktGSzJBVTJuZWhvK0lvZHo2ZytQKzU5bGJYYVdz?=
 =?utf-8?B?NkI1ckUzdUlOZktpcHRXaEZEUnBmQlJhVytLZHkrUlNoSFNXWENYNGZ6SXQz?=
 =?utf-8?B?bmxmTTYwOEdaNUlaVnNObzNzYk4zWndmTkNOOFFQTmdMWWdzMXc4L2Znek1a?=
 =?utf-8?B?ekMrZjd3QkpCSEVVRjVNRkNxdEtnK21YMWh0U1N0UUl5ZnJndVcxclBpY3NE?=
 =?utf-8?B?ejNXZzc2S01GZi9VeHZ6SjZQMTNzUU05NzVVUlQ1c2YwOGF6QW51YVpxc3Jp?=
 =?utf-8?B?WmVySlJZNUVqcisvRDNadnJLU0k1OEdrVDR2Z0J3N3VFR1Bjb0p0cUZFd0Nh?=
 =?utf-8?B?QURaR1ZCdngrQ0UzdFNrOFJGa1JqdW9TZVpHa2FEY2NpNzFXeFQ5cG4rSmxW?=
 =?utf-8?B?VnF1QktaUVFKS1I2bE15TGx1eEcydWVleUU3QWlEODBkV2l5eURlZjJWTGR4?=
 =?utf-8?B?Y3V6Y3BmdUxqZHNGU3JyN0RrSno1bURDd3B4MFU1QTAreGRYS0E4KzBoREhr?=
 =?utf-8?B?TzVGLzVSS1pTTUY3QXB2UFQvN3M5QWk5eFVSY2FRdUdDNXd6R3dDdi9wOG1Q?=
 =?utf-8?B?aWFEUisrRnFFelEvb2MxYVJ3dWlER095dFppVWZld1RqSTFzdDZVcU5sVzFi?=
 =?utf-8?B?UzRLMytZUkpWSEtCQlJaVHVQN2MyU2hOWVEyUzkrRVZOK0h0L1FMRm9CR21y?=
 =?utf-8?B?a0pXaDFKZzlEcXV4ZllQc0IxQnZmbTBuQmVhcExRMzlWdkdYUmZIMWE0cTA2?=
 =?utf-8?B?a0YxR1Z1QWFXbGVvSjRmdWQzaEhtTDhKY3VkaW1xYjJ5cDk5Z1hGSXlzWkJ4?=
 =?utf-8?B?L0dsS011Q1hxbGhJYUxXNmdNaFFVNUtKNzliV1liYXgyWmd5WkowMkFXbFo0?=
 =?utf-8?B?eHRidENvUzF6eGRnOFhVT3ZUR01TS2VBYXlXUDZlMEpKUDAzRGUva1FobHhU?=
 =?utf-8?Q?lSe5uLNZAUX6bFRmaRwsIFYO8pLcf1EDN8M3NB6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 231f73cd-d9c2-443c-3654-08d96ccaf1a2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 22:01:54.4192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxW7ptupPSFju0EE0C3XELyrHqSCl0oFZBV/0Ab6azXPKKWgyF8PV0h1TRYFu/4MdH19ISSnTBcnXqiCGgCYTByLh1hMRGYbkR7mQTvKknQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5231
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

<snip>

>> +}
>> +
>> +void intel_pxp_invalidate(struct intel_pxp *pxp)
>> +{
>> +	struct drm_i915_private *i915 = pxp_to_gt(pxp)->i915;
>> +	struct i915_gem_context *ctx, *cn;
>> +
>> +	/* ban all contexts marked as protected */
>> +	spin_lock_irq(&i915->gem.contexts.lock);
>> +	list_for_each_entry_safe(ctx, cn, &i915->gem.contexts.list, link) {
>> +		struct i915_gem_engines_iter it;
>> +		struct intel_context *ce;
>> +
>> +		if (!kref_get_unless_zero(&ctx->ref))
>> +			continue;
>> +
>> +		if (likely(!i915_gem_context_uses_protected_content(ctx))) {
>> +			i915_gem_context_put(ctx);
>> +			continue;
>> +		}
>> +
>> +		spin_unlock_irq(&i915->gem.contexts.lock);
>> +
>> +		/*
>> +		 * By the time we get here, the HW keys are already long gone,
>> +		 * so any batch using them that's already on the engines is very
>> +		 * likely a lost cause (and it has probably already hung the
>> +		 * engine). Therefore, we skip attempting to pull the running
>> +		 * context out of the HW and we prioritize bringing the session
>> +		 * back as soon as possible.
>> +		 * For each context we ban we increase the ctx->guilty_count, so
>> +		 * that userspace can see that all the intel contexts have been
>> +		 * banned (on a non-recoverable gem context, guilty intel
>> +		 * contexts are banned immediately on reset, so we report the
>> +		 * same way here).
> hmm... but guilty specifically means that they indeed caused the GPU hang.
> does the umd really need this indication? any other way of doing this?

The request from Daniel was to re-use the existing interface and AFAICT 
the guilty_count is the only one we have for this. The alternative would 
be to add a new flag (like I had in the previous version of this patch), 
but that was shot down already. Lionel can probably comment more on the 
UMD requirements for this since it was a request from the mesa side.


>> +		 */
>> +		for_each_gem_engine(ce, i915_gem_context_lock_engines(ctx), it)
>> +			if (!intel_context_ban(ce, NULL))
>> +				atomic_inc(&ctx->guilty_count);
>> +		i915_gem_context_unlock_engines(ctx);
>> +
>> +		/*
>> +		 * The context has been killed, no need to keep the wakeref.
>> +		 * This is safe from races because the only other place this
>> +		 * is touched is context_close and we're holding a ctx ref
>> +		 */
> The comments make sense, but maybe we should avoid the optimization here,
> but maybe we should avoid the optimization and just keep it locked?

The lock released above the comment and the one taken after the pm_put 
are different ones, so even if we don't release the wakeref here we 
still need to do the same locking steps. Or did you mean something 
different with keeping it locked?

Thanks,
Daniele

>
>> +		if (ctx->pxp_wakeref) {
>> +			intel_runtime_pm_put(&i915->runtime_pm,
>> +					     ctx->pxp_wakeref);
>> +			ctx->pxp_wakeref = 0;
>> +		}
>> +
>> +		spin_lock_irq(&i915->gem.contexts.lock);
>> +		list_safe_reset_next(ctx, cn, link);
>> +		i915_gem_context_put(ctx);
>> +	}
>> +	spin_unlock_irq(&i915->gem.contexts.lock);
>> +}
>> +
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
>> index 8f1e86caa53f..f942bdd2af0c 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
>> @@ -9,6 +9,8 @@
>>   #include "gt/intel_gt_types.h"
>>   #include "intel_pxp_types.h"
>>   
>> +struct drm_i915_gem_object;
>> +
>>   static inline struct intel_gt *pxp_to_gt(const struct intel_pxp *pxp)
>>   {
>>   	return container_of(pxp, struct intel_gt, pxp);
>> @@ -33,6 +35,10 @@ void intel_pxp_fini_hw(struct intel_pxp *pxp);
>>   
>>   void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
>>   int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp);
>> +
>> +int intel_pxp_key_check(struct intel_pxp *pxp, struct drm_i915_gem_object *obj);
>> +
>> +void intel_pxp_invalidate(struct intel_pxp *pxp);
>>   #else
>>   static inline void intel_pxp_init(struct intel_pxp *pxp)
>>   {
>> @@ -46,6 +52,12 @@ static inline int intel_pxp_wait_for_arb_start(struct intel_pxp *pxp)
>>   {
>>   	return -ENODEV;
>>   }
>> +
>> +static inline int intel_pxp_key_check(struct intel_pxp *pxp,
>> +				      struct drm_i915_gem_object *obj)
>> +{
>> +	return -ENODEV;
>> +}
>>   #endif
>>   
>>   #endif /* __INTEL_PXP_H__ */
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>> index 67c30e534d50..c6a5e4197e40 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
>> @@ -72,6 +72,9 @@ static int pxp_create_arb_session(struct intel_pxp *pxp)
>>   		return ret;
>>   	}
>>   
>> +	if (!++pxp->key_instance)
>> +		++pxp->key_instance;
>> +
>>   	pxp->arb_is_valid = true;
>>   
>>   	return 0;
>> @@ -85,6 +88,9 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
>>   	/* must mark termination in progress calling this function */
>>   	GEM_WARN_ON(pxp->arb_is_valid);
>>   
>> +	/* invalidate protected objects */
>> +	intel_pxp_invalidate(pxp);
>> +
>>   	/* terminate the hw sessions */
>>   	ret = intel_pxp_terminate_session(pxp, ARB_SESSION);
>>   	if (ret) {
>> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>> index 5a170e43c959..c394ab2e452b 100644
>> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
>> @@ -7,7 +7,9 @@
>>   #define __INTEL_PXP_TYPES_H__
>>   
>>   #include <linux/completion.h>
>> +#include <linux/list.h>
>>   #include <linux/mutex.h>
>> +#include <linux/spinlock.h>
>>   #include <linux/types.h>
>>   #include <linux/workqueue.h>
>>   
>> @@ -27,6 +29,13 @@ struct intel_pxp {
>>   	 */
>>   	bool arb_is_valid;
>>   
>> +	/*
>> +	 * Keep track of which key instance we're on, so we can use it to
>> +	 * determine if an object was created using the current key or a
>> +	 * previous one.
>> +	 */
>> +	u32 key_instance;
>> +
>>   	struct mutex tee_mutex; /* protects the tee channel binding */
>>   
>>   	/*
>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>> index 920e9e852e5a..9ff77732428b 100644
>> --- a/include/uapi/drm/i915_drm.h
>> +++ b/include/uapi/drm/i915_drm.h
>> @@ -1846,12 +1846,36 @@ struct drm_i915_gem_context_param {
>>    * attempted to use it, never re-use this context param number.
>>    */
>>   #define I915_CONTEXT_PARAM_RINGSIZE	0xc
>> +
>> +/*
>> + * I915_CONTEXT_PARAM_PROTECTED_CONTENT:
>> + *
>> + * Mark that the context makes use of protected content, which will result
>> + * in the context being invalidated when the protected content session is. The
>> + * invalidation is reported back to userspace by banning all the engine contexts
>> + * within the gem context and increasing the guilty_count to match; this will
>> + * be reported in the RESET_STATS ioctl the same way as if the bans were due to
>> + * hangs. Given that the protected content session is killed on suspend, the
>> + * device is kept awake for the lifetime of a protected context, so the user
>> + * should make sure to dispose of them once done.
>> + * This flag can only be set at context creation time and, when set to true,
>> + * must be preceded by an explicit setting of I915_CONTEXT_PARAM_RECOVERABLE
>> + * to false. This flag can't be set to true in conjunction with setting the
>> + * I915_CONTEXT_PARAM_BANNABLE flag to false.
>> + *
>> + * In addition to the normal failure cases, setting this flag during context
>> + * creation can result in the following errors:
>> + *
>> + * -ENODEV: feature not available
>> + * -EPERM: trying to mark a recoverable or not bannable context as protected
>> + */
>> +#define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
>>   /* Must be kept compact -- no holes and well documented */
>>   
>>   	__u64 value;
>>   };
>>   
>> -/*
>> +/**
>>    * Context SSEU programming
>>    *
>>    * It may be necessary for either functional or performance reason to configure
>> @@ -2979,8 +3003,12 @@ struct drm_i915_gem_create_ext {
>>   	 *
>>   	 * For I915_GEM_CREATE_EXT_MEMORY_REGIONS usage see
>>   	 * struct drm_i915_gem_create_ext_memory_regions.
>> +	 *
>> +	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>> +	 * struct drm_i915_gem_create_ext_protected_content.
>>   	 */
>>   #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>> +#define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>>   	__u64 extensions;
>>   };
>>   
>> @@ -3038,6 +3066,31 @@ struct drm_i915_gem_create_ext_memory_regions {
>>   	__u64 regions;
>>   };
>>   
>> +/**
>> + * struct drm_i915_gem_create_ext_protected_content - The
>> + * I915_OBJECT_PARAM_PROTECTED_CONTENT extension.
>> + *
>> + * If this extension is provided, buffer contents are expected to be protected
>> + * by PXP encryption and require decryption for scan out and processing. This
>> + * is only possible on platforms that have PXP enabled, on all other scenarios
>> + * using this extension will cause the ioctl to fail and return -ENODEV. The
>> + * flags parameter is reserved for future expansion and must currently be set
>> + * to zero.
>> + *
>> + * The buffer contents are considered invalid after a PXP session teardown.
>> + *
>> + * The encryption is guaranteed to be processed correctly only if the object
>> + * is submitted with a context created using the
>> + * I915_CONTEXT_PARAM_PROTECTED_CONTENT flag. This will also enable extra checks
>> + * at submission time on the validity of the objects involved.
>> + */
>> +struct drm_i915_gem_create_ext_protected_content {
>> +	/** @base: Extension link. See struct i915_user_extension. */
>> +	struct i915_user_extension base;
>> +	/** @flags: reserved for future usage, currently MBZ */
>> +	__u32 flags;
>> +};
>> +
>>   /* ID of the protected content session managed by i915 when PXP is active */
>>   #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>>   
>> -- 
>> 2.25.1
>>

