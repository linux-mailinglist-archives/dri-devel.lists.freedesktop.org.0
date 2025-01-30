Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D589A22CDC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 13:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DFE10E944;
	Thu, 30 Jan 2025 12:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b="Xy6QLsBv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B02910E944
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2025 12:15:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1738239343; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kUKLD131ujnf9MGxdR4qc0pAWhSJI16fuG3rsd7YkP9WoGJOl3ngEVtMmhHhRaDgMOl+qDKC1FktFleXTsoNQnexiVnZI6rgnMTjpTiR41qM8906YQSNDpOVIaiR0/h7YMSqzyr/srfN9nZSBj/IUYjYEnNrT6SEOX5cK6cfhc0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1738239343;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vtqvkjW++P13EILfu6kPduF5HHVIDhPG3bCc05q2yIw=; 
 b=RN52rTs/CG5wK9wqAIr1XIzrinACSwAq/TPtbhYbeFWdW02NSPaSKMJ22qRzI7AYNGXdVMaVHxrgx9J0OZ4JVwpM+a0RUgmi1hvWVD/uUZDLBds05yon9a/2VmgBiD3zSWquGaP6ZY4SEn9rqgDkwWKYkdXWMt2mNakHmzJ7WxU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
 dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738239343; 
 s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=vtqvkjW++P13EILfu6kPduF5HHVIDhPG3bCc05q2yIw=;
 b=Xy6QLsBv399RQrHj3yLnO4xSaVy1gQtccoGnHwsh1kT7Z3gRzhZp81Oul7fJFv2F
 oLiyxt2zC0WDndQG+BnhKMXGik3kSVOB/qb3v0vAF6Ye/Q/ImQkn7g8MWPVPN+jSNcy
 UGtwIHj4VbItttr+CjWKeQPcD3f6ArGfn5ryfpd8=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1738239340867764.380040312308;
 Thu, 30 Jan 2025 04:15:40 -0800 (PST)
Date: Thu, 30 Jan 2025 13:15:40 +0100
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Boris Brezillon" <boris.brezillon@collabora.com>,
 "Steven Price" <steven.price@arm.com>, "kernel" <kernel@collabora.com>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "devicetree" <devicetree@vger.kernel.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek" <linux-mediatek@lists.infradead.org>
Message-ID: <194b7237128.10f9923a41656565.5574753983898665940@collabora.com>
In-Reply-To: <20250118-meticulous-black-caracal-ec7f0d@krzk-bin>
References: <20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com>
 <20250116-mt8370-enable-gpu-v1-2-0a6b78e925c8@collabora.com>
 <20250118-meticulous-black-caracal-ec7f0d@krzk-bin>
Subject: Re: [PATCH 2/3] drm/panfrost: Add support for Mali on the MT8370 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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

Hello,

sorry for the delay,

 ---- On Sat, 18 Jan 2025 17:08:10 +0100  Krzysztof Kozlowski  wrote ---=20
 > On Thu, Jan 16, 2025 at 03:25:58PM +0100, Louis-Alexis Eyraud wrote:
 > > This commit adds a compatible for the MediaTek MT8370 SoC, with an
 > > integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core), and adds
 > > platform data using the same supplies and the same power domain lists
 > > as MT8186 (one regulator, two power domains).
 > >=20
 > > Signed-off-by: Louis-Alexis Eyraud louisalexis.eyraud@collabora.com>
 > > ---
 > >  drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++++
 > >  1 file changed, 10 insertions(+)
 > >=20
 > > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm=
/panfrost/panfrost_drv.c
 > > index 0f3935556ac761adcd80197d87e8e478df436fd5..1d51b64ed0f0660cc95263=
a289d5dad204540cfd 100644
 > > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
 > > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
 > > @@ -837,6 +837,15 @@ static const struct panfrost_compatible mediatek_=
mt8192_data =3D {
 > >  =C2=A0=C2=A0=C2=A0=C2=A0.pm_features =3D BIT(GPU_PM_CLK_DIS) | BIT(GP=
U_PM_VREG_OFF),
 > >  };
 > > =20
 > > +/* MT8370 uses the same power domains and power supplies as MT8186 */
 > > +static const struct panfrost_compatible mediatek_mt8370_data =3D {
 > > +=C2=A0=C2=A0=C2=A0=C2=A0.num_supplies =3D ARRAY_SIZE(mediatek_mt8183_=
b_supplies) - 1,
 > > +=C2=A0=C2=A0=C2=A0=C2=A0.supply_names =3D mediatek_mt8183_b_supplies,
 > > +=C2=A0=C2=A0=C2=A0=C2=A0.num_pm_domains =3D ARRAY_SIZE(mediatek_mt818=
6_pm_domains),
 > > +=C2=A0=C2=A0=C2=A0=C2=A0.pm_domain_names =3D mediatek_mt8186_pm_domai=
ns,
 > > +=C2=A0=C2=A0=C2=A0=C2=A0.pm_features =3D BIT(GPU_PM_CLK_DIS) | BIT(GP=
U_PM_VREG_OFF),
 > > +};
 >=20
 > No, people, stop this nonsense. This is exactly the same as previous.
 > Don't duplicate entries just because you want a commit.
 >=20
I added this new compatible in bindings and panfrost driver because there w=
ere no other matching compatible=20
Using another mali-vallhal-jm compatible would make the driver probe fail b=
ecause of power domains number difference.=20
Using mt8186-mali compatible would work without modifications but as it is =
not the same architecture (mali-bifrost), it would be incorrect.

I've also misguessed on the dt_match array modifications, sorry.
I'll amend this patch in order to reuse the mt8186 platform data instead.

 > > +
 > >  static const struct of_device_id dt_match[] =3D {
 > >  =C2=A0=C2=A0=C2=A0=C2=A0/* Set first to probe before the generic comp=
atibles */
 > >  =C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "amlogic,meson-gxm-mali",
 > > @@ -859,6 +868,7 @@ static const struct of_device_id dt_match[] =3D {
 > >  =C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "mediatek,mt8186-mali", .da=
ta =3D &mediatek_mt8186_data },
 > >  =C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "mediatek,mt8188-mali", .da=
ta =3D &mediatek_mt8188_data },
 > >  =C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "mediatek,mt8192-mali", .da=
ta =3D &mediatek_mt8192_data },
 > > +=C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "mediatek,mt8370-mali", .da=
ta =3D &mediatek_mt8370_data },
 >=20
 > No, express properly compatibility or say in bindings commit msg why
 > devices are not compatible.
 >=20
I'll reword in V2 the commit messages to make the compatible need more expl=
icit.

 > Best regards,
 > Krzysztof
 >=20
 >=20

Regards,
Louis-Alexis Eyraud
