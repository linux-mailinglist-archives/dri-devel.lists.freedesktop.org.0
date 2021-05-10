Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA763779D5
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 03:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F4D6E3FC;
	Mon, 10 May 2021 01:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492106E3A0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 01:36:21 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id b21so3072441vkb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 09 May 2021 18:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version;
 bh=Yr0YcEnzOTdRC6npBvC9/4mwsE4tyWTvZKotpewuYM4=;
 b=N7MpMjhpQkngHR9QbNXr5hI1k/KKQU6tN+Tmj/KRdX9C7J+PSJbzvwfAa5uLm6nvAU
 1JsAAwTfgVjvJYQYug8d18DVFzWDQNDOhjM++uEwqAvEMfq4t6yz0xeO5LjejRzDjO4Q
 FabTydt+fBJZhU1VzyzM1fJD7V+Wo5e7xsJT08xbRctb6FN3oWdJlS0mb72Hv1z2HVfw
 K16MV6gKbuLtEfDeOUJiB9T34zdGBLyH4XAAHQLUKA7KBA6Z+eSYeYMlR67nIdQ4z0O/
 I4B5UEKjk+AtsEFDt4G6XCcYUAxI3dPlKIiV/A4Kbc/tuQ4FVrk7FOPtI6Q1CarKYe46
 UAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version;
 bh=Yr0YcEnzOTdRC6npBvC9/4mwsE4tyWTvZKotpewuYM4=;
 b=cRYY6HlF/LKQnFhvhYxHWvIBeH8IyodWUO4EGYM3+HnD1JwNKA1YLTuBaXxypFSTfP
 NeSuERPlAtDV65+tdw5sx47be579CwEOTaJ/BMC6AzKpuTHsP5AFfX4QTYkYqcFoLuJu
 ZX51zuiWKK7B0AjTbQMpFRz5yEFP+qod6wErsqsRXxD3YMzshGmz88QvgQvLTw6B21l5
 rkdifjRNXFCOTcBICZHmuzvmxUY9tinkWwSwefbD9QwJz4pjFxafwRUEVmiNxlI2JARJ
 Tu/Qrs4ZLokLukKJgvfKkJ/29dgg4CHGoISO+kMzDZ5tJhuqeTTRXiGwQVbN6+Evxth5
 jBqQ==
X-Gm-Message-State: AOAM53259K4Ncf96gnYeoGtENmucynd2MS35xFYsGahheR2zjM8hUEQV
 JH4pvIBltpGWydRIAZwpKdSS4w==
X-Google-Smtp-Source: ABdhPJyP/Cde4+yi1e0p9+FlKKC50V2naxq7f5xJMTHC8QEyPqyqP5zxjXG1gcHQwbT0Z1ZBBdyS/A==
X-Received: by 2002:a1f:9352:: with SMTP id v79mr13985293vkd.4.1620610580052; 
 Sun, 09 May 2021 18:36:20 -0700 (PDT)
Received: from [100.79.42.25] ([209.107.177.191])
 by smtp.gmail.com with ESMTPSA id a6sm1587511vsd.33.2021.05.09.18.36.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 May 2021 18:36:19 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-gfx@lists.freedesktop.org>
Date: Sun, 09 May 2021 20:36:16 -0500
Message-ID: <17953eaee80.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <20210507083521.2406201-1-tvrtko.ursulin@linux.intel.com>
References: <20210507083521.2406201-1-tvrtko.ursulin@linux.intel.com>
User-Agent: AquaMail/1.29.1-1808 (build: 102900007)
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Stop propagating fence errors by
 default
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="17953eaefe26e032817b5edfb0"
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
Cc: Jason Ekstrand <jason.ekstrand@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--17953eaefe26e032817b5edfb0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On May 7, 2021 03:35:33 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:

> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> This is an alternative proposed fix for the below references bug report
> where dma fence error propagation is causing undesirable change in
> behaviour post GPU hang/reset.
>
> Approach in this patch is to simply stop propagating all dma fence errors
> by default since that seems to be the upstream ask.
>
> To handle the case where i915 needs error propagation for security, I add
> a new dma fence flag DMA_FENCE_FLAG_PROPAGATE_ERROR and make use of it in
> the command parsing chain only.

This sounds plausible. I can't review in full without doing a thorough 
audit of the surrounding code, though. I'll try to get to that next week if 
Daniel doesn't beat me to it. Thanks for working on this!

--Jason


