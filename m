Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A830D9136DA
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 01:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2360110E1AF;
	Sat, 22 Jun 2024 23:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CaVbewWR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CDE10E1AF;
 Sat, 22 Jun 2024 23:25:56 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-35f2c9e23d3so2612982f8f.0; 
 Sat, 22 Jun 2024 16:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719098755; x=1719703555; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1XFhrpr/qn0mm91IgxOnqVHLrq+I4jLwILenECz4N48=;
 b=CaVbewWRyopFhcA2FpDoDvNll52FdmpC0RyElT6sGOFpZB22gwmnxuFk0Vv7VPFvwf
 9+FAyicXQlaAzpkqBhvq4LTczOHLdhO42qw2+BGPc5/GI4FcEytYtPg8gRL0PlQINDES
 ygP5DdpuHflvctW4H8wOaIR2ZSu0nnMrspaE3VDiKkRTBkhkHUnbWUxu22Q1D9Q9xtDM
 C9NutFi6JNsr32uIn8lhXwF78iuuecY5wFqNuH1G1SbmYygRw5FiSjKOHsiZrUg2PPu8
 0D6Tvk7kt8MAl9+ei0GEfdR4D8qPKYog3V9zYV5Ics3qBDoEeU0DNBgPvaeXb1lZUqiH
 6TXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719098755; x=1719703555;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1XFhrpr/qn0mm91IgxOnqVHLrq+I4jLwILenECz4N48=;
 b=BIqVOrXiGA5n1pHecym5kX3/C3jJ8EOY+4KyFlyHezxHG1pL+uszii9P8gzFgfU8gu
 /JUwybtfXX+xizF3eJvsM9S1P+xCapl4wuqI5B2i7j/tjCAxDwTuHdFCu2L0sOn/07/V
 VJUgAnQiKrBaY1i2jjxZAJWYYwSDOMs0MLlul6bSYiLyYBGXAUKN1+9B6znU+d6ak8Ee
 /aGUYln1c2UKXnU27/+L2ECLvYrs6l0NyWFGyiwkFq48MZ1aYzVUX9eMfSCRaj73hQm4
 /nNmg7qCJX2po/jUjbL/w143MlybT3K1zjY5tG9mUrPhCt8JbYw0DJkDyA7jqctjb0MJ
 2WJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEjLMAxDTzUvZSqfbTXn8NL/DTRGxuQYqNNss5hmCSQZRQKg8fK5Ax0sLUgOEn9nQ1YnyC664VWapVT4qFQcXZmR5PMtZKTHSZruMez1vEo5l4Y/NWr+8dhK8mGenMfiw4+r1u5ae3gm77LGzgcdGJ
X-Gm-Message-State: AOJu0YwUu1r1dy+AXEjhCWjlDAx5bEEPgNIrj9ZsEV0JV4v0Mkup9n8W
 cm2pnYb2PWRxDJ6XcXn8w5sNY0RdLK+q637fsq2QZfje9wAhB0Zi
X-Google-Smtp-Source: AGHT+IERaYMQYvY5/RJh2ZzxyaVVENtd4pMEGEL3xCcdxmEeMraPnma827Y4G6+IKY86Bl6iZD3AXA==
X-Received: by 2002:a05:6000:1a8c:b0:363:776:821b with SMTP id
 ffacd0b85a97d-366e31bc9f4mr2237353f8f.0.1719098754835; 
 Sat, 22 Jun 2024 16:25:54 -0700 (PDT)
Received: from [192.168.1.90]
 (20014C4E18129200DEAEE2020304A5A2.dsl.pool.telekom.hu.
 [2001:4c4e:1812:9200:deae:e202:304:a5a2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d2190desm120301875e9.48.2024.06.22.16.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 16:25:54 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Subject: [PATCH 0/4] MSM8937 MDP/DSI PHY enablement
Date: Sun, 23 Jun 2024 01:25:50 +0200
Message-Id: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH5dd2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMwNz3ZTiTF0LU8PUpCQjI7NEixQloMqCotS0zAqwKdGxtbUAZzx7tVU
 AAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>, 
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.0
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

This patch series adds support for the MDP and DSI PHY as found on the
MSM8937 platform.

Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
Barnabás Czémán (2):
      dt-bindings: display/msm: qcom, mdp5: Add msm8937 compatible
      dt-bindings: msm: dsi-phy-28nm: Document msm8937 compatible

Daniil Titov (2):
      drm/msm/mdp5: Add MDP5 configuration for MSM8937
      drm/msm/dsi: Add phy configuration for MSM8937

 .../bindings/display/msm/dsi-phy-28nm.yaml         |  1 +
 .../devicetree/bindings/display/msm/qcom,mdp5.yaml |  1 +
 .../devicetree/bindings/display/msm/qcom,mdss.yaml |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 89 ++++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         | 18 +++++
 7 files changed, 113 insertions(+)
---
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7
change-id: 20240607-dsi-851ebb226a8d

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>

