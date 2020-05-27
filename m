Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9AD1E481B
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 17:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0729989C88;
	Wed, 27 May 2020 15:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84C289C88
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:47:40 +0000 (UTC)
Received: from mail-qt1-f175.google.com ([209.85.160.175]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M42zo-1jdyHK3TqC-000705 for <dri-devel@lists.freedesktop.org>; Wed, 27
 May 2020 17:47:39 +0200
Received: by mail-qt1-f175.google.com with SMTP id i68so19543913qtb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 08:47:38 -0700 (PDT)
X-Gm-Message-State: AOAM5322u1UpCbdJ74qamlvZ0s41dDHKdZDY2ysq3JCawCfW4bmBdTXi
 EQFdJwYokY5VMDGtd+sL1C4rkTdSN+s2NQWt3WM=
X-Google-Smtp-Source: ABdhPJw0NdvOXZo+VmWRkqDx65ClgSV3QtU9GhX4PfuIXXz+OXhKaOJ3BRC9zijhnhQVCPu/Z9JMb476EnADi1mFWKw=
X-Received: by 2002:ac8:6b15:: with SMTP id w21mr4983525qts.304.1590594457614; 
 Wed, 27 May 2020 08:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200527133158.462057-1-arnd@arndb.de>
 <20200527145226.GA91560@ravnborg.org>
In-Reply-To: <20200527145226.GA91560@ravnborg.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 May 2020 17:47:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2k2qPOdREo-+AwOL8JVcO2VFoouAFyx6-fr1UnpavwLA@mail.gmail.com>
Message-ID: <CAK8P3a2k2qPOdREo-+AwOL8JVcO2VFoouAFyx6-fr1UnpavwLA@mail.gmail.com>
Subject: Re: [PATCH] drm: pl111: add CONFIG_VEXPRESS_CONFIG dependency
To: Sam Ravnborg <sam@ravnborg.org>
X-Provags-ID: V03:K1:1Ywwq/I+9jBRKlYN/ePnNpuRjq8A3KNVcBaivV8w0pZ73lr0rNp
 +RUIy8bC5AFKCSS7bm7rGagYZsLSGzk/ZV8l8+w1GWcHLhY+vdI9lzcIZUDHtvSZ28S2ZeI
 ZqP1yl9CdMO9L8H4MNct6e9c16SLnEWnsY9Xk5Fm2ksFrszwH6yxkWoJPEMy0b/QiPqhUP2
 9tJ40wMvfUjaWD7Y3Pp9A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BxQcF+j8R0c=:JhahoDXf87RT9UwsT1py35
 gt8CQlnNBeZAX9VMWXyBZpzb0J1bIHy1NsUcH6KaqFmoL6MGKSe+lkNFJpUb/0gRutR0VWRgQ
 lYszphbiq04J7NhS8uilFjVKsD/+dmfk3jgbcBujiTAZqhtBT9pWqBGqS4f1rcvarvXuQ2o5M
 XVF0ZG5+uDwedgp/AlXvfAACUTL39o4jKL0ir+N59zLWj4RMfO5UXEv0PuUuNal6S2zZw5zAx
 3vavaYJ1jZiepkKGI7Dv1dJ+VyHFKIgX8QTuHWxX9tQAJpcTzXXUvKiyqCHIwu/KEJkL7t7ZF
 /k+IaevxU/Zu+3mRMLtKNNJqqU6z2MgBQIfRDN7KiEtcGh93iCGKZ5Ld+j4447MBf/eVlPlKq
 /UUdu/g69uWLEqCymmsvAQfPni1+NYEWXqh7y8ZeMuo6Uvbho6XHGuzpE/6SYZbjFnGRc1PaT
 Ifu2XYntvJrRcRQCJ8OahwIMxDwC0A+T4hyvwQNLdIBitmhHbqHCZpHuLvUNiEKcoU7nv0qIK
 VORrQRS+rdfYwVQ83roXolxeT9Lz0+cjFUojksSH46jyWOSzcqRIAFGuiiMGJnPsZQ6Y68LSK
 yw1Ttz7cu1VxBhO2fb43O+TE9PQGcNg164Y4hY9yFkFwcaxBDFjqASeldJlyfzWQ7O13L9Gky
 uCAAoW/4rlfbtD4xCS0ntXg1n2lmHJXliRij2F6rD3RUdSekr8rZr9ET1AyCwIhM0sxbhTXI5
 l5XXiC+k7rMvLq5npPmnzh8IIvyyg1EYesabMGg6n1h4Z5U4S5Jh1Vb3HcElANozZdIag31fl
 fTDZJG6yPVb32djTyelT8v9efYv7IMObUTDnVnNri8S5Z1dgXs=
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 4:52 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Arnd.
>
> On Wed, May 27, 2020 at 03:31:42PM +0200, Arnd Bergmann wrote:
> > The vexpress_config code fails to link in some configurations:
> >
> > drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_versatile_init':
> > (.text+0x1f0): undefined reference to `devm_regmap_init_vexpress_config'
> >
> > Add a dependency that links to this only if the dependency is there,
> > and prevent the configuration where the drm driver is built-in but
> > the config is a loadable module.
> >
> > Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Could this be another way to fix it:
>
> diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
> index 64f01a4e6767..1c38d3bd2e84 100644
> --- a/drivers/gpu/drm/pl111/pl111_versatile.c
> +++ b/drivers/gpu/drm/pl111/pl111_versatile.c
> @@ -379,7 +379,7 @@ static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
>         u32 val;
>         int ret;
>
> -       if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
> +       if (!IS_REACHABLE(CONFIG_VEXPRESS_CONFIG))
>                 return -ENODEV;
>
>         /*
>
>
> Then we no longer have the whole driver depending on
> the value of VEXPRESS_CONFIG.
> Not that I like IS_REACHABLE() but we already had
> IS_ENABLED() to cover up here, and that was not enough.
>
> With your patch would we then need the IS_ENABLED()
> check?

The IS_ENABLED() check is what I'm adding, not removing. I'd still
the Kconfig dependency combined with that check over
IS_REACHABLE(), which is more likely to silently not work.

       Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
