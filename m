Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFF575397F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 13:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7D610E872;
	Fri, 14 Jul 2023 11:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0575810E872
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 11:29:35 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-6b75637076eso1472125a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 04:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689334174; x=1691926174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IZ5pKNtQcVsctQLLt1fcBesVTk5WANpsrcd33LQmiMs=;
 b=h+GQk7PIrBRVo69/pOmF2A0E649AEoVQhxFM/k7D5eBtrLfJJLCKNviG7fNF94crMG
 n1DfO/Khq9aUK8Fnbxt0T6U0cBuli/7ysKMXNJWNoQ+lPnmPBswDSPegB3sItGSfwtIh
 16+umfKS268rdeug1R5gAA1r/+A40A5q7wEUh0oiJtFRBf3hgkRRiM5UTByWgWRReu4E
 gQ5VfEiuQ2FVo1oWeyqzCPrre6mLIdnLOxql/MAlxD9vpWrPBBCJDL6uzSjBKtAgE0U0
 HQev+JbZVHGmwPg5i7K6oj60XnMrqsjJjTdCRHRV9qeibI8g3rjxjCMYvfDbcjPn9CpU
 Cz3w==
X-Gm-Message-State: ABy/qLaBGKkiJjcdeyvh1Doiv0489TWZzguHgdZPtEFrdwAGLvwvgRdv
 jd/9ieiFd56AQxMgyUIQaaYjrFGDMOojng==
X-Google-Smtp-Source: APBJJlFpQl088iZc8cVKpRAPiA4qetIvq44xHkBc1dJA4lUKanOgFodaftV9l1WntFhV+5Exm0CWYg==
X-Received: by 2002:a05:6358:7e0e:b0:135:a10e:1ed0 with SMTP id
 o14-20020a0563587e0e00b00135a10e1ed0mr567154rwm.23.1689334174290; 
 Fri, 14 Jul 2023 04:29:34 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 j15-20020a258b8f000000b00c65cfcace05sm1725491ybl.42.2023.07.14.04.29.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 04:29:34 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-cae693192d1so1717516276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 04:29:33 -0700 (PDT)
X-Received: by 2002:a25:d045:0:b0:ca9:395f:75f4 with SMTP id
 h66-20020a25d045000000b00ca9395f75f4mr3827226ybg.21.1689334173394; Fri, 14
 Jul 2023 04:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689252746.git.geert@linux-m68k.org>
 <9090c1b423e0b56c8e906155fe53ff0841830a03.1689252746.git.geert@linux-m68k.org>
 <0KNCLmzXJwmF0RTaQXUBd456dzaM5QsAot8g_yT36aNlEhJbSssTxBOS95x99DJHYkEzUJeMO7zJCX4JGjX6DEmY40BWtLKVZf6nB4HQMSc=@emersion.fr>
In-Reply-To: <0KNCLmzXJwmF0RTaQXUBd456dzaM5QsAot8g_yT36aNlEhJbSssTxBOS95x99DJHYkEzUJeMO7zJCX4JGjX6DEmY40BWtLKVZf6nB4HQMSc=@emersion.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 13:29:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWTse=bOPo7=_4SZK2+ifkpuwbzR797QNNGdy_babygA@mail.gmail.com>
Message-ID: <CAMuHMdUWTse=bOPo7=_4SZK2+ifkpuwbzR797QNNGdy_babygA@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/client: Convert drm_mode_create_dumb() to
 drm_mode_addfb2()
To: Simon Ser <contact@emersion.fr>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon,

On Fri, Jul 14, 2023 at 1:01=E2=80=AFPM Simon Ser <contact@emersion.fr> wro=
te:
> On Thursday, July 13th, 2023 at 15:17, Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > Currently drm_client_buffer_addfb() uses the legacy drm_mode_addfb(),
> > which uses bpp and depth to guess the wanted buffer format.
> > However, drm_client_buffer_addfb() already knows the exact buffer
> > format, so there is no need to convert back and forth between buffer
> > format and bpp/depth, and the function can just call drm_mode_addfb2()
> > directly instead.
>
> By any chance, is the commit message wrong? The title refers to
> drm_mode_create_dumb(), but the description and code refer to
> drm_client_buffer_addfb().

Yes it is, thanks.  Originally, I had copied-and-pasted the wrong
function name. I thought I had fixed all references, but apparently
I missed the one-line summary :-(

Will fix in v2.

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
