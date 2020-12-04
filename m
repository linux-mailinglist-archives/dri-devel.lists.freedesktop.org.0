Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568002CEAAD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 10:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A6A6EC73;
	Fri,  4 Dec 2020 09:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DC36E14F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 09:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id AA82FFB03;
 Fri,  4 Dec 2020 10:17:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ibbQH5juRmE3; Fri,  4 Dec 2020 10:17:50 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id B0D7A4068E; Fri,  4 Dec 2020 10:17:49 +0100 (CET)
Date: Fri, 4 Dec 2020 10:17:49 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/6] drm/panel: mantix and st7703 fixes and additions
Message-ID: <20201204091749.GA11242@bogon.m.sigxcpu.org>
References: <cover.1605688147.git.agx@sigxcpu.org>
 <CACRpkda97nJ+nJX4CuZHQnDVh1mhykc_vb6xFh7BcAWQoNjz7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkda97nJ+nJX4CuZHQnDVh1mhykc_vb6xFh7BcAWQoNjz7Q@mail.gmail.com>
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
Cc: Ondrej Jirman <megous@megous.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, allen <allen.chen@ite.com.tw>,
 Mark Brown <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,
On Thu, Nov 19, 2020 at 09:35:17AM +0100, Linus Walleij wrote:
> On Wed, Nov 18, 2020 at 9:29 AM Guido G=FCnther <agx@sigxcpu.org> wrote:
> =

> > This adds new panel type to the mantix driver as found on the Librem 5 =
and
> > fixes a glitch in the init sequence (affecting both panels). The fix is=
 at the
> > start of the series to make backporting simpler.
> > It also adds a patch to make st7703 use dev_err_probe().
> >
> > changes from v1
> > - as per review comments by Linus Walleij
> >   - fix alphabetical ordering in Documentation/devicetree/bindings/vend=
or-prefixes.yaml
> >     https://lore.kernel.org/dri-devel/CACRpkdao_TMcpRsdK=3D7K5fNKJse0Bq=
wk58iWu0xsXdDNdcffVA@mail.gmail.com/
> >   - add reviewed by to all except 5/6, thanks
> =

> The whole v2 looks fine to me, I'd give the devicetree
> maintainers some slack to review the DT patches then I can
> apply the whole series unless you have commit access yourself,
> just tell me.

Thanks. Is 2 weeks enough slack? Checking what's the rule of thumb here.
Cheers,
 -- Guido

> =

> For all v2 patches:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> =

> If you have time, please review my s6e63m0 series.
> https://lore.kernel.org/dri-devel/20201117175621.870085-1-linus.walleij@l=
inaro.org/
> https://lore.kernel.org/dri-devel/20201117175621.870085-2-linus.walleij@l=
inaro.org/
> https://lore.kernel.org/dri-devel/20201117175621.870085-3-linus.walleij@l=
inaro.org/
> =

> Yours,
> Linus Walleij
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
