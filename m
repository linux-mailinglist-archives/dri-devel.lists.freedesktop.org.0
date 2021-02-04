Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1737130F6BD
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 16:50:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6A26EDF9;
	Thu,  4 Feb 2021 15:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204FF6EC9B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 12:11:58 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id w14so2019238pfi.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 04:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Wshvps9uSwR4KrMERILO+uhM70XPunvXNSvQiLlduc=;
 b=U5tKttEe6xX2g1VC7QFy33Ij2koZAHLIbxXNcQk0Vq9+rpAPr0zbGR7tR7Ckz9nVJn
 FPlN1o7eSyTN9mohqKjo6Oc5rYcAHzzZAy2Ju6xVX40rYmSgr+ugUCKySdaozJ20fZ/B
 AHDUaixxzi/f0yuXABZD6cWj+PrkjMetFPPJqWR2OanzNgwehP2yEUks4ssBBfTcbJ1z
 sNqNlGMb0x6vv6tx0v6ICBBnucY90HY6/ii348RJe+DfSv3OWqepYiZT/DIV8C4salrZ
 Zqc7xVsVyaoKFUz3d0HCzOXIOa2VUFl4NRwi/QOmcpshHtk/dubCFjJh4R48l7MkucoH
 027A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Wshvps9uSwR4KrMERILO+uhM70XPunvXNSvQiLlduc=;
 b=f2Hkq3DCFy7FpYyRlQ2KekBsEu/Wfb75vJbhhso6qT+kUarE+UdUR8VXrq/JGDKSVJ
 msNbez4HfpTOUSIhd4Qk5XP/2g9+LZXzgloHdfWus72jLTJRA7YD94ANc7JSgD4DthIV
 D6l044WP7JDK07td5B3ej9b/vcYu3p7ZF5bIEVGAyw0X6tjv4Xk0+/ZUDjjGXNTpnOJq
 cOqAj6rd7MZXQ3BCWGuoleQHK/tdlI+D39bInc6yvL2ZQ3uwnnzRIo6aMx3cpUeNyGQ+
 nuUVmVxM3Pd6sRBreMkkSXiFxr3+LFhBqeKP/k+O2+ja/mCWhMvH8iIA4ZX72QSB72vV
 qDWQ==
X-Gm-Message-State: AOAM532LIs1W1F8YIXD9gWQk+cDUOhOtT3LD0GJ4gEbB3AHmT//LAPHH
 kfvvnoVal+miu+N9Z0hWaqLR+bNLyCiIUPGvXwghOw==
X-Google-Smtp-Source: ABdhPJw0UqbwzAWR67aHT0BoVn8ualOS7C4pld0U7grb54rGyX9abNSYQ5+Eq7hMBn4c1O10k4gDlDfveeeUyrNn1q0=
X-Received: by 2002:a63:f953:: with SMTP id q19mr8581621pgk.120.1612440717662; 
 Thu, 04 Feb 2021 04:11:57 -0800 (PST)
MIME-Version: 1.0
References: <20210202115707.14410-1-bernard@vivo.com>
In-Reply-To: <20210202115707.14410-1-bernard@vivo.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 4 Feb 2021 13:11:46 +0100
Message-ID: <CAG3jFyvfccea-5cDJ5QruTFSCobYogRQgUTTnn--6s2uFQX0NA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/analogix: remove redundant when devm_kzalloc
 failed
To: Bernard Zhao <bernard@vivo.com>
X-Mailman-Approved-At: Thu, 04 Feb 2021 15:50:48 +0000
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
Cc: opensource.kernel@vivo.com, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joe Perches <joe@perches.com>, Andy Yan <andy.yan@rock-chips.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Bernard,

Thanks for the patch.

With the below fixed, feel free to add my r-b.
Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Tue, 2 Feb 2021 at 13:09, Bernard Zhao <bernard@vivo.com> wrote:
>
> Line 1590 DRM_ERROR is redundant because devm_kzalloc() already
> prints an error.

The line number will not be so helpful for reading this commit message
in the future, so remove it and maybe just refer to DRM_ERROR being
removed.

>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index aa1bb86293fd..8f6258eb9960 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1586,10 +1586,8 @@ static int analogix_dp_create_bridge(struct drm_device *drm_dev,
>         int ret;
>
>         bridge = devm_kzalloc(drm_dev->dev, sizeof(*bridge), GFP_KERNEL);
> -       if (!bridge) {
> -               DRM_ERROR("failed to allocate for drm bridge\n");
> +       if (!bridge)
>                 return -ENOMEM;
> -       }
>
>         dp->bridge = bridge;
>
> --
> 2.29.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
