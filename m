Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD005490BA0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 16:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F48110E3C6;
	Mon, 17 Jan 2022 15:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AACA10E3BC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 15:42:40 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id a5so10515836pfo.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 07:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mBse3TDhMT3P1QzjpmTykdxb+O3mXQF8X49QrJGnK9w=;
 b=LZTP5w65jwgoJGxqEXUMQBhGqnjlbTs84KuPFBpRzYEx0DwsSeJeLBikEqHqkrSW9g
 VSpBlg/Cogu47PGexznErP70Sr0aY7rxPv5bhtOLPGVsqRDI4CQFxo1/MTfyCWUNYQew
 UWHrktQHee2IMNUM2nvKprXbyMXe4Dc7lflFtBpUDqWW4OCum5RU2Vk0pHf0sT1wfHM3
 Usl/QhE1XVbcgXSbXL4IM9B7aEqPuZb8f+SzqBwnNiSi30/ryHWQKDvGlHZkLWhH/5XB
 aWjmgRDVAn8TCiUosMZQNjwfgAG8+SC0xnypzhxkf6TIGcn3v5jCcBjJ4vCGsBaOrrjt
 gKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mBse3TDhMT3P1QzjpmTykdxb+O3mXQF8X49QrJGnK9w=;
 b=PsNcemQxXwTx8CSNxDMYgtOoUTDNF1K1tjrH2QICA41ab+6nwQyhov5JP93zi9eQ5t
 VR/TyRg+S9zzav4o68Yfg4BICl7GcZLGKVvJmF+91SE79YNjXQnLtcA+3kLeL95rzYlv
 B1qiE3YY5171CIc5fVJWg4sJsoOEXZPKTJKXc1IiS3cgDfKNXTzUFSRhaALfzj4ANP7A
 4pjL1fQZUsq0+tgo7WXIjH2oetMgXwWvOhPMvCU0/AtOZ6l8DEoyDUXFm2jAgrZV4e/k
 BfsGeZmzbbCZBw+cZIqL8PaIOOTxqgvfBq1ZyNpZGr71msZh5GDFiU16NdlNiqTCgq4+
 A4aw==
X-Gm-Message-State: AOAM532urzfCYdzGjbGuykKzbQ83/v3/G5VtBJer1Z9aG/DWD5dm1qpG
 tl6EWleBFHOuSa7vN4BvFecFsJj0dezpBBalZT9uFw==
X-Google-Smtp-Source: ABdhPJyK+mJqd8HpVnnFKs335VNzfb1ZQwWiuJ4tIjAYkUGYjihDvc47IddIXGdc5+gkomCMF5P6xqqjbwDuvvVxMCk=
X-Received: by 2002:a63:2b03:: with SMTP id r3mr19439606pgr.201.1642434159652; 
 Mon, 17 Jan 2022 07:42:39 -0800 (PST)
MIME-Version: 1.0
References: <20220117100949.9542-1-qwt9588@gamil.com>
In-Reply-To: <20220117100949.9542-1-qwt9588@gamil.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 17 Jan 2022 16:42:28 +0100
Message-ID: <CAG3jFytFGPZ+eksbaj2muT8R=1QmCCPRerv6yYZC6s9X+TOsbw@mail.gmail.com>
Subject: Re: [PATCH v5] drm/bridge: anx7625: Return -EPROBE_DEFER if the dsi
 host was not found
To: owen <qwt9588@gmail.com>
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
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Owen

On Mon, 17 Jan 2022 at 11:10, owen <qwt9588@gmail.com> wrote:
>
> From: owen <qwt9588@gmail.com>
>
> It will connect to the mipi dsi host and find the corresponding
> mipi dsi host node, but the node registered by the mipi dsi host
> has not been loaded yet. of_find_mipi_dsi_host_by_node() returns -EINVAL
> which causes the calling driver to fail.
>
> If the anx7625 driver is loaded afterwards the driver requesting
> the mipi dsi host will not notice this.
>
> Better approach is to return -EPROBE_DEFER in such case.
> Then when the anx7625 driver appears the driver requesting
> the mipi dsi host will be probed again.
>
> Signed-off-by: owen <qwt9588@gmail.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 2346dbcc505f..297bbeb5aae0 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1660,7 +1660,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
>         host = of_find_mipi_dsi_host_by_node(ctx->pdata.mipi_host_node);
>         if (!host) {
>                 DRM_DEV_ERROR(dev, "fail to find dsi host.\n");
> -               return -EINVAL;
> +               return -EPROBE_DEFER;
>         }
>
>         dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
> --
> 2.31.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
