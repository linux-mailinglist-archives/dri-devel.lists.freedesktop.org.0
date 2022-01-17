Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE714904ED
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 10:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A9410E559;
	Mon, 17 Jan 2022 09:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3E810E507
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 09:30:32 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id o3so20114672pjs.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 01:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CypZ2O0aOlLYoEWjzj8LBaIlTHfP284kF/aI9kD9Oi0=;
 b=F0lYJHcNkJ4Tt8/+tLCR2AdNzLJeYYHixlTpRYn8nq8A9eQ3MC/AqMUv2sQY54+FCk
 MbElzvIO5ON3FF2RMklVS3uFQVF/GVEYjbiS8OMTm2km4AMVFNeERUFC8RRh9Z9TgZEu
 pTWbldJd/DlasbIpzIkbkviL7rPcKjrksiIUtgaoJfwRtHhTeyNJMdIZ3m6kqftr52vH
 Yd66AK6GGfA7Np9TU/6M6V8mAXVwQV7N2vpm2qMTi2ygJ91yrZw0Kp5KkiZPIPh9ApHv
 HkMr9OJbH77gY3ihOVAzdmW2dSaDkURsBx1/fcPzjXT00zhg2/K8/dk6/0PWQ1Qxf6Y3
 J0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CypZ2O0aOlLYoEWjzj8LBaIlTHfP284kF/aI9kD9Oi0=;
 b=F3JnhReCIEj8A9bXiiAe85Y5Fc5Le56+OANfdHBGWw2NnkHNt4sD2lCjY7WBpCSqr6
 Kkx3W+7+lUnzdePA7hG19QzxfSulr7wYWxrsWUsVSVS1+RVOvD4tI7jhHp6npbLubbdu
 tDMwIGh3pEtX8ugfnTB2Fc87LeUmbfcfuG9kg82i0PMBI2tXbXwK5V8J2y5urJ7M5Duc
 DEzbXxfZR9Blu9VZ3TuNZjawIuybQXgehPa40cPOdJxN3PAouva/JFyH5l+/fT7Bf1gl
 NhRVe4KYzR2X/RrXRToGA7cIiIhNkd9S6bNc3J8lfiXU+vvehzdHeaq5cBCTnTtIuWM2
 mK3A==
X-Gm-Message-State: AOAM533hqmQGkYah5o+gEXLw67G4YMDXEd55xdN7JEDMBcA07s2zpfyZ
 Fu0suaPXVNe/X72xrPFjKhwJ0FPNNEXfLH+AePotbA==
X-Google-Smtp-Source: ABdhPJxK0U9MlTiUUxHtfSgC3lqiJHtxmlZTFYZyL0/lOpEOPkoo9p85ByTfesogvIVuCUA+0pqLXr+igjTH2NjHqdU=
X-Received: by 2002:a17:90b:3e8e:: with SMTP id
 rj14mr17855889pjb.179.1642411831985; 
 Mon, 17 Jan 2022 01:30:31 -0800 (PST)
MIME-Version: 1.0
References: <20220117052146.75811-1-julianbraha@gmail.com>
In-Reply-To: <20220117052146.75811-1-julianbraha@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 17 Jan 2022 10:30:20 +0100
Message-ID: <CAG3jFyvs_J218R0q=geUaO7V25bkdu_zjW7GMKBoP+phHnXACQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm: bridge: fix unmet dependency on DRM_KMS_HELPER
 for DRM_PANEL_BRIDGE
To: Julian Braha <julianbraha@gmail.com>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, jagan@amarulasolutions.com, fazilyildiran@gmail.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Jan 2022 at 06:22, Julian Braha <julianbraha@gmail.com> wrote:
>
> When DRM_CHIPONE_ICN6211 is selected, and DRM_KMS_HELPER is not selected,
> Kbuild gives the following warning:
>
> WARNING: unmet direct dependencies detected for DRM_PANEL_BRIDGE
>   Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && DRM_KMS_HELPER [=n]
>   Selected by [y]:
>   - DRM_CHIPONE_ICN6211 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=y]
>
> This is because DRM_CHIPONE_ICN6211 selects DRM_PANEL_BRIDGE
> without depending on or selecting DRM_KMS_HELPER,
> despite DRM_PANEL_BRIDGE depending on DRM_KMS_HELPER.
>
> This unmet dependency bug was detected by Kismet,
> a static analysis tool for Kconfig.
> Please advise if this is not the appropriate solution.
>
> Fixes: ce517f18944e ("drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB bridge")
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
> v2:
> - changed from "select" to "depends on"
>
> v3:
> - new line now uses tabs instead of spaces.
>
>  drivers/gpu/drm/bridge/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 61db5a66b493..a1b52eaf26e0 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -30,6 +30,7 @@ config DRM_CDNS_DSI
>  config DRM_CHIPONE_ICN6211
>         tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
>         depends on OF
> +       depends on DRM_KMS_HELPER
>         select DRM_MIPI_DSI
>         select DRM_PANEL_BRIDGE
>         help
> --

Applied to drm-misc-next.
