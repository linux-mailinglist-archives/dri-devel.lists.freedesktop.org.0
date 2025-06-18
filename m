Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12944ADEE7B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 15:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5649210E008;
	Wed, 18 Jun 2025 13:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iTPYOHfY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58A410E008;
 Wed, 18 Jun 2025 13:54:15 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-32b7fd20f99so5763511fa.0; 
 Wed, 18 Jun 2025 06:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750254854; x=1750859654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k2W2w6wIbUYNGMzxyqMsBSzuKIfCS19Le5I7mij0LME=;
 b=iTPYOHfY+NJoOuNRoQhaW/Tr19qgzrAZfSdhUz6tA5UGUTprqlH36TX++t9yYTb1CP
 wuUpYBhlTMAP9FqBuJHiHiTO8k2sMDLsZG3gA5FqZmmDi4nYHpUxHQFmueE2ceLvMsg6
 fYJ3aJPVzCItqJ6eXrt4+suX5ORPG8TeGK4VRN8USKM5pKtpaY5yy2zKk73vPa43v0x3
 sb8IJo/CXUfCcF8lJVm+xTfVzXtCyzBpfgh3DV24jUPE8zMa9ZlcVNgdEUv8KcXGuifr
 ncufJf71Z7a+R0RDxLCLB/lLgz4XTkbIPN0qik2GHhLiXabFdrJue3HX+0GR8Q7JynIw
 bQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750254854; x=1750859654;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k2W2w6wIbUYNGMzxyqMsBSzuKIfCS19Le5I7mij0LME=;
 b=ozqR8imYnUzWTeV7Uk8GaSvzevyKWCBvuv69TYwJBZqQkjTQfbJuEhYvrtR9hxb5pG
 GcPA4hjQiCB4gCKsWKYhh18OjhzdU/VLJoi7OtbGWd5H5446KGL+PoC5Nk1vAj6cyDC+
 JpM72Cm3dCk7bjxvIk2VwmpuS+hiHE5H1zx5or6T1Mu7zSjI0H33/LFfsqN/5YjZMEdE
 VZnyKdohiC248YCRb8j92N8gbwp8wQewyWWAAP8hnNeXVTucnyQUV9X0fzB9zkRHCmvq
 WIBW78NakTBiUxjaVrcVRn2tzwcwiitaUe69GT9PVgkHvOElGtSEvmBq5imjmQCA1hUd
 eLnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUyucMkPGUCCnHChdz2DyXSE+cbyYSE87BHJ4K/pHIgDgOwecYMuXRCMSPmOPTfpSsQwOZwknu/jU=@lists.freedesktop.org,
 AJvYcCV7CfGmFiJgL+Jjo2r8brAzOsIv9nSbtStfiPWn9eyW8lCiRq6VZcJ/YTiuo/qOJTjvOKn2iLXeqQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/C6bR4QK5UzLN5zi+/duZFfrBQc+X5aMxzW3LlHEhb+Qpn4TY
 mxoihE4tMov29U98jV48uTVYpqFjUqVxijxCaDnCNRFpqlToE+FIR1VdwX7fn1KpRaqXcfC9wYR
 9QMWri4YYJEUrLMknLKzUHpLiQBWYaAc=
X-Gm-Gg: ASbGnctQQJUqn9kXJ4l6QB2c+ho53VEp0pkkb7UADj24b6E8PPRL8fO2wAILgvPJrfD
 HhDPDixqJQQ5kwKbylBjfhDhG1MhbJtIMzea6YAWUF9x3WqYLD+WKq7GgOOx2sLM9s7fmZwMizz
 W97TAEWi+94clXKGlKqKYXgp3HL55DwYARHP5hhUp+WtCxfN03UooI0vIeNUA=
