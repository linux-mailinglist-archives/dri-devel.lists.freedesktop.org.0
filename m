Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F55344CF3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 18:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8896E52F;
	Mon, 22 Mar 2021 17:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1506E02C;
 Mon, 22 Mar 2021 17:13:10 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id u7so12872385qtq.12;
 Mon, 22 Mar 2021 10:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BLyVBMNLdqNiDr2ooYFWGn3kB4Kw2xbAi0fQx+YUokM=;
 b=YNpiDEbXXcgmIz+zUTorVwwPKhl1pQ2CaNF+Qk4NOCRcRgxyBtqvONcUzQX7f/D/t/
 COYI0YhsHpZnQhzPiVgu3JdFAoB0KpdrEHPqqqbrrpm6XssaOePVQuK4JW9lkS9sogvf
 p9+ouJiAuiq8wjzuT9hY+9wBfnL3/M6+undTUYBIIeYuz0uSh6uyyD9krcbC1tvuoc0x
 nbp8Iuwv1VIJw9oYFoouCjlN4UBPpiQSSWT4yvKSOcF2qwNnKnD6j/RSBZT7Nam3YmgA
 7fKsMenBK/1VKRGMJsoRtQOhzzmksJh141Vkx/eWcIsfIU5OjfbBzWxAQor/Iu2oecON
 pQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BLyVBMNLdqNiDr2ooYFWGn3kB4Kw2xbAi0fQx+YUokM=;
 b=R04cibUNG2HYfJnZ6oTVuCcV7Oz4ka63e3znF8aBtWvittKKGsR+ACAGkJY/uUiwf6
 sLfxqYblt0d6e9xIkelhUyx77YsYpuGs4gVhTGtq6YKtXnJCRZYDBASF25BFWXlsxAlT
 wSTNo25rMD+8mQSKvwI/jSrIX5/HhkzXXFb+T03PXIHSekcXjMGsSvzqZuvUQvIzR8Bd
 Xmy9Jnc3ResgJV3D6p5G/ildwQ8WzMwyHEJ1xwlAm0Qw0KVd7hAhco+yj82Jlqmt8I8N
 7jC0WsL8kd/vrLtYj7DdI1s7dIj4LBeoiNfIsbSYCwedWVCCl5WMFEckW2j7NhEKnYgt
 1xag==
X-Gm-Message-State: AOAM532oa4VTqLT8Qr4pxDKp1wVxvUh23kPB97R28ZMoQC9o4kXxXT7p
 EFTyVdblkarWpMbNaheNZaEsMorBK7DHhiSb8Gs=
X-Google-Smtp-Source: ABdhPJzg64T1oVx3aj65RS72WN6BUr0UpShaKsEqN9gTa6u4nyzTUj33d+htaJZbQ2axtuBJOqYxsRlJrwkfw2lJbOE=
X-Received: by 2002:ac8:7dc2:: with SMTP id c2mr817464qte.341.1616433189739;
 Mon, 22 Mar 2021 10:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210318170419.2107512-1-tvrtko.ursulin@linux.intel.com>
 <20210318170419.2107512-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210318170419.2107512-3-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 22 Mar 2021 17:12:43 +0000
Message-ID: <CAM0jSHMDqo6tJrwSt3V_nbb5h8QYi-co6c3CxCri=q+xDE1CSw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 2/6] drm/i915: Restrict sentinel requests
 further
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Mar 2021 at 17:04, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Disallow sentinel requests follow previous sentinels to make request
> cancellation work better when faced with a chain of requests which have
> all been marked as in error.

Could you elaborate some more on why this makes request cancellation
work better?

>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 4c2acb5a6c0a..4b870eca9693 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -896,7 +896,7 @@ static bool can_merge_rq(const struct i915_request *prev,
>         if (__i915_request_is_complete(next))
>                 return true;
>
> -       if (unlikely((i915_request_flags(prev) ^ i915_request_flags(next)) &
> +       if (unlikely((i915_request_flags(prev) | i915_request_flags(next)) &
>                      (BIT(I915_FENCE_FLAG_NOPREEMPT) |
>                       BIT(I915_FENCE_FLAG_SENTINEL))))
>                 return false;
> --
> 2.27.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
