Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C605A7EBED6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 09:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CAF210E25B;
	Wed, 15 Nov 2023 08:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9F710E4F7;
 Wed, 15 Nov 2023 07:07:14 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5842c251d7cso3573893eaf.1; 
 Tue, 14 Nov 2023 23:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700032034; x=1700636834; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DD6loysLm1if0z26gUfJWR92/8dI2bMs4fySErE1LEY=;
 b=Phc4OPsGPwMua5p9T9v098vNdFUwkK1oU5xDLBeLsEZuWZquYqg7nFAvwmliWvaL//
 LL+0EV+Fa5i9mi8OZdO4rf3QS0GM/FjJazPKA2g1pqFo/z7bxOZVpI5rcHZtenbKBARR
 ryJ4ekHp+nNA5Hp5CPXxQRMpJkg73GV6fPx3bXCQKIi/5KqIA7kkqzdroKqoCX/GmkP2
 RW15azQoeWvmywJtNThEA09ZygFd13Jx3fjJ2zr8MU4w9i61Q1tWIri+gdUsuZVYFduq
 nZsdJlJZYQG6evP5D7rP6YUVCJEevO9jE5QIR/8rpgg1tvOh9m7sWkd6zH2znqy2zNCS
 JPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700032034; x=1700636834;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DD6loysLm1if0z26gUfJWR92/8dI2bMs4fySErE1LEY=;
 b=Ncuh2P55ybvPXM0hRo79MmJTyAImZMZmyPeBnj5EXkfDH5pYqJgM59hZTtJVUBsasA
 Ip2QSkkb1AK3knGWmxd3VhsP7cCDjIDY0lVnZTDG8Bm8+smN/icu01DX1Ox+pWv1UAlA
 YcCled4XLtmzDr4aJD7DyvyXo4xftUbUkmeZ6rXk6cYHjwjentPlaF8bQImpG2KmLjAG
 dNArzsaKbzAayDuugS8O9beT8ysBBtbnjP58M5KAybiX/DFLmpSw/31pK2hBB0Gm8VW+
 IlBggCzWuJEmjDi2Bj/Xnsii1ijYSfbo04GsD87ejOp0/mwnDvkU/M6YOrzJgJeIbexP
 8t9w==
X-Gm-Message-State: AOJu0YwD6pgydBMegdO/jo8Qhe+VUGVKIYW3adfHqovY5B8xt/jH8BPE
 4Y/EpZjvyVGraMTKXv7UNDqY3JuOLiFqs7BW4BA=
X-Google-Smtp-Source: AGHT+IGraImbABbVnYg6Ry57RVFnd3IqKf02szE055lgCefoqqyZvE2zfw+kuPwbsXcgZfPjjXz5Afh8lqooVZbQ9JU=
X-Received: by 2002:a4a:305e:0:b0:58a:211:acf8 with SMTP id
 z30-20020a4a305e000000b0058a0211acf8mr10912431ooz.7.1700032033893; Tue, 14
 Nov 2023 23:07:13 -0800 (PST)
MIME-Version: 1.0
References: <20231115033459.1228900-1-sashal@kernel.org>
 <20231115033459.1228900-2-sashal@kernel.org>
In-Reply-To: <20231115033459.1228900-2-sashal@kernel.org>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Wed, 15 Nov 2023 07:07:02 +0000
Message-ID: <CAHt6W4cdQSXbBf4gO_jR-q-Q8SAonNDoQ0f2cO7LsnT__priWA@mail.gmail.com>
Subject: Re: [Spice-devel] [PATCH AUTOSEL 6.5 2/6] drm/qxl: prevent memory leak
To: Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 15 Nov 2023 08:51:08 +0000
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
Cc: Maxime Ripard <mripard@kernel.org>, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, Zongmin Zhou <zhouzongmin@kylinos.cn>,
 stable@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 spice-devel@lists.freedesktop.org, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il giorno mer 15 nov 2023 alle ore 06:57 Sasha Levin
<sashal@kernel.org> ha scritto:
>
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>
> [ Upstream commit 0e8b9f258baed25f1c5672613699247c76b007b5 ]
>
> The allocated memory for qdev->dumb_heads should be released
> in qxl_destroy_monitors_object before qxl suspend.
> otherwise,qxl_create_monitors_object will be called to

Minor, typo: otherwise -> Otherwise.

> reallocate memory for qdev->dumb_heads after qxl resume,
> it will cause memory leak.
>
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> Link: https://lore.kernel.org/r/20230801025309.4049813-1-zhouzongmin@kylinos.cn
> Reviewed-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/qxl/qxl_display.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> index 6492a70e3c396..404b0483bb7cb 100644
> --- a/drivers/gpu/drm/qxl/qxl_display.c
> +++ b/drivers/gpu/drm/qxl/qxl_display.c
> @@ -1229,6 +1229,9 @@ int qxl_destroy_monitors_object(struct qxl_device *qdev)
>         if (!qdev->monitors_config_bo)
>                 return 0;
>
> +       kfree(qdev->dumb_heads);
> +       qdev->dumb_heads = NULL;
> +
>         qdev->monitors_config = NULL;
>         qdev->ram_header->monitors_config = 0;
>

Frediano
