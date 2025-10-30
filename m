Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7FEC1EFC7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 09:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61B510E259;
	Thu, 30 Oct 2025 08:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D8ITF5Bs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F4D10E259
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 08:28:32 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4770c2cd96fso5343285e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 01:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761812910; x=1762417710; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Mjv/mI5BFccldzshy5MSYEzFfXICyD4SC9MV3bSUtY=;
 b=D8ITF5BsWVfomY6yWH2ma6HOQTZA1XwQ8pTCp8ZvG9u9BEXl9SBd9ZiwKoewT6IZYJ
 wyt7k1BcOuBwszr+NG8bpebZW8/zvwxFptZWMz22wHlgTMko8cZUypL9z/Scu9Pcv49T
 6OYRUzDQ6cVI4R33mzHrgkYFvmdbPm9AyNZaqQAbL+7JCKAwp+QSGo0yvMkEmjQyM7Bf
 bQOTADUcmTUfdayDREflMPuh1oGL5F8h0y9wWYKKdfG+vh93ca8Ix4aWS+3RQLXmC2S3
 OsOkbwUmwTuUhXV6fDTObTaggGoya2LUPVxeeRJl348L/vUSOm2ZZRVKimr5C+/DUoy5
 v7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812910; x=1762417710;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Mjv/mI5BFccldzshy5MSYEzFfXICyD4SC9MV3bSUtY=;
 b=B6dXSBGTKbbkMBlXExDd65712HZNR6VZc72XOA5npzbTbTlngLxrlQdc9TQGojXfWc
 esA4fVn7ToIJvRKS+fMlyW4iwFsZ8lSrmS9nxkxw9tl3gdzjffX1LcOZNuQ+Ag9tdHBf
 5DrTkUFPT8TckqiBGBXtz7nPMTqyPk0Y701V1Gy9JUybQcjDmeUvdzqpgfTUW77jW0pe
 MYF6rC58L4pSGMtskUcmdinn5l7DGnxKZRlVpMzoeTzzVsgDzA2osTUQFbi9l99FE2f/
 dePdF1U5cj6yS2MPJ4VBftV+sT/oayakv/Gfx/v8OVWPV1OVA5cGKxmG55yPQbagYS2b
 CNBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvUEL5+LD9AdGsE91PvAj2NwlpjNYRaxaJ0eVuCBGsaRIqhWtV5/8CKrIOixZtV/vIJy8TLEAS2jU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKlylm24gKuNyk4mCoqkftThGB2arZxwc//wITJtBeCWYRsi5s
 Vf0ORg88MhcomfzEfgiQezRvcN694s5wVIqD8HhHBgVS5uNc3FyQFr8u60IlJ6parAE=
X-Gm-Gg: ASbGncuot23e51tdMtHF8wYmjmsBHKDq3KXcF93JKd1HaqtaKP1V2DZJMiDDpedyR+t
 aiF3NMJStTZIvlaIxCIVKcCf+n/slCqoYuWgMp4cW+YLj1SFjm8kj1hHIZ6lZ232Bm8P/JjehFp
 dPD7dXnAVqHj+/ZtWPDFHU2IzcAx1iWS6wwRVZ9Rk/UgXGPiuntB9+3NeuhrQx9/yFU49RLIz7l
 Yax5RcwhVY8ITujmTiTIj6xNQll5Q1IbsjAoVzRqBo/vYpf9BA6jDz+x1ko6mglT/YREJRae4IJ
 u8nIX4k8+iKO9CkuVeWCba+SryDgFiQI5UGISL1CmoI2nxgadjb2pty4BJi5CpX/JRQE6WZrva0
 SQ2BOmkYxhkFACi2T69ujDSEhkCDcIrmdqw2AYNha1y89qb1NEXA3OvLu3AteAXA6SJl9+oeb4w
 Hvs1eXQvgyqbPtrBdlGtzz
