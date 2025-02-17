Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C43FA3824A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 12:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2027110E436;
	Mon, 17 Feb 2025 11:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Atj9Rtdt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081B610E437
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:53:26 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4394944f161so3073615e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 03:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739793204; x=1740398004; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HcPAa73EYlgPsPvzqIdie5odjRJpV4trVI5pleQ5THE=;
 b=Atj9RtdtZKe//oWUNo8HSM3XQyXhqvoyDOgyZgu0Ob/RlWk/alLvc72CNbZxZFbUdG
 CA4NlecI4I58lWRQXsK/QmAPqsHSQFSW2ljOHtYshQh8xAghA80RtdOvrAH7C1koO1wr
 JTNMIdFc9GEdF8rMlghtI2SjaQXOvT3Nhqm+AqEBC/il47VR56PfFLQXf+yaJlT2Xrw+
 GDjTaCctE6f4ZIpHnRSpg2HVgK9Ko5oiOOU0rzUmIz1HtpVxFFfPUilctW6G/0evO3QK
 2v8ro1ZALLSjVdDVZuRbh0T4PWihTvfSxcDt12Kl09vr3AMWHEF7+kvhj2BG/vgOilWB
 rCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739793204; x=1740398004;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HcPAa73EYlgPsPvzqIdie5odjRJpV4trVI5pleQ5THE=;
 b=Vg2PwBcN5v0LR6j9Z43vjGoOGj9f/orvG1f5/KtMJI+fvtpSlqLPVTL97dXifDiLZm
 70VsBDBFIu5lkYBw16fwZoG9p1ogKfOwzOC/Q3Z5pkYcFjutzsDC3Tgm9wx/ZLVhjHFL
 4h3GRE4+6GSTPWudMNizeLP7WH+iLHEh9vP4WYVmcDIQFDCJFk5zTXXhRWS4N8Z9TnQB
 XTsr+cU0eirjEWD7P62gFEwOhlL1rIWS4gCzgckDH9gCjK4uSXEWk+jchaclTgJ9u1Tn
 wwupWyIuH0HiHyyBpkI5ngjrkxBQsUidvJV8jbESaFA4QooihJ1HVldWBtPXqbL15Psm
 WhHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0zJcY5HbKnaLVp5W9SsSHMAfpUcvL4OOlZUC5sJR5X/dqXvrKhJTZHk20Yvhigmu43oCgV+1UPf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5V1DxtIBBbckf9OyRw/d2tA8o+eGRgd55ukQ/5i0qqZJ6sQTV
 8HXxxLhN55UNKzgXedTWOMMbglqoVa73RzhsIIMZOeSdxptaeoUJ4LjZr6FsA7s=
X-Gm-Gg: ASbGncuuk7jGwyh4PzyAF2ehio/KRv9A7SLF9hayN41/e4iaYF4/6jUWNt1+BpsTYE6
 2/4GO2yPQTaGrNAt/3+5/aGYHy9yK/BRF2kAAGirjCgJkrql4ktiX+1ixIN4mIyHcweUXrzDXAD
 ChTzT4Fk1d9uLb4Me0f20dZ92o1JGHA6Sb7ieseafGAI42pPg38KtHyw5DCYMSd8Jy1zP1BydA7
 a8Zd2rg8aKptf6tzuTy6pWa6Qgepd4DIxSaQ8IIj1nfAFUgR1sUgGvEiNa2XYmwnhGXn/U0BuzF
 6glPqlmUj7P8OjHa2Bu7aMmI/NLuIVc=
X-Google-Smtp-Source: AGHT+IF5kgm+xVnTnZrtDvfg4SeEzWGW2ASBm+lr0GX0cZbGvOEuZS2cLnfU1mQ9DFuGqPQEsIxuPA==
X-Received: by 2002:a05:600c:4f51:b0:439:5556:7cee with SMTP id
 5b1f17b1804b1-4396e6d4d8bmr38201225e9.2.1739793204416; 
 Mon, 17 Feb 2025 03:53:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b8397sm150212575e9.36.2025.02.17.03.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 03:53:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 0/4] drm/msm/dsi/phy: Improvements around concurrent
 PHY_CMN_CLK_CFG[01]
Date: Mon, 17 Feb 2025 12:53:13 +0100
Message-Id: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACkjs2cC/4XNTQrCMBCG4atI1o4kk6Y/rryHuGiaSRtom5JIs
 UjvbnSjIsXl+8E8c2eRgqPIjrs7CzS76PyYItvvWNPVY0vgTGqGHBUXUoAJAwxxgKlbYOp7aGw
 LgVooSGmr6royNmfpegpk3e0lny+pOxevPiyvR7N4rv/NWQAHqauKLGmk0px6N9bBH3xo2ROd8
 Q0hl9sQJqjMUQuZN8og/kDyAxLZNiQTxKtM6lLxArH5gtZ1fQB0JS6cUQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lYGI79sF49sjGrRA3iSrQy8gkG8eKmLodtq9CSRteIY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnsyMtuEHJN756qa6xmB6bAdE86vnyGM7/OxW60
 I5MdgNrJPyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7MjLQAKCRDBN2bmhouD
 197LD/9GmveXsb6wEfYbxNJldhdd2NR3krESKTxD9Ac7BtG0DcRFnZD+01mej+wZXYlkH0puYiB
 j01gppqqRGPBtUWVhKLZdmSswCKiENVLwMW5bbbxDwM1AXdBWBQZW+Wyfme7jCH4RECh36oBK5M
 3GJmLU8XjZddp7QXSnBjinEyfafaq3yzPOoYE1K6KxtI2bu38IOdd3N5V1D6EJ/TI4rPoMnO3LV
 0/AuUXkMz16k/RTB2ejaNKZxK1OQRvSGHUhfQxjUhJh9E+9565JUI9JrqqMISD1SPT2igp+1qVh
 Pe4yzAaUwxovSqA5kX32PPPSsf9dOH+OXHIQpUIblfpcXHvo1Rhq1E/s4FOeDq8dql1y7wuY0V6
 DolxXgF74ye9tICanr+KukKy0za10BUqANnAqZuS9O9b74MwOzspzSW+/dYCkMLWf+U5QpOAKQd
 1q+V9+SsOrb46v7LHwcO3Ls5zI4+iT48neepSV0UAjJm4LgJyVZX5YHs8t01Z+ZiGm3y1WCXwJy
 SxOrqWc9CBT4dIkt7NDufMR+sCpvAIDxfxeVOE013rOD2UE8euqg5+Y/qyXdf3Km1LvOLXpdu9R
 Jr+gXpLhJNrTqcXV3Mx1XLT37qo/OlfPTOzyq77VT1TsUO3QPLHzY7/jcFCKvC7ejSSu1awU9tM
 s8gxUWI5m2V/lFA==
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
Krzysztof Kozlowski (4):
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
      drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk source
      drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01] bitfields and simplify saving

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 64 +++++++++++++++-------
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 12 +++-
 2 files changed, 53 insertions(+), 23 deletions(-)
---
base-commit: 883d3876ff4bb50d1b9431f525b4d3b257ead6f5
change-id: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

