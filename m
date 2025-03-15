Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF74EA62E6C
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 15:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1D110E0E5;
	Sat, 15 Mar 2025 14:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BTm43f3T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F284210E0E5;
 Sat, 15 Mar 2025 14:50:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E0FACA48A9D;
 Sat, 15 Mar 2025 14:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08541C4CEE5;
 Sat, 15 Mar 2025 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742050223;
 bh=FQUYiextVDgUYWXuF/yOc1G6zOZN1i3xz/ylkwvnuaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BTm43f3TprM/O1OebuMSkny0gUTnQYZ7VIiozKjrXmmjsjSFki338r0rWavmIMw2j
 oz6QJiJks32TavMMIiqUKhUrhbWe2mfnAjKzFZN0OCkipUL8KzA5syo+mVdQJFsY3O
 bD7VB452AtKBkDf1JXl19T+iONzguOlsaxKB6aqB6k5ZsqddPT03JCaNcRGYPSxCUc
 09fn56/0FXp4uzAMyO901WQjhPgtyOH2St60EyQRam3skiG7uvSD7WpJbREltoTHyL
 KYeL2b5Jgy2fJvAQZh+xdO5ivVuEsRnSR1p01wbCo7yDec/82/IaKCKXAzWgzMibVw
 yvnVLF16OIDcw==
Date: Sat, 15 Mar 2025 15:50:16 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 acourbot@nvidia.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/3] rust: alloc: add Vec::resize and Vec::truncate
Message-ID: <Z9WTqChNDG8GnXY0@cassiopeiae>
References: <20250315024235.5282-1-andrewjballance@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315024235.5282-1-andrewjballance@gmail.com>
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

Hi Andrew,

On Fri, Mar 14, 2025 at 09:42:32PM -0500, Andrew Ballance wrote:
> This patch series implements the Vec::truncate and Vec::resize methods
> that were needed by the nova driver and removes the corresponding item
> from their task list
> 
> Andrew Ballance (3):
>   rust: alloc: add Vec::truncate method
>   rust: alloc: add Vec::resize method
>   gpu: nova-core: remove completed Vec extentions from task list

Thanks for picking this up!

Once ready, I will pick up the first two patches for alloc-next and take the
third one through the nova tree.

But you can keep them in the same series for subsequent submissions.

- Danilo
