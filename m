Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C672BC9C5D
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 17:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6616510EA92;
	Thu,  9 Oct 2025 15:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mZ8KF4Hq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB32C10EA92
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 15:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760023591;
 bh=vHT4mml/Nfbml0xk4/KK+lrmsPkXCmCZsxGJY9nykX4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mZ8KF4HqcHQ8cBZqIGrG9elLhSvonQ6hYdSdQkE44ec1oKFk4C0qfrf8ZuV2NIdh/
 802liWwnc59w0kL0NCGk/PsC7is5byP+r4T4XH6XWkDTtQTDpSEytTCu8VfChdJiU/
 odPNnzq1v/48tat5P1cp7o9DYUeAZ3KXDf8UQfhJdFGaLvnhSBs7iDi3SH/ZZ7B4Aa
 2uyTgTipJJbAygcLr1Rl/Z6nO8yMGbFtwY6D1PrV4VPbT9G0chN9fiz5kStI8NgzIn
 j+JRcx93ogCJ7b7M/TFxYEqxeM0iIGOdQxkOE+29PfaP2+hl2ZPCuajsmiU/D9ps21
 slWT607oUHxQg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 14A0017E108C;
 Thu,  9 Oct 2025 17:26:31 +0200 (CEST)
Date: Thu, 9 Oct 2025 17:26:26 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Steven
 Price <steven.price@arm.com>, kernel@collabora.com
Subject: Re: [PATCH v5 12/12] MAINTAINERS: Add Adrian Larumbe as Panfrost
 driver maintainer
Message-ID: <20251009172626.45feb3ea@fedora>
In-Reply-To: <20251007150216.254250-13-adrian.larumbe@collabora.com>
References: <20251007150216.254250-1-adrian.larumbe@collabora.com>
 <20251007150216.254250-13-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Tue,  7 Oct 2025 16:01:54 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Add Adrian Larumbe as Panfrost driver maintainer.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

Welcome to the team!

Once this is merged, you probably want to ask for drm-misc access so
you can start merging panfrost patches yourself.

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5257d52679d6..cb68fdec3da4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2066,6 +2066,7 @@ F:	drivers/gpu/drm/arm/display/komeda/
>  ARM MALI PANFROST DRM DRIVER
>  M:	Boris Brezillon <boris.brezillon@collabora.com>
>  M:	Rob Herring <robh@kernel.org>
> +M:      Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
>  R:	Steven Price <steven.price@arm.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported

