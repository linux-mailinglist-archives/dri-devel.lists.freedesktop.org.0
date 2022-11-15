Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1732629A6B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0460F10E3E5;
	Tue, 15 Nov 2022 13:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC1B810E3DE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 13:31:29 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id n20so15436676ejh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 05:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0Fov8iE/sdW1px1P+pOp4rUXG2qai5ScCDQVqwGHb0o=;
 b=csl4NTIIDxeh8MyyI+Ga/ULew0VG/j57aFAtB8Mjx8NgO2yoy//AuyswpL4h/hRKXf
 3gjn1bcuwulVoldABTYrOl8XxGq7Xr3L77R546yQGRykoR+4UWpv93Rh3wVcxmzMr6GS
 YHuw5G0aDXKKEm4P65PpUVaTmLCylxhunwi4BXOSAdlQl5VLnX66Et7MNoifRZWOiHhN
 e7SGHEf+fT/vYJshKcpbxpJVROcx8qA6Z3SJ7kYuySljtBQmtVbQKLuNmWGce4qZL2Ew
 BSCe26tX/OfGGg2gmGCAFpzM/lEXRFi0GKyTH6PKhZBQossvMc92Vh6VJdrXASMwqHeL
 x2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Fov8iE/sdW1px1P+pOp4rUXG2qai5ScCDQVqwGHb0o=;
 b=2Dp8v+7bHL42tmopUX/F1EGZ6KBvp58p0lKM/LZX5JDJdKRT0G6Zv8Iwp/queeRXy8
 93LB9m6KJx9+qMfIgwnMHH+l6cZ3M/ASUskl+k+vamECz6pmWeWeKjZiQHomxU1/T5EJ
 MC/ITXDQy06TvydDLDsDbmp46H1YKAQ0+0MhTV1J3M8gcGwA02EsAL4Mghp7u5Rh5AFp
 ow2a9A4sLzbJNrg2J1xKnq8VUBYNurRdAHu4ChQ2YjeiKitMInzz6/n/bQoI3i99wVHj
 t5EgqrZCMrC5co7defARJUc7c2PF92xOnaADbY70zOsxhXVR600Vd4BoT2cnkV3CeoHq
 jfuA==
X-Gm-Message-State: ANoB5pnh97IlvaFdASYUcM7H8FDnTIbCWwjVsAcDFRutMTZL3Efo4xuk
 MvgkDtpCDAiSZZuSsjZXhwPj2A==
X-Google-Smtp-Source: AA0mqf6/2IvtQ9tyYDU30EBz5bwd3Og7fYNxlk9thXt+BmYji4UroSU1/DeLM42jZ1SNFLkKsR0Vyw==
X-Received: by 2002:a17:906:da0c:b0:78d:b43c:81be with SMTP id
 fi12-20020a170906da0c00b0078db43c81bemr14106931ejb.600.1668519089264; 
 Tue, 15 Nov 2022 05:31:29 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 q22-20020aa7d456000000b004618f2127d2sm6162176edr.57.2022.11.15.05.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:31:28 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
Subject: [PATCH v2 08/12] arm64: dts: qcom: sm8350: Remove mmxc
 power-domain-name
Date: Tue, 15 Nov 2022 14:31:01 +0100
Message-Id: <20221115133105.980877-9-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133105.980877-1-robert.foss@linaro.org>
References: <20221115133105.980877-1-robert.foss@linaro.org>
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

The mmxc power-domain-name is not required, and is not
used by either earlier or later SoC versions (sm8250 / sm8450).

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index cbd48f248df4..805d53d91952 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2558,7 +2558,6 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 
 			power-domains = <&rpmhpd SM8350_MMCX>;
-			power-domain-names = "mmcx";
 		};
 
 		adsp: remoteproc@17300000 {
-- 
2.34.1

