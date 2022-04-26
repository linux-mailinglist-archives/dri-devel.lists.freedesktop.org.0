Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC215103BF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA9810E86F;
	Tue, 26 Apr 2022 16:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8B010E86F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650991335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w658kx4ounNYboGDBnKpzgqvXOcvCovlPMBQluju+Ro=;
 b=W2iEIgd4mNBL7FqzZIY8WaN7h85wsD2XC9i69kUa8mwRp80Oq2ThvLKBmxO3gJcVDw94ml
 m8L7hu5juInJoa7TIlAKRHl7cTivsvurzztD0xALCP05b2ClV3r8GFK4vf1yRoxVXDdGKA
 Gk86bJCChWJG1n46tDhUuRs1/Uitr/c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-AKZ9fh0tNEmWXhm9wtSR3A-1; Tue, 26 Apr 2022 12:42:14 -0400
X-MC-Unique: AKZ9fh0tNEmWXhm9wtSR3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9935E3C01D96;
 Tue, 26 Apr 2022 16:42:13 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C92020111A6;
 Tue, 26 Apr 2022 16:42:04 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] mgag200: Improve damage handling
Date: Tue, 26 Apr 2022 18:41:04 +0200
Message-Id: <20220426164108.1051295-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, michel@daenzer.net,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series improves the damage handling on Matrox gpu, and allows
Gnome/Wayland to run much better.
Also include some driver cleanup.

Tested on a Dell T310 with Matrox MGA G200eW WPCM450 (rev 0a)

Thanks,

Jocelyn Falempe (4):
  mgag200: Add FB_DAMAGE_CLIPS support
  mgag200: Optimize damage clips
  mgag200: remove unused flag
  mgag200: remove mgag200_probe_vram()

 drivers/gpu/drm/mgag200/mgag200_drv.c  |  3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  3 --
 drivers/gpu/drm/mgag200/mgag200_mm.c   | 50 ++++----------------------
 drivers/gpu/drm/mgag200/mgag200_mode.c | 17 ++++++---
 4 files changed, 20 insertions(+), 53 deletions(-)

-- 
2.35.1

-- 

Jocelyn

