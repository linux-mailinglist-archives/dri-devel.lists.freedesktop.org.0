Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6E549041B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 09:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D8210E3C1;
	Mon, 17 Jan 2022 08:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF5710E3DE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 08:42:33 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id t32so10243526pgm.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 00:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wq2mcmJuBSLlUrEIQ1qe+EtyfI00HRLw6OdQpTZImL0=;
 b=cMkBTrDzifr2c8LNBZPvpAzAnR4Sl2P0tbihWhjZIMU+/PwItRxmn83UaYUx16HLU5
 gioFgz0eKlaTYvNHtGiiPpDBunJ+GtJxlhdS2ukOu0O1VLxRlA/Cu6vmbeLPJvA8S5kn
 cgsei0e+wwh4EszKHy7ZR52Z5crVrGBxgC/Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wq2mcmJuBSLlUrEIQ1qe+EtyfI00HRLw6OdQpTZImL0=;
 b=Ob5H1BeAFBKnU2cXJS8Paf7aviUeFqdTglMcsw0tZAKA8B36RrHrg4M3ozntvLGmXb
 LO4i1AmY82jkKKBEvKa70Jo4ufYelULuBhza5KOmK8cCYPQclhKEMN6oUQm7iAUDISeW
 +jntRZVscVGP2ELxYv6P6hwlzicq1xRvshmUdB7CnXSSSf5MNt1JTU56zsIZkif7/ClX
 wIBzVs4MpcutuVMGGFZm4xIKcN6yFFKXNxEXUwCqcuJVttW8dWUogSJPw3ytz7gJ3XMn
 44hZLfvGtZtAevlPmuYsbwcrNxR3QRPkQ+Wy/EwIqCKTnfNRus4Fh23BTrKiNO5WU/0u
 0HSg==
X-Gm-Message-State: AOAM533Z5NZaZ2DDQ3pes0XzoVFPpE/PVYz+7Ude8Zm3yKS9K6aAaYLV
 apC7hHO7XmvGUuABWARbSgfadw==
X-Google-Smtp-Source: ABdhPJzKINwxJHtW5olZKmvdT18HKPt32UY984HzCC5OKo40c7mWNjEJqgf75R2NVK/jPmQ1owzKMQ==
X-Received: by 2002:a63:3645:: with SMTP id d66mr18215975pga.417.1642408953458; 
 Mon, 17 Jan 2022 00:42:33 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:955a:760d:bbf3:5d4b])
 by smtp.gmail.com with ESMTPSA id z3sm11763423pjq.32.2022.01.17.00.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 00:42:32 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v5 0/5] drm: exynos: dsi: Convert drm bridge
Date: Mon, 17 Jan 2022 14:12:20 +0530
Message-Id: <20220117084225.125868-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Updated series about drm bridge conversion of exynos dsi.

Previous version can be accessible, here [1].

Patch 1: connector reset

Patch 2: panel_bridge API

Patch 3: bridge conversion

Patch 4: atomic functions

Patch 5: DSI init in pre_enable

Apply below patches to test on Exynos DSI:
- https://patchwork.amarulasolutions.com/patch/1825/
- https://patchwork.amarulasolutions.com/patch/1838/

[1] https://patchwork.amarulasolutions.com/cover/1826/

Any inputs?
Jagan.

Jagan Teki (5):
  drm: bridge: panel: Reset the connector state pointer
  drm: exynos: dsi: Use drm panel_bridge API
  drm: exynos: dsi: Convert to bridge driver
  drm: exynos: dsi: Switch to atomic funcs
  drm: exynos: dsi: Move DSI init in bridge pre_enable

 drivers/gpu/drm/bridge/panel.c          |   3 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 248 +++++++-----------------
 2 files changed, 76 insertions(+), 175 deletions(-)

-- 
2.25.1

