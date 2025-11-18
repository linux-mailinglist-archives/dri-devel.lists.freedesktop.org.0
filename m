Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9735C69804
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 13:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B4D10E49A;
	Tue, 18 Nov 2025 12:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="cy267rub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AD010E100
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:57:10 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-6450f3e7e71so366644a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 04:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1763470629; x=1764075429;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/3oBVbM4mv9l92d/3MqcdKZ8W9fveoOJA63vlUpVWds=;
 b=cy267rub1G6DfY4Eag/rdo5dQzfGXm/YqKAZmu7ai6JxPQJ9YLxdr7eSI4U37xARv3
 2WcSleCuTGL6jKnBbd3eE+1rof8858vlsoIlQ5QQh5SVT6r3CNBOELXxrwfleVeN8U1/
 X/+rGskWNXDVVN1NNLPi+4ZrfjKb795D1Bt9RtRZUTgZQxUFH4RM/dY0GA3adaruR9Xo
 fi/XXSZkpXtzvQWrXYpOFFeMejTDkGt/e+viabrwukC6Q7f5Kj8z6SEOI3AbpVqY1DGw
 BHn6EWm7xA9iKAOBS4Q8EhlMQ6Y9eMQFR475IN/wSO7+VdqpXHPMaWB+s2n8Fj8tKtos
 0fsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763470629; x=1764075429;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/3oBVbM4mv9l92d/3MqcdKZ8W9fveoOJA63vlUpVWds=;
 b=IHh9MzXnJvbYTxc2Z1fiZStD+eldhvCh78saPcjoP4YeiDeNh3GECKlI7WlWCC9PCd
 IulJHao8zL1B+g/vw7VlTIkQh7d+/QKo7QLDcF7mUntKfX8y8b1//U/BvJs7MI3dVqcQ
 znL051TSrriLSb7/znJdC3i9khUOJe8c+/8etFBighvPGa1KExR880uZAIEOMAKDhzkk
 6ZNmsm//roX+neLfFEgK+BVC1e3rK/Mj/u3ZrG4GpkTqbw1znTiG3p6CxZelUJcVZOG5
 PvEOzoazfmT2RNjtZS1vUoX4dU9x3r6KBnPayHk698qL97fSLVISjQjmU6EgFoaArCvW
 ESHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVN1E68x7K9ryS51KqHiwjeuisrcCtSwsfMLlm6bsIQGk+Fqm5Ece4+21UUI55Ms9c6fKJF3DDjDM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIt2nDcILKio5vqFnWGzXDHQ+04/UMXXgjAcdr0WEmOg/tSkSF
 cP5gRwrAL46JFp+tnypb1+tVkTKSVW1ov+nQf5v0Sw8uidKPVI4QGQUMDBqadpz5l/d0vl7R5dW
 3YbnbuM3OvPn6TKTIKA==
X-Google-Smtp-Source: AGHT+IGKpKZEWXj+e99BDAbWEiW7VLBcrkmVCa9REqJsmRqBMs8t+GmlbYna3rJ/8xKMDV9YApSJlIIKUVuwyCY=
X-Received: from edin11.prod.google.com ([2002:a50:cc4b:0:b0:641:6c2f:3154])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:144d:b0:643:c8b:8d61 with SMTP id
 4fb4d7f45d1cf-64350d2f73amr14059811a12.0.1763470629308; 
 Tue, 18 Nov 2025 04:57:09 -0800 (PST)
Date: Tue, 18 Nov 2025 12:57:08 +0000
Mime-Version: 1.0
Message-ID: <aRxtJC0D1pQUepF4@google.com>
Subject: [PULL] DRM Rust changes for v6.19
From: Alice Ryhl <aliceryhl@google.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dim-tools@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
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

Hi Dave and Sima,

Please pull the following DRM Rust changes.

Besides the DRM Rust changes, this PR also contains a few core Rust changes and
DRM GPUVM support for deferred vm_bo cleanup. The GPUVM change was landed
through this tree so that it could be used from Rust code, but unfortunately
the relevant Rust change did not land in time for this cycle.

The top commit gets rid of a conflict with the Rust tree. This conflict is what
caused the hack fix in the Nov 17th linux-next and I confirmed that the hack is
absent in the Nov 18th linux-next.

The drivers/gpu/nova-core/driver.rs file has a conflict with the driver-core
tree. Please see linux-next for the resolution:

	https://lore.kernel.org/p/20251117160621.2043a859@canb.auug.org.au

- Alice

The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:

  Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/rust/kernel.git tags/drm-rust-next-2025-11-18

for you to fetch changes up to 77b686f688126a5f758b51441a03186e9eb1b0f1:

  gpu: nova-core: make formatting compatible with rust tree (2025-11-17 12:56:36 +0000)

----------------------------------------------------------------
Cross-subsystem Changes:

