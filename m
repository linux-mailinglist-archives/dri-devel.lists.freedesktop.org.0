Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770DEBEED22
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 23:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351B610E05F;
	Sun, 19 Oct 2025 21:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M89v5TgB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B8010E05F
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 21:25:32 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-26816246a0aso6697725ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 14:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760909132; x=1761513932; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ycAfcyNNCDvL8r+cj6EK2T80BYm3/AHXV1y+txWFqzI=;
 b=M89v5TgBs/M3vpefVpgCCwK1nM+bCXnXvkT93AObSpfNriBanTyzUyBjZcQNGgkfbd
 aRvyZ2KJvlgafH20mnNQUJKMiOu3YwFCB2o+7FpR6ZCL06E4Ubd0WqAw65Qrdm+Kqdjz
 IAPcQxDXXfJaxd+FC6NSRnX4l1pGmXyzOC5NSzBHAV3MPSEPUozFmfMgBYO09jOVAMWE
 Y3thZ0R05a69K1r0NgAWyHhFXJyWxyunEW7HjE7lGnvaqM5zjgVtyATr+752mNWvpN2u
 Fe2CvCH2eGi405LAXGD/W9yJQPZwJqBRDZvUELERl9+CiTyEqX6zNhrDbYsqE/BVieCS
 LsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760909132; x=1761513932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ycAfcyNNCDvL8r+cj6EK2T80BYm3/AHXV1y+txWFqzI=;
 b=XlGM2M9W+dwNriKB0ccolRBygVwCikupm+ZiQ1qMKs9GqhffQ3HpOA8F6oKLst6PDI
 PFV7vblNM+PRwiJHynBzPE+MAxhFmkMRFCVgPx9E+G4xuIzTdSjCVQXnTieO4hDa7y5u
 +/ufBkfhyMywv1R18kf3HaoUGMY2pLf0WwXJJ6Tc1SEzSReATzXGr9SQof7VW1JcFDoq
 E8meoIh+S0fN8ZnY0EGGz92DTjBbJD8QRLIFIpTOBRzjAtyBMYoTH4Xcu1Igs4anIMNo
 3ocuzmAfnmPCIs+FMwiYq1l1/XipX0dsY+phwV5wRBksUApdTPmNKq8872dtxc/4F4ML
 2wkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp9wqUUnIGE2K+hn28ZL27F6PH9gKrWdKERBB2gzxibGrjGxfJ7Jy6L6VMXuhj/Bo/sMMWB4FW3vw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIHsj1vm8NKH1PFBQnKw3xJfHtRkXWasfDrHyffBi4KX6PK1Wy
 AAHU/V2JxZo2u8MZLt+yO+RIh/9KTzhYTBQd6jVV2sEOej/vBSi8nse830AOEBhqdkW2ux70dMW
 BbUtbXouP72xnDX7e9RtLnyJO2iLORh0=
X-Gm-Gg: ASbGncv4/GHYlKAEnpeN1jD5YByp9morZGzgNarERufPnaHSYQyvybSIgXTM3v/X/dW
 fdWUftnem8o/EeAiag2Acy5Z3631s0iqTobbhVEFyZdRnsAdggskOY31MwP541OSOVayH3Z4UBa
 h2yd+UKav50FaV4/S53EbiU/oMqFU3DsyDi/O7t0hWf4XRmiaIKUEsW2cDuAHWWufwXAk7hHxFt
 FW0Jrv6KSe1xdWEm9V7sldeSjFuSDQDxgq5gwLKVG94n+Y3J1Z8arkAGc0jOtEsZ7xXHlnoldsG
 RK54zL5i+Iz7E2+S9Z35bS5qkagpSbAhH60iJ41qVbjRi5g9s8519ZmlfUKCfObKsSWTVxH/fMI
 bHoby0v8ImIhA5Q==
X-Google-Smtp-Source: AGHT+IEqij5v9mJs5/CWA1m9c2NrE8PMDKfGOLkkgvIBrH2S+dVqx6DMlKfweKNo3iNjtFuT7Y5fW/l69CjJHY+CKa4=
X-Received: by 2002:a17:903:b8f:b0:290:c5c5:57e6 with SMTP id
 d9443c01a7336-290c9cff139mr74090165ad.3.1760909132458; Sun, 19 Oct 2025
 14:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
 <20251018-cstr-core-v18-14-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-14-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:25:18 +0200
X-Gm-Features: AS18NWAMycluR5p3NBfaTwCbAsRiC2-Lwc15QqFISNzvPKOcYBFx7NoYnd__ov0
Message-ID: <CANiq72md2Gt-UUpPdnoOimUW8d+M8Wp=9jDTZ47NzvruhfP6+A@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 14/16] rust: clk: use `CStr::as_char_ptr`
To: Tamir Duberstein <tamird@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>,
 Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, 
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fsdevel@vger.kernel.org, llvm@lists.linux.dev, 
 Tamir Duberstein <tamird@gmail.com>
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

On Sat, Oct 18, 2025 at 9:17=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=3D&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=3D&[u8]>`.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Michael, Stephen: I will apply this since it would be nice to try to
get the flag day patch in this series finally done -- please shout if
you have a problem with this.

An Acked-by would be very appreciated, thanks!

Cheers,
Miguel
