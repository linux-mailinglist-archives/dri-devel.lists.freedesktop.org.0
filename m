Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6541F839486
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 17:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2EA10E82C;
	Tue, 23 Jan 2024 16:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CBD10E818
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 16:18:48 +0000 (UTC)
Received: from i53875b8c.versanet.de ([83.135.91.140] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rSJU4-00011W-5B; Tue, 23 Jan 2024 17:18:44 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 00/14] drm: Add a driver for CSF-based Mali GPUs
Date: Tue, 23 Jan 2024 17:18:42 +0100
Message-ID: <2991172.o2A3GueYyp@diego>
In-Reply-To: <20240122163047.1954733-1-boris.brezillon@collabora.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Diamand <chris.diamand@foss.arm.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, 22. Januar 2024, 17:30:31 CET schrieb Boris Brezillon:
> Hello,
>=20
> This is the 4th version of the kernel driver for Mali CSF-based GPUs.
>=20
> A branch based on drm-misc-next and containing all the dependencies
> that are not yet available in drm-misc-next here[1], and another [2]
> containing extra patches to have things working on rk3588. The CSF
> firmware binary can be found here[3], and should be placed under
> /lib/firmware/arm/mali/arch10.8/mali_csffw.bin.
>=20
> The mesa MR adding v10 support on top of panthor is available here [4].
>=20
> Steve, I intentionally dropped your R-b on "drm/panthor: Add the heap
> logical block" and "drm/panthor: Add the scheduler logical block"
> because the tiler-OOM handling changed enough to require a new review
> IMHO.
>=20
> Regarding the GPL2+MIT relicensing, I collected Cl=E9ment's R-b for the
> devfreq code, but am still lacking Alexey Sheplyakov for some bits in
> panthor_gpu.c. The rest of the code is either new, or covered by the
> Linaro, Arm and Collabora acks.

On a rk3588-jaguar with a corresponding mesa build, series:
Tested-by: Heiko Stuebner <heiko@sntech.de>


Thanks for all the work on this
Heiko


