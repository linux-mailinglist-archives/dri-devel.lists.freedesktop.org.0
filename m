Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3FF2B4DBB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D97A6EA07;
	Mon, 16 Nov 2020 17:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EEE6EA01
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:52 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a65so49986wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=voWmA7JwfKGhDZMYWPZkZRLYOBpcwZ/fXqx90N9cMjo=;
 b=Q/5s24f2J2WYaf1lDVin02W6tDLEn9ETKKVIAlSa3geYU2EDOSCN8AHyxHt4cvgOCh
 zTPfZjuqBYHxS2cnpdwzjJC+ZUVxIi9H4UJwrkv0ytH6ZgGUXx35pl+RRgKBsHxPcfDS
 yHiyh2/prpOiQauOfr6NeOlW8bUML1ksJJex8rye/wHRVQpip2qLEAyWp3kUlXJSK0Er
 sjLFTmYOVG3joUvxSqsetKTtYqtR6t03eAT1M00X3rfX/vlI3+doDpxEz0yyTFG0N8sw
 cqDeBro+6ick1o85xj9vMwMomzZ+imZLDJNd7CFBTPKTPHhQj1HKKY0tE0vry6ZKlEH4
 7B1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=voWmA7JwfKGhDZMYWPZkZRLYOBpcwZ/fXqx90N9cMjo=;
 b=Q+GeV9ciMemo+T/IZOqJ+KVaZtCkjUfoYZHqjodhAsE/iRq46PMBho2WrO9C3MZU7u
 iiEwlPVSJhUrmGYSyfWUVDN+iK65XS/+CTB5jDK92eyaaNFKsUqvQ5ONPvEJAyYXWMl/
 C2WCCcdWUqq/CVZRlcifIyih4BDUxltQ3NcXg27ozxJ4BzgVj4dgyDVaSBfUAdeW9HzP
 0eXmEiQ51VfOpRN0PHLimhN3DtNCMVPrGkVyuHV5WViQjG0VihiaWzt2OQNkX3EcKvqP
 5iCKgFJgnJPQ6N+l86h9+Z7085WLn/CW774KJmW+1FoKdYwF0OUQbUFfUYt0jA9ZYtVI
 X8fw==
X-Gm-Message-State: AOAM532CYIoVbSNeq0jkN+hy1FfFVlyfnP9yUqjMtO+7OK1HMUXOOsW5
 bU6iIvxLIMiZayKu878b1hECyw==
X-Google-Smtp-Source: ABdhPJwuvAgqDWMZ3sjRi0c2yQlbytErPP7kxds1VUQAakjg1WWYvU8tM8e0449EbLG8YOVOAFyozQ==
X-Received: by 2002:a7b:c18e:: with SMTP id y14mr7520926wmi.123.1605548510917; 
 Mon, 16 Nov 2020 09:41:50 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 21/42] drm/nouveau/nvkm/core/firmware: Fix formatting,
 provide missing param description
Date: Mon, 16 Nov 2020 17:40:51 +0000
Message-Id: <20201116174112.1833368-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

... and demote non-conformant kernel-doc header.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'subdev' not described in 'nvkm_firmware_get'
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'fwname' not described in 'nvkm_firmware_get'
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'ver' not described in 'nvkm_firmware_get'
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'fw' not described in 'nvkm_firmware_get'
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c:106: warning: Function parameter or member 'fw' not described in 'nvkm_firmware_put'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
index 8b25367917ca0..ca1f8463cff51 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
@@ -58,9 +58,10 @@ nvkm_firmware_load_blob(const struct nvkm_subdev *subdev, const char *base,
 
 /**
  * nvkm_firmware_get - load firmware from the official nvidia/chip/ directory
- * @subdev	subdevice that will use that firmware
- * @fwname	name of firmware file to load
- * @fw		firmware structure to load to
+ * @subdev:	subdevice that will use that firmware
+ * @fwname:	name of firmware file to load
+ * @ver:	firmware version to load
+ * @fw:		firmware structure to load to
  *
  * Use this function to load firmware files in the form nvidia/chip/fwname.bin.
  * Firmware files released by NVIDIA will always follow this format.
@@ -98,7 +99,7 @@ nvkm_firmware_get(const struct nvkm_subdev *subdev, const char *fwname, int ver,
 	return -ENOENT;
 }
 
-/**
+/*
  * nvkm_firmware_put - release firmware loaded with nvkm_firmware_get
  */
 void
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
