Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA0917DA73
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 09:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707CE6E34B;
	Mon,  9 Mar 2020 08:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB4C6E27F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 07:49:39 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z65so4950596ede.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 00:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tGvHVL+X8ENX8ZlFkJ4aTUiRtrm/fcY3/mfmmVzMIbM=;
 b=Jq7oN9z+T3yHMHlBWmtg/oPw3NMpUuf+HHE/AEB6ve19jbPtvt5AEZ3WDPvkS0xNRJ
 TxPi+1T+CforxzUbaOpceljyeEB1qThb+1+7Yv5FETpD/6MLNoUiLzGPTdjvfyt2N7yA
 204omxFy4IXZZH2/4KFT1X0Gv3NC+THh/SuOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tGvHVL+X8ENX8ZlFkJ4aTUiRtrm/fcY3/mfmmVzMIbM=;
 b=gMflJBeYv4NKmGZllejIvlO/bpKuKvBdAUhI+480ew7plxa37vff/H1906tnkNpNBd
 QbNnwuTj/i+noPPwe5Naijg6BbAWJjIG94fm6NR7yZHNRWzxCisffg1OY25JUeiv6xRL
 +j/LOOi5349F3h9wPq04wveUylMC6Ht9/aeLtK1PUw58iwHT0z+z5xfIy9mpMPRmS3O4
 vfsrDuS9GNk3upZKG5RVQIblkgrqiKz4iHOc7Fp1R94vnM//aSFlLypS5OaDQuc1XZYB
 dP7epqgw+ER4iSwB6l7YLNj7G/sC6+iPJ/Ujjpy627hX7VMED1l+8Ntv+Z1qyT88cFFy
 G4jQ==
X-Gm-Message-State: ANhLgQ1cjHXmm4qS5h3nGMije2az2LcWIJYoWG1QT5Z6N0MYEwamBCue
 6lDn8BV8e1P2OLjU26irHj0k++6Ygs4eYzDTF9grFQ==
X-Google-Smtp-Source: ADFU+vunIbfF7cF+cg/5HQCVkQIHDO6ScLBXRU/yTPevJyjOidbI5t2wOJVf0V1aAGYL0Qe0suR5rmu4QLvHq6Gpl3U=
X-Received: by 2002:a17:907:2154:: with SMTP id
 rk20mr13348435ejb.322.1583740177890; 
 Mon, 09 Mar 2020 00:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <1583735298-19266-1-git-send-email-allen.chen@ite.com.tw>
 <1583735298-19266-4-git-send-email-allen.chen@ite.com.tw>
In-Reply-To: <1583735298-19266-4-git-send-email-allen.chen@ite.com.tw>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Mon, 9 Mar 2020 15:49:01 +0800
Message-ID: <CANdKZ0cB-nWR75RcpAet+UDj6t+QXi1rjF3jMiM6_+awhZzAOg@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] drm/bridge: add it6505 driver
To: allen <allen.chen@ite.com.tw>
X-Mailman-Approved-At: Mon, 09 Mar 2020 08:13:37 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Jitao Shi <jitao.shi@mediatek.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Yilun Lin <yllin@google.com>, David Airlie <airlied@linux.ie>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi allen,

On Mon, Mar 9, 2020 at 2:32 PM allen <allen.chen@ite.com.tw> wrote:
>
> From: Allen Chen <allen.chen@ite.com.tw>
>
> This adds support for the iTE IT6505.
> This device can convert DPI signal to DP output.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Yilun Lin <yllin@google.com>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> ---
>  drivers/gpu/drm/bridge/Kconfig      |   11 +-
>  drivers/gpu/drm/bridge/Makefile     |    6 +-
>  drivers/gpu/drm/bridge/ite-it6505.c | 3022 +++++++++++++++++++++++++++++++++++
>  3 files changed, 3035 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index aaed234..ff81681 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -38,8 +38,15 @@ config DRM_DISPLAY_CONNECTOR
>           on ARM-based platforms. Saying Y here when this driver is not needed
>           will not cause any issue.
>
> -config DRM_LVDS_CODEC
> -       tristate "Transparent LVDS encoders and decoders support"
> +config DRM_ITE_IT6505
> +       tristate "ITE IT6505 DP bridge"
> +       depends on OF
> +       select DRM_KMS_HELPER
> +       help
> +         ITE IT6505 DP bridge chip driver.
> +
> +config DRM_LVDS_ENCODER
> +       tristate "Transparent parallel to LVDS encoder support"
>         depends on OF
>         select DRM_KMS_HELPER
>         select DRM_PANEL_BRIDGE
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 6fb062b..e6c80ab 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,7 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> -obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
> -obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
> +obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
> +obj-$(CONFIG_DRM_GENERIC_GPIO_MUX) += generic-gpio-mux.o
> +obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
> +obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
>  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
>  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
>  obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o

There are unrelated changes to it6505 in the Makefile and Kconfig,
please remove them.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
