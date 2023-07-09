Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6717B74C0E8
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 06:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C3610E1C1;
	Sun,  9 Jul 2023 04:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040BF10E1B5
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 04:19:33 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fb77f21c63so5063858e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jul 2023 21:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688876371; x=1691468371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yGG+JMcZKC2KBKr2b78IW5ceoyyRwJ46V91LM7VfQHU=;
 b=wvisemIqP7za0ZyJCs2ZmSXvrug0NlXlxvgg89MYzXFbpxzq84+Z4xC6vRhqw1kyl6
 yWfKDkpY0I+dM3cptMuA9ET7hFN1rp2f2vQf+zIioTNQDLO4KDq0glBRt1KsUPGOf531
 enUS4t+HYwUfPYHFkM10ZWInuGr/mTQyulm9mKizKwI5wAmHF2TuAVKJRL3QStnxCwBw
 qdYHHK8B6/3mK9EphPVTiaY4abPNuhHacyNhddUGjzOMLcj2JKuGjM14RQ46RVwO6j3y
 reovfGbvM3rmjjlB4pVFCTAubVRpVbiJiVHz5o+bpkFylhADfb7AcLkzQPK9NFs/hy9V
 nRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688876371; x=1691468371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yGG+JMcZKC2KBKr2b78IW5ceoyyRwJ46V91LM7VfQHU=;
 b=aUkpzrhabRqLyAgmJfzwVQqc9xpY4E2wYmG9Dk9sd8Wd2BLis12b1Vt+E7MjWiSI7m
 Q77mqnYj8qFb37wNuicU+Brm17qiqXf3dnKMQei4u6w25cf04dhmiagp2tLHO2Cbwy+n
 F0Ms5zUwWwbB+D6OlEt5fH+HoTc6+v6s8Dyo0JPQ9B/eO/jKOdc2VX1r4WYFxdh4F2Cw
 UTDZFpxSQEQ9XzdpAHnhLSURPq1Hr4BZK3OLMGDNVfZ0Enu03O5ekwCTrTBtyRCHDRND
 YpnNGEOZRWL9KzcwnyWHpzpF6Xxra8C9We2AdT+TcRQrAa8RKHSWUmBP/Q9bYAuBbenw
 VSkw==
X-Gm-Message-State: ABy/qLato1lna2L9oKV5GhxZLANqhHRzFVbE88ZyGDJixG/kvn127spH
 l2ASBx+jKn40kttPjG0p+6eidg==
X-Google-Smtp-Source: APBJJlE6wrvTHb8QSckdbTF1Klp2Gds2woQb5/MRMIXTBG9WuFTpav+rYAy9iN3mheZax4mltaueSw==
X-Received: by 2002:a05:6512:39c3:b0:4fb:896d:bd70 with SMTP id
 k3-20020a05651239c300b004fb896dbd70mr8357141lfu.46.1688876371382; 
 Sat, 08 Jul 2023 21:19:31 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 r11-20020a19ac4b000000b004fb8603f6e0sm1205851lfc.12.2023.07.08.21.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jul 2023 21:19:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 5/5] arm64: dts: qcom: qrb5165-rb5: enable DP altmode
Date: Sun,  9 Jul 2023 07:19:26 +0300
Message-Id: <20230709041926.4052245-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add displayport altmode declaration to the Type-C controller node to
enable DP altmode negotiation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 210c60025c32..5f289bf640f1 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1418,6 +1418,13 @@ PDO_FIXED_DUAL_ROLE |
 					 PDO_FIXED_USB_COMM |
 					 PDO_FIXED_DATA_SWAP)>;
 
+		altmodes {
+			displayport {
+				svid = <0xff01>;
+				vdo = <0x00001c46>;
+			};
+		};
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.39.2

