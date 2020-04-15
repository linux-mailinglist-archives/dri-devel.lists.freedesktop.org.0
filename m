Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107411AB0E9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 21:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1159F6EA7E;
	Wed, 15 Apr 2020 19:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16D76EA7E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 19:07:33 +0000 (UTC)
Received: from mail-qv1-f53.google.com ([209.85.219.53]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MeTsQ-1iodkd46Im-00aT0d for <dri-devel@lists.freedesktop.org>; Wed, 15
 Apr 2020 21:07:32 +0200
Received: by mail-qv1-f53.google.com with SMTP id c12so698523qvj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:07:31 -0700 (PDT)
X-Gm-Message-State: AGi0Pub+MAkyCVaZD1gy84aDappyhd0dKrg2MOck9LYH+i9pHs2tfv21
 e6Sp0wBNBoRb1QeClCNoDbs1Z1NlZpnPKW73DaE=
X-Google-Smtp-Source: APiQypJX6+zh0Hk9cZgHIA/HI7dJ0HZA699mCplxjoSE0/kbYbrN5LgCPWe0a2KpM5wIklHmQkE+zGG0ajKUcBeJ1kM=
X-Received: by 2002:a0c:9e2f:: with SMTP id p47mr6000391qve.211.1586977650774; 
 Wed, 15 Apr 2020 12:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200408202711.1198966-1-arnd@arndb.de>
 <20200408202711.1198966-6-arnd@arndb.de>
 <20200414201739.GJ19819@pendragon.ideasonboard.com>
 <CAK8P3a0hd5bsezrJS3+GV2nRMui4P5yeD2Rk7wQpJsAZeOCOUg@mail.gmail.com>
 <20200414205158.GM19819@pendragon.ideasonboard.com>
 <CAK8P3a1PZbwdvdH_Gi9UQVUz2+_a8QDxKuWLqPtjhK1stxzMBQ@mail.gmail.com>
 <CAMuHMdUb=XXucGUbxt26tZ1xu9pdyVUB8RVsfB2SffURVVXwSg@mail.gmail.com>
 <CAK8P3a1uasBFg9dwvPEcokrRhYE2qh6iwOMW1fDTY+LBZMrTjg@mail.gmail.com>
In-Reply-To: <CAK8P3a1uasBFg9dwvPEcokrRhYE2qh6iwOMW1fDTY+LBZMrTjg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Apr 2020 21:07:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0CoPUTSJp6ddDnmabo59iE73pugGSYayoeB5N57az9_w@mail.gmail.com>
Message-ID: <CAK8P3a0CoPUTSJp6ddDnmabo59iE73pugGSYayoeB5N57az9_w@mail.gmail.com>
Subject: Re: [RFC 5/6] drm/rcar-du: fix selection of CMM driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Provags-ID: V03:K1:E6vgnPsWD22j318QCzaefshZtmQyssYcDVeCgB9uVqEnCXNOl8Y
 ghTUUPvNjJqz0mj1kPyH+IXPu0TEqtNl3GnTVVIzU6wYgaKHKkvBx410Oij9Ry/Wh332RXb
 /MpvkGO+my2KsJnXLOvb2ptQ8yojWQoY1SyJgTAqGTunM2M9DV0bAIFZElOd0Jy2k/WdLwn
 VseW+QHw43Qg1m8qRN2Xw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VPIjdBnAkRI=:7aNhYv63vasUJ0LCUBSm88
 EklA5SxtLiqg7xXgFtDMZReowcJJot52E41kTRlPwRi3GqmNS42OTq9x991xCZijdetbYZi3r
 ZabUNqW+REF5rI4EO677kFKBm7LbqOpplz6cG9U+1wHmx2/JHDZBYr0Hppw9w9MFVnkogGAmK
 te750redUGk2qCPYNl0E9tYjVTZCfeZ8F8KobXxbsfGofNb0viHkxHXvxJGOJNGnDOunLooFF
 q1KbB0mHO4efgYju5+j5Ntccd9FcW3FtUDtnH/HM9posTI+5M3K20p+gzuavhGNBHLsvNWKRw
 WByyiaPph385ZDI/ZJi3u6UaUq8GkP4NC1TYjIvL0SjCnVHMkNZSYV7U3snaODJrqI2U+dAWg
 TzzbTy5gNbZTonPSWfAK0Rck9OWGABejZhhPzIM3xPfmzx15Ty6a1+Vdjg3mNbo4emmP+AYlv
 98A+5EBqDB6+1uqOeQcc6lRfLJjA0IzwzqVQI4hdlIJgq6jymMasITmuPWk94V/1djw5WU3q4
 t8AUuYlXVJJohlfj3eemavUG4iY5TNmq95brz59Jvza+1uXjfSsPYNzJxfKDLz34odcyWbqTd
 /c3huPmYb+NtzjjzvTaA7ZUYc+6lpDZznU+4qY0MfuWx1nJ+wRjd5C/uN+lagI40aKBuSKrP9
 OnAsAsU4OsNfAA2ERCpDIqPXgKxKnB2utNlmBrmNws2BKC7YzQvtHrAi9pPn40LSjXum75VDh
 0QxVHYCh/YB0evrznB3g1/LE5+7ESgn1qESYrAz10TnT24IqhCcVY7zpG4MIT2GXgS8R7OFI/
 SA8W7DGF5ymnuwhQYAtllH1diu5Kz8q+JgZk31DP5Tt5Bp/4rw=
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
 Nicolas Pitre <nico@fluxnic.net>, Saeed Mahameed <saeedm@mellanox.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-rdma <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 5:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Apr 15, 2020 at 4:13 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Apr 15, 2020 at 3:47 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Tue, Apr 14, 2020 at 10:52 PM Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > > > Doesn't "imply" mean it gets selected by default but can be manually
> > > > disabled ?
> > >
> > > That may be what it means now (I still don't understand how it's defined
> > > as of v5.7-rc1), but traditionally it was more like a 'select if all
> > > dependencies are met'.
> >
> > That's still what it is supposed to mean right now ;-)
> > Except that now it should correctly handle the modular case, too.
>
> Then there is a bug. If I run 'make menuconfig' now on a mainline kernel
> and enable CONFIG_DRM_RCAR_DU, I can set
> DRM_RCAR_CMM and DRM_RCAR_LVDS to 'y', 'n' or 'm' regardless
> of whether CONFIG_DRM_RCAR_DU is 'm' or 'y'. The 'implies'
> statement seems to be ignored entirely, except as reverse 'default'
> setting.

Here is another version that should do what we want and is only
half-ugly. I can send that as a proper patch if it passes my testing
and nobody hates it too much.

       Arnd

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 0919f1f159a4..d2fcec807dfa 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -4,8 +4,6 @@ config DRM_RCAR_DU
        depends on DRM && OF
        depends on ARM || ARM64
        depends on ARCH_RENESAS || COMPILE_TEST
-       imply DRM_RCAR_CMM
-       imply DRM_RCAR_LVDS
        select DRM_KMS_HELPER
        select DRM_KMS_CMA_HELPER
        select DRM_GEM_CMA_HELPER
@@ -14,13 +12,17 @@ config DRM_RCAR_DU
          Choose this option if you have an R-Car chipset.
          If M is selected the module will be called rcar-du-drm.

-config DRM_RCAR_CMM
-       tristate "R-Car DU Color Management Module (CMM) Support"
-       depends on DRM && OF
+config DRM_RCAR_USE_CMM
+       bool "R-Car DU Color Management Module (CMM) Support"
        depends on DRM_RCAR_DU
+       default DRM_RCAR_DU
        help
          Enable support for R-Car Color Management Module (CMM).

+config DRM_RCAR_CMM
+       def_tristate DRM_RCAR_DU
+       depends on DRM_RCAR_USE_CMM
+
 config DRM_RCAR_DW_HDMI
        tristate "R-Car DU Gen3 HDMI Encoder Support"
        depends on DRM && OF
@@ -28,15 +30,20 @@ config DRM_RCAR_DW_HDMI
        help
          Enable support for R-Car Gen3 internal HDMI encoder.

-config DRM_RCAR_LVDS
-       tristate "R-Car DU LVDS Encoder Support"
-       depends on DRM && DRM_BRIDGE && OF
+config DRM_RCAR_USE_LVDS
+       bool "R-Car DU LVDS Encoder Support"
+       depends on DRM_BRIDGE && OF
+       default DRM_RCAR_DU
        select DRM_PANEL
        select OF_FLATTREE
        select OF_OVERLAY
        help
          Enable support for the R-Car Display Unit embedded LVDS encoders.

+config DRM_RCAR_LVDS
+       def_tristate DRM_RCAR_DU
+       depends on DRM_RCAR_USE_LVDS
+
 config DRM_RCAR_VSP
        bool "R-Car DU VSP Compositor Support" if ARM
        default y if ARM64
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
