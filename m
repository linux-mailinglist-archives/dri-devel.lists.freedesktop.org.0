Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2CD12DBEC
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 22:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B24D6E27A;
	Tue, 31 Dec 2019 21:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A759D89D4B;
 Tue, 31 Dec 2019 20:53:52 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id t17so35994173eds.6;
 Tue, 31 Dec 2019 12:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=NxVPnp1vgRmjH7L7kENjVVXZ5KNtEIGxlFIHfBLkDO0=;
 b=Gt88ScDFSWLyoxvwTcRbq/5RlwwcCXcfGvg/V8/xg1HspxXhgUgOTDJHotVZbkGEUa
 hRKxkFOtZ6FPJ8HmLF2h7/oxLvn/+rTsGl5YJbjSlqpFlDPoOke5h56RrKl12GepViuz
 SlAtu/m7n/+ZlgvIgYDNk1SRN8raTca+hfNKWHyg5n1l8K6zY2rCCI4ykQ7V20XWcdo4
 Pq1yUdjXqPNYwWWFmUFUGIOPkFsuvrXE3RlmTnkt47TfUJ/c+4B0bpqe05u6eVjmTn39
 t0RcCciVUWjgJp9feY1rGp7whMb4RCRRg+rLRBWj0huSpYNMa2YWfMCw8HGJdjT1wvZN
 j61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=NxVPnp1vgRmjH7L7kENjVVXZ5KNtEIGxlFIHfBLkDO0=;
 b=suMlk36CSndE9JMrufIfzYeiOeYJ/Rxs5t5BjS0HZdh/cz9wH97Tj2Cxp4SHmRM0ZC
 fT8j8JTe396YobNmnIjyhtA9a52Y5s0QGRNTCGNLJN+zAW92Q/5NF22EoiEmL2iGCjAg
 kFfcHkQf9emsJO5lGrPpU5iR7qXI7Ur8DaXHOm/2xpXk2mmUy24yG2uqioWRbZ5JPoYs
 Qe0nlFCmx6I3C9YjPcBJ3bMQv/+3SqOAc1jvYTadItecEr8Rq3pgUG+qxtkbOZAdXKcF
 BW2BSOFOGDTX00nRJIv+xHiAXMgexmYM0WvEkHcwMZIvaHbANwfo5GzQzQOMJtju55jn
 Xu4w==
X-Gm-Message-State: APjAAAVv7KHoPPIjU0090/28RaA5+jHK6d1N+ukAPn0oiTN5+0QznfmR
 X96HhIFhqVCDT+QTyk4GM9Y=
X-Google-Smtp-Source: APXvYqxxUopZ/8pdt6GG0GgS0PFcwFypu8zzOhpDLyQ5fvLYLnMBZmjcdQphbEQIDVYCAE0DxMeoOA==
X-Received: by 2002:a50:fb0b:: with SMTP id d11mr78494047edq.252.1577825630876; 
 Tue, 31 Dec 2019 12:53:50 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id y25sm6367432ejj.68.2019.12.31.12.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2019 12:53:50 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: declare constants as unsigned long.
Date: Tue, 31 Dec 2019 23:53:45 +0300
Message-Id: <20191231205345.32615-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 31 Dec 2019 21:04:21 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Explicitly declare constants are unsigned long to address the following
sparse warnings:
warning: constant is so big it is long

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
index ac87a3b6b7c9..506b358fcdb6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
@@ -655,7 +655,7 @@ gf100_ram_new_(const struct nvkm_ram_func *func,
 
 static const struct nvkm_ram_func
 gf100_ram = {
-	.upper = 0x0200000000,
+	.upper = 0x0200000000UL,
 	.probe_fbp = gf100_ram_probe_fbp,
 	.probe_fbp_amount = gf100_ram_probe_fbp_amount,
 	.probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
index 70a06e3cd55a..3bc39895bbce 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf108.c
@@ -43,7 +43,7 @@ gf108_ram_probe_fbp_amount(const struct nvkm_ram_func *func, u32 fbpao,
 
 static const struct nvkm_ram_func
 gf108_ram = {
-	.upper = 0x0200000000,
+	.upper = 0x0200000000UL,
 	.probe_fbp = gf100_ram_probe_fbp,
 	.probe_fbp_amount = gf108_ram_probe_fbp_amount,
 	.probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
index 456aed1f2a02..d01f32c0956a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
@@ -1698,7 +1698,7 @@ gk104_ram_new_(const struct nvkm_ram_func *func, struct nvkm_fb *fb,
 
 static const struct nvkm_ram_func
 gk104_ram = {
-	.upper = 0x0200000000,
+	.upper = 0x0200000000UL,
 	.probe_fbp = gf100_ram_probe_fbp,
 	.probe_fbp_amount = gf108_ram_probe_fbp_amount,
 	.probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
index 27c68e3f9772..e24ac664eb15 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm107.c
@@ -33,7 +33,7 @@ gm107_ram_probe_fbp(const struct nvkm_ram_func *func,
 
 static const struct nvkm_ram_func
 gm107_ram = {
-	.upper = 0x1000000000,
+	.upper = 0x1000000000UL,
 	.probe_fbp = gm107_ram_probe_fbp,
 	.probe_fbp_amount = gf108_ram_probe_fbp_amount,
 	.probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
index 6b0cac1fe7b4..17994cbda54b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgm200.c
@@ -48,7 +48,7 @@ gm200_ram_probe_fbp_amount(const struct nvkm_ram_func *func, u32 fbpao,
 
 static const struct nvkm_ram_func
 gm200_ram = {
-	.upper = 0x1000000000,
+	.upper = 0x1000000000UL,
 	.probe_fbp = gm107_ram_probe_fbp,
 	.probe_fbp_amount = gm200_ram_probe_fbp_amount,
 	.probe_fbpa_amount = gf100_ram_probe_fbpa_amount,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
index adb62a6beb63..7a07a6ed4578 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp100.c
@@ -79,7 +79,7 @@ gp100_ram_probe_fbpa(struct nvkm_device *device, int fbpa)
 
 static const struct nvkm_ram_func
 gp100_ram = {
-	.upper = 0x1000000000,
+	.upper = 0x1000000000UL,
 	.probe_fbp = gm107_ram_probe_fbp,
 	.probe_fbp_amount = gm200_ram_probe_fbp_amount,
 	.probe_fbpa_amount = gp100_ram_probe_fbpa,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
