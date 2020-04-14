Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BDF1A8D4F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 23:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23616E58B;
	Tue, 14 Apr 2020 21:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DDB6E58B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 21:10:28 +0000 (UTC)
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MRCBm-1jae1d3XvQ-00NAuj for <dri-devel@lists.freedesktop.org>; Tue, 14
 Apr 2020 23:10:26 +0200
Received: by mail-qt1-f172.google.com with SMTP id l60so3128911qtd.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 14:10:25 -0700 (PDT)
X-Gm-Message-State: AGi0PubNHRr28Nqq09dz8DS9N5gBUMYcfXG1xBBbTYTrVtrPGrnHQzP8
 ZSaZmCgD/ZGQXfZrNvFvXdiJfzFTEXu+/tw2AOU=
X-Google-Smtp-Source: APiQypIfZFDXhI4lfhgtQhLYBcr5CwllPu4hW9XiyLfwj2+0CNULa+LPLq/UglD75HRb9VggpbRIiRppC0fPBwcpn5M=
X-Received: by 2002:ac8:296f:: with SMTP id z44mr16506720qtz.18.1586898624486; 
 Tue, 14 Apr 2020 14:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200408202711.1198966-1-arnd@arndb.de>
 <20200408202711.1198966-6-arnd@arndb.de>
 <20200414201739.GJ19819@pendragon.ideasonboard.com>
 <CAK8P3a0hd5bsezrJS3+GV2nRMui4P5yeD2Rk7wQpJsAZeOCOUg@mail.gmail.com>
 <20200414205158.GM19819@pendragon.ideasonboard.com>
In-Reply-To: <20200414205158.GM19819@pendragon.ideasonboard.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 14 Apr 2020 23:10:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1PZbwdvdH_Gi9UQVUz2+_a8QDxKuWLqPtjhK1stxzMBQ@mail.gmail.com>
Message-ID: <CAK8P3a1PZbwdvdH_Gi9UQVUz2+_a8QDxKuWLqPtjhK1stxzMBQ@mail.gmail.com>
Subject: Re: [RFC 5/6] drm/rcar-du: fix selection of CMM driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Provags-ID: V03:K1:JPmKxfDZblwJXPWrA1Sm9476PnPVVUEuG6AUiCXTKrB+G1T3PfP
 qWWCEqa3IrtKjJSU/vbMNiGtuMAMWfSEIPIKBK6xE5zGSzomNcLPNlgj1FhCe7eDsvhI2rQ
 H9oGSt6HUODKl18OexvaVgUkFb0Ux5PgzLfvqI4jOYuRrOgOnZ0X9BVgRyvfvMNX9cc/o2H
 I/9hRCCiyY9GoylUWRYbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:C/b2+rSC5pQ=:0/QJ0eEzMKdRmV01lc6P/D
 KNg9ceYNKMCjdTILbJmbcu/KdbGtu1CKdgl/lZH2/z+vBNG5EJ7gxDxmXdrFKWW4kFWg0oQYc
 0t8V118PMbC4XarabuAbOGcEVuVNt4Lcsviq6HULAFwEWAfG/i7IDyTxydV287cBCsBEsby1D
 gVUoSOa/xJZMmommZ6B9xCp1m4TblJe6ig79FL4qhnMQYP/c/PuMBqCwE2JkpJVTwk8Z0XWHl
 NZLRcH/XQmqv5oAfR7c0bWcl99/x/9ouLWXRB6ZDCoc3yKFgJt7O/px24t68CezZ8EHdT8vSj
 kXS5khU133kyuSsgByByXHNLNKq11FLOMGNCVTCSDaolqQli6KgMknaqZ33edJHyXvceOEakx
 jd30K75AcltdW81kq4v9OUXXs3Q6zq5Mv172md3wds3jVBn4etE5Jhtn0DVdrrPbXmBmG1Oet
 CP7bEvLqidfCp5+dyHbiwQxomzaQrykoEiVH5PQNYdH4G+P5oSQO11DAOazTH7OYjN9C/OsW1
 /iki4PiodgNCbWouV51306fUJytuxJ4picke80N+fiqcOPcDtbQ8N+k9J5BzOab6QcCZ6OarZ
 j/witQpO66sOvPLgk3YmSGOOhljuAwsPMpgnKX7nlcwumFZUk0KV7rfvdow7NTQRADcKAmZnC
 WQoZweNZ7UGoWR+6kVTX+lpeI4lRZxyqkv3AUcVCXnVIWAWkpnm3c+M/HPkTTXwX9oKceIRTT
 rgno7zyQGn/vwipDk2P7d2KUC0xl+W1AZlijhr45wKC5vhAk97raOy/YR6f9yEkECaKoPfWkn
 lDtS9VLcCWu0nvl/8dmnH/zlLLLYMDaE8zNNp4CIWb7hY7S9mU=
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

