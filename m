Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0E1926E6C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 06:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF3F10E046;
	Thu,  4 Jul 2024 04:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ekxHXDXe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60C810E046
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 04:36:51 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1fafc9e07f8so1266715ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jul 2024 21:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1720067811; x=1720672611;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mAbXjXG0fSvMf5pJhFu2VS2Kd5/IOX1LZWjusen/NTs=;
 b=ekxHXDXeovzUHv8kxGfAnk50kGIbsU0lCgzIJIVS24Ou69op1bmZK2xECxpIefpUW7
 hKKGNMNX1/Ooe+TX75OkbPkwPYSvif7jL0/GmK6bMUtomdpUXavMaKhQtjYtT7yB2Xj6
 ZdhvwX6FYpRM7E0CwrYzfsi3Ok2GLJNVh6ZBYN4d81D26WIWNxm2N7R+dPYF+cCWLRIA
 +wxUzWX0wYP6vDoIk2SRlV7lb5LPLwlsRv768k4hecnY+QHscsxUUkiYyw/ezV7xVi6a
 eoVFJvsUJACRWDT7Y6COCWCNBSICN3IIuTNefYEfEnZno7RclvusywYrRGQ05S9EiTBz
 hN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720067811; x=1720672611;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mAbXjXG0fSvMf5pJhFu2VS2Kd5/IOX1LZWjusen/NTs=;
 b=nRt+BnZ4n1WoozozS14u2LuIe4p3sByZc+epD7tEh52jH5yI5t8/rfmCsE2MKfRSrm
 0PWd+0k/DQcz0s2w2OvR0X7fCyn67bPfv4Oci7zbe8DuBNvwGE+dczUDq54Jgnfm8UaB
 fqI2gPMK7RDApWCkb//imkPWiWoD02JZueA4bUk15HXgzMyyNUsfAN84R1Rhjhbqehe3
 hxaoJpC66E56ZNjrlr0e6hzLy8BXUoly3/7orDg5tbRV0rIZTTIlVy/lpLD9X0k079cn
 rsWNI3rRYYVdl8Tcp460DGgYMEi/Ok4KCh50C/ADNZnSSg959vH1nTPNdIpU8r4RQ91Q
 UhOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrHbAYZqvdgjCahpsGNfiFzcHuFR3MW8DKYsxOAzfTmJm39qS9GzUZbnRdz/Orn96tDVGsC1sWo3T7mn6RLSMsPKyGWQ62WG4hn6IsRit2
X-Gm-Message-State: AOJu0YyNvcbAiFTgzXSlkmCr2z/jOzxH1Ud+TqjAPCksG/3lYSNPA/ue
 d1E+YA7sejaHjY+tPe92C9LJ+5wKh/ioC4G2rbbNh7vxTYr0s3hmU7yKS/uIfxl0DkZXJvIxmrG
 4yc3RyhsxluEbvQNLNC2pT8BEV1Ygf7AJCqL5pw==
X-Google-Smtp-Source: AGHT+IFtkJ+EuL8PoDKfInod5fFnpjY15Fd6bShoE64mF1c8evcN7TimB/7UEAKFN0CDsuw+N1TkXgUJNgqJPD6HU2A=
X-Received: by 2002:a17:90a:1fc8:b0:2c2:f6a2:a5f7 with SMTP id
 98e67ed59e1d1-2c99c53b414mr431715a91.13.1720067811171; Wed, 03 Jul 2024
 21:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240702130138.2543711-1-yangcong5@huaqin.corp-partner.google.com>
 <20240702130138.2543711-3-yangcong5@huaqin.corp-partner.google.com>
 <CACRpkdY+nuSWz7rnVVUpF_mZOfDUb_6fgoJpnG2Pt-+AGLqt0g@mail.gmail.com>
In-Reply-To: <CACRpkdY+nuSWz7rnVVUpF_mZOfDUb_6fgoJpnG2Pt-+AGLqt0g@mail.gmail.com>
From: cong yang <yangcong5@huaqin.corp-partner.google.com>
Date: Thu, 4 Jul 2024 12:36:40 +0800
Message-ID: <CAHwB_N+Gr=Kso6=UabHseB0UTb+4wWpHR5MAZ82bHe5At_y-cw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] drm/panel: jd9365da: Support for Melfas
 lmfbx101117480 MIPI-DSI panel
To: Linus Walleij <linus.walleij@linaro.org>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 dianders@chromium.org, swboyd@chromium.org, airlied@gmail.com, 
 dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, 
 lvzhaoxiong@huaqin.corp-partner.google.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

Linus Walleij <linus.walleij@linaro.org> =E4=BA=8E2024=E5=B9=B47=E6=9C=883=
=E6=97=A5=E5=91=A8=E4=B8=89 21:10=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Jul 2, 2024 at 3:02=E2=80=AFPM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
>
> > The Melfas lmfbx101117480 is a 10.1" WXGA TFT-LCD panel, use jd9365da
> > controller, which fits in nicely with the existing panel-jadard-jd9365d=
a-h3
> > driver. Hence, we add a new compatible with panel specific config.
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
>
> This is certainly OK
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> > +static int melfas_lmfbx101117480_init_cmds(struct jadard *jadard)
> > +{
> > +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D jadard->ds=
i };
> > +
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x00);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x93);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x65);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0xf8);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x03);
> > +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x01);
>
> Until this point *all* displays have the same init sequence, what about
> a follow-up patch that start to break things that are always the
> same into helper functions?
>
> These sequences all have a lot of the same magic bytes, so if
> you guys have a datasheet for this display controller then start
> adding gradually some #defines for the e0, e1, e2 etc commands
> please.

Okay, will add a patch in V2 series to fix it. Thanks.

>
> Yours,
> Linus Walleij
