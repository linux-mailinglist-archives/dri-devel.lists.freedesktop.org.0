Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C47A6E4F0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 22:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5788C10E046;
	Mon, 24 Mar 2025 21:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fEBpWuZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7221810E0AA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 21:04:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B91A2A4A51E;
 Mon, 24 Mar 2025 20:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCE8C4CEDD;
 Mon, 24 Mar 2025 21:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742850255;
 bh=tUz2qusKTvBmkeN4ksXUVEfMZCjH960Ip+LLkF/SukA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fEBpWuZMI5f1ITtXzDBgzx5iItfrlmMCtExT7IrgeGZeKJIZyePfm6qWjI9vODnna
 UWyFDDhVZabVaJ9bZY8BT0s64Y7rCxpsNWxYcb5A2KejRjp43IsfjO91mSNhdRRaOj
 xBMmeZG3sohkGZp3h7kYw+qOQh6qnI/S6THpHSGmwjTFU5pIaJ7IbMurNnCqS8Xo9S
 V/p4gNbFJWjKfbRQcJRH6sKrGBG0fxhdsxNnO0JYkh+O2khYqH8K/KJZTgxBWBec1A
 hu0HXWHfsJi2jkRxrUDaWw4omFyewPLLz92rqmt0jSFEXaA0FEdL0ZAc61FAxmCWnB
 FP2PccIYo8EzA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 01/10] drm/panic: add missing space
Date: Mon, 24 Mar 2025 22:03:48 +0100
Message-ID: <20250324210359.1199574-2-ojeda@kernel.org>
In-Reply-To: <20250324210359.1199574-1-ojeda@kernel.org>
References: <20250324210359.1199574-1-ojeda@kernel.org>
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

Add missing space in sentence.

This was found using the Clippy `doc_markdown` lint, which we may want
to enable.

Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/gpu/drm/drm_panic_qr.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index ecd87e8ffe05..9bd4d131f033 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -5,7 +5,7 @@
 //! It is called from a panic handler, so it should't allocate memory and
 //! does all the work on the stack or on the provided buffers. For
 //! simplification, it only supports low error correction, and applies the
-//! first mask (checkerboard). It will draw the smallest QRcode that can
+//! first mask (checkerboard). It will draw the smallest QR code that can
 //! contain the string passed as parameter. To get the most compact
 //! QR code, the start of the URL is encoded as binary, and the
 //! compressed kmsg is encoded as numeric.
-- 
2.49.0

