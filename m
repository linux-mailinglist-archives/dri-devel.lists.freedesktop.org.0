Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3104CEBA7C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 10:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FD710E177;
	Wed, 31 Dec 2025 09:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="m+4MNxrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2C710E177
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 09:14:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5DBD31A255E;
 Wed, 31 Dec 2025 09:14:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 24BFE60744;
 Wed, 31 Dec 2025 09:14:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EDB1A113B0755; Wed, 31 Dec 2025 10:14:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767172493; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uvY5D395av1Fzi8rWyPb3NDwQB1JNSZRGeRvOXJX3qo=;
 b=m+4MNxrSClxe2FMQDwRiICic9Rd6awW1oEfHO9MeRVPI6hGOshZAD8joRR7/xq2zao6QnL
 LX0Em3O0qEikXTWAKfGKg2ezktnODOumU5M1Z8NM0FOcQnuU9CWwIfRxP6DeonZE8YZL5r
 g5iJpGe03lHtSipqGfXVjGMes88i6QJB+LnwB4ubBjgBRLLruGpN+L84Tl4iUgPK6ShW2S
 P3g5Rq2OH4GLeLDEhWyYJ8mHRv72R99Vi2q7uPRuVedrgfXYql0jG3Rs/tCdq92CmnQlfJ
 Xxo1WWN/RLtcMgh87zBKETB+jNYu66y0v48f7MORDZPlHWHgnNHG4oWh3+JuQg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Dec 2025 10:14:45 +0100
Message-Id: <DFCAD4LVB5RF.3PI81T1E0OIID@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 1/2] host1x: Make remove callback return void
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
X-Mailer: aerc 0.20.1
References: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
 <d364fd4ec043d36ee12e46eaef98c57658884f63.1765355236.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <d364fd4ec043d36ee12e46eaef98c57658884f63.1765355236.git.u.kleine-koenig@baylibre.com>
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

Hello Uwe,

On Wed Dec 10, 2025 at 9:31 AM CET, Uwe Kleine-K=C3=B6nig wrote:
> The return value of struct device_driver::remove is ignored by the core
> (see device_remove() in drivers/base/dd.c). So it doesn't make sense to
> let the host1x remove callback return an int just to ignore it later.
>
> So make the callback return void. All current implementors return 0, so
> they are easily converted.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20 tegra-video
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
