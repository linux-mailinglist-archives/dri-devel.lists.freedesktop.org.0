Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE89EA71211
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 09:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1330A10E658;
	Wed, 26 Mar 2025 08:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LhnkrNVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674EC10E0FD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 08:08:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1B1876112F;
 Wed, 26 Mar 2025 08:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9BAC4CEE2;
 Wed, 26 Mar 2025 08:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742976513;
 bh=CDFf2aeXu4QXIiFbZUwZnAMW6FSK+tUT/RdaVv9VNrU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LhnkrNVWq0d5hbhno4LYFKTjshBak3FDQRA4QGpROYbmj8vw1FesRdCLkOUi2pyU6
 X2cClnnG9c6d4ciAS1sb+5Kok8y/vukWa3WiG8YULWwr6fSWl6+2bMsjApcCAv6Yyw
 wj5dFLiIEMsnLPoOPsk6BFeuK3WN6Gl9EywRwdShmk22sWV0szq9slCYUJa0mWtVea
 O4fyd6TOmDVs2ES6ukMrY5PfvvXda5I8u8bbm0jLFHFEIvWe+wNyE8TsA7TvT2x5oY
 2efh++eDThJB4eS9g4bxdEu5yfw95lnVrFDfDPWThuqkzqbMgHzEoAHx/qU1NxOxMa
 hkBWm1877pcZw==
Date: Wed, 26 Mar 2025 09:08:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna40yk20:
 document ATNA40YK20
Message-ID: <20250326-foxhound-of-nonstop-temperance-6f5a67@krzk-bin>
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-1-e9bc7c9d30cc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-1-e9bc7c9d30cc@linaro.org>
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

On Tue, Mar 25, 2025 at 07:21:26PM +0000, Christopher Obbard wrote:
> The Samsung ATNA40YK20 panel is a 14" AMOLED eDP panel. It is
> similar to the ATNA33XC20 except that it is larger and has a
> different resolution.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

