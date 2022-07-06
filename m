Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC7156895F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 15:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B04611B686;
	Wed,  6 Jul 2022 13:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA83111B686
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 13:27:37 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id m16so3796274edb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 06:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VAoTYvqtCGzGoHx8PH7beT1Zf6846EDzggUtK1ftd2Q=;
 b=vGbQcro1TYNGE7MExrnv/MlDFRVV0IXZ2Jy9LsMcYNBQi2F0t3KNJ3VsPSKX4tVy/G
 w2TwOFSmBmjYfBy+nMZ3xjYyeK2Px3YJza4NS/MMPZBQPUAhKKOw4S/L55LaYWOWn+8R
 LrkjnwYS7pSwUdJ7Ry9v3RbB+pHFN7BpmoFKQHb67ywFaHAsPMNwTK66yb2wSrMxXHlp
 VsYiT9a95MbVqYVn/eROOkWwdR8UVNqqlRf+wtmKL29UPSxX/+X6K2bpYeCt1VqlOQRD
 ML9U7+xSLHgO4pYsUaQEkq727dc2IA+RAEYpdhSdTjJyPMJbNVUEpBqOakOLG7TwhVM7
 4LtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VAoTYvqtCGzGoHx8PH7beT1Zf6846EDzggUtK1ftd2Q=;
 b=m5CMDdvJSovibiN3tPDnqpjnTlBAJRmO93kmGbX68K+HvXTPTybfuD7pmDzPgIXhSj
 ltSGBUGI6FQTzS+zaW27Z2hx8gHM+GuAc99XPNMWPA0bTSAJTzzzLguYnMAvqAwV4K4Z
 AIKYRySR/A1KK0WS4qqzrEg+sYPrbjrm4DxdivoJdOeJ1OREK5ebxPrve9K0UhzJddVQ
 5H/Es0uyEKeB84/Qk7+RbDp1uK1NUfrvgelcYkengDewXDIhucwwGi/NDRwNEFEXdhLJ
 8s3P9nrKTlAxgJWJ9HrmjBbYJmQAExwbjv39MSXR1gbZskO6CEeaM+otz7SQYB78m6ME
 LPow==
X-Gm-Message-State: AJIora/S2Eo8FGqljVqt4yenT3IYo8ZjnIOg/2R2tfFy8ScOJckbmKzB
 Yq7FUvSnGzROGEyDG8uEMYpLDEJkJzq2UZBm67LyEA==
X-Google-Smtp-Source: AGRyM1vskFTZF4O+wMm1zEX9P3+2rr/5OchnqP4tR+YTAB8khuncXQa7GbdaxEgG8xneGNRXKppyB7z/4iXwxeYfhcI=
X-Received: by 2002:a05:6402:248c:b0:437:afe7:818b with SMTP id
 q12-20020a056402248c00b00437afe7818bmr53505217eda.239.1657114056472; Wed, 06
 Jul 2022 06:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220706125254.2474095-1-hsinyi@chromium.org>
In-Reply-To: <20220706125254.2474095-1-hsinyi@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 6 Jul 2022 15:27:24 +0200
Message-ID: <CAG3jFytve9yrhfwiG-PTcq-KFPN1Hb52DPZM4nWpd5pQ9mx5Cw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] anx7625: Cleanup, fixes,
 and implement wait_hpd_asserted
To: Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Jul 2022 at 14:53, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> This series contains:
> Cleanup:
> - Convert to use devm_i2c_new_dummy_device()
> - Use pm_runtime_force_suspend(resume)
> Fixes:
> - Fix NULL pointer crash when using edp-panel
> and Impelment wait_hpd_asserted() callback.
>
> The patches are not related to each other, but they are all
> anx7625 patches so they are all stacked in this series.
>
> Hsin-Yi Wang (4):
>   drm/bridge: anx7625: Convert to devm_i2c_new_dummy_device()
>   drm/bridge: anx7625: use pm_runtime_force_suspend(resume)
>   drm/bridge: anx7625: Fix NULL pointer crash when using edp-panel
>   drm/bridge: anx7625: Add wait_hpd_asserted() callback
>
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 179 ++++++++--------------
>  1 file changed, 65 insertions(+), 114 deletions(-)
>
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>

Applied to drm-misc-next
