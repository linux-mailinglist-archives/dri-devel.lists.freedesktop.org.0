Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C101A48C4C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 00:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775A910EBAB;
	Thu, 27 Feb 2025 23:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jwwxMEde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D908210EBAB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 23:03:36 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-38f488f3161so899215f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 15:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740697415; x=1741302215;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ll/D1Yp9YdEiWG0VMnt0/X896G3hXKSn6gBmjESi2yo=;
 b=jwwxMEdeNKdgg5XbFGhlSsWzLkJfXP5antySFXX4YK/axc1pT1WTzSd8XOH6O1Fgmw
 kNFkUGIjn3I/VNafjBeJ8s/vE9wxQ/ayrwbBC7YIK4m1zB7cHXNuLeIKqkilaZJYLr1h
 PDKXL6itVPeFx9RAlQIkuCq81tBDfDvpQPfeFVBrlLy+gzSEhAf1qI3G2p7r9YlpBoT0
 3+oTMJv8+AizghAkBK4R0gEMqm5OTVRdwvBPjP/dr77h5uuK37UjkAwVrNUlaUc1RwTm
 BziLI6ln8dLS9MGqQyvU8Nf9gZGW3myWSfWHClSZi6doIewrgxCjif2Qs0vxyzZTXaik
 pbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740697415; x=1741302215;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ll/D1Yp9YdEiWG0VMnt0/X896G3hXKSn6gBmjESi2yo=;
 b=l2w5JNsMhdT9uqlvWR9HPeOdCL/hYvV7FqtxPUHhZI8UKiCNaMHUYaQnhFPDV8MulB
 pcOQ5blXZ2lcw3E+dPIIBtGmxdq3HC16xl3IO4MVG31HZ9hQCY+BTrp8X6XevCzFVaUE
 XWitDPh3dVLOzDbfPjPe9K3njQXDt6usn44nY/ie5BIIY1OeiAKzPOR/f3ioUDDmJau1
 5rOT9soBkYo9WvJBbnw8lxmAqITrxVP8gM0GIPqBKBbcljCFRJWoKdsv/w6bhXOs2qN2
 tr0jYyLEEsVcWaTtyMaz3u74vONRDonalXEyUYXIf0TVKax9ANVmeR/cvLioKMXdFuaa
 hcOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPrOW2o+OoQDIN3i4Wgx6bRLuE83yvnwUS2ncIocYYRV/RoUfcjR0zLCqSq9CaDYta8wUFEkxVbRQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnPr/oqsNrAcW7UQJ6uoFTGgDO3ZubPYMtKnCSh5smgrlynfJ2
 6HHgVVMlzz+wn+WaTXlUNRaGnFz2QH4QgxuHcKuKt2ssMVrlnMAhjdfdSz6eg4UxZW+ZhMlhftF
 YP53MkBiXacz0tUbeCaOsCtJHc7ekLocxKURP
X-Gm-Gg: ASbGncsvwmKmV+wU7aRqlagkSVRXxdpJ1g+cTitwk20YarWOv0ZAGsBFNiWS55Kq8so
 eekZpH9p1+EsWfgGGsSMaZ596g3sQEKy+fj4BqGr8Zaec+2tbvv8ckiNTVkJlW2dVOLJiEY+EMN
 ib+HTeJ6Bl
X-Google-Smtp-Source: AGHT+IH0vtD3leLHVKGE1YsdW0lXCnA7JBJK4TPzTKwNX3QfLtfjcQo34otPR8D4B7PHLaAzUskWpOkkEESRkd7QTJY=
X-Received: by 2002:a05:6000:156d:b0:38d:d701:419c with SMTP id
 ffacd0b85a97d-390eca07090mr799765f8f.41.1740697415370; Thu, 27 Feb 2025
 15:03:35 -0800 (PST)
MIME-Version: 1.0
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
 <2025022714-specked-refocus-b701@gregkh>
In-Reply-To: <2025022714-specked-refocus-b701@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 00:03:23 +0100
X-Gm-Features: AQ5f1JrzmubPIlcM7hbuqwMtOjWGwGG1Zpx4TwvnGzseGbROnHWzj2ebyC4m22o
Message-ID: <CAH5fLgg3cU5anozNWd6pDS7M2_0YiU5bT0jJxCRiK6MJyBrGeg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Check Rust signatures at compile time
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
 Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Thu, Feb 27, 2025 at 8:31=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Feb 27, 2025 at 05:01:58PM +0000, Alice Ryhl wrote:
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> It's a bit odd to sign off on a 0/X email with no patch or description
> :)

What b4 does, I do. ;)

> Seriously, nice work!  This resolves the issues I had, and it looks like
> you found a needed fix already where things were not quite defined
> properly.
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks!

Alice
