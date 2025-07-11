Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE0B02351
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 20:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AE810E2D7;
	Fri, 11 Jul 2025 18:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bayH31tB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457FA10E2D7;
 Fri, 11 Jul 2025 18:06:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2041CA54FD4;
 Fri, 11 Jul 2025 18:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544B0C4CEED;
 Fri, 11 Jul 2025 18:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752257179;
 bh=/9a4/phpDuawySJjaWTXurkeMeclgalXZ+d6x2nKduE=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=bayH31tBJpB2xff+SviA/VIFbkWDbwD1toV8iU2SxFjLzeDuPi8In4FDK5MDz9FLd
 NvoRdcPXZd7wqDabLslCByJu1MNX1HbPLtuN1Lv1DWatOGxSriiwEeyCW5g7bO9zdV
 qMI2nR0VXxp3a5x5ko9hBCpRfU5lpXtp75kWvJUjNhoOEZUrKktyvnqUr7dHkwxcVP
 VAXeeohX0ku/COIy2ATQ6UrQvUnLrKTBQt7NvqgAvY5ydjGmtNcUzr84pheryyiu1O
 /vIs/a5Cazj0eKAIZBe/d7iJqCLBP+/LNLRr/QxCwbxqQ4jehnczVlOIn+M5T2kgN1
 qhkl6Ne5lRH1w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 20:06:14 +0200
Message-Id: <DB9FBT4H5FOZ.14JZJCXMEIYU1@kernel.org>
Subject: Re: [PATCH] drm/nouveau: check ioctl command codes better
Cc: "Lyude Paul" <lyude@redhat.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Ben Skeggs" <bskeggs@redhat.com>, "Arnd
 Bergmann" <arnd@arndb.de>, "Ben Skeggs" <bskeggs@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Dave Airlie" <airlied@redhat.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Arnd Bergmann" <arnd@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250711072458.2665325-1-arnd@kernel.org>
In-Reply-To: <20250711072458.2665325-1-arnd@kernel.org>
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

On Fri Jul 11, 2025 at 9:24 AM CEST, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> nouveau_drm_ioctl() only checks the _IOC_NR() bits in the DRM_NOUVEAU_NVI=
F
> command, but ignores the type and direction bits, so any command with
> '7' in the low eight bits gets passed into nouveau_abi16_ioctl() instead
> of drm_ioctl().
>
> Check for all the bits except the size that is handled inside of the hand=
ler.
>
> Fixes: 27111a23d01c ("drm/nouveau: expose the full object/event interface=
s to userspace")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to drm-misc-fixes, thanks!

  [ Fix up two checkpatch warnings and a typo. - Danilo ]
