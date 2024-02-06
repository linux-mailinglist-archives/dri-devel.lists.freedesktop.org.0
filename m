Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C778B84B32B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 12:12:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCFC112A94;
	Tue,  6 Feb 2024 11:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="y03vClI2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76628112A94
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 11:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707217919;
 bh=/fOPcuUc4z0bgqndTuo3N+YXD6HLZy8OjQq1ChZJSiM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=y03vClI2hAu/beEUVXq3sGeF/dvqKqUEgIaNDOF/U/beDQZlOX4JPP4P3MuSqJmnG
 rnl3TxR2tSq+e1FK52r+snhmZVyr6mgv5rvBK8nMEmgntqgmeYKqWYzN66LA6fawto
 wr8DJr15R+ThSFUwl3/xI7e9AAyc5OjCDkJCStl+LAimPPhwchVUAYmg+OxBHhJC5J
 JPOcU9rAtsTUHUp5jirDotDf+PS63LbLQjNZTVZH9gfI42NTS+3ID9gXhB3z1sovHb
 OZHj1Z3e70H2RDWeQbdP+5f09gAzR5dh8ly0OfPeDts7a/hH5hn1J93juajQ74r7A9
 iS6uFGacqRPWw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D49F23781FE6;
 Tue,  6 Feb 2024 11:11:58 +0000 (UTC)
Date: Tue, 6 Feb 2024 12:11:57 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Andy Yan" <andyshrk@163.com>
Cc: "Danilo Krummrich" <dakr@redhat.com>, dri-devel@lists.freedesktop.org,
 "Tatsuyuki Ishi" <ishitatsuyuki@gmail.com>, "Nicolas Boichat"
 <drinkcat@chromium.org>, kernel@collabora.com, "Daniel Stone"
 <daniels@collabora.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Ketil Johnsen" <ketil.johnsen@arm.com>, "Liviu Dudau"
 <Liviu.Dudau@arm.com>, "Steven Price" <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, "Daniel Vetter"
 <daniel@ffwll.ch>, "Chris Diamand" <chris.diamand@foss.arm.com>, "Marty E .
 Plummer" <hanetzer@startmail.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Faith Ekstrand" <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v4 00/14] drm: Add a driver for CSF-based Mali GPUs
Message-ID: <20240206121157.1dbbdd3f@collabora.com>
In-Reply-To: <1dde5187.1815.18d7dfcd08e.Coremail.andyshrk@163.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
 <1d4f82bc.2992.18d54856f45.Coremail.andyshrk@163.com>
 <20240129114147.43e5b865@collabora.com>
 <1554e55.29c.18d71ae9b6c.Coremail.andyshrk@163.com>
 <20240205100321.0321a208@collabora.com>
 <1dde5187.1815.18d7dfcd08e.Coremail.andyshrk@163.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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

Hi Andy,

On Tue, 6 Feb 2024 18:35:36 +0800 (CST)
"Andy Yan" <andyshrk@163.com> wrote:

> >Andy, I pushed a new version to the panthor-next [1] and
> >panthor-next+rk3588 [2] branches. The fix I'm talking about is [3],
> >but you probably want to consider taking all the fixups in your
> >branch. =20
>=20
> > =20
> Just for your info=EF=BC=8C
> After taking all the fixups in my branch=EF=BC=8CIt has been running for =
24
> hours, and so far, this warning hasn't shown up.

Thanks for the update, and thanks for reporting the problem in the
first place.

Regards,

Boris
