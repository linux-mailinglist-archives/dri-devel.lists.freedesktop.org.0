Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C109A588EF
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 23:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D6B10E37A;
	Sun,  9 Mar 2025 22:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BjdWeWVy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0DA10E06A;
 Sun,  9 Mar 2025 22:58:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9F7B9A45D45;
 Sun,  9 Mar 2025 22:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5F8C4CEE3;
 Sun,  9 Mar 2025 22:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741561120;
 bh=nsDhumEQyZw47FuNI6BGorbwqRz8lQI1xdmorqLvdhI=;
 h=Date:From:To:Cc:Subject:From;
 b=BjdWeWVy2Do9PkeGAteYzW7wxSg6DHofpcMhR/X1NSWhmvnLCD/kpoAxEP6uaNq+u
 s7JYNX9XjzNKSzw3bby1eHBcf+7kesI9PEw/ffRn/972QMtdVG0D+s9AOu/V69z/hx
 FABBbM7c3rMisJ8WljNkaVDkRg0swokbq2dojqqjnRCFsOL060TcluHe/Fe3sabGaF
 ullngDktoK9E2lrlhVp/BYSYeFVNZ7E7cyBwltxRjVwFbIxjkf9hzDYP8dN7OvaZ7N
 Q+1o5HxlgFj/G/SLnTv9XswTEJ5iE6WtCV/B/bjoeAdWCh6PifT9nyEfNgn8phyBj2
 z+a02qdnwl+Sg==
Date: Sun, 9 Mar 2025 23:58:36 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Russ Weight <russ.weight@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [GIT PULL] Nova changes for v6.15
Message-ID: <Z84dHHEn6xfvlRxk@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

This is the inital PR for Nova (nova-core).

Besides the nova-core skeleton driver and the initial project documentation,
I picked up two firmware patches and one Rust patch (no conflicts expected) as
dependency of nova-core.

The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/nova.git tags/nova-next-6.15-2025-03-09

for you to fetch changes up to b28786b190d1ae2df5e6a5181ad78c6f226ea3e1:

  gpu: nova-core: add initial documentation (2025-03-09 19:24:29 +0100)

----------------------------------------------------------------
Nova changes for v6.15

nova-core:
  - initial skeleton driver
  - documentation
    - project guidelines
    - task (todo) list

firmware:
  - `module_firmware!` macro
  - `firmware::ModInfoBuilder`

Rust:
  - `LocalModule` type alias

----------------------------------------------------------------
Danilo Krummrich (5):
      rust: module: add type `LocalModule`
      rust: firmware: introduce `firmware::ModInfoBuilder`
      rust: firmware: add `module_firmware!` macro
      gpu: nova-core: add initial driver stub
      gpu: nova-core: add initial documentation

 Documentation/gpu/drivers.rst              |   1 +
 Documentation/gpu/nova/core/guidelines.rst |  24 ++++++
 Documentation/gpu/nova/core/todo.rst       | 446 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/gpu/nova/guidelines.rst      |  69 +++++++++++++++++
 Documentation/gpu/nova/index.rst           |  30 ++++++++
 MAINTAINERS                                |  11 +++
 drivers/gpu/Makefile                       |   1 +
 drivers/gpu/nova-core/Kconfig              |  14 ++++
 drivers/gpu/nova-core/Makefile             |   3 +
 drivers/gpu/nova-core/driver.rs            |  47 ++++++++++++
 drivers/gpu/nova-core/firmware.rs          |  45 +++++++++++
 drivers/gpu/nova-core/gpu.rs               | 199 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs         |  20 +++++
 drivers/gpu/nova-core/regs.rs              |  55 ++++++++++++++
 drivers/gpu/nova-core/util.rs              |  21 ++++++
 drivers/video/Kconfig                      |   1 +
 rust/kernel/firmware.rs                    | 216 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 rust/macros/module.rs                      |   4 +
 18 files changed, 1207 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/guidelines.rst
 create mode 100644 Documentation/gpu/nova/core/todo.rst
 create mode 100644 Documentation/gpu/nova/guidelines.rst
 create mode 100644 Documentation/gpu/nova/index.rst
 create mode 100644 drivers/gpu/nova-core/Kconfig
 create mode 100644 drivers/gpu/nova-core/Makefile
 create mode 100644 drivers/gpu/nova-core/driver.rs
 create mode 100644 drivers/gpu/nova-core/firmware.rs
 create mode 100644 drivers/gpu/nova-core/gpu.rs
 create mode 100644 drivers/gpu/nova-core/nova_core.rs
 create mode 100644 drivers/gpu/nova-core/regs.rs
 create mode 100644 drivers/gpu/nova-core/util.rs
