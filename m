Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC274A48607
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 18:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7948710EB3E;
	Thu, 27 Feb 2025 17:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="bf3FoGAP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA2310EB3E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 17:02:39 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-390e27150dbso978060f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 09:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740675758; x=1741280558;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7N2niC0tm9GYpL4kTpAci69B17RX2iCWEhPKu3yRgtc=;
 b=bf3FoGAPdx6m9JiORExjOx+qjlL5rV09Z6eqLADHmCSk+UKHWqzslpVIuakP2JvzUP
 FQpD39EOw8sx20jNiMdbC1uUKrEh7AonYAriVUGrTrn5zw2gBQBnFX1/APP+c9s1wn3a
 IfB54e1DITbrNrhst1ZiSX7LGnNNRlHoweb3ILa/HakIv7ctm7UMohcyDNKnpI3G7oFb
 yhT1dSvS7HOqg4V1ipCaWHbvKfcg1NLtO6t17YLI3GLshU5qgFRr2ljoQRcZw8MrhBxv
 Tw7HhGOVWdHdbwpW1P6PtGkrZQ0QdyjlZjAIEZJya9IbGnFLdffkUob9PJgcMUIAk03L
 r+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740675758; x=1741280558;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7N2niC0tm9GYpL4kTpAci69B17RX2iCWEhPKu3yRgtc=;
 b=svCfa0mWMBHNk0tahaXGiv07ys+uZrrJPvAokhUbW8m/hdgT1HVjVuT83btY8B2uEr
 YnIeU2ixauXnKBbtU+GhzMIVVLxubGgLmyTUf4ccP7esVrww2eZ5+c5v5829rKKBz7tV
 9KDv3BKp/8e0AQFbPeblxxnmmlJ7eIuCBQ6jUGXs4MCcHz6xWYxWKdxYIj9BAJV1yph6
 uZXe1EWZby9nGcWMSoI+YDIcjtoYMAtQ4aQ7Y8vVvizrLvuP5wmPXD2h9uZtTeb0FlS2
 jytc3kXxM2qm9cwjasGzNHx9qYE9BXuJsudHEAnwgEvRCfu9y8uGtZry5PzGjCdL6oko
 fm3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdlbUEM6kxwJLrjkamULXlHRsC+JeOJmoCYRq1oxhCiPg4d1fG8Xme3AGuE2vsVNXopGJKz8tOXTQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+umlaAoSFHLUV2yfRG4JwjHZ1wuGa7n7sCYwJHEdOI2hYtlBV
 JBdDviLdMPIncEhgHTHyi/of6ZwNtUAMBHBIxDv8+syklzY7DQBvqIaNJoVCaXXntAP9N0jREyv
 f0hvWTmZx7bASvQ==
X-Google-Smtp-Source: AGHT+IGiRBy2T4pZuKAoxObAEh9uitxTWZj5IZVMfO1S6oM96yytdRmD9YMHqkMLgp0r3G0WIE6HBshMhjxRYv8=
X-Received: from wmbjh14.prod.google.com
 ([2002:a05:600c:a08e:b0:439:8ee3:e17b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e15:b0:439:9cbc:7753 with SMTP id
 5b1f17b1804b1-439b03246d2mr237339895e9.10.1740675758273; 
 Thu, 27 Feb 2025 09:02:38 -0800 (PST)
Date: Thu, 27 Feb 2025 17:01:58 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIaawGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyNz3dSKgvyiEt3cxOSifF3LxETLNEMDQ7MUi2QloJaCotS0zAqwcdG
 xtbUAw8oUeV4AAAA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=SLkqtCbTV4WGngOIGeQdA6Ma/ik2r38oGZ+ix63LEAs=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnwJqObbplB6yaeANqTFz7BvG+CSsY/WddYZzOF
 Ug+T+3+duSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8CajgAKCRAEWL7uWMY5
 RpFKD/9sJCzRyJGIyiSqnki5NeoIaiQUIr0r3kFUeBkycOLKP6NN7QmR1K7Sl6FCblSl8mcdcd5
 SMoTkfP7ETUcT/aDp8hNnqguI5bGB3kX65A06YmHds5KVEMEoDOflnh+SNZ2J4QAeBa59hyujnk
 8EyY0GBFoOxp0Qbf+NSamLl1BAECCBS7ycDJesX/ceneS+/TVJCtftniQOSmaDe5i6fs8XbpvRF
 Z9AYyINAQYYOLnZWngIoX8+S/h+gZgQPVbhHWSwwcC7hGXJnIQGjzBFyDi+JjfzQ48pYk8VIW+6
 WDRuuizvplZPnA3/Th2Q2UwY3VXn7IYHodwxNluX0gLIoJFe0sXF2Cd3wlkD0Fm346lyuQZUveJ
 DFrVjvse0OcwYk35esL2Il11UU0K1CB86qBqPW3SFmWunjk+q/WAGztVxyN0feyDDghNgIM6czW
 cKlXb2I/AzihXQwgoNqkJ77cGWAUF2Q5OGfbFtQ7CrgVqz3XHKpaoSunEDxsvIkCkovA41p5ZkO
 E9Ka0h7XG+BvNr9oflcrsYNyuxubjRtE1tOvtGx/L1ndT/hjEhCLi7ZpwnjyQ4cFS7QqG2cNQpn
 r+zHiLtV9TX7yvawCgcc0XEHv7rgMkuOB0A+6OHPixX3vp52M3H6PCpSRJkqGoV/l/pD+ULqBXX
 1Tc+b3pKRo/rczw==
X-Mailer: b4 0.14.1
Message-ID: <20250227-export-macro-v1-0-948775fc37aa@google.com>
Subject: [PATCH 0/4] Check Rust signatures at compile time
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
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (4):
      rust: fix signature of rust_fmt_argument
      rust: add #[export] macro
      print: use new #[export] macro for rust_fmt_argument
      panic_qr: use new #[export] macro

 drivers/gpu/drm/drm_panic.c     |  5 -----
 drivers/gpu/drm/drm_panic_qr.rs | 15 +++++++++++----
 include/drm/drm_panic.h         |  7 +++++++
 include/linux/sprintf.h         |  3 +++
 lib/vsprintf.c                  |  3 ---
 rust/bindings/bindings_helper.h |  4 ++++
 rust/kernel/prelude.rs          |  2 +-
 rust/kernel/print.rs            | 11 ++++++-----
 rust/macros/export.rs           | 25 +++++++++++++++++++++++++
 rust/macros/helpers.rs          | 19 ++++++++++++++++++-
 rust/macros/lib.rs              | 18 ++++++++++++++++++
 rust/macros/quote.rs            | 21 +++++++++++++++++++--
 12 files changed, 112 insertions(+), 21 deletions(-)
---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250227-export-macro-9aa9f1016d8c

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

