Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ECABA8393
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 09:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD9C10E3A1;
	Mon, 29 Sep 2025 07:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fVs59kA9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2A910E0BF;
 Mon, 29 Sep 2025 07:19:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8E22C62308;
 Mon, 29 Sep 2025 07:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0036BC4CEF4;
 Mon, 29 Sep 2025 07:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759130339;
 bh=fkCFAKqmnEB7GXdZAgr1rfARjSCT5mvAOm5qmdONesk=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=fVs59kA9BHVDlhFsctihOnF2LXp6HxxhIQjlIa4m0i6zy4PExJ+tfnri/UXhP/a4U
 NUihftuV6xGkj3ulEm22VNVAE6858cMSInYHt2ndTTh1LOt8Op7eGXKXJlK40qiAoN
 7A163hBqOwSy9F+ky1/INnmnh8uz8oN+Zn+l0HJW+kmliJCB1F0iyNIXAdN6r0wWPg
 bcJbUII6XWK5v9xmO3bQfvjEjIf87zFsle1rxpECOHPqgnf/b7PVRJ5V2ON/daTAVB
 B9Ve7ziJ6OelaH971R2EQUYLK2URPkgzrNp6owiumbaJMNE3krYNExW0x2kSH/xcWz
 ht3r9r+yHT7kg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 09:18:53 +0200
Message-Id: <DD53NQP11F11.1JAJXDG2NQRU7@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 06/10] gpu: nova-core: gsp: Create rmargs
Cc: "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
To: "Alistair Popple" <apopple@nvidia.com>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-7-apopple@nvidia.com>
 <DD2JYDPBOKA8.2QCK0P7CR1T3V@nvidia.com>
 <q2ehvle73bvop6muga44cebwzgpm2g5tghf2txq2orvgsaryh2@hfmxjcymhsrl>
In-Reply-To: <q2ehvle73bvop6muga44cebwzgpm2g5tghf2txq2orvgsaryh2@hfmxjcymhsrl>
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

On Mon Sep 29, 2025 at 8:36 AM CEST, Alistair Popple wrote:
> On 2025-09-26 at 17:27 +1000, Alexandre Courbot <acourbot@nvidia.com> wro=
te...
>> On Mon Sep 22, 2025 at 8:30 PM JST, Alistair Popple wrote:
>> > @@ -33,6 +36,7 @@ pub(crate) struct Gsp {
>> >      pub logintr: CoherentAllocation<u8>,
>> >      pub logrm: CoherentAllocation<u8>,
>> >      pub cmdq: GspCmdq,
>> > +    rmargs: CoherentAllocation<GSP_ARGUMENTS_CACHED>,
>> >  }
>> > =20
>> >  /// Creates a self-mapping page table for `obj` at its beginning.
>> > @@ -90,12 +94,35 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound=
>) -> Result<impl PinInit<Self
>> > =20
>> >          // Creates its own PTE array
>> >          let cmdq =3D GspCmdq::new(dev)?;
>> > +        let rmargs =3D
>> > +            create_coherent_dma_object::<GSP_ARGUMENTS_CACHED>(dev, "=
RMARGS", 1, &mut libos, 3)?;
>> > +        let (shared_mem_phys_addr, cmd_queue_offset, stat_queue_offse=
t) =3D cmdq.get_cmdq_offsets();
>> > +
>> > +        dma_write!(
>> > +            rmargs[0].messageQueueInitArguments =3D MESSAGE_QUEUE_INI=
T_ARGUMENTS {
>> > +                sharedMemPhysAddr: shared_mem_phys_addr,
>> > +                pageTableEntryCount: cmdq.nr_ptes,
>> > +                cmdQueueOffset: cmd_queue_offset,
>> > +                statQueueOffset: stat_queue_offset,
>> > +                ..Default::default()
>> > +            }
>> > +        )?;
>> > +        dma_write!(
>> > +            rmargs[0].srInitArguments =3D GSP_SR_INIT_ARGUMENTS {
>> > +                oldLevel: 0,
>> > +                flags: 0,
>> > +                bInPMTransition: 0,
>> > +                ..Default::default()
>> > +            }
>> > +        )?;
>> > +        dma_write!(rmargs[0].bDmemStack =3D 1)?;
>>=20
>> Wrapping our bindings is going to help clean up this code as well.
>>=20
>> First, types named in CAPITALS_SNAKE_CASE are not idiomatic Rust and
>> look like constants. And it's not even like the bindings types are
>> consistently named that way, since we also have e.g. `GspFwWprMeta` - so
>> let's give them a proper public name and bring some consistency at the
>> same time.
>
> I think there are two aspects to the bindings - one which was addressed i=
n
> the comments for patch 5 is how to abstract them. The other is that the w=
ay we
> currently generate them results in some  ugly name.
>
> Given we want to generate these from our internal IDL eventually I would =
favour
> fixing this naming ugliness by touching up the currently generated bindin=
gs. So
> maybe I will do that for the next revision.

It's not about fixing the name of the generated C bindings, it's about not
leaking firmware specific structures into core code of the driver.

Please hide it in an abstraction that can deal with differences between fir=
mware
version internally; see also [1].

[1] https://lore.kernel.org/all/DCUAYNNP97QI.1VOX5XUS9KP7K@kernel.org/

>> This will make all the fields from `GSP_ARGUMENTS_CACHED` invisible to
>> this module as they should be, so the wrapping `GspArgumentsCached` type
>> should then have a constructor that receives a referene to the command
>> queue and takes the information is needs from it, similarly to
>> `GspFwWprMeta`. This will reduce the 3 `dma_write!` into a single one.
>>=20
>> Then we should remove `get_cmdq_offsets`, which is super confusing. I am
>> also not fond of `cmdq.nr_ptes`. More on them below.
>
> I will admit that was a bit of a hack.
>
>> > =20
>> >          Ok(try_pin_init!(Self {
>> >              libos,
>> >              loginit,
>> >              logintr,
>> >              logrm,
>> > +            rmargs,
>> >              cmdq,
>> >          }))
>> >      }
>> > diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core=
/gsp/cmdq.rs
>> > index a9ba1a4c73d8..9170ccf4a064 100644
>> > --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> > +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> > @@ -99,7 +99,6 @@ fn new(dev: &device::Device<device::Bound>) -> Resul=
t<Self> {
>> >          Ok(Self(gsp_mem))
>> >      }
>> > =20
>> > -    #[expect(unused)]
>> >      fn dma_handle(&self) -> DmaAddress {
>> >          self.0.dma_handle()
>> >      }
>> > @@ -218,7 +217,7 @@ pub(crate) struct GspCmdq {
>> >      dev: ARef<device::Device>,
>> >      seq: u32,
>> >      gsp_mem: DmaGspMem,
>> > -    pub _nr_ptes: u32,
>> > +    pub nr_ptes: u32,
>> >  }
>> > =20
>> >  impl GspCmdq {
>> > @@ -231,7 +230,7 @@ pub(crate) fn new(dev: &device::Device<device::Bou=
nd>) -> Result<GspCmdq> {
>> >              dev: dev.into(),
>> >              seq: 0,
>> >              gsp_mem,
>> > -            _nr_ptes: nr_ptes as u32,
>> > +            nr_ptes: nr_ptes as u32,
>> >          })
>> >      }
>> > =20
>> > @@ -382,6 +381,15 @@ pub(crate) fn receive_msg_from_gsp<M: GspMessageF=
romGsp, R>(
>> >              .advance_cpu_read_ptr(msg_header.rpc.length.div_ceil(GSP_=
PAGE_SIZE as u32));
>> >          result
>> >      }
>> > +
>> > +    pub(crate) fn get_cmdq_offsets(&self) -> (u64, u64, u64) {
>> > +        (
>> > +            self.gsp_mem.dma_handle(),
>> > +            core::mem::offset_of!(Msgq, msgq) as u64,
>> > +            (core::mem::offset_of!(GspMem, gspq) - core::mem::offset_=
of!(GspMem, cpuq)
>> > +                + core::mem::offset_of!(Msgq, msgq)) as u64,
>> > +        )
>> > +    }
>>=20
>> So this thing returns 3 u64s, one of which is actually a DMA handle,
>> while the two others are technically constants. The only thing that
>> needs to be inferred at runtime is the DMA handle - all the rest is
>> static.
>
> Thanks! That is a useful observation for cleaning these up.

