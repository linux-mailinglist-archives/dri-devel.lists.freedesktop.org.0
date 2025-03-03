Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29EAA4E422
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 16:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A99710E5E7;
	Tue,  4 Mar 2025 15:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="2+q9BSJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline3.cc.itu.edu.tr (beeline3.cc.itu.edu.tr [160.75.25.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19B910E5E7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 15:49:00 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline3.cc.itu.edu.tr (Postfix) with ESMTPS id F24E040D0C94
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 18:48:58 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6g6D0l63zG1Rv
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 18:47:00 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id D27644275B; Tue,  4 Mar 2025 18:46:53 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=2+q9BSJh
X-Envelope-From: <linux-kernel+bounces-541177-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=2+q9BSJh
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
 by le2 (Postfix) with ESMTP id 92AFD42239
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:46:41 +0300 (+03)
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
 by fgw1.itu.edu.tr (Postfix) with SMTP id D3C883063EFC
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:46:40 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71CED7A615B
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 08:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE531F03E5;
 Mon,  3 Mar 2025 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="2+q9BSJh"
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C3AB667
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=209.85.128.73
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740991550; cv=none;
 b=d6EBY8gKBtbioVQK/ZZ6qGHS7euw/n3ScZNwyTWTUNomI6U6fP9gU32Po1K3k3QVHL4UdAMisLi4JkUp+hgwhsxATpYTvz+5A6wM/CklYoJfCyfGUw0QqaQYdvwKeQ9dkImX7nw5wWKo7b83kq/S/0BDmto+c31QQ7oPhJnwlzc=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740991550; c=relaxed/simple;
 bh=XSadD9QdYJXXkkA+j9SkTugvzm8YkfIPAOAXziKNvY4=;
 h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type;
 b=hWZK2b4Y2UyDbEn7WVZ6KVNstY/uyJMLIgNM7zKCsupl7a5AZp8RFAZn/L3F7B7NICJQiXjsrhngLW1Ff7VIMBnd/6aBjN7H3n5JQOG6IcHTPlrcrkEZD/b/JqfulQUtsY13PUWXXSWTkcOnwMQyBx6RcXI0cm89f4HQX4PG3+0=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none)
 header.from=google.com;
 spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=2+q9BSJh; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass
 smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4393b6763a3so15599315e9.2
 for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 00:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740991547; x=1741596347; darn=vger.kernel.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DYh/tabkIBU+qEEozteNgGAzw7miJ+u0L3IImQNu48A=;
 b=2+q9BSJhzYe9eA3ZzqmsZ7K86oMHDjVQCdz01H0IXnQPN9r8xDnylytIt1p20qFStv
 /NpEGcXJwEd4LyenwSQ1pMwtW/s6xe10BjylPTm7/fglKhoKPctSqgwKGnNhMVf1URM2
 uBEtXWVSLKlFvjTxE3BaMpAazKZR4DjFDwmT9AnTajgjW0LzDTOGJsaoW2ITxci4J2YR
 68y3YL2VTgbwjaQVckKqehD4YR+VwHHA3A/V0sMZQ5+dZNtnZfkwZnjo5aoZfcRRIoxG
 b7mTmfj342x6mrSGM7yHJo9eTEBfn0DYtCyGIhbdkN4BU0eeRkQrq912wOBoW1es8l0j
 2htQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740991547; x=1741596347;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DYh/tabkIBU+qEEozteNgGAzw7miJ+u0L3IImQNu48A=;
 b=VwWMJaIkJBnqzlLzhoa+ErsneR8Y4FMNnGYIjWRiD7vZwFxPVI7XocGPvenP7MT3jF
 L1reLx5Rm9abEa/PZrh1C/JbD5hF+VPYx1Hy4IOsClnRC3796m+48+BYYk7tVE+HYGNU
 oXhSzEcQpdEuj3EWWl5/3YSRRSBBVPL9ze3ik9Z+JWzGLtH63Gc9/AtmEgW+PBLeZnfJ
 0B7XnUNoGkCQGXxfng4MdqyWmulYfoeEv3J3STGDdqqmOI/6esEEAH+cL7B/URfsWBuy
 w6oiE6Ex3v689V/tJMMIDQbImL0nw4HG1A0B/y0LQ78zrrarbmloMoklrn1nkmpR6MjI
 v97w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEENj3nfK9heA6ELKp1e6dkFxMETCTW9/Z8AN2LACBcMQu5MNLhMDGAUN27dgM3AsXGNQ0DaLOy5O8Um0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfZ/w7/lGGvj85iCB52w7fqkk43Tl8JFqfcio94zl+mKl/DZLe
 W3hImB190EBVoVaGoDChIeCRqXOdalN6xOsNPuThXbX2UXB4VmdgMGhWjyPkXM/qnOe9BRjrFAA
 CNTG8WINQ8vx1bw==
