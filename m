Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BEC6D7CBF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E573B10E93A;
	Wed,  5 Apr 2023 12:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5E610E933;
 Wed,  5 Apr 2023 12:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680698190; x=1712234190;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=ZyD0W+neSOSPM2dISqRC9I/wPeI9993pmEzbEm2/sBc=;
 b=ICaaCraPA7O8LXeWQ98f857qpWYfgPm868ULAm2i/R+uSL6k/fz2G9bD
 v+bLB84R+9qsTOlFo6tSvmK5jnbfopQNs3OGIhANF1Oe4LLB7XIXoXHXu
 V2vyHw2HbrmCXvID2srG8WqvV+RltNcJ/JgMnPfzxkOwqVzdQWjuJbdu3
 oLJue64yHbCc5g2MRyY5SEKHGcUWFjWWWq9wPUHTn71g4pOiLuR3x20OA
 nH/MP5d869ZiGYOXQUe/v/91ryWBaVVEVRG08YMuBTDyMMFhNIVCNmOuY
 HweJ/wJgYoX3mhFXI+8g83j1/31jFgfHof7CdiCI0uh/JIneHgqdpmitm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="322097304"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
 d="scan'208,217";a="322097304"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 05:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="776044317"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
 d="scan'208,217";a="776044317"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.41.195])
 ([10.252.41.195])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 05:36:22 -0700
Content-Type: multipart/alternative;
 boundary="------------wBj0Iivy6lBcpD0dc0Bew2aP"
Message-ID: <c8fe6f23-51e4-fb22-6fdb-999bf41f8dec@linux.intel.com>
Date: Wed, 5 Apr 2023 14:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/5] drm/i915/ttm: Add I915_BO_PREALLOC
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230404143100.10452-1-nirmoy.das@intel.com>
 <ZCxO9WeZHvINgMP8@ashyti-mobl2.lan>
 <6131a80c-a23c-ee17-3144-327b66f636bf@linux.intel.com>
 <ZC1hSRRKyU92kQ86@ashyti-mobl2.lan>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <ZC1hSRRKyU92kQ86@ashyti-mobl2.lan>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------wBj0Iivy6lBcpD0dc0Bew2aP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andi,

On 4/5/2023 1:53 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
>>>> Add a mechanism to keep existing data when creating
>>>> a ttm object with I915_BO_ALLOC_USER flag.
>>> why do we need this mechanism? What was the logic behind? These
>>> are all questions people might have when checking this commit.
>>> Please be a bit more explicative.
>>
>> Agree, the commit message is bit short. I will add more content in next
>> revision.
> you don't need to send a new version just for this commit log.
>
> You could just propose a new commit log in the reply and if it's
> OK, add it before pushing it.

Let me know what do you think about:

Add a mechanism to preserve existing data when creating a TTM

object with the I915_BO_ALLOC_USER flag. This will be used in the subsequent

patch where the I915_BO_ALLOC_USER flag will be applied to the framebuffer

object. For a pre-allocated framebuffer without the I915_BO_PREALLOC flag,

TTM would clear the content, which is not desirable.

Thanks,

Nirmoy

>
> As you wish.
>
> Andi
>
>>>> Cc: Matthew Auld<matthew.auld@intel.com>
>>>> Cc: Andi Shyti<andi.shyti@linux.intel.com>
>>>> Cc: Andrzej Hajda<andrzej.hajda@intel.com>
>>>> Cc: Ville Syrjälä<ville.syrjala@linux.intel.com>
>>>> Cc: Jani Nikula<jani.nikula@intel.com>
>>>> Cc: Imre Deak<imre.deak@intel.com>
>>>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>>> Reviewed-by: Andi Shyti<andi.shyti@linux.intel.com>
>>
>> Thanks,
>>
>> Nirmoy
>>
>>> Thanks,
>>> Andi
--------------wBj0Iivy6lBcpD0dc0Bew2aP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Andi,<br>
    </p>
    <div class="moz-cite-prefix">On 4/5/2023 1:53 PM, Andi Shyti wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZC1hSRRKyU92kQ86@ashyti-mobl2.lan">
      <pre class="moz-quote-pre" wrap="">Hi Nirmoy,

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Add a mechanism to keep existing data when creating
a ttm object with I915_BO_ALLOC_USER flag.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">why do we need this mechanism? What was the logic behind? These
are all questions people might have when checking this commit.
Please be a bit more explicative.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

Agree, the commit message is bit short. I will add more content in next
revision.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
you don't need to send a new version just for this commit log.

You could just propose a new commit log in the reply and if it's
OK, add it before pushing it.</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Let me know what do you think about: 
</pre>
    <pre><font face="monospace">Add a mechanism to preserve existing data when creating a TTM</font></pre>
    <pre><font face="monospace">object with the I915_BO_ALLOC_USER flag. This will be used in the subsequent</font></pre>
    <pre><font face="monospace">patch where the I915_BO_ALLOC_USER flag will be applied to the framebuffer</font></pre>
    <pre><font face="monospace">object. For a pre-allocated framebuffer without the I915_BO_PREALLOC flag,</font></pre>
    <pre><font face="monospace">TTM would clear the content, which is not desirable.</font></pre>
    <pre><font face="monospace">
</font></pre>
    <pre><font face="monospace">Thanks,</font></pre>
    <pre><font face="monospace">Nirmoy</font>
</pre>
    <blockquote type="cite" cite="mid:ZC1hSRRKyU92kQ86@ashyti-mobl2.lan">
      <pre class="moz-quote-pre" wrap="">

As you wish.

Andi

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
Cc: Andrzej Hajda <a class="moz-txt-link-rfc2396E" href="mailto:andrzej.hajda@intel.com">&lt;andrzej.hajda@intel.com&gt;</a>
Cc: Ville Syrjälä <a class="moz-txt-link-rfc2396E" href="mailto:ville.syrjala@linux.intel.com">&lt;ville.syrjala@linux.intel.com&gt;</a>
Cc: Jani Nikula <a class="moz-txt-link-rfc2396E" href="mailto:jani.nikula@intel.com">&lt;jani.nikula@intel.com&gt;</a>
Cc: Imre Deak <a class="moz-txt-link-rfc2396E" href="mailto:imre.deak@intel.com">&lt;imre.deak@intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Reviewed-by: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

Thanks,

Nirmoy

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Thanks,
Andi
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------wBj0Iivy6lBcpD0dc0Bew2aP--