X-Google-Smtp-Source: AGHT+IHZh03C5sPIQ2Hcwu1XAbcPWrubkF0FAeIxhlZg+1NSdMjscm9zrZu1R+ZNJ6L0mU+wlwxBWgoY0FO19z/Dv8I=
X-Received: by 2002:a2e:a54d:0:b0:32a:e7b9:1dc9 with SMTP id
 38308e7fff4ca-32b7cecbf6cmr9748311fa.3.1750254853559; Wed, 18 Jun 2025
 06:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250615-ptr-as-ptr-v12-0-f43b024581e8@gmail.com>
 <20250615-ptr-as-ptr-v12-1-f43b024581e8@gmail.com>
In-Reply-To: <20250615-ptr-as-ptr-v12-1-f43b024581e8@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 18 Jun 2025 09:53:37 -0400
X-Gm-Features: AX0GCFs2lt3v0bN7NxNBw5BBQKfnl11dj5C2oqrW2YIqbWOiEntoJLEgfI50Rxc
Message-ID: <CAJ-ks9=6RSaLmNmDBv-TzJfGF8WzEi9Vd-s=1wyqBcF7_f7qQQ@mail.gmail.com>
Subject: Re: [PATCH v12 1/6] rust: enable `clippy::ptr_as_ptr` lint
To: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Benno Lossin <lossin@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Breno Leitao <leitao@debian.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-pci@vger.kernel.org, 
 linux-block@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org
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

