Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FBBB1775C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 22:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ACE10E2C3;
	Thu, 31 Jul 2025 20:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qXe9rIZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0CF10E2C3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 20:51:37 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3b7825e2775so789608f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753995096; x=1754599896; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ar6Wf1+UMHorH9TBZzw9vPO4d3FUGtgqbxwITenQBWI=;
 b=qXe9rIZD+p6H0t4zhvb13T/XvLC7NUfwK/1vYX2XGlgZue869yjT+1fqrMjMD6qCVR
 yCLIMyzeNQcEZtnK2fTvQ0DnmMynNcx6DqQZ4kvsmPHWxLwRInYaitltoSmTuKQLLHOR
 igyN19DAeQpl9hHtFcbOjhkolzEoCxCX+83Jpo0RFLCGA+5Mi3HnvVcLbYHs71VtZlkW
 lbnOrGxC1ojywkXcdm7QqxI1qekLxYSUeKyLafJ/sK+GlbfxU7XuDJVLbwwAyGfgfDcW
 cJV+Jr1PexN8GuPvZlHe7+A+7FagaQL8eY4wsj+7Krsk8/jCB7sngcAdY14rHe63ANJH
 OqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753995096; x=1754599896;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ar6Wf1+UMHorH9TBZzw9vPO4d3FUGtgqbxwITenQBWI=;
 b=DUHROE3p6CTlQDj6UqTR8UyVr1sAbiQm5HsrCcUphzAshN9PbdyWWiT6eTOLL48QZE
 6+Z45rDiU7PKskbayCp4Oo/fuZpFamkDspspuO2pbm5A7DaXesa5RLesj9QpipZUCY5Y
 spxyKwub39VNPYjU8uIz2nR50XkvgCesokvlYdUXtGOt8A6UvXixZx/tivWvg9RuM0yd
 gpYgtK0JKRRhHYevvUrKkBF8Kp0TD/yZVIKNZ+bh4NzsdHkzD6Yat9/896fXKtgB4MVz
 viYTtcfoOAN4wa9cLFF8uKLUCrhuEjqYESG8VBlAsTfl5a20ob5yBrfz8WQwzBlbHnYW
 gW+A==
X-Gm-Message-State: AOJu0YyZKzx4GgCGSHkD1CMZZwNKcF5olFL/ePEI3wjjo0reRoeA65Y+
 iAUpttEd7EWua4CzfxRyVtjZG4QVQpIy6DeTlWCLEPX92EK6jVSctJUGDWNMcwK8YAg=
X-Gm-Gg: ASbGncvc9Ja+7XMiyyQ7psBqexJJac71DkcqiWQHKlcN4tATYNctxMClbkkCcizY0Ko
 4aN0D4cquriy8STAmwW306+wD2pjwTjQobkKdZV/khxi0U6TIfNtS+nbHJ6SVU+6Wn+sNwO3wpJ
 6hD3OdQVUQ47goBQ2RWq2v+1wcP2aJ2JxWHck8evqnfYH8gYvGH23cBKUOm95QqXWT1BV5SHG5j
 nfaBLRstUFZowMCQy6dmCRx/b+p2tSh5bRtRUo4H4vmJOd4KNduu9HsV/MKsNhcEqL1aY/JAgUJ
 7hHD/kawAGTAb/S7eW42mSAGJ5M/+/OnzE6A7SDiyW8k0oD6bBfDELUXac2fCmtoUfkr6x05lj5
 JOY77446FE5paccXL8U4rlLaxuWGtC1JshqfHEswBUxZTP91cV+HLpm8AM20bFit2
X-Google-Smtp-Source: AGHT+IFIePr5Jj5OhjHaF2q0jZu0ma1dALBYhn0dPVtkAtWcQLW31eBDUhN9HgwQFxQvXyzTDIwRcg==
X-Received: by 2002:a05:6000:178c:b0:3b6:c6b:e4e6 with SMTP id
 ffacd0b85a97d-3b8d343c2c5mr203792f8f.11.1753995095656; 
 Thu, 31 Jul 2025 13:51:35 -0700 (PDT)
Received: from localhost (dsl-217-155-193-229.zen.co.uk. [217.155.193.229])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458953f8e0dsm76953885e9.31.2025.07.31.13.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 13:51:35 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Subject: [PATCH v6 0/2] Add support for OLED panel used on Snapdragon
 Lenovo T14s Gen6
