Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E0ZNlPyd2mSmgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 00:01:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E21E8E1F5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 00:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E9710E1D4;
	Mon, 26 Jan 2026 23:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZwMjmS2d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB1910E1D4;
 Mon, 26 Jan 2026 23:01:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4400660051;
 Mon, 26 Jan 2026 22:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECCDC116C6;
 Mon, 26 Jan 2026 22:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769467994;
 bh=DbyBvcFlup54F2ZWHzs85SXCKgEo0Qe21z8LMojTQaU=;
 h=Date:Subject:Cc:To:From:From;
 b=ZwMjmS2dJnSHCfvWwqZtPzbjsv9N/Cdd0fd39rjAiQHJ33SmSp8h5hAq3Em31/y4r
 +E/mvGg8SiDJNn8iAPJ2SFg/sOeypWR+ZP0Pt1oc9xsOPHaUIMeflZTxoxD2jQYmWd
 UqgShk6KfOrFFbsE8PThARL0OaSOSIoUq5Jz1YlPkqTbe5Od4lPPXz5h4UDWNlwplo
 NoA19apOOwCGFp8URlZVanKjgvf+DuSgL/9VxAQqPBZG/9nLlh31wzxykBhUIEADgJ
 wwBuBf3qHN6Q1VfSQrjjHaqsPH60hBHHcYbQXJk495ujeUAO65oUVHV9ELKfLOhRnm
 rbO+7AynzJmVw==
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 23:53:10 +0100
Message-Id: <DFYW1WV6DUCG.3K8V2DAVD1Q4A@kernel.org>
Subject: [GIT PULL] DRM Rust changes for v7.0-rc1
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Dave Airlie" <airlied@gmail.com>, "Simona Vetter" <simona.vetter@ffwll.ch>
From: "Danilo Krummrich" <dakr@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[util.rs:url,gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3E21E8E1F5
X-Rspamd-Action: no action

Hi Dave and Sima,

Please pull these DRM Rust changes.

Most changes have been in -next for a couple of rounds; there's one minor
conflict with the drm-misc tree [1] due to a Panthor/Tyr UAPI change.

In general, there are not a lot of changes this cycle, the biggest thing is=
 the
preparation work for Turing support, but even this is rather small.

Expect quite a bit more for the next cycle, e.g. GPUVM, DRM buddy, DeviceCo=
ntext
for DRM devices and Hopper/Blackwell support plus some MM stuff on the nova=
-core
side.

- Danilo

[1] https://lore.kernel.org/all/aXEF-ESjd5ouyXRq@sirena.org.uk/

The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193=
:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/rust/kernel.git tags/drm-rust-next-202=
6-01-26

for you to fetch changes up to cea7b66a80412e2a5b74627b89ae25f1d0110a4b:

  Documentation: nova: update pending tasks (2026-01-26 18:16:14 +0100)

----------------------------------------------------------------
DRM Rust changes for v7.0-rc1

DRM:
  - Fix documentation for Registration constructors.
  - Use pin_init::zeroed() for fops initialization.
  - Annotate DRM helpers with __rust_helper.
  - Improve safety documentation for gem::Object::new().
  - Update AlwaysRefCounted imports.

MM:
  - Prevent integer overflow in page_align().

Nova (Core):
  - Prepare for Turing support. This includes parsing and handling
    Turing-specific firmware headers and sections as well as a Turing
    Falcon HAL implementation.
  - Get rid of the Result<impl PinInit<T, E>> anti-pattern.
  - Relocate initializer-specific code into the appropriate initializer.
  - Use CStr::from_bytes_until_nul() to remove custom helpers.
  - Improve handling of unexpected firmware values.
  - Clean up redundant debug prints.
  - Replace c_str!() with native Rust C-string literals.
  - Update nova-core task list.

Nova (DRM):
  - Align GEM object size to system page size.

Tyr:
  - Use generated uAPI bindings for GpuInfo.
  - Replace manual sleeps with read_poll_timeout().
  - Replace c_str!() with native Rust C-string literals.
  - Suppress warnings for unread fields.
  - Fix incorrect register name in print statement.

----------------------------------------------------------------
Alexandre Courbot (1):
      gpu: nova-core: align LibosMemoryRegionInitArgument size to page size

Alice Ryhl (1):
      rust: drm: add __rust_helper to helpers

Atharv Dubey (1):
      rust: drm: use `pin_init::zeroed()` for file operations initializatio=
n

Brendan Shephard (2):
      rust: Return Option from page_align and ensure no usize overflow
      drm/nova: Align GEM memory allocation to system page size

Danilo Krummrich (7):
      gpu: nova-core: fw: get rid of redundant Result in GspFirmware::new()
      gpu: nova-core: fw: move appropriate code into pin initializer
      gpu: nova-core: gsp: get rid of redundant Result in Gsp::new()
      gpu: nova-core: gsp: move appropriate code into pin initializer
      Merge tag 'v6.19-rc5' into drm-rust-next
      Documentation: nova: remove completed tasks
      Documentation: nova: update pending tasks

Deborah Brouwer (3):
      drm/tyr: use generated bindings for GpuInfo
      drm/tyr: use read_poll_timeout
      drm/tyr: suppress unread field warnings

Dirk Behme (1):
      drm/tyr: fix register name in error print

Ewan Chorynski (1):
      rust: drm: Improve safety comment when using `Pin::into_inner_uncheck=
ed`

John Hubbard (4):
      gpu: nova-core: use CStr::from_bytes_until_nul() and remove util.rs
      gpu: nova-core: use CStr::from_bytes_until_nul() in elf64_section()
      gpu: nova-core: preserve error information in gpu_name()
      gpu: nova-core: don't print raw PMU table entries

Lyude Paul (1):
      rust/drm: Fix Registration::{new,new_foreign_owned}() docs

Shankari Anand (2):
      drivers: gpu: Update ARef imports from sync::aref
      rust: drm: Update AlwaysRefCounted imports to use sync::aref

Tamir Duberstein (2):
      gpu: nova: replace `kernel::c_str!` with C-Strings
      drm: tyr: replace `kernel::c_str!` with C-Strings

Timur Tabi (12):
      gpu: nova-core: check for overflow to DMATRFBASE1
      gpu: nova-core: add missing newlines to several print strings
      gpu: nova-core: rename Imem to ImemSecure
      gpu: nova-core: add ImemNonSecure section infrastructure
      gpu: nova-core: support header parsing on Turing/GA100
      gpu: nova-core: add support for Turing/GA100 fwsignature
      gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
      gpu: nova-core: move some functions into the HAL
      gpu: nova-core: Add basic Turing HAL
      gpu: nova-core: add NV_PFALCON_FALCON_ENGINE::reset_engine()
      gpu: nova-core: add Falcon HAL method load_method()
      gpu: nova-core: add FalconUCodeDescV2 support

 Documentation/gpu/nova/core/todo.rst      |  59 +++++++++-----------------=
------
 drivers/gpu/drm/nova/driver.rs            |  18 +++++++---
 drivers/gpu/drm/nova/gem.rs               |   6 ++--
 drivers/gpu/drm/tyr/driver.rs             |  55 +++++++++++++-------------=
----
 drivers/gpu/drm/tyr/gpu.rs                |  66 ++++++++++++++++++--------=
----------
 drivers/gpu/nova-core/driver.rs           |   5 ++-
 drivers/gpu/nova-core/falcon.rs           | 107 ++++++++++++++++++++++++++=
+-------------------------------
 drivers/gpu/nova-core/falcon/hal.rs       |  26 ++++++++++++++
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  43 ++++++++++++++++++++++--
 drivers/gpu/nova-core/falcon/hal/tu102.rs |  77 ++++++++++++++++++++++++++=
++++++++++++++++
 drivers/gpu/nova-core/fb.rs               |   2 +-
 drivers/gpu/nova-core/firmware.rs         | 203 ++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++---
 drivers/gpu/nova-core/firmware/booter.rs  |  43 ++++++++++++++++++++----
 drivers/gpu/nova-core/firmware/fwsec.rs   |  51 +++++++++++++-------------=
--
 drivers/gpu/nova-core/firmware/gsp.rs     | 146 ++++++++++++++++++++++++++=
+++++++++++++++--------------------------------------
 drivers/gpu/nova-core/gpu.rs              |   4 +--
 drivers/gpu/nova-core/gsp.rs              |  77 ++++++++++++++++++++------=
----------------
 drivers/gpu/nova-core/gsp/boot.rs         |  18 ++++------
 drivers/gpu/nova-core/gsp/cmdq.rs         |   2 +-
 drivers/gpu/nova-core/gsp/commands.rs     |  29 ++++++++++++----
 drivers/gpu/nova-core/gsp/fw.rs           |  14 +++++++-
 drivers/gpu/nova-core/gsp/sequencer.rs    |  14 ++++----
 drivers/gpu/nova-core/nova_core.rs        |   1 -
 drivers/gpu/nova-core/regs.rs             |  42 ++++++++++++++++++++++-
 drivers/gpu/nova-core/util.rs             |  16 ---------
 drivers/gpu/nova-core/vbios.rs            |  73 ++++++++++++++++++--------=
--------------
 rust/helpers/drm.c                        |   7 ++--
 rust/kernel/drm/driver.rs                 |   6 ++--
 rust/kernel/drm/gem/mod.rs                |   8 ++---
 rust/kernel/page.rs                       |  36 ++++++++++++++++----
 30 files changed, 823 insertions(+), 431 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs
 delete mode 100644 drivers/gpu/nova-core/util.rs
