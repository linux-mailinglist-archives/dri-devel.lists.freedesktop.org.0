Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E227343B9
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 22:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BAB10E064;
	Sat, 17 Jun 2023 20:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CFB10E064
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 20:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1687034465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ITzK5tHf4CvvqOhskx/ZcZ/qtZMlBo54Z1U4DimH8/M=;
 b=uA6C7QqWxjWc0fViga/Y5qGlbWHDQ9nFWAra0ICdgZ/9KCix3cTBXQJ2U94vlxdfZ5hB9v
 nM18qmcBGUVUfwuli1/tb2OGtd1Tl5RL8somC92hLon9v8NwwuMItfuwetLEuMlTQOHRPL
 FAd04d9JrsfRv6cYdoTpEPzM852TTkc=
Message-ID: <696b2c4144e454aa194e4487b41706075a70ae95.camel@crapouillou.net>
Subject: Re: [PATCH v2] drm/ingenic: Kconfig: select REGMAP and REGMAP_MMIO
From: Paul Cercueil <paul@crapouillou.net>
To: Sam Ravnborg <sam@ravnborg.org>
Date: Sat, 17 Jun 2023 22:41:03 +0200
In-Reply-To: <20230617194843.GA1854380@ravnborg.org>
References: <20230607110650.569522-1-suijingfeng@loongson.cn>
 <c70cb3cb326439a5868beb54d720538923f653d1.camel@crapouillou.net>
 <20230617194843.GA1854380@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le samedi 17 juin 2023 =C3=A0 21:48 +0200, Sam Ravnborg a =C3=A9crit=C2=A0:
> Hi Paul,
> On Sat, Jun 17, 2023 at 09:13:37PM +0200, Paul Cercueil wrote:
> > Hi,
> >=20
> > Le mercredi 07 juin 2023 =C3=A0 19:06 +0800, Sui Jingfeng a =C3=A9crit=
=C2=A0:
> > > Otherwise its failed to pass basic compile test on platform
> > > without
> > > REGMAP_MMIO selected by defconfig
> > >=20
> > > make -j$(nproc) ARCH=3Dmips CROSS_COMPILE=3Dmips64el-linux-gnuabi64-
> > >=20
> > > =C2=A0 SYNC=C2=A0=C2=A0=C2=A0 include/config/auto.conf.cmd
> > > =C2=A0 Checking missing-syscalls for N32
> > > =C2=A0 CALL=C2=A0=C2=A0=C2=A0 scripts/checksyscalls.sh
> > > =C2=A0 Checking missing-syscalls for O32
> > > =C2=A0 CALL=C2=A0=C2=A0=C2=A0 scripts/checksyscalls.sh
> > > =C2=A0 CALL=C2=A0=C2=A0=C2=A0 scripts/checksyscalls.sh
> > > =C2=A0 MODPOST Module.symvers
> > > ERROR: modpost: "__devm_regmap_init_mmio_clk"
> > > [drivers/gpu/drm/ingenic/ingenic-drm.ko] undefined!
> > > make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error
> > > 1
> > > make: *** [Makefile:1978: modpost] Error 2
> > >=20
> > > V2: Order alphabetically
> > >=20
> > > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> >=20
> > The patch looks good to me. But I need an ACK from someone else to
> > apply to drm-misc-next.
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks Sam!

Applied to drm-misc-next.

Cheers,
-Paul
