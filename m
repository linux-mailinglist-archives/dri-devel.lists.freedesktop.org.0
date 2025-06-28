Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D67AEC376
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 02:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF99810E00C;
	Sat, 28 Jun 2025 00:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="dTvkq1SD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C5910E00C
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 00:13:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1751069570; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=F2doFgpRNe+kctg93ooMSm+aHwQZtQseEHZOkialN4dewhKyPezKXvpu1vJeuSAl6qNmyLWsWh+a93DNumhKPwIEkHGgsC5P3FQctsIK6q36AhpKPTgIjaUh86ue4xwy6SXILugzu7rSAgPYaKywkUIiCgKWGTbRMqYFXwp08n8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1751069570;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0H5Q14gT58j9sWQ7Mkf1VLBkEerIw45k/88Qa7/Ee54=; 
 b=C7t9Oni+dH1ywmeQ8PwSkOjWo3URfX1t3zHGdgYSJGC/b32VGSLRKwxYMLqFfJus4CS0n/zlm8KOB+cdbmMUHaqNohr690vtmgvxy7H8MS/xw7R6SsduDvTHoP9uoTqgFXzHlKGkHLwkYmkZhlQ6TUmBn1Y+sGzLGgWrmge+MGQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751069570; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=0H5Q14gT58j9sWQ7Mkf1VLBkEerIw45k/88Qa7/Ee54=;
 b=dTvkq1SDplJdHuRfEA3aufvDDPQQr57yXv2ZZ00yiWZoeO7fG93KDCx0J0qY0VHk
 sODw7Ipu5Zq0fa/6G28QInGEA+pFZvYr9SImHLYlUW1gjGPyra6GqABr2tUHZFff33d
 ln5y9o6EGdeOynvH/L/kVN3Aw/T5FNaKI+c8OWi8=
Received: by mx.zohomail.com with SMTPS id 1751069566742886.3233886676038;
 Fri, 27 Jun 2025 17:12:46 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] Introduce Tyr
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aF8lYpK_l2I-ts1k@pollux>
Date: Fri, 27 Jun 2025 21:12:29 -0300
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Stone <daniels@collabora.com>, Rob Herring <robh@kernel.org>,
 Alice Ryhl <alice.ryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <9D9AFE08-2CBB-4A89-866D-512D9080754C@collabora.com>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <aF8lYpK_l2I-ts1k@pollux>
To: Danilo Krummrich <dakr@kernel.org>
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

Hi Danilo, thank you an Boqun for having a look at this,


> On 27 Jun 2025, at 20:12, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Fri, Jun 27, 2025 at 07:34:04PM -0300, Daniel Almeida wrote:
>> +#[pin_data]
>> +pub(crate) struct TyrData {
>> +    pub(crate) pdev: ARef<platform::Device>,
>> +
>> +    #[pin]
>> +    clks: Mutex<Clocks>,
>> +
>> +    #[pin]
>> +    regulators: Mutex<Regulators>,
>> +
>> +    // Some inforation on the GPU. This is mainly queried by =
userspace (mesa).
>> +    pub(crate) gpu_info: GpuInfo,
>> +}
>> +
>> +unsafe impl Send for TyrData {}
>> +unsafe impl Sync for TyrData {}
>=20
> What's the safety justification for those? Why do you need them? The =
fact that
> you seem to need to implement those traits within a driver indicates =
an issue.

This was forgotten when scooped from the downstream code.

Although I think the problematic members are only Clk and Regulator
as Boqun pointed out.

In any case, my bad.

Also, for some reason the Clippy lint did not save me this time.

