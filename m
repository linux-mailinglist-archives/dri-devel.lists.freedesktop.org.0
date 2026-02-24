Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INC/IkpVnWk2OgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:37:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D20CE1831D2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6969710E4CD;
	Tue, 24 Feb 2026 07:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="fsHu8mTf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C4210E4CD
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:37:41 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4806cfffca6so47566445e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771918660; x=1772523460;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :f2079rom:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ccaw3Qp4EtXU0xb2rrWk95YgoDmXX+bj8GIv5SpCaTk=;
 b=fsHu8mTfz6YlZSNwGdEbef6XHtEwTh3U183G6wXqOTCmJsd36s6ZtNYikVbLkIyaF8
 iP0MTQD+OTZVe6JDn6cqmCT82DYhvoHctcy3ti9mDZ71LDLzjjYJx9JZyH3d21PYb6b+
 lxMaNz+sOLViIlmLvN09oJYcgz8V4MuFwxlBkhXpnWx+8tkUSycUZmAS+GpdMOS80k+a
 u71qdjx/iMqFXqNAgzpvGEYSPbrxJkEOJIZRwzMljHeekz5ok8lf1OkAld1QJ0Dmoo2V
 OSdIHMrDldWeX4NA5U/juZTqtRFcQvAOSNtURTujyo5E3Vo/V4QE5Qhqv8zmhSVxxbb4
 Ge0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771918660; x=1772523460;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :f2079rom:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ccaw3Qp4EtXU0xb2rrWk95YgoDmXX+bj8GIv5SpCaTk=;
 b=aUv1NDhbTXQI1JSkBZXQdkZnG8xIQcrV6PzO0yn0Wv++xJUzE1vihXswjxnCWqnn4F
 O1nSGlvzCFhIbAlwV+00BGDcRlGW5Rd50LZVnJXJTH5Y7r05VT39kL3MZPoPm2AmdXlG
 DJtDLgcfQVV+Xve9JUF1D9DuaERIqzHGNaY4qLZyr8VHIpdHPHgZrZKMpkuyFkGTY1ka
 ehjNwLEr46hDV7w0KyWNT8SkMS3vZbkFIEx+teCoiizSqUMbU+Cn7Ph27nmdSSTS67bo
 b1mLMrhXCe8XwaBoxf417ahG5rvXv1zDZMYqHGwkbiCVP4zb5yg6CE4eppX1+QYjCMrS
 hi7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsMxV84VFwhQ+S4BoujfWkhLA840GudTYNQw9riBCgVzNfJNcG1hMzUjXwsCQshaqV7oo5FGC2+WQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqiC3wpI+CPxyCMPUHThqhrC5Mlw6tKD3WXwSdgKCxUALs+acK
 TcXzh+s6+tZxR92clyGYvGFODzLS3nprjyY3Xglil73WrKNeNNRZcf0u5abjWu+VRCUhrjEay3Z
 OYpzlkCfU0gKqRnxBrA==
X-Received: from wmxb5-n2.prod.google.com
 ([2002:a05:600d:8445:20b0:483:43dc:999f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:674f:b0:483:6ff1:18b with SMTP id
 5b1f17b1804b1-483a9555bafmr189459985e9.0.1771918659820; 
 Mon, 23 Feb 2026 23:37:39 -0800 (PST)
Date: Tue, 24 Feb 2026 07:37:38 +0000
F2079rom: Alice Ryhl <aliceryhl@google.com>
In-Reply-To: <87wm0333qt.fsf@t14s.mail-host-address-is-not-set>
Mime-Version: 1.0
References: <20260220-unique-ref-v15-0-893ed86b06cc@kernel.org>
 <20260220-unique-ref-v15-1-893ed86b06cc@kernel.org>
 <aZg44EmMWKK-z5KP@google.com>
 <87wm0333qt.fsf@t14s.mail-host-address-is-not-set>
Message-ID: <aZ1VQmtapuoerpVo@google.com>
Subject: Re: [PATCH v15 1/9] rust: types: Add Ownable/Owned types
From: <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Paul Moore <paul@paul-moore.com>, 
 Serge Hallyn <sergeh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Igor Korotin <igor.korotin.linux@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>,
 Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-security-module@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
 linux-pci@vger.kernel.org, Asahi Lina <lina+kernel@asahilina.net>, 
 Oliver Mangold <oliver.mangold@pm.me>
Content-Type: text/plain; charset="utf-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [9.19 / 15.00];
	URIBL_BLACK(7.50)[types.rs:url];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[google.com:s=20230601];
	FORGED_RECIPIENTS(0.00)[m:a.hindborg@kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:lina+kernel@asahilina.net,m:oliver.mangold@pm.me,m:igorkorotinlinux@gmail.com,m:lina@asah
 ilina.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,intel.com,paul-moore.com,gmail.com,ffwll.ch,zeniv.linux.org.uk,suse.cz,collabora.com,oracle.com,ti.com,google.com,vger.kernel.org,lists.freedesktop.org,kvack.org,asahilina.net,pm.me];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.656];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[google.com,reject];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,types.rs:url,collabora.com:email]
