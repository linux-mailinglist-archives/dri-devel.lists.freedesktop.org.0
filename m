Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B5B7D4494
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 03:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0DF10E2BF;
	Tue, 24 Oct 2023 01:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A6A10E2B2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 01:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698109751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=88pzjXNex4w1dUTCk7MVd9W/37DpDLDlkT0Dueu4gwo=;
 b=PW04/OrV5OVIIg2CTw8yG053pSt5d5eTeOu8RG/2igUHqxaYJgiICUrS5QlYb4k25Orsik
 CbdwgsuzgulJcLpViEKnC37C7zVOjlIrVxETbDkxfkpltgRs/vRm8nPs+Uzy+zWduXubVC
 4KFZNIzT+AePiysnMbqcUrwqH3cWlOE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-TQyUpinlNrGE3IKIPLqcIw-1; Mon,
 23 Oct 2023 21:09:09 -0400
X-MC-Unique: TQyUpinlNrGE3IKIPLqcIw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A792F280A9B6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 01:09:09 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A51C9492BFC;
 Tue, 24 Oct 2023 01:09:08 +0000 (UTC)
From: Dave Airlie <airlied@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: pull for vmemdup-user-array into drm-next
Date: Tue, 24 Oct 2023 11:09:05 +1000
Message-ID: <20231024010905.646830-1-airlied@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
Cc: Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

topic/vmemdup-user-array-2023-10-24-1:
vmemdup-user-array API and changes with it.

This is just a process PR to merge the topic branch into drm-next, this contains some core kernel and drm changes.

Signed-off-by: Dave Airlie <airlied@redhat.com>
The following changes since commit 94f6f0550c625fab1f373bb86a6669b45e9748b3:

  Linux 6.6-rc5 (2023-10-08 13:49:43 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm tags/topic/vmemdup-user-array-2023-10-24-1

for you to fetch changes up to 06ab64a0d836ac430c5f94669710a78aa43942cb:

  drm: vmwgfx_surface.c: copy user-array safely (2023-10-09 17:00:05 +1000)

----------------------------------------------------------------
vmemdup-user-array API and changes with it.

This is just a process PR to merge the topic branch into drm-next, this contains some core kernel and drm changes.

Signed-off-by: Dave Airlie <airlied@redhat.com>

----------------------------------------------------------------
Philipp Stanner (5):
      string.h: add array-wrappers for (v)memdup_user()
      kernel: kexec: copy user-array safely
      kernel: watch_queue: copy user-array safely
      drm_lease.c: copy user-array safely
      drm: vmwgfx_surface.c: copy user-array safely

 drivers/gpu/drm/drm_lease.c             |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |  4 ++--
 include/linux/string.h                  | 40 +++++++++++++++++++++++++++++++++
 kernel/kexec.c                          |  2 +-
 kernel/watch_queue.c                    |  2 +-
 5 files changed, 46 insertions(+), 6 deletions(-)

