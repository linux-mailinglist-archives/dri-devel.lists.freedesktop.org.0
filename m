Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A55D04920FF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 09:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B12B112136;
	Tue, 18 Jan 2022 08:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00061112136
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 08:10:43 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id u6so35155632uaq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 00:10:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VAQlLcFBVgyKQTaBnoQmFYzL/LSJbyFvZ8WuVXWI65o=;
 b=3ZrdQ2Nv7ehuO/ddlqC29WMMD8n/+00gNFZ06UBBUs7NPmTmH35OYCuw5Nx3xoApdu
 4LNo0kZcu3D5niC+mgltZlA+fcqCHlyGJnvGDTjnpBdEtKW7blgcLzrcF5Xpa8Z5sq8A
 KzE0hh07Lhqr5tjmLOXhBFpu208WZyU6YRX+XjRKQeUs9ZuJwZdAJJFfhS+l8exDSn8l
 9LudIng0jOOhv6aQLMALsIPgyyBGS2loDDVTHGsQjPo2P4UD2TdUvMBqdtAU2CJKwCrv
 dRo+qAnRkMYg8zZn5/lCKeu3b/v8cYJdqSUGdvLUWK+3zGHIObvGfklpi/+ur0X/MIdK
 wQOA==
X-Gm-Message-State: AOAM532+HiqsI8Od63BUrRDUtPJdC8VayDKowujiEfubEftMF9A5r2sA
 OIXeDU/W0O6TJa4YBmc9Zp8UWYf2CTGZnA==
X-Google-Smtp-Source: ABdhPJyFKQo7raujMje4bEw5Mr9qq0w0WtKx4ux3+AsGoMiE8uWhWL66dKG4XxIIXBeF7XYLULK+mA==
X-Received: by 2002:a05:6102:39a:: with SMTP id
 m26mr9173759vsq.29.1642493442928; 
 Tue, 18 Jan 2022 00:10:42 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id e10sm881451vsa.29.2022.01.18.00.10.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 00:10:42 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id p1so34982373uap.9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 00:10:41 -0800 (PST)
X-Received: by 2002:a67:e985:: with SMTP id b5mr7881629vso.77.1642493441373;
 Tue, 18 Jan 2022 00:10:41 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
 <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
 <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de>
 <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
In-Reply-To: <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jan 2022 09:10:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWXWA2h7zrZa_nnqR_qNdsOdHJS=Vf1YExhvs08KukoNg@mail.gmail.com>
Message-ID: <CAMuHMdWXWA2h7zrZa_nnqR_qNdsOdHJS=Vf1YExhvs08KukoNg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd,

On Tue, Jan 18, 2022 at 7:30 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> Also note that using a shadow framebuffer allows to decouple fbcon
> updates and scanout framebuffer updates.  Can be used to speed up
> things without depending on the 2d blitter.

Assuming accesses to the shadow frame buffer are faster than accesses
to the scanout frame buffer. While this is true on modern hardware,
this is not the case on all hardware.  Especially if the shadow frame
buffer has a higher depth (XRGB8888) than the scanout frame buffer
(e.g. Cn)...

The funny thing is that the systems we are interested in, once used
to be known for their graphics capabilities and/or performance...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