On Tue, Apr 14, 2020 at 10:52 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Arnd,
>
> On Tue, Apr 14, 2020 at 10:38:27PM +0200, Arnd Bergmann wrote:
> > On Tue, Apr 14, 2020 at 10:17 PM Laurent Pinchart wrote:
> > > On Wed, Apr 08, 2020 at 10:27:10PM +0200, Arnd Bergmann wrote:
> > > > The 'imply' statement does not seem to have an effect, as it's
> > > > still possible to turn the CMM code into a loadable module
> > > > in a randconfig build, leading to a link error:
> > > >
> > > > arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_enable':
> > > > rcar_du_crtc.c:(.text+0xad4): undefined reference to `rcar_lvds_clk_enable'
> > > > arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_crtc.o: in function `rcar_du_crtc_atomic_disable':
> > > > rcar_du_crtc.c:(.text+0xd7c): undefined reference to `rcar_lvds_clk_disable'
> > > > arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_drv.o: in function `rcar_du_init':
> > > > rcar_du_drv.c:(.init.text+0x4): undefined reference to `rcar_du_of_init'
> > > > arm-linux-gnueabi-ld: drivers/gpu/drm/rcar-du/rcar_du_encoder.o: in function `rcar_du_encoder_init':
> > > >
> > > > Remove the 'imply', and instead use a silent symbol that defaults
> > > > to the correct setting.
> > >
> > > This will result in the CMM always being selected when DU is, increasing
> > > the kernel size even for devices that don't need it. I believe we need a
> > > better construct in Kconfig to fix this.
> >
> > I had expected this to have the same meaning that we had before the
> > Kconfig change: whenever the dependencies are available, turn it on,
> > otherwise leave it disabled.
> >
> > Can you describe what behavior you actually want instead?
>
> Doesn't "imply" mean it gets selected by default but can be manually
> disabled ?

That may be what it means now (I still don't understand how it's defined
as of v5.7-rc1), but traditionally it was more like a 'select if all
dependencies
are met'.

> > > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > > @@ -4,7 +4,6 @@ config DRM_RCAR_DU
> > > >       depends on DRM && OF
> > > >       depends on ARM || ARM64
> > > >       depends on ARCH_RENESAS || COMPILE_TEST
> > > > -     imply DRM_RCAR_CMM
> > > >       imply DRM_RCAR_LVDS
> > > >       select DRM_KMS_HELPER
> > > >       select DRM_KMS_CMA_HELPER
> > > > @@ -15,9 +14,8 @@ config DRM_RCAR_DU
> > > >         If M is selected the module will be called rcar-du-drm.
> > > >
> > > >  config DRM_RCAR_CMM
> > > > -     tristate "R-Car DU Color Management Module (CMM) Support"
> > > > +     def_tristate DRM_RCAR_DU
> > > >       depends on DRM && OF
> > > > -     depends on DRM_RCAR_DU
> > > >       help
> >
> > It would be easy enough to make this a visible 'bool' symbol and
> > build it into the rcu-du-drm.ko module itself. Would that help you?
>
> That could indeed simplify a few things. I wonder if it could introduce
> a few small issues though (but likely nothing we can't fix). The two
> that come to mind are the fact that the module would have two
> MODULE_DESCRIPTION and MODULE_LICENSE entries (I have no idea if that
> could cause breakages), and that it could make module unloading more
> difficult as the CMM being used by the DU would increase the refcount on
> the module. I think the latter could be worked around by manually
> unbinding the DU device through sysfs before unloading the module (and I
> can't say for sure that unloading the DU module is not broken today
> *innocent and naive look* :-)).

In that case, a Makefile trick could also work, doing

ifdef CONFIG_DRM_RCAR_CMM
obj-$(CONFIG_DRM_RCAR_DU) += rcar-cmm.o
endif

Thereby making the cmm module have the same state (y or m) as
the du module whenever the option is enabled.

       Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
