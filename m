Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EC38A4846
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 08:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBFA10E20B;
	Mon, 15 Apr 2024 06:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="grJH5ukb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859A210E20B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 06:43:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8902860B94;
 Mon, 15 Apr 2024 06:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2321C3277B;
 Mon, 15 Apr 2024 06:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713163424;
 bh=DNNTj+ykDgM/JD4IQplT3/fMLpZxUwGg0a/sfofypEA=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=grJH5ukbJiygA1ARCF3SJlQpcu7vxzkD7XPDygzVcrACtm6Szv3GGaQrXSobFRN+I
 Y+oYQKWHJCSt2JIbappiAkmsXTwOUhR2133qqVLZasThzLBoVJcHVJbvMdkqXQTV3X
 jMjfep2N3bgFTN38PXBJvBZagZELuCrinl7zA0g0g6W62xF+erU9VZRFyuNMsyy0ZW
 8h3E2ryxXET7ISmwUOTyS6LfJGvJ5Wkch2fUvlZbNBUqe/N7ST0ooKwdI/u7vvSlcy
 2cXi7wxJdQX8QgduyJGXMm5r94cWapN8vWhC4+ZC17VD/PPyZe8F3y6+PmK+iT+/iv
 Ux0CxPLeK4qAQ==
Message-ID: <5843f81d9ca77b26aeb25504f9c8a4f6@kernel.org>
Date: Mon, 15 Apr 2024 06:43:41 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 01/43] drm/fbdev-generic: Do not set physical
 framebuffer address
In-Reply-To: <20240410130557.31572-2-tzimmermann@suse.de>
References: <20240410130557.31572-2-tzimmermann@suse.de>
Cc: airlied@gmail.com, daniel@ffwll.ch, deller@gmx.de,
 dri-devel@lists.freedesktop.org, javierm@redhat.com,
 linux-fbdev@vger.kernel.org, stable@vger.kernel.org, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Sui
 Jingfeng" <sui.jingfeng@linux.dev>, "Zack Rusin" <zack.rusin@broadcom.com>,
 "Zack Rusin" <zackr@vmware.com>
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

On Wed, 10 Apr 2024 15:01:57 +0200, Thomas Zimmermann wrote:
> Framebuffer memory is allocated via vzalloc() from non-contiguous
> physical pages. The physical framebuffer start address is therefore
> meaningless. Do not set it.
> 
> The value is not used within the kernel and only exported to userspace
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
