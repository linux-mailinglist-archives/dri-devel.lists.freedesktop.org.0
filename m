Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2962F8373
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A452D6E48F;
	Fri, 15 Jan 2021 18:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0916E499
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:47 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id o10so2358861wmc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JrCpsOWXkuV27y08h0Q+/ggDFvdkszKPoUD+Vqs5v1w=;
 b=eVFjcBEjg45hUFWoVNeBlMVtPQHjgY33qJV2wsQfY8RkMAyofnRpc0YZ1XYm+r0A7Y
 Zbtu3nTeYVVwJ0jgnSciJOe2iz1iAebYEOimoRIIy5WqtDESpunxBekCZ7xDMWEMoHdZ
 rLV9mZvOvRDJ/dBtu6HIjJtJSljsv2pn9y+p2be/yBdsXEG3llyBDmQekQKxQLHH9D0i
 CfIbL+qXIcylUVdMz/dkHb1N+PS3jTYTpb45WnOA47U6ex0lSL88A2NUfuFPAH8eaqOV
 4nzXINrDwQoCI00pVGUjquUOFC4sguTTyQTZ6+iOqwYnnbKhsXefFRKH/xVaCVWYkCKc
 YLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JrCpsOWXkuV27y08h0Q+/ggDFvdkszKPoUD+Vqs5v1w=;
 b=qNmeMzl5c3IPOOeQicv5au7wi0J/ieykikKvkbbjRVkRfSQdmeT+OpuAGGI8kCmGTi
 JqwgPcHkjPmmm37mQySKPJKhctjWXkduAmq5kCRuhirp4iR0iDDyNx4iJJnMytkp6Bh4
 Ksrph5ZhL8d4nJjNXnpyTTTVJRhYWEsQMi4Eq9nizJmrn2Qa9gU78BWUgTonm/ggSFjs
 UsAk9hopSjq2KO4F4iutXkTXlW83c6GcyhFeiQ4KZ8pNtT9nRkx+HYY++oLd8Y+MCEs/
 v47tCU0+iKcXr9kre9U1YsTb7nfwAoVqf6/rXCpMpc261PKSV5yGabcJmW1WgOQ4EUq5
 1Ljg==
X-Gm-Message-State: AOAM530zSABjDmRf6V7riONbZLZPHAhZndEW+VjbXua+0N3jLDtlQzcd
 uc4RZISwhkFcPwQ5UXjiqswZOA==
X-Google-Smtp-Source: ABdhPJweojZ0h6yHoiV/u4YZr4avFre/S61l1Q1UIOKC9yloexr0L9KKgA+LNR50Re7apQpMu0NL8w==
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr9997363wmf.149.1610734426511; 
 Fri, 15 Jan 2021 10:13:46 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:45 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/40] drm/gma500/power: Fix a bunch of *dev documentation
 issues
Date: Fri, 15 Jan 2021 18:12:52 +0000
Message-Id: <20210115181313.3431493-20-lee.jones@linaro.org>
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

 drivers/gpu/drm/gma500/power.c:101: warning: Function parameter or member 'pdev' not described in 'gma_resume_display'
 drivers/gpu/drm/gma500/power.c:155: warning: Function parameter or member 'pdev' not described in 'gma_resume_pci'
 drivers/gpu/drm/gma500/power.c:155: warning: Excess function parameter 'dev' description in 'gma_resume_pci'
 drivers/gpu/drm/gma500/power.c:189: warning: Function parameter or member '_dev' not described in 'gma_power_suspend'
 drivers/gpu/drm/gma500/power.c:189: warning: Excess function parameter 'pdev' description in 'gma_power_suspend'
 drivers/gpu/drm/gma500/power.c:189: warning: Excess function parameter 'state' description in 'gma_power_suspend'
 drivers/gpu/drm/gma500/power.c:216: warning: Function parameter or member '_dev' not described in 'gma_power_resume'
 drivers/gpu/drm/gma500/power.c:216: warning: Excess function parameter 'pdev' description in 'gma_power_resume'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Benjamin Defnet <benjamin.r.defnet@intel.com>
Cc: Rajesh Poornachandran <rajesh.poornachandran@intel.com>
Cc: Alan Cox <alan@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/power.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/power.c b/drivers/gpu/drm/gma500/power.c
index f0fc171e6705e..89842e09cd2aa 100644
--- a/drivers/gpu/drm/gma500/power.c
+++ b/drivers/gpu/drm/gma500/power.c
@@ -93,6 +93,7 @@ static void gma_suspend_display(struct drm_device *dev)
 
 /**
  *	gma_resume_display	-	resume display side logic
+ *	@pdev: PCI device
  *
  *	Resume the display hardware restoring state and enabling
  *	as necessary.
@@ -146,7 +147,7 @@ static void gma_suspend_pci(struct pci_dev *pdev)
 
 /**
  *	gma_resume_pci		-	resume helper
- *	@dev: our PCI device
+ *	@pdev: our PCI device
  *
  *	Perform the resume processing on our PCI device state - rewrite
  *	register state and re-enable the PCI device
@@ -178,7 +179,7 @@ static bool gma_resume_pci(struct pci_dev *pdev)
 
 /**
  *	gma_power_suspend		-	bus callback for suspend
- *	@pdev: our PCI device
+ *	@_dev: our device
  *	@state: suspend type
  *
  *	Called back by the PCI layer during a suspend of the system. We
@@ -208,7 +209,7 @@ int gma_power_suspend(struct device *_dev)
 
 /**
  *	gma_power_resume		-	resume power
- *	@pdev: PCI device
+ *	@_dev: our device
  *
  *	Resume the PCI side of the graphics and then the displays
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
