Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A71DA4E14C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885DA10E5FB;
	Tue,  4 Mar 2025 14:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="B3z90Gpe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C3C10E5FB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:41:23 +0000 (UTC)
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr
 [10.146.128.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id 9E91F40D0538
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:27:48 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B3z90Gpe
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
 by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6dF95t1PzFw8K
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 17:22:53 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
 id 952E142726; Tue,  4 Mar 2025 17:22:39 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=bootlin.com header.i=@bootlin.com header.b=B3z90Gpe
X-Envelope-From: <linux-kernel+bounces-541826-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=bootlin.com header.i=@bootlin.com header.b=B3z90Gpe
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
 by le2 (Postfix) with ESMTP id 0BF4441B42
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:37:54 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
 by fgw2.itu.edu.tr (Postfix) with SMTP id 6B1F92DCDE
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 16:37:54 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33AAD3B0AA2
 for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 13:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A34212FB3;
 Mon,  3 Mar 2025 13:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="B3z90Gpe"
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C6153365
 for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 13:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=217.70.183.194
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1741008851; cv=none;
 b=rUBBLo5Sjz/SaZTlfH6UbHWbcHCbJznrsWUyrT7mDmGmVRyUnmMvkez56rhP+81acTqnIDes5y/PBecKmOqqJl2naCAAIdIUEWDYoFH5NthjpxZ7t+Fl9v47DhKUELdivipbzbc7d+iMXaH+zliucqwjhCl9beSMhux6S1RQch8=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1741008851; c=relaxed/simple;
 bh=W+QMMzgRl2N3x+jUtrD3SA8SBTq4tV+7/dQW5Cm6/L4=;
 h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=eoPuDV9br+h9U9UclI4yBAWXXeR1lCdmmjqUTQsSWq6H6zodcUsNPKJV7EIFk530DDcQFMp3A2as2pdTaI3Aw8mJEY+GLYBi114kAKE0psLsLATeWnAekK78F74csx7gBVVMVwnWtQDmY44M+qVE7rB3U/K8x1rteTd7hzUHmdE=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b=B3z90Gpe; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C203A440F4;
 Mon,  3 Mar 2025 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741008846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKf+PNKr2lnJDC6ElPe+zilWw9FIi18fnsrAyj9a2eA=;
 b=B3z90GpeKzPBUeLDwTRwmqRuasDR/yfj0PdpJHnyTczCb8+O9pOIwVHeqzIVUqaDX81HY4
 6WtSCoTLA+DzZOMCujZqi7DK6qXfLmeTt4Hun9TgCw1M3ZkQvkKn2wxnNzQV7JAD+i288q
 3ZITZEaJIZMH8vXO8POOf3cfZbK2/St2s6b/raxGOZafJiQioBcsSiJ2D/K4XLZDO4fKz6
 ihP8DLZIgoDhzF/vNmP5wLnEqRIGaJKDWETgopmDxe1V7KsmfYaUuFJz1DwEjmGBEI209S
 XJH0uy90wuLQsmpe4OXoggyIbb3Ghm/LRtq6eSkTEleadre+YByh+/+ivVekTQ==
Date: Mon, 3 Mar 2025 14:34:04 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas
 Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 00/15] drm/bridge: Various quality of life improvements
Message-ID: <20250303143404.623a3178@bootlin.com>
In-Reply-To: <20250303-urban-trout-of-vastness-f8d0e7@houat>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250227120004.77814e09@bootlin.com>
 <20250303-urban-trout-of-vastness-f8d0e7@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelledviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnu
 ghriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: herve.codina@bootlin.com
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for
 more information
X-ITU-Libra-ESVA-ID: 4Z6dF95t1PzFw8K
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741703203.23694@JrcEy4HgkLWtHTxPd4Rmew
X-ITU-MailScanner-SpamCheck: not spam
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

Hi Maxime,

On Mon, 3 Mar 2025 14:11:05 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Thu, Feb 27, 2025 at 12:00:04PM +0100, Herve Codina wrote:
> > Hi Maxime,
> >=20
> > On Tue, 25 Feb 2025 17:43:48 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >  =20
> > > Hi,
> > >=20
> > > Here's a series of changes after to the KMS helpers and bridge API
> > > following a bunch of reviews I did.
> > >=20
> > > It's mostly centered across providing an easier time to deal with b=
ridge
> > > states, and a somewhat consistent with the other entities API.
> > >=20
> > > It's build tested only, with arm64 allmodconfig.
> > >=20
> > > Maxime
> > >=20
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > --- =20
> >=20
> > I Tried to test this series on my system but I've got a compilation i=
ssue.
> >      depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
> >      depmod: ERROR: Found 2 modules in dependency cycles!
> >=20
> > CONFIG_DRM=3Dm in my configuration. =20
>=20
> Could you share your configuration? it doesn't happen with allmodconfig=
