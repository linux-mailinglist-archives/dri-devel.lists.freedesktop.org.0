Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NG2Hy8nnGlzAAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:08:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C15174949
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624D010E2DB;
	Mon, 23 Feb 2026 10:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="BAvuDi+K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BEE10E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 10:08:40 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b8d78d3fabfso349471266b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 02:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771841319; x=1772446119;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=OdnKcgHkjFRmgggTpTfgYETTa8fsvbvkTrjIctXuE0E=;
 b=BAvuDi+KPHm6u7EklmGtdDREg/B/EyvS+EYWRSzNJfC6q6R2ombUE78dwDZ/MYXzsg
 J4XOlY62X/n4k3aGVvlTkqbWS8rO2F4EQJcQ6slbzrRpDRhvaI12jG0GvT/JK7GektiZ
 boCBzI/GrkBN0mBeJB9d7vFTbTcHQ7j5i67+JGLIuRg1wJQtHpTAF83Z7Ymxf8lZmUZu
 EaKhx441PSbmvokvsOrUld7pYgHudfM8WKExPf9QULevvlswBFGe1EvCQtOneJNr4B/K
 ELP/DQZ9T5odl4Ac3J29Q/BxULGMea2p1xvAT6k5Kpa638Ro4k3n/ibnza/mCRIN++SW
 cYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771841319; x=1772446119;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OdnKcgHkjFRmgggTpTfgYETTa8fsvbvkTrjIctXuE0E=;
 b=JXWsIxhYBekvTX/gFEfV8GfNDzkrh1n2jGjmWh6o4m3f/CqhudiW8WkFxpQxiMmMgl
 oBvTTuqkJdnDuTvMXKZvMdpmqMFefUDJSJaLPDurJ6vwIb66tVnFNBIiSSgHNmZfSzmZ
 gI7Qj/NZLBDcnarQCm+HDldQRt8DkdhIT8W/LYLiAkAnedLI/0XmfF7V7Z//FR5Nig7s
 SP2NI+UMaed/N1WqA5+RnO1gph3dTpnYzkVyhiaYOpkk89JdKPYxb+Y0Mw+5Rl7UncJd
 b+nMU4OUommrF1p1iBeclfBNZl1DtnkjYRxLqfpaiWgkfn5DGIdDXmYC0RvIemHaabni
 NrJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkRGOiKDp44RIIZsMwlOBmgvPU1kKC/iw7tNZCycSZSGVt0KOGbQL/yYm80X51z9HSOi6z24yPCsE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUAtZnTUurK3cnOBnpbD1OoKDgDWsOcw9laEKbeVfMRO4LBNwh
 HHEtqKBVMTANSNiuwj+Nv2V58OXSZicRk+VWFQlW4sRlHYlL+itZYQOoYrh+PXLAEMUk+yGM+iO
 nAlmh0nqf1WWKqmfqNw==
X-Received: from edgi6-n1.prod.google.com
 ([2002:a05:6402:a586:10b0:659:32e4:b9bf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e25:b0:b8f:ad6:db92 with SMTP id
 a640c23a62f3a-b908196acb2mr410233066b.3.1771841318227; 
 Mon, 23 Feb 2026 02:08:38 -0800 (PST)
Date: Mon, 23 Feb 2026 10:08:27 +0000
In-Reply-To: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
Mime-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=jAawhmP9tDMdeWRIiWq9BA5B+z9O+mAwAwRx1JUlWqQ=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpnCcgbTxLXepdurAu3GuF7CkmSYRcJGHXg5wHK
 hhZLv4P056JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZwnIAAKCRAEWL7uWMY5
 Rmg5EACUr4q9yVqlI5z1xy9rbC8EGqAU70l/fbrINwUJqLf9Vt3GtkZDEI/b6AlgN8RQX4mTF5N
 HbhQXKgYr3ZoF6FEaPGouSxpJfyULOX2dOGt9yKD2+/TUDXWtEMqF3IUZi2EVrynHGVLOQ73+m+
 2f9n2iLzZXtFHFAqD6y2m4alR5jk3jY3z6OJxCUBgZsPNs0LI7md9QylC/vN1NfF5gvEv/QouDJ
 soiXmdHJCUYyBnyOsmDvPwMu/fbl+x92jpt87qPSH9hLWfJbGFojiA/aPlR2W3jIJCkbCVMntgY
 1Ae/ApT2P85bQovYJ1xpIrQ3H0f6ywsWkuPhtEderymKHmGPSukBCAx9tbtw9kt8rX+Osg8+grg
 fg8/woo0bSdW0aIwDRIeUpet1ZR6eMqgjOoJyYt3ECDnWWOZrj61nr1OPmCuQAIMqcYD8rT2XxM
 nJ73kRZ3WpHs5JtCSYUPj+qacn/BhfJdTlXQrHmhF3ZYoHv+bJv+XYe/Z6b5rSx9PXx+nQb5Bg9
 TrnpR3YQeos5D8NteZVWdTP/iLDuezjrC85tGipCA7HdZgQpAhFbDQn7ump6S53j+KhQ/g62O6M
 Vaaurm+dt3EGb3ZPkYJiKXj1PZ10PFUfFE7r/ZFauGbCVwih6pBzgXs3nTUUkcLAP8gj6dP9+Zi
 c6sJUxRyO1VAaWg==
X-Mailer: b4 0.14.2
Message-ID: <20260223-clk-send-sync-v5-3-181bf2f35652@google.com>
Subject: [PATCH v5 3/3] pwm: th1520: remove impl Send/Sync for
 Th1520PwmDriverData
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
X-Rspamd-Queue-Id: 13C15174949
X-Rspamd-Action: no action

Now that clk implements Send and Sync, we no longer need to manually
implement these traits for Th1520PwmDriverData. Thus remove the
implementations.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Acked-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/pwm/pwm_th1520.rs | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index b0e24ee724e4501b812e5f9c7904b483bfe5e2dc..6cd6fa3d298484cbd84b88cfdd3=
244217855fa05 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -99,21 +99,6 @@ struct Th1520PwmDriverData {
     clk: Clk,
 }
=20
-// This `unsafe` implementation is a temporary necessity because the under=
lying `kernel::clk::Clk`
-// type does not yet expose `Send` and `Sync` implementations. This block =
should be removed
-// as soon as the clock abstraction provides these guarantees directly.
-// TODO: Remove those unsafe impl's when Clk will support them itself.
-
-// SAFETY: The `devres` framework requires the driver's private data to be=
 `Send` and `Sync`.
-// We can guarantee this because the PWM core synchronizes all callbacks, =
preventing concurrent
-// access to the contained `iomem` and `clk` resources.
-unsafe impl Send for Th1520PwmDriverData {}
-
-// SAFETY: The same reasoning applies as for `Send`. The PWM core's synchr=
onization
-// guarantees that it is safe for multiple threads to have shared access (=
`&self`)
-// to the driver data during callbacks.
-unsafe impl Sync for Th1520PwmDriverData {}
-
 impl pwm::PwmOps for Th1520PwmDriverData {
     type WfHw =3D Th1520WfHw;
=20

--=20
2.53.0.345.g96ddfc5eaa-goog

