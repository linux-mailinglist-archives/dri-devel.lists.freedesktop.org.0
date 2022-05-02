Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EBE5172EC
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 17:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A6410EEFC;
	Mon,  2 May 2022 15:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D345610EE73
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 15:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651505946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGLa+lXukZKp8BbfHT/fB6GHKDmAj4WrWWwniVTMInI=;
 b=hkPNiZRoH6GEwngrFrI0qpHNduYldFp5GaXNrGphPzHw0X0uLFE1xctYciYwNQO4Que6JH
 WXLZeL1o6RrO0B2ZGtLwz9ixq6gpd4s9jjKh6z9vvZJfJgiuNhGtQXGU2foFRgVIn2RHEo
 DJuvTnuWbOFsWnpXhdqwhQiBye5xpic=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-ii-F6loROZSUp_jzL2zf2A-1; Mon, 02 May 2022 11:39:05 -0400
X-MC-Unique: ii-F6loROZSUp_jzL2zf2A-1
Received: by mail-wm1-f70.google.com with SMTP id
 d13-20020a05600c3acd00b0038ff865c043so10130426wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 08:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qGLa+lXukZKp8BbfHT/fB6GHKDmAj4WrWWwniVTMInI=;
 b=h+j/YyUXviKQuWLRMDXG0hp03eV7Y/BcYa9Q3OeAInprp59yaHQL5uyxSusmCFgqU4
 IMR7qtnhi8yHdhnjCrUFakP71g/X61bknjFL4O0/2okDhEbXmhSUnKAH9NZVMN78QvA3
 LcvlQ5+c6lcNK+TTcnd87nt44xBCLGvDU6WuaEaHraJmTRs+GnbOtuhUalQzGB1CsNVl
 P2TrxjWWtlGH6SMwgCY6YT/bT51XpiHG+4raL4z2aHW5a7UuX6u+aZIbQRTSmg4stuKR
 CP01qWrskB11yVvknuvw+skkWpoP3jNqk4OcAkQe0+O309pMOsffL1CU2F4pHBWm5jcb
 CGxQ==
X-Gm-Message-State: AOAM532xI8Cmur3msB9JbABaDTxLHGi7b6scl9v9q1sk1CwOMuMVdiNl
 x6d7m7bBbIuuLng9vJUqJkAbs6BiXT8Z8dYzMTlVDMVV09IU/5FeS06FnWu9BYzY9EAEi/XSrA0
 q7TYtw8os47xdMtNnLBw1OOhhy/m4
X-Received: by 2002:a05:600c:268b:b0:394:13d6:c176 with SMTP id
 11-20020a05600c268b00b0039413d6c176mr11124073wmt.184.1651505944630; 
 Mon, 02 May 2022 08:39:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWSbJhAkXVVu+oVX5bF/r4ippsODeDHinPDW6sbIqFvmnW9SSlA9Sk7qtkg3/18TRsa7LmjA==
X-Received: by 2002:a05:600c:268b:b0:394:13d6:c176 with SMTP id
 11-20020a05600c268b00b0039413d6c176mr11124061wmt.184.1651505944432; 
 Mon, 02 May 2022 08:39:04 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 v28-20020adfa1dc000000b0020c5253d923sm7294489wrv.111.2022.05.02.08.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 08:39:03 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] drm: Remove superfluous arg when calling to
 drm_fbdev_generic_setup()
Date: Mon,  2 May 2022 17:38:58 +0200
Message-Id: <20220502153900.408522-2-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502153900.408522-1-javierm@redhat.com>
References: <20220502153900.408522-1-javierm@redhat.com>
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

