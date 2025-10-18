Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DF4BED616
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 19:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8E210E143;
	Sat, 18 Oct 2025 17:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nBOd4p34";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0110810E149
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 17:46:01 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-8909f01bd00so280614985a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 10:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760809561; x=1761414361; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H5WimfWZlEqiYHKzfmcAckTYkDvTe0+bpTYNTmk8aT4=;
 b=nBOd4p34CRRumfUXn4ocLhXH+i9o/fEJ2dsEYYGtsC99cQ7tPRm8eM2LHui8dg/M1l
 wS4TbNgbS+BYhnEIcIuwTlHS06F38ZxBi55vMwIWq+hMsOV/en0K2ywhXyzAwN8kY/kw
 WHckhoq8maJ2l3Fj7HNZwfWsbazWYzlx2CabN3qo8jwO/QRQxb6+zn6IOd17BuSLvdR2
 8+y4XbljuPndByyL4DAv54vXPXyXz42/sw1r/M1UTik8JW1aQ39EK9FLK/CGjLbixxxt
 TBDcvVBbwNT2yVtZ3k5QGk5N5lMiOndBItLAlRacMAjQatkvsLEJWMr3tzLt5etuGz/D
 +aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760809561; x=1761414361;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H5WimfWZlEqiYHKzfmcAckTYkDvTe0+bpTYNTmk8aT4=;
 b=iyGTRZ1eUkFIuB7aVSgperhViuYN34cx2J6EvKwx/oHasuin+KwIpW3DED7DD+35YC
 2zGZkhFwBfigyXQXIVEQ3J7+N15Ku4/hVvfVguby1xqhSEWn59V6QYktkOXfmHhr9f7O
 XJQp8yQIdhKdmtbga5RIYFg14iSULSmGCxcKAv6pGmgG59/rE4zIVwgyRyiozmBsH7pG
 KbtnsNFwjQDkzz7HdAkZgAyX1uXoy4aTlbNe2OHSHZt83KcLlERBc1MhX8MkTQqYRcvw
 X5nmPyrKrmv9ezB+q4apsZK3ZxijUfObUXp0fFeDf1feQhoZuAELRegSw/5LRv4oriPo
 V4QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUSkDjd6uqIkR2Whryi7beSwJ1x38jTmWoD2a4PO1V0TGOjJa52VAVHB98uMsPXb/gLidcPwDTJYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUU2pqDfMIYgu+17P5c1ZkgBqkkS0Gepodp1FnZGl/03yPdSrW
 D09HWus5VVBMsYmmbrchaarnvXLS7joY2g7iC8o48a//l85uVav6S4x5
X-Gm-Gg: ASbGncuEci0klhEcjPv8zKCVSkzEf3bVirUoCovVHA7nXp/p6bwJvCNN5rBLHXXSluh
 zwMd+omQwJyBnhbvCc4CNx1VC6lgNPx20DuYxSlL7/kSKsutgjmdjpJJkjLIBlsSd5/0CglRY3L
 +R7lpHsn4aH0Na7vBfWE63Piq9OdbsLM++If9umuHLc0+eAYAoSCBG8Kied1RLh2KAM/HbY6Il/
 B8ELSKFVhbVxjf1/P4B2ODplZYWW7ighUNbcqhbAi/nlrbrdpqxTKPIEgo6DUhMvukPdxutUdqB
 CWb0jGvlvk7KBTLoowGFw562b5FSfhWCzO4wyUKw/RwLWJF6f4cs/CtPmIWOc1EDa6JsSPlmGdE
 M74LjrDUE0TBoRO6sSMLFrrla63UL63RnyN+VvU9XoJQaCw9Iirzt3z2kEmFRC8m0HSecLEAbEM
 Pfqztjz11T48dTViwutwlWZUPn/BtrUsIDIMHVt17aPN2PgCn1b4G27gvbJzC0cKS6WTqRX8Ra3
 pSVbdK3J4CLwengbMemvbNsGHlgJn2Dv6yocQnhcKpciHyHslW9OsOsVja69I4=
X-Google-Smtp-Source: AGHT+IH8lweP2XYB08E+inbzDnXw7d9uWVgrdDvTnlgrkRHMKVP2lag0JhfKwKbfvNE1zYcp4Zi2rA==
X-Received: by 2002:a05:622a:15cd:b0:4e8:894e:1345 with SMTP id
 d75a77b69052e-4e89d07d9b1mr104925911cf.0.1760809560785; 
 Sat, 18 Oct 2025 10:46:00 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa
 ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 10:45:59 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:19 -0400
Subject: [PATCH v18 08/16] rust: pci: use `kernel::fmt`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-8-ef3d02760804@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809527; l=918;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=03bsWp5q/RvNg/sXSrzNos1bBBR49+qyJdq4+m4Ha6w=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QH27Y5uAfTmrvKZIdGCHYL/oomYMJkFLfNEOLtlLtpxxDPHsRr1ISH3D/10dPkATw5kw42q12/O
 zIe1ETaFKVAY=
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

Reduce coupling to implementation details of the formatting machinery by
avoiding direct use for `core`'s formatting traits and macros.

This backslid in commit ed78a01887e2 ("rust: pci: provide access to PCI
Class and Class-related items").

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/pci/id.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/pci/id.rs b/rust/kernel/pci/id.rs
index 7f2a7f57507f..5f5d59ff49fc 100644
--- a/rust/kernel/pci/id.rs
+++ b/rust/kernel/pci/id.rs
@@ -4,8 +4,7 @@
 //!
 //! This module contains PCI class codes, Vendor IDs, and supporting types.
 
-use crate::{bindings, error::code::EINVAL, error::Error, prelude::*};
-use core::fmt;
+use crate::{bindings, error::code::EINVAL, error::Error, fmt, prelude::*};
 
 /// PCI device class codes.
 ///

-- 
2.51.1

