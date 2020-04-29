Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DFF1BD6C1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 10:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850AB6EA85;
	Wed, 29 Apr 2020 08:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D58C6EA85
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 08:02:43 +0000 (UTC)
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N0X0U-1jHmy529iO-00wXbu for <dri-devel@lists.freedesktop.org>; Wed, 29
 Apr 2020 10:02:41 +0200
Received: by mail-qk1-f173.google.com with SMTP id l78so1098008qke.7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 01:02:41 -0700 (PDT)
X-Gm-Message-State: AGi0PuYJ7Xq5XYfCf9bujiwSqE9dB/RFf/kjBM6A4TCry2bNaud8pl36
 yElECKSwlI57jxSluqvleSuxgFp4ujGte4AFLZo=
X-Google-Smtp-Source: APiQypIb7rbzxVNgizgliUE9cuI6uHb2puyxpFpWzxm5GRei060dQZgRQpS434PhF854JL+xI5SHvYYGPatYF2vesJk=
X-Received: by 2002:ae9:f712:: with SMTP id s18mr15249636qkg.394.1588147360437; 
 Wed, 29 Apr 2020 01:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200428215408.4111675-1-arnd@arndb.de>
 <22ee464b-f59a-69a3-b669-f821d567fbf5@ti.com>
In-Reply-To: <22ee464b-f59a-69a3-b669-f821d567fbf5@ti.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Apr 2020 10:02:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2YAe0KPQYQi_PhFvaYeA_4jHM8Y0qOR8oy-A07y-zeEQ@mail.gmail.com>
Message-ID: <CAK8P3a2YAe0KPQYQi_PhFvaYeA_4jHM8Y0qOR8oy-A07y-zeEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: fix stack usage warning on old gcc
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Provags-ID: V03:K1:fTtTpWj+i/zDkmZeaBKYIVrSb3i9Zzz5s43jMlwkg0q4Le1XrGI
 X1+FOv3mXr36NN3lBftn3j4Pl8I4AkeWnziC/I0cFA8gIzWEKvFFwbx/cl19D1z37GZS3GM
 YcghqyV2oCINcdCMYGWZPvXH8jnWGOjNPnDoIR6SdTzTKYFzXkHpiMcW23v6wbWDcS2BU54
 DNQrJt3fSOoMv8oLLLgrg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wzRTJQnehhE=:yi7l4PDAzMJZ74gYEcIViD
 i10eN3LNtJh2iGd4tV59uERxU6zruXM/tzlvyTPspMxd+HqY4R/+Zn9UoH+A0PlMAu2zEbQyv
 DVUo2VnqtfjL7J6zoeBBbRzB1Wu+VVqP1WmE9MK0SVzVNbKChVSUTLhzb9qV4KYSBP9rgYgJd
 p4XDhy+FUZ087xkHTBbvXOqiOOktDgcw+qkTxNbGGlTRT9urbM47BTqE2Ld3RRyT+GeypV9y/
 QT0xypL3jc8e8LjkmQ7EguUASCNb6p0b4NPlvmWViIZMTZLA22nFrFYSGY8MDol9DIeuXMiPy
 /JvUEKr44Ty8987fphXWjV+bivccrdPTCcVgv7A3Spy7wVKo9L3DmkGl7bfKvfkpX17+MyOQ0
 pRyvvmgRmV2jpjEzrug4ttupNOvdv3pExikuBvpkhBM/JWLnQEGUyziZLN3jg8/Z+Y9bXjsTY
 AtUO1dKJLMH9IM5ZWo3VLTIzdhS6KT6Jyh0Ohpimc1OJcyMGv1yPhi8mhGbfb58EPXeDehPZ5
 BXamLKdTt0A3//Adi8XUKeW+VTmp+NuZkcqQPKMqGPFFzkNDJPJ4ddydv8u9qzfaF2SKTTG5N
 B8lCa/AGZKzprJ3LJujBAiS6CtJeBsRV9iuPUJ/eHYRh4K4n/TsurcraxZ4B4whr0TVLQ+lzp
 9B8gCQt/qzbjV+WEW8ybJN2hYWkQkh6lc/we6n/Spai0bm/gLCSlGqwFK0KuGJpmU32oZ3JZh
 NtDyCjVh5FVG58wX719k9gRxFaVt1/GV7sGb0bzYPX3IIIbb4Bk2yNnxB6VBngAd2U0+WCMNm
 MJfyQtmyBHkUBl2I68CKxxJXdI5lcP2gXkKBhTcNF9z3sI6EdI=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 9:56 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> > diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> > index 1b39e8d37834..6650fe4cfc20 100644
> > --- a/drivers/gpu/drm/bridge/tc358768.c
> > +++ b/drivers/gpu/drm/bridge/tc358768.c
> > @@ -178,6 +178,8 @@ static int tc358768_clear_error(struct tc358768_priv *priv)
> >
> >   static void tc358768_write(struct tc358768_priv *priv, u32 reg, u32 val)
> >   {
> > +     /* work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81715 */
> > +     int tmpval = val;

>
> tc358768_write is not inline. What is the inline function here? Or is tc358768_write optimized to
> inline by the compiler?

I missed the lack of an explicit inline tag when looking at the bug. gcc
usually decides which functions to inline on its own, so there is little
difference in practice. Let me know if I should clarify the changelog and
resend it.

      Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
