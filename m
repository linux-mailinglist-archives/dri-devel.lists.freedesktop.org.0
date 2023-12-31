Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3916782113C
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jan 2024 00:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF5B10E076;
	Sun, 31 Dec 2023 23:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAF810E036;
 Sun, 31 Dec 2023 23:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=YkItcnuo5x1taVeM+oJSMjte9KpmqBD29r0EejLD2Bo=; b=PfM91DZiaQo44ixDoBeAkKm58j
 kwImdjM+PAOGGsbWLDW6trkYoU25954IAZuGYYtzxtQMmyRLpTjC6K+v6kdZjEjg2MsuEnqEJGTW0
 vk0rBbY+8CN91mSezQSJZ4OYfAjuxRPuNmusM5AonNSz3yCKuvZ6ibhIvEyaKUZcAGv4qY+U/y7KN
 7NfO6Xc+2x/f7309Bn6TF0St/kNuPRcoOJLU/5CP/rJHUA3wr2iRHABdLFYRU3ay72Th3DIiHTBE5
 q3FaZhTo0vGCyQbtPcM2o+mei0cd2QvC3LtVLbd925HPQDg8humEysuDe8F8otYDSBwd/v2aLIsWH
 9bcA+0hA==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rK5MB-005MeM-03; Sun, 31 Dec 2023 23:36:35 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/nouveau/volt/gk20a: don't misuse kernel-doc comments
Date: Sun, 31 Dec 2023 15:36:33 -0800
Message-ID: <20231231233633.6596-4-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231231233633.6596-1-rdunlap@infradead.org>
References: <20231231233633.6596-1-rdunlap@infradead.org>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change kernel-doc "/**" comments to common "/*" comments to prevent
kernel-doc warnings:

gk20a.c:49: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * cvb_mv = ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0)
gk20a.c:49: warning: missing initial short description on line:
 * cvb_mv = ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0)
gk20a.c:62: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * cvb_t_mv =
gk20a.c:62: warning: missing initial short description on line:
 * cvb_t_mv =

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: nouveau@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
@@ -45,7 +45,7 @@ static const struct cvb_coef gk20a_cvb_c
 	/* 852 */ { 1608418, -21643, -269,     0,    763,  -48},
 };
 
-/**
+/*
  * cvb_mv = ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0)
  */
 static inline int
@@ -58,7 +58,7 @@ gk20a_volt_get_cvb_voltage(int speedo, i
 	return mv;
 }
 
-/**
+/*
  * cvb_t_mv =
  * ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0) +
  * ((c3 * speedo / s_scale + c4 + c5 * T / t_scale) * T / t_scale)
