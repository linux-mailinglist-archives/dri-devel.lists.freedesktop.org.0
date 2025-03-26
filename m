Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE80A72028
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 21:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C636610E789;
	Wed, 26 Mar 2025 20:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mdAeHEQJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151B810E789
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 20:47:58 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30c0517142bso3285581fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 13:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743022076; x=1743626876; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MNs4I+VY96qzVEnIeAX0i56gaLKwfzD5slXgEMkegvA=;
 b=mdAeHEQJSrWb69jLclaeLjDkqCY8b/UTICqulUC/PoxmlORI+UMgev9ykEdsWSqQ4e
 557xhBrfHm0lyiR5AfTM8ZrtR0MQ1h4gWXCdVEwWrYi4zskUto8UIDT7R9tC0ED1d0Im
 GyvJL2W401joKyR39sjdRd/qpZyu14cjGZ7fbLDJXdDJ0pP2weporq+EE6af68deXEWt
 Jf1RQqGVfuwPmNnGNIqgUo8Yi/bKCasyGxMH78Hasbe93MGLrw73yjCqt5/fU2bxH4hn
 F9i18q+PBYvBkwZ52lftN7BPzZCSwdx7pqw85N21uUu9eZHk0Bl2n4Bukds/LKVnkgxV
 q9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743022076; x=1743626876;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MNs4I+VY96qzVEnIeAX0i56gaLKwfzD5slXgEMkegvA=;
 b=B6JPAR/pjV8lajrfIxKL6EAU6GQG4nYfjMJKrvkbCNwpb72v7GfLs1EKxz1HVu6wvV
 Nmdj/X62z64YrE2emHkz4HvKhHHRI0LCV42KcCaN9LWgmo9YmxzeA+Nv0NJ8DYg3bxnx
 YCaKf/bmTHWVF483OKG1nmwmjIrFKuKSdPiXUzVv6CsxdnMMKohFEf0h1H4BUIXi9Bj6
 Y4mAjqCVO5P3i3UxMmlMfJPcfEmNYZz4IOKc5Pp7ttw3T4+DQj18VzUjokyPtUnH+fgS
 n7cM6Y5luP2IaM8tm8Fk/3/YjgUjKOuJZCklrwvju33+XQ+ZCWzI53wfx/P5lm86Y81G
 MJ7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2XQYrvaKLtTq1E6AvWiPc+CS/+ReJ6XslbXE/N8wgKqtjkxF71t4Kf9RSnwSIO1jGlGddDi/sUNM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3MUk5vAPYqHo831KbV+gmzueERhdn7Wn13nbAmGmyuIVxMxfQ
 su0gd4ckMBlWUPEVDcrDHYPoGnmn6VskoM096jT8KWuf5d7DMOM6t0iSJ/mcVgZpFja25BljH35
 bIMUG/AtTiC3kjZxS3pgUqglrMPQ=
X-Gm-Gg: ASbGncvaT9IMPgTISN55C40mMiVNyYc6s4ff199Ex2ng38f+qiVeXHNc6cOl9iYxGYP
 CKBxrcLKR8JpAzz5U43Gfcc+wLd62o7a3YmFVIngm/N0MRvMud9Fa1bVaVb1Qg2ioCg1zaR6eee
 bgsYMykElpsGUI7nFb6Hfuoj6FjI+J4o/N2DLx0JXRIw==
X-Google-Smtp-Source: AGHT+IFTkL17Jc/5tc+lwRysHk8MME6mG/fwpKugvVpwwiEAGHYsBQsULAH9u2w5eS9UmGc0jzIZJK6sghNVKBbuAwc=
X-Received: by 2002:a2e:988c:0:b0:30c:177c:9e64 with SMTP id
 38308e7fff4ca-30dc5f4fc1cmr4487501fa.35.1743022076074; Wed, 26 Mar 2025
 13:47:56 -0700 (PDT)
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
 <CAJ-ks9ntTxBM=c5nUZWGv3MoRt-LveBchn-c1Xy-DGap7fLVRA@mail.gmail.com>
In-Reply-To: <CAJ-ks9ntTxBM=c5nUZWGv3MoRt-LveBchn-c1Xy-DGap7fLVRA@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 26 Mar 2025 16:47:20 -0400
X-Gm-Features: AQ5f1JpxZvv_0238pnS7OYKOrg_jP5CAtUULUrbnzS777StxjTzB1jEvV5C3tbs
Message-ID: <CAJ-ks9=dgQE_UF--Kv0HVTF_d1JzqK1gMoeE8GO8EGVtM-yt_Q@mail.gmail.com>
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

On Wed, Mar 26, 2025 at 3:06=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Wed, Mar 26, 2025 at 1:36=E2=80=AFPM Benno Lossin <benno.lossin@proton=
.me> wrote:
> >
> > On Wed Mar 26, 2025 at 5:57 PM CET, Tamir Duberstein wrote:
> > >
> > >
> > > In the current code you're looking at, yes. But in the code I have
> > > locally I'm transmuting `[u8]` to `BStr`. See my earlier reply where =
I
> > > said "Hmm, looking at this again we can just transmute ref-to-ref and
> > > avoid pointers entirely. We're already doing that in
> > > `CStr::from_bytes_with_nul_unchecked`".
> >
> > `CStr::from_bytes_with_nul_unchecked` does the transmute with
> > references. That is a usage that the docs of `transmute` explicitly
> > recommend to change to an `as` cast [1].
>
> RIght. That guidance was written in 2016
> (https://github.com/rust-lang/rust/pull/34609) and doesn't present any
> rationale for `as` casts being preferred to transmute. I posted a
> comment in the most relevant issue I could find:
> https://github.com/rust-lang/rust/issues/34249#issuecomment-2755316610.
>
> > No idea about provenance still.
>
> Well that's not surprising, nobody was thinking about provenance in
> 2016. But I really don't think we should blindly follow the advice in
> this case. It doesn't make an iota of sense to me - does it make sense
> to you?
>
> >
> > [1]: https://doc.rust-lang.org/std/mem/fn.transmute.html#alternatives
> >
> > >> I tried to find some existing issues about the topic and found that
> > >> there exists a clippy lint `transmute_ptr_to_ptr`. There is an issue
> > >> asking for a better justification [1] and it seems like nobody provi=
ded
> > >> one there. Maybe we should ask the opsem team what happens to proven=
ance
> > >> when transmuting?
> > >
> > > Yeah, we should do this - but again: not relevant in this discussion.
> >
> > I think it's pretty relevant.
>
> It's not relevant because we're no longer talking about transmuting
> pointer to pointer. The two options are:
> 1. transmute reference to reference.
> 2. coerce reference to pointer, `as` cast pointer to pointer (triggers
> `ptr_as_ptr`), reborrow pointer to reference.
>
> If anyone can help me understand why (2) is better than (1), I'd
> certainly appreciate it.

Turns out there's a tortured past even in the standard library. In
2017 someone replaces trasmutes with pointer casts:

https://github.com/rust-lang/rust/commit/2633b85ab2c89822d2c227fc9e81c6ec1c=
0ed9b6

In 2020 someone changes it back to transmute:

https://github.com/rust-lang/rust/pull/75157/files

See also https://github.com/rust-lang/rust/pull/34609#issuecomment-23055987=
1
which makes my point better than I have, particularly this snippet:
"In addition, casting through raw pointers removes the check that both
types have the same size that transmute does provide.".
