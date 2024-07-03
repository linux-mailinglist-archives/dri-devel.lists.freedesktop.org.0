Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023EE926528
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A0210E999;
	Wed,  3 Jul 2024 15:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HClMsL6s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBE810E999
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 15:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720021469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=s2erXypPFS96oGxgCOnNdx6e4GIHP7kCcJ5ryjq/x4k=;
 b=HClMsL6sSttiQZGf0IVEdsk0jWFQp7fONU7SE5mRK4gwSwycabMSzwPUgCnGG2EVLYIHsE
 k/XICJ5AxndLjtcUqttmzYqM5F7BHMD0V0VgBW4SqhWDao00ywMWKMEVA+M6uBVikOTn8p
 h1Sy5r7GjBt5Io2Adcp2hWILaqL4uxM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-577-wbBm45VNMgidjIZZQ62NHw-1; Wed,
 03 Jul 2024 11:44:26 -0400
X-MC-Unique: wbBm45VNMgidjIZZQ62NHw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D06DE1954206; Wed,  3 Jul 2024 15:44:22 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.208])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 599BD1955BC0; Wed,  3 Jul 2024 15:44:17 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 "Bjorn Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 0/4] drm/panic: Add a qr_code panic screen
Date: Wed,  3 Jul 2024 17:33:57 +0200
Message-ID: <20240703154309.426867-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

This series adds a new panic screen, with the kmsg data embedded in a QR-code.

The main advantage of QR-code, is that you can copy/paste the debug data to a bug report.

The QR-code encoder is written in rust, and is very specific to drm_panic.
The reason is that it is called in a panic handler, and thus can't allocate memory, or use locking.
The rust code uses a few rust core API, and provides only two C entry points.
There is no particular reason to do it in rust, I just wanted to learn rust, and see if it can work in the kernel.

If you want to see what it looks like, I've put a few screenshots here:
https://github.com/kdj0c/panic_report/issues/1

-- 

Jocelyn


Jocelyn Falempe (4):
  drm/panic: Add integer scaling to blit()
  drm/rect: add drm_rect_overlap()
  drm/panic: simplify logo handling
  drm/panic: Add a qr_code panic screen

 drivers/gpu/drm/Kconfig         |  29 +
 drivers/gpu/drm/Makefile        |   1 +
 drivers/gpu/drm/drm_drv.c       |   3 +
 drivers/gpu/drm/drm_panic.c     | 338 +++++++++--
 drivers/gpu/drm/drm_panic_qr.rs | 989 ++++++++++++++++++++++++++++++++
 include/drm/drm_panic.h         |   4 +
 include/drm/drm_rect.h          |  15 +
 7 files changed, 1340 insertions(+), 39 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_panic_qr.rs


base-commit: 3f5ea7ed705e8effe9cfabf912e769ccb6b7d389
-- 
2.45.2

