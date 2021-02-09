Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6C1314988
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 08:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5DB89F47;
	Tue,  9 Feb 2021 07:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AE089F41
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 07:27:21 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id g84so4675453oib.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 23:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sILkwtDn3JoEPpo6zGHf10MfJG83PGIkgxT7Ix5AHqk=;
 b=JfjyV5DFxkq6jXX9kO2rx+JDUSmHvsqf8OrhXI5plYv8QYCBIl9tX6JewmcbYQGy+P
 sxLtTGkDLhG02mzvsi7uhcjYEk7fWuThRNezfd+mBAQlDTs5eWLb82eOdTUjqyS+tc8o
 7cogTGL60nZcIQBUsMnAZEO5gUX1/wZcEkkdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sILkwtDn3JoEPpo6zGHf10MfJG83PGIkgxT7Ix5AHqk=;
 b=QmbjA45wX3i6pQyZMViSnh3QZ+0MP3sPt9pg3FAVoWtzvGCl6JRUgPZb4Nr/wyeMnO
 tD0lVPAssP30+NJ7TQIlEjCZr2vgk9T5XdetwuM/ZY9H7MJIUzJG1D9WH4uoxO3IRPZC
 0pq3Qf93Peot7p5O/jtrQRAtAZAJgCGjhJjSzXScyZBiwqAxJvQ54hUEoxWMBuzdU9Yz
 8vgtx67eBUbfZBtYkVMO71rtyDPl79t3wIALX6ei7WKHnbPqkc8ivcBWU6m0a5tT4goC
 sZDwMTxgIDBiWW2VSMHoIW4WMhS2uVmh1KEorkbc0wFWSwDltjlcw3C9EQ+8oUmjqVM4
 +o6w==
X-Gm-Message-State: AOAM531cm6/rStMZMAAQDEQmwA0aDbSHqSz5xkmqXRAhS/G2e2wUVMkd
 OT/X2fBeoC3714uStKbO13LjmOJrUWZMboITfy4eQw==
X-Google-Smtp-Source: ABdhPJwO9wTNm5HjwxSO/6hVcvFDDglf4pEhgq2b47TPZwEp7/NcpTfBUUP9WtrLK7xCQQ25aA+bOrW/vb6Xi0WC1nY=
X-Received: by 2002:a05:6808:294:: with SMTP id
 z20mr1605603oic.14.1612855641261; 
 Mon, 08 Feb 2021 23:27:21 -0800 (PST)
MIME-Version: 1.0
References: <20210208200903.28084-1-sakari.ailus@linux.intel.com>
 <20210208200903.28084-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20210208200903.28084-4-sakari.ailus@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 9 Feb 2021 08:27:10 +0100
Message-ID: <CAKMK7uEsRvhrw4v5yGhbCZV1=EOVY3X7vzdQc6zroPT2EX4J7Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] drm/fourcc: Switch to %p4cc format modifier
To: Sakari Ailus <sakari.ailus@linux.intel.com>
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
Cc: Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Joe Perches <joe@perches.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 8, 2021 at 9:20 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Instead of constructing the FourCC code manually, use the %p4cc printk
> modifier to print it. Also leave a message to avoid using this function.
>
> The next step would be to convert the users to use %p4cc directly instead
> and removing the function.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 03262472059c..4ff40f2f27c0 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -30,11 +30,6 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_fourcc.h>
>
> -static char printable_char(int c)
> -{
> -       return isascii(c) && isprint(c) ? c : '?';
> -}
> -
>  /**
>   * drm_mode_legacy_fb_format - compute drm fourcc code from legacy description
>   * @bpp: bits per pixels
> @@ -134,17 +129,12 @@ EXPORT_SYMBOL(drm_driver_legacy_fb_format);
>   * drm_get_format_name - fill a string with a drm fourcc format's name
>   * @format: format to compute name of
>   * @buf: caller-supplied buffer
> + *
> + * Please use %p4cc printk format modifier instead of this function.

I think would be nice if we could roll this out and outright delete
this one here ... Quick git grep says there's not that many, and %p4cc
is quite a bit shorter than what we have now.
-Daniel

>   */
>  const char *drm_get_format_name(uint32_t format, struct drm_format_name_buf *buf)
>  {
> -       snprintf(buf->str, sizeof(buf->str),
> -                "%c%c%c%c %s-endian (0x%08x)",
> -                printable_char(format & 0xff),
> -                printable_char((format >> 8) & 0xff),
> -                printable_char((format >> 16) & 0xff),
> -                printable_char((format >> 24) & 0x7f),
> -                format & DRM_FORMAT_BIG_ENDIAN ? "big" : "little",
> -                format);
> +       snprintf(buf->str, sizeof(buf->str), "%p4cc", &format);
>
>         return buf->str;
>  }
> --
> 2.29.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
