Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C0C554301
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 08:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4F9113ABA;
	Wed, 22 Jun 2022 06:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDFA113ABA;
 Wed, 22 Jun 2022 06:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655880725; x=1687416725;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PUxZggHUb5jqg71YxkHmht0hN2RJ1lJ8tmffI9xIefw=;
 b=Ldy/VG4H1fdKWJXZCx3kJriKxcSPH87oFnlDTCfbMVmKhoegPbYwlXda
 Y+vi3LaFUH61AD4JJ+ybMvx/XDKMErt4dHufCupfw1H0oCcO9Lg9UurTW
 naj53SoCrHE1cnptbCANhOSW2JADr8hc1GL+3MaabKSz17BVzQx3e6bU9
 m+5SsRaObU6xbZ9lr3vka76iXwtazSFSDh/12DtIvaIpmSOxiixESoa0R
 A1ORDot3dEWjJDtBNnGANRUYBGa7wnexeO10Z22Q7gOXyrxArjptvDNkp
 KWpf3CU+1z54fVc9+pJameG620GD30v3BwE2eEwcpjyMDEtT6JhBrt5XK A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="263366922"
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="263366922"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 23:52:05 -0700
X-IronPort-AV: E=Sophos;i="5.92,211,1650956400"; d="scan'208";a="615039403"
Received: from ebrazil-mobl1.amr.corp.intel.com (HELO [10.213.200.60])
 ([10.213.200.60])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 23:52:02 -0700
Message-ID: <136dd37c-128a-714e-993f-65a119b7003b@linux.intel.com>
Date: Wed, 22 Jun 2022 07:52:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/i915/gem: remove unused assignments
Content-Language: en-US
To: Katrin Jo <zys.zljxml@gmail.com>
References: <20220620100216.1791284-1-zys.zljxml@gmail.com>
 <7a2028c6-8ed6-1fc4-3abf-b13f7254cdee@linux.intel.com>
 <CAOaDN_T_ZVCfhmbqd1AJnt3vhTuxnGhKsxG2fjjF8-u4wXOBcg@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAOaDN_T_ZVCfhmbqd1AJnt3vhTuxnGhKsxG2fjjF8-u4wXOBcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: bob.beckett@collabora.com, thomas.hellstrom@linux.intel.com,
 katrinzhou <katrinzhou@tencent.com>, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, kernel@collabora.com,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/06/2022 03:26, Katrin Jo wrote:
> On Mon, Jun 20, 2022 at 6:19 PM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 20/06/2022 11:02, zys.zljxml@gmail.com wrote:
>>> From: katrinzhou <katrinzhou@tencent.com>
>>>
>>> The variable ret is reassigned and the value EINVAL is never used.
>>> Thus, remove the unused assignments.
>>>
>>> Addresses-Coverity: ("Unused value")
>>> Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
>>> Signed-off-by: katrinzhou <katrinzhou@tencent.com>
>>> ---
>>>    drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> index ab4c5ab28e4d..d5ef5243673a 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> @@ -931,8 +931,6 @@ static int set_proto_ctx_param(struct drm_i915_file_private *fpriv,
>>>                break;
>>>
>>>        case I915_CONTEXT_PARAM_PERSISTENCE:
>>> -             if (args->size)
>>> -                     ret = -EINVAL;
>>>                ret = proto_context_set_persistence(fpriv->dev_priv, pc,
>>>                                                    args->value);
>>
>> AFAICT fix should end up with code like this:
>>
>> if (args->size)
>>          ret = -EINVAL;
>> else
>>          ret = proto_context_set_persistence(...)
>> break;
>>
>>
>> Alternatively move args->size checking into
>> proto_context_set_persistence to align with set_persistence().
>>
>> Regards,
>>
>> Tvrtko
>>
>>>                break;
> 
> Thanks for reviewing! I sent the V2 patch, modified according to your
> suggestion.

I have merged the v2 to drm-intel-gt-next - thanks for the fix!

Regards,

Tvrtko
