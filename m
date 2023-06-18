Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4D073458D
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 10:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5A310E060;
	Sun, 18 Jun 2023 08:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0724D10E060
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 08:51:07 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3111547c8f9so2538877f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 01:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687078265; x=1689670265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hmc9IwyZl6aMz+KHuXZhLsJGDOxYITeiAy/9M75qrxE=;
 b=VArv5XEhbOMuRXTW55GI+jRO4qe5OYFVNPVGTpFHwWDLn8S0VUKNbJeCMXjvg7w+sc
 P/Ec7YXrTzM53w9WOG9vAxSxIcFgOIh4NlzTjM0FZNFaRtXuiDGxnhpFAxKnDCvfgEes
 k6tTxRvnhXCBTSBdJX7KZB658yHm99szm/nabNM9QrUvl6V5pb6JbjhGfqbgadF4KTEQ
 W6ye1FLWjzYGKVRL/c+oaNHaJBcyOrFjpcMwcajZ7dYc3WD3ssLQpFwqrmvU8nGzk47X
 x4hZN+FGUxIAjhbjngndMs3HmG/MaXQuhR9y5OWrt/fzBZrEcuW8/IiwwAD6g2jkpEnO
 9CaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687078265; x=1689670265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hmc9IwyZl6aMz+KHuXZhLsJGDOxYITeiAy/9M75qrxE=;
 b=MNJD7jBTap8jOyoGxwybvR1DmskRCDeZ7MXF+K3eqSBeRvQjNsszZCXNgNZb5Qo9k2
 6SqrAC1n6ntCJkrbzWW5aw/VmnIxuUdd/yJAgCDkFM81xGZfuoiXhX41UAHw3pdNfw4x
 CXxn4n/yTL9EBKDYACHQ59WxDVyicBOggAtTcD1Gj5Sl4zWm+ZnAYLRUbJvZI/0e3Jyj
 P0ILVjhV86Zml7/7UbuOohnhz1cWPmkL/rlpPXAMb5J9czNU/2o3KIHieYOlAcJs/c37
 4cMNexdB0/gnfRh1o/Nw6R1JM0HaipZAxAlY+Ar2c1z4zzbJoT/3igEs9aTPpyzJs6U5
 HSOg==
X-Gm-Message-State: AC+VfDw5AsDjSsnFNYMZonmxtQA/vK8VTn6Y9CCrayRSnGzQPsRqYyKZ
 LDtEKzk5Y4C8HzCl3y+UbnM=
X-Google-Smtp-Source: ACHHUZ7ZV2jv1bt3JkvDFrYiAOcgGWw3QfOIOC2rnUu8s56kb/wlRP2xNkdJNi1qE4j6UrSMHWReLg==
X-Received: by 2002:a5d:534f:0:b0:30f:d86b:ccab with SMTP id
 t15-20020a5d534f000000b0030fd86bccabmr6034312wrv.1.1687078264482; 
 Sun, 18 Jun 2023 01:51:04 -0700 (PDT)
Received: from xeon.. ([188.163.112.79]) by smtp.gmail.com with ESMTPSA id
 i17-20020adfded1000000b00301a351a8d6sm6953550wrn.84.2023.06.18.01.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jun 2023 01:51:04 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 0/2] Support bridge/connector by Tegra HDMI
Date: Sun, 18 Jun 2023 11:50:44 +0300
Message-Id: <20230618085046.10081-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support for the bridge/connector attached to the
HDMI output, allowing to model the hardware properly. It keeps
backwards compatibility with existing bindings and is required
by devices which have a simple or MHL bridge connected to HDMI
output like ASUS P1801-T or LG P880/P895 or HTC One X.

Tested on ASUS Transformers which have no dedicated bridge but
have type d HDMI connector directly available. Tests went smoothly.

---

Chandes from v1:
- no changes, re-sending

---

Maxim Schwalm (1):
  drm/tegra: output: hdmi: Support bridge/connector

Svyatoslav Ryhel (1):
  ARM: tegra: transformers: add connector node

 arch/arm/boot/dts/tegra20-asus-tf101.dts      | 22 ++++++++--
 .../dts/tegra30-asus-transformer-common.dtsi  | 21 ++++++++-
 drivers/gpu/drm/tegra/hdmi.c                  | 44 ++++++++++++++-----
 3 files changed, 71 insertions(+), 16 deletions(-)

-- 
2.39.2

