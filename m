Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A90C9546B6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 12:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1AD10E17C;
	Fri, 16 Aug 2024 10:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qKpYEJo5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C9910E5EB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 10:23:55 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-428e0d184b4so12350745e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 03:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723803834; x=1724408634;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ac6PkEI7A1RP1coeC4Yj5cZXMittHI8EAxgX8fzSWd0=;
 b=qKpYEJo5Pp3cS71RK5m9KxO+Dl3kuDfUOc15IXPjZ9RVGAd1kIRTZySYqPs1NOaeFg
 ffrL2AMP/Uu7xgyJAiJ3IhZzdVEjcLoCvmuc9f3jft1hq5QWvUPddXu+tx7MXgqd1/xM
 1Tlr9Kuq4maSnAWM9+lg9NFL1G46qSskvjegR/emvbmJtT921zJKWGc1Sm+F/+L4tlrk
 jm+orwaqnXdDEZMy/xmrGZhwjSm/qpkGBpgO+azwn6eu43RPOguWeHeLXJKHaaxUW+2z
 cq74cZSAJPxPvVbYgqLyaGN0MElbg85OL/npN7isXpEHV5SRG7U4aOlmq975lKaX4W0s
 RmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723803834; x=1724408634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ac6PkEI7A1RP1coeC4Yj5cZXMittHI8EAxgX8fzSWd0=;
 b=w0rYii1IqkSNwPK0X68vKvDn2rEozw5+rvgDhtskiJD9TuvquvGhFcrdT0l0vKaZ7w
 QD/5w/PxzIxWIbxBb8x9+vXS52o0GOa3Y/KR8MAlaaakbZZQ2Ek3L9nt3ETCLW7JgsFM
 EI2vBflBgpX9JHniFYKWdJeCkryGWIhZjeztiXJdcLUl8+WHIH1xPGKhHgf3a108xRJd
 ZT8/DHGYDdqzr2+18BIENSpwwFMsM+6Nc4b+kxxJHI1ZyIYJEjMQSyqUY4tOHvLkPMo1
 thgUAr86ysIcI3k3gNihfayHaHNd6cq08oG5ZNlPnUWX96xy9WMKX6SH8xPZhTroBWOz
 gtzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWJcw4Xf7p2FE8nndImwd4Bpa/2YXWyG9v63sw35NTunx+Yii8rV1nfNuIaJABWBAPujhWuLPmuyCofrpvoPn2aEP5E+Ouz0qYFIdBeQVV
X-Gm-Message-State: AOJu0YyO3DmgxnQ6+JojI4G63XUrwfkqYZVzHcZJwAG4WhW2majJejGV
 F2ElKnCsk3HuA54HZsB5RsrG3Y24cq8e4DMd0A/jDNBm7afEqX5odEpxRbi0/ng=
X-Google-Smtp-Source: AGHT+IFSFTTtUJgs7F4KncBO3eji2OOP3lzw9DBVuEXpO1uGSfoBvSNrq4KRwIjzHiQxA2UzVx4jMg==
X-Received: by 2002:a05:600c:4e88:b0:425:649b:60e8 with SMTP id
 5b1f17b1804b1-429ed7c1218mr16732045e9.18.1723803833264; 
 Fri, 16 Aug 2024 03:23:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:aff3:cc35:cd8f:c520])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded18630sm72650125e9.1.2024.08.16.03.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 03:23:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Ekansh Gupta <quic_ekangupt@quicinc.com>
Subject: [PATCH 2/2] arm64: dts: qcom: sa8775p: fix the fastrpc label
Date: Fri, 16 Aug 2024 12:23:45 +0200
Message-ID: <20240816102345.16481-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816102345.16481-1-brgl@bgdev.pl>
References: <20240816102345.16481-1-brgl@bgdev.pl>
MIME-Version: 1.0
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The fastrpc driver uses the label to determine the domain ID and create
the device nodes. It should be "cdsp1" as this is the engine we use here.

Fixes: df54dcb34ff2 ("arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes")
Reported-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 801e8a92359d..5b9b68c634f5 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4046,7 +4046,7 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
-					label = "cdsp";
+					label = "cdsp1";
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-- 
2.43.0

