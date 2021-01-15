Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 817F92F83A6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBA56E4CF;
	Fri, 15 Jan 2021 18:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAE66E4C5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:21 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id 91so10219411wrj.7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h0iVILfCe9Q5cRcFeOSW9WvBexCJRHav+Q3xWBDxDaM=;
 b=AVHrSt6WQH1H/WKVov8I+ShF2hDc7oVn8PibmE8jXXlDIrSpdtFjvTaFMYo7yQQh1E
 8siLsj8/YVEJYu3SlMKDds60GTn6kRrDv7Dlna9STM5wkb9OMkYC+MJaHLUosF0P43T/
 zI7Ex9gttZUjKfm64Ziyysc9tuz1dvmU2dLT+rX5YEY8XGJnteos5tn/dDZbva26EIg1
 Fa2SAP1haIrUIn12LGx9p8prbF8HE3nWsmpsYoQcwFROY0QBT2XMfqlg4Z4rfkgLY8bB
 i7BKoGOneo4BauGuDDarqrJ37V6ttc+xTkiXBRsNolZoS7jZTmd4n1kjULeoyKddPwpm
 C6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h0iVILfCe9Q5cRcFeOSW9WvBexCJRHav+Q3xWBDxDaM=;
 b=dcEydUhkCFvHpwwEgLguWB6Fk6p2vbxHGDO33g+P7qtwNivgqeoa2Y7MjXHh7e+EX/
 +/02S1Oxrk8NaYwE/m1WN8OuSAORbl+FrdR89QT6per95+eHZ4IkNpZjWLu6+Mz69Je+
 dCcJofoCpIjyUnGoEkFJeRx2YGxR7EEZ+Rb3LNwVPCtKgf/L/v3pxQ/6sk3VNAeRnFi7
 JnXT4EwQcV1Y6oRu8D6P7ltwNSHLDkfSQrNE/loqZmsRGhpaPw3P6YXDi1qCDdpw/X5g
 l1Guy+bNQS/iemLdvNyk0qoHnKXH6flpjcOV1bKIxKCRkrF7M+SpXvoL9OGiREil/JLX
 RUYg==
X-Gm-Message-State: AOAM532I/RfZ8SDN0AOAsGEKT4hmMFvX/7iOey1Icygk7ppHGL7111KY
 lMF/edxi0k4Gqgce1rfY/4ugWA==
X-Google-Smtp-Source: ABdhPJzhVRxpTey/n7ZbeueuVV4J8bOk7G4YtYdQwoJ9VGq5SQ9VTTnokSb8dyvMnQOTsHVWMChPOg==
X-Received: by 2002:adf:ec92:: with SMTP id z18mr14789883wrn.166.1610734580564; 
 Fri, 15 Jan 2021 10:16:20 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:19 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 10/29] drm/vmwgfx/vmwgfx_thp: Add description for
 'vmw_thp_manager's member 'manager'
Date: Fri, 15 Jan 2021 18:15:42 +0000
Message-Id: <20210115181601.3432599-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c:21: warning: Function parameter or member 'manager' not described in 'vmw_thp_manager'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
index e8e79de255cf7..eb63cbe64909d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
@@ -11,6 +11,7 @@
 /**
  * struct vmw_thp_manager - Range manager implementing huge page alignment
  *
+ * @manager: TTM resource manager.
  * @mm: The underlying range manager. Protected by @lock.
  * @lock: Manager lock.
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
