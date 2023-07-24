Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C9C760295
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 00:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F8310E1DE;
	Mon, 24 Jul 2023 22:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD4210E1DE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 22:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1690238747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1BlHsP2EMV7nqNFEHat6zF0tfhx8Pg3UKKa/ZaxyN9c=;
 b=B8mX7t2uf+7J+slFG+j6tg4nqx639gasGBP4QnRFwGxkCyfl5/56sdhHg0r6cAeU8cWhxs
 GhKx9YnkcYxag4lBsME9eS+pPfO9N06IQJMuPBrL4x6k7lufYAUCIvPX5oLzAtYxWFzXbF
 DBg5FL2oBdTDjsgR9ESvcE8XFlHVqS4=
Message-ID: <b2dd8cbcaff623eef6d1abe6cd709f3fdbd9adc0.camel@crapouillou.net>
Subject: Re: [PATCH] drm/panel: ld9040: add backlight Kconfig dependency
From: Paul Cercueil <paul@crapouillou.net>
To: Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@kernel.org>
Date: Tue, 25 Jul 2023 00:45:45 +0200
In-Reply-To: <20230724171108.GA692753@ravnborg.org>
References: <20230724121736.1293270-1-arnd@kernel.org>
 <20230724171108.GA692753@ravnborg.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le lundi 24 juillet 2023 =C3=A0 19:11 +0200, Sam Ravnborg a =C3=A9crit=C2=
=A0:
> On Mon, Jul 24, 2023 at 02:17:05PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > The driver now uses the backlight interface, which breaks when that
> > is disabled:
> >=20
> > ld.lld: error: undefined symbol: devm_backlight_device_register
> >=20
> > Enforce the necessary Kconfig dependency to avoid this.
> >=20
> > Fixes: c2268daa65fb4 ("drm/panel: ld9040: Register a backlight
> > device")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>=20
> I expect that someone else with drm-misc rights apply the patch.

Pushed to drm-misc-next.

Thanks,
-Paul
