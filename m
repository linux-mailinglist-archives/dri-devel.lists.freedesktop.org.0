Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B743EC89046
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681E810E237;
	Wed, 26 Nov 2025 09:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="GuoOtMI5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com
 [136.143.184.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2727A10E237
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:41:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764150109; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fQBxAXM9o4uD7mKSWOWobL1/ZdnY+XQbfKv1vZ6rTRPzjKDaHeZrpkSXPAta7rI9UYfGQfYaiHGcm4zZzsrJUbe/YSv/5/XIoWELyYGcOmBNRhNSlBMXdzGVs7ID9Fwlm/Gmk670rXZs1jAA7w8NAEfUsWFf7lN/oVTsDlYTkQA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764150109;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HCrXWcCJcuxzIq0iHhld0Os9jJmomNGWdXQFSCiiukQ=; 
 b=Qu4Gvhj4dSxRhdg16XEqh7T7j0fa2PB0tz1AJgQr0Iwk/5pTheiSzmGdIPnfuafXccBrNls+KYdd/rq9EEY9loOUdD0EjMZ2Wn/WsNTvAcWu4KSMbuUrxu2rveia68Kyf5hRFWjIkSv3iI5CIHtssCyjxAhq7TLoQrIS6Xtf/lg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764150109; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=HCrXWcCJcuxzIq0iHhld0Os9jJmomNGWdXQFSCiiukQ=;
 b=GuoOtMI51ArFwAwWNXFwtknkxYHunWqeynp9ETTHYp93VhUqA9PlnMkRwE+ZPI70
 Jqj886oyv3UKkPNNm+Bdd+QUpH152ZDSKh1X4CVwc0RY/gSkMb7JgkMcniXFlTjPETi
 miDWY/w0OktfRSomKQBXXwS0vv/NRpMETejhKD7ZbNFaCr+j/J6ROTSEoZ61vvXVZ5O
 yuDeCAQhkg5E0spxe0MSeK27T+pRSRGgqIs4bJIvv9EhFlrwEQfZIOof7ji/eMGJQXW
 c4j7Zpwu9UH6htZENs6EeD6v/lcKR+6w/5yeHVt5xHOP7By+Fmz+T0+vOLH5CwZ6dMB
 1w86gnl0JA==
Received: by mx.zohomail.com with SMTPS id 1764150105282785.1586241129531;
 Wed, 26 Nov 2025 01:41:45 -0800 (PST)
Message-ID: <001154b743b9f8364e96b3ebf791ef9920bbfa03.camel@icenowy.me>
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
Date: Wed, 26 Nov 2025 17:41:35 +0800
In-Reply-To: <b57207ab-a69e-4dad-98ca-f4923cebdf81@kernel.org>
References: <20251126045233.218286-1-zhengxingda@iscas.ac.cn>
 <20251126045233.218286-3-zhengxingda@iscas.ac.cn>
 <20251126-gifted-zircon-ibex-a9f1d8@kuoka>
 <e2b72b8ef4c2911c4ea44a80f42182bbc78d5626.camel@icenowy.me>
 <b57207ab-a69e-4dad-98ca-f4923cebdf81@kernel.org>
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

=E5=9C=A8 2025-11-26=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 10:37 +0100=EF=BC=
=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> On 26/11/2025 09:57, Icenowy Zheng wrote:
> > =E5=9C=A8 2025-11-26=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 09:51 +0100=EF=
=BC=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> > > On Wed, Nov 26, 2025 at 12:52:26PM +0800, Icenowy Zheng wrote:
> > > > From: Icenowy Zheng <uwu@icenowy.me>
> > > >=20
> > > > Verisilicon has a series of display controllers prefixed with
> > > > DC
> > > > and
> > > > with self-identification facility like their GC series GPUs.
> > > >=20
> > > > Add a device tree binding for it.
> > > >=20
> > > > Depends on the specific DC model, it can have either one or two
> > > > display
> > > > outputs, and each display output could be set to DPI signal or
> > > > "DP"
> > > > signal (which seems to be some plain parallel bus to HDMI
> > > > controllers).
> > > >=20
> > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > ---
> > >=20
> > > You already received review on this. Don't send the same. Read
> > > the
> > > review.
> >=20
> > Please see the sender (mail header From) of this time.
>=20
> This improved. I am speaking about the rest of review.

Well this is why this is a v3 resend, not v4.

I will address these issues in v4.

>=20
> Best regards,
> Krzysztof

