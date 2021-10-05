Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A042421CBB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 04:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246B96EB25;
	Tue,  5 Oct 2021 02:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4A86EB25
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 02:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=dHO9VUU6KIilj0lSjEjuS5kklUS8u1rXgZVZwATXFzM=; b=QXLvtliynWfXMR/PiV+6HOZMjx
 0nBWYBFXB5Y2soBGHToXqbW5uh98LkNpW57bfqX9Zts2qzwcmfHOEvnxxhaXAhv76f9B6aoJyTEHo
 GOgGSbOaLwzzmNVYcrZMeBzFKca5TV+fqJiHm2hK2U4Ff7Eu+bMcwxmXAxSF0BfnxdJME/mSavCTy
 IXWwk3t2aXBRpEqs8UV527apYxrFErCoIB7sYBglSWB6OZdwKxIzY0vTZJ+hiv3bA36UQrcTqiaDo
 nAFNGE4+T9Jxr7OuUMhn/gU7qNN+huubBAbyFhHBC55OBQnrTEgdX4MMJEv/jo2XYJyk6dPcgTpy+
 HkKVJTCw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXaZt-008jNR-OF; Tue, 05 Oct 2021 02:53:13 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: 
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] DRM: delete DRM IRQ legacy midlayer docs
Date: Mon,  4 Oct 2021 19:53:12 -0700
Message-Id: <20211005025312.20913-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
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

Remove documentation associated with the removal of the DRM IRQ legacy
midlayer.

Eliminates these documentation warnings:

../drivers/gpu/drm/drm_irq.c:1: warning: 'irq helpers' not found
../drivers/gpu/drm/drm_irq.c:1: warning: no structured comments found

Fixes: c1736b9008cb ("drm: IRQ midlayer is now legacy")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 Documentation/gpu/drm-internals.rst |    9 ---------
 1 file changed, 9 deletions(-)

--- lnx-515-rc4.orig/Documentation/gpu/drm-internals.rst
+++ lnx-515-rc4/Documentation/gpu/drm-internals.rst
@@ -111,15 +111,6 @@ Component Helper Usage
 .. kernel-doc:: drivers/gpu/drm/drm_drv.c
    :doc: component helper usage recommendations
 
-IRQ Helper Library
-~~~~~~~~~~~~~~~~~~
-
-.. kernel-doc:: drivers/gpu/drm/drm_irq.c
-   :doc: irq helpers
-
-.. kernel-doc:: drivers/gpu/drm/drm_irq.c
-   :export:
-
 Memory Manager Initialization
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
