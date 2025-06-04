Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323F7ACDB99
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 12:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D0C10E6F7;
	Wed,  4 Jun 2025 10:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dKkQDez1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A3F10E6F7;
 Wed,  4 Jun 2025 10:03:45 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b2ef619e80eso327027a12.2; 
 Wed, 04 Jun 2025 03:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749031425; x=1749636225; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iYIRVfkXKufURUDOPAucqCIYt8hFzqU7YK1s1FIrhP8=;
 b=dKkQDez1dEHZ3MD1Ju+8AJjGr83Wig6msFXn+0yQ0efqf7kl9VAbDiZyhUIbI5HQTA
 EWQwDmqVsgcAJcFUtFny/S/HFs8sylmcn1NkoRHD1SX0NcSKLkSXGprnx4B1sDshRU2t
 kZAVQIbrGkDCXCXY4guEPpigHrlOdo787Y2UeGv++jLTrxe1K05nf+y8OLdrFBE1eyAq
 7+W1cr0uuTf2jRj0sNFkd5/oVfGBQ+wprsjMwkF0JABMUjB/uhs9Cyu15mTYSy6ONWEY
 Eny7XZP2Fe9KHMsaNBqvpJ0q3mjavgIeGs5XCyhAxzKl1l0r/EKgAO9tJ+pDWENW1CMU
 yBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749031425; x=1749636225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iYIRVfkXKufURUDOPAucqCIYt8hFzqU7YK1s1FIrhP8=;
 b=XrNbF5PG97OHncMmNAinQYkn62E9ylEj3/IkhCNqs8nS/lKclEUlX8NiLteKyGf5ly
 rbMah1VxkLMtcNMUJL6wsEeiwga3kICsXe/88eBAMZb7+1Q9SHwUiUB/k3py8G1s5WNp
 CjC7r8dqihdwBktB9VpkuEi9aANPSbUPA3yHgb8RCMu4bAy9KJzH9CBAozuqeP5oO5XE
 +O7xYYs5U0ZfiVoXfaPsX15Fq6Coxb85B7SUiZPuTYnUAhzyyDIV7X8tr7zpG+ZlezSm
 RYE9aeMJXmlyRowXfclS80GvhGZqxf7JXZZE85rNEuWjNWm+r+e0GMhg1FuGYWavNdKO
 CodQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/ROrgS8YC6bKEJ3UKS2BxTtPeLJj1I3yuvG/BUvfPHdVlzBenrQjx2CI+DwNBvQA5CfM5YxtCvQ==@lists.freedesktop.org,
 AJvYcCX9fEtQOU862BeRfpw+bxzEq3wzmFLpXV9/vOBg1HEyBa6meDN9GnuH8wXY4U9x1KKrDlWgT4BfTNE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxc2EJmk+v5ZT5BOydbnT3h3eGCma8JV2em9qv/WoRgDuMIAY0b
 Y+ac2RYN2keN63RzQ5aPyqOpqErJ2O0PE07hWyOqOXTMkMdz0wBXHMdx7GaQwss3EON8E9ojyKB
 WJhJkhaLutZPn5pqmPbHw3dvAdX7Zleo=
X-Gm-Gg: ASbGncuEOVAw3gQMKvKlbYryo1J1GL0M8L0PU1Id0tNwCbmZdB66URXkF+GvOnJ2hoh
 FedGcp0NTxCIsM6lBf8EPLE2g/CPqg8KyVj3Beir1PTeuKx4nNU8vQlqYy91wJut0olH9JgplS+
 l6fj2mLZ9b0cZQaG8WpMD5uHHpZ1KzLNhx
X-Google-Smtp-Source: AGHT+IFY54/4SXuHhNfhR34u/tz7WHBUhSm2/IfQ3AqffQFchQvW18uxeL7Cd6oGwhaiU9pD6yfyiIBQ6dRYcZzfLS8=
X-Received: by 2002:a17:903:181:b0:234:11cb:6f95 with SMTP id
 d9443c01a7336-235e116766cmr12020315ad.6.1749031425395; Wed, 04 Jun 2025
 03:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com>
 <f528cd2d491f15404f30317dd093cc7af5a00fa7.camel@redhat.com>
In-Reply-To: <f528cd2d491f15404f30317dd093cc7af5a00fa7.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Jun 2025 12:03:32 +0200
X-Gm-Features: AX0GCFvjWD_zgPyKD-OQaU5vX3FRf-KmGpph09TCktkVk0tXDV8Lo-vignDRYHw
Message-ID: <CANiq72=daoTUH0qdEuTLtgaDsdNj=RVvX4fn2xjDtQZn7-xYcw@mail.gmail.com>
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Lyude Paul <lyude@redhat.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
 Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Shirish Baskaran <sbaskaran@nvidia.com>
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

On Tue, Jun 3, 2025 at 11:05=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> Not sure this makes sense - debug_assertions is supposed to be about
> assertions, we probably shouldn't try to use it for other things (especia=
lly
> since we've already got dev_dbg! here)

Yeah, we added it in `pr_debug!`, but I think we should match the C
side for that one instead.

In general, we probably want to say that enabling `debug_assertions`
should ideally have no "visible" effect on the program if there are no
bugs (modulo performance etc.; and it should have a loud effect if
there is indeed a bug :)

Cheers,
Miguel
