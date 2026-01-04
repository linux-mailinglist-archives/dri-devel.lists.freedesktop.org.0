Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC47CF145A
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 21:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1556710E344;
	Sun,  4 Jan 2026 20:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="iBRImHm3";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UFXy0n8Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC1F10E328;
 Sun,  4 Jan 2026 20:08:01 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dkpQ834tVz9snJ;
 Sun,  4 Jan 2026 21:08:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767557280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1bFVgbKd2bGX2uopKiOokyPDAQ+3U4m878ja6n9ICc=;
 b=iBRImHm3YZKOSDLxCmKXIMmJGvBjZ1NNNHjSd7boqJT4IDXal4nqsANtNJTS5Hl0JqeDdE
 QC0FZTq79Lpta5jXrGtNSsSSd1vjgvsItpONmp8OTXRZFnNovolff/NVkbU1DUlVOWw7pu
 vMZos0A+hURWe+ghPEtHCMG1Ftm2TAKNDF3mmxpyfmVv9+/frcr+ky2d8pNMLsDa2GS4TO
 5VGNWJgay5ioIx8M7UXMO54rZpfrWaYAot5TSDK0GITk63LfhWQNo38kLrx1qglJyHw6mg
 5C6VHlMg8R6EKL2n2IiBazQfvvTmGd+eSSi7jQkKsPDD4vFj1yfGU+eshVcQBw==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767557278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1bFVgbKd2bGX2uopKiOokyPDAQ+3U4m878ja6n9ICc=;
 b=UFXy0n8ZUlf+8CebJcoSFv4UsJbeRaURhXYI1Q7cFe4UBaVBx2sivR3wShdYcj2OKf9KmX
 VFuhG0WyQDkP223RgNDC02xuV7EqsPry3+mfXEsh5mNhmR9IfUu9JzJmY/KCUooWBHxqKv
 dxYdC43A6EYzWZ+XWDSr6YNhuVeiCbPx58c5sF0fG07JlJyq2wNI8fiyDkF15X4sbjrveM
 ac6WlqvWYXwJxDyS88X498SzQ0aBqu1COaj6AbGHou73hb0+dOMTyvrWQmyEnlUdHk9WI7
 cYadxzFM0Zv69BcRfzx/hzXeLc0ZSgj1szu0+Yb0yEasqxPFjVFBMKZETWzWaw==
To: dakr@kernel.org
Cc: aliceryhl@google.com, acourbot@nvidia.com, airlied@gmail.com,
 simona@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, mhi@mailbox.org, rust-for-linux@vger.kernel.org
Subject: [PATCH v2 2/2] gpu: nova-core: Use derive Display for Chipset enum
Date: Sun,  4 Jan 2026 21:07:32 +0100
Message-ID: <20260104200733.190494-3-mhi@mailbox.org>
In-Reply-To: <20260104200733.190494-1-mhi@mailbox.org>
References: <20260104200733.190494-1-mhi@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d7f6dc98ca0715cbf2a
X-MBO-RS-META: 41iyczy5oti6zqpyf4g16pc5jha3nowi
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

Use the derive macro for implementing fmt::Display on the Chipset enum
instead of relying on the compiler-generated Display output. This ensures
stable display strings that won't change unexpectedly.

Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 drivers/gpu/nova-core/gpu.rs | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 629c9d2dc994..db2e913f85bf 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -4,6 +4,7 @@
     device,
     devres::Devres,
     fmt,
+    macros,
     pci,
     prelude::*,
     sync::Arc, //
@@ -26,7 +27,7 @@ macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
         /// Enum representation of the GPU chipset.
-        #[derive(fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq)]
+        #[derive(macros::Display, fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq)]
         pub(crate) enum Chipset {
             $($variant = $value),*,
         }
@@ -107,20 +108,6 @@ pub(crate) fn arch(&self) -> Architecture {
     }
 }
 
-// TODO
-//
-// The resulting strings are used to generate firmware paths, hence the
-// generated strings have to be stable.
-//
-// Hence, replace with something like strum_macros derive(Display).
-//
-// For now, redirect to fmt::Debug for convenience.
-impl fmt::Display for Chipset {
-    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        write!(f, "{self:?}")
-    }
-}
-
 /// Enum representation of the GPU generation.
 ///
 /// TODO: remove the `Default` trait implementation, and the `#[default]`
-- 
2.51.2

