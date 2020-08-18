Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B8D248C72
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 19:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385BA89B7D;
	Tue, 18 Aug 2020 17:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB99989B7D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 17:06:05 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8F58C2001F;
 Tue, 18 Aug 2020 19:05:57 +0200 (CEST)
Date: Tue, 18 Aug 2020 19:05:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v3 0/3] drm/panel: Add panel driver for the Mantix
 MLAF057WE51-X DSI panel
Message-ID: <20200818170556.GA2291850@ravnborg.org>
References: <cover.1597652012.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1597652012.git.agx@sigxcpu.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8
 a=eCTDOZTGqrxRdbbr8LwA:9 a=wPNLvfGTeEIA:10 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: devicetree@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Mark Brown <broonie@kernel.org>, allen <allen.chen@ite.com.tw>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guido.

On Mon, Aug 17, 2020 at 10:14:33AM +0200, Guido G=FCnther wrote:
> =

> The panel uses a Focaltech FT8006p, the touch part is handled by the alre=
ady
> existing edt-ft5x06. It can be found in e.g. the Librem 5.
> =

> Changes from v2:
> - Due to review comments by Sam Ravnborg, thanks!
>   https://lore.kernel.org/lkml/20200815212727.GA1244923@ravnborg.org/
>   - Drop unused header
>   - Use newline before comment
> - Add Reviewed/Acked-by by Sam Ravnborg, thanks!
>   https://lore.kernel.org/lkml/20200815212727.GA1244923@ravnborg.org/
>   https://lore.kernel.org/lkml/20200815212750.GB1244923@ravnborg.org/
>   https://lore.kernel.org/lkml/20200815212840.GC1244923@ravnborg.org/
> =

> Changes from v1:
> - Due to review comments by Sam Ravnborg, thanks!
>   https://lore.kernel.org/dri-devel/20200815083917.GA993113@ravnborg.org/
>   - Don't preserve newlines with '|' in description
>   - Use reset-gpios and backlight from panel-common.yaml
>   - Reindent example
>   https://lore.kernel.org/dri-devel/20200815093226.GB993113@ravnborg.org/
>   - Drop unused includes
>   - Use dev_* instead of DRM_* for printing
>   - Turn off regulators in reverse order from enable
>   - Silence errors in mantix_{shutdown,remove}
>   - Drop duplicate mipi_dsi_dcs_enter_sleep_mode()
>   https://lore.kernel.org/dri-devel/20200815100230.GA1002374@ravnborg.org/
>   - Use dev_err_probe()
> - Add delays when turning off panel as suggested by the data sheet
> =

> This series is against next-20200814.
> =

> Guido G=FCnther (3):
>   dt-bindings: vendor-prefixes: Add mantix vendor prefix
>   dt-bindings: Add Mantix MLAF057WE51-X panel bindings
>   drm/panel: Add panel driver for the Mantix MLAF057WE51-X DSI panel

Maxime Ripard backmerged -rc1 to drm-misc-next so I went ahead and applied
this series to drm-misc-next, forgetting you got commit rights. As they are
already pushed out too late for you to do push them - sorry!

	Sam

> =

>  .../display/panel/mantix,mlaf057we51-x.yaml   |  70 ++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  MAINTAINERS                                   |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |  11 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 328 ++++++++++++++++++
>  6 files changed, 419 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/manti=
x,mlaf057we51-x.yaml
>  create mode 100644 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> =

> -- =

> 2.26.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
