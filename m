Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C027D6ADF74
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 14:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF0D10E359;
	Tue,  7 Mar 2023 13:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B45510E129
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 13:01:45 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id f18so16972413lfa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 05:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678194103;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZBjV0MIGjzxWCA4dde9ccbuSp/4SeZ0AfFye0IJguH0=;
 b=S8K842lXW/grOayUPiw1/stytcPwZSZw0ib3Rwy0G8TyU3BoqzW3i8GNnezA75iJe0
 F7HbbM9q2lxbK5+c3ta6HNsfVLqMBtL+CzPhG4mIP/5W7xIU+socPmju4EYLTcIUOU79
 +zj5AxGzs7WfjpWK/llomuMJ7Vp3dns4XOpOPPDLIZvJPcHMrWMDIkpBBQ0DVaik4aeC
 Myyy6/XxwQ8T9XVXJbWlX0/rC6juLAo+ZwwGNEAbopbofiS91kTYa9nKLJpyw/MP7lHw
 P0jWblIUN56/EU3Een7Ib8YU0ugO5btmCZdq2y6MOVR/gimEISu0JfHR37i7PelEw5ig
 eetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678194103;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZBjV0MIGjzxWCA4dde9ccbuSp/4SeZ0AfFye0IJguH0=;
 b=VQinL07PDxuwYrhr07SL2zmvokjalGfZzjPSR/pocd/vU2k3eat6ALoMbMAH+WVyEL
 lrgaTrvBJb8IVu/egThj1OTUlGQSXbGwYMjGJgPY6/zzYblHv376Mg6jw7DlbMaX7pwp
 f3DOS6UvfNKhBXgRTjB+myzYiBZmf7N0d2ITf18nDse2WUNsRkNUrsi7l1fxRlPxqtJA
 GwuFibTDfGqOd8LVa9XUVprFko5jAb9gEtMjOm0WdK+NLU6KFX5RKrM026qFHvrUkDN3
 7GnHD383+bbqIFgEmnoM7ekUtiRqVNGw5BcHMRRBATs4WEUKHS/GGgrz0qQPon1I5+pT
 UzZg==
X-Gm-Message-State: AO0yUKVIXP6O0qe6q6OMlvg+3Xbw7iAxYm7KXKtsa5EPP17TSmDSpkvo
 JuyNdZPLRydhRiJxgg24vP+9fQ==
X-Google-Smtp-Source: AK7set/BUtMgR4MG5rcNS3SZZlwGfqldYfAdp5uYc++c6d8LEm3HWAca8HOGIbFj8Oi5XqD7hswj6A==
X-Received: by 2002:ac2:43aa:0:b0:4b5:6042:d136 with SMTP id
 t10-20020ac243aa000000b004b56042d136mr4125457lfl.22.1678194103253; 
 Tue, 07 Mar 2023 05:01:43 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 u2-20020ac248a2000000b004cc5e97d356sm2048265lfg.148.2023.03.07.05.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 05:01:42 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 07 Mar 2023 14:01:39 +0100
Subject: [PATCH v3 01/10] dt-bindings: display/msm: dsi-controller-main:
 Fix deprecated QCM2290 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v3-1-8bd7e1add38a@linaro.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678194100; l=1022;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yadLtYUd+NaBlrHtthnWah/BoxxYiya5SpI6g5dSH5k=;
 b=VXFbvloo8L6tf6wwoMkScWR9GbZ6ztU3t6q9TPy+AM8ughrYGsc0FKWNJHCSqgBFQH3zp2bjnBiP
 1u/l49IqAkFsvhNRiqUfofrrCrYY3xmsfHQCG0TIA5f8YQPX277W
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
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The qcom, prefix was missed previously. Fix it.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e75a3efe4dac..2494817c1bd6 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -33,7 +33,7 @@ properties:
           - const: qcom,mdss-dsi-ctrl
       - items:
           - enum:
-              - dsi-ctrl-6g-qcm2290
+              - qcom,dsi-ctrl-6g-qcm2290
           - const: qcom,mdss-dsi-ctrl
         deprecated: true
 

-- 
2.39.2

