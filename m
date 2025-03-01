Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A10A4A9EF
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 10:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A5610E153;
	Sat,  1 Mar 2025 09:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pBnxe+wx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DDA10E153
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 09:25:01 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-54527a7270eso2875471e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 01:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740821099; x=1741425899; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ypB915vJqmRaH63cKoFbSo3grjRFws/DTwU9I0cazvs=;
 b=pBnxe+wxv6ILj09Kg1bEifsHkdke3NfU7FciiXXKne3vrgm6gPpuLKYInSX9+N08eW
 cIrxFYjZ8h6y83yXi99Wj+CbphLmUN/7Jd9OVgigRkvGoVUMWd1jZFeuJE/3oQIsGVVt
 /k8g1fDOCaeKH/FQbegVfkg944sXLsdsOBsIg7Y6uCd921EMjzZ+Ws+2mqk/nqum/by/
 ZJe/1zmoCqfDxwZ2623vBOI+kqQaS5FIrh10fFgiEkrsh2DHFF6t94MQcRYjI0cqCN0X
 VB25+DWGpc70sC+q18eTO2esBH08ezhcjOTToA+o077KSATdXhw/kPcquJqD+IigRGOp
 9Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740821099; x=1741425899;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ypB915vJqmRaH63cKoFbSo3grjRFws/DTwU9I0cazvs=;
 b=sK2x3TYy+X216Po5Rx5EtTGlPrQ7kMld2TiKV7wuvMxj6dLvojEtD6tghc75blA+Ic
 I2FlllPbSsvLPkzBpcL4nwBpaeYJWoNIn81yWnt4L1rH4LchuKer9YP5HwZuJSO/C11G
 ut15xmCuffb6kU1UtJ6g9XSyIwfA4XUoRXmPbrsVs35XjvnjRXpllz7HqZdsV0h8g8Ga
 KBUbfN53v4SxWVCS9psdlbk7XbTcfGblCu8o4ab3K2yMBPewdDJiiA7MYA228SKiV7jS
 17V6GYs7ev+hPi7KEUea2Se4VBtzk2vD7FEpphGhY1qV/LpjpRGwi54Xs4puJXht5VNV
 Ch6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD1AA8zzTtqRjyr3Z3nz2snHJ7OSodXXzmLOi8sRCKwbqPtSP3jquK5f1zkU9MDpbMRzwqYasyD0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2u6Kg4JX5t0qIcowvAvQkETZEFvoJoVlWJQrUwQi9CBefKsTL
 LlJznx3GQIujlpqT62nrdJVw6GBADa8UN361JccUeDsQi2KFhpRNjNLZHN/YuaA=
X-Gm-Gg: ASbGncvmZzCiQcLD4crHDXKAqcAVmwucTUYpxnQb/gW7S7sDkWlDIHIS4BYI6iyP8it
 g4wjAnPym7/BdrIZ726HDmPTKjnbd/XNjH944qVmMbkI55P2cIunugq/KXNROfhHgbKCAZ1HtMv
 5lFek/snfESQ3JkGzGtfKqBs+HO8gRPGZU3h+W3+bt83v854rU1gkQ9V7Q1/dut7mVj4gGo2QY7
 zzwX7+QKlJyGe5Pn+/gXnc9U8Tl4Dzy8fNc69qQWs2pj2+gIE6raXvzEueukiNjTAVOPkL0Nkxf
 WlG5RDezQtU06tmXoBFp/LdVUTmtTDZNrBUrhV9dljA8tzb/Yo5L
X-Google-Smtp-Source: AGHT+IG/1AayJVp+qm5RXrxUhbjPYPpH8uNl8/6SF/4ZZfwJzrYVs2UolooqjFryoLYeJuDT1/fK0g==
X-Received: by 2002:a05:6512:3a90:b0:545:441:52d4 with SMTP id
 2adb3069b0e04-5494c33089emr2269458e87.26.1740821099342; 
 Sat, 01 Mar 2025 01:24:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494417432csm738406e87.52.2025.03.01.01.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 01:24:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/5] drm/msm/dpu: disable DSC on some of old DPU models
Date: Sat, 01 Mar 2025 11:24:53 +0200
Message-Id: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXSwmcC/3WNzQqDMBCEX0X23C3JolJ76nsUD/lTFySRjZUW8
 d2beu/xm2G+2SEH4ZDhXu0gYePMKRagSwVuMnEMyL4wkKJGEd3QLy8c+I3OrGZOI7Z1560eHHW
 mhbJaJJT6ND77whPnNcnnPNj0L/3v2jQqtKrxRIN1ZOvHzNFIuiYZoT+O4wurkalurwAAAA==
X-Change-ID: 20250228-dpu-fix-catalog-649db1fc29a6
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GqOq9rkDu6v4PggutY2CL3RwcYuHkk2cBFFkYzV4MYY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwtJn2qMf0VS7G3JEN+uWvtBRgvvIOldnrQcYS
 k7crSZsssOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8LSZwAKCRCLPIo+Aiko
 1e0HB/sHdFdwVnCgI6jz4PMEGkIyskrbhGqY3Hqwu8/2I5ecn5HgHXqKgNxEmhAwseUs8bRMoym
 4fn8fkRTrsmTSihzFm8rom7vUKX8po4+Dh13YIGBfhBugH0Uvsb42HOAOq6bCOJ6YVJnl5u8SkM
 Yv9QaHmoQKWeLG+PsJck7cp5GRXF41+7G6rN02fpQ0QaP0lv/NjfbtSEUV3OEHUPv3HYSgVTqjz
 8M3RhzQQACJhts2u77bNT9Zm2N915NZFfph69mY6YiOYdtljBt5LCoftEdUaYtxZxW5+AlHG3eA
 1NwcGGLIHnLk/CndkDteu7KMYCaQ6G7oG3gfKRv8Ic01evLE
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
Changes in v2:
- Fixed commit messages (Konrad)
- Dropped TE2 bits and pieces, they are unused in the upstream driver.
- Link to v1: https://lore.kernel.org/r/20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org

---
Dmitry Baryshkov (5):
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8937
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8917
      drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8953
      drm/msm/dpu: drop TE2 definitions
      drm/msm/dpu: remove DSC feature bit for PINGPONG on SDM630

 .../gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h    |  2 --
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h    |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 17 -----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          |  6 +-----
 10 files changed, 20 insertions(+), 46 deletions(-)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250228-dpu-fix-catalog-649db1fc29a6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

