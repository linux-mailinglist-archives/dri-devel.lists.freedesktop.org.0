Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2842B0B252
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 00:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3F010E423;
	Sat, 19 Jul 2025 22:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JpDx30LF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B0C10E423
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 22:42:40 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4ab82eb33f9so55931951cf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 15:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752964960; x=1753569760; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DDyvCg6OCGjHghiPPtdJYx7X44vJDB73UWdtSHOk4Co=;
 b=JpDx30LF4CufFCvONNl4DecsUlNt2MEqlyNVqJ3lmWrJfk3y3+LaYg20lLMYUt+exJ
 +ER3TvgZxU61JqKNEywv4HAXxAACuH5JKq7/MzOpPZCmIG25q57L1D1JZuVa4MGjX05H
 PVPH1REmAiKMA892IjtSwsqpr7FwZV6H2BJz5ApVbCqBse2kWuG0oWuUUxM63Jvnv1uu
 MEs5686mamort6ZvZVChm3FUEAHHJvsTV1JsTBFllXAps6SYwl4ZmtU8isIaQ+8kKiWO
 hSrF6EtwSrk+0MkcvqtOou7ltolD4mnIDjZHhoozFRjwgg6X0ZD3W2pmE0CZYwmNCP0z
 l6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752964960; x=1753569760;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DDyvCg6OCGjHghiPPtdJYx7X44vJDB73UWdtSHOk4Co=;
 b=NtHyw1Mg6TPhGKJP6dFZQKA1haVvNQWl2LMAnQ53a8p/bvohGtCWtngYCbW0+iryDP
 kThchahdlDSvb+3RCyYa35J+Oi/FishOFc4JKi3HEA2sekVV38eqtoq0WtRoYmjS8eCb
 1ol7JNWLYVtxjRhujAiLyYHgHtileZFcGDVnSlrlSJ2EPryAiXmoEBeLzrRhFMOEZaOP
 m7KdaS0oX6KgJZuHMwW5Qp4gp79GYnTapbvozPXbYRPekEgmVNKP3LzGDfXVWl01mNaQ
 jU6ROUmWnNqwQQgg/ed9JCFpMWiRAysYnVJIt5okdGYO1rGIdXfKLkt5asdfwxZvSShx
 h3Wg==
X-Gm-Message-State: AOJu0YwR3CdUdZM485+3SZx7Iyi9CLJG/vbQ845SNCv2IefigC+VqO0X
 PStE8Bm4CpvQGT+zgBzzamLUo+4zez5wleDsCuzMKlp65GeoGRn7vV5T
X-Gm-Gg: ASbGncvWL/L/KEcf8DCZFK7Ym6klnXDIM/zw2Jn4csy1UKRZfTfwz0L3pNNLE6nQ5sf
 yuVV8FRmRLPDYoX1puOgLZUzf69OE1EKqn4IE2Fs+SJjQefFSgo56a1YvMvnEvu+rU726qX34aT
 pWA2s8AUG7F0enjsPEY2paUiGBMww///B7RtotTjha+RNO8zjdpmAajYW7LLnnxXhxgmwhtIW0I
 kQL6vB1CxhszOwN8riv95lhU9jZq3bh2VjsCGISGI/EpMfsmFgg6yG1toemzcoNu/wjpmN8U2bz
 rLw8W1BBURaBeNg7k1AKy4M7vaMWGGOaBAbH5dUXm+Q69s4Vyh8JU8Y31kHROFU5v9fm0sfsaGg
 uROc46IPwoFqgQCDbv1/7EkLRDPso7gv9NS2bCpgj7S0GyINuqSXjROAM+zOtqCOTjKp7KZ9daC
 cBsYhLLximUewZF+fGoo3RbYWydEOxERUa+QrEnHY=
X-Google-Smtp-Source: AGHT+IHBfhdGXApBiVWQorGUCWi73mqLnvE4gnHm5ZaJ+siueYioUFLzEt+GvjWANDcL9kctlLGzHw==
X-Received: by 2002:ac8:5a04:0:b0:4ab:6c19:d098 with SMTP id
 d75a77b69052e-4ab93c46869mr278593991cf.3.1752964959752; 
 Sat, 19 Jul 2025 15:42:39 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5c29:e400:78d6:5625:d350:50d1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b1f1d5sm23671841cf.50.2025.07.19.15.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:42:39 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 19 Jul 2025 18:42:30 -0400
Subject: [PATCH v2 01/10] drm/panic: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250719-core-cstr-fanout-1-v2-1-e1cb53f6d233@gmail.com>
References: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
In-Reply-To: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Breno Leitao <leitao@debian.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1752964954; l=1187;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=krK+3YMl5oU/necDPLT7VgqDzfPLDYadhp25r7hehrw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHhiBQtj1RxNjNRICZbpjlofaISy1qzCpySnu0Qgl6jFOoJQZcOHFnEGcqwbaywKSIXH1ZqIPur
 3oScZEqsysQM=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
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

Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
avoid methods that only exist on the latter.

Link: https://github.com/Rust-for-Linux/linux/issues/1075
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/gpu/drm/drm_panic_qr.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
index 6b59d19ab631..fea062cc0383 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -948,7 +948,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
         // nul-terminated string.
         let url_cstr: &CStr = unsafe { CStr::from_char_ptr(url) };
         let segments = &[
-            &Segment::Binary(url_cstr.as_bytes()),
+            &Segment::Binary(url_cstr.to_bytes()),
             &Segment::Numeric(&data_slice[0..data_len]),
         ];
         match EncodedMsg::new(segments, tmp_slice) {

-- 
2.50.1

