Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B4AB0C700
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 16:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1328E10E564;
	Mon, 21 Jul 2025 14:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="B1y6ZZpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91F810E3A2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 14:55:22 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4561c67daebso16383205e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753109721; x=1753714521;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=nIkm8zbvd3d5B5IB10UU8koluangNArwbTcD9iZkkEg=;
 b=B1y6ZZpbvmCA69lZNwjYzpvpyqFrHZ+tvEIXTnvKTrpydAFNaM94fiNv3bIXYo6Myb
 9TutuJ8CmrGeYUDDUTxnsNI0tNYDWoJNFtPUGDUAwyjtcD27Wbm8ygl1zm/tW/B7wdR5
 rwp9Ijkq72w4ifNfuTm/RwP8/8rpAFrSRW+rCKDUdvGqUhKqC9FAj+QH7U0uiPLuOXqE
 WFZYoYBrRFiA+kLr6WA24iqJ5K/O5b+TFCfj+BLC2d3XnRwUETan+zfbTtB0DOpyip8E
 ne4l8NuZuxjMOK6yOflPJzWr4gVUaMpMXlvTryqtUXWb4bcDjeMyhhm0kRWsEgVUJaS/
 lWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753109721; x=1753714521;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nIkm8zbvd3d5B5IB10UU8koluangNArwbTcD9iZkkEg=;
 b=USN/aMkufc1Yct7Pl9phK4gor96g1rccIFpEHLEC9yUO4XVvQESP4Qdkcnru19fR6S
 0un3gqJgtbGYQPj1wef/WO2Y4uejGb54WQwugi54AMdt5lp55aVNIdqjiE4yhDCytwqO
 Io6ZzON5a5SiZApG8lZw0tQvnBk0t1yFajL4n5Bv1QkMAzlwh4pFeg8obiv+8sN1Tx1u
 2FQ4qFwc/NyJ+cB/1a2jt/oyqQlH6RWfuZEwYX09gWZzSonrU5KkotOg9+NLpkobUg2t
 fQs4dt9cL0Xv2m082BPmFRUq5iPIo2n2pAJ4a6rCJEkTbJXTw+fYlC8a95Y/uQzH9pXB
 0B3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4UD7Qvp2SCMPpMonr0pCjA2qyhaNabAb4FYDSA/fLAy6ke51JSbmNClly7FT6OeVGx8SzfscuIqo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydJWepkIzVwf+I0/Z1qVXr0X8GlsZJ2Mrb155VOuNxDevos0nQ
 9e9XRNHE3fz2pDVh0D1t5nHGmeEV/AS3rr8JCeWCep3RzlOm2j97VLhh0LSW4/U8C0RMYRz80Z6
 Zbkx0HPNrTTQ3SFMQkA==
X-Google-Smtp-Source: AGHT+IEfUvqsUXX7mjN3ADzeqqjN+nnoq4umTFLEEX0oJHAoh0DUDSSefRyYrhyKMQYxAIrsPeFXqc82yi2VXIs=
X-Received: from wmcq26.prod.google.com ([2002:a05:600c:c11a:b0:456:293d:55c5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c285:b0:456:1122:8342 with SMTP id
 5b1f17b1804b1-4563a51150emr80477435e9.5.1753109721212; 
 Mon, 21 Jul 2025 07:55:21 -0700 (PDT)
Date: Mon, 21 Jul 2025 14:55:20 +0000
In-Reply-To: <20250626162313.2755584-1-beata.michalska@arm.com>
Mime-Version: 1.0
References: <20250626162313.2755584-1-beata.michalska@arm.com>
Message-ID: <aH5U2Jm6Jpf5LyB9@google.com>
Subject: Re: [PATCH v5] rust: drm: Drop the use of Opaque for ioctl arguments
From: Alice Ryhl <aliceryhl@google.com>
To: Beata Michalska <beata.michalska@arm.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, daniel.almeida@collabora.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
 alyssa@rosenzweig.io, lyude@redhat.com, rust-for-linux@vger.kernel.org, 
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

On Thu, Jun 26, 2025 at 06:23:13PM +0200, Beata Michalska wrote:
> With the Opaque<T>, the expectations are that Rust should not
> make any assumptions on the layout or invariants of the wrapped
> C types. That runs rather counter to ioctl arguments, which must
> adhere to certain data-layout constraints. By using Opaque<T>,
> ioctl handlers are forced to use unsafe code where none is actually
> needed. This adds needless complexity and maintenance overhead,
> brining no safety benefits.
> Drop the use of Opaque for ioctl arguments as that is not the best
> fit here.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

I'm guessing this should go through the DRM tree?

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
