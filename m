Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1125DAB7EF8
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 09:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB35C10E795;
	Thu, 15 May 2025 07:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TQUnO3yi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E45610E78D;
 Thu, 15 May 2025 07:38:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 65104A4C99A;
 Thu, 15 May 2025 07:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69CF3C4CEE7;
 Thu, 15 May 2025 07:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1747294692;
 bh=R+oXMrFZiQAmHeF0XsyIUPrpLQVVx2PG/xBSC4ude1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TQUnO3yiaI9kPB18R6cZkm3IQxY3CxZnzfBSOZhdtkeMgO8tR/gjr0nMyBtrzmM9p
 ld8DvAzhE0LB/5wmRwzxqqNnbFEiW6IhHCOt0M+Z3i1YQTVS1Ojs4oTJF/XR8d/l7M
 dS0vqOQH6YV+wxUkwaH3/rXfiBlm1kJG3tVibFrY=
Date: Thu, 15 May 2025 09:36:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] samples: rust: select AUXILIARY_BUS instead of
 depending on it
Message-ID: <2025051511-unstitch-familiar-e376@gregkh>
References: <20250515-aux_bus-v1-0-1781b54424e4@nvidia.com>
 <20250515-aux_bus-v1-1-1781b54424e4@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-aux_bus-v1-1-1781b54424e4@nvidia.com>
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

On Thu, May 15, 2025 at 03:26:13PM +0900, Alexandre Courbot wrote:
> CONFIG_AUXILIARY_BUS cannot be enabled explicitly, and unless we select
> it we have no way to include it (and thus to enable the auxiliary driver
> sample) unless a driver happens to do it for us.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  samples/rust/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
