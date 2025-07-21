Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B877B0CC8B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 23:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23ED810E3BD;
	Mon, 21 Jul 2025 21:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DszeMJ84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F6E10E3BD;
 Mon, 21 Jul 2025 21:24:58 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-313756c602fso949120a91.3; 
 Mon, 21 Jul 2025 14:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753133098; x=1753737898; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9iFLdp2ndiNM8RNps+ppve+VMxv1HIOTDVN1LN5NGOw=;
 b=DszeMJ84MqMr1q9VwNaZh9LL8a4ZHPB1rgJcZi1omkK98B33ymRvUKNIOw4oz8//Af
 T6MuMhwg9HUvy+1yR+7lrmS/Yqw8noaD0q4sRp2o5ZrqLt66VQEa7nSRM3ajUt/B5/6I
 fydf080rJrNy5G4F/cwWU2y1jd/w/o5gVzsR6/lexoaQB8m1cf6QYhPfCe2cXmWmkry8
 GIMVvoAuHTFektn5HZNJnUQt7aWJMIUYrVYtHJOXdgSPCzNsH2ivfZfGo00tz0FF/CMH
 k7xm+0ztdcPOJEm3PcCpqhuvwqBYGyGuM4HGZ+c7Bnh6IhBzzSDTgJm9d0CUrxDRmD54
 vTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753133098; x=1753737898;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9iFLdp2ndiNM8RNps+ppve+VMxv1HIOTDVN1LN5NGOw=;
 b=Q1wusWrhpdARFTRNr8vIIajibCGG0+ED2NMo2YlEiJjr4x2oSLDIlnG9cE1Pksd3jH
 MF78mb8jX99D0a7Dky49w5/uoF6oL+Sd1lALaq5VKzzGjbkCT9PszcvOy9qvIcHMopQv
 Yda5mCvY0WUgBfqdriN0+4j3wuL+mutE7lYUEj6swBi6rhahk04QlMlK4x+6KbqnrH9I
 kESOoQ1hSe7OSYj4xp2F3p6NZ53czLp5cbIXeUTiUGBqVVEsQO6yFBTV6wlLK//yOOvU
 7jJp432gnLpz77E1Uuj6W47J5cXXxFUwpYh8ZYNfrMUYH/T6G5V1u0m839cTY9XJsZLX
 LTZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKXZzC6HkzK0F/Xr/MoeS6IWCEI29M6cwwgmAajbFTBlSETBFEjjBeUK1Dm6weeWgFMMow13oZ9vU=@lists.freedesktop.org,
 AJvYcCVNUp5VeN3iex1tcv1E9aRFvTv9b/ggYXzHb3LTQSyWqT38erRTY1z16PYwt2o0kNSqmXZJeJ3uDg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTnLAnbyDWQqub7FouIfVW92hXYkJikJ4AafefWKKJ/XH88q9K
 Q1gWuaBp97NpsocvJMza+ARZBSziU4v4CdjIXyt2/0mA5Y2GeaWYiWIr1jgERggcVHy9X9L0WSL
 PMDMTvFaFTamaxeIutnJYd/A00zS1OnU=
X-Gm-Gg: ASbGncspo6TykHoOhXVHU/nDt2lEPfuEadTUArB/s3STT/d6LwLZ0DU+FfLvjBVo4vH
 ZH7Sl0Ae5gYH7fwK88R1RV1NVOrExjW0NfmP3Eqo0EDuPqVyxfUEFVw8/rvWEL7X+BKlHZAcu1u
 J2/+xmdqMg1yezSTC8SoLVeW8K7Qfbn7mzYPtPuQnFUnKoVH2gIJQrwWf9CrJ488osjll4j8VIy
 oOCFVKn
X-Google-Smtp-Source: AGHT+IE0OY7j57nPCKJ0BdsYahqNyN4nWsTb/RzoD5KDOD/WbbJfSbNPT9Nrk4IsCyqaxcHOFNn3XGvOFDRdAz5jjUw=
X-Received: by 2002:a17:90b:1cc3:b0:311:c5d9:2c8b with SMTP id
 98e67ed59e1d1-31c9e7767fbmr12172720a91.5.1753133098418; Mon, 21 Jul 2025
 14:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250719-core-cstr-fanout-1-v2-0-1ab5ba189c6e@gmail.com>
 <20250719-core-cstr-fanout-1-v2-5-1ab5ba189c6e@gmail.com>
In-Reply-To: <20250719-core-cstr-fanout-1-v2-5-1ab5ba189c6e@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Jul 2025 23:24:45 +0200
X-Gm-Features: Ac12FXyOfRpHyH2Hg4yjOdknVbhdKtQMd07LdKW2ll06eE6NGx73z6HhQYfeb4A
Message-ID: <CANiq72=wxjOwpbSKvmRV4Nb1Na_fsvajGYCbaiCdD7NwZkgc7A@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] rust: file: use `kernel::{fmt,prelude::fmt!}`
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