X-Google-Smtp-Source: AGHT+IFmqw4UbJRnAxWOF/CCPg0pJy+REFK0/XB06eG3qGGCxRsn3vY5ejkeGCpS1Z/tDA6VnHB5nKKppGUUZbw=
X-Received: from wmby11-n1.prod.google.com
 ([2002:a05:600c:c04b:10b0:43b:b3bb:a157])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5119:b0:439:a25b:e7d3 with SMTP id
 5b1f17b1804b1-43ba67047c9mr101624845e9.14.1740991547025; 
 Mon, 03 Mar 2025 00:45:47 -0800 (PST)
Date: Mon, 03 Mar 2025 08:45:11 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABdsxWcC/3XMQQqDMBCF4atI1k1JYjVJV71H6SKMowaqI4kEi
 3j3Rldtocv34PtXFjF4jOxarCxg8tHTmEd5Khj0buyQ+yZvpoSqhFKa4zJRmPngIBC3ztlWClk
 3BlgmU8DWL0fu/si793Gm8DrqSe7vn1CSXHB7MVpXLZTauVtH1D3xDDSwvZTUpzY/WmVd1RZAo
 7Gqhi+9bdsbP0D1TecAAAA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3761; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=XSadD9QdYJXXkkA+j9SkTugvzm8YkfIPAOAXziKNvY4=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnxWwcAkFZ406niQYuJKOAySGk+oWjSWs0I3Fh0
 ok2nKx19rSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8VsHAAKCRAEWL7uWMY5
 Rti8EACRQPC2zHJp3GDFyYGJqI+4nrsuB5oQ+lNboNPv2qNhWsn09WyJNMU+WzMLp+LKIDoxTyB
 Kn48A+KiJfCIBwv0ouAWfOSS70nP0ljroURRA7iY/TfXiw/5w0hT/TpMLFDdamBZGAZWCaZFZzH
 H6jlSdEmse4sPtyKOysR50rayzE/YUVIhkfC0H+TXCHkIrJC/PuxEo9zBTr6UWIkhpET1JSm6xY
 ywHtbeT8+ANwwJpU95C9gBBdbLnACkxPLYDXsZwJP2pYf/vr2NP8I/v+479JUhvUqfmwuUIp4vk
 HYHT8E1txLzcKoqykb2C7JqDt7Q3vaXnDhIAbUe98Nxz2H/S5VfOu554U5ZaIAc0dw8kr2cJKTo
 BfNquJxfEc7l5vNtnpGBMHOhzopfMuCzjegVHOYB8h5sbdjRsk3PddOEJOwnyJK6oi9oDAbjoy5
 sm3HIXwaq4WWHGDdXCnKGFpqQTkd6U6j8UmilrJz6PrDhYqT0c4o81h5EgscETjhM4wAaDqcqDi
 GhzbOLMYx3KdzLwDeN8hGaNqB2vcrbDJrAag7ybpstECJM4qQNkUjsj2LiP3lmJLJ+T8cMVWpio
 6PqjwOvrowEXiVfYk6M60GPpb3uRfdGWPpAlTkgXocdVcDWeuRmgpo+3o9f7G0cukEo5ZG08lUa
 ySxlf3m+JxXweWQ==
