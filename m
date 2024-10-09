Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A53996F2F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 17:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C0E10E769;
	Wed,  9 Oct 2024 15:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BKKh1zO+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCBC10E769
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 15:09:13 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a9943897c07so615195266b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 08:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728486552; x=1729091352; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oQP4bXtAq110b5q+DlIMRj9A9FiDE9kHqNzGMoUSXjk=;
 b=BKKh1zO+qDDGILUqcEltIWtZcR27jYmgHnx4KK80GLqBCxlqrIDzG0VVKSEFzPMq+d
 VWXoDRvWD2Oz7OPQoSJ/dV9VduAw/QqOtQ3RgXNrjPRYIaC7mMRGUr8PnIauaVWqv5GH
 HqipyAIEoHeV08ZxOTb71oebJ9Egx15JAM0jd5xWQ4iy5mRnxFoE+r5WevMTCbU23d15
 OfMY6bGWSYIOSS5u6Rsq9t3HsxKY4tbzcVM4ng09Or8xAu3oLMiO+uGgKtHOa1X7szaA
 UhNwstktRVeXKgaSwNJIfsjMwYH0i6kU0R1ClD1DmClg/WDyPfclXns7IOFR1mTdzbI7
 kSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728486552; x=1729091352;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oQP4bXtAq110b5q+DlIMRj9A9FiDE9kHqNzGMoUSXjk=;
 b=OdhTWBqherokOXi6VeIsCNsl5lE+VPmZl39kRQK/a99ao09dhkDM6Q9tzGKNfnv4CO
 x9s5Xvx1t396eRCP+kcMfXf+dm0DYB72iMzTYwj1FYacaccOq88iHwGSTRvUKNm5pVSg
 X09Jtm3LyjcMR2AQngoNdkCZlMZmDEps/eKyckmN7DGOVBYiscuib2YA8F8mwo42ngJT
 n058fupYVNWnwdSaNauFVWVrvQfkvIrL+dFx2Hfudlu4qyjcxB1VcQIMgtlBYPYPgeJY
 bf3MtH97biY3MvZupTkDQL+72RsGDtp4GHMLlbQ59UjcuOpQ4TIJHzQkJchI9tfHInPh
 AfqA==
X-Gm-Message-State: AOJu0YwceKCPG7q7NCDGAvelALl5Q6wFEA+wfjftfEetX2QJQbJiULWN
 ipjQ2GAJ/RII1iIE7PTZjrN9FqPoHeIgj0PwcqePNiyfaHsHNWnI
X-Google-Smtp-Source: AGHT+IGuHAJ47CR9GiJkLEZhWahghIZ3BqZ+9vXKxjyRToKYctVTabsiExnAX6CeyRDQ2/zzVo+bSg==
X-Received: by 2002:a17:907:6d10:b0:a93:d5d3:be4 with SMTP id
 a640c23a62f3a-a998d10e616mr248485966b.13.1728486551483; 
 Wed, 09 Oct 2024 08:09:11 -0700 (PDT)
Received: from [127.0.1.1] (leased-line-46-53-189-107.telecom.by.
 [46.53.189.107]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a992e7b19b8sm668861766b.154.2024.10.09.08.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 08:09:11 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v7 0/3] Add Samsung S6E3HA8 panel driver
Date: Wed, 09 Oct 2024 18:09:05 +0300
Message-Id: <20241009-starqltechn_integration_upstream-v7-0-9967bd15c7c5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJGcBmcC/43OTWrDMBAF4KsErauiH2ukdNV7lBAkeWwLbDmVF
 JMSfPcqgbYhm3r5Hsz35koypoCZvO2uJOEScphjDfplR/xgY480tDUTwUTDgGuai02fY0E/xGO
 IBftkS705nk+5JLQTdd6AUcyJDiWpjLMZqUs2+qFC8TyOtTwl7MLlvvtxqHkIuczp6/7GIm/tz
 6L5f3GRlFGUHQAIxrX17/1kw/jq54nc8KX5A/dcbgCbCopWYNcqr4zWz6B6AAVsAFUFuXcMG4k
 gZPcMwi/IGdsCQgWNlOD2vgUvm0dwXddvV+v0xtgBAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728486550; l=1745;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=I+WsgUKzSR0TDVGgB/Wo96lC4fF+rUpQR5yl1SaHv8g=;
 b=yOVZmBTtbV56rqe40KXX5uPiGp7C4iqXQQmSlTVtO8Cebg9/Ntn5c+HM4KSeUf8jOLI5K8k4x
 5o3vEmQXznHAKNBeZeBxsiO48E3H6/DoRQni9Zesr64IagWYX8POrFI
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
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

The s6e3ha8 is a 1440x2960 DPI AMOLED display panel from Samsung Mobile
  Displays (SMD)

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v7:
- fix kernel doc
- Link to v6: https://lore.kernel.org/r/20241006-starqltechn_integration_upstream-v6-0-8336b9cd6c34@gmail.com

Changes in v6:
- add new patch with mipi_dsi_compression_mode_multi function
- Link to v5: https://lore.kernel.org/r/20240926-starqltechn_integration_upstream-v5-0-1cb0e43e623f@gmail.com

Changes in v5:
- Split patchset per subsystem
- Link to v4: https://lore.kernel.org/r/20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com

---
Dzmitry Sankouski (3):
      drm/mipi-dsi: add mipi_dsi_compression_mode_multi
      dt-bindings: panel: add Samsung s6e3ha8
      drm/panel: Add support for S6E3HA8 panel driver

 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml |  75 +++++++++++++++++++++
 MAINTAINERS                                                          |   6 ++
 drivers/gpu/drm/drm_mipi_dsi.c                                       |  16 +++++
 drivers/gpu/drm/panel/Kconfig                                        |   7 ++
 drivers/gpu/drm/panel/Makefile                                       |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c                        | 342 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h                                           |   2 +
 7 files changed, 449 insertions(+)
---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

