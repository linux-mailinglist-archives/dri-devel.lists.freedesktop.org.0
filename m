Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03094C64B7D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 15:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F73910E0AB;
	Mon, 17 Nov 2025 14:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="iiaz8jLL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2F210E0AB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 14:52:43 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-429cd1d0d98so3135193f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 06:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1763391162; x=1763995962;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=DEmDel8YP6SryUyQdLqbBEwquCJ086XrGsRpVZIAPJE=;
 b=iiaz8jLLKvKhBGwAoOeGcn9yK+4vEP7Rtqap2F8PagTNYYB/NRZBjWTO0nY9S4zXem
 btFeaaacvFHiqx86Q33DQs9GrvWp+gvz4s7boo0V1Bylv/gs+CozQAYgms4nN45xohvp
 9QtOgSV5r665Gx/iaF0GtryaVjWJEstjqaHuFOIO5Mlk8zSrKxUJMZBtCPHgnUn/YcIW
 BNMEzLzSMarEcB7FzkmETgTWo3Bhp2e3tbphI94XBHP+njEygyEZUYtPnbI94lFXaL31
 xij1nm+l8WwJ5VP/oR+9n6Emyf5Bzaz8tiYcTEOTnjO4ZvSikhFSb+3zfvfUDPR/iSTv
 qYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763391162; x=1763995962;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DEmDel8YP6SryUyQdLqbBEwquCJ086XrGsRpVZIAPJE=;
 b=pzYeGD/wouSxZX6WVXogHte7LFdy1CYQDMCMfoGBdOcnXKd3j/HJ7VjgXiJU5pkcYV
 4xZ4qlvkHMeQNAxgNXvhcowZLDz6zt5idVvqzs3OIolt+LusXcEPMye68zYBqWx3acA1
 lTH5Aq4lPidJ3bYlEHPf7bUHyQMIg+gAveioVqZ0ovWWuDMNR5isDs0Gy6KtdOujWt4+
 wnT9AuZq0NbbNvM5gsdp6kVbMWmp+UF31RX7Nt/BBIW11T00D7l3+614PUd+jOaLSvVQ
 9kzRLxnGc4jg0rTeGoIpwgl9DjtdQ+V9JTaYh/L4bT0Jffy/NEnk8ZHtIVqK4Mi6M8Jf
 ApQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4/XUGsreWEMKCYWn08u7pInhXyt22eJTPFb2N+jpNtQHD/UrJLSVpFvTmgZREvTpZ81CBZ49Du/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEWAvWLVlrnLVsLRxsteAQkBucRaYScagv201EPTfwjxmHoafh
 0yiUvJ9Yc2l6QAgyMrjvhjfrZ1WmPjqfen4a9FYNj5GHHLv2isrQFw0RAN3mLsEEGHaagdgx3Vf
 IwR2g7jg4HIrAydtSGQ==
X-Google-Smtp-Source: AGHT+IEbGuGz0lgPXN/Q0+yKdln87Gc43i0ZEfM77W4barCcu736JcYss1j5wxMyvW59kDu9IU8AnICCu1X5VAI=
X-Received: from wrrm11.prod.google.com ([2002:adf:fa0b:0:b0:429:c2f9:8017])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2585:b0:426:ee08:8ea9 with SMTP id
 ffacd0b85a97d-42b593901d2mr12477971f8f.44.1763391162404; 
 Mon, 17 Nov 2025 06:52:42 -0800 (PST)
Date: Mon, 17 Nov 2025 14:52:41 +0000
In-Reply-To: <20251117-nova-fmt-rust-v1-1-651ca28cd98f@google.com>
Mime-Version: 1.0
References: <20251117-nova-fmt-rust-v1-1-651ca28cd98f@google.com>
Message-ID: <aRs2uTHwnTm9fdKs@google.com>
Subject: Re: [PATCH] gpu: nova-core: make formatting compatible with rust tree
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
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

On Mon, Nov 17, 2025 at 11:30:07AM +0000, Alice Ryhl wrote:
> Commit 38b7cc448a5b ("gpu: nova-core: implement Display for Spec") in
> drm-rust-next introduced some usage of the Display trait, but the
> Display trait is being modified in the rust tree this cycle. Thus, to
> avoid conflicts with the Rust tree, tweak how the formatting machinery
> is used in a way where it works both with and without the changes in the
> Rust tree.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to drm-rust-next.