>=20
>> +fn issue_soft_reset(iomem: &Devres<IoMem<0>>) -> Result<()> {
>> +    let irq_enable_cmd =3D 1 | bit_u32(8);
>> +    regs::GPU_CMD.write(iomem, irq_enable_cmd)?;
>> +
>> +    let op =3D || regs::GPU_INT_RAWSTAT.read(iomem);
>> +    let cond =3D |raw_stat: &u32| -> bool { (*raw_stat >> 8) & 1 =3D=3D=
 1 };
>> +    let res =3D io::poll::read_poll_timeout(
>> +        op,
>> +        cond,
>> +        time::Delta::from_millis(100),
>> +        Some(time::Delta::from_micros(20000)),
>> +    );
>> +
>> +    if let Err(e) =3D res {
>> +        pr_err!("GPU reset failed with errno {}\n", e.to_errno());
>> +        pr_err!(
>> +            "GPU_INT_RAWSTAT is {}\n",
>> +            regs::GPU_INT_RAWSTAT.read(iomem)?
>> +        );
>=20
> This is a driver, please use dev_err!().
>=20
>> +    }
>> +
>> +    Ok(())
>> +}
>> +
>> +kernel::of_device_table!(
>> +    OF_TABLE,
>> +    MODULE_OF_TABLE,
>> +    <TyrDriver as platform::Driver>::IdInfo,
>> +    [
>> +        (of::DeviceId::new(c_str!("rockchip,rk3588-mali")), ()),
>> +        (of::DeviceId::new(c_str!("arm,mali-valhall-csf")), ())
>> +    ]
>> +);
>> +
>> +impl platform::Driver for TyrDriver {
>> +    type IdInfo =3D ();
>> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D =
Some(&OF_TABLE);
>> +
>> +    fn probe(
>> +        pdev: &platform::Device<Core>,
>> +        _info: Option<&Self::IdInfo>,
>> +    ) -> Result<Pin<KBox<Self>>> {
>> +        dev_dbg!(pdev.as_ref(), "Probed Tyr\n");
>> +
>> +        let core_clk =3D Clk::get(pdev.as_ref(), =
Some(c_str!("core")))?;
>> +        let stacks_clk =3D Clk::get(pdev.as_ref(), =
Some(c_str!("stacks")))?;
>> +        let coregroup_clk =3D Clk::get(pdev.as_ref(), =
Some(c_str!("coregroup")))?;
>> +
>> +        core_clk.prepare_enable()?;
>> +        stacks_clk.prepare_enable()?;
>> +        coregroup_clk.prepare_enable()?;
>> +
>> +        let mali_regulator =3D =
Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("mali"))?;
>> +        let sram_regulator =3D =
Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("sram"))?;
>> +
>> +        let resource =3D pdev.resource_by_index(0).ok_or(EINVAL)?;
>> +
>> +        let iomem =3D Arc::new(pdev.iomap_resource(resource)?, =
GFP_KERNEL)?;
>=20
> You can do
>=20
> let io =3D iomem.access(pdev.as_ref())?;
>=20
> which gives you an &IoMem for the whole scope of probe() without any
> limitations.
>=20
> Also, why not use iomap_resource_sized()? Lots of offsets are known at =
compile
> time. This allows you to use infallible accesses, e.g. write() instead =
of
> try_write().

Right, I did not even consider this. Should be possible indeed.

>=20
>> +
>> +        issue_soft_reset(&iomem)?;
>> +        gpu::l2_power_on(&iomem)?;
>> +
>> +        let gpu_info =3D GpuInfo::new(&iomem)?;
>> +        gpu_info.log(pdev);
>> +
>> +        let platform: ARef<platform::Device> =3D pdev.into();
>> +
>> +        let data =3D try_pin_init!(TyrData {
>> +                pdev: platform.clone(),
>> +                clks <- new_mutex!(Clocks {
>> +                    core: core_clk,
>> +                    stacks: stacks_clk,
>> +                    coregroup: coregroup_clk,
>> +                }),
>> +                regulators <- new_mutex!(Regulators {
>> +                    mali: mali_regulator,
>> +                    sram: sram_regulator,
>> +                }),
>> +                gpu_info,
>> +        });
>> +
>> +        let data =3D Arc::pin_init(data, GFP_KERNEL)?;
>> +
>> +        let tdev: ARef<TyrDevice> =3D =
drm::device::Device::new(pdev.as_ref(), data.clone())?;
>> +        drm::driver::Registration::new_foreign_owned(&tdev, =
pdev.as_ref(), 0)?;
>> +
>> +        let driver =3D KBox::pin_init(try_pin_init!(TyrDriver { =
device: tdev }), GFP_KERNEL)?;
>> +
>> +        regs::MCU_CONTROL.write(&iomem, regs::MCU_CONTROL_AUTO)?;
>> +
>> +        dev_info!(pdev.as_ref(), "Tyr initialized correctly.\n");
>=20
> Consider dev_dbg!() instead.

