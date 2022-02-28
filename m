Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C624C65E8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 10:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCEB10E296;
	Mon, 28 Feb 2022 09:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D3D10E296
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 09:44:50 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id n185so9872122qke.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 01:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m42zzm1A/Uk2fszLihUQmA9ldzbK7Fh11mCVbXlmHhY=;
 b=BMCIAstrNglzIjoRryZMWNKrJVUS0F+gf66wVvxk/abudp6l7oRiEV9Go/1Tp2Z5UK
 FZvgp6oJzdOMnvnNWiv4GiobNN5JtxdixkM5HIopzJq4MHyDAUH09wL2Zq8MKRGOY2G3
 OGFe9OjLjCkrljdSbJTS3hg5mDsKWg+CbHqK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m42zzm1A/Uk2fszLihUQmA9ldzbK7Fh11mCVbXlmHhY=;
 b=7lXNc8JqbBW0v8OUgl/TU4K2KXy0336u/SQKLdPwyx2oO+I6BCjtu5SP2O/7c/9J90
 n+VDHW9CiAuNrAtCi6n57c6ooMG36grbRlXtmsw9KwvxzWjeKo7kAGmXLgbIbgYhGCBD
 08zvCBZmYxcd6KU7Jpa7Cx/sIpCcj5UokAay3KbrUV+1Rvi4NORKfhx5tcbFu5ZsNvWY
 qgqjxXN19kkFzboG2dBA3CeR1jnVqpwf72Jwx+s0WIKB+Rm25QPT5MGlsmZvwYiZvIGX
 riJGp8yMDD9f9iIgW7CdrULLKD1DGVLrVz3kjyzrxIrPXnk0B+6ZZjWLpf/tnoBmKcj6
 4E+g==
X-Gm-Message-State: AOAM5323D9jOKlLRqC3G19DHfniUuy5N9dNYAXXGR5lrQ84b9V612gaV
 XsJUQigDKnJeTAHIsSfMoyRDOlcnG9G7uMtnIyZf6uZmCtSApQ==
X-Google-Smtp-Source: ABdhPJymavUC7phOQxSAzrnChJkit6X3vSfBJh8VvkrOfuYY39VSMX5xk/p7XeOex4FlAIcndtpkSyXMeeVQYGpGKKo=
X-Received: by 2002:a37:f903:0:b0:648:ca74:b7dc with SMTP id
 l3-20020a37f903000000b00648ca74b7dcmr10471405qkj.666.1646041489765; Mon, 28
 Feb 2022 01:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20211208013337.13806-1-tommy_huang@aspeedtech.com>
 <20211208013337.13806-5-tommy_huang@aspeedtech.com>
In-Reply-To: <20211208013337.13806-5-tommy_huang@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Feb 2022 09:44:37 +0000
Message-ID: <CACPK8XfJH=h_0f2Wp5akLWtdJwd=bmGdhrqJY8qrK9RX=4NtVQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm/aspeed: Add AST2600 chip support
To: Tommy Haung <tommy_huang@aspeedtech.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, BMC-SW <BMC-SW@aspeedtech.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 8 Dec 2021 at 01:34, Tommy Haung <tommy_huang@aspeedtech.com> wrote:
>
> From: tommy-huang <tommy_huang@aspeedtech.com>
>
> Add AST2600 chip support and setting.
>
> Signed-off-by: tommy-huang <tommy_huang@aspeedtech.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index d4b56b3c7597..d10246b1d1c2 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -82,9 +82,18 @@ static const struct aspeed_gfx_config ast2500_config = {
>         .scan_line_max = 128,
>  };
>
> +static const struct aspeed_gfx_config ast2600_config = {
> +       .dac_reg = 0xc0,
> +       .int_clear_reg = 0x68,
> +       .vga_scratch_reg = 0x50,
> +       .throd_val = CRT_THROD_LOW(0x50) | CRT_THROD_HIGH(0x70),
> +       .scan_line_max = 128,
> +};
> +
>  static const struct of_device_id aspeed_gfx_match[] = {
>         { .compatible = "aspeed,ast2400-gfx", .data = &ast2400_config },
>         { .compatible = "aspeed,ast2500-gfx", .data = &ast2500_config },
> +       { .compatible = "aspeed,ast2600-gfx", .data = &ast2600_config },
>         { },
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_gfx_match);
> --
> 2.17.1
>
