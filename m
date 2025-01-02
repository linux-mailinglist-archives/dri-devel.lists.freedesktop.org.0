Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F159FF901
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 12:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721AF10E6CE;
	Thu,  2 Jan 2025 11:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="YIeI3qCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275D910E6CE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 11:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j9BRYqtU1/upqh8/+Oi84LPuS1gHyWF/MWynsZDnmsI=; b=YIeI3qCH5MGj7bJGccxx3mZoYZ
 tyrZ+UeWV1Yz1LAvt0YJLRqpxWMflvnA9fEWguGwPda7GTs4zUt+waTidGWxa1hYWmZnRyWvXbsmG
 ybecqROk8igzdkLkShtoNPGwCnqjcZvIAOD2SMrND5QKmjFCXCxMQSYDXTt1vq5pumbeWbTWN9DjZ
 A91+2EwTPjnT0meDoGRe0Gq6vMIPCoK6axxlSUXYOLtNXpbrQPK0ps029ffIW13hc5lSMUXnb+/6e
 puxeAU7lbZ/kGCjrQLkFgJOEj4T7EbOyD4EsUQ0KZKcbzflN+eJ2s8G5M4PqgTf1OmZgTrumrY6rn
 M5UQx5Kg==;
Received: from i5e860d14.versanet.de ([94.134.13.20] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tTJou-0007jf-8O; Thu, 02 Jan 2025 12:56:56 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: cristian.ciocaltea@collabora.com, krzk+dt@kernel.org, mripard@kernel.org, 
 hjc@rock-chips.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 3/3] drm/rockchip: Add basic RK3576 HDMI output support
Date: Thu, 02 Jan 2025 12:56:55 +0100
Message-ID: <15367137.tv2OnDr8pf@diego>
In-Reply-To: <20241225103741.364597-4-andyshrk@163.com>
References: <20241225103741.364597-1-andyshrk@163.com>
 <20241225103741.364597-4-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, 25. Dezember 2024, 11:37:31 CET schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The HDMI on RK3576 shares the same IP block (PHY and Controller)
> with rk3588.
> However, there are some control bits scattered in different GRF.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> Tested-by: Detlev Casanova <detlev.casanova@collabora.com>

The attribution is strange. Where does the Signed-off from Detlev come
from?

At that position it would mean that he's the sender, but that's obviously
not the case.

I guess it's either just the Tested-by ... or you need an additional
Co-Developed-by if Detlev contributed to this patch.


> ---
> 
>  .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 143 +++++++++++++++++-
>  1 file changed, 141 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index b21e868e7c16..bd9216e45e74 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
[...]
> @@ -287,8 +422,12 @@ static const struct rockchip_hdmi_qp_cfg rk3588_hdmi_cfg = {
>  };
>  
>  static const struct of_device_id dw_hdmi_qp_rockchip_dt_ids[] = {
> -	{ .compatible = "rockchip,rk3588-dw-hdmi-qp",
> -	  .data = &rk3588_hdmi_cfg },
> +	{ .compatible = "rockchip,rk3576-dw-hdmi-qp",
> +	  .data = &rk3576_hdmi_cfg
> +	}, {
> +	  .compatible = "rockchip,rk3588-dw-hdmi-qp",
> +	  .data = &rk3588_hdmi_cfg
> +	},

nit: please keep consistent styling between the listentries. Right now the
rk3576 and changed rk3588 entries use different styles.


Heiko


