Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B32CEBA7F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 10:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775F410E9A5;
	Wed, 31 Dec 2025 09:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OIph+V/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4309010E9A5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 09:15:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7F26BC1AE23;
 Wed, 31 Dec 2025 09:14:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 206C260744;
 Wed, 31 Dec 2025 09:15:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 05415113B0755; Wed, 31 Dec 2025 10:14:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767172502; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0063sSsioo5ahiIjYE6TqPfIYj5Bo6k+tEWffoXGQJI=;
 b=OIph+V/F3Y1bjGywnpWRPDI58cuEHLeLvz2ZmVj8NSw63tGOtIhdMHPT7+ENbrF26Akrde
 vHDGQYv5Y9heKah/Wka3akEjYl+2T3YiyuTXXn9ZI219Qn30s8WpFtUeXFftiCiZd2fyJ0
 G7MgbXFxkgWHBo7mIPHWNeYuAxO32DXuQd56wrMKhUPxdONPhT1qo6YFIrpaR13WEW1bbg
 Tjpe1k9KC1rQZx+3aPMbXd1ZuFk6+lbGJ5F3CIxPkF/Tu9QuUx5D6ggvH8G419uEd//NYy
 iMq4ta1KdagYePHUS2kmz0G/GSK0SWABA7ZZ9JT2G7NYZFAYV+g9Fwczpn9BEw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Dec 2025 10:14:59 +0100
Message-Id: <DFCADAUEQ81L.MTQZKYR0C33S@bootlin.com>
Subject: Re: [PATCH 2/2] host1x: Convert to bus methods
Cc: <linux-crypto@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Akhil
 R" <akhilrajeev@nvidia.com>, "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, "Thierry Reding"
 <thierry.reding@gmail.com>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Mikko Perttunen" <mperttunen@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Sowjanya
 Komatineni" <skomatineni@nvidia.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
 <dd55d034c68953268ea416aa5c13e41b158fcbb4.1765355236.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <dd55d034c68953268ea416aa5c13e41b158fcbb4.1765355236.git.u.kleine-koenig@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
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

On Wed Dec 10, 2025 at 9:31 AM CET, Uwe Kleine-K=C3=B6nig wrote:
> The callbacks .probe(), .remove() and .shutdown() for device_drivers
> should go away. So migrate to bus methods. There are two differences
> that need addressing:
>
>  - The bus remove callback returns void while the driver remove callback
>    returns int (the actual value is ignored by the core).
>  - The bus shutdown callback is also called for unbound devices, so an
>    additional check for dev->driver !=3D NULL is needed.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20 tegra-video
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
