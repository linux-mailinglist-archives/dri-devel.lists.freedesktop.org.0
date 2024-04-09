Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5FF89DEEF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 17:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59637112DDB;
	Tue,  9 Apr 2024 15:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF38112D5B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 15:24:35 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-615019cd427so49121467b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 08:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712676275; x=1713281075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lu5hD9VvS+qp+vhw7UeQVESAr0EzPRLUzVlLL7V9CRE=;
 b=J0gp03ZOWlyiFIkkiHaiOsP5Nn0E39BcOzj9th/asOKkBEX7q/esj8LeeK5YeBG8Qq
 Pm3jmEna0XX+wd8HfcJOKdLHUY1T8EAe8kxoBWcTQtTKtFogk/4SL/2eVoMGS2AaUhwX
 Ucv/b5N67n63TurqpLui9rDzGxgR1d/3DY3O7ICOOR/vQSCgW20Ol1yNKuchao1JcWEp
 4Snfh4W2W6ZcqCsfCZFYvLJKHzylViA/wvc/dwSHPbDOpWUorGPqdtFfBnLDLGhxSItP
 KmZ8stM7EGieZLNNMxtpGc7TlzxzGDacuuStdH124qIzJWDn+rbgF24moyjQoL44tGD5
 f0Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXofg1ExXK15bjZ+OJqG6zekY8nDfrWlblRS+fn41/cOmPvEgT9PN/Zrdk4apITEvEeXs90Ne21JydQWV5Khck3mYnR0guOAiNjtzLo5VWr
X-Gm-Message-State: AOJu0YzYPzPEzLC8CXrKgKaGguETcupnPy3nr8OSKMN8sSrjLCEfHuR7
 V6+CVbHIujce+tw4AwQchuBJOixir+0mtLSOibPOkcJ+W/nspsfPEs5brfO1u1g=
X-Google-Smtp-Source: AGHT+IF7ooVWIEQk1TUhjxiwZoukFvp717hQHYVc1HUyM6fZqxpNqJQtwbdj0XHwvzaOD5c8t1cbKA==
X-Received: by 2002:a81:9c0c:0:b0:615:49a5:1caa with SMTP id
 m12-20020a819c0c000000b0061549a51caamr11351113ywa.51.1712676274440; 
 Tue, 09 Apr 2024 08:24:34 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 q188-20020a8180c5000000b006181ea1051bsm657382ywf.75.2024.04.09.08.24.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 08:24:34 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dcc80d6004bso5803356276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 08:24:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWEPz17oslJwIuGRR9mWbitUD3IzOZm+MtvSiKrkPIA8N85XXy1bTHh3Zxf1kie0AtiSzhwpVvXKDgeKSf0BGtaf51Hag9QMO2apj2l+sbf
X-Received: by 2002:a25:b10a:0:b0:dcc:f3fe:19c with SMTP id
 g10-20020a25b10a000000b00dccf3fe019cmr53487ybj.59.1712676273820; Tue, 09 Apr
 2024 08:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
 <a816fea-9974-d17f-bed6-69728e223@linux-m68k.org> <87sezu97id.fsf@intel.com>
 <CAMuHMdVMhXFm-kZ50Un1ZFmEcjJ7SnpyEyw65-wucBGpVRUFww@mail.gmail.com>
 <87edbe94ck.fsf@intel.com>
In-Reply-To: <87edbe94ck.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Apr 2024 17:24:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYqEpKTxHgkdm5B-Q9nM4PyzNDxmqDW=GHG7adcp83+Q@mail.gmail.com>
Message-ID: <CAMuHMdUYqEpKTxHgkdm5B-Q9nM4PyzNDxmqDW=GHG7adcp83+Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] drm/display: Convert helpers Kconfig symbols to
 depends on
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 Lucas De Marchi <lucas.demarchi@intel.com>, kernel test robot <lkp@intel.com>, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kbuild <linux-kbuild@vger.kernel.org>
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

Hi Jani,

On Tue, Apr 9, 2024 at 1:13=E2=80=AFPM Jani Nikula <jani.nikula@linux.intel=
.com> wrote:
> On Tue, 09 Apr 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Apr 9, 2024 at 12:04=E2=80=AFPM Jani Nikula <jani.nikula@linux.=
intel.com> wrote:
> >> On Tue, 09 Apr 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> > The user should not need to know which helpers are needed for the dr=
iver
> >> > he is interested in.  When a symbol selects another symbol, it shoul=
d
> >> > just make sure the dependencies of the target symbol are met.
> >>
> >> It's really not "just make sure". This leads to perpetual illegal
> >> configurations, and duct tape fixes. Select should not be used for
> >> visible symbols or symbols with dependencies [1].
> >
> > In other words: none of these helpers should be visible...
>
> ...and should have no dependencies? :p

Unless they do have dependencies.

> >> What we'd need for usability is not more abuse of select, but rather 1=
)
> >> warnings for selecting symbols with dependencies, and 2) a way to enab=
le
> >
> > Kconfig already warns if dependencies of selected symbols are not met.
>
> But it does lead to cases where a builtin tries to use a symbol from a
> module, failing at link time, not config time. Then I regularly see
> patches trying to fix this with IS_REACHABLE(), making it a silent
> runtime failure instead, when it should've been a config issue.

If a symbol for a builtin selects a symbol for a module, the latter
becomes builtin, too, so that does not cause such issues?
You can get such issues when a boolean symbol depends on a tristate
symbol...

> >> a kconfig option with all its dependencies, recursively. This is what =
we
> >> lack.
> >
> > You cannot force-enable all dependencies of the target symbol, as some
> > of these dependencies may be impossible to meet on the system you are
> > configuring a kernel for.
>
> Surely kconfig should be able to figure out if they're possible or not.
>
> > The current proper way is to add these dependencies to the source
> > symbol, which is what we have been doing everywhere else.  Another
> > solution may be to teach Kconfig to ignore any symbols that select a
> > symbol with unmet dependencies.
>
> ...
>
> It seems like your main argument in favour of using select is that it's
> more convenient for people who configure the kernel. Because the user
> should be able to just enable a driver, and that would select everything
> that's needed. But where do we draw the line? Then what qualifies for
> "depends on"?

Hard (platform and subsystem) dependencies.

> Look at config DRM_I915 and where select abuse has lead us. Like, why
> don't we just select DRM, PCI and X86 as well instead of depend. :p

X86 and PCI are hard platform dependencies.
DRM is a subsystem dependency.

> A lot of things we have to select because it appears to generally be the
> case that if some places select and some places depends on a symbol,
> it'll lead to circular dependencies.

True.  So all library code (incl. helpers) should be selected, and
not be used as a dependency.
The user shouldn't be aware that the driver uses library code (or not).

> Sure there may be a usability issue with using depends on. But the
> proper fix isn't hacking in kconfig files, it's to fix the usability in
> kconfig the tool UI. But nobody steps up, because at least I find the
> kconfig source to be inpenetrable. I've tried many times, and given up.

As long as Kconfig does not handle dependencies of selected symbols
automatically, adding explicit dependencies to the origin symbols is
the only workable solution.

> I mean, if you want to enable a driver D, it could, at a minimum, show
> you a tree of (possibly alternative) things you also need to enable. But

And this series is actually making that harder, by turning all these
selects of helpers into dependencies...

> if the dependencies aren't there, you won't even see the config for
> D. That's not something that should be "fixed" by abusing select in
> kconfig files.

I consider not seeing symbols when a hard dependency is not met as
a good thing.  If everything was visible all the time, you would
have a very hard (well, harder than the current already-hard ;-)
time configuring your kernel.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
