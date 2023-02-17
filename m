Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C2869A8B7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 10:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DA210E8B4;
	Fri, 17 Feb 2023 09:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A350010E8B4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 09:58:20 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 e4-20020a05600c4e4400b003dc4050c94aso540173wmq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 01:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sEERacWPQn5HQJtCzUxWfR99VAovvx/3XuSHotdsRHA=;
 b=VPfE02aNCEYuXI0BCFH/J/s0URGJAw1PLavr3tDV711YPEeWPH98hBJRIwroJjxZgn
 aG9CLxjlfVeTp4SQKm4/1lwUeJplMDe28IES8FHuuD7z1ixLRyMevmPWe3SooYBLD9pB
 LXnanCo4IdXuRY0SewX4G9qwGCPHSH58mMiKW7bIrZa8q+9WrRST08jpP1hDUWfKvOnR
 lv+/26UBPKPACPwtY1bhddDx5JbDSqJmCG+HWALfR0H0zMzyocffpIKB97t7BjU5zwxZ
 PL9OcIaU2zjQblKbCPIG9r49WbIxPuqsGdY6ILhmrqi340VCv437cJjyIYuRoFzbiTUO
 PRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sEERacWPQn5HQJtCzUxWfR99VAovvx/3XuSHotdsRHA=;
 b=JMxyvaFoO221a5p416A3Xf9sEYOa6gQJ1KnCKmP6mWUfJuXvBTyYk3bPZAfiLXnXUa
 ada6HcaGe6DRny/xTxa0tuKhz3ltN7lz4IMgqIHG0LsUFqNB1+jIu0D6RvJb3NI0GSGm
 eCGX4kuzGWE1D0jg7ZnM0v21nMQbz6VTx9SQlO0H0ZKWfULmmo4OSS+ohfApM6qRxJHL
 S/DCWeEDHM5pDyK+8ZlHhoswZpEpoBKSNsExLrLoqcYT2PkdVsAIylOF97krdE0QH4xR
 GGBpE7CaraEzYQIxqAgHertWX0Sb5+dwJ7IrS2SFElxUJwjKaSdCTvZWwoQrQ64tDTdh
 ZEmw==
X-Gm-Message-State: AO0yUKVRqCaB6fvgMFM+gcwei5iVHqX+s0jIlzgvavIZSmulJr1HLuSX
 siPnA0QdBYnvfCmLJJPK3EaPhXaWRSqSCQ7tSRs=
X-Google-Smtp-Source: AK7set98dRwRGA+mF2mTJNO2SDS7s1bSCUU7DPOpc9FRVOv722JlsCbRvWAIKDMtjxzMLB2DG+Hb6w==
X-Received: by 2002:a05:600c:130e:b0:3e0:9fe:34dd with SMTP id
 j14-20020a05600c130e00b003e009fe34ddmr769809wmf.4.1676627899023; 
 Fri, 17 Feb 2023 01:58:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c510f00b003dc1d668866sm1172044wms.10.2023.02.17.01.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 01:58:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 17 Feb 2023 10:58:15 +0100
Subject: [PATCH] MAINTAINERS: Add myself as co-maintainer for DRM Panels
 drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230216-topic-drm-panel-upstream-maintainance-v1-1-ae1cf9268217@linaro.org>
X-B4-Tracking: v=1; b=H4sIALZP72MC/x2NQQrDMAwEvxJ8riBx2xD6ldKDYquNwFaM7IRCy
 N8retjD7MLs4SopU3WP7nBKO1dexWC4dC4sKB8CjsbO9/7a+2GEthYOEDVDQaEEW6lNCTNkZGk
 WlEAwxntA8lMcppsz14yVYFbbFrPJlpKVRenN3//583WeP+ORfpeMAAAA
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.0
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
Cc: linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as co-maintainer for DRM Panel Drivers in order to help
reviewing and getting new panels drivers merged.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index be167c695c64..18fd7548a49b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7043,6 +7043,7 @@ F:	drivers/gpu/drm/xlnx/
 
 DRM PANEL DRIVERS
 M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Neil Armstrong <neil.armstrong@linaro.org>
 R:	Sam Ravnborg <sam@ravnborg.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained

---
base-commit: 9d9019bcea1aac7eed64a1a4966282b6b7b141c8
change-id: 20230216-topic-drm-panel-upstream-maintainance-6d5cae28d184

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

