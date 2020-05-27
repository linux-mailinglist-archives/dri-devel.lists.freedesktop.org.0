Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CBC1E4DD2
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 21:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796276E0E2;
	Wed, 27 May 2020 19:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366286E0E2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 19:03:50 +0000 (UTC)
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MEmtx-1jogal0XiF-00GHAc for <dri-devel@lists.freedesktop.org>; Wed, 27
 May 2020 21:03:48 +0200
Received: by mail-qt1-f170.google.com with SMTP id g18so3233485qtu.13
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 12:03:47 -0700 (PDT)
X-Gm-Message-State: AOAM530MC5JXTmCoEqyo60CWCiHV3qU8WelMR10reWZ3A0akfPj9XPBQ
 Qs1QR+tilASgzW8qTiXcbbbQgh2jW48jqA5NQCQ=
X-Google-Smtp-Source: ABdhPJx2uEk/GDw083lErYgjdtJYswpXbBr+NRpNddoZvry1xc7WnNmlfDJSfucfklDsPGDKuPBFf5cTTyfn+MEOjKQ=
X-Received: by 2002:ac8:6a09:: with SMTP id t9mr5865155qtr.7.1590606226872;
 Wed, 27 May 2020 12:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200527133158.462057-1-arnd@arndb.de>
 <20200527145226.GA91560@ravnborg.org>
 <CAK8P3a2k2qPOdREo-+AwOL8JVcO2VFoouAFyx6-fr1UnpavwLA@mail.gmail.com>
 <20200527175012.GB98921@ravnborg.org>
In-Reply-To: <20200527175012.GB98921@ravnborg.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 May 2020 21:03:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a29zkDn50DuRBK1wKDtZnLdyfq5VX5pC3kmEo+=BKCQbw@mail.gmail.com>
Message-ID: <CAK8P3a29zkDn50DuRBK1wKDtZnLdyfq5VX5pC3kmEo+=BKCQbw@mail.gmail.com>
Subject: Re: [PATCH] drm: pl111: add CONFIG_VEXPRESS_CONFIG dependency
To: Sam Ravnborg <sam@ravnborg.org>
X-Provags-ID: V03:K1:7/GJE/SwpTTCGigdH+VvUSS2Wk4uQu+ItAvo+ILI/INoslNQUK9
 qdQRw4JH3ZmDnKINCnx6TSmZh7f3ydctbb2NIOF3gZioSMPGYFZwM2csGny5287iRvKax7f
 OoT6tlXX0Yl9WucNAu/amXy3t7lY8NWtDRBfE0gyJdy7Heua+MgGryaC3mxaue+snGWEDmh
 thDtHu8Z/G6xMX+MlX4pg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yjd2wiZODK4=:Z7qkSgsW1cdb3XX2N0trzq
 0yYwL3KXZmnpd5tUFDD2cj26vOsQBpMuWPk9bb59R+2nwIT2RrP+UY+tAOFBeRP5LrlsayA+W
 gPd+T7wePyw6vN0H6QDkhvFn7W2JqFRCt4Mve7B8FeghrXNYuBI4ENSV6pCaHL5nuzHPOFbIS
 A8+jNG5+sZt0JkYapyjjK6AqfA6uVwMoWb3EaqgsQdmgcIPSWJ/E2danyE3JtxfmI2HEMs4Mm
 fPmwjhKiqXOA0Vntqz7rqPOz/4Dc6zSYVZMlahoi+I1xz3a454m/wX+A7eTm3hLBw2ltTR90c
 2tNHAuDMyTl8+Yt6IhLQyZuvu/u6N79Us+Djwt/z+DSEyA/KiKBk4ufs7ZGfL+De27nRDf61F
 +NUv567gCXxBRIomudRLqZUrHofnl7oeTRE1A6BTreGH9S2HKvTRSHIB16NN8YbUAY4sm/3qV
 lE86LYDStkwWBL8SH/zkpLd/CJPpp2nWTW9rUi5OREJGUnwoKDN/Ghp3eXj/na5MgKVbPqdid
 V6qJtcI6bGwwxXCY5l593ESPEvP3sl5BlvOkq7RuztxlsAZK2xvMLuqziwPBuADHHzJPMEo2F
 i4gryQfKkz82RXIMAfmwU89FsYu5DOp7Yc4rcXnwE4jtwPBQJuutsKi8cWjKfhyEMqALdcUuJ
 lNRJ4hNzSSdUDyzFXE5eozp86Jz1OTT7H8VUxpYfv+eQAj/8FxgwAvVIov8rEK1v8xT66Yh7v
 JiJAfIYgi+Q67j2B09OFjZHrpi9UlSZlOwyGQLFgE4u47flnNzw1hQKr0zxXEKQ49PKmo3RZG
 mOQJGhlvoZ+TX+4tg/NdwZ5amYOP3KRdmxdc7vg1EUAXPcc+/g=
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
Cc: David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 7:50 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, May 27, 2020 at 05:47:21PM +0200, Arnd Bergmann wrote:
> > On Wed, May 27, 2020 at 4:52 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > Hi Arnd.
> > >
> > > On Wed, May 27, 2020 at 03:31:42PM +0200, Arnd Bergmann wrote:
> > > > The vexpress_config code fails to link in some configurations:
> > > >
> > > > drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_versatile_init':
> > > > (.text+0x1f0): undefined reference to `devm_regmap_init_vexpress_config'
> > > >
> > > > Add a dependency that links to this only if the dependency is there,
> > > > and prevent the configuration where the drm driver is built-in but
> > > > the config is a loadable module.
> > > >
> > > > Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > Could this be another way to fix it:
> > >
> > > diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
> > > index 64f01a4e6767..1c38d3bd2e84 100644
> > > --- a/drivers/gpu/drm/pl111/pl111_versatile.c
> > > +++ b/drivers/gpu/drm/pl111/pl111_versatile.c
> > > @@ -379,7 +379,7 @@ static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
> > >         u32 val;
> > >         int ret;
> > >
> > > -       if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
> > > +       if (!IS_REACHABLE(CONFIG_VEXPRESS_CONFIG))
> > >                 return -ENODEV;
> > >
> > >         /*
> > >
> > >
> > > Then we no longer have the whole driver depending on
> > > the value of VEXPRESS_CONFIG.
> > > Not that I like IS_REACHABLE() but we already had
> > > IS_ENABLED() to cover up here, and that was not enough.
> > >
> > > With your patch would we then need the IS_ENABLED()
> > > check?
> >
> > The IS_ENABLED() check is what I'm adding, not removing. I'd still
> > the Kconfig dependency combined with that check over
> > IS_REACHABLE(), which is more likely to silently not work.
>
> Then the now redundant IS_ENABLED() check should go.
> With you patch it looks like this:
>
>         ...
>         if (IS_ENABLED(CONFIG_VEXPRESS_CONFIG) && ...)
>                 pl111_vexpress_clcd_init()
>
>
> And in pl111_vexpress_clcd_init() we have:
>
> {
>         if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
>                 return -ENODEV;
>
> The IS_ENABLED() in pl111_vexpress_clcd_init() is redundant
> and the patch should drop it.

Ah I see your point now, sorry I missed the double IS_ENABLED()
check at first. I'll remove the second one from my patch and
resubmit after some more build testing then.

        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