The problem with dev_dbg() is that it doesn't work, as Alex has also =
found out
recently. There was a thread on fixing it and I guess Tamir(?) or =
Andrew(?)
came up with a patch, but it hasn't seen any traction. I simply don't =
think
there is a way to get these to print for now (at least in upstream code)

>=20
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
>> +
>> +        dev_info!(
>> +            pdev.as_ref(),
>> +            "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status =
0x{:x}",
>> +            model_name,
>> +            self.gpu_id >> 16,
>> +            major,
>> +            minor,
>> +            status
>> +        );
>> +
>> +        dev_info!(
>> +            pdev.as_ref(),
>> +            "Features: L2:{:#x} Tiler:{:#x} Mem:{:#x} MMU:{:#x} =
AS:{:#x}",
>> +            self.l2_features,
>> +            self.tiler_features,
>> +            self.mem_features,
>> +            self.mmu_features,
>> +            self.as_present
>> +        );
>> +
>> +        dev_info!(
>> +            pdev.as_ref(),
>> +            "shader_present=3D0x{:016x} l2_present=3D0x{:016x} =
tiler_present=3D0x{:016x}",
>> +            self.shader_present,
>> +            self.l2_present,
>> +            self.tiler_present
>> +        );
>> +
>> +        dev_info!(
>> +            pdev.as_ref(),
>> +            "PA bits: {}, VA bits: {}",
>> +            self.pa_bits(),
>> +            self.va_bits()
>> +        );
>> +    }
>=20
> This is called from probe() and seems way too verbose for dev_info!(), =
please
> use dev_dbg!() instead.

Same comment as above. Although I don=E2=80=99t care about these =
printing.

I think that at this point we just need one dev_info!() at the end of =
probe,
just to make sure it worked. The rest can be converted to dev_dbg!().

OTOH, IIRC these are indeed printed for Panthor, so maybe Boris can
explain why this would be relevant.

>=20
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
> This seems like a bad idea. You really want to use Devres::access() =
from each
> entry point where you have a &Device<Bound> (such as probe()) and use =
the
> returned &IoMem instead. Otherwise every read() and write() does an =
atomic read
> and RCU read-side critical section, due to try_access().
>=20
> If you really run in a case where you don't have a &Device<Bound>, you =
can use
> Devres::try_access_with(), which takes a closure that will have an =
&IoMem as
> argument, such that you can do things like:
>=20
> io.try_access_with(|io| my_register.write(io, ...))

Right, thanks for pointing that out.

>=20
> Also, you want accessors for read32() and write32() rather than always =
use
> try_read32() and try_write32(). The latter you only want to use when =
the offset
> isn't known at compile time.
>=20
> I also recommend looking at what nova-core does for register accesses. =
Regarding
> the register!() macro in nova-core, we're working on providing this as =
generic
> infrastructure.

Oh we=E2=80=99ll definitely switch to the nova macro. We just didn=E2=80=99=
t get to
work on it yet, and IIUC it's not available atm?

In any case, if you guys post a patch to make the macro available to =
other
drivers I'll switch to that instead.

=E2=80=94 Daniel

