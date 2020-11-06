Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD382A9F5D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023996EB21;
	Fri,  6 Nov 2020 21:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40A16EB21
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:49:59 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k18so2644582wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 13:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ue3FoQJoMgBlIukOkf8MbD26USrDaAOvZdGWpXVWbrY=;
 b=M9M573Ul/P22elihygTSgOrYwuABiN98HcCxBcTWjwtR/8XWlIeqsnJqVrqplr+Hbg
 GxfTPhYgAI24Bg2FrOkqrWiJyxdQSNoW9Zs5VayctWxJnd/T+j87Q/fxsK8UbQP1P/Bq
 TZq1XFZ7jWuuaX4IYcHZ54/M2M9toRE3AVLih/FcyQV/FIjNj9473s2waCQlrFrvFeID
 WgLqtNbMWWQ8gYQjgfpQDsvRtohrRa812F4p0/ahW0/ySpdooIQAwRHlOcslW4PwDPb3
 PSHC43NNEID/ErdejNgSQtwoCLol9B+ChkkArGESsdmRpq9LdGUO1TBYtSMrIaY4vmlf
 KhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ue3FoQJoMgBlIukOkf8MbD26USrDaAOvZdGWpXVWbrY=;
 b=M60q/yFt8rrZDDKJD3ysaSfqbB1I2qK0MZGax212mAtYYpTl1KE9VvPscjAW6LMw/w
 HHK/tx5No/2Sqkg+6b86YBmTeuNJW5TEeRdZXAvqrVFERtIGsj4u9FwjQKjCG54hqjRo
 Kdx6zGYYsKXuklL5EClHHTepMPwH/duiCN7K/2P+9SbcrlDqgSw3evn/rVQBlv1pTfLA
 cg3kunLI0+lwhjjSZwsb0v5UmJRwDmQkyv29xwCzzkLOvtjWjlUg2b7ZPdAbPHY2YHW9
 iF81lmYtFqua9fgA7HfhtxWVyw/kw0nMUpjW3/mZcnWHEa7hzTnpYSs6b2A2+hOoSphs
 oKDQ==
X-Gm-Message-State: AOAM5330UG3K2toowF8NJF0YxtIKpLw/gfofrR3OG7HuA1776WAKCrw7
 qdxhBZHFD4xeirmNYP6mi1u3xe9w6WyWqlJi
X-Google-Smtp-Source: ABdhPJy9cqifVe8QK/a7GE5NrzCUlrwh+BOYIv2oVWVg9TnOBCYHbcxD64T7Hz9gmZyKiCsN2pUXKg==
X-Received: by 2002:a1c:f20d:: with SMTP id s13mr1718240wmc.156.1604699398532; 
 Fri, 06 Nov 2020 13:49:58 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:49:57 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/19] drm/mga/mga_dma: Demote kernel-doc abusers to standard
 comment blocks
Date: Fri,  6 Nov 2020 21:49:34 +0000
Message-Id: <20201106214949.2042120-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
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
 by <jhartmann@precisioninsight.com>, Faith <faith@valinux.com>,
 dri-devel@lists.freedesktop.org, Keith Whitwell <keith@tungstengraphics.com>,
 Jeff Hartmann <jhartmann@valinux.com>, Gareth Hughes <gareth@valinux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mga/mga_dma.c:29: warning: Cannot understand  * file mga_dma.c
 drivers/gpu/drm/mga/mga_dma.c:455: warning: Function parameter or member 'dev' not described in 'mga_do_agp_dma_bootstrap'
 drivers/gpu/drm/mga/mga_dma.c:455: warning: Function parameter or member 'dma_bs' not described in 'mga_do_agp_dma_bootstrap'
 drivers/gpu/drm/mga/mga_dma.c:629: warning: Function parameter or member 'dev' not described in 'mga_do_pci_dma_bootstrap'
 drivers/gpu/drm/mga/mga_dma.c:629: warning: Function parameter or member 'dma_bs' not described in 'mga_do_pci_dma_bootstrap'
 drivers/gpu/drm/mga/mga_dma.c:1150: warning: Function parameter or member 'dev' not described in 'mga_driver_unload'
 drivers/gpu/drm/mga/mga_dma.c:1159: warning: Function parameter or member 'dev' not described in 'mga_driver_lastclose'

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: by <jhartmann@precisioninsight.com>
Cc: Faith <faith@valinux.com>
Cc: Jeff Hartmann <jhartmann@valinux.com>
Cc: Keith Whitwell <keith@tungstengraphics.com>
Cc: Gareth Hughes <gareth@valinux.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mga/mga_dma.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mga/mga_dma.c b/drivers/gpu/drm/mga/mga_dma.c
index 85c74364ce24c..1cb7d120d18fe 100644
--- a/drivers/gpu/drm/mga/mga_dma.c
+++ b/drivers/gpu/drm/mga/mga_dma.c
@@ -25,7 +25,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
-/**
+/*
  * \file mga_dma.c
  * DMA support for MGA G200 / G400.
  *
@@ -435,7 +435,7 @@ int mga_driver_load(struct drm_device *dev, unsigned long flags)
 }
 
 #if IS_ENABLED(CONFIG_AGP)
-/**
+/*
  * Bootstrap the driver for AGP DMA.
  *
  * \todo
@@ -610,7 +610,7 @@ static int mga_do_agp_dma_bootstrap(struct drm_device *dev,
 }
 #endif
 
-/**
+/*
  * Bootstrap the driver for PCI DMA.
  *
  * \todo
@@ -1143,7 +1143,7 @@ int mga_dma_buffers(struct drm_device *dev, void *data,
 	return ret;
 }
 
-/**
+/*
  * Called just before the module is unloaded.
  */
 void mga_driver_unload(struct drm_device *dev)
@@ -1152,7 +1152,7 @@ void mga_driver_unload(struct drm_device *dev)
 	dev->dev_private = NULL;
 }
 
-/**
+/*
  * Called when the last opener of the device is closed.
  */
 void mga_driver_lastclose(struct drm_device *dev)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
