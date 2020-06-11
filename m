Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC3B1F6421
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 10:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B0B6E8B5;
	Thu, 11 Jun 2020 08:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D156E8B5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 08:59:35 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p5so5273173wrw.9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 01:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yYF1qLiVcqC5+ofUdD+N961rSzft8TLHXK3pdCiJAf4=;
 b=cNtnL98yUbK2MCL+1+RKeOROIoB5KILcEmhKmzVSQ0JHP2sFlFMpJK5x2EyYKhMjev
 UWYHxlDYULDROij0/0uRsiQ7ejZvFyVLTCtOnTXZOy6SFSZgP/Um0CgXGUjh7L2HZZzD
 fxpqR3Hc6bXw3PHPrSq/6JElnTuXsntnW7cB3rappNwxzCynIC+beZ119+lurecYIHfz
 DUDRypO35acuvv2rERRb1XWP0578Z+NQGLRsa2VyEQ4cWvO3hFaYL39RyrPgjfUzY+2P
 +ILv81nreYMMHTMpuoJ+R43utIyD2ldbbWuPkOYdZsGJSWeMQSL3WzQ667IWnPZJ50Ph
 tEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yYF1qLiVcqC5+ofUdD+N961rSzft8TLHXK3pdCiJAf4=;
 b=W0H9AzZOqEmObmgMP7yeCkuqOMxWkCEaWSlX+tzyjbsf+lAvJX2M2AUrL9kxGPPsPB
 qdzzZ8ps4BH2lHdq81ELR/67XnhyKEiUZTQWlJa4VObkC2QzE7M440ZnZ4sYC24ymwiE
 8Fl+YLXxe60DHLsIgcYAI2bYLAd9yUxEh9dqHEc2fXY3/pZ8y+tsMwj87Lh5is8NCk6S
 CwMz6jPGex2na/OixGPTJfIZnk/8cX2Q5I3SF4xIBdoIclRiHItuT7AO0jyfE0KwSgzR
 KHX95sYC1oqipBwRwWqnozpMuOpsZMwoowGxu1FH6wGj0t5iVcyhIBogOZoNUeNEkYWr
 LhGg==
X-Gm-Message-State: AOAM530NLsBa83fbgtwyRgGbe0OsjlNDV8+FEO5c+2cipnC6WjPyCJ2X
 TZUo2+zcwW8g34TAjsFphWc=
X-Google-Smtp-Source: ABdhPJzO7ZN5HbQmNp6JjblxAuLk8K1tfrLxFTX4g+Bjh4JseUCjO7OPQwFC79X7Kj44jaFBkZmWUw==
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr8137121wrm.93.1591865973844;
 Thu, 11 Jun 2020 01:59:33 -0700 (PDT)
Received: from cizrna.lan ([109.72.12.141])
 by smtp.gmail.com with ESMTPSA id o20sm4205023wra.29.2020.06.11.01.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 01:59:33 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] panfrost: Add compatible string for bifrost
Date: Thu, 11 Jun 2020 10:58:44 +0200
Message-Id: <20200611085900.49740-2-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200611085900.49740-1-tomeu.vizoso@collabora.com>
References: <20200611085900.49740-1-tomeu.vizoso@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mesa now supports some Bifrost devices, so enable it.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 882fecc33fdb..8ff8e140f91e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -677,6 +677,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-t830", .data = &default_data, },
 	{ .compatible = "arm,mali-t860", .data = &default_data, },
 	{ .compatible = "arm,mali-t880", .data = &default_data, },
+	{ .compatible = "arm,mali-bifrost", .data = &default_data, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
