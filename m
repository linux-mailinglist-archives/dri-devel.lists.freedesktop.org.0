Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2F74A6FA5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 12:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47C310E9DA;
	Wed,  2 Feb 2022 11:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFDF10E626
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 11:11:01 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id k17so59781913ybk.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 03:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5o2JVyWPjvF0CuBYdtH6rf3OCwSu8v5z/m2E3EDxEVQ=;
 b=6JC4qWqQoyur6n49lXlwJ8argU2sfdQwrI+5UZ/cAgJfz/Wny6UxNwpfY4nKvjDOf4
 bC8yqlshTJqy2m9fSfRZx1mHvZHvU9NCnbTm2Hz8QKFGXNmTLuF2q/PQPQcJnF2rdPfI
 7EQ8tQsgBfjmBUJ7GKHlLlmXRyoppvNp37bOKrZ4l/v573+8dKE7AtQOjDIqDzNUrl5O
 M5dmxC6WklOEBh19YK8riY5u60LO+BbHsdTedAZO8mKbSRT+bkvd5WqWMzTGa0MP8bsy
 i2QRtLbgjqRDiIiagTRyBHl/amtF7ScuFdW7LxgXu1qUFnOZTEOkenxrGPpIREqp5/KT
 gUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5o2JVyWPjvF0CuBYdtH6rf3OCwSu8v5z/m2E3EDxEVQ=;
 b=r2RCWsc6vnYbo0DiWVScx/LJi4cw92rTehS2UkYxLKOKP3vN/vle6Dg1DmptiXXAyD
 d6AaqZvUd3m1YQfRITbTHAppsmm2EcgOwfl3FntRc8lA5qUDFlOH/oV/MRPwNs5HhxwQ
 cjzjK8znw+ZpH51FXADK7Bzn/aQM8A7FhEJ/XmEr4u6OVqe4//2CqZmNtw4zvfVL39fQ
 KPtFG2JIbN1KVrGbACH6uEZ7Hh8Dy9RJl7ZThqD7FSVJ/MyPHfgb7JcRvrOnu6Hi0Q+M
 mfqHneWlmLs/UM/2DDjHnCGEEUDaQRHTtaXsK78a9QKdMSknF00eUD2UvDfF+4bbsWN1
 BK+w==
X-Gm-Message-State: AOAM533GWQnj5AQ4vazi3rMYCZk1iMOOLyG2BSrsxWU6xAwBNDrqNXNJ
 cdE6ZalEcwyWeesIrYw5fFfVbcvUFbOvWbDHJH6POA==
X-Google-Smtp-Source: ABdhPJxXYTqOt/oSe5PrM2Wrpx8vatAUxY/eNAT3jcriiGBCZwZLVaTevoVERbyDMHiO0clxqoChrMTzgZvvtsyVmcE=
X-Received: by 2002:a25:a206:: with SMTP id b6mr20061500ybi.707.1643800260369; 
 Wed, 02 Feb 2022 03:11:00 -0800 (PST)
MIME-Version: 1.0
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20220131210552.482606-2-daniel.vetter@ffwll.ch>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 2 Feb 2022 11:10:49 +0000
Message-ID: <CAPj87rMhkdtoUHTB4y4HLR8KM2tPkQCufFcHbvA0_xHycCHmhg@mail.gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Sven Schnelle <svens@stackframe.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 Jan 2022 at 21:06, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
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

Acked-by: Daniel Stone <daniels@collabora.com>
