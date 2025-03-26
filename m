Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6CEA71353
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 10:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EB910E664;
	Wed, 26 Mar 2025 09:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oq9hxf+7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DA610E664
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 09:08:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3251F5C4708;
 Wed, 26 Mar 2025 09:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88876C4CEE2;
 Wed, 26 Mar 2025 09:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742980075;
 bh=L2t5HFJDwx1CY7bwvfOQjamBPEOLVGzjYbHFYv4C6Q0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=oq9hxf+7poeUYApJeYHubRoEgnedRmnqV0fQlahZbYb/2lBGuig2LNFrrlqlFDIZz
 xa9tPInKWCXWaSKrga2ZQ5BDztLvuvrwX4c88dYp3yfBb4oV1olTV97zgWMPRMMh++
 ct5fUpkhf4/agpNWeLt2GTrSMOhUaHJ2sUjnrgnhYdyWfKLUnVDAS5bUC8GsyWCn5V
 RhaKL6KcC/N/XAr6xu4a/ZD2POvsgikeWiPsc2mfvlQAE1a8i4InTNxSAF/vB7688y
 9eknAEdR7MGDroi/WDWr2kY9BM751PZW9PE8ADejFJCYyMa+mredV0r7blnsh9/4hd
 aeEpyS/H21XAA==
Message-ID: <5125a08fb0a028a4152a64dd8f194434@kernel.org>
Date: Wed, 26 Mar 2025 09:07:53 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
Subject: Re: [PATCH 0/2] drm: Make some resolution info unsigned
In-Reply-To: <20250325212823.669459-1-lyude@redhat.com>
References: <20250325212823.669459-1-lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Benno Lossin" <benno.lossin@proton.me>,
 =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Maxime Ripard" <mripard@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 =?utf-8?b?b3BlbiBsaXN0OlJVU1Q6S2V5d29yZDogYig/aTpydXN0KSBi?=
 <rust-for-linux@vger.kernel.org>
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

On Tue, 25 Mar 2025 17:27:03 -0400, Lyude Paul wrote:
> During the review of some of my patches for KMS bindings in Rust, it was
> pointed out we have some areas of DRM that are storing resolutions as
> signed integers when it doesn't really make sense. Since there's no real
> usecase for this and it's a bit more obvious when writing rust code then
> it is in C, let's fix this.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
