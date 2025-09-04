Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8356DB43B54
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 14:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F3D10E253;
	Thu,  4 Sep 2025 12:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="db6hmjP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2620110E253
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 12:17:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756988227; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fu5i56MR5gqKZ1f2G9Xz5lDudtJcH3I9W17LiRO9dwOio9nAefUwa0wJVLFWte/xC1Ovn4Rl5KETEqhrBCrWXcElvCqEUhl55qIpPpbJpH4zlalIV0MB9Ixgf9iUAx0LJMR0ElgeKSi677OXr0jQnPCkrIbmFyYKf83ZZR+7M64=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756988227;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=BGXLLXLza35q5x0tGMHrUvPhUFi5TzJmTtz5njAQN3c=; 
 b=FyiECescXz52cWh4CSSG2krUc1FSPcu2erNAru2tSel6xEf5USb5o+e8/pUThQDaDY1r0LQiSpelBPDytroDQvhbn4iDkMySiIe9oQ5J0tB4jRnZJk5sQFPc8sUFnLRemMKdeMMxUB08/JIoQgCnKsSUfHfH5pJVPaOKypuE+y8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756988227; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=BGXLLXLza35q5x0tGMHrUvPhUFi5TzJmTtz5njAQN3c=;
 b=db6hmjP+R5cjIOrwRt8pVfLDiTyO3EKSQbdEh8jNaMqfWDYpP/DqeSW57rUqeiBK
 FerwSW47rwkJc6501vZmzLpAn4fYPMxoBJma/YwINP2pZ6f92WaOGBnzJqh/QZeQXD4
 bC/5KX/nXv6Dcpt9KOrd1Jmw97fPclgmyP6aOYtU=
Received: by mx.zohomail.com with SMTPS id 175698822434127.246868953927674;
 Thu, 4 Sep 2025 05:17:04 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 02/14] rust: drm: gem: Add DriverFile type alias
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250829224116.477990-3-lyude@redhat.com>
Date: Thu, 4 Sep 2025 09:16:47 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <864C74E2-77D7-4983-BC62-09C62672D600@collabora.com>
References: <20250829224116.477990-1-lyude@redhat.com>
 <20250829224116.477990-3-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
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



> On 29 Aug 2025, at 19:35, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Just to reduce the clutter with the File<=E2=80=A6> types in gem.rs.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V3:
> * Rename ObjectFile to DriverFile
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> rust/kernel/drm/gem/mod.rs | 23 ++++++++++++-----------
> 1 file changed, 12 insertions(+), 11 deletions(-)
>=20
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 31c5799d995c5..80940ed11368d 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -14,6 +14,13 @@
> };
> use core::{mem, ops::Deref, ptr::NonNull};
>=20
> +/// A type alias for retrieving a [`Driver`]s [`DriverFile`] =
implementation from its
> +/// [`DriverObject`] implementation.
> +///
> +/// [`Driver`]: drm::Driver
> +/// [`DriverFile`]: drm::file::DriverFile
> +pub type DriverFile<T> =3D drm::File<<<T as DriverObject>::Driver as =
drm::Driver>::File>;
> +
> /// GEM object functions, which must be implemented by drivers.
> pub trait DriverObject: Sync + Send + Sized {
>     /// Parent `Driver` for this object.
> @@ -23,19 +30,12 @@ pub trait DriverObject: Sync + Send + Sized {
>     fn new(dev: &drm::Device<Self::Driver>, size: usize) -> impl =
PinInit<Self, Error>;
>=20
>     /// Open a new handle to an existing object, associated with a =
File.
> -    fn open(
> -        _obj: &<Self::Driver as drm::Driver>::Object,
> -        _file: &drm::File<<Self::Driver as drm::Driver>::File>,
> -    ) -> Result {
> +    fn open(_obj: &<Self::Driver as drm::Driver>::Object, _file: =
&DriverFile<Self>) -> Result {
>         Ok(())
>     }
>=20
>     /// Close a handle to an existing object, associated with a File.
> -    fn close(
> -        _obj: &<Self::Driver as drm::Driver>::Object,
> -        _file: &drm::File<<Self::Driver as drm::Driver>::File>,
> -    ) {
> -    }
> +    fn close(_obj: &<Self::Driver as drm::Driver>::Object, _file: =
&DriverFile<Self>) {}
> }
>=20
> /// Trait that represents a GEM object subtype
> @@ -79,7 +79,8 @@ extern "C" fn open_callback<T: DriverObject>(
>     raw_file: *mut bindings::drm_file,
> ) -> core::ffi::c_int {
>     // SAFETY: `open_callback` is only ever called with a valid =
pointer to a `struct drm_file`.
> -    let file =3D unsafe { drm::File::<<T::Driver as =
drm::Driver>::File>::from_raw(raw_file) };
> +    let file =3D unsafe { DriverFile::<T>::from_raw(raw_file) };
> +
>     // SAFETY: `open_callback` is specified in the AllocOps structure =
for `DriverObject<T>`,
>     // ensuring that `raw_obj` is contained within a `DriverObject<T>`
>     let obj =3D unsafe { <<T::Driver as drm::Driver>::Object as =
IntoGEMObject>::from_raw(raw_obj) };
> @@ -95,7 +96,7 @@ extern "C" fn close_callback<T: DriverObject>(
>     raw_file: *mut bindings::drm_file,
> ) {
>     // SAFETY: `open_callback` is only ever called with a valid =
pointer to a `struct drm_file`.
> -    let file =3D unsafe { drm::File::<<T::Driver as =
drm::Driver>::File>::from_raw(raw_file) };
> +    let file =3D unsafe { DriverFile::<T>::from_raw(raw_file) };
>=20
>     // SAFETY: `close_callback` is specified in the AllocOps structure =
for `Object<T>`, ensuring
>     // that `raw_obj` is indeed contained within a `Object<T>`.
> --=20
> 2.50.0
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

