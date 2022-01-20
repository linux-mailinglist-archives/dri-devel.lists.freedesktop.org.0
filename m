Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA04C494DAC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 13:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D139010E5A1;
	Thu, 20 Jan 2022 12:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F108110E55E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 12:13:56 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id w21so10402779uan.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 04:13:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=olNvo1hlOps7yRNGdWPhIvGrV31s5RQbZPcE1Lfk/FY=;
 b=TZf3f5V9Qt40mS/aGcvyDdvzeJ2AgL4BhGP3x59W9ga20Uvsb16SjXEtb6BYCK+zxZ
 VD2quA9aU+mYwCppeYvU17eDcoOjjoh/tvIKvk+t1vjGc+D6Wdc/kRuubciYFksAJKsg
 uYZTT+KIPsfWFhPPJPNXLaFHZbvPcG4/5cQhZ89aUUM1TBVak5Sz6a6bIv87z2CEIgRN
 7b+GooGkbpAw98D46uC5X4gBwfTfhT/VF7ofwjimKhItnUZwq4t+BlQ74AoWPeP88yMk
 uLRfCNYQcx1zGh2orSyEP0o1yNm6PFmLl/cW8/Xlmvkh5qU7d6ne9K0DYtQ6jpNxW68H
 RGLw==
X-Gm-Message-State: AOAM532BfrEmb2BST9IskBM3AX9flRSGbbfpLUnmBbEl5aMqURiaMEG3
 WLvoFNpB0JbS1tfKBubwXnAk9HpSImC4mA==
X-Google-Smtp-Source: ABdhPJyWlbej2AVqKNV4B1QRmOzaeyUiONuQDIeqdvMT4efcYAk7kRh5KfkzGWLoFDwaA4x9uI7QVw==
X-Received: by 2002:a05:6102:316d:: with SMTP id
 l13mr12781319vsm.21.1642680835867; 
 Thu, 20 Jan 2022 04:13:55 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id h7sm424904vsg.10.2022.01.20.04.13.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 04:13:55 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id m90so10481883uam.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 04:13:55 -0800 (PST)
X-Received: by 2002:a67:e055:: with SMTP id n21mr551166vsl.57.1642680834901;
 Thu, 20 Jan 2022 04:13:54 -0800 (PST)
MIME-Version: 1.0
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <87bl0amc6s.fsf@x1.stackframe.org> <20220118103323.4bae3a7d@eldfell>
 <20220118095352.xsb6fqacw4p276c5@sirius.home.kraxel.org>
 <CAMuHMdWV+-+Jr7HggbfH_GEDcdep4pJLiMG+15jxBvQ91BCS0w@mail.gmail.com>
 <CAKMK7uEOFg3z2btFERQ5XBQ7hqex6bXCb9X=SdwCjeLfX_SdFw@mail.gmail.com>
In-Reply-To: <CAKMK7uEOFg3z2btFERQ5XBQ7hqex6bXCb9X=SdwCjeLfX_SdFw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Jan 2022 13:13:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjv1+UNeXkCBE+80tdtLuNg=5d6N12hNLgJdaS-jxERg@mail.gmail.com>
Message-ID: <CAMuHMdVjv1+UNeXkCBE+80tdtLuNg=5d6N12hNLgJdaS-jxERg@mail.gmail.com>
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
 Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Thu, Jan 20, 2022 at 12:33 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Jan 20, 2022 at 10:06 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Thu, Jan 20, 2022 at 4:29 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > On Tue, Jan 18, 2022 at 10:33:23AM +0200, Pekka Paalanen wrote:
> > > > On Mon, 17 Jan 2022 19:47:39 +0100
> > > > Sven Schnelle <svens@stackframe.org> wrote:
> > > > > I also tested the speed on my Thinkpad X1 with Intel graphics, and there
> > > > > a dmesg with 919 lines one the text console took about 2s to display. In
> > > > > x11, i measure 22ms. This might be unfair because encoding might be
> > > > > different, but i cannot confirm the 'memcpy' is faster than hardware
> > > > > blitting' point. I think if that would be the case, no-one would care
> > > > > about 2D acceleration.
> > > >
> > > > I think that is an extremely unfair comparison, because a graphical
> > > > terminal app is not going to render every line of text streamed to it.
> > > > It probably renders only the final view alone if you simply run
> > > > 'dmesg', skipping the first 800-900 lines completely.
> > >
> > > Probably more like "render on every vblank", but yes, unlike fbcon it
> > > surely wouldn't render every single character sent to the terminal.
> > >
> > > Also acceleration on modern hardware is more like "compose window
> > > content using the 3d engine" than "use 2d blitter to scroll the window".
> > >
> > > > Maybe fbcon should do the same when presented with a flood of text,
> > > > but I don't know how or why it works like it works.
> > >
> > > fbcon could do the same, i.e. render to fbdev in a 60Hz timer instead of
> > > doing it synchronously.
> >
> > Hopefully only the parts of the screen which need a redraw?
> >
> > Not all displays can be updated that fast. For a "modern" example, see
> > https://patchwork.freedesktop.org/series/93070/.
>
> drm does damage tracking throughout the stack, e.g.
>
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#damage-tracking-properties
>
> And unlike fbdev, it's explicit (so less overhead since userspace
> generally knows what it's drawn) and doesn't rely on page fault
> intercepting and fun stuff like that.

My reply was to a paragraph about rendering text by fbcon, not about
userspace rendering graphics.

> Like do people actually know what drm can and cannot do, or would that
> take out all the fun?

;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
