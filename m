Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A664BAEE196
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 16:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8F910E478;
	Mon, 30 Jun 2025 14:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="LaNd+3Rm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C2B10E478
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 14:56:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1751295386; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZGlNV2l5V1p8kneC4T+tk/ihVo+22kzM+tsSbsGRgqHnnZLjcZ4fBP3+aJMyNehnhGNWsjnGSsgUAyDvAS4n6Y0HQWWCMextaB27r3q1gMGZ9HHviHRBLyQCHW3zm4hjciR/2Nb1TQdeoFoZ39cfOT0SzeGs185tJCSTMJFt2sM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1751295386;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=MKhJfCU8D6oNq8OjnvEEFXCCvsMtAzMA8rF6Nvg89Ms=; 
 b=gXharJowWmYmafraz05F/lkcwuuc1UzCUHghDPdmC6W/xf3q5LShHybFksuJ4jqdz5/bWC8itfpZNixiVineY5Lsg/Jd1laUBvWWPklBFOIO8oJarcCpFkMa2rEUkMi/yYqzqLp5Z38UGJCugtYsZEHrjmqHeQO/XvnLADvdmMo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751295386; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=MKhJfCU8D6oNq8OjnvEEFXCCvsMtAzMA8rF6Nvg89Ms=;
 b=LaNd+3RmAFYjSJGSpu4F0vfBpvWEi9POu0xohXiYkXhzhY/WxGKKMAyaLs/Gmkjw
 D/IYuaTOvgk7A3BoPSqkcOt31RuOGQjd2mjU+iCttmm0U/K3RqVuEtUwDChH9IzAqR9
 /k1q/d0t1g8LtXCgSRYVSXat9fcbTTnERRKOXFwM=
Received: by mx.zohomail.com with SMTPS id 1751295384184695.2470900354887;
 Mon, 30 Jun 2025 07:56:24 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] Introduce Tyr
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <6bb2344c-de0f-4bf9-b9ff-b7c7338ea1d7@arm.com>
Date: Mon, 30 Jun 2025 11:56:06 -0300
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Daniel Stone <daniels@collabora.com>,
 Rob Herring <robh@kernel.org>, Alice Ryhl <alice.ryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <1ADD8502-39D2-4705-8426-67AA8865E7BC@collabora.com>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <6bb2344c-de0f-4bf9-b9ff-b7c7338ea1d7@arm.com>
To: Steven Price <steven.price@arm.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
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

Hi Steven,

> On 30 Jun 2025, at 07:11, Steven Price <steven.price@arm.com> wrote:
>=20
> Hi Daniel,
>=20
> My Rust is still quite weak, so I'll just review the GPU-specific =
parts.
> Please CC me on future posts.

I just realized I forgot about cc=E2=80=99ing the current Panthor =
maintainers. My bad.

