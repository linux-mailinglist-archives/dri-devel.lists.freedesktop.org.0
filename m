Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C997001AF
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 09:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003F410E107;
	Fri, 12 May 2023 07:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBFD10E107
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 07:44:26 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-ba729a64ba8so64817276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 00:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683877465; x=1686469465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XVUms8yStwCeZDJHHNJSmq1pOQB/QF2y9dUkoR2Z9pA=;
 b=XaJs+AGZP0DKkd9pJ/MnlmuK8Y4+JxnzcDeNRE9HL++flHnjsqtd60v1uc4C0biLmY
 8UoFXD/bBXx5788WqV/uyTc5UJQ56tYay8Q589qBnCVlaANY44dICC+OOVY5d35C+O2Z
 rl7DcDlZ7GFUKHggEfq4OzUdgsLzBlI36Qz2ihJDAmmup0ANTezyvli9YSVncgICbyOw
 2zYZgdYUlrNuHpzH7V16i8rFTYeikawTAUG+U2pthc+60VOfZUETWXirB5gSjLEJwj1F
 LlxqEfEvxl8IeTMaknR6euSg2VRE7F6RdJDl+h13yqn5w8CjseKgReZsa1jaFoqb1BJo
 Rbjg==
X-Gm-Message-State: AC+VfDxPxfeUGSGjZK2Ntx4J/3vs/QeskmWLkOOgGx17h18Q8PD8/0y/
 ynyuMgW/QAhEox6fmT4EqDnmdy4p289dQHf7
X-Google-Smtp-Source: ACHHUZ4dSCS33qJ/9a1H2rt0aiC36i1Y5JD95Wf6LfkofgS0koqWjfurRNFmNcThcOKqnBRYoTlUoA==
X-Received: by 2002:a0d:c044:0:b0:55a:5d41:ce10 with SMTP id
 b65-20020a0dc044000000b0055a5d41ce10mr24255465ywd.15.1683877464666; 
 Fri, 12 May 2023 00:44:24 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171]) by smtp.gmail.com with ESMTPSA id
 c1-20020a81df01000000b0055a29ec6504sm5458424ywn.81.2023.05.12.00.44.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 00:44:24 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-ba1cde4ee59so7543253276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 00:44:24 -0700 (PDT)
X-Received: by 2002:a81:bf52:0:b0:549:2623:6f65 with SMTP id
 s18-20020a81bf52000000b0054926236f65mr24267248ywk.33.1683877464030; Fri, 12
 May 2023 00:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <ZERQiub7tuTxHCUy@p100>
In-Reply-To: <ZERQiub7tuTxHCUy@p100>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 May 2023 09:44:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZuqj=vwTmHmnBHgZ975dD_m_Gk6Q1=CsGCqzcfcMbsA@mail.gmail.com>
Message-ID: <CAMuHMdXZuqj=vwTmHmnBHgZ975dD_m_Gk6Q1=CsGCqzcfcMbsA@mail.gmail.com>
Subject: Re: [PATCH] fbdev: modedb: Add a 1920x1080 at 60 Hz video mode
To: Helge Deller <deller@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Sat, Apr 22, 2023 at 11:27=E2=80=AFPM Helge Deller <deller@gmx.de> wrote=
:
> Add typical resolution for Full-HD monitors.
>
> Signed-off-by: Helge Deller <deller@gmx.de>

> --- a/drivers/video/fbdev/core/modedb.c
> +++ b/drivers/video/fbdev/core/modedb.c
> @@ -257,6 +257,10 @@ static const struct fb_videomode modedb[] =3D {
>         { NULL, 72, 480, 300, 33386, 40, 24, 11, 19, 80, 3, 0,
>                 FB_VMODE_DOUBLE },
>
> +       /* 1920x1080 @ 60 Hz, 67.3 kHz hsync */
> +       { NULL, 60, 1920, 1080, 6734, 148, 88, 63, 4, 44, 5, 0,
> +               FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT },

This matches [1], except for the "63", which looks like a typo for "36"
(total number of lines should be 1125, not 1152).

> +
>         /* 1920x1200 @ 60 Hz, 74.5 Khz hsync */
>         { NULL, 60, 1920, 1200, 5177, 128, 336, 1, 38, 208, 3,
>                 FB_SYNC_HOR_HIGH_ACT | FB_SYNC_VERT_HIGH_ACT,

[1] https://projectf.io/posts/video-timings-vga-720p-1080p/#hd-1920x1080-60=
-hz

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
