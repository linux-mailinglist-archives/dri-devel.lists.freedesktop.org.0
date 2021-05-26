Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C92390ED6
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 05:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCF96E484;
	Wed, 26 May 2021 03:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9457F6E484;
 Wed, 26 May 2021 03:26:31 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id b25so236975oic.0;
 Tue, 25 May 2021 20:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z2yP+ku7QrjLWJX/oew2T5TuLTAx5mCKhqruiqxpqcQ=;
 b=O3ljL1lRtGVQnjW8rsxilo9NnYYFVfvcU+/khpdunoVIfI4W84MTpwjJpkRuZbfsge
 3iRAMojK5fRFYnr8kf7Bnpgv3HdrtTrqKyui+mPtqtRCkxK+W3ULjS7ao6aDizRBrb1n
 ldhJJ/bd31Fjy/4L7em6LUoHtABC3P9AiHM2xocsyiCcWF+AcRdBDXGc4sque9YUFVx6
 3bR5etFDyuYjjlNQd6SGH4QGj5o8kS2QKh4rDugerss7iwrGzoxfdYpeq0DynpcFnxiJ
 URGMYAaPOXtt9HdNfEzwiOHrpiUP8UjG0ClNE7KwmJPxaU+7Q0QWbREmzQsd12xGANjo
 vmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z2yP+ku7QrjLWJX/oew2T5TuLTAx5mCKhqruiqxpqcQ=;
 b=LBPIyyqcL21m/atewRaOFaa3/+blGCqdMEYPStauc43HXXFBlyF5/4Zzmph799Y5S0
 PY+2+ccSflenCcDa9nUyCltqs49dUuccqMo9F7VCcm8dTSbQ7ZJTVg006MVGrpFSkMCv
 RMT0dq3T4A3pF4H4/OK2OhWVHiZAeXMyQCrmuJTTWXH1JJ8KfIE+G6RQWOctk/yBJQZV
 2FGyL8bJeFXPF/uNKvjn+0Yce4O8aGvJRUyt8v2TITJaXwVTLe2gEjOt1PuOrp70dgCg
 ZM+aa2JfpKZlBUxv9yfZ2W8RBrScjJGQ+eG+hHU2w2PimQD3Cz07RzLRCrTf65KbtXE8
 uvTw==
X-Gm-Message-State: AOAM531gLi01OdCK9aR6LFveguCwR5+7Qv8PFgqfOdwotYK0GVa6UdlX
 jvIc2JShO4dDDzytlnpM7G/ESL5txrVYdPYFnZU=
X-Google-Smtp-Source: ABdhPJxEn4U0hetnvUphpr602aW+SAytDbAyj62ON2cN8CxvAmsHRKjnWPf8sPqYl5WXvOCS/SkUjrUOINKlFV1GAME=
X-Received: by 2002:a05:6808:1592:: with SMTP id
 t18mr501125oiw.123.1621999590741; 
 Tue, 25 May 2021 20:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <1621997748-127963-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1621997748-127963-1-git-send-email-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 25 May 2021 23:26:19 -0400
Message-ID: <CADnq5_PseP5LDdLY7=v6K7VZ-d_hZW_diuRh721S8gDHmaoYNg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix kernel-doc
To: Yang Li <yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 10:56 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Fix function name in sdma_v5_2.c kernel-doc comment
> to remove a warning found by clang_w1.
>
> drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c:528: warning: expecting prototype
> for sdma_v_0_ctx_switch_enable(). Prototype was for
> sdma_v5_2_ctx_switch_enable() instead.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Already fixed:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/ef6f76407cd7796bdeec31305c435162ab54c030

Thanks,

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> index 240596b..db79ee5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -512,7 +512,7 @@ static void sdma_v5_2_rlc_stop(struct amdgpu_device *adev)
>  }
>
>  /**
> - * sdma_v_0_ctx_switch_enable - stop the async dma engines context switch
> + * sdma_v5_2_ctx_switch_enable - stop the async dma engines context switch
>   *
>   * @adev: amdgpu_device pointer
>   * @enable: enable/disable the DMA MEs context switch.
> --
> 1.8.3.1
>
