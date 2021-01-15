Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992602F837B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3D26E4A6;
	Fri, 15 Jan 2021 18:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC3F6E457
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:14:13 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id k10so8213961wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lUllZlLn2aeKUdYiVAeIic/5IUxXot0e1d7nGV4+J9E=;
 b=xHzJWvUBBvuWc4Xl5VACsWf7N/b0v4PM+Qxj0aEVX4T/Ialsfqoba2uENutm20zcbe
 SaHvLTlmH58mQ6cFwjcCCodq/QHt72Iu43Xb329LXWojJa7oAy5FXhy2ROEXFtld/q0I
 6Bkq0aU2nuUl1WAISSsKA03rO1HtN7OS/vQAo0Mu59atH1sWKQ0BOJRGdqbbI/AxDYJa
 mKMP7dh/5SkXbKhLTNWDNw72XJlZ69B4cfYOT2tlqPa+14eFXTZ3+232t6Gh/e4fD3UI
 5beVeeQ+z6ZFxtKsL6isJU1T08spSkRPfoQeca1f2M5VIPsgFuCTmP1gzibzEXNMEy+/
 sPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lUllZlLn2aeKUdYiVAeIic/5IUxXot0e1d7nGV4+J9E=;
 b=Ak7iUBCmE4+1c++UClCTwTbLnym7pqbpoBGQJgoVJCyIqSRsJTN9p1N2TptTxhlJVB
 ascIosxfaQgUbBUODhG3tLRwv4ukcaybb031rEmS8YgVKWV+znSpj4WrZSGQoZq9Mmlu
 5nyoyo8cKdNqAfN3TImtpz+qA3gdq6GgE46AbntPESWHdkb4LFci4PvvjoPNgUKgqHja
 e4G2GtANwPfNzO+nBckMPDghGkd8W8vW+ExW5r2x+z42o+/gRs7FOrbxIkCj/Xp+HAza
 Eur27vaI+D+wqrpLBxrK75ihzHFshYq5yunlO7+yRgQ10uZ1Sff7jzMQ4nDEVvUXzaXs
 Xrrw==
X-Gm-Message-State: AOAM532pYCNA9C+XHp6GVVlU7RLE2keepKIVDOP6Yq09R90ulepZZ9BX
 2PTZb3Wy372dW7k3YcuoZts/0Q==
X-Google-Smtp-Source: ABdhPJynbLDNvhU7p2qnSMtIi5F12pD7Q5un3SKOf86x40VZpdtU+jnB7rT+88JShOlhxgtI/k3xDw==
X-Received: by 2002:a1c:e2c3:: with SMTP id z186mr9844691wmg.144.1610734452136; 
 Fri, 15 Jan 2021 10:14:12 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:14:11 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 38/40] drm/gma500/power: Remove excess param description
 'state'
Date: Fri, 15 Jan 2021 18:13:11 +0000
Message-Id: <20210115181313.3431493-39-lee.jones@linaro.org>
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
Cc: Rajesh Poornachandran <rajesh.poornachandran@intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Benjamin Defnet <benjamin.r.defnet@intel.com>,
 Alan Cox <alan@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/power.c:190: warning: Excess function parameter 'state' description in 'gma_power_suspend'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Benjamin Defnet <benjamin.r.defnet@intel.com>
Cc: Rajesh Poornachandran <rajesh.poornachandran@intel.com>
Cc: Alan Cox <alan@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/power.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
index 89842e09cd2aa..56ef88237ef66 100644
--- a/drivers/gpu/drm/gma500/power.c
+++ b/drivers/gpu/drm/gma500/power.c
@@ -180,7 +180,6 @@ static bool gma_resume_pci(struct pci_dev *pdev)
 /**
  *	gma_power_suspend		-	bus callback for suspend
  *	@_dev: our device
- *	@state: suspend type
  *
  *	Called back by the PCI layer during a suspend of the system. We
  *	perform the necessary shut down steps and save enough state that
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
