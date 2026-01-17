Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94987D38EEC
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 15:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9025210E078;
	Sat, 17 Jan 2026 14:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N0bPxD5w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F28D10E078
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 14:10:11 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-81f3fcdb556so1435902b3a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 06:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768659011; x=1769263811; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1YsjaSB9aIQokwOFTN0Ov8qKUwyht65twzNGrMEevb0=;
 b=N0bPxD5wag4+QNYz4qC7fFkPtgZFsGzswduEUA2yourdm/QK7LV/uzs5PU3iPYO+/9
 rLMMZboPy4zHmVpMmFo+g+0dhNtlUGKzm0B0XGYjwchXlAPmcN9sECeYiZwAF2H7z9GR
 06M3snE8kh5E4J9MnkU5+Ayk1m2iiq2MgURGdF4wTGI9/MFfXLRiWxVs29lUXGtKJdln
 uIdiLjYk1IR2h+x4I60Ewj9Zv/cjM5I/TwE2k/AUaoIkty4VtCL2SWB8ViRpKo1R75Hf
 9m87K5LoDDtjNoFpEIe1h8jrN75/vxvGQqPc8qDrd28YiL7fnjHE4YqG5AhhsGVvaQuN
 UhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768659011; x=1769263811;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1YsjaSB9aIQokwOFTN0Ov8qKUwyht65twzNGrMEevb0=;
 b=Ex9AyBoQAmL0uwuVTqmVgvshnXsOV2Kc38nIoOoaE0oBGgplA1MUQgiUl5kndhCcOX
 RETQPq8ZMf7+Y4gGQKKltyZokLEFKziKlvphdIG26E+W+lLXN++MzhWtPODhVCz76BDy
 ulLhqLtzTWnPfjRFg27hZZzaX2pWKowUno4+TS/IQBfogumteI79g4Ec+cMKRgK3Rwk2
 nrHjhFYUzKBfIYPZIPnnDdAYhVbmrJ2LO7v4uXYOasawGb4tMGfG6Cu2y9x4ltikip8/
 R0LgWridOUKFowZBkEVIRbLh+MvLljj13UT1PxJPZuD9tnTQu8kFNUFXhtpB3U1jqCon
 riWg==
X-Gm-Message-State: AOJu0Yz69qchDWFuUE36pSGzE/+vkk2YZX76Yg59PkecyPUKFPHAZXJ+
 bfP4fB3qFlt17DoysT/wbJ59U6sPCIeatURcDbJva/ahsjsyruBYrJ6U
X-Gm-Gg: AY/fxX4LcRM/UI+MPl67SMASUCHsOiB93rdqWLh6SKpcQ1p5XI/o7qDXqpJzqzTgBmb
 rXk1iU5QIXbThypNWHvxLWDVdgxIxgGHwbCIpKQZm4Gv4kcGs896msql0nq+XuZqeC64/eoM/3v
 950jujbf6izLS1+W10Jmq2gpFU0pJwLf0SOlf5RKfIJS7fpBVDYLMZp19tbhsCN8WBbQsCdPyVv
 ioC0INQYgc1hnD2KWWQSq63RsLOr7FsfJkyIZQT71iBfNqwm7XwL935wORO+uhYRMOQOxmYWpz2
 0eI4IL0koj7k0F43H8MJLYfHfRlWTXN51rrH3lzxWyVo4obeI8GN73yzpzqsO1PjwdUTbJVJ8NH
 eu3xyEA4eM2E+u5D4Nmo0p1cTeqIak8DkyKTkemQIznotrcWnpUDMS9t4jTbKdolxRIUSpsbBEE
 km+Suw9MgoItYnKtsij6Okk61hspfz3gf2Kg==
X-Received: by 2002:a05:6a21:1506:b0:364:1332:54ca with SMTP id
 adf61e73a8af0-38dfe7b7580mr5929841637.59.1768659011011; 
 Sat, 17 Jan 2026 06:10:11 -0800 (PST)
Received: from localhost.localdomain ([111.202.170.108])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c5edf32dbc1sm4834519a12.21.2026.01.17.06.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jan 2026 06:10:10 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
X-Google-Original-From: Xingjing Deng <xjdeng@buaa.edu.cn>
To: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xingjing Deng <xjdeng@buaa.edu.cn>,
 stable@vger.kernel.org
Subject: [PATCH v3] misc: fastrpc: possible double-free of cctx->remote_heap
Date: Sat, 17 Jan 2026 22:09:59 +0800
Message-Id: <20260117140959.879035-1-xjdeng@buaa.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fastrpc_init_create_static_process() may free cctx->remote_heap on the
err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remove()
frees cctx->remote_heap again if it is non-NULL, which can lead to a
double-free if the INIT_CREATE_STATIC ioctl hits the error path and the rpmsg
device is subsequently removed/unbound.
Clear cctx->remote_heap after freeing it in the error path to prevent the
later cleanup from freeing it again.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@vger.kernel.org # 6.2+
Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>

---

v3:
- Adjust the email format.
- Link to v2: https://lore.kernel.org/linux-arm-msm/2026011650-gravitate-happily-5d0c@gregkh/T/#t

v2:
- Add Fixes: and Cc: stable@vger.kernel.org.
- Link to v1: https://lore.kernel.org/linux-arm-msm/2026011227-casualty-rephrase-9381@gregkh/T/#t

 drivers/misc/fastrpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..fb3b54e05928 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1370,6 +1370,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 	}
 err_map:
 	fastrpc_buf_free(fl->cctx->remote_heap);
+	fl->cctx->remote_heap = NULL;
 err_name:
 	kfree(name);
 err:
-- 
2.25.1

