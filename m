Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFh5OiknnGl1AAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:08:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9BC174932
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE11D10E2D6;
	Mon, 23 Feb 2026 10:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="PTjlKtn3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3C210E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 10:08:38 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4836bf1a920so44087445e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 02:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771841317; x=1772446117;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=74oBSEu7KeQiZ+IoO0+YkS8FCtMu2JGZ7vr9oRz0PzI=;
 b=PTjlKtn3g4/dr3r49+dW8bzpaaP41RZRmITiMVSYpSHBiaEBRNLo7YUNyn2Oba0I9Q
 xVIkp44fx4UO0S7YJELljFHIb8bI6P+/6XdUbC3w+NooDDtZtWlCZ4I83bseM1UM2FTW
 iDIm+pO8Tn38eFSMMlVMsBQYPot3tnszIfslOXmFY0KDfLW9hQCDaYFbCYM1KNFCl9Cy
 MW3fPgm4wqy5/g4RuUlZtDB+cqkvRUZ/iTIMfsgq2XZGz1A/iYU75VDNOf20bM2Qthqy
 30zPghdUYvSm9lEDSqlq1tzIa1BUexj6/bBYPRqMXjvtC7zp35jf3zvhTlzCiPchiycA
 PVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771841317; x=1772446117;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=74oBSEu7KeQiZ+IoO0+YkS8FCtMu2JGZ7vr9oRz0PzI=;
 b=Qckb+R8ogsSv2nj90PX+hagglTlDALLXCUogRFgcewFg16FzBxxNsF2iZ4Ud6d3JpF
 Xcj3X5F6PUcBTQpds8TqiZgtmNm5SxSfAK2o57owrle0loz8jtZx3hIQ8Xs5Qm9eZu8k
 tMiVY3yCB3yNxuw5AUaH0pti/YjA0UlJB/u36hnZVd+5WJ6vLGLTCrLtWOGtqC1u4x8x
 fl0o7oMN0fE3CZTsJRyo09SxpoU34AKIYf01nH5ZIcUQXFsXKAq4cLluXXeF7Hv0aZt5
 HiI8EJ4JIcC64jJVxI1r/MjSCwUxw/f10TMcG0IX6MO7euxDNaQ/6ptvizMDehV7m8cH
 NsZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCBEGQEukhOzOUUUCiPnBLT34rNFzPSDBYrR3CkhyKTvOzXvGZkjTl0P9EKPj2PoDbYou8VULD/QA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf6h4+cKP70Tb93P+t39X/NWIELhpusKrZt2QWGRCYL3Q3Jiuw
 cSPh3EgUvXGjLrkpTasoZKh8Z3PwCxwYwwp/nnFUsO1JMP91uL4ass8hBa6nTJA9jugVeDGjHTX
 STtdqsZ/e+d9aewh4Rg==
X-Received: from wmqf8.prod.google.com ([2002:a05:600c:4e88:b0:483:509d:729b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6298:b0:477:b734:8c53 with SMTP id
 5b1f17b1804b1-483a95fc1b2mr131544185e9.12.1771841316659; 
 Mon, 23 Feb 2026 02:08:36 -0800 (PST)
Date: Mon, 23 Feb 2026 10:08:26 +0000
In-Reply-To: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
Mime-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=pyY9kK4oV6p5HO7c/+g+XC/Va/dVtmU2Pzel1xZKbW0=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpnCcgQsWGO0SyEW1aYXJHNJ1ToG77ov+/VqDIJ
 2Rqb9pykuKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZwnIAAKCRAEWL7uWMY5
 RvPKEACcCzYO2H2oHLj3JDXRaxmHYGc/SeaInq4aZ2JbFlexxZTT4p23CkD40L5nX9RPxIEFFFi
 c7N8pnaUWanWESy6oExuxMGfeErXamS1NMw1HApdc8c1tN2HuU6S7Ae/5fZodqUPjq58GFujgik
 UjrEnwkWDYYu5Ur0biyjS07f9wtR0nHDaTokNWxkoINedZCvmyz4tHzGFVG+ckuZwdEPQTS2L4H
 suTrShLXwqeePnkJisxZPKyPYYcELHBOB1WnvpYJ9Y+ECidj9mgbPFjQx53XeHyg2Q7aBOa9nxN
 Tvn6x1DKjWkJbFpGOthc8vlwDei8eMV/hPEu5qdjPtogR4LpopTrhVGVqXoVHK0tcmV1gktjxYR
 fA2KrSdElAcjkxQsZWBOSpwOEKp+HjxgeMjatw3CtjYZBAeyKgmG+cGoSvZmKzcD/220WpvoDtK
 NiGtga+cJkHAVUyjDv6XC/R8zp6+ZwmrK0WJdqkIMoQ1vpj52EJBzZDdljwKL3knHM1h5GSlran
 hUcuddCm9qyCl59Tx2TgYGdiUe4UcF3qxsHzSFus/3+kaqkw7jNKs0jyZ40pz4pM+tqkOTQb2ly
 5H3BRIhQ/kZhj+W1ZRRKzRuBj/lunAY1BW8Ry2zahqvU+ESFtSG4uzeTTQQBMCRRPpiPuCstoW4
 wHfC88lm6sts2ng==
X-Mailer: b4 0.14.2
Message-ID: <20260223-clk-send-sync-v5-2-181bf2f35652@google.com>
Subject: [PATCH v5 2/3] tyr: remove impl Send/Sync for TyrData
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7E9BC174932
X-Rspamd-Action: no action

Now that clk implements Send and Sync, we no longer need to manually
implement these traits for TyrData. Thus remove the implementations.

The comment also mentions the regulator. However, the regulator had the
traits added in commit 9a200cbdb543 ("rust: regulator: implement Send
and Sync for Regulator<T>"), which is already in mainline.

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/tyr/driver.rs | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index beeffe36b6cb068f2a87129872b37cbea4fb2010..e833e9f537b0225368ca10f5bc71b2612b0befa5 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -53,18 +53,6 @@ pub(crate) struct TyrData {
     pub(crate) gpu_info: GpuInfo,
 }
 
-// Both `Clk` and `Regulator` do not implement `Send` or `Sync`, but they
-// should. There are patches on the mailing list to address this, but they have
-// not landed yet.
-//
-// For now, add this workaround so that this patch compiles with the promise
-// that it will be removed in a future patch.
-//
-// SAFETY: This will be removed in a future patch.
-unsafe impl Send for TyrData {}
-// SAFETY: This will be removed in a future patch.
-unsafe impl Sync for TyrData {}
-
 fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
     regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
 

-- 
2.53.0.345.g96ddfc5eaa-goog

