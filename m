Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6169429BD99
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 17:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476296E1F6;
	Tue, 27 Oct 2020 16:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FF06E1F6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 16:50:02 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3D12522202
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 16:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603817402;
 bh=LK0eeKt23UpuFjbRlp+Jq07QMdu86YPGTmyXrkIQ3/A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d8JE+lqyb+lc6WGFb7I32gYf037C2ol6q3hMeot+T6ESBkeZ32okx70sWcNt5JnUU
 dH700IJde4PU6R0Ly2j/DH00tOiKOus5NDkTJlwzjBLDDnUTup2dcPGV5pBqA2p0zp
 IVzbL1MBAcdZ5O7ySaE2bU1JgLGds4FwwOyJy8Hs=
Received: by mail-qt1-f178.google.com with SMTP id m9so1480844qth.7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:50:02 -0700 (PDT)
X-Gm-Message-State: AOAM530cGHjnljkbB4R99FKEJMvJsB+SXurqHTY/ge1uuuG5Og6Wki8I
 4SrCldrxEat3OIopT7T5O6HYLrdC+zEzKbz/IMs=
X-Google-Smtp-Source: ABdhPJxSYiplkttX2Lr+S81J9ygH4nT2v7pKasxinSA2ZjbjgLslLpRipHcImpdX7w5F6n46UUC2rqVZSZnz+By90m0=
X-Received: by 2002:aed:26c2:: with SMTP id q60mr2515948qtd.7.1603817401292;
 Tue, 27 Oct 2020 09:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201026194110.3817470-1-arnd@kernel.org>
 <20201026194110.3817470-4-arnd@kernel.org>
 <20201027093350.GI401619@phenom.ffwll.local>
 <CAMeQTsZ9rBh2W_y8W4aaGJR3v5CA4g2BLmr-wAvcoKjOQtL68g@mail.gmail.com>
In-Reply-To: <CAMeQTsZ9rBh2W_y8W4aaGJR3v5CA4g2BLmr-wAvcoKjOQtL68g@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 27 Oct 2020 17:49:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a35i9Z7sfFfVk_COotmyKVN6jcXadhaHu-BbbWCy_8ypQ@mail.gmail.com>
Message-ID: <CAK8P3a35i9Z7sfFfVk_COotmyKVN6jcXadhaHu-BbbWCy_8ypQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/gma500: avoid Woverride-init warning
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Stefan Christ <contact@stefanchrist.eu>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 10:54 AM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
> On Tue, Oct 27, 2020 at 10:33 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Mon, Oct 26, 2020 at 08:41:04PM +0100, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > gcc -Wextra notices that one of the fields in psbfb_roll_ops has two
> > > initializers:
> > >
> > > drivers/gpu/drm/gma500/framebuffer.c:185:20: warning: initialized field overwritten [-Woverride-init]
> > >
> > > Open-code this instead, leaving out the extraneous initializers for
> > > .fb_pan_display.
> > >
> > > Fixes: 3da6c2f3b730 ("drm/gma500: use DRM_FB_HELPER_DEFAULT_OPS for fb_ops")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Scrollback is dead, so I'm not sure it's even worth to keep all this. I'd
> > just garbage-collect this, maybe als the entire accelerator code and just
> > leave psbfb_unaccel_ops behind ...
> > -Daniel
>
> That's been my idea for quite some time. The gtt roll code is also
> broken in multi display setups.
>
> Arnd, I can take care of this unless you feel an urge to do it yourself.

That would be good, thanks

I have no specific interest in the drm drivers, this is just part of a
larger work to enable more of the W=1 options across the kernel
by default, after all the existing warnings are addressed.

       Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
