Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8756E46F3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 13:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AC210E469;
	Mon, 17 Apr 2023 11:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD8010E468
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 11:57:42 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2474e09fdcfso563185a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 04:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681732662; x=1684324662;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ByuvqnZ0whBYE58ALvTkPoZXFMoOo3weY1eli1YLs8M=;
 b=ezXmzlMEqu08ohTUCxyWeT1ghxYBInGOWizV/QuxcC3LNYxDh4JflmMdjRbuaKuFEF
 M3/peUNeBWEFoNGrCMbsDOZBj245P7/NUTnHjRz8dXI8bIdQiWYnK5KwVA7Eqfw2RG/y
 IMj15+g/R9545qoQEQLdBloLu5S8PqcAuaJA3lC97I6/m2AOugMZBuh0HbYjumTHQNpL
 ZALVclRThPcEz1Icfh4eP08TGGnFWk+EW52vi9FJR+hNPeiM4l4D/xaMz4GsJGAmmSKj
 OZ3qvulCfiClhw3EKAQiTh34xSpk3PvDKxCXWzG/BuQPk5qXzXboCa1KB7OeZP+/otqg
 nDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681732662; x=1684324662;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ByuvqnZ0whBYE58ALvTkPoZXFMoOo3weY1eli1YLs8M=;
 b=UWp7hj+aivHVViqp/8dNNjfX6hIrcnUd9xs3j/ZTA5dmc8RHTfQDYlUZtU0IFDU2Sq
 02aP8EJdOpWDmf49+RXMH5YWIqDlZ58iW2JxvtkieThn+aja2Yqs27wOoEkVOCGip1sB
 0JTzVrKi7P6LpvxBbk/yJZM/23dmtCrinAvTYKWHRYY/z4eDDzWTZv1lpovgCAgI8fED
 NsXTOBR1if1hcjYNku8I43xgIZHUrtFbljinEMs0DuAic89RquaFiP81rWdfCimKdQQ8
 12N26zVp0M85TBE43ea0rx7jT4hQUx3Jv4ov9JCH4YyZ40So9n/Ln65oKMiPC2w5euLf
 xy/g==
X-Gm-Message-State: AAQBX9fJpyz+SKI93Wg2EoyBEe4lxZ1s0HZho+TVZn7v6xxSK+CrveQJ
 OzRwtsG2Z7sGzknOBZUJJm0k7pbOxITYR63sJKk=
X-Google-Smtp-Source: AKy350ZuQYL1FYypLxgVwEvW7yKVWERIY1UOZe2w4ZV8QVjHAvbbucDalib2gb7BSAcoKBVQ6I/LS6oIqFiXdpeTNM4=
X-Received: by 2002:a05:6a00:24c4:b0:63b:5496:7af9 with SMTP id
 d4-20020a056a0024c400b0063b54967af9mr6836463pfv.2.1681732661836; Mon, 17 Apr
 2023 04:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104104.5537-1-aford173@gmail.com>
 <20230415104104.5537-5-aford173@gmail.com>
 <807aa6c6-bbea-abcc-172d-17e22d1a3988@denx.de>
In-Reply-To: <807aa6c6-bbea-abcc-172d-17e22d1a3988@denx.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 17 Apr 2023 06:57:30 -0500
Message-ID: <CAHCN7x+NUnMtLbj_7A_uqxPsi5NXRXsPFwDnn=sf1bgm-Q-BsQ@mail.gmail.com>
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

On Sun, Apr 16, 2023 at 5:13=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 4/15/23 12:41, Adam Ford wrote:
> > The high-speed clock is hard-coded to the burst-clock
> > frequency specified in the device tree.  However, when
> > using devices like certain bridge chips without burst mode
> > and varying resolutions and refresh rates, it may be
> > necessary to set the high-speed clock dynamically based
> > on the desired pixel clock for the connected device.
>
> The link rate negotiation should happen internally between the nearest
> bridge and DSIM, so please add that to DRM core instead of hacking
> around it by tweaking the HS clock again.

I thought you tried to add something like this before and had some resistan=
ce.

The Pixel clock is set by the bridge already without any new code
added to the DRM core..  I am just reading that value that's there,
and setting the clock accordingly.  I don't see how this is a hack.

adam
