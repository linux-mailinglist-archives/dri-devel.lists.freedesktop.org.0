Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5172EAE60EA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 11:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2945010E0F3;
	Tue, 24 Jun 2025 09:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4AF4110E0F3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 09:32:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEE3C106F;
 Tue, 24 Jun 2025 02:32:10 -0700 (PDT)
Received: from e129154.arm.com (unknown [10.57.66.60])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 309BC3F66E;
 Tue, 24 Jun 2025 02:32:23 -0700 (PDT)
From: Beata Michalska <beata.michalska@arm.com>
To: ojeda@kernel.org, alex.gaynor@gmail.com, dakr@kernel.org,
 aliceryhl@google.com, daniel.almeida@collabora.com
Cc: boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 alyssa@rosenzweig.io, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] Drop Opaque from IOCTL args
Date: Tue, 24 Jun 2025 11:31:58 +0200
Message-Id: <20250624093200.812812-1-beata.michalska@arm.com>
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

Hi All,

This patch series removes the use of `Opaque<T>` for ioctl
arguments in the DRM Rust interface and updates the Nova
code accordingly.

v2:
- Missing Nova changes now included
- Fixed formatting and added comment on safety guarantees

Beata Michalska (1):
  rust: drm: Drop the use of Opaque for ioctl arguments

Danilo Krummrich (1):
  drm: nova-drm: Update ioctl handlers to drop Opaque usage

 drivers/gpu/drm/nova/file.rs | 23 ++++++--------
 drivers/gpu/drm/nova/nova.rs |  1 -
 drivers/gpu/drm/nova/uapi.rs | 61 ------------------------------------
 rust/kernel/drm/ioctl.rs     | 11 ++++---
 4 files changed, 16 insertions(+), 80 deletions(-)
 delete mode 100644 drivers/gpu/drm/nova/uapi.rs

-- 
2.25.1

