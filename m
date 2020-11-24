Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D589B2C1FAB
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E20C8970B;
	Tue, 24 Nov 2020 08:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (unknown [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F758970B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 08:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 144C0FB03;
 Tue, 24 Nov 2020 09:15:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mbhCes4yzW3W; Tue, 24 Nov 2020 09:15:57 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 0DB044026F; Tue, 24 Nov 2020 09:15:57 +0100 (CET)
Date: Tue, 24 Nov 2020 09:15:56 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/6] drm/panel: mantix and st7703 fixes and additions
Message-ID: <20201124081556.GA3200@bogon.m.sigxcpu.org>
References: <cover.1605688147.git.agx@sigxcpu.org>
 <20201123214826.GC675342@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123214826.GC675342@ravnborg.org>
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

Hi,
On Mon, Nov 23, 2020 at 10:48:26PM +0100, Sam Ravnborg wrote:
> Hi Guido,
> =

> On Wed, Nov 18, 2020 at 09:29:47AM +0100, Guido G=FCnther wrote:
> > This adds new panel type to the mantix driver as found on the Librem 5 =
and
> > fixes a glitch in the init sequence (affecting both panels). The fix is=
 at the
> > start of the series to make backporting simpler.
> > It also adds a patch to make st7703 use dev_err_probe().
> > =

> > changes from v1
> > - as per review comments by Linus Walleij
> >   - fix alphabetical ordering in Documentation/devicetree/bindings/vend=
or-prefixes.yaml
> >     https://lore.kernel.org/dri-devel/CACRpkdao_TMcpRsdK=3D7K5fNKJse0Bq=
wk58iWu0xsXdDNdcffVA@mail.gmail.com/
> >   - add reviewed by to all except 5/6, thanks
> > =

> > Guido G=FCnther (6):
> >   drm/panel: st7703: Use dev_err_probe
> >   drm/panel: mantix: Tweak init sequence
> >   drm/panel: mantix: Allow to specify default mode for different panels
> >   drm/panel: mantix: Support panel from Shenzhen Yashi Changhua
> >     Intelligent Technology Co
> >   dt-bindings: vendor-prefixes: Add ys vendor prefix
> The above are all:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> =

> >   dt-binding: display: mantix: Add compatible for panel from YS
> Please fix the subjects to read "dt-bindings" - just to be consistent.
> With that:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Fixed locally, thanks!
 -- Guido

> =

> =

> 	Sam
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
