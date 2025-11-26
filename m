Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F129C88C8B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 09:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28A610E22E;
	Wed, 26 Nov 2025 08:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="B4dNaGew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com
 [136.143.184.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE0C10E22E
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 08:57:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764147438; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JcI9g0P8uUthq8kwFB86RLLnZ2Vl0mmgpzPBdPOtxjuqutgFgmREVT3G8qkwHkL6vC/DYxpO+fK1EFSBkpAtZ2dHPxsfUvpmOBYETUZzT99NI3lba6wmsErp2hDmCQko6DMpsgKhG7oZSDIOppRqu3J5Ya2gorBedgwOIEZVJVw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764147438;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vjRZmnhqtqpfKrBi5Q+r59FbrMRkIRC2v3OLJ/v0sWc=; 
 b=PV/A6MLuzpM2oGtL6xt7ONONRY4/AsZSUWPqaKjdOsta0I6Ra3bmSVxMxU06L7NIO45N+5JmBNGVdg/oi86XtLl4kzLqGk35Yi8IBsY3Qjl6mwx7Tw7BX4YOKZUnbFaxzbf/76YAoguAPAdaDG0QPf47bExD0L53eqq1uSflSBc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764147438; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=vjRZmnhqtqpfKrBi5Q+r59FbrMRkIRC2v3OLJ/v0sWc=;
 b=B4dNaGewZpT048lvXVnnDC+SyFZsl9cky/QgG8UJw5tsblBoeIFRpxJCUnAtUQ93
 cvb6exVJXXpoGv7DG/IF2L35XfLEF05j+VPdbgApEnt+AZhhrvj1aaNj7Zh4fiUKoJN
 5NgoDKN8QXKd8AtHWoJRYXleMiR0amZTDqOqSSxFgLXJH0Q8+QRzvrqA0V3Ns4tIm1r
 khBRadtUsCaDdIuN0wnPYIfesA5C5BpPvYuk3ZY+IYq7h1dsQFgM8QRurgago8RutQS
 fwVwIg6FzbmtH5gkBeij7BKdZ9xeOglK5cYQzWJ19Ay3U3O0bHqz7qZ3Nm8g2QnSuaf
 3yx/IDR08A==
Received: by mx.zohomail.com with SMTPS id 1764147434759601.659033320605;
 Wed, 26 Nov 2025 00:57:14 -0800 (PST)
Message-ID: <e2b72b8ef4c2911c4ea44a80f42182bbc78d5626.camel@icenowy.me>
Subject: Re: [PATCH RESEND v3 2/9] dt-bindings: display: add verisilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski
 <m.wilczynski@samsung.com>, Han Gao <rabenda.cn@gmail.com>, Yao Zi
 <ziyao@disroot.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Wed, 26 Nov 2025 16:57:04 +0800
In-Reply-To: <20251126-gifted-zircon-ibex-a9f1d8@kuoka>
References: <20251126045233.218286-1-zhengxingda@iscas.ac.cn>
 <20251126045233.218286-3-zhengxingda@iscas.ac.cn>
 <20251126-gifted-zircon-ibex-a9f1d8@kuoka>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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

=E5=9C=A8 2025-11-26=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 09:51 +0100=EF=BC=
=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, Nov 26, 2025 at 12:52:26PM +0800, Icenowy Zheng wrote:
> > From: Icenowy Zheng <uwu@icenowy.me>
> >=20
> > Verisilicon has a series of display controllers prefixed with DC
> > and
> > with self-identification facility like their GC series GPUs.
> >=20
> > Add a device tree binding for it.
> >=20
> > Depends on the specific DC model, it can have either one or two
> > display
> > outputs, and each display output could be set to DPI signal or "DP"
> > signal (which seems to be some plain parallel bus to HDMI
> > controllers).
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > ---
>=20
> You already received review on this. Don't send the same. Read the
> review.

Please see the sender (mail header From) of this time.

>=20
> NAK
>=20
> Best regards,
> Krzysztof
>=20

