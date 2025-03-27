Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C72A73419
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 15:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8798010E273;
	Thu, 27 Mar 2025 14:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UqfYeaGi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2833510E273
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 14:16:16 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30bf1d48843so9798421fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 07:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743084974; x=1743689774; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i9M6C9E5diSoPsICencuKBeyAWQFDJEzmaVuf3K9CWQ=;
 b=UqfYeaGiCKBjoa00EpuJr4oYMgmfmR4lY8sJz2taEPMQIUcDUG2wkShFJTDzarUSE3
 ca3J8YSpo9/+MeV3Q1P6xIeLXDgtwJSjdxixIVxSV54Iby9XHb++2tZmnLfy6d985znB
 foIP0FixfPLb0eX3nA+I8ZB22OEMjVOfd93whc9FGAv0ePBxwaqx4KTfHsM1YYoew+ho
 KOsAL14XwT9MlV5KH/BR99SXnD6rPyzlSdfcRe4tBgiPx1RGhyPFqtak8wO8iZP7sMJZ
 Vo69lb4R1C63C/VezQEthmglqHmwrsEA1SvEdYjsg5wa0pN7hbpFGTTJk4c1rewbUQwa
 Wv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743084974; x=1743689774;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i9M6C9E5diSoPsICencuKBeyAWQFDJEzmaVuf3K9CWQ=;
 b=hmOY7H9nbm6imiRmqLkKl7ftjC6MDBmIlA0Wz8n7MfH/GZ8B/L6uYotWaogafREEJU
 u6Hk/Uz4yYWLUbV3jT1NE+cB0RyeUHC/aG8bHycjM0SHapPVwOdjEpVSBtfTYqOo5pmr
 XLm+b8/+VH4Nd/VgnrEvQs443Zmi0FGBHW64z6PKOZIEDoghOnep5bqwCgWv6loQq6BG
 UqoTYcbC5Bw+z8sqQ7LN1y2omjwe6m3rKLDo7Q6+Em/IEGp6IQLpk7zh7lu9IAxXCN4i
 g+yvF07DaD/xeZIOIdAyR+0KPJguFzvoNaSUjETEaaGzXObSFB348Oee92J/pksyPTx6
 N8NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIj7sTJxbHWg9tgDylX2rYlvcSUCfYpkb1TvG0C80WnmJpaED2erhPohXjMTHh1Q2q8fvP1jZa0ds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrPHaNbPfhfgu/e20LZ/4F59u8gOyT8ZMvB5Nth6CYU8WCXZ81
 oG0DU2xUYifRvXGb6fpfieHeRsfJ84BcQbAVteswvH/p81CXbDI4+1k8p95tRtVOw5+6NptiiHf
 9hjGWIOjbrOh2F/RdorfG0aP4Y7g=
X-Gm-Gg: ASbGncsiE2YxHoRSxN3MIPi0T3H+BWG2ntqTprawLOyrsgXPLWmUlrlLnvHc6zr/p97
 31WaJznWeYzECPmD4VAWVEjaU8CDLX1HQ/FT1vXV8NlnnfWWin9nqDfyuf6jXx7igdMGk+5ku1L
 E1QsX9ke0Jj4NIe65vVcd5iRTI1AYVYzDsmd3pXU7slhnou4ip6ig/
X-Google-Smtp-Source: AGHT+IHjppBBD1opK0cTIwYQL2MZ5xpzZ9akB5zDDLt1b7/nuVFx0XppIv3k3NpUnr+TUWw12KrQXCArIl36za09rHE=
X-Received: by 2002:a2e:9997:0:b0:30c:460f:f56 with SMTP id
 38308e7fff4ca-30dc5e5c919mr13153081fa.20.1743084973460; Thu, 27 Mar 2025
 07:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
 <D8Q4MSXXZ7OI.1NC226MO02VSN@proton.me>
 <CAJ-ks9nHKpQPuSBypXTSATYhbAFkQTJzUq8jN0nu4t=Kw+0xxg@mail.gmail.com>
 <D8QCK3CQES3Y.3LTZ4MVO5B3KT@proton.me>
 <CAJ-ks9nKT2PUDm6=b4AB1QUWwwvcqPn7Vz60=c0B+uFMZrqPew@mail.gmail.com>
 <D8QDOBUM6NF0.CGJY7ZA5KD9S@proton.me>
 <CAJ-ks9ntTxBM=c5nUZWGv3MoRt-LveBchn-c1Xy-DGap7fLVRA@mail.gmail.com>
 <D8QI804Q3DAS.2BV4WSL81H52Z@proton.me>
 <CAJ-ks9mA5QDeZ3EvOD3THayFt4TtDysgm0jp2aiSF2mQCrhWiQ@mail.gmail.com>
 <D8QJMH5UR6VG.2OT5MXJJQU5QT@proton.me>
In-Reply-To: <D8QJMH5UR6VG.2OT5MXJJQU5QT@proton.me>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 27 Mar 2025 10:15:36 -0400
X-Gm-Features: AQ5f1JplRmZYTNFbnfGLzU2zYeyjxmbSnSHIdkKg-vmw1A2gTwR43LO2IWo4jk0
Message-ID: <CAJ-ks9m96vf_HxttuopuC_UfNGJbHHNdEGS2er6nZZG38pe3HQ@mail.gmail.com>
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

On Wed, Mar 26, 2025 at 6:15=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On Wed Mar 26, 2025 at 11:09 PM CET, Tamir Duberstein wrote:
> > On Wed, Mar 26, 2025 at 5:09=E2=80=AFPM Benno Lossin <benno.lossin@prot=
on.me> wrote:
> >> On Wed Mar 26, 2025 at 8:06 PM CET, Tamir Duberstein wrote:
> >> > On Wed, Mar 26, 2025 at 1:36=E2=80=AFPM Benno Lossin <benno.lossin@p=
roton.me> wrote:
> >> >> On Wed Mar 26, 2025 at 5:57 PM CET, Tamir Duberstein wrote:
> >> >> >
> >> >> > Yeah, we should do this - but again: not relevant in this discuss=
ion.
> >> >>
> >> >> I think it's pretty relevant.
> >> >
> >> > It's not relevant because we're no longer talking about transmuting
> >> > pointer to pointer. The two options are:
> >> > 1. transmute reference to reference.
> >> > 2. coerce reference to pointer, `as` cast pointer to pointer (trigge=
rs
> >> > `ptr_as_ptr`), reborrow pointer to reference.
> >> >
> >> > If anyone can help me understand why (2) is better than (1), I'd
> >> > certainly appreciate it.
> >>
> >> I am very confident that (2) is correct. With (1) I'm not sure (see
> >> above), so that's why I mentioned it.
> >
> > Can you help me understand why you're confident about (2) but not (1)?
>
> My explanation from above explains why I'm not confident about (1):
>
>     For ptr-to-int transmutes, I know that they will probably remove
>     provenance, hence I am a bit cautious about using them for ptr-to-ptr=
 or
>     ref-to-ref.
>
> The reason I'm confident about (2) is that that is the canonical way to
> cast the type of a reference pointing to an `!Sized` value.

Do you have a citation, other than the transmute doc?
