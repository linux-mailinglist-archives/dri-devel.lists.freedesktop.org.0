Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424CF48576F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 18:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C42810E415;
	Wed,  5 Jan 2022 17:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E47A10E42D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 17:41:20 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id j16so114969pll.10
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 09:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gzQ72BBdlbIwljQ9GmIvY1Y0Vph95fp3b2f0mlNY2ig=;
 b=E8W/mM5tg4uMQl+gYVBTsmLjT8y0cxNDt0JmMghEnL77yQqHQnUAuXH1cOLGRCpVqj
 MLRzKva/JfvhYIK5VRk+A+nwDfSMdZrPy7W0PoULQn2fZvRFiy3F6cCIcpAgZ5EfsGnj
 AQOTipQ6XY0wPu3WcTsTGpu1O5KHxTzYWJzB2Y7MZockAGO519UOaSa4WQTKgGyyVitq
 oNw3kKHcEcpatxlGscm+A6lys3gpHRtzBm5fulOeXypFtty+GT573xjUDkQG2E+NheI4
 KZJJO4SVSI6xX5583UYEXaPUHbRbKoDpqtQIOr/42ivp6/0yExbE8Qpw0CWX0GEZ1U+O
 G73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gzQ72BBdlbIwljQ9GmIvY1Y0Vph95fp3b2f0mlNY2ig=;
 b=ACL4mVIl/LzErjQjGAk061v6hiKk8PTQvMoMBiRLEsdx9076mqWwo8B+/i1GdX1jvF
 aMpnsWtU+oHnU6XYJnrloF3gTwvPgP7aI006FUvVk4gzT2uLin6TDYPVuB0xhs6fqYm9
 uy8HagMzHQr1FPF17EalUl+DzVCgrKKkUghafGOk6Wqhe1AK8k+galcV+0L4aFgKBqca
 t6N/LL7uAdza7Te6pdn5whXRq7Jfi/wd48wKCtEFNCconm4FvfQ78dvK98BUQfkSRSph
 A88/mYKZzVQkONXouQcdRYemtP76SJmrmHuB9J34RvnhiXbLNXZ0+SFg+iBI3uCESiwM
 /Orw==
X-Gm-Message-State: AOAM532s5B9p23UrkTgSPy9phu9Js9S3bDThBCo8HNN7AW6DdjdCKn9F
 eZnd8LzJgoGg6hHL/qy+H7AkSLHLD7YsL3uY9O6gGg==
X-Google-Smtp-Source: ABdhPJxN8ppKSK8GXuZut/tPMjou6EwYIg6LidumtfgGEZel8tmkV9qHTU80LjGPle7XoYStcasMHA7FIbBkapv5XUA=
X-Received: by 2002:a17:90a:5295:: with SMTP id
 w21mr3113121pjh.179.1641404480159; 
 Wed, 05 Jan 2022 09:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20220105104113.31415-1-linmq006@gmail.com>
In-Reply-To: <20220105104113.31415-1-linmq006@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 5 Jan 2022 18:41:09 +0100
Message-ID: <CAG3jFysAF8EvNZYwZYi4XYg9PG9quQCN=rDmsReS=bwvgLJ-Nw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: Add missing pm_runtime_disable() in
 __dw_mipi_dsi_probe
To: Miaoqian Lin <linmq006@gmail.com>
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
Cc: Archit Taneja <architt@codeaurora.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

Thanks for submitting this fix.

On Wed, 5 Jan 2022 at 11:41, Miaoqian Lin <linmq006@gmail.com> wrote:
>
> If the probe fails, we should use pm_runtime_disable() to balance
> pm_runtime_enable().
> Add missing pm_runtime_disable() for __dw_mipi_dsi_probe.
>
> Fixes: 46fc515 ("drm/bridge/synopsys: Add MIPI DSI host controller bridge")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index e44e18a0112a..56c3fd08c6a0 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -1199,6 +1199,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>         ret = mipi_dsi_host_register(&dsi->dsi_host);
>         if (ret) {
>                 dev_err(dev, "Failed to register MIPI host: %d\n", ret);
> +               pm_runtime_disable(dev);
>                 dw_mipi_dsi_debugfs_remove(dsi);
>                 return ERR_PTR(ret);
>         }
> --
> 2.17.1
>

Added r-b tag and applied to drm-misc-next

Reviewed-by: Robert Foss <robert.foss@linaro.org>
