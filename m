Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207E472003A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 13:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA9010E661;
	Fri,  2 Jun 2023 11:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCE710E661
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 11:18:16 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-569386b7861so20513747b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 04:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685704695; x=1688296695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55TCnNM7kMHRew3G4Jl4TYRy0f4Haiew0/tikDTeZNg=;
 b=VcbvzyKxdYAbrmjnzdbuTpwfCqpfrF2vo824zm5A0zTQnqVotDaPYDuKh7UnyDJ7QV
 IMTwJBFgmqUPfj7EMzzA2vmsG3Qu18FfxEVvTlMdhFB0VJ43/pMv6I7NaSPNH6sjM7l6
 thouMxiHzdVskMjFUJerwg7JfwOny9iAD9i7NVZQCxbuDJIkg3gyhvRBwt0pdtU2XXou
 gnP9LU3dli/hN48xai6kRtPc9wRs9prr2qW7x1Ghfzxwo+OdTbrqOqZVcpzWhzBcM+SB
 PP7AV6iwZki2xXJWaCjhT9qNzlEqFKc1D+cDEgLlYrTMotgosLSI/DgdYean5RwnXEKV
 /P/w==
X-Gm-Message-State: AC+VfDza2vl6phmntELWeu1OR7izB0ANQajT3OeelUgaNycGPDFpw/kb
 Sz/vcXnBsQNGc33PC5h+RkeA9InzoraVMSuW
X-Google-Smtp-Source: ACHHUZ759qR9HT6miy9QA1MNtFK8UUyB/kU9niPQyrpVkTRTK3rLloZ/I72pWCtkWLl82V4vjKDLNg==
X-Received: by 2002:a0d:cbc3:0:b0:565:232a:36a3 with SMTP id
 n186-20020a0dcbc3000000b00565232a36a3mr5905698ywd.17.1685704695235; 
 Fri, 02 Jun 2023 04:18:15 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 s11-20020a81bf4b000000b00555df877a4csm352290ywk.102.2023.06.02.04.18.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 04:18:13 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-561b7729a12so48671467b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jun 2023 04:18:12 -0700 (PDT)
X-Received: by 2002:a81:4f15:0:b0:561:94a9:f9f7 with SMTP id
 d21-20020a814f15000000b0056194a9f9f7mr5542636ywb.20.1685704692143; Fri, 02
 Jun 2023 04:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1685696114.git.geert+renesas@glider.be>
 <14e091fc522aa63a3e33bda1016e5fa946d47d18.1685696114.git.geert+renesas@glider.be>
 <20230602110459.GC26944@pendragon.ideasonboard.com>
In-Reply-To: <20230602110459.GC26944@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Jun 2023 13:17:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXR79TTSAcKb=DA2mRVDgaxBERts5PQLMf+mXpZDQJu=Q@mail.gmail.com>
Message-ID: <CAMuHMdXR79TTSAcKb=DA2mRVDgaxBERts5PQLMf+mXpZDQJu=Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm: Remove references to removed transitional helpers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jyri Sarha <jyri.sarha@iki.fi>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Fri, Jun 2, 2023 at 1:05=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jun 02, 2023 at 11:11:35AM +0200, Geert Uytterhoeven wrote:
> > The transitional helpers were removed a long time ago, but some
> > references stuck.  Remove them.
> >
> > Fixes: 21ebe615c16994f3 ("drm: Remove transitional helpers")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/gpu/drm/drm_plane_helper.c
> > +++ b/drivers/gpu/drm/drm_plane_helper.c
> > @@ -51,14 +51,6 @@
> >   * planes, and newly merged drivers must not rely upon these transitio=
nal
> >   * helpers.
> >   *
>
> The first paragraph starts with "This helper library has two parts.". As
> you're dropping the mention of the second part, I think you should
> rework the first paragraph too.

That was my initial thought, too.
However, the code still has a second part, not related to the topic of
the first part (primary plane support).

>
> > - * The second part also implements transitional helpers which allow dr=
ivers to
> > - * gradually switch to the atomic helper infrastructure for plane upda=
tes. Once
> > - * that switch is complete drivers shouldn't use these any longer, ins=
tead using
> > - * the proper legacy implementations for update and disable plane hook=
s provided
> > - * by the atomic helpers.
> > - *
> > - * Again drivers are strongly urged to switch to the new interfaces.
> > - *
> >   * The plane helpers share the function table structures with other he=
lpers,
> >   * specifically also the atomic helpers. See &struct drm_plane_helper_=
funcs for
> >   * the details.

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
