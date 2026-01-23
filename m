Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CDVAk2rc2nOxwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:09:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9783778D01
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818AA10E2E1;
	Fri, 23 Jan 2026 17:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pCkq1BVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874B310EB62;
 Fri, 23 Jan 2026 17:09:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 450C6442C5;
 Fri, 23 Jan 2026 17:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B204BC4CEF1;
 Fri, 23 Jan 2026 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769188169;
 bh=f+5R3JjKS78CLRcPp/zk8EZGYV2IyAlDbob41E0jGxM=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=pCkq1BVRkt6UcdQekae22ylsavZ31j2jTyO8zTmWNTofhT5FduLMCzTiSC/wlIOQd
 tVo4GSmp0pl1zQWgFpAcUSRKyJzs+gYg5VWzDeXcx/2eg1o/YaAX1tzPO78SwlATzj
 eq5//FZKCyWVbxmRLlsofp7Le3K/wSIWkEssD6vw9ybk60joiOZDrCDeCivtf3leN/
 413W+uG6Siydgo67ZqfGwNECbm6XRX/qANShby5hxZIobEAZ5rHaL3n+L0zAdbPNxN
 2czIooc9BJcrFR44ZdSGjd+S+vBpNixHcOG1cFDQSUBv8BBm56jb3/rIOz+clV+zD5
 c4sgFJQ/r15Jg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:09:24 +0100
Message-Id: <DFW4V2S0HUNK.1QCRUK104TQZE@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl"
 <aliceryhl@google.com>, "Shankari Anand" <shankari.ak0208@gmail.com>,
 "David Airlie" <airlied@gmail.com>, "Benno Lossin" <lossin@kernel.org>,
 "Asahi Lina" <lina+kernel@asahilina.net>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] rust/drm: Introduce DeviceContext
References: <20260122225057.3589500-1-lyude@redhat.com>
 <20260122225057.3589500-2-lyude@redhat.com>
In-Reply-To: <20260122225057.3589500-2-lyude@redhat.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,ffwll.ch,google.com,gmail.com,asahilina.net,collabora.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9783778D01
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 11:46 PM CET, Lyude Paul wrote:
> diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver=
.rs
> index b1af0a099551d..99d6841b69cbc 100644
> --- a/drivers/gpu/drm/nova/driver.rs
> +++ b/drivers/gpu/drm/nova/driver.rs
> @@ -21,7 +21,7 @@ pub(crate) struct NovaDriver {
>  }
> =20
>  /// Convienence type alias for the DRM device type for this driver
> -pub(crate) type NovaDevice =3D drm::Device<NovaDriver>;
> +pub(crate) type NovaDevice<Ctx =3D drm::Registered> =3D drm::Device<Nova=
Driver, Ctx>;

Nothing for this patch (series), but I think we should get rid of this type
alias, I think it's confusing.

> +/// A typed DRM device with a specific [`drm::Driver`] implementation an=
d [`DeviceContext`].
> +///
> +/// Since DRM devices can be used before being fully initialized and reg=
istered with userspace, `C`
> +/// represents the furthest [`DeviceContext`] we can guarantee that this=
 [`Device`] has reached.
> +///
> +/// Keep in mind: this means that an unregistered device can still have =
the registration state
> +/// [`Registered`] as long as it was registered with userspace once in t=
he past, and that the
> +/// behavior of such a device is still well-defined. In such a situation=
, the behavior of any
> +/// functions which interact with userspace will simply be no-ops. Addit=
ionally, a device with the

This is still not correct, the are not guaranteed to be no-ops. We can stil=
l
have callbacks from userspace after the DRM device is unregistered.

> +/// registration state [`Uninit`] simply does not have a guaranteed regi=
stration state at compile
> +/// time, and could be either registered or unregistered. Since there is=
 no way to guarantee a
> +/// long-lived reference to an unregistered device would remain unregist=
ered, we do not provide a
> +/// [`DeviceContext`] for this.
> +///
> +/// # Invariants
> +///
> +/// * `self.dev` is a valid instance of a `struct device`.
> +/// * The data layout of `Self` remains the same across all implementati=
ons of `C`.
> +/// * Any invariants for `C` also apply.
> +#[repr(C)]
> +pub struct Device<T: drm::Driver, C: DeviceContext =3D Registered> {
> +    dev: Opaque<bindings::drm_device>,
> +    data: T::Data,
> +    _ctx: PhantomData<C>,
> +}

<snip>

> -    /// Registers a new [`Device`](drm::Device) with userspace.
> +    /// Registers a new [`UnregisteredDevice`](drm::UnregisteredDevice) =
with userspace.
>      ///
>      /// Ownership of the [`Registration`] object is passed to [`devres::=
register`].
> -    pub fn new_foreign_owned(
> -        drm: &drm::Device<T>,
> -        dev: &device::Device<device::Bound>,
> +    pub fn new_foreign_owned<'a>(
> +        drm: drm::UnregisteredDevice<T>,
> +        dev: &'a device::Device<device::Bound>,
>          flags: usize,
> -    ) -> Result
> +    ) -> Result<&'a drm::Device<T>>
>      where
>          T: 'static,
>      {
> -        if drm.as_ref().as_raw() !=3D dev.as_raw() {
> +        let this_dev: &device::Device =3D drm.as_ref();
> +        if this_dev.as_raw() !=3D dev.as_raw() {

I still think this change is unnecessary and the name 'this_dev' is mislead=
ing,
as it actually is the parent device.

>              return Err(EINVAL);
>          }
> =20
>          let reg =3D Registration::<T>::new(drm, flags)?;
> +        let drm =3D NonNull::from(reg.device());
> +
> +        devres::register(dev, reg, GFP_KERNEL)?;
> =20
> -        devres::register(dev, reg, GFP_KERNEL)
> +        // SAFETY: Since `reg` was passed to devres::register(), the dev=
ice now owns the lifetime
> +        // of the DRM registration - ensuring that this references lives=
 for at least as long as 'a.
> +        Ok(unsafe { drm.as_ref() })
>      }
