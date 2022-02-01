Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5CF4A5895
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 09:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E4110E85A;
	Tue,  1 Feb 2022 08:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1533C10E85A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 08:37:09 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id bi36so6711812vkb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 00:37:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4vrfqDZv98izNocIMjPY/vNKpLIW8vGPDDyzaE9lmNM=;
 b=pETAPXZLs+3UUHspklALrtDuD4PgxoN1tZ1A6VNhi1O8FrsKlPp3JmIimhA5QRap6Z
 eoUOLw4x728O27MBwqMtvwZPwccvOo8QPvk1RFU05Q3odaY1LWwCim1brqpeOBgvJcwN
 5tOXHssxO85QZMh0RKmWtxqqOdibXoYN9K7luVkQ5qy4la60L+heDwKpO6WXlKuTsRyD
 JpjKj+QxRd/VnTE+o9NCKi3Hj9zfHYGmvkzkpp+hLt9Xs4LJzuQvLKhZJlb6Kcu5nitQ
 /ji98N6qGfGnt2bo3MQiFDxqOJs8bx/yVDVTSAkbCd+10yRTVaUz7LwtEH7LqpHqsovt
 GW8A==
X-Gm-Message-State: AOAM5300CvsQg3H5hb+XxjrBgvVBYMcDaBSr1FJPm1NvXWJ0csdx2JcC
 6Hg1uzPfKiAWQxJBls6aPh4Zba9Q4dMnMA==
X-Google-Smtp-Source: ABdhPJymPcpIUjvcYWK1lysLGhuTlGM5+ytGeD7le2WB7mjvmWvFJj/xBNcbkPBNmvPVS3Is+Y71+Q==
X-Received: by 2002:a1f:4e44:: with SMTP id c65mr9481877vkb.37.1643704627895; 
 Tue, 01 Feb 2022 00:37:07 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com.
 [209.85.221.182])
 by smtp.gmail.com with ESMTPSA id s133sm4533079vkh.28.2022.02.01.00.37.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 00:37:07 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id w17so9947302vko.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 00:37:06 -0800 (PST)
X-Received: by 2002:a05:6122:c8f:: with SMTP id
 ba15mr10046534vkb.39.1643704626599; 
 Tue, 01 Feb 2022 00:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20220131201225.2324984-1-javierm@redhat.com>
 <tIMIWqepcZGntnez-1ss4Kn4K8btXnzDRL7EWd19-745WK90YIC19E_4di9RNvB3gtx-PzWEjBEGQLPNJE_x0T1yyyaWFCoFcCiG4StR9RU=@emersion.fr>
 <wuXPJN-K-rvjoV51c4EBmTBScov8rcJTPoYmlfHe04_-4wD1khVxo9HnUsP7UFd5m4AkzGSw2hXe_c77jbSRhjEJ0JZIYwuvuIkcv_KsR-Y=@emersion.fr>
 <CAMuHMdXKZ=BkvVqdpiNPNJgxm9SzQ3Z0n4SqV2-4oPRveybd6g@mail.gmail.com>
 <qmhzv6kqs6QdAOP3bNB39glOpc8eeJ6flgjfjcaBniT-shDKZkxo5uB71weGOUKxPE6dq_WBhtHmY5vMmuYwqMoHgtMWnX0ESE5R1Y5g5F8=@emersion.fr>
In-Reply-To: <qmhzv6kqs6QdAOP3bNB39glOpc8eeJ6flgjfjcaBniT-shDKZkxo5uB71weGOUKxPE6dq_WBhtHmY5vMmuYwqMoHgtMWnX0ESE5R1Y5g5F8=@emersion.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Feb 2022 09:36:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHhUkPhq8M0d=p5EgH8bBz6EtH4drajKtQHE0121V1uQ@mail.gmail.com>
Message-ID: <CAMuHMdUHhUkPhq8M0d=p5EgH8bBz6EtH4drajKtQHE0121V1uQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Simon Ser <contact@emersion.fr>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

On Tue, Feb 1, 2022 at 9:34 AM Simon Ser <contact@emersion.fr> wrote:
> On Tuesday, February 1st, 2022 at 09:26, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > What's the story with the Rn formats?
> >
> > The comments say "n bpp Red", while this is a monochrome (even
> > inverted) display?
>
> I don't think the color matters that much. "Red" was picked just because it was
> an arbitrary color, to make the difference with e.g. C8. Or am I mistaken?

I'd expect 8-bit grayscale to be Y8 instead.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
