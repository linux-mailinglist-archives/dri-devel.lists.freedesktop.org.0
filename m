Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1224F50A20F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 16:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08E110E61B;
	Thu, 21 Apr 2022 14:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A2710E641
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 14:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650550866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H5k1rgXE1P7IbK6cMqND8jHr8Tf+eEFak/sZ9mPOKJY=;
 b=QkphaMkd/2f0icmD59VFPW+PAIiOPxqs5D4mrHhBJrZ2pocazbaCcSPkhxFtLC5yBwKdSW
 mVyy05Fs6g4SVxChADB1IFebzVLxI0XPFjwkdt0w8IEJYaKOaIjWn9qbz5T0hPo6zihW0f
 G85n146JrQbLPh8YJ+35LGu6hzXyW8g=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-u7bn323XPyaBl-OVo3_M1w-1; Thu, 21 Apr 2022 10:21:05 -0400
X-MC-Unique: u7bn323XPyaBl-OVo3_M1w-1
Received: by mail-qv1-f71.google.com with SMTP id
 j7-20020a05621419c700b004461f75de48so4018274qvc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 07:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H5k1rgXE1P7IbK6cMqND8jHr8Tf+eEFak/sZ9mPOKJY=;
 b=gu1MrDjfm3bgA3lSm5RVTWJdof/xLR37G5NzisaziafY/ocfTkAr/Ia0uzGS91XwqO
 LKNB5qdubfEPEOoa/RIAxme1vrCqwkwT7FRHeDgrMpSGO3sPJINVwXe2f52wvRSr2lpF
 pqvFEUSKEsnghibW+ZuevM6RRfYFo3eBIfoZkoA+kKlRlOWfC0nx5TSlAxHpwzQZVxdz
 oViz5YJMoeEvIPgSc09fVowzyJimpNwwW6TqKLZU6eamYqJpAfCv9cldgAESH5OiOM8i
 V0uB/I9mdKA/4TCs8EhLfMSMmPfp1lRPUYaCUKHTz+hDWyzq526JmsDhlFduYN55mtXp
 LPUw==
X-Gm-Message-State: AOAM53034O96Du5cDDof1uMs7SrqOcIt7mfOMlXLEeLCvUrMtTWHw0rA
 DSZ63Jk++V6fgo6NAuKwMl4ZKk/06Bewfm6JUfFJb4p5Cw3WUxBqv3CfZZkl+8etEOPM3fr6UBT
 ScqGyQseOs3eMtZ7KxvOQZwV/y38a
X-Received: by 2002:ac8:7088:0:b0:2f1:e898:2971 with SMTP id
 y8-20020ac87088000000b002f1e8982971mr17388782qto.152.1650550865030; 
 Thu, 21 Apr 2022 07:21:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxT8nLASqLzLkqUhCnNzC+DSX/0wzDIp2IM7/27GwXj/kq8GhqiNKzl6Dba3zy6dUouhyaww==
X-Received: by 2002:ac8:7088:0:b0:2f1:e898:2971 with SMTP id
 y8-20020ac87088000000b002f1e8982971mr17388760qto.152.1650550864784; 
 Thu, 21 Apr 2022 07:21:04 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 j131-20020a37a089000000b0069e7ebc625bsm2881419qke.78.2022.04.21.07.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 07:21:04 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: airlied@redhat.com, kraxel@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/qxl: remove qxl_log_level global
Date: Thu, 21 Apr 2022 10:20:54 -0400
Message-Id: <20220421142054.3751507-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
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
Cc: spice-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch reports this issue
qxl_kms.c:36:5: warning: symbol 'qxl_log_level' was not declared. Should it be static?

qxl_log_level is defined qxl_kms.c but unused, so remove.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_kms.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index a054e4a00fe8..9bf6d4cc98d4 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -33,8 +33,6 @@
 #include "qxl_drv.h"
 #include "qxl_object.h"
 
-int qxl_log_level;
-
 static bool qxl_check_device(struct qxl_device *qdev)
 {
 	struct qxl_rom *rom = qdev->rom;
-- 
2.27.0

