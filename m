Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73759AC841F
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 00:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E6610E260;
	Thu, 29 May 2025 22:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OlkkeRpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BE710E0BC;
 Thu, 29 May 2025 22:22:11 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ad56829fabdso210378066b.1; 
 Thu, 29 May 2025 15:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748557330; x=1749162130; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzt/MQxcUpDWFeSkaHOplUQ43G4Uz/X3hb9h5NpZQYg=;
 b=OlkkeRpK1Tp0oZYnKd4/HJiupftbJYKvKzQCMM3ZtJpTuL0NgSyY8i4y9JUCmyqaIr
 RThSTFgm26eAypD1z7DC8TAzasEFUR37i+9h659O2ECka5CExZUBR43j12GUbx03oHAh
 jy/lKpS4wwhWASL0FG+WBXR7bkL7QY9tui4pS/3h+qwjqwdqoea930qrR/5sWVvotr6c
 omHOL63aVEYQnhuFG+1AITnM8xfF+cjsIBwe/GpkyvW/RYVDGbWOiql+W/Mr5Mq0nWox
 nSx3nQPTHxBSd2rEs7G8HvpcWRgkcSvr6lJBVwjYhRJ0+j6j8rPsTPd2D9Y2ktjDA+zd
 tSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748557330; x=1749162130;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kzt/MQxcUpDWFeSkaHOplUQ43G4Uz/X3hb9h5NpZQYg=;
 b=QixfY0XGDyS42TgoI9sdkFUSERwCcfoj/zOMo9bmGIUvM0YaMeIpfy9Pd3XysinSyw
 I8Tlvpoz7eAzrj8PRgGYId0IKec7ICGRvdElv6D+KyK6x8dkhmoC3OAUsKFsGu8Jc6e+
 s9Xboz9FVXaIQLshRlJIOli6EEu5keFOz2ypPLb85jjv1UmzhtQ4ZbLM6aiXY6MMoVFS
 iYg/E6hu7onE7OtMIGpCAje1qdXOHqTrtXheap7/zX/qzoDCz5f9M0OI73EKZ4h7PtIW
 JeEECth6Q6WYvcEy9Mn3dDKXDIWD8thy2EGI+C4itGsxgY9CJAGZQZmCJPBCEkx1+umP
 Nj3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaata+5QDlEZQ1kAQ56u9YzlVGdFws5TZSbUmThtjjqEFOrlX+lxcWvQjlI+lljEbxNm0ybobD4w==@lists.freedesktop.org,
 AJvYcCVPBrlLfd4Y7z5WWVdiKrYnnuDrVrMET5PINcVICPGuXGqlAl3nc0PPJ5BBJBHKdwcmaiP1KhujWus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRLv0m6IhyHwcpSrWU31Pb/GUa8VIblK+sbv1Z5YJkHHRG0u9S
 g0rK+oFM9wU5MTWQg9VxviXu6Knw6evfJRIV1jkMWX3YTX1DuiHKcWy6bbG3zVlXqRJoeV5Ad5l
 6B2ZJK+9GVB6nhQc6bgkNqFmBeXCtwVQ=
X-Gm-Gg: ASbGncvwCyFmIfDkBbdFkJFjpWwr4TCqL0zsvOXpiklJzgkBgZr7xVLbALu4cW//+B/
 F74rGL2AIGFT2mv5leB4gkT/9AVVZmQG2uG/3KR6DKPkuW0WZjanw4oxCT61vkej0cNPjBvjwG4
 XIOC0GxKbTiUubuAG8S3wTKSvOYXiP4iZS3iOJ9XWL7/yPHU2O9Ru2A+BwIZ6up9g6wg==
X-Google-Smtp-Source: AGHT+IFIWF7by3gTs9nskHKuDrd5DhLirM+9vmkqnyJc8DqSb/t3iOg3xoZJQ/VvsEAFPlJfLOTUIKCA5jn+ma8BioI=
X-Received: by 2002:a17:907:72ca:b0:adb:229a:f8bd with SMTP id
 a640c23a62f3a-adb322fcfebmr110658666b.29.1748557329539; Thu, 29 May 2025
 15:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-4-6412a94d9d75@gmail.com>
 <DA66NJXU86M4.1HU12P6E79JLO@kernel.org>
 <CAJ-ks9nd6_iGK+ie-f+F0x4kwpyEGJ-kQiQGt-ffdbVN5S6kOg@mail.gmail.com>
 <aDbnLzPIGiAZISOq@google.com> <DA7WJYNAN5AI.2HE6B953GR16A@kernel.org>
In-Reply-To: <DA7WJYNAN5AI.2HE6B953GR16A@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 29 May 2025 18:21:33 -0400
X-Gm-Features: AX0GCFuFM8jRq3YcmcHlgxg8fSyonDU9gdfdyymDZiM0nf24_ZjIqY6KX4ZOh1M
Message-ID: <CAJ-ks9nmxdSKtEuzT=yBU-WEuZXBupr5N6tainzrk=w3U_enXw@mail.gmail.com>
Subject: Re: [PATCH v10 4/5] rust: replace `kernel::c_str!` with C-Strings
To: Benno Lossin <lossin@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
 Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
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

On Wed, May 28, 2025 at 11:35=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> On Wed May 28, 2025 at 12:36 PM CEST, Alice Ryhl wrote:
> > On Mon, May 26, 2025 at 06:29:46PM -0400, Tamir Duberstein wrote:
> >> On Mon, May 26, 2025 at 11:04=E2=80=AFAM Benno Lossin <lossin@kernel.o=
rg> wrote:
> >> >
> >> > On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> >> > > +macro_rules! c_str_avoid_literals {
> >> >
> >> > I don't like this name, how about `concat_to_c_str` or
> >> > `concat_with_nul`?
> >> >
> >> > This macro also is useful from macros that have a normal string lite=
ral,
> >> > but can't turn it into a `c""` one.
> >>
> >> Uh, can you give an example? I'm not attached to the name.
> >
> > I also think it should be renamed. Right now it sounds like it creates =
a
> > c string while avoiding literals in the input ... whatever that means.
>
> Yeah that's a good way to put why the name is weird.
>
> > I like Benno's suggestions, but str_to_cstr! could also work?
>
> Hmm, I think then people won't know that it can also concat? I don't
> think it matters too much, the macro probably won't be used that often
> and if someone needs to use it, they probably wouldn't fine it by name
> alone.

What do you mean by "it can also concat"? This macro by itself doesn't
concat, it takes only a single expr. The example in the docs
illustrates:

    const MY_CSTR: &CStr =3D c_str_avoid_literals!(concat!(...));

I think str_to_cstr is ok - I'll do that in v11.
