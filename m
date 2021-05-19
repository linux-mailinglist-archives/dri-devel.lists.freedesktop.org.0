Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C2338960E
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 21:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55B56EE5D;
	Wed, 19 May 2021 19:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC576EE5B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 19:01:11 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 s24-20020a4aead80000b02901fec6deb28aso3231055ooh.11
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 12:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:date:message-id:in-reply-to:references:user-agent
 :subject:mime-version;
 bh=U5hrAgd6HR1r8bgElc1ZgpeRNU/+O9T+k5xQsxqUdl8=;
 b=pVLO3pO6yZG3uL6Ui0n3ZcMa3fCMZQdf+sX5n+AmjlauqBoP/W5UXIys3Nvz/A6kPp
 ZDTZhRt2h1nWsI4HV2f51cjolQIchSyZi6IX6k4MfTNLQ081Tcc3GNnrsgieowgEEEvv
 T3W5ZFKQBpPNwC1HqKW/QEX8QrkUJAtzu+zDcjfMR4F18zfobyY/1/El7wde6oIUFUD9
 XzRJ4NQHETlb6g0Q63he/X2+odfPziuaeP1r2gX1gHeyt9RenPHVC1vt8T19R3UL1nog
 /oXJJoGSXSkLySFLTa4pEwSWQ0ukcO8ZDPk+FLbzkFbnGG8hfJEThWi7gr986d9WlMgQ
 9Fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:subject:mime-version;
 bh=U5hrAgd6HR1r8bgElc1ZgpeRNU/+O9T+k5xQsxqUdl8=;
 b=VkbaiZZyor/qJswyqbX+4bqNjWkDmPjJuGlDso/lApkJM/6thGIL/XFBN/qlkUlwDx
 a8zs7YxamFG3/B2RNTVDe8E6l7MTZas7fZpg3t4ZXkD1/LX2Ia3z4kWOEnD4LYS0wxnD
 hmyLzw8is4Pm4t1GtL8hoSuMhZvx8tvm35eAfPv1JH4k9R6952GCrWSLWHj1vARekrpE
 sgF5oOV6ebu9vEc0buLKf3Ymigu3PKhaQUZMdssAFnYdbVD49iV3mW2qxK2xQIXgqPip
 A7rV68UvNTds8cZeDiwlOq1irehcbPUnF42i5qQvjp8fMyhd97sqJvN1grlpyp/yM4oO
 ckuw==
X-Gm-Message-State: AOAM531FkhCj3KozB9+BARjwTcbR5EX/ZIS+ClzTA7iVhD9XfBpVgp4b
 I8tWWRMLFaC70EYSTW+ZDV6pYQ==
X-Google-Smtp-Source: ABdhPJywTJWJWxEX86AdpMQPvXjaFJRCsnDVqfu6eb4R07oOiK8ZGS7C/FWFNbX07llhq8josA4UZg==
X-Received: by 2002:a4a:c88f:: with SMTP id t15mr657518ooq.84.1621450870405;
 Wed, 19 May 2021 12:01:10 -0700 (PDT)
Received: from [100.68.235.67] ([209.107.186.38])
 by smtp.gmail.com with ESMTPSA id c32sm111200otu.13.2021.05.19.12.01.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 May 2021 12:01:09 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 May 2021 14:01:07 -0500
Message-ID: <1798600adb0.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
In-Reply-To: <CAKMK7uFAXBU6Ot8xJkrXBVppnWi058pEyMjNOAChtepgcCKsrw@mail.gmail.com>
References: <20210519074323.665872-2-daniel.vetter@ffwll.ch>
 <20210519101523.688398-1-daniel.vetter@ffwll.ch>
 <CAOFGe968OKdHu9BL0hU6KWM3J5Fc6popg4GJ5kEDd-3bf4HjJw@mail.gmail.com>
 <CAKMK7uFAXBU6Ot8xJkrXBVppnWi058pEyMjNOAChtepgcCKsrw@mail.gmail.com>
User-Agent: AquaMail/1.29.1-1808 (build: 102900007)
Subject: Re: [PATCH] Revert "drm/i915: Propagate errors on awaiting already
 signaled fences"
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="1798600c2d62f9a2817109ae8f"
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>, Jason Ekstrand <jason.ekstrand@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Marcin Slusarz <marcin.slusarz@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--1798600c2d62f9a2817109ae8f
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On May 19, 2021 12:16:15 Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Wed, May 19, 2021 at 5:06 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>>
>> Once we no longer rely on error propagation, I think there's a lot we
>> can rip out.
>
> I honestly did not find that much ... what did you uncover?

When I was digging through this earlier today, I think I convinced myself 
that the cmdparser is the only user of the entire fence error architecture. 
I may have missed something, though.

--Jason

