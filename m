Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C991821135
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jan 2024 00:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890BA10E028;
	Sun, 31 Dec 2023 23:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9099410E070;
 Sun, 31 Dec 2023 23:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=DQQOq7uMuqC+LUmYlsu8L+wWzEZWSGnRaRM1vF458w8=; b=jD0bKOK5DR9L4enLf/EHEUGkYb
 Db1VFFkRgEEqmhO62Bv/HRTURxaPOfokmOl7iC1GPpFY2tA52os0IKB8RKTY+T/SI3rWVQbZq7D1x
 ST91eSLiMAZbeuhWgtwSA79W1KB6SrAeUdG7puTcUTiyaYgkbOHqdrJmeNCfoasGm+sNhnRfd085J
 GFEyHl5SYld9h4sHRUJVb88yvymVXJviiY5VOfa7me5IryQlGmmnj0ITIjJe7oDCmfFEPYQNAW2J/
 6iNxIe0n15SVWePV6eRJnkTNXXo45bPU4/xuUhAV/9217EJ8h61xpHIdxJFZwgsjm/8WSVGTVISIB
 hAy8V8Fw==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rK5MA-005MeM-0G; Sun, 31 Dec 2023 23:36:34 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/nouveau/disp: don't misuse kernel-doc comments
Date: Sun, 31 Dec 2023 15:36:30 -0800
Message-ID: <20231231233633.6596-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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

crtc.c:453: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Sets up registers for the given mode/adjusted_mode pair.
crtc.c:453: warning: missing initial short description on line:
 * Sets up registers for the given mode/adjusted_mode pair.
crtc.c:629: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Sets up registers for the given mode/adjusted_mode pair.
crtc.c:629: warning: missing initial short description on line:
 * Sets up registers for the given mode/adjusted_mode pair.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: nouveau@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -449,7 +449,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *cr
 	regp->Attribute[NV_CIO_AR_CSEL_INDEX] = 0x00;
 }
 
-/**
+/*
  * Sets up registers for the given mode/adjusted_mode pair.
  *
  * The clocks, CRTCs and outputs attached to this CRTC must be off.
@@ -625,7 +625,7 @@ nv_crtc_swap_fbs(struct drm_crtc *crtc,
 	return ret;
 }
 
-/**
+/*
  * Sets up registers for the given mode/adjusted_mode pair.
  *
  * The clocks, CRTCs and outputs attached to this CRTC must be off.
