Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D563DA88666
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 17:08:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC91789E1D;
	Mon, 14 Apr 2025 15:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="ByUP6Lmf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E43989E1D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 15:08:00 +0000 (UTC)
Date: Mon, 14 Apr 2025 11:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744643279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9PCTNCX7kjBe6rZrQDmsxEBCtnOteVqstFPzzwQK37U=;
 b=ByUP6LmfmJti4jEkRke/5Hd639c/CKX0/Gixkt4QEvJlUbsDWZOuih+snIRSCpJjkFTIXo
 KE475+ZVVDTzzFqR+McQ3H9OQYuFfDRxKry2qFfaDYjDzS/0KirmpFNkrKplNnxLNpS8+z
 jsDoa9WMwaaCl4OpXyDcvLu3rPkBbydkbij2BtsPfSckw+daISjQqa6zHY7XwwKi1xwrrp
 e2Cmxp86C1gG+bFdkN1tFo9fjUDWQHs/7ECE13K4oy6HzRAe1yhqYWkM7t6aEgPzwH+8a7
 3ushzJO98SD3rfq9Dk+D7aHpGXIr0xvLY+taivF3JfRSTeKP8aV5jEaDUw7rAQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 7/8] rust: drm: gem: Add GEM object abstraction
Message-ID: <Z_0kyE-wABj1tmrK@blossom>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-8-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410235546.43736-8-dakr@kernel.org>
X-Migadu-Flow: FLOW_OUT
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

To the best of my ability, this is

    Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

although this is rather above my current Rust abilities.

> +    match T::open(unsafe { &*obj }, file) {
> +        Err(e) => e.to_errno(),
> +        Ok(()) => 0,
> +    }

incidentally this would be another candidate for the helper I alluded to
earlier...
