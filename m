Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C199D9281
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 08:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B4B10E7B7;
	Tue, 26 Nov 2024 07:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Dx2pqvaB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDED10E7B7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 07:35:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4A0F9A41A97;
 Tue, 26 Nov 2024 07:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E174C4CECF;
 Tue, 26 Nov 2024 07:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732606499;
 bh=wUr44H5GS4NSD1WGUipzyvMEA/+0GcABo061UQc51VI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dx2pqvaBxI74ZFOc90YuhwDywjiNY+QgR31y0ajpHqeZ84sQvfl8UAgZNTRiXhaQZ
 BVhmswCqeDIYC9NodHrBlfkrqw7ZL7S/qpCaEh+jgFKMUP1byM4kniCcngOskoCMvp
 eVCgXkJwIhRrInN7v3DgRwsc37J1jaqHnPpexz9dPfMEYeSE1qzk3KE1P6HvPfi8zV
 RlbqyLIwzWKWCys6jWS2UK5uFFpXx0T9LZuTbF/fFXl1O5njZtJvKPANQ+N5/FebZL
 OJBD4d7axZgkAm/AaNssiJD56OZXRxnE47rBx1hPdJeIE1MlcEHB+/Hj670EOad/8W
 HTK0seABv6CQw==
Date: Tue, 26 Nov 2024 08:34:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kalle Valo <kvalo@kernel.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Add HP Omnibook X 14
Message-ID: <dgilzuguxfvzqndp4rjm4hlhejgporfvollk4sqwquk34g4pka@dinzg2kfk4x2>
References: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
 <20241124-hp-omnibook-x14-v1-1-e4262f0254fa@oldschoolsolutions.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241124-hp-omnibook-x14-v1-1-e4262f0254fa@oldschoolsolutions.biz>
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

On Sun, Nov 24, 2024 at 02:20:15PM +0100, Jens Glathe wrote:
> Add compatible values for the HP Omnibook X Laptop 14-fe0750ng,
> using "hp,omnibook-x14"
> 
> The laptop is based on the Snapdragon X Elite (x1e80100) SoC.
> 
> PDF link: https://www8.hp.com/h20195/V2/GetPDF.aspx/c08989140
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

