Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D61951A7F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 14:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5A210E45D;
	Wed, 14 Aug 2024 12:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FE2Oo+A5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CD810E455
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 12:01:42 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-26b5173e861so3943639fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 05:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723636902; x=1724241702; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8v3FACRVLInU72mQIn8ZRnsPtKqtsflxvY7ocPKv6dM=;
 b=FE2Oo+A5X0N1iuykd0cOA0/Y8XoPndRLqw6y15DmJacAZ6DVKZ/hGL1NfxekBMqTmT
 rx3KgWvk15xSljhkY3IiFp0ysSpTlELRFC4+QmARoK+zu6cz2v5Fta861CH9dsHNBdWe
 vtR3GOXMRBeraPuW0GSOq5KoTMwLQaGLujYaMzWMk0MIAn7g271vJSiMswGrRuzALJa+
 R3EQPqluqVC7YBZt9ZpRbhZ13mh4g/bpZLcboOEt+7kaod61pmlZY9lP4odML9Jx2p9W
 m/QOgd/aQwn2v1j/08a3lzqJNSI359R6A0rKNJbsNHuBr7+xGBVlkHCQ903BsJJ8U1Ru
 oYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723636902; x=1724241702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8v3FACRVLInU72mQIn8ZRnsPtKqtsflxvY7ocPKv6dM=;
 b=l0wkhWScQznBPAg1D+ysDMEBDdBEdlEOA3fr3xTl9b8YCbbhkQLDUSUwMnT8Z95OWu
 vKVYYnej8BzyjsgMPQYnpigLnqm0U2VoEG/LtPQHqZ3IhQVixF0D9AUZQxvwZvhcuNAb
 bdLj5kQ31L1gUmtDj3q5CMaEfowID/8z1gVAUzNNCwzxCfdoqG45+Z3Msk4uhvfmT1in
 aBn3ku1vzBccLHSRefiUc718w8wlUXXwUtYBx2FEjz7Ki+BnxLrA555YB7vfJQxV8SfM
 tslAYM6AEF7WZ5lRMaPNRUAamT/ozqG8WBVowipehHBUtwZhDEwa2tf/9jBP6OTG22XX
 zGnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh896th4tQ7QVTK/Gwah5n+XjomKzqDigHaKfzpWVZUpDqT9lPe79DrQh4z2//BpQnC52/9n/HRpZCOkY4B/mCtAMTyRdYmmqNh+xcArfO
X-Gm-Message-State: AOJu0YxtscpFiQsuYfnq6XPfUNuH9SEgp52tOFHg7BnNZ1Qqz3xmsxhx
 BJHBoL5CMDpBiHUr1xvcDafBzdRgXMjA85p0SdcQmvSMhzcIZc9yCsWHtzq1CowFTtfu5nQOGf2
 vztcSjT5qeaSrcdGF92M8Hc0EptMaKDlFKrVCUQ==
X-Google-Smtp-Source: AGHT+IEXSwpG1/ytUAZ81Sed/BezfzFf7vKHrDMjRAM0bw/+RsQs5+LfgEea53duY74tvzqpXFM+Zl+QBtuu66uJRnY=
X-Received: by 2002:a05:6871:e014:b0:268:79bd:9edb with SMTP id
 586e51a60fabf-26fe5c707b0mr2896389fac.47.1723636901739; Wed, 14 Aug 2024
 05:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
 <20240728130029.78279-6-wahrenst@gmx.net>
 <65de7db8-4f81-4c31-be8d-3a03c9aee989@gmx.net>
 <CAD=FV=W7sdi1+SHfhY6RrjK32r8iAGe4w+O_u5Sp982vgBU6EQ@mail.gmail.com>
