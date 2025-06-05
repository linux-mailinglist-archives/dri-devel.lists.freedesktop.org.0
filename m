Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5591ACF584
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 19:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D415810E07A;
	Thu,  5 Jun 2025 17:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qHFF65+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D101D10E07A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 17:37:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 69D55A50936;
 Thu,  5 Jun 2025 17:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6593C4CEE7;
 Thu,  5 Jun 2025 17:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749145057;
 bh=DGXtg6qoY7z3kJIDAMutHk74JtJARJ7A/W/J2ijKJvs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qHFF65+4OlBP6DkM4rdY13F9JfYJ+eARJlvge8Gvw+gc9E9XOqRqKfWQHCVWWq6qj
 bvaFKvE8Q/UOhe66ojhsffM5gxl+ZsuIT7DmEwL2Ra/jNKAgyUdIPB+DXKZUBuCHle
 rSa4ERa1M2dmCBYBHkqX+ZYZftz21VaS9PvHW9KXDJjOJJDBfIacCrHGew5nEr2Ycz
 Cz4rUDzpqnMh7N5Cse1mR3GfZ4g0lL1DJZUyOR4wsZj0uNMbe5y8HruI6oq67cRDhN
 wRfUnKgIex1iy6v2A6kcYHW/LXRJtN/MB5Ty4mMJXxaVE+p9HXUsSq63zSt2n5N2XN
 AmvldqKzb4t3w==
Date: Thu, 5 Jun 2025 12:37:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>, linux-usb@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Johan Hovold <johan+linaro@kernel.org>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: qcom: Add Lenovo TB16 support
Message-ID: <174914505261.2908666.16705179553206798329.robh@kernel.org>
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-1-2c1e6018d3f0@oldschoolsolutions.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-tb16-dt-v4-1-2c1e6018d3f0@oldschoolsolutions.biz>
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


On Sat, 24 May 2025 13:48:36 +0200, Jens Glathe wrote:
> Document the x1p-42-100/x1-26-100 variants of the Thinkbook 16 G7 QOY.
> 
> [1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

