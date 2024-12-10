Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5C89EB439
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 16:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D851E10E3B2;
	Tue, 10 Dec 2024 15:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="bTt9MPRS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA67110E3B2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 15:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=odtBH0LCDjXXAC9EkbBCPzy/Jj9lMmjM6esmzhTWvMc=; b=bTt9MPRSsSxp9+UuhbHN5pkJiQ
 2x/ygyfPuP7/tANxYvUYhUgX/bkSe86zdbbaK+jZEs1zNJ0lgx6qxd+ECV3Gm4eV6n5xooC5CycPp
 KYpaZb8Dqt1CqDA0s26ryw8/0gS4UHUyhUnVI7KrceAm71GN9kCBeZkB1mQap4Dm5cd55JKSY2/+Q
 C50DTqQeNTH/RRfe69p1WzgIpLLTswWfkq3rOPI43XnzdvLfXUTuCWwOTy7N9Q24qyaq9pb1eIWCU
 2ov0n1vTa7dQ7dqc5JzgusiAVIIIeNdK45EcIxXem2c6C3WMTnbJ2rW+NeHchpVxak8PY9eAENja/
 J9Ai0xiQ==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tL1lU-0006rU-7b; Tue, 10 Dec 2024 16:03:08 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v5 13/18] drm/rockchip: vop2: Introduce vop hardware
 version
Date: Tue, 10 Dec 2024 16:03:06 +0100
Message-ID: <8259618.JRmrKFJ9eK@diego>
In-Reply-To: <20241209123330.2781991-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <20241209123330.2781991-1-andyshrk@163.com>
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

Am Montag, 9. Dezember 2024, 13:33:29 CET schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> There is a version number hardcoded in the VOP VERSION_INFO
> register, and the version number increments sequentially based
> on the production order of the SOC.
> 
> So using this version number to distinguish different VOP features
> will simplify the code.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
> Tested-by: Detlev Casanova <detlev.casanova@collabora.com>

> @@ -798,6 +798,7 @@ static void rk3588_vop2_power_domain_enable_all(struct vop2 *vop2)
>  static void vop2_enable(struct vop2 *vop2)
>  {
>  	int ret;
> +	u32 version;
>  
>  	ret = pm_runtime_resume_and_get(vop2->dev);
>  	if (ret < 0) {
> @@ -817,10 +818,19 @@ static void vop2_enable(struct vop2 *vop2)
>  		return;
>  	}
>  
> +	version = vop2_readl(vop2, RK3568_VERSION_INFO);
> +	if (version != vop2->version) {
> +		drm_err(vop2->drm, "Hardware version(0x%08x) mismatch\n", version);
> +		return;
> +	}

style-nit: please add a blank line here.

> +	/*
> +	 * rk3566 share the same vop version with rk3568, so
> +	 * wen need to use soc_id for identification here.
> +	 */
>  	if (vop2->data->soc_id == 3566)
>  		vop2_writel(vop2, RK3568_OTP_WIN_EN, 1);
>  

otherwise, looks good.

Thanks
Heiko


