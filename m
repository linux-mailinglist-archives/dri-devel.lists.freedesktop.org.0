Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19AD246003
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 10:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8416E05D;
	Mon, 17 Aug 2020 08:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB83C6E05D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 08:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 7AF44FB04;
 Mon, 17 Aug 2020 10:28:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8TlX4fRmALQd; Mon, 17 Aug 2020 10:28:17 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id A9DEE4576F; Mon, 17 Aug 2020 10:28:16 +0200 (CEST)
Date: Mon, 17 Aug 2020 10:28:16 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 3/3] drm/panel: Add panel driver for the Mantix
 MLAF057WE51-X DSI panel
Message-ID: <20200817082816.GA33443@bogon.m.sigxcpu.org>
References: <cover.1597526107.git.agx@sigxcpu.org>
 <d4e3f881e3d53166eea0be31a885e08679813558.1597526107.git.agx@sigxcpu.org>
 <20200815212727.GA1244923@ravnborg.org>
 <20200816175521.GC2838@bogon.m.sigxcpu.org>
 <20200816190417.GA1421437@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200816190417.GA1421437@ravnborg.org>
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
On Sun, Aug 16, 2020 at 09:04:17PM +0200, Sam Ravnborg wrote:
> On Sun, Aug 16, 2020 at 07:55:21PM +0200, Guido G=FCnther wrote:
> > Hi Sam,
> > thanks for having a look!
> > =

> > On Sat, Aug 15, 2020 at 11:27:27PM +0200, Sam Ravnborg wrote:
> > > Hi Guido.
> > > =

> > > On Sat, Aug 15, 2020 at 11:16:22PM +0200, Guido G=FCnther wrote:
> > > > The panel uses a Focaltech FT8006p, the touch part is handled by the
> > > > already existing edt-ft5x06.
> > > > =

> > > > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> > > =

> > > Two small nits - otherwise looks good.
> > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > =

> > > I can fix while applying or you can send a new revision,
> > > but I cannot apply until drm-misc-next have seen a backmerge
> > > due to dev_err_probe() usage.
> > =

> > I'll send out a v3 with this fixed.
> > =

> > > Did you have commit rights yet?
> > > If yes, then please apply yourself.
> > =

> > No commit rights here. So it would be great if you could apply the
> > patches. Should I look for commit rights? I assume that means following
> > =

> >     https://drm.pages.freedesktop.org/maintainer-tools/commit-access.ht=
ml#drm-misc    =

> I recall we discussed this before for some other driver.
> For a single panel it is not needed, but if you continue to be active
> on other parts it makes sense.

I think st7703, mantix and nwl all go in via drm-misc so it might make
sense. Thanks for the suggestion!

> I will apply v3 when drm-misc-next is backmeged unless you tell me
> otherwise. And ping me if I forgets.

Thanks!
 -- Guido
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
