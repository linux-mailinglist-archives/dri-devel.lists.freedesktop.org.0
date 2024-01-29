Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462D5840304
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 11:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A309F10FA79;
	Mon, 29 Jan 2024 10:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A7910E027
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 10:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706524909;
 bh=/B/rLq1CrP11ELpTDiiaw5/G3WLZ58sLALdw8iPTNqU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2Ytha7NTeod3SPD9NUQkj3lEP8YbjrcQ1SAVHigXiH171GKAzaMLgy7gTFnj/Cmwr
 Ii3cZPujvb9/RwlJsMNb14lFC5Os9AvkVtlLZaNVKW8Dz5B/N3Oo8IyGAhS8U14Nfk
 kIuZSZ9ZTrcR/+eL44SFgNTJxsLA52tN4Xa77+leV+hntiVGOdVEsArdNm2FtrkYUk
 2E8dRPKvkAOPQwX0FWmcVeVFUqP/1p+uCA01SLql4NKjvTPU6xniNsz75hho8TpSTf
 Phb0K32U3aDUArcGOkbBG2O61jOlIyhstb8eggA4kLlv5rGvL3ScdLhGk3Rpias4d6
 T4EknVo7bxzng==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 58FC53780C1F;
 Mon, 29 Jan 2024 10:41:48 +0000 (UTC)
Date: Mon, 29 Jan 2024 11:41:47 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Andy Yan" <andyshrk@163.com>
Subject: Re: [PATCH v4 00/14] drm: Add a driver for CSF-based Mali GPUs
Message-ID: <20240129114147.43e5b865@collabora.com>
In-Reply-To: <1d4f82bc.2992.18d54856f45.Coremail.andyshrk@163.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
 <1d4f82bc.2992.18d54856f45.Coremail.andyshrk@163.com>
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
Cc: Neil
 Armstrong <neil.armstrong@linaro.org>, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Diamand <chris.diamand@foss.arm.com>,
 kernel@collabora.com, Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Jan 2024 17:20:47 +0800 (CST)
"Andy Yan" <andyshrk@163.com> wrote:

> Hi Boris=EF=BC=9A
>=20
> Thanks for you great work=E3=80=82
>=20
> One thing please take note=EF=BC=9A
> commit (arm64: dts: rockchip: rk3588: Add GPU nodes)  in [1] seems remove=
 the "disabled" status=20
> of usb_host2_xhci, this may cause a boot issue on some boards that use co=
mbphy2_psu  phy for other functions.

Oops, should be fixed in
https://gitlab.freedesktop.org/panfrost/linux/-/commits/panthor-next+rk3588
now.

Thanks,

Boris
