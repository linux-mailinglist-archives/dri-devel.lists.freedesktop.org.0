Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B9E93A1DD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 15:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF92710E14F;
	Tue, 23 Jul 2024 13:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LLfy095T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4659710E5DC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 13:45:26 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-426526d30aaso41451455e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 06:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1721742314; x=1722347114;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JUdMWNOBxPL41aWSwiOcRVd4loEgCh7RfPYqclIT7HI=;
 b=LLfy095TrSYdIycPHUDR4jCkLL3zUfOqtRafzKnBgEG3jYi4u+d6wDQ8r+D7EANuqp
 Zz+LkcrkHfpILmuKSQJV8Rd521/I1ozSYIPJcUvDqLv3/SqBUiNCdXG6X8tT2hsg2MSq
 jIZT1Vj5k3tW4/416ankFnROf/ZQoL//s/6QDBHDtN0G/fD2cHjrmrV5Aw3lFPVk/UWy
 wJn3OXNzog4ixO5cYGrqzpvtMynJdkS73d2UttcD9DFrZQlzOv13mjZA+7IwoF4nGFzy
 JDjQT5mR60FJsa2uKZUtcXDVIzY2zx4Pa1F9rafVB9ENqlrbjhmxIZizHhb1ZJe6Ew04
 6tBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721742314; x=1722347114;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JUdMWNOBxPL41aWSwiOcRVd4loEgCh7RfPYqclIT7HI=;
 b=nNXKERL6ENcSiTb1lJ9Cxf9VeTj/DSzF7EIe3FxYAe0qqzP4soSvMXtbw3YHNgKQSx
 iTl+hrlIIpQAJ3MXQ5/nY7o0rvPmVCTuiJYuF7DDnk6UvF2elUEuri+8POQ5YLpOD2+e
 QQaZaD7Mq2hAu3lUo18RfB0pGzIxiQPs2DlC0SKduRe0XP+KJ1tGAi/GVcf9cz5SbWBt
 7GKumY0UbBTN6G3gVklVft7q1EzmWkgEx7xw0gy4ptC+BlssT6s+vLPlu5MacJaFjOpr
 Zk66H7brbh4lxURT8djxA7F0jzTvZRlKDhyM/cAQgH4oiOcDgtl1cRCIok3NijT5GTiL
 1rnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBKknoD07x29ROKXQ4giluNOjPcJ5T+8iQzkVfarZhss4QeB108NF8JDitaOh9d8hciYH6gf1YflfhcRQpm4m3GxhQvh4969rzEbfBfTS0
X-Gm-Message-State: AOJu0Yzf4JLocAv7by5lBsoLreGKPfRatrojTq6e9ws+AoaCwpNdnHhE
 g1ib5ur5wFpCKQah8TKATKOMtz2eL3q/HoC5dw11YmoUiRDPPC4ybza+zuR29kAB6zvoan4ahf0
 7ZmtTB5WUWJE149iK+IK9js0f5CABkR0Th3/9
X-Google-Smtp-Source: AGHT+IHE07qpK67Cz8iYBi6jnbzau27/24LxetDWy9auAduK98VBHyUDWeLTN4ggypdv1nYqnHsdiccef4R76g+qUzk=
X-Received: by 2002:a05:600c:5493:b0:426:6ea2:31af with SMTP id
 5b1f17b1804b1-427dc5753a9mr56168485e9.37.1721742314015; Tue, 23 Jul 2024
 06:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <CAH5fLghWQQfrKWFr+vd0B4YjxKwEd+pMV5zeiTCnRtX3_1oRYQ@mail.gmail.com>
 <4A1B4B2C-7FAB-4656-90AE-B30DC636349E@collabora.com>
