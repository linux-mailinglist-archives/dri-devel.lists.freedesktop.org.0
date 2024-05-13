Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55CE8C4516
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 18:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B433B10E85C;
	Mon, 13 May 2024 16:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YNkZuFVT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B756010E85C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:28:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF8C760ECA;
 Mon, 13 May 2024 16:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FCCC113CC;
 Mon, 13 May 2024 16:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715617715;
 bh=dreGzymTKJvTE2xPwadAY/8dXCucGzSp5e1CjkI9194=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YNkZuFVTgpilJnrk8k42qcAleha/WbDDTTi4Qgq1tTQkm/Ebiz7FPNf4ikKCYaseZ
 7N/pgS2dC5ti1KaPZSiSLdW/c6tTGcnFlO62YIXDDWkRxvldaFiXI/Srbw/GdDaOSK
 DaayMNussMq2hVzzqpQ4sQVLtgVw5hUd3e5iOowyHxXbnwpZZeSn3IPbrE4xjB9JQ5
 UEBlb/U+w8eMMvj4P/3IvFENgPyKzxEFpGfobya5R1G/vQmxTvV5/tySFTFP9RkkuQ
 cuN7q1aKqATShYTqcCv+FfOEphVxJJQx/WaucdXMtNgpqQZRnZFj3XD/7kEz30I3nC
 N/zGUS/lTIcUw==
Date: Mon, 13 May 2024 17:28:29 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Shawn Sung =?utf-8?B?KOWui+WtneismSk=?= <Shawn.Sung@mediatek.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 Jitao Shi =?utf-8?B?KOefs+iusOa2myk=?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Yu-chang Lee =?utf-8?B?KOadjuemueeSiyk=?= <Yu-chang.Lee@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
Message-ID: <20240513-papaya-bagged-8f01503b0a22@spud>
References: <4dfb09b9c437ab2baa0898eca13a43fd7475047a.camel@mediatek.com>
 <46347f5d-e09b-4e83-a5a2-e12407f442a4@collabora.com>
 <847e1a84b532956f697d24014d684c86f0b76f03.camel@mediatek.com>
 <cbf73111-a6cf-47da-9563-89d49fbdb17d@collabora.com>
 <ee721fd3339f8b3a25464ca57ca192343a51e514.camel@mediatek.com>
 <34caf545-1fc9-4905-a82f-2596f053b3ff@collabora.com>
 <de23d55dd1c84bf9b04119014c3785189ce6f9da.camel@mediatek.com>
 <c384946a-e151-4afb-82f7-d31a5a26aff6@collabora.com>
 <5b0ed6dd7190496d70fe625ac9b4539eb0181c0a.camel@mediatek.com>
 <6796f082-dfbe-45dc-bd01-3c9b4ac73865@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aZdOAVgj7H5otCBg"
Content-Disposition: inline
In-Reply-To: <6796f082-dfbe-45dc-bd01-3c9b4ac73865@collabora.com>
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


--aZdOAVgj7H5otCBg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 03:44:00PM +0200, AngeloGioacchino Del Regno wrote:
> Il 13/05/24 08:15, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) ha scritto:
> > On Fri, 2024-05-10 at 12:14 +0200, AngeloGioacchino Del Regno wrote:
> > > Il 10/05/24 11:34, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) ha scritto:
> > > > On Thu, 2024-05-09 at 11:27 +0200, AngeloGioacchino Del Regno
> > > > wrote:
> > > > > Il 09/05/24 07:42, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) ha scritto:
> > > > > > On Wed, 2024-05-08 at 15:03 +0200, AngeloGioacchino Del Regno
> > > > > > wrote:
> > > > > > > Il 08/05/24 09:19, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) ha scr=
itto:
> > > > > > > > On Tue, 2024-05-07 at 16:07 +0200, AngeloGioacchino Del
> > > > > > > > Regno
> > > > > > > > wrote:
> > > > > > > > > Il 07/05/24 08:59, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) ha=
 scritto:
> > > > > > > > > > On Thu, 2024-05-02 at 10:50 +0200, AngeloGioacchino Del
> > > > > > > > > > Regno
> > > > > > > > > > wrote:
> > > > > > > > > > > Il 25/04/24 04:23, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89=
) ha scritto:
> > > > > > > > > > > > Hi, Angelo:
> > > > > > > > > > > >=20
> > > > > > > > > > > > On Tue, 2024-04-09 at 14:02 +0200, AngeloGioacchino
> > > > > > > > > > > > Del
> > > > > > > > > > > > Regno
> > > > > > > > > > > > wrote:
> > > > > > > > > > > > > Document OF graph on MMSYS/VDOSYS: this supports
> > > > > > > > > > > > > up
> > > > > > > > > > > > > to
> > > > > > > > > > > > > three
> > > > > > > > > > > > > DDP
> > > > > > > > > > > > > paths
> > > > > > > > > > > > > per HW instance (so potentially up to six
> > > > > > > > > > > > > displays
> > > > > > > > > > > > > for
> > > > > > > > > > > > > multi-
> > > > > > > > > > > > > vdo
> > > > > > > > > > > > > SoCs).
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > The MMSYS or VDOSYS is always the first component
> > > > > > > > > > > > > in
> > > > > > > > > > > > > the
> > > > > > > > > > > > > DDP
> > > > > > > > > > > > > pipeline,
> > > > > > > > > > > > > so it only supports an output port with multiple
> > > > > > > > > > > > > endpoints -
> > > > > > > > > > > > > where
> > > > > > > > > > > > > each
> > > > > > > > > > > > > endpoint defines the starting point for one of
> > > > > > > > > > > > > the
> > > > > > > > > > > > > (currently
> > > > > > > > > > > > > three)
> > > > > > > > > > > > > possible hardware paths.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Signed-off-by: AngeloGioacchino Del Regno <
> > > > > > > > > > > > > angelogioacchino.delregno@collabora.com>

One of you guys, probably =E8=83=A1=E4=BF=8A=E5=85=89, has a mail client th=
at is completely
mangling these quotes. Can you try to fix that please? It makes reading
the thread unfun :/

--aZdOAVgj7H5otCBg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkI/rQAKCRB4tDGHoIJi
0jwnAP9uirCN5nWb54TXI+oti65ABU7175drHSW8qsorNLLmJAD+LES8EPnVXHkZ
ntqNSxhNBnabta4KQYednD8SAoWwyAw=
=uI9h
-----END PGP SIGNATURE-----

--aZdOAVgj7H5otCBg--
