Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC95A6A66A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 13:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3E310E06E;
	Thu, 20 Mar 2025 12:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mr7VLAHE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DB410E06E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 12:47:16 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso5024415e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 05:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742474835; x=1743079635; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BdG/4GC9LsJW2kwZwtzr2yUeLZyKqxiHIgM4hbUYaLU=;
 b=mr7VLAHETBk0wi9O14XYhDLl3Ar/qUO22ejN/TNo/7nb8jopW7RSvkQC1jVirp5VSF
 pIm1PS0NntGE5VQsUiR0gznK9msngGdla7pXFL2j6OesuYQNQmtabYNb1kg2he8BxmyJ
 peHud/QV745uLM8yvkaNUFfZ+DApM4aTvEsXh7fxgbnOrDaiwCCg97gEQHVUuYy1mal+
 GgevbEfbu5gylFX2+NfLswszDc7qt/8fgb2WwkpJtt2R6kGbOhhXU3HLUcQ6Ds2YEDqN
 kY11o9bEfkByuj+rLRj+oFT2L6IV8hK+9QdsVb/XbTrx6DY5OmC4oIL7+aIoF1xauL7g
 TQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742474835; x=1743079635;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BdG/4GC9LsJW2kwZwtzr2yUeLZyKqxiHIgM4hbUYaLU=;
 b=pXFhheiwvzGu62IgnvYEVSPJ8+0sVhGhU8uakHFQ7ISuNk/VO7gIGTzGF/DLe+/y8f
 tJ5F9EJeDwLix086ZaffG3+sApanSg/YZI0H403PiCTUKnp0g86LHSw8cZ4lXTXdHdTq
 jDBt1JU+L/YJpDHfVjn4PNaWs5QeTrndQ+R0j89ZXVrecOii8J6aqfTJnwcmsF6SJHov
 x5cKMHTG13LQaGc6wO+moMSBvUS7HIl0090pIeir5ZfrxfqShZRvo4jBZ1wJ87uiByhm
 HAs76lRsGz8cbzDzL1tAIVOGCsWTfPIludr0/w+oFDhj0lEhzkZUzhkeiblD/alK9vvj
 WwRw==
X-Gm-Message-State: AOJu0YwVds9lAGf4l/Q1c0Wnyalpbqbbcub3FUFJodzzZkgGoUAtm1fL
 p7rPcuOC8On98i+bj0X1yezgrDiIYB7YfLtq6OmJV4ofO7w46X2Ev+d2dYAnGFA=
X-Gm-Gg: ASbGnct7xY0TNPkdnbXXn3LoH9lBwhvpR14QWD3tx5GRb0js76lXl/r34iwTg/ahb76
 573VOpPIZoRrV4nQHd4G+2Eu6JqDVVntgjkDLxKkzEFbkLs/xiWxwaGmJpk/eUSdxY9RRrSmzw2
 pacwBnzqcS4C/49hCG6Xw0ImYyJ6O0uQqf3I0kJJflpcPCNi5eiN3yQswtxezsmKQCJ0n3H7161
 Ny7Vmpv5OthF7Sw2MF+sOH5gV8hKg2AmPbSEukACugAzgmgTuJ8C29blcRB0950XkEtJilQSKwg
 cxrsIcFyU5x+iPSt/3MtSy8WN0I+EHKcYzRo9MOijYxknZHwQZCYXl++
X-Google-Smtp-Source: AGHT+IHax25gLGxpdHS3niMwhikkYrx+VMfus6GYJ2qGjlQ79/dfHY3I2/Q3s00DhfenLy4B+ToVjw==
X-Received: by 2002:a05:600c:3c87:b0:43c:efed:732c with SMTP id
 5b1f17b1804b1-43d43869a27mr42567655e9.28.1742474834948; 
 Thu, 20 Mar 2025 05:47:14 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43d3ae04a94sm38388815e9.0.2025.03.20.05.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 05:47:14 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 20 Mar 2025 12:47:09 +0000
