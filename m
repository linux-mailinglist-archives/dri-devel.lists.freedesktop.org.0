Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF9DB0AB26
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 22:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E9410E194;
	Fri, 18 Jul 2025 20:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="P/E+edm7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31B810E194
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 20:32:47 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-742c7a52e97so2221361b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 13:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752870762; x=1753475562;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TKZtbK4lVu+Fa2vzfgm/vl63kukiWlzYzbXwLbRXVPM=;
 b=P/E+edm7jTQ1ZWQQI3vmaOosWsBKyBczF2EtNGq5tOVg8w91k579bXpViI3uEtyfyh
 FVrH7zvK4TdVgq4rUdiN76EIZbeJ1Y52EG2NU6U/9tfMnNV9FReCzolij9CUjZKFIxDI
 5TWXzrUdtqc0vTNm4rIAwqFegpG9HO8BXYqyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752870762; x=1753475562;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TKZtbK4lVu+Fa2vzfgm/vl63kukiWlzYzbXwLbRXVPM=;
 b=cB0ebnvxstH6QkaKZkxxNk8z8YHENyK6pMZ6vDDBt88jdJtQ4E6v5qxrfFPTg5atYB
 0Cv+vrT/bzfErmzgteEfKrigyrYEMSEbjTFTHL8a3HShdiwMbIFrxGuM7x0HRbuLFFZ3
 hTAan3n7jR90COLbY131HZaBM5mAxpK99b3+XtK81LWs4n+0OU7E34QpcWzzJVrifAlS
 rLOkOzBTGTlDpr8jhRuICClFGrn1LYp/kCY1gzzNRt8d1q0+q9eoTcf4UYs9nN6h8l9W
 yRQx0AVvIprLe1Vq27arDFV6K4GkGvuEuUJa3SSvUhMiQczir9jMTt1nd9j2QYSkIurE
 PiOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0vHScjBsrEu4meNDPlUIlviepjjy5A70TKplW9qihCIs1/Y2QpLodeH8pMKceYHpr+EN+Djqm40A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxACKzDrT5NJvH9WzD+/l7IlCGEUni9mwb6TSeEKtOp+MSsbW94
 q6GbaUdAggS6fOWdqlRCGtNfLICb5hfoejxkwTbRFASoG1Wo5g06FgsLxFwS5HKsPmqSOWZlz4D
 msvE=
X-Gm-Gg: ASbGncsrgfq8WZBvZwBgFplWpUsb194lEsXewbCUSdRqQD5SUGni5NGDzXVu9XcEQ2k
 x81u8G5rLo8UGQPCeDKQjPzZfPm0u6nz8V5/UEu1/Ej+hs3uuLXht+Isw/1ScTZsqDatEpBq9dU
 6bv8hsle+q2tlY6JQJewFJU3JUJwNI+bF9j2mVjkzPLKgABgH9kholObH5Hg7+K2YYZjXzjMNsd
 eR4OonyfFUwOA1pxlOSy9rY4P+vhCoWJVYoRiHz/B8s+hYkidXYL7AuAggd7Fawmtjhrww8h6hC
 xi9Om8BK9jKgIwA6HvruORR6dg1/vgecppzwJGRMAMUyW1IqLPIazfB2JYIE96hVVOHC+6mG+GD
 PdAgj6/jkhm3I6AvmnJvlPMHGByW6piStkSvMQXe0bakwcExleJeGK4T7j+cky7uguA==
X-Google-Smtp-Source: AGHT+IETaFY028qnIAMs2ifCev+BYGscGT3mk23HU+Knp4t8TZ/74Cqww36vso042PH9AaV/9ilFRQ==
X-Received: by 2002:a05:6a00:8d5:b0:740:6f69:8d94 with SMTP id
 d2e1a72fcca58-759a8a9f798mr5832614b3a.0.1752870761936; 
 Fri, 18 Jul 2025 13:32:41 -0700 (PDT)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com.
 [209.85.215.173]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb1569d8sm1724215b3a.93.2025.07.18.13.32.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 13:32:40 -0700 (PDT)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b34ab678931so1844714a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 13:32:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVVnVtouovOIP/b5tfr5KMHbk6hHPFH1adOBGYP4LUxWR1hNOgu93KMEplFrADo6jOp7jU91ztSXX4=@lists.freedesktop.org
X-Received: by 2002:a17:90b:2e06:b0:312:e49b:c972 with SMTP id
 98e67ed59e1d1-31cc256fb86mr7355028a91.15.1752870759183; Fri, 18 Jul 2025
 13:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250717164053.284969-1-me@brighamcampbell.com>
 <20250717164053.284969-2-me@brighamcampbell.com>
 <CAD=FV=WYBFrm-J55BTEJ7s=Jk4EFuMVAkahVZfdzW6V8mxE7Tg@mail.gmail.com>
 <DBFCOJFGI5HB.1RNJBDPNTEL2U@brighamcampbell.com>
