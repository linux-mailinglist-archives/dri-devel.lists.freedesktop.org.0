Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHjsCCwnnGlzAAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:08:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAD4174940
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E641810E2D7;
	Mon, 23 Feb 2026 10:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="w0t46wpZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B156910E2D6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 10:08:36 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-48379489438so50869815e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 02:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771841315; x=1772446115;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=iqjAQx12kO7yn9LdoidneoYk/xISJkEpOFtnTwZu1xA=;
 b=w0t46wpZY0G/BUqobonqmLoxBpV0g+rOJQhKt5okUwt6Gl2XVeDYWa3U0onw3MxgkK
 y0jisikVB+NNySxj8oOaXnm7AgRdy6CUTlDQKdi/K9JWdSBXABl0vFVFENk4cPe+GysU
 kgQmIh5jXb4B9/cR2s5Qil+/jwYcIF//b4513y5CIbY3p7XuOGch9HZIYxveNE944x0y
 e7BlUT8hruFH3cy9factT3epGu26qQViJQD0341dfl/x+fNcnfHP0xjmNlUDtBw8xM8/
 3byBm3XZIbgJkzmvweqbWWZ7kxq12xeZTl9ZWBAM6kSts1zHIY9deU0g6IqyhMJpP7EB
 JjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771841315; x=1772446115;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iqjAQx12kO7yn9LdoidneoYk/xISJkEpOFtnTwZu1xA=;
 b=eHRlDjfvRLf5BdMjDEGXW5qAQjJomny6KDHhBe4fKPEv78ArVpZq4P0fQJL0q+NpyS
 X853zGigygpsyUzT0ROcY+Nc5FExIkyJtrRXb71Yiy7KvYP2gwrmWVpVal4wyxsrJoWx
 dvB5L4OLMnEbHOsgD66MB6sJVZmfll0EldRnGuNMHJvWRDkrf5I84KG3FOAIIJYgWF37
 9KbsS0WohNDj51rSo/lnNOL9seuZIqU4L8Udz6v+NMCW7rIs1tsxA7oIZntzgKx1qhMg
 GOvLWTvQRIidTAxrrNy447+3lcyXdZ/XWQdtwBrXKAZD5ze2vLMy/7GKAcfzSXGQgsG+
 A0vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkYBCz5m6UoNwAap9Umg2PW5le0DqIuy+yaEuRcTeOo0qp4rlRBLoCgiCMjFe8954bJllP5FKPQUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywv+2LERjHU4wiQp5gpuZDcbwWMjRqcmQGXdyezRTyoh+K9tyDK
 Eu82QLY8k/5yWVBKPRw11zKV9QfVR8BSxd0CGAkWSc9t3f+7q6jL8GPV07qIjlWTsGstFjNlc8u
 8S81uiduoYRwe/WHcGQ==
X-Received: from wmqb9.prod.google.com ([2002:a05:600c:4e09:b0:483:6f09:9913])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34cb:b0:479:1b0f:dfff with SMTP id
 5b1f17b1804b1-483a95bef2amr119187925e9.10.1771841315177; 
 Mon, 23 Feb 2026 02:08:35 -0800 (PST)
Date: Mon, 23 Feb 2026 10:08:25 +0000
In-Reply-To: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
Mime-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=36uRj/yGgZFq6zKe4ExA/GGUiwSeasAUQSZStEmKulI=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpnCcgUsqqcMYjdDm7UHv8I5p4UEWxxC0fGy4J5
 el4buZGr6+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZwnIAAKCRAEWL7uWMY5
 RnnuD/9/liVA8UJG+WSn8bROvceJNTmyceJ6rXLYcVmGqpJOk4jTuFu1rTGNw4NmJZwjyRkr6f3
 nqcjfE/k6I2/OOh5eKr4nunoY0BxzZ2n7VLcRuKU1sBKTcpCFOmLEhsYEC7BWYW8oROD3oXMJAJ
 VxH/5YsIZeZQYjVrRlwqkxLxT8qV0DFd5RJLhUdeaHQpwTf1lRN6PaMSkREkvM40Xamh+21zS+J
 /Wswc5gMzYG/bdjOQmoaunIqrs+Z6VShwf8+lVxCgh/KdXF9TwelJEw12IOpERw881MJNuGLNHW
 2SnNPNWSRArfppwbyMvO+aJsiUvW5YASeJIxzeRzzppHVhDonRCKJZ98t+XrpijkTAM1u03vJJx
 zQWGRbXbhl8VkB913eXVDc1GozBbpqpkPcm+W2UKiqIu8IYW+DgCT0CfDPxeh+57A9oKa3AwTY/
 YBTCYD2KAjkSIK7iWmd0XpCTw+Q/f2Bkrh7krhQ8PcUpi3CTNS9Dkry8ZWuduVf9A4cYQA+dI/g
 QTTtkf9I/u9r30jM37oq4Lp3U1UQj+21ngcbg8SuNWbDd3UuotqbNK7PXZdfFSw0SP3uun00I38
 ADs08uf+SJ2rNSKDWsLURv6SjHm5roDE/3vrVODsntZ10lSlAlopUKQv0b2zGlHBnxxk8ijXqiN
 u67oZuhxYAK4CgQ==
X-Mailer: b4 0.14.2
Message-ID: <20260223-clk-send-sync-v5-1-181bf2f35652@google.com>
Subject: [PATCH v5 1/3] rust: clk: implement Send and Sync
From: Alice Ryhl <aliceryhl@google.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 "=?utf-8?q?Uwe_Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-pwm@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
 Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sboyd@kernel.org,m:mturquette@baylibre.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:m.wilczynski@samsung.com,m:viresh.kumar@linaro.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pwm@vger.kernel.org,m:aliceryhl@google.com,m:boqun@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[baylibre.com,linux.intel.com,kernel.org,redhat.com,samsung.com,linaro.org,garyguo.net,protonmail.com,umich.edu,collabora.com,vger.kernel.org,lists.freedesktop.org,google.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 8CAD4174940
X-Rspamd-Action: no action

These traits are required for drivers to embed the Clk type in their own
data structures because driver data structures are usually required to
be Send. Since the Clk type is thread-safe, implement the relevant
traits.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/clk.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
index 4059aff34d096264bc7f3c8bfcb39eb3f42725be..7abbd0767d8cff9f2561d1783a9a1d774a96d1fc 100644
--- a/rust/kernel/clk.rs
+++ b/rust/kernel/clk.rs
@@ -128,6 +128,13 @@ mod common_clk {
     #[repr(transparent)]
     pub struct Clk(*mut bindings::clk);
 
+    // SAFETY: It is safe to call `clk_put` on another thread than where `clk_get` was called.
+    unsafe impl Send for Clk {}
+
+    // SAFETY: It is safe to call any combination of the `&self` methods in parallel, as the
+    // methods are synchronized internally.
+    unsafe impl Sync for Clk {}
+
     impl Clk {
         /// Gets [`Clk`] corresponding to a [`Device`] and a connection id.
         ///

-- 
2.53.0.345.g96ddfc5eaa-goog

