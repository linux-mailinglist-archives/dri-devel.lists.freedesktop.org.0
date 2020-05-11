Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F271CD563
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 11:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1B66E25B;
	Mon, 11 May 2020 09:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B346E25B;
 Mon, 11 May 2020 09:37:03 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id k133so14339151oih.12;
 Mon, 11 May 2020 02:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=22vKbxGNsiWZ2IBSP8WLC1U/nWrORH0rvsSsTyvQNUY=;
 b=NlWCo7dP/VWuLfWFdFpzGMrV/pRiSGLxiW3StDcnOyZmQN6A9Bo+mt7HtKIxnbyb6O
 B8AODeAWxDTon/SfhHFqtbftk7/4PBAtisXRVFzy741HpZy9IPiF9cB2mD2Ya5YgqZXP
 +87UId71b74B5yjf3GPRANw9E1YJCdjRX8KDQr7shkLs+jfWI+OBsUBxLcs7mzOy7YYJ
 ywqwXwg195c6oAZokkPSacE5AUF6ee09oxXDQ4jcwuzoBPpsIuLrPKqAih6S6KqileaB
 HIjrM8/kIXAzo//UG6HWjEYL0RIDomANSO8k/Q4VxaM5ShEpBqzdVNbpJWPV8pqoOOaD
 ootA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=22vKbxGNsiWZ2IBSP8WLC1U/nWrORH0rvsSsTyvQNUY=;
 b=rGUjA42LbpeREkFwqrrcQmKER4w15QB3AhRUNfOan1a3ESH1SYA/o0F+jLr9qdM+h9
 shrUrw+7kck48zErbHBipbgT3jrGVNfc8M0lpdUCvde1dDV8OQC2FytcErGJlnxXyGW6
 hED7WXYO7Kc0bZLypeijzZPDBrNecLJ5EypNuImlNeEcOCNziIkNy+XUUsrkUzr1VkiS
 YxrcvcnwJWfn5BrunMR9h4t/rJ9XasSYBmyO4pLq3md6JoXP0B9Rvrn1GD3sfGw4V5Om
 4RlDTeM+F3e0jOyyYHKHQ25cQqW6AGajCwtdFHWeB53hw4KDfQKc3hnHNcYhoBqHy09i
 q6aw==
X-Gm-Message-State: AGi0PuYdSes/JPAZpthA2BeJIo8bVZSHYJNmueSgTcWNNc2qXdAwhOer
 fRiD/dHPYBuIqqQgalEAhZ7NcMnVupSWy+2NpYk=
X-Google-Smtp-Source: APiQypItVNPD5CU0V3ko73rD3gop/ALAVZC9z5N0O6VQktyi+IqeOBVFv0YirK83X6veZdCfSKOn3G7NXIZF7PpTQHY=
X-Received: by 2002:aca:abd0:: with SMTP id
 u199mr18289341oie.130.1589189822681; 
 Mon, 11 May 2020 02:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
 <20200511091142.208787-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20200511091142.208787-3-daniel.vetter@ffwll.ch>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Mon, 11 May 2020 12:36:17 +0300
Message-ID: <CAFCwf10m14ModSuRbQAsWf5CSJvTeP7YRzcokD=o+m2Pa0TqKg@mail.gmail.com>
Subject: Re: [PATCH 3/3] misc/habalabs: don't set default fence_ops->wait
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 12:11 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> It's the default.
Thanks for catching that.

>
> Also so much for "we're not going to tell the graphics people how to
> review their code", dma_fence is a pretty core piece of gpu driver
> infrastructure. And it's very much uapi relevant, including piles of
> corresponding userspace protocols and libraries for how to pass these
> around.
>
> Would be great if habanalabs would not use this (from a quick look
> it's not needed at all), since open source the userspace and playing
> by the usual rules isn't on the table. If that's not possible (because
> it's actually using the uapi part of dma_fence to interact with gpu
> drivers) then we have exactly what everyone promised we'd want to
> avoid.

We don't use the uapi parts, we currently only using the fencing and
signaling ability of this module inside our kernel code. But maybe I
didn't understand what you request. You want us *not* to use this
well-written piece of kernel code because it is only used by graphics
drivers ?
I'm sorry but I don't get this argument, if this is indeed what you meant.

Oded

>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc:     Olof Johansson <olof@lixom.net>
> Cc: Oded Gabbay <oded.gabbay@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  drivers/misc/habanalabs/command_submission.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/misc/habanalabs/command_submission.c b/drivers/misc/habanalabs/command_submission.c
> index 409276b6374d..cc3ce759b6c3 100644
> --- a/drivers/misc/habanalabs/command_submission.c
> +++ b/drivers/misc/habanalabs/command_submission.c
> @@ -46,7 +46,6 @@ static const struct dma_fence_ops hl_fence_ops = {
>         .get_driver_name = hl_fence_get_driver_name,
>         .get_timeline_name = hl_fence_get_timeline_name,
>         .enable_signaling = hl_fence_enable_signaling,
> -       .wait = dma_fence_default_wait,
>         .release = hl_fence_release
>  };
>
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
