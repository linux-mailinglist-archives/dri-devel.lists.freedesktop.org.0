Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B40508227BB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 05:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB1A10E071;
	Wed,  3 Jan 2024 04:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D668C10E071
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 04:10:19 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4T4bpx2l20z9vy5;
 Wed,  3 Jan 2024 04:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1704255018; bh=Q4QSWB4lpoWhI6LvZXYA/LFlYxYL0e3ql56uc4uLsUs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TRxxtCGuzWmXNaAyM/tnH6YN8e4sGhtY9nP3iz88vSpD56P+4Qi2Tuvp0NK5lDUuJ
 MkIRN4QDAyPnJK2KNAhtazIXRQFS5kuVTv01x00IeB5G7lFl6JxNF7zMyjnsUfxg1X
 siFJKtKYGbllHXv/M9T69EGCSNLXfD9fW+12UtYw=
X-Riseup-User-ID: 405420CC388E9EF22FE493B6FCB7CB07418DA6345B23D1C17FCD1E61398A9170
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4T4bpp3Bf5zJmps;
 Wed,  3 Jan 2024 04:10:09 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
To: =?utf-8?B?T25kxZllag==?= Jirman <megi@xff.cz>,
 Manuel Traut <manut@mecka.net>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>,
 Danct12 <danct12@riseup.net>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: Add devicetree for Pine64
 PineTab2
Date: Wed, 03 Jan 2024 04:09:55 +0000
Message-ID: <4814116.aeNJFYEL58@melttower>
In-Reply-To: <775vjfucu2g2s6zzeutj7f7tapx3q2geccpxvv4ppcms4hxbq7@cbrdmlu2ryzp>
References: <20240102-pinetab2-v3-0-cb1aa69f8c30@mecka.net>
 <20240102-pinetab2-v3-4-cb1aa69f8c30@mecka.net>
 <775vjfucu2g2s6zzeutj7f7tapx3q2geccpxvv4ppcms4hxbq7@cbrdmlu2ryzp>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

On Tuesday, January 2, 2024 6:07:56 PM UTC Ond=C5=99ej Jirman wrote:
> On Tue, Jan 02, 2024 at 05:15:47PM +0100, Manuel Traut wrote:
> > +&pcie2x1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pcie_reset_h>;
> > +	reset-gpios =3D <&gpio1 RK_PB2 GPIO_ACTIVE_HIGH>;
> > +	vpcie3v3-supply =3D <&vcc3v3_minipcie>;
> > +	status =3D "okay";
> > +};
>=20
> Does it make sense to enable this HW block by default, when it isn't used=
 on
> actual HW?
>=20

PCI-E is hooked up to a connector in the schematics, so I think it make sen=
se=20
to enable it when there's one available.


