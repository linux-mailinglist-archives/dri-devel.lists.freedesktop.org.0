Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4048CB3972A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7301610E878;
	Thu, 28 Aug 2025 08:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YOdWZoog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6177C10E878;
 Thu, 28 Aug 2025 08:38:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BD838600AA;
 Thu, 28 Aug 2025 08:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A37C4CEEB;
 Thu, 28 Aug 2025 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756370283;
 bh=RLF9Eq6Z6idVLMgdhF1IxeUg0uG5/P336meJJ/91tmM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YOdWZoogkvhUp2tYBgKmEUo+uNcZyZ4yJ5RkXDCt9rd5wUTS31gu6nNh9TuOC+pxR
 8Djxzg1W6/SF174hnpdATFGA+HT851CaZ8p0SY7FHZcFTsILZAuGgcStu8QdZ17k0e
 tIvZGhajvxmgMJtuBFZocgRE1Ixt7J4Wly3Cubf//79+jyWiCnoWcOgZLzoq7Sv8OM
 sIAr6Qgap0prHZstzZ0zpwDBuPeNdEOWS9yD7/V0y5Px95d9/t9MuHxyt+mIbFAx+v
 srmw+zPSfyX43tSvi0PvTDd6fH8woqLnztC7WVFRK9os6N11mKLlcm0Gx/kVP0t4rN
 Tvv8EJD0+fecQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: apopple@nvidia.com
Cc: a.hindborg@kernel.org, acourbot@nvidia.com, airlied@gmail.com,
 alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, dakr@kernel.org, dri-devel@lists.freedesktop.org,
 gary@garyguo.net, jhubbard@nvidia.com, joelagnelf@nvidia.com,
 linux-kernel@vger.kernel.org, lossin@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ojeda@kernel.org, simona@ffwll.ch,
 tmgross@umich.edu, ttabi@nvidia.com, tzimmermann@suse.de
Subject: Re: [PATCH 00/10] gpu: nova-core: Boot GSP to RISC-V active
Date: Thu, 28 Aug 2025 10:37:37 +0200
Message-ID: <20250828083737.22214-1-ojeda@kernel.org>
In-Reply-To: <20250827082015.959430-1-apopple@nvidia.com>
References: <20250827082015.959430-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wed, 27 Aug 2025 18:19:57 +1000 Alistair Popple <apopple@nvidia.com> wrote:
>
> This series builds on top of Alex's series[1] to continue initialising the GSP
> into a state where it becomes active and it starts communicating with the host.

No big deal, but in case it helps since probably it was not intentional given
the rest of the people is there: the rust-for-linux Cc is missing.

Cheers,
Miguel
