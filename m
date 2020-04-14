Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AA11A8C9A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 22:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF2B6E262;
	Tue, 14 Apr 2020 20:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CAB6E598
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 20:38:46 +0000 (UTC)
Received: from mail-qv1-f42.google.com ([209.85.219.42]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MeTwa-1ioIAC2XP2-00aRZH for <dri-devel@lists.freedesktop.org>; Tue, 14
 Apr 2020 22:38:44 +0200
Received: by mail-qv1-f42.google.com with SMTP id p19so640862qve.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 13:38:44 -0700 (PDT)
X-Gm-Message-State: AGi0Puausiyxq8oUW/rA2RLj79rRkpw7XADpH43rtQs+XYOUxhKjYITx
 RLmjZGILJLkyKHP1GDSPPqKZDsIXSQRHXpiMC3g=
X-Google-Smtp-Source: APiQypItYypDsjCwUbSgds2sz8DtaSNucgF8fWN3bMg92RuY+7b77MZXAmlayTdn31FZhJ2svnHHXIwy2Ox7TvokgAw=
X-Received: by 2002:a0c:9e2f:: with SMTP id p47mr1723210qve.211.1586896723453; 
 Tue, 14 Apr 2020 13:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200408202711.1198966-1-arnd@arndb.de>
 <20200408202711.1198966-6-arnd@arndb.de>
 <20200414201739.GJ19819@pendragon.ideasonboard.com>
In-Reply-To: <20200414201739.GJ19819@pendragon.ideasonboard.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Apr 2020 22:38:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0hd5bsezrJS3+GV2nRMui4P5yeD2Rk7wQpJsAZeOCOUg@mail.gmail.com>
Message-ID: <CAK8P3a0hd5bsezrJS3+GV2nRMui4P5yeD2Rk7wQpJsAZeOCOUg@mail.gmail.com>
Subject: Re: [RFC 5/6] drm/rcar-du: fix selection of CMM driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Provags-ID: V03:K1:9JVd+gQBjL1UUR8KPEwnZUbka5PhMMLp/OQsVOF9QfSioZguJY5
 0uNNTPtBZ91kTXZhO4pn0End+90E+SospLU6OgWsVv3z0Z6CQSN82D43V+LAz+EmRaqquhj
 hNDHh6BEv/wpSeAaNcxt0fsZHXZrG76PWwBS1vy7Xqj+cf5SiUyzs/GtXztexdX0ckvj9VL
 dGrHQ0N8PWEvMdSWvn54g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lls/oU1qYkw=:aYtt0LYpXLCH4wfLLFhbf+
 +xIm1ju7iF/KRIup8G/HlxCRgLiMNgIfKW+0XfR+VsFSlzRsEHaafXK8p+G5Vuxu8cjkMktFc
 woilmO1Y3cNH5t501FMhQpkHlrTPL1Hz4HT5ZPvsxS5H5Mbm4/TBkkRM/utgDwtzf0fDUH/ml
 QqUabo+i4edF/QW+g0mtM6h2A+A6HU5g5HeUwvmPWV+CnlHS2b+8rNjhurhoDzIJVKrBROUJW
 eZY3oZU2gTXEo+I/t8dKh/CjB0NDDJzzng1clAzKdri229ovQYHqHQKfRQmN1k0SxZhqO4MaU
 AoLZEJnBkaDIgXm8Dl+WZ8bscxXKXZrFZp9gsaO03JDDucqCdEGPC/gTvWpug9AhmHmo24PGA
 nTEiOssLiQdjDPBx+ENdoKVsr5TbHppi89L1/DL2hAM8cE4fyH2I0tJEm3oRlzl6PiJVZdrml
 5VmYi+UbhPExg38aTazssVfDAxzoVLCyj47YmCFrufNXfAPeeRGUkYUiIaRnyzCFeUhDGd7Nb
 XnEL00irE92aRaLkLlYWauUc2SNhMl/bFGlO475aROzK2IlX2nImiVFiJPIjcBmoTH04evdns
 WJxSrzusmFnEHTnvon5nmBhZ4e2wqcF7DqRZAiFaLh3hXT74QkU1qQEp2ah30Pg6E1L4yuQBJ
 N5IH/y2/ptFKjipa13Lc1MXHezeDFO6OlUaM0ALVsB0IrJQAB5E/Dc01oXjUmT7PK68n/DgxP
 tSGFuzVLrmir1FZX5CiK/mssNQP5U+mvBtSuOdSyWCJ6JfWY6auy5QPItPsXhFMk5OubySdww
 5sZ3U5M1Z0ieqea5CMFthfbZwelPNUXWB7u4dCfctzpkT7gvAA=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Leon Romanovsky <leon@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Networking <netdev@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Saeed Mahameed <saeedm@mellanox.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Nicolas Pitre <nico@fluxnic.net>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 10:17 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Arnd,
>
> Thank you for the patch.
>
> On Wed, Apr 08, 2020 at 10:27:10PM +0200, Arnd Bergmann wrote:
> > The 'imply' statement does not seem to have an effect, as it's
> > still possible to turn the CMM code into a loadable module
> > in a randconfig build, leading to a link error:
> >
> > arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
> > rcar_du_crtc.c:(.text+0xad4): undefined reference to `rcar_lvds_clk_enable'
> > arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
> > rcar_du_crtc.c:(.text+0xd7c): undefined reference to `rcar_lvds_clk_disable'
> > arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_drv.o: in function `rcar_du_init':
> > rcar_du_drv.c:(.init.text+0x4): undefined reference to `rcar_du_of_init'
> > arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_encoder.o: in function `rcar_du_encoder_init':
> >
> > Remove the 'imply', and instead use a silent symbol that defaults
> > to the correct setting.
>
> This will result in the CMM always being selected when DU is, increasing
> the kernel size even for devices that don't need it. I believe we need a
> better construct in Kconfig to fix this.

I had expected this to have the same meaning that we had before the
Kconfig change: whenever the dependencies are available, turn it on,
otherwise leave it disabled.

Can you describe what behavior you actually want instead?
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -4,7 +4,6 @@ config DRM_RCAR_DU
> >       depends on DRM && OF
> >       depends on ARM || ARM64
> >       depends on ARCH_RENESAS || COMPILE_TEST
> > -     imply DRM_RCAR_CMM
> >       imply DRM_RCAR_LVDS
> >       select DRM_KMS_HELPER
> >       select DRM_KMS_CMA_HELPER
> > @@ -15,9 +14,8 @@ config DRM_RCAR_DU
> >         If M is selected the module will be called rcar-du-drm.
> >
> >  config DRM_RCAR_CMM
> > -     tristate "R-Car DU Color Management Module (CMM) Support"
> > +     def_tristate DRM_RCAR_DU
> >       depends on DRM && OF
> > -     depends on DRM_RCAR_DU
> >       help

It would be easy enough to make this a visible 'bool' symbol and
build it into the rcu-du-drm.ko module itself. Would that help you?

       Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