In-Reply-To: <DBFCOJFGI5HB.1RNJBDPNTEL2U@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Jul 2025 13:32:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZUr=cwAQyPFWVDXg4pRavLWChpR4dOOyUywQN4GdE-w@mail.gmail.com>
X-Gm-Features: Ac12FXzSqdFPsH4TrONq3wFHu-HzqqxZ5pwzD4g92X8kRwKlib7OsOrk_7f6tnM
Message-ID: <CAD=FV=VZUr=cwAQyPFWVDXg4pRavLWChpR4dOOyUywQN4GdE-w@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] drm: Create mipi_dsi_dual macro
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

Hi,

On Fri, Jul 18, 2025 at 10:17=E2=80=AFAM Brigham Campbell
<me@brighamcampbell.com> wrote:
>
> On Fri Jul 18, 2025 at 10:10 AM MDT, Doug Anderson wrote:
> >> +#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)           \
> >> +       _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ##__VA_ARGS__)
> >> +
> >> +#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
> >> +       do {                                           \
> >> +               (_ctx)->dsi =3D (_dsi1);                 \
> >> +               _func((_ctx), ##__VA_ARGS__);          \
> >
> > nit: shouldn't func be in parenthesis for safety? It's unlikely to
> > really matter, but just in case it's somehow a calculated value that
> > would make it safe from an order-of-operations point of view.
>
> My assumption is that wrapping _func in parenthesis would cause a
> compilation error in the case of _func being a macro (more on that
> later...). I'll test that later today.

Huh, OK. If that's the case then no need to do it.


> >> +               (_ctx)->dsi =3D (_dsi2);                 \
> >> +               _func((_ctx), ##__VA_ARGS__);          \
> >> +       } while (0)
> >
> > Can you explain why you need the extra level of indirection here (in
> > other words, why do you need to define _mipi_dsi_dual() and then use
> > it in mipi_dsi_dual())? I don't see it buying anything, but maybe it's
> > performing some magic trick I'm not aware of?
>
> I mentioned this in v3 after the changelog and prompty forgot to include
> that information in v4: The extra indirection between mipi_dsi_dual()
> and _mipi_dsi_dual() is to allow for the expansion of _func in the case
> that _func is also a macro (as is the case with
> mipi_dsi_generic_write_seq_multi, i believe). Compilation fails after
> removing the indirection.
>
> There may very well be a better solution to this problem. I'd appreciate
> your thoughts.

Wow, crazy. I think the C preprocessor is one step away from magic.
While I know there are rules for it, I often find the way that it
behaves to be counter-intuitive. I can't say I've followed exactly how
your solution is working, but if it works and is needed then it's OK
w/ me. It might be worth promoting the note to be in the commit
message itself (or even a code comment?) so future people trying to
understand the code will have some chance of stumbling across it...

You might hate this, but one possible other solution would be to make
a custom `mipi_dsi_dual_dcs_write_seq_multi` (lifting it out of the
novatek driver) and then say that the "_func" parameter can't be a
macro. If you did it correctly, it would be a pretty big space savings
too. Unlike how we did it in the novatek driver, I think a proper way
to do it that would save the most space would be:

#define mipi_dsi_dual_dcs_write_seq_multi(ctx, dsi0, dsi1, cmd, seq...) \
  do { \
  static const u8 d[] =3D { cmd, seq }; \
  mipi_dsi_dual_dcs_write_buffer_multi(ctx, dsi0, dsi1, \
                             d, ARRAY_SIZE(d)); \
  } while (0)

...and then mipi_dsi_dual_dcs_write_buffer_multi() would be
implemented in drm_mipi_dsi.c.

With the above implementation, you only have one "static const" buffer
(maybe the compiler is smart enough to combine w/ the novatek code,
but  it might not be) and also only have a single function call taking
up space in the panel driver. You'd only have the "custom" dual
implementation for the "write_seq" stuff since that appears to be the
most common. All the other DSI calls could use the normal
mipi_dsi_dual() macro...

I was thinking of suggesting that as an optional followup to your
series anyway (for the space savings), but it could also solve some of
the preprocessor woes. :-P

I'm certainly not dead-set on this, so if you want to just keep
something like your current solution that's OK w/ me too.


> > Reading this with a fresh set of eyes, I also realize that this macro
> > is probably vulnerable to issues where arguments have side effects
> > since we have to repeat them. I don't think there's a way around this
> > and I think the macro is still worthwhile, but something to go into
> > with open eyes. Possibly worth noting in the macro description? We
> > could probably at least eliminate the need to reference "_ctx" more
> > than once by assigning it to a local variable. I think referencing
> > "_func" and "__VA_ARGS__" more than once is unavoidable...
>
> I'm using _func, _ctx, and __VA_ARGS__ more than once in this macro and
> I don't expect the indirection to fix the potential issue of unintended
> side effects. I believe we can use GNU extensions to eliminate side
> effects to _ctx,

I wasn't thinking of any GNU extensions. Just using a scope-defined
local variable...

#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
  do { \
    struct mipi_dsi_multi_context *__ctx =3D (_ctx); \
    __ctx->dsi =3D (_dsi1); \
    ...

> but especially since _func can be a macro, I don't
> think there's much to be done about it. Not sure about __VA_ARGS__.
>
> I fear my inexperience is made sorely manifest here.

I think it's a rare person who fully understands the dirty corners of
the C preprocessor and I wouldn't count myself as one of them. I can
sometimes make it do what I want, but I think we're up against my
limits too...

-Doug
