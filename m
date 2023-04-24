Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA7C6EC6E9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 09:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FA410E1D5;
	Mon, 24 Apr 2023 07:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C4410E1D5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 07:20:32 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-443bd60988eso2866072e0c.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 00:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682320832; x=1684912832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=InRVR5tViOC9ShtIBT4ewDyQe/oRbEDimCDKVkObJco=;
 b=GH2STlEFktHM2bkMFI1q6ADmk9pyiHflx3473RYpy5DlEJA+9Re+2Fj76zdfR24ljy
 rr+Zz18yIbv59TCnqcl0Ak8PrPTO8JbKuMxizV6GkylJ8F79Wc4SC157k2cCQbFRtfBK
 prSycLhVOXqitti6e6Mys2T1CXOu0lYMLpnCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682320832; x=1684912832;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=InRVR5tViOC9ShtIBT4ewDyQe/oRbEDimCDKVkObJco=;
 b=OItksVvfq70NiUS385/LsNNqy7z8+LoA6WcwAVONcRMCrbcxtkCafmMICz4hiGxJnT
 IexUFGb2RZIKbw+G9ofzA9lMmtcP+i5+9n0SLGJdevWpsKk3Abr8ig//jQDv1gPuSd9i
 RIxxRwhHBcqMhPmLiG/p0aFb68UU+KfXRki9yQb0ZysjMiaAn4j2TNx8AVHRswE4ancc
 RaQpNGIprMzb24fVWKFc83BlD7pWsEx7IxrrfErQX5P9GLu40PIt+47pHL30SiZ/+nJx
 /v+mkCAL1Snkh8TO4bWFfBBwMteQktZWyY7YvdUNpjg+8ODgL5cW0SjfUho3gzMjnMa6
 8Phg==
X-Gm-Message-State: AAQBX9cuk1oB2FoEHjMQbUWwEGW9GoscrwvW8S5Wsx3fi99vQ9f2hnMR
 qnnzuJc0FgTeIGV0iqOQBi3DtW+pimPClvu2och+UA==
X-Google-Smtp-Source: AKy350YuctfBKriko29k+cGfbV+w1OLRc1OuTx3Hk0RuY+HlIwk3Pv/0iPX9qpxRnYDkWfQIietUJK3kZuZPFQzYRfQ=
X-Received: by 2002:a1f:3f53:0:b0:43f:fc32:15f0 with SMTP id
 m80-20020a1f3f53000000b0043ffc3215f0mr3519433vka.14.1682320831928; Mon, 24
 Apr 2023 00:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230423121232.1345909-1-aford173@gmail.com>
In-Reply-To: <20230423121232.1345909-1-aford173@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Apr 2023 15:20:20 +0800
Message-ID: <CAGXv+5EqdFb1hgQ0uP=hmPDrAH_enp39PSUxmQ6WDZ+0h-vd6w@mail.gmail.com>
Subject: Re: [PATCH V2 0/6] drm: bridge: samsung-dsim: Support variable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 dario.binacchi@amarulasolutions.com, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 23, 2023 at 8:12=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
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
>
> Adam Ford (5):
>   drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
>   drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
>   drm: bridge: samsung-dsim: Dynamically configure DPHY timing
>   drm: bridge: samsung-dsim: Support non-burst mode
>   drm: bridge: samsung-dsim: Let blanking calcuation work in non-burst
>     mode
>
> Lucas Stach (1):
>   drm: bridge: samsung-dsim: fix blanking packet size calculation

This makes the micro-HDMI port on my Hummingboard Pulse (w/ i.MX8M Mini SOM=
)
work properly, so the whole series is

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Thanks!
