Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EC43912E4
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33CC56EC5B;
	Wed, 26 May 2021 08:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EEB6EC49
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id x8so184171wrq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b58/b35h1ySITpV32UiH3hgADkqDQkiEXVcNLNWEueg=;
 b=lS2dDBdK3+lqs/BpdDNpVbyj4ptYsVo8RYqPRKNGSWwAX72gmfXIQtRmaqAPtS2a27
 VtwUMNtHed1uPMM4kJHGvF41ejYzstijQToVtJKeXj4Au3Xe4o+RehgjcsYOTuxsA7Wq
 AHXdyji7xPFSiksN67m9VVZbiR0XEx+MFzWgP7tOq3GT4vnTbW+LTnYVvozRJ8YJckp1
 15CLocjxNl4gGzqAYHsa0Tud7Fljic6Ockj+03OqQy4v5wU2hhyGJ4W1ORbj31C8z3gc
 +LXHOUkVrztyKpQk8k2SwIqHIxOSF0HR48NvkUB2iml7BjE8fI0Tln6vmDCVv3WSwXgr
 P3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b58/b35h1ySITpV32UiH3hgADkqDQkiEXVcNLNWEueg=;
 b=NMNMrdQ/ESLT+vjxM2QHCWy5fBnhbV31LOHN5VRoCWmP/0lyXGduspPMeTl4iLiBlp
 ZiLPzkmOdgUcR1PDRgBtCf/GzKZZEf+MYi/qHKzfIlhWtSl4DFHhF5x9hxnJsh+AvRCb
 322PU4ScSx6cde2Sy8mZLb+og5ypd9eg3aQGVEAvFsqdh6qErL2ifW2PzcLeS4B8PCT/
 vEUToc6ttUfJ0JaviP1yUdoBXV3ygqd5OnpOW7WZ16QpKhMCLkGQdT45Ujma7tjhSAho
 uOMzLtaNQS4h9ID8nVnsMQ3FJSS/sF2+HHu2NbkJxa7XNF19T4u5pXYXIT0EgNljb7/1
 WR8w==
X-Gm-Message-State: AOAM532UnOhA2yNzzPAsW1eLBCftxvH/vTTkOVDbTgFM6pem+MbA0H9V
 MJ54nIgcCKFw8yq0FGTaYQ0Wyg==
X-Google-Smtp-Source: ABdhPJyNaLy+RiYocIz059ItZ6quUW2ShSpj8xz6ANJUGgnXUvL5SlhLPaLRy61OVzWgjhdqgUb6eA==
X-Received: by 2002:a5d:4e8c:: with SMTP id e12mr31664433wru.94.1622018863739; 
 Wed, 26 May 2021 01:47:43 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:43 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/34] drm/amd/display/dc/dce/dmub_outbox: Convert over to
 kernel-doc
Date: Wed, 26 May 2021 09:47:05 +0100
Message-Id: <20210526084726.552052-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_outbox.c:30: warning: Cannot understand  *****************************************************************************

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
Cc: Jun Lei <Jun.Lei@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../gpu/drm/amd/display/dc/dce/dmub_outbox.c    | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c
index 295596d1f47f2..faad8555ddbb6 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c
@@ -27,19 +27,10 @@
 #include "dmub/inc/dmub_cmd.h"
 
 /**
- *****************************************************************************
- *  Function: dmub_enable_outbox_notification
- *
- *  @brief
- *		Sends inbox cmd to dmub to enable outbox1 messages with interrupt.
- *		Dmub sends outbox1 message and triggers outbox1 interrupt.
- *
- *  @param
- *		[in] dc: dc structure
- *
- *  @return
- *     None
- *****************************************************************************
+ *  dmub_enable_outbox_notification - Sends inbox cmd to dmub to enable outbox1
+ *                                    messages with interrupt. Dmub sends outbox1
+ *                                    message and triggers outbox1 interrupt.
+ * @dc: dc structure
  */
 void dmub_enable_outbox_notification(struct dc *dc)
 {
-- 
2.31.1

