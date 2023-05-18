Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09833708073
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 13:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453FD10E511;
	Thu, 18 May 2023 11:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA4C10E511
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 11:52:39 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-ba86ea269e0so2406531276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 04:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684410758; x=1687002758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mBVrcck5s6OuGtzh+rhmsWfcN2VuaI9gIbet+WEeIh0=;
 b=IBDQjG8w9HEylhywOl9vA5UIZfMIJ+hgwPjUGH9uO2EPPc35MaAWOzPXbLXGzuGgF5
 rnmZ/vwuvY9uQanydicMziFTcVFah8uNnePp6rPNZxtDUGKcGoQbrFF5qXACHrR37bHc
 dF4lF06QhJ95zo/CznbKZS48Iv+Fh7kS3DbhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684410758; x=1687002758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mBVrcck5s6OuGtzh+rhmsWfcN2VuaI9gIbet+WEeIh0=;
 b=FYo+bEJsIs64UjlzK9xyAqKo/pVoU0wwttoR0x4PvDEW09ZXYYVlCoSQyS4+HvtsCf
 rf7ZzSCZGerqPkRYd+/WmxusY5/Wcurg8+5Xbe/xe5032f82dijZax4uNoSmXUT7l9IZ
 fy3+8hetbt+NdCCu0YOFbfccVRRKcukxFw9SVN8Xg6ix/gVxwXi+++vstJG1rE5bTigl
 imJZyNQOGh/g21gYgJEPmMol/LUT9NZqiE9SuHauOuQ/9VMLHUHFVloyH4Ck45/Lh29l
 LVSf4hgNhZznsCOqvH6ma39fOmb0JN8YXoNJOBR0U0w1sPCCQiP63WJa+k9eCZGtBa4Y
 6zZA==
X-Gm-Message-State: AC+VfDzjJW3tSNLgxqqTtUeeg0gFMQUKxCjfuzaatj9ONuVyHatdmEIG
 8wddBTOGpfx5OrU94+nrPEt3XauqRD3J6xi77EnXtA==
X-Google-Smtp-Source: ACHHUZ548aNPyGdZgjeLL3XrPR2B6YAlN0Zu3cNB03mO7YKE5/94BhuZByCCpE5y5jDki39KJwQtDgcCv5qSvsFrCfs=
X-Received: by 2002:a25:e70f:0:b0:b9e:3bea:ebd2 with SMTP id
 e15-20020a25e70f000000b00b9e3beaebd2mr944887ybh.31.1684410758177; Thu, 18 May
 2023 04:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-3-aford173@gmail.com>
In-Reply-To: <20230515235713.232939-3-aford173@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 18 May 2023 17:22:26 +0530
Message-ID: <CAMty3ZB9xrO+LPGVCcoDfdWo9CP_DLVhaKm33y768+ix6nP7cQ@mail.gmail.com>
Subject: Re: [PATCH V6 2/6] drm: bridge: samsung-dsim: Fix PMS Calculator on
 imx8m[mnp]
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 5:27=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> According to Table 13-45 of the i.MX8M Mini Reference Manual, the min
> and max values for M and the frequency range for the VCO_out
> calculator were incorrect.  This information was contradicted in other
> parts of the mini, nano and plus manuals.  After reaching out to my
> NXP Rep, when confronting him about discrepencies in the Nano manual,
> he responded with:
>  "Yes it is definitely wrong, the one that is part
>   of the NOTE in MIPI_DPHY_M_PLLPMS register table against PMS_P,
>   PMS_M and PMS_S is not correct. I will report this to Doc team,
>   the one customer should be take into account is the Table 13-40
>   DPHY PLL Parameters and the Note above."
>
> These updated values also match what is used in the NXP downstream
> kernel.
>
> To fix this, make new variables to hold the min and max values of m
> and the minimum value of VCO_out, and update the PMS calculator to
> use these new variables instead of using hard-coded values to keep
> the backwards compatibility with other parts using this driver.
>
> Fixes: 4d562c70c4dc ("drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano sup=
port")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # imx8mm-icore
