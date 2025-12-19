Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA753CD0EDE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 17:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C663510F049;
	Fri, 19 Dec 2025 16:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="lybjJlsJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A2810F03E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 16:41:21 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-64b8123c333so2251558a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 08:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1766162479; x=1766767279; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mFh6b7zgZI1HsA8s8Bqqbi9ow8eV3Aoe737Rsj3OItI=;
 b=lybjJlsJ9LeUB281MTjTmTCQ72cqUPgd/dCKNH+V9kcRyWWMGJFUTrKHJa5LVeQcVi
 TUjP5pNoW6806OJjy0xThnUbRsvxPLxTr7AT5k9q4AaZI8XpEmH+Z2RYdq0ax/2lZkE6
 tx5FmjU3H/BcYdyhwdL0BnTocoN5uIvunktVnArwQReMilHLjONIPIJJrwrgr+BpV+ol
 wmfD4BxkJ53VVu6eS8D/gkJ9CNGqfsOO4DJ1AbE9DRcUWr5RwaxBwM6Ie863wPNj6vKL
 /EEYZzXpLWIdScsx/3guw3QJ8YWe3q0Em8H/8cXucnF30TFcyB98wDzL2LsAzoCrhFUp
 m2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766162479; x=1766767279;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mFh6b7zgZI1HsA8s8Bqqbi9ow8eV3Aoe737Rsj3OItI=;
 b=lRCmV5FBnDcVXd3+7x44my4S6aDVoWAMSDRR6SHZTUBdfDrchq3uVkcHcc2M7NaNc5
 3hZAZ+eR+G0kW11S/6l4jUCn4++MFQX3uY+l9Vom3oX7hMfebSTK0LMdXknxFZ6uGA+2
 UY2O8bu4qIz6w7YbHVIYttXPCD8VQnjury8TtD5v+FQ0y9Ji0EnDKFj6Hc+nlAiJUOeR
 oiuQqo6W3AxWnsi7+pJVS0lL99ytvR/+JdS3+qYBuNXAyoiR1j+o7c0pLYKU2DY5klkn
 Lx0ol2/TH+XRqn8oiwYZi/aKSCNSoCRzyMiOBqzVOQUbFqIyxxzC6H2QrPdecethWENb
 R0ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkp56LSG/nQmIJk5Vzh5oE/cmxcynVF+eMMv6j7BvGrELCPGcGNHNiDa4lySxNJJTWqlp5iOuPD5g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB/WMivvBFwrBGHivXDU0pNu67WwxYI82pFqTD9Gy3tVSItEd8
 0hLqIJ7Sdg9Rr5SCd5vI4Fb+zzPNt7OYoxugWDcFmcm8aiMigzf0uaBDF3FaHa2hsu4=
X-Gm-Gg: AY/fxX4GxXCgKoJxuzhPfLawe/00c87sareU/+5ec+dgoZXN3vJ+gEjv5Sw3DdSN7eL
 RlpR8vCH/1DiiWDeedOYwmnWiImP7CR3COYGdU0WLMmo1ZhQ3cusj2D8yddLG9YLFgeG7Qngua/
 8gnrSrhM1608fCj8tS2jWoPy8a0YcTMhohHfYIu5Kx8NhwcFXKu8uyG25DXGh056gF3wAQes4tE
 TBKM5IXd+ieLbYhxL1ZJZnLDz3oS+sXg804OeLOxouxLB/4muOBb/Sw8Fg5QGSPCi2utU6N2Y+J
 efj3B69cPQBjkfM7+63o6MlxQG+qMoF0M1He4kap/dLqKL5vF3kp6smC13TYPeKpxuNJoDLUnWP
 c5tdhS6cVZGhalSFaFwOqiz1qwnTBi/9xiU7RRXj1X5TTA1eJ6aWi3H6KfELYoSqF+edJ3W5TmS
 Hkyr0dKghrj/BCeDRJdTFmxZfZbPeDGmseF17MMv+fAGiORojlFuZjVQheRybDmQJ3qePV0gF4+
 vA5XFESVnHR5X4l+XzDEajc+bf6rkjqa1I=
X-Google-Smtp-Source: AGHT+IG5xQQDju37djeKp8Zgcj7rgGU7z6CWHlLL/w7AfRHVUi9V/ccXZ3Gb0icbkIvDeWOUnP8NhQ==
X-Received: by 2002:a17:907:1c1d:b0:b7c:f77c:42e7 with SMTP id
 a640c23a62f3a-b80371d37b9mr396657766b.43.1766162479431; 
 Fri, 19 Dec 2025 08:41:19 -0800 (PST)
Received: from [192.168.178.182]
 (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:3b89:c600:71a4:84f:6409:1447])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 08:41:19 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 17:41:07 +0100
Subject: [PATCH RFC 1/6] soc: qcom: ubwc: Add config for Milos
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
In-Reply-To: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=1527;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=t5HFnNXhnxSLu0HbcMB5zyaLqy0cPi/BThYL9zb/2sc=;
 b=EoGcG/sMLsZ+n/tQW2JV/CykTnYFk5wscZuExCSdKs6oC1UTb3wWbgCcx7IrWQcQSUcMonII5
 z2uIyuCf5hSD4AWSUC+TFtP5nwTgjA9IkL9CUto62zfEZhNtEBAZwyD
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
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

Describe the Universal Bandwidth Compression (UBWC) configuration
for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 15d373bff231..790e67c7db3e 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -16,6 +16,17 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
+static const struct qcom_ubwc_cfg_data milos_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
+	.highest_bank_bit = 15,
+	.macrotile_mode = true,
+};
+
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
@@ -223,6 +234,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
+	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

-- 
2.52.0

