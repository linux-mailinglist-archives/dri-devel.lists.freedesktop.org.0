Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1A9498876
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 19:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF74A10E673;
	Mon, 24 Jan 2022 18:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B879010E673
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 18:39:08 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id u6so32858660uaq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 10:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e8r8scPQjT8uH8pXGowu/+E5c7EtaUCFQ6Gv6NPqtrM=;
 b=YLWrMwQV2VvBYvo3NIOM9drsqEayk4W3UjSwuy51q1vSphXdrLTDodmztuu6ZRKzuE
 pZL98/EL9PTbcL37kAY+hLj0F1YyTwul8uChHw9nhckgQB0OkGkQyD3jpHoDof/hw2Cn
 1e/arNn0fWqS756e/UifHBbMOZ72NltqyrFI+aX7Pn7jCi1QjipZ6KjiOa0z3Vx2G5q0
 zHKcbNdcr7Lx2/5UL2wq83EZBTX2LyYqM6Vq2JWYyREtziUt90yz0kyiDzBjlL1seDnU
 6GKAyrVqdQeRWXiUm0lEDKZImg/SgnlQRBGNDthp8JsWVfhG4kFUimqFhC0/pw7+zax3
 AF1Q==
X-Gm-Message-State: AOAM532zERD/mgOuwW/r0KAQ8Tm1ezhZEVXNpoc3YZrTKtcSN5+4abg1
 PWPJlAAbJ+8YB3+JZ/yoUuMKH6vUW1mkhA==
X-Google-Smtp-Source: ABdhPJyh/Jn8/j38DmPN1VHbbUILMXmTRPb9o6Ta4wzIMOUTzc24r6cwjVRL0+3tpFU1M+/pa1+lhw==
X-Received: by 2002:a9f:364c:: with SMTP id s12mr5995591uad.60.1643049547641; 
 Mon, 24 Jan 2022 10:39:07 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com.
 [209.85.221.182])
 by smtp.gmail.com with ESMTPSA id z27sm1287633vsf.24.2022.01.24.10.39.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 10:39:06 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id z15so7532384vkp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 10:39:06 -0800 (PST)
X-Received: by 2002:a05:6122:ca1:: with SMTP id
 ba33mr1920131vkb.39.1643049546088; 
 Mon, 24 Jan 2022 10:39:06 -0800 (PST)
MIME-Version: 1.0
References: <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
 <CAKMK7uE7jnTtetB5ovGeyPxHq4ymhbWmQXWmSVw-V1vP3iNAKQ@mail.gmail.com>
 <b32ffceb-ea90-3d26-f20e-29ae21c68fcf@gmx.de>
 <20220118062947.6kfuam6ah63z5mmn@sirius.home.kraxel.org>
 <CAMuHMdWXWA2h7zrZa_nnqR_qNdsOdHJS=Vf1YExhvs08KukoNg@mail.gmail.com>
 <3f96f393-e59d-34ac-c98b-46180e2225cd@suse.de>
 <20220120125015.sx5n7ziq3765rwyo@sirius.home.kraxel.org>
 <CAKMK7uF-V20qWTxQLvTC6GjC8Sg+Pst+UJ3pWCLQ4Q7Khgy62g@mail.gmail.com>
In-Reply-To: <CAKMK7uF-V20qWTxQLvTC6GjC8Sg+Pst+UJ3pWCLQ4Q7Khgy62g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jan 2022 19:38:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWS3rYUUB8HQcpjq0pY28cLiPMGrYEXeSPVtr-a_rrQvQ@mail.gmail.com>
Message-ID: <CAMuHMdWS3rYUUB8HQcpjq0pY28cLiPMGrYEXeSPVtr-a_rrQvQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
To: Daniel Vetter <daniel@ffwll.ch>
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
 Linus Torvalds <torvalds@linux-foundation.org>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Fri, Jan 21, 2022 at 9:55 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> Just to clarify, since we had lots of smaller and bigger
> misunderstandings in the thread thus far: DRM_FORMAT_RGB332 exists, so
> drm support that already. The fbdev emulation doesn't yet, but all
> that's needed for that is filling out the code to remap the drm
> description to the fbdev format description for this case. Plus
> testing it all works ofc with fbcon and whatelse. Note that RGB332  is
> a bit more work than e.g. C4, since atm fbdev still uses only bpp to
> identify formats, so would need to be switch over to drm_fourcc first
> before adding anything which aliases with something existing (we have
> C8 already wired up).

I doubt that RGB332 would be a bit more work than C4, as RGB332 is still
8 bpp, while C4 is less.  To support C4, all DRM code that cannot
handle format->cpp[0] < 1 or drm_format_info_block_width() > 1 has to be
fixed first.

On the plus side, I finally got my proof-of-concept Atari DRM driver
working with fbcon on ARAnyM.  Mapping /dev/fb0 from userspace doesn't
work (fbtest SEGVs while reading from the mapped frame buffer).  I don't
know yet if this is a general issue without deferred I/O in v5.17-rc1,
or a bug in the m68k MM code...

So far it supports C8 only, but I hope to tackle C4 and monochrome soon.
Whether the end result will be usable on real hardware is still to be
seen, but at least I hope to get some DRM code written...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
