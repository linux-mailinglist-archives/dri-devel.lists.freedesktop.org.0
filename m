Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B37A9D85D5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 14:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A1910E64A;
	Mon, 25 Nov 2024 13:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SlcPsmsw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA69B10E64A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 13:04:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A3F2B5C4D58;
 Mon, 25 Nov 2024 13:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868D6C4CECE;
 Mon, 25 Nov 2024 13:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732539856;
 bh=r7HHe0SIRB/Xhhuek+OVQ0KZeGyRWxN7kMyA6beaWWg=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=SlcPsmswDWw1qUPky6PGkkOP4b2wa0bm4kONi0Jn/5VHClT7MdVQIlp82tbtoAlAk
 XMwmLYaCB1CpkKCUEaBCkT7zLP4BuTBdDo6HgzugoQQXJVzj4K6LLQbknKVX/69E0L
 7EbuaLl2NKQ5KDfCAjNwIC15K1sVB1chuXPqUMwG242zNz9mLJKJ68Klk5HiR2VDms
 mk5iMuIgz7gD3zvfAdAeNWCPmrF67KuHh4mdy0RuN0LOW7A6sSV0W6tnYmM07bpstZ
 qOlwraK5aKm1jL8jR822jS+GKjsx0dMIZrmzNU1T5B1dwxNZgncyZvRRD9qCDH9R6u
 OPMw4ZChAm2Pg==
Message-ID: <fd7766b66026ffbab54db6f134940efc@kernel.org>
Date: Mon, 25 Nov 2024 13:04:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v5 3/5] drm/vkms: Switch to managed for crtc
In-Reply-To: <20241122-google-vkms-managed-v5-3-1ab60403e960@bootlin.com>
References: <20241122-google-vkms-managed-v5-3-1ab60403e960@bootlin.com>
Cc: arthurgrillo@riseup.net, dri-devel@lists.freedesktop.org,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com, nicolejadeyee@google.com, seanpaul@google.com,
 thomas.petazzoni@bootlin.com, "David
 Airlie" <airlied@gmail.com>, "Haneen Mohammed" <hamohammed.sa@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, 
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 "Melissa Wen" <melissa.srw@gmail.com>, "Rodrigo
 Siqueira" <rodrigosiqueiramelo@gmail.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Fri, 22 Nov 2024 17:27:58 +0100, Louis Chauvet wrote:
> The current VKMS driver uses managed function to create crtc, but
> don't use it to properly clean the crtc workqueue. It is not an
> issue yet, but in order to support multiple devices easily,
> convert this code to use drm and device managed helpers.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
