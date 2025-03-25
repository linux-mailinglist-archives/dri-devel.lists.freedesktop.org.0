Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D3DA70D09
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 23:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B2A10E608;
	Tue, 25 Mar 2025 22:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="Yv8ej2/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA6D10E608
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 22:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1742942439; x=1743201639;
 bh=qKP6LXK3dUgc4q9ZnxoH7qOT+1VIzcyp4xZAhxfH/Y4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=Yv8ej2/GgDpfnJGUKMTLt2zFKD3k3oVhZs8DxA4KQasGzpEorXx2FmLkMoaTMVp34
 Wg/JdjLV4weljwB0R4UHf8QnIoNYD5r7r767CCEJlGCyQKO1yYLSdSd+dbE7o8UJxa
 8RyMI8ELlSpF8vw+5BHbsxez/AFKCpadU0kqu+WslyevovfunkOq1KfbSepxLB9q6T
 WWsHFuHLedCagGm4o7ldrw2Ghmr9vLbkrYZykqD0fybXeA5g1sKWqX0HthUsxDpTaX
 Qa+IaNI2pPjUv2U1AyZiGRqcqbnb7QVqnFsFIlWo3pmlYqiLY2sSgT3TAcoNPMpBtd
 faWiuJdJwqfSA==
Date: Tue, 25 Mar 2025 22:40:33 +0000
To: Tamir Duberstein <tamird@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
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
 Robin Murphy <robin.murphy@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, FUJITA Tomonori <fujita.tomonori@gmail.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org,
 linux-block@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org
Subject: Re: [PATCH v7 7/7] rust: enable `clippy::ref_as_ptr` lint
Message-ID: <D8PPIYIJCNX8.13VPQULEI0ALN@proton.me>
In-Reply-To: <CAJ-ks9mUYw4FEJQfmDrHHt0oMy256jhp7qZ-CHp6R5c_sOCD4w@mail.gmail.com>
References: <20250325-ptr-as-ptr-v7-0-87ab452147b9@gmail.com>
 <20250325-ptr-as-ptr-v7-7-87ab452147b9@gmail.com>
 <D8POWLFKWABG.37BVXN2QCL8MP@proton.me>
 <CAJ-ks9mUYw4FEJQfmDrHHt0oMy256jhp7qZ-CHp6R5c_sOCD4w@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 973acf25ffeb3c44b5b862f8356cb4304fe578ab
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Tue Mar 25, 2025 at 11:33 PM CET, Tamir Duberstein wrote:
> On Tue, Mar 25, 2025 at 6:11=E2=80=AFPM Benno Lossin <benno.lossin@proton=
.me> wrote:
>>
>> On Tue Mar 25, 2025 at 9:07 PM CET, Tamir Duberstein wrote:
>> > diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
>> > index 40034f77fc2f..6233af50bab7 100644
>> > --- a/rust/kernel/str.rs
>> > +++ b/rust/kernel/str.rs
>> > @@ -29,7 +29,7 @@ pub const fn is_empty(&self) -> bool {
>> >      #[inline]
>> >      pub const fn from_bytes(bytes: &[u8]) -> &Self {
>> >          // SAFETY: `BStr` is transparent to `[u8]`.
>> > -        unsafe { &*(bytes as *const [u8] as *const BStr) }
>> > +        unsafe { &*(core::mem::transmute::<*const [u8], *const Self>(=
bytes)) }
>>
>> Hmm I'm not sure about using `transmute` here. Yes the types are
>> transparent, but I don't think that we should use it here.
>
> What's your suggestion? I initially tried
>
> let bytes: *const [u8] =3D bytes;
> unsafe { &*bytes.cast() }
>
> but that doesn't compile because of the implicit Sized bound on pointer::=
cast.

This is AFAIK one of the only places where we cannot get rid of the `as`
cast. So:

    let bytes: *const [u8] =3D bytes;
    // CAST: `BStr` transparently wraps `[u8]`.
    let bytes =3D bytes as *const BStr;
    // SAFETY: `bytes` is derived from a reference.
    unsafe { &*bytes }

IMO a `transmute` is worse than an `as` cast :)

---
Cheers,
Benno

