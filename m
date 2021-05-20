Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C531F38B85C
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 22:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28FB6F545;
	Thu, 20 May 2021 20:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7D06F545
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 20:25:57 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g7so8701906edm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 13:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L6+wHMIa16BIAfcr0/AspV73VlTuSsDUuM2FpOlowOc=;
 b=O9qoQYrizwrGO33O23Eh/taGb21Uq+Sf41L3WzruURauHfByuEuoJ1UE1mSl0b+3i4
 NSD8MlBu7ZqxAXskQNYjyW0Cf3HNjspL2OeWNALMprYILIwuDFRwj/iD5XNMi4tftycW
 EsknKdePJnUKRI7GwYUV4vgaiBNKlvfZYpI3YgA+pOtRuOdBwCcz6pJyixy1j6tnjTwA
 xc2nWDa5LBBVMSo3KVFY7ratdf/2jGMvaBkcjlxZeGivKjGwBBF3BqIOAyT5GGFYupwY
 OXfUcXE+pz37Vs2ya5wtU7hZnc0G6kQwzloGCssXZuruhVK/nWdQ7GD3YjcBN8DK7xpf
 IPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L6+wHMIa16BIAfcr0/AspV73VlTuSsDUuM2FpOlowOc=;
 b=jYZUwEDVdJhZrB637IjZZAAsFRDqK3mKS65Fjl1xZeE6xs1vq5jmz/S7DD47thrmWt
 2irEbt8qLsMiW8Xbl/QP11XYQDdm3s5ed/Ys3LzGRuZB5cA7a51+3FKTLsgbrqcS3/HY
 P3VJpnigpes0R3KUlW1wyOgh7f7YsfXtvj8YVsqmSYYCoxMwcfgs6ZmVwX7EYCtxVu3i
 3fC+ZeTyMcPuuvGPb8VyTBA4H/kDh+ZN5oBiP19dSZbdyUb5rVKWeiTqRPadLe7O8n1S
 bylkQoe9F1Z9qg4ZLxjGkJPeYqiNDx6mD6MVW+O9b+DIjTBm99RTrjRiYQdDQU2sJcCo
 dstQ==
X-Gm-Message-State: AOAM532Kv10uysakMPMDqboiOyKA+gfFkvsmVZIM4yGeD9lD9yE3CM9v
 NDfo9UcA+e5DG4ySVdcqQ9zJRX2drTYphy5P77M=
X-Google-Smtp-Source: ABdhPJw8pr02cKMNKMU/gav1Jo5Bo/EIho2tm3jRn7MMn/JFbkOi35Bg7rsUYA+POgIEX4ds0rT2SCk9e8a1tOYJReE=
X-Received: by 2002:a05:6402:190e:: with SMTP id
 e14mr6952362edz.146.1621542356228; 
 Thu, 20 May 2021 13:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210430082744.3638743-1-narmstrong@baylibre.com>
In-Reply-To: <20210430082744.3638743-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 20 May 2021 22:25:45 +0200
Message-ID: <CAFBinCC0aaMUbBkJ4bjhFa0A+sZH1muyW6kqAQYfjjXOkrNPGg@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix shutdown crash when component not probed
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

since this has not received any Reviewed-by yet I tried my best to
review it myself

On Fri, Apr 30, 2021 at 10:28 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -485,11 +485,12 @@ static int meson_probe_remote(struct platform_device *pdev,
>  static void meson_drv_shutdown(struct platform_device *pdev)
>  {
>         struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
this part made it hard for me because I was wondering where the
matching dev_set_drvdata call is
it turns out platform_set_drvdata is used instead, meaning for me it
would have been easier to understand if platform_get_drvdata was used
here
that's however nothing which has changed with this patch

> -       struct drm_device *drm = priv->drm;
>
> -       DRM_DEBUG_DRIVER("\n");
> -       drm_kms_helper_poll_fini(drm);
> -       drm_atomic_helper_shutdown(drm);
> +       if (!priv)
> +               return;
> +
> +       drm_kms_helper_poll_fini(priv->drm);
> +       drm_atomic_helper_shutdown(priv->drm);
>  }
then this part finally made sense to me (as non-drm person), as
platform_set_drvdata comes near the end of meson_drv_bind_master (so
any errors would cause the drvdata to be NULL).

with this I can also give me:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
in addition to my:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Can you please queue this up for -fixes or do we need to ask someone to do it?


Best regards,
Martin
