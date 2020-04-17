Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2D51AE66F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 22:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80066E37C;
	Fri, 17 Apr 2020 20:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB5A6E37C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 20:03:42 +0000 (UTC)
Received: from mail-qk1-f170.google.com ([209.85.222.170]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MiZof-1imuvy0ZCZ-00fltQ for <dri-devel@lists.freedesktop.org>; Fri, 17
 Apr 2020 22:03:41 +0200
Received: by mail-qk1-f170.google.com with SMTP id v7so3840842qkc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 13:03:40 -0700 (PDT)
X-Gm-Message-State: AGi0PuZbp/nDyH8QbhZsQ7thx0PbnUja8cY6tWjxvtmcbRhydaAkpG4O
 AehNXMVEupujrlUpCSMSRHpTj/LRbISIKPTPWlw=
X-Google-Smtp-Source: APiQypLHfVPeC+1JXO+hQtzRoij/Dspk+56syykO4JIxxM0xU/k6yi10dsuOkecP305cfjfVJkIKTLwVZe6iZOZzqio=
X-Received: by 2002:a37:ba47:: with SMTP id k68mr5106432qkf.394.1587153820000; 
 Fri, 17 Apr 2020 13:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417155553.675905-7-arnd@arndb.de>
 <20200417165041.GA30483@ravnborg.org>
In-Reply-To: <20200417165041.GA30483@ravnborg.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Apr 2020 22:03:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a14G=Mv3jpZRciTgsSDf4Bd3ZOAqFRN1cc2FLYbwZZcbw@mail.gmail.com>
Message-ID: <CAK8P3a14G=Mv3jpZRciTgsSDf4Bd3ZOAqFRN1cc2FLYbwZZcbw@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm: decouple from CONFIG_FB
To: Sam Ravnborg <sam@ravnborg.org>
X-Provags-ID: V03:K1:4JR6GTDtfuj0zYkA4vsWTW1SfrlaR/W3UeE0FkA1rkjOoJlcPK0
 404T0dqYiWu9H78FpgebqK9FRDuCKoEPKfJnfZRo7eLwS1QDiGDYIHtI/0RsQZ5EET9t4vU
 RbiRci0M/vDkz6e5pVTxSbSyqK6O+HY8XlMo6tgels+hAQRM3DSakQjLNUd2/6aRji1vDm7
 7ewt8ydmevHhhCuxD5p3w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DTOAZutVO/w=:CK3hDUfp0/T2Bwrr+A+Xwg
 dP29GUmt7cgfY4HttF+GGK0jkWFDvES/SJpUMt7ozY0qrDPUIYfxXSICL2sOtYxEgXTzKkrDx
 386sOFn8I6kSufwg0qDml6HomN2mVWcln3JxDE3MDIisklx083GXHtbxtbxxMQJa+21LVAwZ/
 Gg+/EwUtnUec8NDR3VwQBfRQ4+dfBqnuVu4kR1HPvW/uTlcMDLFXYTj1Z5O/dlXoO4ezGP4n9
 e34jGL75elsSMhABcb1Kg9Ik3cRjK4BbjACPF+wg1I2xuCVAuIIKA4KBJw6yc4uKKUK9O6yja
 Fwkz5dPvNIdvgnA23TGT65ZolwCobNQZk+JuWJMN/NQKuBYSFkN3vM1G82zzWmFLjLEkSHu/1
 CwFDJVrWB3VLcoUZKWRBx4UAMTlWp3rEvqER88FQYQ78QE9cB2T8qtdtHqT9RvXqEbYz8pVeM
 aGF0ZIqgrSgxeRBdIhOu/oFLlvXa2DE44AmlJHhJKNU7eoDqqRE/Z2D1ZLUy3MVEP5AWGotFm
 bLhs2pJ8nj4Sq9Ze772oHDF5gSQXhSFO/srutvXIxi2TunvsMgu/MT5uJqCPhZMjrg/ml7kpf
 SVTs9bWJ8RN0DoIipJwPkji6J9Lx4mHU/zd3AJfg+rhrApId6AnToNfCheNnW9dSspnv6L+vx
 iJG419H+uOua8uKGb8kYSvvT4hkMQnFo9Zgot2/uy0IMXh4Ip45jwiCLlaHoQL4tYvxfmNE4Q
 jEzwqwvyooJQgS2b8lPxVNJV5DP/Y+4wqI2Etb/mooLcCW6NZLkAXhM6s0K2ZVKfmco/WCig5
 H7N2fmmu2oCjftPzaa+xktZ/BN/HgosMKP9vMRcU22lipCjE80=
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
Cc: Marek Vasut <marex@denx.de>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>, dsd@laptop.org,
 Nicolas Pitre <nico@fluxnic.net>, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>, jfrederich@gmail.com,
 Saeed Mahameed <saeedm@mellanox.com>, Thomas Hellstrom <thellstrom@vmware.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Mack <daniel@zonque.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 17, 2020 at 6:50 PM Sam Ravnborg <sam@ravnborg.org> wrote:

>
> So what this try to say is that we cannot have FB a module while DRM is
> built-in (marked N in the above).

Correct

>
> Could you explain in the changelog why this combination is not good.
> (Or tell me if my analysis was flawed).

I agree in hindsight this was less obvious than I thought ;-)

Added this text to the changelog:

|  When CONFIG_FB is a loadable module, DRM_KMS_FB_HELPER cannot be
| part of the built-in subsystem, so add dependency to ensure this
| can only be enabled if the DRM module can successfully be linked.

and this comment in the Kconfig file:

@@ -112,7 +112,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
 config DRM_FBDEV_EMULATION
        bool "Enable legacy fbdev support for your modesetting driver"
        depends on DRM && FB
-       depends on FB=y || DRM=m
+       depends on FB=y || DRM=m # DRM_KMS_FB_HELPER links against FB
        select DRM_KMS_HELPER
        select DRM_KMS_FB_HELPER
        default y

Let me know if you think those changes are sufficient

> With this fixed (assuming I am right):
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks!

        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