On Sun, Jun 15, 2025 at 4:55=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> In Rust 1.51.0, Clippy introduced the `ptr_as_ptr` lint [1]:
>
> > Though `as` casts between raw pointers are not terrible,
> > `pointer::cast` is safer because it cannot accidentally change the
> > pointer's mutability, nor cast the pointer to other types like `usize`.
>
> There are a few classes of changes required:
> - Modules generated by bindgen are marked
>   `#[allow(clippy::ptr_as_ptr)]`.
> - Inferred casts (` as _`) are replaced with `.cast()`.
> - Ascribed casts (` as *... T`) are replaced with `.cast::<T>()`.
> - Multistep casts from references (` as *const _ as *const T`) are
>   replaced with `core::ptr::from_ref(&x).cast()` with or without `::<T>`
>   according to the previous rules. The `core::ptr::from_ref` call is
>   required because `(x as *const _).cast::<T>()` results in inference
>   failure.
> - Native literal C strings are replaced with `c_str!().as_char_ptr()`.
> - `*mut *mut T as _` is replaced with `let *mut *const T =3D (*mut *mut
>   T)`.cast();` since pointer to pointer can be confusing.
>
> Apply these changes and enable the lint -- no functional change
> intended.
>
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_pt=
r [1]
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

@Andreas Hindborg could you please have a look for configfs?

@Rafael J. Wysocki @Viresh Kumar could you please have a look for cpufreq?

> ---
>  Makefile                               |  1 +
>  rust/bindings/lib.rs                   |  1 +
>  rust/kernel/alloc/allocator_test.rs    |  2 +-
>  rust/kernel/alloc/kvec.rs              |  4 ++--
>  rust/kernel/configfs.rs                |  2 +-
>  rust/kernel/cpufreq.rs                 |  2 +-
>  rust/kernel/device.rs                  |  4 ++--
>  rust/kernel/devres.rs                  |  2 +-
>  rust/kernel/dma.rs                     |  4 ++--
>  rust/kernel/error.rs                   |  2 +-
>  rust/kernel/firmware.rs                |  3 ++-
>  rust/kernel/fs/file.rs                 |  2 +-
>  rust/kernel/kunit.rs                   | 11 +++++++----
>  rust/kernel/list/impl_list_item_mod.rs |  2 +-
>  rust/kernel/pci.rs                     |  2 +-
>  rust/kernel/platform.rs                |  4 +++-
>  rust/kernel/print.rs                   |  6 +++---
>  rust/kernel/seq_file.rs                |  2 +-
>  rust/kernel/str.rs                     |  2 +-
>  rust/kernel/sync/poll.rs               |  2 +-
>  rust/kernel/time/hrtimer/pin.rs        |  2 +-
>  rust/kernel/time/hrtimer/pin_mut.rs    |  2 +-
>  rust/kernel/workqueue.rs               |  6 +++---
>  rust/uapi/lib.rs                       |  1 +
>  24 files changed, 40 insertions(+), 31 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 35e6e5240c61..21cc6e312ec9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -484,6 +484,7 @@ export rust_common_flags :=3D --edition=3D2021 \
>                             -Wclippy::needless_bitwise_bool \
>                             -Aclippy::needless_lifetimes \
>                             -Wclippy::no_mangle_with_rust_abi \
> +                           -Wclippy::ptr_as_ptr \
>                             -Wclippy::undocumented_unsafe_blocks \
>                             -Wclippy::unnecessary_safety_comment \
>                             -Wclippy::unnecessary_safety_doc \
> diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
> index a08eb5518cac..81b6c7aa4916 100644
> --- a/rust/bindings/lib.rs
> +++ b/rust/bindings/lib.rs
> @@ -25,6 +25,7 @@
>  )]
>
>  #[allow(dead_code)]
> +#[allow(clippy::ptr_as_ptr)]
>  #[allow(clippy::undocumented_unsafe_blocks)]
>  #[cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_tr=
ansmutes))]
>  mod bindings_raw {
> diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/allo=
cator_test.rs
> index d19c06ef0498..a3074480bd8d 100644
> --- a/rust/kernel/alloc/allocator_test.rs
> +++ b/rust/kernel/alloc/allocator_test.rs
> @@ -82,7 +82,7 @@ unsafe fn realloc(
>
>          // SAFETY: Returns either NULL or a pointer to a memory allocati=
on that satisfies or
>          // exceeds the given size and alignment requirements.
> -        let dst =3D unsafe { libc_aligned_alloc(layout.align(), layout.s=
ize()) } as *mut u8;
> +        let dst =3D unsafe { libc_aligned_alloc(layout.align(), layout.s=
ize()) }.cast::<u8>();
>          let dst =3D NonNull::new(dst).ok_or(AllocError)?;
>
>          if flags.contains(__GFP_ZERO) {
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 1a0dd852a468..0477041cbc03 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -288,7 +288,7 @@ pub fn spare_capacity_mut(&mut self) -> &mut [MaybeUn=
init<T>] {
>          // - `self.len` is smaller than `self.capacity` by the type inva=
riant and hence, the
>          //   resulting pointer is guaranteed to be part of the same allo=
cated object.
>          // - `self.len` can not overflow `isize`.
> -        let ptr =3D unsafe { self.as_mut_ptr().add(self.len) } as *mut M=
aybeUninit<T>;
> +        let ptr =3D unsafe { self.as_mut_ptr().add(self.len) }.cast::<Ma=
ybeUninit<T>>();
>
>          // SAFETY: The memory between `self.len` and `self.capacity` is =
guaranteed to be allocated
>          // and valid, but uninitialized.
> @@ -847,7 +847,7 @@ fn drop(&mut self) {
>          // - `ptr` points to memory with at least a size of `size_of::<T=
>() * len`,
>          // - all elements within `b` are initialized values of `T`,
>          // - `len` does not exceed `isize::MAX`.
> -        unsafe { Vec::from_raw_parts(ptr as _, len, len) }
> +        unsafe { Vec::from_raw_parts(ptr.cast(), len, len) }
>      }
>  }
>
> diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
> index 34d0bea4f9a5..bc8e15dcec18 100644
> --- a/rust/kernel/configfs.rs
> +++ b/rust/kernel/configfs.rs
> @@ -561,7 +561,7 @@ impl<const ID: u64, O, Data> Attribute<ID, O, Data>
>          let data: &Data =3D unsafe { get_group_data(c_group) };
>
>          // SAFETY: By function safety requirements, `page` is writable f=
or `PAGE_SIZE`.
> -        let ret =3D O::show(data, unsafe { &mut *(page as *mut [u8; PAGE=
_SIZE]) });
> +        let ret =3D O::show(data, unsafe { &mut *(page.cast::<[u8; PAGE_=
SIZE]>()) });
>
>          match ret {
>              Ok(size) =3D> size as isize,
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index b0a9c6182aec..1cb1f29630e5 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -647,7 +647,7 @@ pub fn data<T: ForeignOwnable>(&mut self) -> Option<<=
T>::Borrowed<'_>> {
>      fn set_data<T: ForeignOwnable>(&mut self, data: T) -> Result {
>          if self.as_ref().driver_data.is_null() {
>              // Transfer the ownership of the data to the foreign interfa=
ce.
> -            self.as_mut_ref().driver_data =3D <T as ForeignOwnable>::int=
o_foreign(data) as _;
> +            self.as_mut_ref().driver_data =3D <T as ForeignOwnable>::int=
o_foreign(data).cast();
>              Ok(())
>          } else {
>              Err(EBUSY)
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index dea06b79ecb5..5c946af3a4d5 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -195,10 +195,10 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Ar=
guments<'_>) {
>          #[cfg(CONFIG_PRINTK)]
>          unsafe {
>              bindings::_dev_printk(
> -                klevel as *const _ as *const crate::ffi::c_char,
> +                klevel.as_ptr().cast::<crate::ffi::c_char>(),
>                  self.as_raw(),
>                  c_str!("%pA").as_char_ptr(),
> -                &msg as *const _ as *const crate::ffi::c_void,
> +                core::ptr::from_ref(&msg).cast::<crate::ffi::c_void>(),
>              )
>          };
>      }
> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index 0f79a2ec9474..e5475ff62da3 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -154,7 +154,7 @@ fn remove_action(this: &Arc<Self>) {
>
>      #[allow(clippy::missing_safety_doc)]
>      unsafe extern "C" fn devres_callback(ptr: *mut kernel::ffi::c_void) =
{
> -        let ptr =3D ptr as *mut DevresInner<T>;
> +        let ptr =3D ptr.cast::<DevresInner<T>>();
>          // Devres owned this memory; now that we received the callback, =
drop the `Arc` and hence the
>          // reference.
>          // SAFETY: Safe, since we leaked an `Arc` reference to devm_add_=
action() in
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index a33261c62e0c..666bf2d64f9a 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -186,7 +186,7 @@ pub fn alloc_attrs(
>              dev: dev.into(),
>              dma_handle,
>              count,
> -            cpu_addr: ret as *mut T,
> +            cpu_addr: ret.cast::<T>(),
>              dma_attrs,
>          })
>      }
> @@ -293,7 +293,7 @@ fn drop(&mut self) {
>              bindings::dma_free_attrs(
>                  self.dev.as_raw(),
>                  size,
> -                self.cpu_addr as _,
> +                self.cpu_addr.cast(),
>                  self.dma_handle,
>                  self.dma_attrs.as_raw(),
>              )
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 3dee3139fcd4..afcb00cb6a75 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -153,7 +153,7 @@ pub(crate) fn to_blk_status(self) -> bindings::blk_st=
atus_t {
>      /// Returns the error encoded as a pointer.
>      pub fn to_ptr<T>(self) -> *mut T {
>          // SAFETY: `self.0` is a valid error due to its invariant.
> -        unsafe { bindings::ERR_PTR(self.0.get() as _) as *mut _ }
> +        unsafe { bindings::ERR_PTR(self.0.get() as _).cast() }
>      }
>
>      /// Returns a string representing the error, if one exists.
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index 2494c96e105f..94fa1ea17ef0 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -62,10 +62,11 @@ impl Firmware {
>      fn request_internal(name: &CStr, dev: &Device, func: FwFunc) -> Resu=
lt<Self> {
>          let mut fw: *mut bindings::firmware =3D core::ptr::null_mut();
>          let pfw: *mut *mut bindings::firmware =3D &mut fw;
> +        let pfw: *mut *const bindings::firmware =3D pfw.cast();
>
>          // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindi=
ngs::firmware` pointer.
>          // `name` and `dev` are valid as by their type invariants.
> -        let ret =3D unsafe { func.0(pfw as _, name.as_char_ptr(), dev.as=
_raw()) };
> +        let ret =3D unsafe { func.0(pfw, name.as_char_ptr(), dev.as_raw(=
)) };
>          if ret !=3D 0 {
>              return Err(Error::from_errno(ret));
>          }
> diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
> index 72d84fb0e266..e9bfbad00755 100644
> --- a/rust/kernel/fs/file.rs
> +++ b/rust/kernel/fs/file.rs
> @@ -366,7 +366,7 @@ fn deref(&self) -> &LocalFile {
>          //
>          // By the type invariants, there are no `fdget_pos` calls that d=
id not take the
>          // `f_pos_lock` mutex.
> -        unsafe { LocalFile::from_raw_file(self as *const File as *const =
bindings::file) }
> +        unsafe { LocalFile::from_raw_file((self as *const Self).cast()) =
}
>      }
>  }
>
> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index 4b8cdcb21e77..6930e86d98a9 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> @@ -9,6 +9,9 @@
>  use crate::prelude::*;
>  use core::{ffi::c_void, fmt};
>
> +#[cfg(CONFIG_PRINTK)]
> +use crate::c_str;
> +
>  /// Prints a KUnit error-level message.
>  ///
>  /// Public but hidden since it should only be used from KUnit generated =
code.
> @@ -19,8 +22,8 @@ pub fn err(args: fmt::Arguments<'_>) {
>      #[cfg(CONFIG_PRINTK)]
>      unsafe {
>          bindings::_printk(
> -            c"\x013%pA".as_ptr() as _,
> -            &args as *const _ as *const c_void,
> +            c_str!("\x013%pA").as_char_ptr(),
> +            core::ptr::from_ref(&args).cast::<c_void>(),
>          );
>      }
>  }
> @@ -35,8 +38,8 @@ pub fn info(args: fmt::Arguments<'_>) {
>      #[cfg(CONFIG_PRINTK)]
>      unsafe {
>          bindings::_printk(
> -            c"\x016%pA".as_ptr() as _,
> -            &args as *const _ as *const c_void,
> +            c_str!("\x016%pA").as_char_ptr(),
> +            core::ptr::from_ref(&args).cast::<c_void>(),
>          );
>      }
>  }
> diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/im=
pl_list_item_mod.rs
> index a0438537cee1..1f9498c1458f 100644
> --- a/rust/kernel/list/impl_list_item_mod.rs
> +++ b/rust/kernel/list/impl_list_item_mod.rs
> @@ -34,7 +34,7 @@ pub unsafe trait HasListLinks<const ID: u64 =3D 0> {
>      unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut ListLinks<ID> {
>          // SAFETY: The caller promises that the pointer is valid. The im=
plementer promises that the
>          // `OFFSET` constant is correct.
> -        unsafe { (ptr as *mut u8).add(Self::OFFSET) as *mut ListLinks<ID=
> }
> +        unsafe { ptr.cast::<u8>().add(Self::OFFSET).cast() }
>      }
>  }
>
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index 8435f8132e38..33ae0bdc433d 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -78,7 +78,7 @@ extern "C" fn probe_callback(
>                  // Let the `struct pci_dev` own a reference of the drive=
r's private data.
>                  // SAFETY: By the type invariant `pdev.as_raw` returns a=
 valid pointer to a
>                  // `struct pci_dev`.
> -                unsafe { bindings::pci_set_drvdata(pdev.as_raw(), data.i=
nto_foreign() as _) };
> +                unsafe { bindings::pci_set_drvdata(pdev.as_raw(), data.i=
nto_foreign().cast()) };
>              }
>              Err(err) =3D> return Error::to_errno(err),
>          }
> diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
> index 5b21fa517e55..4b06f9fbc172 100644
> --- a/rust/kernel/platform.rs
> +++ b/rust/kernel/platform.rs
> @@ -69,7 +69,9 @@ extern "C" fn probe_callback(pdev: *mut bindings::platf=
orm_device) -> kernel::ff
>                  // Let the `struct platform_device` own a reference of t=
he driver's private data.
>                  // SAFETY: By the type invariant `pdev.as_raw` returns a=
 valid pointer to a
