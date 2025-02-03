Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B12A257C9
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 12:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5205A10E04D;
	Mon,  3 Feb 2025 11:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF3710E04D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 11:06:10 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-4b68cb2abacso995133137.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 03:06:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738580769; x=1739185569;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7LtzZBZK1xYBhlRCCK/qfM5LmHxuaONLUZDHgOpET4U=;
 b=QPO2pavFHFsA7HABQmXVWxzkHi3RkvGmHsmYzKwwyTSDaSlroNVYq3aKMyDo+aWKOV
 vecHs9wkWD/F/HBhbIa1qUZwkT7Bp7vITsVXBAyU8j5KbxXkeEZttvBFeFUaaN9GuOco
 rkVOd4SggvCXGZTqV4ZiEoqsrUVr4KWUndv9G1hByzJFCGHUFfsQHfzZjgN/4CJHfwFC
 bbrxvYYq1nQGvSKkH6QACtBfVcuUUxqIYMAiO7UEljzVqkhgKpfZ3RRW24INPy+gm8Ch
 ADI1vU2KRW2t1zh96yapCxSF1WN94Yyes2ynuovlxXGWF/BBPBlJEKE/tG4W7u7MEt8W
 ResA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2N6LUknz2LfGn48NPlHpBRNqfkkNiP+KDj+BYaeoi9aF0nzEM9G3/WSVvjM7cy9/tlofUUbs5KnY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7W3u8NbxG8SVByMA1Otgq6/FJDMuK4ELWDd3xG5R2tQEHj1qM
 W0P8evAtH6n8SlgLdpraXa9N5MT4FsEpidsCKmiqjkBCVl7dhMS7nS8wzkr5
X-Gm-Gg: ASbGncst4pJ09z6lpbuy1xeDOITa7/dTwPfyE/k7Up+raCxjCgOFb2eQSVdnS36csgM
 7Uqr60Qbd03L1yGzfAqAQQEzPCXir9N90K4HycSi5nho8htkrIcdYEV2Fn+JXLrCdqz84Qf7Ed/
 PJkNu4msZOzjrG4N4jzbELWgMrpneOuKJt97mVAyHQlPKpI88oYY1S+fCtBBxqT9bVlUXgA5Sy6
 BB950ff0btnvABInJ/1MUtPFZRx/Lyte02okuXThJMuNUIZu81kU1WqxgvKff8hUF1VR0JSwidF
 pNyZJY4n8X5I2oFodcmom78OclXWECYwZjguOb51rq6vAXr8YSwQ8g==
X-Google-Smtp-Source: AGHT+IGzRuxRQ2Hsf5yPH3f6gW5cP9V9qdOEW5YXMoQ+7zkke6N/z7OR3UOxXFR9tyFvzcHfGEagWQ==
X-Received: by 2002:a05:6102:5487:b0:4af:ea3b:7b31 with SMTP id
 ada2fe7eead31-4b9a4f8f2c7mr13589981137.14.1738580769078; 
 Mon, 03 Feb 2025 03:06:09 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-8669405f1a7sm1561288241.4.2025.02.03.03.06.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 03:06:08 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-4afdf8520c2so1307491137.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 03:06:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWHE3hWh7vfE8oAGZJspks3LoYiYJ+2/oj69MkZVqv1jWZuP7cBP/iW7ZLQruhr3laV8t3W2yAf0Ks=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3581:b0:4af:bf45:39a8 with SMTP id
 ada2fe7eead31-4b9a5237dbbmr13881253137.16.1738580768726; Mon, 03 Feb 2025
 03:06:08 -0800 (PST)
MIME-Version: 1.0
References: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Feb 2025 12:05:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrry1ZV=C0vuEO+7GcF5Tqwtecxu4UPOnrtzXv6RUm4Q@mail.gmail.com>
X-Gm-Features: AWEUYZnzGowivfh3HKcvshI6ESRr_FkQLsKDAfk4pJYroEWG9h9gdbwxIR0ysxU
Message-ID: <CAMuHMdVrry1ZV=C0vuEO+7GcF5Tqwtecxu4UPOnrtzXv6RUm4Q@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Biju Das <biju.das.au@gmail.com>
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

Hi Biju,

Thanks for your patch!

On Sat, 1 Feb 2025 at 11:57, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Simplify tegra_dc_rgb_probe() by using of_get_available_child_by_name().

That's not the only thing this patch does...

>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/drivers/gpu/drm/tegra/rgb.c
> +++ b/drivers/gpu/drm/tegra/rgb.c
> @@ -202,12 +202,12 @@ static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
>
>  int tegra_dc_rgb_probe(struct tegra_dc *dc)
>  {
> -       struct device_node *np;
> +       struct device_node *np _free(device_node) =

Adding the _free()...

> +               of_get_available_child_by_name(dc->dev->of_node, "rgb");
>         struct tegra_rgb *rgb;
>         int err;
>
> -       np = of_get_child_by_name(dc->dev->of_node, "rgb");
> -       if (!np || !of_device_is_available(np))
> +       if (!np)
>                 return -ENODEV;

... fixes the reference count in case of an unavailable node...

>
>         rgb = devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);

... but as np is stored below, it must not be freed when it goes out
of context?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
