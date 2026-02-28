Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOouHVk8ommB1AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:52:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2901BF812
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 01:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B2C10EC4F;
	Sat, 28 Feb 2026 00:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="Ek52XV6a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA6410EC4F
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 00:52:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772239953; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nByh7OoSH77gh2pYZcfBuRCXSbkp68P97nR40jUoOBa3ac8X0R40YRkAJz3GtQ94a3mtb6lvVe7gKnez6lv3hQWvXOUMwdDtatVmVF4/ijJ75DVhWHlIE6NJ18/HDx9gnq9yTzihlyPhS60Gs2PuxiWTK/GbhMneM9jEd9m9has=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772239953;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=qYtdfsQErFigYiPJxqa2JrSJJEz/DST+jS1vjN+Gp6s=; 
 b=Bhzgof49V7zIqvckca9NK8qZEppz5l4rHibgTo0eCfiPDNgcFIILviMRlo9RFvOr3x1a4c2sqwWmZer2h6uwYwhm8VSfmRK+PyysRFE916njmqTz0z2ZYC/kmNiiMO+CwKIaZ04LC6dPFbnD4zXhS2PQqvrehLpvCe4z47CtvIU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772239953; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=qYtdfsQErFigYiPJxqa2JrSJJEz/DST+jS1vjN+Gp6s=;
 b=Ek52XV6al6dyUjWAbaKK1p3SYbBjLaDgkvvNgF7e+XIMtS7u+UJiPqDWBbCSA1Lm
 8XmwCuiRLT205usduTqlkfdLcF+62c5jctVjM5pC5rBfxU/J6cc4h3gQ5erA/dbKmWJ
 I9SwL8vr9O401Ze6Yxg2W3spJ0Qlt/w1qKk5+HI0=
Received: by mx.zohomail.com with SMTPS id 1772239952302899.7228373813125;
 Fri, 27 Feb 2026 16:52:32 -0800 (PST)
