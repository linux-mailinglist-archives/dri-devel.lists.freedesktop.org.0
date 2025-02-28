Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67B8A493DF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 09:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045F910E280;
	Fri, 28 Feb 2025 08:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="PAR+xUmH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB0E10E280
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:46:46 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-38dcac27bcbso2036231f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 00:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740732405; x=1741337205;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tMZPZGCZCdalLb1ZDnMoCsbeWqjCj2h9ReJgi+pJbok=;
 b=PAR+xUmHuhGkHOvx7gcf+KwdayfMzXt5+wtd9/kEBJomvmjhN6FXjI2nLeNIEVznXx
 L1T95u3cN+hr9PC5GUf4DwIebmWZXsO/FM+XwT1YiHGNk5mp/nDSn4f/JWnT2NfIL7fK
 66ZleT19EDVV25CS8IKbLAVnJ+8nW/0mhmsKKDWmzq+xyI2K31mDam7+/Hae3LdD57Vx
 98zwrPt45ihM4X04yw7pV/5wATaSL5hnkLgOTzuq1pZHicfqyoXGdvN1ONXDcTZiIEma
 YJa2GgIzq85fsdUsLq8fvXYNwA+rfPr0jJBO7DWfeew++uJxurcLxOV0URNF0yMepyZz
 q23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740732405; x=1741337205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tMZPZGCZCdalLb1ZDnMoCsbeWqjCj2h9ReJgi+pJbok=;
 b=i4dJWDRd0b1T7nkQ/mgbe3G/GEm/TD50AQ7Wvt0HHQoqSX654D56lAaHJiJ43Z8DLe
 qtyFbHW7Q744UtKCqiBxNnqnxpTOB2l0Vv56q+hm3AAIVD8K/H8j7gR3YHio0m7MS5a6
 MKa19oLC1md58JCijZi1jjclgkds507ImYDWSYC7l6kPpHnUxAdBbZ6k2laXG7bHc9ep
 OzQnSjFqPpkzZiJLO19gEXox0tL9I/aLBv0ujIiH5gAUgzR3+dXyJP1YqacXBP98kMnH
 6wcPXfs6UBEqI4BROjVNaAmxnKwq8/gBjjZgwtngu3crYGxB0FdytcxjvltcXxWe19A1
 brVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk1t91gx6wYId2EehCkVYErh0jG7ar5CW6x+FtSyO3BJDEaUw71fBObGIqvTauwKEPtQ1HK23cWzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQP8E5L1PF849o2EIiPZ0dtpa7rFJX6Yst1vRpDUx2ZLhWOiij
 tYDGLY90tz+ImDIcSUfrH97g6DM/MlwryJymYMT7gUW2RekheUZ22TtHQB5Yamx7UWkhnz/NKYx
 tfWYpUpiEqUxUlGAtdwxX3+6aH9ig0KqVMe7e
X-Gm-Gg: ASbGncvmjQNwiYh7gqAetIAHtGKJNy9pxc/PBr0Z+LhtZdMHkQX001m6v0YvzAirhLZ
 U/xbJOutzdjDzCzS9n/unuzZL1Yjz0ixAiRaUxfeRptkym6RdsSOewk5c9y9V5MLh0jFLDnw2LD
 Miyg3v1kfpdRlsX8rLE/p62WOgkeHaqao1qg/0
X-Google-Smtp-Source: AGHT+IG/k3NIGd/8FVwXUX32UgEbYb5vZSEJFNoxaOeJplH4sY0amksfvxnLVl8qgMZGASNGrpS8AnfrJSj2egec+Ig=
X-Received: by 2002:a5d:5847:0:b0:38d:e3da:8b4f with SMTP id
 ffacd0b85a97d-390ebf7f818mr2114448f8f.0.1740732404732; Fri, 28 Feb 2025
 00:46:44 -0800 (PST)
MIME-Version: 1.0
References: <UXTosjUFv_CKOV-K4oqNGBhMEv64tds9NgXWhHEYdCHuKM2qSPFrpBnTqhFGkcbv5_KXYERykIXhn-sYnEeuUg==@protonmail.internalid>
 <20250227-export-macro-v1-0-948775fc37aa@google.com>
 <877c5apmdi.fsf@kernel.org>
In-Reply-To: <877c5apmdi.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 09:46:32 +0100
X-Gm-Features: AQ5f1JorcdutYNMgivy-Uv4SQylBN7HJTx4rHapLRH5N-Y1f0Jcuxa3LHpGUCrk
Message-ID: <CAH5fLgiNs-VKEQduL16eymSPnqA0_6aR8WDRYm68SE8FXGDHRw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Check Rust signatures at compile time
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Fri, Feb 28, 2025 at 8:19=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> What is going on with the cover letter of this one?

It's empty.

Alice
