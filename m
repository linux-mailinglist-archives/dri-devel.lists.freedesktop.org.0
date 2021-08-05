Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C183E1955
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 18:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227526EAD4;
	Thu,  5 Aug 2021 16:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C676EAD4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 16:17:48 +0000 (UTC)
Date: Thu, 05 Aug 2021 18:17:32 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 8/8] [RFC] drm/ingenic: convert to component framework
 for jz4780 hdmi
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Ezequiel Garcia
 <ezequiel@collabora.com>, Harry Wentland <harry.wentland@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org, Paul Boddie <paul@boddie.org.uk>, Jonas Karlman
 <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org
Message-Id: <8XJDXQ.X70C5WOD0QB7@crapouillou.net>
In-Reply-To: <BDF501D1-BA1D-4866-8EAF-3862F6CEC6F4@goldelico.com>
References: <cover.1628172477.git.hns@goldelico.com>
 <77554dd2612f418f6ab74a8be06c82b71410e0e6.1628172477.git.hns@goldelico.com>
 <YQv+DC5yTEGlJYuD@pendragon.ideasonboard.com>
 <BDF501D1-BA1D-4866-8EAF-3862F6CEC6F4@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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

Hi Nikolaus and Laurent,

Le jeu., ao=FBt 5 2021 at 18:07:20 +0200, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Laurent,
>=20
>>  Am 05.08.2021 um 17:04 schrieb Laurent Pinchart=20
>> <laurent.pinchart@ideasonboard.com>:
>>=20
>>  Hi Nikolaus,
>>=20
>>  Thank you for the patch.
>>=20
>>  On Thu, Aug 05, 2021 at 04:07:57PM +0200, H. Nikolaus Schaller=20
>> wrote:
>>>  This patch attempts to convert the ingenic-dw-hdmi driver
>>>  into a version that uses the component framework.
>>=20
>>  Why ? What problem would this solve ?
>=20
> Well, it was suggested in a v1 we did post several months ago. I have=20
> not
> looked up by whom and do not exactly remember the reasons.
>=20
> We now simply thought that it is common style since dome dw-hdmi=20
> drivers
> make use of it but some others don't. And we got it working without.
>=20
> If it is not needed/requested by anyone, we can drop it from v3 (or=20
> add later).

I don't remember exactly TBH - the only reason to use a component is to=20
have access to the main driver's "drm_device" structure. The IPU needs=20
it for instance, to register planes; but I don't think this HDMI driver=20
needs it as it registers a bridge.

Cheers,
-Paul


