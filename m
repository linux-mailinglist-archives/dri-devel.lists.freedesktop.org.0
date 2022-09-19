Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE45A5BC77F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 12:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA2510E5F1;
	Mon, 19 Sep 2022 10:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8390F10E5F0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 10:20:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id z6so14252984wrq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 03:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date;
 bh=OKFjDcIVuDMM00qktRXs83Gxno16woQBBpqscCyHyns=;
 b=kkgJw0fkdtj0n+LSS7dAu9YuZRA/J/iA0g5HJnPpEAOZNar8ic03sgHPy/orHIjqps
 oLVhqwtCRh/5rmAOfas7QnH6PBPBIavEDTmJ0HearwFh22n6IeMy7VZpybDepOYKVJwm
 1yssqqza5jehMkl2XaE08COCg8lnj8rP6OyWPQrljfdClgxKE9O8jwoJBOh5Fubufjti
 mG8oiPtZ1uFj93l1/o6CcSthTEgYebeLP6Q+o9CFBGfswkfGRiK2cuDc4L3A6XrXnNAR
 5ZOtGxAl+wq8jVgwgmMRmE5IuHAkrOON4AM6vYXPrUHrHMcZurQoRcZQel39AFvnAify
 XllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=OKFjDcIVuDMM00qktRXs83Gxno16woQBBpqscCyHyns=;
 b=xUiQUJVDnrSGqQyfGpbbIf22AylVb5z1sWy+xl1/0Bm9GEhDp6aFhUBCyNG+06uNsG
 Z2L/kszR/ubfzfSP2//ZPaJAgwkXCkSkP4Ebq+I7cM8rWV0GOjGdE1sCSftRwts23S0D
 r8F/Bp2lx3TH6uDbRxQQROhuPgQbT1BSC4fMSg/z3HzYswm4Oh5Ftf6k43c/HD766cCI
 0qooz2BTo2W+fVNE+OdW8AgawzCZJ3XvdcWYPgsFwL0TaIfpWfQ+DwNeoXxMyhjRzkeA
 Ssur5xejk13yuh3np9TbwMQysXZvSGUO2Rt3o2u6DsWf3LgcyqGbbW0j9e+oWOnnrAce
 O37g==
X-Gm-Message-State: ACrzQf11pEQ6fOsg1FdIn5QBgoxqTss4LC+VMckp6Q5q72j0jWOBrlUL
 8t6kkPZlM0OsxzsD3FooubWnYtUSBqJ+gQ==
X-Google-Smtp-Source: AMsMyM7J2GPRlgBpa27pYpfKQeFahCST83hgYOX05xRTCOBrvevQWc5pVDP9jzEubm1iUSZiEmM0sw==
X-Received: by 2002:adf:dccf:0:b0:228:635f:90b8 with SMTP id
 x15-20020adfdccf000000b00228635f90b8mr10101217wrm.703.1663582818824; 
 Mon, 19 Sep 2022 03:20:18 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a7bce02000000b003b483000583sm12784245wmc.48.2022.09.19.03.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 03:20:18 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] Fix chrontel-ch7033 reversion
Date: Mon, 19 Sep 2022 12:20:07 +0200
Message-Id: <20220919102009.150503-1-robert.foss@linaro.org>
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

When the chrontel-ch7033 series from Chris Morgan was reverted[1], I made mistake.

Patch 2/2 in this[1] series reverts [2] when it should have reverted [3].

This series fixes this mistake.


[1] https://lore.kernel.org/all/20220912113856.817188-1-robert.foss@linaro.org/
[2] c312b0df3b13 - drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP
[3] ce9564cfc9ae - drm/bridge: chrontel-ch7033: Add byteswap order setting


Changes since v1:
 - Add Fixes tag (Laurent)

Robert Foss (2):
  Revert "Revert "drm/bridge: ti-sn65dsi86: Implement bridge connector
    operations for DP""
  Revert "drm/bridge: chrontel-ch7033: Add byteswap order setting"

 drivers/gpu/drm/bridge/chrontel-ch7033.c | 15 ++-----------
 drivers/gpu/drm/bridge/ti-sn65dsi86.c    | 28 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 13 deletions(-)

-- 
2.34.1

