Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yD18LVk0g2kwjAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 12:58:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F287BE566F
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 12:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3369E10E620;
	Wed,  4 Feb 2026 11:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ESN8nuz2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14DE10E620
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 11:58:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 300A7600C4;
 Wed,  4 Feb 2026 11:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78FEC2BCB1;
 Wed,  4 Feb 2026 11:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770206293;
 bh=PBOESvJWRqEQ2bmBI+MqZdyLdwyA7OsD4YPXBLOYQLU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ESN8nuz2S87uQ84h21rrTo5WOEHsLs4F/sXyU5GGND+4N+g6BhMrcVYsicUjk8cGD
 xHqIhAIoD+Qe6eEWHfC6tcbLJYTrWASs3XNZ9GL5g8G7HkJEd/9MeXdDlkgEyncwBp
 xViltxhwMzKVxH9JWNNVCZiHwfpczGFiJlypHFhpSTKrxqW9W85Elz/RSLB8oe87JR
 K2yZTbj8s16zLvUCpu5x4utzXyoLKz0dDcQKoT+fEKIDoPHD2QS62uUBvaN8+yXKbr
 ssOC/AuvsbiwhuzTNktYS7JzTL7cTfH2eIy7TJN1Ynv+wCm3HsXSEs3RKnFIcq5wfx
 hzWtW6SDAGX2g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 04 Feb 2026 12:56:48 +0100
Subject: [PATCH v14 4/9] rust: aref: update formatting of use statements
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-unique-ref-v14-4-17cb29ebacbb@kernel.org>
References: <20260204-unique-ref-v14-0-17cb29ebacbb@kernel.org>
In-Reply-To: <20260204-unique-ref-v14-0-17cb29ebacbb@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, 
 Serge Hallyn <sergeh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Igor Korotin <igor.korotin.linux@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=753; i=a.hindborg@kernel.org; 
 h=from:subject:message-id;
 bh=PBOESvJWRqEQ2bmBI+MqZdyLdwyA7OsD4YPXBLOYQLU=; 
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpgzQC8WXId3BB6udifTdGRxtPZJjj8e9hx+zAu
 QOTwRyR6O+JAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYM0AgAKCRDhuBo+eShj
 d52WD/9JR/g98fdUOY2A8g+rGpmdLfgzdygQocbFPvSVXyFv38q6LeptynGRXH328+Llt9FMs7W
 W2Yyp39eVHkhsA2sBR+RmPm0kLhpQyTlCas32QiZ3BVU0HAS+NeoBelq6HB5MpyCIBG5hNt69lI
 YMymMT9+vQZB7AC1uaReCxdkqSDFxmT+vIZ4589KpZWzbHR4M6JY6XAd57pdg1k1tYuzYInaS/o
 Gr7kW3zIy9YG3zEpodF1SmwQWaf///Uzfi2SZRvn0dq0HcEpzpd4mSF1VuJ1796efe/UpjBFDoz
 YXaGCJTZwHy9B+sFzu82whCwF3hi8cPX2I67pGhDU4vkQf4u9sqX7uHYf2pz7/SY5dbqEF2gi0C
 QOcESpEP05JCslZh3vtiZybsPtBB3KF/fj3nOisEL0YBmhgfK9hcAjkzuS5NX1VnclZPiFtSEtd
 aZi8BWjWrIk/xl90Dv/dtp2EQpiFJc6RGeXXkUJDRwNeeIDCbtcyIQrHTT//IwlK+ab8RpATME5
 GScNPXhVoGC2dPGlmtZ79a4nn5XS2smcQfmrUySufpWh8FpTCnjZrOt/fWdUlobSnPHfXe643ws
 KYu8SkPindocqSr854POQ9gNtOXnfk8cjiAszpDKMwENo5OhLW60YELBH9dPsw4iG3BiKQ346bx
 7t8YyWd6wkWbBeA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:a.hindborg@kernel.org,m:boqunfeng@gmail.com,m:igorkorotinlinux@gmail.com,s:lists@lfdr.
 de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,intel.com,paul-moore.com,ffwll.ch,zeniv.linux.org.uk,suse.cz,collabora.com,oracle.com,ti.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F287BE566F
X-Rspamd-Action: no action

Update formatting if use statements in preparation for next commit.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/aref.rs | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index efe16a7fdfa5d..3c63c9a5fb9be 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -17,7 +17,12 @@
 //! [`Arc`]: crate::sync::Arc
 //! [`Arc<T>`]: crate::sync::Arc
 
-use core::{marker::PhantomData, mem::ManuallyDrop, ops::Deref, ptr::NonNull};
+use core::{
+    marker::PhantomData,
+    mem::ManuallyDrop,
+    ops::Deref,
+    ptr::NonNull, //
+};
 
 /// Types that are internally reference counted.
 ///

-- 
2.51.2


