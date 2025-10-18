Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D124BED61C
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 19:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7772F10E17F;
	Sat, 18 Oct 2025 17:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NUkJiOki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A23310E17F
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 17:46:04 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-87c20106cbeso39543016d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 10:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760809563; x=1761414363; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ycwx31K2mxLEujn4A81pZPUGOjv1ArmgOKcrq9XGsoU=;
 b=NUkJiOki766SR3qyGalj+5vvhqXUZgQoWq0UYRR3hI7qWAimkF+90TSWOGQQnN4iO+
 UAIPwHYPJQNKXjyY9uChFiefKladll9fOHrWdb9l5B7f82nChsfOFQfeMf/4Sk/mFQFZ
 qd3NzX55TNijvcoWhea8q9EPGgDfu2oXEfTZx+QZY8Vj6nO6PTkqG7e73W4bajqBfZQa
 uYM13P6E71+u5xUol+N8EHJYB/tQGBveTv4YyCIAUQV0Rvy4lVn+vgoWqmSN721H7ZYv
 4n5XPRLushv7aVqYlqKpS6+ZGcTkjClNdsbnZpNx6vXV8dbuWHtckUvqaTAlp9rBhwPe
 L8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760809563; x=1761414363;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ycwx31K2mxLEujn4A81pZPUGOjv1ArmgOKcrq9XGsoU=;
 b=Qy5iUk2vKUCZHyQr8PHq3hWAy/tng8Evef2LfB9fnXACB9DVaEKuV6Y/PrzRgMPUfL
 WoOffVYgPywKImyZNihvJpfUeSP1kwcUW2/nEY4Qu8eCabK+2CvHYFmTSWHWKS8CcCpT
 V0KWPi9V6KzDB0RBQLELCIw8I+5emF4n7ARC3/y0tTR+8bbHS3NpghFlJlQbopTRW11y
 1XThoWN+fUsNZhbz1VFpSne/cWF/LKsrWOpQQU9e/vfe2SqQl4Ga4QwxxsmnjG1Fem2S
 g6BirXWRzZMz6mOEQNDRFQhq+wz9hWMAzRbG2drF7qhLQCvlG3qv67D+UAbNV8V0IiAn
 fpUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3O82Pkd/gzyzEHVlzQKbcDXzNDIbh9l92bIjUPzxBmbiuhvql+eo2TVrP6MeXXYkSGT9f0GJ0V7s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXQ+ao21DQmHLDe/E2FbMl7y4FnaPeZVMIH7YVeHaTB4HazdcT
 /2wykesKV993JO1rBEQH0DMdVwcOr3jmpWF4vohP2VDyHWz72II/EdMe
X-Gm-Gg: ASbGncss5eMD8Q+uuyHsNbfL7NaJ5vHJu7iUwu3vssQaAZfu6S4kq5ira+xHxW6t7X7
 tEQSIU/AC0+43A6BAIhqUAQ7XmNr1hE4p2zqA4NdOUrKFd1fCjaet4Iefu1jgwoVp6F0v64D7Ea
 /tUS5JzCdIeq7jFF0UH+hNYwLNyMRef1enCcL5hcdVUT+Tmo7JlKrPB7Cw1A5+slr2y2duVExsR
 jpVitlyq+pykhWljg9OnN6GnangcnpvjCrAkR14QZILnBalD8zkiqOId4a0sv5akMh7fbtsfO3+
 CpWGJ/oLLONAfT/nhY2KzXVyMHQTa7UtzIO0gMZij5Hht5Cm8lvuDVbbGwDWMM4FR0hmVUFdI6p
 iI5XjDfI1HcPqUy/an7pO/5/yShGvehT0e6he9s1KZKgQxKpo4ZALlGoXbkgq7RNxS2Q5z84hEU
 hQVGTbIu2RmjVJiqMbLOPXpr01k0CnLp9BX3AIcGttQy/CVD84nr+8U79bHIK+7Ko3LF/OkjA/L
 iH8WNn8APZA2CpJweiqBZpQK3sghBMEdTkJtSxZoFL9PMcEBvYCIhpM4kuKtN8wDtbSPWMM9Q==
X-Google-Smtp-Source: AGHT+IGG7z7f3MNU21/Rti4PmtrZca4GFxKfblibRIkboUBwmpGvzYHP42u9XCSh6vTqFJ+cvotYfQ==
X-Received: by 2002:ac8:5910:0:b0:4e8:9596:ee77 with SMTP id
 d75a77b69052e-4e89d1eca83mr102709391cf.10.1760809563421; 
 Sat, 18 Oct 2025 10:46:03 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 10:46:02 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:20 -0400
Subject: [PATCH v18 09/16] rust: remove spurious `use core::fmt::Debug`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-9-ef3d02760804@gmail.com>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809527; l=668;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=uLnXUd5iHMMEJTAMJKY0bsxZkX3e5rGAkuIO16n9SP8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGXXqQt9RHGxpoBFZLlXeLUPAugoqd/q2N96Ig7iFhgm9rnqX6mshM+HDXmtIVBN7F9GI6CbJIb
 k7xYI3LBrrwQ=
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

We want folks to use `kernel::fmt` but this is only used for `derive` so
can be removed entirely.

This backslid in commit ea60cea07d8c ("rust: add `Alignment` type").

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/ptr.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 2e5e2a090480..e3893ed04049 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -2,7 +2,6 @@
 
 //! Types and functions to work with pointers and addresses.
 
-use core::fmt::Debug;
 use core::mem::align_of;
 use core::num::NonZero;
 

-- 
2.51.1

