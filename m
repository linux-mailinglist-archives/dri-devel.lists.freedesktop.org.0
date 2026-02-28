Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePaXF/w6omk71AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:46:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23CD1BF7AB
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63A010E193;
	Sat, 28 Feb 2026 00:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="k6FpPzxN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E06210E193
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 00:46:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772239604; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ioymYFlXDbz8bOxsyW21+FD8YcqEbsHPzNIjc+MtQxb5V1EHDER5rBEbIcGGmv2I3hj7BtzqqgD4IO+T8RgRXkrGPdu0vm4aN5CV1iuRXc9FgsyFHwrCXaYpMVyzzCOsOPz4BNyxEMKf1rq5YPcZLdHK3eSJ/VoDNmymoALgUg8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772239604;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4N3JzKgyc4SoM0acv3GmznEmCCci39Im/fWH/Xkbp20=; 
 b=BLxBlUEP27zJMa23ttcMAm7PRsqeT3hw7GKN+l5rtt05uVciLoLlyMOZ7BV1gxeKTY99NHKksgJc4GTrdChwULtj9DcSDRLVLo1rA5qTWZTv96pqglwUQZC9nVvV1iOc9LGLkoPNPurm1+x9OyY/0l5RALoHr+adBsVOndZ9SBs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772239604; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=4N3JzKgyc4SoM0acv3GmznEmCCci39Im/fWH/Xkbp20=;
 b=k6FpPzxNO7jq39tBsA95wa9hRHrGjbENBV6Fjs+gW7KX0qAhfWKpDs+Cv1DpQZ5d
 GFjOSKM8y2QpMPjNa/TLCpwLJNB97kklDcdTmKWKWoMC3/c1PxyRuLgoLRNniznjDsw
 01jCIvfq49rk51Bk3sneTYScfnfM/gVmeG6Gy5Z4=
Received: by mx.zohomail.com with SMTPS id 1772239603299876.1397008368152;
 Fri, 27 Feb 2026 16:46:43 -0800 (PST)
Date: Fri, 27 Feb 2026 16:46:42 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 aliceryhl@google.com, boris.brezillon@collabora.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 08/12] drm/tyr: add MMU module
Message-ID: <aaI68o9aetr52u7q@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-9-deborah.brouwer@collabora.com>
 <6A26D4EC-413C-44BC-9058-C6CC06514E41@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6A26D4EC-413C-44BC-9058-C6CC06514E41@collabora.com>
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C23CD1BF7AB
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 02:11:21PM -0300, Daniel Almeida wrote:
> 
> 
> > On 11 Feb 2026, at 22:37, Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> > 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > Add a Memory Management Unit (MMU) driver for Tyr. The MMU wraps a
> > SlotManager for allocating hardware address space slots. The underlying
> > AddressSpaceManager performs MMU operations including enabling/disabling
> > address spaces, flushing page tables, and locking regions for page table
> > updates.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> > drivers/gpu/drm/tyr/driver.rs            |   3 +
> > drivers/gpu/drm/tyr/mmu.rs               |  91 +++++++
> > drivers/gpu/drm/tyr/mmu/address_space.rs | 322 +++++++++++++++++++++++
> > drivers/gpu/drm/tyr/tyr.rs               |   1 +
> > 4 files changed, 417 insertions(+)
> > create mode 100644 drivers/gpu/drm/tyr/mmu.rs
> > create mode 100644 drivers/gpu/drm/tyr/mmu/address_space.rs
> > 
> > diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> > index 2973a8b3cc09..ad5a765a6c2a 100644
> > --- a/drivers/gpu/drm/tyr/driver.rs
> > +++ b/drivers/gpu/drm/tyr/driver.rs
> > @@ -43,6 +43,7 @@
> >     gem::BoData,
> >     gpu,
> >     gpu::GpuInfo,
> > +    mmu::Mmu,
> >     regs, //
> > };
> > 
> > @@ -148,6 +149,8 @@ fn probe(
> >         let uninit_ddev = UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref())?;
> >         let platform: ARef<platform::Device> = pdev.into();
> > 
> > +        let _mmu = Mmu::new(pdev, iomem.as_arc_borrow(), &gpu_info)?;
> > +
> 
> We need to store this or it will drop.

