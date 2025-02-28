Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3257A49A5D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 14:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CADD10EC9F;
	Fri, 28 Feb 2025 13:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="d+SDfC9H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096DD10EC9F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:17:16 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-390e3b3d432so1452646f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 05:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740748634; x=1741353434;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z74qB8i0rvA9VyRTivjkgYMWcLCNlIOQtcyUnYqz2Kk=;
 b=d+SDfC9HNNGphC4CJ27BxYlPZx1WrgKVCcI72KQi81YFgOgqbPziNnjjQrDsLGf23e
 ob7GxsJKl19JenFb7BHcPdENMbezRfNKP0vAR3dAnH4NKGOioA/28wQaSfr218D83MtW
 45/tWRyVsX8z5GBZ4eC1lK2qJ7IUDBc28iOpjY7HXp7hUg5DL6nZmloRAKixKC9MMqvL
 tI24ef1+5Ij9+AKC0M8kkkMfEL/DUGjiVVqf7RS+wySD0Lq4ruENJEZi9DRt+dyL1T6J
 6BOnlULwpBxaWsnymGHARUEnE2JCiQSDosibYKhq4wZb5nlgt6Q/wOtoVScEUmxb/VTe
 +m5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740748634; x=1741353434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z74qB8i0rvA9VyRTivjkgYMWcLCNlIOQtcyUnYqz2Kk=;
 b=QSTi6W9MpbcyqWAUHpbFY2si7+xc/xEtRO4FDWPAcWH/UOarvjY89NEP9tqT6Ymwg+
 CIU0gG3TrQKmHqaE5TeYNEFi6coLuvXTLiAyIR04CYzEQ47G2k3s0MYRlUCZ2ULNJuyq
 c2nnd+9cmDcc14T5ZvA+cgZq4cR233i7DpbDlUTs5gRm3yiifJh6YtWAIhQdn9lHnCu9
 Z+9R+L8a48Yl7kB+WElehO48L4mcAUVLPhYb9y4oV5F5XjFFoL7Nv7iC4l8XZLRBamoV
 kFOn82D9N056+Qyx59VHZyxD/FiMU3m+HAA0cWAI5G9w8rX5Phzl/O/vGEasarREnxrV
 uxEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkUG3g3uU2xPYntf7f5KoaAiLfiraQUdYkeR1ycLHuhKNcvFEoWfE509+Wc3NgAlT4ROGeYQi157Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnwpZjQ/xJNBnn2vmBfXqVAyo5F27B2jkfUv2fv5wngNjzUVXg
 JIcXk6fLoyEkBS599HIROYvoGmFFtxW4nyDVF+XvOKIiN06EX6UWVU3WeuCI3wOLWSdmqCdoYDh
 /5YdCYlAeaadEqbR5p6c2h8nZ+bNReC8WlsMt
X-Gm-Gg: ASbGncvyFxqYt1hhZMhQ4xa0a1kKJRYmA4ziub0vTHLCe+mahZQhob1MXswp+ER/r+F
 0kFyBYGjDvMULAYyV8eEkm2xtyjcQZdJiEz8ml2XwkkPVoXtvWeiubWtaJQW17ZR+OVRrVsc/ck
 wBW6xcK/T+8cWvdV/6r/Xk25IcacwVR34ZSqFbjg==
X-Google-Smtp-Source: AGHT+IEWGx/WwYtfUYQZ979bVUDfjNZK1fjqNbS7i6AAh1HtcGFLDExsO/1IMIidMX2d20ad5heqFWsZlYme6TiA82o=
X-Received: by 2002:a05:6000:18a3:b0:38f:516b:5429 with SMTP id
 ffacd0b85a97d-390ec7d2722mr3114115f8f.25.1740748634158; Fri, 28 Feb 2025
 05:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <CANiq72mF46p7f=G8WsnajwZfg--wTNESp7xQEsWUaiumOyfW5w@mail.gmail.com>
In-Reply-To: <CANiq72mF46p7f=G8WsnajwZfg--wTNESp7xQEsWUaiumOyfW5w@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 14:17:02 +0100
X-Gm-Features: AQ5f1JrjOiLJdIMtVt0XIg52XCAYwVyxmrWrAy5Rs4benpI1u1UEF0yyTG-Vs2Y
Message-ID: <CAH5fLgj0CHpUW=-Os4gMqJxyoCAg8izFG9Q47DLt1cOJi9m4tQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Check Rust signatures at compile time
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
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

On Fri, Feb 28, 2025 at 2:12=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Feb 28, 2025 at 1:40=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > This is because cbindgen assumes a
> > cargo-based buildsystem, so it is not compatible with the kernel's buil=
d
> > system.
>
> I don't think this is true (checking is already a very good
> justification, so we don't need this to justify the series):
>
>     https://lore.kernel.org/rust-for-linux/CANiq72mHVbnmA_G1Fx3rz06RXA+=
=3DK5ERoWKjH-UDJ9cKxvKQ1g@mail.gmail.com/

Huh, I thought for sure it did.

Alice
