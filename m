Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498D3A4E56D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 17:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C9610E642;
	Tue,  4 Mar 2025 16:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JkG+ewZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline2.cc.itu.edu.tr (beeline2.cc.itu.edu.tr [160.75.25.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA06B10E642
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 16:18:32 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline2.cc.itu.edu.tr (Postfix) with ESMTPS id 5BDFE408B666
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:18:31 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gm41C2lzG2rk
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:16:20 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id D8F534274A; Tue,  4 Mar 2025 19:16:15 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=JkG+ewZL
X-Envelope-From: <linux-kernel+bounces-541154-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=JkG+ewZL
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
 by le2 (Postfix) with ESMTP id C289F42CEF
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:28:31 +0300 (+03)
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
 by fgw2.itu.edu.tr (Postfix) with SMTP id 9BA292DCF6
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:28:31 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DFF118880DD
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 08:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 275CC1EF0AB;
 Mon,  3 Mar 2025 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="JkG+ewZL"
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFA71C8FB5
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 08:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=209.85.128.50
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1740990497; cv=none;
 b=FgucKuVRJC+DmPtkg13vIXmUSXfghE38qXol7wW5eATmdb66p28NaxUrGjAxj2FDm2lt2ujwtoLCpxB/8hbfu/E6KXKpKAFi8AluGwJpAeOcp7GZdHopJBxoVXhP+lDdJ+XnppthvCe5e6opr3hBpbMlxi6utEAPqeD36Vh1KYw=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1740990497; c=relaxed/simple;
 bh=lRmX3N1C+LM4n4qOw6aMES+ET/YFvMicl8riRqpvkCI=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=i/7PaLbBYF3/NAcfyyUNOi4lygyXJZobNDTtpQHIx07go+sPWLAPDV/v0V8JYP+ef426j2TIr6CuYHb9d6Z5FHpAN7WOu+hTSnznyPM2JRepcWvLGUTY+eMyWyflGigNmLJLZ5UmEzJxKeM+JzV30DYigzK+qU3yzaYJ3hq4/vE=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none)
 header.from=google.com; spf=pass smtp.mailfrom=google.com;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b=JkG+ewZL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso26310655e9.0
 for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 00:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740990492; x=1741595292; darn=vger.kernel.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gLvDvN37rSZdD6m86XjZbKgQ5aDQc83ylMnqHwB2npw=;
 b=JkG+ewZLm7TH+wsAxlsdrCluT51JoNSyv7o59yJshiwmoHzoNxa6Dhq6sTU1BAqQhA
 wZ+xqvp3b/9ZGEBQh3pqjawMAEMZrEGAx/Tdg/7pCczxVFI78MPhO/Qo1URR2dFFrc5H
 nM5wnAzRlaBl+do4yCkJU92vmrHznIUK+u/rM25cs7vabAqFdUEXmY4vt2JY4HxMKUsf
 0dpchgwtDcya8AHMYi97DvCRfq+oAXhgBLXULIVWXv+hBkpVqPJvC5E6r0ZLjQpRAe4z
 JQOGr7qIkyf+XUYcJAHG1TkDMtqpGNwN72fO+80kV/ifH5tyzJ3lp97EebahW3KPMThq
 Zrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740990492; x=1741595292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gLvDvN37rSZdD6m86XjZbKgQ5aDQc83ylMnqHwB2npw=;
 b=Gky3FlF53ThaJIt0/qSW/rcPsiu8GR2dhMLQm2g0cxNIb0QZhbr5he5WuX57+zn7Ze
 2iRtOCPYGyqrhneqljrKjaegxwNN/qg8YoClIzSrxNFw1wml1ihcrdTwlehlxeXhsfzm
 0BMw1aCpLWVlext/8u7VeRg05PNv/MInAokM4KZBdJAu28EbMwvYt4RY8rdubwOcS//v
 30EKBl+r6wI80VCbiK9Kpq/rrbFmRKOlGrsZ3d3Sb4ykRhCcJFUFGQEtjPopmHUVhUKB
 8JEZXoz1L/M/S1oaaAX3nlV4kHIeStdunR+UqJqZNcrBPYQYPLpNEAFQrpEDTQ2tDCVo
 XiHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaU7Zwymple/vhoGjYslOEHtnysQaXc8RuZJCjYbkwBljjBFA0U1lySc4/NolCfKCq1UsOtSo6NYylIj8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk9s+NZJqz0pEPOMq2UiMu3gX/Ua1w3jrlf4Mhz3LISpjIq/RU
 UEUQp9y+MRoHBQ1e3jaP+xXc7F1rMbiRiUXxZ+GsYmwfxiRUyM6f9cRYjVSmCsaxMJqVSv1L7M+
 vSFwD/jgo/8P12Wyg4B/VfLp+c3dW4v2yxiwi
X-Gm-Gg: ASbGncu6oXl2NCYhK4Mvv0ky+KWrfenZEN2uXJvA7fWkHRd0YfPCTN9QnByZo4KMSZq
 OdP4RaMUpbtsochroZwJyMZy37h8kWMtks9Oq20L3/M56wnHV0ebVjGaRXhzWCwCV8qt+GfQ2nY
 Stlt27kJNUKGVff9lmkPrz76MxvihmP+QenQKrJyQgyW8Fimal0FzmbmzJ
X-Google-Smtp-Source: AGHT+IHnj4KwcJwR4hqqqZ0/9sOxcRdaZsnmJP5IDASm2FTMhGCue7uJvacKssbH0SCdqUWPbng41JGRR50dPvmLyKs=
X-Received: by 2002:a05:6000:156d:b0:38f:5057:5810 with SMTP id
 ffacd0b85a97d-390ec7d1e40mr10547737f8f.25.1740990492516; Mon, 03 Mar 2025
 00:28:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-3-569cc7e8926c@google.com>
 <CAJ-ks9ng6AqmDynFebR+2_ZEpmvxkUNWdTed2vr0kede0dxcxw@mail.gmail.com>
In-Reply-To: <CAJ-ks9ng6AqmDynFebR+2_ZEpmvxkUNWdTed2vr0kede0dxcxw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 09:28:00 +0100
X-Gm-Features: AQ5f1Jp_z3J9oogrNYre-GB0tMVaV9ocvNHvETVAolm9W0Emv57UL3K3-UTPtKA
Message-ID: <CAH5fLgj6jQ9Ga2HMqXF3bypxy4qA-wgrfQx2htq0k=V0jfNMpQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] rust: add #[export] macro
To: Tamir Duberstein <tamird@gmail.com>
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
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6gm41C2lzG2rk
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741709807.05547@0iRwx87ALvcLTf96y78Fig
X-ITU-MailScanner-SpamCheck: not spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

