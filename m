Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E3C455705
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 09:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C126EAC0;
	Thu, 18 Nov 2021 08:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEA66EABE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 08:33:59 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id t13so11912608uad.9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 00:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZHqYNDJJeUEUo7A1lpPpFJOTlOxuy2hnNwzoc1obFj4=;
 b=CF6ocM+bx5Fr0/b6Ywaj86rgEpWxoStFb3hkGc6owx2wO4gg2GNPpu6RMilHL0b8OU
 rbUjT0FUq7yc4wro2EyaUe6G/M3ZAmWaC937DhaqlikTnHq+Vl6hJuXNSWUb9a2GAvq7
 64Wy1M0Y4tZmUlC1BFGaRjmMtykcNTXTR+mrDlNfeYQWmVuI9kH9VpkMXgFsh7FeM68v
 830DCEzNEsDRPYkKEcFD0nqXsmLo5rObgsM8xRhv5ZMuEjq+2hcLvpujv8+1aAzQ49eV
 fACgYVJ++wWge7bUfI7ROyc2AOtkJfsTWsZ9KPFq+tws2gIwUVT8jgx7UUBW3rqeCOyL
 q2/A==
X-Gm-Message-State: AOAM530ehfvYB9BblHPfm22c4D9JGh7d8RaMQYBZygzquixu4Se/efla
 252X0HK5B4xQxR2fK2gfjRJVNnbK68qzZg==
X-Google-Smtp-Source: ABdhPJz9i/7IiDUpoWCt+aMl/hdJqAATUsaHlFeIp5EKsA3zPR2ThKgQySR5jQA6wtJQpxyqc3YfOw==
X-Received: by 2002:ab0:35d2:: with SMTP id x18mr33599584uat.32.1637224438871; 
 Thu, 18 Nov 2021 00:33:58 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id q12sm1312603vkd.1.2021.11.18.00.33.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 00:33:58 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id j14so2161956uan.10
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 00:33:57 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id
 l2mr78426134vst.37.1637224437450; 
 Thu, 18 Nov 2021 00:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20211117121829.11141-1-guozhengkui@vivo.com>
In-Reply-To: <20211117121829.11141-1-guozhengkui@vivo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Nov 2021 09:33:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWxSBSb0zA=_Httx53ocJ5qtKUHArq_+pCAWKB9ppzn1g@mail.gmail.com>
Message-ID: <CAMuHMdWxSBSb0zA=_Httx53ocJ5qtKUHArq_+pCAWKB9ppzn1g@mail.gmail.com>
Subject: Re: [PATCH] video: omapfb: Use scnprintf() instead of snprintf()
To: Guo Zhengkui <guozhengkui@vivo.com>
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
Cc: "open list:OMAP FRAMEBUFFER SUPPORT" <linux-fbdev@vger.kernel.org>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 kernel@vivo.com, Gilles Muller <Gilles.Muller@inria.fr>,
 "open list:OMAP FRAMEBUFFER SUPPORT" <linux-omap@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guo,

CC cocci

On Wed, Nov 17, 2021 at 1:58 PM Guo Zhengkui <guozhengkui@vivo.com> wrote:
> Fix following warnings:
> ./drivers/video/fbdev/omap/omapfb_main.c:1382:8-16:
> WARNING: use scnprintf or sprintf
> ./drivers/video/fbdev/omap/omapfb_main.c:1306:8-16:
> WARNING: use scnprintf or sprintf
>
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>

Thanks for your patch!

> --- a/drivers/video/fbdev/omap/omapfb_main.c
> +++ b/drivers/video/fbdev/omap/omapfb_main.c
> @@ -1303,7 +1303,7 @@ static ssize_t omapfb_show_panel_name(struct device *dev,
>  {
>         struct omapfb_device *fbdev = dev_get_drvdata(dev);
>
> -       return snprintf(buf, PAGE_SIZE, "%s\n", fbdev->panel->name);
> +       return scnprintf(buf, PAGE_SIZE, "%s\n", fbdev->panel->name);
>  }

I guess all of these should use sysfs_emit() instead.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
