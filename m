Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FB82DBF9A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 12:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF956E0DF;
	Wed, 16 Dec 2020 11:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E756E0DF;
 Wed, 16 Dec 2020 11:42:18 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id b9so7318171ejy.0;
 Wed, 16 Dec 2020 03:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vpFk2jW++o/c5mecPREIAGYZAOvlUctt44C0JGqrkMg=;
 b=X9qwLlVj2vFqyrsO4c4Ef4BcFxY4hXr24RrggjGJfJEACj7B7Q+qFOD5yW+t/h87uq
 6pqc6JCK6ZNBHxTyoRFlhWVdX7wzR0Q/HQzp9u/q486tt73fIFfFMhnUBFn6RI/DsMN2
 MLmWemRc0DE3pO8qVk8LMSLHgx5mcRqtkLWaRBeceIhjtSCf0+ycCgjznPHm+5QQyUvN
 c70Hz945tKQLQ8ql1JVrqyo6leSmw7pw+G06uJCsMVCoC19qtAr48TzN6f1KxJeYTTHG
 Bv8dyjADbkEn5kYa3QfRvS4dbk5ytfsokbGYz8pej6ENBwEOEu8PL/d3GA2qBxqg/at+
 wV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vpFk2jW++o/c5mecPREIAGYZAOvlUctt44C0JGqrkMg=;
 b=OTWmedj4eEERNKAV2WHBz8K0Q4TP4WBHlcUJSJJJnBUW0gimHfsVrt1LrapTbl2wNX
 +lur/fXNy+1IOHvBHaruAj7mbCpFkDK/1U2JWDyQCQjmyfjBJ8d/udTMJgw3ChMOeY2N
 eq5Ulk13AVzSZIkEVhGo/K7BfxMQsQ5VW6cMzbVrELJMqXBYxO/j+Z5VQQLGPKmw5RVN
 8dvMNvg0sVJdCPdAGrCZkYOxvg9HbWVxLuhnSigwSMCw0j+S4rpwUAhC37IoYomcYstb
 NiVgVgRLSZiDEg3wCu68uZsElhxR7Ar4TCzddUBBvcDHL0jpQ/WudlNXjT0oPKR+36zA
 4Byw==
X-Gm-Message-State: AOAM533mr6JVy5QNDbEvbzrscL3wOSTVNv6qqBhkMPaYBL3SUaQKFXxD
 NjN00SxMD5yBIpZiMwQ2GRg=
X-Google-Smtp-Source: ABdhPJxamD2xp7vuL0j9UPK+vAORDA1al7JS8aMaG+jUl6Rk+0gBnwf83HKvOY+En7OXRX1uF5k6Mg==
X-Received: by 2002:a17:906:1916:: with SMTP id
 a22mr30353517eje.536.1608118937452; 
 Wed, 16 Dec 2020 03:42:17 -0800 (PST)
Received: from localhost.localdomain.info
 (62-178-82-229.cable.dynamic.surfer.at. [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id y17sm1223472ejj.84.2020.12.16.03.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 03:42:16 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/etnaviv: provide more ID values via GET_PARAM ioctl.
Date: Wed, 16 Dec 2020 12:42:01 +0100
Message-Id: <20201216114209.276630-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.29.2
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make it possible for the user space to access these ID values.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 12 ++++++++++++
 include/uapi/drm/etnaviv_drm.h        |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index c6404b8d067f..ec16991ba8b6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -156,6 +156,18 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u32 param, u64 *value)
 			*value = ~0ULL;
 		break;
 
+	case ETNAVIV_PARAM_GPU_PRODUCT_ID:
+		*value = gpu->identity.product_id;
+		break;
+
+	case ETNAVIV_PARAM_GPU_CUSTOMER_ID:
+		*value = gpu->identity.customer_id;
+		break;
+
+	case ETNAVIV_PARAM_GPU_ECO_ID:
+		*value = gpu->identity.eco_id;
+		break;
+
 	default:
 		DBG("%s: invalid param: %u", dev_name(gpu->dev), param);
 		return -EINVAL;
diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
index 09d0df8b71c5..af024d90453d 100644
--- a/include/uapi/drm/etnaviv_drm.h
+++ b/include/uapi/drm/etnaviv_drm.h
@@ -74,6 +74,9 @@ struct drm_etnaviv_timespec {
 #define ETNAVIV_PARAM_GPU_NUM_CONSTANTS             0x19
 #define ETNAVIV_PARAM_GPU_NUM_VARYINGS              0x1a
 #define ETNAVIV_PARAM_SOFTPIN_START_ADDR            0x1b
+#define ETNAVIV_PARAM_GPU_PRODUCT_ID                0x1c
+#define ETNAVIV_PARAM_GPU_CUSTOMER_ID               0x1d
+#define ETNAVIV_PARAM_GPU_ECO_ID                    0x1e
 
 #define ETNA_MAX_PIPES 4
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
