Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57795A33404
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 01:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74B910E9B0;
	Thu, 13 Feb 2025 00:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="FWp7ltq1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B807610E9B2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 00:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1739406807; x=1739666007;
 bh=fd2BKfpW/O0FEpO2NbiCO+2hcsstqB4EkikVckGXvzg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=FWp7ltq1TlSia4q1n6oPEcLeXwQNJkX+7KoWa9DcD4jTh16RrfMOarCUQ/+UXgnZj
 yoY7QwuGux/UKq0JFqraXyLZYkQG2BmztfG+sughaUuWXq+iSyD//B0CeWWcmsZWiD
 yhBUsVjA+BANubGtvaumbtmg8vYGKUzL37PWKBFbYeDH7G/wRtJLVN4eSpebue5Fjf
 ouZX7ae+6R/qGaEBLqFPFU9KyesHQklTcwTvH7RlrX8O7ezbEntAH2UUJY/aAwMfc/
 7MEe51q2HJOGdlAuzwcDwTlwuFcBhrruxYJzM4m+64hryOD/YRDQqk5F7M6R5HWjse
 qC/YeQcsmrayg==
Date: Thu, 13 Feb 2025 00:33:21 +0000
To: Alistair Popple <apopple@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com,
 cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add initial documentation
Message-ID: <82296c50-66dc-4be5-8c56-66f891047fe9@proton.me>
In-Reply-To: <xaj6mg4rgm5teesapw5d2npkr3oagaon5baqiplhzjag2fwv2j@kscfzjg3cfbv>
References: <20250209173048.17398-1-dakr@kernel.org>
 <20250209173048.17398-2-dakr@kernel.org>
 <xaj6mg4rgm5teesapw5d2npkr3oagaon5baqiplhzjag2fwv2j@kscfzjg3cfbv>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 358ef0d57b7297b1326814d2d557d3f1881a5d48
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On 13.02.25 00:27, Alistair Popple wrote:
> On Sun, Feb 09, 2025 at 06:30:25PM +0100, Danilo Krummrich wrote:
>=20
> [...]
>=20
>> +FromPrimitive API
>> +-----------------
>> +
>> +Sometimes the need arises to convert a number to a value of an enum or =
a
>> +structure.
>> +
>> +A good example from nova-core would be the ``Chipset`` enum type, which=
 defines
