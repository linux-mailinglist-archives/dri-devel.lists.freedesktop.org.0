Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353392F8375
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1356E49B;
	Fri, 15 Jan 2021 18:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64DE6E49B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id h17so8029617wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sVt/rdeEBQJxQhCHaNNlJJAtPDszt4A5bvtFCOyl0bM=;
 b=Sc/GUxuyiRJdn91hjCasO8KQhK49SFIeOpJhYv2lzYtBvkAlPg1J9p06riSFlV52cg
 eqjong14hahD5tYf/SWgSY7FTLqjwLxFVOQjhZ0A+bLdZoOhW2Rj0yBMVKNunVjwC99i
 xCLJjxjHEERinfZ3cVdz25AdxZEv+UgtMEx58Klerqd/p/6PojbafmMNGuwavXsFq3gp
 oJlKuBoiUgKuDAyMrUQCXNfEDG0G/PbqoiELOZ07j1YQtFVQF1VQKS+1m5/THHK3ORhh
 4VnaEpCaBLqdVagjmeOKsx6g5zEOkqRVnilaL3kZpSR6ZuTJuVZQx8HHBuv0Ho6CTIHE
 DG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sVt/rdeEBQJxQhCHaNNlJJAtPDszt4A5bvtFCOyl0bM=;
 b=k5TnBeFLWUn9SySghsq/Qc3/kAXOqzUjXMYSbXekA5LkWpdHJrazAHp88mmlQdkL3g
 N78J9Y7wftkog0ZRDRA1/s6KBpo2KUc02KVY9uhR1XSZ+Re0B3pa76/Zldw8AaRV/zvw
 6v/9L0v171CrOl/IbDmOSqYvzuV+BSPKfOC3oOr5m+9sE/pWP+ym9lvoWfbKqY3dP7aQ
 5JNKvqJZLypxZHpqD+x7Tx53sxOv2JXn12xTvr0GgZ2bYe7t1an7nqwln3rOR/8mhn+r
 5RRUEK+Yki2ZH09SX4rCZ26Ay5lURWAAEgzDNACF7M+Jd8gxLjP6l7zSY/OVcXvl3fTD
 vpMg==
X-Gm-Message-State: AOAM533GJC5BS5ghlkP2psWNxnzWWkMUiCC9sUYnFZzGtiOu65f528k1
 VcXy7bYs3764kGbKKdffz2rsDw==
X-Google-Smtp-Source: ABdhPJzNu8NawRYjrPv3ZUrXYULqlHq3ph+lO3U+klIyj/QTDgnxMgxhqUqT5ChkSfSse1V3ZfphXA==
X-Received: by 2002:a7b:c2e8:: with SMTP id e8mr9708669wmk.103.1610734436402; 
 Fri, 15 Jan 2021 10:13:56 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:55 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/40] drm/gma500/psb_intel_lvds: Supply description for
 'mode_dev'
Date: Fri, 15 Jan 2021 18:12:58 +0000
Message-Id: <20210115181313.3431493-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Jesse Barnes <jesse.barnes@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/psb_intel_lvds.c:635: warning: Function parameter or member 'mode_dev' not described in 'psb_intel_lvds_init'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: Jesse Barnes <jesse.barnes@intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index f65a6f386caed..ace95d4bdb6f8 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -626,6 +626,7 @@ const struct drm_connector_funcs psb_intel_lvds_connector_funcs = {
 /**
  * psb_intel_lvds_init - setup LVDS connectors on this device
  * @dev: drm device
+ * @mode_dev: mode device
  *
  * Create the connector, register the LVDS DDC bus, and try to figure out what
  * modes we can display on the LVDS panel (if present).
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
