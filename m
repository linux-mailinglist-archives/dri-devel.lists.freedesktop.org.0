Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0016A742E89
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 22:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669C610E1B4;
	Thu, 29 Jun 2023 20:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3160210E3F4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 20:35:55 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b6a675743dso16844891fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 13:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688070953; x=1690662953;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rfbq0gETnI1sgMFmbHrdDFl/8/rFlwdeWeNPy1LZMAk=;
 b=a7dYpfNxH+XUVa4XGpS3GsvyrwIEBIW55hdtr/VmWRbkn+FIC/0VhaVwWwHGFaVgwN
 a5Nqi4M7RBPSaqHz+/fT0wUmknkqY4jOLB/WHoAwJTYCf2jAVVvtD/V1D/hsHGEbqanl
 GruiEE4GttHXAAqW8DQ802405xABkYeI0zARbpwO9ghKMV5jML4Mp4q8WODFFx5c6FZW
 czzG2M03Ywpg5veqZ4PWZNzrfKuZVdEdkG7YHwa/8EFO8Q8d8dmPVX1X5wb4wCVkWAb5
 EGKnH9lK6HdRs+MhNXAI/ln7IGUJ9XOWtIfZMvZBMWeujfLn6qpeVvWPUdBaeJq5NIqq
 WwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688070953; x=1690662953;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rfbq0gETnI1sgMFmbHrdDFl/8/rFlwdeWeNPy1LZMAk=;
 b=VjdB7VcFQiExQ78z0c90gfAnt3PDh5hk2JlFy/B1keIvpDhIttub1Zw6vNe9gdDnk+
 7VO7emV6GBk9he0VUEU8QIEnj3h6Gr1xdPMFfNbzkfbI8abI3D720ZZZpa7PncdGP7Od
 8d/tHJAqmHeqHCC5FZvRdyOwnGrmKoE8u7M8V0zjAJD2QqTCY7GA9+D2qAaWDdeukHD0
 Ax9G6tjpWeyBZYmBGAhAxxDCuEUUS8PG5EveSrNoiJKPa9ouHtnvG4Ks/53TMJxF7Lfo
 IGhqudmT6Ecr8kGU+J/qXxlDbg2JWI1VfX+vuF2CcrR9Xb4D01v6AN4Btutz2mU+1Z7h
 jV4Q==
X-Gm-Message-State: ABy/qLbrt3x3upIxr2ITL78Y+lIOz4ToUN5yXG7gZ8O7zn1GSKQ7cJQ+
 8nyH1MAnSAIIOTZUL9kOKbZJ9w==
X-Google-Smtp-Source: APBJJlFUZie/wDbUGCqj1rQfb7EBc7Dxk0MI3rh3FLZMblGsln3y0dPaFWFjpSULpMFd5WEvlRe5rA==
X-Received: by 2002:a2e:91c5:0:b0:2b5:85a9:7e9b with SMTP id
 u5-20020a2e91c5000000b002b585a97e9bmr726666ljg.33.1688070953445; 
 Thu, 29 Jun 2023 13:35:53 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a2e2403000000b002b6b849c894sm1136008ljk.111.2023.06.29.13.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 13:35:53 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 29 Jun 2023 22:35:43 +0200
Subject: [PATCH v2 3/4] dt-bindings: display/msm: dsi-controller-main:
 Allow refgen-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-refgen-v2-3-6136487c78c5@linaro.org>
References: <20230628-topic-refgen-v2-0-6136487c78c5@linaro.org>
In-Reply-To: <20230628-topic-refgen-v2-0-6136487c78c5@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688070946; l=960;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UEARP/nzfff11sHWpuDiJ7VAKYi5TYY87h31tjxPZWc=;
 b=Zh4ieYGR01IajQXIpIis5nYeiG9d7gZkzbUVO4D1/MFHUp3xc+Lx9LuDvOacrEd4x58ruCcwR
 gYJutyIQEjFC3I7az0ZY2z0YRr22ByWu35pqVDreVgChHohR4DfbjAY
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSI host needs REFGEN to be enabled (if it's present on a given platform).
Allow consuming it.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 01848bdd5873..76270992305a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -166,6 +166,10 @@ properties:
     description:
       Phandle to vdd regulator device node
 
+  refgen-supply:
+    description:
+      Phandle to REFGEN regulator device node
+
   vcca-supply:
     description:
       Phandle to vdd regulator device node

-- 
2.41.0

