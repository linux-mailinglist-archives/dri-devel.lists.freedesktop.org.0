Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C462B298C2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 07:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33ED10E341;
	Mon, 18 Aug 2025 05:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="wp2FGLAn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADBA10E341
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 05:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1755493485; x=1755752685;
 bh=GOJp5lcAFQnSpCcww0lHeF62wqZ2bLfNcJSNvGFsXbE=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=wp2FGLAnF5q92ZDyyocTrq4wrDUY1fGJQWhvmqmW+Y5Ek2eldgAAZrClkl0SJm7oe
 W9G4obAV28H9Fkt24ZcpQ8kZDbgA2BJfL5o1b9/9OkW9SOv1asA5c9t3KoCX/HdLvX
 /D5j0SqrRKnLw/BCmdwT+6lwJhnRxShJ5cU3j2ClzQr68wzbEGqTtBlGkewgXVRueB
 YegYDnuWAJRizfmLikLyFvoBBrV4GJFH1CPhpUQYQF+sPP+BfjLmCMEnjr0rBVVJzT
 T56hYC0nVfNl0DcMUC8QO0G1t28jxOtpD120v2xHPAH3XhgUtE6pXhUYBmCnJFDLHx
 Wsl5FxOzu/84w==
Date: Mon, 18 Aug 2025 05:04:40 +0000
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Rahul Rameshbabu <sergeantsagara@protonmail.com>
Subject: [RFC PATCH 2/3] rust: pci: fix incorrect platform references in doc
 comments
Message-ID: <20250818050251.102399-4-sergeantsagara@protonmail.com>
In-Reply-To: <20250818050251.102399-2-sergeantsagara@protonmail.com>
References: <20250818050251.102399-2-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: f046a89334b1160c3374f486f65f508121c6e0f2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Substitute 'platform' with 'pci' where appropriate in the comments.

Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Fixes: 1bd8b6b2c5d3 ("rust: pci: add basic PCI device / driver abstractions=
")
Fixes: 18ebb25dfa18 ("rust: pci: implement Driver::unbind()")
---
 rust/kernel/pci.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 887ee611b553..658e806a5da7 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -240,11 +240,11 @@ pub trait Driver: Send {
=20
     /// PCI driver probe.
     ///
-    /// Called when a new platform device is added or discovered.
-    /// Implementers should attempt to initialize the device here.
+    /// Called when a new pci device is added or discovered. Implementers =
should
+    /// attempt to initialize the device here.
     fn probe(dev: &Device<device::Core>, id_info: &Self::IdInfo) -> Result=
<Pin<KBox<Self>>>;
=20
-    /// Platform driver unbind.
+    /// PCI driver unbind.
     ///
     /// Called when a [`Device`] is unbound from its bound [`Driver`]. Imp=
lementing this callback
     /// is optional.
--=20
2.49.0