>> +
>> +fn issue_soft_reset(iomem: &Devres<IoMem<0>>) -> Result<()> {
>> +    let irq_enable_cmd =3D 1 | bit_u32(8);
>=20
> Badly named variable? This appears to be the encoding for a soft_reset
> command.

You=E2=80=99re right.

>=20
>> +    regs::GPU_CMD.write(iomem, irq_enable_cmd)?;
>> +
>> +    let op =3D || regs::GPU_INT_RAWSTAT.read(iomem);
>> +    let cond =3D |raw_stat: &u32| -> bool { (*raw_stat >> 8) & 1 =3D=3D=
 1 };
>=20
> You appear to have a define (GPU_INT_RAWSTAT_RESET_COMPLETED) but are
> not using it?

That=E2=80=99s true, I missed it.

>=20
> Also I know panthor also gets this wrong. But the names here don't =
match
> the architecture (this is GPU_IRQ_RAWSTAT). Panthor is actually =
somewhat
> confused as some defines are GPU_IRQ_xxx, but cross-referencing with =
the
> architecture specs is so much easier when the names match up.

So.. that=E2=80=99s something I=E2=80=99ve been meaning to discuss for a =
while actually.

If the best approach here is to stick to the nomenclature from the spec =
I can
definitely rework it. However, when working on the downstream code, I =
found
that a few of the names used in the shared region were a bit cryptic. =
=46rom the
top of my mind I can recall things like "db_req/db_ack" and "ep_cfg". I =
just
found "doorbell_request/doorbell_ack" and "endpoint_config" to be more
descriptive. There were others too that I can't recall now.

[=E2=80=A6]

>=20
>> +
>> +const INFO: drm::driver::DriverInfo =3D drm::driver::DriverInfo {
>> +    major: 0,
>> +    minor: 0,
>> +    patchlevel: 0,
>> +    name: c_str!("panthor"),
>> +    desc: c_str!("ARM Mali CSF-based Rust GPU driver"),
>=20
> I'm not sure what your long-term plan here is. I can see the benefit =
of
> keeping the major/minor and name matching panthor. I would have =
thought
> including "Tyr" in the description might be handy to make it obvious
> which driver is being used (panthor already has "Panthor"). There are
> also other marketing nitpicks over the description, but I don't know =
if
> anyone actually cares ;)


So the main idea here at Collabora is to have Tyr work as a drop-in =
replacement
for Panthor in panvk. In other words, the objective is to not have to =
add yet a
new panvk backend.

Feel free to suggest whatever is on your mind for the description field. =
I am
pretty sure we can replace it with your version instead.


[=E2=80=A6]

>> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
>> new file mode 100644
>> index =
0000000000000000000000000000000000000000..a33caa7b2968e62da136f245422023ba=
6e3ad5c3
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tyr/gpu.rs
>> @@ -0,0 +1,217 @@
>> +// SPDX-License-Identifier: GPL-2.0 or MIT
>> +
>> +use crate::regs::*;
>> +use kernel::bits;
>> +use kernel::bits::genmask_u32;
>> +use kernel::devres::Devres;
>> +use kernel::io;
>> +use kernel::io::mem::IoMem;
>> +use kernel::platform;
>> +use kernel::prelude::*;
>> +use kernel::time;
>> +use kernel::transmute::AsBytes;
>> +
>> +// This can be queried by userspace to get information about the =
GPU.
>> +#[repr(C)]
>> +pub(crate) struct GpuInfo {
>> +    pub(crate) gpu_id: u32,
>> +    pub(crate) csf_id: u32,
>> +    pub(crate) gpu_rev: u32,
>> +    pub(crate) core_features: u32,
>> +    pub(crate) l2_features: u32,
>> +    pub(crate) tiler_features: u32,
>> +    pub(crate) mem_features: u32,
>> +    pub(crate) mmu_features: u32,
>> +    pub(crate) thread_features: u32,
>> +    pub(crate) max_threads: u32,
>> +    pub(crate) thread_max_workgroup_size: u32,
>> +    pub(crate) thread_max_barrier_size: u32,
>> +    pub(crate) coherency_features: u32,
>> +    pub(crate) texture_features: [u32; 4],
>> +    pub(crate) as_present: u32,
>> +    pub(crate) shader_present: u64,
>> +    pub(crate) tiler_present: u64,
>> +    pub(crate) l2_present: u64,
>> +}
>=20
> This may be me not understanding Rust. But this doesn't match struct
> drm_panthor_gpu_info - the ordering is different and you haven't
> included the padding. Does this actually work?

Oh, that is just a major bug :)

The fields and their ordering must definitely match if we want this to =
work. I
will fix it on v2.

Thanks for catching it.

By the way, it works in the sense that something can be read from =
userspace,
i.e.: you can run the IGT branch to test it. Of course, with the field =
ordering
being shuffled, we won't read the right things.

Note that I did not test with panvk yet, that would have probably caught =
it.

