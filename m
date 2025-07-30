Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD4DB161A0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 15:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E285410E695;
	Wed, 30 Jul 2025 13:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Cd3pxApB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E8610E695
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 13:37:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753882611; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KeGIAGDAWludj9s2OsBdrrpPcSWLcy/g6IcjI2qEQumzqvim3m0+G5U7zV7FiK/mOzBgOJNkz7kIKeZ49zTzg03nu97CuV45VQa30koNkQOl8zlsxHUlK2jFKDDYAljNgotAtb3sKOH878EkJQgpF/R1reW6UCALridvm2cpOWQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753882611;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ipBuX+007QmZGVBwckpwz4LW/7znlRX+ZLBlKNFcy5A=; 
 b=J/ZEP3VHk8nmnH6k2vfTzTwFl+F2gxWoxYKo1chVvFgh5rRwjGekMPhVMz/olxLfL7H9vDFMb6ogFOyBmREVtvqvpOua0wSu7qXUNAYys/KqKeo37I33JpIm1TvkLKb1ykph41RW9lDxsPMOEF50hbMhPigm3qMFO/1rOO1xCDQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753882611; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=ipBuX+007QmZGVBwckpwz4LW/7znlRX+ZLBlKNFcy5A=;
 b=Cd3pxApBJw0djL6h99BVSWsO9A9AWTc/OwKTpEyNOcnPgGsKbcdtPZl4LPotcWsU
 pHMcLpg0/FBAdfZM6MEW/nowl/7f9nNCclIPLvgsXZSgy2EUx8UgyGq3C5/4VsXT5XX
 1M6ZOA84lCqZ6YzylpwMZr74fCcBfirrXRc7pCBc=
Received: by mx.zohomail.com with SMTPS id 1753882609215993.1319746622694;
 Wed, 30 Jul 2025 06:36:49 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH 0/3] Fix broken `srctree/` links and warn about them
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250730130716.3278285-1-ojeda@kernel.org>
Date: Wed, 30 Jul 2025 10:36:33 -0300
Cc: Alex Gaynor <alex.gaynor@gmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <8CCB36E4-4C5D-4E2F-BC58-255770AA4904@collabora.com>
References: <20250730130716.3278285-1-ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
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

Hi Miguel, this is indeed nice!

> On 30 Jul 2025, at 10:07, Miguel Ojeda <ojeda@kernel.org> wrote:
>=20
> This fixes a handful of broken links and introduces a warning to
> prevent them from happening in the future.
>=20
> Relatedly, we could also perhaps check the other side of the links, =
but
> perhaps there are cases we want to customize. Alternatively, we could
> also in the future introduce custom syntax for these that avoids
> repetition or a fancier preprocessing step.
>=20
> Miguel Ojeda (3):
>  rust: block: fix `srctree/` links
>  rust: drm: fix `srctree/` links
>  rust: warn if `srctree/` links do not exist
>=20
> rust/Makefile                    | 6 ++++++
> rust/kernel/block/mq/gen_disk.rs | 2 +-
> rust/kernel/drm/device.rs        | 2 +-
> rust/kernel/drm/driver.rs        | 2 +-
> rust/kernel/drm/file.rs          | 2 +-
> rust/kernel/drm/gem/mod.rs       | 2 +-
> rust/kernel/drm/ioctl.rs         | 2 +-
> 7 files changed, 12 insertions(+), 6 deletions(-)
>=20
> =E2=80=94
> 2.50.1

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

Patch 3 alone indeed produces the following warnings:

warning: srctree/ link to include/linux/blk_mq.h does not exist
warning: srctree/ link to include/linux/drm/drm_device.h does not exist
warning: srctree/ link to include/linux/drm/drm_ioctl.h does not exist
warning: srctree/ link to include/linux/drm/drm_file.h does not exist
warning: srctree/ link to include/linux/drm/drm_drv.h does not exist
warning: srctree/ link to include/linux/drm/drm_gem.h does not exist

So you can add my Tested-by for that one.

Cheers,
=E2=80=94 Daniel=
