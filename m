Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD92AB3633
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 13:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED41510E16E;
	Mon, 12 May 2025 11:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ApWcJr72";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802B910E16E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:49:00 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-22fb6eda1cbso2678505ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 04:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747050540; x=1747655340; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/M623eh7KHrL4wzzyQ6i2eTLzXF/0x6NbLae/MPHBa0=;
 b=ApWcJr72LkvmIEzHsXLPfTp4nkD8t83ujhXk3ZxZGXKb4r2I9V5sz9a1jIuK6qI0Wa
 3EKgpK9rjBnftHNXXNptFEq//cBqOXSCTWKlVYgVbwuKpfFPG3TkMg+vYQAbMo/N842p
 0XQAqprSX3NqEsJZJqD05SS9DTD8Df6O3AL9ITmkBiuEyMbzErYxkcDsps4JfCt69Kr2
 H1KcmMDPG8Vm05NgXRc1rs7TYc28jNNu1l+dUvj4ofy6PjgXkCQbIyi/Vu9GZyGVOZon
 XKEbL9z+6qqO8OuMXkXLlyc5Zn4dFVRGciaJoBBkt/SJURrmYV8MhlMXL0AKGPyjeMaw
 VTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747050540; x=1747655340;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/M623eh7KHrL4wzzyQ6i2eTLzXF/0x6NbLae/MPHBa0=;
 b=kKvVu/Q9vM7ZUsrpPNKBTyHcWnOuGtlyqpwwsrTx3e+CF5akxanKKuUfb5gHL7uaBs
 bdHxYKfVDxnZ6p8kj2aFQ1lSH/5QB5u8rd6h1EekVGcidkQMeZ25u772UCKy+lmBMctk
 fni0L6ozcZ/nseOGakTolkZEVlUZAL/q+exilYELczI12SzAJv/Tg6hGFYrjNa0O7CMw
 dsabh/CEhSzwK6xkw9xCHn/nzvuSN/1dH2VGtLmc3BEbADe141m7YwD5wjt4tlPSFLfK
 /GFxzNQvO1sSGMc6f6+4Q9TiH7lyq9MpkBAUZ99cuyO55Q39s27mFaPExY4+HE6aj1G/
 wChA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp5PO9nJ6pry7FzlyKhkGRxplm9KHadghVff6hCejCfWhkCUfvGsdAFzCyop4ANjLKsWlVXlvmEPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2sB3t+KtJQWcTZCx22IeT7t6jGNcQ8yip+1fXWkdrL/j5GlGD
 dBLoJTkWppHc/fhZRw/4qvlprydvwtlQKZQPNYb9QX9ZV4oE2LK4EaryrLdCV1LmO3Q+DeXbQky
 amPM1fmMs4Dh8vqxmLi/W5nuo9vU=
X-Gm-Gg: ASbGncv9YE4rmiAOen8JvWhCjFaSuqAWmGAL2AmhGPFzF8R2Zuy1qDOF2jp18V3TNXe
 zE2p2pgcu4KQFu7u4zzk7GL5D+L5zdzK+gtSRT6j6wcbhlV/CU9B9nXExLDYFTwh8AWaL2fqqKR
 RxaG+g2aA9i9duji1e8GgQOlspilTh9+6t
X-Google-Smtp-Source: AGHT+IE3xgVjwdEAIWFwjMRammdXf+TLh9W1XCDBACWAC/vF9PIk9KjvDWPohy3UgDeU1ADlxcllhpba9doOob4xHMY=
X-Received: by 2002:a17:903:2f8f:b0:215:b75f:a1d8 with SMTP id
 d9443c01a7336-22fc8b0983amr72652195ad.2.1747050539941; Mon, 12 May 2025
 04:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-8-dakr@kernel.org>
 <CANiq72ks_1rEQYvYY464WOqAGKJTQpgvjM_RoBkHTJhMx1euyA@mail.gmail.com>
In-Reply-To: <CANiq72ks_1rEQYvYY464WOqAGKJTQpgvjM_RoBkHTJhMx1euyA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 May 2025 13:48:47 +0200
X-Gm-Features: AX0GCFvUV2CcdMAKQMOIHIM8lkXdP9qPB_xdNVjD0o2wN3nY5qX0MUHhB2Y9WpI
Message-ID: <CANiq72nPy=nAVgCZ2rgPTMEgELU1aJ17QHPWTu7M6i=YFrUpRQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] rust: drm: gem: Add GEM object abstraction
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com, lina@asahilina.net, 
 daniel.almeida@collabora.com, j@jannau.net, alyssa@rosenzweig.io, 
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, May 12, 2025 at 1:41=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Doing something unrelated, I got a Clippy warning about this public

By the way, this call (and another one here) to `container_of!` goes
through `Opaque`, so it will not pass the future `assert_same_type`
test we want to have:

error[E0308]: mismatched types
   --> rust/kernel/lib.rs:233:32
    |
233 |         assert_same_type($ptr,
::core::ptr::addr_of!((*container).$($f)*).cast_mut());
    |         ----------------
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*const
drm_device`, found `*mut Opaque<drm_device>`

Cheers,
Miguel