Rust
  - Make slice::as_flattened usable on all supported versions of rustc.
  - Add FromBytes::from_bytes_prefix() method.

Core Changes:

  - Update Tyr in MAINTAINERS file.
  - Remove redundant device ptr from Rust GEM object.
  - Change how AlwaysRefCounted is implemented for GEM objects.
  - Add deferred vm_bo cleanup to GPUVM and use it in Panthor.

Driver Changes:

Nova Core
  - Introduction of bitfield! macro, with support for different storage sizes
    and custom visibility.
  - Introduction of safe converters between integer types for which the
    conversion is lossless.
  - GSP initialized up to fully booted state on Ampere.
  - Use more future-proof register for GPU identification.
  - Various simplifications and optimizations.

Nova
  - Select NOVA_CORE.
  - Depend on CONFIG_64BIT.

----------------------------------------------------------------
Alexandre Courbot (19):
      gpu: nova-core: register: use field type for Into implementation
      gpu: nova-core: replace wait_on with kernel equivalents
      gpu: nova-core: bitfield: simplify condition
      gpu: nova-core: bitfield: simplify expression
      gpu: nova-core: bitfield: remove BitOr implementation
      gpu: nova-core: replace `as` with `from` conversions where possible
      gpu: nova-core: vbios: do not use `as` when comparing BiosImageType
      gpu: nova-core: use `try_from` instead of `as` for u32 conversions
      rust: transmute: add `from_bytes_prefix` family of methods
      gpu: nova-core: vbios: use FromBytes for PmuLookupTable header
      gpu: nova-core: vbios: use FromBytes for PcirStruct
      gpu: nova-core: vbios: use FromBytes for BitHeader
      gpu: nova-core: vbios: use FromBytes for NpdeStruct
      gpu: nova-core: add functions and traits for lossless integer conversions
      gpu: nova-core: replace use of `as` with functions from `num`
      gpu: nova-core: justify remaining uses of `as`
      gpu: nova-core: compute layout of more framebuffer regions required for GSP
      gpu: nova-core: num: add functions to safely convert a const value to a smaller type
      rust: enable slice_flatten feature and provide it through an extension trait

Alice Ryhl (4):
      drm/gpuvm: add deferred vm_bo cleanup
      panthor: use drm_gpuva_unlink_defer()
      Merge tag 'v6.18-rc2' into 'drm-rust-next'
      gpu: nova-core: make formatting compatible with rust tree

Alistair Popple (11):
      gpu: nova-core: Set correct DMA mask
      gpu: nova-core: Create initial Gsp
      gpu: nova-core: gsp: Create wpr metadata
      gpu: nova-core: Add zeroable trait to bindings
      gpu: nova-core: gsp: Add GSP command queue bindings and handling
      gpu: nova-core: gsp: Create rmargs
      gpu: nova-core: gsp: Add SetSystemInfo command
      gpu: nova-core: gsp: Add SetRegistry command
      gpu: nova-core: gsp: Boot GSP
      gpu: nova-core: gsp: Wait for gsp initialization to complete
      gpu: nova-core: gsp: Retrieve GSP static info to gather GPU information

Daniel del Castillo (4):
      gpu: nova-core: Simplify `transmute` and `transmute_mut` in fwsec.rs
      gpu: nova-core: Fix capitalization of some comments
      gpu: nova-core: Simplify `DmaObject::from_data` in nova-core/dma.rs
      Documentation: nova: Update the todo list

Danilo Krummrich (5):
      gpu: nova-core: gsp: remove useless conversion
      gpu: nova-core: gsp: do not unwrap() SGEntry
      MAINTAINERS: add Tyr to DRM DRIVERS AND COMMON INFRASTRUCTURE [RUST]
      drm: nova: depend on CONFIG_64BIT
      drm: nova: select NOVA_CORE

Joel Fernandes (18):
      gpu: nova-core: vbios: Rework BiosImage to be simpler
      gpu: nova-core: bitfield: Move bitfield-specific code from register! into new macro
      gpu: nova-core: bitfield: Add support for different storage widths
      gpu: nova-core: bitfield: Add support for custom visibility
      gpu: nova-core: Add a slice-buffer (sbuffer) datastructure
      gpu: nova-core: falcon: Add support to check if RISC-V is active
      gpu: nova-core: falcon: Add support to write firmware version
      gpu: nova-core: falcon: Move waiting until halted to a helper
      gpu: nova-core: falcon: Move start functionality into separate helper
      gpu: nova-core: falcon: Move mbox functionalities into helper
      gpu: nova-core: falcon: Move dma_reset functionality into helper
      gpu: nova-core: gsp: Add support for checking if GSP reloaded
      gpu: nova-core: Add bindings required by GSP sequencer
      gpu: nova-core: Implement the GSP sequencer
      gpu: nova-core: sequencer: Add register opcodes
      gpu: nova-core: sequencer: Add delay opcode support
      gpu: nova-core: sequencer: Implement basic core operations
      gpu: nova-core: sequencer: Implement core resume operation

