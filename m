Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E25CA47232A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 09:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C014510E6AF;
	Mon, 13 Dec 2021 08:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612DA10E6BD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 08:44:31 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id q14so14461657qtx.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 00:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h4WDvjM2kgyM01qsLxjBdup3VQZvL5+0/2y39dEt4C8=;
 b=BEKQMXeItUho4Q0NwJ1f8FstJ+Jf7PJ9R80lW/4yWOljS10XpFJ5HT0VacDeVVZ5dB
 RA8M/ibrXbb86GoJWidGhnp2LswMUu5ZEA8I+eBMOhkaVFr147SQCO22fS8My096MzHz
 /b4tB4pB3SK5lX3cOoqr4/vD0aAw3Bltsw/sRGVFuY5u0FVY/ewz5xqM6AScU3FhIGaF
 hzZZ8sjjAb530wrrBoAn2oyZwohVZ0dYe+J0zWB1Hrrao9Y0iWo3GoXfTu3jVY75H8s0
 sLy7Kmn6LBGQsS1Oq/Lj79Q5YUshGorcNIQIt/kifgDCscax9hh6tfa28rNWxSWGu/+Z
 Mp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h4WDvjM2kgyM01qsLxjBdup3VQZvL5+0/2y39dEt4C8=;
 b=zFZ9TRNMog2dRQ2k8xe3qTt2Xkde9kd1k7hzoZdqvJG5Z/MmWPFbtjHGVUO8P72Z6Y
 reEupU9hTpmGvp1bMETy2DtgHxjkO3mf0TXvSjAtTHtPKW9yAptsP+S5GQj/5kIGxBv+
 oGFxIUIxGo5fpllCSKJFg6s8BzI/Tw1AiuuuTTEuGlNRymRXuqcQpcClH9iHMV6AEhSE
 /o3q8/bUX0o3XCUWTB1nByOs+XlfkpGqe93AjuOTkfmvV5PZmZ0Q6efn7L3t1PivdFB4
 4tDaSN2F3eBMcpaf0N717gm5wVo+ocfFG/K+xCgdrG2MOGbBZ0NPFZtZeKQAyvjTkHex
 lUDQ==
X-Gm-Message-State: AOAM531Em/rTCXlev7yfNvr2D4IhesrEWihpdzNCt5N5fDrjs4sAVnv6
 kL79gHAdbrwJR84tK2/5utr2XMhjjhZ/JWq9VXDaKw==
X-Google-Smtp-Source: ABdhPJziiOVM2+Dx6BT3tLzDj98Xw0vskZvlatbAvbgT2x6SaH8jcF/6PODw5NoYcf9gsRZOzBLKdkLelCk4wGV+gos=
X-Received: by 2002:a05:622a:202:: with SMTP id
 b2mr43442164qtx.34.1639385070353; 
 Mon, 13 Dec 2021 00:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20211212062407.138309-1-marcan@marcan.st>
 <20211212062407.138309-2-marcan@marcan.st>
In-Reply-To: <20211212062407.138309-2-marcan@marcan.st>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Mon, 13 Dec 2021 09:44:19 +0100
Message-ID: <CABxcv=m4fu8h=FwY7R=thuvd13_ZbFqB9rNNN07QOAd__jdYSQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] of: Move simple-framebuffer device handling from
 simplefb to of
To: Hector Martin <marcan@marcan.st>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Linux Kernel <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Hector,

On Sun, Dec 12, 2021 at 7:24 AM Hector Martin <marcan@marcan.st> wrote:
>
> This code is required for both simplefb and simpledrm, so let's move it
> into the OF core instead of having it as an ad-hoc initcall in the
> drivers.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  drivers/of/platform.c          |  4 ++++
>  drivers/video/fbdev/simplefb.c | 21 +--------------------
>  2 files changed, 5 insertions(+), 20 deletions(-)
>

This is indeed a much better approach than what I suggested. I just
have one comment.

> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index b3faf89744aa..793350028906 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -540,6 +540,10 @@ static int __init of_platform_default_populate_init(void)
>                 of_node_put(node);
>         }
>
> +       node = of_get_compatible_child(of_chosen, "simple-framebuffer");

You have to check if the node variable is NULL here.

> +       of_platform_device_create(node, NULL, NULL);

Otherwise this could lead to a NULL pointer dereference if debug
output is enabled (the node->full_name is printed).

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier
