Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476A1D3C168
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 09:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBE310E574;
	Tue, 20 Jan 2026 08:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="wTLWkvtQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A6210E574
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 08:07:51 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-64d264e09c7so5036833a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 00:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768896470; x=1769501270;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=WB25pun9VTYRY26rX72qaIvvvqgUzYKtx7vSm7qo1+U=;
 b=wTLWkvtQMeLxU6A84QStzUSWR316+7HI7wRMBWy/WeqrhTDEw2lpbm47n/6tYdnE9T
 I7xRJqPuwmTaqCtcJ+SflRlo2L1S9z0swuXpf/hvbHwkdh8Az4fPWkMIU3MckxlI8CIj
 kj0n7tdSjPjyCJ4EAPgoupU4krSWvIA4twDJ624zRbLK8FrUkbPUhP7wsv3Si8G9zwX7
 do2Z0ZTiaO3abPx5kh0cwI1th97lJRq91CCUkGqZ+wzSgJU4l3aGUJmO5VhXC99lufFZ
 YBSEwU8XFt11tkG5opBb6yGFU9lji2gyr2FnJRRj4clORkWk9qJtuvyOqgsZTodSrBog
 sulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768896470; x=1769501270;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WB25pun9VTYRY26rX72qaIvvvqgUzYKtx7vSm7qo1+U=;
 b=qxcKTllhXMZ6uCX1RhZcTeTnqEUz0PSfAwkLVRmCQmgbKvomtphUB8pLaqV4HzoF6f
 AyoxiEgWSA93o/2HorxnzrGPUh+2T5GTlzzPGuGxNyURsSO6/UyeJS3H3TckNsBs7aMY
 6d2Gf6BsX4bAkfXecSgI8n4F3HqmoL6EBQMpVOXX4J8nyR3XrpcjdlGYzcuQE6CjJyGk
 5b+sDgFDO2Oc0GlwHy80iT0qbRl6jZUZrHqMjG6nOIhoX0+FQ/AIzp9F6euDCHRhINbH
 m82R6wH3UeTxcjbkrLtZB3IfMhOwaG1SjCq2BO+HjEeF7Gd73ZgcKm3dzRquDuqrWJ0d
 h8aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwtlyb+i6C9J4p+wtJ+AiQyadAT9vICG6khyHD+k8VfYLXKXnHEGuaDv239P0Pyk0tg/HtK7PeHmo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzooeFHiZC9q96Abhn3Kg83IidkWLni6rGbjtG5pg9Bx3LyUWwx
 AYV0uT0LW6z31b5RUWk63aSJfdAQP3HyANJFcc5suiPcrXGxkLQ1X2VKeo8EwrPC54MLDtbtU5b
 8w5/JdCBG6PFiv0jEBA==
X-Received: from edi27-n1.prod.google.com
 ([2002:a05:6402:305b:10b0:655:b4e9:b671])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2711:b0:64c:90e9:aeac with SMTP id
 4fb4d7f45d1cf-657ff2a6643mr899124a12.13.1768896469942; 
 Tue, 20 Jan 2026 00:07:49 -0800 (PST)
Date: Tue, 20 Jan 2026 08:07:49 +0000
In-Reply-To: <aW6V0gn4mLiCUu1q@um790>
Mime-Version: 1.0
References: <20260119070838.3219739-1-dirk.behme@de.bosch.com>
 <aW6V0gn4mLiCUu1q@um790>
Message-ID: <aW831WHs-O-OCWAl@google.com>
Subject: Re: [PATCH] rust: drm: tyr: Fix register name in error print
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org, 
 daniel.almeida@collabora.com, dri-devel@lists.freedesktop.org, 
 ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
 a.hindborg@kernel.org, dakr@kernel.org
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

On Mon, Jan 19, 2026 at 12:36:34PM -0800, Deborah Brouwer wrote:
> On Mon, Jan 19, 2026 at 08:08:38AM +0100, Dirk Behme wrote:
> > The `..IRQ..` register is printed here. Not the `..INT..` one.
> > Correct this.
> 
> Hi Dirk, I was hoping to get rid of this register read since it's really
> just a bit of debugging, and it's the timeout error that is of more
> interest.
> 
> What do you think of handling this through my read_poll_timeout changes
> instead?
> 
> https://lore.kernel.org/rust-for-linux/20260119202645.362457-1-deborah.brouwer@collabora.com/

We can always merge Dirk's change and then yours on top (removing said
piece of code). That way, if the stable team feels like backporting the
typofix, they can, and otherwise there's no harm either.

Alice
