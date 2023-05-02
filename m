Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDFF6F3F20
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 10:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7913310E4D2;
	Tue,  2 May 2023 08:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330B010E4CF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 08:32:14 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-44066390652so1134410e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 01:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683016332; x=1685608332;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BWWyc2tyY3cwMkEDQu1WnxOmxyqSb2T1IrD/g9kPDzA=;
 b=m4zzl8uYhRR6saMsdg3HPWejhXX3EOg4vViRVqma5993YCVSIQZjduQGi72S0WJ5sd
 4WTFkG1sbxGBAgm2SZhve6R/MSf9A0gKtyLGB4fb+6O0NQ2nUUwt1ms2ST/2/ysxlLnG
 6L5OvsE45iAWgObykhNpbpj8GzaTj7PtGKND0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683016332; x=1685608332;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BWWyc2tyY3cwMkEDQu1WnxOmxyqSb2T1IrD/g9kPDzA=;
 b=T2Y+UpznbyL4MbXGwVDXAF8PgJbIVSaKk3wqkAzlZkPBUotPiAlrv+3RJaLahjoZF8
 BthOx1s5hWPwaapL3cfhkzm/Lumsigsok4ATPkDkIJhiX3w3ylQN8/nCwH2mGXxBEdG0
 AeEC89kSUZ2HCgA70eE/CWTFkVsx/nmzIAUqthCUzIB1ccTnNFjK1nocujqpgxfe5WuM
 4IDm+1oSynlm+6ulkxXlkauG5AUTD7UHy2U3iix02L4ZEc3SGO1SVvb5kQY9d1z+zEBb
 Eo3EhFvFe2KAEajOHWVvwFLfRAVE2gimfyQXQXs/BGmPitJVct0EsGJmZIZG1i4H8aF2
 euow==
X-Gm-Message-State: AC+VfDyKNb/rQPR2nI1GxnXMo/FjeCudUP0RVgJWmGO/kA/58Lt+SuuB
 SOVVRwornJaP23FksjRYjswWnN0MpB6ijBlVsmSBIg==
X-Google-Smtp-Source: ACHHUZ5UDSO2uA/JaGBLjILILIaC8pFpNUUBWNxuhSKBA+IGQzD9k10JlpYY4wrx63nUb6DgXoNMZwzlQMBcV/ZzgsQ=
X-Received: by 2002:a1f:450a:0:b0:44b:2450:e4c8 with SMTP id
 s10-20020a1f450a000000b0044b2450e4c8mr5604804vka.9.1683016332576; Tue, 02 May
 2023 01:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230502010759.17282-1-aford173@gmail.com>
In-Reply-To: <20230502010759.17282-1-aford173@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 2 May 2023 16:32:01 +0800
Message-ID: <CAGXv+5E00dGDjVz=XNc=bGLsxisA=ShrqESQZLg+MsN-xKe5qQ@mail.gmail.com>
Subject: Re: [PATCH V3 0/7] drm: bridge: samsung-dsim: Support variable
 clocking
To: Adam Ford <aford173@gmail.com>
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 2, 2023 at 9:08=E2=80=AFAM Adam Ford <aford173@gmail.com> wrote=
:
>
> This series fixes the blanking pack size and the PMS calculation.  It the=
n
> adds support to allows the DSIM to dynamically DPHY clocks, and support
> non-burst mode while allowing the removal of the hard-coded clock values
> for the PLL for imx8m mini/nano/plus, and it allows the removal of the
> burst-clock device tree entry when burst-mode isn't supported by connecte=
d
> devices like an HDMI brige.  In that event, the HS clock is set to the va=
lue
> requested by the bridge chip.
>
> This has been tested on both an i.MX8M Nano and i.MX8M Plus, and should w=
ork
> on i.MX8M Mini as well.
>
> Adam Ford (6):
>   drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
>   drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
>   drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
>   drm: bridge: samsung-dsim: Dynamically configure DPHY timing
>   drm: bridge: samsung-dsim: Support non-burst mode
>   drm: bridge: samsung-dsim: Let blanking calcuation work in non-burst
>     mode
>
> Lucas Stach (1):
>   drm: bridge: samsung-dsim: fix blanking packet size calculation

Still works, so whole series is

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on i.MX8M Mini based Hummingboard Pulse.
