Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA3FBED719
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 20:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AD110E051;
	Sat, 18 Oct 2025 18:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3Av1PdeF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC7510E051
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 18:03:09 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-47114d373d5so25353545e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1760810588; x=1761415388;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=3Jw3+rOqAmz9lI4+2vszjAxIVE8PlKgnkOGLhqwHbOo=;
 b=3Av1PdeFMDiV6FDcJ7dYmGV4ZGvhIQ0rMU4sbB1QTpiEnHBF9OiORFLMlSid4H3F0b
 kKpLG7eCTWROFhLEJqUOpcNaIbOt3ri5Zo5m4mFxd7DYDu6EAr71QIFm15z1FmVJjZ4Q
 qzFlBoIbQM+1kFrs6P2z3DtT/QBVizu8dD6+k2YzjPMKacHBLe9jue/ALh/wsk8Hjfkp
 XiJpESMkXsO88EC2E+4cZldiHhPgRprfTFQ7UoLVjlEz3bEQ8QMnMV9ayrrZBDinmrUo
 bgP0R7LxUyt6F710avBOlAzy7DYNbhaO+kUK0e3MRS2WiiFMCtHIXC4jCNSFIa9bXfAr
 bGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760810588; x=1761415388;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Jw3+rOqAmz9lI4+2vszjAxIVE8PlKgnkOGLhqwHbOo=;
 b=Qi4wTWVzG7DpodmyX1+NPw9WjZUXhV3zSPYIbswEqCe9yp9LgnANA32jG7I+oOXuop
 el93u49l0KYHpJ8HW3nNNq/CCfYYi/IF3FZpDYusnFFw4phyxZsR5JmktiGDzEOGfpWW
 WGIxZ/zqniS5L10nFEvZuX6KBRvv7MaTza0iaMcOkS/r0z7TpHtkY5KTnba1fRGIG0II
 9A6VBikJkNaY1973zPkqJeMkd5Z/BOrOCZS8QdA7/IhPfzjFzX8J7VWSlrxMfksa3+Un
 p4jud+FcYO1/vkHOawiUKeXFAJPDsHTv6j7gE/tQABOcgq7oGfpLdD2lyQexnKAsqOnA
 GPWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1LrIJatAR9sMHSgptOPUkI2MlI2LDFLosRGs00FU6jRbYghzKP+ARoG/+KuQY1JmETM3j5/U17Jc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf0QZOHLw6MQrvJ9YlqrtnNMFO+thQjFc1IqQCXYjpFfY/X5ZK
 gfZmH0YQ2mB8XHUOgOh7qgQilbvUlI6kIHXKqIK8U7n0Ni2d8kpNur9Y2o+kt/L69i8FvjvTqq4
 g8aESHfpzfSR6oG2z6w==
X-Google-Smtp-Source: AGHT+IEDBiBL9j3PrKHEoPMUCzoRBlvkx4ZL7AxoxVM1NpYJWMzoUQv31Vq5zUARBonVeR76HGoFc6I/2XbrkI8=
X-Received: from wmbh26.prod.google.com ([2002:a05:600c:a11a:b0:46e:6a75:2910])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4715:b0:45b:9a46:69e9 with SMTP id
 5b1f17b1804b1-4711791c8c3mr58877225e9.31.1760810587581; 
 Sat, 18 Oct 2025 11:03:07 -0700 (PDT)
Date: Sat, 18 Oct 2025 18:03:03 +0000
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
Mime-Version: 1.0
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
X-Mailer: git-send-email 2.51.0.915.g61a8936c21-goog
Message-ID: <20251018180303.3615403-1-aliceryhl@google.com>
Subject: [PATCH v18 12/16] rust: configfs: use `CStr::as_char_ptr`
From: Alice Ryhl <aliceryhl@google.com>
To: tamird@gmail.com
Cc: Liam.Howlett@oracle.com, a.hindborg@kernel.org, airlied@gmail.com, 
 alex.gaynor@gmail.com, aliceryhl@google.com, arve@android.com, 
 axboe@kernel.dk, bhelgaas@google.com, bjorn3_gh@protonmail.com, 
 boqun.feng@gmail.com, brauner@kernel.org, broonie@kernel.org, 
 cmllamas@google.com, dakr@kernel.org, dri-devel@lists.freedesktop.org, 
 gary@garyguo.net, gregkh@linuxfoundation.org, jack@suse.cz, 
 joelagnelf@nvidia.com, justinstitt@google.com, kwilczynski@kernel.org, 
 leitao@debian.org, lgirdwood@gmail.com, linux-block@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, llvm@lists.linux.dev, longman@redhat.com, 
 lorenzo.stoakes@oracle.com, lossin@kernel.org, maco@android.com, 
 mcgrof@kernel.org, mingo@redhat.com, mmaurer@google.com, morbo@google.com, 
 mturquette@baylibre.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
 nm@ti.com, ojeda@kernel.org, peterz@infradead.org, rafael@kernel.org, 
 russ.weight@linux.dev, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
 simona@ffwll.ch, surenb@google.com, tkjos@android.com, tmgross@umich.edu, 
 urezki@gmail.com, vbabka@suse.cz, vireshk@kernel.org, viro@zeniv.linux.org.uk, 
 will@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

From: Tamir Duberstein <tamird@gmail.com>

Replace the use of `as_ptr` which works through `<CStr as
Deref<Target=&[u8]>::deref()` in preparation for replacing
`kernel::str::CStr` with `core::ffi::CStr` as the latter does not
implement `Deref<Target=&[u8]>`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/configfs.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 10f1547ca9f1..466fb7f40762 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -157,7 +157,7 @@ pub fn new(
                     unsafe {
                         bindings::config_group_init_type_name(
                             &mut (*place.get()).su_group,
-                            name.as_ptr(),
+                            name.as_char_ptr(),
                             item_type.as_ptr(),
                         )
                     };
-- 
2.51.0.915.g61a8936c21-goog

