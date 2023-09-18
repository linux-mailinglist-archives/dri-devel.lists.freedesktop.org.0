Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 116127A46A3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 12:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA6210E258;
	Mon, 18 Sep 2023 10:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8E310E25A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 10:07:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C247B6105C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 10:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A7AC433C9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695031662;
 bh=6Z9OHNaEQvhWlb2sPVv3Cy7faEcuayHgve8HLudNCZQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cudRK1heiAvdCg3HCYt2JdrubkcDg94hJsQy4y3WIOcvmcGQVF3iLVzNdVXOMBgvW
 s+djVTpnLNUcDnIP/ENWrenig3jeemDu9Y8PiGYXaFrWqocyoqM8mgTmo8BZJlzfIE
 rrBw3mX10PMoutLxZr3rolIhb9E1IHZ3hIgAWTnM5Br3NgqdmbnWRx2i6zJIFDH7IP
 VhxNS5OhTJ1uiVg2WN6QtRdQ4nEZlfEykZtDGs0OsQSHBS74h//tRfj6IaazWHwwdG
 +WGoMUDZa5+IWqy9vpQ6wKvS/n+/8TCtCEf5HFahQNez/U+Y+0R+i03Ht5FW1oIhl/
 MRIOdsZpPuaKg==
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-577e62e2adfso3212981a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 03:07:42 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy5+PsZO5Q04uFpHiUtUFF514ur+ppSX3Q5YRu8zIV6xBuwtLZD
 J58iUGWAmOHAiARte2CVWeqM+GWrZWJGREigHPuZuA==
X-Google-Smtp-Source: AGHT+IHEqkE5SZGmMDUTOb10awQ3KU1YhxoCF8XtzLacKDrd70XZNFIGFYmJ5cnFaT+PfOsZ8siRWoSbyGoPDB3Ra+w=
X-Received: by 2002:a17:90a:5608:b0:268:e5db:6e19 with SMTP id
 r8-20020a17090a560800b00268e5db6e19mr5889399pjf.20.1695031661753; Mon, 18 Sep
 2023 03:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <ZPvagaXnQ/TlNEkJ@tora>
In-Reply-To: <ZPvagaXnQ/TlNEkJ@tora>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 18 Sep 2023 12:07:30 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7K6JqvaBcNrM2KhB=_Wg7JffGu+zWb13DeNrOwF_xrGw@mail.gmail.com>
Message-ID: <CAN6tsi7K6JqvaBcNrM2KhB=_Wg7JffGu+zWb13DeNrOwF_xrGw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge/analogix/anx78xx: Add missing definition
To: Alicja Michalska <ahplka19@gmail.com>
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 9, 2023 at 4:43=E2=80=AFAM Alicja Michalska <ahplka19@gmail.com=
> wrote:
>
> Analogix ANX78XX driver is missing definitions for anx7816.
> It uses the same I2C register set as anx7818.
>
> Signed-off-by: Alicja Michalska <ahplka19@gmail.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers=
/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 800555aef97f..1ce4acc01bf3 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -1211,6 +1211,7 @@ static const u16 anx78xx_chipid_list[] =3D {
>         0x7808,
>         0x7812,
>         0x7814,
> +       0x7816,
>         0x7818,
>  };
>
> @@ -1377,6 +1378,7 @@ static const struct of_device_id anx78xx_match_tabl=
e[] =3D {
>         { .compatible =3D "analogix,anx7808", .data =3D anx7808_i2c_addre=
sses },
>         { .compatible =3D "analogix,anx7812", .data =3D anx781x_i2c_addre=
sses },
>         { .compatible =3D "analogix,anx7814", .data =3D anx781x_i2c_addre=
sses },
> +       { .compatible =3D "analogix,anx7816", .data =3D anx781x_i2c_addre=
sses },
>         { .compatible =3D "analogix,anx7818", .data =3D anx781x_i2c_addre=
sses },
>         { /* sentinel */ },
>  };

This compatible string needs to be added to
Documentation/devicetree/bindings/ in a separate patch before this
one.


Rob.
