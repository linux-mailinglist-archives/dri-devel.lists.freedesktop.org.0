Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5707A93EC15
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 05:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1895B10E2DF;
	Mon, 29 Jul 2024 03:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ds3zqQjK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A891310E2DF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 03:59:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C01DC61416;
 Mon, 29 Jul 2024 03:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF64C4AF17;
 Mon, 29 Jul 2024 03:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722225549;
 bh=QsVvXcCHZNxRL5RZ+daszDVZggo7dXOXTjWKQdt6jS8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ds3zqQjKqBKvrRLcqOQAe2iquzCNVOs+0nThdoYtAy4k6LWNOKLD9eAHWjqdxyxLu
 c74LY8FmWMn02L2HoLIZ0qke4JmViAZfraKZAvIGwllLtoC2JPKQJpdBdlJDef3YvV
 b3DxAnc5GxNgwRHFEcwTfURNax9FtB3V8RCg3P/vqiv+9fIYHOEpuyv2mI1OXTZrxl
 dDp8WcguJ/4/swTodSAAzmPFAVccxfOVMI0ayJ4kl11+pf2BGRIXIsOOfHvmG9M9OG
 n+/xDCffsMrVs8tpjVLw8YBSy6aU+MNPciqTh8z89Tby2gQn3SzNgLujJVHxn+VdgY
 KUlrX/VUDhlKw==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>
Subject: Re: (subset) [PATCH v2 0/4] drm/panel: atna33xc20: Fix the Samsung
 ATNA45AF01 panel
Date: Sun, 28 Jul 2024 22:58:34 -0500
Message-ID: <172222551304.175430.2591366335166834304.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 15 Jul 2024 14:15:36 +0200, Stephan Gerhold wrote:
> The backlight of the Samsung ATNA45AF01 panel used in the Qualcomm X1E80100
> CRD does not work correctly with the current display panel configuration
> and drivers: It works after boot, but once the display gets disabled it is
> not possible to get it back on. It turns out that the ATNA45AF01 panel
> needs exactly the same non-standard power sequence as implemented for
> ATNA33XC20 in the panel-samsung-atna33xc20 driver.
> 
> [...]

Applied, thanks!

[4/4] arm64: defconfig: Add CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20
      commit: 10f98bb9d98137b544b00abb4f9df45e9be7878d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
