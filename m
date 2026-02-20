Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC5PJNGVmGlaJwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:11:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EADE31699E9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 18:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF3E10E829;
	Fri, 20 Feb 2026 17:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="UMVUYOer";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1D210E829
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 17:11:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771607499; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DKaOzoeWQomxVcsTuBa0tqUnV9Wx3g8xVZ2ZpoMKLsMOnl2dgsXcCxr3iD5k3yOHMai+esud8bU71gD7q7Hc/2HwwuMdQ0noLctYO1dwLQh1oofUs9cLfGkcoGzPZQpp0POAO2yoBsKk/UttmIMiPBdHOQnpfJ3MG49kD3U+x7A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771607499;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9gnrg29Djou6oQZ3O6gpDoe5m5gTRK/DYWomSKGmAo4=; 
 b=e5m+D4sOBh94LPswdlP/LDJtDWpAIGI9SWfnBQQWh7RvZuCkCYIX5bqNWhfhOApI1O9X5SSmS0GJw2opLUP7wZri40t9uK3gtRWs5bPTOhd83A1xexPGOADXoVLAqf4H8svRbl61R5d0s5nqEF0x8fBPrg1G2naFozbaBia3lDA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771607499; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=9gnrg29Djou6oQZ3O6gpDoe5m5gTRK/DYWomSKGmAo4=;
 b=UMVUYOerP6ECV1yIVV1Px6xHuL8epero6xo0l8PU8XDv69CkFqQEfVDFJ7Ojvj0b
 NXWZ5j/hApsbRhEOyaW9IXGmw/eA6m8ILlOImb5ZMexAKznqOsEwtjb7R4KTA9GF4sa
 rcxPhC8g+oBZLXS7VhF345j570UBp7xmM/tAA7A8=
Received: by mx.zohomail.com with SMTPS id 1771607497576374.93497929039745;
 Fri, 20 Feb 2026 09:11:37 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 08/12] drm/tyr: add MMU module
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260212013713.304343-9-deborah.brouwer@collabora.com>
Date: Fri, 20 Feb 2026 14:11:21 -0300
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 aliceryhl@google.com, boris.brezillon@collabora.com,
 beata.michalska@arm.com, lyude@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <6A26D4EC-413C-44BC-9058-C6CC06514E41@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-9-deborah.brouwer@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	APPLE_MAILER_COMMON(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: EADE31699E9
X-Rspamd-Action: no action



> On 11 Feb 2026, at 22:37, Deborah Brouwer =
<deborah.brouwer@collabora.com> wrote:
>=20
> From: Boris Brezillon <boris.brezillon@collabora.com>
>=20
> Add a Memory Management Unit (MMU) driver for Tyr. The MMU wraps a
> SlotManager for allocating hardware address space slots. The =
underlying
> AddressSpaceManager performs MMU operations including =
enabling/disabling
> address spaces, flushing page tables, and locking regions for page =
table
> updates.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> drivers/gpu/drm/tyr/driver.rs            |   3 +
> drivers/gpu/drm/tyr/mmu.rs               |  91 +++++++
> drivers/gpu/drm/tyr/mmu/address_space.rs | 322 +++++++++++++++++++++++
> drivers/gpu/drm/tyr/tyr.rs               |   1 +
> 4 files changed, 417 insertions(+)
> create mode 100644 drivers/gpu/drm/tyr/mmu.rs
> create mode 100644 drivers/gpu/drm/tyr/mmu/address_space.rs
>=20
> diff --git a/drivers/gpu/drm/tyr/driver.rs =
b/drivers/gpu/drm/tyr/driver.rs
> index 2973a8b3cc09..ad5a765a6c2a 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -43,6 +43,7 @@
>     gem::BoData,
>     gpu,
>     gpu::GpuInfo,
> +    mmu::Mmu,
>     regs, //
> };
>=20
> @@ -148,6 +149,8 @@ fn probe(
>         let uninit_ddev =3D =
UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref())?;
>         let platform: ARef<platform::Device> =3D pdev.into();
>=20
> +        let _mmu =3D Mmu::new(pdev, iomem.as_arc_borrow(), =
&gpu_info)?;
> +

We need to store this or it will drop.


