Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 928AE39508A
	for <lists+dri-devel@lfdr.de>; Sun, 30 May 2021 13:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563AE6E20C;
	Sun, 30 May 2021 11:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235F96E20C
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622372673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SYT5gDfcxHlvhoDGUw1eiNDPYC+7sYwDuIBX+ITOf2k=;
 b=KloON/bicRcCQSL0GvsSe0mGPnPT7UHw83RPI1ks2jQbGxIge4dnwnf14MNbwKXgDMPZWj
 2Ki9u2+Kf23Uw0ZIEls5Xeh5PULEyb7C9fPixVYWMJXxZL4JmXDBfQx77Po8rEcXO7t/cD
 tII7djPi2FJ+UyvFjZu9TlzNtsr3ruo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-b_lV_y4FPU-mq3_tmsKy2A-1; Sun, 30 May 2021 07:04:31 -0400
X-MC-Unique: b_lV_y4FPU-mq3_tmsKy2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7971B801817;
 Sun, 30 May 2021 11:04:30 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-76.ams2.redhat.com [10.36.112.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38B2E10023AF;
 Sun, 30 May 2021 11:04:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/4] drm: panel-orientation-quirks: Add quirks for 4 more
 devices
Date: Sun, 30 May 2021 13:04:24 +0200
Message-Id: <20210530110428.12994-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Here are 4 straight forward quirk additions for devices which have their
LCD panel mounted 90 degree rotated.

The first 2 patches were send before but gor no reaction.

It would be great if I can get a quick ack for these simple patches,
then I can push them to drm-misc-fixes.

Regards,

Hans


Hans de Goede (4):
  drm: panel-orientation-quirks: Update the Lenovo Ideapad D330 quirk
    (v2)
  drm: panel-orientation-quirks: Add quirk for KD Kurio Smart C15200
    2-in-1
  drm: panel-orientation-quirks: Add quirk for the Samsung Galaxy Book
    10.6
  drm: panel-orientation-quirks: Add quirk for the Chuwi Hi10 Pro

 .../gpu/drm/drm_panel_orientation_quirks.c    | 34 +++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

-- 
2.31.1