Date: Fri, 27 Feb 2026 16:52:30 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 09/12] drm/tyr: add GPU virtual memory module
Message-ID: <aaI8TlISd53lGVkh@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-10-deborah.brouwer@collabora.com>
 <20260212115433.2dc746ee@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212115433.2dc746ee@fedora>
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
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:beata.michalska@arm.com,m:lyude@redhat.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: CE2901BF812
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 11:54:33AM +0100, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 17:37:10 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > Add GPU virtual address space management using the DRM GPUVM framework.
> > Each virtual memory (VM) space is backed by ARM64 LPAE Stage 1 page tables
> > and can be mapped into hardware address space (AS) slots for GPU execution.
> > 
> > The implementation provides memory isolation and virtual address
> > allocation. VMs support mapping GEM buffer objects with configurable
> > protection flags (readonly, noexec, uncached) and handle both 4KB and 2MB
> > page sizes.
> > 
> > The vm module integrates with the MMU for address space activation and
> > provides map/unmap/remap operations with page table synchronization.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> >  drivers/gpu/drm/tyr/gem.rs |   1 -
> >  drivers/gpu/drm/tyr/gpu.rs |   1 -
> >  drivers/gpu/drm/tyr/tyr.rs |   1 +
> >  drivers/gpu/drm/tyr/vm.rs  | 783 +++++++++++++++++++++++++++++++++++++
> >  4 files changed, 784 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/gpu/drm/tyr/vm.rs
> > 
> > diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> > index 6a58f2da88d3..111acf33993f 100644
> > --- a/drivers/gpu/drm/tyr/gem.rs
> > +++ b/drivers/gpu/drm/tyr/gem.rs
> > @@ -48,7 +48,6 @@ fn new<Ctx: DeviceContext>(
> >  pub(crate) type Bo = gem::shmem::Object<BoData>;
> >  
> >  /// Creates a dummy GEM object to serve as the root of a GPUVM.
> > -#[expect(dead_code)]
> >  pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: &TyrDrmDevice<Ctx>) -> Result<ARef<Bo>> {
> >      let bo = gem::shmem::Object::<BoData>::new(
> >          ddev,
> > diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> > index b5f11bc96fa0..f5e7086ff73c 100644
> > --- a/drivers/gpu/drm/tyr/gpu.rs
> > +++ b/drivers/gpu/drm/tyr/gpu.rs
> > @@ -135,7 +135,6 @@ pub(crate) fn log(&self, pdev: &platform::Device) {
> >      }
> >  
> >      /// Returns the number of virtual address bits supported by the GPU.
> > -    #[expect(dead_code)]
> >      pub(crate) fn va_bits(&self) -> u32 {
> >          self.mmu_features & genmask_u32(0..=7)
> >      }
> > diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
> > index ae435c7e80b1..8e73db3a080a 100644
> > --- a/drivers/gpu/drm/tyr/tyr.rs
> > +++ b/drivers/gpu/drm/tyr/tyr.rs
> > @@ -14,6 +14,7 @@
> >  mod mmu;
> >  mod regs;
> >  mod slot;
> > +mod vm;
> >  
> >  kernel::module_platform_driver! {
> >      type: TyrPlatformDeviceData,
> > diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
> > new file mode 100644
> > index 000000000000..806bc4e587d6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tyr/vm.rs
> > @@ -0,0 +1,783 @@
> > +// SPDX-License-Identifier: GPL-2.0 or MIT
> > +
> > +//! GPU virtual memory management using the DRM GPUVM framework.
> > +//!
> > +//! This module manages GPU virtual address spaces, providing memory isolation and
> > +//! the illusion of owning the entire VA range, similar to CPU virtual memory. Each
> > +//! VM is backed by ARM64 LPAE Stage 1 page tables and can be mapped into hardware
> > +//! address space (AS) slots for GPU execution.
> > +#![allow(dead_code)]
> > +
> > +use core::ops::Range;
> > +
> > +use kernel::{
> > +    alloc::KBox,
> > +    c_str,
> > +    drm::{
> > +        gpuvm::{
> > +            DriverGpuVm,
> > +            GpuVaAlloc,
> > +            GpuVm,
> > +            GpuVmBoRegistered,
> > +            GpuVmCore,
> > +            OpMap,
> > +            OpMapRequest,
> > +            OpMapped,
> > +            OpRemap,
> > +            OpRemapped,
> > +            OpUnmap,
> > +            OpUnmapped, //
> > +        },
> > +        DeviceContext, //
> > +    },
> > +    impl_flags,
> > +    iommu::pgtable::{
> > +        prot,
> > +        Config,
> > +        IoPageTable,
> > +        ARM64LPAES1, //
> > +    },
> > +    new_mutex,
> > +    platform,
> > +    prelude::*,
> > +    sizes::{
> > +        SZ_1G,
> > +        SZ_2M,
> > +        SZ_4K, //
> > +    },
> > +    sync::{
> > +        aref::ARef,
> > +        Arc,
> > +        ArcBorrow,
> > +        Mutex, //
> > +    },
> > +    uapi, //
> > +};
> > +
> > +use crate::{
> > +    driver::{
> > +        TyrDrmDevice,
> > +        TyrDrmDriver, //
> > +    },
> > +    gem,
> > +    gem::Bo,
> > +    gpu::GpuInfo,
> > +    mmu::{
> > +        address_space::*,
> > +        Mmu, //
> > +    },
> > +    regs::*, //
> > +};
> > +
> > +impl_flags!(
> > +    #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
> > +    pub(crate) struct VmMapFlags(u32);
> 
> Missing docs. I'll stop pointing those out, and let you check any
> undocumented pub struct/enum/field/function in v2. I'm here to help if
> you're struggling to find a good description.

Ack, I will include extensive docs for v2.

> 
> > +
> > +    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
> > +    pub(crate) enum VmFlag {
> > +        Readonly = uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_READONLY as u32,
> > +        Noexec = uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC as u32,
> > +        Uncached = uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED as u32,
> > +    }
> > +);
> > +
> > +impl VmMapFlags {
> > +    /// Convert the flags to `pgtable::prot`.
> > +    fn to_prot(self) -> u32 {
> > +        let mut prot = 0;
> > +
> > +        if self.contains(VmFlag::Readonly) {
> > +            prot |= prot::READ;
> > +        } else {
> > +            prot |= prot::READ | prot::WRITE;
> > +        }
> > +
> > +        if self.contains(VmFlag::Noexec) {
> > +            prot |= prot::NOEXEC;
> > +        }
> > +
> > +        if !self.contains(VmFlag::Uncached) {
> > +            prot |= prot::CACHE;
> > +        }
> > +
> > +        prot
> > +    }
> > +}
> > +
> > +impl core::fmt::Display for VmMapFlags {
> > +    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
> > +        let mut first = true;
> > +
> > +        if self.contains(VmFlag::Readonly) {
> > +            write!(f, "READONLY")?;
> > +            first = false;
> > +        }
> > +        if self.contains(VmFlag::Noexec) {
> > +            if !first {
> > +                write!(f, " | ")?;
> > +            }
> > +            write!(f, "NOEXEC")?;
> > +            first = false;
> > +        }
> > +
> > +        if self.contains(VmFlag::Uncached) {
> > +            if !first {
> > +                write!(f, " | ")?;
> > +            }
> > +            write!(f, "UNCACHED")?;
> > +        }
> > +
> > +        Ok(())
> > +    }
> > +}
> > +
> > +impl TryFrom<u32> for VmMapFlags {
> > +    type Error = Error;
> > +
> > +    fn try_from(value: u32) -> core::result::Result<Self, Self::Error> {
> > +        let valid = (kernel::uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_READONLY
> > +            | kernel::uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC
> > +            | kernel::uapi::drm_panthor_vm_bind_op_flags_DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED)
> > +            as u32;
> > +
> > +        if value & !valid != 0 {
> > +            pr_err!("Invalid VM map flags: {:#x}\n", value);
> > +            return Err(EINVAL);
> > +        }
> > +        Ok(Self(value))
> > +    }
> > +}
> > +
> > +struct VmMapArgs {
> > +    flags: VmMapFlags,
> > +    vm_bo: GpuVmBoRegistered<GpuVmData>,
> > +    bo_offset: u64,
> > +}
> > +
> > +enum VmOpType {
> > +    Map(VmMapArgs),
> > +    Unmap,
> > +}
> > +
> > +struct VmOpResources {
> > +    /// This handles the remap case.
> > +    ///
> > +    /// Partial unmap requests or map requests overlapping existing mappings
> > +    /// will trigger a remap call, which needs to register up to three VA
> > +    /// objects (one for the new mapping, and two for the previous and next
> > +    /// mappings).
> > +    preallocated_gpuvas: [Option<GpuVaAlloc<GpuVmData>>; 3],
> > +}
> > +
> > +struct VmOpRequest {
> > +    /// Request type.
> > +    op_type: VmOpType,
> > +
> > +    /// Region of the virtual address space covered by this request.
> > +    region: Range<u64>,
> > +}
> > +
> > +struct PtMapArgs {
> > +    /// Flags describing authorized accesses for this mapping.
> > +    ///
> > +    /// This is directly derived from the VmMapFlags.
> > +    prot: u32,
> > +}
> > +
> > +enum PtOpType {
> > +    Map(PtMapArgs),
> > +    Unmap,
> > +}
> > +
> > +pub(crate) struct PtUpdateContext<'ctx> {
> > +    /// Page table.
> > +    pt: &'ctx IoPageTable<ARM64LPAES1>,
> > +
> > +    /// MMU
> > +    mmu: &'ctx Mmu,
> > +
> > +    /// Reference to the AS data to pass to the MMU functions
> > +    as_data: &'ctx VmAsData,
> > +
> > +    /// Region of the virtual address space covered by this request.
> > +    region: Range<u64>,
> > +
> > +    /// Operation type.
> > +    op_type: PtOpType,
> > +
> > +    /// Pre-allocated resources that can be used when executing the request.
> > +    resources: &'ctx mut VmOpResources,
> > +}
> > +
> > +impl<'ctx> PtUpdateContext<'ctx> {
> > +    fn new(
> > +        pt: &'ctx IoPageTable<ARM64LPAES1>,
> > +        mmu: &'ctx Mmu,
> > +        as_data: &'ctx VmAsData,
> > +        region: Range<u64>,
> > +        op_type: PtOpType,
> > +        resources: &'ctx mut VmOpResources,
> > +    ) -> Result<PtUpdateContext<'ctx>> {
> > +        mmu.start_vm_update(as_data, &region)?;
> > +
> > +        Ok(Self {
> > +            pt,
> > +            mmu,
> > +            as_data,
> > +            region,
> > +            op_type,
> > +            resources,
> > +        })
> > +    }
> > +
> > +    /// Finds one of our pre-allocated VAs.
> > +    ///
> > +    /// It is a logic error to call this more than three times for a given
> > +    /// PtUpdateContext.
> > +    fn preallocated_gpuva(&mut self) -> Result<GpuVaAlloc<GpuVmData>> {
> > +        self.resources
> > +            .preallocated_gpuvas
> > +            .iter_mut()
> > +            .find_map(|f| f.take())
> > +            .ok_or(EINVAL)
> > +    }
> > +}
> > +
> > +impl Drop for PtUpdateContext<'_> {
> > +    fn drop(&mut self) {
> > +        if let Err(e) = self.mmu.end_vm_update(self.as_data) {
> > +            pr_err!("Failed to end VM update {:?}\n", e);
> > +        }
> > +
> > +        if let Err(e) = self.mmu.flush_vm(self.as_data) {
> > +            pr_err!("Failed to flush VM {:?}\n", e);
> > +        }
> > +    }
> > +}
> > +
> > +pub(crate) struct GpuVmData {}
> > +
> > +/// GPU virtual address space.
> > +///
> > +/// Each VM can be mapped into a hardware address space slot.
> > +#[pin_data]
> > +pub(crate) struct Vm {
> > +    /// Data referenced by an AS when the VM is active
> > +    as_data: Arc<VmAsData>,
> > +    /// MMU manager.
> > +    mmu: Arc<Mmu>,
> > +    /// Platform device reference (needed to access the page table through devres).
> > +    pdev: ARef<platform::Device>,
> > +    /// DRM GPUVM core for managing virtual address space.
> > +    #[pin]
> > +    gpuvm_core: Mutex<GpuVmCore<GpuVmData>>,
> > +    /// Non-core part of the GPUVM. Can be used for stuff that doesn't modify the
> > +    /// internal mapping tree, like GpuVm::obtain()
> > +    gpuvm: ARef<GpuVm<GpuVmData>>,
> > +    /// VA range for this VM.
> > +    va_range: Range<u64>,
> > +}
> > +
> > +impl Vm {
> > +    pub(crate) fn new<Ctx: DeviceContext>(
> > +        pdev: &platform::Device,
> > +        ddev: &TyrDrmDevice<Ctx>,
> > +        mmu: ArcBorrow<'_, Mmu>,
> > +        gpu_info: &GpuInfo,
> > +    ) -> Result<Arc<Vm>> {
> > +        let va_bits = gpu_info.va_bits();
> > +        let pa_bits = gpu_info.pa_bits();
> > +
> > +        let pt_config = Config {
> > +            quirks: 0,
> > +            pgsize_bitmap: SZ_4K | SZ_2M,
> > +            ias: va_bits,
> > +            oas: pa_bits,
> > +            coherent_walk: false,
> > +        };
> > +
> > +        // SAFETY: pdev is a bound device.
> > +        let dev = unsafe { pdev.as_ref().as_bound() };
> > +        let page_table_init = IoPageTable::new(dev, pt_config);
> > +        let page_table = KBox::pin_init(page_table_init, GFP_KERNEL).inspect_err(|e| {
> > +            pr_err!("Failed to initialize page table: {:?}\n", e);
> > +        })?;
> > +        let pt = page_table.access(dev).inspect_err(|e| {
> > +            pr_err!("Failed to access page table: {:?}\n", e);
> > +        })?;
> > +
> > +        let as_config = AddressSpaceConfig {
> > +            transcfg: AS_TRANSCFG_PTW_MEMATTR_WB
> > +                | AS_TRANSCFG_PTW_RA
> > +                | AS_TRANSCFG_ADRMODE_AARCH64_4K
> > +                | as_transcfg_ina_bits(u64::from(55 - va_bits)),
> > +            // SAFETY: Vm::drop() evicts the address space and performs deferred
> > +            // cleanup before dropping the page_table Arc. This ensures that
> > +            // the device stops using the page table before it is dropped
> > +            transtab: unsafe { pt.ttbr() },
> > +            memattr: mair_to_memattr(pt.mair()),
> > +        };
> > +
> > +        let range = 0..(1u64 << va_bits);
> > +        let reserve_range = 0..0u64;
> > +
> > +        let dummy_obj = gem::new_dummy_object(ddev).inspect_err(|e| {
> > +            pr_err!("Failed to create dummy GEM object: {:?}\n", e);
> > +        })?;
> > +
> > +        let gpuvm_core = kernel::drm::gpuvm::GpuVm::new::<Error, _>(
> > +            c_str!("Tyr::GpuVm"),
> > +            ddev,
> > +            &*dummy_obj,
> > +            range.clone(),
> > +            reserve_range,
> > +            GpuVmData {},
> > +        )
> > +        .inspect_err(|e| {
> > +            pr_err!("Failed to create GpuVm: {:?}\n", e);
> > +        })?;
> > +        let gpuvm = ARef::from(&*gpuvm_core);
> > +
> > +        let as_data = Arc::new(VmAsData::new(&mmu, as_config, page_table), GFP_KERNEL)?;
> > +
> > +        let vm = Arc::pin_init(
> > +            pin_init!(Self{
> > +                as_data: as_data,
> > +                pdev: pdev.into(),
> > +                mmu: mmu.into(),
> > +                gpuvm: gpuvm,
> > +                gpuvm_core <- new_mutex!(gpuvm_core),
> > +                va_range: range,
> > +            }),
> > +            GFP_KERNEL,
> > +        )?;
> > +
> > +        Ok(vm)
> > +    }
> > +
> > +    /// Activate the VM in a hardware address space slot.
> > +    pub(crate) fn activate(&self) -> Result {
> > +        self.mmu
> > +            .activate_vm(self.as_data.as_arc_borrow())
> > +            .inspect_err(|e| {
> > +                pr_err!("Failed to activate VM: {:?}\n", e);
> > +            })
> > +    }
> > +
> > +    /// Deactivate the VM by evicting it from its address space slot.
> > +    fn deactivate(&self) -> Result {
> > +        self.mmu.deactivate_vm(&self.as_data).inspect_err(|e| {
> > +            pr_err!("Failed to deactivate VM: {:?}\n", e);
> > +        })
> > +    }
> > +
> > +    pub(crate) fn kill(&self) {
> > +        // TODO: Turn the VM into a state where it can't be used.
> 
> Should we address this TODO before it gets merged? I also believe this
> should be done under some lock (the gpuvm lock?) to prevent concurrent
> map/unmap operations.
>
Could you suggest an approach? In our previous drafts I implemented a
bool to track whether the vm was killed, but I don't think that was what
you are thinking of.

> > +        let _ = self.deactivate().inspect_err(|e| {
> > +            pr_err!("Failed to deactivate VM: {:?}\n", e);
> > +        });
> > +        let _ = self
> > +            .unmap_range(self.va_range.start, self.va_range.end - self.va_range.start)
> > +            .inspect_err(|e| {
> > +                pr_err!("Failed to unmap range during deactivate: {:?}\n", e);
> > +            });
> > +    }
> > +
> > +    fn exec_op(
> > +        &self,
> > +        gpuvm_core: &mut GpuVmCore<GpuVmData>,
> > +        req: VmOpRequest,
> > +        resources: &mut VmOpResources,
> > +    ) -> Result {
> > +        let pt = self
> > +            .as_data
> > +            .page_table
> > +            // SAFETY: pdev is a bound device.
> > +            .access(unsafe { self.pdev.as_ref().as_bound() })
> > +            .inspect_err(|e| {
> > +                pr_err!("Failed to access page table while mapping pages: {:?}\n", e);
> > +            })?;
> > +
> > +        match req.op_type {
> > +            VmOpType::Map(args) => {
> > +                let mut pt_upd = PtUpdateContext::new(
> > +                    pt,
> > +                    &self.mmu,
> > +                    &self.as_data,
> > +                    req.region,
> > +                    PtOpType::Map(PtMapArgs {
> > +                        prot: args.flags.to_prot(),
> > +                    }),
> > +                    resources,
> > +                )?;
> > +
> > +                gpuvm_core.sm_map(OpMapRequest {
> > +                    addr: pt_upd.region.start,
> > +                    range: pt_upd.region.end - pt_upd.region.start,
> > +                    gem_offset: args.bo_offset,
> > +                    vm_bo: args.vm_bo,
> > +                    context: &mut pt_upd,
> > +                })
> > +                //PtUpdateContext drops here flushing the page table
> > +            }
> > +            VmOpType::Unmap => {
> > +                let mut pt_upd = PtUpdateContext::new(
> > +                    pt,
> > +                    &self.mmu,
> > +                    &self.as_data,
> > +                    req.region,
> > +                    PtOpType::Unmap,
> > +                    resources,
> > +                )?;
> > +
> > +                gpuvm_core.sm_unmap(
> > +                    pt_upd.region.start,
> > +                    pt_upd.region.end - pt_upd.region.start,
> > +                    &mut pt_upd,
> > +                )
> > +                //PtUpdateContext drops here flushing the page table
> > +            }
> > +        }
> > +    }
> > +
> > +    /// Map a GEM object range into the VM.
> > +    pub(crate) fn map_bo_range(
> > +        &self,
> > +        bo: &Bo,
> > +        bo_offset: u64,
> > +        size: u64,
> > +        va: u64,
> > +        flags: VmMapFlags,
> > +    ) -> Result {
> > +        let req = VmOpRequest {
> > +            op_type: VmOpType::Map(VmMapArgs {
> > +                vm_bo: self.gpuvm.obtain(bo, ())?,
> > +                flags,
> > +                bo_offset,
> > +            }),
> > +            region: va..(va + size),
> > +        };
> > +        let mut resources = VmOpResources {
> > +            preallocated_gpuvas: [
> > +                Some(GpuVaAlloc::<GpuVmData>::new(GFP_KERNEL)?),
> > +                Some(GpuVaAlloc::<GpuVmData>::new(GFP_KERNEL)?),
> > +                Some(GpuVaAlloc::<GpuVmData>::new(GFP_KERNEL)?),
> > +            ],
> > +        };
> > +        let mut gpuvm_core = self.gpuvm_core.lock();
> > +
> > +        self.exec_op(gpuvm_core.as_mut().get_mut(), req, &mut resources)?;
> > +
> > +        // We flush the defer cleanup list now. Things will be different in
> > +        // the asynchronous VM_BIND path, where we want the cleanup to
> > +        // happen outside the DMA signalling path.
> > +        self.gpuvm.deferred_cleanup();
> > +        Ok(())
> > +    }
> > +
> > +    pub(crate) fn unmap_range(&self, va: u64, size: u64) -> Result {
> > +        let req = VmOpRequest {
> > +            op_type: VmOpType::Unmap,
> > +            region: va..(va + size),
> > +        };
> > +        let mut resources = VmOpResources {
> > +            preallocated_gpuvas: [
> > +                Some(GpuVaAlloc::<GpuVmData>::new(GFP_KERNEL)?),
> > +                Some(GpuVaAlloc::<GpuVmData>::new(GFP_KERNEL)?),
> > +                None,
> > +            ],
> > +        };
> > +        let mut gpuvm_core = self.gpuvm_core.lock();
> > +
> > +        self.exec_op(gpuvm_core.as_mut().get_mut(), req, &mut resources)?;
> > +
> > +        // We flush the defer cleanup list now. Things will be different in
> > +        // the asynchronous VM_BIND path, where we want the cleanup to
> > +        // happen outside the DMA signalling path.
> > +        self.gpuvm.deferred_cleanup();
> > +        Ok(())
> > +    }
> > +}
> > +
> > +impl DriverGpuVm for GpuVmData {
> > +    type Driver = TyrDrmDriver;
> > +    type Object = Bo;
> > +    type VmBoData = ();
> > +    type VaData = ();
> > +    type SmContext<'ctx> = PtUpdateContext<'ctx>;
> > +
> > +    fn sm_step_map<'op>(
> > +        &mut self,
> > +        op: OpMap<'op, Self>,
> > +        context: &mut Self::SmContext<'_>,
> > +    ) -> Result<OpMapped<'op, Self>, Error> {
> > +        let start_iova = op.addr();
> > +        let mut iova = start_iova;
> > +        let mut bytes_left_to_map = op.length();
> > +        let mut gem_offset = op.gem_offset();
> > +        let sgt = op.obj().sg_table().inspect_err(|e| {
> > +            pr_err!("Failed to get sg_table: {:?}\n", e);
> > +        })?;
> > +        let prot = match &context.op_type {
> > +            PtOpType::Map(args) => args.prot,
> > +            _ => {
> > +                return Err(EINVAL);
> > +            }
> > +        };
> > +
> > +        for sgt_entry in sgt.iter() {
> > +            let mut paddr = sgt_entry.dma_address();
> > +            let mut sgt_entry_length: u64 = sgt_entry.dma_len();
> > +
> > +            if bytes_left_to_map == 0 {
> > +                break;
> > +            }
> > +
> > +            if gem_offset > 0 {
> > +                // Skip the entire SGT entry if the gem_offset exceeds its length
> > +                let skip = sgt_entry_length.min(gem_offset);
> > +                paddr += skip;
> > +                sgt_entry_length -= skip;
> > +                gem_offset -= skip;
> > +            }
> > +
> > +            if sgt_entry_length == 0 {
> > +                continue;
> > +            }
> > +
> > +            if gem_offset != 0 {
> > +                pr_err!("Invalid gem_offset {} in page table mapping.\n", gem_offset);
> > +                return Err(EINVAL);
> > +            }
> > +            let len = sgt_entry_length.min(bytes_left_to_map);
> > +
> > +            let segment_mapped = match pt_map(context.pt, iova, paddr, len, prot) {
> > +                Ok(segment_mapped) => segment_mapped,
> > +                Err(e) => {
> > +                    // clean up any successful mappings from previous SGT entries.
> > +                    let total_mapped = iova - start_iova;
> > +                    if total_mapped > 0 {
> > +                        pt_unmap(context.pt, start_iova..(start_iova + total_mapped)).ok();
> > +                    }
> > +                    return Err(e);
> > +                }
> > +            };
> > +
> > +            // Since there could be a partial mapping, only advance by the actual amount mapped
> > +            bytes_left_to_map -= segment_mapped;
> > +            iova += segment_mapped;
> > +        }
> > +
> > +        let gpuva = context.preallocated_gpuva()?;
> > +        let op = op.insert(gpuva, pin_init::init_zeroed());
> > +
> > +        Ok(op)
> > +    }
> > +
> > +    fn sm_step_unmap<'op>(
> > +        &mut self,
> > +        op: OpUnmap<'op, Self>,
> > +        context: &mut Self::SmContext<'_>,
> > +    ) -> Result<OpUnmapped<'op, Self>, Error> {
> > +        let start_iova = op.va().addr();
> > +        let length = op.va().length();
> > +
> > +        let region = start_iova..(start_iova + length);
> > +        pt_unmap(context.pt, region.clone()).inspect_err(|e| {
> > +            pr_err!(
> > +                "Failed to unmap region {:#x}..{:#x}: {:?}\n",
> > +                region.start,
> > +                region.end,
> > +                e
> > +            );
> > +        })?;
> > +
> > +        let (op_unmapped, _va_removed) = op.remove();
> > +
> > +        Ok(op_unmapped)
> > +    }
> > +
> > +    fn sm_step_remap<'op>(
> > +        &mut self,
> > +        op: OpRemap<'op, Self>,
> > +        context: &mut Self::SmContext<'_>,
> > +    ) -> Result<OpRemapped<'op, Self>, Error> {
> > +        let unmap_start = if let Some(prev) = op.prev() {
> > +            prev.addr() + prev.length()
> > +        } else {
> > +            op.va_to_unmap().addr()
> > +        };
> > +
> > +        let unmap_end = if let Some(next) = op.next() {
> > +            next.addr()
> > +        } else {
> > +            op.va_to_unmap().addr() + op.va_to_unmap().length()
> > +        };
> > +
> > +        let unmap_length = unmap_end - unmap_start;
> > +
> > +        if unmap_length > 0 {
> > +            let region = unmap_start..(unmap_start + unmap_length);
> > +            pt_unmap(context.pt, region.clone()).inspect_err(|e| {
> > +                pr_err!(
> > +                    "Failed to unmap remap region {:#x}..{:#x}: {:?}\n",
> > +                    region.start,
> > +                    region.end,
> > +                    e
> > +                );
> > +            })?;
> > +        }
> > +
> > +        let prev_va = context.preallocated_gpuva()?;
> > +        let next_va = context.preallocated_gpuva()?;
> > +
> > +        let (op_remapped, _remap_ret) = op.remap(
> > +            [prev_va, next_va],
> > +            pin_init::init_zeroed(),
> > +            pin_init::init_zeroed(),
> > +        );
> > +
> > +        Ok(op_remapped)
> > +    }
> > +}
> > +
> > +fn mair_to_memattr(mair: u64) -> u64 {
> > +    let mut memattr: u64 = 0;
> > +
> > +    for i in 0..8 {
> > +        let in_attr = (mair >> (8 * i)) as u8;
> > +        let outer = in_attr >> 4;
> > +        let inner = in_attr & 0xf;
> > +
> > +        // For caching to be enabled, inner and outer caching policy
> > +        // have to be both write-back, if one of them is write-through
> > +        // or non-cacheable, we just choose non-cacheable. Device
> > +        // memory is also translated to non-cacheable.
> > +        let out_attr = if (outer & 3 == 0) || (outer & 4 == 0) || (inner & 4 == 0) {
> > +            AS_MEMATTR_AARCH64_INNER_OUTER_NC
> > +                | AS_MEMATTR_AARCH64_SH_MIDGARD_INNER
> > +                | as_memattr_aarch64_inner_alloc_expl(false, false)
> > +        } else {
> > +            // Use SH_CPU_INNER mode so SH_IS, which is used when
> > +            // IOMMU_CACHE is set, actually maps to the standard
> > +            // definition of inner-shareable and not Mali's
> > +            // internal-shareable mode.
> > +            //
> > +            // TODO: this assumes a non-coherent system.
> > +            AS_MEMATTR_AARCH64_INNER_OUTER_WB
> > +                | AS_MEMATTR_AARCH64_SH_MIDGARD_INNER
> > +                | as_memattr_aarch64_inner_alloc_expl(inner & 1 != 0, inner & 2 != 0)
> > +        };
> > +
> > +        memattr |= (u64::from(out_attr)) << (8 * i);
> > +    }
> > +
> > +    memattr
> > +}
> > +
> > +// We can map multiple pages at once but we can't exceed the size of the
> > +// table entry itself. So, if mapping 4KB pages, figure out how many pages
> > +// can be mapped before we hit the 2MB boundary. Or, if mapping 2MB pages,
> > +// figure out how many pages can be mapped before hitting the 1GB boundary
> > +// Returns the page size (4KB or 2MB) and the number of pages that can be mapped at that size.
> > +fn get_pgsize(addr: u64, size: u64) -> (u64, u64) {
> > +    // Get the distance to the next boundary of 2MB block
> > +    let blk_offset_2m = addr.wrapping_neg() % (SZ_2M as u64);
> > +
> > +    // Use 4K blocks if the address is not 2MB aligned, or we have less than 2MB to map
> > +    if blk_offset_2m != 0 || size < SZ_2M as u64 {
> > +        let pgcount = if blk_offset_2m == 0 {
> > +            size / SZ_4K as u64
> > +        } else {
> > +            blk_offset_2m.min(size) / SZ_4K as u64
> > +        };
> > +        return (SZ_4K as u64, pgcount);
> > +    }
> > +
> > +    let blk_offset_1g = addr.wrapping_neg() % (SZ_1G as u64);
> > +    let blk_offset = if blk_offset_1g == 0 {
> > +        SZ_1G as u64
> > +    } else {
> > +        blk_offset_1g
> > +    };
> > +    let pgcount = blk_offset.min(size) / SZ_2M as u64;
> > +
> > +    (SZ_2M as u64, pgcount)
> > +}
> > +
> > +fn pt_map(
> > +    pt: &IoPageTable<ARM64LPAES1>,
> > +    iova: u64,
> > +    paddr: u64,
> > +    len: u64,
> > +    prot: u32,
> > +) -> Result<u64> {
> > +    let mut segment_mapped = 0u64;
> > +    while segment_mapped < len {
> > +        let remaining = len - segment_mapped;
> > +        let curr_iova = iova + segment_mapped;
> > +        let curr_paddr = paddr + segment_mapped;
> > +
> > +        let (pgsize, pgcount) = get_pgsize(curr_iova | curr_paddr, remaining);
> > +
> > +        // SAFETY: Exclusive access to the page table is ensured because
> > +        // the pt reference comes from PtUpdateContext, which was
> > +        // created while holding &mut Vm, preventing any other access to the
> > +        // page table for the duration of this operation.
> > +        let (mapped, result) = unsafe {
> > +            pt.map_pages(
> > +                curr_iova as usize,
> > +                (curr_paddr as usize).try_into().unwrap(),
> > +                pgsize as usize,
> > +                pgcount as usize,
> > +                prot,
> > +                GFP_KERNEL,
> > +            )
> > +        };
> > +
> > +        if let Err(e) = result {
> > +            pr_err!("pt.map_pages failed at iova {:#x}: {:?}\n", curr_iova, e);
> > +            if segment_mapped > 0 {
> > +                pt_unmap(pt, iova..(iova + segment_mapped)).ok();
> > +            }
> > +            return Err(e);
> > +        }
> > +
> > +        if mapped == 0 {
> > +            pr_err!("Failed to map any pages at iova {:#x}\n", curr_iova);
> > +            if segment_mapped > 0 {
> > +                pt_unmap(pt, iova..(iova + segment_mapped)).ok();
> > +            }
> > +            return Err(ENOMEM);
> > +        }
> > +
> > +        segment_mapped += mapped as u64;
> > +    }
> > +
> > +    Ok(segment_mapped)
> > +}
> > +
> > +fn pt_unmap(pt: &IoPageTable<ARM64LPAES1>, range: Range<u64>) -> Result {
> > +    let mut iova = range.start;
> > +    let mut bytes_left_to_unmap = range.end - range.start;
> > +
> > +    while bytes_left_to_unmap > 0 {
> > +        let (pgsize, pgcount) = get_pgsize(iova, bytes_left_to_unmap);
> > +
> > +        // SAFETY: Exclusive access to the page table is ensured because
> > +        // the pt reference comes from PtUpdateContext, which was
> > +        // created while holding &mut Vm, preventing any other access to the
> > +        // page table for the duration of this operation.
> > +        let unmapped = unsafe { pt.unmap_pages(iova as usize, pgsize as usize, pgcount as usize) };
> > +
> > +        if unmapped == 0 {
> > +            pr_err!("Failed to unmap any bytes at iova {:#x}\n", iova);
> > +            return Err(EINVAL);
> > +        }
> > +
> > +        bytes_left_to_unmap -= unmapped as u64;
> > +        iova += unmapped as u64;
> > +    }
> > +
> > +    Ok(())
> > +}
> 
