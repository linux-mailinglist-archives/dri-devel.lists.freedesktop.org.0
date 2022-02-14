Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9312C4B501A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 13:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0829610E15A;
	Mon, 14 Feb 2022 12:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C677110E1CD
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 12:29:36 +0000 (UTC)
Date: Mon, 14 Feb 2022 12:29:18 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v15 1/7] drm/ingenic: Fix support for JZ4780 HDMI output
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <U0OA7R.MYFTV5LL3N4A2@crapouillou.net>
In-Reply-To: <CD0193A3-4E97-4B26-9D1F-1CFAD5B18506@goldelico.com>
References: <cover.1644681054.git.hns@goldelico.com>
 <9d3a2000d2bb014f1afb0613537bdc523202135d.1644681054.git.hns@goldelico.com>
 <PQHA7R.CIX6XS4CFLMM3@crapouillou.net>
 <CD0193A3-4E97-4B26-9D1F-1CFAD5B18506@goldelico.com>
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
Cc: Paul Boddie <paul@boddie.org.uk>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-mips@vger.kernel.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, letux-kernel@openphoenux.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le lun., f=E9vr. 14 2022 at 11:19:40 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
>=20
>=20
>>  Am 14.02.2022 um 11:13 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi,
>>=20
>>  Le sam., f=E9vr. 12 2022 at 16:50:49 +0100, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>>>  From: Paul Boddie <paul@boddie.org.uk>
>>>  We have to make sure that
>>>  - JZ_LCD_OSDC_ALPHAEN is set
>>>  - plane f0 is disabled and not seen from user-space
>>=20
>>  Actually it will still be seen from user-space, but it won't be=20
>> possible to use it. So before applying I'll change this to:
>>  "plane f0 is disabled as it's not working yet"
>>=20
>>  If that's OK with you.
>=20
> Yes. You understand much better than me the implications...

I reworded it to "plane f0 is disabled as it's not working yet", added=20
a Fixes: tag, and pushed this patch to drm-misc-next.

Cheers,
-Paul


