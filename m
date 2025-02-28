Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDDBA48EBE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 03:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB59910EBE1;
	Fri, 28 Feb 2025 02:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SM9zzDTB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E55410EBE1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 02:40:46 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5461dab4bfdso1873731e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 18:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740710444; x=1741315244; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I4yYgoXSkPDEHxZJYvKHSYFoTnrDSY0PIOlWyJbY7oM=;
 b=SM9zzDTBekpiI3w0AHojwtG4iRnfYjNSCfdIPDi1hDaNXRwrISENwrJO29Kxmx7W5m
 QZsBIiw0oQyGI8lZDSejKiHlwjAk7gmEaVomzqAFMsn37VhtQ721qOMuOXt5+69LS2CW
 bqz83pkHsPbIIT+9NhpxZlL7I8fmvigATGyeB7lzWkXb/cIaJXBrxK2qIndjt6xsGDhL
 eZjy+8yizyFe+gyopXBlZj4TadlnXnPDYJC8cFlo5+Uf8vREU6y4iqP2c3wPfcTpaQpd
 WoZydOW5BOhxvHA29OlWNKZUnhnyzBEu16D206TikA9C0WL5pY3qnMYcn2bZ/CxdW5Fk
 VP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740710444; x=1741315244;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I4yYgoXSkPDEHxZJYvKHSYFoTnrDSY0PIOlWyJbY7oM=;
 b=YaE0cAAfo/0Smfz33AMMMZRZbjfj+Q4uiBGb4RtnhTbYFcqDppODAq4w5ry3NZBxGV
 zWcpFFv6iTmWLvUtWwEWLnSNWzM1QPBpFh93iudAgQz/lvEYhzn5O4AkipOXQnZBLpnD
 D8INoQe9OnYwJ/ia4rgzSxAjwp00xu8aR21lN6BQQNOime+IIdqVCH9Xl3ajnlLdUqvm
 DgPxdfUg4aV/VvssA2D4pS9/l6QQG++ieolZ9UtMSMccKq/c5YpLEWlBGodc+jGFz91J
 DxdUQpxw4bvT8O/OZE5jLoBrhr7d+x8u/7R4vUrzVOlQk5+Wu4ra+5PmAi+eIe5SJOoE
 wm7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeJDhLgh6Gq8wB90UfJAfSET8j5jMnL5XZKlNbcdoSBEHwjRTbf+yadTfp328kzqaOwTjQDB1afwk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzcz+AP6vs/qUtdpdAAWKHusNcXhRZ2MPRbbTF6wHS/RUUxOb22
 E42V8Q5Q9nhZExpckQ8srxHWZoTlrDzJQA7xLM/Qk/NWaWyH3wg5Gyr/pAy8kQs=
X-Gm-Gg: ASbGncvKb9RwdTPb/ns6hJFL6xhArRwmwi0MzNiYjq5LROYTPABmS2UZwERXM8AWnlz
 WbYe8QCbOuCTWyPgT+sDfj6uZAQxzHHLsnFFxjDeUAQj/piLfsFD+U4lD2o+l2qXMzmWmgcDlf8
 +eif0tOoShKCYsYaMBXNpigz2aSfKW72qzrtNiVPEiWt6HQZe+7v/A8k9504RdgAaSh9hAKJuMh
 nZak+gdLJa+n4kU/3Nl8AkwejyCsLOY/BU8xtGnIeijoLFBSpmqWoCc35LX/z+CEC+vzqp9pBxx
 zLhZj90ptgtdEzfLSoU6PZh8QJ/2KmxB6w==
X-Google-Smtp-Source: AGHT+IEtW0WMPANQ6F9JpDf+C1+6JFlyEN+Vr6zomJwOBX9tkR/2r9ue9QaM1C6U7eBAlBJHB7ZBbQ==
X-Received: by 2002:a05:6512:e8b:b0:545:296e:ac1d with SMTP id
 2adb3069b0e04-5494c36f2c0mr538764e87.51.1740710443803; 
 Thu, 27 Feb 2025 18:40:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b867a7403sm3493881fa.17.2025.02.27.18.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 18:40:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] drm/msm/dpu: disable DSC on some of old DPU models
Date: Fri, 28 Feb 2025 04:40:37 +0200
Message-Id: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACUiwWcC/x2MQQqAIBAAvxJ7bsGWiuwr0cF0s4Ww0Iog+nvSc
 RhmHkgchRP0xQORL0myhQxVWYBdTPCM4jIDKWoUUYduP3GWG605zLp5bGvtpmq2pE0LudojZ/0
 fh/F9P29WEudhAAAA
X-Change-ID: 20250228-dpu-fix-catalog-649db1fc29a6
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NqHFkZTNSAOJT6jUtd40Rvhz1aSYBkpu5FVcerkF0Jc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwSIo20QqL+PSUtzMvu2VMoizDb8f7qpVvsxX+
 ee6P7F2eHSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8EiKAAKCRCLPIo+Aiko
 1RIxB/9DmOc9LFEh7/7feQPzGvjW/BRBpCsJ4lENZIx6U+ByPKdT5v2qDT4+NRfGKfq4u8OVIwm
 b1hT8PQf3Kx24uw/Yu7XgggS+nahjQE0T0i689EqYkMHON/DsOqxgRrjjRAx4TsR9VuMuM8nY/7
 ZZXb6fl3xHc3uRFi2iGydqJYRs6uk+IP/NyZVllESvieHOqAxhW5KH0cijdaPsljJEI+PRNEM/o
 XoL7fmb2jXrYhsIkKm01znKQvs+F/LNwQLD18F8UKOYbCqOats/SYHkddp6HT5uzCvM8R8SOt1u
 sxZyXYxO48mPbZu1iffvBy+E8dzZ0/h1AH33BKTd3vMuKiUx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

During one of the chats Abhinav pointed out that in the 1.x generation
most of the DPU/MDP5 instances didn't have DSC support. Also SDM630
didn't provide DSC support. Disable DSC on those platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8937
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8917
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8953
      drm/msm/dpu: remove DSC feature bit for PINGPONG on SDM630

 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 5 +++--
 4 files changed, 3 insertions(+), 7 deletions(-)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250228-dpu-fix-catalog-649db1fc29a6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

