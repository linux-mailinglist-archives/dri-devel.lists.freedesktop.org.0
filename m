Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BE3AC3137
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 22:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9AC10E0DB;
	Sat, 24 May 2025 20:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UHjhX2lV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6E510E0DB;
 Sat, 24 May 2025 20:33:26 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7c560c55bc1so110071285a.1; 
 Sat, 24 May 2025 13:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748118802; x=1748723602; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mvfJkqxXdrTl2ACAyEytt+D5VYLPEzTHxEFeE81vrvE=;
 b=UHjhX2lVEpWMyuoWlC2Nyia05LWYXNWtfLNQkW0+5CFu0xlxE8fwMB39cOh7UWZwO5
 zof5anPj4uNoYMnOMK8EW89oEaijjw8Kw2X+JDSSVfzB11pcwNrXWZqGntP12DnWdjYl
 2/keKmr4LAjwkaXTYDIllJMTzpiy97nwcSKjdPe+yx9Fbam0qENq79dzCidAPPh6Doa6
 vRYV19q2TvhnTg9MSdOs2yaYzqWvnQjKn4IIdoSOEYILG638gWAjKt7WLX9EDnWHsCM/
 0X9hmY9bBXOOJZKBMyrkQn0R5CIfvjnhaS+mZMxCVQYHxoUtXDtqqyVALzBT8mx9jKVG
 YDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748118802; x=1748723602;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvfJkqxXdrTl2ACAyEytt+D5VYLPEzTHxEFeE81vrvE=;
 b=C/bX3WxZ8E1E3BeItZl9PESltz6yYuNMvi4t9MitwrcUZrXTKuRbK8uQvuAj0giQss
 uQ+lpw12eIu2OEBN6zYnOmYnfRxRXwmzL36vF6EnfHjhR5HAwrAr3A+v4pKif1qScxCd
 DaSUD3MLdfCEfvhTrFv2cXe8afutFXqFFQuoYyHuW1hQ4lVVQiOPDHfNr+IWJ/YztuAf
 05jkzuUZ6hmpmSXKBzQRdNcXgjdyNwZgaFALLCCttkp/AH/FBUOLOO45P27bk9x9zXgy
 Q9PO8P/JZaOAY/w0Pnb5QcjCS1JstESNT2zSoHtQB4OOEFvDomPdckN/UfOJQ0f0ZB3N
 L/MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVruybv1T4ejvCKmUJz+tp6cotbOSOJnC3Na7+745pHMcU29+A6TWH28IPa8r7/HijDIHk3T4ve5w==@lists.freedesktop.org,
 AJvYcCXCx6jhKcGgon1imHZt+McSwhlJXEDa+D2y1iqllw/qGo/iFTB2aANUsnlPP3KoWUL9INPtIJm9v48=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPbr901zQhFwPD5BCwRHWlBQOSQ3So2j+eg5ZIuIMonf+u347/
 fxyvdIRuytTtVf56wm0/XBYldjLawA4sHX3e9Es1yGouTzUfTVCq0mY8
X-Gm-Gg: ASbGnct2Kf+Ltq8NfeuL1b82zb2n2YVZKJsgL7lakC7qhxPBKguXb7BYk3pijQLnFJg
 PkVQxJyd9ahYt/zPyMbXqN7OIw5xjSgKemlem9FarLPG40hM+E59+gWlpAmlPVkgxPoekQ7Ce8p
 N1srH08kix1CQVMTUsFVB5oEpxR3fHHc5ux9u22yywRVCxUAm5Bg4ojM0H3WUFpQAuKSR2e2/pz
 RZ3z9jX4WCJ89KhJritfoBxk5Muo8tElMfZ3hzNrUSdL0Lx/vOS4SkupDrc2cZCXHcG1c3jD00h
 vuESFDEMYr/OjVU9DPfxiZppUPhE1B9+Y0cr+9ijcA1YaNhRSgTDoKYcD+0uIIudx5742iMnGOu
 eKZP1sGwlpE4VR/p87KLWY/Yj/25mQq21XgkZrvrVw9jZ47+9r9SlAemb2lUscxmV/a/zLCB4t3
 ydEcY=
X-Google-Smtp-Source: AGHT+IFboxRLluplUf3LaplIw8SJcbgWkLbYbE/qq4hS3to1whGiWg64X2sqtasOImnMch7vEUC1oA==
X-Received: by 2002:a05:620a:608e:b0:7ca:eb5b:6b99 with SMTP id
 af79cd13be357-7ceecba77cdmr512632385a.15.1748118802225; 
 Sat, 24 May 2025 13:33:22 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2600:4041:5be7:7c00:8563:e370:791f:7436])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7cd467d7fd1sm1379590085a.29.2025.05.24.13.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 13:33:21 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 24 May 2025 16:33:01 -0400
Subject: [PATCH v10 1/5] rust: retitle "Example" section as "Examples"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250524-cstr-core-v10-1-6412a94d9d75@gmail.com>
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
In-Reply-To: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
To: Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Benno Lossin <lossin@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
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

This title is consistent with all other macros' documentation,
regardless of the number of examples contained in their "Examples"
sections.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/macros/lib.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 9acaa68c974e..d31e50c446b0 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -263,7 +263,7 @@ pub fn concat_idents(ts: TokenStream) -> TokenStream {
 /// literals (lifetimes and documentation strings are not supported). There is a difference in
 /// supported modifiers as well.
 ///
-/// # Example
+/// # Examples
 ///
 /// ```
 /// # const binder_driver_return_protocol_BR_OK: u32 = 0;

-- 
2.49.0

