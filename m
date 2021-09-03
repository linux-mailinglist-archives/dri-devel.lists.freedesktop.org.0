Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0788C4003DE
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 19:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE026E8B2;
	Fri,  3 Sep 2021 17:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44A06E8B2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 17:09:02 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id s11so6111489pgr.11
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 10:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=32EQLdfDTCRCdMRemhZOmZoqSg85NLCnv9qxhDUzup4=;
 b=FqSavnJkeVM8xIg3hQ3VVqpS0xthnfgZNfDX1AaGl4kDvEWoAWI6FMOVP2ZfcE/4YB
 yFJb5mV4nUddkUN7SopNeCSjlC0p0SP/5ziSfVN/lNXcNDDrxsmTqR6T+/YcTJX6iZQC
 JfHRJ0FW3e2GnSVXSTKIaEnh8KKsI29iKqEuaPrGY/WULmyy7Ld652r4njvRLASYbpus
 18hjU2DfMeiRikDvKf37MVRgGI5QMZakziM1PHWWqZ84ueQNbd/fVx8wM0dV6+BXm3l+
 G2uq+SAAMPJHqxwU3+Ikg8KFOBjxzyTrkgHwaEDMyeibWl/JCq8ut2ElRovtO/3bF9Mz
 P9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=32EQLdfDTCRCdMRemhZOmZoqSg85NLCnv9qxhDUzup4=;
 b=Y/diVh1TgnT4VCVm1aeKn8PSoYAst1WA66FnDRN8YYhnL/+NXJMUgHflZy2VfzZgkN
 XrUIdLFGm85JkhcBFiweN6kbPzMgwbLN2gRmB03AO/JIxfCQUxcM1efr0pLsRyTQZAqV
 UYtuuHmiteIeg/mppUzpD6IOl24VjqWOTBMS7cP2SUgzQ88G72oF78VzatLUHDlCoaNY
 NREv1AiM0Q/YDnwxYP2+lBm8y1620l0B8bRyJOhy9u/bGzgfJuhZuGKglAPMk3DYMdR5
 4YejquV3+Cy3n8vymDWUWP/rpu9EQhwOKBaEm+lqLedVASF+1AFjd5onT8zOlij86+X5
 ie1A==
X-Gm-Message-State: AOAM530hI3Wj5NVn1PDXveh78oT3/RADuQSPH0gTzeXBip3uOb+gvoWb
 7yEwS5BTJ0IZh/ZnMUva5t1kdiWIq5n0Ag==
X-Google-Smtp-Source: ABdhPJxGolyM7co+r0l5xbZhBkdb1JccCKzpw4VmeIZgvlpyTIIH08eZkbmaP+kzlokxfvXmvjxMQw==
X-Received: by 2002:a65:5a49:: with SMTP id z9mr47166pgs.121.1630688942457;
 Fri, 03 Sep 2021 10:09:02 -0700 (PDT)
Received: from skynet-linux.local ([122.171.5.147])
 by smtp.googlemail.com with ESMTPSA id 130sm5905361pfy.175.2021.09.03.10.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:09:01 -0700 (PDT)
From: Sireesh Kodali <sireeshkodali1@gmail.com>
To: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Sireesh Kodali <sireeshkodali1@gmail.com>
Subject: [PATCH v2 0/3] MSM8953 MDP/DSI PHY enablement
Date: Fri,  3 Sep 2021 22:38:41 +0530
Message-Id: <20210903170844.35694-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
MSM8953 platform (APQ8053, SDM450, SDA450, SDM625, SDM626). All the SoCs
on this platform use the adreno 506 GPU.

Changes since v1:
- Split the dsi phy doc changes into a separate commit
- Add Reviewed-by tag to patch 2

Sireesh Kodali (1):
  dt-bindings: msm: dsi: Add MSM8953 dsi phy

Vladimir Lypak (2):
  drm/msm/dsi: Add phy configuration for MSM8953
  drm/msm/mdp5: Add configuration for MDP v1.16

 .../bindings/display/msm/dsi-phy-14nm.yaml    |  2 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c      | 89 +++++++++++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 21 +++++
 5 files changed, 115 insertions(+)

-- 
2.33.0

