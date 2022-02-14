Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCB14B4CB7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB3510E51B;
	Mon, 14 Feb 2022 10:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F221710E51B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 10:57:33 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id j20so4377462vsg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 02:57:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3C7RZsUPH67gE+tnYDZyMgOb/jtRDu7g+Ix4wmjevW8=;
 b=UjzU7hgtrRKalLUYW2Ps4OH29qh3B8MI3pKiEdND7AnL4nSSjCxgRGgLSFPNABrc4W
 jzBDkNYoIgBC/LRvlrxbCY4pj8i6T5ljz0bdgOIoWKWx9WzrLOJIxsKV5hIQUxSaBEu7
 89x8FdlMBe8eovw9maEgBCJx1iABHbld5bjrbnPxEz6C9KjBmsC5gJg+s6yzncb8Xi6U
 anow88aK+trxdbD3eQBHI/Yt/3GS942yQt/EgfGKs/MJ63lDOdYsAP+rAuSBR18H+xiJ
 o25tSNWVsBB3zwZXdFJvd7gCBqX6/DHzvHXfXXKlCHWlMLDGkVQVbtmWym0K6eKAiYGY
 uvOw==
X-Gm-Message-State: AOAM533eLVyKdmPIRh/jHAx7Ptcf1g+WyInTmPlnPKLxGS7o8el0nX7k
 VFGtUU/qHFkRQenmwUPk4rV2D2ESIZRvQQ==
X-Google-Smtp-Source: ABdhPJwsBAoORj8nRyifMP0JIbuxhTeMdur9mO8o4SXD7eBxmzpCsgpAuyRBJUQKujyJvMI3G2TaUw==
X-Received: by 2002:a05:6102:508:: with SMTP id l8mr3837913vsa.1.1644836252813; 
 Mon, 14 Feb 2022 02:57:32 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46])
 by smtp.gmail.com with ESMTPSA id m3sm2288452vso.0.2022.02.14.02.57.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 02:57:32 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id e26so1949870vso.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 02:57:31 -0800 (PST)
X-Received: by 2002:a05:6102:440d:: with SMTP id
 df13mr1065090vsb.5.1644836251571; 
 Mon, 14 Feb 2022 02:57:31 -0800 (PST)
MIME-Version: 1.0
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de>
 <87pmnt7gm3.fsf@intel.com> <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
 <f87ce2fa-6b18-f985-eb86-506ce7103db3@suse.de>
 <YgoxFBGNsrezVxmi@smile.fi.intel.com>
In-Reply-To: <YgoxFBGNsrezVxmi@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Feb 2022 11:57:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWUDo3v+=+Um_8_ys-a-5HovGTUeYjvkQ91R_JDf0Myg@mail.gmail.com>
Message-ID: <CAMuHMdVWUDo3v+=+Um_8_ys-a-5HovGTUeYjvkQ91R_JDf0Myg@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Mon, Feb 14, 2022 at 11:39 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Feb 14, 2022 at 10:03:53AM +0100, Thomas Zimmermann wrote:
> > Am 11.02.22 um 16:41 schrieb Andy Shevchenko:
> > > > IMO *always* prefer a for loop over while or do-while.
> > > >
> > > > The for (i = 0; i < N; i++) is such a strong paradigm in C. You
> > > > instantly know how many times you're going to loop, at a glance. Not so
> > > > with with the alternatives, which should be used sparingly.
> > >
> > > while () {}  _is_ a paradigm, for-loop is syntax sugar on top of it.
> >
> > Naw, that's not true.
>
> In the section 3.5 "Loops - While and For" in "The C Programming
> Language" 2nd by K&R, the authors said:
>
>         The for statement ... is equivalent to ... while..."
>
> They said that for is equivalent to while, and not otherwise.

When I learned C, people told me to prefer while() over for() when
possible, as several compilers are better at optimizing while()-loops
than for()-loops.

During the last 3 decades, optimizers got better, and all the bad
old compilers went the way of the dodo (see also [1])...
But even for a human, it's still less symbols to decode (and verify
all the details about =/</>/<=/>=/++/--/...) for

    while (n--) { ... }

than for

   for (i = 0; i < n; i++) { ... }

[1] https://lwn.net/Articles/871283/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
