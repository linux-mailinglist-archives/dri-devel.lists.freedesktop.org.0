Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B12A46163
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 14:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6359610E826;
	Wed, 26 Feb 2025 13:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="GRjVeGY6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE3110E378
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 13:55:55 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-471fe5e0a80so56815001cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 05:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1740578152; x=1741182952;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WhUvj0RFZy69SqBW6GfxIwgPOzkEGSiBv5ZaFs5vLVs=;
 b=GRjVeGY6a1e+nvPxhXDEmwVNfwrutojjjZSFw16tSzAj/kSCFeKga6tNFc5o+McvgC
 1P8jkVEAeAn/TlOKRg2fHBPQZj33rg2I5PgzzM4x0PM80Y4IsxrzCcpwLxYj+6M3kYFo
 OHJeYcYPX2h3NrgeHhp7aZ1UudkVcWTM+emsOjVxr9if5WsKcNDI+lhYwHbHpkaqJbnP
 1i4pj5k1frhcVBhmc66DmFIXC3mqaqy6W5+RsFXG9MNnSR2eine5AGOgMEYe1SjrZ+Vv
 lBW6wldYGtaojainOtwZTulPPivqtOPvi2rsv24XuVAdRLvxEQf+llDBRkS8af5Ei5D0
 M0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740578152; x=1741182952;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WhUvj0RFZy69SqBW6GfxIwgPOzkEGSiBv5ZaFs5vLVs=;
 b=fhOR4btPbNsCr6wm8unIyFZmfyzx9/wJVfMmIsGFfjQcdCJtcAr8Nw47BiX6Ub8C1o
 S8t6Bks943l9fAEAe/quNi1vOI+WUteNRt3tA5tvnvYP1Bt2Mfr5G0B5jquz/c2xPY1f
 0msGcidCLqW2bCqqADvNrUy+G0FBRmJ2WMd0S0xuRkDNXalEnIYCKLH2/o12yLJYRk/b
 B1wC80VqiYbWN/7xKBe5j2+CxWlpN2wGLqKRRCtwXaM9ZJnOnwx7kbJp3rY6S1OWaRPu
 /Yh2NtnavGvHOyRu8d/iS5+KtD3llUByo5eJyRbCHwVGZ6KYGV5ls8pa8bmZFomp8Pty
 /F+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBkt/eY6JG8T919hmekXhigSzlBEWJxkr9l0QnHqT2o/huzUQL9VJxXYwyzTuBfQd+Ie1yzCM5qkE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjrP/Rs4FLa7q/M/chXuFPPHnyNrPkV415mIWyFMhv9t0nnrE3
 npkkIc8Yyq8pk8ugFap2xjJTjnqjw1eWvRLmplUoffLn7F6kblQ9CuBYWMwqMT3jJiAl+hxHT0P
 keszmp26bbuf9/jAqmq528N0AYL19PStanI2duw==
X-Gm-Gg: ASbGnctiHWU4iUU6rRrkk+CMAHCCRtxnzBgMRQz+4MEDJr2zvVekncwXHpUP1Gwk2Aw
 dELuUeZrubd8iLgAQQj+wmottgEHcNia80ewAY5TRlW0lGbNHcTtSu3q00HfixelWMCsLVI7Cjg
 nLQhF8vE0semOAd4Aj3pIsN4k=
X-Google-Smtp-Source: AGHT+IF9JNVuuN8bPIEslvqP08Rm/fPznkmgjxA71qYbkp5tsuuoVM8OWD850Rm891NlxodE4XcG6gIPGkpGJXT6eNs=
X-Received: by 2002:a05:622a:1a1b:b0:472:1812:23d3 with SMTP id
 d75a77b69052e-47224716f88mr242782461cf.10.1740578151740; Wed, 26 Feb 2025
 05:55:51 -0800 (PST)
MIME-Version: 1.0
References: <20250225-apple-twiddled-modifiers-v2-1-cf69729e87f6@rosenzweig.io>
 <CAPj87rO3N2=3mNQg8-CUF=-XTysJHLmgArRKuvDpdk3YZ2xMvQ@mail.gmail.com>
 <Z75BwWllrew-DIlS@blossom>
In-Reply-To: <Z75BwWllrew-DIlS@blossom>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 Feb 2025 13:55:40 +0000
X-Gm-Features: AWEUYZlVeaWaGooIARJfI13M5E2woUVblHaLAgLiu0Mf6aUTrS-ZPIVERoXVQWc
Message-ID: <CAPj87rMpSbaOe0qEU8x-VFCGOvoWpyRURr=0bJ80=cdkTQiAbQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: add modifiers for Apple GPU layouts
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
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

