Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA7DB1219B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 18:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE10D10E9ED;
	Fri, 25 Jul 2025 16:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="gSmnJG5m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A3310E9EA;
 Fri, 25 Jul 2025 16:15:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753460106; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=J1WA3IXrUGpGOYPbJ9ZgPNX3m5pjoql//Rr6QiIc0/a8DBBksmQ6Urkzjn0zI4196iWY1/1X1jMvjsQ44piT4vILeaSE0eQNEggv24Spa9fFuAf/kdu+oWsjwOJcDYBpK6bZdu+MDwrs9Qz5Vd2LlIjUi3uB60ZWEHINF2DtbjQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753460106;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Cbvvomnbtrld2kTiEXZvpI4lmoKBMsw0XyhLoXt6moE=; 
 b=OhcsiiYmHKW98rgFm52+kLIPJ3dkkEVTs9egwzepqjos4A/F7IAIwM/mD+5JMK5OxOlfj5+r6YKF1Ib1q72j+dAIR60pAVe6WJ5Dvns329k1yXGEk0yXuMcFRz0OMwYPjeEVYZEFjxh70IoyYvlfJTwSg7JAR/kiyFR08/63oAM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753460106; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=Cbvvomnbtrld2kTiEXZvpI4lmoKBMsw0XyhLoXt6moE=;
 b=gSmnJG5mXW1NZv6+BgCGA3dQ3uyWcDxxMDLgCjLBnlGi/41pNAthyUzhEjKn46Xz
 L2wgQRachDsuZ9/aNUBvl7aPr1GNcFBZAmrahf/XnrKu6N6s1utp8pqakF4IR//WlZ+
 SuiaYNM3/SDvkdrqTCE1Ys/HxfPS+HTfKFmS8JkI=
Received: by mx.zohomail.com with SMTPS id 175346010455174.4659064233291;
 Fri, 25 Jul 2025 09:15:04 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 01/19] gpu: nova-core: register: minor grammar and
 spelling fixes
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250718-nova-regs-v2-1-7b6a762aa1cd@nvidia.com>
Date: Fri, 25 Jul 2025 13:14:49 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 steven.price@arm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <B1AA6359-7854-4284-B533-F5CA3C18AF34@collabora.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-1-7b6a762aa1cd@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
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

Hi Alex. Thank you and John for working on this in general. It will be =
useful
for the whole ecosystem! :)=20

> On 18 Jul 2025, at 04:26, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> From: John Hubbard <jhubbard@nvidia.com>
>=20
> There is only one top-level macro in this file at the moment, but the
> "macros.rs" file name allows for more. Change the wording so that it
> will remain valid even if additional macros are added to the file.
>=20
> Fix a couple of spelling errors and grammatical errors, and break up a
> run-on sentence, for clarity.
>=20
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> drivers/gpu/nova-core/regs/macros.rs | 14 +++++++-------
> 1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/nova-core/regs/macros.rs =
b/drivers/gpu/nova-core/regs/macros.rs
> index =
cdf668073480ed703c89ffa8628f5c9de6494687..864d1e83bed2979f5661e038f4c9fd87=
d33f69a7 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/drivers/gpu/nova-core/regs/macros.rs
> @@ -1,17 +1,17 @@
> // SPDX-License-Identifier: GPL-2.0
>=20
> -//! Macro to define register layout and accessors.
> +//! `register!` macro to define register layout and accessors.

I would have kept this line as-is. Users will most likely know the name =
of the
macro already. At this point, they will be looking for what it does, so
mentioning "register" here is a bit redundant IMHO.

> //!
> //! A single register typically includes several fields, which are =
accessed through a combination
> //! of bit-shift and mask operations that introduce a class of =
potential mistakes, notably because
> //! not all possible field values are necessarily valid.
> //!
> -//! The macro in this module allow to define, using an intruitive and =
readable syntax, a dedicated
> -//! type for each register with its own field accessors that can =
return an error is a field's value
> -//! is invalid.
> +//! The `register!` macro in this module provides an intuitive and =
readable syntax for defining a
> +//! dedicated type for each register. Each such type comes with its =
own field accessors that can
> +//! return an error if a field's value is invalid.
>=20
> -/// Defines a dedicated type for a register with an absolute offset, =
alongside with getter and
> -/// setter methods for its fields and methods to read and write it =
from an `Io` region.
> +/// Defines a dedicated type for a register with an absolute offset, =
including getter and setter
> +/// methods for its fields and methods to read and write it from an =
`Io` region.

+cc Steven Price,

Sorry for hijacking this patch, but I think that we should be more =
flexible and
allow for non-literal offsets in the macro.

In Tyr, for example, some of the offsets need to be computed at runtime, =
i.e.:

+pub(crate) struct AsRegister(usize);
+
+impl AsRegister {
+    fn new(as_nr: usize, offset: usize) -> Result<Self> {
+        if as_nr >=3D 32 {
+            Err(EINVAL)
+        } else {
+            Ok(AsRegister(mmu_as(as_nr) + offset))
+        }
+    }

Or:

+pub(crate) struct Doorbell(usize);
+
+impl Doorbell {
+    pub(crate) fn new(doorbell_id: usize) -> Self {
+        Doorbell(0x80000 + (doorbell_id * 0x10000))
+    }

I don't think this will work with the current macro, JFYI.

> ///
> /// Example:
> ///
> @@ -24,7 +24,7 @@
> /// ```
> ///
> /// This defines a `BOOT_0` type which can be read or written from =
offset `0x100` of an `Io`
> -/// region. It is composed of 3 fields, for instance `minor_revision` =
is made of the 4 less
> +/// region. It is composed of 3 fields, for instance `minor_revision` =
is made of the 4 least
> /// significant bits of the register. Each field can be accessed and =
modified using accessor
> /// methods:
> ///
>=20
> --=20
> 2.50.1
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