>                  // `struct platform_device`.
> -                unsafe { bindings::platform_set_drvdata(pdev.as_raw(), d=
ata.into_foreign() as _) };
> +                unsafe {
> +                    bindings::platform_set_drvdata(pdev.as_raw(), data.i=
nto_foreign().cast())
> +                };
>              }
>              Err(err) =3D> return Error::to_errno(err),
>          }
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index 9783d960a97a..ecdcee43e5a5 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -25,7 +25,7 @@
>      // SAFETY: The C contract guarantees that `buf` is valid if it's les=
s than `end`.
>      let mut w =3D unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast(=
)) };
>      // SAFETY: TODO.
> -    let _ =3D w.write_fmt(unsafe { *(ptr as *const fmt::Arguments<'_>) }=
);
> +    let _ =3D w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
>      w.pos().cast()
>  }
>
> @@ -109,7 +109,7 @@ pub unsafe fn call_printk(
>          bindings::_printk(
>              format_string.as_ptr(),
>              module_name.as_ptr(),
> -            &args as *const _ as *const c_void,
> +            core::ptr::from_ref(&args).cast::<c_void>(),
>          );
>      }
>  }
> @@ -129,7 +129,7 @@ pub fn call_printk_cont(args: fmt::Arguments<'_>) {
>      unsafe {
>          bindings::_printk(
>              format_strings::CONT.as_ptr(),
> -            &args as *const _ as *const c_void,
> +            core::ptr::from_ref(&args).cast::<c_void>(),
>          );
>      }
>  }
> diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
> index 7a9403eb6e5b..8f199b1a3bb1 100644
> --- a/rust/kernel/seq_file.rs
> +++ b/rust/kernel/seq_file.rs
> @@ -37,7 +37,7 @@ pub fn call_printf(&self, args: core::fmt::Arguments<'_=
>) {
>              bindings::seq_printf(
>                  self.inner.get(),
>                  c_str!("%pA").as_char_ptr(),
> -                &args as *const _ as *const crate::ffi::c_void,
> +                core::ptr::from_ref(&args).cast::<crate::ffi::c_void>(),
>              );
>          }
>      }
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index a927db8e079c..6a3cb607b332 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -237,7 +237,7 @@ pub unsafe fn from_char_ptr<'a>(ptr: *const crate::ff=
i::c_char) -> &'a Self {
>          // to a `NUL`-terminated C string.
>          let len =3D unsafe { bindings::strlen(ptr) } + 1;
>          // SAFETY: Lifetime guaranteed by the safety precondition.
> -        let bytes =3D unsafe { core::slice::from_raw_parts(ptr as _, len=
) };
> +        let bytes =3D unsafe { core::slice::from_raw_parts(ptr.cast(), l=
en) };
>          // SAFETY: As `len` is returned by `strlen`, `bytes` does not co=
ntain interior `NUL`.
>          // As we have added 1 to `len`, the last byte is known to be `NU=
L`.
>          unsafe { Self::from_bytes_with_nul_unchecked(bytes) }
> diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
> index d7e6e59e124b..339ab6097be7 100644
> --- a/rust/kernel/sync/poll.rs
> +++ b/rust/kernel/sync/poll.rs
> @@ -73,7 +73,7 @@ pub fn register_wait(&mut self, file: &File, cv: &PollC=
ondVar) {
>              // be destroyed, the destructor must run. That destructor fi=
rst removes all waiters,
>              // and then waits for an rcu grace period. Therefore, `cv.wa=
it_queue_head` is valid for
>              // long enough.
> -            unsafe { qproc(file.as_ptr() as _, cv.wait_queue_head.get(),=
 self.0.get()) };
> +            unsafe { qproc(file.as_ptr().cast(), cv.wait_queue_head.get(=
), self.0.get()) };
>          }
>      }
>  }
> diff --git a/rust/kernel/time/hrtimer/pin.rs b/rust/kernel/time/hrtimer/p=
in.rs
> index 293ca9cf058c..2f29fd75d63a 100644
> --- a/rust/kernel/time/hrtimer/pin.rs
> +++ b/rust/kernel/time/hrtimer/pin.rs
> @@ -79,7 +79,7 @@ impl<'a, T> RawHrTimerCallback for Pin<&'a T>
>
>      unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::h=
rtimer_restart {
>          // `HrTimer` is `repr(C)`
> -        let timer_ptr =3D ptr as *mut HrTimer<T>;
> +        let timer_ptr =3D ptr.cast::<HrTimer<T>>();
>
>          // SAFETY: By the safety requirement of this function, `timer_pt=
r`
>          // points to a `HrTimer<T>` contained in an `T`.
> diff --git a/rust/kernel/time/hrtimer/pin_mut.rs b/rust/kernel/time/hrtim=
er/pin_mut.rs
> index 6033572d35ad..d05d68be55e9 100644
> --- a/rust/kernel/time/hrtimer/pin_mut.rs
> +++ b/rust/kernel/time/hrtimer/pin_mut.rs
> @@ -83,7 +83,7 @@ impl<'a, T> RawHrTimerCallback for Pin<&'a mut T>
>
>      unsafe extern "C" fn run(ptr: *mut bindings::hrtimer) -> bindings::h=
rtimer_restart {
>          // `HrTimer` is `repr(C)`
> -        let timer_ptr =3D ptr as *mut HrTimer<T>;
> +        let timer_ptr =3D ptr.cast::<HrTimer<T>>();
>
>          // SAFETY: By the safety requirement of this function, `timer_pt=
r`
>          // points to a `HrTimer<T>` contained in an `T`.
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index d092112d843f..de61374e36bd 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -170,7 +170,7 @@ impl Queue {
>      pub unsafe fn from_raw<'a>(ptr: *const bindings::workqueue_struct) -=
> &'a Queue {
>          // SAFETY: The `Queue` type is `#[repr(transparent)]`, so the po=
inter cast is valid. The
>          // caller promises that the pointer is not dangling.
> -        unsafe { &*(ptr as *const Queue) }
> +        unsafe { &*ptr.cast::<Queue>() }
>      }
>
>      /// Enqueues a work item.
> @@ -522,7 +522,7 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for=
 Arc<T>
