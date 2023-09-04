Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475277911AF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 08:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D599910E0F1;
	Mon,  4 Sep 2023 06:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F12210E0F1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 06:57:01 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-5922b96c5fcso10947407b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 23:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693810620; x=1694415420;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Qt1h+KcRhcARBqVl0JQIPp9LYHPCSaiLn/hvDrNKng=;
 b=aAsuJv48mCSKnPn1UvlFQGHiJhpMxt+ol/PwZAnTdYo7oOJuP3VucQCYdjWXEmkd9O
 ilzIDOuiAES9L3Km1MhbhF4jHFTd7rU/aprNjwUfXagiWfrA7/qLiweZl8zmHBmAfIL9
 PfTPvpIe1ZHtfH2WLZUfPg/jCJU/0Vr6I+ipSuM5XJ14pDo4i9MlV0RTzI2hD1CgNwWU
 NaD4olCDnw26oQYBfN0n1puklNsp0cVo8m/4KTJ9G5PSmipzATYvB0HExYEOzNexvpO1
 U3Ue1cQ7NGJmwU/Kl6SzQdkWWrDk0ir6xLTOxvYNvI5sAutq0dTczyRDGF0y1BEMrAnp
 +RFA==
X-Gm-Message-State: AOJu0YxTTXCPD9ZBC1IpX/sUiFTYJsuWaKTH/HDwSm9xahIuNzprKXR5
 AQEPWc1EFLDHpV3eZDMxYNnhBqh3SMK9nA==
X-Google-Smtp-Source: AGHT+IEyi169SwU0WaPGZMYGUxqR9OxyfPZ3y3S1Bfu93NAaPhv3YzXROXcK6Ix0vInWOoZCZEYplQ==
X-Received: by 2002:a81:62d7:0:b0:586:c0bc:77a2 with SMTP id
 w206-20020a8162d7000000b00586c0bc77a2mr9705798ywb.0.1693810620347; 
 Sun, 03 Sep 2023 23:57:00 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 m10-20020a81710a000000b005845e6f9b50sm2515842ywc.113.2023.09.03.23.56.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 23:56:59 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-d7eed15ad69so940425276.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 23:56:59 -0700 (PDT)
X-Received: by 2002:a25:ac3:0:b0:d7e:b89c:9919 with SMTP id
 186-20020a250ac3000000b00d7eb89c9919mr5162434ybk.1.1693810619371; Sun, 03 Sep
 2023 23:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230903133709.8049-1-adiupina@astralinux.ru>
In-Reply-To: <20230903133709.8049-1-adiupina@astralinux.ru>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Sep 2023 08:56:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXA0QgVuw4jEA3Q=cREhCjpoYq=+uMeDL+X187oTYDCBQ@mail.gmail.com>
Message-ID: <CAMuHMdXA0QgVuw4jEA3Q=cREhCjpoYq=+uMeDL+X187oTYDCBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/rcar-du: fix comment to rcar_du_group_get()
To: Alexandra Diupina <adiupina@astralinux.ru>
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexandra,

On Sun, Sep 3, 2023 at 7:10=E2=80=AFPM Alexandra Diupina <adiupina@astralin=
ux.ru> wrote:
> rcar_du_group_get() never returns a negative
> error code (always returns 0), so change
> the comment about returned value
>
> Fixes: cb2025d2509f ("drm/rcar-du: Introduce CRTCs groups")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
> @@ -200,7 +200,7 @@ static void rcar_du_group_setup(struct rcar_du_group =
*rgrp)
>   *
>   * This function must be called with the DRM mode_config lock held.
>   *
> - * Return 0 in case of success or a negative error code otherwise.
> + * Always return 0.
>   */
>  int rcar_du_group_get(struct rcar_du_group *rgrp)
>  {

This is debatable: future changes may make it possible for the
function to fail.  In addition, the (single) caller does check the
return value.

If we are sure the function can never fail, and everyone agrees, its
return type should be changed to void, and the caller should be updated.

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
