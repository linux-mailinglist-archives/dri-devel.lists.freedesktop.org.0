Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C937154B1
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 07:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DF110E339;
	Tue, 30 May 2023 05:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1719310E339
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 05:04:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1685423027; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BHQkkWTAEr80M8lLmn638j1SsCDJ8tWONl9EP+zlrhSaXusGQavWAA1HAvLz6rzlydFDJliwPVSogf9K49Jrt2rPepOW6dDVs7itaVa2uYbiqUFxeP9xC18+VIVicy9OP9dn3EvbY8xYW6KAkkNrl6rI+EnrsmwX3AMHqSDV3T0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1685423027;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=uNmD0Xv70JaEayy56+RdfAQyK0HPDkKOKowbsAERT+s=; 
 b=imaaRTO7sMYIVbRDcAQSkEkNmVSjgAwBwW9AAp+RvAiKbh3IZnNPy49saesVsfGaBgITwEyA0qq0I8z/PYZmrIYX2YklCHER9T78EHRNlT09sOm0rLlRjMr8p5/YkZcWUs+/GQ995a3u7X3TYmlz73HeokW8XDMdf9H7VvQKX80=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685423027; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=uNmD0Xv70JaEayy56+RdfAQyK0HPDkKOKowbsAERT+s=;
 b=Hm79fKiieyxgpF7XgjhzkGDXE4Ekr2K5Nm10fJNvEv+aX1AeSpAk6kSMJrKF6vHv
 e5mq6QAUhwpU8dt6ZqybNhGaYM5r5GCe6SAK73p6XdEgX44Vgcs+1mCnEir2HzAaTka
 bdrNvAdKRMTZTcVaOLFmS1mKxnTpKItEmikmoFaQ1b2qSzhi7gMLHtT7ZvaKDkI9nUs
 KOOpQiF1vmxg7/XAyFFcsBLG12z5EZjaUGfTJW2kWyWJfGtRBtwgPM+E8KR8p0oYN9e
 nikXRztFB46nzbcZEO0i5LRBKtMdfndvFOCAfLAKbbELOC5mvpXbSdXy+58qvpxysUv
 ohwrrYe7yg==
Received: from edelgard.fodlan.icenowy.me (120.85.97.71 [120.85.97.71]) by
 mx.zohomail.com with SMTPS id 168542302470190.09283881679414;
 Mon, 29 May 2023 22:03:44 -0700 (PDT)
Message-ID: <d23b9b5defeb9399436df0674a04dfd2f90aad73.camel@icenowy.me>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-elm: remove panel model
 number in DT
From: Icenowy Zheng <uwu@icenowy.me>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Doug Anderson
 <dianders@chromium.org>,  Pin-yen Lin <treapking@chromium.org>
Date: Tue, 30 May 2023 13:03:39 +0800
In-Reply-To: <3069dcf7-28e0-e7f6-11d5-9bc286d7d6e3@gmail.com>
References: <20230526100801.16310-1-uwu@icenowy.me>
 <CAD=FV=UxrFVZXn+dtgamttTVopWMSVbxYsHCGG_tS+3OTXbHiw@mail.gmail.com>
 <f4a9e090-3712-200e-bd09-70090c9cccbc@collabora.com>
 <6996788b112f4795d2930a6664b3152cd9a380a8.camel@icenowy.me>
 <3069dcf7-28e0-e7f6-11d5-9bc286d7d6e3@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=E5=9C=A8 2023-05-29=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 18:28 +0200=EF=BC=
=8CMatthias Brugger=E5=86=99=E9=81=93=EF=BC=9A
>=20
>=20
> On 29/05/2023 10:45, Icenowy Zheng wrote:
> > =E5=9C=A8 2023-05-29=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 10:02 +0200=EF=
=BC=8CAngeloGioacchino Del Regno=E5=86=99=E9=81=93=EF=BC=9A
> > > Il 26/05/23 16:24, Doug Anderson ha scritto:
> > > > Hi,
> > > >=20
> > > > On Fri, May 26, 2023 at 3:09=E2=80=AFAM Icenowy Zheng <uwu@icenowy.=
me>
> > > > wrote:
> > > > >=20
> > > > > Currently a specific panel number is used in the Elm DTSI,
> > > > > which
> > > > > is
> > > > > corresponded to a 12" panel. However, according to the
> > > > > official
> > > > > Chrome
> > > > > OS devices document, Elm refers to Acer Chromebook R13,
> > > > > which, as
> > > > > the
> > > > > name specifies, uses a 13.3" panel, which comes with EDID
> > > > > information.
> > > > >=20
> > > > > As the kernel currently prioritizes the hardcoded timing
> > > > > parameters
> > > > > matched with the panel number compatible, a wrong timing will
> > > > > be
> > > > > applied
> > > > > to the 13.3" panel on Acer Chromebook R13, which leads to
> > > > > blank
> > > > > display.
> > > > >=20
> > > > > Because the Elm DTSI is shared with Hana board, and Hana
> > > > > corresponds to
> > > > > multiple devices from 11" to 14", a certain panel model
> > > > > number
> > > > > shouldn't
> > > > > be present, and driving the panel according to its EDID
> > > > > information is
> > > > > necessary.
> > > > >=20
> > > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > > ---
> > > > > =C2=A0=C2=A0 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
> > > > > =C2=A0=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > We went through a bunch of back-and-forth here but in the end
> > > > in
> > > > the
> > > > ChromeOS tree we have "edp-panel" as the "compatible" here in
> > > > the
> > > > ChromeOS 5.15 tree and this makes sense.
> > > >=20
> > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > >=20
> > > > ...in theory one would wish for a "Fixes" tag, but I think in
> > > > previous
> > > > discussions it was decided that it was too complicated.
> > > > Hardcoding
> > > > the
> > > > other compatible string has always been technically wrong, but
> > > > I
> > > > guess
> > > > it worked at some point in time. The more correct way (as
> > > > you're
> > > > doing
> > > > here) needs the DP AUX bus support and the generic eDP panels,
> > > > both
> > > > of
> > > > which are significantly newer than the elm dts. So I guess
> > > > leaving
> > > > no
> > > > "Fixes" tag is OK, or perhaps you could do the somewhat weak:
> > > >=20
> > > > Fixes: c2d94f72140a ("arm64: dts: mediatek: mt8173-elm: Move
> > > > display
> > > > to ps8640 auxiliary bus")
> > >=20
> > > I remember I didn't change the compatible to panel-edp because it
> > > didn't
> > > work at that time, but it does now... I'm not sure what actually
> > > fixed that
> > > and if the commit(s) was/were backported to that suggested point,
> > > so
> > > I
> > > would leave the Fixes tag out, as that may break older kernel.
> >=20
> > Well at least I developed this patch on v6.3.
> >=20
> > (In fact the same kernel config do not boot to system at all on
> > v6.0/v6.1 when I do make olddefconfig then build)
> >=20
>=20
> I applied the patch without the fixes tag. Lets stay on the secure
> side to not=20
> break older kernels.

Well I think this patch is at least meaningful to get backported to
v6.3.

Should we cc stable@vger.kernel.org ?

>=20
> Regards,
> Matthias
>=20
> > >=20
> > > Anyway, for this commit:
> > >=20
> > > Reviewed-by: AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com>
> >=20

