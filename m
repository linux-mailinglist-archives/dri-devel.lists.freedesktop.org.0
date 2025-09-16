Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250FBB5921B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 11:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CEB10E749;
	Tue, 16 Sep 2025 09:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A3/0huDO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47B110E760
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 09:25:49 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-24cb6c57a16so7223735ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 02:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758014749; x=1758619549; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IaRryEebvbTqiupWQqjYkSHOIl894hb08zd2AGUVKwQ=;
 b=A3/0huDObh1JWX76oxi7XWwtHiSsh0vG6TrikgrE08wGPSi5abL5M98mDWipvB2u26
 rXNfofrsAXz0tXIJxd9/fDd6Sa5R3sWovBC59nhQFcvsPDuFzLKJA+6xAQoWA9LnXbUj
 mtpFn80pjDLkjcPxCIW5Etad0GkYVl+bRHJBnP/jhoKD++AB5HbJk/oZ6BmjW42XDK0C
 ombI5WkH1RnIkhz4odogGAxwlV5OXVWbHipgrT+FRZSjOyNLYO6K8EYJriNqHdjzz83k
 peySLM4Ja2x3oJbXuDGjpel56lpmdZVmF1VpCFbHQMBqI/CEm7p08ACLGkSFSoT4Oj5d
 d2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758014749; x=1758619549;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IaRryEebvbTqiupWQqjYkSHOIl894hb08zd2AGUVKwQ=;
 b=vz8QkTDunJOKWEmJRue1TXU+9y6COmp1TntrA4CMUdD82eZjNyuc8v1dyTBLYAgyma
 CH4amc248sg7Hqz82/zpZvfVru/KtOJ/twSkNvNjR7UO9h68oEQM7dgTyADprNUVP7U5
 I4qjkfCkyvwqgTvvA0lHnS9EW8+/yIJUcTsYlV1VnVFo0JME+gn5MJBKr4FVUs5NPiuz
 9fSzIFYYhEwxxisn7JlPHYHJXfg1HHmQNxXXPZCAoE7CXqy4yNKfnXxK6dNIixWu7rT+
 vY/Sm/cHBwjn8LzBsIQc2Sf6yr2frNivHv+7GhCma+EwcKyRVCyTtJtDrZy9Kc6cVfrn
 swoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpNSTvwhi3y1PZ0pqwfoQ6a+QFV5diloji0GtuZ97vyhXzHixx+yIuDYHYou+Qzl1YYNpdcadl/HQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxzr0p8MmDmHER9TQTXq7ILKcCXKcVyMbxXxFpEwBtlLV/xMUWT
 X0HgNEYkSta/VZOino6VocsT2zuEne9U7pP01pfusrLTzwUEHAiLGuke8ZJ+OaFfGAZMgq8jkMe
 Z+AXQH9VutXgQ03NK7mza4Ub9ncdSojo=
X-Gm-Gg: ASbGncvRs7ixP6deeQ3gN7UYv0zCsHz+7qeuQFWbZ1sgqiQhHhRNa2n2rdWbRxajIII
 G5rXjLsiXy2bMIL67lxeerdrRCdfF9fUSMksN4ba7TTKmgxm8fJq59F2ktbffwjisjjLnUjLjEm
 BZTHM8zEtEK841Ga3OvKtBFRQaqCvjSEI7BbRHoVmJumsIIfn11dGpM1m5hwUzT9mJDI5hFFfuD
 6tOWu6k79y2UA92dLw/jHpo4hCm+Jdrx1IoGmJAVJw9ncsu77p8JGRtmQpPaUSjjCAlO4ijZj6i
 jPU/cc1BwXIWjWvrZmXyTtubSQ==
X-Google-Smtp-Source: AGHT+IFbZW+x9x9wRPjcu0fUDKKV+FI4Ux2olLrfd71XqGlZeb06RKz20GRATJ3RhC04PqeZ4amtqqROnzbUAvJFtis=
X-Received: by 2002:a17:903:234e:b0:267:b357:b63f with SMTP id
 d9443c01a7336-267b357ba4cmr28322155ad.11.1758014749004; Tue, 16 Sep 2025
 02:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250813-core-cstr-fanout-1-v3-0-a15eca059c51@gmail.com>
In-Reply-To: <20250813-core-cstr-fanout-1-v3-0-a15eca059c51@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Sep 2025 11:25:35 +0200
X-Gm-Features: AS18NWBte47JR71hFkT2j6pdf07EXnpt9Cw80lEcllpwl7SjI3e6diSfmzb9hqQ
Message-ID: <CANiq72mrY92-msShBgiqqRpewiTqLANb-uH8+nPfAqKivCWjUw@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] rust: use `kernel::{fmt,prelude::fmt!}`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Jens Axboe <axboe@kernel.dk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-fsdevel@vger.kernel.org
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

On Wed, Aug 13, 2025 at 5:39=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> This is series 2a/5 of the migration to `core::ffi::CStr`[0].
> 20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com.
>
> This series depends on the prior series[0] and is intended to go through
> the rust tree to reduce the number of release cycles required to
> complete the work.
>
> Subsystem maintainers: I would appreciate your `Acked-by`s so that this
> can be taken through Miguel's tree (where the other series must go).
>
> [0] https://lore.kernel.org/all/20250704-core-cstr-prepare-v1-0-a91524037=
783@gmail.com/
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to `rust-next` -- thanks everyone!

If any maintainer has a problem with this, please shout.

Cheers,
Miguel
