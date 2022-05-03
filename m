Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E50C4517E48
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 09:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B0010EAB8;
	Tue,  3 May 2022 07:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF99A10E77B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 07:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651562152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VNf4e3fbyBJGkVRkEbfckfxgCWLnKBLAoem7Lai8HII=;
 b=Mi20on+aCmCGK+OnttvauSXAsi/DaTHwwQ0o9jOJMGBxhnFANQ5xCuqsq9QH6tdD10Omc8
 4AJbaEXeZ7Yh+JZBCXHExHUuvdIBCGWz7a6MFIO3bYX/3nPi3jarVgmwtJcu+f0GI58nOA
 Haeiy/0jHH3Q/q4P1zeJzuJT8rhfoFw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-VXNfdJtCM4ej7tLI2MYZCQ-1; Tue, 03 May 2022 03:15:51 -0400
X-MC-Unique: VXNfdJtCM4ej7tLI2MYZCQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 b10-20020adfc74a000000b0020ab029d5edso6029221wrh.18
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 00:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VNf4e3fbyBJGkVRkEbfckfxgCWLnKBLAoem7Lai8HII=;
 b=HYnZ2mumGOVsGBzS4+yfNkvpTGCWncA+ZZyLsIMxFGVOxy2k7rb4jsuy+M7FprUf/d
 YinbrEy7++SMyc+3qCL4HwzQhYdY0PnE+W1WEsFlGGYarCNStjqBiD8En8MUj9ioK+vz
 kfyftBzl6ISP3/qcUOX2FIn3tEHTug/Gn9sUk+wzG1TsJ5etb0Jzdb6Ckc1H7j+/4xG4
 Dtfgfy3wKdJG1SCJOzlGtLOreDKxPbdrw7XCDCODuikOZjZoctoQZVbcYGgnSxxEEmOt
 iQTfU7+vJDkhrOIBnTIGsuWxGetV1U7FYnZQBn9ESxDhvwWivdCIr7CosqhHE5xjstXy
 aWvg==
X-Gm-Message-State: AOAM5333DaqVXR8ynLeWaWkWuRAe1eaLDyp/GMVsqIiQOt2Zl/DOO/M6
 tcQNPBVGpo7FyFqHXsCAUvAvHpUfZ9Mbs3XNGrZe4p91DRj9ZoWbiK7SAajZ3W/iT/xub0wu/yy
 LdSU9VFfqaTFuA2itOdn9yegoN2wp
X-Received: by 2002:a5d:4307:0:b0:207:9f82:e238 with SMTP id
 h7-20020a5d4307000000b002079f82e238mr12237318wrq.430.1651562150608; 
 Tue, 03 May 2022 00:15:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyt/DpumST4sznzbp8voI+uEPyajFQx/vgp8YQ3FbrRg/zCpbZ5SRq2WP4wKlQfVMCSVT2fYw==
X-Received: by 2002:a5d:4307:0:b0:207:9f82:e238 with SMTP id
 h7-20020a5d4307000000b002079f82e238mr12237310wrq.430.1651562150401; 
 Tue, 03 May 2022 00:15:50 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c339400b003942a244f33sm1035387wmp.12.2022.05.03.00.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 00:15:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] drm: Remove superfluous arg when calling to
 drm_fbdev_generic_setup()
Date: Tue,  3 May 2022 09:15:38 +0200
Message-Id: <20220503071540.471667-2-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503071540.471667-1-javierm@redhat.com>
References: <20220503071540.471667-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_fbdev_generic_setup() function already sets the preferred bits per
pixel for the device to dev->mode_config.preferred_depth, if preferred_bpp
value is zero.

Passing the same value to the function is unnecessary. Let's cleanup that
in the two drivers that do it.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

(no changes since v1)

 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 2 +-
 drivers/gpu/drm/tiny/cirrus.c                   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index fe4269c5aa0a..ace92459e462 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -349,7 +349,7 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 		goto err_unload;
 	}
 
-	drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
+	drm_fbdev_generic_setup(dev, 0);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index c8e791840862..ed5a2e14894a 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -601,7 +601,7 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
+	drm_fbdev_generic_setup(dev, 0);
 	return 0;
 }
 
-- 
2.35.1

