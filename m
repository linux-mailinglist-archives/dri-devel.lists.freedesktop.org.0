Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD5A8C0D72
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 11:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E278710E681;
	Thu,  9 May 2024 09:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="s+xAWd2d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB3510E65D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 09:23:30 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6a071595d22so3408036d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 02:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1715246609; x=1715851409;
 darn=lists.freedesktop.org; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nCxyHA4H0zlDgKUBRKhP1uHW5cceyxKQ1uLbmFwQQPk=;
 b=s+xAWd2dxl/nmxaPN/9PIZOg/E1Vs8u52o21jMyUa4mMos1XhBtc51x6tMOz3aRrDV
 c5IjgAUtN4ix8a9JrHdU8Ju+pBaVHSDTnwIUYeIJSgidJeEY+gBWsYQZQ2WXpzCPcgv+
 QmlfQLkVZHDl2RoZpNmr0XCvUr5smcgJOsDt0FFj2/BF2rIvO/a5PO/wjRBG8ZERBxQ3
 Dr+WJAqGxJztO6298jdTpPTSCPuqBPg6gxbOEFl1ome2UDwJxUk2G0tIIulZFmMxDcHp
 5kpvU08a3PUyjH4ckKbcbD7XVptTbdqld6Sn3TZ4L/bhg6Ea+IM1VhV58rNbI1T9SoPv
 Jykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715246609; x=1715851409;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nCxyHA4H0zlDgKUBRKhP1uHW5cceyxKQ1uLbmFwQQPk=;
 b=Wl5NPSLUCmloAUIdNIhYmHcATvToFtu+7xr9JG+9ylPsn55WJsxxfjRrOCS0cUSOZO
 VX54xBHqaLyIB7510y+K0Z82xWK1Gt73wAuZsOLYIBghPs1WgNYW6UiEy809i/F4nWvA
 p0FwJ2b5jVHvbmFNIIklGH/EizwugsHY8W9sGmQsZjCEq3IwaMdnIbsxevk/yteIaFnY
 UZM6dB+zvBa4SI8qjwY02wQ5nf9MF+EhkeERcF3TVe5GVBTEK3rMQRChinYJUFJbs7yZ
 DIm5GLnCTsOdWcwy+gcCieRxxM8g46ETk5EnOeC4xtOztXg2zPEbvuzbn2tAbBjV7Ulm
 RoRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQuyj2b8jS4wCF7AD1wbbhyYyVQtdOGyuEOpL+tf397Vspv+Db8dzbgy5SL6Jx31RNj0Jz06Ia9CTvWHitLHcR7HzuorJQm2GCIDJRKr9j
X-Gm-Message-State: AOJu0YzFUakkEwzX/8GEIO6kyDFvfnPF7iQBhq7lGV9H35D+TN2ReTQo
 2M5FdxsH5veCc9R6KKZEc0tqzJ4Si1nn5EWuc6Qc4JjRPYLwsh3zTwYwZQGs3ASL4AjV7nBgYP5
 mBy9hsOPMPfCeuJGaFS8BHApZ/Nn+Frtq0cf04Q==
X-Google-Smtp-Source: AGHT+IF6PhCgk1o7f4b1gc4aesQqVT1tyRMXdb/II5WaUUVRVGN+oa4txBNRnx7jzplgxY+HJ/x6UmsSdSVG8eSyBMk=
X-Received: by 2002:a05:6214:1cc2:b0:6a0:d32d:79d with SMTP id
 6a1803df08f44-6a1514dfd79mr58597296d6.56.1715246609461; Thu, 09 May 2024
 02:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
 <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com>
 <ZjoNTw-TkPnnWLTG@phenom.ffwll.local>
 <CAPj87rN3uSZoHpWLSQqz1SW9YMZNj9fkoA_EDEE_bzv-Tw8tSw@mail.gmail.com>
 <Zjs42PGvilLlF0Cg@phenom.ffwll.local>
 <CAPj87rN-wSbGSAoB8y3MXCS20_MAQvfpWSeUKYR6XzQ+Oh0FZA@mail.gmail.com>
 <Zjue98r4ZgGbMN5K@phenom.ffwll.local>
In-Reply-To: <Zjue98r4ZgGbMN5K@phenom.ffwll.local>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 9 May 2024 10:23:16 +0100
Message-ID: <CAPj87rPywSjKLrv00N-0SrkDndPdYGCBeveO0adh4xGCp20h9g@mail.gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Daniel Stone <daniel@fooishbar.org>, Hans de Goede <hdegoede@redhat.com>, 
 Maxime Ripard <mripard@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>, 
 Sebastien Bacher <sebastien.bacher@canonical.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>, 
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
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

Hi,

On Wed, 8 May 2024 at 16:49, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, May 08, 2024 at 09:38:33AM +0100, Daniel Stone wrote:
> > Right now, if your platform requires CMA for display, then the app
> > needs access to the GPU render node and the display node too, in order
> > to allocate buffers which the compositor can scan out directly. If it
> > only has access to the render nodes and not the display node, it won't
> > be able to allocate correctly, so its content will need a composition
> > pass, i.e. performance penalty for sandboxing. But if it can allocate
> > correctly, then hey, it can exhaust CMA just like heaps can.
> >
> > Personally I think we'd be better off just allowing access and
> > figuring out cgroups later. It's not like the OOM story is great
> > generally, and hey, you can get there with just render nodes ...
>
> Imo the right fix is to ask the compositor to allocate the buffers in this
> case, and then maybe have some kind of revoke/purge behaviour on these
> buffers. Compositor has an actual idea of who's a candidate for direct
> scanout after all, not the app. Or well at least force migrate the memory
> from cma to shmem.
>
> If you only whack cgroups on this issue you're still stuck in the world
> where either all apps together can ddos the display or no one can
> realistically direct scanout.

Mmm, back to DRI2. I can't say I'm wildly enthused about that, not
least because a client using GPU/codec/etc for those buffers would
have to communicate its requirements (alignment etc) forward to the
compositor in order for the compositor to allocate for it. Obviously
passing the constraints etc around isn't a solved problem yet, but it
is at least contained down in clients rather than making it back and
forth between client and compositor.

I'm extremely not-wild about the compositor migrating memory from CMA
to shmem behind the client's back, and tbh I'm not sure how that would
even work if the client has it pinned through whatever API it's
imported into.

Anyway, like Laurent says, if we're deciding that heaps can't be used
by generic apps (unlike DRM/V4L2/etc), then we need gralloc.

Cheers,
Daniel
