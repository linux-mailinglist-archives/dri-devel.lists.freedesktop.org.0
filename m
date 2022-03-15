Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A56B4DA531
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 23:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE6389EA3;
	Tue, 15 Mar 2022 22:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C6889EA3;
 Tue, 15 Mar 2022 22:19:31 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id x13so508197wrg.4;
 Tue, 15 Mar 2022 15:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8T8z6iflW4XiGgdmUlJWREss0zwpqrW7ArvyzTkY4zM=;
 b=lxEl0y0ShtAvyYuhvNC8Q/4+oXxFjSyp28eUVJDpMW6CQEjUnM6BMGVmpYW3th8nkd
 euW34T+fWPWl284pgF6SHEkSvIGa4Hbb0QhBRT/qPaUvE5l0HwSkfbAPUnjiV4Ir/uzD
 NGrLammWYvTAXL3fCpJLmXqqCELSnRwjI+wauZiAp5GexK4nrqLKfSPwakEC9azelsta
 mVN6gTlo3j3fS+kGTEx1suFgJ3kvKl2jsj55HiMPSqfUm2ZjAUmnN9H8wt3/0xsMM8Cb
 uedz/YRd7rRlnsOY+ROrjiV6OFypkesLWvJhNaLbx3L3hip8k3oVsjR4y+808zdcRwPe
 AdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8T8z6iflW4XiGgdmUlJWREss0zwpqrW7ArvyzTkY4zM=;
 b=mYC0ndCYabSe3fBZowK0+ecr0m8PDFbxZlBihfXVHzURfe348z7XYflcYV8YRbULGt
 n1H7h8F9vg25TOl9oqBl6RwLhNm1gGpasGTBiDyrlUB0ViaEkPiwakkmmMAbuNCeJw/c
 mrClgrdK0su3QhqoxTn2APpqdVhOlNcKN2qvypLl5SyyPcUHaf7PbDF97RijGxMQ/Ldn
 frrkUXUFwnJmcRXXyKbgLIYQItArZyIoCCFZx01i4/+LV4ZSEbLT7qqxqwpKsWhPhicz
 h34CApHt1j8CZrq0QXNF+46cBprr8GbBwrwjAu9q3YoCo0Kx3K0KDWwOw2oQ08YRXhFC
 siMQ==
X-Gm-Message-State: AOAM533PyMfVV5a8/pTqF+Lq4FRh+alf6x9HWzYiz7I86Oa7QXcIpvNU
 KcoRIQJFPkGZbNLoen8BumA=
X-Google-Smtp-Source: ABdhPJyXK/m628DIv4EB8bxcG/ulR9do+Vkrf7eORkrGXSrrF/fzSZiewYbv/kCVjR8iw1vQkAVUvg==
X-Received: by 2002:a5d:4e51:0:b0:203:dc47:24c2 with SMTP id
 r17-20020a5d4e51000000b00203dc4724c2mr1236474wrt.628.1647382770264; 
 Tue, 15 Mar 2022 15:19:30 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm159780wrx.47.2022.03.15.15.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 15:19:29 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: Fix spelling mistake "endianess" -> "endianness"
Date: Tue, 15 Mar 2022 22:19:29 +0000
Message-Id: <20220315221929.2959700-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a nvdev_error error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 88d262ba648c..62efbd0f3846 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2935,7 +2935,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		/* switch mmio to cpu's native endianness */
 		if (!nvkm_device_endianness(device)) {
 			nvdev_error(device,
-				    "Couldn't switch GPU to CPUs endianess\n");
+				    "Couldn't switch GPU to CPUs endianness\n");
 			ret = -ENOSYS;
 			goto done;
 		}
-- 
2.35.1

