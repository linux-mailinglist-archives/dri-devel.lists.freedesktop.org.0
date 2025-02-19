Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3273A3C4DD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 17:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FC210E4A6;
	Wed, 19 Feb 2025 16:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q2kKzdFV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9E110E4A6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 16:23:43 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-38c62ef85daso784733f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 08:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739982222; x=1740587022; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h/JVUNmYdeWSnzu6tb+ukMUUG1W+l3NrvPTKiVQ7u4Y=;
 b=Q2kKzdFVuAUMQwb2TmysO2OFg8fZcs7P1Trb7x4rPaFQ4fE+19B77hBSpYlNOffdu+
 s4WaaUxN0l5FgCpmridwqmoO7LKBGkOvs9tbRYw+wGDdN4iLplU942bhv/th/x6i4dIP
 1MoENzUGDDsIHQ5d2PXZQvFZ49uXOMMptojW+mBcy8TbI+zvKkKy59Tbv6NWsC0Lb1S4
 2wZn0+59SdEfH/cGLcQcxQx+oedYBjxziJFZ3LxC0EeZOotXBgXIio6nZh/37Qhnj8vm
 jgZ2XT9SwgUK+z3+9RiimX3zrkEXuHKZE14wuKjYrV3QF5TwEx5ocYu/4wRhfU/2AB8h
 Vp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739982222; x=1740587022;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h/JVUNmYdeWSnzu6tb+ukMUUG1W+l3NrvPTKiVQ7u4Y=;
 b=Dv1Inq2M8IpCJqoibtWVGbsxvdZaIjS0VaO3nPprzpSyoibPQpp+aFfF8gFg8CepGQ
 1P1+jpMeizRQJQnhUPPrXK1Uygpgid1flj3eHaLQNun1Fta7zxovBpP0wkK/PwCrRkcf
 QSVwtfMax2/3UYp8tGOX2pVwk1JB8AL3Awans+AB7yoS9Tr5Y8FQqoBed9/XCWjJALPx
 SLJyy9Y68Ozk7DEu/FI6p0XPzZENQFm3OIMBGsEDEsv5oG1+lB2muZ+KzD0JPQZdDAeM
 ZPjwZgxUYCXQwVBhgXe+8IXha2uyuG2j2Yj+kMBH7E/ABNCo5EmvW9UtSAAQzNC20mCj
 BuLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQUCHlR4HJaXLJEISzcqMAgpVbif5a/JEQIykoQenOI0YygOmskyEnAG4Agc/Ky/KggBdMOAeM3oY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH+7uj8ATwC1l0aQKmQO/tIqpxywxdbx+uFrlLlzV9LYsZTjXc
 3atl/2CqHu5RodTRmxqEpvs+SCZulZ0NFdpgjYwsXpOrsAAv40qr1USdY9Vkvtc=
X-Gm-Gg: ASbGncsinftoWrNqw6nxTaxS/Un0Yrgq+YlmVkTzrZoM3BTqXDjdRQLIytD1n6b3Qe8
 IipGBrVl6oT5LLyWkzFkSE0emKyPV1gmnylXJma5ip4J17RAIrDHf2EYXSxPVxXV4mAqfEbvuS9
 5jRXXBcJf+crIV3LQ5M6tcjIOhHjcL5dfid9a2MqR+x6uGcgl8UTu979g5zqsnxVQ3FiT+2XFOk
 n5tXPkt/mKQI1MDU9RNTTuSkix6MLcvV6PEmHIOg9go7w4+c9+El4ny1Hc+o+fWRG8SNUBaY+R4
 Mr9qGusu9VVuc2BZLJasOlbxy+0lM54=
X-Google-Smtp-Source: AGHT+IGBdM3lo0D85OcGM+X/7yDsIYEa3ff6Dvt0fm3r6ukYvpu2eEqg39AxdYMVjgmIP9+/XM39uw==
X-Received: by 2002:a05:6000:210a:b0:38c:5d0b:71ca with SMTP id
 ffacd0b85a97d-38f33e87b96mr6342208f8f.0.1739982222200; 
 Wed, 19 Feb 2025 08:23:42 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25a0fe5esm18442417f8f.99.2025.02.19.08.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 08:23:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 0/2] drm/msm/dsi/phy: Improvements around concurrent
 PHY_CMN_CLK_CFG[01]
