Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576CA927305
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 11:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF7A10EA61;
	Thu,  4 Jul 2024 09:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1X1jcqzV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CFD10EA61
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 09:28:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C420F6211C;
 Thu,  4 Jul 2024 09:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9065C3277B;
 Thu,  4 Jul 2024 09:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1720085335;
 bh=77clekpa8nlbta5kCQm7ekukTsxOEhNX+CIOiu76l0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1X1jcqzVerMqMm82oOjqERfADLqDeHn8StFAnn5416bYoANr0UNNZO79Td/XJoJhn
 gTOIX9EDlsKcJTVh7aH/ZFtNahAA4nEbCNA9JmbYjDjTBidw7PuNAwT7jiy0V2KNMj
 dF/yt2u3oc0yG4a00Zx6nJtiSUdiJ/HBKbPVoD+c=
Date: Thu, 4 Jul 2024 11:22:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: jfalempe@redhat.com, a.hindborg@samsung.com, airlied@gmail.com,
 alex.gaynor@gmail.com, benno.lossin@proton.me,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@redhat.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, gary@garyguo.net,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org, tzimmermann@suse.de, wedsonaf@gmail.com
Subject: Re: [PATCH 4/4] drm/panic: Add a qr_code panic screen
Message-ID: <2024070407-pregnancy-hazing-add9@gregkh>
References: <20240703154309.426867-5-jfalempe@redhat.com>
 <20240704091109.1453809-1-aliceryhl@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704091109.1453809-1-aliceryhl@google.com>
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

On Thu, Jul 04, 2024 at 09:11:09AM +0000, Alice Ryhl wrote:
> As long as the above requirements are satisfied, calling
> `drm_panic_qr_generate` should never cause memory unsafety, so this is
> an appropriate list of safety requirements.
> 
> (You also require that `data_len <= data_size`, but if this is violated
> you get a kernel panic which isn't a memory safety problem, so it does
> not need to be listed in the safety requirements.)

Panicing while trying to print out a panic message is not a good idea,
so enforcing this would be nice :)

thanks,

greg k-h
