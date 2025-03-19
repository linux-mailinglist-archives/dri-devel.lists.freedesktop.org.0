Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 106CDA69451
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 17:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F6F10E542;
	Wed, 19 Mar 2025 16:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LoxyKmi0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBCB10E542;
 Wed, 19 Mar 2025 16:06:52 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2ff5544af03so1255786a91.1; 
 Wed, 19 Mar 2025 09:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742400412; x=1743005212; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOvNy6cuX1wOoW8pRGs7qcnquFhdC/sbHrVaQCrxSA8=;
 b=LoxyKmi0J6vqGP/ziyZ4APtWP5uMzEeIs4CfUJm/khqUH1ToKQUKLxrCArHMh+FSV4
 5/1+wge3fxip3LCT+MRcrxxAWxwlv8kny7H4Rc1rUDfQ2+QBG4i06mIj82AflcqP6cWc
 w8wcXF7tsSexHM/W9zYPKJazF/NJvkLgcAr2ujQMx2f/xQvdj82qA3xTglNAAnQws+0R
 jWmUpC+SGijI4881AN7BaRMPddppIyCKxKaXST5jyaTPZpUfGC5ced0YiUh+TLsZ/s6l
 oOvlVm11JEedDqTXxVtO+RER2k34g/AIGf5Y3jrd2dSiahlAu7ZyRfM/7dO82LIIUSxK
 Lqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742400412; x=1743005212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zOvNy6cuX1wOoW8pRGs7qcnquFhdC/sbHrVaQCrxSA8=;
 b=PfymsTfAqj2lfPWIi/+PpD7A0qb9ySjie+8Gfij/HooZ0pU3gR+Gu2K1KQGQLdtZu1
 lR0eeP+UxcZrLRNQDBNC0LTish3Vs+C+BS6/kCkKRGgOOourXTROFou7zxVWWsuh65vO
 2psc1TzFgpQmNLv5JM/c4tln14XzCtDbaQUEoDK/EBMEIs5otDDrF7lxFDhHNG8pHppw
 3VPqaBiDQ4exgSMN463B0BoYhXyAQ6FbjvjUk0E+lARGvxsHjPoM+lgVdqRJglkTvnNE
 MTcosKY1GXQofb0ywCDjNTBfWe49fnjz3EXtmzQ36HV6uZsSjb8d6gQqjTXxhSv7DjRB
 Ezkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHVbisIzwv84kQ168+Sq1inIWR19BNEsEgQ3YKMvHDv24yRYIYhS2NfZBq8tBEHHKRFvPjH8qn0w==@lists.freedesktop.org,
 AJvYcCUQd9axxkiwdpv94mr/wUak8ks0ozkuizaVsX4hlGRDR7PovBrjZVh6mTBxpUckEnkXMO5JDq/3Ofg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrDiaSQjtjZZXUYD11FrDTxjpxzKHhrkl3uOBaP9v4TKQmsUyx
 5I3jrXS45PwK4+OcZ4AUdqKrAuGcHP0EZkOyLnGRTIv9BD0wQLXWDWDVfqMU8Cp9KWz0O0tTJUK
 dt5X1UhWCd+g6QjYnTtDpdeAVSlM=
X-Gm-Gg: ASbGncvhNkJJQMNVssTnRYjkowZvVfpsHeGg3HTleeaw8jqcW/7C5v+iPDDc4fofLkI
 Lhzrb5BlA05DVtR5Q9LNYHylVk1pGez3kEwo1UWH1iOkLVfNv3I9sCZZ+pohc+l2Ag9M1BQ3BGA
 6lrgyZZKOa3qOcrDVkBGjSBjXYjA==
X-Google-Smtp-Source: AGHT+IGKH7dGzo9CR9DyO61FwA7cxqxKg1zlVUXDQ/9/34mE4QzwcvBU2hSm+dhh6M/XvRm1n6FGq53W1euSYJyTZJY=
X-Received: by 2002:a17:90b:2246:b0:301:1c11:aa7a with SMTP id
 98e67ed59e1d1-301bfc749d3mr1656740a91.3.1742400412036; Wed, 19 Mar 2025
 09:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250316111644.154602-1-andrewjballance@gmail.com>
 <20250316111644.154602-3-andrewjballance@gmail.com>
 <CAJ-ks9kAROOfyPtxMe6LE4-UPsvXca2sQ2VDjhRchZp3HLddGg@mail.gmail.com>
 <D8JTWL8JY7DM.3IVH6FZ4M49CB@proton.me>
 <CAJ-ks9k+A1+0CWXZmD2m0+jRqTRTNFn-=d9VXqytiOqvn4BR0w@mail.gmail.com>
 <D8KBFC9M74H5.4ZJ2SJK06SGR@proton.me>
 <CAJ-ks9=NQrz3ySacKt+XXm2vS+Fn9gjmtqAaaoz1k=iTG_1HXw@mail.gmail.com>
In-Reply-To: <CAJ-ks9=NQrz3ySacKt+XXm2vS+Fn9gjmtqAaaoz1k=iTG_1HXw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Mar 2025 17:06:39 +0100
X-Gm-Features: AQ5f1JrZzeF8YqgUhS2ui73zsg8Ty3fstbUTrdh2di_k7zMf5vS2OO4mnq0-LQ8
Message-ID: <CANiq72mnT73Mb7RJhZjf4de=_Orv4pipunMhOersOj_aqrFA-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: alloc: add Vec::resize method
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>,
 Andrew Ballance <andrewjballance@gmail.com>, dakr@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net, ojeda@kernel.org, 
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, 
 tmgross@umich.edu, acourbot@nvidia.com, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

On Wed, Mar 19, 2025 at 4:59=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> If we're talking about the same thing then I think we're both wrong
> and the correct phrasing would have been: "you can avoid underflow
> checking when CONFIG_RUST_OVERFLOW_CHECKS=3Dy by using `checked_sub`". I
> was referring to the underflow check implicit in `new_len -
> self.len()`.

`checked_sub` always checks (if not optimized away). The config option
is about the implicit one.

Do you mean avoiding panics?

Cheers,
Miguel