> It sounds a plausible argument that fence propagation could be useful in
> which case a core flag to enable opt-in should be universally useful.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reported-by: Marcin Slusarz <marcin.slusarz@intel.com>
> Reported-by: Miroslav Bendik
> References: 9e31c1fe45d5 ("drm/i915: Propagate errors on awaiting already 
> signaled fences")
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/3080
> Cc: Jason Ekstrand <jason.ekstrand@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 ++
> drivers/gpu/drm/i915/i915_sw_fence.c           | 8 ++++----
> drivers/gpu/drm/i915/i915_sw_fence.h           | 8 ++++++++
> include/linux/dma-fence.h                      | 1 +
> 4 files changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c 
> b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 297143511f99..6a516d1261d0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2522,6 +2522,8 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
>  }
>
>  dma_fence_work_init(&pw->base, &eb_parse_ops);
> + /* Propagate errors for security. */
> + __set_bit(DMA_FENCE_FLAG_PROPAGATE_ERROR, &pw->base.dma.flags);
>
>  pw->engine = eb->engine;
>  pw->batch = eb->batch->vma;
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c 
> b/drivers/gpu/drm/i915/i915_sw_fence.c
> index 2744558f3050..2ee917932ccf 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.c
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.c
> @@ -449,7 +449,7 @@ static void dma_i915_sw_fence_wake_timer(struct 
> dma_fence *dma,
>
>  fence = xchg(&cb->base.fence, NULL);
>  if (fence) {
> - i915_sw_fence_set_error_once(fence, dma->error);
> + i915_sw_fence_propagate_dma_fence_error(fence, dma);
>  i915_sw_fence_complete(fence);
>  }
>
> @@ -480,7 +480,7 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence 
> *fence,
>  might_sleep_if(gfpflags_allow_blocking(gfp));
>
>  if (dma_fence_is_signaled(dma)) {
> - i915_sw_fence_set_error_once(fence, dma->error);
> + i915_sw_fence_propagate_dma_fence_error(fence, dma);
>  return 0;
>  }
>
> @@ -496,7 +496,7 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence 
> *fence,
>  if (ret)
>  return ret;
>
> - i915_sw_fence_set_error_once(fence, dma->error);
> + i915_sw_fence_propagate_dma_fence_error(fence, dma);
>  return 0;
>  }
>
> @@ -548,7 +548,7 @@ int __i915_sw_fence_await_dma_fence(struct 
> i915_sw_fence *fence,
>  debug_fence_assert(fence);
>
>  if (dma_fence_is_signaled(dma)) {
> - i915_sw_fence_set_error_once(fence, dma->error);
> + i915_sw_fence_propagate_dma_fence_error(fence, dma);
>  return 0;
>  }
>
> diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h 
> b/drivers/gpu/drm/i915/i915_sw_fence.h
> index 30a863353ee6..872ef80ebd10 100644
> --- a/drivers/gpu/drm/i915/i915_sw_fence.h
> +++ b/drivers/gpu/drm/i915/i915_sw_fence.h
> @@ -116,4 +116,12 @@ i915_sw_fence_set_error_once(struct i915_sw_fence 
> *fence, int error)
>  cmpxchg(&fence->error, 0, error);
> }
>
> +static inline void
> +i915_sw_fence_propagate_dma_fence_error(struct i915_sw_fence *fence,
> + struct dma_fence *dma)
> +{
> + if (unlikely(test_bit(DMA_FENCE_FLAG_PROPAGATE_ERROR, &dma->flags)))
> + i915_sw_fence_set_error_once(fence, dma->error);
> +}
> +
> #endif /* _I915_SW_FENCE_H_ */
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 6ffb4b2c6371..8dabe1650f11 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
>  DMA_FENCE_FLAG_SIGNALED_BIT,
>  DMA_FENCE_FLAG_TIMESTAMP_BIT,
>  DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> + DMA_FENCE_FLAG_PROPAGATE_ERROR,
>  DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
> };
>
> --
> 2.30.2
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx


--17953eaefe26e032817b5edfb0
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><span style=3D"font-size: 12pt;">On May 7, 2021 03:35:33 =
Tvrtko Ursulin &lt;tvrtko.ursulin@linux.intel.com&gt; wrote:</span></div><d=
iv id=3D"aqm-original" style=3D"color: black;">
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">From: Tvrtko Ursulin &lt;tvrtko.ursulin@intel.com&gt;</di=
v>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">This is an alternative proposed fix for the below referen=
ces bug report</div>
<div dir=3D"auto">where dma fence error propagation is causing undesirable =
change in</div>
<div dir=3D"auto">behaviour post GPU hang/reset.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Approach in this patch is to simply stop propagating all =
dma fence errors</div>
<div dir=3D"auto">by default since that seems to be the upstream ask.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">To handle the case where i915 needs error propagation for=
 security, I add</div>
