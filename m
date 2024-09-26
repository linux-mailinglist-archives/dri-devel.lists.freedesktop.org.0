Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614D69872CB
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 13:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99BF10EAAA;
	Thu, 26 Sep 2024 11:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VwrzH62K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D75310EAAA
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 11:29:46 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53653ff0251so1141869e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727350184; x=1727954984; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rnLiEF0tTzux1Tq9ZDOIhqIZJG6KKmpYuSlxKSzCAJI=;
 b=VwrzH62KJOqriccI+YxzsDcXZlmyTWnxYvOGaZ3mTHTscQnUvCnundJ8pTpp3KWU2s
 qVDbGmFRUD9imUnqzH73U/Uaskx74eHj1Ytn1h40U0zUJ9rfFPoook8hDkOonWqrQDDE
 C1pyEj97/RAJUsuI0uEQrLGY2Uv8RpMCzW838D0DDcWujEQLSCQ5V9ZnvFTHi1A51WxF
 tyU1f0dmDIsKA8zZ0izsKHYsncszw1rO0hp85MwlAnzjTAMjBJMcN5/Gv6VuXNgN5xx/
 7q55h2QIY3ijk+74+qmUZiSeLDwr6jlYkFol0YqQ7+Re9v1CzBMV9O6QV5YMkZ3nGKXI
 0r8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727350184; x=1727954984;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rnLiEF0tTzux1Tq9ZDOIhqIZJG6KKmpYuSlxKSzCAJI=;
 b=cBCUc9gLcGqTaAxZPB0oEA11abFEr0vpvexwSbpYsVUENgdm2ndJ2UaQrfi/jhPtk/
 QyVxBSdVK7AVj0/QNp2cxQnxKCrl2+EjTsX9s3h/CcAqE/qjzCxn1lzG9CWrzL/sSrCN
 +7grEIwjsgI6Xt6yu8hW4z98kGrD5eyqyz6RpNLdGWOYzdY2l4QolhzA9qIkmMxZpunb
 wx4cNgI/8oFL2llkZ3tUDUEcJBI/d9cpRTv4xnokpy5ZSy4nbabOvPn5/ntKpPMHdS8j
 7dsl3BzEGu2m5ch6Ns7v08iQ16tZIyp85W75bq0QVQD6ZTWrQT6Uh3TWGsnriTcQpjRk
 Wjsw==
X-Gm-Message-State: AOJu0Yyx8z880pQGkvik76qUhlfjqzAwsJVkqGTo2ZY3lvQJjNRt4UkR
 7knv6h7QWjn4uvK1zN5vnS1wUMQcRQ+80RIOkTjD2ArBqVAytMy5
X-Google-Smtp-Source: AGHT+IFa60QpaRuVDkPl1B1Ca5ZW+L3INLkEdB4Ea1cxVSe9xhECC6bwAgHKgZ/tnAKPMSiPqDvqgA==
X-Received: by 2002:a05:6512:3995:b0:536:a695:942c with SMTP id
 2adb3069b0e04-5387048ce9dmr4147664e87.7.1727350183740; 
 Thu, 26 Sep 2024 04:29:43 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by.
 [93.84.1.20]) by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-537a85ee5fbsm786495e87.74.2024.09.26.04.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 04:29:43 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v5 0/2] Add Samsung S6E3HA8 panel driver
Date: Thu, 26 Sep 2024 14:29:25 +0300
Message-Id: <20240926-starqltechn_integration_upstream-v5-0-1cb0e43e623f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJVF9WYC/43O0Q6CIBQG4FdxXEdDULCueo/WHOJR2RQNkNWc7
 x66tbqry//fzvefBTmwGhw6JwuyELTTo4khPyRIddK0gHUdM6KEZoSnAjsv7b33oDpTauOhtdL
 Hm3KenLcgB1ypghc5qWgDDEWmkg5wZaVRXYTM3PexnCw0+rHvXm8xd9r50T73NwLb2vdi8XsxM
 EwwsIZzTkkqpLq0g9T9UY0D2vCQfcBTyv4AswjSmkJT5yovhPgG13V9Ad5rAaM2AQAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727350181; l=1141;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=zUo6dL4FkvKfEQbRtfTjRGBerEKQpvR45DHVdVIcmmo=;
 b=hNdLzZPZh4isMed8mlnrr7+NXpFNDPqkUhKauPPfc+muT48QklkJNtTqyQvYYy4/brtiQTXlv
 mejn92cF9yXBbVsm8uU4I97MmZESB9dP/MIW5RcBHv0cA+BdkXy3lia
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
Changes in v5:
- Split patchset per subsystem
- Link to v4: https://lore.kernel.org/r/20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com

---
Dzmitry Sankouski (2):
      dt-bindings: panel: add Samsung s6e3ha8
      drm/panel: Add support for S6E3HA8 panel driver

 Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml |  75 +++++++++++++
 MAINTAINERS                                                          |   6 +
 drivers/gpu/drm/panel/Kconfig                                        |   7 ++
 drivers/gpu/drm/panel/Makefile                                       |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c                        | 344 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 433 insertions(+)
---
base-commit: 3469b89bd13f10d679d1b1f5b47fb71953e96349
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>

