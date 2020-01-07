Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CD213357D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 23:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E3A6E142;
	Tue,  7 Jan 2020 22:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B6A6E142
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 22:09:32 +0000 (UTC)
Received: from mail-qk1-f171.google.com ([209.85.222.171]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MqapC-1jSjm62DMu-00mZTZ for <dri-devel@lists.freedesktop.org>; Tue, 07
 Jan 2020 23:09:30 +0100
Received: by mail-qk1-f171.google.com with SMTP id z14so875397qkg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 14:09:30 -0800 (PST)
X-Gm-Message-State: APjAAAXQCvpHW2S4kZhCm1Kh76+Xuh9ZvUpOFPZzvFQ+v6EXM3eeYOwP
 TccIvRkFcI8z/ArohC6muYrHKoIVSDzCzGSAOzE=
X-Google-Smtp-Source: APXvYqyh4XhRK9mmwA/xG3OF0WHgJZcWnnUxG0Jya3G/fVxWIQcA+2YFQ5BlUjCY92hnSt60E7na/jCofuSjk5V1hS8=
X-Received: by 2002:a37:84a:: with SMTP id 71mr1484972qki.138.1578434969137;
 Tue, 07 Jan 2020 14:09:29 -0800 (PST)
MIME-Version: 1.0
References: <20200107212747.4182515-1-arnd@arndb.de>
 <20200107220019.GC7869@pendragon.ideasonboard.com>
In-Reply-To: <20200107220019.GC7869@pendragon.ideasonboard.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 23:09:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Gt10_OLF1dXiNBxcO-seJfutcPu3w_dsHKNsDN4r7-A@mail.gmail.com>
Message-ID: <CAK8P3a1Gt10_OLF1dXiNBxcO-seJfutcPu3w_dsHKNsDN4r7-A@mail.gmail.com>
Subject: Re: [PATCH] drm: panel: fix excessive stack usage in
 td028ttec1_prepare
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Provags-ID: V03:K1:AgZN5JUlpJOMzCv/4444Vl55ZbifQgf2IKml8dCkLTZrxHrcn79
 FSL9+c4WshhIijGhiX0gzNfv9VYiFuNJNKXjm4ltYJ5vKy0ec6fn4LbxLLBpbEHKkXWCPt1
 MeuDEnMYrBNDx7BKUIrHT9tD8rUYd3or04ttY0/9g5NCfVNVd4N6LQZGCYdKFqOIH5pAev+
 z7i4oaDHKpe83DCA9U9KA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qV1c87jE0Do=:P95ikh8CePajIqgdUaIo5K
 1M+tSUJIG80tKtdfECyl9wL7wFWk6L7ltH+U9N+z/oaMs23FV3Tp7/sqSbaVo1SRO9pGy4QCr
 l7aedoJ4eEj37yOJTbFJwt5bJdshzJkAn10ocqsdx4cxc7pX+bZrRzmGQNMZicYDB6Up7yAwJ
 BXSLXJK3Gg3fDkzvipXTh6uwOQZdEzSSdJvahtv0xtNrCNXhnxYVnDedgSMc9GxLgrWtITgWQ
 hNKUPenD2JbHWCBtCoBlpK7/9ERrKpD73xUSeVnRffqzu9DXaqfZelo9/SCCkyPmh9wdWUvcj
 FGnK+X0NHBZbVpWNgc7sZ+pE4dh/vZELmGvwbatOit+XCuq27z3Pju6cHcH3xV/Bizrnq1pHI
 pEBNJDhwPIXFjc3DNQdffNQ7TgaOV+fZC5TgueoWfs8da2DmVzq3EnJ5a/lJVjf9lqjYqEMzX
 YblOUz8tNIUZSOEDMrQja9SR+i6DbpX0wh1W+ZhyGauL6dBCkJIXztqbL+IW1qDZ8+tigF8Sy
 dlnPWB/kBiNZkN6pgszVq+YDpKvAS2hM/Xdum10kJmNgNFg/eyeuaaBvoKjgZGKoxgzNdX8QO
 K0mbYd8f/uLHvnJJqjuQ5De9p+sXrEcykMof4zn74YkFtdjlGYxdZ7QZBIb1RQP7ZAaoa5XtG
 +AYw9Z0vxKzHLDw+PRUNlvdpkWmBpdcuPxT0sAmbM/Al5JyIjf5FyqHXJV2vJu4anUvoJxLF5
 S/5yJLjk0E3mindA153K84jCup/8vcT0M+s6oP0BKzcnHDZVstbG37vRRD3xLU64bQ6w9+VnP
 q2W9pY4R7aCyWvsglierSlGIxS8lxi0+lK2nq0ZmpEDTeVxTb7iHpSzY7H38gtjk4tWl4r5Al
 /97o40Y7yhM1gJbjcdGg==
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
Cc: Oleksandr Natalenko <oleksandr@redhat.com>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 7, 2020 at 11:00 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Arnd,
>
> Thank you for the patch.
>
> On Tue, Jan 07, 2020 at 10:27:33PM +0100, Arnd Bergmann wrote:
> > With gcc -O3, the compiler can inline very aggressively,
> > leading to rather large stack usage:
> >
> > drivers/gpu/drm/panel/panel-tpo-td028ttec1.c: In function 'td028ttec1_prepare':
> > drivers/gpu/drm/panel/panel-tpo-td028ttec1.c:233:1: error: the frame size of 2768 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
> >  }
> >
> > Marking jbt_reg_write_1() as noinline avoids the case where
> > multiple instances of this function get inlined into the same
> > stack frame and each one adds a copy of 'tx_buf'.
> >
> > Fixes: mmtom ("init/Kconfig: enable -O3 for all arches")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Isn't this something that should be fixed at the compiler level ?

I suspect but have not verified that structleak gcc plugin is partly at
fault here as well, it has caused similar problems elsewhere.

If you like I can try to dig deeper before that patch gets merged,
and explain more in the changelog or open a gcc bug if necessary.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
