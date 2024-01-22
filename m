Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B88283684D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D4E10F2A2;
	Mon, 22 Jan 2024 15:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB3A10E121
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:31:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E3D8A61516
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E007C43141
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705937518;
 bh=D8noVwkJbNFmPqK4QAu8yfNP4zdZTow0yqFrOd9rct8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VkWjM9LxRHTMDjO5n7LOZXU20gi+Rhaa+1IZe42qX0FSxU4DQswh6rjsXGtyB0ii/
 h1kTMa0jspsYdsmmCAE7ROk9sU9l72iVXmrWHDOOV34c14+UMoxWRFxfQR2dka4C4m
 e4xqZq7O4eT4rHVyi+jbLOcHY8bjKyK0xAbJ4JU09RHHhNMUUQZWRyapzfOYALhnK7
 pTZcbpRlrqNN0SLIFgCcRZ98Ddvo+RTlVFWkSed6QM6Iw3Jha3pCyhtUG+oZmqD7EO
 ulC8G4KpqxxQtdtwnXOuhBJzRAVSEnsjj4+dAvGvqtacDsNYxJCxMXI1JzVzUylcjZ
 DZQaU3RRTVDpw==
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dc223f3dd5eso2607288276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 07:31:58 -0800 (PST)
X-Gm-Message-State: AOJu0YyJHWoREmy1iEToFshi1A3MRisvzyklkMfWBuN2P3YwL3vIfcMp
 c4kaR+EjJeuU3vHXleE+JA9j8mtPkeyf0qs20xAQTw8TF2BJxn4htPLL8ZWcCHt5/dB4WY5Rm/8
 maW6Ev6bC307qhH26Hb3u0jYw2VcEVo/3HvSWCA==
X-Google-Smtp-Source: AGHT+IGacHQ2jjBe3z+ou1J6C3EfhjG0Tf1WNr+KFO3I8aWqbXNgOFC5++PenZAwL8K7yrYNRAbtGSMgwN7ecVW7x+0=
X-Received: by 2002:a25:8885:0:b0:dbd:ac60:bcd4 with SMTP id
 d5-20020a258885000000b00dbdac60bcd4mr2355277ybl.75.1705937517525; Mon, 22 Jan
 2024 07:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20231119101445.4737-1-hkallweit1@gmail.com>
 <20231119101445.4737-12-hkallweit1@gmail.com>
In-Reply-To: <20231119101445.4737-12-hkallweit1@gmail.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 22 Jan 2024 16:31:46 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4HmKF6tnnjD6qsi=+nj_1wWhGio+WYzUs972wMCWbSNQ@mail.gmail.com>
Message-ID: <CAN6tsi4HmKF6tnnjD6qsi=+nj_1wWhGio+WYzUs972wMCWbSNQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/20] drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:
 remove I2C_CLASS_DDC support
To: Heiner Kallweit <hkallweit1@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wolfram Sang <wsa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 19, 2023 at 11:15=E2=80=AFAM Heiner Kallweit <hkallweit1@gmail.=
com> wrote:
>
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
>
> Preferably this series should be applied via the i2c tree.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |    1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 52d91a0df..aca5bb086 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -515,7 +515,6 @@ static struct i2c_adapter *dw_hdmi_i2c_adapter(struct=
 dw_hdmi *hdmi)
>         init_completion(&i2c->cmp);
>
>         adap =3D &i2c->adap;
> -       adap->class =3D I2C_CLASS_DDC;
>         adap->owner =3D THIS_MODULE;
>         adap->dev.parent =3D hdmi->dev;
>         adap->algo =3D &dw_hdmi_algorithm;
>

Acked-by: Robert Foss <rfoss@kernel.org>
