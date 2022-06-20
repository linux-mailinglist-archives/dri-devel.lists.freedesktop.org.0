Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6795514AE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 11:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC501130D5;
	Mon, 20 Jun 2022 09:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB931130D5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 09:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655718399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h+FyiooQhZBqsBdqNLClriNeSQjxvhtsPzh24MgBH9Q=;
 b=BeNgllOE+aeeXkTuYnoRrW/uz5fQf4rwbUlZGoC+64Bwq0jtHMlwbsFzEPWfC3kxXwh6VT
 3JYE9tJiMa3g0rBzuB4zDPzsZMt4Q+70KyqTC5ry/VmmlYLIhJgQzW/Vemb7br2jJY8p19
 7t7J+n78M0STeKaucv4KWwI9hJS8dJM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-qZndtd-XNiKpZrqnLhYOXA-1; Mon, 20 Jun 2022 05:46:38 -0400
X-MC-Unique: qZndtd-XNiKpZrqnLhYOXA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 562332814436;
 Mon, 20 Jun 2022 09:46:30 +0000 (UTC)
Received: from x1.nl (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6CBB14152E1;
 Mon, 20 Jun 2022 09:46:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
Subject: [PATCH] drm/nouveau/Kconfig: Drop duplicate "select ACPI_VIDEO"
Date: Mon, 20 Jun 2022 11:46:27 +0200
Message-Id: <20220620094627.9730-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before this change nouveau's Kconfig section had 2 "select ACPI_VIDEO"
statements:

select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
select ACPI_VIDEO if ACPI && X86

Drop the one with the extra conditions, if the conditions for that
one are true then the second statement will always select ACPI_VIDEO
already.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/nouveau/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 34760164c271..03d12caf9e26 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -11,7 +11,6 @@ config DRM_NOUVEAU
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
-	select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
 	select X86_PLATFORM_DEVICES if ACPI && X86
 	select ACPI_WMI if ACPI && X86
 	select MXM_WMI if ACPI && X86
-- 
2.36.0