Date: Thu, 31 Jul 2025 21:51:25 +0100
Message-Id: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE3Xi2gC/5XNvW7DIBSG4VuJmHuqw1+IO/U+qgzAgQTJNS5ET
 qvI916cpam8OOP7Dc93YzWUFCp7291YCVOqKQ8t9i875s92OAVI1JoJFBqlQLimEbJztpCHL58
 /4cJVhdwHgtEOoQdnVAwkOO0RWWPGEmL6vl98HFufU73k8nN/nPiyPoFPHDigdl458nQQ9r1Pg
 y35NZcTW/RJPIp6gygAIXTOG9+RRO9XonwUzQZRNlFp0lEYZWR3WInqT1QoNohqEbmzMsoGEq5
 E/ayomxijlFERosD4T5zn+Rc39nddGQIAAA==
X-Change-ID: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 devicetree@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2698;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=07lfiVTzO8Livfg8raQix3qM0PvBmIv/XbKbd6whLj4=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBoi9dS5IzossHJXPMyK5mIJ7/oNr8rSeV77nuA6
 eCuTxYwEvGJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCaIvXUgAKCRBjTcTwaHBG
 +OE5D/444EK+ZjVRzMRSYbjvgEpcG0ePJFPavJ0ohg1DwGrFmFxfSjzMkxib5L9fkuDCdeOLZF8
 vE6A7rqUqzDN4VZieVP/1OE0rvMpKW5LhHamAbW3kBIuG52XLVg3awX9evxEOgNDuRyODAEpskW
 2wKdu8/0Hv4NX1lgJFncBCchg1YXKx6+O90zSC4xeHsOLGBCdqvoF5oAvqqVkciwvXvIe9oJjQ/
 c8S3EfdQ4UjVe0ONIgwgdRLj6Kf7Ykk1wC0wWmgPD1rE+U5Ynbe6wjxB+eUPGWDsPs5Bqt9CkCV
 eliRcAd1fbHYaKJwtkQVC0qMxwTW3axz13JnYUtXjt40YsCGyXwKp8QZCPvK+qzCetVUHVNSve9
 HrhyvB2GvhRBo5LMx0xIsCFKiTrYajvnb7Q8rtybZZKX3ktDnLUzCPQeB9htE885p7kYxqLoOA0
 XqsZWQTluaa+pLk42g8ub304J2ZopBUACUXwwpg64pBv1hY+bp5U8eTUfuLe+Xw6XQMeqyrBaV0
 IjSPZE1bZwJu1+1IqKU0EcOygVZREYoXeEXWQ2ARcpIk1D++nP67Y0eB36fDPUHezC3sBDfFIL6
 0lkJXAVeMSdPHQDU131Nu7VMX+70reQvHM3lXVeOazj4J4BGiFB8kF8dQv5Pwno+bMJslTiVQB6
 G92zNF/oqLKjXaA==
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

The Snapdragon Lenovo T14s Gen6 can be bought with a number of different
panels. This patch series adds support for the OLED model which has a
Samsung ATNA40YK20 panel.

With this patch series the backlight of the OLED eDP panel does not
illuminate since the brightness is incorrectly read from the eDP panel
as (to be clear this is not a regression). This is fixed in [0].

[0]: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org/

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
Changes in v6:
- Squash patches adding "edp_hpd_active" node & its user (Johan).
- Sort new pinctrl node correctly by name (Johan).
- Use correct function "edp0_hot" instead of "edp_hot" (Johan).
- Drop review tags.
- Link to v5: https://lore.kernel.org/r/20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org

Changes in v5:
- Move edp_hpd_active from T14s DTS into SoC DTSI (Dmitry).
- Link to v4: https://lore.kernel.org/r/20250402-wip-obbardc-qcom-t14s-oled-panel-v4-0-41ba3f3739d0@linaro.org

Changes in v4:
- Rework HPD GPIO into eDP device rather than panel (Johan).
- Drop review tags for HPD GPIO patch.
- Link to v3: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org

Changes in v3:
- Added review trailers from v2.
- Dropped dt-binding documentation patch (applied by Douglas Anderson into
  drm-misc-next).
- Dropped eDP maximum brightness patch (will be sent in separate
  series).
- Removed duplicate nodes in T14s OLED device tree.
- Reworked WIP comments from commit messages.
- Link to v2: https://lore.kernel.org/r/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org

Changes in v2:
- Use the existing atna33xc20 driver rather than panel-edp.
- Add eDP panel into OLED devicetree.
- Add patch to read the correct maximum brightness from the eDP panel.
- Link to v1: https://lore.kernel.org/r/20250320-wip-obbardc-qcom-t14s-oled-panel-v1-1-05bc4bdcd82a@linaro.org

---
Christopher Obbard (2):
      arm64: dts: qcom: x1e78100-t14s: add hpd gpio to dp controller
      arm64: dts: qcom: x1e78100-t14s-oled: add edp panel

 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi     | 3 +++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                          | 5 +++++
 3 files changed, 16 insertions(+)
---
base-commit: ba94ec807b071becbed7377f8c84308f1b6ccd51
change-id: 20250320-wip-obbardc-qcom-t14s-oled-panel-b74fed21d600

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>