>  {
>      unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
>          // The `__enqueue` method always uses a `work_struct` stored in =
a `Work<T, ID>`.
> -        let ptr =3D ptr as *mut Work<T, ID>;
> +        let ptr =3D ptr.cast::<Work<T, ID>>();
>          // SAFETY: This computes the pointer that `__enqueue` got from `=
Arc::into_raw`.
>          let ptr =3D unsafe { T::work_container_of(ptr) };
>          // SAFETY: This pointer comes from `Arc::into_raw` and we've bee=
n given back ownership.
> @@ -575,7 +575,7 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for=
 Pin<KBox<T>>
>  {
>      unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
>          // The `__enqueue` method always uses a `work_struct` stored in =
a `Work<T, ID>`.
> -        let ptr =3D ptr as *mut Work<T, ID>;
> +        let ptr =3D ptr.cast::<Work<T, ID>>();
>          // SAFETY: This computes the pointer that `__enqueue` got from `=
Arc::into_raw`.
>          let ptr =3D unsafe { T::work_container_of(ptr) };
>          // SAFETY: This pointer comes from `Arc::into_raw` and we've bee=
n given back ownership.
> diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
> index c98d7a8cde77..e79a1f49f055 100644
> --- a/rust/uapi/lib.rs
> +++ b/rust/uapi/lib.rs
> @@ -14,6 +14,7 @@
>  #![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
>  #![allow(
>      clippy::all,
> +    clippy::ptr_as_ptr,
>      clippy::undocumented_unsafe_blocks,
>      dead_code,
>      missing_docs,
>
> --
> 2.49.0
>
