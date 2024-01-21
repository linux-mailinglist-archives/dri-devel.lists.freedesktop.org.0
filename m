Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EE9835550
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 11:41:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F3B10E1F4;
	Sun, 21 Jan 2024 10:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE77810E1F4;
 Sun, 21 Jan 2024 10:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
 t=1705833646; bh=Y/aNKL9qun+wRAcg/kdmKlSDqC8Nm5NAprHi0zYwPC4=;
 h=From:Subject:Date:To:Cc;
 b=i7rjG8Qkbtd+wkqWhFUQd2PtsJhanUASEliPL2d3GiKAq9lhCetjMVZNiww5kYeAx
 +c6NbcudNrJQ3n8493caZXQJKoXs0KtQosDu2ByM08nZ/+nzwGkHXaNg1AZaMK0SiS
 7MbgtYztt/lkBa/uyPcyYjmlr2arUO1VqsEQz88w=
From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH v2 0/2] Add GPU support for MSM8226 (Adreno A305B)
Date: Sun, 21 Jan 2024 11:40:37 +0100
Message-Id: <20240121-msm8226-gpu-v2-0-77f4a6fbbca4@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKX0rGUC/23MSw6DIBSF4a2YOy4NXIyVjrqPxoFY0DsQDSjxE
 fZe6rjD/yTnOyEYTybAszjBm0iBJpcDbwV0Q+t6w+iTG5CjFEJyNoaxRqxYP6+sQ2vr8iFbZS3
 kx+yNpe3S3k3ugcIy+f3Co/it/50oGGeV1miFRmVK9TqkW9b7th/QpJS+KBREJqYAAAA=
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=986; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=Y/aNKL9qun+wRAcg/kdmKlSDqC8Nm5NAprHi0zYwPC4=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBlrPSqlwnLBQalHp1X9JLwPf7cZeE0GomrAUm6K
 4fEbfEopymJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZaz0qgAKCRBy2EO4nU3X
 VlKQD/4+0eIXBxbX6Pv7/0sI/ZIJ3MRALmu7yQ0Ch360aLiqn/kGiuo6SZgKPGlW2GXQZNcCoEh
 +slBN1T+cF8+43/nJ+ztdmP1Wyj/Xpq0CRv2AAdo+X09F3D5h2eTcxQvljvFv+2nhi5hZLTKAtb
 Jh19npcwW3j6QLIJbCBAB5RCvmOh+YeX0s9cI9oSXWoiuf6baMVbERcTCfckQ8LrQBuQuWVPCvR
 D0Y/upqe6rMSbzzNMfuWYIqLwhgsLWramH7iw0aoVkR4z0kKqzKNx/EVXheNJs+UfoPnBvutnha
 Ozt0/KT7kPxIQgmNgkT2j3Z2Z+VyJq7SBaIgmGCkPC4htGtEHJ6HOFznHhjVcIauKUUBPvMS02F
 u7+dyNqVEY5qBGo8rcGRZ3Py/OeMPmqfi8fQwFtQX2fMqh4W9XhTIYBK4G4fwBRQrgoKTI89tCd
 viNKJccZ/pdNNSFJYxVZ5IBGXzzT2EQ6+F1u4wvYM0X8riuFQIv68IBLueONNyR1nEhFNy21Gx1
 Jf+STDiUmUw001U9fLP3CcGWvlvO0PIeC2waXrMaUxACJYGHWENgYU081ow9wpb6VJiqmj3B1Fb
 3Z8iCWd3ZcMDg+JjjV1dzXE743VqDygQf0MGNMmRlFRLg9UWpMrHGNQAlmrhbE9ivjxuTTPKZK6
 cLFzuatSvVfZWYg==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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
 Luca Weiss <luca@z3ntu.xyz>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the necessary bits to bring up the GPU on msm8226.

Tested on apq8026-lg-lenok.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes in v2:
- Drop applied patch
- Use "if (a305b || a306)" for writing REG_A3XX_RBBM_CLOCK_CTL
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20231130-msm8226-gpu-v1-0-6bb2f1b29e49@z3ntu.xyz

---
Luca Weiss (2):
      dt-bindings: display/msm: gpu: Allow multiple digits for patchid
      drm/msm/adreno: Add A305B support

 Documentation/devicetree/bindings/display/msm/gpu.yaml |  6 +++---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c                  | 13 ++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_device.c             | 15 +++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h                |  5 +++++
 4 files changed, 29 insertions(+), 10 deletions(-)
---
base-commit: bda7a2e04984237bc14ade7c9660f76fbc035686
change-id: 20231130-msm8226-gpu-c2ff8473a9ff

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>