>=20
>> +
>> +impl GpuInfo {
>> +    pub(crate) fn new(iomem: &Devres<IoMem>) -> Result<Self> {
>> +        let gpu_id =3D GPU_ID.read(iomem)?;
>> +        let csf_id =3D GPU_CSF_ID.read(iomem)?;
>> +        let gpu_rev =3D GPU_REVID.read(iomem)?;
>> +        let core_features =3D GPU_CORE_FEATURES.read(iomem)?;
>> +        let l2_features =3D GPU_L2_FEATURES.read(iomem)?;
>> +        let tiler_features =3D GPU_TILER_FEATURES.read(iomem)?;
>> +        let mem_features =3D GPU_MEM_FEATURES.read(iomem)?;
>> +        let mmu_features =3D GPU_MMU_FEATURES.read(iomem)?;
>> +        let thread_features =3D GPU_THREAD_FEATURES.read(iomem)?;
>> +        let max_threads =3D GPU_THREAD_MAX_THREADS.read(iomem)?;
>> +        let thread_max_workgroup_size =3D =
GPU_THREAD_MAX_WORKGROUP_SIZE.read(iomem)?;
>> +        let thread_max_barrier_size =3D =
GPU_THREAD_MAX_BARRIER_SIZE.read(iomem)?;
>> +        let coherency_features =3D =
GPU_COHERENCY_FEATURES.read(iomem)?;
>> +
>> +        let texture_features =3D GPU_TEXTURE_FEATURES0.read(iomem)?;
>> +
>> +        let as_present =3D GPU_AS_PRESENT.read(iomem)?;
>> +
>> +        let shader_present =3D GPU_SHADER_PRESENT_LO.read(iomem)? as =
u64;
>> +        let shader_present =3D shader_present | =
(GPU_SHADER_PRESENT_HI.read(iomem)? as u64) << 32;
>> +
>> +        let tiler_present =3D GPU_TILER_PRESENT_LO.read(iomem)? as =
u64;
>> +        let tiler_present =3D tiler_present | =
(GPU_TILER_PRESENT_HI.read(iomem)? as u64) << 32;
>> +
>> +        let l2_present =3D GPU_L2_PRESENT_LO.read(iomem)? as u64;
>> +        let l2_present =3D l2_present | =
(GPU_L2_PRESENT_HI.read(iomem)? as u64) << 32;
>> +
>> +        Ok(Self {
>> +            gpu_id,
>> +            csf_id,
>> +            gpu_rev,
>> +            core_features,
>> +            l2_features,
>> +            tiler_features,
>> +            mem_features,
>> +            mmu_features,
>> +            thread_features,
>> +            max_threads,
>> +            thread_max_workgroup_size,
>> +            thread_max_barrier_size,
>> +            coherency_features,
>> +            texture_features: [texture_features, 0, 0, 0],
>> +            as_present,
>> +            shader_present,
>> +            tiler_present,
>> +            l2_present,
>> +        })
>=20
> TODO: Add texture_featues_{1,2,3}.

Ack

>=20
>> +    }
>> +
>> +    pub(crate) fn log(&self, pdev: &platform::Device) {
>> +        let major =3D (self.gpu_id >> 16) & 0xff;
>> +        let minor =3D (self.gpu_id >> 8) & 0xff;
>> +        let status =3D self.gpu_id & 0xff;
>> +
>> +        let model_name =3D if let Some(model) =3D GPU_MODELS
>> +            .iter()
>> +            .find(|&f| f.major =3D=3D major && f.minor =3D=3D minor)
>> +        {
>> +            model.name
>> +        } else {
>> +            "unknown"
>> +        };
>=20
> Just a heads up, we have some horrible naming rules for later GPUs =
(see
> Karunika's patch[1] adding panthor support). E.g. for major 11, minor =
2:
>=20
> * If shaders > 10 && ray tracing then Mali-G715-Immortalis
> * else if shaders >=3D 7 then Mali-G715
> * else Mali-G615 (also for major 11, minor 3).
>=20
> Although you may want to ignore this craziness for now ;)
>=20
> [1]
> =
https://lore.kernel.org/all/20250602143216.2621881-6-karunika.choo@arm.com=
/

I think we should ignore this for now. Tyr will probably not work on =
anything
else other than the rk3588 for the time being anyway.

>> +}
>> diff --git a/drivers/gpu/drm/tyr/regs.rs =
b/drivers/gpu/drm/tyr/regs.rs
>> new file mode 100644
>> index =
0000000000000000000000000000000000000000..db36cfd030d202e47619cb744cae5597=
d47f6029
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tyr/regs.rs
>> @@ -0,0 +1,252 @@
>> +// SPDX-License-Identifier: GPL-2.0 or MIT
>> +
>> +#![allow(dead_code)]
>> +
>> +use kernel::bits::bit_u64;
>> +use kernel::devres::Devres;
>> +use kernel::io::mem::IoMem;
>> +use kernel::{bits::bit_u32, prelude::*};
>> +
>> +/// Represents a register in the Register Set
>> +pub(crate) struct Register<const OFFSET: usize>;
>> +
>> +impl<const OFFSET: usize> Register<OFFSET> {
>> +    #[inline]
>> +    pub(crate) fn read(&self, iomem: &Devres<IoMem>) -> Result<u32> =
{
>> +        (*iomem).try_access().ok_or(ENODEV)?.try_read32(OFFSET)
>> +    }
>> +
>> +    #[inline]
>> +    pub(crate) fn write(&self, iomem: &Devres<IoMem>, value: u32) -> =
Result<()> {
>> +        (*iomem)
>> +            .try_access()
>> +            .ok_or(ENODEV)?
>> +            .try_write32(value, OFFSET)
>> +    }
>> +}
>=20
> You might want to consider a 64 bit register abstraction as well.
> Panthor recently switched over to avoid the whole _HI/_LO dance.

Right, that should be achievable for v2.

>=20
>> +
>> +pub(crate) const GPU_ID: Register<0x0> =3D Register;
>> +pub(crate) const GPU_L2_FEATURES: Register<0x4> =3D Register;
>> +pub(crate) const GPU_CORE_FEATURES: Register<0x8> =3D Register;
>> +pub(crate) const GPU_CSF_ID: Register<0x1c> =3D Register;
>> +pub(crate) const GPU_REVID: Register<0x280> =3D Register;
>> +pub(crate) const GPU_TILER_FEATURES: Register<0xc> =3D Register;
>> +pub(crate) const GPU_MEM_FEATURES: Register<0x10> =3D Register;
>> +pub(crate) const GPU_MMU_FEATURES: Register<0x14> =3D Register;
>> +pub(crate) const GPU_AS_PRESENT: Register<0x18> =3D Register;
>> +pub(crate) const GPU_INT_RAWSTAT: Register<0x20> =3D Register;
>> +
>> +pub(crate) const GPU_INT_RAWSTAT_FAULT: u32 =3D bit_u32(0);
>> +pub(crate) const GPU_INT_RAWSTAT_PROTECTED_FAULT: u32 =3D =
bit_u32(1);
>> +pub(crate) const GPU_INT_RAWSTAT_RESET_COMPLETED: u32 =3D =
bit_u32(8);
>> +pub(crate) const GPU_INT_RAWSTAT_POWER_CHANGED_SINGLE: u32 =3D =
bit_u32(9);
>> +pub(crate) const GPU_INT_RAWSTAT_POWER_CHANGED_ALL: u32 =3D =
bit_u32(10);
>> +pub(crate) const GPU_INT_RAWSTAT_CLEAN_CACHES_COMPLETED: u32 =3D =
bit_u32(17);
>> +pub(crate) const GPU_INT_RAWSTAT_DOORBELL_STATUS: u32 =3D =
bit_u32(18);
>> +pub(crate) const GPU_INT_RAWSTAT_MCU_STATUS: u32 =3D bit_u32(19);
>> +
>> +pub(crate) const GPU_INT_CLEAR: Register<0x24> =3D Register;
>> +pub(crate) const GPU_INT_MASK: Register<0x28> =3D Register;
>> +pub(crate) const GPU_INT_STAT: Register<0x2c> =3D Register;
>> +pub(crate) const GPU_CMD: Register<0x30> =3D Register;
>> +pub(crate) const GPU_THREAD_FEATURES: Register<0xac> =3D Register;
>> +pub(crate) const GPU_THREAD_MAX_THREADS: Register<0xa0> =3D =
Register;
>> +pub(crate) const GPU_THREAD_MAX_WORKGROUP_SIZE: Register<0xa4> =3D =
Register;
>> +pub(crate) const GPU_THREAD_MAX_BARRIER_SIZE: Register<0xa8> =3D =
Register;
>> +pub(crate) const GPU_TEXTURE_FEATURES0: Register<0xb0> =3D Register;
>> +pub(crate) const GPU_SHADER_PRESENT_LO: Register<0x100> =3D =
Register;
>> +pub(crate) const GPU_SHADER_PRESENT_HI: Register<0x104> =3D =
Register;
>> +pub(crate) const GPU_TILER_PRESENT_LO: Register<0x110> =3D Register;
>> +pub(crate) const GPU_TILER_PRESENT_HI: Register<0x114> =3D Register;
>> +pub(crate) const GPU_L2_PRESENT_LO: Register<0x120> =3D Register;
>> +pub(crate) const GPU_L2_PRESENT_HI: Register<0x124> =3D Register;
>> +pub(crate) const L2_READY_LO: Register<0x160> =3D Register;
>> +pub(crate) const L2_READY_HI: Register<0x164> =3D Register;
>> +pub(crate) const L2_PWRON_LO: Register<0x1a0> =3D Register;
>> +pub(crate) const L2_PWRON_HI: Register<0x1a4> =3D Register;
>> +pub(crate) const L2_PWRTRANS_LO: Register<0x220> =3D Register;
>> +pub(crate) const L2_PWRTRANS_HI: Register<0x204> =3D Register;
>> +pub(crate) const L2_PWRACTIVE_LO: Register<0x260> =3D Register;
>> +pub(crate) const L2_PWRACTIVE_HI: Register<0x264> =3D Register;
>> +
>> +pub(crate) const MCU_CONTROL: Register<0x700> =3D Register;
>> +pub(crate) const MCU_CONTROL_ENABLE: u32 =3D 1;
>> +pub(crate) const MCU_CONTROL_AUTO: u32 =3D 2;
>> +pub(crate) const MCU_CONTROL_DISABLE: u32 =3D 0;
>> +
>> +pub(crate) const MCU_STATUS: Register<0x704> =3D Register;
>> +pub(crate) const MCU_STATUS_DISABLED: u32 =3D 0;
>> +pub(crate) const MCU_STATUS_ENABLED: u32 =3D 1;
>> +pub(crate) const MCU_STATUS_HALT: u32 =3D 2;
>> +pub(crate) const MCU_STATUS_FATAL: u32 =3D 3;
>> +
>> +pub(crate) const GPU_COHERENCY_FEATURES: Register<0x300> =3D =
Register;
>> +
>> +pub(crate) const JOB_INT_RAWSTAT: Register<0x1000> =3D Register;
>> +pub(crate) const JOB_INT_CLEAR: Register<0x1004> =3D Register;
>> +pub(crate) const JOB_INT_MASK: Register<0x1008> =3D Register;
>> +pub(crate) const JOB_INT_STAT: Register<0x100c> =3D Register;
>> +
>> +pub(crate) const JOB_INT_GLOBAL_IF: u32 =3D bit_u32(31);
>> +
>> +pub(crate) const MMU_INT_RAWSTAT: Register<0x2000> =3D Register;
>> +pub(crate) const MMU_INT_CLEAR: Register<0x2004> =3D Register;
>> +pub(crate) const MMU_INT_MASK: Register<0x2008> =3D Register;
>> +pub(crate) const MMU_INT_STAT: Register<0x200c> =3D Register;
>> +
>> +pub(crate) const AS_TRANSCFG_ADRMODE_UNMAPPED: u64 =3D bit_u64(0);
>> +pub(crate) const AS_TRANSCFG_ADRMODE_IDENTITY: u64 =3D bit_u64(1);
>> +pub(crate) const AS_TRANSCFG_ADRMODE_AARCH64_4K: u64 =3D bit_u64(2) =
| bit_u64(1);
>> +pub(crate) const AS_TRANSCFG_ADRMODE_AARCH64_64K: u64 =3D =
bit_u64(3);
>> +pub(crate) const fn as_transcfg_ina_bits(x: u64) -> u64 {
>> +    x << 6
>> +}
>> +pub(crate) const fn as_transcfg_outa_bits(x: u64) -> u64 {
>> +    x << 14
>> +}
>> +pub(crate) const AS_TRANSCFG_SL_CONCAT: u64 =3D bit_u64(22);
>> +pub(crate) const AS_TRANSCFG_PTW_MEMATTR_NC: u64 =3D bit_u64(24);
>> +pub(crate) const AS_TRANSCFG_PTW_MEMATTR_WB: u64 =3D bit_u64(25);
>> +pub(crate) const AS_TRANSCFG_PTW_SH_NS: u64 =3D 0 << 28;
>> +pub(crate) const AS_TRANSCFG_PTW_SH_OS: u64 =3D bit_u64(29);
>> +pub(crate) const AS_TRANSCFG_PTW_SH_IS: u64 =3D bit_u64(29) | =
bit_u64(28);
>> +pub(crate) const AS_TRANSCFG_PTW_RA: u64 =3D bit_u64(30);
>> +pub(crate) const AS_TRANSCFG_DISABLE_HIER_AP: u64 =3D bit_u64(33);
>> +pub(crate) const AS_TRANSCFG_DISABLE_AF_FAULT: u64 =3D bit_u64(34);
>> +pub(crate) const AS_TRANSCFG_WXN: u64 =3D bit_u64(35);
>> +
>> +pub(crate) const MMU_BASE: usize =3D 0x2400;
>> +pub(crate) const MMU_AS_SHIFT: usize =3D 6;
>> +
>> +const fn mmu_as(as_nr: usize) -> usize {
>> +    MMU_BASE + (as_nr << MMU_AS_SHIFT)
>> +}
>> +
>> +pub(crate) struct AsRegister(usize);
>> +
>> +impl AsRegister {
>> +    fn new(as_nr: usize, offset: usize) -> Result<Self> {
>> +        if as_nr >=3D 32 {
>=20
> Should be 16 really. This is a bit of an architectural quirk. There =
are
> only ever 16 sets of address space registers, but the AS_PRESENT
> register is defined as 32 bit.

Oh, I did not know that.

>=20
>> +            Err(EINVAL)
>> +        } else {
>> +            Ok(AsRegister(mmu_as(as_nr) + offset))
>> +        }
>> +    }
>> +
>> +    #[inline]
>> +    pub(crate) fn read(&self, iomem: &Devres<IoMem>) -> Result<u32> =
{
>> +        (*iomem).try_access().ok_or(ENODEV)?.try_read32(self.0)
>> +    }
>> +
>> +    #[inline]
>> +    pub(crate) fn write(&self, iomem: &Devres<IoMem>, value: u32) -> =
Result<()> {
>> +        (*iomem)
>> +            .try_access()
>> +            .ok_or(ENODEV)?
>> +            .try_write32(value, self.0)
>> +    }
>> +}
>> +
>> +pub(crate) fn as_transtab_lo(as_nr: usize) -> Result<AsRegister> {
>> +    AsRegister::new(as_nr, 0x0)
>> +}
>> +
>> +pub(crate) fn as_transtab_hi(as_nr: usize) -> Result<AsRegister> {
>> +    AsRegister::new(as_nr, 0x4)
>> +}
>> +
>> +pub(crate) fn as_memattr_lo(as_nr: usize) -> Result<AsRegister> {
>> +    AsRegister::new(as_nr, 0x8)
>> +}
>> +
>> +pub(crate) fn as_memattr_hi(as_nr: usize) -> Result<AsRegister> {
>> +    AsRegister::new(as_nr, 0xc)
>> +}
>> +
>> +pub(crate) fn as_lockaddr_lo(as_nr: usize) -> Result<AsRegister> {
>> +    AsRegister::new(as_nr, 0x10)
>> +}
>> +
>> +pub(crate) fn as_lockaddr_hi(as_nr: usize) -> Result<AsRegister> {
>> +    AsRegister::new(as_nr, 0x14)
>> +}
>> +
>> +pub(crate) fn as_command(as_nr: usize) -> Result<AsRegister> {
>> +    AsRegister::new(as_nr, 0x18)
>> +}
>> +
>> +pub(crate) fn as_faultstatus(as_nr: usize) -> Result<AsRegister> {
>> +    AsRegister::new(as_nr, 0x1c)
>> +}
>> +
>> +pub(crate) const AS_FAULTSTATUS_ACCESS_TYPE_MASK: u32 =3D 0x3 << 8;
>> +pub(crate) const AS_FAULTSTATUS_ACCESS_TYPE_ATOMIC: u32 =3D 0x0 << =
8;
>> +pub(crate) const AS_FAULTSTATUS_ACCESS_TYPE_EX: u32 =3D 0x1 << 8;
>> +pub(crate) const AS_FAULTSTATUS_ACCESS_TYPE_READ: u32 =3D 0x2 << 8;
>> +pub(crate) const AS_FAULTSTATUS_ACCESS_TYPE_WRITE: u32 =3D 0x3 << 8;
>> +
>> +pub(crate) fn as_faultaddress_lo(as_nr: usize) -> Result<AsRegister> =
{
>> +    AsRegister::new(as_nr, 0x20)
>> +}
>> +
>> +pub(crate) fn as_faultaddress_hi(as_nr: usize) -> Result<AsRegister> =
{
>> +    AsRegister::new(as_nr, 0x24)
>> +}
>> +
>> +pub(crate) const AS_COMMAND_NOP: u32 =3D 0;
>> +pub(crate) const AS_COMMAND_UPDATE: u32 =3D 1;
>> +pub(crate) const AS_COMMAND_LOCK: u32 =3D 2;
>> +pub(crate) const AS_COMMAND_UNLOCK: u32 =3D 3;
>> +pub(crate) const AS_COMMAND_FLUSH_PT: u32 =3D 4;
>> +pub(crate) const AS_COMMAND_FLUSH_MEM: u32 =3D 5;
>=20
> These should be moved up next to as_command().

Ack

>=20
>> +
>> +pub(crate) fn as_status(as_nr: usize) -> Result<AsRegister> {
>> +    AsRegister::new(as_nr, 0x28)
>> +}
>> +
>> +pub(crate) const AS_STATUS_ACTIVE: u32 =3D bit_u32(0);
>> +
>> +pub(crate) fn as_transcfg_lo(as_nr: usize) -> Result<AsRegister> {
>> +    AsRegister::new(as_nr, 0x30)
>> +}
>> +pub(crate) fn as_transcfg_hi(as_nr: usize) -> Result<AsRegister> {
>> +    AsRegister::new(as_nr, 0x34)
>> +}
>> +
>> +pub(crate) const AS_LOCK_REGION_MIN_SIZE: u32 =3D bit_u32(15);
>> +
>> +pub(crate) const AS_MEMATTR_AARCH64_INNER_ALLOC_IMPL: u32 =3D 2 << =
2;
>> +
>> +pub(crate) fn as_memattr_aarch64_inner_alloc_expl(w: bool, r: bool) =
-> u32 {
>> +    (3 << 2) | ((w as u32) << 0) | ((r as u32) << 1)
>> +}
>> +pub(crate) const AS_MEMATTR_AARCH64_SH_MIDGARD_INNER: u32 =3D 0 << =
4;
>> +pub(crate) const AS_MEMATTR_AARCH64_SH_CPU_INNER: u32 =3D 1 << 4;
>> +pub(crate) const AS_MEMATTR_AARCH64_SH_CPU_INNER_SHADER_COH: u32 =3D =
2 << 4;
>> +pub(crate) const AS_MEMATTR_AARCH64_SHARED: u32 =3D 0 << 6;
>> +pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_NC: u32 =3D 1 << 6;
>> +pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_WB: u32 =3D 2 << 6;
>> +pub(crate) const AS_MEMATTR_AARCH64_FAULT: u32 =3D 3 << 6;
>=20
> These also should be moved.

Ack

[=E2=80=A6]

>> diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
>> index =
1409441359f510236256bc17851f9aac65c45c4e..f9959c1d889170ebe6ad5f98a431225f=
b08625b5 100644
>> --- a/rust/uapi/uapi_helper.h
>> +++ b/rust/uapi/uapi_helper.h
>> @@ -9,6 +9,7 @@
>> #include <uapi/asm-generic/ioctl.h>
>> #include <uapi/drm/drm.h>
>> #include <uapi/drm/nova_drm.h>
>> +#include<uapi/drm/panthor_drm.h>
>=20
> Missing space, I can review C for style :)

Ack

>=20
> Thanks,
> Steve
>=20
>> #include <uapi/linux/mdio.h>
>> #include <uapi/linux/mii.h>
>> #include <uapi/linux/ethtool.h>
>>=20
>> ---
>> base-commit: 1b1d6cbeba24e4c9ff39580101472efeb3bd9b6f
>> change-id: 20250627-tyr-683ec49113ba
>>=20
>> Best regards,

=E2=80=94 Daniel


