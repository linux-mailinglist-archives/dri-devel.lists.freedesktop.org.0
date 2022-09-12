Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4E05B596D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 13:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F6C10E39B;
	Mon, 12 Sep 2022 11:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A9910E39B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 11:39:53 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id z21so12325218edi.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date;
 bh=VvhgnJkgzWm1+CY+cryCC9lz3BC2Xljvm+CFhD5zskw=;
 b=WE7aLkAP/qhfgY9MILUdI4NsGOW4ov+PHmQj4Q5RJBIF+3UYBW9zYeSnhF3qa8Vgxb
 YfVICL6Y2NO4JsSgYysXRG/AjQQHnBhwhXV9FeoFJRKFDkQG0caOyKL0yrljZNRDh+lh
 3aBPskdPECHjiNs8jmFN/XaDSiWHZiuYkR2SJAl0Lln873Q2VHsvrNnFB9JWyeyuTsfC
 E5WAtA6bqwyd4OjLKUv5tK19kpCfuQHOYp5L1WV5252FDU+KqDwdUF5EdaUeJncGe7w+
 JhKqvy+shmX6/gsblsv4hamRdZt1Jo5zRUVMrp7JIE/QWQzwedMF9yqqdn8gk+kePyKo
 m3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=VvhgnJkgzWm1+CY+cryCC9lz3BC2Xljvm+CFhD5zskw=;
 b=xhZ4wYXvycdqIqIf6IKZILvubf6NOyPw139y6ZvRykr1/2hgL4iLQt6CHCb1NewN78
 F9rg1myyhyoJZKOSAQqMM8sd2470j8PBGxw+cnTZiGIRa/dUdiXnO1OSE0D/7APIWBGu
 UhFmj6y+7xYejz7AQMfvyeQQME+PZI+yAeyIb+z+sSyNOvRGluwn9mc0qzdsVD4ZBm0/
 zieQ1YOeGjXbPNsdLnEm7cH0o+wj2mlo2yzZUIO3NsfnQccI3dl00ITop0DUdSaGZOAO
 LIbeKbePHQ+680B4ipfTkxNmbjGzPe8cE8DRYZ3cT6De/UKwXjPCmfm7PwKyX/e+jemp
 nbHQ==
X-Gm-Message-State: ACgBeo3RM8yDXY5IAQlWFiyV/fc8pdklsLDZozX6+9pNR4xkhImgDPCG
 S4vCVbvzAIZ2dxYPcz4L+4ODQfGwBfNZBg==
X-Google-Smtp-Source: AA6agR7giM5UqzmcT6ZjCeKgXdWXuOfW0ePVyeY/7ceWkZ0Luv1B4yPnOR2C1URKlLGmLwCfzq5zlg==
X-Received: by 2002:a05:6402:27ca:b0:451:7b58:1b01 with SMTP id
 c10-20020a05640227ca00b004517b581b01mr6365040ede.61.1662982792208; 
 Mon, 12 Sep 2022 04:39:52 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170906310900b00779cde476e4sm4314368ejx.62.2022.09.12.04.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 04:39:50 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dianders@chromium.org, lkundrak@v3.sk, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, tzimmermann@suse.de,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v1 0/2] Revert chrontel-ch7033 byteswap order series
Date: Mon, 12 Sep 2022 13:38:54 +0200
Message-Id: <20220912113856.817188-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
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

After applying the "chrontel-ch7033: Add byteswap order option" series,
Laurent reported an issues with the approach. Since no fix has been submitted
for the issues outlined in time for the next kernel release, I'd like to
revert this series for now.

Just to be clear I would very much like to see a v3 of this[1] series, where the
issues outlined have been fixed.

[1] https://lore.kernel.org/all/20220902153906.31000-1-macroalpha82@gmail.com/

Robert Foss (2):
  Revert "dt-bindings: Add byteswap order to chrontel ch7033"
  Revert "drm/bridge: ti-sn65dsi86: Implement bridge connector
    operations for DP"

 .../display/bridge/chrontel,ch7033.yaml       | 13 ---------
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 28 -------------------
 2 files changed, 41 deletions(-)

-- 
2.34.1

