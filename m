Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BE3197B34
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 13:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBC06E24B;
	Mon, 30 Mar 2020 11:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7496E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 11:49:30 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f20so17734946ljm.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 04:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3LI716UXF6bfo4VYqoP3VeDTvzHtXiCh3tM1tgh2v+k=;
 b=nsExSjXHqIvgbyHEhZzSlHZ6qD7wnb3b7lQ2UUHlFb5MZvlWcVzdj0RPl6mpt8ALgm
 lr8frOmesionfQ+vaY8rFIX8GvC8Q7ZgFYyxVx1tlnkK8QSOZPHwLZ/2A+Zbwa2KICUA
 g9VnqDbo0OoQPSqFcQsSYwvzTEzLmQlPT6RyfE5yy6S3DEVF/X8MOTnUv1G5iBt/D9M5
 Xuy8PBJUBLjxWgO0vVHF69ZxuHLj13gwdEuSc3LZcVW5XIK3hJkUaWz9lZ54g7h7D+jG
 oSxXr/rvj7FpRtkUM4BALSUJbOlZX1oJH0VblPEPkpwEyAfpIGByujN/jXC47U8bS0cz
 q4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3LI716UXF6bfo4VYqoP3VeDTvzHtXiCh3tM1tgh2v+k=;
 b=RViChViEL7vYi7n9fC6mXWUM4B3WIPLAaLeLfxiUOyDbyMxJjU75el1weXLsgHUwou
 ifvdySOo4QoyozMoV1BzYPckwqZEeEazchM93Yl793kuVHEj9tdIfM+2Wlc+cxBg4+7D
 Lp2t68m6fyaKLwx4hfUP1ZcxK4fQ8jpw4coUC22nIcTImvSog2A3S05TEjUDxNMj5/5w
 NI+CjsmdqEWI1ubWhovZ114btpICvc0s4ehcBy6l2q5m8hLLIBlCbKcQuL9Jm1yAvTiK
 9+Jn59OFf8OsCb3S+tGW7ZKOFRQJH0C8celipFXAVxDRqCoLjOMrMKBy1gmnazrucyb9
 I4EQ==
X-Gm-Message-State: AGi0PuaAL6C1nzMrKR/gmmLmBW6ueADi9CsS8MVKWDjXfGpctvXgfe6q
 VMGxlV/9avtjTbpA6wB2oqzE+5S9y8JuBwOxDbc=
X-Google-Smtp-Source: APiQypJcW+KgRk6o/Ou48vwV4luc+5i+/EZubfDgsinD6eEi6d3RUluGeVWMrjQtxj/UdvutLn1NA3q5aclTGJP/Ah4=
X-Received: by 2002:a05:651c:30b:: with SMTP id
 a11mr6771326ljp.164.1585568968812; 
 Mon, 30 Mar 2020 04:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200330113542.181752-1-adrian.ratiu@collabora.com>
 <20200330113542.181752-5-adrian.ratiu@collabora.com>
In-Reply-To: <20200330113542.181752-5-adrian.ratiu@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 30 Mar 2020 08:49:19 -0300
Message-ID: <CAOMZO5CEZSBfhb9xAdf=sDhUnmSeuWSsnUQArz=a1TPzytLAeQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] drm: imx: Add i.MX 6 MIPI DSI host platform driver
To: Adrian Ratiu <adrian.ratiu@collabora.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Martyn Welch <martyn.welch@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>, linux-rockchip@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adrian,

On Mon, Mar 30, 2020 at 8:34 AM Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
>
> This adds support for the Synopsis DesignWare MIPI DSI v1.01 host
> controller which is embedded in i.MX 6 SoCs.
>
> Based on following patches, but updated/extended to work with existing
> support found in the kernel:
>
> - drm: imx: Support Synopsys DesignWare MIPI DSI host controller
>   Signed-off-by: Liu Ying <Ying.Liu@freescale.com>
>
> - ARM: dtsi: imx6qdl: Add support for MIPI DSI host controller
>   Signed-off-by: Liu Ying <Ying.Liu@freescale.com>

This one looks like a devicetree patch, but this patch does not touch
devicetree.

> +       ret = clk_prepare_enable(dsi->pllref_clk);
> +       if (ret) {
> +               dev_err(dev, "%s: Failed to enable pllref_clk\n", __func__);
> +               return ret;
> +       }
> +
> +       dsi->mux_sel = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,gpr");
> +       if (IS_ERR(dsi->mux_sel)) {
> +               ret = PTR_ERR(dsi->mux_sel);
> +               dev_err(dev, "%s: Failed to get GPR regmap: %d\n",
> +                       __func__, ret);
> +               return ret;

You should disable the dsi->pllref_clk clock prior to returning the error.

> +       dsi->mipi_dsi = dw_mipi_dsi_probe(pdev, pdata);
> +       if (IS_ERR(dsi->mipi_dsi)) {
> +               ret = PTR_ERR(dsi->mipi_dsi);
> +               dev_dbg(dev, "%s: Unable to probe DW DSI host device: %d\n",
> +                       __func__, ret);
> +               return -ENODEV;

Same here. You should disable the clock. Shouldn't you return 'ret'
here instead of -ENODEV?

> +module_platform_driver(imx_mipi_dsi_driver);
> +
> +MODULE_DESCRIPTION("i.MX6 MIPI DSI host controller driver");
> +MODULE_AUTHOR("Liu Ying <Ying.Liu@freescale.com>");

The freescale.com domain is no longer functional.

Ying Liu's NXP address is victor.liu@nxp.com. You could probably add
your entry as well.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
