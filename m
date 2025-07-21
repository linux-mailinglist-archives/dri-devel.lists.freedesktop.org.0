Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7247B0CBCB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 22:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD47110E3B9;
	Mon, 21 Jul 2025 20:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TsRvTRkk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B0910E3B9;
 Mon, 21 Jul 2025 20:25:26 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-23c71b21f72so8225445ad.2; 
 Mon, 21 Jul 2025 13:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753129526; x=1753734326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f8KRAlo0QLnfXVhaUwy/xRDf2SviIgIlGB4FAr6L1pM=;
 b=TsRvTRkko96A/Y9ymvhhj3n9XAd1tdVm/bv7MOxF9gdg2dAvKFoOOGBZxoqAKS9Qcs
 g64m9w5iJCIhangapdVrCzjwvyFTJT2ZPjmaF9XHDH3f2dpdhNWF/0S70nmQpzFYXiVB
 JtQ6UjCeoSUndVUYvRNsCfla648FXmmpn4pvbp5dLe1oFfw36IwEx7/+DPXMWOaw9gLl
 GUAKzOSpNKFs8ahSCIFzf+o0U3/HHSdq0ELVUIEQRnDumSCs4Gc3vu4a+Q7Mb2WrISXW
 gUYRkmvdSZrExOIFD+rCetIzJ+ysvSEFu7wdzYLeu0RcAXTqnJJ3BcFyRoJPSmCFA2Bm
 MO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753129526; x=1753734326;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f8KRAlo0QLnfXVhaUwy/xRDf2SviIgIlGB4FAr6L1pM=;
 b=aMQtgkzUxIElbAxHlLwZ3zllKnBNPeGNWw74iWRKTAbjg3zAPMKUsfV0Eis79lOb94
 cRZFLYX5NdkulC9a5WnEaxCK9Qs5qIeLXc6aUeMDbhnaZZkZ9VuznVF1AfPcwfGpZHK8
 BVnMVUstJKnTlZwwcmnqK359n+MQSo6MHC8Dkr67UJ5dISKSUYXGl8nbygU+3Pk+8Onf
 wOvJHwdBfOm+VjqjUTFHRczEG5aU+LMhncSFyTjbMfSK5Ir9Bg1ptb5J4Xpg9jACEXOp
 Q9aMMI8XMfMipEnSfKFT8VOmn1lmPYov0QfJytoP8pflj8ypB/lz18bjrBRwtv2GkG7K
 rfOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWjRVOr2v5XpggUVJ4BWEvWuAK06icng9r+7UIvBC1siyGHk/zfZRvgdLqgQK7KMq5HQSpGUJEZg==@lists.freedesktop.org,
 AJvYcCUjjFMjNQ0YrlEN+6q6i4v2WTmbcjIm6asyfqTwvUhsKNP8JgOJZ0RdR1u5FdO8YB1rbuq7MbEkhhk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzetRyVyYWgxl2jJf3CNM3Gj8JTqOm80MU85gdNYFIk0vveGkTE
 JPR/MkPftTNniTJ2LRHTd/LfN9LWS3rK0vgFowSQahsX/ygxThKNt9ANYVmq0wNT2OVXSISTe0R
 4VXlWrgOExRPg3MUzleCabkPenYQrkLs=
X-Gm-Gg: ASbGncv6vcPfpib54OchbiggKyM2Oh0q4/vsPxeGJ8JAt6gcSOOzr7YEXwITd4bKYoI
 geIUDS6JysAdR9o0zWMPG54BGAriKwVvZRZ/fBfbg1GH3OgyaZprVaqJrWY/AldBaZ4oGRFrpQk
 etSw+8pa9nqzUxI9Ip+rJwGLeEIU6o6ochOy6DuH/L1Un20U72ggnWQGJwkfcHYJFaKYCpcZTTP
 EH/yNjs
X-Google-Smtp-Source: AGHT+IEF5YN5432flc4/QE1zXKc1vo1Qf6L24RfKDUkpQAWK8t4LLjpclkw1eCW9FSShKm7fPI0nlYBcZRk2yoWmOxs=
X-Received: by 2002:a17:902:ecce:b0:236:9302:bf11 with SMTP id
 d9443c01a7336-23e24fb217cmr121257125ad.13.1753129525871; Mon, 21 Jul 2025
 13:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
In-Reply-To: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Jul 2025 22:25:12 +0200
X-Gm-Features: Ac12FXx9U3N74aGu_SHuXKRdBAKhnaP347PEyM-2E4UxAJ_SLOxUcgsXScqoJqg
Message-ID: <CANiq72nxL9RORJA-w=rtnkwMKcXcLva3dGbMDLc71o1bqAHUsw@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] rust: use `kernel::{fmt,prelude::fmt!}`
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
 Uladzislau Rezki <urezki@gmail.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
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
> Subsystem maintainers: I would appreciate your `Acked-by`s so that this
> can be taken through Miguel's tree (where the other series must go).

Same here as in step 2b/5, i.e. Danilo's Acked-by was picked up for
things he didn't Acked-by.

I imagine it was automatically done by `b4`, but that is why we need
to be careful about automatically applying tags. I am mentioning this
mainly to confirm I am not confused and to avoid forgetting about it,
and also I hope it helps if you eventually apply patches yourself,
e.g. if you eventually take care of a branch yourself.

Cheers,
Miguel
