Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEYFHeg4mGkSDQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 11:35:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EE2166DBB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 11:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C181A10E010;
	Fri, 20 Feb 2026 10:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="G97tDMMG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777E710E010
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 10:35:15 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-483786a09b1so17124965e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 02:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771583714; x=1772188514;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=SuBBZbTgNeFNGP2KTDBOL9VXYwpq19RWtpTtqUl4jLA=;
 b=G97tDMMGkZMeXDcHJiLPJMyt+NZ6s0FmMlcSTwabI+ArSXYK9gGXP83gCSr+41f9sJ
 CCce4hGLe+TKCNph+14qG3YzN6SS0GMilDXXddB+OqYwfH8n2NRW4eJU/NGb+8T1NSRO
 KFtii+qHqpVU/X2B1W+1VgtIgW2CJJTJM4fUy9xsOp/mTpQUVTZG5ryYNhuy9eux7Xhq
 MXTfmd5O5VJQc6hbLoa65q6O0rND01p5cUx59eX+FSDylYfFEdbdvu2wvgxdDMvyWvtz
 i8vRna1H+YHzTLfkc/m/ozLSw5whoLHDTL6d8UJO+5lH12SJTR9tlVj9BPkD6jYzRtHu
 o4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771583714; x=1772188514;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SuBBZbTgNeFNGP2KTDBOL9VXYwpq19RWtpTtqUl4jLA=;
 b=BNWBDtHrBV7fqQwLS2Qcr6jibA9VXORUhmF6655DhDDTyYcRng64jRlkWPT5fmWNP1
 bL9K6iV8gy4oooeEu8HMylm/ZtgCoAmcz87TvdK69nBqitV8nZeKPX2TqcMuTK2snNqd
 VAWkvnN43BWWvF4cttiGBehSr0UgNam71H+KHjAYRiUK2NXxTiYsOlBjscQSvUHbHgqn
 KPa+mapHVHWPr+RVHnBIwy9lpHd5Eq+J7W/LcRKTP+SQKQnOEBX0bE9g0gLoH9wyrGaa
 gL83pY27DdkEIH8ikGp3byD+WJL4m+XVg2ugk/8M7qtNPo4AbavMY80N/msiHWy0mcOB
 OMrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXPPtezEA5HAui2QgmzOx20DDTqLTxeph4epqAMoX+074+Z24sE1m3qKqGvBopZuwEZTi8j+Ja42Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpUnMZTKghQKiKcl46dA/f9THnJTqEKv20H3uzaYbryWN/A749
 mmvITcJKEQp7fQNgtLm48z35in9H3LKwe3ctoriaGBh/L3Nb825KpUmeq6WVW9Vxfsmbeov5WjF
 1wJEHAdiAn0B+d8Mozg==
X-Received: from wmbdr17.prod.google.com
 ([2002:a05:600c:6091:b0:480:4a03:7b73])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b26:b0:465:a51d:d4 with SMTP id
 5b1f17b1804b1-48398a47222mr123364405e9.6.1771583713704; 
 Fri, 20 Feb 2026 02:35:13 -0800 (PST)
Date: Fri, 20 Feb 2026 10:35:12 +0000
In-Reply-To: <20260220-unique-ref-v15-1-893ed86b06cc@kernel.org>
Mime-Version: 1.0
References: <20260220-unique-ref-v15-0-893ed86b06cc@kernel.org>
 <20260220-unique-ref-v15-1-893ed86b06cc@kernel.org>
