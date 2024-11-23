Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA5F9D67AD
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 06:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458CF10E25C;
	Sat, 23 Nov 2024 05:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LUBm+j+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3DC10E259
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 05:45:03 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-539eb97f26aso3274518e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 21:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732340701; x=1732945501; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b0HbshW0FDIroP6XclaSjKmLerWTeDPWIHr80xrRiJ0=;
 b=LUBm+j+shD96GQLlKfIw2CAM0H0B/Kkiz6GpZgQz1stwYxd6tCIOGT0neTT9VE4z+w
 YF9smRoYCgjRY3ondDU7G9G35Cu4t1Oj4Q7N402K6zxwLdqOcvtF1AuckdiDohlY2wy6
 m6m1KvmqSRsKiLgERqFTY2N//c+8WjlG6nsg33CdVkEechnTiGGOEMQ7GKrcfuqiP8iP
 H1kaisvLjHa8Ypq1I2PBIArBQNkii1qkqbrdvpTIUdxssvQA28yX8NhRXN5OdDFAXeTf
 +MZYcYvx0rr5H/R+Z9zOyGNoifwQaPDTRzH56LpxhZdqh3wqycjbtQPDYo62VVKynYBB
 3HfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732340701; x=1732945501;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b0HbshW0FDIroP6XclaSjKmLerWTeDPWIHr80xrRiJ0=;
 b=ZuPoHa+HYcgUDzMQQ6xqPMZCO+n9biNymZN6NZPD67KQbv32x0LiCBxFpqO4sR2iOx
 XFI7UXAZ8AREsmABYgBUk0ZhtRWUUxWtHnJGvdCVI1BPewznYUxXBs+LlSFNSGZnYHWk
 5u7TJiO/mdz1eb9mzNTE3Ws/euAbvYVTi2OpnUJQ32q8+kyxObEP+3Ptjz8rRupZgFpg
 t6ut5Wc1kJR6wkUp1jZS73PFW3YcOTwR1ERNXoFCC2MkjDczjQTmcxMVp8moEnpTLhkY
 OYEEEsVaBwlcVYiE9IeaJYZi5DQ5sSmN9IJ6cEGf5EfyQiosKXcGL6D0Wiu73Fcg35n6
 umUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4EvkxHYdqnJmbgUO/pWKbznN882cNjlntYOtjvzf8rAOpmrmCZ+otK8Qn34RQlFtMNpmhxxmMmC8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDWEJcgtUaYKf5QW2B+xuxI3mMCO/ddsBz9WvC/DKnDUOzPbfy
 mdbrLBAogBPOVUbUy/2yz35zaebmF9eqTYTnEKYox959gTFCTQP9cTXzXkKlgOc=
X-Gm-Gg: ASbGncufHNR4mB/yswS0PyhmD/RkJah0MxNQhjDPS2TaRhY4HYgtQVXeRo5+GwMxf7W
 PwEHhlqvABHCjeZqfPqsR2mUtGucFrPZGK6//AM6ksa7Oqk3UB5D9PO8BSgY/ZDf3oT6pm9V5NG
 WOoNELUqAeiMW900oWc3QPsWMgYBqCztGeCMvoBCik06dN9YlhWwrMlZAy+SwqkJNf/af+2syib
 LWBsags+6CBRBXh993l7zuywIzurBP92YFl86Pzs+VOIlyvy4vPT0inIA==
X-Google-Smtp-Source: AGHT+IE6fTO7btbu83dqsP1xnHmtk6AvgRM7qns88Yv9lZ+YmpujoZwp8x7KhxKEiw6v1OvMyAq2Gw==
X-Received: by 2002:a05:6512:238b:b0:53d:dbb9:f3e8 with SMTP id
 2adb3069b0e04-53ddbb9f54amr669860e87.4.1732340700953; 
 Fri, 22 Nov 2024 21:45:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd24457e1sm740143e87.34.2024.11.22.21.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 21:44:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] drm/msm/mdss: rework UBWC registers programming
Date: Sat, 23 Nov 2024 07:44:53 +0200
Message-Id: <20241123-msm-mdss-ubwc-v2-0-41344bc6ef9c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVrQWcC/3XMyw6CMBCF4Vchs3bMtNDEuvI9CAvsBSYRajqKG
 sK7W9m7/E9yvhUkZA4C52qFHBYWTnMJfajAjf08BGRfGjTphqxWOMmEkxfB5/XlUJExJxvIxNp
 A+dxziPzevbYrPbI8Uv7s/KJ+6z9pUUjYKOVdrMl6Mpcbz31Ox5QH6LZt+wK6vSxdqwAAAA==
X-Change-ID: 20240921-msm-mdss-ubwc-105589e05f35
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Connor Abbott <cwabbott0@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=wo85Gu5tBP+bwX8G9oF56lJcLl9CC7oulIrznUfB0WU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQWvZfOsGqP696O7eYCPysgh+v1Zp5nT4q6jp3
 TJjXjxhRfqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0Fr2QAKCRCLPIo+Aiko
 1TtPB/0RHVW0p8/zsE5/LcsUtA1U+CDchj7dVu2x+xpE5DZqqTkUSJ7hCpgMNltoltWFehV/O9w
 NPQu9g0qgTH+iRJJOsETgPFcz9t9mGGgdmRgv+CR5RZJiZ3ngp1HSgBt/+lh+4sazrTCoAtuq9W
 FvvZ+EeuA2FZUjE5gNwrf2b612BDhoyK0xYU9G08ny9xWu+NJHB2t0zTeb/1l6rs3eypSwDnQxF
 xl/Q1vkfiPGSIZdtIWty2HfGQKRUDlh/VtxowjK1ajoC6JCGMAJ2LtL5v7URvpShxJG12IUreow
 87sm8JQjt0ZUpZCYIYaICGinoIzA/hg+10kiPR5Z8TotquI4
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

Current way of programming of the UBWC-related registers has been
inherited from vendor's drivers. The ubwc_static was supposed to contain
raw data to be programmed to the hardware, but was later repurposed to
define of the bits. As it can be seen by the commit 3e30296b374a
("drm/msm: fix the highest_bank_bit for sc7180") sometimes this data
gets out of sync.

Rework existing msm_mdss_setup_ubwc_dec_NN() functions to be closer to
the actual hardware bit definitions. Drop the ubwc_static field.

Unfortunately this also introduces several "unknown" bits, for which we
do not document the actual purpose. Hopefully comparing this data with
the more documented Adreno UBWC feature bits will provide information
about the meaning of those bits.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Dropped applied patches
- Added defines for UBWC_AMSBC, UBWC_MIN_ACC_LEN and UBWC_BANK_SPREAD
  and .ubwc_bank_spread flag in struct msm_mdss_data (kudos to Abhinav
  for helping to handle this on Qualcomm side)
- Changed msm_mdss_data to use true/false to set macrotile_mode
- Link to v1: https://lore.kernel.org/r/20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org

---
Dmitry Baryshkov (3):
      drm/msm/mdss: define bitfields for the UBWC_STATIC register
      drm/msm/mdss: reuse defined bitfields for UBWC 2.0
      drm/msm/mdss: use boolean values for macrotile_mode

 drivers/gpu/drm/msm/msm_mdss.c                 | 71 ++++++++++++++++----------
 drivers/gpu/drm/msm/msm_mdss.h                 |  4 +-
 drivers/gpu/drm/msm/registers/display/mdss.xml | 11 +++-
 3 files changed, 55 insertions(+), 31 deletions(-)
---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20240921-msm-mdss-ubwc-105589e05f35

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

