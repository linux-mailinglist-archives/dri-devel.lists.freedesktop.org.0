Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7342CCD2E57
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 12:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC04F10E147;
	Sat, 20 Dec 2025 11:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CHGxwplu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3A610E114
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 11:39:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 41AFE4449F;
 Sat, 20 Dec 2025 11:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4A3CC19424;
 Sat, 20 Dec 2025 11:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766230739;
 bh=baoiwSlnAzYK4OZcIi1V+6DZsaFv+lrKLgGaT3ABaB4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=CHGxwpluqTQOEWPMpv7HsjpE7+wUQS8dpKjP6+IHhU6dIwUXb6Hloq1bHQrs+75nk
 O0XDmq506kxJ9pR9AOCWJi4/Ms4fOsNKzCuloxzdkKdn4Eza1aT5QH0QO03cN9ksxT
 e1JiPHoXTjrxvm7DmPy5SumHuDCibxhRvCKfdJN6/2jlVH7x2Xa9p++8YpIod43ANJ
 2Og3us0qWDmyvkbMmJ0fpo3AZGT2OKsYnUXSdWeFW7GzrCBGjS3ZSUFpN5l+kEvWwV
 BY5SK3Ji063ea5W4AEKXwqi9HN+xLFSJfFKbFHvE2EaO2lDNi1hAB3KpDzt/ISFDKq
 Yt68MkpTg34Jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D8E6BE668B8;
 Sat, 20 Dec 2025 11:38:59 +0000 (UTC)
From: Maud Spierings via B4 Relay
 <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 20 Dec 2025 12:38:59 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-vivobook-s15: enable
 IRIS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-asus_usbc_dp-v3-3-5e244d420d0f@hotmail.com>
References: <20251220-asus_usbc_dp-v3-0-5e244d420d0f@hotmail.com>
In-Reply-To: <20251220-asus_usbc_dp-v3-0-5e244d420d0f@hotmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766230738; l=1073;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=Ab/UozggKho3gMsARYVcu0mzFrTNbu/B7Hyha3WoJ8Q=;
 b=/MDIgLNDs2Okk38zRBSQWkoFrrWGIo1/MRuJBBgM0CBvSWp0zj/Wvu/y7ySb0LatDX+W9Bg1R
 Y0y27LC7BbeBT3HPHq+4z3nluDhk4CweuHZJf4dv+VNGCKculqbZxJk
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
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
Reply-To: maud_spierings@hotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maud Spierings <maud_spierings@hotmail.com>

Enable IRIS to allow using the hardware-accelerated video codecs. The
firmware is not upstream in linux-firmware yet, so users need to copy it
from Windows to qcom/x1e80100/ASUSTeK/vivobook-s15/qcvss8380.mbn (just like
GPU/ADSP/CDSP firmware).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index d5794189b98b..34467b84a2fa 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -833,6 +833,11 @@ retimer_ss1_con_sbu_out: endpoint {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcvss8380.mbn";
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.52.0


