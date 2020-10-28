Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A71E429D064
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 15:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DA26E542;
	Wed, 28 Oct 2020 14:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679DF6E542
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 14:41:44 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m16so6609412ljo.6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 07:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sJ4wXj2K7lJdOYLrd0jjyxtKvvbExzYsZz6tEJ6wk7o=;
 b=mM89ZJBbiOM2uifaVqXNKqSvyE2s1UPxX02cbg2psjG2RIj0UXsi1Jjgz1Oryq1Qpm
 nNtWV/Lrq7xaMOk1nJUvpvDcRkMIdXEYqEEPQNx0EvW2fb18AxSruEfievimQTV2NSfy
 d0ZLC0dIboHF2NU3uV6aWrN39eLuYFOWlQFDS8HE82cJyQv58B1iQYh8FUIVQimKPUBs
 MLmpU9GAuvttzfyZH62cYrJkwYEM6/nTI48cqRrX/HBH394+76DrhzeIYjoGxOMY6O/1
 WuTtGpzaeuJe62Yr9yIyeS1BzuZq3pkYhGrezT1vDZgBDsXXtyz4klkHdsp/3vDFLiQ4
 ehDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sJ4wXj2K7lJdOYLrd0jjyxtKvvbExzYsZz6tEJ6wk7o=;
 b=td9qKRdzWbyMvWZ29c77PJGC/Gj76AUhoMiiLH926gqqnwYmrGAUiWkt2UG0KhHxQK
 BeR1f187FjNdxbcNaE2j5R399n7BWoAjW9WjRpK31szABX97ECkmXBJUvgX53a4V1Bng
 +JvuifW+XGU8onbgDjl8PGnxKQYGVXpZ+gV+L4Ta1+47go6fc7GsRlABPWR5I0BVPLEA
 WYtE51G4FV7lV5e6+tkuZg3LFmOYvQbSWM489CYfLgtjse3LBm4AhM8muOwZ0Fx4pENi
 XHvOh6sppZt2FV1HuE8Wn5mTxoJOm+kcvAv1LP5x4IgRLy7I1z22oMCXg2Rj9B2gnErS
 /fGg==
X-Gm-Message-State: AOAM5301i0el1ry03H4Uxb960EHbq5ktW0cyJVHPYJaAWOM/EiBADlzg
 IxtbBJThXIKZp0EkEkNLtOTbwd/SNo/QMK5waDk=
X-Google-Smtp-Source: ABdhPJx8co+572PLantQaUV7Gqe51Vag+Xsh6dam5kO2twasvje9+9Se8vxhWJ1wtDg0J7s2tzvkIaPm0Y/N1NL42uQ=
X-Received: by 2002:a2e:8706:: with SMTP id m6mr3509012lji.129.1603896102594; 
 Wed, 28 Oct 2020 07:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201026194110.3817470-1-arnd@kernel.org>
 <20201026194110.3817470-4-arnd@kernel.org>
 <20201027093350.GI401619@phenom.ffwll.local>
 <CAMeQTsZ9rBh2W_y8W4aaGJR3v5CA4g2BLmr-wAvcoKjOQtL68g@mail.gmail.com>
 <CAK8P3a35i9Z7sfFfVk_COotmyKVN6jcXadhaHu-BbbWCy_8ypQ@mail.gmail.com>
In-Reply-To: <CAK8P3a35i9Z7sfFfVk_COotmyKVN6jcXadhaHu-BbbWCy_8ypQ@mail.gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 28 Oct 2020 15:41:31 +0100
Message-ID: <CAMeQTsbATjR2KZ9ML8OsmXgZpbSEsWU3FjYArG8enPtY=yoQww@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/gma500: avoid Woverride-init warning
To: Arnd Bergmann <arnd@kernel.org>
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

On Tue, Oct 27, 2020 at 5:50 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Tue, Oct 27, 2020 at 10:54 AM Patrik Jakobsson
> <patrik.r.jakobsson@gmail.com> wrote:
> > On Tue, Oct 27, 2020 at 10:33 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > On Mon, Oct 26, 2020 at 08:41:04PM +0100, Arnd Bergmann wrote:
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > gcc -Wextra notices that one of the fields in psbfb_roll_ops has two
> > > > initializers:
> > > >
> > > > drivers/gpu/drm/gma500/framebuffer.c:185:20: warning: initialized field overwritten [-Woverride-init]
> > > >
> > > > Open-code this instead, leaving out the extraneous initializers for
> > > > .fb_pan_display.
> > > >
> > > > Fixes: 3da6c2f3b730 ("drm/gma500: use DRM_FB_HELPER_DEFAULT_OPS for fb_ops")
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > Scrollback is dead, so I'm not sure it's even worth to keep all this. I'd
> > > just garbage-collect this, maybe als the entire accelerator code and just
> > > leave psbfb_unaccel_ops behind ...
> > > -Daniel
> >
> > That's been my idea for quite some time. The gtt roll code is also
> > broken in multi display setups.
> >
> > Arnd, I can take care of this unless you feel an urge to do it yourself.
>
> That would be good, thanks

Should be fixed with:
https://patchwork.freedesktop.org/patch/397482/?series=83153&rev=1

>
> I have no specific interest in the drm drivers, this is just part of a
> larger work to enable more of the W=1 options across the kernel
> by default, after all the existing warnings are addressed.
>
>        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
