Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E3E3C735D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 17:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E911D6E0DB;
	Tue, 13 Jul 2021 15:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99ADE6E0DB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 15:37:45 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id n14so51011524lfu.8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 08:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kx1Y/WYDw/iqDq9jD8GGoXbbFWtJRmLPuORkqb9ajvA=;
 b=A8/0lsZnyAX7BIc8NESGdnGw8Kj+ytndcF5UtoycI+c2tFSTIR+fkp2PxWKHBQ3DF1
 0pkFHv7Lic0m0lxmNo0R18lhdn26ERJuSdxrlWsZetGGvT8NEVHSns+mskxdf8mX7M9U
 2otHvAjpEBN+TmpX/j3Kj9PL0XviASxhUYo6ufA5bF8hlTi9HeFQaeO3clZEsBw0HpTJ
 NM7JE6VYNeiHvT1DIC7sufjw8/SGjLihFSkBKfshBsyqa/KKteqJ12FmPhkukLRpV0oq
 2e9i88r4uqPkfwxgLq3oUO7XTYS2FCoi4saClUZcV0CQKbdr9AS1Y4YBVpxRw7NuTljZ
 LU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kx1Y/WYDw/iqDq9jD8GGoXbbFWtJRmLPuORkqb9ajvA=;
 b=O7XvUYksfRDs6oOdFnmHZltf4hePj83fO3pyWGj+2T/TBLwFsRiyimjrsxReKc4D2d
 D6LavbBr6pYiWMQbAR2UI2bzKQ1jgfJXZjWTSyzVvi6WF3Epw/1caU9kU61rQQpo9C6u
 qQ4UmYCSfHhYqz0J8oZ4REnHXqTkWwLXSxb9vHi4vqMkQ17AUbZaaAqnVzEn3zuROEcP
 2d5zE58N0UzkcdV6w0liJyDqyKwuetCSNVz8iO8RxGLK4E7xoAOn+7+gl3VWsG5EzO5T
 WxfhwFSZBLkTIwnm6zN2oStC+sDqZKO5gRodEudzr0B6yaebIAsI0QkjTDgFK5NBf4Cq
 b3Kw==
X-Gm-Message-State: AOAM533u2Zvx5b/WL+lGBehyvzwKeKYACyuke38G2ejgYrhyJRbL9CyT
 b+v7dxWtvz2A9lJ0dE82wguk2TMNyKFfns4rnWHcqaO5pq8=
X-Google-Smtp-Source: ABdhPJxm9MMFeh84EuLa7fq40GfBTrCbtSB5bXv13q928r1sWSdLRLXYymM0WfZJPZi9rQdK59LsTOD/u7tkGDKrIM4=
X-Received: by 2002:ac2:5e71:: with SMTP id a17mr3873550lfr.465.1626190664005; 
 Tue, 13 Jul 2021 08:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210604063201.3235245-1-linus.walleij@linaro.org>
In-Reply-To: <20210604063201.3235245-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Jul 2021 17:37:33 +0200
Message-ID: <CACRpkdbacfR52__8ZuwWV3B56w1KTvhOKe2_7OiVdPoLXrWbnQ@mail.gmail.com>
Subject: Re: [PATCH v3] backlight: ktd253: Stabilize backlight
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
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
Cc: newbyte@disroot.org, Stephan Gerhold <stephan@gerhold.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 4, 2021 at 8:34 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> Remove interrupt disablement during backlight setting. It is
> way to dangerous and makes platforms instable by having it
> miss vblank IRQs leading to the graphics derailing.
>
> The code is using ndelay() which is not available on
> platforms such as ARM and will result in 32 * udelay(1)
> which is substantial.
>
> Add some code to detect if an interrupt occurs during the
> tight loop and in that case just redo it from the top.
>
> Fixes: 5317f37e48b9 ("backlight: Add Kinetic KTD253 backlight driver")
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Reported-by: newbyte@disroot.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Hm it seems this patch did not make it into v5.14-rc1, could it be applied
as a fix for the -rc:s?

Shall I resend it with Daniel's ACK?

Yours,
Linus Walleij
