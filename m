Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 729A556CE1B
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 10:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764CE112662;
	Sun, 10 Jul 2022 08:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C47E11AFD9
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=mPoAI7MqmyIkZAA0X/UwY3qpmPmGOGOfI9hT5KDA7rk=;
 b=oBI/TG0AlE5tm4gnL7LM2HAr9V3cJoae6Un9fUBttp9RRMReGqdrdzUFLTqwZ808nq2e8GHOLxcmy
 58jj0Liw3UPJgqTa7vh6W85RaXCjiwlLmX3ADJSmp4SCAb4bu83GbzPm6CuaO7cEJXaw9cRHvZAQW8
 7FdxhthRUzOZ1uI6zQ5VzX0juNYg4ZGmHGk823kj3fu1HX1HYVGkeViQS3Y3gBzPkSZ9WnGz1fp14V
 Uwx3+RKQGF5cbdJpPivKXX2XmvTe7kNuOThWr3rcJSeZJmT1RQXi86fS0XOOWEGOpwc6RX+4AsAM/e
 u1LV2p4K3Z5q0WNymTx1uguMWrvWSIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=mPoAI7MqmyIkZAA0X/UwY3qpmPmGOGOfI9hT5KDA7rk=;
 b=EpOflI1KPMhD5XEMGL9iEaCui3dydLmdKgPIg1uiqag9ylmQUaURNtFvzBQVgeKqmG1yqadH0P17q
 7S9y2adDQ==
X-HalOne-Cookie: 60487e0077f7a1c02a2448bfcbcd4309b9bfcbca
X-HalOne-ID: 12d1c109-002e-11ed-a6c6-d0431ea8a283
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 12d1c109-002e-11ed-a6c6-d0431ea8a283;
 Sun, 10 Jul 2022 08:55:40 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 10/11] drm/via: Rename the via driver to via_dri1
Date: Sun, 10 Jul 2022 10:55:05 +0200
Message-Id: <20220710085506.1384056-11-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220710085506.1384056-1-sam@ravnborg.org>
References: <20220710085506.1384056-1-sam@ravnborg.org>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The via driver is a dri1 driver.
Make this obvious in the name of the driver.

This also make the diver name "via" free for the upcoming openchrome
driver.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/via/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/via/Makefile b/drivers/gpu/drm/via/Makefile
index 8b978dd51a25..ae36eda2d01e 100644
--- a/drivers/gpu/drm/via/Makefile
+++ b/drivers/gpu/drm/via/Makefile
@@ -3,6 +3,4 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-via-y    := via_dri1.o
-
-obj-$(CONFIG_DRM_VIA)	+=via.o
+obj-$(CONFIG_DRM_VIA)	+= via_dri1.o
-- 
2.34.1

