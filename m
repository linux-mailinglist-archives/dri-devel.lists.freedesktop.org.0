Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167A4AB3AD1
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 16:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978CE10E061;
	Mon, 12 May 2025 14:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QSZ4tpzW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCAE10E061
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 14:39:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7745443A31;
 Mon, 12 May 2025 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747060784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aM1v4U1a1/ASKjXc7BNzwLpkA22VNOOeeJMHgxawxwQ=;
 b=QSZ4tpzW4ODaR7UwOrF40QzhFdNkWbiC3GTWp/RZeXq9mdg4BKO7dU18otExNWzEgBFPno
 BJX3H/4uDWBPdetm5frvy+te57P7odkq6XOnZ+h0JSA7Ut+OD4AiUI6n25fuAJAtYIgXqZ
 n4hArPHW1yvW0VkZLuHfQuhUYs8k5ZBwYoG5AIWZfkLxSOC01RBuM4kqofAOlXExOWujAM
 meVFGsoTxLijMYBNUWmq+6M9h9K2A617uGhCEt7K1h/A8DpqGxYTaviRIWLl4lh80TYYA8
 B2u0KdvWqd2xj6qgSPEVVspVzM4bbm5MT8MAkHKReXCnw2qHHsckPXIO0hsfvA==
Message-ID: <d3757c9f-b7f3-4469-8eb9-4c0aecd833d1@bootlin.com>
Date: Mon, 12 May 2025 16:39:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [RFC v3 04/33] rust: drm/kms: Add drm_connector bindings
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com,
 Alice Ryhl <aliceryhl@google.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <sima@ffwll.ch>, Daniel Almeida
 <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250305230406.567126-1-lyude@redhat.com>
 <20250305230406.567126-5-lyude@redhat.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250305230406.567126-5-lyude@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfhuffvvehfjggtgfesthejredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetudehheegkeethffglefgveduleeuheetjeehheekhfehieejvedugfefuedtteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtoheplhihuhguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepmhgtrghnrghlsehighgrlhhirgdrtghomhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsihhmrgesfhhffihllhdrtghh
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 05/03/25 - 17:59, Lyude Paul wrote:

> +
> +// SAFETY: DRM connectors are refcounted mode objects
> +unsafe impl<T: DriverConnector> RcModeObject for Connector<T> {}
> +
> +// SAFETY:
> +// * Via our type variants our data layout starts with `drm_connector`
> +// * Since we don't expose `Connector` to users before it has been initialized, this and our data
> +//   layout ensure that `as_raw()` always returns a valid pointer to a `drm_connector`.
> +unsafe impl<T: DriverConnector> AsRawConnector for Connector<T> {
> +    fn as_raw(&self) -> *mut bindings::drm_connector {
> +        self.connector.get()
> +    }
> +
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_connector) -> &'a Self {
> +        // SAFETY: Our data layout starts with `bindings::drm_connector`
> +        unsafe { &*ptr.cast() }

I think you should use container_of macro here. It is functionnaly the 
same thing, but it may avoid issue if for whatever reason the ->base is 
not at the exact same address. This will make this function "symetrical" 
with as_raw.

Ditto for the next patch

> +    }
> +}
> +
> +// SAFETY: We only expose this object to users directly after KmsDriver::create_objects has been
> +// called.
> +unsafe impl<T: DriverConnector> ModesettableConnector for Connector<T> {
> +    type State = ConnectorState<T::State>;
> +}
> +
> +/// A [`Connector`] that has not yet been registered with userspace.
> +///
> +/// KMS registration is single-threaded, so this object is not thread-safe.
> +///
> +/// # Invariants
> +///
> +/// - This object can only exist before its respective KMS device has been registered.
> +/// - Otherwise, it inherits all invariants of [`Connector`] and has an identical data layout.

To garantee a data layout, don't you need to add #[repr(transparent)]? 
This will automatically break the compilation if one day NotThreadSafe 
is not ZST.