We store the mmu properly in struct firmware later in this series.

> 
> 
> >         let data = try_pin_init!(TyrDrmDeviceData {
> >                 pdev: platform.clone(),
> >                 clks <- new_mutex!(Clocks {
> > diff --git a/drivers/gpu/drm/tyr/mmu.rs b/drivers/gpu/drm/tyr/mmu.rs
> > new file mode 100644
> > index 000000000000..8e076c35f342
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tyr/mmu.rs
> > @@ -0,0 +1,91 @@
> > +// SPDX-License-Identifier: GPL-2.0 or MIT
> > +
> > +//! Memory Management Unit (MMU) driver for the Tyr GPU.
> > +//!
> > +//! This module manages GPU address spaces and virtual memory operations through
> > +//! hardware MMU slots. It provides functionality for flushing page tables and
> > +//! managing VM updates for active address spaces.
> > +//!
> > +//! The MMU coordinates with the [`AddressSpaceManager`] to handle hardware
> > +//! address space allocation and page table operations, using [`SlotManager`]
> > +//! to track which address spaces are currently active in hardware slots.
> > +//!
> > +//! [`AddressSpaceManager`]: address_space::AddressSpaceManager
> > +//! [`SlotManager`]: crate::slot::SlotManager
> > +#![allow(dead_code)]
> > +
> > +use core::ops::Range;
> > +
> > +use kernel::{
> > +    devres::Devres,
> > +    new_mutex,
> > +    platform,
> > +    prelude::*,
> > +    sync::{
> > +        Arc,
> > +        ArcBorrow,
> > +        Mutex, //
> > +    }, //
> > +};
> > +
> > +use crate::{
> > +    driver::IoMem,
> > +    gpu::GpuInfo,
> > +    mmu::address_space::{
> > +        AddressSpaceManager,
> > +        VmAsData, //
> > +    },
> > +    regs::MAX_AS_REGISTERS,
> > +    slot::{
> > +        SlotManager, //
> > +    }, //
> > +};
> > +
> > +pub(crate) mod address_space;
> > +
> > +pub(crate) type AsSlotManager = SlotManager<AddressSpaceManager, MAX_AS_REGISTERS>;
> > +
> > +#[pin_data]
> > +pub(crate) struct Mmu {
> > +    /// Manages the allocation of hardware MMU slots to GPU address spaces.
> > +    ///
> > +    /// Tracks which address spaces are currently active in hardware slots and
> > +    /// coordinates address space operations like flushing and VM updates.
> > +    #[pin]
> > +    pub(crate) as_manager: Mutex<AsSlotManager>,
> > +}
> > +
> > +impl Mmu {
> > +    pub(crate) fn new(
> > +        pdev: &platform::Device,
> > +        iomem: ArcBorrow<'_, Devres<IoMem>>,
> > +        gpu_info: &GpuInfo,
> > +    ) -> Result<Arc<Mmu>> {
> > +        let slot_count = gpu_info.as_present.count_ones().try_into()?;
> > +        let as_manager = AddressSpaceManager::new(pdev, iomem, gpu_info.as_present)?;
> > +        let mmu_init = try_pin_init!(Self{
> > +            as_manager <- new_mutex!(SlotManager::new(as_manager, slot_count)?),
> > +        });
> > +        Arc::pin_init(mmu_init, GFP_KERNEL)
> > +    }
> > +
> > +    pub(crate) fn activate_vm(&self, vm: ArcBorrow<'_, VmAsData>) -> Result {
> > +        self.as_manager.lock().activate_vm(vm)
> > +    }
> > +
> > +    pub(crate) fn deactivate_vm(&self, vm: &VmAsData) -> Result {
> > +        self.as_manager.lock().deactivate_vm(vm)
> > +    }
> > +
> > +    pub(crate) fn flush_vm(&self, vm: &VmAsData) -> Result {
> > +        self.as_manager.lock().flush_vm(vm)
> > +    }
> > +
> > +    pub(crate) fn start_vm_update(&self, vm: &VmAsData, region: &Range<u64>) -> Result {
> > +        self.as_manager.lock().start_vm_update(vm, region)
> > +    }
> 
> Please return a token type from this.
>

We implemented the RAII guard in PtUpdateContext which is in the vm patch.

> // if you want the whole vm to be locked while this update takes place
> struct VmUpdate<‘a> (Guard<‘a, AsSlotManager>); 
> 
> // if you don’t 
> struct VmUpdate<‘a> (&’a AsSlotManager);
> 
> The lifetime will be correctly elided as the lifetime of &self, i.e.:
> 
>  start_vm_update<‘a>(&’a self, vm: &VmAsData, region: &Range<u64>) -> Result<VmUpdate<‘a>>
>  
> Which is just:
> 
>  start_vm_update(&self, vm: &VmAsData, region: &Range<u64>) -> Result<VmUpdate<‘_>>
> 
> 
> > +
> > +    pub(crate) fn end_vm_update(&self, vm: &VmAsData) -> Result {
> > +        self.as_manager.lock().end_vm_update(vm)
> > +    }
> 
> Move this to the token type’s Drop implementation.
> 
> > +}
> > diff --git a/drivers/gpu/drm/tyr/mmu/address_space.rs b/drivers/gpu/drm/tyr/mmu/address_space.rs
> > new file mode 100644
> > index 000000000000..60e9a79112f0
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tyr/mmu/address_space.rs
> > @@ -0,0 +1,322 @@
> > +// SPDX-License-Identifier: GPL-2.0 or MIT
> > +
> > +//! GPU address space management and hardware operations.
> > +//!
> > +//! This module manages GPU hardware address spaces, including configuration,
> > +//! command submission, and page table update regions. It handles the hardware
> > +//! interaction for MMU operations through MMIO register access.
> > +//!
> > +//! The [`AddressSpaceManager`] implements [`SlotOperations`] to integrate with
> > +//! the slot management system, enabling and configuring address spaces in the
> > +//! hardware slots as needed.
> > +//!
> > +//! [`SlotOperations`]: crate::slot::SlotOperations
> > +
> > +use core::ops::Range;
> > +
> > +use kernel::{
> > +    bits::*,
> > +    device::{
> > +        Bound,
> > +        Device, //
> > +    },
> > +    devres::Devres,
> > +    error::Result,
> > +    io,
> > +    iommu::pgtable::{
> > +        IoPageTable,
> > +        ARM64LPAES1, //
> > +    },
> > +    platform,
> > +    prelude::*,
> > +    sync::{
> > +        aref::ARef,
> > +        Arc,
> > +        ArcBorrow,
> > +        LockedBy, //
> > +    },
> > +    time::Delta, //
> > +};
> > +
> > +use crate::{
> > +    driver::IoMem,
> > +    mmu::{
> > +        AsSlotManager,
> > +        Mmu, //
> > +    },
> > +    regs::*,
> > +    slot::{
> > +        Seat,
> > +        SlotOperations, //
> > +    }, //
> > +};
> > +
> > +/// Hardware address space configuration registers.
> > +///
> > +/// Contains the values to be written to the GPU's AS registers when
> > +/// activating this address space.
> > +#[derive(Clone, Copy)]
> > +pub(crate) struct AddressSpaceConfig {
> > +    pub(crate) transcfg: u64,
> > +    pub(crate) transtab: u64,
> > +    pub(crate) memattr: u64,
> > +}
> 
> Do we need pub(crate) here?

We used to when Vm was creating the AddressSpaceConfig, but it won't
need this visibility in v2 so I will make it private.

> 
> > +
> > +/// Any resource/information that will be used by the AddressSpaceManager
> > +/// to make a VM active is present in VmAsData.
> > +///
> > +/// On activation, we will pass an Arc<VmAsData> that will be stored in
> > +/// the slot to make sure the page table and the underlying resources
> > +/// (pages) used by the AS slot won't go away while the MMU points to
> > +/// those.
> > +pub(crate) struct VmAsData {
> > +    /// Tracks this VM's binding to a hardware address space slot.
> > +    as_seat: LockedBy<Seat, AsSlotManager>,
> > +    /// Hardware configuration for this address space.
> > +    as_config: AddressSpaceConfig,
> > +    /// Page table (managed by devres).
> > +    pub(crate) page_table: Pin<KBox<Devres<IoPageTable<ARM64LPAES1>>>>,
> 
> Do we need pub(crate) here?
> 
> > +}
> > +
> > +impl VmAsData {
> > +    pub(crate) fn new(
> > +        mmu: &Mmu,
> > +        as_config: AddressSpaceConfig,
> > +        page_table: Pin<KBox<Devres<IoPageTable<ARM64LPAES1>>>>,
> > +    ) -> VmAsData {
> > +        Self {
> > +            as_seat: LockedBy::new(&mmu.as_manager, Seat::NoSeat),
> > +            as_config,
> > +            page_table,
> > +        }
> > +    }
> > +}
> > +
> > +/// Manages GPU hardware address spaces via MMIO register operations.
> > +pub(crate) struct AddressSpaceManager {
> > +    pdev: ARef<platform::Device>,
> > +    iomem: Arc<Devres<IoMem>>,
> > +    /// Bitmask of available address space slots from GPU_AS_PRESENT register
> > +    as_present: u32,
> > +}
> > +
> > +impl SlotOperations for AddressSpaceManager {
> > +    type SlotData = Arc<VmAsData>;
> > +
> > +    fn activate(&mut self, slot_idx: usize, slot_data: &Self::SlotData) -> Result {
> > +        self.as_enable(slot_idx, &slot_data.as_config)
> > +    }
> > +
> > +    fn evict(&mut self, slot_idx: usize, _slot_data: &Self::SlotData) -> Result {
> > +        if self.iomem.try_access().is_some() {
> > +            let _ = self.as_flush(slot_idx);
> > +            let _ = self.as_disable(slot_idx);
> > +        }
> > +        Ok(())
> > +    }
> > +}
> > +
> > +impl AddressSpaceManager {
> > +    pub(super) fn new(
> > +        pdev: &platform::Device,
> > +        iomem: ArcBorrow<'_, Devres<IoMem>>,
> > +        as_present: u32,
> > +    ) -> Result<AddressSpaceManager> {
> > +        Ok(Self {
> > +            pdev: pdev.into(),
> > +            iomem: iomem.into(),
> > +            as_present,
> > +        })
> > +    }
> > +
> > +    fn dev(&self) -> &Device<Bound> {
> > +        // SAFETY: pdev is a bound device.
> 
> I don’t think we can say this for sure? I don’t think there is anything
> special about this scope that ensures Device<Bound>.
>
Could you suggest an alternative safety statement?


> > +        unsafe { self.pdev.as_ref().as_bound() }
> > +    }
> > +
> > +    fn validate_as_slot(&self, as_nr: usize) -> Result {
> > +        if as_nr >= MAX_AS_REGISTERS {
> > +            pr_err!(
> > +                "AS slot {} out of valid range (max {})\n",
> > +                as_nr,
> > +                MAX_AS_REGISTERS
> > +            );
> > +            return Err(EINVAL);
> > +        }
> > +
> > +        if (self.as_present & (1 << as_nr)) == 0 {
> > +            pr_err!(
> > +                "AS slot {} not present in hardware (AS_PRESENT={:#x})\n",
> > +                as_nr,
> > +                self.as_present
> > +            );
> > +            return Err(EINVAL);
> > +        }
> > +
> > +        Ok(())
> > +    }
> > +
> > +    fn as_wait_ready(&self, as_nr: usize) -> Result {
> > +        let op = || as_status(as_nr)?.read(self.dev(), &self.iomem);
> > +        let cond = |status: &u32| -> bool { *status & AS_STATUS_ACTIVE == 0 };
> > +        let _ =
> > +            io::poll::read_poll_timeout(op, cond, Delta::from_millis(0), Delta::from_millis(10))?;
> > +
> > +        Ok(())
> > +    }
> > +
> > +    fn as_send_cmd(&mut self, as_nr: usize, cmd: u32) -> Result {
> > +        self.as_wait_ready(as_nr)?;
> > +        as_command(as_nr)?.write(self.dev(), &self.iomem, cmd)?;
> > +        Ok(())
> > +    }
> > +
> > +    fn as_send_cmd_and_wait(&mut self, as_nr: usize, cmd: u32) -> Result {
> > +        self.as_send_cmd(as_nr, cmd)?;
> > +        self.as_wait_ready(as_nr)?;
> > +        Ok(())
> > +    }
> > +
> > +    fn as_enable(&mut self, as_nr: usize, as_config: &AddressSpaceConfig) -> Result {
> > +        self.validate_as_slot(as_nr)?;
> > +
> > +        let transtab = as_config.transtab;
> > +        let transcfg = as_config.transcfg;
> > +        let memattr = as_config.memattr;
> > +
> > +        let transtab_lo = (transtab & 0xffffffff) as u32;
> > +        let transtab_hi = (transtab >> 32) as u32;
> > +
> > +        let transcfg_lo = (transcfg & 0xffffffff) as u32;
> > +        let transcfg_hi = (transcfg >> 32) as u32;
> > +
> > +        let memattr_lo = (memattr & 0xffffffff) as u32;
> > +        let memattr_hi = (memattr >> 32) as u32;
> > +
> > +        let dev = self.dev();
> > +        as_transtab_lo(as_nr)?.write(dev, &self.iomem, transtab_lo)?;
> > +        as_transtab_hi(as_nr)?.write(dev, &self.iomem, transtab_hi)?;
> > +
> > +        as_transcfg_lo(as_nr)?.write(dev, &self.iomem, transcfg_lo)?;
> > +        as_transcfg_hi(as_nr)?.write(dev, &self.iomem, transcfg_hi)?;
> > +
> > +        as_memattr_lo(as_nr)?.write(dev, &self.iomem, memattr_lo)?;
> > +        as_memattr_hi(as_nr)?.write(dev, &self.iomem, memattr_hi)?;
> > +
> > +        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_UPDATE)?;
> > +
> > +        Ok(())
> > +    }
> > +
> > +    fn as_disable(&mut self, as_nr: usize) -> Result {
> > +        self.validate_as_slot(as_nr)?;
> > +
> > +        // Flush AS before disabling
> > +        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_FLUSH_MEM)?;
> > +
> > +        let dev = self.dev();
> > +        as_transtab_lo(as_nr)?.write(dev, &self.iomem, 0)?;
> > +        as_transtab_hi(as_nr)?.write(dev, &self.iomem, 0)?;
> > +
> > +        as_memattr_lo(as_nr)?.write(dev, &self.iomem, 0)?;
> > +        as_memattr_hi(as_nr)?.write(dev, &self.iomem, 0)?;
> > +
> > +        as_transcfg_lo(as_nr)?.write(dev, &self.iomem, AS_TRANSCFG_ADRMODE_UNMAPPED as u32)?;
> > +        as_transcfg_hi(as_nr)?.write(dev, &self.iomem, 0)?;
> > +
> > +        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_UPDATE)?;
> > +
> > +        Ok(())
> > +    }
> > +
> > +    fn as_start_update(&mut self, as_nr: usize, region: &Range<u64>) -> Result {
> > +        self.validate_as_slot(as_nr)?;
> > +
> > +        // The locked region is a naturally aligned power of 2 block encoded as
> > +        // log2 minus(1).
> > +        //
> > +        // Calculate the desired start/end and look for the highest bit which
> > +        // differs. The smallest naturally aligned block must include this bit
> > +        // change, the desired region starts with this bit (and subsequent bits)
> > +        // zeroed and ends with the bit (and subsequent bits) set to one.
> > +        let region_width = core::cmp::max(
> > +            64 - (region.start ^ (region.end - 1)).leading_zeros() as u8,
> > +            AS_LOCK_REGION_MIN_SIZE.trailing_zeros() as u8,
> > +        ) - 1;
> 
> Is it me, or did this change from the prototype branch?
>

Yes, I fixed an error in the calculation of the locking region width.
If you look at the panthor_mmu.c calculation it is:

	region_width = max(fls64(region_start ^ (region_end - 1)),
			   const_ilog2(AS_LOCK_REGION_MIN_SIZE)) - 1;

The prototype code misinterpreted C's fls64() function. It was treating leading_zeros() directly
as a bit position, when it should be "64 - leading_zeros()".

Before this fix we had giant lock sizes 51 bits long, but now we have reasonable 32KB lock sizes.

> > +
> > +        // Mask off the low bits of region.start, which would be ignored by the
> > +        // hardware anyways.
> > +        let region_start =
> > +            region.start & genmask_checked_u64(u32::from(region_width)..=63).ok_or(EINVAL)?;
> > +
> > +        let region = (u64::from(region_width)) | region_start;
> > +
> > +        let region_lo = (region & 0xffffffff) as u32;
> > +        let region_hi = (region >> 32) as u32;
> > +
> > +        // Lock the region that needs to be updated.
> > +        let dev = self.dev();
> > +        as_lockaddr_lo(as_nr)?.write(dev, &self.iomem, region_lo)?;
> > +        as_lockaddr_hi(as_nr)?.write(dev, &self.iomem, region_hi)?;
> > +
> > +        self.as_send_cmd(as_nr, AS_COMMAND_LOCK)
> > +    }
> > +
> > +    fn as_end_update(&mut self, as_nr: usize) -> Result {
> > +        self.validate_as_slot(as_nr)?;
> > +        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_FLUSH_PT)
> > +    }
> > +
> > +    fn as_flush(&mut self, as_nr: usize) -> Result {
> > +        self.validate_as_slot(as_nr)?;
> > +        self.as_send_cmd(as_nr, AS_COMMAND_FLUSH_PT)
> > +    }
> > +}
> > +
> > +impl AsSlotManager {
> > +    /// Locks a region for page table updates if the VM has an active slot.
> > +    pub(super) fn start_vm_update(&mut self, vm: &VmAsData, region: &Range<u64>) -> Result {
> > +        let seat = vm.as_seat.access(self);
> > +        match seat.slot() {
> > +            Some(slot) => {
> > +                let as_nr = slot as usize;
> > +                self.as_start_update(as_nr, region)
> > +            }
> > +            _ => Ok(()),
> > +        }
> > +    }
> > +
> > +    /// Flushes page table updates for a VM if it has an active slot.
> > +    pub(super) fn end_vm_update(&mut self, vm: &VmAsData) -> Result {
> > +        let seat = vm.as_seat.access(self);
> > +        match seat.slot() {
> > +            Some(slot) => {
> > +                let as_nr = slot as usize;
> > +                self.as_end_update(as_nr)
> > +            }
> > +            _ => Ok(()),
> > +        }
> > +    }
> > +
> > +    /// Flushes page tables for a VM if it has an active slot.
> > +    pub(super) fn flush_vm(&mut self, vm: &VmAsData) -> Result {
> > +        let seat = vm.as_seat.access(self);
> > +        match seat.slot() {
> > +            Some(slot) => {
> > +                let as_nr = slot as usize;
> > +                self.as_flush(as_nr)
> > +            }
> > +            _ => Ok(()),
> > +        }
> > +    }
> > +
> > +    /// Flushes page tables for a VM if it has an active slot.
> > +    pub(super) fn activate_vm(&mut self, vm: ArcBorrow<'_, VmAsData>) -> Result {
> > +        self.activate(&vm.as_seat, vm.into())
> > +    }
> > +
> > +    /// Flushes page tables for a VM if it has an active slot.
> > +    pub(super) fn deactivate_vm(&mut self, vm: &VmAsData) -> Result {
> > +        self.evict(&vm.as_seat)
> > +    }
> > +}
> > diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
> > index f54b997355e0..ae435c7e80b1 100644
> > --- a/drivers/gpu/drm/tyr/tyr.rs
> > +++ b/drivers/gpu/drm/tyr/tyr.rs
> > @@ -11,6 +11,7 @@
> > mod file;
> > mod gem;
> > mod gpu;
> > +mod mmu;
> > mod regs;
> > mod slot;
> > 
> > -- 
> > 2.52.0
> > 
> 
