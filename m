Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C617C81F35
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 18:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A1A10E319;
	Mon, 24 Nov 2025 17:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="bUM4wSpa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com
 [136.143.184.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF0A10E319
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 17:42:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1764006172; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mRcQ5ve7JHZHinstf9NI2Oj36spdkoBiQzNiEcGdBBjdZ86V2mfBVZEWDFczaRGnMEvPE1oJW0pluSaWkt59CpnjujmiyYWgHh9fR6yVHcUYc9V3CMp8RaOmxRlF9MRBHwryTq5lBww1LDX9xTYVwt5e+MIKxMN20xDh6GpYUtw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1764006172;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=yHr20q7gZmlTABXvQBRAafWej6u9u+HA61XCNH7omz8=; 
 b=baFxRBuUVTDioclaCIGhUX48wGAmFUYVSBbGGhkQ7trMtubU2EkTRg4Vh5/WxqTEjj3nCeAgH2m/3rdbiM6socREZcKA9sFNNLW2l36qqqT8ADuPnvClw0Il4uQc2issZYtk/oj+eyDboP7JbRz3SbhjQPtF2dzdqRZ5QGmm5bc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764006172; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=yHr20q7gZmlTABXvQBRAafWej6u9u+HA61XCNH7omz8=;
 b=bUM4wSpao8IwcIBLAsnlh+VQiF6ZdfyOs1a4mlAFAh+2RXMmh6zPsyZEjEU0crZD
 4L6oahLGTkkjji5UMRujwKTU4YQcKZW5vJoIuScQOSR+nGrw9hn1+gBS8Nd2M1XNZqn
 TEBnSmNaO8R9lG1hcua83TyNOCKlkuJpS7PxmiPBT0Hfw+sZ8oZGzajlSzIbKpvntQ0
 2u5wgOz+NecxFhAJOz+EIqjvJm+pEympFizvUGj97Hn287baDkzPDDAj2QKJbPuzfgs
 L+CV+OarPZq91gseemZ9Nf4G0JyDmqeRDhi0kPcr/TOQvCiXdgd+ajUoKfMIuFwMwsJ
 bM1dP5C5ng==
Received: by mx.zohomail.com with SMTPS id 1764006170521583.7022266150989;
 Mon, 24 Nov 2025 09:42:50 -0800 (PST)
Message-ID: <920b6864f30777640ebaceee1808e96978e6161a.camel@icenowy.me>
Subject: Re: [PATCH v3 2/9] dt-bindings: display: add verisilicon,dc
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
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
Date: Tue, 25 Nov 2025 01:42:41 +0800
In-Reply-To: <ee1e4f94-ff9a-4227-b705-74a7eb806ff0@kernel.org>
References: <20251124105226.2860845-1-uwu@icenowy.me>
 <20251124105226.2860845-3-uwu@icenowy.me>
 <d4cfe8bb-5ca2-40a9-bfe0-96e7ded5586c@kernel.org>
 <f7bbb57180866a0674fc1d72d4bd3279c7b1c1e9.camel@icenowy.me>
 <c26dabfb-c4af-428b-a1d4-d626f37ff559@kernel.org>
 <f944f0b28f62233b1874e0f00c0a130d71845417.camel@icenowy.me>
 <6ceb41bc-0597-4ea5-84be-51f53e3bc2d8@kernel.org>
 <20251124-said-overvalue-8a8f49d6c99d@spud>
 <477bbcbe-17d9-40ae-be10-be4fd107687e@kernel.org>
 <20251124-pulp-pound-a2b6d749dcfc@spud>
 <390caea1-bc75-4cde-bd6d-9bc15a12f32d@kernel.org>
 <a8089e458bdf6fbad45cd6be838b4cf75396918f.camel@icenowy.me>
 <ee1e4f94-ff9a-4227-b705-74a7eb806ff0@kernel.org>
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

=E5=9C=A8 2025-11-24=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 18:40 +0100=EF=BC=
=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> On 24/11/2025 16:25, Icenowy Zheng wrote:
> > =E5=9C=A8 2025-11-24=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 13:31 +0100=EF=
=BC=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> > > On 24/11/2025 13:20, Conor Dooley wrote:
> > > > On Mon, Nov 24, 2025 at 01:08:00PM +0100, Krzysztof Kozlowski
> > > > wrote:
> > > > > On 24/11/2025 13:05, Conor Dooley wrote:
> > > > > >=20
> > > > > > I don't really get what the fuss is with the dual signoff,
> > > > > > what's the
> > > > > > point having both when they represent the same person?
> > > > > > Pretty
> > > > > > sure it
> > > > > > was you (Krzysztof) and Arnd that told me not to both doing
> > > > > > the
> > > > > > double
> > > > > > signoff.
> > > > >=20
> > > > > I do not object having or not having dual signed off HERE.
> > > > >=20
> > > > > I never said that. Just like I never said "From" has to be
> > > > > changed.
> > > >=20
> > > > I didn't say you objected to both being there. *I* am saying
> > > > that
> > > > it is
> > >=20
> > > Ah, sure. Yes, if both identities work I would propose to skip
> > > second
> > > SoB. But I also stopped objecting of having two identities
> > > listed, as
> > > long as they are correct.
> >=20
> > Well it's unfortunate that some policy now requires me to list the
> > second identity.
>=20
> No policy asked you...

Local policy here, sigh...

>=20
> >=20
> > Should I resend the whole patchset with the ISCAS mail?
>=20
> You can, it probably would solve the issue, unless you change the
> author, but why you cannot do what I asked at the beginning - set
> correct order of SoBs, so the @icenowy.me being the last?

Well because previous revisions of the patch comes with only
@icenowy.me SoB, and I think SoB is append-only...

>=20
>=20
> Best regards,
> Krzysztof