In-Reply-To: <4A1B4B2C-7FAB-4656-90AE-B30DC636349E@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 23 Jul 2024 15:45:02 +0200
Message-ID: <CAH5fLgitm2qrGn3BBFyspmTD7Km+pp2qbvA9GN4fjyUnuWffWg@mail.gmail.com>
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@redhat.com>, lyude@redhat.com, robh@kernel.org,
 lina@asahilina.net, 
 mcanal@igalia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, Jul 23, 2024 at 3:41=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Alice, thanks for the review!
>
>
> >> +        fn alloc_mem(&mut self, size: usize) -> Option<*mut u8> {
> >> +            assert!(size % 8 =3D=3D 0, "Allocation size must be 8-byt=
e aligned");
> >> +            if isize::try_from(size).unwrap() =3D=3D isize::MAX {
> >> +                return None;
> >> +            } else if self.pos + size > self.capacity {
> >> +                kernel::pr_debug!("DumpAllocator out of memory");
> >> +                None
> >> +            } else {
> >> +                let offset =3D self.pos;
> >> +                self.pos +=3D size;
> >> +
> >> +                // Safety: we know that this is a valid allocation, s=
o
> >> +                // dereferencing is safe. We don't ever return two po=
inters to
> >> +                // the same address, so we adhere to the aliasing rul=
es. We make
> >> +                // sure that the memory is zero-initialized before be=
ing handed
> >> +                // out (this happens when the allocator is first crea=
ted) and we
> >> +                // enforce a 8 byte alignment rule.
> >> +                Some(unsafe { self.mem.as_ptr().offset(offset as isiz=
e) as *mut u8 })
> >> +            }
> >> +        }
> >> +
> >> +        pub(crate) fn alloc<T>(&mut self) -> Option<&mut T> {
> >> +            let mem =3D self.alloc_mem(core::mem::size_of::<T>())? as=
 *mut T;
> >> +            // Safety: we uphold safety guarantees in alloc_mem(), so=
 this is
> >> +            // safe to dereference.
> >
> > This code doesn't properly handle when T requires a large alignment.
> >
>
> Can you expand a bit on this? IIRC the alignment of a structure/enum will=
 be dictated
> by the field with the largest alignment requirement, right? Given that th=
e largest primitive
> allowed in the kernel is u64/i64, shouldn=E2=80=99t this suffice, e.g.:

It's possible for Rust types to have a larger alignment using e.g.
#[repr(align(64))].

>  +            assert!(size % 8 =3D=3D 0, "Allocation size must be 8-byte =
aligned");
>
>
> >> +            Some(unsafe { &mut *mem })
> >> +        }
> >> +
> >> +        pub(crate) fn alloc_bytes(&mut self, num_bytes: usize) -> Opt=
ion<&mut [u8]> {
> >> +            let mem =3D self.alloc_mem(num_bytes)?;
> >> +
> >> +            // Safety: we uphold safety guarantees in alloc_mem(), so=
 this is
> >> +            // safe to build a slice
> >> +            Some(unsafe { core::slice::from_raw_parts_mut(mem, num_by=
tes) })
> >> +        }
> >
> > Using references for functions that allocate is generally wrong.
> > References imply that you don't have ownership of the memory, but
> > allocator functions would normally return ownership of the allocation.
> > As-is, the code seems to leak these allocations.
>
> All the memory must be given to dev_coredumpv(), which will then take
> ownership.  dev_coredumpv() will free all the memory, so there should be =
no
> leaks here.
>
> I=E2=80=99ve switched to KVec in v2, so that will also cover the error pa=
ths,
> which do leak in this version, sadly.
>
> As-is, all the memory is pre-allocated as a single chunk. When space is c=
arved
> for a given T, a &mut is returned so that the data can be written in-plac=
e at
> the right spot in said chunk.
>
> Not only there shouldn=E2=80=99t be any leaks, but I can actually decode =
this from
> userspace.
>
> I agree that this pattern isn=E2=80=99t usual, but I don=E2=80=99t see an=
ything
> incorrect. Maybe I missed something?

Interesting. So the memory is deallocated when self is destroyed? A
bit unusual, but I agree it is correct if so. Sorry for the confusion
:)

Alice