>         let data =3D try_pin_init!(TyrDrmDeviceData {
>                 pdev: platform.clone(),
>                 clks <- new_mutex!(Clocks {
> diff --git a/drivers/gpu/drm/tyr/mmu.rs b/drivers/gpu/drm/tyr/mmu.rs
> new file mode 100644
> index 000000000000..8e076c35f342
> --- /dev/null
> +++ b/drivers/gpu/drm/tyr/mmu.rs
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +//! Memory Management Unit (MMU) driver for the Tyr GPU.
> +//!
> +//! This module manages GPU address spaces and virtual memory =
operations through
> +//! hardware MMU slots. It provides functionality for flushing page =
tables and
> +//! managing VM updates for active address spaces.
> +//!
> +//! The MMU coordinates with the [`AddressSpaceManager`] to handle =
hardware
> +//! address space allocation and page table operations, using =
[`SlotManager`]
> +//! to track which address spaces are currently active in hardware =
slots.
> +//!
> +//! [`AddressSpaceManager`]: address_space::AddressSpaceManager
> +//! [`SlotManager`]: crate::slot::SlotManager
> +#![allow(dead_code)]
> +
> +use core::ops::Range;
> +
> +use kernel::{
> +    devres::Devres,
> +    new_mutex,
> +    platform,
> +    prelude::*,
> +    sync::{
> +        Arc,
> +        ArcBorrow,
> +        Mutex, //
> +    }, //
> +};
> +
> +use crate::{
> +    driver::IoMem,
> +    gpu::GpuInfo,
> +    mmu::address_space::{
> +        AddressSpaceManager,
> +        VmAsData, //
> +    },
> +    regs::MAX_AS_REGISTERS,
> +    slot::{
> +        SlotManager, //
> +    }, //
> +};
> +
> +pub(crate) mod address_space;
> +
> +pub(crate) type AsSlotManager =3D SlotManager<AddressSpaceManager, =
MAX_AS_REGISTERS>;
> +
> +#[pin_data]
> +pub(crate) struct Mmu {
> +    /// Manages the allocation of hardware MMU slots to GPU address =
spaces.
> +    ///
> +    /// Tracks which address spaces are currently active in hardware =
slots and
> +    /// coordinates address space operations like flushing and VM =
updates.
> +    #[pin]
> +    pub(crate) as_manager: Mutex<AsSlotManager>,
> +}
> +
> +impl Mmu {
> +    pub(crate) fn new(
> +        pdev: &platform::Device,
> +        iomem: ArcBorrow<'_, Devres<IoMem>>,
> +        gpu_info: &GpuInfo,
> +    ) -> Result<Arc<Mmu>> {
> +        let slot_count =3D =
gpu_info.as_present.count_ones().try_into()?;
> +        let as_manager =3D AddressSpaceManager::new(pdev, iomem, =
gpu_info.as_present)?;
> +        let mmu_init =3D try_pin_init!(Self{
> +            as_manager <- new_mutex!(SlotManager::new(as_manager, =
slot_count)?),
> +        });
> +        Arc::pin_init(mmu_init, GFP_KERNEL)
> +    }
> +
> +    pub(crate) fn activate_vm(&self, vm: ArcBorrow<'_, VmAsData>) -> =
Result {
> +        self.as_manager.lock().activate_vm(vm)
> +    }
> +
> +    pub(crate) fn deactivate_vm(&self, vm: &VmAsData) -> Result {
> +        self.as_manager.lock().deactivate_vm(vm)
> +    }
> +
> +    pub(crate) fn flush_vm(&self, vm: &VmAsData) -> Result {
> +        self.as_manager.lock().flush_vm(vm)
> +    }
> +
> +    pub(crate) fn start_vm_update(&self, vm: &VmAsData, region: =
&Range<u64>) -> Result {
> +        self.as_manager.lock().start_vm_update(vm, region)
> +    }

Please return a token type from this.

// if you want the whole vm to be locked while this update takes place
struct VmUpdate<=E2=80=98a> (Guard<=E2=80=98a, AsSlotManager>);=20

// if you don=E2=80=99t=20
struct VmUpdate<=E2=80=98a> (&=E2=80=99a AsSlotManager);

The lifetime will be correctly elided as the lifetime of &self, i.e.:

 start_vm_update<=E2=80=98a>(&=E2=80=99a self, vm: &VmAsData, region: =
&Range<u64>) -> Result<VmUpdate<=E2=80=98a>>
=20
Which is just:

 start_vm_update(&self, vm: &VmAsData, region: &Range<u64>) -> =
Result<VmUpdate<=E2=80=98_>>


> +
> +    pub(crate) fn end_vm_update(&self, vm: &VmAsData) -> Result {
> +        self.as_manager.lock().end_vm_update(vm)
> +    }

Move this to the token type=E2=80=99s Drop implementation.

> +}
> diff --git a/drivers/gpu/drm/tyr/mmu/address_space.rs =
b/drivers/gpu/drm/tyr/mmu/address_space.rs
> new file mode 100644
> index 000000000000..60e9a79112f0
> --- /dev/null
> +++ b/drivers/gpu/drm/tyr/mmu/address_space.rs
> @@ -0,0 +1,322 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +//! GPU address space management and hardware operations.
> +//!
> +//! This module manages GPU hardware address spaces, including =
configuration,
> +//! command submission, and page table update regions. It handles the =
hardware
> +//! interaction for MMU operations through MMIO register access.
> +//!
> +//! The [`AddressSpaceManager`] implements [`SlotOperations`] to =
integrate with
> +//! the slot management system, enabling and configuring address =
spaces in the
> +//! hardware slots as needed.
> +//!
> +//! [`SlotOperations`]: crate::slot::SlotOperations
> +
> +use core::ops::Range;
> +
> +use kernel::{
> +    bits::*,
> +    device::{
> +        Bound,
> +        Device, //
> +    },
> +    devres::Devres,
> +    error::Result,
> +    io,
> +    iommu::pgtable::{
> +        IoPageTable,
> +        ARM64LPAES1, //
> +    },
> +    platform,
> +    prelude::*,
> +    sync::{
> +        aref::ARef,
> +        Arc,
> +        ArcBorrow,
> +        LockedBy, //
> +    },
> +    time::Delta, //
> +};
> +
> +use crate::{
> +    driver::IoMem,
> +    mmu::{
> +        AsSlotManager,
> +        Mmu, //
> +    },
> +    regs::*,
> +    slot::{
> +        Seat,
> +        SlotOperations, //
> +    }, //
> +};
> +
> +/// Hardware address space configuration registers.
> +///
> +/// Contains the values to be written to the GPU's AS registers when
> +/// activating this address space.
> +#[derive(Clone, Copy)]
> +pub(crate) struct AddressSpaceConfig {
> +    pub(crate) transcfg: u64,
> +    pub(crate) transtab: u64,
> +    pub(crate) memattr: u64,
> +}

Do we need pub(crate) here?

> +
> +/// Any resource/information that will be used by the =
AddressSpaceManager
> +/// to make a VM active is present in VmAsData.
> +///
> +/// On activation, we will pass an Arc<VmAsData> that will be stored =
in
> +/// the slot to make sure the page table and the underlying resources
> +/// (pages) used by the AS slot won't go away while the MMU points to
> +/// those.
> +pub(crate) struct VmAsData {
> +    /// Tracks this VM's binding to a hardware address space slot.
> +    as_seat: LockedBy<Seat, AsSlotManager>,
> +    /// Hardware configuration for this address space.
> +    as_config: AddressSpaceConfig,
> +    /// Page table (managed by devres).
> +    pub(crate) page_table: =
Pin<KBox<Devres<IoPageTable<ARM64LPAES1>>>>,

Do we need pub(crate) here?

> +}
> +
> +impl VmAsData {
> +    pub(crate) fn new(
> +        mmu: &Mmu,
> +        as_config: AddressSpaceConfig,
> +        page_table: Pin<KBox<Devres<IoPageTable<ARM64LPAES1>>>>,
> +    ) -> VmAsData {
> +        Self {
> +            as_seat: LockedBy::new(&mmu.as_manager, Seat::NoSeat),
> +            as_config,
> +            page_table,
> +        }
> +    }
> +}
> +
> +/// Manages GPU hardware address spaces via MMIO register operations.
> +pub(crate) struct AddressSpaceManager {
> +    pdev: ARef<platform::Device>,
> +    iomem: Arc<Devres<IoMem>>,
> +    /// Bitmask of available address space slots from GPU_AS_PRESENT =
register
> +    as_present: u32,
> +}
> +
> +impl SlotOperations for AddressSpaceManager {
> +    type SlotData =3D Arc<VmAsData>;
> +
> +    fn activate(&mut self, slot_idx: usize, slot_data: =
&Self::SlotData) -> Result {
> +        self.as_enable(slot_idx, &slot_data.as_config)
> +    }
> +
> +    fn evict(&mut self, slot_idx: usize, _slot_data: &Self::SlotData) =
-> Result {
> +        if self.iomem.try_access().is_some() {
> +            let _ =3D self.as_flush(slot_idx);
> +            let _ =3D self.as_disable(slot_idx);
> +        }
> +        Ok(())
> +    }
> +}
> +
> +impl AddressSpaceManager {
> +    pub(super) fn new(
> +        pdev: &platform::Device,
> +        iomem: ArcBorrow<'_, Devres<IoMem>>,
> +        as_present: u32,
> +    ) -> Result<AddressSpaceManager> {
> +        Ok(Self {
> +            pdev: pdev.into(),
> +            iomem: iomem.into(),
> +            as_present,
> +        })
> +    }
> +
> +    fn dev(&self) -> &Device<Bound> {
> +        // SAFETY: pdev is a bound device.

I don=E2=80=99t think we can say this for sure? I don=E2=80=99t think =
there is anything
special about this scope that ensures Device<Bound>.

> +        unsafe { self.pdev.as_ref().as_bound() }
> +    }
> +
> +    fn validate_as_slot(&self, as_nr: usize) -> Result {
> +        if as_nr >=3D MAX_AS_REGISTERS {
> +            pr_err!(
> +                "AS slot {} out of valid range (max {})\n",
> +                as_nr,
> +                MAX_AS_REGISTERS
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        if (self.as_present & (1 << as_nr)) =3D=3D 0 {
> +            pr_err!(
> +                "AS slot {} not present in hardware =
(AS_PRESENT=3D{:#x})\n",
> +                as_nr,
> +                self.as_present
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(())
> +    }
> +
> +    fn as_wait_ready(&self, as_nr: usize) -> Result {
> +        let op =3D || as_status(as_nr)?.read(self.dev(), =
&self.iomem);
> +        let cond =3D |status: &u32| -> bool { *status & =
AS_STATUS_ACTIVE =3D=3D 0 };
> +        let _ =3D
> +            io::poll::read_poll_timeout(op, cond, =
Delta::from_millis(0), Delta::from_millis(10))?;
> +
> +        Ok(())
> +    }
> +
> +    fn as_send_cmd(&mut self, as_nr: usize, cmd: u32) -> Result {
> +        self.as_wait_ready(as_nr)?;
> +        as_command(as_nr)?.write(self.dev(), &self.iomem, cmd)?;
> +        Ok(())
> +    }
> +
> +    fn as_send_cmd_and_wait(&mut self, as_nr: usize, cmd: u32) -> =
Result {
> +        self.as_send_cmd(as_nr, cmd)?;
> +        self.as_wait_ready(as_nr)?;
> +        Ok(())
> +    }
> +
> +    fn as_enable(&mut self, as_nr: usize, as_config: =
&AddressSpaceConfig) -> Result {
> +        self.validate_as_slot(as_nr)?;
> +
> +        let transtab =3D as_config.transtab;
> +        let transcfg =3D as_config.transcfg;
> +        let memattr =3D as_config.memattr;
> +
> +        let transtab_lo =3D (transtab & 0xffffffff) as u32;
> +        let transtab_hi =3D (transtab >> 32) as u32;
> +
> +        let transcfg_lo =3D (transcfg & 0xffffffff) as u32;
> +        let transcfg_hi =3D (transcfg >> 32) as u32;
> +
> +        let memattr_lo =3D (memattr & 0xffffffff) as u32;
> +        let memattr_hi =3D (memattr >> 32) as u32;
> +
> +        let dev =3D self.dev();
> +        as_transtab_lo(as_nr)?.write(dev, &self.iomem, transtab_lo)?;
> +        as_transtab_hi(as_nr)?.write(dev, &self.iomem, transtab_hi)?;
> +
> +        as_transcfg_lo(as_nr)?.write(dev, &self.iomem, transcfg_lo)?;
> +        as_transcfg_hi(as_nr)?.write(dev, &self.iomem, transcfg_hi)?;
> +
> +        as_memattr_lo(as_nr)?.write(dev, &self.iomem, memattr_lo)?;
> +        as_memattr_hi(as_nr)?.write(dev, &self.iomem, memattr_hi)?;
> +
> +        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_UPDATE)?;
> +
> +        Ok(())
> +    }
> +
> +    fn as_disable(&mut self, as_nr: usize) -> Result {
> +        self.validate_as_slot(as_nr)?;
> +
> +        // Flush AS before disabling
> +        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_FLUSH_MEM)?;
> +
> +        let dev =3D self.dev();
> +        as_transtab_lo(as_nr)?.write(dev, &self.iomem, 0)?;
> +        as_transtab_hi(as_nr)?.write(dev, &self.iomem, 0)?;
> +
> +        as_memattr_lo(as_nr)?.write(dev, &self.iomem, 0)?;
> +        as_memattr_hi(as_nr)?.write(dev, &self.iomem, 0)?;
> +
> +        as_transcfg_lo(as_nr)?.write(dev, &self.iomem, =
AS_TRANSCFG_ADRMODE_UNMAPPED as u32)?;
> +        as_transcfg_hi(as_nr)?.write(dev, &self.iomem, 0)?;
> +
> +        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_UPDATE)?;
> +
> +        Ok(())
> +    }
> +
> +    fn as_start_update(&mut self, as_nr: usize, region: &Range<u64>) =
-> Result {
> +        self.validate_as_slot(as_nr)?;
> +
> +        // The locked region is a naturally aligned power of 2 block =
encoded as
> +        // log2 minus(1).
> +        //
> +        // Calculate the desired start/end and look for the highest =
bit which
> +        // differs. The smallest naturally aligned block must include =
this bit
> +        // change, the desired region starts with this bit (and =
subsequent bits)
> +        // zeroed and ends with the bit (and subsequent bits) set to =
one.
> +        let region_width =3D core::cmp::max(
> +            64 - (region.start ^ (region.end - 1)).leading_zeros() as =
u8,
> +            AS_LOCK_REGION_MIN_SIZE.trailing_zeros() as u8,
> +        ) - 1;

Is it me, or did this change from the prototype branch?

> +
> +        // Mask off the low bits of region.start, which would be =
ignored by the
> +        // hardware anyways.
> +        let region_start =3D
> +            region.start & =
genmask_checked_u64(u32::from(region_width)..=3D63).ok_or(EINVAL)?;
> +
> +        let region =3D (u64::from(region_width)) | region_start;
> +
> +        let region_lo =3D (region & 0xffffffff) as u32;
> +        let region_hi =3D (region >> 32) as u32;
> +
> +        // Lock the region that needs to be updated.
> +        let dev =3D self.dev();
> +        as_lockaddr_lo(as_nr)?.write(dev, &self.iomem, region_lo)?;
> +        as_lockaddr_hi(as_nr)?.write(dev, &self.iomem, region_hi)?;
> +
> +        self.as_send_cmd(as_nr, AS_COMMAND_LOCK)
> +    }
> +
> +    fn as_end_update(&mut self, as_nr: usize) -> Result {
> +        self.validate_as_slot(as_nr)?;
> +        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_FLUSH_PT)
> +    }
> +
> +    fn as_flush(&mut self, as_nr: usize) -> Result {
> +        self.validate_as_slot(as_nr)?;
> +        self.as_send_cmd(as_nr, AS_COMMAND_FLUSH_PT)
> +    }
> +}
> +
> +impl AsSlotManager {
> +    /// Locks a region for page table updates if the VM has an active =
slot.
> +    pub(super) fn start_vm_update(&mut self, vm: &VmAsData, region: =
&Range<u64>) -> Result {
> +        let seat =3D vm.as_seat.access(self);
> +        match seat.slot() {
> +            Some(slot) =3D> {
> +                let as_nr =3D slot as usize;
> +                self.as_start_update(as_nr, region)
> +            }
> +            _ =3D> Ok(()),
> +        }
> +    }
> +
> +    /// Flushes page table updates for a VM if it has an active slot.
> +    pub(super) fn end_vm_update(&mut self, vm: &VmAsData) -> Result {
> +        let seat =3D vm.as_seat.access(self);
> +        match seat.slot() {
> +            Some(slot) =3D> {
> +                let as_nr =3D slot as usize;
> +                self.as_end_update(as_nr)
> +            }
> +            _ =3D> Ok(()),
> +        }
> +    }
> +
> +    /// Flushes page tables for a VM if it has an active slot.
> +    pub(super) fn flush_vm(&mut self, vm: &VmAsData) -> Result {
> +        let seat =3D vm.as_seat.access(self);
> +        match seat.slot() {
> +            Some(slot) =3D> {
> +                let as_nr =3D slot as usize;
> +                self.as_flush(as_nr)
> +            }
> +            _ =3D> Ok(()),
> +        }
> +    }
> +
> +    /// Flushes page tables for a VM if it has an active slot.
> +    pub(super) fn activate_vm(&mut self, vm: ArcBorrow<'_, VmAsData>) =
-> Result {
> +        self.activate(&vm.as_seat, vm.into())
> +    }
> +
> +    /// Flushes page tables for a VM if it has an active slot.
> +    pub(super) fn deactivate_vm(&mut self, vm: &VmAsData) -> Result {
> +        self.evict(&vm.as_seat)
> +    }
> +}
> diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
> index f54b997355e0..ae435c7e80b1 100644
> --- a/drivers/gpu/drm/tyr/tyr.rs
> +++ b/drivers/gpu/drm/tyr/tyr.rs
> @@ -11,6 +11,7 @@
> mod file;
> mod gem;
> mod gpu;
> +mod mmu;
> mod regs;
> mod slot;
>=20
> --=20
> 2.52.0
>=20