Subject: [PATCH] drm/panel-edp: Add panel used by T14s Gen6 Snapdragon (OLED)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEwO3GcC/x3NQQqDMBBA0avIrB2YpLYFr1JcJJmxHdAkTUori
 Hc3dPk2/+9QpahUGLsdiny1aooNpu8gvFx8Cio3gyV7pYsl/GnG5L0rHPAd0oofM1RMizBmF2V
 Bfx9mYWv4RgQtk4vMuv0Xj+k4Tlq6s9VyAAAA
X-Change-ID: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2279;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=Kv6DgyEwXT4LlaYHVxd/YFFj4oxV7X45VzT1+nxkLTA=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn3A5OmilO6wVWLD2IchkPEH32d9GORju2oow2K
 GHkUWav6caJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ9wOTgAKCRBjTcTwaHBG
 +KzXD/wKeZCjsO/kY3JRX16qfzcTBitBbnvq2L1FdNOkEtd6psctULBRORgPXNuitGOyIpek+aS
 PApwfKhgyDAztvUmYZ4Ns04HXwsqzIG+4Yw0q1/JH/lTILreZN0GJwxpTtpy/QQLdL9+d/iQzjB
 vM825x8v/gkOcmSTsJp/2qeYc1IFSpFwdiqM0Rmr50m1ZjLfYgxCx6X2jd7uhOwRN5mEK8FfiTE
 pZrx3Gs3hYd3S+uUyQ6U3kOBUDjIGF+DcALlWWZNhvtthl4zO7xmfIHdVu/k3vKGfO4pq5vWVmm
 EpsdZ83oJdQv04z01/r6bzczYpB9qcVX6mBR9n78StzLa1EhQjyq/Wic78SiYLuftGweT9P9Njd
 Q6kNOpT+BYDG6uR9ZjIQDPR9uUPW8XzDqRSwShy9rMD1JVrKSXAK/2bc3ha8qDInThOYcdxOFY/
 Lq/puf9W0tq7oxA2vrZkkcepFxymvACTM8nbhk7RuX2b3NDNzUF/f8zySvXkp+yW4XhbHBxGGxi
 q7fNS+twmdUMNFnN2K8qFhc1ERo/V2PPCtPuehwwOwjF6kRzRubLFseC6JOBbX5f/putOKW0+MH
 PCs8mHg9JGbiTlLKBRV9x6qcOMs2VzN/pDbAKSbZZXZ59BZPilgIIAP2rh8sV8tX17BU57hCTE4
 PrExDZ9VjoVaLRA==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
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

The Lenovo Thinkpad T14s Gen6 Snapdragon OLED model has a Samsung
panel. The kernel currently prints a warning due to not having the
correct timings.

This panel appears to work with the default conservative timings,
so add the OLED panel to the list of supported panels with default
timings.

The raw EDID is:

00 ff ff ff ff ff ff 00 4c 83 9f 41 00 00 00 00
00 21 01 04 b5 1e 13 78 02 0c f1 ae 52 3c b9 23
0c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ca fe 40 64 b0 08 18 70 20 08
88 00 2e bd 10 00 00 1b ca fe 40 64 b0 08 38 77
08 20 88 00 2e bd 10 00 00 1b 00 00 00 fe 00 53
44 43 20 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 41 54 4e 41 34 30 59 4b 32 30 2d 30 20 01 cf
02 03 0f 00 e3 05 80 00 e6 06 05 01 74 60 07 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b7

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 52028c8f8988d4b771bd2604256aea4cde4f4020..56eb57c8023fbbb5ba39f5fdbfa8e577400f751a 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2008,6 +2008,8 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
 	EDP_PANEL_ENTRY('L', 'G', 'D', 0x0778, &delay_200_500_e200_d200, "134WT1"),
 
+	EDP_PANEL_ENTRY('S', 'D', 'C', 0x419f, &delay_200_500_e200, "ATNA40YK20-0"),
+
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),

---
base-commit: 707bd8cceaac1af31d3eeeee166687bdde580fd3
change-id: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>