>> +the value ``AD102``. When probing the GPU the value ``0x192`` can be re=
ad from a
>> +certain register indication the chipset AD102. Hence, the enum value ``=
AD102``
>> +should be derived from the number ``0x192``. Currently, nova-core uses =
a custom
>> +implementation (``Chipset::from_u32`` for this.
>> +
>> +Instead, it would be desirable to have something like the ``FromPrimiti=
ve``
>> +trait [1] from the num crate.
>=20
> I took a quick look at this, mainly to get more up to speed on Rust macro=
s.
>=20
> It seemed to me that bulk of the work here is actually in getting enough
> functionality added to rust/macros/quote.rs to make writing procedural ma=
cros
> pleasant. That seemed reasonably involved (probably beyond beginner level=
) and
> not the most pressing thing so I'm not currently looking at it, but thoug=
ht I'd
> drop this note here in case it's useful for anyone else that is/wants to =
take
> a look.

We're already aware of this and actively working on a solution.

Note that we don't actually have to write this code ourselves, as it
already exists in the user-space ecosystem in the form of the quote
crate [1].
Also, since this is a dependency of the macros kernel crate, its fine to
use user-space rust, since proc-macros end up as "compiler plugins", so
they run on the host and not inside of the kernel that is being built
(so they also have access to std).
The only problem is that we need access to quote and since we don't use
cargo, it's not as easy as adding it as a dependency. Currently we're
working on a solution that will give us not only the quote crate but
also the syn crate [2] which will make building proc-macros feasible.

(Note that both crates are highly used in the Rust ecosystem and IIRC
also the compiler depends on them. So it is not just any random Rust
library that we would add to our dependencies.)

[1]: https://crates.io/crates/quote
[2]: https://crates.io/crates/syn

---
Cheers,
Benno

>=20
>  - Alistair
>=20
>> +Having this generalization also helps with implementing a generic macro=
 that
>> +automatically generates the corresponding mappings between a value and =
a number.
>> +
>> +| Complexity: Beginner
>> +| Link: https://docs.rs/num/latest/num/trait.FromPrimitive.html
>> +
>> +Generic register abstraction
>> +----------------------------
>> +
>> +Work out how register constants and structures can be automatically gen=
erated
>> +through generalized macros.
>> +
>> +Example:
>> +
>> +.. code-block:: rust
>> +
>> +=09register!(BOOT0, 0x0, u32, pci::Bar<SIZE>, Fields [
>> +=09   MINOR_REVISION(3:0, RO),
>> +=09   MAJOR_REVISION(7:4, RO),
>> +=09   REVISION(7:0, RO), // Virtual register combining major and minor =
rev.
>> +=09])
>> +
>> +This could expand to something like:
>> +
>> +.. code-block:: rust
>> +
>> +=09const BOOT0_OFFSET: usize =3D 0x00000000;
>> +=09const BOOT0_MINOR_REVISION_SHIFT: u8 =3D 0;
>> +=09const BOOT0_MINOR_REVISION_MASK: u32 =3D 0x0000000f;
>> +=09const BOOT0_MAJOR_REVISION_SHIFT: u8 =3D 4;
>> +=09const BOOT0_MAJOR_REVISION_MASK: u32 =3D 0x000000f0;
>> +=09const BOOT0_REVISION_SHIFT: u8 =3D BOOT0_MINOR_REVISION_SHIFT;
>> +=09const BOOT0_REVISION_MASK: u32 =3D BOOT0_MINOR_REVISION_MASK | BOOT0=
_MAJOR_REVISION_MASK;
>> +
>> +=09struct Boot0(u32);
>> +
>> +=09impl Boot0 {
>> +=09   #[inline]
>> +=09   fn read(bar: &RevocableGuard<'_, pci::Bar<SIZE>>) -> Self {
>> +=09      Self(bar.readl(BOOT0_OFFSET))
>> +=09   }
>> +
>> +=09   #[inline]
>> +=09   fn minor_revision(&self) -> u32 {
>> +=09      (self.0 & BOOT0_MINOR_REVISION_MASK) >> BOOT0_MINOR_REVISION_S=
HIFT
>> +=09   }
>> +
>> +=09   #[inline]
>> +=09   fn major_revision(&self) -> u32 {
>> +=09      (self.0 & BOOT0_MAJOR_REVISION_MASK) >> BOOT0_MAJOR_REVISION_S=
HIFT
>> +=09   }
>> +
>> +=09   #[inline]
>> +=09   fn revision(&self) -> u32 {
>> +=09      (self.0 & BOOT0_REVISION_MASK) >> BOOT0_REVISION_SHIFT
>> +=09   }
>> +=09}
>> +
>> +Usage:
>> +
>> +.. code-block:: rust
>> +
>> +=09let bar =3D bar.try_access().ok_or(ENXIO)?;
>> +
>> +=09let boot0 =3D Boot0::read(&bar);
>> +=09pr_info!("Revision: {}\n", boot0.revision());
>> +
>> +| Complexity: Advanced
>> +
>> +Delay / Sleep abstractions
>> +--------------------------
>> +
>> +Rust abstractions for the kernel's delay() and sleep() functions.
>> +
>> +There is some ongoing work from FUJITA Tomonori [1], which has not seen=
 any updates
>> +since Oct. 24.
>> +
>> +| Complexity: Beginner
>> +| Link: https://lore.kernel.org/netdev/20241001112512.4861-2-fujita.tom=
onori@gmail.com/ [1]
>> +
>> +IRQ abstractions
>> +----------------
>> +
>> +Rust abstractions for IRQ handling.
>> +
>> +There is active ongoing work from Daniel Almeida [1] for the "core" abs=
tractions
>> +to request IRQs.
>> +
>> +Besides optional review and testing work, the required ``pci::Device`` =
code
>> +around those core abstractions needs to be worked out.
>> +
>> +| Complexity: Intermediate
>> +| Link: https://lore.kernel.org/lkml/20250122163932.46697-1-daniel.alme=
ida@collabora.com/ [1]
>> +| Contact: Daniel Almeida
>> +
>> +Page abstraction for foreign pages
>> +----------------------------------
>> +
>> +Rust abstractions for pages not created by the Rust page abstraction wi=
thout
>> +direct ownership.
>> +
>> +There is active onging work from Abdiel Janulgue [1] and Lina [2].
>> +
>> +| Complexity: Advanced
>> +| Link: https://lore.kernel.org/linux-mm/20241119112408.779243-1-abdiel=
.janulgue@gmail.com/ [1]
>> +| Link: https://lore.kernel.org/rust-for-linux/20250202-rust-page-v1-0-=
e3170d7fe55e@asahilina.net/ [2]
>> +
>> +Scatterlist / sg_table abstractions
>> +-----------------------------------
>> +
>> +Rust abstractions for scatterlist / sg_table.
>> +
>> +There is preceding work from Abdiel Janulgue, which hasn't made it to t=
he
>> +mailing list yet.
>> +
>> +| Complexity: Intermediate
>> +| Contact: Abdiel Janulgue
>> +
>> +ELF utils
>> +---------
>> +
>> +Rust implementation of ELF header representation to retrieve section he=
ader
>> +tables, names, and data from an ELF-formatted images.
>> +
>> +There is preceding work from Abdiel Janulgue, which hasn't made it to t=
he
>> +mailing list yet.
>> +
>> +| Complexity: Beginner
>> +| Contact: Abdiel Janulgue
>> +
>> +PCI MISC APIs
>> +-------------
>> +
>> +Extend the existing PCI device / driver abstractions by SR-IOV, config =
space,
>> +capability, MSI API abstractions.
>> +
>> +| Complexity: Beginner
>> +
>> +Auxiliary bus abstractions
>> +--------------------------
>> +
>> +Rust abstraction for the auxiliary bus APIs.
>> +
>> +This is needed to connect nova-core to the nova-drm driver.
>> +
>> +| Complexity: Intermediate
>> +
>> +Debugfs abstractions
>> +--------------------
>> +
>> +Rust abstraction for debugfs APIs.
>> +
>> +| Reference: Export GSP log buffers
>> +| Complexity: Intermediate
>> +
>> +Vec extensions
>> +--------------
>> +
>> +Implement ``Vec::truncate`` and ``Vec::resize``.
>> +
>> +Currently this is used for some experimental code to parse the vBIOS.
>> +
>> +| Reference vBIOS support
>> +| Complexity: Beginner
>> +
>> +GPU (general)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Parse firmware headers
>> +----------------------
>> +
>> +Parse ELF headers from the firmware files loaded from the filesystem.
>> +
>> +| Reference: ELF utils
>> +| Complexity: Beginner
>> +| Contact: Abdiel Janulgue
>> +
>> +Build radix3 page table
>> +-----------------------
>> +
>> +Build the radix3 page table to map the firmware.
>> +
>> +| Complexity: Intermediate
>> +| Contact: Abdiel Janulgue
>> +
>> +vBIOS support
>> +-------------
>> +
>> +Parse the vBIOS and probe the structures required for driver initializa=
tion.
>> +
>> +| Contact: Dave Airlie
>> +| Reference: Vec extensions
>> +| Complexity: Intermediate
>> +
>> +Initial Devinit support
>> +-----------------------
>> +
>> +Implement BIOS Device Initialization, i.e. memory sizing, waiting, PLL
>> +configuration.
>> +
>> +| Contact: Dave Airlie
>> +| Complexity: Beginner
>> +
>> +Boot Falcon controller
>> +----------------------
>> +
>> +Infrastructure to load and execute falcon (sec2) firmware images; handl=
e the
>> +GSP falcon processor and fwsec loading.
>> +
>> +| Complexity: Advanced
>> +| Contact: Dave Airlie
>> +
>> +GPU Timer support
>> +-----------------
>> +
>> +Support for the GPU's internal timer peripheral.
>> +
>> +| Complexity: Beginner
>> +| Contact: Dave Airlie
>> +
>> +MMU / PT management
>> +-------------------
>> +
>> +Work out the architecture for MMU / page table management.
>> +
>> +We need to consider that nova-drm will need rather fine-grained control=
,
>> +especially in terms of locking, in order to be able to implement asynch=
ronous
>> +Vulkan queues.
>> +
>> +While generally sharing the corresponding code is desirable, it needs t=
o be
>> +evaluated how (and if at all) sharing the corresponding code is expedie=
nt.
>> +
>> +| Complexity: Expert
>> +
>> +VRAM memory allocator
>> +---------------------
>> +
>> +Investigate options for a VRAM memory allocator.
>> +
>> +Some possible options:
>> +  - Rust abstractions for
>> +    - RB tree (interval tree) / drm_mm
>> +    - maple_tree
>> +  - native Rust collections
>> +
>> +| Complexity: Advanced
>> +
>> +Instance Memory
>> +---------------
>> +
>> +Implement support for instmem (bar2) used to store page tables.
>> +
>> +| Complexity: Intermediate
>> +| Contact: Dave Airlie
>> +
>> +GPU System Processor (GSP)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>> +
>> +Export GSP log buffers
>> +----------------------
>> +
>> +Recent patches from Timur Tabi [1] added support to expose GSP-RM log b=
uffers
>> +(even after failure to probe the driver) through debugfs.
>> +
>> +This is also an interesting feature for nova-core, especially in the ea=
rly days.
>> +
>> +| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@n=
vidia.com/ [1]
>> +| Reference: Debugfs abstractions
>> +| Complexity: Intermediate
>> +
>> +GSP firmware abstraction
>> +------------------------
>> +
>> +The GSP-RM firmware API is unstable and may incompatibly change from ve=
rsion to
>> +version, in terms of data structures and semantics.
>> +
>> +This problem is one of the big motivations for using Rust for nova-core=
, since
>> +it turns out that Rust's procedural macro feature provides a rather ele=
gant way
>> +to address this issue:
>> +
>> +1. generate Rust structures from the C headers in a separate namespace =
per version
>> +2. build abstraction structures (within a generic namespace) that imple=
ment the
>> +   firmware interfaces; annotate the differences in implementation with=
 version
>> +   identifiers
>> +3. use a procedural macro to generate the actual per version implementa=
tion out
>> +   of this abstraction
>> +4. instantiate the correct version type one on runtime (can be sure tha=
t all
>> +   have the same interface because it's defined by a common trait)
>> +
>> +There is a PoC implementation of this pattern, in the context of the no=
va-core
>> +PoC driver.
>> +
>> +This task aims at refining the feature and ideally generalize it, to be=
 usable
>> +by other drivers as well.
>> +
>> +| Complexity: Expert
>> +
>> +GSP message queue
>> +-----------------
>> +
>> +Implement low level GSP message queue (command, status) for communicati=
on
>> +between the kernel driver and GSP.
>> +
>> +| Complexity: Advanced
>> +| Contact: Dave Airlie
>> +
>> +Bootstrap GSP
>> +-------------
>> +
>> +Call the boot firmware to boot the GSP processor; execute initial contr=
ol
>> +messages.
>> +
>> +| Complexity: Intermediate
>> +| Contact: Dave Airlie
>> +
>> +Client / Device APIs
>> +--------------------
>> +
>> +Implement the GSP message interface for client / device allocation and =
the
>> +corresponding client and device allocation APIs.
>> +
>> +| Complexity: Intermediate
>> +| Contact: Dave Airlie
>> +
>> +Bar PDE handling
>> +----------------
>> +
>> +Synchronize page table handling for BARs between the kernel driver and =
GSP.
>> +
>> +| Complexity: Beginner
>> +| Contact: Dave Airlie
>> +
>> +FIFO engine
>> +-----------
>> +
>> +Implement support for the FIFO engine, i.e. the corresponding GSP messa=
ge
>> +interface and provide an API for chid allocation and channel handling.
>> +
>> +| Complexity: Advanced
>> +| Contact: Dave Airlie
>> +
>> +GR engine
>> +---------
>> +
>> +Implement support for the graphics engine, i.e. the corresponding GSP m=
essage
>> +interface and provide an API for (golden) context creation and promotio=
n.
>> +
>> +| Complexity: Advanced
>> +| Contact: Dave Airlie
>> +
>> +CE engine
>> +---------
>> +
>> +Implement support for the copy engine, i.e. the corresponding GSP messa=
ge
>> +interface.
>> +
>> +| Complexity: Intermediate
>> +| Contact: Dave Airlie
>> +
>> +VFN IRQ controller
>> +------------------
>> +
>> +Support for the VFN interrupt controller.
>> +
>> +| Complexity: Intermediate
>> +| Contact: Dave Airlie
>> +
>> +External APIs
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +nova-core base API
>> +------------------
>> +
>> +Work out the common pieces of the API to connect 2nd level drivers, i.e=
. vGPU
>> +manager and nova-drm.
>> +
>> +| Complexity: Advanced
>> +
>> +vGPU manager API
>> +----------------
>> +
>> +Work out the API parts required by the vGPU manager, which are not cove=
red by
>> +the base API.
>> +
>> +| Complexity: Advanced
>> +
>> +nova-core C API
>> +---------------
>> +
>> +Implement a C wrapper for the APIs required by the vGPU manager driver.
>> +
>> +| Complexity: Intermediate
>> +
>> +Testing
>> +=3D=3D=3D=3D=3D=3D=3D
>> +
>> +CI pipeline
>> +-----------
>> +
>> +Investigate option for continuous integration testing.
>> +
>> +This can go from as simple as running KUnit tests over running (graphic=
s) CTS to
>> +booting up (multiple) guest VMs to test VFIO use-cases.
>> +
>> +It might also be worth to consider the introduction of a new test suite=
 directly
>> +sitting on top of the uAPI for more targeted testing and debugging. The=
re may be
>> +options for collaboration / shared code with the Mesa project.
>> +
>> +| Complexity: Advanced
>> diff --git a/Documentation/gpu/nova/guidelines.rst b/Documentation/gpu/n=
ova/guidelines.rst
>> new file mode 100644
>> index 000000000000..13ab13984a18
>> --- /dev/null
>> +++ b/Documentation/gpu/nova/guidelines.rst
>> @@ -0,0 +1,69 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Guidelines
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +This document describes the general project guidelines that apply to no=
va-core
>> +and nova-drm.
>> +
>> +Language
>> +=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The Nova project uses the Rust programming language. In this context, a=
ll rules
>> +of the Rust for Linux project as documented in
>> +:doc:`../../rust/general-information` apply. Additionally, the followin=
g rules
>> +apply.
>> +
>> +- Unless technically necessary otherwise (e.g. uAPI), any driver code i=
s written
>> +  in Rust.
>> +
>> +- Unless technically necessary, unsafe Rust code must be avoided. In ca=
se of
>> +  technical necessity, unsafe code should be isolated in a separate com=
ponent
>> +  providing a safe API for other driver code to use.
>> +
>> +Style
>> +-----
>> +
>> +All rules of the Rust for Linux project as documented in
>> +:doc:`../../rust/coding-guidelines` apply.
>> +
>> +For a submit checklist, please also see the `Rust for Linux Submit chec=
klist
>> +addendum <https://rust-for-linux.com/contributing#submit-checklist-adde=
ndum>`_.
>> +
>> +Documentation
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The availability of proper documentation is essential in terms of scala=
bility,
>> +accessibility for new contributors and maintainability of a project in =
general,
>> +but especially for a driver running as complex hardware as Nova is targ=
eting.
>> +
>> +Hence, adding documentation of any kind is very much encouraged by the =
project.
>> +
>> +Besides that, there are some minimum requirements.
>> +
>> +- Every non-private structure needs at least a brief doc comment explai=
ning the
>> +  semantical sense of the structure, as well as potential locking and l=
ifetime
>> +  requirements. It is encouraged to have the same minimum documentation=
 for
>> +  non-trivial private structures.
>> +
>> +- uAPIs must be fully documented with kernel-doc comments; additionally=
, the
>> +  semantical behavior must be explained including potential special or =
corner
>> +  cases.
>> +
>> +- The APIs connecting the 1st level driver (nova-core) with 2nd level d=
rivers
>> +  must be fully documented. This includes doc comments, potential locki=
ng and
>> +  lifetime requirements, as well as example code if applicable.
>> +
>> +- Abbreviations must be explained when introduced; terminology must be =
uniquely
>> +  defined.
>> +
>> +- Register addresses, layouts, shift values and masks must be defined p=
roperly;
>> +  unless obvious, the semantical sense must be documented. This only ap=
plies if
>> +  the author is able to obtain the corresponding information.
>> +
>> +Acceptance Criteria
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +- Patches must only be applied if reviewed by at least one other person=
 on the
>> +  mailing list; this also applies for maintainers.
>> diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/i=
ndex.rst
>> new file mode 100644
>> index 000000000000..2701b3f4af35
>> --- /dev/null
>> +++ b/Documentation/gpu/nova/index.rst
>> @@ -0,0 +1,30 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +nova NVIDIA GPU drivers
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The nova driver project consists out of two separate drivers nova-core =
and
>> +nova-drm and intends to supersede the nouveau driver for NVIDIA GPUs ba=
sed on
>> +the GPU System Processor (GSP).
>> +
>> +The following documents apply to both nova-core and nova-drm.
>> +
>> +.. toctree::
>> +   :titlesonly:
>> +
>> +   guidelines
>> +
>> +nova-core
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The nova-core driver is the core driver for NVIDIA GPUs based on GSP. n=
ova-core,
>> +as the 1st level driver, provides an abstraction around the GPUs hard- =
and
>> +firmware interfaces providing a common base for 2nd level drivers, such=
 as the
>> +vGPU manager VFIO driver and the nova-drm driver.
>> +
>> +.. toctree::
>> +   :titlesonly:
>> +
>> +   core/guidelines
>> +   core/todo
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5d5b7ed7da9e..ed618e8757a5 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7454,6 +7454,7 @@ Q:=09https://patchwork.freedesktop.org/project/nou=
veau/
>>  B:=09https://gitlab.freedesktop.org/drm/nova/-/issues
>>  C:=09irc://irc.oftc.net/nouveau
>>  T:=09git https://gitlab.freedesktop.org/drm/nova.git nova-next
>> +F:=09Documentation/gpu/nova/
>>  F:=09drivers/gpu/nova-core/
>>
>>  DRM DRIVER FOR OLIMEX LCD-OLINUXINO PANELS
>> --
>> 2.48.1
>>
>>

