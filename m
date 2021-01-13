Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C302F4DA7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B010E6EA74;
	Wed, 13 Jan 2021 14:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BED6EA64
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:55 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id c5so2410076wrp.6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BzS3qZvHYgaPOU1XJ8pzaZK9gKJ87LqYUfVBvla6rAk=;
 b=r5T8a1xoDb37mL9jIaJql8CuqF65c13F0JN0BADlmBJtoOSiLcHLQQE0zXy42jaISG
 L+mOCdoDYshlaFwezWabUiL61Rpla5d4FFyMQCCDUECkUNO1e6hFSngniGnbMl3TwRw+
 0YBTdOFYXyzAsLFnu8j9xEbDQHDJuqj6YN1tK1TxHEmTQvc5vFrEV8J9bQUUCzhlQc/L
 uEKFperGkCjqCYYjupjJDiL5O1pf0WMWVTyoYuZMKqCrDTJBlNsucq2nS6FxjcouMcm8
 ZJnYRxOZO/pAbljJIw7+ZWc1fEo6pqh7BSCCdYtMIEOpTqkl93Az01qWCSLh9dnj+3/e
 0yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BzS3qZvHYgaPOU1XJ8pzaZK9gKJ87LqYUfVBvla6rAk=;
 b=ftlRTnABwAVZ3vvFYlD5lebN8VnHli8DzsLBMukl7FIAfg+yLSpeyHLwEHOj/MV58h
 Ibfx/dtUUoCehYQNXlqJ/isHrMXJpyVekqFxAmXnN+VfcFVKC3HViBqFuDQ/jhb0qTrV
 tOee41a2NRpKdYU/60rdzLz0xZZw13970p8TvdSBTox04NxepS+2VWpYoERpnae9nuIV
 iUpo2mgPxAhyCpd2TPaspRrHHt9JBpAOAHiphVF+JlTI6bNeS7KbgguwdaPiQMlHUBbf
 F+R4T+mGe6Ir5w6b4TZsUJ1mgnDcBzdhboBuOXFiQ9TeCFWI1/z5+IJrzOJm1CkqDPUw
 MM5A==
X-Gm-Message-State: AOAM531SAqBfSxJbyx5wufPDmtVQoZGezJlpvKrsf84SMB5mGoUVm94v
 OsFfqzRJCP2ViBCiFOvN/ocW6w==
X-Google-Smtp-Source: ABdhPJwWW8Mh0VQz40rTJwa/0e7kE/8p2NvxyZJuFij95jhV38CZu46wo+9mK5ByYWZwB9G7KRUEhQ==
X-Received: by 2002:a5d:5227:: with SMTP id i7mr3134555wra.68.1610549454505;
 Wed, 13 Jan 2021 06:50:54 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:53 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 29/31] video: fbdev: s1d13xxxfb: Function name must be on the
 2nd line in kernel-doc
Date: Wed, 13 Jan 2021 14:50:07 +0000
Message-Id: <20210113145009.1272040-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, Thibaut VARENE <varenet@parisc-linux.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Dooks <ben@simtec.co.uk>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/video/fbdev/s1d13xxxfb.c:515: warning: Cannot understand  *

Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Cc: Thibaut VARENE <varenet@parisc-linux.org>
Cc: Ben Dooks <ben@simtec.co.uk>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/s1d13xxxfb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/s1d13xxxfb.c b/drivers/video/fbdev/s1d13xxxfb.c
index e6e8bc74412c6..b21627c07f8d0 100644
--- a/drivers/video/fbdev/s1d13xxxfb.c
+++ b/drivers/video/fbdev/s1d13xxxfb.c
@@ -512,7 +512,6 @@ s1d13xxxfb_bitblt_copyarea(struct fb_info *info, const struct fb_copyarea *area)
 }
 
 /**
- *
  *	s1d13xxxfb_bitblt_solidfill - accelerated solidfill function
  *	@info : framebuffer structure
  *	@rect : fb_fillrect structure
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
