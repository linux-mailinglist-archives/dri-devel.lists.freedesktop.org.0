Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFF4A49A49
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 14:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F38210EC94;
	Fri, 28 Feb 2025 13:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="emInVIbb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A486210EC94
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 13:12:43 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2fe82430bb4so539679a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 05:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740748363; x=1741353163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+lEhshDUI6cMzkH2vuUVTw0jZ5RYXsJu3sUaobJASwM=;
 b=emInVIbb3vb8hU5128PoOlqdBdBlq1NuZRzLyHe0ZtiD50ljAXARep4uZb4SKjbc9e
 APFpvqI9jknmhshICcv5ZLqEQhChCGBODkSysLWKz1JWWaZQFb8s2hZ0q9pFaSxA72Hm
 NyVKJe6dFfikoDNweukU/gsdoykwXZCyp7gBIf3DGh5qjGY3ArAEdCRQ/Nlx6bccfOFY
 66m8+CAg10Yc/s3wgKKLA0TwDG+opBuZsW2hEBK4XueDuj2VhBRemsJ2n+eq4nlXeHYI
 px0IeOVJXz+j2TwvVOQQiS+NEiQCPXDXIcZyGrZTBkocI9XnCuWMQ/63O7SO5FgIutbe
 QClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740748363; x=1741353163;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+lEhshDUI6cMzkH2vuUVTw0jZ5RYXsJu3sUaobJASwM=;
 b=w6U3Z9LStFi6q05cY3aGxiKzZ3J/xpNsJ529/TlD5uFJoGB6nlkftM/Z5uveSa3AmI
 Su5bGZo42HvmIMrDzprywge9/y/DIUthODD5M4qUI82cy/Rp9rH0r0KWp+O8IQPuLkxp
 LWCPw9FoHgooNBZyRsuN7DIekVVFwxkr/nFijguv+fCKTnMwbBvZA5AN0zWHr3M/NtuL
 cuL87ErT81cpl6FRJ4LcZmtYwBGh0SfELxcg5nyCgXPU3fNHYWS3jf5G1Uz0nldpzs5l
 LRfDboaEvFuk1UBiS0GTfV4MEJurAU7AgZMUvmk8zs2sYouhuUO5HB+2xE7RhLzRt6zt
 fRIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUzlnwndxcadoEVPl9Sbr6wmgjDnVym/+dSgUGYFjacd5gLzXFnhMMA5Rt8n8mHuotxx46kmxYvSE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGzAAiE7zZYT9cdIpNJb9ifmJy/3/sK7HRO+4SXbGpXkjAH+s0
 4g/VTPUC8Gbae8zmBa2oFF+Ydaohp7PmQibQnZ6H063Ab53x6Sh1eEyl1kwB3m9Ya4Apz5ve4KT
 zf+c18ixHu+cDLoPE+hoS0itSHbs=
X-Gm-Gg: ASbGncu0zHWL+io1SmSnSE4ulcCAk2IEeRphHms08QciUKwUeib8TSSdYX/DORk2PCP
 3oTecSYOkFF3r5gDWwG64E6kfY3Hv+V0gM8p/miu/z7GU2TWtT7STsEFCryF1IVL6y25sVtqPC5
 6LlFGDRDg=
X-Google-Smtp-Source: AGHT+IEhS4xLYJxs0tfqZh7dD8ek8r0CNJu2W2YtU4k5T4cl+cb59zgxrobehVGCWco+FGq9vu4kk8irqhSm2Az83bo=
X-Received: by 2002:a17:90b:4b52:b0:2fe:b77a:2eba with SMTP id
 98e67ed59e1d1-2febab1b41emr2144826a91.1.1740748363008; Fri, 28 Feb 2025
 05:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
In-Reply-To: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Feb 2025 14:12:30 +0100
X-Gm-Features: AQ5f1Jofrhmkb20pE5YuI-Rw9tp0sSCSTCQfns7NlNn-tLweA7S6JcR9oIKl8uQ
Message-ID: <CANiq72mF46p7f=G8WsnajwZfg--wTNESp7xQEsWUaiumOyfW5w@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Check Rust signatures at compile time
To: Alice Ryhl <aliceryhl@google.com>
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

On Fri, Feb 28, 2025 at 1:40=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This is because cbindgen assumes a
> cargo-based buildsystem, so it is not compatible with the kernel's build
> system.

I don't think this is true (checking is already a very good
justification, so we don't need this to justify the series):

    https://lore.kernel.org/rust-for-linux/CANiq72mHVbnmA_G1Fx3rz06RXA+=3DK=
5ERoWKjH-UDJ9cKxvKQ1g@mail.gmail.com/

Cheers,
Miguel
