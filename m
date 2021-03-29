Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F2034CF92
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 14:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80386E40F;
	Mon, 29 Mar 2021 12:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF356E40B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 12:01:03 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id o10so17980850lfb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 05:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TnkWF/fJb3+MN0k+LniOlBuYB58LfW58mHqJqX+URIE=;
 b=YWvnaqdDXdIvbYpFm/slhDkvN3LNK4FN0Q/Aj1+TPdF1Z+zz0FJSdlGM17Z1UoaQ0i
 e4825ouP+bSWh86Lc7qeL5qi1kd5J8p/H9sgDVqIizNxJYX/GVfpylSUTj05LhNbsdMy
 kfwbU9bzZmGvNrvrmp3VkgCQOVNBzBgS65PpLUgUqIXuBmd0oCjs+zJ0Xf6ntmf/xu9L
 0YPxkK23VFjUIi0+K5MldB/rLDyYdPckzEQT+bVAemiCTZBLBxAvtMY1HxO/kUiVEOqk
 vZgBNdADKEM2BAbzIJxi+UvJv2z2N+EhAXLiH5G4N0EpCxhmdmrXqZA2oTmCqZOXTTaD
 h1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TnkWF/fJb3+MN0k+LniOlBuYB58LfW58mHqJqX+URIE=;
 b=MDSiuLMjLp0XKvQcencxF9z+ck+i4rMAAkat7Qgt4VYK4Edl2/L3qn38TsvtOJLI4u
 ZNA8n/t/6xNazJNUZYDYMHeR++O4RlddaY5MSEALY4rvF+S3c3EvPHe8FVohKq4BWJQZ
 48Z7n7XjWi25qy11N/+SCpXO4d0a7407AQiuzhgEsyWqQcThrASUjfszOSduxIBBWdTC
 nkvixiy5aeh754b9A24HY5l8AFkZlYP8ycxaDnYfDq4BofT3wYOS0h3EjkBZ+sqRtoPY
 QLzSHa7xnxK//T+5mqzeu1EMLcQGKp2dtrzT2vNu+mr/Qy8ncLfmVhxLMJxpfZXFbjn9
 GdCw==
X-Gm-Message-State: AOAM531NmtUxCc8jaR/lD8bbf0tysPuluQmYF6x3udoNAdE+JnIGQxPP
 tmtab672iDvtPf41CB6J8lrpYPOo6zwXaA==
X-Google-Smtp-Source: ABdhPJzvvEcuDdin+Rl6Z1zLKQZ88UPWFkNSXMU6UzLLhPOlRygjEWDdGE4qOxIihheaK6HYJSsBgQ==
X-Received: by 2002:ac2:4dbb:: with SMTP id h27mr16954400lfe.634.1617019261533; 
 Mon, 29 Mar 2021 05:01:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d8sm2415240ljc.129.2021.03.29.05.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 05:01:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 4/4] arm64: dts: qcom: sm8250: fix display nodes
Date: Mon, 29 Mar 2021 15:00:51 +0300
Message-Id: <20210329120051.3401567-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
References: <20210329120051.3401567-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonathan Marek <jonathan@marek.ca>

 - Use sm8250 compatibles instead of sdm845 compatibles

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 32f0d6a82457..693ac533f9b6 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2323,7 +2323,7 @@ usb_2_dwc3: dwc3@a800000 {
 		};
 
 		mdss: mdss@ae00000 {
-			compatible = "qcom,sdm845-mdss";
+			compatible = "qcom,sm8250-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
 			reg-names = "mdss";
 
@@ -2355,7 +2355,7 @@ mdss: mdss@ae00000 {
 			ranges;
 
 			mdss_mdp: mdp@ae01000 {
-				compatible = "qcom,sdm845-dpu";
+				compatible = "qcom,sm8250-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x2008>;
 				reg-names = "mdp", "vbif";
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
