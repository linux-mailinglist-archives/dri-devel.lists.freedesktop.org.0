Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37989FC711
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 01:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1A110E632;
	Thu, 26 Dec 2024 00:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="VCFXHsDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184BE10E632
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 00:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zkiSR+pP4PDYxWoTcL6hKQD8NN/shidqmyYevfYxc1M=; b=VCFXHsDcbePWO7rfKx50ziB8iB
 Xc22JHTQEz7cWSjudPd+LjHRNVIq+q0EOi9K5o+O7AtCB5gJgtX9gtuz97RSBKha54bXUccx4UJ2p
 tLBLjVIZBT9rSCpN/cDvqxpdSZ6Uajzb6FdBPA0KgVlwrNmUmst3EPmb4tW7WP8qGZW2G4gw41c7G
 NizbtmK4ODHD/JWj32cVTM3/DxODIP7T6r/mVmHg88YOC2CLwSoqL1Ma6fV6cADS7gg8DAFYXOHZ8
 62mAN1hyIyFEO3avmpi4/eici+pBB3jfepYrtU0aGf0iOrq2Uz5GFHluVzaywh93iXiS8nMIJy6wn
 JJFhlKUg==;
Received: from i53875a54.versanet.de ([83.135.90.84] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tQc0G-0004a5-GZ; Thu, 26 Dec 2024 01:45:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 06/17] dt-bindings: gpu: Add rockchip,
 rk3562-mali compatible
Date: Thu, 26 Dec 2024 01:45:27 +0100
Message-ID: <2487077.iZASKD2KPV@phil>
In-Reply-To: <20241224094920.3821861-7-kever.yang@rock-chips.com>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-7-kever.yang@rock-chips.com>
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

Am Dienstag, 24. Dezember 2024, 10:49:09 CET schrieb Kever Yang:
> rk3562 has 1 ARM Mali-G52 GPU,.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 735c7f06c24e..b0d4806614aa 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -25,6 +25,7 @@ properties:
>                - renesas,r9a07g044-mali
>                - renesas,r9a07g054-mali
>                - rockchip,px30-mali
> +              - rockchip,rk3562-mali
>                - rockchip,rk3568-mali
>                - rockchip,rk3576-mali
>            - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> @@ -60,7 +61,7 @@ properties:
>  
>    clocks:
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 4

The commit message only says something about the rk3562.
As it looks like you need another clock, the commit message should
definitly explain that.

Heiko


