Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB7356FBDC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4838D3B7;
	Mon, 11 Jul 2022 09:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237FB8D3B8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:36:05 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id d18so5494353qtw.8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 02:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DVJUGFx3bR67+/E6+DBeYAU8MgftXdOcu6+8ewnr6LE=;
 b=XbRs5rOGxjpfVNaL1Q7T6XW8/ZVIxdO9TOxcIYdIeFFPjvhfEmANy2FQrISlS3Inbw
 HJohond6LzsHzOL3Blw7+13DaxYYH3ljwXT54whXb80NkWSn2colqSw/A6NdncGm9Dqv
 OLtwnNp9KOhyFpHzb8QfQj8in4+YYxXdpDIqyalrtM7SVxxb4ytkeqXMGnLZHgR38Sin
 wsS7QOMj/0FZlDXdCVYAMU09aWV2UJE64/oB+lETUOGjY2d4aZiY/Jzu2XPlTAVi38BC
 JRYS6TEbMhdFf/1DjYM2pTIBUmnBNr49gb352T6nK0fDYQfEE0VOYTBrMfRLawLuXMHd
 kpog==
X-Gm-Message-State: AJIora+WnUdPOeF4bWz9qKfxCiX75jXx7/CKc6fh9FZ481PgbEcoZ5zo
 b8l/h1u8MSX/CMhbkz+oFWLGhS7XNLF6Bw==
X-Google-Smtp-Source: AGRyM1uLbyntb3RkYqq86k8pmwgNkiPoiqv+ICVUuHOCvGJ5nn+n3LUCtYL+Jzpw1MoQMalDsWtJfg==
X-Received: by 2002:ac8:5852:0:b0:31d:2660:7c57 with SMTP id
 h18-20020ac85852000000b0031d26607c57mr13089356qth.65.1657532163954; 
 Mon, 11 Jul 2022 02:36:03 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 z11-20020ac87f8b000000b0031ea864d3b2sm5277750qtj.30.2022.07.11.02.36.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 02:36:03 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-31c89111f23so43358747b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 02:36:03 -0700 (PDT)
X-Received: by 2002:a81:9209:0:b0:31c:b1b7:b063 with SMTP id
 j9-20020a819209000000b0031cb1b7b063mr18545635ywg.383.1657532162961; Mon, 11
 Jul 2022 02:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657301107.git.geert@linux-m68k.org>
 <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
 <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de>
In-Reply-To: <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Jul 2022 11:35:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqo-_5tyhmx_QqPJhqQdoRDE6_Q7b1AJWeBZc67RsBSA@mail.gmail.com>
Message-ID: <CAMuHMdUqo-_5tyhmx_QqPJhqQdoRDE6_Q7b1AJWeBZc67RsBSA@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/modes: Add support for driver-specific named modes
To: Thomas Zimmermann <tzimmermann@suse.de>
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
 David Airlie <airlied@linux.ie>, Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Jul 11, 2022 at 11:03 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 08.07.22 um 20:21 schrieb Geert Uytterhoeven:
> > The mode parsing code recognizes named modes only if they are explicitly
> > listed in the internal whitelist, which is currently limited to "NTSC"
> > and "PAL".
> >
> > Provide a mechanism for drivers to override this list to support custom
> > mode names.
> >
> > Ideally, this list should just come from the driver's actual list of
> > modes, but connector->probed_modes is not yet populated at the time of
> > parsing.
>
> I've looked for code that uses these names, couldn't find any. How is
> this being used in practice? For example, if I say "PAL" on the command
> line, is there DRM code that fills in the PAL mode parameters?

I guess Maxime knows, as he added the whitelist?
Reading the description of commit 3764137906a5acec ("drm/modes:
Introduce a whitelist for the named modes"), it looks like this is
more about preventing the parser from taking any string as a random
mode, than about adding support for "PAL" or "NTSC"?

Note that drivers/gpu/drm/i915/display/intel_tv.c defines an array of
tv_modes[], including "PAL", so perhaps these end up as named modes?

> And another question I have is whether this whitelist belongs into the
> driver at all. Standard modes exist independent from drivers or
> hardware. Shouldn't there simply be a global list of all possible mode
> names? Drivers would filter out the unsupported modes anyway.

For standard modes, I agree.  And these are usually specified by
resolution and refresh rate (e.g. "640x480@60", instead of "480p").

But legacy hardware may have very limited support for programmable
pixel clocks (e.g. Amiga is limited to pixel clocks of 7, 14, or 28
MHz), so the standard modes are a bad match, or may not work at all.
Hence drivers may need to provide their own modes, but it seems wrong
to me to make these non-standard modes global, and possibly pollute
the experience for everyone.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
