Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA799DB596
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 11:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04E610EC73;
	Thu, 28 Nov 2024 10:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="heFxQWsT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFCF10E345
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 10:25:54 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4349fb56260so5386095e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 02:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732789553; x=1733394353; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=onHZLTuuortukCIGD/zr91NsXEjXLUPL7AUDe8ckj8E=;
 b=heFxQWsT3TACdlzNu2YeHJGIBTdwtIWqOFXDb3UOHt2PL7r3Boarl7mMjLg2EoeJW3
 eoQajHfvI/p5hQ2Nu546SyC47CDWndLuBQrJOMkWRXrfBAP4gIraMIo7Z7vdwGpSqFh7
 uirKNdol0awncyvfJLimMqf2hYOiESYvqmFr7JKjKjoFoXPLA4y44Gyymhb4wNK/by2+
 gfuiaYPBXgcJEm86cyiLpvaAQJFtUFWY69AHgW53jmFl+SmaLsIHGZhtJHRUVQJWA8Hu
 T4i+5aENQqSEgzaRjdM7gupex+1nLjFW+9v42m+EYTCBIAR7s82OCSA+29QaWUEcUkck
 +ZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732789553; x=1733394353;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onHZLTuuortukCIGD/zr91NsXEjXLUPL7AUDe8ckj8E=;
 b=kfWcUsKVUbdnxgK9Q1amPUIsIZeWT/kIts/Is/S4Up+qX2baFKcC+GuoEnoYdOEYyv
 D624au2oQCLg+AMWZ8TUA/W4E7FLUgiYM277NQ+d+0aGFScrPQ559tKX3w3d++wVDZCX
 asR2Lsmj8FreDWhG6V0SbvrtOtNfLcXZ1f0fEZA3xT0OWHL/MVyjpmtiSbsj5J39LBSU
 pkmW85JQexkfbK2XZxPYKNKv3Kx+AQoKSpygFIucDXUFhlPCiT4zASZVVNhIDJ+Ks75q
 eRrK1lpNIrxtXKtsKTHbB2aaVjlECHfTtwYFp4tTQ2UWSshV/agDxDD2s0+Nie/0CcWM
 7A9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0s3oSLz0dvhOl1TZ76GL6wnQ3QVKvqLMI7d4jSylmIMK+DjNbDhKJW90+8sBEtYL4Z6SbyqCaX2E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+j05dJuY3Qkls58gXZyqYTsfRYETligztMy4eHSxfvb3Xn41D
 Os0LG6zS2a311G2NsJYDhXwmwMTDW0ZLZqinkbn0B9GRoxSc7v3rZwPMHigQ3U0=
X-Gm-Gg: ASbGncvIq6ddKBLdFJWAJWYjHS1OeunfyvqAz91XP/jknAeewpLA/mh3mfq0kzSkN5n
 numPpq8MbPMA8x4adzUtHGMWLrQkEeIaP4oV74GruOkBH2ITR2MzhVmEtTTTIxiZn9P0Cq/cpR7
 ZVUIF83oWZ4a02GKMdP2uo5mhXG3Tr26Dxq/I+7v4Q5DInOgPA5ZHInQW0cYf/AcOTOw9GfnY+k
 bnYgYunzW9CcMvAI/q4s7tmEjWZUn7dh876kw+ieaqp+/W/i3iml4Wzk/P6Mr2gdwnmhNI=
X-Google-Smtp-Source: AGHT+IFc8baEE4obV/t+dZEaXnJYfvSi4j1JSnGZb5upEN1OOzGRPJoCXriBFRWmZ8/pRLNl0l74RQ==
X-Received: by 2002:a05:600c:4f0e:b0:434:9cf0:d23d with SMTP id
 5b1f17b1804b1-434a9deca10mr51252185e9.25.1732789553016; 
 Thu, 28 Nov 2024 02:25:53 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd2db59sm1265909f8f.11.2024.11.28.02.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 02:25:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 11:25:45 +0100
Subject: [PATCH v3 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and A750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-topic-sm8x50-gpu-bw-vote-v3-5-81d60c10fb73@linaro.org>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=924DT6oTDMvCY939ECy/haC6Lh7oI4FgArQiNZ+Ppug=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSEUpWCTm1P4HsUDHmzl+hSPFrHFr1Uz6nvhjAh0U
 ag9joeuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0hFKQAKCRB33NvayMhJ0TPmEA
 CKNYmQ/3wwTCYJIWif0Ir+v4DtzD2ni3Il+Jkwn+SGIGlDWiB+kPTLReVehrzVtdJE7tMfRqCxHk7s
 6j7H/H4Shl9fa1uAdH3ljKBgyGsvhytbWLsy4G9dVenGN+ps84hteAs8m/FPfQkGiLrHGrlYsd3kbv
 WXqzevlGmH1wL2GLJgWXikowi3pzHt0PCFdo4euBlSm+GDl4dPunOfQO44atfqOLVkmke+bJr//TKJ
 dcTA6qFZMYaal3iMUtzN+73AzuXgr+NYBTUC+VRHvdW7MymRSa0kAbo4HcBulVuEw3O6CLfG8ZiO96
 B7z+zOwqz86rsDDtr0dNhsagJHSP6te1/aCrSvBxUllDFAVpFDxmWcdvqP1l5J9e82bmO1UneYi1TA
 TLbvt/DjQrfSr5LJz6VywB6fFumm16csyVIEPv/QYPCLtvaTQrYQTcTKXXi1+kQD7hD2Ui5fTPfRaG
 y1KIoQogg+OuI25+n86i4vHX2QgpZK2bfYi2Esnod7LnC0V5j76Jg3nAh/e4sjRzsx+XdqKTcI8yM9
 Uf2TBYKuw5wXkOi6haDShbQNXeHGh4RF28bG0rvQrWh0L/HPCiwfxNtDAYUdoXc2AptTpa94gm3Hfo
 6BqjfzI23rQb09w23GW2t6L7AV8+sopHmzVmN9q/IQ/5wsiP/neDNPGjqjSA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
is in place, declare the Bus Control Modules (BCMs) and the
corresponding parameters in the GPU info struct and add the
GMU_BW_VOTE feature bit to enable it.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..edffb7737a97b268bb2986d557969e651988a344 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1388,6 +1388,17 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 4192 * SZ_1K,
@@ -1432,6 +1443,17 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+				{ /* sentinel */ },
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 3572 * SZ_1K,

-- 
2.34.1