<div dir=3D"auto">a new dma fence flag DMA_FENCE_FLAG_PROPAGATE_ERROR and m=
ake use of it in</div>
<div dir=3D"auto">the command parsing chain only.</div></blockquote></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">This sounds plausible. I can't=
 review in full without doing a thorough audit of the surrounding code, tho=
ugh. I'll try to get to that next week if Daniel doesn't beat me to it. Tha=
nks for working on this!</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>--Jason</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div =
id=3D"aqm-original" style=3D"color: black;" dir=3D"auto"><blockquote type=
=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75ex; border-left:=
 1px solid #808080; padding-left: 0.75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto">It sounds a plausible argument that fence propagation cou=
ld be useful in</div>
<div dir=3D"auto">which case a core flag to enable opt-in should be univers=
ally useful.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Signed-off-by: Tvrtko Ursulin &lt;tvrtko.ursulin@intel.co=
m&gt;</div>
<div dir=3D"auto">Reported-by: Marcin Slusarz &lt;marcin.slusarz@intel.com&=
gt;</div>
<div dir=3D"auto">Reported-by: Miroslav Bendik</div>
<div dir=3D"auto">References: 9e31c1fe45d5 ("drm/i915: Propagate errors on =
awaiting already signaled fences")</div>
<div dir=3D"auto">References: https://gitlab.freedesktop.org/drm/intel/-/is=
sues/3080</div>
<div dir=3D"auto">Cc: Jason Ekstrand &lt;jason.ekstrand@intel.com&gt;</div>
<div dir=3D"auto">Cc: Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;</div>
<div dir=3D"auto">---</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 =
++</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/i915_sw_fence.c &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; | 8 ++++----</div>
<div dir=3D"auto">&nbsp;drivers/gpu/drm/i915/i915_sw_fence.h &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; | 8 ++++++++</div>
<div dir=3D"auto">&nbsp;include/linux/dma-fence.h &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 1 +</div>
<div dir=3D"auto">&nbsp;4 files changed, 15 insertions(+), 4 deletions(-)</=
div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer=
.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c</div>
<div dir=3D"auto">index 297143511f99..6a516d1261d0 100644</div>
<div dir=3D"auto">--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c</div=
>
<div dir=3D"auto">+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c</div=
>
<div dir=3D"auto">@@ -2522,6 +2522,8 @@ static int eb_parse_pipeline(struct=
 i915_execbuffer *eb,</div>
<div dir=3D"auto">&nbsp;=09}</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">&nbsp;=09dma_fence_work_init(&amp;pw-&gt;base, &amp;eb_pa=
rse_ops);</div>
<div dir=3D"auto">+=09/* Propagate errors for security. */</div>
<div dir=3D"auto">+=09__set_bit(DMA_FENCE_FLAG_PROPAGATE_ERROR, &amp;pw-&gt=
;base.dma.flags);</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">&nbsp;=09pw-&gt;engine =3D eb-&gt;engine;</div>
<div dir=3D"auto">&nbsp;=09pw-&gt;batch =3D eb-&gt;batch-&gt;vma;</div>
<div dir=3D"auto">diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drive=
rs/gpu/drm/i915/i915_sw_fence.c</div>
<div dir=3D"auto">index 2744558f3050..2ee917932ccf 100644</div>
<div dir=3D"auto">--- a/drivers/gpu/drm/i915/i915_sw_fence.c</div>
<div dir=3D"auto">+++ b/drivers/gpu/drm/i915/i915_sw_fence.c</div>
<div dir=3D"auto">@@ -449,7 +449,7 @@ static void dma_i915_sw_fence_wake_ti=
mer(struct dma_fence *dma,</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">&nbsp;=09fence =3D xchg(&amp;cb-&gt;base.fence, NULL);</d=
iv>
<div dir=3D"auto">&nbsp;=09if (fence) {</div>
<div dir=3D"auto">-=09=09i915_sw_fence_set_error_once(fence, dma-&gt;error)=
;</div>
<div dir=3D"auto">+=09=09i915_sw_fence_propagate_dma_fence_error(fence, dma=
);</div>
<div dir=3D"auto">&nbsp;=09=09i915_sw_fence_complete(fence);</div>
<div dir=3D"auto">&nbsp;=09}</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">@@ -480,7 +480,7 @@ int i915_sw_fence_await_dma_fence(str=
uct i915_sw_fence *fence,</div>
<div dir=3D"auto">&nbsp;=09might_sleep_if(gfpflags_allow_blocking(gfp));</d=
iv>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">&nbsp;=09if (dma_fence_is_signaled(dma)) {</div>
<div dir=3D"auto">-=09=09i915_sw_fence_set_error_once(fence, dma-&gt;error)=
;</div>
<div dir=3D"auto">+=09=09i915_sw_fence_propagate_dma_fence_error(fence, dma=
);</div>
<div dir=3D"auto">&nbsp;=09=09return 0;</div>
<div dir=3D"auto">&nbsp;=09}</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">@@ -496,7 +496,7 @@ int i915_sw_fence_await_dma_fence(str=
uct i915_sw_fence *fence,</div>
<div dir=3D"auto">&nbsp;=09=09if (ret)</div>
<div dir=3D"auto">&nbsp;=09=09=09return ret;</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-=09=09i915_sw_fence_set_error_once(fence, dma-&gt;error)=
;</div>
<div dir=3D"auto">+=09=09i915_sw_fence_propagate_dma_fence_error(fence, dma=
);</div>
<div dir=3D"auto">&nbsp;=09=09return 0;</div>
<div dir=3D"auto">&nbsp;=09}</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">@@ -548,7 +548,7 @@ int __i915_sw_fence_await_dma_fence(s=
truct i915_sw_fence *fence,</div>
<div dir=3D"auto">&nbsp;=09debug_fence_assert(fence);</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">&nbsp;=09if (dma_fence_is_signaled(dma)) {</div>
<div dir=3D"auto">-=09=09i915_sw_fence_set_error_once(fence, dma-&gt;error)=
;</div>
<div dir=3D"auto">+=09=09i915_sw_fence_propagate_dma_fence_error(fence, dma=
);</div>
<div dir=3D"auto">&nbsp;=09=09return 0;</div>
<div dir=3D"auto">&nbsp;=09}</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drive=
rs/gpu/drm/i915/i915_sw_fence.h</div>
<div dir=3D"auto">index 30a863353ee6..872ef80ebd10 100644</div>
<div dir=3D"auto">--- a/drivers/gpu/drm/i915/i915_sw_fence.h</div>
<div dir=3D"auto">+++ b/drivers/gpu/drm/i915/i915_sw_fence.h</div>
<div dir=3D"auto">@@ -116,4 +116,12 @@ i915_sw_fence_set_error_once(struct =
i915_sw_fence *fence, int error)</div>
<div dir=3D"auto">&nbsp;=09=09cmpxchg(&amp;fence-&gt;error, 0, error);</div=
>
<div dir=3D"auto">&nbsp;}</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">+static inline void</div>
<div dir=3D"auto">+i915_sw_fence_propagate_dma_fence_error(struct i915_sw_f=
ence *fence,</div>
<div dir=3D"auto">+=09=09=09=09=09struct dma_fence *dma)</div>
<div dir=3D"auto">+{</div>
<div dir=3D"auto">+=09if (unlikely(test_bit(DMA_FENCE_FLAG_PROPAGATE_ERROR,=
 &amp;dma-&gt;flags)))</div>
<div dir=3D"auto">+=09=09i915_sw_fence_set_error_once(fence, dma-&gt;error)=
;</div>
<div dir=3D"auto">+}</div>
<div dir=3D"auto">+</div>
<div dir=3D"auto">&nbsp;#endif /* _I915_SW_FENCE_H_ */</div>
<div dir=3D"auto">diff --git a/include/linux/dma-fence.h b/include/linux/dm=
a-fence.h</div>
<div dir=3D"auto">index 6ffb4b2c6371..8dabe1650f11 100644</div>
<div dir=3D"auto">--- a/include/linux/dma-fence.h</div>
<div dir=3D"auto">+++ b/include/linux/dma-fence.h</div>
<div dir=3D"auto">@@ -99,6 +99,7 @@ enum dma_fence_flag_bits {</div>
<div dir=3D"auto">&nbsp;=09DMA_FENCE_FLAG_SIGNALED_BIT,</div>
<div dir=3D"auto">&nbsp;=09DMA_FENCE_FLAG_TIMESTAMP_BIT,</div>
<div dir=3D"auto">&nbsp;=09DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,</div>
<div dir=3D"auto">+=09DMA_FENCE_FLAG_PROPAGATE_ERROR,</div>
<div dir=3D"auto">&nbsp;=09DMA_FENCE_FLAG_USER_BITS, /* must always be last=
 member */</div>
<div dir=3D"auto">&nbsp;};</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">--&nbsp;</div>
<div dir=3D"auto">2.30.2</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">_______________________________________________</div>
<div dir=3D"auto">Intel-gfx mailing list</div>
<div dir=3D"auto">Intel-gfx@lists.freedesktop.org</div>
<div dir=3D"auto">https://lists.freedesktop.org/mailman/listinfo/intel-gfx<=
/div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--17953eaefe26e032817b5edfb0--

