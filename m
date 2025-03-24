Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B56A6E615
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 23:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51EC10E4E6;
	Mon, 24 Mar 2025 22:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ST32JhVn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AD110E4E0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 22:01:51 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4769b16d4fbso25773321cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 15:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742853710; x=1743458510; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0DKJLM7Z9Stu40Q/kKnTtPbAzpv2yQ1EFXVOPNeWeiM=;
 b=ST32JhVnjVsV9yS6I96bMcDYC4Gr7W27FrUnHH4mrVp0gW/U0hQSswmcVDc6OAvOST
 I55CpQSEDLkFbZZtCnqGrcfGlD33fvXD9TmqCPgr65bzkXVvgfTyC8R8lzZKPGk1B0W2
 1KGG3vq9bJ+TVKDJ/h4DTIQWCXhSvcEGbwsvCb1/z+ZVcZTJWuG0tFS7srTBWs/cP2CB
 F/pbv3mbt5P7zwEjGO3VbIFRbzXGNHpH36nX7XYkpvs/lPCPQDcbbu5J7CgUNMM5RwhR
 itQC1P+SIoyQKCVE+xV3eRhowdtBj/YsAVvSmXGMb4tzdl985tjG9tehOFSIsYgIG2Id
 Z9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742853710; x=1743458510;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0DKJLM7Z9Stu40Q/kKnTtPbAzpv2yQ1EFXVOPNeWeiM=;
 b=TFgMItuAoOTu85C4u+xPSconOWGluai5PXOyVR9QbK2Hi/AdKF189WCaddO1mBSeZ3
 jgZK+taof77G+JuEDXoAIGRIfVhdVdVCZyihte/ko+C3SclSKoB4bYGdUcp/fQpJhoXX
 /jx6ufmiCRFSMEiNdhavtVgplPzTxwPX+coqOqxj8HGU/kVUqqp3a8RSN3OWkeb2hCnH
 KPEmq/hT+dN+ON9+SC7K+h6Ma9ZpS+CvNAB0ULf5RUeLjBL1Hf0b5Zz0YvN80tALHnBg
 DjrmDq6Z/gF9Mb/QB4l8RBmzt/WsGQ0kjxYGGLbxO7jyFmBFpRgfHR8YRvqCYRJipn00
 fCxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXO7AXB6r7y32W6MBAAzQEeuYFBLTzozgGKLOOyQzK0LZzHrtvX4TDTtoze2bEegcbaJ6EZ0ItXLc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEw5Nam/grXwpraz/Nb2fsRfG2XpEDGMd6sBpjr3d+rK5YYnIK
 kEMxdPE7jzTvFLIOgBd/wk1V0vWqEy8J7k8WmuQq9fV9zhxzw3qzhHMgpPWPSqk=
X-Gm-Gg: ASbGncvSxcLVvbqj9jojk1BMOd04JHIQJjuOG0RYwfQNhr5qG/uB42Aek6MY/zRAPeH
 RpVJQ93c/aF75Oho5pCxhtML7HwGIGqe1hWltSDK1C8OFlY/sJ5t/AMsPpS2tA26LQJzPPethLE
 uqzSJLiY2WgBSr+wjTqUKy74tIBR4hspOrP52MfgWrI+IimcGN5fuE56hyQfvbz55AXp+rNBOPk
 iffcLHsJHJ0RKEk3+FyIjxc2hNmjZTkPKdYtgx3arPR1uMSEN+HFwt4q0a72vvrtyt5e+zw5tRc
 2/vbyO/pZrl7Oyt6wTG8X7ZRvqWZvHc5A/64vFzH8OPj6TQ3TsPl5UY9M9kKb4pA7GpHUHeP9dH
 Id9jJoq+mrm+uL0XiAsCDrwsvR6aORQKfmNuTt9OWic5TlbvP7YbWag==
X-Google-Smtp-Source: AGHT+IFmPbwb4p7A5O3ShEsQauN8bwD2gzq9L0MWbRn2vSApft5OKiV5A0a4gUNuHtVtJVvTJbnmZg==
X-Received: by 2002:a05:622a:17c9:b0:476:7d74:dd10 with SMTP id
 d75a77b69052e-4771dd94dfcmr252627141cf.19.1742853710412; 
 Mon, 24 Mar 2025 15:01:50 -0700 (PDT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 ([2620:10d:c091:600::1:43c7]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4771d0ad87esm52129541cf.0.2025.03.24.15.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 15:01:50 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 24 Mar 2025 18:01:33 -0400
Subject: [PATCH v6 4/6] rust: enable `clippy::as_ptr_cast_mut` lint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250324-ptr-as-ptr-v6-4-49d1b7fd4290@gmail.com>
References: <20250324-ptr-as-ptr-v6-0-49d1b7fd4290@gmail.com>
In-Reply-To: <20250324-ptr-as-ptr-v6-0-49d1b7fd4290@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
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

In Rust 1.66.0, Clippy introduced the `as_ptr_cast_mut` lint [1]:

> Since `as_ptr` takes a `&self`, the pointer won’t have write
> permissions unless interior mutability is used, making it unlikely
> that having it as a mutable pointer is correct.

There is only one affected callsite, and the change amounts to replacing
`as _` with `.cast_mut().cast()`. This doesn't change the semantics, but
is more descriptive of what's going on.

Apply this change and enable the lint -- no functional change intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#as_ptr_cast_mut [1]
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 Makefile              | 1 +
 rust/kernel/devres.rs | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c62bae2b107b..bb15b86182a3 100644
--- a/Makefile
+++ b/Makefile
@@ -477,6 +477,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wrust_2018_idioms \
 			    -Wunreachable_pub \
 			    -Wclippy::all \
+			    -Wclippy::as_ptr_cast_mut \
 			    -Wclippy::ignored_unit_patterns \
 			    -Wclippy::mut_mut \
 			    -Wclippy::needless_bitwise_bool \
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 3a9d998ec371..598001157293 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -143,7 +143,7 @@ fn remove_action(this: &Arc<Self>) {
             bindings::devm_remove_action_nowarn(
                 this.dev.as_raw(),
                 Some(this.callback),
-                this.as_ptr() as _,
+                this.as_ptr().cast_mut().cast(),
             )
         };
 

-- 
2.48.1

