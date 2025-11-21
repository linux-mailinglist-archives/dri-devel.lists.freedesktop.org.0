Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E96FC784B3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0374A10E80B;
	Fri, 21 Nov 2025 10:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0AB10E80B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 10:03:25 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-93c6628c266so274988241.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 02:03:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763719404; x=1764324204;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wlBMUu/EpwAnMbRqR4FueGr8bEwdrvt/wf+TDoxxT9k=;
 b=VMfsib3DoqQt0rEl8ZbV6XSy/tZzev91yRA6V56wIieNHiIPeevzM0cP2r+TF0f06P
 JiYVFgv+lo4SkxQx8ipe8InVJRazomh7Kc9KaJ5ZITKEQZVZLb/XkE122chW1OdHefJU
 ZPt84AKtWuv2kOh43/Xno+jVv+/8RINHvJZ/E9zYPOJhMk8Sbd+poox5hu234bV2Rw4+
 39Pvan8Ka8pMn3jyy9xWWGLCSUJaWl+1aRlGopgwnD6UBWDgj7jw0O+hA+cOgD3Y0q8C
 v1qKq7p2NWF931/Hx7frOtFNlNi4atGttR2coWVm5qtIj5ED0Pu6jU8tPuHNsXS1QA93
 lvjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaHQEd/odhDAlVe6N8iNdX0lC2izekCLtt3BVw5s+vMTI4LUEVpRTS73DdHPjV9mIJf1A7ZBLm8Tk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG5vkuoFaeq9/xf5n9omjWR3J4t9+031gvuzz3ggDEHJ/kgulK
 UEPRMbjln/mqHBGP5W51GJoNU0u7yMphnkB9ZRZJ5crIMjWvxcThUGvpaLYLqtjN
X-Gm-Gg: ASbGncvvjyHNNkwwh3P6+WoGy9PldAgaIP7+Lhl+aOCEi3KQs5ZorXTEQ0ptdXSnb2C
 yVhhZkvBBtSbwczlmy1QlpXLaJp1LXXz8eoFTz28SvmjYw2oyo58x5jzADBjgK5YA2BVuugFfJg
 as7Cy02tIbWd/R6SJVOK90PzTNst85Y0AlRMvACS0Sc5p5mqkHxsZC825lLd9TeaURqFtSD6V4B
 FbJeFTDfDNO7w6oGzgt/8btFvL9xV7iUdcIagZVEKduO5mhWrZePpTlVWMXy67WPMOsMEUh6tb7
 8DRRM4wJG7y8pmcud3hpWDPt+xPLDqWVW3y5EA9Ig2G3U1ImCwu/CK2dYcXGQ5LM5oDvxxLi81o
 4+L5W4mZoyHelnLnDdh8/hl3mJ7gPaXOrR+O8xbcW+WosBuJmgxxYQKYe6FEfKHMyHXnhFpR6tn
 88DaMejgwBfH13sEIE+iBTa+ngBDvZk8rK2VyeBXUG3mNIYnSA
X-Google-Smtp-Source: AGHT+IE4sZapR+B72DYowKEJhf6a4VACto+e0c1SSJ7Q0Ii7xm1nl6z81FQ+Q6asiow/gwdP+CTxYg==
X-Received: by 2002:a05:6122:8b8a:b0:559:6d45:9a1c with SMTP id
 71dfb90a1353d-55b8d6bc669mr493168e0c.3.1763719403802; 
 Fri, 21 Nov 2025 02:03:23 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-55b7f7d2356sm2194083e0c.22.2025.11.21.02.03.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 02:03:23 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-93516cbe2bbso528277241.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 02:03:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUpvnUF2vZvqVmyoD/5UAQQi2Z42nYaVCgr7WJi4yfMxHL7s8VCYVGEbJWT6KS+Gg1Nh6WA5t9FB+c=@lists.freedesktop.org
X-Received: by 2002:a05:6102:579a:b0:5db:33f9:adce with SMTP id
 ada2fe7eead31-5e1de3d42camr385692137.41.1763719402998; Fri, 21 Nov 2025
 02:03:22 -0800 (PST)
MIME-Version: 1.0
References: <20251120180233.763975-1-hsukrut3@gmail.com>
In-Reply-To: <20251120180233.763975-1-hsukrut3@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 11:03:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV3UvDHT0uu8oeiCGc9pURaLPDPmG-Fu9kC9H8DQyqRDw@mail.gmail.com>
X-Gm-Features: AWmQ_bkayHVM_Ddsfirz9lK5uUvThJmyJwFAo8HPyX8vy-dtp3QKVrq4J4AGcFo
Message-ID: <CAMuHMdV3UvDHT0uu8oeiCGc9pURaLPDPmG-Fu9kC9H8DQyqRDw@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] fbdev: q40fb: request memory region
To: Sukrut Heroorkar <hsukrut3@gmail.com>
Cc: Helge Deller <deller@gmx.de>, 
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, 
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, 
 shuah@kernel.org, david.hunter.linux@gamil.com, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>
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

Hi Sukrut,

CC linux-m68k

On Thu, 20 Nov 2025 at 19:03, Sukrut Heroorkar <hsukrut3@gmail.com> wrote:
> The q40fb driver uses a fixed physical address but never reserves
> the corresponding I/O region. Reserve the range  as suggested in
> Documentation/gpu/todo.rst ("Request memory regions in all fbdev drivers").
>
> If the memory cannot be reserved, fail probe with -EBUSY to avoid
> conflicting with another user of the same address.
>
> Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>

Thanks for your patch!

> ---
> Testing: This patch is sent as RFT since Q40 hardware is unavilable and
> QEMU does not emulated a Q40 platform. The change is therefore compile-tested
> only.

I would suggest not to apply this, unless it is tested on real
hardware.  It wouldn't be the first time an innocent-looking change like
this breaks a system. See e.g.
https://lore.kernel.org/all/Y5I2oQexHNdlIbsQ@shell.armlinux.org.uk

> --- a/drivers/video/fbdev/q40fb.c
> +++ b/drivers/video/fbdev/q40fb.c
> @@ -101,6 +101,13 @@ static int q40fb_probe(struct platform_device *dev)
>         info->par = NULL;
>         info->screen_base = (char *) q40fb_fix.smem_start;
>
> +       if (!request_mem_region(q40fb_fix.smem_start, q40fb_fix.smem_len,
> +                               "q40fb")) {
> +               dev_err(&dev->dev, "cannot reserve video memory at 0x%lx\n",
> +                       q40fb_fix.smem_start);
> +               return -EBUSY;
> +       }
> +
>         if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
>                 framebuffer_release(info);
>                 return -ENOMEM;

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
