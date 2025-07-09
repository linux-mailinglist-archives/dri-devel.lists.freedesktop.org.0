Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E77AFF223
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC01610E829;
	Wed,  9 Jul 2025 19:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b7EveeqB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF5B10E829
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:58:58 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4a58e0b26c4so4389441cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 12:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091138; x=1752695938; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KjFq7UYS8hmojmjwvZ+zmn/qpSRuJtm2WZezXQ16zw0=;
 b=b7EveeqBnxjKb5WbJz9Nh4iBAWMzdSUi0W1lZORyZKa4oBgXj3FPU4xT547+TlRAPV
 fdlgCBLDSJdG8U5h4E4C6sJaenEI+3Qh/oX+JbffQFJou8VQ+9ka1gSrz6F3IeUNlGJL
 IqKkkuHyGiNafRPwPGjM31wgIk/rZfK8MZnR9tFUkkUwizFOwY2+0nVl610B2aiphEUD
 2M02EaBkqj/ycIuj0FLAAqY9Z2bRjrMlUZG8x0tfOMvpM0ZyjPOoc9qJqKBvbGSuFIpv
 4O3RN+2mfBTYohOJy9jX+/WOFJRxNUexMelqT5RJBBufSYjQAr4okrj1KVI69OMs7dg9
 GTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091138; x=1752695938;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KjFq7UYS8hmojmjwvZ+zmn/qpSRuJtm2WZezXQ16zw0=;
 b=gYp98BeeUA6G7nKt0L8LPFwWwG7uUtj2BHIVjkeEGrM/TVIzkqXTvG/XMtOJtAik7C
 Y1NBzAj0U2R6OFS1ywzVhPxJVwgWmiUQLIu0G+GVDyxf1plfqL+EOmvU8IjKWrSB4nyj
 HXMVPkILLUNna1W+noauVDkamadK8FAjeGpdCuFymwm7giRE4pGzK8TyCwe+HStYuvB4
 30+YwXCIwvkeKCaQ690fo1W/Sqwuva3VzrsFEAWfV2gIlFJgDJSN7x/HkyRJCEKRovSb
 qb1sdKidrh47mu7/VB0qVW0Dh4ZDj6ztt+XLB7Mv2m94v3ejqwHM+hRLezu43eegOSp7
 xsEw==
X-Gm-Message-State: AOJu0Yz32L8a+txVHG95OTzqgd0pjloFd97HfpXGZtxsh/cLNhFppH4h
 +nIqgeIKCPyEpkygY4+Rh2o4N4x5Mqlhzt42TID0betn9oEz8oTjGxl2s1BWvdub30goBQ==
X-Gm-Gg: ASbGncsDASBPzXyRtzNPZ2SJfwSjwtDXxQgDI3l4Gx2uRx4K455u8qiwaBJPp+DRZDh
 fU/zIQajsHfXelzb34gKixj9rKHwJoCCGJYO6JUtV+wyBbhwUsmGqgtWPj9o7C7nuso67fgDzbM
 LL/hnqWKbQmMWFyJMdQ1SgOpyU47umntGXSnfqKx535+g+SfyLiEm2711/QAqcKx4bWzOguKxoO
 NAjTqlM32158lADjnrDOAqRheaC9dOhCJryJo5DIhQ3m1Qee3qLOHu3/r45jkZSPhNr/VSVZi6R
 SXbUPcsaQjvn4fYz1neYLJICtgTwWcQe3VttGo0hd8eIK78kQZcH+mfIYWpeOiF8Az7v3Cc854N
 Hl4FRgIP+Kd/LL+LL+1nYSN6AaolmeHqZzbFBdu2TVY/LzLeKMGN74+ez/Q==
X-Google-Smtp-Source: AGHT+IFOO4s6abodeExD0GmybGRrIRuRV+W6D5U0I0Tr1TjDy6dph0KjH9CsZ4l2j8Y+zoOtXMhcrg==
X-Received: by 2002:a05:622a:1350:b0:472:1aed:c8b4 with SMTP id
 d75a77b69052e-4a9e94ae9f5mr17712751cf.34.1752091137593; 
 Wed, 09 Jul 2025 12:58:57 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949faf39sm103584281cf.28.2025.07.09.12.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 12:58:56 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 15:58:51 -0400
Subject: [PATCH 01/10] gpu: nova-core: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-1-fd793b3e58a2@gmail.com>
References: <20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com>
In-Reply-To: <20250709-core-cstr-fanout-1-v1-0-fd793b3e58a2@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091132; l=1094;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=lXhB3ReogTGFAKcAXwsx9yhjUwYICNU9NQ66zLyVw8I=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHO89qb+A/14W5ZaKLln68gAAlveEjaoU+oksqwcVVthYSjBuURPwVYoW6QTQrF3UolajEuFQa/
 faudbNVVOKgE=
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
2.50.0

