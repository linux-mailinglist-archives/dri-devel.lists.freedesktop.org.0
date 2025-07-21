Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5F1B0CC90
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 23:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE5410E3CA;
	Mon, 21 Jul 2025 21:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k6IZRKXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2C710E3C8;
 Mon, 21 Jul 2025 21:25:22 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-313862d48e7so660986a91.1; 
 Mon, 21 Jul 2025 14:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753133122; x=1753737922; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9iFLdp2ndiNM8RNps+ppve+VMxv1HIOTDVN1LN5NGOw=;
 b=k6IZRKXShXCj89TqP5DM1T3dmaNY2CXPU0PiC24+BibEr1zIXAUnsJxds7PAl3H0km
 qynIjUMZuwlUsw6tWwmM8wiLbOrQljjUpM8Yb1qDT93MTfJMRSMRC8zOzDxGCbfHzSz5
 QlaJfbumwkD7qFICzAE19BLKxKsmWnZQjUsDIpS54nXYHOYF6zau9XxnkQ5jtgXeDFR5
 RM/owI7mM21UtEmDOBeAy0fb4TMifqNwF3/nhWqExse3PBnTeR+q02hX9uNmddJeoQWn
 +XWyXIbUC+8vYERSOr71bhI4ntMpy1D2OBocV6Nv4PTV0CJrbE5GyLuSmVxt34+qZoyj
 tqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753133122; x=1753737922;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9iFLdp2ndiNM8RNps+ppve+VMxv1HIOTDVN1LN5NGOw=;
 b=Rz127/APDJXn7ClOF+Inc9Z3H0YVcW/3+ue4kGUiBq5BWPTSG/icmUYiftSitdsrzO
 9IXiuNT8gfKEroAsRJQ4jP6P48SYwJXGSyaR3CJXsFBeKkM9iRyLoCwsAdifbwkMLqta
 dYsqgjKRUuRaLVNPEOUftj5VdvzHxaVjr9kutOCPGTuwHqLm93IjS92z75oE7OYu/+wq
 16JTvuqi8t5Id7JYgp57B+SZ1/Vhy36sxqcCFO4apRrGB9Bs38+0cvAlFgw/5pO+hy7k
 Tcak0pjUaCwJDUO866MQh2nOdLG+uJ4/K4XA/69AVSQLWHK6FsIBV52G77xrq0Zl7mkL
 G45A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+6qeBhkw4t7Cu6iPYXFtK5sXdJqh7wd5ZY+XsqqwF7ihtIMr1KOvcoQhDVdAICBaCxUIkm82gAIs=@lists.freedesktop.org,
 AJvYcCWLFX9OKMFYw3Erm2BgeTUGJkGLeHlIxW6e6k4DTOEGYXsYbvNbTsAbbCd+Tb1zqSYdKYVsrl3T/g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz6wmDXCDLJTxMsulBzC6WeEkgzQq7gcrM9Wn/Kw8CVT0u9VkI
 TyRpcgv/s8d5bx6sGrFQKiCuGlCpajPlfspf7YlUOVxpHXsBLs2772Qv6psMqLKlSqEqf41HqWT
 UlrtzoA+UgHaOuptIAIa0qdmtoZLB//E=
X-Gm-Gg: ASbGncvq7FHM0ihlKcKpvLWOjqY2E4dS4WkGc6kZAE3VaYpaLLzHDPSsXPh91q1x81q
 WccDoQ2OcIMFFhoiLsk6+Z1rEpbDX5w4Ymqls6DUYZR6OYxYftL0E55g7id0WVpitSMpM+AdF17
 G8uU5ftifsJnjtBA8TbJK/dFpLkzbzvkwZ6mb3jsmPzLbgqNjlCdCBaK2XaPjdglokXRoWYgluu
 bDX0pQExJ6HOJVp3gM=
X-Google-Smtp-Source: AGHT+IGMwqakNKOUFXVAu2/3PXle8MucW9ApQqtEvS19+SeB54BAypNZzC2R/JPDOK0p7gPei/ELcvNLwjB5DUmNGHY=
X-Received: by 2002:a17:90b:4a85:b0:312:1d2d:18f8 with SMTP id
 98e67ed59e1d1-31c9e7a47d2mr12006266a91.7.1753133122141; Mon, 21 Jul 2025
 14:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
 <20250719-core-cstr-fanout-1-v2-7-1ab5ba189c6e@gmail.com>
In-Reply-To: <20250719-core-cstr-fanout-1-v2-7-1ab5ba189c6e@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Jul 2025 23:25:07 +0200
X-Gm-Features: Ac12FXx1fxLwm1B3q35hYDSm0FBUzbFOkBoCCwDTqVlcqaSOlmPogm9Pbry1ihw
Message-ID: <CANiq72nQT=uX4E997rVDOjNGzVbEx0_kqpa70OkAXPHy7bffSw@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] rust: seq_file: use `kernel::{fmt,prelude::fmt!}`
To: Tamir Duberstein <tamird@gmail.com>, Christian Brauner <brauner@kernel.org>
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
 Uladzislau Rezki <urezki@gmail.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
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

On Sun, Jul 20, 2025 at 12:42=E2=80=AFAM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> Reduce coupling to implementation details of the formatting machinery by
> avoiding direct use for `core`'s formatting traits and macros.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

VFS should be Cc'd on this one, so doing so here.

Christian: I will eventually apply this series, so please let me know
if you are against this one (Acked-by's appreciated, of course),
thanks!

Cheers,
Miguel
