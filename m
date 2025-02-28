Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E4AA493E7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 09:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F1A10EC19;
	Fri, 28 Feb 2025 08:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DebL4SGv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF31110EC19
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:47:38 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43994ef3872so12080285e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 00:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740732455; x=1741337255;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kl2IwG7HZDSCHcpQxlhObcRhTNm+twA6A6MmUqt9Yl0=;
 b=DebL4SGvBvYZvAPgsjbRTwFJdL7vmJJgiZxJ7jlzX2Yxq7iKvEnZ3RZB8bEJGTbqz1
 Ju8m1jMODOME/QTwVe/Xz9YzUzArPp693b/yJjPUc7wueSh2zw3TRYEAN82WRplQDZfC
 YpciYRHJpifKl5oXBAFQwHAjVVNZSgUW5VHVOg0YsPagwDoMZjDhvEb+yMrjyGfyrjc1
 +qURrTxQmQhsrggUyV+DwpR8cKlVbpuhE2GSSYtdOehpuWiJzbCZl3TxKH5JTkKVYTBt
 K+XOt7S+7tFha8eAX7gRwXML/BFAQd6vSOJV89VY1QoMlbu8mWi/vn+LRFj6Oh8MtnOZ
 CbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740732455; x=1741337255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kl2IwG7HZDSCHcpQxlhObcRhTNm+twA6A6MmUqt9Yl0=;
 b=B011X+Qvd/qfBqTbmWDtrBl6wcqyZUIWN+BhojroacKjcNqVRA236scaibTg4Sympr
 g70T3HYA2bUe7ycGWSNEX64DwG8FKJBYG38Sm11p6eyLUuQ+b6hkR/HALBHXrDNeim6F
 IPmgI821wUHDyZg+Une4xbbBJR6MiR9Bpt67LEngKX9W09SRNd3eDam9QfxyeUSk3xHe
 iPC8Or5nLXkehK5W44vmxugr0BhwsJgP3gt9dGF17Eu4P6ilXx9D+qy7tDKdWFepRH1J
 da8TRo7OrbvaTeZlybkN+gKJKNc747R0AegYyMNFnS9C5q97SWFKwMQWXj0BcKvhEctk
 fbLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFZtVw20+fsGPhU/jMU4nc+SLyFdZNyxRa+LEbzgdR4OpiVc8MnSTZ+B7XLtLlKp1Hk8m4svc5eDk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwER82nbNuImQ3fz7NNgISGLeI0/nySlENFTwSc4SrI7DYy0a9i
 ox1qiWNFYQh2CMWYvTBxU4Az/lVnEegXp3wKOVwG+vMTUOZhk9fM4YA+Jyhhs64RW3vstcB0cGg
 xgFx+Q80tzr9eMTFR43NOwaKgEApyl6n2is/O
X-Gm-Gg: ASbGncvE09KtJMGklnbSVGkt0RNzALh9P8RQ7GvDC7m6sT9cukGQHRqiWzyyNrkmatM
 kM676fYPOTYlnteuHg4Q5vgNgmGYJCRRgQ/d0me0LLrSiMQ03zqYfx+ZfIPGS+UjoptlgyPXlg7
 2AwEwahLXZkvuaBAhqJGXu3O8MAOMKpMXeZYy6
X-Google-Smtp-Source: AGHT+IGwcgUW5OnvmV3QPHuKOrrO6Iuoq2TPQDupN4J9DP9Kay+XkSy1sz9g+96PyICWN0k33yRcOLiRB6A5tuChr1M=
X-Received: by 2002:a05:600c:1c93:b0:439:a1ef:c238 with SMTP id
 5b1f17b1804b1-43ba6704511mr18768095e9.13.1740732449733; Fri, 28 Feb 2025
 00:47:29 -0800 (PST)
MIME-Version: 1.0
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
 <2025022714-specked-refocus-b701@gregkh>
In-Reply-To: <2025022714-specked-refocus-b701@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 09:47:17 +0100
X-Gm-Features: AQ5f1JpfAFri8l7nY7vFVmBZQXd_HNmIqbMhkShc48OxhVuvQ8No9II9fNH8noU
Message-ID: <CAH5fLgiFEUrKRdOPJ7HLaD5GqgOmz8wPNXqvkREksL=C1KmvMg@mail.gmail.com>
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
>
> Seriously, nice work!  This resolves the issues I had, and it looks like
> you found a needed fix already where things were not quite defined
> properly.
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Greg, did you have any input on the choice of header file in the third patc=
h?

Alice