> +pub struct UnregisteredConnector<T: DriverConnector>(Connector<T>, NotThreadSafe);
> +
> +// SAFETY: We share the invariants of `Connector`
> +unsafe impl<T: DriverConnector> AsRawConnector for UnregisteredConnector<T> {
> +    fn as_raw(&self) -> *mut bindings::drm_connector {
> +        self.0.as_raw()
> +    }
> +
> +    unsafe fn from_raw<'a>(ptr: *mut bindings::drm_connector) -> &'a Self {
> +        // SAFETY: This is another from_raw() call, so this function shares the same safety contract
> +        let connector = unsafe { Connector::<T>::from_raw(ptr) };
> +
> +        // SAFETY: Our data layout is identical via our type invariants.
> +        unsafe { mem::transmute(connector) }

IIRC, to be able to transmute, you need to add some #[repr] on the 
types, so rust is forced to use a "fixed" layout. See above, I think you 
need to add at least repr(transparent) for UnregisteredConnector

> +    }
> +}
> +
> +impl<T: DriverConnector> Deref for UnregisteredConnector<T> {
> +    type Target = T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0.inner
> +    }
> +}
> +
> +impl<T: DriverConnector> UnregisteredConnector<T> {
> +    /// Construct a new [`UnregisteredConnector`].
> +    ///
> +    /// A driver may use this to create new [`UnregisteredConnector`] objects.
> +    ///
> +    /// [`KmsDriver::create_objects`]: kernel::drm::kms::KmsDriver::create_objects
> +    pub fn new<'a>(
> +        dev: &'a UnregisteredKmsDevice<'a, T::Driver>,
> +        type_: Type,
> +        args: T::Args,
> +    ) -> Result<&'a Self> {
> +        let new: Pin<KBox<Connector<T>>> = KBox::try_pin_init(
> +            try_pin_init!(Connector::<T> {
> +                connector: Opaque::new(bindings::drm_connector {
> +                    helper_private: &T::OPS.helper_funcs,
> +                    ..Default::default()
> +                }),
> +                inner <- T::new(dev, args),
> +                _p: PhantomPinned
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        // SAFETY:
> +        // - `dev` will hold a reference to the new connector, and thus outlives us.
> +        // - We just allocated `new` above
> +        // - `new` starts with `drm_connector` via its type invariants.

Why do you need to add the third requirement here? This is not part of 
the drm_connector_init requirement. It only requires to have a valid 
pointer.
> +        to_result(unsafe {
> +            bindings::drm_connector_init(dev.as_raw(), new.as_raw(), &T::OPS.funcs, type_ as i32)
> +        })?;
> +
> +        // SAFETY: We don't move anything
> +        let this = unsafe { Pin::into_inner_unchecked(new) };
> +
> +        // We'll re-assemble the box in connector_destroy_callback()
> +        let this = KBox::into_raw(this);
> +
> +        // UnregisteredConnector has an equivalent data layout
> +        let this: *mut Self = this.cast();
> +
> +        // SAFETY: We just allocated the connector above, so this pointer must be valid
> +        Ok(unsafe { &*this })
> +    }
> +}
> +
> +unsafe extern "C" fn connector_destroy_callback<T: DriverConnector>(
> +    connector: *mut bindings::drm_connector,
> +) {
> +    // SAFETY: DRM guarantees that `connector` points to a valid initialized `drm_connector`.
> +    unsafe {
> +        bindings::drm_connector_unregister(connector);
> +        bindings::drm_connector_cleanup(connector);
> +    };
> +
> +    // SAFETY:
> +    // - We originally created the connector in a `Box`
> +    // - We are guaranteed to hold the last remaining reference to this connector
> +    // - This cast is safe via `DriverConnector`s type invariants.
> +    drop(unsafe { KBox::from_raw(connector as *mut Connector<T>) });
> +}
> +
> +// SAFETY: DRM expects this struct to be zero-initialized
> +unsafe impl Zeroable for bindings::drm_connector_state {}
> +
> +/// A trait implemented by any type which can produce a reference to a
> +/// [`struct drm_connector_state`].
> +///
> +/// This is implemented internally by DRM.
> +///
> +/// [`struct drm_connector_state`]: srctree/include/drm/drm_connector.h
> +pub trait AsRawConnectorState: private::AsRawConnectorState {
> +    /// The type that represents this connector state's DRM connector.
> +    type Connector: AsRawConnector;
> +}
> +
> +pub(super) mod private {
> +    use super::*;
> +
> +    /// Trait for retrieving references to the base connector state contained within any connector
> +    /// state compatible type
> +    #[allow(unreachable_pub)]
> +    pub trait AsRawConnectorState {
> +        /// Return an immutable reference to the raw connector state.
> +        fn as_raw(&self) -> &bindings::drm_connector_state;
> +
> +        /// Get a mutable reference to the raw [`struct drm_connector_state`] contained within this
> +        /// type.
> +        ///
> +        ///
> +        /// # Safety
> +        ///
> +        /// The caller promises this mutable reference will not be used to modify any contents of
> +        /// [`struct drm_connector_state`] which DRM would consider to be static - like the
> +        /// backpointer to the DRM connector that owns this state. This also means the mutable
> +        /// reference should never be exposed outside of this crate.
> +        ///
> +        /// [`struct drm_connector_state`]: srctree/include/drm/drm_connector.h
> +        unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_connector_state;
> +    }
> +}
> +
> +pub(super) use private::AsRawConnectorState as AsRawConnectorStatePrivate;
> +
> +/// A trait implemented for any type which can be constructed directly from a
> +/// [`struct drm_connector_state`] pointer.
> +///
> +/// This is implemented internally by DRM.
> +///
> +/// [`struct drm_connector_state`]: srctree/include/drm/drm_connector.h
> +pub trait FromRawConnectorState: AsRawConnectorState {
> +    /// Get an immutable reference to this type from the given raw [`struct drm_connector_state`]
> +    /// pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - The caller guarantees `ptr` is contained within a valid instance of `Self`.
> +    /// - The caller guarantees that `ptr` cannot not be modified for the lifetime of `'a`.
> +    ///
> +    /// [`struct drm_connector_state`]: srctree/include/drm/drm_connector.h
> +    unsafe fn from_raw<'a>(ptr: *const bindings::drm_connector_state) -> &'a Self;
> +
> +    /// Get a mutable reference to this type from the given raw [`struct drm_connector_state`]
> +    /// pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - The caller guarantees that `ptr` is contained within a valid instance of `Self`.
> +    /// - The caller guarantees that `ptr` cannot have any other references taken out for the
> +    ///   lifetime of `'a`.
> +    ///
> +    /// [`struct drm_connector_state`]: srctree/include/drm/drm_connector.h
> +    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_connector_state) -> &'a mut Self;
> +}
> +
> +/// The main interface for a [`struct drm_connector_state`].
> +///
> +/// This type is the main interface for dealing with the atomic state of DRM connectors. In
> +/// addition, it allows access to whatever private data is contained within an implementor's
> +/// [`DriverConnectorState`] type.
> +///
> +/// # Invariants
> +///
> +/// - The DRM C API and our interface guarantees that only the user has mutable access to `state`,
> +///   up until [`drm_atomic_helper_commit_hw_done`] is called. Therefore, `connector` follows rust's
> +///   data aliasing rules and does not need to be behind an [`Opaque`] type.
> +/// - `state` and `inner` initialized for as long as this object is exposed to users.
> +/// - The data layout of this structure begins with [`struct drm_connector_state`].
> +/// - The connector for this atomic state can always be assumed to be of type
> +///   [`Connector<T::Connector>`].
> +///
> +/// [`struct drm_connector_state`]: srctree/include/drm/drm_connector.h
> +/// [`drm_atomic_helper_commit_hw_done`]: srctree/include/drm/drm_atomic_helper.h
> +#[derive(Default)]
> +#[repr(C)]
> +pub struct ConnectorState<T: DriverConnectorState> {
> +    state: bindings::drm_connector_state,
> +    inner: T,
> +}
> +
> +/// The main trait for implementing the [`struct drm_connector_state`] API for a [`Connector`].
> +///
> +/// A driver may store driver-private data within the implementor's type, which will be available
> +/// when using a full typed [`ConnectorState`] object.
> +///
> +/// # Invariants
> +///
> +/// - Any C FFI callbacks generated using this trait are guaranteed that passed-in
> +///   [`struct drm_connector`] pointers are contained within a [`Connector<Self::Connector>`].
> +/// - Any C FFI callbacks generated using this trait are guaranteed that passed-in
> +///   [`struct drm_connector_state`] pointers are contained within a [`ConnectorState<Self>`].
> +///
> +/// [`struct drm_connector`]: srctree/include/drm_connector.h
> +/// [`struct drm_connector_state`]: srctree/include/drm_connector.h
> +pub trait DriverConnectorState: Clone + Default + Sized {
> +    /// The parent [`DriverConnector`].
> +    type Connector: DriverConnector;
> +}
> +
> +impl<T: DriverConnectorState> Sealed for ConnectorState<T> {}
> +
> +impl<T: DriverConnectorState> AsRawConnectorState for ConnectorState<T> {
> +    type Connector = Connector<T::Connector>;
> +}
> +
> +impl<T: DriverConnectorState> private::AsRawConnectorState for ConnectorState<T> {
> +    fn as_raw(&self) -> &bindings::drm_connector_state {
> +        &self.state
> +    }
> +
> +    unsafe fn as_raw_mut(&mut self) -> &mut bindings::drm_connector_state {
> +        &mut self.state
> +    }
> +}
> +
> +impl<T: DriverConnectorState> FromRawConnectorState for ConnectorState<T> {
> +    unsafe fn from_raw<'a>(ptr: *const bindings::drm_connector_state) -> &'a Self {
> +        // Our data layout starts with `bindings::drm_connector_state`.
> +        let ptr: *const Self = ptr.cast();

As for the connector, I think this is a bit safer to use container_of.
And what is the rule about unsafe in unsafe function? I think this 
casting is unsafe, but you did not add the unsafe block around it.

> +
> +        // SAFETY:
> +        // - Our safety contract requires that `ptr` be contained within `Self`.
> +        // - Our safety contract requires the caller ensure that it is safe for us to take an
> +        //   immutable reference.
> +        unsafe { &*ptr }
> +    }
> +
> +    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::drm_connector_state) -> &'a mut Self {
> +        // Our data layout starts with `bindings::drm_connector_state`.
> +        let ptr: *mut Self = ptr.cast();
> +
> +        // SAFETY:
> +        // - Our safety contract requires that `ptr` be contained within `Self`.
> +        // - Our safety contract requires the caller ensure it is safe for us to take a mutable
> +        //   reference.
> +        unsafe { &mut *ptr }
> +    }
> +}
> +
> +unsafe extern "C" fn atomic_duplicate_state_callback<T: DriverConnectorState>(
> +    connector: *mut bindings::drm_connector,
> +) -> *mut bindings::drm_connector_state {
> +    // SAFETY: DRM guarantees that `connector` points to a valid initialized `drm_connector`.
> +    let state = unsafe { (*connector).state };
> +    if state.is_null() {
> +        return null_mut();
> +    }
> +
> +    // SAFETY:
> +    // - We just verified that `state` is non-null
> +    // - This cast is guaranteed to be safe via our type invariants.
> +    let state = unsafe { ConnectorState::<T>::from_raw(state) };
> +
> +    let new = Box::try_init(
> +        try_init!(ConnectorState::<T> {
> +            state: bindings::drm_connector_state {
> +                ..Default::default()
> +            },
> +            inner: state.inner.clone()
> +        }),
> +        GFP_KERNEL,
> +    );
> +
> +    if let Ok(mut new) = new {
> +        // SAFETY:
> +        // - `new` provides a valid pointer to a newly allocated `drm_plane_state` via type

s/plane/connector/

> +        //   invariants
> +        // - This initializes `new` via memcpy()
> +        unsafe {
> +            bindings::__drm_atomic_helper_connector_duplicate_state(connector, new.as_raw_mut())
> +        };
> +
> +        KBox::into_raw(new).cast()
> +    } else {
> +        null_mut()
> +    }
> +}
> +
> +unsafe extern "C" fn atomic_destroy_state_callback<T: DriverConnectorState>(
> +    _connector: *mut bindings::drm_connector,
> +    connector_state: *mut bindings::drm_connector_state,
> +) {
> +    // SAFETY: DRM guarantees that `state` points to a valid instance of `drm_connector_state`
> +    unsafe { bindings::__drm_atomic_helper_connector_destroy_state(connector_state) };
> +
> +    // SAFETY:
> +    // - DRM guarantees we are the only one with access to this `drm_connector_state`
> +    // - This cast is safe via our type invariants.
> +    drop(unsafe { KBox::from_raw(connector_state.cast::<ConnectorState<T>>()) });
> +}
> +
> +unsafe extern "C" fn connector_reset_callback<T: DriverConnectorState>(
> +    connector: *mut bindings::drm_connector,
> +) {
> +    // SAFETY: DRM guarantees that `state` points to a valid instance of `drm_connector_state`
> +    let state = unsafe { (*connector).state };
> +    if !state.is_null() {
> +        // SAFETY:
> +        // - We're guaranteed `connector` is `Connector<T>` via type invariants
> +        // - We're guaranteed `state` is `ConnectorState<T>` via type invariants.
> +        unsafe { atomic_destroy_state_callback::<T>(connector, state) }
> +
> +        // SAFETY: No special requirements here, DRM expects this to be NULL
> +        unsafe { (*connector).state = null_mut() };
> +    }
> +
> +    // Unfortunately, this is the best we can do at the moment as this FFI callback was mistakenly
> +    // presumed to be infallible :(
> +    let new = KBox::new(ConnectorState::<T>::default(), GFP_KERNEL).expect("Blame the API, sorry!");
> +
> +    // DRM takes ownership of the state from here, resets it, and then assigns it to the connector
> +    // SAFETY:
> +    // - DRM guarantees that `connector` points to a valid instance of `drm_connector`.
> +    // - The cast to `drm_connector_state` is safe via `ConnectorState`s type invariants.
> +    unsafe { bindings::__drm_atomic_helper_connector_reset(connector, Box::into_raw(new).cast()) };
> +}
> -- 
> 2.48.1
> 
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
