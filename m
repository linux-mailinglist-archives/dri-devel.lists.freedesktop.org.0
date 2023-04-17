Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD976E54AE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 00:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01DC10E039;
	Mon, 17 Apr 2023 22:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7944510E039
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 22:24:45 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5191796a483so1584071a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681770284; x=1684362284;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3rwGvdlgofaq/OnMesfSQWB2dx8nX+b4YsY9vlTE0GY=;
 b=aYLxs4270fY8KaUuTyY4q+hyjrtluEj+7zROEfIPr7TlKhMnU8Xt06VC3Nz24Z93rT
 YlOQ0PDYKpIBPZd8+LnKB7N5e9XcZrHsBE9m2QEYFKEfJjuuhm0r39ZGPdox/Lf88bms
 CmrWVWKon7oX8VrThBQFczUmrqwqIiPDfjj6mtHHUocp5jEvRPJvsrraygatrfQmkPVK
 Rd4PqZZCKgVdto5bDDqe97JgbEmiJT0uOtkBSccACJvmspEHLKcfgWpOsyQe/JWwg0GZ
 kzTGUUI6cJnzYLvXQkusEyB6XOl62Kb5bmDFeHYMCNfzXSRpCNpa1FxEYYyV4Zi8dj5B
 z0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681770284; x=1684362284;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3rwGvdlgofaq/OnMesfSQWB2dx8nX+b4YsY9vlTE0GY=;
 b=XOb1txIzEKBRf58UtJp8vCxFtOYiJnM0unkbhneIkuumKv6oNniEXb1Cc9+x5Y0Giv
 XY5Ys5w8ySXwIFn8gxnIv0xEgXN5x+aMItMSfqbdcHQ/PetNYBYqHM8Cs4lXFQH97pu8
 5X3bRcJyjN/GFNrzvsi1CKFQl5IhUYcKIxYpPmJABMLCJIceOGiXehdkl4zm57PAHqff
 JsrUb5o0WDsLOg39eieWQQ7v5brygdptfu2e9N4Vu080sl4GmijLUxSh+r/bLi3XMCWf
 DcsRLJ2QNKMaa4vq6t4LTiMJFV6SZ05eczVDTpjCQUNs39r2/F/wzrAaMNT7JochN5ug
 guFg==
X-Gm-Message-State: AAQBX9fsNTCPwDZdm2VHinO6dYEQrf/ZI8WhibGf0KKMzLlwumcjM7tQ
 w0SrnQLWSlz7NPUTCmETR/UiawbH7WqCA7Dfta0=
X-Google-Smtp-Source: AKy350ZAhVd3Lfj2zKF3GaKXZM7iufK+bBwmHjWGjJPf35olU0n+dshsZL36NZteW0f9jL1yboC6CI+f8btMah2HDF4=
X-Received: by 2002:a63:df09:0:b0:51b:415a:6db5 with SMTP id
 u9-20020a63df09000000b0051b415a6db5mr19362pgg.7.1681770284420; Mon, 17 Apr
 2023 15:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104104.5537-1-aford173@gmail.com>
 <20230415104104.5537-5-aford173@gmail.com>
 <807aa6c6-bbea-abcc-172d-17e22d1a3988@denx.de>
 <CAHCN7x+NUnMtLbj_7A_uqxPsi5NXRXsPFwDnn=sf1bgm-Q-BsQ@mail.gmail.com>
 <88e53197-2819-c068-eba6-a218a19d8d15@denx.de>
In-Reply-To: <88e53197-2819-c068-eba6-a218a19d8d15@denx.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 17 Apr 2023 17:24:31 -0500
Message-ID: <CAHCN7xLbbyTaN43pJe3NMdupoGb5vC3yXc_vBn6+CRChWCt92A@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm: bridge: samsung-dsim: Support non-burst mode
To: Marek Vasut <marex@denx.de>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 3:08=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 4/17/23 13:57, Adam Ford wrote:
> > On Sun, Apr 16, 2023 at 5:13=E2=80=AFPM Marek Vasut <marex@denx.de> wro=
te:
> >>
> >> On 4/15/23 12:41, Adam Ford wrote:
> >>> The high-speed clock is hard-coded to the burst-clock
> >>> frequency specified in the device tree.  However, when
> >>> using devices like certain bridge chips without burst mode
> >>> and varying resolutions and refresh rates, it may be
> >>> necessary to set the high-speed clock dynamically based
> >>> on the desired pixel clock for the connected device.
> >>
> >> The link rate negotiation should happen internally between the nearest
> >> bridge and DSIM, so please add that to DRM core instead of hacking
> >> around it by tweaking the HS clock again.
> >
> > I thought you tried to add something like this before and had some resi=
stance.
>
> Yes, all my attempts were rejected by a single reviewer. I suspended my
> efforts in that area for now.
>
> > The Pixel clock is set by the bridge already without any new code
> > added to the DRM core..  I am just reading that value that's there,
> > and setting the clock accordingly.  I don't see how this is a hack.
>
> Assume you have a DSI-to-HDMI bridge attached to your DSIM bridge, it
> operates in non-burst mode, like ADV7533 . How would you configure the

I have an ADV7535

> HS clock rate for such a bridge in DT ? (hint: you cannot, because the
> required clock comes from the EDID, which may not be available just yet)

The whole idea is that you wouldn't want to or need to configure the
clock speed in the device tree because it comes from the
EDID->bridge->DSI.

I've tested this configuration on imx8mm, imx8mn, and imx8mp and I can
change the resolution and refresh rate on the fly and the DSI will
automatically readjust accordingly.   If you fixed the clock in the
device tree, you wouldn't be able to do that, and that was the point
of this patch.


adam