Please also make sure to use the DmaAddress type instead of a raw u64 for D=
MA
addresses.

>> So we can make the two last returned values associated constants of
>> `GspCmdq`:
>>=20
>>   impl GspCmdq {
>>       /// Offset of the data after the PTEs.
>>       const POST_PTE_OFFSET: usize =3D core::mem::offset_of!(GspMem, cpu=
q);
>>=20
>>       /// Offset of command queue ring buffer.
>>       pub(crate) const CMDQ_OFFSET: usize =3D core::mem::offset_of!(GspM=
em, cpuq)
>>           + core::mem::offset_of!(Msgq, msgq)
>>           - Self::POST_PTE_OFFSET;
>>=20
>>       /// Offset of message queue ring buffer.
>>       pub(crate) const STATQ_OFFSET: usize =3D core::mem::offset_of!(Gsp=
Mem, gspq)
>>           + core::mem::offset_of!(Msgq, msgq)
>>           - Self::POST_PTE_OFFSET;
>>=20
>> `GspArgumentsCached::new` can then import `GspCmdq` and use these to
>> initialize its corresponding members.
>>=20
>> Remains `nr_ptes`. It was introduced in the previous patch as follows:
>>=20
>>     let nr_ptes =3D size_of::<GspMem>() >> GSP_PAGE_SHIFT;
>>=20
>> Which turns out to also be a constant! So let's add it next to the other=
s:
>>=20
>> impl GspCmdq {
>>     ...
>>     /// Number of page table entries for the GSP shared region.
>>     pub(crate) const NUM_PTES: usize =3D size_of::<GspMem>() >> GSP_PAGE=
_SHIFT;
>>=20
>> And you can remove `GspCmdq::nr_ptes` altogether.
>>=20
>> With this, `GspArgumentsCached::new` can take a reference to the
>> `GspCmdq` to initialize from, grab its DMA handle, and initialize
>> everything else using the constants we defined above. We remove a bunch
>> of inconsistently-named imports from `gsp.rs`, and replace
>> firmware-dependent incantations to initialize our GSP arguments with a
>> single constructor call that tells exactly what it does in a single
>> line.
>
> So this would also live in `fw.rs`? What I'm really concerned about is th=
at if
> we're not allowed access the C bindings outside of `fw.rs` then everythin=
g ends
> up in `fw.rs`, and worse still `fw.rs` basically ends up importing everyt=
hing as
> well, tightly coupling everything into one big blob.

You can (and probably should) extend the module structure, i.e. add a
sub-directory ./gsp/fw/ and structure things accordingly.
