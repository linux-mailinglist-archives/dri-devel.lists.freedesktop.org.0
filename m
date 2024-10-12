Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D17899B33C
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 13:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CDF10E1F6;
	Sat, 12 Oct 2024 11:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TzODIq22";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D3710E1F6
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 11:04:35 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-71def8af0d9so341440b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 04:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728731074; x=1729335874; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XroMpCi45CXQlHa3n5Z/flEDjCsFF8PBVEONJxRQYXA=;
 b=TzODIq22OT89ZNkdqTWI0FXieWwIB2ppr7fKix/o/HfgZihvHCnu0frmb4WN7YKTVa
 SY1tGxGstorNHI5SmS3lsG+VvenerlIuI2Ilig2OqHrIkT0x+akQhevZ0ON56y+N3Nzj
 Ik54v4wE7WVJnSWRFGekdFYEhyS6nN3Y67/R9yVPkNP34m3bq2u2zNMJjx3usoAknI4+
 cq6n1mBY9w5CFgxE4yruFkSye0X/nSSufnbei30SpgDpdb/RvSkTF22K51uAFNZBrpKy
 NJAQNGvc0RV96J0FRI+qrdQBboToyCvQIVt4rBPWDbfR33vLxq614uWc2Oi/Izce2ai7
 UKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728731074; x=1729335874;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XroMpCi45CXQlHa3n5Z/flEDjCsFF8PBVEONJxRQYXA=;
 b=sEigaeY3vYc43AHkixPOrx20H3SxlvB1iTV3t6hSNtP6wkr0eiTf5LFGV9NA4qZ4NN
 mMPGr5qUe+4J0LvJ+ImLlMb1r3xQW/hJeE6Nv7qbqAhefUjCUktVrk7kSjNOWs7lfEjT
 Q4X5Avz6qYfOKiXNjZZRKqBEGZSBMbK4+lnkKUBNH2Kjh63VlrmYSnN8/ZbCnorE7prC
 MtsadWRMVtiqu0R0Ptk1uJ1TvKByMfFVsLN6AMyWCAqjKZbcFvlc42OECFX0B2pdYZ6Y
 cBi8jJUF+DWGr7Qq/IJEzYyNfPe76BUXxajf1Y52oo6hbI0c7Jyq2J0x7pgSh5z1q7UD
 mATA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk0N9LOBhvi/Ki3HxHxlgSQ4P9nypS8NYDHZaZWj8BOmAknp7468QdLkBqOHyLZLx7M3apl286Y0U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu2iReTlkWicq8xHbg3NfYGYB63qsz2rfarPw7kvn0dKkNDCmq
 dJCGgdIGwzRlOFmzUZgoLVAauMoJZ7+dLACe1VDac5yq6SJSkz57uQBU9MXhBIlqe9Ldo8ZquzX
 o6oezQGUbBoL7NprNbQjzjuL1/A8=
X-Google-Smtp-Source: AGHT+IEAt5tdtaeiDpoTuQ8z3jgt02TnSfq3bj5lSqXLETJJCu+grTgzCOvYTrYnuCyx/PBrK2fp1H4xRv/nRaoxmlM=
X-Received: by 2002:a05:6a20:a106:b0:1cf:52f5:f5 with SMTP id
 adf61e73a8af0-1d8bcef497bmr4471554637.2.1728731074631; Sat, 12 Oct 2024
 04:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20241012075312.16342-1-witcher@wiredspace.de>
In-Reply-To: <20241012075312.16342-1-witcher@wiredspace.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 12 Oct 2024 13:04:21 +0200
Message-ID: <CANiq72kG0Ai2DHfERD0aPDVuEpLYrZ_2uYdw17=eeHRp+2Q1Rg@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/panic: avoid reimplementing Iterator::find
To: =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi Thomas,

These commit logs are nicely explained -- thanks a lot for taking the
time to write each!

A couple nits below.

On Sat, Oct 12, 2024 at 9:53=E2=80=AFAM Thomas B=C3=B6hler <witcher@wiredsp=
ace.de> wrote:
>
> implementing the same logic itself.
> Clippy complains about this in the `manual_find` lint:

Typically commit messages use newlines between paragraphs.

> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1123

Since each of these commits fixes part of the issue, I think these are
meant to be `Link:`s instead of `Closes:`s according to the docs:

    https://docs.kernel.org/process/submitting-patches.html#using-reported-=
by-tested-by-reviewed-by-suggested-by-and-fixes

In addition, these should probably have a `Fixes:` tag too -- I should
have mentioned that in the issue, sorry.

Finally, as a suggestion for the future: for a series like this, it
may make sense to have a small/quick cover letter saying something as
simple as: "Clippy reports some issues in ... -- this series cleans
them up.". Having a cover letter also allows you to give a title to
the series.

Thanks again!

Cheers,
Miguel