Message-ID: <aZg44EmMWKK-z5KP@google.com>
Subject: Re: [PATCH v15 1/9] rust: types: Add Ownable/Owned types
From: Alice Ryhl <aliceryhl@google.com>
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
	FORGED_RECIPIENTS(0.00)[m:a.hindborg@kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:lina+kernel@asahilina.net,m:oliver.mangold@pm.me,m:igorkorotinlinux@gmail.com,m:lina@asah
 ilina.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[google.com:s=20230601];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[40];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,intel.com,paul-moore.com,gmail.com,ffwll.ch,zeniv.linux.org.uk,suse.cz,collabora.com,oracle.com,ti.com,google.com,vger.kernel.org,lists.freedesktop.org,kvack.org,asahilina.net,pm.me];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DMARC_POLICY_ALLOW(0.00)[google.com,reject];
	NEURAL_HAM(-0.00)[-0.664];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[types.rs:url,pm.me:email,collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B4EE2166DBB
X-Rspamd-Action: add header
X-Spam: Yes

On Fri, Feb 20, 2026 at 10:51:10AM +0100, Andreas Hindborg wrote:
> From: Asahi Lina <lina+kernel@asahilina.net>
> 
> By analogy to `AlwaysRefCounted` and `ARef`, an `Ownable` type is a
> (typically C FFI) type that *may* be owned by Rust, but need not be. Unlike
> `AlwaysRefCounted`, this mechanism expects the reference to be unique
> within Rust, and does not allow cloning.
> 
> Conceptually, this is similar to a `KBox<T>`, except that it delegates
> resource management to the `T` instead of using a generic allocator.
> 
> [ om:
>   - Split code into separate file and `pub use` it from types.rs.
>   - Make from_raw() and into_raw() public.
>   - Remove OwnableMut, and make DerefMut dependent on Unpin instead.
>   - Usage example/doctest for Ownable/Owned.
>   - Fixes to documentation and commit message.
> ]
> 
> Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net/
> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> Co-developed-by: Oliver Mangold <oliver.mangold@pm.me>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> [ Andreas: Updated documentation, examples, and formatting ]
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

> +///         let result = NonNull::new(KBox::into_raw(result))
> +///             .expect("Raw pointer to newly allocation KBox is null, this should never happen.");

KBox should probably have an into_raw_nonnull().

> +///    let foo = Foo::new().expect("Failed to allocate a Foo. This shouldn't happen");
> +///    assert!(*FOO_ALLOC_COUNT.lock() == 1);

Use ? here.

> +/// }
> +/// // `foo` is out of scope now, so we expect no live allocations.
> +/// assert!(*FOO_ALLOC_COUNT.lock() == 0);
> +/// ```
> +pub unsafe trait Ownable {
> +    /// Releases the object.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that:
> +    /// - `this` points to a valid `Self`.
> +    /// - `*this` is no longer used after this call.
> +    unsafe fn release(this: NonNull<Self>);

Honestly, not using it after this call may be too strong. I can imagine
wanting a value where I have both an ARef<_> and Owned<_> reference to
something similar to the existing Arc<_>/ListArc<_> pattern, and in that
case the value may in fact be accessed after this call if you still have
an ARef<_>.

If you modify Owned<_> invariants and Owned::from_raw() safety
requirements along the lines of what I say below, then this could just
say that the caller must have permission to call this function. The
concrete implementer can specify what that means more directly, but here
all it means is that a prior call to Owned::from_raw() promised to give
you permission to call it.

> +/// A mutable reference to an owned `T`.
> +///
> +/// The [`Ownable`] is automatically freed or released when an instance of [`Owned`] is
> +/// dropped.
> +///
> +/// # Invariants
> +///
> +/// - The [`Owned<T>`] has exclusive access to the instance of `T`.
> +/// - The instance of `T` will stay alive at least as long as the [`Owned<T>`] is alive.
> +pub struct Owned<T: Ownable> {
> +    ptr: NonNull<T>,
> +}

I think some more direct and less fuzzy invariants would be:

- This `Owned<T>` holds permissions to call `T::release()` on the value once.
- Until `T::release()` is called, this `Owned<T>` may perform mutable access on the `T`.
- The `T` value is pinned.

> +    /// Get a pinned mutable reference to the data owned by this `Owned<T>`.
> +    pub fn as_pin_mut(&mut self) -> Pin<&mut T> {
> +        // SAFETY: The type invariants guarantee that the object is valid, and that we can safely
> +        // return a mutable reference to it.
> +        let unpinned = unsafe { self.ptr.as_mut() };
> +
> +        // SAFETY: We never hand out unpinned mutable references to the data in
> +        // `Self`, unless the contained type is `Unpin`.
> +        unsafe { Pin::new_unchecked(unpinned) }

I'd prefer if "pinned" was a type invariant, rather than make an
argument about what kind of APIs exist.

> +impl<T: Ownable + Unpin> DerefMut for Owned<T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        // SAFETY: The type invariants guarantee that the object is valid, and that we can safely
> +        // return a mutable reference to it.
> +        unsafe { self.ptr.as_mut() }

Surely this safety comment should say something about pinning.

Alice