>
> -Daniel
>
>>
>> --Jason
>>
>> On Wed, May 19, 2021 at 5:15 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>>
>>> From: Jason Ekstrand <jason@jlekstrand.net>
>>>
>>> This reverts commit 9e31c1fe45d555a948ff66f1f0e3fe1f83ca63f7.  Ever
>>> since that commit, we've been having issues where a hang in one client
>>> can propagate to another.  In particular, a hang in an app can propagate
>>> to the X server which causes the whole desktop to lock up.
>>>
>>> Error propagation along fences sound like a good idea, but as your bug
>>> shows, surprising consequences, since propagating errors across security
>>> boundaries is not a good thing.
>>>
>>> What we do have is track the hangs on the ctx, and report information to
>>> userspace using RESET_STATS. That's how arb_robustness works. Also, if my
>>> understanding is still correct, the EIO from execbuf is when your context
>>> is banned (because not recoverable or too many hangs). And in all these
>>> cases it's up to userspace to figure out what is all impacted and should
>>> be reported to the application, that's not on the kernel to guess and
>>> automatically propagate.
>>>
>>> What's more, we're also building more features on top of ctx error
>>> reporting with RESET_STATS ioctl: Encrypted buffers use the same, and the
>>> userspace fence wait also relies on that mechanism. So it is the path
>>> going forward for reporting gpu hangs and resets to userspace.
>>>
>>> So all together that's why I think we should just bury this idea again as
>>> not quite the direction we want to go to, hence why I think the revert is
>>> the right option here.Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>
>>>
>>> v2: Augment commit message. Also restore Jason's sob that I
>>> accidentally lost.
>>>
>>> Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com> (v1)
>>> Reported-by: Marcin Slusarz <marcin.slusarz@intel.com>
>>> Cc: <stable@vger.kernel.org> # v5.6+
>>> Cc: Jason Ekstrand <jason.ekstrand@intel.com>
>>> Cc: Marcin Slusarz <marcin.slusarz@intel.com>
>>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3080
>>> Fixes: 9e31c1fe45d5 ("drm/i915: Propagate errors on awaiting already 
>>> signaled fences")
>>> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> ---
>>> drivers/gpu/drm/i915/i915_request.c | 8 ++------
>>> 1 file changed, 2 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_request.c 
>>> b/drivers/gpu/drm/i915/i915_request.c
>>> index 970d8f4986bb..b796197c0772 100644
>>> --- a/drivers/gpu/drm/i915/i915_request.c
>>> +++ b/drivers/gpu/drm/i915/i915_request.c
>>> @@ -1426,10 +1426,8 @@ i915_request_await_execution(struct i915_request *rq,
>>>
>>>  do {
>>>          fence = *child++;
>>> -               if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
>>> -                       i915_sw_fence_set_error_once(&rq->submit, 
>>> fence->error);
>>> +               if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>                  continue;
>>> -               }
>>>
>>>          if (fence->context == rq->fence.context)
>>>                  continue;
>>> @@ -1527,10 +1525,8 @@ i915_request_await_dma_fence(struct i915_request 
>>> *rq, struct dma_fence *fence)
>>>
>>>  do {
>>>          fence = *child++;
>>> -               if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
>>> -                       i915_sw_fence_set_error_once(&rq->submit, 
>>> fence->error);
>>> +               if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>                  continue;
>>> -               }
>>>
>>>          /*
>>>           * Requests on the same timeline are explicitly ordered, along
>>> --
>>> 2.31.0
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


--1798600c2d62f9a2817109ae8f
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><span style=3D"font-size: 12pt;">On May 19, 2021 12:16:15=
 Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt; wrote:</span></div><div id=3D=
"aqm-original" style=3D"color: black;">
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">On Wed, May 19, 2021 at 5:06 PM Jason Ekstrand &lt;jason@=
jlekstrand.net&gt; wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Once we no longer rely on error propagation, I think ther=
e's a lot we</div>
<div dir=3D"auto">can rip out.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I honestly did not find that much ... what did you uncove=
r?</div></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">Wh=
en I was digging through this earlier today, I think I convinced myself tha=
t the cmdparser is the only user of the entire fence error architecture. I =
may have missed something, though.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">--Jason</div><div dir=3D"auto"><br></div><div id=3D"aqm-original=
" style=3D"color: black;" dir=3D"auto"><blockquote type=3D"cite" class=3D"g=
mail_quote" style=3D"margin: 0 0 0 0.75ex; border-left: 1px solid #808080; =
padding-left: 0.75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto">-Daniel</div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">--Jason</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On Wed, May 19, 2021 at 5:15 AM Daniel Vetter &lt;daniel.=
vetter@ffwll.ch&gt; wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #9933CC; padding-left: 0.75ex;">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">From: Jason Ekstrand &lt;jason@jlekstrand.net&gt;</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">This reverts commit 9e31c1fe45d555a948ff66f1f0e3fe1f83ca6=
3f7. &nbsp;Ever</div>
<div dir=3D"auto">since that commit, we've been having issues where a hang =
in one client</div>
<div dir=3D"auto">can propagate to another. &nbsp;In particular, a hang in =
an app can propagate</div>
<div dir=3D"auto">to the X server which causes the whole desktop to lock up=
.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Error propagation along fences sound like a good idea, bu=
t as your bug</div>
<div dir=3D"auto">shows, surprising consequences, since propagating errors =
across security</div>
<div dir=3D"auto">boundaries is not a good thing.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">What we do have is track the hangs on the ctx, and report=
 information to</div>
<div dir=3D"auto">userspace using RESET_STATS. That's how arb_robustness wo=
rks. Also, if my</div>
<div dir=3D"auto">understanding is still correct, the EIO from execbuf is w=
hen your context</div>
<div dir=3D"auto">is banned (because not recoverable or too many hangs). An=
d in all these</div>
<div dir=3D"auto">cases it's up to userspace to figure out what is all impa=
cted and should</div>
<div dir=3D"auto">be reported to the application, that's not on the kernel =
to guess and</div>
<div dir=3D"auto">automatically propagate.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">What's more, we're also building more features on top of =
ctx error</div>
<div dir=3D"auto">reporting with RESET_STATS ioctl: Encrypted buffers use t=
he same, and the</div>
<div dir=3D"auto">userspace fence wait also relies on that mechanism. So it=
 is the path</div>
<div dir=3D"auto">going forward for reporting gpu hangs and resets to users=
pace.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">So all together that's why I think we should just bury th=
is idea again as</div>
<div dir=3D"auto">not quite the direction we want to go to, hence why I thi=
nk the revert is</div>
<div dir=3D"auto">the right option here.Signed-off-by: Jason Ekstrand &lt;j=
ason.ekstrand@intel.com&gt;</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">v2: Augment commit message. Also restore Jason's sob that=
 I</div>
<div dir=3D"auto">accidentally lost.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Signed-off-by: Jason Ekstrand &lt;jason.ekstrand@intel.co=
m&gt; (v1)</div>
<div dir=3D"auto">Reported-by: Marcin Slusarz &lt;marcin.slusarz@intel.com&=
gt;</div>
<div dir=3D"auto">Cc: &lt;stable@vger.kernel.org&gt; # v5.6+</div>
<div dir=3D"auto">Cc: Jason Ekstrand &lt;jason.ekstrand@intel.com&gt;</div>
<div dir=3D"auto">Cc: Marcin Slusarz &lt;marcin.slusarz@intel.com&gt;</div>
<div dir=3D"auto">Cc: Jon Bloomfield &lt;jon.bloomfield@intel.com&gt;</div>
<div dir=3D"auto">Closes: https://gitlab.freedesktop.org/drm/intel/-/issues=
/3080</div>
<div dir=3D"auto">Fixes: 9e31c1fe45d5 ("drm/i915: Propagate errors on await=
ing already signaled fences")</div>
<div dir=3D"auto">Signed-off-by: Daniel Vetter &lt;daniel.vetter@ffwll.ch&g=
t;</div>
<div dir=3D"auto">---</div>
<div dir=3D"auto">drivers/gpu/drm/i915/i915_request.c | 8 ++------</div>
<div dir=3D"auto">1 file changed, 2 insertions(+), 6 deletions(-)</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/drivers/gpu/drm/i915/i915_request.c b/driver=
s/gpu/drm/i915/i915_request.c</div>
<div dir=3D"auto">index 970d8f4986bb..b796197c0772 100644</div>
<div dir=3D"auto">--- a/drivers/gpu/drm/i915/i915_request.c</div>
<div dir=3D"auto">+++ b/drivers/gpu/drm/i915/i915_request.c</div>
<div dir=3D"auto">@@ -1426,10 +1426,8 @@ i915_request_await_execution(struc=
t i915_request *rq,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp; do {</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fence =3D *child++;</d=
iv>
<div dir=3D"auto">- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (te=
st_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &amp;fence-&gt;flags)) {</div>
<div dir=3D"auto">- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; i915_sw_fence_set_error_once(&amp;rq-&gt;submit, fenc=
e-&gt;error);</div>
<div dir=3D"auto">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (te=
st_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &amp;fence-&gt;flags))</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; continue;</div>
<div dir=3D"auto">- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div=
>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (fence-&gt;context =
=3D=3D rq-&gt;fence.context)</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; continue;</div>
<div dir=3D"auto">@@ -1527,10 +1525,8 @@ i915_request_await_dma_fence(struc=
t i915_request *rq, struct dma_fence *fence)</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp; do {</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fence =3D *child++;</d=
iv>
<div dir=3D"auto">- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (te=
st_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &amp;fence-&gt;flags)) {</div>
<div dir=3D"auto">- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; i915_sw_fence_set_error_once(&amp;rq-&gt;submit, fenc=
e-&gt;error);</div>
<div dir=3D"auto">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (te=
st_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &amp;fence-&gt;flags))</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; continue;</div>
<div dir=3D"auto">- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div=
>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /*</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* Requests on th=
e same timeline are explicitly ordered, along</div>
<div dir=3D"auto">--</div>
<div dir=3D"auto">2.31.0</div>
<div dir=3D"auto"><br></div>
</blockquote>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">--&nbsp;</div>
<div dir=3D"auto">Daniel Vetter</div>
<div dir=3D"auto">Software Engineer, Intel Corporation</div>
<div dir=3D"auto">http://blog.ffwll.ch</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--1798600c2d62f9a2817109ae8f--

