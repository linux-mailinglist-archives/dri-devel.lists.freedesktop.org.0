Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8918B8D1F60
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 17:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4861122EB;
	Tue, 28 May 2024 15:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FbpYpfXF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FF41122E8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 15:00:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9248DCE12E8;
 Tue, 28 May 2024 15:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7ADC3277B;
 Tue, 28 May 2024 14:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716908401;
 bh=co0yewf5Nf8gH5InRBPqwfu+SsVpATT6AoAR9evNQmA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FbpYpfXFmoZ6QUldMJNidZ992oLKlxy14Awp5SWxJMJjIedQYDVhmPOOni2Xu71Po
 utr7F7jIUzSmcBAHMcT3PMknBYSPSLVShq7Xs2cY8f+q7vIALvkiJaxlr8Oh+AtiEq
 jT9SrL2msw3km1Fukl5UZiS3EAoZDzYP2/fXpamq1Zs1fXxr7+pbbk/BndtECB4qya
 s9ZYNJb1L4v0FqlMQaE+t1SK7RXTS2mNXJm+JX1nG88kWc03GFDyowZzYBbV56hKUu
 qbRsraQJLzzhobE+C14dfNkM7Chpe/AoRDz2HT5TuzzCiVjsSjxwi6OtjY94zj9M/D
 aIqz25q0Tw19A==
Date: Tue, 28 May 2024 15:59:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Jason-ch Chen =?utf-8?B?KOmZs+W7uuixqik=?= <Jason-ch.Chen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 Shawn Sung =?utf-8?B?KOWui+WtneismSk=?= <Shawn.Sung@mediatek.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH RESEND,v6 2/8] dt-bindings: mailbox: Add property for
 CMDQ secure driver
Message-ID: <20240528-herbicide-starving-3d162906914e@spud>
References: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
 <20240526144443.14345-3-jason-jh.lin@mediatek.com>
 <20240527-bullion-slapping-d35fcddb56d5@spud>
 <3541454c6f60b8a16f4930dd91173ed24c9b5fd5.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cuwqECPCpLBF9Uu6"
Content-Disposition: inline
In-Reply-To: <3541454c6f60b8a16f4930dd91173ed24c9b5fd5.camel@mediatek.com>
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


--cuwqECPCpLBF9Uu6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 02:38:46PM +0000, Jason-JH Lin (=E6=9E=97=E7=9D=BF=
=E7=A5=A5) wrote:
> Hi Conor,
>=20
> On Mon, 2024-05-27 at 18:36 +0100, Conor Dooley wrote:
> > On Sun, May 26, 2024 at 10:44:37PM +0800, Jason-JH.Lin wrote:
> > > 1. Add mboxes property to define a GCE loopping thread as a secure
> > > IRQ
> > > handler.
> > > The CMDQ secure driver requests a mbox channel and sends a looping
> > > command to the GCE thread. The looping command will wait for a
> > > secure
> > > packet done event signal from secure world and then jump back to
> > > the
> > > first instuction. Each time it waits for an event, it notifies the
> > > CMDQ driver to perform the same action as the IRQ handler.
> > >=20
> > > 2. Add gce-events property from gce-props.yaml to define a
> > > secure packet done signal in secure world.
> > > There are 1024 events IDs for GCE to use to execute instructions in
> > > the specific event happened. These events could be signaled by HW
> > > or SW
> > > and their value would be different in different SoC because of HW
> > > event
> > > IDs distribution range from 0 to 1023.
> > > If we set a static event ID: 855 for mt8188, it might be conflict
> > > the
> > > event ID original set in mt8195.
> >=20
> > Two different SoCs, two different compatibles, no problem.
> > I'm almost certain you previously told me that the firmware changing
> > could result in a different event ID, but I see no mention of that
> > here.
>=20
> Yes, it could be, but we don't use it that way.
>=20
> > The commit messages makes it seem like this can be determined by the
> > compatible, so either give me a commit message that explains why the
> > compatible is not sufficient or drop the patch.
> >=20
>=20
> Yes, this can be determined by compatible in CMDQ mailbox driver,
> so I think it's possible to put this in the CMDQ mailbox driver data
> and configure by different SoC.
>=20
> The problem is these events are defined in include/dt-
> bindings/mailbox/mediatek,mt8188-gce.h and include/dt-
> bindings/gce/mt8195-gce.h.
> I can only use them in their mt8188.dts or mt8195.dts.
>=20
> If I want to use the same event define in 2 different headers in the
> same CMDQ mailbox driver, I think I just can parse their dts to get the
> corresponding one.
> Do you know how to generally deal with this problem?
> Or I can just use the number of event ID in driver data without the
> event define in dt-bindings header.

I don't think I really understand the problem. You get the
channelid/event data from the match data, right? Is the problem that
both files define the same "word" to mean different numbers? In that
case, just define the numbers locally in the driver, you don't need to
include a binding header when there's no data sharing between dts and
kernel.

--cuwqECPCpLBF9Uu6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlXxbAAKCRB4tDGHoIJi
0n1PAQDIqzN2Y459EMSK27l5lJSPc73hebZRJ8aOWJZ6wobBRgD+I1ylKlO4SJRc
3ilhYMuDDovCE3uYaltdN+VsijtgbQo=
=SPNb
-----END PGP SIGNATURE-----

--cuwqECPCpLBF9Uu6--