In-Reply-To: <CAD=FV=W7sdi1+SHfhY6RrjK32r8iAGe4w+O_u5Sp982vgBU6EQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Aug 2024 14:01:05 +0200
Message-ID: <CAPDyKFpj0C1Bifmx=4zH3r8YooOrNfn_iDB+1sfRb0gTaKnT2Q@mail.gmail.com>
Subject: Re: [PATCH V2 14/16] WIP: usb: dwc2: Implement recovery after PM
 domain off
To: Stefan Wahren <wahrenst@gmx.net>, Doug Anderson <dianders@chromium.org>
Cc: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Minas Harutyunyan <hminas@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>, 
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, 
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-list@raspberrypi.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, 13 Aug 2024 at 21:57, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Aug 12, 2024 at 4:48=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> =
wrote:
> >
> > Hi Doug,
> >
> > Am 28.07.24 um 15:00 schrieb Stefan Wahren:
> > > DO NOT MERGE
> > >
> > > According to the dt-bindings there are some platforms, which have a
> > > dedicated USB power domain for DWC2 IP core supply. If the power doma=
in
> > > is switched off during system suspend then all USB register will lose
> > > their settings.
> > >
> > > So use the power on/off notifier in order to save & restore the USB
> > > registers during system suspend.
> > sorry for bothering you with this DWC2 stuff, but it would great if you
> > can gave some feedback about this patch.
>
> Boy, it's been _ages_ since I looked at anything to do with dwc2, but
> I still have some fondness in my heart for the crufty old driver :-P I
> know I was involved with some of the patches to get
> wakeup-from-suspend working on dwc2 host controllers in the past but,
> if I remember correctly, I mostly shepherded / fixed patches from
> Rockchip. Not sure I can spend the days trawling through the driver
> and testing things with printk that really answering properly would
> need, but let's see...
>
>
> > I was working a lot to get
> > suspend to idle working on Raspberry Pi. And this patch is the most
> > complex part of the series.
> >
> > Would you agree with this approach or did i miss something?
> >
> > The problem is that the power domain driver acts independent from dwc2,
> > so we cannot prevent the USB domain power down except declaring a USB
> > device as wakeup source. So i decided to use the notifier approach. Thi=
s
> > has been successful tested on some older Raspberry Pi boards.
>
> My genpd knowledge is probably not as good as it should be. Don't tell
> anyone (aside from all the people and lists CCed here). ;-)
>
> ...so I guess you're relying on the fact that
> dev_pm_genpd_add_notifier() will return an error if a power-domain
> wasn't specified for dwc2 in the device tree, then you ignore that
> error and your callback will never happen. You assume that the power
> domain isn't specified then the dwc2 registers will be saved?
>
> I guess one thing is that I'd wonder if that's really reliable. Maybe
> some dwc2 controllers lose their registers over system suspend but
> _don't_ specify a power domain? Maybe the USB controller just gets its
> power yanked as part of system suspend. Maybe that's why the functions
> for saving / restoring registers are already there? It looks like
> there are ways for various platforms to specify that registers are
> lost in some cases...
>
> ...but I guess you can't use the existing ways to say that registers
> are lost because you're trying to be dynamic. You're saying that your
> registers get saved _unless_ the power domain gets turned off, right?
> ...and the device core keeps power domains on for suspended devices if
> they are wakeup sources, which makes sense.
>
> So with that, your patch sounds like a plausible way to do it. I guess
> one other way to do it would be some sort of "canary" approach. You
> could _always_ save registers and then, at resume time, you could
> detect if some "canary" register had reset to its power-on default. If
> you see this then you can assume power was lost and re-init all the
> registers. This could be pretty much any register that you know won't
> be its power on default. In some ways a "canary" approach is uglier
> but it also might be more reliable across more configurations?
>
> I guess those would be my main thoughts on the topic. Is that roughly
> the feedback you were looking for?

Thanks Doug for sharing your thoughts. For the record, I agree with
these suggestions.

Using the genpd on/off notifiers is certainly fine, but doing a
save/restore unconditionally via some of the PM callbacks is usually
preferred - if it works.

Kind regards
Uffe
