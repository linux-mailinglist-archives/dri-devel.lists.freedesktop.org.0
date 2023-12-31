Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC4B821139
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jan 2024 00:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B54010E06B;
	Sun, 31 Dec 2023 23:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E12110E06B;
 Sun, 31 Dec 2023 23:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ZZl3ZVYS6VWZ7TtNvTnO/A3XmatGpgWfEn/FisFC5YM=; b=GX6KzpbLTBkQPIawU4MASFBjTg
 gu0Aa5TK+fHo1uUu7736YZK/pgPHQ0P7DQ60xH//bp3ongeyJ+84vL9p4qECDA07THVSYIL0UMckY
 wKTC30YzeXoNIZqK0LzvSMOxPRV69f6QpTk1rZ2ToMFtq2x3555jyDSSpZS4i4gWSam/9BcV1+EBU
 /pTG6nKj5ZTiHvX5zC4U6VW0qLPfc/V4Zc6WVMwgFlD0AROC1EpCXFs0t0aUIAu94OiJksw75nbug
 mszl41sooRRcCOTBA2rXDWkHqItxtcQWYMEf2P4GLUHAbNvp4hWiEHshGVafJ0XEYCJJ39iJvbDEV
 k+QDT+tA==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rK5MA-005MeM-1H; Sun, 31 Dec 2023 23:36:34 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/nouveau: don't misuse kernel-doc comments
Date: Sun, 31 Dec 2023 15:36:31 -0800
Message-ID: <20231231233633.6596-2-rdunlap@infradead.org>
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

nouveau_ioc32.c:2: warning: Cannot understand  * \file mga_ioc32.c
 on line 2 - I thought it was a doc line
nouveau_ioc32.c:52: warning: Function parameter or member 'filp' not described in 'nouveau_compat_ioctl'
nouveau_ioc32.c:52: warning: Function parameter or member 'cmd' not described in 'nouveau_compat_ioctl'
nouveau_ioc32.c:52: warning: Function parameter or member 'arg' not described in 'nouveau_compat_ioctl'
nouveau_ioc32.c:52: warning: expecting prototype for Called whenever a 32-bit process running under a 64(). Prototype was for nouveau_compat_ioctl() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: nouveau@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/nouveau_ioc32.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
--- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
@@ -1,4 +1,4 @@
-/**
+/*
  * \file mga_ioc32.c
  *
  * 32-bit ioctl compatibility routines for the MGA DRM.
@@ -38,7 +38,7 @@
 
 #include "nouveau_ioctl.h"
 
-/**
+/*
  * Called whenever a 32-bit process running under a 64-bit kernel
  * performs an ioctl on /dev/dri/card<n>.
  *
