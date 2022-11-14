Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 481D8628581
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 17:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D6C10E2F2;
	Mon, 14 Nov 2022 16:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B9310E2F2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 16:34:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 20604612AE;
 Mon, 14 Nov 2022 16:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E92C433C1;
 Mon, 14 Nov 2022 16:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668443639;
 bh=twFBnFJwPjIstNFMHySHoSZweRgHc3hjr0AkGxQgLvQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bQ2Q597QRGuZYwA60FRgBJsafKBergZYVPKMAZ2m2wg7Rr0uIZkfoGaOKb5whQnVc
 hXMhoRRx/QeiJDg2oG8PlsytSMbrJDOF+zoSfrwr+cXbG0ClfsADmdvkY12SdYZTyE
 En62yxnKVeerMikaYVwUKfdl9kI/gMvOL7OrTEN8RC1K5rZ4OS3BpS6UPyGgZkQT6A
 ywrhixi9LSOHVo2FR6ipSqQ+QS7ZlaqMxww7O/ByzNqFFV+cHnUBlDnREMMi5XKv4T
 yuJEq+EP4L0ignOqeLk2KegtF73TJyWT46f3V2KHN0ndALct/agJYZ1N9pnYOLHlcE
 A+nMOJnHDK5BA==
Date: Mon, 14 Nov 2022 08:33:57 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Robert Swindells <rjs@fdy2.co.uk>
Subject: Re: [PATCH 1/1] drm/shmem: Dual licence the files as GPL-2 and MIT
Message-ID: <20221114083357.69bd1fe8@kernel.org>
In-Reply-To: <20221112194210.7657-2-rjs@fdy2.co.uk>
References: <20221112194210.7657-1-rjs@fdy2.co.uk>
 <20221112194210.7657-2-rjs@fdy2.co.uk>
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
Cc: sfr@canb.auug.org.au, marcel.ziswiler@toradex.com, daniel.vetter@ffwll.ch,
 liuzixian4@huawei.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, nroberts@igalia.com, noralf@tronnes.org,
 cai.huoqing@linux.dev, kraxel@redhat.com, tzimmermann@suse.de,
 boris.brezillon@collabora.com, airlied@redhat.com, emil.velikov@collabora.com,
 sam@ravnborg.org, dan.carpenter@oracle.com, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 12 Nov 2022 19:42:10 +0000 Robert Swindells wrote:
> Contributors to these files are:
>=20
> Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Liu Zixian <liuzixian4@huawei.com>
> Dave Airlie <airlied@redhat.com>
> Thomas Zimmermann <tzimmermann@suse.de>
> Lucas De Marchi <lucas.demarchi@intel.com>
> Gerd Hoffmann <kraxel@redhat.com>
> Rob Herring <robh@kernel.org>
> Jakub Kicinski <kuba@kernel.org>
> Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Stephen Rothwell <sfr@canb.auug.org.au>
> Daniel Vetter <daniel.vetter@ffwll.ch>
> Cai Huoqing <cai.huoqing@linux.dev>
> Neil Roberts <nroberts@igalia.com>
> Marek Szyprowski <m.szyprowski@samsung.com>
> Emil Velikov <emil.velikov@collabora.com>
> Sam Ravnborg <sam@ravnborg.org>
> Boris Brezillon <boris.brezillon@collabora.com>
> Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Signed-off-by: Robert Swindells <rjs@fdy2.co.uk>

For the one-line #include addition I've contributed:

Acked-by: Jakub Kicinski <kuba@kernel.org>

:)
