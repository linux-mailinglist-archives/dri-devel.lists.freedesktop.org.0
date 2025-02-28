Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31B0A49E03
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 16:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E7C10ECDC;
	Fri, 28 Feb 2025 15:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SufDm8mQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9250910ECDC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 15:49:27 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2f2f5e91393so626567a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 07:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740757767; x=1741362567; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIaJyzNn3jbBWJgu5Zoc5IbQQmzl5S7Xop0lcri8li4=;
 b=SufDm8mQZSWUgU9ZorDm99zhfWO71+eYyT5n72oI2nTOpVQnDkqsdj8/iQ4qjhwFkZ
 ciR54G6vGp34j021b7KmPh6YrdPgYp4eVgg5EF4XFYz0WxF0uLI71oZmbX1TSEczHQYP
 5GzLywAI/8E0UanQL+/M79kvj97udUj7lJpdkttuJAAFAZmUKwRMpHAU6/RiDe2rTHTj
 dfXonpycb9Hsz1HzaQoTHyEdmKe8l7WlAxEfvzHg+mmjHOILvwuh7v01aFl/QRcofDA8
 an0hncX9uq5O5urvBqDVyJr9dRFhU+9OYiIUgOIlm4AiiCNr6EUg0w0ehRvbiNMbrm+/
 2mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740757767; x=1741362567;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qIaJyzNn3jbBWJgu5Zoc5IbQQmzl5S7Xop0lcri8li4=;
 b=QO5SPYy5aYjRqLVnUoblFFeOu04HRAMbMJKqJs4Ky8UVW++hebzc0IyWSGdtnS/1vz
 CPrb8HIo06BxEeCa0elXZXNHZJDtw7q4TCFFlPfHTdCfeT/O9yVtHdThDrvkboxtTxPa
 ppKffuu5uzQNRC4y+H3aXGs6NLUMR5rXC2v9hoAQcSHaeJ51WHQjCHX6T2L02wx4k9vI
 d2JH+cqhkmzCpB77tDJUN7DL2nKKVm8zMsr41EwYUDC9Gb3BJTamWXBZNG6zBwh/vIlN
 udUMKjBI2BjzmTbHwxQxoVrRG/pbjjJ0J5aPUjJqxvM3m3VDRqN14wBuGMxf0kJZbr+n
 udRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEfu1V4TdwHWholdepbjVcmr8uyhN7dIg9cSx7/m3qTOBgtOTMHZ/6Yc6YWvSQM5fN0x+Nk813Bi0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKkBSUZiM7IB+yof3vzK5pXc/C1UDsoLLs2hKiktFbHlZV+Kth
 ZmNRQXnbN7Bac8QUDzrKywuq/GboqlEnTjh92qRFeHRdYBriJAMjFOi+F5yqGi6SbA/TL8v9ny0
 237qOjLyhEQDOP7mhL6/tT9QERc8=
X-Gm-Gg: ASbGncsjsNEkY/caNxXI0IXOvMZ15vmmz1G2gYYKyA8Hox9WRIOZjtXMwiJU5J070nJ
 aG/EB7ibiorPVTs3PpyqWX1WY6Frt4HB6keX+/cpW7gH7sxjooLEVUbNP/vZu9dTChrqqJoE+fY
 EI1aOtDcQ=
X-Google-Smtp-Source: AGHT+IEPlan+8bNz7Tcm2Cq/sao9mUee5KR4Xt6d2vqL8Zd9pLVI5867TMU38qeZ2/fGLTs3luniV9Zn28xpEj2Q0mM=
X-Received: by 2002:a17:90b:2251:b0:2fb:f9de:9497 with SMTP id
 98e67ed59e1d1-2febabf4096mr2463684a91.5.1740757767202; Fri, 28 Feb 2025
 07:49:27 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-3-569cc7e8926c@google.com>
 <CAJ-ks9ng6AqmDynFebR+2_ZEpmvxkUNWdTed2vr0kede0dxcxw@mail.gmail.com>
In-Reply-To: <CAJ-ks9ng6AqmDynFebR+2_ZEpmvxkUNWdTed2vr0kede0dxcxw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Feb 2025 16:49:14 +0100
X-Gm-Features: AQ5f1JrJGmkqnoFHNmTsztUAPIP-5rVyGELe8gsmoak2AeGqALQ9rpCX3yxJr6k
Message-ID: <CANiq72=UrPX4orjgFKo8LZj0PVsmXkLvQRxrgSwJrY_AfuTfEA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] rust: add #[export] macro
To: Tamir Duberstein <tamird@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
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

On Fri, Feb 28, 2025 at 4:41=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> This needs an update given Miguel's comments on the cover letter. I
> wonder if the code should also justify the choice (over cbindgen).

`cbindgen` is a longer term thing and more complex, assuming we use it
in the end, so I think it is fine going with this for the time being
-- it is straightforward and a net improvement.

Later on, if needed, we can just make `export` a no-op, right?

It may also be useful to have the exports "explicitly tagged" this way.

Cheers,
Miguel
