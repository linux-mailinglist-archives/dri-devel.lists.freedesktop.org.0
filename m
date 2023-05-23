Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF4670E2C7
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 19:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F262A10E485;
	Tue, 23 May 2023 17:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE88010E485
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 17:33:49 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-ba8afcc82c0so12133427276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 10:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684863228; x=1687455228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lxJT2l9AQiSzolKv87z4T+nj/6Voqeaq5rKuGn4L58s=;
 b=NszQYt8L7vYkm2To4A082HXzf99FoYGffUy1WJs0IxDiKVOBKNIZF4LS8bzJP4U9Xb
 FsbiTsVNDdLLO9Of0VWtDdM9HjmJ8Fa0XOqMUAkOVIdCF9F9+SGWpxExplm0xqL+eVeR
 n1QcsrICYT3cFla8/FwSnnDBvbshHMlOilkW8bkXqFbv2/EgaolJPeOD9816GfD7BerT
 X+l2GmVnc+Rf/e8zNFVSRWCvASTB1ECiX5BE3ROF8deLdC5sOaLrZC6p4pSjtFYSYQxv
 TJ8D9YPiDGYxcvy97IVEBRWhnZ+uI32T3E8TRAB96y0E3fA2QkewP+VJ0ckw2nIlRBeP
 2IEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684863228; x=1687455228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lxJT2l9AQiSzolKv87z4T+nj/6Voqeaq5rKuGn4L58s=;
 b=dUP4l6sqnWP8FaxcY3gkxlZ2z/JFlheukvLxDoEsU0lvC0edWJVnm4r2hLfTVmazm/
 cEgdvyi4+nfDrLQg/zN4nFRGQaGLMuWkd6imI8zDRa2PqkUysUoztlalg6Uzyg++xGcw
 h4NqaboLiLDaCs9OG0huCl8BoY48DFavA58OO6iQMPwdwu6jDAeVy8CZmgS2diSxy45A
 1KYuUypQTn0GT3DZNsBQ2O5A3LnfA1ZrtaB4s3xLxIDEN9bmL4hHTvGcTZLBMF/MR3f1
 4h8t3MnwxEjdbXC5z6dtWW4WEniZ5zdyI7PazZA0V3gZ0F14vGTxD8SmiQL7wmPakjiE
 TtrA==
X-Gm-Message-State: AC+VfDwGQTEFcZf+pbD1qGYgnrlBMiRva9NWb4eU3g9vtxrDc2TsUyzb
 AYVwAOth/Pby6gMWj9BvyWNpAHylTikSrj2AOEkuBg==
X-Google-Smtp-Source: ACHHUZ7CvU4JrLWdiw8GNueFAwAmwyblmrdIcjrSDreVSwbYIvgWidxnuleSI1/e3yufGf6NDzI1RndQMl1F02Ag8X4=
X-Received: by 2002:a25:541:0:b0:bab:534f:d8a4 with SMTP id
 62-20020a250541000000b00bab534fd8a4mr14934833ybf.55.1684863228586; Tue, 23
 May 2023 10:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230519142456.2588145-1-pavacic.p@gmail.com>
 <20230519142456.2588145-3-pavacic.p@gmail.com>
In-Reply-To: <20230519142456.2588145-3-pavacic.p@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2023 19:33:37 +0200
Message-ID: <CACRpkda8Q+zy-J9Hs28eJuioaE6eEzDmFE6ftEGgs9ot0t4Y6g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel-fannal-c3004: Add fannal c3004 DSI panel
To: Paulo Pavacic <pavacic.p@gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 4:25=E2=80=AFPM Paulo Pavacic <pavacic.p@gmail.com>=
 wrote:

> +//macro for writing to DSI
> +#define WRITE_DSI(dsi, seq...)                                          =
         \
> +       {                                                                =
        \
> +               const u8 d[] =3D { seq };                                =
          \
> +               int ret =3D mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d))=
;         \
> +               if (ret < 0) {                                           =
        \
> +                       dev_err(&dsi->dev,                               =
        \
> +                               "Error (%d) occurred while trying to"    =
        \
> +                               " write MIPI DSI command: %s (decimal val=
ue)\n", \
> +                               ret, d);                                 =
        \
> +               }                                                        =
        \
> +       }

As said for the other patch, this reinvents mipi_dsi_dcs_write_seq()
so use that instead.

mipi_dsi_dcs_write_seq(dsi, 0xFF, 0x77, 0x01, 0x00, 0x00, 0x13);
etc.

Yours,
Linus Walleij
