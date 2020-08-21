Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320B224E691
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9583B6E46D;
	Sat, 22 Aug 2020 09:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC856EABA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598008382;
 bh=3hICDB8bk52dFVQc3BFBE3kOtnHrBZBdOB6EMWbL2iU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hE19nQIKsQiQl/Bzl7LQ4OEg0BX321SpOmsxPONZ3+/OGmWIDrJtEzACdx/bwvqrn
 1V3QJtWMg6r/CAXLpCapgK4tvJpc3QUE0t4adpbQOMjV93iFKYylD4IAyd9a79X7+H
 Sf9g/+pS6ckCNG4Z+JXdJhgG90PS4/ApiohlOoP0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.76.97.101] ([185.76.97.101]) by web-mail.gmx.net
 (3c-app-gmx-bs37.server.lan [172.19.170.89]) (via HTTP); Fri, 21 Aug 2020
 13:13:02 +0200
MIME-Version: 1.0
Message-ID: <trinity-299eba1b-59af-4257-83e6-7387e9fcf865-1598008382125@3c-app-gmx-bs37>
From: Frank Wunderlich <frank-w@public-files.de>
To: frank-w@public-files.de
Subject: Aw: Re: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
Date: Fri, 21 Aug 2020 13:13:02 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <0E911554-482A-47C2-B2C6-136486C5ACB5@public-files.de>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <f68cf4c2-6c79-fe46-b7b4-bcc49e0b6b69@gmail.com>
 <0E911554-482A-47C2-B2C6-136486C5ACB5@public-files.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:qQ4/QXcY7aHug4GJ2xC3UHeSxq5y48c2pvLvlG6DRO/NMKGYWoyQwtVQ37sT6Iw2tCo9j
 WCKmpdZA+cTKW69yQWXhnYpUZUmALV8zop6WyiuuqnOlgKYjp5SDOuFI4iXNCwt0xaMW577Qsf4d
 GPoF68X2Ms6m4c7uyd8zyf3lCvsTyHOwKsTRThS9n78XKRGZpOuXSHdczxiiomx7Cb1MK4H/5baj
 nrYfg8g1zE46ft9EsWJp9+YZy4LaebVzAcJAxu6PPD9DeHN3zUo3QGl95pZbpvqgABWDEm8OI5H6
 Pc=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YCk7Kw/svWM=:R2+qY8dmS+nNu0rNZbnzI5
 zHruvXFt1cp3+5drBm1BUX5H1Bn386hNGlWqkArpNzOQJOUffN0vC0HyeDbmd2r4MwsgB1Yy4
 /ucUHi9FUNCGk8qIEokq9vhX0sdKl6ILinIcwT+eZqr1vckoWitNw0WqS3XAnqHfSNf7oUmby
 xR7KXqgG50c5SjxSuBxybmExGF7grmzVIDeCySvALaE+Vcn5a3Pi6OkIpCyvu/Z1DBguvOHRV
 wAGhnUMGM31uiFSWEUdyhrIS7gh0cXM8U7e10y+1Ab5QvJ6fUPWveNxlGsFeXcB1V2xzIflkj
 ThtoiT6G8AEQYr3fLiYgC61i0POskwZyUtXfvpgCMlX7XxwejwnPiP0scWiCdfUgGXgd11jYb
 7OUDvTQh5bElHROUdD99eQD5Ip98xnaDMqQC4nUcqsJO+Z8SrLAFUad6rhdqDhoFa9xSYbnpc
 CsClqD7bocnA8qYJ1+UUsV6qve52+8hecyizFEMdod3Zpab0J6QNLh/svJvy3yw1Zpz2QttDu
 3+/jr9QRjPD/jlNify6PeqPMpbBVitnf2EJHyvzAZnbR8Jxgu/u2pGYDoy3Cq21Wye/lS+iIe
 5ZNBjTZKhtgyT0dqjLTpD5jVLQ8UclEJHtK4rhef13kRuW2ziFiwzga0LK/LS7CdkAqJz3nbU
 qWHTQkQULFrybDoWZB5kL3N7zBhgbne3CizYJ7YHnjIV4J1NEiljG4kDa5/KH96QvdYo=
X-Mailman-Approved-At: Sat, 22 Aug 2020 09:02:00 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 chunhui dai <chunhui.dai@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Gesendet: Mittwoch, 19. August 2020 um 21:04 Uhr
> Von: "Frank Wunderlich" <frank-w@public-files.de>
> Another way to fix it maybe not enabling it (use the flag in mtk_hdmi_phy_power_on) there instead of disabling after enabling it.
>
> Maybe this is less hacky than current way (as ck hu pointed in v2).

seems my last mail is not send right (did not got it from mailinglist and it's not mapped in patchwork).

i tried this approach, but this does not work, with checking the new flag in mtk_hdmi_phy_power_on and only enabling tmds if this flag is not set results in same behaviour like without the Patch (horizontally distorted image flickering on 1280x1024)

- hdmi_phy->conf->hdmi_phy_enable_tmds(hdmi_phy);
+ if (!hdmi_phy->conf->pll_default_off)
+ hdmi_phy->conf->hdmi_phy_enable_tmds(hdmi_phy);

seems like tmds needs to be initially enabled and can only disabled later

regards Frank
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