X-Mailer: b4 0.14.1
Message-ID: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
Subject: [PATCH v3 0/5] Check Rust signatures at compile time
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6g6D0l63zG1Rv
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741708076.35997@+NJ2qynuqBGlmwoT8G4Ufw
X-ITU-MailScanner-SpamCheck: not spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

Rust has two different tools for generating function declarations to
call across the FFI boundary:

* bindgen. Generates Rust declarations from a C header.
* cbindgen. Generates C headers from Rust declarations.

However, we only use bindgen in the kernel. This means that when C code
calls a Rust function by name, its signature must be duplicated in both
Rust code and a C header, and the signature needs to be kept in sync
manually.

Introducing cbindgen as a mandatory dependency to build the kernel would
be a rather complex and large change, so we do not consider that at this
time. Instead, to eliminate this manual checking, introduce a new macro
that verifies at compile time that the two function declarations use the
same signature. The idea is to run the C declaration through bindgen,
and then have rustc verify that the function pointers have the same
type.

The signature must still be written twice, but at least you can no
longer get it wrong. If the signatures don't match, you will get errors
that look like this:

error[E0308]: `if` and `else` have incompatible types
  --> <linux>/rust/kernel/print.rs:22:22
   |
21 | #[export]
   | --------- expected because of this
22 | unsafe extern "C" fn rust_fmt_argument(
   |                      ^^^^^^^^^^^^^^^^^ expected `u8`, found `i8`
   |
   = note: expected fn item `unsafe extern "C" fn(*mut u8, *mut u8, *mut c_void) -> *mut u8 {bindings::rust_fmt_argument}`
              found fn item `unsafe extern "C" fn(*mut i8, *mut i8, *const c_void) -> *mut i8 {print::rust_fmt_argument}`

It is unfortunate that the error message starts out by saying "`if` and
`else` have incompatible types", but I believe the rest of the error
message is reasonably clear and not too confusing.

The main commit of this series is "rust: add #[export] macro".

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Reword commit message about cbindgen to remove cargo comment.
- Add # token to quote! macro and mention allow(unused_mut) warning.
- Use quote! macro for #[no_mangle] in #[export].
- Reword "since" in `export` last line of docs.
- Drop extern from drm_panic_qr function declarations.
- Add comment about drm_panic_qr_max_data_size being unsafe.
- Add comment to drm/drm_panic.h include.
- Pick up tags to commit trailers.
- Link to v2: https://lore.kernel.org/r/20250228-export-macro-v2-0-569cc7e8926c@google.com

Changes in v2:
- Various improvements to documentation.
- Split out quote! changes into its own commit.
- Link to v1: https://lore.kernel.org/r/20250227-export-macro-v1-0-948775fc37aa@google.com

---
Alice Ryhl (5):
      rust: fix signature of rust_fmt_argument
      rust: macros: support additional tokens in quote!
      rust: add #[export] macro
      print: use new #[export] macro for rust_fmt_argument
      panic_qr: use new #[export] macro

 drivers/gpu/drm/drm_panic.c     |  5 -----
 drivers/gpu/drm/drm_panic_qr.rs | 15 +++++++++++----
 include/drm/drm_panic.h         |  7 +++++++
 include/linux/sprintf.h         |  3 +++
 lib/vsprintf.c                  |  3 ---
 rust/bindings/bindings_helper.h |  5 +++++
 rust/kernel/prelude.rs          |  2 +-
 rust/kernel/print.rs            | 10 +++++-----
 rust/macros/export.rs           | 29 +++++++++++++++++++++++++++++
 rust/macros/helpers.rs          | 19 ++++++++++++++++++-
 rust/macros/lib.rs              | 24 ++++++++++++++++++++++++
 rust/macros/quote.rs            | 27 +++++++++++++++++++++++++--
 12 files changed, 128 insertions(+), 21 deletions(-)
---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250227-export-macro-9aa9f1016d8c

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


