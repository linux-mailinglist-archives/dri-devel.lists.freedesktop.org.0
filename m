Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673AAA23F58
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 16:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136B010E3FB;
	Fri, 31 Jan 2025 15:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bPvcSk7k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE2010E3CE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 15:03:21 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-436246b1f9bso2968585e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 07:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738335800; x=1738940600; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KfhNXlBVSPOAhrzoDNzwgTxVG2wC1I3quOzSh7mjUbE=;
 b=bPvcSk7khhEeXA3vCulfJg12KHEhKxaLX8myY4qNCn5XfxB2lc7yzzdW/PCu41LqZN
 Cd14H+M0g/HWia1A/EycUVznP1RXp8r1/Ut/wb7KWwK8Gulk2wK0W0C07C2ZrEtm723a
 ybpCUY73KAfZRhLP1c0ul2m/YTy33kowv7m1Mh85gan+WWLGpT6hfrjE7dWIkU0UCX+o
 C+C2ChNbalg5FTQ7zKUQzSdqRLKlaAuRgjF3VPg4eFiyFEdd8RCCzPl/5YsLLgh2zTVk
 MIhNh8lCOTsSCui0C7X9rLq66K8aRHH+KQP49Pf3yCw4nmYURryQ501YWZ2K9hebLXQo
 ySDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738335800; x=1738940600;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KfhNXlBVSPOAhrzoDNzwgTxVG2wC1I3quOzSh7mjUbE=;
 b=hrQTGYixfZmyVQkzV26l/PKrQPCWpA0bJ6VYji/jGgyUFAnQNinkjITeCwHLtSRT2v
 DYp/Tw7J/NGlVMj0Nwwz3SQ51qbON+IHfZNT+wmHog1TQ1k6W+tMVAZVNKfJILheLS3S
 Rkxocq6DOA/wwdr6c40ZzelE7qKPEDZfBNHDMVTvdS08ulmxNkEtWLOUqaS8ZjjZB/VX
 A1lGLr0F9Je3OQ1xWFVUyGfWO2QWjDkIqCPS7Z4N/f794UFgLFSMeEV9qaU5wB/s+xLk
 Q8Q4pSpHNPRi+piEnuoYSuYcktka5C5g/kASpwk/69lf2ifIfHLmCuYZODOO432q0nEk
 rbSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKp67/THJrlQrPieOPXqEmyr8Qcr+6hOx74/CvQbtIaTBKu1Al9bIupFdA5+WpvfIrOziiZZfVx/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycumVEHKzW5sGvjdWepf1MSbvsC5u4ChFV+5DjWpdqziC+7T4L
 /I8wtAzPJGqBMfqiAu246Cl6TXMNkoP/U2/AkjudYEv6wW5r4OBQko84js/IdU8=
X-Gm-Gg: ASbGnctZWHes5MQJ1/Z3b/R2wvGLOs7u0HMXkqh5XrzZ/tIwXqKj4DvcZHgIshV5Dn3
 WDmyvwsdXn895U3utrOiyr/az0m/xNLG/ukrS8QD/84YPwSVqkwJDe+DeldAiR93RrELzJphwsC
 9hX1hwu41L3fv9KIHlj5P3otcfyGrAbEbdMMZ9pCdPVE5iDlywowKMyTCPq7Rl29WuVulUTJyjF
 XoiXNT/SlR8KfL5zQNKz0cRCIXunuKxV10yHTH7XEBvixwmLt/tf4TNE1dz0YJcy/MUnA3PD5PC
 xrZwBszIULc3mo+YQnOWdgBx9wq5Qmc=
X-Google-Smtp-Source: AGHT+IHPnGgkYwPUj2l4BkoTVGjO/72Nk1bxY7vDjxwIQ8mRGo6Er8pjlk+fnyU5cwhkesYBHWv1gg==
X-Received: by 2002:a05:600c:1d1c:b0:436:1b94:2deb with SMTP id
 5b1f17b1804b1-438dc40d358mr40451075e9.5.1738335799159; 
 Fri, 31 Jan 2025 07:03:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245efbcsm56679925e9.33.2025.01.31.07.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 07:03:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] drm/msm/dsi/phy: Improvements around concurrent
 PHY_CMN_CLK_CFG[01]
Date: Fri, 31 Jan 2025 16:02:49 +0100
Message-Id: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABnmnGcC/x3MQQqAIBBA0avErBvIwqKuEi0sRxvIkhGiiO6et
 HyL/x9IJEwJhuIBoZMTH3uGKgtYVrN7QrbZUFe1rlSj0ErAkALG9ca4bbg4j0IeO9Kz08b01rW
 Q6yjk+PrP4/S+H0K0N1dpAAAA
X-Change-ID: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=803;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=SQxyJFMg3gBp7lSoZ7WOgJA3LdW1+oWZENbqGdTJsCI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnnOYoQAt8mGdV1azM597UlAhPWf3yQDkl9Y9b7
 +P29C0qprOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5zmKAAKCRDBN2bmhouD
 1wN5D/wPgFY8s6XvDVg8qIUESZsJ85X1ukKvm5xiUKKhSk6LNd25wzI2LLR241KBwwU1xqTSWvV
 5BEwKUIccSvpZNlD2aCBoH+A+hEAmYM84+NqCz9+EuXMlffywHmRDE6QUmm7i02dQMW9aRAaLy2
 70n2GZruBTHyQ5R9ttVmHH/dpeBjh0jPCPznP7KvLTovqAY5BkhvYt6NcxZZjqSzt5JbZci8WGz
 QSe/Gs4rNwHdo6NCjCWehEJSnQBz7Ba/NVAFics6s7zzg6C0hjUrC4FqxGsQg/XT6UW9uWQ+dRp
 C2qdO7ksoZ64/04Ohb6Tr1xvqVDY6ciiygYsz2nYyirXVT1rclvA4nwFrTGGXl5deq5F2ImELF0
 R9fvTukuk/XlNN7KeHJEoIXtJDgaXXUNodvajVujqGO5qcYst4v2MIHe/dyJxZWtnJ8PpcX7oIi
 dDKZaDGxREgamftrJ6IprEv4wzw3lSU2qNBoyR/oQualH/HozYiPfa6sSOxD4EriuqdbjsMZdSX
 XjCGeAs+nUJpOdqhfkbk3AVXs+Ot+9xQKk0CkbxZei0kZQIpvOBeiP8wtzm+3xvRMSvxl7uJQ7V
 AZeYI/0o7WK1NFTJxrFNIeT/EpZYTWb6XxcZQQVMlHLijOkkJDYQ86b23l0tcBOmCpQY1PqcBUx
 KH0mkZJwbxoR9MA==
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

Calling these improvements, not fixes, because I don't think we ever hit
actual concurrency issue.  Although if we ever hit it, it would be very
tricky to debug and find the cause.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
      drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk source

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 50 ++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 17 deletions(-)
---
base-commit: 375ef7b3d85d8b0fa72092642582ca5b95a64e67
change-id: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