On Fri, Feb 28, 2025 at 4:40=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Fri, Feb 28, 2025 at 7:40=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Rust has two different tools for generating function declarations to
> > call across the FFI boundary:
> >
> > * bindgen. Generates Rust declarations from a C header.
> > * cbindgen. Generates C headers from Rust declarations.
> >
> > In the kernel, we only use bindgen. This is because cbindgen assumes a
> > cargo-based buildsystem, so it is not compatible with the kernel's buil=
d
> > system. This means that when C code calls a Rust function by name, its
> > signature must be duplicated in both Rust code and a C header, and the
> > signature needs to be kept in sync manually.
>
> This needs an update given Miguel's comments on the cover letter. I
> wonder if the code should also justify the choice (over cbindgen).

Will do.

> > +/// Please see [`crate::export`] for documentation.
> > +pub(crate) fn export(_attr: TokenStream, ts: TokenStream) -> TokenStre=
am {
> > +    let Some(name) =3D function_name(ts.clone()) else {
> > +        return "::core::compile_error!(\"The #[export] attribute must =
be used on a function.\");"
> > +            .parse::<TokenStream>()
> > +            .unwrap();
> > +    };
>
> Could you also show in the commit message what this error looks like
> when the macro is misused?

It looks like this:

error: The #[export] attribute must be used on a function.
   --> <linux>/rust/kernel/lib.rs:241:1
    |
241 | #[export]
    | ^^^^^^^^^
    |
    =3D note: this error originates in the attribute macro `export` (in
Nightly builds, run with -Z macro-backtrace for more info)

But I don't really think it's very useful to include this in the commit mes=
sage.

> > +    let no_mangle =3D "#[no_mangle]".parse::<TokenStream>().unwrap();
>
> Would this be simpler as `let no_mangle =3D quote!("#[no_mangle]");`?

I'll do that. It requires adding the # token to the previous commit.

> > +/// This macro is *not* the same as the C macros `EXPORT_SYMBOL_*`, si=
nce all Rust symbols are
> > +/// currently automatically exported with `EXPORT_SYMBOL_GPL`.
>
> nit: "since" implies causation, which isn't the case, I think.
> Consider if ", since" can be replaced with a semicolon.

Will reword.

> > +#[proc_macro_attribute]
> > +pub fn export(attr: TokenStream, ts: TokenStream) -> TokenStream {
> > +    export::export(attr, ts)
> > +}
> > +
> >  /// Concatenate two identifiers.
> >  ///
> >  /// This is useful in macros that need to declare or reference items w=
ith names
> >
> > --
> > 2.48.1.711.g2feabab25a-goog
>
> Minor comments.
>
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>

Thanks!

Alice

