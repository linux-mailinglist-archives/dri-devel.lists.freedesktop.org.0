Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECE6B4159B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 08:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E45110E0DD;
	Wed,  3 Sep 2025 06:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ngkjGGEB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FBD10E0DD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 06:52:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 444B96023A;
 Wed,  3 Sep 2025 06:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6186FC4CEF1;
 Wed,  3 Sep 2025 06:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756882369;
 bh=IYNlG9+JhhkXMMn/spCMJaSa/ZNno14iioZpwVryrHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ngkjGGEBsvtl/+LflwQESb6V1LZN+yJkVlNCDOTVA0GyzYzoQdyyKlhW8RgWGlkms
 ciVLeWXY42d3AwISvz0lr7PIEygFWz2Mi+0P/LTQyw8BSaJJBOq4T8PXBtZ7m7EJ6i
 X5uYTHgj6d+D10i035hepD6QbzyanjMnwfkP5sBwDRKKHeNABP7RG37mCFqZSpjJht
 4NNXLC2BjXMwqCCPHfVGC82tuTtrxIEeM4UFb5twkKtcTKhaxoELUbSS2PNw7cXGqZ
 DqsJa9IWJlfr6h0F9ZkLalKpYjx/uUSNvSD9aEi+aoxsakQq45IAUfGI1acCMjkqgW
 qVF2x/PJ7YdNw==
Date: Wed, 3 Sep 2025 08:52:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: display: bridge: simple: document
 the Realtek RTD2171 DP-to-HDMI bridge
Message-ID: <20250903-beneficial-logical-silkworm-14f4d2@kuoka>
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
 <20250902-topic-x1e80100-hdmi-v2-1-f4ccf0ef79ab@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902-topic-x1e80100-hdmi-v2-1-f4ccf0ef79ab@linaro.org>
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

On Tue, Sep 02, 2025 at 11:00:28AM +0200, Neil Armstrong wrote:
> The Realtek RTD2171 chipset is a transparent DisplayPort 1.4 to
> HDMI 2.0 bridge.
> 
> This chipset is usually found in USB-C To HDMI Adapters and Docks,
> or laptops to provide HDMI display output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

