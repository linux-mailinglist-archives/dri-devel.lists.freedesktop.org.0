Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E606ECFCB9A
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F6310E2CC;
	Wed,  7 Jan 2026 09:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="wAn9JL9z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF9F10E2CC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 09:06:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3B8751A26CD;
 Wed,  7 Jan 2026 09:06:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EB034606F8;
 Wed,  7 Jan 2026 09:06:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 52714103C85EA; Wed,  7 Jan 2026 10:06:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767776813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=kZz5BET9nIyur69VfcYmrYinsWgCQCD2MBfTdVkmPEU=;
 b=wAn9JL9zeJq2jI4lr7sgyvM01lsaISEJGQ3GT1LtO9pk5zo+XrBEr0lQYAMNqbjlOjJX/g
 D/TiaKEwGS0+D5RMo0Z40CNjAdF0FTZEkU29LgeDgLwxPZvSAg902B/gr8tjGjlhyBZ8xA
 29GU6jaoxPNYKt0Zzq/tYYRZ5PMxrkGDJnHb6uYW0dghqhYAnibaI/1cQGY4B95JWqHTvz
 sUu10MAXNfMltl8t3mwCzOAn1SwYf0elal12QsJMfSjuVGyl9daUquEM0j8VQOQXL+o7G1
 wHPFw8rjLmR9Uk4NyqV91JLX2DwjaF0/Y0A9fD/A+jLfeVfFDrAuAWx8j1zOIw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 10:06:47 +0100
Message-Id: <DFI8KU3MYRV9.17DOLTRG42RKP@bootlin.com>
Cc: <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>, <jernej.skrabec@gmail.com>,
 <jonas@kwiboo.se>, <linux-kernel@vger.kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <simona@ffwll.ch>,
 <tzimmermann@suse.de>
To: "Vladimir Yakovlev" <vovchkir@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] drm/bridge: lontium-lt9611uxc: change to use
 devm_request_threaded_irq
X-Mailer: aerc 0.20.1
References: <20260107030700.326843-1-vovchkir@gmail.com>
In-Reply-To: <20260107030700.326843-1-vovchkir@gmail.com>
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

On Wed Jan 7, 2026 at 4:07 AM CET, Vladimir Yakovlev wrote:
> It's better to use devm_request_threaded_irq because resources will be
> freed automatically and no additional checks are needed.
>
> Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
