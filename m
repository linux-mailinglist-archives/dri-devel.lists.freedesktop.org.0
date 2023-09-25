Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD4D7AD617
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 12:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E70410E22C;
	Mon, 25 Sep 2023 10:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1F110E22C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 10:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1695638097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N1XjsbOLUrCaYG/ML8RqCAw8B02xn80IeyAz4zoZb9Y=;
 b=oNfvTMtcislzH9Ifjxb2kICyDM7Yvdu+tCyTVcsD2IWGrPS7P170n5oXZ9iwjpg4lWC3JR
 qaiCu1j2jAoRky8Vzeu4xZy34IlMwZpSbKmo6BQfmQTDQCOK1FV0n00I5L0OvoYZkL9p+e
 UG8sL/xV9Y5PXI9wwM9CrNU1huQFVOU=
Message-ID: <a8a68baa0b1abfaeb9aa51d0095f4a4a62ec65fd.camel@crapouillou.net>
Subject: Re: [RFC PATCH v3 4/7] drm/panel: nv3052c: Add Fascontek FS035VG158
 LCD display
From: Paul Cercueil <paul@crapouillou.net>
To: John Watts <contact@jookia.org>
Date: Mon, 25 Sep 2023 12:34:55 +0200
In-Reply-To: <ZRFXd3F7eit7x4aJ@titan>
References: <20230925021059.451019-1-contact@jookia.org>
 <20230925021059.451019-5-contact@jookia.org>
 <ebd5808fe3029e46376aea3c25d3770a6b406fdc.camel@crapouillou.net>
 <ZRFRFXCKTIb9x7GW@titan>
 <d63b2a7bf2bbabe41b8e45a6c0a4dc0b1e117bdd.camel@crapouillou.net>
 <ZRFXd3F7eit7x4aJ@titan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le lundi 25 septembre 2023 =C3=A0 19:48 +1000, John Watts a =C3=A9crit=C2=
=A0:
> On Mon, Sep 25, 2023 at 11:43:26AM +0200, Paul Cercueil wrote:
> > From what I can see, you have a panel with a NV3052C chip, so the
> > existing initialization sequence should already work.
>=20
> It has some differences that I don't know if are important.

Unless you can explain what they do and why they are needed, I'd say
they are not important :)

>=20
> > The NV3052C datasheet does not give any settings for a 640x480
> > panel, I
> > only see suggested settings for a 720x1280 vertical panel.
> >=20
> > Unless you have a min/max range specified, the values you see in
> > there
> > are only suggestions for a working setup, that doesn't mean they
> > are
> > the only recommended ones.
>=20
> The panel datasheet has these values.

Again, doesn't mean that you have to use these.

From what I can see, all you need to support your Fascontek panel with
the nv3052c driver, is to add the SPI ID and compatible strings.

Cheers,
-Paul
