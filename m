Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DC8C986B0
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 18:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E0210E2C1;
	Mon,  1 Dec 2025 17:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WnY1SrfW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E817C10E2C1
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 17:09:23 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-be64c3a2849so51073a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 09:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764608963; x=1765213763; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=10oqy7XG0ziR1jN7iIJoYu4N7Sm/NTHUpb4SiggOXnk=;
 b=WnY1SrfWMKW8eJpH2ult5Ne+qg57M+g4KerXnl9eyqDNWNX+cmSMR648f6f1MdifZ5
 qBjMYTpBpvNQdRIrLfONQkaOeijWI9vXG/KXtMMnPtf6pmOFZJhFZ8BLZ+Ts7RRDe9QT
 i00PfONlXtBKKrWi+oLeTDcTwHW1xrSCG0pEVbqnJ7xJHsN5xOhVjwGVNd79Ph8902jB
 U25PW5q83ljCNOEXwUOrgVx1hxdx/vJAS/whvOhE+1n0MnSf58t8XVMCbfqq7bABO/Md
 xGHq2cHi8XU3r2grf0RGbsg0UfxrRYrdnhD/naQfiD/c1/0sQK15+4N2Fc9tEgvC7N35
 2RPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764608963; x=1765213763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=10oqy7XG0ziR1jN7iIJoYu4N7Sm/NTHUpb4SiggOXnk=;
 b=kpUFAIc6LYtA1BbvksidqK9jodJX7zu5HNYLBfk+0r2rTqubFwDFEMXH8KosIZEGvb
 yecX5Q4HhXALQMDcmU7jA4QZAgVX04NXLgNnMjOjIjO14ZyT5+Dcp6CJI1eHvOTr734e
 6xy364FnlS2bMkA35rk62TJ5ysgMQRukrNc/NQMxPC3849JgXeFR2DsP8vvt7s0OzgNT
 93JB4jXLWuRGRh+z4cSiYzC06zExdmDYsdm5OYEPl46JJQrCka3KIZTyMdgZKX8z0VXk
 ejMWPu7a3sT3cCLZgo2givFUTSauzZpJ14tVWkvmLWQaKnuLIH2yfQTEtq8Oi0Ztvx+x
 aqIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Z4zIaCwBUK04xezikSpVhOs9riin7WlP43+xSXyU2R4pEE3b+RiOIzypEhIJr/IuFpPgJOQggaM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+gP0J6sPZ8ilgbt6jx7sc1pT1pXNifZEVJ/aQmXJMmJeazAAg
 5orluQD3pJ+0VPfhr//tODfa20j0PKJ1QgTsJATelJVt2QLtTIWeuKfW8Rl5UxYCMv1KcFYKd4g
 Bb2Md+7NNW0RzdPILDo2cyC1cG6XLtRw=
X-Gm-Gg: ASbGncvXOJwllS7ZJbEY7ST3hvNJHIzJFM0u9Cbs78beZAafc99vJPXXNPNHBD6wc+u
 inx5bBq5Uuz+Kj2tk4BHRIpC5wiLgLvD1XujFXz7YIT/W7/NNT4CvgPfWxGLGpAhquwxEXhkSpi
 kgKsHJw7YngLluqsEb88288leSuroiW90ftEah1cTAp4+zEBqWkn+6T6eiyljODU2jnOkQoR1lX
 Rs4TDVARWXwYaA//ZZrUleWxJw0B4Cw4ZyLHFed2bmaBp78FQVv5KKmLmUtbzFU9AMc37bAp/72
 u2ciDvlFmJJtVEOe1P08ltcXfgF0B7LHcZKBid1Um44jvXhPvFJNELYezgvhaYX9TwuyDypSc3u
 63yCx2iFF2q6xHA==
X-Google-Smtp-Source: AGHT+IF1YPYGD/E+eDHxFkwlvTUf8jqG51M5LA+tdLWxMqHx4a8yCVti7p4nga92l9CsKYM8VN2f66dz5zEFbxtTTgc=
X-Received: by 2002:a05:7301:e24:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a7243ec7b9mr21959223eec.0.1764608963077; Mon, 01 Dec 2025
 09:09:23 -0800 (PST)
MIME-Version: 1.0
References: <20251117-unique-ref-v13-0-b5b243df1250@pm.me>
 <20251117-unique-ref-v13-4-b5b243df1250@pm.me>
 <A5A7C4C9-1504-439C-B4FF-C28482AF7444@collabora.com> <aS1slBD1t-Y_K-aC@mango>
In-Reply-To: <aS1slBD1t-Y_K-aC@mango>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 18:09:10 +0100
X-Gm-Features: AWmQ_bnmy3Os7dUuxEXbA4TScnRqySjzLSX-NOnwmbpPdF9z2OcK2znpi-34sDw
Message-ID: <CANiq72=mZXc5+fMzsdTRupUsmsuLdsx=GZucn2MNoCTLAT1qkw@mail.gmail.com>
Subject: Re: [PATCH v13 4/4] rust: Add `OwnableRefCounted`
To: Oliver Mangold <oliver.mangold@pm.me>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
 Asahi Lina <lina+kernel@asahilina.net>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-security-module@vger.kernel.org
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

On Mon, Dec 1, 2025 at 11:23=E2=80=AFAM Oliver Mangold <oliver.mangold@pm.m=
e> wrote:
>
> Ah, yes, rustfmt must I done that, and I missed it. Will fix.

Strange -- if you noticed a case where `rustfmt` wasn't idempotent,
please let us (and upstream) know about it.

> Not sure what you mean by fictional function. Do you mean a non-existent
> function? We want to compile this code as a unit test.

Typically that means either using a (hidden on rendering) function
that wraps the code and returns a `Result` or directly a doctest that
returns one (better, when applicable). Please check other tests for
lines like

    /// # Ok::<(), Error>(())

I hope that helps!

Cheers,
Miguel