Hey,

On Tue, 25 Feb 2025 at 22:18, Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
> > > These layouts are notably not used for interchange across hardware
> > > blocks (e.g. with the display controller). There are other layouts for
> > > that but we don't support them either in userspace or kernelspace yet
> > > (even downstream), so we don't add modifiers here.
> >
> > Yeah, when those have users with good definitions matching these, we
> > can add them here, even if they are downstream. Anything the GPU would
> > share out of context, or the codec, would be good for this.
>
> Sure. The mentioned "other layouts" are for scanout (GPU->display), and
> apparently the GPU can render but not sample them... You can imagine
> about how well that would go without a vendor extension + compositor
> patches......
>
> (Currently we use linear framebuffers for scanout and avoid that rat's
> nest.)

Heh, impressive. Are those the twiddled-but-not-tiled ones?

> > > +/*
> > > + * Apple GPU-tiled layout.
> > > + *
> > > + * GPU-tiled images are divided into tiles. Tiles are always 16KiB, with
> > > + * dimensions depending on the base-format. Within a tile, pixels are fully
> > > + * interleaved (Morton order). Tiles themselves are raster-order.
> > > + *
> > > + * Images must be 16-byte aligned.
> > > + *
> > > + * For more information see
> > > + * https://docs.mesa3d.org/drivers/asahi.html#image-layouts
> >
> > This writeup is really nice. I would prefer it was inlined here though
> > (similar to AFBC), with Mesa then referring to the kernel, but tbf
> > Vivante does have a similar external reference.
>
> Thanks :-) I wasn't sure which way would be better. Most of the
> complexity in that writeup relates to mipmapping and arrayed images,
> which I don't think WSI hits...?

Yeah, anything that wouldn't be exported out of a GPU API context
doesn't need to be in here!

> Also, the Mesa docs are easier for me
> to update, support tables and LaTeX, have other bits of hw writeups on
> the same page, etc... so they feel like a better home for the unabridged
> version.  And since Vivante did this, I figured it was ok.
>
> If people feel strongly I can of course inline it, it's just not clear
> to me that dumping all that info into the header here is actually
> desired. (And there's even more info Marge queued ...
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33743/diffs?commit_id=5ddb57ceb46d42096a34cbef1df6b4109ac2b511
> )

I don't feel strongly about this btw, was just thinking out loud, and
also lets you move asahi.html around (e.g. split into subpages)
without having to worry about breaking old links.

> > The one thing it's missing is an explicit description of how stride is
> > computed and used. I can see the 'obvious' way to do it for this and
> > compression, but it would be good to make it explicit, given some
> > misadventures in the past. CCS is probably the gold standard to refer
> > to here.
>
> Ah, right -- thanks for raising that! I'll add this for v3. Indeed, I
> picked the "obvious" way, given said misadventures with AFBC ;)
>
> This is the relevant Mesa code:
>
>    /*
>     * For WSI purposes, we need to associate a stride with all layouts.
>     * In the hardware, only strided linear images have an associated
>     * stride, there is no natural stride associated with twiddled
>     * images.  However, various clients assert that the stride is valid
>     * for the image if it were linear (even if it is in fact not
>     * linear). In those cases, by convention we use the minimum valid
>     * such stride.
>     */
>    static inline uint32_t
>    ail_get_wsi_stride_B(const struct ail_layout *layout, unsigned level)
>    {
>       assert(level == 0 && "Mipmaps cannot be shared as WSI");
>
>       if (layout->tiling == AIL_TILING_LINEAR)
>          return ail_get_linear_stride_B(layout, level);
>       else
>          return util_format_get_stride(layout->format, layout->width_px);
>    }
>
> I can either copy that comment here, or to make that logic more explicit:
>
>     Producers must set the stride to the image width in
>     pixels times the bytes per pixel. This is a software convention, the
>     hardware does not use this stride.

Hrm. I guess more in keeping with how it's used in other APIs, as well
as more kind of future-proof in the sense of not needing possibly
gen-specific rounding everywhere, would be to pass (n_tiles_h(buf) *
tile_size_bytes) / n_rows_in_tile(format). That gives you the same
information as you get for other users of stride, and might help make
things more explicit for small tiles as well? Plus would apply pretty
obviously to compression.

I know it seems pretty inconsequential, but it does help for utils
which e.g. dump and copy content. And makes sure no-one can make some
dumb assumptions and get it wrong.

Cheers,
Daniel
