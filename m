Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52304AFF22D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA0610E833;
	Wed,  9 Jul 2025 19:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gSwQGK/T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C3410E838
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:59:11 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4a43972dcd7so3121721cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 12:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752091151; x=1752695951; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UUW1pWKXr0SgqlavpkwDXDeyBknv6dTunIyH+LvLX6w=;
 b=gSwQGK/TxQGUvVvlPmqMnDl5EX3FQ6peBKWVTI9mNV1ejoCHz4348ViY4D77/AHtJY
 A9ukUEg5Opol09gWOnJpH0eV71yMAEg/iILUjjJ7GRxy56Zz6gf305osAmwLA7hYw0w/
 tMmPeLEgnat4zRgAWhdWq83VGfIGxKKojuYMAGHB4Z3tMYRSi3WpCO3Sp5jGaTPn4Umu
 Fs02ONko4F4shU/CxJf7ag2x/W007FL+erCHtoNtsaRjxiD+nHsatMDKJZCoM8PxWzQu
 6Q6onzDP3zCPLyuAknoyF7RZDijkiOq5mFwawjkmMiQKrmwv6/LO6ACUWLrQjKGVzK0h
 cqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752091151; x=1752695951;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UUW1pWKXr0SgqlavpkwDXDeyBknv6dTunIyH+LvLX6w=;
 b=EFbOHLXGGH/DlE6Q/8mtjBa/Z3x3IvM9+1HlCLNI7g3+qNN7o419/nspXRVDFJ9Kvo
 CFzAnaGQpAmpOlksFtd6RvcvXsYm7zA7LDXgqgPA4GxCx6NmQWZRhKF+1zOXRXl+84v0
 pFhgdnRpNosbMd8Ppoo/hKk0j+EYfIxPSj8J2vXxtK+mWkkkbPgHz/xW6kHTdNoGp4WE
 weJkf5r2UFIzSgvXPf2pMPmp1ud+XPZexpVmB+seax0jAJ2eHW/+R1ityQlVaSALPlNK
 Ui0MfNYJ+ypH620NYsqo9WrT7UtOlsjZhXaBz/5ZcFP+wUpfP3JvVQs1BH0roK7R2/B5
 Zr5Q==
X-Gm-Message-State: AOJu0YxtLXrGevo3X3e2vffwgQr5zP8qHWMCUWc7CrS8ujmLscy/+UXd
 rVY2pl2PwMnAYSIT+PUtEEgKkLvasz2yg1IiLnIxZey8I4KsM0iQ5e6K
X-Gm-Gg: ASbGnctWT5q8W14Y/H7mh1TiGeeZL6/GHgzQAYtvXGHW5ZSyYrI4e0GxNmHQlhEROui
 BQumy6+dbvewJXHRZyfpDjhBVeXcNY6Irbkkjv+kM48jC21J53gWAVIFOQz869JetsqO2gVj63N
 GgSuwvPUQoCEDmIdbXt3DP4wawTnbb1gOEqofhWG8uiM2HcwiZUDCCiDuksg8p/WTyKdyHfdAAJ
 pCkocEv/aJws1tQGuKofESgEhzGDyQFtVMzLkZoKX/VyK8LRu8D1+zk/k74TU3BIULajwHzBNeb
 gtrODCO4XlRL72lbfoK2J+D9ixs70kCouvy6uPbKhFbZSirYwZE1m3LmfR+u/AESSbOvlxVczUZ
 yld1y/YAHs4EZFuUBkzaAE76/032w16NvLu7bmz/MQYl4ICLt4iu6uqIeaw==
X-Google-Smtp-Source: AGHT+IHXdEVjnJrqmEZdR/t3wveCipsqfk90lWTMcF8YzDj8t6VcoqZTYbnDJ2c8ZVzxuEDJnSMhpw==
X-Received: by 2002:a05:622a:1342:b0:4a9:91b7:6b88 with SMTP id
 d75a77b69052e-4a9dec2812fmr63675201cf.11.1752091150495; 
 Wed, 09 Jul 2025 12:59:10 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([148.76.185.197]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a9949faf39sm103584281cf.28.2025.07.09.12.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 12:59:09 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 09 Jul 2025 15:58:58 -0400
Subject: [PATCH 08/10] rust: miscdevice: use `core::ffi::CStr` method names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-core-cstr-fanout-1-v1-8-fd793b3e58a2@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1752091133; l=1138;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=dm10gtwjuCCm9tTYRvN3dYOyNcS6PwNHzHuSeS974dU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDBoJX8VS6KU8NdnpyFGeJlvA1xdRjRBiF83ac3T8qzLDrgh+gyjUJn0Ce9odVwQyScsSuUZIpE
 pUmfiT8bhNgE=
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
 rust/kernel/miscdevice.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 288f40e79906..b5b2e3cc158f 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -35,7 +35,7 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
         // SAFETY: All zeros is valid for this C type.
         let mut result: bindings::miscdevice = unsafe { MaybeUninit::zeroed().assume_init() };
         result.minor = bindings::MISC_DYNAMIC_MINOR as ffi::c_int;
-        result.name = self.name.as_char_ptr();
+        result.name = crate::str::as_char_ptr_in_const_context(self.name);
         result.fops = MiscdeviceVTable::<T>::build();
         result
     }

-- 
2.50.0

