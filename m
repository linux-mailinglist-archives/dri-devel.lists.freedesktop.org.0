Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D92DCE74D2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 17:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F4210E53C;
	Mon, 29 Dec 2025 16:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tPZQajFT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0AA10E53C;
 Mon, 29 Dec 2025 16:11:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D27A46000A;
 Mon, 29 Dec 2025 16:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7815C4CEF7;
 Mon, 29 Dec 2025 16:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767024675;
 bh=A+JFdVrj/EG2jTB+c7iSrXC0M51hsvw0JZZiGo2sQlk=;
 h=Date:From:Subject:Cc:To:From;
 b=tPZQajFTVvAA5n7DLwnLGfooFV+V4hMDPeMnRtDvsE9n0w/BZ6C1XyzhKuYLtNwb/
 SCS0+b+8hUb3JwSsCBffXWjzm38mE6fKuFSpD+p7j74IaBovtBAAOXo3oqhUzAV/Xi
 O8NI/hnvMsvB5zipX6TUhleqvJw25wcyBA2yZFzuFdTKbV62SAFB0in8MnlaxkL8e2
 K+Qict/FHvR3B4f7MIhNqwG1xU/2wCITplgdI+Gs0mTROTxnioqRECvkTbQbLfcjR3
 M9ji5sj1ojqYyCXyRgZbZeJQhHxdJ9hPBly/IrzOUZzDw6BEGQHUtuf+ZxzYroTYAt
 s88Qrj1H/dg7Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Dec 2025 17:11:11 +0100
Message-Id: <DFATYVSQRQ4W.1R030NZ34XUZK@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: [GIT PULL] DRM Rust fixes for v6.19-rc4
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Dave Airlie" <airlied@gmail.com>, "Simona Vetter" <simona.vetter@ffwll.ch>
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

Hi Dave and Sima,

Please pull these DRM Rust fixes.

Due to the linux-next break until January 4, not all of them have been in
linux-next; no conflicts expected.

- Danilo

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8=
:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/rust/kernel.git tags/drm-rust-fixes-20=
25-12-29

for you to fetch changes up to 97872fa28b33a1ca6acc0a7b260750c9a123b193:

  MAINTAINERS: exclude the tyr driver from DRM MISC (2025-12-26 12:14:40 +0=
000)

----------------------------------------------------------------
DRM Rust fixes for v6.19-rc4

MAINTAINERS:
  - Fix Nova GPU driver git links.
  - Fix typo in TYR driver entry preventing correct behavior of
    scripts/get_maintainer.pl.
  - Exclude TYR driver from DRM MISC.

Nova Core:
  - Correctly select RUST_FW_LOADER_ABSTRACTIONS to prevent build
    errors.
  - Regenerate nova-core bindgen bindings with '--explicit-padding' to
    avoid uninitialized bytes.
  - Fix length of received GSP messages, due to miscalculated message
    payload size.
  - Regenerate bindings to derive MaybeZeroable.
  - Use a bindings alias to derive the firmware version.

----------------------------------------------------------------
Alexandre Courbot (5):
      gpu: nova-core: select RUST_FW_LOADER_ABSTRACTIONS
      gpu: nova-core: bindings: add missing explicit padding
      gpu: nova-core: gsp: fix length of received messages
      gpu: nova-core: bindings: derive `MaybeZeroable`
      gpu: nova-core: gsp: replace firmware version with "bindings" alias

Danilo Krummrich (2):
      MAINTAINERS: fix typo in TYR DRM driver entry
      MAINTAINERS: exclude the tyr driver from DRM MISC

Philipp Stanner (1):
      MAINTAINERS: Update Nova GPU driver git link

 MAINTAINERS                                       |   7 +-
 drivers/gpu/nova-core/Kconfig                     |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                 |  14 +--
 drivers/gpu/nova-core/gsp/fw.rs                   |  78 ++++++++--------
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |  11 ++-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 105 ++++++++++++------=
----
 6 files changed, 117 insertions(+), 100 deletions(-)
