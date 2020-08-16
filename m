Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2003D24591C
	for <lists+dri-devel@lfdr.de>; Sun, 16 Aug 2020 21:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E27F6E416;
	Sun, 16 Aug 2020 19:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF366E416
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 19:04:27 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 51A548050E;
 Sun, 16 Aug 2020 21:04:19 +0200 (CEST)
Date: Sun, 16 Aug 2020 21:04:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v2 3/3] drm/panel: Add panel driver for the Mantix
 MLAF057WE51-X DSI panel
Message-ID: <20200816190417.GA1421437@ravnborg.org>
References: <cover.1597526107.git.agx@sigxcpu.org>
 <d4e3f881e3d53166eea0be31a885e08679813558.1597526107.git.agx@sigxcpu.org>
 <20200815212727.GA1244923@ravnborg.org>
 <20200816175521.GC2838@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200816175521.GC2838@bogon.m.sigxcpu.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=ze386MxoAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=19sgfWsJWGHdIB95J8cA:9 a=wPNLvfGTeEIA:10 a=tk1IvOmOJPsA:10
 a=iBZjaW-pnkserzjvUTHh:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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

On Sun, Aug 16, 2020 at 07:55:21PM +0200, Guido G=FCnther wrote:
> Hi Sam,
> thanks for having a look!
> =

> On Sat, Aug 15, 2020 at 11:27:27PM +0200, Sam Ravnborg wrote:
> > Hi Guido.
> > =

> > On Sat, Aug 15, 2020 at 11:16:22PM +0200, Guido G=FCnther wrote:
> > > The panel uses a Focaltech FT8006p, the touch part is handled by the
> > > already existing edt-ft5x06.
> > > =

> > > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> > =

> > Two small nits - otherwise looks good.
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > =

> > I can fix while applying or you can send a new revision,
> > but I cannot apply until drm-misc-next have seen a backmerge
> > due to dev_err_probe() usage.
> =

> I'll send out a v3 with this fixed.
> =

> > Did you have commit rights yet?
> > If yes, then please apply yourself.
> =

> No commit rights here. So it would be great if you could apply the
> patches. Should I look for commit rights? I assume that means following
> =

>     https://drm.pages.freedesktop.org/maintainer-tools/commit-access.html=
#drm-misc    =

I recall we discussed this before for some other driver.
For a single panel it is not needed, but if you continue to be active
on other parts it makes sense.


I will apply v3 when drm-misc-next is backmeged unless you tell me
otherwise. And ping me if I forgets.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
