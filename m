Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F5A9737B0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 14:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395E710E7B2;
	Tue, 10 Sep 2024 12:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A1710E673;
 Tue, 10 Sep 2024 12:40:15 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e116d2f5f7fso5148690276.1; 
 Tue, 10 Sep 2024 05:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725972014; x=1726576814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rxkC6elmujDdAfnsTNRTMrFadUmhU0gDj/DcldHNh9Q=;
 b=f6U1TIy91UPxqzcucePpSsY51OHp2Fgn5SxRj1hg9AGF02eEcrLwB2D9mSKhgh3s1X
 rQIhWh+hvQdGYlfvGVozW6qbxK+Jx2gk9KWbJYWX3J96g7WPb7Pn+xW2P6bA8dbqonDg
 CT3sFGfaLSR+12Lma5lGIajXSWQhfoelhPb2fKRh6GT8+oMVCDXbsSIUu8SbH7IifByt
 Q33+ZIEOBYP455u/K4Gj5v2xDvrrLMLwWJgSWBt9Sf9Z1eMTwUaGm3W1TuJk4xsV6eDz
 E3zpc7r+leouyCEQ7XKnRoz1Ad26NuiAjkKj/1K2qH4mECk9WE19cMw/Z12tAbfXHdla
 OaMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3x4DQ1FoJ+ZacDu916Kcyt7ltqpHmP+l9pImn8mSM1Z5zcb8wO0Vx/RDfQLAc+kiB1K3bT6LZ5mE=@lists.freedesktop.org,
 AJvYcCXwx4692JcfHna67Qnu8o/mWpLtpFcDyE1twczSj+KUZTD3clRJRoDILBK2eaDXm1nIiFSPl9f0GAk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsaRmrqxXtImQcH/R0/3FI2rSYFq9ZYk6hav+gyG8t2dkaTrkk
 z2XR1Mjw4XGjJWXo7sDHRh2lxE3PSRMbQcO+UTBV2pzFbxamSFcVeh1cZNLQ
X-Google-Smtp-Source: AGHT+IFmVAP5rOEd9M5gL23YDPikZl+RDcuMvj39376pdfajUicgricvrRgbGrJI5DpQlRVOm5oCuQ==
X-Received: by 2002:a05:6902:287:b0:e1c:ff8a:68f9 with SMTP id
 3f1490d57ef6-e1d79e74167mr2475640276.11.1725972013535; 
 Tue, 10 Sep 2024 05:40:13 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6db9652d8fasm2763667b3.142.2024.09.10.05.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 05:40:12 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6cdae28014dso40793517b3.1; 
 Tue, 10 Sep 2024 05:40:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXkV/b2s679LCkUBLcLtXZq/+6c+5mzLTO20/0sypWoFaUuRXWEedyOzsE15DotjUvNZ54xj+J/wvA=@lists.freedesktop.org,
 AJvYcCXug2mUjyNo9M5SaNwCfKYDs065WXORJsDHtvjlviGFg+vvzBKhuCvZZ6OchbPEaM6McFL5Kd+9bOk=@lists.freedesktop.org
X-Received: by 2002:a05:690c:25c4:b0:664:74cd:5548 with SMTP id
 00721157ae682-6db95311ca7mr24962807b3.1.1725972012286; Tue, 10 Sep 2024
 05:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1725962479.git.jani.nikula@intel.com>
 <f2b721e28b9ee2711d7848abf1774ecb8ce8e5e2.1725962479.git.jani.nikula@intel.com>
In-Reply-To: <f2b721e28b9ee2711d7848abf1774ecb8ce8e5e2.1725962479.git.jani.nikula@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Sep 2024 14:39:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJDKO-0o9GiGzuZ=yuYpZ1myB+A00zYwNj=+6baAq3Rw@mail.gmail.com>
Message-ID: <CAMuHMdWJDKO-0o9GiGzuZ=yuYpZ1myB+A00zYwNj=+6baAq3Rw@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm: renesas: rcar-du: annotate rcar_cmm_read() with
 __maybe_unused
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
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

On Tue, Sep 10, 2024 at 12:06=E2=80=AFPM Jani Nikula <jani.nikula@intel.com=
> wrote:
> Building with clang and and W=3D1 leads to warning about unused
> rcar_cmm_read(). Fix by annotating it with __maybe_unused.
>
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=3D1 build").
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> @@ -32,7 +32,7 @@ struct rcar_cmm {
>         } lut;
>  };
>
> -static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> +static inline __maybe_unused int rcar_cmm_read(struct rcar_cmm *rcmm, u3=
2 reg)
>  {
>         return ioread32(rcmm->base + reg);
>  }

This function was never used. Why not remove it instead?

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
