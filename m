Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7xS8KbZkjmkOCAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 00:39:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED5D131C91
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 00:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C05510E065;
	Thu, 12 Feb 2026 23:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="H4Pw6SUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FA410E065;
 Thu, 12 Feb 2026 23:39:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770939563; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MfCz8JVpSV4ma2KPw7fQU/VTe5XqYAu1ZRfOlawlxcUB0gclZMwBan+VaP2NT7ffOr8AqH8Usy3abotpppmybp1/h/kmAzegsDVsNnefPCCAJNJzVHFzKN5mGRcehzTwQQVUlwZI1u/bbVnfTObw385LtyGNMdD2ShsLgoU0jzc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770939563;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=KSGqdwB2INO7AZ5yz2CWObiENSQtPtFcGfPWj50oan0=; 
 b=Am0Fu0HZbr97j19qFvU5bUK2C419Z6Ehy3+wUvtJPSacwLoQhjMaOWL1paXPcwBkOYGUMhmOzvCdC6hiDZ39f83sWj7iU5Cx2A/d9tSYMFYhx1ND0FFUVTD0SdQbg+ARSoao2VjYDNR904m1opiRouwczvPHD1f2v912f3sH0Wc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770939563; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=KSGqdwB2INO7AZ5yz2CWObiENSQtPtFcGfPWj50oan0=;
 b=H4Pw6SUO6d57ADm2m8CHAvD7D0SS+G4wclfRgWz74He7rmO1ZRS2zXAEXUTFsHLs
 0CzIXFZF6CXpYLHQMhjeASrrn3Z05O8pJbN4j5Ch7FmUWXj6VnXeQi7OEK1pOK39EFb
 hdSrN16lQWOaN1kCCk22iFitC33xld56WwyOF9Vo=
Received: by mx.zohomail.com with SMTPS id 1770939561006170.56587937999575;
 Thu, 12 Feb 2026 15:39:21 -0800 (PST)
Date: Thu, 12 Feb 2026 15:39:20 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH v5 1/4] rust/drm: Introduce DeviceContext
Message-ID: <aY5kqALwqOVl9V7e@um790>
References: <20260131001602.2095470-1-lyude@redhat.com>
 <20260131001602.2095470-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131001602.2095470-2-lyude@redhat.com>
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,ffwll.ch,google.com,gmail.com,asahilina.net,collabora.com];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:dkim]
X-Rspamd-Queue-Id: 0ED5D131C91
X-Rspamd-Action: no action

Hi Lyude,

On Fri, Jan 30, 2026 at 07:13:30PM -0500, Lyude Paul wrote:
> One of the tricky things about DRM bindings in Rust is the fact that
> initialization of a DRM device is a multi-step process. It's quite normal
> for a device driver to start making use of its DRM device for tasks like
> creating GEM objects before userspace registration happens. This is an
> issue in rust though, since prior to userspace registration the device is
> only partly initialized. This means there's a plethora of DRM device
> operations we can't yet expose without opening up the door to UB if the DRM
> device in question isn't yet registered.
> 
> Additionally, this isn't something we can reliably check at runtime. And
> even if we could, performing an operation which requires the device be
> registered when the device isn't actually registered is a programmer bug,
> meaning there's no real way to gracefully handle such a mistake at runtime.
> And even if that wasn't the case, it would be horrendously annoying and
> noisy to have to check if a device is registered constantly throughout a
> driver.
> 
> In order to solve this, we first take inspiration from
> `kernel::device::DeviceContext` and introduce `kernel::drm::DeviceContext`.
> This provides us with a ZST type that we can generalize over to represent
> contexts where a device is known to have been registered with userspace at
> some point in time (`Registered`), along with contexts where we can't make
> such a guarantee (`Uninit`).
> 
> It's important to note we intentionally do not provide a `DeviceContext`
> which represents an unregistered device. This is because there's no
> reasonable way to guarantee that a device with long-living references to
> itself will not be registered eventually with userspace. Instead, we
> provide a new-type for this: `UnregisteredDevice` which can
> provide a guarantee that the `Device` has never been registered with
> userspace. To ensure this, we modify `Registration` so that creating a new
> `Registration` requires passing ownership of an `UnregisteredDevice`.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> 
> ---
> V2:
> * Make sure that `UnregisteredDevice` is not thread-safe (since DRM device
>   initialization is also not thread-safe)
> * Rename from AnyCtx to Uninit, I think this name actually makes a bit more
>   sense.
> * Change assume_registered() to assume_ctx()
>   Since it looks like in some situations, we'll want to update the
>   DeviceContext of a object to the latest DeviceContext we know the Device
>   to be in.
> * Rename Init to Uninit
>   When we eventually add KMS support, we're going to have 3 different
>   DeviceContexts - Uninit, Init, Registered. Additionally, aside from not
>   being registered there are a number of portions of the rest of the Device
>   which also aren't usable before at least the Init context - so the naming
>   of Uninit makes this a little clearer.
> * s/DeviceContext/DeviceContext/
>   For consistency with the rest of the kernel
> * Drop as_ref::<Device<T, Uninit>>() for now since I don't actually think
>   we need this quite yet
> V3:
> * Get rid of drm_dev_ctx!, as we don't actually need to implement Send or
>   Sync ourselves
> * Remove mention of C function in drm::device::Registration rustdoc
> * Add more documentation to the DeviceContext trait, go into detail about
>   the various setup phases and such.
> * Add missing period to comment in `UnregisteredDevice::new()`.
> V4:
> * Address some comments from Danilo I missed last round:
>   * Remove leftover rebase detritus from new_foreign_owned()
>     (the seemingly useless cast)
>   * Remove no-op mention in Registered device context
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nova/driver.rs |   8 +-
>  drivers/gpu/drm/tyr/driver.rs  |  10 +-
>  rust/kernel/drm/device.rs      | 178 +++++++++++++++++++++++++++------
>  rust/kernel/drm/driver.rs      |  35 +++++--
>  rust/kernel/drm/mod.rs         |   4 +
>  5 files changed, 190 insertions(+), 45 deletions(-)
> 
...
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
...