X-Google-Smtp-Source: AGHT+IGczJn/fMEIsl/rHW5yoJK+KxbzxustnUgQyyE+F3jHyHlmTynOUlbxPX1LfVKi2syKVAQ/sw==
X-Received: by 2002:a05:600c:8418:b0:46e:4586:57e4 with SMTP id
 5b1f17b1804b1-4771e3f0015mr48851245e9.24.1761812910392; 
 Thu, 30 Oct 2025 01:28:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47728ab375asm27376475e9.17.2025.10.30.01.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:28:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 30 Oct 2025 09:28:28 +0100
Subject: [PATCH] drm/panel: synaptics-tddi: fix build error by missing
 regulator/consumer.h include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-topic-drm-fix-panel-synaptics-tddi-v1-1-206519d246e8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKshA2kC/x2NywqDMBAAf0X27EIeVrC/UjyE7GoXNIZsKC3iv
 zd4HBhmTlAuwgrP7oTCH1E5UgPbdxDfIa2MQo3BGfewxhusR5aIVHZc5Is5JN5QfynkKlGxEgn
 ysNA4TNFZb6CFcuHm3pPXfF1/1YcHlHQAAAA=
X-Change-ID: 20251030-topic-drm-fix-panel-synaptics-tddi-e4fd649c2130
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1264;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZZhXi05WkmNlGkvmP9vNdVB8Wq9Bva4vLNsdz9mU/9k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpAyGsY7RNnpoDJFzOE5D6/srtKrtYKnF9n65eZvvE
 4qpPJQOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaQMhrAAKCRB33NvayMhJ0ZHCD/
 9YGGZTJgC+wXEy9I8CFzzWN0xi4NFX1vnZ6meY7qz8RotVLOcacu5hFz0MFpc2HPkzQg+KrwykeR6K
 /KeEFMPi+8CuVYOFXrvcStvaU15CRQ4Lyu+QpgutoC660B2euoX+683Fk9jM6tMzO4Jea4vd4FOygQ
 KI1/KOZFgRhp6awGU+JxY4HYsA9NF/VutDX+AK/y139To/VHIVsMYrAIPdYufhJ9/mvm/WxyMYtYbO
 Ur7UwO/cjwMtHT+aNdybET95rW+fi+8mFyqJlTkMeNXnlxaB9mu7YcxNF4tPvjEljKag3JfS4R/yww
 y5ePXeu+XfAAgkYF6R/yNqWvKooG59mCHQhPaQ8inozVIdphEZBA8WHSnLRw/p8E/3yyPj64H31NNd
 QHYvOmdRy4G7inuFWScuEYo4zNeO298K41CgPD3l69nO5qixmlc/XKToWiLSQhUXK/AdVbzRqXq5ZL
 pFgtCykBFnPvI97p/VNGlBQvgTYmllsr/loP0pfZILQBROcSFpkYe+5QK0Cbp/Co2rk08Bp5zsLyh2
 1wsrFYcTOuw1l78QG/fKjpqSsDaRD0ns8tsA3wyyKQkzlo2dFF7mvyCbDMVaKZKF8bGhLZ7vJqOvDJ
 qqLgQ+Y4ntHuM+HCYoGrZ1eEwlW0P8e5wwduHW5zhmUSh40KblKJWGZVhKNw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

From: Stephen Rothwell <sfr@canb.auug.org.au>

Fix up for "backlight: Do not include <linux/fb.h> in header file"
interacting with [1] from the drm-misc tree.

[1] commit 3eae82503f4f ("drm: panel: add support for Synaptics TDDI series DSI panels")

Fixes: 3eae82503f4f ("drm: panel: add support for Synaptics TDDI series DSI panels")
Closes: https://lore.kernel.org/all/20251030151428.3c1f11ea@canb.auug.org.au/
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-synaptics-tddi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-synaptics-tddi.c b/drivers/gpu/drm/panel/panel-synaptics-tddi.c
index a4b3cbdebb6c..0aea1854710e 100644
--- a/drivers/gpu/drm/panel/panel-synaptics-tddi.c
+++ b/drivers/gpu/drm/panel/panel-synaptics-tddi.c
@@ -9,6 +9,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/regulator/consumer.h>
 
 #include <video/mipi_display.h>
 

---
base-commit: bdaf9fa04946b9d1086d69b7269c113ace8e9f76
change-id: 20251030-topic-drm-fix-panel-synaptics-tddi-e4fd649c2130

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

