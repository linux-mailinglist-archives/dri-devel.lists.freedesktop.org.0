Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB786DB9EF
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 11:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4621910E027;
	Sat,  8 Apr 2023 09:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2AD10E027
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 09:47:47 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-944bd1d58easo212565766b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Apr 2023 02:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680947265; x=1683539265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0V+79f1G4EAx5wqA50mN9ZgwAmoB9D1BTsUKh1syJbQ=;
 b=Lg5qgz6geHqN2+2ckjZRVy55WQ+OScakxL3RdFKWObkihkC1OoB7qyJsweOcRsXKXm
 J7J30IGbxio4s0O2uc2DnoB3QsIFfcafpI0IaQnYHl2DwVBVKHlmiCWM/OsMkHDHzvTZ
 bgvgik6N/BR7PMYmTcd/yT5Qimb92ppB97DN3+Zcu3KlzKAKDDGSsO0ecBIw589+wA2u
 LuNCyfVtljT5VFWcLhnTqv0cXR63Y3lZpTuYL/x0B1Q1h42c3B+TZCrKAIe9Yx0rNIxp
 4nOU8OQVOy1j1PqJAwyDyHSf0Boj4f565P5H+SCYJ+lb+Adh7eBmhCwdRnAQH+GStS9S
 IG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680947265; x=1683539265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0V+79f1G4EAx5wqA50mN9ZgwAmoB9D1BTsUKh1syJbQ=;
 b=AKLJNWNT54g1FgFxBdbskl4vL4UsmjSxLdPHgbTzQRRUJlg71AyDxp91bnqKzyV3ah
 zY+IHnvmYukg2IFqUgUK3/u18HTTps+eeoIpdk968MDzLoGXBPbrMyK18GzAg39RZjtV
 l2ssuXGZo5cYtUoA2O4i2A4nH3L2+5d4h57z6qxzAv7t+55htE5dHvGMGzHtoT+7QM5V
 a3IiOsyxr7H7U2QJXFknJCID1ZYUEgeDcDPKINq4V+mgRg5IM8kxIJ54FDKgsjEzPd6W
 JNSmkgH8muVVhixukYtVKHADWW/e44KJaaXu/RQza+DAY4cFwCG4P4PrbfcPkIziiLAj
 au7Q==
X-Gm-Message-State: AAQBX9cnAUTIzP+zENvWSFyXCFWF13r7XDNeDrKuvR/iageqyB7G8/Ck
 UU1rcnJqrr3wrhXgOQG7B8U=
X-Google-Smtp-Source: AKy350aO6nEUzOn+aw43GnZc6FMfCEr85RtCi/zar/Ozjicrn6tG3oe1Vw38FFJncCsIk7dgVE1utA==
X-Received: by 2002:a05:6402:32c:b0:501:d43e:d1e3 with SMTP id
 q12-20020a056402032c00b00501d43ed1e3mr4418282edw.8.1680947265509; 
 Sat, 08 Apr 2023 02:47:45 -0700 (PDT)
Received: from xeon.. ([188.163.112.79]) by smtp.gmail.com with ESMTPSA id
 a21-20020a50c315000000b0050481736f0csm982297edb.12.2023.04.08.02.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 02:47:45 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 0/2] Support bridge/connector by Tegra HDMI
Date: Sat,  8 Apr 2023 12:47:21 +0300
Message-Id: <20230408094723.12733-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
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

Maxim Schwalm (1):
  drm/tegra: output: hdmi: Support bridge/connector

Svyatoslav Ryhel (1):
  ARM: tegra: transformers: add connector node

 arch/arm/boot/dts/tegra20-asus-tf101.dts      | 22 ++++++++--
 .../dts/tegra30-asus-transformer-common.dtsi  | 21 ++++++++-
 drivers/gpu/drm/tegra/hdmi.c                  | 44 ++++++++++++++-----
 3 files changed, 71 insertions(+), 16 deletions(-)

-- 
2.37.2

