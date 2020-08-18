Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3545C248CFE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 19:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9FD89BD2;
	Tue, 18 Aug 2020 17:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C0289BD2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 17:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id F0524FB03;
 Tue, 18 Aug 2020 19:33:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SV7xgiVLbSXw; Tue, 18 Aug 2020 19:33:45 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 08CA94576F; Tue, 18 Aug 2020 19:33:44 +0200 (CEST)
Date: Tue, 18 Aug 2020 19:33:44 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 0/3] drm/panel: Add panel driver for the Mantix
 MLAF057WE51-X DSI panel
Message-ID: <20200818173344.GA382297@bogon.m.sigxcpu.org>
References: <cover.1597652012.git.agx@sigxcpu.org>
 <20200818170556.GA2291850@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818170556.GA2291850@ravnborg.org>
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

Hi Sam,
On Tue, Aug 18, 2020 at 07:05:56PM +0200, Sam Ravnborg wrote:
> Hi Guido.
> =

> On Mon, Aug 17, 2020 at 10:14:33AM +0200, Guido G=FCnther wrote:
> > =

> > The panel uses a Focaltech FT8006p, the touch part is handled by the al=
ready
> > existing edt-ft5x06. It can be found in e.g. the Librem 5.
> > =

> > Changes from v2:
> > - Due to review comments by Sam Ravnborg, thanks!
> >   https://lore.kernel.org/lkml/20200815212727.GA1244923@ravnborg.org/
> >   - Drop unused header
> >   - Use newline before comment
> > - Add Reviewed/Acked-by by Sam Ravnborg, thanks!
> >   https://lore.kernel.org/lkml/20200815212727.GA1244923@ravnborg.org/
> >   https://lore.kernel.org/lkml/20200815212750.GB1244923@ravnborg.org/
> >   https://lore.kernel.org/lkml/20200815212840.GC1244923@ravnborg.org/
> > =

> > Changes from v1:
> > - Due to review comments by Sam Ravnborg, thanks!
> >   https://lore.kernel.org/dri-devel/20200815083917.GA993113@ravnborg.or=
g/
> >   - Don't preserve newlines with '|' in description
> >   - Use reset-gpios and backlight from panel-common.yaml
> >   - Reindent example
> >   https://lore.kernel.org/dri-devel/20200815093226.GB993113@ravnborg.or=
g/
> >   - Drop unused includes
> >   - Use dev_* instead of DRM_* for printing
> >   - Turn off regulators in reverse order from enable
> >   - Silence errors in mantix_{shutdown,remove}
> >   - Drop duplicate mipi_dsi_dcs_enter_sleep_mode()
> >   https://lore.kernel.org/dri-devel/20200815100230.GA1002374@ravnborg.o=
rg/
> >   - Use dev_err_probe()
> > - Add delays when turning off panel as suggested by the data sheet
> > =

> > This series is against next-20200814.
> > =

> > Guido G=FCnther (3):
> >   dt-bindings: vendor-prefixes: Add mantix vendor prefix
> >   dt-bindings: Add Mantix MLAF057WE51-X panel bindings
> >   drm/panel: Add panel driver for the Mantix MLAF057WE51-X DSI panel
> =

> Maxime Ripard backmerged -rc1 to drm-misc-next so I went ahead and applied
> this series to drm-misc-next, forgetting you got commit rights. As they a=
re
> already pushed out too late for you to do push them - sorry!

On the contrary: Thanks a lot for handling this so promptly!
 -- Guido
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
