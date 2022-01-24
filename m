Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2D44983D6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 16:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF0710E18F;
	Mon, 24 Jan 2022 15:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA9A10E31B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 15:50:52 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id 2so31786704uax.10
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 07:50:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CbVkEbxTIR+WGNzjkBEYilBK2bcgVTSN3u2lPmmlm40=;
 b=NDfGQD+6MYWzA4yIhNVxOcNFja8UGvSe5Hz4ZfYqW5ttwKS4un4ms2fAOEXzhvIxJP
 6jEUqxcRhfwCsKenAu6OZgkG3oOfpDLxXOKCrOL4UiTFWmoaoASDdB4BX88A7nLYzacT
 giMc5ya909FMwose05mh25bs0HMSIAHwg+Xn5u5d+WuyeQrGcTbVJduTGauuIih9z0T8
 2yQNKMq/D2unRtVlVrAclliLWMePKAgWjgJJdCTd5rveuOb7tUR9KUWFKmd0R8mx7a9X
 AzcjGatxCjX634sj+WH54qc3PIcQsm0fRT4Tn2tIVumklgRBS3d2okqxwtU9YLPTDgfE
 +bwA==
X-Gm-Message-State: AOAM531ErMlvSPqVNT8EXnim5ULJ3VjVLwbCQgj4Gkr3TU6FJijqr6jJ
 6sG2n3M5Bq3yTLyFV7YpajGkVtFXYjgCvg==
X-Google-Smtp-Source: ABdhPJz03YrDDNrw9QgSF0qMJJtVNPXjpEt5xBSrAnYHisI3mRFm2mRQGP93piLH9mzeVCiifc2fyA==
X-Received: by 2002:a67:f509:: with SMTP id u9mr5859573vsn.35.1643039451370;
 Mon, 24 Jan 2022 07:50:51 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com.
 [209.85.221.179])
 by smtp.gmail.com with ESMTPSA id v2sm2989329vkf.44.2022.01.24.07.50.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 07:50:51 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id j185so6731169vkc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 07:50:50 -0800 (PST)
X-Received: by 2002:a1f:1b46:: with SMTP id b67mr2965993vkb.20.1643039450695; 
 Mon, 24 Jan 2022 07:50:50 -0800 (PST)
MIME-Version: 1.0
References: <20220119110839.33187-1-deller@gmx.de>
 <20220119110839.33187-3-deller@gmx.de>
 <YelyGDNDTn1Aq/hm@phenom.ffwll.local>
 <6c000477-002b-d125-b945-2c4831bad8a5@gmx.de>
 <20220121072006.ylw2hdl7jbkbwnre@sirius.home.kraxel.org>
 <64fd46cb-9746-3fd0-ec92-c64dba76875a@gmx.de>
 <d23800b4-503c-a6e2-2c51-2c07a736dffc@suse.de>
In-Reply-To: <d23800b4-503c-a6e2-2c51-2c07a736dffc@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jan 2022 16:50:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXu_paBcNhevgxXzr1pEes7qWtD=RHXTrqP=hxNBkupnw@mail.gmail.com>
Message-ID: <CAMuHMdXu_paBcNhevgxXzr1pEes7qWtD=RHXTrqP=hxNBkupnw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "fbcon: Disable accelerated scrolling"
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
 Sven Schnelle <svens@stackframe.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 12:33 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> With fbdev emulation, every DRM driver is an fbdev driver too. So

Some are even without?

drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:     ret = register_framebuffer(info);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
