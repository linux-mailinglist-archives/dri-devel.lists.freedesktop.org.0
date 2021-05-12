Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF11637BE20
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 15:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF946E06E;
	Wed, 12 May 2021 13:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8F66E06E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 13:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620825730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QgguPoF9qOa2EQK0TVtjpXa3WeebJt6mDrtgBykUS0M=;
 b=E47cm8ByyoCyXj0/c9fQgSB9lPf4VLQ5tuIAZ0YazpIwbMKhqHYZStGX0q+d77FmKxw4jP
 /vLx8PppL4A42Im0lmDKLqh+Fppg2Wu/gCNaCWckWuaYmaWdTYYwZ6iwZcbyQsXWc811sg
 WHwr8KAenDXlZjhcKzWLAyY7nXX04OE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-WNdvVE9rNAGsS3cWHws6mw-1; Wed, 12 May 2021 09:22:08 -0400
X-MC-Unique: WNdvVE9rNAGsS3cWHws6mw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19AED1013720;
 Wed, 12 May 2021 13:22:07 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-30.ams2.redhat.com [10.36.112.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B00D5D6AC;
 Wed, 12 May 2021 13:22:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 0/2] drm: panel-orientation-quirks: Update / Add 2 quirks
Date: Wed, 12 May 2021 15:22:02 +0200
Message-Id: <20210512132204.61250-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

The first patch in this series is a resend of one which I submitted a couple
of days ago, the other patch is new.

These are pretty simple/straightforward patches if someone can give me a
quick ack for these then I can push them to drm-misc-next.

Regards,

Hans


Hans de Goede (2):
  drm: panel-orientation-quirks: Update the Lenovo Ideapad D330 quirk
    (v2)
  drm: panel-orientation-quirks: Add quirk for KD Kurio Smart C15200
    2-in-1

 drivers/gpu/drm/drm_panel_orientation_quirks.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.31.1

