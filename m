Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE5EA81EC8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 09:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9873910E7FA;
	Wed,  9 Apr 2025 07:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TM438mU+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F6510E7F7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 07:56:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 608E668438;
 Wed,  9 Apr 2025 07:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E59C4CEE3;
 Wed,  9 Apr 2025 07:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744185384;
 bh=fRl/2fJxhLh5pxmQTXfimVdKHqwMdfvWC15mYy1K/zA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TM438mU+mHRflGQqwTTahRAHpXKkGwkrdYen5nCjr0gBDC1BbLQoOxi/XLpeEU3uS
 zcSF7rV4CJoShkNjPIiGrPOsUmn6erPVUPsaI4roWH/E2vKX8n4EHMFXImdkbe8OhM
 iyk9xnFwFTxxFxOEpySepA39twljtSjOFImZ1OJ57w2+EqGBTs86mrD4TdCGkN2sh8
 wIiTYliaoUpwuhwBKVvAgXfMmxEsNbsxQ4juItxhJFl5Ei7t8imP9x1aDe+KYtLtBK
 BumaHD9KrXChC7LHadVfu+4ZiGfm671eesJRp6kU6DxL9/dH394C7dAryY2gcWQoXv
 zzwL8VTVomCZQ==
Date: Wed, 9 Apr 2025 09:56:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: rockchip,vop: Drop assigned-clocks
Message-ID: <20250409-ludicrous-blazing-chimpanzee-e5dba5@shite>
References: <20250404214030.401629-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404214030.401629-1-robh@kernel.org>
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

On Fri, Apr 04, 2025 at 04:40:29PM GMT, Rob Herring (Arm) wrote:
> assigned-clock properties are implicitly allowed in any node with
> 'clocks' and don't have to be specified. The max here also appears to be
> wrong as there's a case with 4 entries.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip-vop.yaml  | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

