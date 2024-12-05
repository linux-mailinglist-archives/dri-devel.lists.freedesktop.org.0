Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC99E5920
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 16:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E554B10EEB9;
	Thu,  5 Dec 2024 15:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jeVrb1+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC1410EEB5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 15:01:24 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43497839b80so7009645e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 07:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733410883; x=1734015683; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pVmiCOyrS2ecuSLMnmZgZ6KHsHdqqKLAjno5SAELDnw=;
 b=jeVrb1+45ySFc4AT8vLK3fEfO8P/C5fUM733pVa0xSaYBEM9cSxRyERDR8wKv1J6bw
 sy4t/THt/sYeborQcLMQMWUcV/JZFyUOXs+jcATnLCWjkAbh77EoWWAYjw5DGN4HiHV7
 8OpVgnEUIG+wqyxVb1Yz713JYe8Hag/iA3LWP6J5ZDlp9GgKAtyVaAxZS/FSJzbf4Thm
 Okc4bDawvNRv1rUFkVC01RWuKBtwSwHbO6gLQrV8Wa3YdCo4OiI2dA5DLgu5QF80yNw6
 9uJHgbT5Nq7ccASC/2jDQWixQK4Zo4VWwfUedaLQypiGB1fgmPwztUsa8IPBaBKELAZS
 SPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733410883; x=1734015683;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVmiCOyrS2ecuSLMnmZgZ6KHsHdqqKLAjno5SAELDnw=;
 b=rMXRSl+HYG0eV2oFxgqH3BNjl/Bu5BSE7BH3NPB3Zr83bzuo05KbuAD5bvxwzBKURr
 9kVo0C/3GPoq4QDOlVoKhJM8xaS/x8OR07SoaQR0TIWyMuDtqO9CabOQRHM1A79ldUYs
 2uwEJz0c86AalhH4O6ZqV57VD9U+9012Hkm91Meu3yA36DT2YBooY3n1dSrsAyte5A3T
 Pgr2mtcfP01jKpJmoctneheRTbmq5iLZ4SqarxyFcBAETYmnJHgoBSa1or30gaP+d9OE
 L3U4Jifgxg6gg2DFmP3GWz3K5Wk7LVKbVmhaMRVHFzn95c5I/FpWcbhmILSTWoKBoK3I
 CqvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUlJTK7KPrPbpADbboviGa8VMpgm7q8KAMVivzZCboKfoJ1yCyIYNsmATLS602j/j+ZsClBayjv+Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+oe8x2oLQ+LwOPCtIGkPz8HBsEKk2unf7e71w3gDFU/Z69H4Z
 vZWyTd46n1RXVCi4hRuS6CJiN3a9G+mgQsXbiOOX2VOccu+46EqwTeCe6bSLQTA=
X-Gm-Gg: ASbGncu6niYa1zxqI5bTRgcc0jGzIuoZu0JL1qxXXo+IiH6ZPCJLkAFSX4ADyE2QtYd
 slaaxr58JsZYEmp9+2cvYiaryFAQP3p1ttMJ0DOGSgjTxtUxkojTGLWjbFYX9j07wp4gKGAqfNI
 pLAKmvCIl9c4CcZKWoxVgoZWJJOOd1rakGOlm+/LE3whfmBUfDEpJhyI+LrDh3cvvDqdz0sqhEV
 O0JTFiC66lbmK5m6nEGPDO6cedujRAYWsibJBkL3UzEFrYvyty4PI/Dkk9OW+zB8E6I2BE=
X-Google-Smtp-Source: AGHT+IF+fI+rBDjJrU+kXFKlTf8czZ3q3nJgnXFs4n0YVqpgD8vtKzBieMa6idDq1qW4Q72VL2TB+g==
X-Received: by 2002:a05:600c:4ed0:b0:434:a929:42bb with SMTP id
 5b1f17b1804b1-434d3fae263mr79609215e9.18.1733410882347; 
 Thu, 05 Dec 2024 07:01:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52c0bc7sm62830795e9.35.2024.12.05.07.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 07:01:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 05 Dec 2024 16:01:09 +0100
Subject: [PATCH v4 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and A750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-topic-sm8x50-gpu-bw-vote-v4-5-9650d15dd435@linaro.org>
References: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
In-Reply-To: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xjNH0ZqzPNeRyAGL1QAVeh9hZcwP2oOm7fBqheYEiRE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUcA5gbDK8obKvAzOZxReVLFxhmvbSIw3RBNwoTYb
 eBXV/3aJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1HAOQAKCRB33NvayMhJ0eGJD/
 0Ynhh+/HQyy6sZPO3LnIuwJeGY8Y9+4S/9eTmNUJg8YyWb1a7x2k+zPRMNePAZ+vh7K3ZMgpUCv466
 phicYP82gtIjbUWAExMW6zvz8s4p2I8B9+Kz/HKP7yNmLRcvuv+RIPvQv0R7uG0bE8+iJzqTwJmZi+
 ihWfnRAWR14OlgLlIGBsdl6gm1yugEwVciJb/07uqykcCjWyC9Yz1m9S9D6F4QbTBoV9bhftD+Jlth
 PfMixhetpukrzlqJHJEo7HncfbRBErWSM5sE4ZbXsHwJ4BK1rXWvcv0sOJGcU5OB6cNywp07XQqiX+
 R3x+PIPZ8iHwM2VJ+u/4PjsXI0hO2ghoCId5VX99LkiPjsfHbjNw9p6toXfcbW8PwA+hjjE8rxtr8G
 pWlqAD/5pVobtJ12Wg1htaG8w9iN/ooTpKPnGuodATyDRsj4mOIvd5ku+ixCqpmY3hTLG4+Ca4Vh5B
 JvYQVXl/nlDZLraEQ5SJVg4JJv7uICi2XLJTgxDe6PGfpawpOWC8JWSq8UsTuL7BErY/ZYzzFqDGtf
 7Q8n3hQnvcTBuK8AjzaiaNO+IC/YodtKY5NczOnSpZb7V6V8lzcexDZJfDp/2nv4rFERjNFdvbwnDb
 B6cuycE0gxG5Cjltc2Sjljy7eaQATxwtbzJia0u9Ywx3tfSqdHl9q3kWPolg==
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
corresponding parameters in the GPU info struct.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

