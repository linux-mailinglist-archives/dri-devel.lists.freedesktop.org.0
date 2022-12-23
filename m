Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CFA654E03
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 10:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD6210E62D;
	Fri, 23 Dec 2022 09:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EFB10E62A;
 Fri, 23 Dec 2022 09:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671786159; x=1703322159;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=paA39cnx8g9Maeo4ST025fMwBV288lfVRFCo8HEZn0c=;
 b=F7M8fSANEkI2KyOn+Y3gj2tIULB4yoobt62p9rPIzc3DvYSg/SxnuHU7
 GXEAGF1EbsyIDd/BIJnw+g3g3N9MFkwLNf7FtkSEjiDa20eQJSXZ2Aq+J
 BLqt7Cm+m1Y7W/ysNiU52ByoPvOOJ7ultBQkOUPQyD7eJyefsRRm1VYIV
 l+P0ACa4jqvtKyTMfaFZzWHfOslwAyz2dQN23DM7XHhfmtuwKAz/UooDi
 4I5dWmIquQs1iuonhSfzxrev4+t7Y5mDPxAjzqVzcBR0FzaXgDBHaOrMO
 OSuVDisLw+Ff5cnn9GWiZ5zo/DkEbrD+EhOsvR8zd2+uPwKaJ/9qWfSlk Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="300638970"
X-IronPort-AV: E=Sophos;i="5.96,268,1665471600"; d="scan'208";a="300638970"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2022 01:02:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="602146732"
X-IronPort-AV: E=Sophos;i="5.96,268,1665471600"; d="scan'208";a="602146732"
Received: from mirabhat-mobl1.amr.corp.intel.com (HELO [10.213.188.137])
 ([10.213.188.137])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2022 01:02:37 -0800
Message-ID: <4c8ffcd3-259e-f651-6f32-296896d8b4b7@linux.intel.com>
Date: Fri, 23 Dec 2022 09:02:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/4] drm/i915/gt: Remove platform comments from workarounds
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20221222082557.1364711-1-lucas.demarchi@intel.com>
 <20221222082557.1364711-2-lucas.demarchi@intel.com>
 <2cfeee8a-7b7e-c203-37b4-f7a502123a5a@linux.intel.com>
 <20221222155535.gmih2rurxlo2xuo5@ldmartin-desk2.lan>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221222155535.gmih2rurxlo2xuo5@ldmartin-desk2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/12/2022 15:55, Lucas De Marchi wrote:
> On Thu, Dec 22, 2022 at 10:27:00AM +0000, Tvrtko Ursulin wrote:
>>
>> On 22/12/2022 08:25, Lucas De Marchi wrote:
>>> The comments are redundant to the checks being done to apply the
>>> workarounds and very often get outdated as workarounds need to be
>>> extended to new platforms or steppings.  Remove them altogether with
>>> the following matches (platforms extracted from intel_workarounds.c):
>>>
>>>     find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
>>>         
>>> 's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*/\1/'
>>>     find drivers/gpu/drm/i915/gt/ -name '*.c' | xargs sed -i -E \
>>>         
>>> 's/(Wa.*):(bdw|chv|bxt|glk|skl|kbl|cfl|cfl|whl|cml|aml|chv|cl|bw|ctg|elk|ilk|snb|dg|pvc|g4x|ilk|gen|glk|kbl|cml|glk|kbl|cml|hsw|icl|ehl|ivb|hsw|ivb|vlv|kbl|pvc|rkl|dg|adl|skl|skl|bxt|blk|cfl|cnl|glk|snb|tgl|vlv|xehpsdv).*\*\//\1
>>>
>>> Same things was executed in the gem directory, omitted here for brevity.
>>
>>> There were a few false positives that included the workaround
>>> description. Those were manually patched.
>>
>> sed -E 's/(Wa[a-zA-Z0-9_]+)[:,]([a-zA-Z0-9,-_\+\[]{2,})/\1/'
> 
> then there are false negatives. We have Was in the form
> "Wa_xxx:tgl,dg2, mtl". False positives we can fixup, false negatives
> we simply don't see. After running that in gt/:
> 
> $ git grep ": mtl" -- drivers/gpu/drm/i915/
> drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> drivers/gpu/drm/i915/gt/intel_gt_pm.c:  /* Wa_14017073508: mtl */
> drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c:       * Wa_14017073508: mtl
> drivers/gpu/drm/i915/i915_reg.h:/* Wa_14017210380: mtl */
> 
> I was going with the platform names to avoid the false
> negatives and because I was entertaining the idea of only doing this for
> latest platforms where we do have the "Wa_[[:number:]]" form
> 
>>
>> Maybe..
>>
>> Matt recently said he has this worked planned, but more importantly - 
>> I gather then that the WA lookup tool definitely does not output these 
>> strings?
> 
> Whatever it does it's true only at the time it's called. It simply tells 
> what
> are the platforms and steppings the Wa applies to. We can change the
> output to whatever we want, but that is not the point.
> Those comments get stale and bring no real value as they match 1:1
> what the code is supposed to be doing. Several times a patch has to
> update just that comment to "extend a workaround" to a next platform.
> This is not always done, so we get a comment that doesn't match what is
> supposed to be there.

Tl;dr; version - lets park this until January and discuss once everyone 
is back.

Longer version. I've been trying to get us talking about this a couple 
times before and I'd really like to close with an explicit consensus, 
discussion points addressed instead of skipped and just moving ahead 
with patches.

References:
   3fcf71b9-337f-6186-7b00-27cbfd116743@linux.intel.com
   Y5j0b/bykbitCa4Q@mdroper-desk1.amr.corp.intel.com

So point I wanted to discuss is whether these comments are truly useless 
or maybe they can help during review. If the tool can actually output 
them then I am leaning towards that they can be.

Thought is, when a patch comes for review adding a new platform, 
stepping, whatever, to an existing if condition, if it contains the 
comments reviewer can more easily spot a hyphotetical logic inversion 
error or similar. It is also trivial to check that both condition and 
comment have been updated. (So lets not be rash and remove something 
maybe useful just because it can go stale *only if* reviewers are not 
giving sufficient attention that changes are made in tandem.)

 From a slightly different angle - do we expect anyone reviewing 
workaround patches will cross-check against the tool? Would it be 
simpler and more efficient that they could just cross-check against the 
comment output from the tool and put into the patch by the author?

And point here to stress out is that accidental logic errors (missed 
workarounds) can be super expensive to debug in the field. Sometimes it 
can literally take _months_ for sporadic and hard to reproduce issues to 
get debugged, handed over between the teams, etc. So any way in which we 
can influence the likelyhood of that happening is something to weigh 
carefully.

Secondary but also important - if i915 is end of line then an extra why 
we want to rip out this for ancient platforms. Is the cost/benefit 
positive there?

As a side note, and going back to the question of what the tool can 
output. Long time ago I had an idea where we could improve all this by 
making it completely data-driven. Have the WA database inspecting tool 
output a table which could be directly pasted into code and interpreted 
by i915.

For reference look at intel_workarounds_table.h in 
https://patchwork.freedesktop.org/patch/399377/?series=83580&rev=3 and 
see what you thing. That was just a sketch of the idea, not complete, 
and yes, i915 end of life point makes it moot.

Regards,

Tvrtko
