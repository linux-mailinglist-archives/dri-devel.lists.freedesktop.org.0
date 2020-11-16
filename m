Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF212B3ABB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 01:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF0D89DDD;
	Mon, 16 Nov 2020 00:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5350D89DA3;
 Mon, 16 Nov 2020 00:24:46 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c9so22251165wml.5;
 Sun, 15 Nov 2020 16:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PUyT7HTicJllVKXgyA1Cwx+07UYSRPUlkv+F+qeualw=;
 b=dB8ZpzvzFRUR6qFT8MaXdJo8wn/Lhz8NxKk24CPjLigntQbUGrBCr7Pu1BkgNqwl6z
 qv6zEvWEzQhMzIUSW+NuTaDXW/SWP9YY4VTbotfeuOMxMua94zbBWgQjZ3f8+8L3o15w
 a/5ZIfWgv/mi/o+tIX6glAss/M2kk1V28uLKN95vVUOIkFt4o5+kgajawIFuPF3xQwD/
 j8Uv2wqBuKOniXnKxZovYFm9lx9o7kiHetfCAcu58G8CJhNU1nY/LCl1RUAgmPzghThO
 7UUJsBWV+DbHgnKCjpgBJGRbAM3rSi1WtLRzQX5fzcpgYzx510zi3avB7G39yR6ZMZXP
 kiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PUyT7HTicJllVKXgyA1Cwx+07UYSRPUlkv+F+qeualw=;
 b=TRrxsG4ceOtxh5dqhBq+8yPl72VfCU+aurBB2hEhp3LU5Vs3EGCa8XZ/pIKjVIlNZU
 76J0x/5diVpfpoJH2pC3KtbwTxqaoGOjWItjYXICvxO9Vnj89kkFPlBsHFkxpMiyz8HV
 tceeyZsJ0rC8i+UxVyec/tenS7OuN8vVEbfuVABL5N3OYmbqymxnDVisuHg+Tsng8oLk
 cNG+x059TkcaZ58dFr90SwR2LaUAIoulBxr60CpybaZ5WNQLZmGHyvBazntiZHZGknxX
 6K86rA0IHCcjAzd4TtOlhOUgoTSx83uG3oUaKAGx0CyMjmfxJlI4eRzR9Rw6CRB4EgQz
 ldNw==
X-Gm-Message-State: AOAM530upk6pSiKVaXJ6t5tCNDaQrqy/8D+m/bzxM96DTOaKHjAqflgx
 ERzt++L772HZXfNXtoFQ/oYTHbx06LKRwWOAa7A=
X-Google-Smtp-Source: ABdhPJykcujZq4xRwu+2v95YrVwzQup9pDYXTEx8ALY47iKInAFm0+4TaYD9Q33qlns64mpE/RjQ4bqXGdHt7FAIfHI=
X-Received: by 2002:a7b:c0cc:: with SMTP id s12mr12453523wmh.41.1605486285009; 
 Sun, 15 Nov 2020 16:24:45 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-16-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-16-lee.jones@linaro.org>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 16 Nov 2020 08:24:33 +0800
Message-ID: <CAKGbVbsubdPbZJfwXKEgRHn873sCHh98kd8pK+HVvKfpQXwXrA@mail.gmail.com>
Subject: Re: [PATCH 15/40] drm/lima/lima_drv: Demote kernel-doc formatting
 abuse
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 lima@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.

On Fri, Nov 13, 2020 at 9:50 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/lima/lima_drv.c:264: warning: cannot understand function prototype: 'const struct drm_driver lima_drm_driver = '
>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: lima@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/lima/lima_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
> index d497af91d8505..7b8d7178d09aa 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -255,7 +255,7 @@ static const struct drm_ioctl_desc lima_drm_driver_ioctls[] = {
>
>  DEFINE_DRM_GEM_FOPS(lima_drm_driver_fops);
>
> -/**
> +/*
>   * Changelog:
>   *
>   * - 1.1.0 - add heap buffer support
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