X-Rspamd-Queue-Id: D20CE1831D2
X-Rspamd-Action: add header
X-Spam: Yes

On Mon, Feb 23, 2026 at 03:59:22PM +0100, Andreas Hindborg wrote:
> Alice Ryhl <aliceryhl@google.com> writes:
> 
> > On Fri, Feb 20, 2026 at 10:51:10AM +0100, Andreas Hindborg wrote:
> >> From: Asahi Lina <lina+kernel@asahilina.net>
> >> 
> >> By analogy to `AlwaysRefCounted` and `ARef`, an `Ownable` type is a
> >> (typically C FFI) type that *may* be owned by Rust, but need not be. Unlike
> >> `AlwaysRefCounted`, this mechanism expects the reference to be unique
> >> within Rust, and does not allow cloning.
> >> 
> >> Conceptually, this is similar to a `KBox<T>`, except that it delegates
> >> resource management to the `T` instead of using a generic allocator.
> >> 
> >> [ om:
> >>   - Split code into separate file and `pub use` it from types.rs.
> >>   - Make from_raw() and into_raw() public.
> >>   - Remove OwnableMut, and make DerefMut dependent on Unpin instead.
> >>   - Usage example/doctest for Ownable/Owned.
> >>   - Fixes to documentation and commit message.
> >> ]
> >> 
> >> Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net/
> >> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> >> Co-developed-by: Oliver Mangold <oliver.mangold@pm.me>
> >> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> >> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> >> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> >> [ Andreas: Updated documentation, examples, and formatting ]
> >> Reviewed-by: Gary Guo <gary@garyguo.net>
> >> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> >> +///         let result = NonNull::new(KBox::into_raw(result))
> >> +///             .expect("Raw pointer to newly allocation KBox is null, this should never happen.");
> >
> > KBox should probably have an into_raw_nonnull().
> 
> I can add that.
> 
> >
> >> +///    let foo = Foo::new().expect("Failed to allocate a Foo. This shouldn't happen");
> >> +///    assert!(*FOO_ALLOC_COUNT.lock() == 1);
> >
> > Use ? here.
> 
> Ok.
> 
> >
> >> +/// }
> >> +/// // `foo` is out of scope now, so we expect no live allocations.
> >> +/// assert!(*FOO_ALLOC_COUNT.lock() == 0);
> >> +/// ```
> >> +pub unsafe trait Ownable {
> >> +    /// Releases the object.
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// Callers must ensure that:
> >> +    /// - `this` points to a valid `Self`.
> >> +    /// - `*this` is no longer used after this call.
> >> +    unsafe fn release(this: NonNull<Self>);
> >
> > Honestly, not using it after this call may be too strong. I can imagine
> > wanting a value where I have both an ARef<_> and Owned<_> reference to
> > something similar to the existing Arc<_>/ListArc<_> pattern, and in that
> > case the value may in fact be accessed after this call if you still have
> > an ARef<_>.
> 
> I do not understand your use case.
> 
> You are not supposed to have both an `ARef` and an `Owned` at the same
> time. The `Owned` is to `ARef` what `UniqueArc` is to `Arc`. It is
> supposed to be unique and no `ARef` can be live while the `Owned` is
> live.
> 
> A `ListArc` is "at most one per list link" and it takes a refcount on
> the object by owning an `Arc`. As far as I recall, it does not provide
> mutable access to anything but the list link. To me, that is a very
> different situation.

I mean, even Page is kind of an example like that.

Pages are refcounted, but when you have a higher-order page, the
__free_pages() call does something special beyond what put_page(). For
example, if you have an order-2 page, which consists of 4 pages, then
the refcount only keeps the first page alive, and __free_pages() frees
the 3 extra pages right away even if refcount is still non-zero. The
first page then stays alive until the last put_page() is called.

> > If you modify Owned<_> invariants and Owned::from_raw() safety
> > requirements along the lines of what I say below, then this could just
> > say that the caller must have permission to call this function. The
> > concrete implementer can specify what that means more directly, but here
> > all it means is that a prior call to Owned::from_raw() promised to give
> > you permission to call it.
> 
> I don't think we need the "permission" wording. How about this:
> 
> 
> /// A mutable reference to an owned `T`.
> ///
> /// The [`Ownable`] is automatically freed or released when an instance of [`Owned`] is
> /// dropped.
> ///
> /// # Invariants
> ///
> /// - Until `T::release` is called, this `Owned<T>` exclusively owns the underlying `T`.
> /// - The `T` value is pinned.
> pub struct Owned<T: Ownable> {...}
> 
> 
> impl<T: Ownable> Owned<T> {
>     /// Creates a new instance of [`Owned`].
>     ///
>     /// This function takes over ownership of the underlying object.
>     ///
>     /// # Safety
>     ///
>     /// Callers must ensure that:
>     /// - `ptr` points to a valid instance of `T`.
>     /// - Until `T::release` is called, the returned `Owned<T>` exclusively owns the underlying `T`.
>     pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {...}
> }
> 
> pub trait Ownable {
>     /// Tear down this `Ownable`.
>     ///
>     /// Implementers of `Ownable` can use this function to clean up the use of `Self`. This can
>     /// include freeing the underlying object.
>     ///
>     /// # Safety
>     ///
>     /// Callers must ensure that the caller has exclusive ownership of `T`, and this ownership can
>     /// be transferred to the `release` method.
>     unsafe fn release(&mut self);
> }
> 
> 
> Note `Ownable` not being an unsafe trait.

It looks ok but see my above reply.

> >> +/// A mutable reference to an owned `T`.
> >> +///
> >> +/// The [`Ownable`] is automatically freed or released when an instance of [`Owned`] is
> >> +/// dropped.
> >> +///
> >> +/// # Invariants
> >> +///
> >> +/// - The [`Owned<T>`] has exclusive access to the instance of `T`.
> >> +/// - The instance of `T` will stay alive at least as long as the [`Owned<T>`] is alive.
> >> +pub struct Owned<T: Ownable> {
> >> +    ptr: NonNull<T>,
> >> +}
> >
> > I think some more direct and less fuzzy invariants would be:
> >
> > - This `Owned<T>` holds permissions to call `T::release()` on the value once.
> > - Until `T::release()` is called, this `Owned<T>` may perform mutable access on the `T`.
> 
> I do not like the wording for mutable access. Formulating safety
> requirements for `from_raw` and safety comments for that function
> becomes convoluted like this. I'd rather formulate the
> access capability in terms of ownership;
> 
>  - Until `T::release()` is called, this `Owned<T>` exclusively owns the
>    underlying `T`.
> 
> How is that?
> 
> > - The `T` value is pinned.
> 
> I am unsure about the pinning terminology. If we say that `T` is pinned,
> does this mean that it will never move, even if `T: Unpin`? Or is it
> implied that `T` may move if it is `Unpin`?

Values that are `Unpin` can always move - pinning is a no-op for them.

Alice
