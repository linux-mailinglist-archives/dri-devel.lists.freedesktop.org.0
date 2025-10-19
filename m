Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A55BEED19
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 23:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3076810E013;
	Sun, 19 Oct 2025 21:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kCcXxQyB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E9710E013
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 21:25:30 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-26987b80720so7068925ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 14:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760909129; x=1761513929; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VMzOcGlzTmgP7Sx2K6Mr5nIuxpWb7Ycpm/3lBUKh9gU=;
 b=kCcXxQyB4f7/TBdAfPP5jTztz2JDazXQE5Dsv4HnjCvMB3fxmf7LDdNf+qh27hpmcd
 kH0r7YuSP3tssygGnQceQBp8GKCVuZCF1dBXs0b7KLjfRBCPnzxMea8tYJL/mJNsNGho
 IZmIB++ytq+xWqU7oKhPePad45jD7Ndx2tIvRvIC64y0XcY4IqSrd8PetmJIzROfYfuR
 vP7uaticx4jTI6VqvYxi6rMb8DlCcfonqsr57aWNJu0XXMtC9JQ+JACpaKgzyulfdg9L
 Gn/0uMQSm0lk7lCp9t67XvZwS6ZoNeLpPV+dFGpunapHTSdjz5RVmi6nAr3+rvjDdv4W
 3RLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760909129; x=1761513929;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VMzOcGlzTmgP7Sx2K6Mr5nIuxpWb7Ycpm/3lBUKh9gU=;
 b=Rri85yu4TVcrAiKhM8yStEa2idNG47IQW3Q3WVH5p/mnzMja7G15mBhOEuuypSmyTc
 DVPmE7ZtagrN0K5pQ+mcmwVELWEp+Nz0LzeUmsXqdQ7QI/TEMzhtVYMXGDtoOiNoFMN8
 DVHQJJqCCaLY6cSJlN6ska6RK2s2DUwm9aHd6Tjv9/Qphk+E6rENHxVkvZREMmKmb82G
 OTpCgV1ik9L4gXAgVbuJCdNUrPGOAlsPqPBF7fvuWUj+j3PJfh8pIRRmeXxO7A4Hy12N
 u9rvwBsajrzix3foOxoyz5V+CPRQRNfeYovu/UyXoO+tOeHagpenpLxHKoFIwgEUhfvy
 Lo+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW84HiQLRYObSd/xzS2rFW152FwhZi2CUAWnsCBrLWgv9sTT+Yna4ou2kDYPzm7ltp+JUtjX84TOWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJQLelkJ4nLtAg4p6xQJ/IBZvAgA5eO/cZY3adw2Y+LQsHy/8j
 MH36XQXdqf/Iw4ZtldunOfwsnBATud7qt2epauk/dsgU7eOUUMCEa0dv/vb8ix2yTIz94OCcr93
 Grd1qTweSXFOC1UTH3kiGQ3nIM+J393E=
X-Gm-Gg: ASbGncsosujEKq6aFNYvMT3XgbnUUpOE5N/UJthW+f1WuNNnDdfs3WCz+KemjYDjTMD
 jBatZshDGOA4eYjgNKaQtDiQkgOaR5vBpwfhZwXqM47JxmoWGqIgkdI5qQ5UNEDa4JrsgrodL6p
 XK9/dtT4QtNlr0OsS7WzlY6N+jPDRbPiZ0qKByguvTIkgEkkXCruDg0BSQFHB/i6dCbeg19lu4y
 6ig7fctxhR6Xt1Zn9Nyeroqnq12eq8Cfq251bmnduFK7Y1FkeJv2/ni/BZc+z5kJpi/lENeXlr5
 k04aKJv/FcXHIGnGQNxZt+Al7dYQ/SpcoVsnGQCYwAlEZqSFmk5zIoEFFI0a7HOb9V1Y1tKm9pj
 /V/bESfE90WYDdA==
X-Google-Smtp-Source: AGHT+IFkXmb/qgb/KgY8CoxXBFCqji+DioDep8k1ccK80l52uLY2VJCsOrEx4mXqL5zBbM0jkYzLAt9Oa8qgqgiQULk=
X-Received: by 2002:a17:903:1a0b:b0:27e:eb9b:b80f with SMTP id
 d9443c01a7336-290c9c9a8a7mr71999045ad.2.1760909129461; Sun, 19 Oct 2025
 14:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251018-cstr-core-v18-0-9378a54385f8@gmail.com>
 <20251018-cstr-core-v18-13-9378a54385f8@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-13-9378a54385f8@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 19 Oct 2025 23:25:16 +0200
X-Gm-Features: AS18NWDXrZ8O-3KwwwBOxfZWPwAGhp3HE5GT4mOk-9o3K1qGCus24KCpGnZzuZA
Message-ID: <CANiq72mpmO2fyfHmkipYZmirRg-x90Hi3Ly+2mriuGX96bOuew@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 13/16] rust: regulator: use `CStr::as_char_ptr`
To: Tamir Duberstein <tamird@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
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
 Stephen Boyd <sboyd@kernel.org>, 
 Breno Leitao <leitao@debian.org>, Michael Turquette <mturquette@baylibre.com>, 
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

Liam, Mark: I will apply this since it would be nice to try to get the
flag day patch in this series finally done -- please shout if you have
a problem with this.

An Acked-by would be very appreciated, thanks!

Cheers,
Miguel
