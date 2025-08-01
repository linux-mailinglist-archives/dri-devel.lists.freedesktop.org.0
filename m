Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672B6B17EC5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 11:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAF410E80A;
	Fri,  1 Aug 2025 09:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="re1jUdaq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202C310E80A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 09:03:18 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-3b7865dc367so916027f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 02:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754038996; x=1754643796;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=PBmsuUJbeLL0NXrNXi6pfMqYL0XBVnx5Sg0vt6dYzDQ=;
 b=re1jUdaq689XDXfsG41+EJd/zlRL9U2sFqidijJD3wY6nUMUxth2lCwcejbJLCikjx
 N+XLx0Xow0q+kd++JaXU7ilMTDbv90t7ibZZ7iXsUR8XLIA8aH+JseVOmOO5RkcuMpgZ
 5t6GqqYH57ibZIrLkxGX0v1WSAvRNBjahggq62atLULZyf987BR0Eb79v14v8O55Cv/4
 iiBom5uDrESqH0jLR3GU95d2GBr9HU628b95U1H/tZS3bWADj9R+OKw89AtrCAbMnIME
 SE7LCKe2DSX02n18sS2eKj11hHsyVIBcGEvED/tvFIoOHRQqPBpwVft90lIMJdYofVuY
 svGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754038996; x=1754643796;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PBmsuUJbeLL0NXrNXi6pfMqYL0XBVnx5Sg0vt6dYzDQ=;
 b=NVdH+1PUgdKLqwJTA/UiQyRfjwyD5oi7sGzX4luI1qO0mMXrYAd74f4AsOpaYAb495
 bIVIm+o8x9yiicdwQ+ZCUgFgCb+zbnmrsm99xhrjYbRggOFXqE+WCRTpcwuO6IxII6zb
 bNN4ycF96oAYen2WHMAqxk6XB1TKU6aPptO553dPLVN+ZM2UVQoLrguG0qQGAo/akCub
 IxN0iG7Ib06gMG9gyn0hS3rxRr/mBSgrBRpUOc0St4rnlIiMHOmBGjqzLkVCJokI6RoA
 yAf6JG5EbZG/fAavog8dPvEkFtROfcRw4zJieAQx7PRojZ4gL9lp2p/d99XXzZ6HhDno
 sBaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxToTQnCbfTuvO3LgGkB+B6JH9VoQ/weEfziR0/xgNnbLHnqtDfU46WCh+8RE0t1/e3VFot3AeOoU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoLPQgmfFZj4RUAVWIteyHNyWT/SI95Qu4tT+wBLTUzzOY+qXB
 CncSq5yUBQ16LAdeRMFgIJtZ4muIZEeXxhXRH9IxGv/6fk9ZIoVDE1qu0CELwNixPyttn9UMk41
 KIx1FSyZInvvBJ45wew==
X-Google-Smtp-Source: AGHT+IHE6ul98uLxU8+rgJ4DluypxUwUeH4rzGBJSdDhyXEUwohSo0THQ+GTzCr9BnM77dXh9jBEpBbHuNaVFFU=
X-Received: from wrbeh10.prod.google.com
 ([2002:a05:6000:410a:b0:3b7:96ff:de4a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:24c6:b0:3b7:6828:5f78 with SMTP id
 ffacd0b85a97d-3b8d343afadmr1672233f8f.4.1754038996632; 
 Fri, 01 Aug 2025 02:03:16 -0700 (PDT)
Date: Fri, 1 Aug 2025 09:03:15 +0000
In-Reply-To: <20250627123854.921704-1-jfalempe@redhat.com>
Mime-Version: 1.0
References: <20250627123854.921704-1-jfalempe@redhat.com>
Message-ID: <aIyC0_Wxm-s6Yo1E@google.com>
Subject: Re: [PATCH v2] drm/panic: Add a u64 divide by 10 for arm32
From: Alice Ryhl <aliceryhl@google.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>, 
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
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

On Fri, Jun 27, 2025 at 02:38:19PM +0200, Jocelyn Falempe wrote:
> On 32bits ARM, u64 divided by a constant is not optimized to a
> multiply by inverse by the compiler [1].
> So do the multiply by inverse explicitly for this architecture.
> 
> Link: https://github.com/llvm/llvm-project/issues/37280 [1]
> Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com/
> Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 divide")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
