Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF5F6FB114
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 15:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9461910E2AC;
	Mon,  8 May 2023 13:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554A810E2AC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 13:15:01 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-559e53d1195so64628237b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 06:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683551700; x=1686143700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E5LaiI9Qf78wWAuCEXEQ4PsyMcCaCQGaBXqW3f6eYiY=;
 b=hxBsLd1sDikqGe9g7jvxnOtxbh2uc6z2qlLba5QD00aFNW+vFIuCME/f3RigQWssf5
 H3raafxKCEcrRvZVJ6xOxl+pHqxO8O8g6C6ln/I9lhJjvvgSZdBfWkHEe/PJaJcepJvs
 3xNsToH5raAJTMeDENgo6R4zXixB7Kjul4gcFVeQzykn3KGpH4sPTgice6w2QerKEs3q
 /ffv92O+2Zbk4I5ExKnYxeLnlfVBP7NUwUl6TH8vws3CLBPD5TutzX9tCTohka5ju4Pc
 c995uG6xBTX1RLgwHMLPMLeIjqt0ukUGkFHlJunYTYsRO0SNYP6xilf5v/9xro80TBgd
 uc2g==
X-Gm-Message-State: AC+VfDy/FsjlkFaCC4OJlFQTrOo7+QlU49CssU2H5MLdFWsqXcUGo2Xe
 BbREMwtC/wH2VH+IYthaz5XuOtcII5Fn2w==
X-Google-Smtp-Source: ACHHUZ5Frjt6zPv7LvgWGhKJookoQcW7YvwAeoHuHtVAEHSy45H8qEJ76kY3RdrR5c++yIyE3kDOoA==
X-Received: by 2002:a0d:ef07:0:b0:559:d1ea:8c7a with SMTP id
 y7-20020a0def07000000b00559d1ea8c7amr12562170ywe.1.1683551700033; 
 Mon, 08 May 2023 06:15:00 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 a9-20020a25bac9000000b00b9e5b28dbd8sm2284849ybk.17.2023.05.08.06.14.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 06:14:59 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-b9d881ad689so5974582276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 06:14:58 -0700 (PDT)
X-Received: by 2002:a25:b315:0:b0:b9d:f4df:b0ef with SMTP id
 l21-20020a25b315000000b00b9df4dfb0efmr11607033ybj.42.1683551698679; Mon, 08
 May 2023 06:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-38-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-38-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 May 2023 15:14:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5se-2pt=WXiXY1K38cVY+BtmNTJAGUXeULrqRAXXxUQ@mail.gmail.com>
Message-ID: <CAMuHMdV5se-2pt=WXiXY1K38cVY+BtmNTJAGUXeULrqRAXXxUQ@mail.gmail.com>
Subject: Re: [PATCH 37/53] drm/rcar-du: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 7, 2023 at 6:31=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert the rcar-du drm driver from always returning zero in
> the remove callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
