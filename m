Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 804555B98C1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 12:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7702410E165;
	Thu, 15 Sep 2022 10:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C4210E165
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 10:29:29 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 n40-20020a05600c3ba800b003b49aefc35fso4227615wms.5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 03:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date;
 bh=y3YnLw+nXEeLifDonLqSm9OS37vY/PHeQsoRqCvRyZw=;
 b=tb0VtQ7Dm1ElTc3P918h0Z4a+VCawiprdrJqFkrB4GOgPgdql0CHr2ol99ytX5NgyU
 t6w6gjVNIgsTz/FhjvMRQgcmKiV+pMniz+rQ0PdbdxfhjtFotTgr404R3wJLWtHgj2v8
 /IxVUOsYDo8Fvwm6Ly+vr8gWoUCIT6ileC3lrickMewYOpTt5AyxPpdFvQQcOI66DQw3
 SRr89pxSzjoqa+syiBId6rfOgBAHASwgpMgVin3+XuAxOmqNtX4XpJs21HmrWqYQ1gWg
 ABtzJu04XDzNrLoZMh6gBHN2wVk443HUM8nbDwUHmyTEGTQaABfjmKr3gdaN+cZNnm2M
 WUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=y3YnLw+nXEeLifDonLqSm9OS37vY/PHeQsoRqCvRyZw=;
 b=X7dwSYlzBujs3pwK53zsmXsClB/G66ODCXZclSxP1bLFkFKUi6+9V8mXq7+7UgslE/
 G3YRy5dPNjBHMmqH/wh4fZ0NQSGh/i83uRWpCTSEjcf0WXGWG+DsOxZfKcpq9mdh+aKq
 ggf1Xo7i95ov5eXb8mk7xK5gwGl6hvOw+WYO+wA3OtQcvvWzUIR1ScyuCBpPjfvvPyAA
 crUbBiarZhX6Ja1l4zL/zuqqiUCSO+jjhyyZmRAZhKHrJ6nVVX0dBdlVaBo8BVnslIWr
 s8MZKEu9FFND6SsFqlz8ecnCGyLFYB87NsXj+LlPNZSFiF32v8zPWi+p3CWnoaqJUVeI
 eQVQ==
X-Gm-Message-State: ACgBeo1Rz7kX7FhrDzfNV67BQYXxq2/izCSW7m6azMj4/peK8YCMEcTL
 5CAp932Ckv5fP7AF3InpJuINig==
X-Google-Smtp-Source: AA6agR7ax1DEZBhTdEExCg1H+xG0foTJjRODIus60KxmYrRQOkYTyvp0sv60JG8wV9Tb0stIHQOEtw==
X-Received: by 2002:a7b:c013:0:b0:3b4:a682:a640 with SMTP id
 c19-20020a7bc013000000b003b4a682a640mr3734590wmb.136.1663237767964; 
 Thu, 15 Sep 2022 03:29:27 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 q17-20020adff951000000b00228dff8d975sm2098257wrr.109.2022.09.15.03.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 03:29:27 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 devicetree@vger.kernel.org
Subject: [PATCH v1 0/2] Fix chrontel-ch7033 reversion
Date: Thu, 15 Sep 2022 12:29:22 +0200
Message-Id: <20220915102924.370090-1-robert.foss@linaro.org>
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

Robert Foss (2):
  Revert "Revert "drm/bridge: ti-sn65dsi86: Implement bridge connector
    operations for DP""
  Revert "drm/bridge: chrontel-ch7033: Add byteswap order setting"

 drivers/gpu/drm/bridge/chrontel-ch7033.c | 15 ++-----------
 drivers/gpu/drm/bridge/ti-sn65dsi86.c    | 28 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 13 deletions(-)

-- 
2.34.1

