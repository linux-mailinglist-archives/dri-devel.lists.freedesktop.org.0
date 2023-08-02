Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D66D576C935
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 11:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E68F10E52B;
	Wed,  2 Aug 2023 09:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D65510E52B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 09:16:36 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7672073e7b9so416559885a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 02:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690967795; x=1691572595;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4RqvQQdJp1hFdbPf4OMSlvaFhWgja7uGQCZmj+KNPJo=;
 b=WWYRFt6UWcgMzlZL5nC3JdxOCVTJWdxzp0Jxn+KUdVY2M25MT0FVMkmrj/SEp/wTRg
 Tr0AKXCZd1Z2T/qWRVdazVCF4NO3qllZzMyNQRZJgLTPiqX8VDxF5Af6o/xF6HEz0tHX
 Sa8uhIMgc46GeDVp2TSipQ7kXiW1+sfQSzYtC/J2AaomnjimbYgJiZJyP55T5NM+Rx3v
 Uxqr7WbFgFbefjxNkImg9rL5O3n4TiD4Gz0XA9yyiZv4OODGqqA1zGPjYMvApwWAOwOQ
 BQChS4H0f/MurUPwDccnGZzSNdeY6SaWa8CaL1odlR1rEiZsZ8JMXkZdDe68ABXNbJp4
 imhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690967795; x=1691572595;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4RqvQQdJp1hFdbPf4OMSlvaFhWgja7uGQCZmj+KNPJo=;
 b=ELB4R0MAkonMDRnm2GOe3+RmvtUHblm5f3wADyuvfOcA41Js+m2h5JorniIvGsw7+W
 URZ+/KaDnPfW8ZT3RCgF63ksBtAuKYzQLqlY/vBCV4eIFYbpegoy6kRdhpYVdPYsxP5S
 YBvH7oKaOgd09OEzzXIf5A0EjUBM4TSzMAu082+fxrVr3IOgOAFMVIxj/bgbPijTBqua
 eCjnd4xVMVOOC7ii4jC3Z4IGks61DKpJ5rqm+R1qVU9AL3EldG4ckaZTErVZvZaShkBw
 3e5PnxOWQr14cqLLh8MQCQnD5423f7+XKi0p9RUKtKzTO9cv4//yMWhJIh6llKtgRqLP
 z3hw==
X-Gm-Message-State: ABy/qLZEeXYgtZUNe4eIjOh1beghqWki6sLjleb+1IdrRnYE/dfwxTQm
 Xszty2a37OJfCt6K7adBwGKF8QNOLGuJ4SW3fx+Yjg==
X-Google-Smtp-Source: APBJJlHNhb6YQYwgaQkW+eQSgd89TWqGTpASPIjO4FBQatVAtmJ/oaGPRCiRuTtehzFZJx+nyEw7ycYC5dIh2IsESJI=
X-Received: by 2002:a0c:eace:0:b0:63c:fb87:625d with SMTP id
 y14-20020a0ceace000000b0063cfb87625dmr13972844qvp.3.1690967795200; Wed, 02
 Aug 2023 02:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
In-Reply-To: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Wed, 2 Aug 2023 14:45:59 +0530
Message-ID: <CAMi1Hd31A53-87EdnupZio_FCjgMRyPRxvsfzeY=q-iT=3qBfA@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Aug 2023 at 14:22, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> This reverts commit [1] to fix display regression on the Dragonboard 845c
> (SDM845) devboard.

Tested-by: Amit Pundir <amit.pundir@linaro.org>

Regards,
Amit Pundir

>
> There's a mismatch on the real action of the following flags:
> - MIPI_DSI_MODE_VIDEO_NO_HSA
> - MIPI_DSI_MODE_VIDEO_NO_HFP
> - MIPI_DSI_MODE_VIDEO_NO_HBP
> which leads to a non-working display on qcom platforms.
>
> [1] 8ddce13ae696 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA and EOT packet")
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
