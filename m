Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B49A20895
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 11:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0971910E63E;
	Tue, 28 Jan 2025 10:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IAKt2a66";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E210810E63E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 10:32:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6D4F6DF;
 Tue, 28 Jan 2025 11:31:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1738060282;
 bh=WnDBMq69K4jQoUM/h8kbi6BhIl8V+e3PP/oTZpu4AUo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=IAKt2a66XpBCNjHmAVgNst9/d3eDZLwjsnHN8sVN7qo7GcesioJbdWqhM9HWrLKNL
 RemqsXdY7nGrHLdWJjqeuhEzMYu8YFhlGfRYHRk7AKXx4hWTZ92u4xvb4gTXgkHv1G
 uq0BFpOfqve9EiAzlL9X9IujvTNxXyOOTuLwPTWI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>
References: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>
Subject: Re: [PATCH] MAINTAINERS: Update drm/rcar-du maintainers
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Date: Tue, 28 Jan 2025 10:32:26 +0000
Message-ID: <173806034678.3771432.6102717886527607170@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
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

Quoting Tomi Valkeinen (2025-01-28 10:28:48)
> Add myself as drm/rcar-du maintainer. Switch Kieran from a maintainer to
> reviewer.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ed86d884ee0d..5b1bf5fd56fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7760,7 +7760,8 @@ F:        include/uapi/drm/tegra_drm.h
> =20
>  DRM DRIVERS FOR RENESAS R-CAR
>  M:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> -M:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +M:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> +R:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>  L:     dri-devel@lists.freedesktop.org
>  L:     linux-renesas-soc@vger.kernel.org
>  S:     Supported
>=20
> ---
> base-commit: e2a81c0cd7de6cb063058be304b18f200c64802b
> change-id: 20250128-rcar-du-maintainers-34ee66948f04
>=20
> Best regards,
> --=20
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>
