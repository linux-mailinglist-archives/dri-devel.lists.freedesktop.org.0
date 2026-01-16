Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB651D3329F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 16:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB9310E8C6;
	Fri, 16 Jan 2026 15:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DAJ56O0v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB6510E8C6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 15:25:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 966486016F;
 Fri, 16 Jan 2026 15:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250A2C116C6;
 Fri, 16 Jan 2026 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768577126;
 bh=KafYf1PDmObWFHpL7ROG48MgsO+5ZgP9jpmdINXl6ZQ=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=DAJ56O0v3utoQWm1BkySC+Jr4/demiIF+A74YyLHapmRa4VeC+CqztOihc/pI2oQb
 R21AgILlKi4wJAuW5HsxOQGYxp8TLfD7af/94HGngLE3FZcumFMvIlYiufRK5HZZEd
 10RE6nxwmCr2wDa9NxJ8CGep+51QbcyIngrMD5e8AxVwsOehMOOlQsVynQrAGGiklr
 C2+3Xu8gUl6ZFrJtqt7uDY/SEUM/NAJwn9+OD6PWKZDk4iKRjSGcaaXjQ4vac5syEJ
 dcrfQMjZAITPlBCSBO4dqGMn/yinpiSG2OJpX81cw7TEDdSYWHtrLlxJtISs3ZzNGg
 bxbmEZIyWCfmg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 16:25:20 +0100
Message-Id: <DFQ49KSXC7WG.W2HA9JUGJZ4R@kernel.org>
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Dirk Behme"
 <Dirk.Behme@de.bosch.com>, "Dirk Behme" <dirk.behme@gmail.com>, "Alice
 Ryhl" <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Steven Price" <steven.price@arm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
 <fdc39008-ba4a-4170-b7ce-cca2deda5652@de.bosch.com>
 <1EF6A3B7-216F-47C3-8631-25C38994BAC1@collabora.com>
 <DFQ45GSQLR55.1GRM6DSYTG01D@nvidia.com>
In-Reply-To: <DFQ45GSQLR55.1GRM6DSYTG01D@nvidia.com>
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

On Fri Jan 16, 2026 at 4:19 PM CET, Alexandre Courbot wrote:
> This means that fields won't need to have an explicit integer type
> anymore (they will automatically use the corresponding `BoundedInt`
> instead).

Oh right, I forgot about this for a second.
