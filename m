Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2A7A4AE5B
	for <lists+dri-devel@lfdr.de>; Sun,  2 Mar 2025 00:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A41910E037;
	Sat,  1 Mar 2025 23:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FnHXiQ2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B75010E037
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 23:17:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1AC9E611C2;
 Sat,  1 Mar 2025 23:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B59C4CEE6;
 Sat,  1 Mar 2025 23:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740871063;
 bh=7z62IPkiSO6NRrH3JPArIZUmv34+1yiL4Zr/2/1Cx0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FnHXiQ2xEbRr5F3YpSu1XLm5w8OYyZv5x8jnSWDq+LVHj3dJiW00wljMWKbWWTxuF
 DhniRqvOQwN3MOjANmDN15zTbDyQA9ohuU3FrC957csOl/zsm2XJVhS05Hf0M2C+ub
 Hy/GGKKvTpxhC8lsToXIFRcAsCAtmp+yW9hGEkIpwKXnHr8MK7+uESyEk9gPHmXg0X
 DK0hAD6vnWvqMtbUuJQ1skcIIGS5rnPvpTklgUqsr/Zvs4uF8rZ+L8FmvMUKpavPas
 QrjzeTbFs6gJF54VSbVm3LzzLjOsZ6zSfbj9/ZDObJmVrr4C2AXr7i7CCdGMNgXfhO
 MncgUNTk7BpFw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 =?UTF-8?q?Thomas=20B=C3=B6hler?= <witcher@wiredspace.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
Subject: [PATCH 2/2] drm/panic: fix overindented list items in documentation
Date: Sun,  2 Mar 2025 00:16:02 +0100
Message-ID: <20250301231602.917580-2-ojeda@kernel.org>
In-Reply-To: <20250301231602.917580-1-ojeda@kernel.org>
References: <20250301231602.917580-1-ojeda@kernel.org>
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

Starting with the upcoming Rust 1.86.0 (to be released 2025-04-03),
Clippy warns:

    error: doc list item overindented
       --> drivers/gpu/drm/drm_panic_qr.rs:914:5
        |
    914 | ///    will be encoded as binary segment, otherwise it will be encoded
        |     ^^^ help: try using `  ` (2 spaces)
        |
        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#doc_overindented_list_items

The overindentation is slightly hard to notice, since all the items
start with a backquote that makes it look OK, but it is there.

Thus fix it.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/gpu/drm/drm_panic_qr.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 8bb5e52d75cc..6903e2010cb9 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -911,16 +911,16 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
 ///
 /// * `url`: The base URL of the QR code. It will be encoded as Binary segment.
 /// * `data`: A pointer to the binary data, to be encoded. if URL is NULL, it
-///    will be encoded as binary segment, otherwise it will be encoded
-///    efficiently as a numeric segment, and appended to the URL.
+///   will be encoded as binary segment, otherwise it will be encoded
+///   efficiently as a numeric segment, and appended to the URL.
 /// * `data_len`: Length of the data, that needs to be encoded, must be less
-///    than data_size.
+///   than data_size.
 /// * `data_size`: Size of data buffer, it should be at least 4071 bytes to hold
-///    a V40 QR code. It will then be overwritten with the QR code image.
+///   a V40 QR code. It will then be overwritten with the QR code image.
 /// * `tmp`: A temporary buffer that the QR code encoder will use, to write the
-///    segments and ECC.
+///   segments and ECC.
 /// * `tmp_size`: Size of the temporary buffer, it must be at least 3706 bytes
-///    long for V40.
+///   long for V40.
 ///
 /// # Safety
 ///
-- 
2.48.1

