Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5434142AF7B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 00:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA086E9E5;
	Tue, 12 Oct 2021 22:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6DD6E9E5;
 Tue, 12 Oct 2021 22:04:17 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id a7so1706234yba.6;
 Tue, 12 Oct 2021 15:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=auG+UMx9zytYp9lINzhPZO9u/TFK5cE+R08OejH5B0w=;
 b=ne7652o0LqsXxa1F1cgXnxgCK2bxwNWHDrsyhUBtlAmcbIV/AtPK8pJIgvmbUIbEaD
 h92TyPmec2iTl0SXhH/vi63WZzRK7W9caxUYKHcMVdC227jK67QU7owKiG83zjMU3MBb
 bb61mGP/yDMpyVAZSY0IJkRZEr5mk50g0hAEHr7RL+q8EBT1w+cNjzMVs2cIG0y5xbic
 0W86qaLtxTeBPyMXA9tztIq7/maRwyqxexf/TqB2kPSdB0xbM9RVHUrOajFjEvlJyYQ0
 dktD5Gp41bhoYKK2kIZbhi3WP5OQSlqIMuFHUEaAawTV36hlLtIqFepSObHS1+HC79YP
 Ogiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=auG+UMx9zytYp9lINzhPZO9u/TFK5cE+R08OejH5B0w=;
 b=ABmq6ASLKfjpmgAmpmUyTw3eE3bB6BhUaYS5lT+IpAWcdJbaaQ9H49ESF7bgtdh4er
 FEcly0xqyKGqszz48BZ1IYEqKS/zjuIn0Y6A2N2TxonAFWJMEzmYOckrrlQumAECzUkX
 o477a+tl0E3gB2jeipl3PPiNkGCUfw59giWxBSa8SZ709j9Ghtql5OWywEA3msDhWnTY
 SyUr5CYkYNZlUBq6YOxCu2P/S+eoALSywutA97VL68FPtSSIVpVFRK1OcmVwy4FJd6CK
 +fSSHN8i+Qa5lDSJig2m7BRxzHgrTOoIZN4IiQdigpMKG4XZKeKZAF9vA1XYX4NVEVlJ
 fjJw==
X-Gm-Message-State: AOAM5304PYO131QfHf43R4v+8y347NX6TS6IwFszRi/05d+EI5h5q9OX
 nAnPQgLCRB6egmOtCo8xynXFkadFbM9IbBP5Gw8=
X-Google-Smtp-Source: ABdhPJy122ifGFhlEjzoGnOh1Y838UQ+5VnA3gX7zYtFxeJ4IZzHKXhB7X/f+krIMq3PbEeKYpoBnJ7DKFa3wwIoKco=
X-Received: by 2002:a25:9a81:: with SMTP id s1mr32001654ybo.230.1634076256610; 
 Tue, 12 Oct 2021 15:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <4369779.LvFx2qVVIh@kreacher> <21245442.EfDdHjke4D@kreacher>
In-Reply-To: <21245442.EfDdHjke4D@kreacher>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 13 Oct 2021 08:04:05 +1000
Message-ID: <CACAvsv4-MUEuoq0cb3mQ2PK3u8jnD7U2yPHVM++57X6QZEDX2w@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] nouveau: ACPI: Use the ACPI_COMPANION() macro
 directly
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux ACPI <linux-acpi@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Ben Skeggs <bskeggs@redhat.com>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 ML nouveau <nouveau@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Oct 2021 at 03:58, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>
> From: Rafael J. Wysocki <rafael@kernel.org>
>
> The ACPI_HANDLE() macro is a wrapper arond the ACPI_COMPANION()
> macro and the ACPI handle produced by the former comes from the
> ACPI device object produced by the latter, so it is way more
> straightforward to evaluate the latter directly instead of passing
> the handle produced by the former to acpi_bus_get_device().
>
> Modify nouveau_acpi_edid() accordingly (no intentional functional
> impact).
>
> Signed-off-by: Rafael J. Wysocki <rafael@kernel.org>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_acpi.c |    9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> Index: linux-pm/drivers/gpu/drm/nouveau/nouveau_acpi.c
> ===================================================================
> --- linux-pm.orig/drivers/gpu/drm/nouveau/nouveau_acpi.c
> +++ linux-pm/drivers/gpu/drm/nouveau/nouveau_acpi.c
> @@ -364,7 +364,6 @@ void *
>  nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector)
>  {
>         struct acpi_device *acpidev;
> -       acpi_handle handle;
>         int type, ret;
>         void *edid;
>
> @@ -377,12 +376,8 @@ nouveau_acpi_edid(struct drm_device *dev
>                 return NULL;
>         }
>
> -       handle = ACPI_HANDLE(dev->dev);
> -       if (!handle)
> -               return NULL;
> -
> -       ret = acpi_bus_get_device(handle, &acpidev);
> -       if (ret)
> +       acpidev = ACPI_COMPANION(dev->dev);
> +       if (!acpidev)
>                 return NULL;
>
>         ret = acpi_video_get_edid(acpidev, type, -1, &edid);
>
>
>
