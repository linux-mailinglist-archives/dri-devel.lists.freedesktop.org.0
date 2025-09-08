Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF042B499E5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 21:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D436E10E223;
	Mon,  8 Sep 2025 19:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="vuOsthwZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7238710E223
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 19:28:05 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-45dd66e1971so32332775e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 12:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757359684; x=1757964484;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=4+3QNBaTQJgfz15TsSjoGU8ORJ1OjGmgVk1ehgr+kcg=;
 b=vuOsthwZxRfAlVPwW9ceewfsheXIl4Xsg3dF5MoCniY9qtZfxKx5wps40r+QwzmWhk
 f0PHlRznOGHE1galgBXp51bl3LN+G6PhINw8s2/S+869ba1nQdxT4kMI8L7UXPXc/owJ
 LWtDKAPpVzTHsvzHh1POWdfPJAYAxA1t5AZPLtHIb7ngWFMJ6Vo1MePNHaClhFtJUh3b
 KQ7a1amwxiiCiIrbPAT+er5GdLL/r+gLRHnNjTXKCzd4I/YymlEbBD+jPCCqN6f1Kgkt
 5NT8hI8I7ThnHebqhkfBo62DYbmP1J36SFHpMkxliOrczNGMYUjdh1ccWEoBGTxmjcs3
 ggNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757359684; x=1757964484;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4+3QNBaTQJgfz15TsSjoGU8ORJ1OjGmgVk1ehgr+kcg=;
 b=HHNJ/58tr0V+QnJ8eVT16A8TpPfpwhof7gv5t75+pBK5JBnXZD4x9KESpjkYank+gE
 isbMH9mh4t6AAUpzKsDrDm6DV54m2OkJYM6hBxk3KvMqAsz82Vv82aE5Tyb0BPE6s9sK
 Rgtn3F4SNZPja2dq3qMuTA8AUsEl3JcKNXWGo5axPrinfJFCXuC4I4BhZdV5BPqZvxJd
 fm8hQxdg/ilXjLH3LS6RXBH31hDR6oBI6EZc1U4+Mwcn+5sw21SnFrSXcqL0AnoxDX2x
 UCp/nynar52dfCCKy4SeEYaBS+eDKhtHO8BWH17xpsfEelD2XYt11mPDO+S51GekWMCP
 RlTg==
X-Gm-Message-State: AOJu0Yy9GnDCXnxvxzBDM/JW9bWNl7YTauesEZ5cEFnxjGElYtIjxLqB
 EYp8kgFjDC7HqqMKmH/6IvRkFcQuKC+Lkal452E7xp0kIqQmeCr1BWRnFkZzLnewQxqch8GYJBt
 GuEiz0qeaZSez0SDTVw==
X-Google-Smtp-Source: AGHT+IFsGy3BK+rpfmh2eok5bxbGiydxmKX6W9RiDLPamNcZgeW7/725lG44A9ID/LIfYITD8hQInUcAJj4weJs=
X-Received: from wmhx22.prod.google.com ([2002:a05:600c:4216:b0:45d:d39b:53ca])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b1a:b0:45b:627a:60cf with SMTP id
 5b1f17b1804b1-45dddecf404mr92465225e9.24.1757359683889; 
 Mon, 08 Sep 2025 12:28:03 -0700 (PDT)
Date: Mon, 8 Sep 2025 19:28:02 +0000
In-Reply-To: <20250908185239.135849-1-lyude@redhat.com>
Mime-Version: 1.0
References: <20250908185239.135849-1-lyude@redhat.com>
Message-ID: <aL8uQs07sFYv5bNm@google.com>
Subject: Re: [PATCH v4 0/3] rust/drm: Misc. gem bindings cleanup
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
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

On Mon, Sep 08, 2025 at 02:46:35PM -0400, Lyude Paul wrote:
> This is the first few patches that were originally part of the series to
> introduce gem shmem bindings for rust into the Linux kernel, which can
> be found here:
> 
> https://lkml.org/lkml/2025/8/29/1533
> 
> These patches don't have any dependencies besides needing to be applied
> on top of drm-rust-next.
> 
> Lyude Paul (3):
>   rust: drm: gem: Simplify use of generics
>   rust: drm: gem: Add DriverFile type alias
>   rust: drm: gem: Drop Object::SIZE

Applied to drm-rust-next. Thanks!

