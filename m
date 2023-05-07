Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB626F9B19
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 21:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EF610E2C6;
	Sun,  7 May 2023 19:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AE810E2C0
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 19:07:40 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ac82c08542so36492161fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 12:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683486458; x=1686078458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7f2qMuaQsA4zz+ElXNpZm961GY4Y2a7Auy+y4P4Ssds=;
 b=WntRM6+Jusb/Evmn5zkoZJH9smaCe14lvWdAQ147xzmYVzNhXXVr3gScQIS6C9+peF
 5v9YsI+nOpMOuWZ62z9X0TiMEYskYtNga+bYZZZzpw7GjdVkF1hjEa39dsQ+DzjwcPQj
 uw02plmp4Egh+vni7YET2nSrPwWvr7UuEgiKZt1i1kLOSkJbNYjJ7b81eMkc4L2S9Ho1
 Xg2nyaFMCGWQYhwmcrxNJ4IH+Yd0FnwRhB9pmmuBtLxpXhBgEsGM9NYxPpyMHq4YN4Vh
 zDGiOI4yeQVsG/46mkf52yL5owdZg83vv71zHynLTC9orm/Z4Kv195Ty6Y70TYNjLlk5
 FBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683486458; x=1686078458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7f2qMuaQsA4zz+ElXNpZm961GY4Y2a7Auy+y4P4Ssds=;
 b=Ve7HKa4REYZ2IOtGFsCqHMaxFGN8eh7NZmDqi6OSlzDllHH02XimxYZiQSGUYjoZ2x
 YZbyctPJJlwx8jBiYd0S6NUYUH0B/Wey3ECK2ef2k9Hr1WqAkhkZ3f7eMS8IpyZsBJY9
 givU+/fBwP6+Z/R8a9PudRv59Z5PjSgiE9zrz5ODJXQE0HJd5JrPnvYNxoQhowo/bFsC
 K0dC7t7/KAqAuTEbAoQbll7M1okdd1xn2zIuK/a5bYoI5igBj4xofC1t7ja+S7hb+wu8
 Ng4+rrJBIG0KSuQ0XzXteynAGnYENqdpuyuO+omUZ7qun+CIAqQPZ8rmkzbHZ9dLFTjQ
 bT8g==
X-Gm-Message-State: AC+VfDw8Qw1+6x3jqf7a9TWem3mCbwEov8Zc2hP4CWVfJMbJEa3HQYW/
 0PpNid/qlGd8VnPNS/P3ITGtpQ==
X-Google-Smtp-Source: ACHHUZ6weIEbg8nFqO2GvrIbuf/UKWjpC0B3GIkmIEVbX1cI2k12pekwT0owkZDWPuQCp8Z7EUOvbw==
X-Received: by 2002:a05:6512:21a6:b0:4ed:d2be:37e5 with SMTP id
 c6-20020a05651221a600b004edd2be37e5mr2015448lft.7.1683486458765; 
 Sun, 07 May 2023 12:07:38 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 f8-20020a19ae08000000b004f14ecc03f1sm755841lfc.100.2023.05.07.12.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 12:07:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/4] ARM: dts: qcom: apq8074-dragonboard: Set DMA as remotely
 controlled
Date: Sun,  7 May 2023 22:07:33 +0300
Message-Id: <20230507190735.2333145-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
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

Add the qcom,controlled-remotely property for the blsp2_bam
controller node. This board requires this, otherwise the board stalls
during the boot for some reason (most probably because TZ mishandles the
protection error and keeps on looping somewhere inside).

Fixes: 62bc81792223 dts: msm8974: Add blsp2_bam dma node
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8074-dragonboard.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
index 1345df7cbd00..6b047c679370 100644
--- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
@@ -23,6 +23,10 @@ &blsp1_uart2 {
 	status = "okay";
 };
 
+&blsp2_dma {
+	qcom,controlled-remotely;
+};
+
 &blsp2_i2c5 {
 	status = "okay";
 	clock-frequency = <200000>;
-- 
2.39.2

