Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3C8A11087
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 19:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B1110E00F;
	Tue, 14 Jan 2025 18:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Rf8cKf/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5850B10E00F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 18:54:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1736880885; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Vu7dm0Pqhw/DvBodd+NlCYczAyiEFIhExmhZ3n6Rmz8HStPmkPkdpyRz/IkrWd5PUND2aOS2du3BCXfRLAYkZVJympPQ6g4MMb4MsNf68Xo51Hz62rkvVjCbJAzY5WqexbFvwUI7x1nZFqKlrSCOeW57eIcEU3tLWeKfQmk2DXY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1736880885;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=BP6ACPWzR0HHfSMZ3A0N5PyNz00Y3I8W1FyQtBvKDzU=; 
 b=QpK4ymkT6p5gQkmlcOr/akflrb949NdHK0IQJZ2uAFgkF2c/SOrOOwQ3gcIut6rQleuQZLdexykxRtC2MT3W0I3x/yZJ4be3J4vKwOCgMlHpybjDbQxvc8WfBp41eOqAydr4FOTkwqL+OlDN3gTh5kmzG8ho5I1yfd/rph33qsQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736880884; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=BP6ACPWzR0HHfSMZ3A0N5PyNz00Y3I8W1FyQtBvKDzU=;
 b=Rf8cKf/RbPV7ruhwWNpLdu+zXPNhKPpdBNEu0JUpZEAQbavnsT2P2XvyNZ91FuSs
 jKJKci5pceF9Zjh0oqp00oFYRJ8+SLLsP7Pz4WNKh9YdgeivXRgcpWC52xtanv1XxYE
 BvhlPR231/gEWzZfSfC89Lo+XW5K/AgLQ7jmbmO4=
Received: by mx.zohomail.com with SMTPS id 17368808822481008.5050880846019;
 Tue, 14 Jan 2025 10:54:42 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [WIP RFC v2 01/35] WIP: rust/drm: Add fourcc bindings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <e09d76bcbcad70f23cbd863f75a985bb220717ab.camel@redhat.com>
Date: Tue, 14 Jan 2025 15:54:24 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>,
 mcanal@igalia.com, airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com,
 jhubbard@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@redhat.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0AABF976-BE2C-4A6E-9EC9-AD4F63807E6D@collabora.com>
References: <20240930233257.1189730-1-lyude@redhat.com>
 <20240930233257.1189730-2-lyude@redhat.com>
 <5A7B3FCB-0A97-4818-9AE4-A1911EA55B90@collabora.com>
 <e09d76bcbcad70f23cbd863f75a985bb220717ab.camel@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External
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

Hi Lyude,

>>>=20
>>> +impl FormatInfo {
>>> +    // SAFETY: `ptr` must point to a valid instance of a =
`bindings::drm_format_info`
>>> +    pub(super) unsafe fn from_raw<'a>(ptr: *const =
bindings::drm_format_info) -> &'a Self {
>>=20
>> I think FormatInfoRef would be more appropriate, since you seem to be =
creating a reference type (IIUC)
>> for a type that can also be owned.
>>=20
>> This would be more in line with the GEM [1] patch, for example.
>>=20
>> In other words, using `Ref` here will allow for both an owned =
`FormatInfo` and a `FormatInfoRef<=E2=80=98_>`.
>>=20
>> I am not sure about the role of lifetime =E2=80=98a here. If you =
wanted to tie the lifetime of &Self to that of the pointer,
>> this does not do it, specially considering that pointers do not have =
lifetimes associated with them.
>>=20
>>> +        // SAFETY: Our data layout is identical
>>> +        unsafe { &*ptr.cast() }
>>=20
>> It=E2=80=99s hard to know what is going on with both the reborrow and =
the cast in the same statement.
>>=20
>> I am assuming that cast() is transforming to *Self, and the reborrow =
to &Self.
>>=20
>> To be honest, I dislike this approach. My suggestion here is to =
rework it to be similar to, e.g., what
>> Alice did here for `ShrinkControl` [2].
>=20
> Interesting. I did understand this wouldn't be tying the reference to =
any
> lifetime more specific then "is alive for the duration of the function =
this
> was called in" - which in pretty much all the cases we would be using =
this
> function in would be good enough to ensure safety.
>=20
> I guess though I'm curious what precisely is the point of having =
another type
> instead of a reference would be? It seems like if we were to add a =
function in
> the future for something that needed a reference to a `FormatInfo`, =
that
> having to cast from `FormatInfo` to `FormatInfoRef` would be a bit =
confusing
> when you now have both `&FormatInfo` and `FormatInfoRef`.

I=E2=80=99ve realized since then that there=E2=80=99s more code using =
the same pattern as you did,
so it appears that it=E2=80=99s found acceptance in the rest of the =
community. Thus,
I retract what I said earlier.

The `unsafe { &*ptr.cast() }` construct seems to be widely used too, so =
that is also
not a problem for me anymore

>=20
>>=20
>> +/// This struct is used to pass information from page reclaim to the =
shrinkers.
>> +///
>> +/// # Invariants
>> +///
>> +/// `ptr` has exclusive access to a valid `struct shrink_control`.
>> +pub struct ShrinkControl<'a> {
>> + ptr: NonNull<bindings::shrink_control>,
>> + _phantom: PhantomData<&'a bindings::shrink_control>,
>> +}
>> +
>> +impl<'a> ShrinkControl<'a> {
>> + /// Create a `ShrinkControl` from a raw pointer.
>> + ///
>> + /// # Safety
>> + ///
>> + /// The pointer should point at a valid `shrink_control` for the =
duration of 'a.
>> + pub unsafe fn from_raw(ptr: *mut bindings::shrink_control) -> Self =
{
>> + Self {
>> + // SAFETY: Caller promises that this pointer is valid.
>> + ptr: unsafe { NonNull::new_unchecked(ptr) },
>> + _phantom: PhantomData,
>> + }
>> + }
>>=20
>> Notice the use of PhantomData in her patch.

Some people have complained about introducing arbitrary smart pointers =
like
I suggested, so let=E2=80=99s drop this idea.
=20
>>=20
>> By the way, Alice, I wonder if we can just use Opaque here?
>=20
> FWIW: I think the reason I didn't use Opaque is because it didn't =
really seem
> necessary. AFAICT the lifetime of drm_format_info follows rust's data =
aliasing
> rules: it's only ever mutated before pointers to it are stored =
elsewhere, thus
> holding a plain reference to it should be perfectly safe.

Do use Opaque though, it=E2=80=99s repr(transparent) and will make your =
code more similar
to what we already have upstream.

=E2=80=94 Daniel

