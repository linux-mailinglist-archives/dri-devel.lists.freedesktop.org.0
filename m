Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7522F83A9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419596E4D2;
	Fri, 15 Jan 2021 18:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61876E4D2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id 7so2973249wrz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zEPxdikffcTW2XPBOoX0ED37z3NmpTHI0lnPWz6mmx4=;
 b=elNfSM6dpymdVu7cXnuqL/DyR6BGtAJr1JNqz//XpUL5XJAzQV5/ybGb5qx/p8vqkd
 eDpo+SxY14xZcS3DkqCIoGM/ppMnX50g9C+A0KjCvVHdTJwrUrfpRyUhQCl7rHqqIIv/
 kzFFqsbookfXD72VlfD/4p/ixKXwsrx/l/Z8tVCR1ONjmeCdVMdGOK8LhKhm4tH3bnST
 NKGf5s6rEgwqlqLe3P1DWP9cFKUHn/HfYtkdjsMvkaXqTgaRU+iDWcK9BM33KpKTtOEs
 gk6Zo8Bs9IFT8Kt7v36mznUsmWa6uYU0fjD2nptZf0ThRXkPGfT2zmAn9B4egyZQYRm4
 607A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zEPxdikffcTW2XPBOoX0ED37z3NmpTHI0lnPWz6mmx4=;
 b=Sgo3CTJEKi70205MKoUn0ZfvOi+sEykzjhvjzGRYyoIcEEVsV+FtvnGa0ZV76px7FB
 8Ede6Ct7gmEmCCpjNju1/6J/M1L0hBsH9SRcM3rYK9DcLDUbeFw7mAl+eBP+0ELU8kUM
 U4/2kMU4lAYwtT1T40yrd1p+xkC/yFZg9iGA0wdIhll6l68KUL2Evtn0pX0XIpS4O8Yy
 YZxvwdBOpksphYDm62ETlRYmVBwzk3DYmHPOTpdYpspLhdrPwYUuAfLUg7qGnTxUZHoe
 Is7lqnDYTetLINDwDa0aeacb5vfnpC1nLxjZLdLcUf3en5+iQ9RngfLAux0Hp/jUPRfE
 1uPA==
X-Gm-Message-State: AOAM533NKlAY6A+V4Uqcm0xsdHaKpwDmLryRUUY2TaMA2MzYmVOZCed4
 RmAagpILPsmGFVOj7V45PG/r4Q==
X-Google-Smtp-Source: ABdhPJx9fUXhSGU2SF0jAgigDyWvaMoz7pHYrsOUFdwXDwpjlpmnzjzCUrVTtzojo8Xb3TAl/uMPIQ==
X-Received: by 2002:a5d:56c3:: with SMTP id m3mr14531708wrw.419.1610734583554; 
 Fri, 15 Jan 2021 10:16:23 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:22 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 12/29] drm/gma500/psb_irq: Demote kernel-doc abuse
Date: Fri, 15 Jan 2021 18:15:44 +0000
Message-Id: <20210115181601.3432599-13-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/psb_irq.c:134: warning: Function parameter or member 'dev' not described in 'mid_pipe_event_handler'
 drivers/gpu/drm/gma500/psb_irq.c:134: warning: Function parameter or member 'pipe' not described in 'mid_pipe_event_handler'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/psb_irq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index 361e3a0c5ab6b..5cceea9be5348 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -126,9 +126,8 @@ static void mid_disable_pipe_event(struct drm_psb_private *dev_priv, int pipe)
 	}
 }
 
-/**
+/*
  * Display controller interrupt handler for pipe event.
- *
  */
 static void mid_pipe_event_handler(struct drm_device *dev, int pipe)
 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
