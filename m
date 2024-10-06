Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E575B991E4C
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 14:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8911910E02D;
	Sun,  6 Oct 2024 12:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CkgqQVVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCC810E02D
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 12:45:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EB64AA40D01;
 Sun,  6 Oct 2024 12:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83023C4CEC5;
 Sun,  6 Oct 2024 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728218747;
 bh=vGSkzTDuOud0fNf4yd92jwXPUpTOLMYireKSsyt1WRU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CkgqQVVLrGoCOcxAHxDSl71HaE8QNmkuiDbjn3jLENdbw8g0lbBD31CSqJAeMso5e
 qN5Ip0vc13CFdOIYBBX0hza3gHFm7d5Lwuy42HUN+VWL05vWYT4slT9+/pFgve6Mzu
 2zvnrWvFjIrpIKd5z/KOjD4sVRcvhsubKKKzqEj1AVVX9C5JGr/QS/xMss1fx/gPB9
 Rl7tju1+NiNxzDi6wxZD3N+h7t+Oy31fNkobYNjA8SuPptgGPyXomuoPOcHkw3X+pD
 QrjJLJulx7jESlbLld4wzVtfDJ9cIE/ak6zBcgrIO0mbPW071AZq/dSR4gKzESYaVN
 YXLt8+mCU1Vhg==
Date: Sun, 6 Oct 2024 14:45:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <avolmat@me.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Patrice Chotard <patrice.chotard@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-utgard: Add ST sti compatible
Message-ID: <t6ueaovdm5gfqmdsedm4aaz7zabsf5lcx3jpintfwyx26uokup@2qhaqycrj2sl>
References: <20241005-sti-gpu-v1-0-9bc11100b54b@me.com>
 <20241005-sti-gpu-v1-1-9bc11100b54b@me.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241005-sti-gpu-v1-1-9bc11100b54b@me.com>
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

On Sat, Oct 05, 2024 at 06:07:59PM +0000, Alain Volmat wrote:
> ST STi SoC family (stih410, stih418) has a Mali400.
> Add a compatible for it.
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> index abd4aa335fbcebafc9164bd4963f9db60f0450c4..97a7ef0fea1a10df0ff485b9eb4468f44c92da39 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
> @@ -33,6 +33,7 @@ properties:
>                - rockchip,rk3188-mali
>                - rockchip,rk3228-mali
>                - samsung,exynos4210-mali
> +              - st,sti-mali

That's quite generic compatible. I would expect here per-soc.

Best regards,
Krzysztof

