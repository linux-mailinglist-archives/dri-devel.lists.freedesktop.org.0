Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3223BBF2FA
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 22:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2B610E462;
	Mon,  6 Oct 2025 20:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I95PoAHT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5889510E460;
 Mon,  6 Oct 2025 20:27:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E1B87438BD;
 Mon,  6 Oct 2025 20:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA4AC4CEF5;
 Mon,  6 Oct 2025 20:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759782437;
 bh=ERvHqLDNGOEaUGZCyJ3haiBB35X3X5xMUfWhSjsCzEk=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=I95PoAHTTWY2sKahCIUX0LJ3Q8wmcRypWIbRKDG6SQ8Eupi2JsA++ELZOzuBBfPNh
 mNEjmv5klNUu/+uzIfxwN1BvMaWmn1PqpUGLo/oqFCKcuV3tH6hSKyTQEIWK0cEFs3
 N7bBQC3OOcXbqrd2KuxRVlj2rgyOkiiLmcF4rwsfHA7dMq42oY9cfZ9xMIblmDelPj
 tXv0uhE0sUdqMHR4VLpW9NOWOtye4dAey8Bs8JElrGrZVPvkcPAG++ELPePHer7amp
 PZCc5tWxJRIpcHvnpIpt5JGGQ+WjY1PIseASh7jhmn11yolchrZzKZPBUZXz8KT49K
 2Umv4wtZyON4Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Oct 2025 22:27:13 +0200
Message-Id: <DDBIT5J2HUWO.2MQPD4H5G4A44@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 3/5] drm/nouveau/mmu/gp100: Remove unused/broken support
 for compression
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Mary
 Guillemard" <mary@mary.zone>, "Faith Ekstrand"
 <faith.ekstrand@collabora.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Lyude
 Paul" <lyude@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>
To: "Mohamed Ahmed" <mohamedahmedegypt2001@gmail.com>
References: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
 <20251006191329.277485-4-mohamedahmedegypt2001@gmail.com>
In-Reply-To: <20251006191329.277485-4-mohamedahmedegypt2001@gmail.com>
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

On Mon Oct 6, 2025 at 9:13 PM CEST, Mohamed Ahmed wrote:
> From: Ben Skeggs <bskeggs@nvidia.com>
>
> From GP100 onwards it's not possible to initialise comptag RAM without
> PMU firmware, which nouveau has no support for.
>
> As such, this code is essentially a no-op and will always revert to the
> equivalent non-compressed kind due to comptag allocation failure.  It's
> also broken for the needs of VM_BIND/Vulkan.
>
> Remove the code entirely to make way for supporting compression on GPUs
> that support GSM-RM.
>
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>

This patch is missing your SoB.