John Hubbard (10):
      gpu: nova-core: regs: rename .alter() --> .update()
      gpu: nova-core: Ada: basic GPU identification
      gpu: nova-core: remove an unnecessary register read: HWCFG1
      gpu: nova-core: remove unnecessary need_riscv, bar parameters
      gpu: nova-core: apply the one "use" item per line policy
      gpu: nova-core: implement Display for Spec
      gpu: nova-core: prepare Spec and Revision types for boot0/boot42
      gpu: nova-core: make Architecture behave as a u8 type
      gpu: nova-core: add boot42 support for next-gen GPUs
      gpu: nova-core: provide a clear error report for unsupported GPUs

Lyude Paul (3):
      Partially revert "rust: drm: gem: Implement AlwaysRefCounted for all gem objects automatically"
      rust: drm/gem: Remove Object.dev
      rust/drm/gem: Fix missing header in `Object` rustdoc

 Documentation/gpu/nova/core/todo.rst              |  30 -
 MAINTAINERS                                       |   1 +
 drivers/gpu/drm/drm_gpuvm.c                       | 190 +++++
 drivers/gpu/drm/nova/Kconfig                      |   2 +
 drivers/gpu/drm/panthor/panthor_mmu.c             | 110 +--
 drivers/gpu/nova-core/bitfield.rs                 | 330 ++++++++
 drivers/gpu/nova-core/dma.rs                      |  34 +-
 drivers/gpu/nova-core/driver.rs                   |  27 +-
 drivers/gpu/nova-core/falcon.rs                   | 287 ++++---
 drivers/gpu/nova-core/falcon/gsp.rs               |  29 +-
 drivers/gpu/nova-core/falcon/hal.rs               |  14 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs         |  46 +-
 drivers/gpu/nova-core/falcon/sec2.rs              |  10 +-
 drivers/gpu/nova-core/fb.rs                       | 100 ++-
 drivers/gpu/nova-core/fb/hal.rs                   |   6 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs             |  16 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs             |   8 +-
 drivers/gpu/nova-core/fb/hal/tu102.rs             |  25 +-
 drivers/gpu/nova-core/firmware.rs                 |  31 +-
 drivers/gpu/nova-core/firmware/booter.rs          |  78 +-
 drivers/gpu/nova-core/firmware/fwsec.rs           | 184 +++--
 drivers/gpu/nova-core/firmware/gsp.rs             |  53 +-
 drivers/gpu/nova-core/firmware/riscv.rs           |  34 +-
 drivers/gpu/nova-core/gfw.rs                      |  48 +-
 drivers/gpu/nova-core/gpu.rs                      | 117 ++-
 drivers/gpu/nova-core/gsp.rs                      | 157 +++-
 drivers/gpu/nova-core/gsp/boot.rs                 | 153 +++-
 drivers/gpu/nova-core/gsp/cmdq.rs                 | 679 ++++++++++++++++
 drivers/gpu/nova-core/gsp/commands.rs             | 227 ++++++
 drivers/gpu/nova-core/gsp/fw.rs                   | 923 ++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw/commands.rs          | 128 +++
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |   6 +-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 950 ++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/sequencer.rs            | 407 +++++++++
 drivers/gpu/nova-core/nova_core.rs                |   5 +
 drivers/gpu/nova-core/num.rs                      | 217 +++++
 drivers/gpu/nova-core/regs.rs                     |  93 ++-
 drivers/gpu/nova-core/regs/macros.rs              | 287 +------
 drivers/gpu/nova-core/sbuffer.rs                  | 227 ++++++
 drivers/gpu/nova-core/util.rs                     |  33 +-
 drivers/gpu/nova-core/vbios.rs                    | 423 +++++-----
 include/drm/drm_gpuvm.h                           |  16 +
 init/Kconfig                                      |   3 +
 rust/kernel/drm/gem/mod.rs                        |  53 +-
 rust/kernel/lib.rs                                |   4 +
 rust/kernel/prelude.rs                            |   3 +
 rust/kernel/slice.rs                              |  49 ++
 rust/kernel/transmute.rs                          |  63 ++
 48 files changed, 5783 insertions(+), 1133 deletions(-)
 create mode 100644 drivers/gpu/nova-core/bitfield.rs
 create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs
 create mode 100644 drivers/gpu/nova-core/gsp/commands.rs
 create mode 100644 drivers/gpu/nova-core/gsp/fw/commands.rs
 create mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs
 create mode 100644 drivers/gpu/nova-core/num.rs
 create mode 100644 drivers/gpu/nova-core/sbuffer.rs
 create mode 100644 rust/kernel/slice.rs
