Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130DBB29BFB
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 10:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D96210E3EF;
	Mon, 18 Aug 2025 08:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jI0ikEXi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3878110E400
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 08:24:05 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-24457f4ff1aso3737375ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 01:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755505445; x=1756110245; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IzNME8PqBwqoY2i9L+WEb+gYN2gdCsJYrCvsvccSGx0=;
 b=jI0ikEXiYqYkfHhqdncdfbls0MdrHVYfak79hSJFVPRrKhnxSMffs0LGq5weqqYWa7
 opcgelpuXBFK/1QkW6GGSuzq+sSLSQgOCxlRb3iHuyTdJ/QNRLJBaxIa7db7E7lZLASU
 AtGmo2q12nIaBr5DZiEjPDD2QJ72X6NqmHNCzk0Q9QGPD63xk0Hp63GTF7Bi6gVZyaPE
 eX3VVqSr9yW8KalZxdIm9CkdDgk28UnGaWEE8rbLrDz0OAlde6SyDpgTZF5zuHVXWrbT
 GHGelIfH66lPI6fC+pShRRSxdf8KwXr/up3Eu1uYLBGjpsajCQWxrfIfNxTXRqTnGn6D
 vnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755505445; x=1756110245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IzNME8PqBwqoY2i9L+WEb+gYN2gdCsJYrCvsvccSGx0=;
 b=w+a7OhY2ntk+XqK1YHg5hmdIlIw7Qo93PDTD/edA0KW5hJbtmcbBw1yc1ve/r1kPnx
 KY3qZXZ9xts6L4qaoJN2FYZytZ4ARBJMJd9gu42vPb/mqoIxrIcfZrq4Y1OTArgONxuL
 pJ3PLzoo7ltG6RWHdf1hjpNuhxUJG8wwIxtg0NfunDylToPWvjhw1IeKKTC0Ng0QzGfg
 Qv9LsbeLGgBjLK+/hxNM+uEhCFnbJZ4OkgNk78oaGdYv2/F3b5Mi3YntI6yDq/PD8xYQ
 XsNoZ0+QBLxHXAlnbC25p26UZK0D4I9Ii4fzj54PXZ13Hf9Tnh+1YnLvohRJ+lIEdfpl
 n0YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHmBubeKJgQrwqBfgrFRNASrFKFUbI7EZChbDm9MsFMJOMDUjoYV7nWysg2fHTeLeFkOCVhiY3iYk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnoE00O1GnL3QpdPDZuXmghZgSCapTCr1BUtpbR0yoqG/qEdV9
 u35sUL8wfLbJJAprJc86wP9+d7hrXZcaxYVNZS/zi2bI8sRLgmh09/2+kqiRwjR2w2WMRLf7l8H
 MdcBK0WyJa53O2mIjJWVmdKn1Lim6+nk=
X-Gm-Gg: ASbGncsSSw+YfVkrgqIB7Lh+AJPJKkX+acboy9rPZstQ4IvKIXagPzP0jJcDVUfaCd9
 2nb9xb2FbI0Vl31rnsgxV25Lo9dmCMlpOU0f7neczm6E5UrlKKZTbMrH7+mbJZg7lc3cNCyZttW
 00B4RKgG+1g+dap3il8OfncnhRjCeNjz+KxQRrAOLE6o1YYW3b4/6qWdEgULCi7H+Bz+8YPukby
 vuJEAxJyF1zvgrxMWs=
X-Google-Smtp-Source: AGHT+IEnXMfxWj/uyVvOP6fWrBLWE/k6Z/ZqigtSlIWyEufICXqSgSvpR2T5EwW8xptt8zsRW731TiHa1gKAisHB5r8=
X-Received: by 2002:a17:903:183:b0:242:fcfd:3f94 with SMTP id
 d9443c01a7336-2446da0fe10mr80939555ad.11.1755505444632; Mon, 18 Aug 2025
 01:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250818050251.102399-2-sergeantsagara@protonmail.com>
In-Reply-To: <20250818050251.102399-2-sergeantsagara@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 Aug 2025 10:23:53 +0200
X-Gm-Features: Ac12FXxCduv7CFpvFZ_x9oxzYB1qAFIsKUW45Eg_PkQDxQNj9_OdTi6CAun7OTo
Message-ID: <CANiq72=KExEZUbeTZiC=OPUG2gLc5eg6WFzJRy=OCFBGZUXeug@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Initial plumbing for implementing DRM connector
 APIs in Rust
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
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

On Mon, Aug 18, 2025 at 7:04=E2=80=AFAM Rahul Rameshbabu
<sergeantsagara@protonmail.com> wrote:
>
> I did toss in two doc comment cleanup patches in the mix. If these need t=
o
> be re-sent individually or split due to the multiple Fixes: tags, do not
> hesitate to let me know.

Thanks!

Normally, if they are independent, like in this case, they would
normally go separately. It is typically important for fixes (and
especially so urgent ones, of course), since those may get applied
into the current cycle rather than during the merge window. It depends
on the timing, the subsystem, the fix...

For the second one here, for instance, since it is not critical, we
can simply land the entire cleanup in the other series soon, but it is
definitely possible to get the fixes in earlier too.

Cheers,
Miguel
