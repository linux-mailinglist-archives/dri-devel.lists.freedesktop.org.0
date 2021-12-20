Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE2147A762
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 10:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D097611A5A0;
	Mon, 20 Dec 2021 09:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6489411A59E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 09:45:59 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id 107so16539308uaj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 01:45:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A95tC6jcivsHHQxGupwpXDqBbjLfwMDd/W7jJ28KIvA=;
 b=WmCHHODHOtNy2yfiy5W1s9kgKTX/osx9YlDieFmub9havt5fyA7+jXTU9r9IZoHo5B
 OZztqMw+eM5DNqtMzbx1j41dbgQBnrZC9JZEbQgUrIDwraeruv2Z0GzXr/6apvxtwaHE
 trCjXpzt7+2jkmftfZb4Tf7UEI0QZCGD0b2ocV97BHi9hx+MRUMjVvC5gjCGDkI8VPp9
 sLoB+U7nkoFfVzxXcAGx3XEFk2s5zl+ThSKPOv1NrUB6A/KGe0B2r+BNjUhu12sz8upW
 2TGguXPBDn/Eju2D+EqTY72Kn7TCPEV2NBqz1ZEtkRr31ifJQzESuruRmZEVyC1t1pBp
 5VMw==
X-Gm-Message-State: AOAM5301jwa7NjbMjSnE2PGRY1NjIStLh7hNyFMrQmtSy5O36PyXroeQ
 WAFZEW1ekGOESZvyhnLbrYIHstJvHJwS0g==
X-Google-Smtp-Source: ABdhPJwGajUlcP9DZA5uvBqGd7HWZzaXbwlC5Ff0rQFnJweteuwqZcdToEpPneo8tiKvmmaoq545gA==
X-Received: by 2002:a05:6102:31ad:: with SMTP id
 d13mr1543266vsh.55.1639993558491; 
 Mon, 20 Dec 2021 01:45:58 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id l28sm3571417vkn.45.2021.12.20.01.45.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 01:45:58 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id 107so16539273uaj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 01:45:58 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id
 r28mr4417990vsg.57.1639993557814; 
 Mon, 20 Dec 2021 01:45:57 -0800 (PST)
MIME-Version: 1.0
References: <20211220084013.242754-1-geert@linux-m68k.org>
In-Reply-To: <20211220084013.242754-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Dec 2021 10:45:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXTRYjtfyWTVN86pn4STO2EPR1B5+KHj=wAqguXt=hpHg@mail.gmail.com>
Message-ID: <CAMuHMdXTRYjtfyWTVN86pn4STO2EPR1B5+KHj=wAqguXt=hpHg@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.16-rc6
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Cc: linux-um <linux-um@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 20, 2021 at 10:25 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> JFYI, when comparing v5.16-rc6[1] to v5.16-rc5[3], the summaries are:
>   - build errors: +1/-5

  + /kisskb/src/drivers/gpu/drm/ttm/ttm_module.c: error: 'struct
cpuinfo_um' has no member named 'x86':  => 71:24

um-x86_64/um-allyesconfig

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/a7904a538933c525096ca2ccde1e60d0ee62c08e/ (all 90 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/2585cf9dfaaddf00b069673f27bb3f8530e2039c/ (all 90 configs)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
