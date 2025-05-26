Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DDCAC4532
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 00:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABDE10E426;
	Mon, 26 May 2025 22:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EI57zU2n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7091A10E432;
 Mon, 26 May 2025 22:30:24 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-32a658c4cc4so9001071fa.2; 
 Mon, 26 May 2025 15:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748298623; x=1748903423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DeRtQfopGgqdSMrju5Mssh4B08QuGYql7A9ITbZgjgA=;
 b=EI57zU2nHZQGAjjztBKUPmKIRvtJqRE90nHtI5+wK6QKxhvLyjMyK5cC2fHaZeQvCc
 ccbhlyFHxEt+y9taeJpxpsxF+vQTSxEfZ/o30GlYJOUumNLZcjyiVZkmfBsHemagPevG
 SADb4ljVepREPAns9b38yM32PTbZEyTZAmNuez9KvFgU/yg1RkM/VtDl984AhVgA2y+o
 ouMHkw8R+gxdQAsIWyXBej6vb75eWjiG/cM/FOQcBapjucYJoiA8Uic0/MW5RclS3BDV
 GtAojHMg3uz86s2qGaJqJs7u82i7K1Kv77Wzo+6sXOaFt7nPo8+GDRW82QJ1Bm0NueUZ
 f/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748298623; x=1748903423;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DeRtQfopGgqdSMrju5Mssh4B08QuGYql7A9ITbZgjgA=;
 b=dQdf4yZqKfN2VDVpF16yQvbopJQXS4ODxyBiQVjnc/Ie386GYiJQdhLhfELqkSZs0y
 tC0+WZEa7+MaEv8upPlqECtefdDMS/oztnreO5tD6SCc40F3RiTAbJBNvYGMGch/Jhf+
 r8grt4+9nEfWIoUxC7VZ1PE6luoAMA/qCg6aeScTDIKuVRPsaObI68QvCeWf7/Iadqu4
 NKnbScpz05HK2vBzL6OynxJwHyeMAraehfkz8gf+vUbOUo2+9mCUsfsn2ljkA3lFRD+V
 hsoyBRRB6VV2aDWmQuY06KAifot1VpoGAbEcFgWmHvuJuYhcC23IJaZUZd4qtrxsPqNG
 tcSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP8b905NiPYMpC1C4WznzxNEApS/zOYoY90n9Kz/X1KjtnQ0LHUO0oxptFUjK5tm9g6DYgGbeui78=@lists.freedesktop.org,
 AJvYcCXldZkp6EPah7159HFA1SiC+7dM3ulxLyWxQGr7Ym/E3fCKCYe6r59RNlEf9MgeWUQxkIZQw2sl8w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIens3oTKa0/ADJ86pH9rUNdxRSwE6VAQq6RlYa9/bydARFmOa
 8IeKBuXRbGjQCOFZ33Y55j/2tZ+y23ucq2kZJkKbsf5dp6UKLh4zdKTjsW30CrsnXTI75nI7qBi
 wxKf0sh6CAQrkrq8eA2hpWPgMI/R43Jw=
X-Gm-Gg: ASbGncsgdoj7NDjHo/00CMHOpfpI7cWnfG8G1+dcoQAByQMq6/KNPlQVmcCQBAv61Xv
 3yhbDNeQs2WOM8rIU36Ccq5CSyPNMviZ+SofyOmnZADxG4Fl3IEBi3RKUPo/jf8K5hgY2dS6WB9
 ALXdq9eaiOEhe/wW7gV0hxKhvJW6DaNtFgH/hxdmUsHzvi60lqfhtEZK1cN1unVMkPgHg=
X-Google-Smtp-Source: AGHT+IHobXPM6nV57q0LkxjWMI5y+a9fqFFRAaaAVdT/IiyU5kBtoHLbzkKYgFh6GOZFHTnYbitctcnCYMHIu3rZzy0=
X-Received: by 2002:a05:651c:1b11:b0:32a:6bef:7587 with SMTP id
 38308e7fff4ca-32a6bef7741mr3018881fa.20.1748298622556; Mon, 26 May 2025
 15:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-4-6412a94d9d75@gmail.com>
 <DA66NJXU86M4.1HU12P6E79JLO@kernel.org>
In-Reply-To: <DA66NJXU86M4.1HU12P6E79JLO@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 26 May 2025 18:29:46 -0400
X-Gm-Features: AX0GCFuvvdq9fWPFcsB31U1UA0LVEWVFnDG5B-zpmEiF_aWL5P9UrGYE0gqlG8U
Message-ID: <CAJ-ks9nd6_iGK+ie-f+F0x4kwpyEGJ-kQiQGt-ffdbVN5S6kOg@mail.gmail.com>
Subject: Re: [PATCH v10 4/5] rust: replace `kernel::c_str!` with C-Strings
To: Benno Lossin <lossin@kernel.org>
Cc: Michal Rostecki <vadorovsky@protonmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org
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

On Mon, May 26, 2025 at 11:04=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> > +macro_rules! c_str_avoid_literals {
>
> I don't like this name, how about `concat_to_c_str` or
> `concat_with_nul`?
>
> This macro also is useful from macros that have a normal string literal,
> but can't turn it into a `c""` one.

Uh, can you give an example? I'm not attached to the name.

>
> > +    // NB: we could write `($str:lit) =3D> compile_error!("use a C str=
ing literal instead");` here but
> > +    // that would trigger when the literal is at the top of several ma=
cro expansions. That would be
> > +    // too limiting to macro authors, so we rely on the name as a hint=
 instead.
> >      ($str:expr) =3D> {{
> > -        const S: &str =3D concat!($str, "\0");
> > -        const C: &$crate::str::CStr =3D match $crate::str::CStr::from_=
bytes_with_nul(S.as_bytes()) {
> > -            Ok(v) =3D> v,
> > -            Err(_) =3D> panic!("string contains interior NUL"),
> > -        };
> > +        const S: &'static str =3D concat!($str, "\0");
> > +        const C: &'static $crate::str::CStr =3D
> > +            match $crate::str::CStr::from_bytes_with_nul(S.as_bytes())=
 {
>
> Why is this still our CStr?

Good question. I'll just revert all the changes here, I don't need to
touch this.

>
> > +                Ok(v) =3D> v,
> > +                Err(err) =3D> {
> > +                    let _: core::ffi::FromBytesWithNulError =3D err;
>
> Is this really necessary?

No. Reverted in v11.
