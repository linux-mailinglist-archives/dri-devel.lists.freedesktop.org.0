Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBAE2F8380
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ED76E457;
	Fri, 15 Jan 2021 18:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8176E49F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:14:03 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id g10so8393511wmh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+0p9zOjVy0LRiK477P9KUaWrIsEvH1MWK05iKsSjHrQ=;
 b=lmFcqa/mseKa8mnML6PJecGiZ8SxOYeYWnTqqbYBatmO8biGq7K8RpAi7Jz52YFDyx
 KSxyAT5AFEIc3znyzbwr9qVzmkNpw9QTm15wvCS3PtQSz9EbPruetbXiahzjZbFskPE3
 fB2eRAKEX33jhUxXKdnEF4SZOxkUoaRka1IsBxfgLYS4x7aePWvQWE8qWmpFOK0M2oJy
 zIoB8FRwKWh4QU0seZ6LwXxELNznUrvnUhD6a6opaZt0TXRdAmK3aKk7Bg150QoHORU5
 oQ/QCkclp5Pi2InvETySTFtnJR3Cgh5hOu9J4dB5YzmpZj/DTPBMi701y7pfX6h9of0f
 kzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+0p9zOjVy0LRiK477P9KUaWrIsEvH1MWK05iKsSjHrQ=;
 b=Sa/UbDKsFDuvGvQj9Zr6IsK7/kjKMqApwKSt677YRpkIDVmryg1WlJ+kRFyxuYflJe
 3HfkR8j9xqnAF3UyP1nSnzlJHHTxFZEiCDXMEyRXvP3Oij/U/cTjM7S5WSKb4VNi3z55
 9uIwb/ME2TQN2KxGwahmT2dEkQGH6J/KrpwFDpm5xSXWRCtF5zmdGGR8BrjWQnbuJlI3
 1IcgZ46i1vUi1m50csHhgztXfuXf6uFVnw+nx4qJfUnbEfo78sD6BtVll3Aup9WMHtGI
 HmcEhFdgSof0oGPDtZlKSa2/oy+doCAxcYWiP9mnnTGjaDvcDcrkP6zsoC/q/ScebRJQ
 a+oQ==
X-Gm-Message-State: AOAM533BXpUrXKZLdg/jBz77RVPemkfu/eX3/Vr4AG2DVtTYF/W5aFGF
 lGei8OjVMhQ1Ly8UOyG1aLkLAw==
X-Google-Smtp-Source: ABdhPJxwcEN3TY5oIWcCMU0IpVvqUC2z82+4QsITRQHihwoLctM4iYytSxJx/v5qpT/6dxCkZMwiZQ==
X-Received: by 2002:a1c:608b:: with SMTP id u133mr9766353wmb.140.1610734442619; 
 Fri, 15 Jan 2021 10:14:02 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:14:02 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/40] drm/gma500/psb_intel_modes: Provide missing
 descriptions for function param 'adapter'
Date: Fri, 15 Jan 2021 18:13:03 +0000
Message-Id: <20210115181313.3431493-31-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org, Jesse Barnes <jesse.barnes@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/psb_intel_modes.c:17: warning: Function parameter or member 'adapter' not described in 'psb_intel_ddc_probe'
 drivers/gpu/drm/gma500/psb_intel_modes.c:51: warning: Function parameter or member 'adapter' not described in 'psb_intel_ddc_get_modes'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jesse Barnes <jesse.barnes@intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/psb_intel_modes.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_intel_modes.c b/drivers/gpu/drm/gma500/psb_intel_modes.c
index 88653a40aeb5c..60306780e16cd 100644
--- a/drivers/gpu/drm/gma500/psb_intel_modes.c
+++ b/drivers/gpu/drm/gma500/psb_intel_modes.c
@@ -11,7 +11,7 @@
 
 /**
  * psb_intel_ddc_probe
- *
+ * @adapter:   Associated I2C adaptor
  */
 bool psb_intel_ddc_probe(struct i2c_adapter *adapter)
 {
@@ -43,6 +43,7 @@ bool psb_intel_ddc_probe(struct i2c_adapter *adapter)
 /**
  * psb_intel_ddc_get_modes - get modelist from monitor
  * @connector: DRM connector device to use
+ * @adapter:   Associated I2C adaptor
  *
  * Fetch the EDID information from @connector using the DDC bus.
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
