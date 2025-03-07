Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D14AEA56F36
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 18:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD0010EC09;
	Fri,  7 Mar 2025 17:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WksvJn1d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4EE10EC09
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 17:38:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2EF11A44E0D;
 Fri,  7 Mar 2025 17:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F8FC4CEE7;
 Fri,  7 Mar 2025 17:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741369115;
 bh=1anCR1zJXUnQImJd8M1Vqm1y++5+d5U9NzwTDIDXY2w=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=WksvJn1dFP7Pkqfo0i7CGDTx945wZeMTJNNIUfv+WsTt3w6oVhwSuYYqVFDq5Q2eJ
 4lsPNJxVHfnJBNuwQoTKZn3wMwUrbBh5wI/+xhdccEx6kJEwrp8DfuEj0GV+mJ0cxB
 234LHk894qf6iu8RT4EpvRbpReKNjvuNu9xmlB4vjY21CCLGSxYfDY82D/Nvhfc+0v
 uBZ/O//CD4UWzoXSzrSHMvtJuSIYeZ7eorBsD2PB/5qPNs72qIuKNeW5/omsLZ/FLU
 2nqTYRoGlPrO6cEaChJ7JBN5KdZKPw5D1Lo7eiDgmhoqY2Y1ZnNfStP80ZmOtC6lRA
 BRCquVafFbgRg==
Message-ID: <eb9ca88d6087514919c12a4cae1dc484@kernel.org>
Date: Fri, 07 Mar 2025 17:38:33 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
Subject: Re: [RFC v3 30/33] rust: drm/kms: Add Device::num_crtcs()
In-Reply-To: <20250305230406.567126-31-lyude@redhat.com>
References: <20250305230406.567126-31-lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, mcanal@igalia.com,
 rust-for-linux@vger.kernel.org, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Benno Lossin" <benno.lossin@proton.me>,
 =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Maxime Ripard" <mripard@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Simona Vetter" <sima@ffwll.ch>,
 "Trevor Gross" <tmgross@umich.edu>, "open
 list" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
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

On Wed, 5 Mar 2025 17:59:46 -0500, Lyude Paul wrote:
> A binding for checking drm_device.num_crtcs. We'll need this in a moment
> for vblank support, since setting it up requires knowing the number of
> CRTCs that a driver has initialized.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
