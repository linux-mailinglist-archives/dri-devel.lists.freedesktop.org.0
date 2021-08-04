Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E93563E02CF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 16:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55016E0A6;
	Wed,  4 Aug 2021 14:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 761 seconds by postgrey-1.36 at gabe;
 Wed, 04 Aug 2021 14:08:13 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758686E0A6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 14:08:13 +0000 (UTC)
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MmkjY-1mtio33Lh0-00juoX for <dri-devel@lists.freedesktop.org>; Wed, 04
 Aug 2021 15:55:29 +0200
Received: by mail-wm1-f45.google.com with SMTP id u15so1270391wmj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 06:55:26 -0700 (PDT)
X-Gm-Message-State: AOAM5329B2bcHXdnpClCGlsR2JEscTiRYmfTnz66xg9id8xYSLBHQoWF
 +5ZCIQlEhv8VVnDyfAY65ahWFF9bmU0Uan0JlAY=
X-Google-Smtp-Source: ABdhPJwDFsHBF22f8Wqozeaut6UIlHtczJbkX0G3MU6rJlQNmQa5Uqm62X/H+k4KrenEDbOxO68Jg/vZ6B5uO0dsHAk=
X-Received: by 2002:a1c:208e:: with SMTP id g136mr9939159wmg.142.1628085325875; 
 Wed, 04 Aug 2021 06:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210804043439.11757-1-o.rempel@pengutronix.de>
In-Reply-To: <20210804043439.11757-1-o.rempel@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 4 Aug 2021 15:55:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0285V=N5HPS5grOTQ+q1HF8J6_PsxCLgLvYMsD0hVeUg@mail.gmail.com>
Message-ID: <CAK8P3a0285V=N5HPS5grOTQ+q1HF8J6_PsxCLgLvYMsD0hVeUg@mail.gmail.com>
Subject: Re: [PATCH v34 0/3] Mainline imx6 based SKOV boards
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 SoC Team <soc@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, DTML <devicetree@vger.kernel.org>, 
 Fabio Estevam <festevam@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Fyd0Gge/K/clP2iiDnSoAH9YF2Ip59sdPbDc5mbmeglV7VzAGGs
 B7IFVknCrc0kp/1lD+0n2UeVEeERNsNDkAdcSJiKHQBGcrbQDDlHYgQ1PvUi1/62xtPTJ0X
 rTye3SqRnKCujVQZrI56TyZmvw+UlSgm29Rl4bnXKoWuKtJnRJ43hfrE5s8xnCcKdfEzPrL
 oMORCJswy8Hihoj2WArVA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vqQCBJzaWa0=:VdCNxpRHoTjL/GbGvfYHZY
 M/fhSLQKgyGjrrvXENWemZ6PRwUw7DpcqrkadJ2PifR2eT6UE8/phOLsds7Mz7jLHsmrLMkSE
 IgiXIkMGZvlvV+6eNvuK/rLD7hUAuy9reCKeN1/55LxdFfT32DwrDkfEWCksHdiLSuHhgy3ox
 VjJLCCCilRNZR2Tt1ShxY/lEOehZh9jIaitQdpxVoVFWC0ExS2PQSGgwHHeLvY7MZWb3RVJB6
 3zWT7qd59NbmCj2LRKZs6T7WJJeSr8xha3f1ycKmt/LR1xkQnTjAY0oCOeQRFIrqcvlyRQfQt
 T3wn4jhFYbePbXRJZqrvzhd7vqQJA1HcYz8hqLuZyRp1lYQ05tfSyHDKZQaVn70PVRdTNf4CL
 bm4ugo/Hb0HcFfxJKpmiK9smK4XowqJAk/RqX9rWaZsukRIceVTRBDTvFD7g01bGOrrWB688r
 sXJMAtkMZcLF3xVraLbewDpyF8X8DBfBsLkxqwjKu9vZhcwEqTj1CYptIKuIne07JFfmpjq3Y
 NztExkkhBxGGBVnk5iqy9sI1ssZLXuVcT9D3ue1N3Zk5XbVLkQ4jrs5AIUnsnv+Jv+vHnqkuD
 uxtM/QC3+GLSlCSC1osDzji2K5FLyQmLCcPawg//bP6NeMeLPZb+jjwCSQCupAMjtYLA/xiwa
 5VAHwuZPWgjnSnbyDuao4cYxdIwcAagcPDJ0PHx5fgRcWdLn8bHbxajNfARL1vdbNYB/3WV+h
 3IkHd6XJl105MowX0mNNegKtpvrOy0PKYrjg+ObiCQ5qPsBpXSikWJ97+VoeFX/4NGFDoVEnN
 ayIlcsOzOFC4t7NcMTHzZkeAgONZ9lAc4oe7Ey7FMCExUMV3picYDfFP3n46kw0lbGhsW7eFw
 JkhvQDg+SzBn8OAN28Trl3wH25K2vablfKs1pA5N7XSHQNKzoK0y3Po7XL3DywiksUq7bkm9f
 VEQI8UMt9EAuytf1PgIHiiXuhPT6EmLgM0J+X2gyGwssxwqnEfRIA
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 4, 2021 at 6:36 AM Oleksij Rempel <o.rempel@pengutronix.de> wrote:
>
> changes v4:
> - add vref-supply to adc@0
> - split gpio assignment for the mdio node

Hi Oleksij,

I've dropped the series from the soc patchwork, since this looks like
something that
should go through the i.MX tree. Please make it clear from the cover
letter and from
the 'to' list what you want to happen with the patches, and who should take care
of them.

Any patches that are meant for platform maintainers should not get sent to
soc@kernel.org. If you think you need me to review the patches, you can
send them cc my personal address.

      Arnd
