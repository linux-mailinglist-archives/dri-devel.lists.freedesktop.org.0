Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A086E76C8FE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 11:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E0510E069;
	Wed,  2 Aug 2023 09:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FDD10E069
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 09:08:48 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-583e91891aeso75584687b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 02:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690967327; x=1691572127;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V4JyHfiibRFYZGtLi4yuv7+iKXcqBb0CdEPjLP4kQ2Y=;
 b=l53X+3415Ye0gUqITzWhdICHp8ql0L5zj2ofJ39sRbUcud8MnyMZgGmPl7PPDknW7W
 ZxxoEPUuMBdk17JHUt9HX5v15+ccj7h0e+yFcA20u3XLYNfHLw8clpq7ZEw1ygK7+gYA
 0qo1CTVGDJucmA/jBxri1xVKFYadOCd19EX/h3qGuuk650EaC07c55xddL1cseC34KoZ
 sS/QblvBhHmXAHjRYALBlqOroSPVF7k0gmUu7ZG7TRnK+iHHZQk7S5SnJwxBvhvI1Mqi
 aru1yuNg+DHksd06u6DZcaU3JyqWm4/Z9cf0lSPrBGDnAMT2Gr88QDLjI0cEJamW80t5
 +vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690967327; x=1691572127;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V4JyHfiibRFYZGtLi4yuv7+iKXcqBb0CdEPjLP4kQ2Y=;
 b=enCMHKPGfwHswoivqojRO/LLb556B9YxON7pfkpMhsteVz+JP2/doT+Uo8bC+ZycUA
 UfEGeK1IecprVNev+o7jcB3xRvCPyHIdKchZmqGV0dPXr/g9XESsQfatC2yY/IEsjDEK
 9UCEKDZS8htWcke+kERVxZJMgmSYSN0k+BgN9frt/Ka59Q8xS8EGuCPFrBIre3RWH7rK
 L3dJCGqPvE/IQpKm4Kwcsn4TgsvEhRyGm9mL2j5+nO57iJYSbFhJrn9NQlw4XSaGFJrN
 ALZLTvAhjjDd2w7GuVyd377yfAUucgnh/iqWRk5m+XES7qAduR597wyWsv6XX79MtyNx
 fTcA==
X-Gm-Message-State: ABy/qLZM8hLBfSsHUShVjGdYCyEwIQ95Uj0SoNmQ9yc31ksf1VK7F0Uw
 9BaiHYOEKX9nJzaxqzs+/y4+BxVYejsbgKzD9WPfSQ==
X-Google-Smtp-Source: APBJJlFAfrBBrLo31ENsKKGz80A86bC7eYZ0qRII1yo+K9xeF/aUOlOrLSstsENHwHA6hSEg+zwlHKiH/6hRv+kDKhg=
X-Received: by 2002:a25:ac42:0:b0:d15:cbbb:d44a with SMTP id
 r2-20020a25ac42000000b00d15cbbbd44amr16311636ybd.42.1690967326014; Wed, 02
 Aug 2023 02:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
In-Reply-To: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Aug 2023 12:08:35 +0300
Message-ID: <CAA8EJportnT-xHFH8QP+aiomXMLbm1r=02HMB-eNDEU+JqgEoQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA
 and EOT packet"
To: Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Amit Pundir <amit.pundir@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Aug 2023 at 11:52, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> This reverts commit [1] to fix display regression on the Dragonboard 845c
> (SDM845) devboard.
>
> There's a mismatch on the real action of the following flags:
> - MIPI_DSI_MODE_VIDEO_NO_HSA
> - MIPI_DSI_MODE_VIDEO_NO_HFP
> - MIPI_DSI_MODE_VIDEO_NO_HBP
> which leads to a non-working display on qcom platforms.
>
> [1] 8ddce13ae696 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA and EOT packet")

Nit: I think the preferred form is to write `... reverts commit abcdef
("foo and bar")', but I might be wrong.

Other than that:

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Fixes: 8ddce13ae69 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA and EOT packet")
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Link: https://lore.kernel.org/r/CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com/
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 5163e5224aad..9663601ce098 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -774,9 +774,7 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
>         dsi->lanes = 4;
>         dsi->format = MIPI_DSI_FMT_RGB888;
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> -                         MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO_NO_HSA |
> -                         MIPI_DSI_MODE_VIDEO_NO_HFP | MIPI_DSI_MODE_VIDEO_NO_HBP |
> -                         MIPI_DSI_MODE_NO_EOT_PACKET;
> +                         MIPI_DSI_MODE_VIDEO_HSE;
>
>         ret = devm_mipi_dsi_attach(dev, dsi);
>         if (ret < 0) {
>
> ---
> base-commit: f590814603bf2dd8620584b7d59ae94d7c186c69
> change-id: 20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-6f042b1ba813
>
> Best regards,
> --
> Neil Armstrong <neil.armstrong@linaro.org>
>


-- 
With best wishes
Dmitry
