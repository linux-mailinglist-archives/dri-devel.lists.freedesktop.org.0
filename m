Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3FB5103C6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC5110E886;
	Tue, 26 Apr 2022 16:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DFF10E88C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 16:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650991343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9oGD1aVOxPfwlxyUj/4d02qUR9rbo+0pTblnupMLJM0=;
 b=aMqWnuNrosx3FnIX/QCMDhOpZxXwF5/FgyLPVFNyJpZS5So7cRBHAvC9e1ZOizDbE8xwre
 U7cyY6okWjOxND9R89Acp7dFRp/u6VKgBUCuspuBOxceXaCuv0XxACEEmVHq3WMF1v70IN
 MGu5rRbGVEDKsU0Qkf3Dm98BBQ1V+7o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-a1BwDHxAOomZEpu0CiXdBg-1; Tue, 26 Apr 2022 12:42:20 -0400
X-MC-Unique: a1BwDHxAOomZEpu0CiXdBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF8AF800B28;
 Tue, 26 Apr 2022 16:42:19 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB5502024CB8;
 Tue, 26 Apr 2022 16:42:18 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] mgag200: remove unused flag
Date: Tue, 26 Apr 2022 18:41:07 +0200
Message-Id: <20220426164108.1051295-4-jfalempe@redhat.com>
In-Reply-To: <20220426164108.1051295-1-jfalempe@redhat.com>
References: <20220426164108.1051295-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, michel@daenzer.net,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The flag MGAG200_FLAG_HW_BUG_NO_STARTADD is no more used, because
the framebuffer is now always at offset 0.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 3 +--
 drivers/gpu/drm/mgag200/mgag200_drv.h | 3 ---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 217844d71ab5..8659e1ca8009 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -306,8 +306,7 @@ mgag200_device_create(struct pci_dev *pdev, enum mga_type type, unsigned long fl
 static const struct pci_device_id mgag200_pciidlist[] = {
 	{ PCI_VENDOR_ID_MATROX, 0x520, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_PCI },
 	{ PCI_VENDOR_ID_MATROX, 0x521, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_AGP },
-	{ PCI_VENDOR_ID_MATROX, 0x522, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-		G200_SE_A | MGAG200_FLAG_HW_BUG_NO_STARTADD},
+	{ PCI_VENDOR_ID_MATROX, 0x522, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_SE_A },
 	{ PCI_VENDOR_ID_MATROX, 0x524, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_SE_B },
 	{ PCI_VENDOR_ID_MATROX, 0x530, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_EV },
 	{ PCI_VENDOR_ID_MATROX, 0x532, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_WB },
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 4368112023f7..c7b6dc771ab3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -201,9 +201,6 @@ enum mga_type {
 	G200_EW3,
 };
 
-/* HW does not handle 'startadd' field correct. */
-#define MGAG200_FLAG_HW_BUG_NO_STARTADD	(1ul << 8)
-
 #define MGAG200_TYPE_MASK	(0x000000ff)
 #define MGAG200_FLAG_MASK	(0x00ffff00)
 
-- 
2.35.1

