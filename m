Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8726B9F8969
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 02:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C65910E4CC;
	Fri, 20 Dec 2024 01:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eXZr3AV1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E322B10E4DB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 01:28:34 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so1247022e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734658113; x=1735262913; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RZqz3kYMnmiLR7o48J3cbcxBhI/4j/BPeIiFeEsL6FU=;
 b=eXZr3AV12pp4y+KSFgC36NQE0mSZ+yQWiZ3xF+wZlb+Xe1siDm5J+rfI+Ioo7WmQTY
 4/x01rt1P7w1N3d1TQpmJVl2PQxzrGIJ6/127wO4hc5ZnhsxA28+MSjFpI2hq1IW5Pws
 TqZZqUuKyAKAvm6/F5uCLlJEz9k7zRUkOF2iTwk5BhdmvqcV9JnBXabBXUpjhDV7vI3+
 JL50j9zzxtFIiukRvsxGrstPyeFnTmL72WUfgU72To/S9EvLwwTsp7dU5ENdqsEKZ9jO
 jxtm6JOenV2B6iCgm7OlGxd0/F9++KKSAU5H6/3AKfiUKX0EXzbtg4cPdE0AraYCsfOM
 K+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734658113; x=1735262913;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RZqz3kYMnmiLR7o48J3cbcxBhI/4j/BPeIiFeEsL6FU=;
 b=qTBwVAlWHHjUPq47xlH3BysLDr+Si8C1Nsgl1MSCZPlX6WyMoMvvFXBgXDxpDSx1gJ
 /5t1ukVo5MFgNNST4srMYYItxt++yT0qiKYTwNBjvTGnT8yqVK4eXzhdRF+X6HPUZSCw
 /XDV27+QUtI5ASuktD/QJyYTlEABkQhkq+QED+TDIOsoJ9IbJgqUsSKEoKle1SKK4D/D
 O5ri5Buiefze3TsHcUGPczivYOgjb1/9bqketOeckrpcDhTYKE913UFMB4RU4SyO84D2
 Neuz6J+VKAa39kbpOAn98HHINMgWoNx7cQoPZyH9o5DcPLhZ+6n7wOugBMdlDlHsAuVW
 4CKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwEX8f4NTuTkx7rSZK2xf+iIYHIOoVh2812gUhx32as0zLDw1npR42mDv1ldLmUgZch7vJvRS9okg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydUSQgzXmLcdhRqKaNzi0squHhNJL0Knzf3T5pHrxpTJjKXPBM
 lLXTsipVkWcpvX8LK5HZrIzs9hvrU+tdSKInyEm0NtlIKq2VpUUEFTbCwNsf20c=
X-Gm-Gg: ASbGncv5Vn7LRJZ3OJLxnchzAO7pNC5TkRWZJHlNsABC6ixnllwYSlhnjjhVurTQKbz
 r54vtxTQaRmXvwCwxfNGxNf2w91v4Ai8QbflsMlz1Bg5cmQFfRhCmRyMrT29qwOhvg9LAym9o/h
 Cso79fGzOjiwTesmbtnvymRxeaqt4NSWR/6UEhM7Y1NbPT9KG1F7qfcBqmgfy0MrN0DQeiAxPmJ
 aL/9CWlpZT8OqaQ4ogr4ca88JfUVUkCi0hK5fvznsNGnw7ddJBAKgMZO77w7Yp7
X-Google-Smtp-Source: AGHT+IHu7YykZPfaTuYn0jd54qZX16d6ZpG1nlsMRrSl/j+R8LpdmSPs/7qbO09uxjUjWevtudEyAA==
X-Received: by 2002:a05:6512:15a8:b0:540:2542:6081 with SMTP id
 2adb3069b0e04-54229533e1dmr192582e87.23.1734658113140; 
 Thu, 19 Dec 2024 17:28:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:28:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/8] drm/msm/dpu: catalog corrections
Date: Fri, 20 Dec 2024 03:28:28 +0200
Message-Id: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADzIZGcC/3WNzQ6CMBCEX4Xs2TXdVtF44j0Mh/4BmxBKWmw0p
 O9u5e7xm8l8s0PykX2CR7ND9JkTh6WCPDVgJ72MHtlVBinkhSS16NYXDvxGqzc9hxFbpZWxwhl
 FHupqjb7Wh/HZV544bSF+joNMv/S/KxMKpKsZxF3cnNHUzbzoGM4hjtCXUr4ZVf8irwAAAA==
X-Change-ID: 20241216-dpu-fix-catalog-63a3bc0db31e
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1941;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5aSCx0k8LhOK5y8eZerRNLzFjFPkZ0DBXazZ+khNng0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg+Ye5BfK9stss01rwvB80sz3ZLaspC31dvO
 nXccUP4Q5CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPgAKCRCLPIo+Aiko
 1b7iB/9VuVEl5ukn0DBd5Q5ABA4WuWvNSv1YPMUb1ge6CP4OYurqKos2RRNvRThDC08jflHGsdN
 I7LkL6kl6cDKWalDZv2sJt9YJnJDB0mpHPrDrgxzu66zIF/zHIJiI9RuhXL+VBz+2fFxoKNwD5Q
 mb/FoALFIPmJjPUnzePbZgj6OJ6Y7NpnmEnoAlQqmiQqVwpNMorDtLVc1HakOeHZwsc78hZRh0F
 GC0wQR4b/3lyI2ohOrBNM6/zx2Hs594/Z8VU5IyyvwEXsiTTeMLZaEh1JHXgogIqsUA0jnk7qsA
 LdC12gJgQ/cioxtCkjm5SET83js6BsVxDsvR99UZLa0POBfF
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

After checking the DSPP units in the catalog vs the vendor devicetrees,
link several DSPP units to the corresponding LM units. Each correction
is submitted separately in order to be able to track and apply / skip
them separately based on the feedback from Qualcomm. I think at this
point only CrOS compositor actually uses CTM, so these changes do not
need to be backported (none of the CrOS-enabled devices are touched by
these patches).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Expanded commit messages to mention the resulting effect (Johan)
- Move the SDM670 fix to the top of the series
- Link to v1: https://lore.kernel.org/r/20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org

---
Dmitry Baryshkov (8):
      drm/msm/dpu: provide DSPP and correct LM config for SDM670
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
      drm/msm/dpu: link DSPP_2/_3 blocks on SC8180X
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8350
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8550
      drm/msm/dpu: link DSPP_2/_3 blocks on SM8650
      drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h | 54 +++++++++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  2 +
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  2 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  2 +
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  2 +
 8 files changed, 66 insertions(+), 2 deletions(-)
---
base-commit: d82c9281189d2b27642ede2760db495379503b86
change-id: 20241216-dpu-fix-catalog-63a3bc0db31e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

