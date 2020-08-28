Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339DD256655
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 11:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BC26EB91;
	Sat, 29 Aug 2020 09:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBD46E49D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 12:35:30 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id ay8so1005623edb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Aug 2020 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S/FP18GdeEsQIBGpdNuuhDRuibofRXoQRIPNbtt9sRY=;
 b=a+SjzJaGpDMjLFI4m4bUgdWkdHu18yc5GfL5js7fSMQWXUvk4ovchSKQSVfpyvzLD6
 0SDxmQiEQ9kVtcsheYiiZKY6taD2YxkRjcEwE0AphlIZMLmLMa/dk64bO48yD3Pc/zLS
 Ss1WsveDreGhDW30tSFaUkOqsbU4VuzFLHdwX42U3ocu1otvjbqeOMBlwoZaSPR6+hai
 38Thk1IWapK/hXEe6Q9jxSy2N64dY/APbPpDVmxqLutGChiOE8FH4nBulsyrjEQLVfn1
 RoOhwfAg8eYJFfl3uVBo9LAlxZA7aBpDF259nwmGTpbKG51bo0NOUusd5EemqUPMXqtl
 nvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S/FP18GdeEsQIBGpdNuuhDRuibofRXoQRIPNbtt9sRY=;
 b=OVP3DEfy77R7yFO9HbwgUhZncbZt3qvqMLUPdrR2JUZyaXPz9CbY4CibjfncHehhCa
 +BZH5Ha/Fj2N7/Hh2KwYL+qJADmdDlSp9MZTtIop6pe5CKdxUA+yl2L9qaLMhoxLTtBO
 NwmQTeizsJj/xVjKZy7TbdXDN7dvdbrBcaa1obD4fekcIf0WZd+e5OuOT95v8+7lTLUq
 GrtA8tso2ucMyBKu9jK8/OXsmbtJxlUpvE/uBndcOElzqwyuXaQbTb6oYznZ7pHmxmLn
 EGmoH8A8tmh8Y3JtNZxonn8phfZ0NIyCmFB3o6ye2NORCKjIp2mbPgqvVg+S2QXiK7Oi
 ZLcg==
X-Gm-Message-State: AOAM530UVR8AVVZFOGCyPaygPAl30gLKjGT9QWNniHCxV2SwRiQrtAV+
 dh2Nh0NKfWOBijS7M1+YCzU=
X-Google-Smtp-Source: ABdhPJy6QQInAfaYYn6sA/5SFfqm16o4ELO1cDSV915jWO7sE29ZtFz1Iutso4lgZ0ROGcfIMaDSpQ==
X-Received: by 2002:a05:6402:2285:: with SMTP id
 cw5mr1614748edb.242.1598618128648; 
 Fri, 28 Aug 2020 05:35:28 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net.
 [89.212.178.211])
 by smtp.gmail.com with ESMTPSA id l23sm760431eje.46.2020.08.28.05.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 05:35:27 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@googlegroups.com
Subject: Re: [linux-sunxi] [PATCH] drm/sun4i: Fix dsi dcs long write function
Date: Fri, 28 Aug 2020 14:35:26 +0200
Message-ID: <1872601.C7yQfbK89F@jernej-laptop>
In-Reply-To: <20200828112444.916455-1-megous@megous.com>
References: <20200828112444.916455-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 29 Aug 2020 09:21:18 +0000
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
Cc: megous@megous.com, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 28. avgust 2020 ob 13:24:44 CEST je Ondrej Jirman napisal(a):
> It's writing too much data. regmap_bulk_write expects number of
> register sized chunks to write, not a byte sized length of the
> bounce buffer. Bounce buffer needs to be padded too, so that
> regmap_bulk_write will not read past the end of the buffer.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Fixes: 133add5b5ad4 ("drm/sun4i: Add Allwinner A31 MIPI-DSI controller 
support")

should be added. Fix will be then automatically picked into stable releases.

Small nit below.

> ---
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c index 7f13f4d715bf..840fad1b68dd
> 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -889,7 +889,7 @@ static int sun6i_dsi_dcs_write_long(struct sun6i_dsi
> *dsi, regmap_write(dsi->regs, SUN6I_DSI_CMD_TX_REG(0),
>  		     sun6i_dsi_dcs_build_pkt_hdr(dsi, msg));
> 
> -	bounce = kzalloc(msg->tx_len + sizeof(crc), GFP_KERNEL);
> +	bounce = kzalloc(msg->tx_len + sizeof(crc) + 3, GFP_KERNEL);

It would be nicer to use ALIGN() macro, but I'm fine either way.

Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej

>  	if (!bounce)
>  		return -ENOMEM;
> 
> @@ -900,7 +900,7 @@ static int sun6i_dsi_dcs_write_long(struct sun6i_dsi
> *dsi, memcpy((u8 *)bounce + msg->tx_len, &crc, sizeof(crc));
>  	len += sizeof(crc);
> 
> -	regmap_bulk_write(dsi->regs, SUN6I_DSI_CMD_TX_REG(1), bounce, 
len);
> +	regmap_bulk_write(dsi->regs, SUN6I_DSI_CMD_TX_REG(1), bounce,
> DIV_ROUND_UP(len, 4)); regmap_write(dsi->regs, SUN6I_DSI_CMD_CTL_REG, len +
> 4 - 1);
>  	kfree(bounce);




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