Date: Wed, 19 Feb 2025 17:23:31 +0100
Message-Id: <20250219-drm-msm-phy-pll-cfg-reg-v5-0-d28973fa513a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIMFtmcC/4XNy2rDMBCF4VcJWneKZmT5klXeo2RhWSNb4BtSM
 THG7145m6YE0+V/YL7ZROTgOYrrZROBFx/9NKbQHxfRdPXYMnibWpAkLVEh2DDAEAeYuxXmvof
 GtRC4hYK1cbquK+tyka7nwM4/nvLXPXXn4/cU1uejBY/1f3NBkKBMVbFjQ1zaW+/HOkyfU2jFg
 S70C5FU5xAlqMzJoMobbYneIPUCYXYOqQTJKlOm1LIgat6g7BUqzqEsQShzIy1ap5H/QPu+/wC
 XLcutmgEAAA==
X-Change-ID: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Rob Clark <robdclark@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=tZwVmZGIy/eSt0F/uS5uvIVQSBhlXJtKuOQbLfRhrCg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBntgWG39erfPCkDuCBdlsjBei3XeCpr5sf5QY1l
 egU/afYzjaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7YFhgAKCRDBN2bmhouD
 1zQOD/0c+MQ1gae4xMmQAO8dgpOXfEBJ6P5vw2BXNnqg8SilK01Oks0ZGEoEacDx49ZndSz3WA4
 Sv2hqvKyFS3oF2gQ5Nar78q/04ZvrWxRW9Jde/J6ivRid+0TwEODwpA6JqyHoDhHYMDU5Hm2C+j
 cdC/GKKl/1oYT++nmzvSU+3d+RtuSleDwzjNmBL8G2fMDH17tU6KwKuWBK4+e6I99qPAPexWGzq
 qmcaIqXGsoU76ltjMb4W0QBVKdproY0F99tH9O+DW/g5wS5SGPrkTKCnHxTje3aLAF0FoDhFI/M
 yKWZbwklNlSbuiRHWddbyoy2JEywnLkeKSlQLk52VB2JJMMWYdrO4uMUqW5ThmF6LuMnv2m2ZiO
 3nBybqToaOZ1Tsb5AezUdTsj7IKrM0Se19X71latB2eVGK7KOejtRWmK9GDIp11jPq9KrvnWuoK
 IZ/bUDh2KlgHkUm3JOhMCwkv0e2u22epW0r++EKWSIqIkqUx477N0qXZX+iSP/v6qrZjpxkDDV3
 5BH4kEzJRtGNCEoJsztwmwJYf8+wBsL+nnLazTWjVlVHPI68H3Lr7+Ud4A9CvXEQQFr7UIyd+sU
 4oTPnHpykDkR0YEIkj/BKKW8QSqy00tv2yUMH3mno2Lx1ZSx7vYv1J7Dt0/Dxan0ObifeqColxR
 vZQ8uPeFGafll1w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Changes in v5:
- Drop applied patches 1-3
- Split part touching pll_7nm_register() from last (#4) patch to new patch
   - Thus: new patch #1 in new numbering.
- Link to v4: https://lore.kernel.org/r/20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org

Changes in v4:
- Add tags
- Patch #4: Add mising bitfield.h include
- One more FIELD_GET and DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL (Dmitry)
- Link to v3: https://lore.kernel.org/r/20250214-drm-msm-phy-pll-cfg-reg-v3-0-0943b850722c@linaro.org

Changes in v3:
- Define bitfields in patches 1-3, so move there parts from patch #4
- Use FIELD_GET
- Keep separate cached->bit_clk_div and pix_clk_div
- I think this implements entire feedback from Dmitry
- Link to v2: https://lore.kernel.org/r/20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org

Changes in v2:
- Add Fixes tag
- New patch #4
- Link to v1: https://lore.kernel.org/r/20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org

Calling these improvements, not fixes, because I don't think we ever hit
actual concurrency issue.  Although if we ever hit it, it would be very
tricky to debug and find the cause.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      drm/msm/dsi/phy: Use dsi_pll_cmn_clk_cfg1_update() when registering PLL
      drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01] bitfields and simplify saving

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 18 +++++++++---------
 drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  1 +
 2 files changed, 10 insertions(+), 9 deletions(-)
---
base-commit: 15ad9d0efd6a8b1db4c098ac0a5e66b736ca774a
change-id: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