> +pub struct UnregisteredDevice<T: drm::Driver>(ARef<Device<T, Uninit>>, NotThreadSafe);
> +
> +impl<T: drm::Driver> Deref for UnregisteredDevice<T> {
> +    type Target = Device<T, Uninit>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
>  }
>  
> -impl<T: drm::Driver> Device<T> {
> +impl<T: drm::Driver> UnregisteredDevice<T> {
>      const VTABLE: bindings::drm_driver = drm_legacy_fields! {
>          load: None,
>          open: Some(drm::File::<T::File>::open_callback),
>          postclose: Some(drm::File::<T::File>::postclose_callback),
>          unload: None,
> -        release: Some(Self::release),
> +        release: Some(Device::<T>::release),
>          master_set: None,
>          master_drop: None,
>          debugfs_init: None,
> @@ -108,8 +185,10 @@ impl<T: drm::Driver> Device<T> {
>  
>      const GEM_FOPS: bindings::file_operations = drm::gem::create_fops();
>  
> -    /// Create a new `drm::Device` for a `drm::Driver`.
> -    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<ARef<Self>> {
> +    /// Create a new `UnregisteredDevice` for a `drm::Driver`.
> +    ///
> +    /// This can be used to create a [`Registration`](kernel::drm::Registration).
> +    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<Self> {
>          // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence ensure a `kmalloc()`
>          // compatible `Layout`.
>          let layout = Kmalloc::aligned_layout(Layout::new::<Self>());
> @@ -117,12 +196,12 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<A
>          // SAFETY:
>          // - `VTABLE`, as a `const` is pinned to the read-only section of the compilation,
>          // - `dev` is valid by its type invarants,
> -        let raw_drm: *mut Self = unsafe {
> +        let raw_drm: *mut Device<T, Uninit> = unsafe {
>              bindings::__drm_dev_alloc(
>                  dev.as_raw(),
>                  &Self::VTABLE,
>                  layout.size(),
> -                mem::offset_of!(Self, dev),
> +                mem::offset_of!(Device<T, Uninit>, dev),
>              )
>          }
>          .cast();

When I was testing this series with Tyr, I got this kernel Oops:

[   31.351423] tyr fb000000.gpu: mali-unknown id 0xa867 major 0x67 minor 0x0 status 0x5
[   31.352324] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0x301 MMU:0x2830 AS:0xff
[   31.353299] tyr fb000000.gpu: shader_present=0x0000000000050005 l2_present=0x0000000000000001 tiler_present=0x0000000000000001
[   31.357585] Unable to handle kernel paging request at virtual address ffff003064726553
[   31.358324] Mem abort info:
[   31.358579]   ESR = 0x0000000096000005
[   31.358956]   EC = 0x25: DABT (current EL), IL = 32 bits
[   31.359592]   SET = 0, FnV = 0
[   31.359898]   EA = 0, S1PTW = 0
[   31.360185]   FSC = 0x05: level 1 translation fault
[   31.360620] Data abort info:
[   31.360882]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
[   31.361370]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   31.361832]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   31.361839] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000002926000
[   31.361847] [ffff003064726553] pgd=0000000000000000, p4d=18000002fffff403, pud=0000000000000000

[   31.364156] Internal error: Oops: 0000000096000005 [#1]  SMP
[   31.365050] Modules linked in: tyr(+) soundcore sha256 cfg80211 rfkill pci_endpoint_test fuse dm_mod ipv6
[   31.366212] CPU: 3 UID: 0 PID: 254 Comm: (udev-worker) Not tainted 6.19.0-rc5 #281 PREEMPT
[   31.366942] Hardware name: Radxa ROCK 5B (DT)
[   31.367325] pstate: 00400009 (nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   31.367935] pc : drmm_kmalloc+0x34/0x128
[   31.368286] lr : drm_gem_init+0x70/0xb8
[   31.368627] sp : ffff800081ec3250
[   31.368918] x29: ffff800081ec3250 x28: ffff800082c01000 x27: ffff800081ec3420
[   31.369549] x26: ffff000100dc8a00 x25: ffff0001009ab960 x24: ffff000107a14840
[   31.370179] x23: ffff0001009ab7e0 x22: 0000000000000138 x21: 0000000000000dc0
[   31.370808] x20: ffff000100a801d0 x19: ffff000100a801d0 x18: 0000000000000003
[   31.371438] x17: 0000000000000000 x16: ffffc82e1355a228 x15: ffff000107c08978
[   31.372068] x14: ffffffffffffffff x13: 0000000000000044 x12: 0000000000000000
[   31.372697] x11: 0000000000000030 x10: ffffc82e12bd2db0 x9 : ffff003064726163
[   31.373327] x8 : 00000000000001b8 x7 : ffffc82e107c8dc8 x6 : 0000000000000000
[   31.373956] x5 : 0000000000000000 x4 : 0000000000000003 x3 : 0000000000000000
[   31.374591] x2 : 0000000000000dc0 x1 : 0000000000000dc0 x0 : 00000000000001b8
[   31.375221] Call trace:
[  OK  ] Listening on systemd-hostnamed.sock[   31.375438]  drmm_kmalloc+0x34/0x128 (P)
et - Hostname Service Socket.
[   31.376264]  drm_gem_init+0x70/0xb8
[   31.376838]  drm_dev_init+0x27c/0x30c
[   31.377164]  __drm_dev_alloc+0x44/0x88
[   31.377496]  _RNvMs3_NtNtCs8pcx3nCgX4X_6kernel3drm6deviceINtB5_18UnregisteredDeviceNtNtCs5CCNNSUyUK_3tyr6driver12TyrDrmDriverE3newB19_+0x50/0xe4 [tyr]
[   31.378690]  _RNvXs0_NtCs5CCNNSUyUK_3tyr6driverNtB5_21TyrPlatformDeviceDataNtNtCs8pcx3nCgX4X_6kernel8platform6Driver5probe+0x30c/0x4ec [tyr]
[   31.379794]  _RNvMs0_NtCs8pcx3nCgX4X_6kernel8platformINtB5_7AdapterNtNtCs5CCNNSUyUK_3tyr6driver21TyrPlatformDeviceDataE14probe_callbackBT_+0x60/0x220 [tyr]
[   31.381010]  platform_probe+0x5c/0x9c
[   31.381337]  really_probe+0x154/0x43c
[   31.381665]  __driver_probe_device+0xa4/0x118
[   31.382052]  driver_probe_device+0x40/0x230
[   31.382423]  __driver_attach+0xf8/0x288
[   31.382764]  bus_for_each_dev+0xec/0x144
[   31.383112]  driver_attach+0x24/0x30
[   31.383430]  bus_add_driver+0x14c/0x2a0
[   31.383771]  driver_register+0x68/0x100
[   31.384109]  __platform_driver_register+0x20/0x2c
[   31.384524]  init_module+0x84/0xfa0 [tyr]
[   31.384885]  do_one_initcall+0x104/0x35c
[   31.385235]  do_init_module+0x58/0x228
[   31.385569]  load_module+0x16f4/0x18f8
[   31.385901]  __arm64_sys_finit_module+0x24c/0x368
[   31.386317]  invoke_syscall+0x40/0xcc
[   31.386646]  el0_svc_common+0x80/0xd8
[   31.386652]  do_el0_svc+0x1c/0x28
[  OK  ] Reached target sockets.target -[   31.387270]  el0_svc+0x54/0x1d4
 Socket Units.
[   31.388011]  el0t_64_sync_handler+0x84/0x12c
[   31.388509]  el0t_64_sync+0x198/0x19c
[   31.388838] Code: 54000682 f9400689 aa0803e0 2a1503e1 (b943f122)
[   31.389372] ---[ end trace 0000000000000000 ]---
[   31.396698] Unable to handle kernel paging request at virtual address 0030303030306266

I just fixed it by changing the layout size from Self -> Device<T, Uninit>

After this fix, it's working great to load the firmware with the
Unregistered Device.

thanks,
Deborah

