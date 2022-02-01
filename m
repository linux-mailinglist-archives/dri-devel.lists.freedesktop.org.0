Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BB84A5EA5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 15:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBE5897E7;
	Tue,  1 Feb 2022 14:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFDB897E7;
 Tue,  1 Feb 2022 14:54:23 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id g23so16396425vsf.7;
 Tue, 01 Feb 2022 06:54:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kzlQhpMq4Ctc2cxxIgF+2UWQv9yJB23c2S2KJFtJK5I=;
 b=6FqFHjaUpd76nFGGItAXHp024OnlYysYVzecj6GKbtcm/IIiFOuAwWxq58zCqHd9pe
 SkdMcTiYB01wr3GNvrOfZuI8/VWUmDH9YED+oSQ6wthEAk0+qVw+bWtJXnciAe6QUqJs
 ghVLewq6SR3urt/iAVwIJmFuzWEdfrROX/u+EI6fKkQjD1fRLLrpnHm60/iwFnOTAV8E
 queKgL0P1kz95aBekcEI1l6ZFL4RewlnwtSfh3LvoJVPwxR+HlcgqzmeKkFw4bGinwT+
 78CneY6kH8hvFifrU/j7eMiZRQRV7VEek9W7UG11IJWFyP9ZX8wiL0nSW2MmSTdVMRm7
 J2gA==
X-Gm-Message-State: AOAM53147PwMyd0sagLqrFgaLWZjcuHGvmVXd9DLp1CEg/bk7jczbsaH
 ukbzRdn+q5CGnNZ8L/uyvdNzkzfTej1KSw==
X-Google-Smtp-Source: ABdhPJwc74gimCEKSIa1PuifUZU1Rok2rXslqo11+/u/lHLWXv11rDe9ZcF/NNTP2b86VvCdcPI4vQ==
X-Received: by 2002:a67:c094:: with SMTP id x20mr9760497vsi.57.1643727262383; 
 Tue, 01 Feb 2022 06:54:22 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44])
 by smtp.gmail.com with ESMTPSA id y18sm4923930ual.15.2022.02.01.06.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 06:54:22 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id v62so16403181vsv.4;
 Tue, 01 Feb 2022 06:54:21 -0800 (PST)
X-Received: by 2002:a67:a401:: with SMTP id n1mr9369281vse.38.1643727260868;
 Tue, 01 Feb 2022 06:54:20 -0800 (PST)
MIME-Version: 1.0
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20220131210552.482606-2-daniel.vetter@ffwll.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Feb 2022 15:54:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWxFFMJ6W70SJzJynfAuqF=NjHbx64-=vgo=FQL_fqNVA@mail.gmail.com>
Message-ID: <CAMuHMdWxFFMJ6W70SJzJynfAuqF=NjHbx64-=vgo=FQL_fqNVA@mail.gmail.com>
Subject: Re: [PATCH 01/21] MAINTAINERS: Add entry for fbdev core
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 DRI Development <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sven Schnelle <svens@stackframe.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 10:06 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> Ever since Tomi extracted the core code in 2014 it's been defacto me
> maintaining this, with help from others from dri-devel and sometimes
> Linus (but those are mostly merge conflicts):
>
> $ git shortlog -ns  drivers/video/fbdev/core/ | head -n5
>     35  Daniel Vetter
>     23  Linus Torvalds
>     10  Hans de Goede
>      9  Dave Airlie
>      6  Peter Rosin
>
> I think ideally we'd also record that the various firmware fb drivers
> (efifb, vesafb, ...) are also maintained in drm-misc because for the
> past few years the patches have either been to fix handover issues
> with drm drivers, or caused handover issues with drm drivers. So any
> other tree just doesn't make sense. But also, there's plenty of
> outdated MAINTAINER entries for these with people and git trees that
> haven't been active in years, so maybe let's just leave them alone.
> And furthermore distros are now adopting simpledrm as the firmware fb
> driver, so hopefully the need to care about the fbdev firmware drivers
> will go down going forward.
>
> Note that drm-misc is group maintained, I expect that to continue like
> we've done before, so no new expectations that patches all go through
> my hands. That would be silly. This also means I'm happy to put any
> other volunteer's name in the M: line, but otherwise git log says I'm
> the one who's stuck with this.

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
