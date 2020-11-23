Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DCE2C17E3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 22:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7031F6E0DE;
	Mon, 23 Nov 2020 21:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BD86E0DE
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 21:48:32 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E532B20051;
 Mon, 23 Nov 2020 22:48:27 +0100 (CET)
Date: Mon, 23 Nov 2020 22:48:26 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v2 0/6] drm/panel: mantix and st7703 fixes and additions
Message-ID: <20201123214826.GC675342@ravnborg.org>
References: <cover.1605688147.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1605688147.git.agx@sigxcpu.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8
 a=meuEgf7b1xA4w4DmhCUA:9 a=wPNLvfGTeEIA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, allen <allen.chen@ite.com.tw>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guido,

On Wed, Nov 18, 2020 at 09:29:47AM +0100, Guido G=FCnther wrote:
> This adds new panel type to the mantix driver as found on the Librem 5 and
> fixes a glitch in the init sequence (affecting both panels). The fix is a=
t the
> start of the series to make backporting simpler.
> It also adds a patch to make st7703 use dev_err_probe().
> =

> changes from v1
> - as per review comments by Linus Walleij
>   - fix alphabetical ordering in Documentation/devicetree/bindings/vendor=
-prefixes.yaml
>     https://lore.kernel.org/dri-devel/CACRpkdao_TMcpRsdK=3D7K5fNKJse0Bqwk=
58iWu0xsXdDNdcffVA@mail.gmail.com/
>   - add reviewed by to all except 5/6, thanks
> =

> Guido G=FCnther (6):
>   drm/panel: st7703: Use dev_err_probe
>   drm/panel: mantix: Tweak init sequence
>   drm/panel: mantix: Allow to specify default mode for different panels
>   drm/panel: mantix: Support panel from Shenzhen Yashi Changhua
>     Intelligent Technology Co
>   dt-bindings: vendor-prefixes: Add ys vendor prefix
The above are all:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

>   dt-binding: display: mantix: Add compatible for panel from YS
Please fix the subjects to read "dt-bindings" - just to be consistent.
With that:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>


	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
