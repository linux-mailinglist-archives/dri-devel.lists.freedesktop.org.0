Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC99A73EE7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 20:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C1110E145;
	Thu, 27 Mar 2025 19:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gxCIPe4C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA87610E145
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 19:44:48 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30c0517142bso14588591fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 12:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743104687; x=1743709487; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zJrB+25qfJY+3ZkUCcZjNy69G3uZBa+b+woWWSnmCkY=;
 b=gxCIPe4CXASM1HySDFngB/cI0L/K3ONfnSeNh6F8HSWykQu1CmMBWBumqe0VShYqK2
 I8XT8SkdP4bm0QJpUPrAjN3zcxb27V37B3l7kz/GnNCD9PfjZtBirWdPhHG5XLy4qBYI
 mDOny7YfteJAGZWz3A+SuwcH/l65iod+E+yln6eTYLlkaAPtpindiQhPv9dMv5ULmCcc
 tdaRfTroZbxkPYgOwWgf4x3AWio08PahfFhwpOQdH+lpgSPjeNWNnSWWJkNL3GzEYtp3
 QEI+168/KkRvCuoz7tsHF5KNDBbA/41yYbPGuza0hz1Ddxw1qi25KiC8DpVGEw2P6EE1
 yWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743104687; x=1743709487;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zJrB+25qfJY+3ZkUCcZjNy69G3uZBa+b+woWWSnmCkY=;
 b=l7gUyFu65K7TMJYtSoviK3yIqxJePME53zz0kYTmasJOFwTEli28S28Klze6LcDulN
 hosjrqGHgAeBnO1BFLV5mw30+iX1b6KuUT0Sl2BQaxov9/RA0YH7e5lChEb8YGD24DK5
 B005YlaDXLJiNbPPtBWMyP+lMn06w95h7Cor/frE+y82+WASkA2z1oO0+tMPrRz6QSjH
 ZFanwSZ8+s87BjBJc3nI1VyT88mb1JMXxm3OoRFFmT5tP7gaUYLfVeoLQwi3YddD8Xk/
 qRs3monkyDb83k0PuYpwgOxmIZ1CrK7tHjSmFn5UcWwFYuVRR9K/iEsgVWvu/CUrAmFM
 ttFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa1SU7rDckqHjc837K6++/XxZLAy9fzohkguB3L7lWdLKYdE3UKAf05aaKmW44oJ7xsjIjwZZUSLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy50mpxTOJgFpho5doGWAW1xDm5FwvLqYdLr4zgOIiUgv+4BRKB
 WxiEdymfjDo39kC8e1liebKVigyaidRitr7LWqZjkEaIeQhfA6XOKMnUcs6hNeMCg6gvDyDTqnt
 hWL/CkYkeG0Y1A9FDkx61zAQvlIQ=
X-Gm-Gg: ASbGncsjzHe9+lzgGf1/7hZ6kzTMg93xW5LQ3gNYnBsb/mr7pnxOibIdvxTS1NtSoTi
 vAEyDg2mjQdZuacVDC2vA+daL2ySsKLVDxKzqmwP6yOXlYfAgvJMFQukLlOXL8BaDAY3DxYKQs4
 Yb3AOHmixb7d5YUx+4B3dQO2AcUP4ce7Zubx1sdkuMtVjpeS6Pcx98
X-Google-Smtp-Source: AGHT+IFyLKYlIEvGpAd9CCRPDur7dyQO/OEa86nU/lx3w5Jjq2h0PxLW9TMc3L3t1yE/rhj6ZShnSCOlezEb1R9xtqM=
X-Received: by 2002:a05:651c:1a0b:b0:30b:b7c3:ea71 with SMTP id
 38308e7fff4ca-30dc5e31b95mr23059291fa.15.1743104686814; Thu, 27 Mar 2025
 12:44:46 -0700 (PDT)
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
 <CAJ-ks9m96vf_HxttuopuC_UfNGJbHHNdEGS2er6nZZG38pe3HQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9m96vf_HxttuopuC_UfNGJbHHNdEGS2er6nZZG38pe3HQ@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 27 Mar 2025 15:44:09 -0400
X-Gm-Features: AQ5f1Jr0ooXTkF4heGS1OXy1iD2yeKYqVr9uVRi6oc_-HuImKMszqPEfh2j-Kuc
Message-ID: <CAJ-ks9n3BdKkfCpMXhE8M8Sx4B5rASoNvbmA4zPU3rmPQwZCiQ@mail.gmail.com>
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

On Thu, Mar 27, 2025 at 10:15=E2=80=AFAM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> On Wed, Mar 26, 2025 at 6:15=E2=80=AFPM Benno Lossin <benno.lossin@proton=
.me> wrote:
> >
> > On Wed Mar 26, 2025 at 11:09 PM CET, Tamir Duberstein wrote:
> > > On Wed, Mar 26, 2025 at 5:09=E2=80=AFPM Benno Lossin <benno.lossin@pr=
oton.me> wrote:
> > >> On Wed Mar 26, 2025 at 8:06 PM CET, Tamir Duberstein wrote:
> > >> > On Wed, Mar 26, 2025 at 1:36=E2=80=AFPM Benno Lossin <benno.lossin=
@proton.me> wrote:
> > >> >> On Wed Mar 26, 2025 at 5:57 PM CET, Tamir Duberstein wrote:
> > >> >> >
> > >> >> > Yeah, we should do this - but again: not relevant in this discu=
ssion.
> > >> >>
> > >> >> I think it's pretty relevant.
> > >> >
> > >> > It's not relevant because we're no longer talking about transmutin=
g
> > >> > pointer to pointer. The two options are:
> > >> > 1. transmute reference to reference.
> > >> > 2. coerce reference to pointer, `as` cast pointer to pointer (trig=
gers
> > >> > `ptr_as_ptr`), reborrow pointer to reference.
> > >> >
> > >> > If anyone can help me understand why (2) is better than (1), I'd
> > >> > certainly appreciate it.
> > >>
> > >> I am very confident that (2) is correct. With (1) I'm not sure (see
> > >> above), so that's why I mentioned it.
> > >
> > > Can you help me understand why you're confident about (2) but not (1)=
?
> >
> > My explanation from above explains why I'm not confident about (1):
> >
> >     For ptr-to-int transmutes, I know that they will probably remove
> >     provenance, hence I am a bit cautious about using them for ptr-to-p=
tr or
> >     ref-to-ref.
> >
> > The reason I'm confident about (2) is that that is the canonical way to
> > cast the type of a reference pointing to an `!Sized` value.
>
> Do you have a citation, other than the transmute doc?

Turns out this appeases clippy:

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 80a9782b1c6e..7a6fc78fc314 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -240,9 +240,10 @@ pub fn read_raw(&mut self, out: &mut
[MaybeUninit<u8>]) -> Result {
     /// Fails with [`EFAULT`] if the read happens on a bad address,
or if the read goes out of
     /// bounds of this [`UserSliceReader`]. This call may modify
`out` even if it returns an error.
     pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
+        let out: *mut [u8] =3D out;
         // SAFETY: The types are compatible and `read_raw` doesn't
write uninitialized bytes to
         // `out`.
-        let out =3D unsafe { &mut *(out as *mut [u8] as *mut
[MaybeUninit<u8>]) };
+        let out =3D unsafe { &mut *(out as *mut [MaybeUninit<u8>]) };
         self.read_raw(out)
     }

Benno, would that work for you? Same in str.rs, of course.
