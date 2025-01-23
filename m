Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E32A1A943
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 18:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AFD10E126;
	Thu, 23 Jan 2025 17:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fyIUNH3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92F810E126
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 17:52:54 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-aafc9d75f8bso220506466b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 09:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737654773; x=1738259573;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ffa3/XJVzIzlsf+TECCnatXk0cRQZc3PCfdAQKqsdfQ=;
 b=fyIUNH3nr5dyX3SSPZev8pGX9aKy6o+APnyF5UiTbVm10mM5k+wZNswlE4R+98ZfLP
 yxvUfnOhucXhqn24V9+fp9J0nTm9fF16Tywj6/go8pjB9JwhDTF+mJYXhovKK5wdmM3K
 GIS3RRW767QHyVy8r7CZjITCvhGoihVBWJ/V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737654773; x=1738259573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffa3/XJVzIzlsf+TECCnatXk0cRQZc3PCfdAQKqsdfQ=;
 b=GFwO15jjgC4ViUCPcKplzMdgcfSdzY3JCWMipzsY7cJ2ppBpPMSrPDUGh34KDd3HWX
 HK4u7zI8BxblT1FQ60vkgA7S/p7aT5Ax8uzy6i0A3JsTaKRPySVt2zEMTKp8bXAYDAMU
 B6/IG/8LQhYZ+pzQqjIsK0ZzOR1GZTj3ZKGqOUKLbb2/p4IbUQuR4YZslmfZ37BAFwSZ
 cjymqWs/9kz4Q6fGWd38PlvQn9KhTtXJ0IEYUhU0xDrkaD0auKCa7wsZT7XA4WVrLi0P
 Tc+hlFUBI+EYFFwTJRAI1lPwWXB7DEybxRNR4kcCcEJ0rUvxzXkcz5FOCZeh/IAGDl3q
 3i8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWKZlN4ueP9jnptqFKz0WcmvWlMvnEuifgEXBRKJZfoJ0an+NlmxmoNxhqw6gaTrwLoHSysdRa6gA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPPEdjaU+NFjnIOQVcd4NMiw/L969qmjePlQuuNEkOn5lLnEtJ
 WnO+0KCweMuoPPENpXAMCepImHPaVuDcXmOb6cfgfjeMdLoLNrivm2E8bEfiAxVPaGdyqhhRvc6
 jIEAL
X-Gm-Gg: ASbGncujlF3M+NnqnLPoJ3dlogbP5WpYU+EUf4cLGTPTHjbrDpOl8QqA35piplqx9HQ
 iuFJVyHsyCXxzAv+ps8+U/RBNAXqn9ibVffV2gDdFfGhAzIrUbu/vsl7FIj5hA/fNLk9+QMccTZ
 c9hPkES9kwVr+beisZ1vEXnB1NxLkbTyw24pRS3uZBKUum9RhI2W9fwp5oKkB3yVndQL5BL0xqb
 HZ7cq2vINAM/Wn61/FYK/5af41OIWsXThlByGDllx0vIco+MDCxiQM6BArLvEXxbTSzEYFnsTqt
 6Ev6DfEEKCI+nPt5Geuu9CkjLhUZZdT5SOUqlsBSILi0
X-Google-Smtp-Source: AGHT+IEqTyA2PRB7HkjpEhFTp1wtVTtUFDx+0pV7zGAwcvrZBVwrB7Ife8cKWjx1cTWbkBQBszQ+Yw==
X-Received: by 2002:a17:907:7da7:b0:aa6:8b38:52a3 with SMTP id
 a640c23a62f3a-ab38b4af7a7mr2447763966b.50.1737654772852; 
 Thu, 23 Jan 2025 09:52:52 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com.
 [209.85.218.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab384f2244csm1112455766b.92.2025.01.23.09.52.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 09:52:52 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-aa689a37dd4so250102566b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 09:52:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVxRHyctCDDXCrUZ9Jd1iwQC8XCjV1HSxA8ZGtqw9MqzKNqYxDGkAmohYBcQaCy8E4VnZ/NKTCoNn0=@lists.freedesktop.org
X-Received: by 2002:a19:7714:0:b0:543:bb82:f402 with SMTP id
 2adb3069b0e04-543bb82fbf8mr2518373e87.53.1737654408389; Thu, 23 Jan 2025
 09:46:48 -0800 (PST)
MIME-Version: 1.0
References: <20250123064758.743798-1-yelangyan@huaqin.corp-partner.google.com>
 <20250123064758.743798-3-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250123064758.743798-3-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Jan 2025 09:46:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wt+6AoycUfcWaEAi2ucTN_37CvE6VQZF5iHU0+Aj-gZQ@mail.gmail.com>
X-Gm-Features: AbW1kvZiTQ6uFWm9j1-EZI2sAy992VLYi3vMgIMn7_IbtaGztg3D6lU73GtRTO8
Message-ID: <CAD=FV=Wt+6AoycUfcWaEAi2ucTN_37CvE6VQZF5iHU0+Aj-gZQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] drm/panel: boe-tv101wum-nl6: support for
 kingdisplay-kd110n11-51ie MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Wed, Jan 22, 2025 at 10:48=E2=80=AFPM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> The kingdisplay-kd110n11-51ie is a 10.95" TFT panel.
> which fits in nicely with the existing panel-boe-tv101wum-nl6 driver.
> From the datasheet, MIPI needs to keep the LP11 state before the
> lcm_reset pin is pulled high, so increase lp11_before_reset flag.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)

You have Neil's review tag (carried from your V1), so in theory this
could land once the bindings are reviewed. ...but as I talked about in
my response [1] to your bindings patch, I'd like some confidence that
the MIPI controller on the new panels you're adding is actually the
same as the other panels here. If not then IMO you should add them to
a different driver or create a new driver.

[1] https://lore.kernel.org/r/CAD=3DFV=3DVr5DnACFoQnnFzPhF778Nv6LOZj43BqZX6=
vW_azMARZQ@mail.gmail.com


> +static int kingdisplay_kd110n11_51ie_init(struct boe_panel *boe)
> +{
> +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D boe->dsi };
> +
> +       msleep(50);
> +
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xB9, 0x83, 0x10, 0x21, 0x55, =
0x00);

nit: lower case hex please. 0xb9 instead of 0xB9.


> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC4);
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xD9, 0xD1);
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +       mipi_dsi_dcs_write_seq_multi(&ctx, 0xB1, 0x2C, 0xB3, 0xB3, 0x31, =
0xF1, 0x33, 0xE0, 0x54,
> +               0x36, 0x36, 0x3A, 0x3A, 0x32, 0x8B, 0x11, 0xE5, 0x98);

nit: ideally line up indentation so that the "0" in "0x36" is under
the "&" in "&ctx".
