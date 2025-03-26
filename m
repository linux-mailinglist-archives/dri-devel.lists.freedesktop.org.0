Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D649BA71EC4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 20:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7640E10E17A;
	Wed, 26 Mar 2025 19:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="igVN9fo0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0445710E17A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 19:06:57 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30bfed67e08so2255331fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 12:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743016016; x=1743620816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xyxvZkbyduy9RmkQ3WSeK6/tBzwWPMrfRAoEJmlTmuE=;
 b=igVN9fo0+f4IHjsPSEuklLmT71LWnrc7nabKffGympRYvTLilf02zVhefnvsebPmrK
 4YMXcVAiOaTz/UrmANzJInOCmkOL9d2hh802E3wnkWY24X/BbjYMFPIC9sjfG6AcWPOG
 QJdmRy4C0upKFhAuY7DBijnznlUG/QapMxkUj4Fb7Bubx907qoqAvICFHAVE+zJ1BA0/
 KiPDvQGP22qTv3l6NxZxSy59WmRs2k28NJx4Y7pCUmfpAP9DmG7Dwp+l8MFx1lX8eKsl
 qlpSsuPvM2Jj7wAzybxgL0SlM8mpvd7MDeTWhWDGnnKswyqnHI88Q1E5qgbqoQUMppaH
 Uvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743016016; x=1743620816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xyxvZkbyduy9RmkQ3WSeK6/tBzwWPMrfRAoEJmlTmuE=;
 b=lgKKychYb8gJoO9+8McJju3G7ANRJPNh7Gt6h4EsfRlQR77+xp4+Er9KQK2yVvDOj2
 8jy+YJQNBjMDEtR+vWe7d/IuM+kURG22tcHEoS6YG5ScDYa4COkjRqkh38m1wmUN8SMM
 btBfOrlRYn0Nvgg24KBU9Qmc/mVOGZISjxxyE1jkwVkyozSLQRW3J/ExBoq6mOV1RK6r
 dqA4oN+5cZsJGRtwGDbZsTTpva7GoGlu5GWuyj+Qw/dGEy6gYFYkYdlKTQCGBlyOjXgz
 F/VyFMq06Ccbuk/+OCyZo3Aa5i9Alsgfutr6LGVO5MwLM6Epxt+Qp2ARBkhkv61yk3QD
 oBrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu12bXPbY2m5BKjq74Cnhg89fRJWLUC1wj7QDkY2oodXpZQGXc627MaoBhLpvkLPH+Mpefw80wxyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfffdXOV+Fl1fLC861BVNrMIEYF+63ppavuwaZ9ob6aOjVqPPD
 9YtICUHwKUOMMI5VLcaxPSd2pRAaeSscZrLYve9oJXXmE28gL2y4DK+lZDnekY3OtVP9SJtml1D
 g/gFF/76zRJovnzOMHoZEJgqzWTk=
X-Gm-Gg: ASbGncun/kU3kQFwsVm7rV7EJJp4eyh9qDj53mttWeCL4LMgWXyLh3cwOQgzV5xbaVM
 o3n613Mk56S4WggGsC1EFykMPd055F7ADMewHjD6qCiq1gnYTGHMJmWAudGzpLH+pwk3ll9JN4o
 Gc/68YBNH+RhVJhxqYxLznnA/6z/Q+jZh4w6bYvXSMWw==
X-Google-Smtp-Source: AGHT+IHDYgVo8MGaQ9BkG5+GyvT0+QD0Hn1jlcmz/IJfG8ECGaCOtoHRacJDMqa8JoaxSiLcVOV3Dc1Whxt+lMktHno=
X-Received: by 2002:a05:651c:4ca:b0:30b:e440:dbdb with SMTP id
 38308e7fff4ca-30dc5f45b99mr3646831fa.37.1743016015848; Wed, 26 Mar 2025
 12:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
 <20250325-ptr-as-ptr-v7-7-87ab452147b9@gmail.com>
 <D8POWLFKWABG.37BVXN2QCL8MP@proton.me>
 <CAJ-ks9mUYw4FEJQfmDrHHt0oMy256jhp7qZ-CHp6R5c_sOCD4w@mail.gmail.com>
 <D8PPIYIJCNX8.13VPQULEI0ALN@proton.me>
 <CAJ-ks9k6220j6CQSOF4TDrgY9qq4PfV9uaMXz1Qk4m=eeSr5Ag@mail.gmail.com>
 <D8Q4MSXXZ7OI.1NC226MO02VSN@proton.me>
 <CAJ-ks9nHKpQPuSBypXTSATYhbAFkQTJzUq8jN0nu4t=Kw+0xxg@mail.gmail.com>
 <D8QCK3CQES3Y.3LTZ4MVO5B3KT@proton.me>
 <CAJ-ks9nKT2PUDm6=b4AB1QUWwwvcqPn7Vz60=c0B+uFMZrqPew@mail.gmail.com>
 <D8QDOBUM6NF0.CGJY7ZA5KD9S@proton.me>
In-Reply-To: <D8QDOBUM6NF0.CGJY7ZA5KD9S@proton.me>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 26 Mar 2025 15:06:19 -0400
X-Gm-Features: AQ5f1Jou-JUIkYYZHmN0n0DjKziFwOI3NizL41USvJvQpjSfAnBz0gZwusssOLs
Message-ID: <CAJ-ks9ntTxBM=c5nUZWGv3MoRt-LveBchn-c1Xy-DGap7fLVRA@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] rust: enable `clippy::ref_as_ptr` lint
To: Benno Lossin <benno.lossin@proton.me>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 netdev@vger.kernel.org
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

On Wed, Mar 26, 2025 at 1:36=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On Wed Mar 26, 2025 at 5:57 PM CET, Tamir Duberstein wrote:
> >
> >
> > In the current code you're looking at, yes. But in the code I have
> > locally I'm transmuting `[u8]` to `BStr`. See my earlier reply where I
> > said "Hmm, looking at this again we can just transmute ref-to-ref and
> > avoid pointers entirely. We're already doing that in
> > `CStr::from_bytes_with_nul_unchecked`".
>
> `CStr::from_bytes_with_nul_unchecked` does the transmute with
> references. That is a usage that the docs of `transmute` explicitly
> recommend to change to an `as` cast [1].

RIght. That guidance was written in 2016
(https://github.com/rust-lang/rust/pull/34609) and doesn't present any
rationale for `as` casts being preferred to transmute. I posted a
comment in the most relevant issue I could find:
https://github.com/rust-lang/rust/issues/34249#issuecomment-2755316610.

> No idea about provenance still.

Well that's not surprising, nobody was thinking about provenance in
2016. But I really don't think we should blindly follow the advice in
this case. It doesn't make an iota of sense to me - does it make sense
to you?

>
> [1]: https://doc.rust-lang.org/std/mem/fn.transmute.html#alternatives
>
> >> I tried to find some existing issues about the topic and found that
> >> there exists a clippy lint `transmute_ptr_to_ptr`. There is an issue
> >> asking for a better justification [1] and it seems like nobody provide=
d
> >> one there. Maybe we should ask the opsem team what happens to provenan=
ce
> >> when transmuting?
> >
> > Yeah, we should do this - but again: not relevant in this discussion.
>
> I think it's pretty relevant.

It's not relevant because we're no longer talking about transmuting
pointer to pointer. The two options are:
1. transmute reference to reference.
2. coerce reference to pointer, `as` cast pointer to pointer (triggers
`ptr_as_ptr`), reborrow pointer to reference.

If anyone can help me understand why (2) is better than (1), I'd
certainly appreciate it.
