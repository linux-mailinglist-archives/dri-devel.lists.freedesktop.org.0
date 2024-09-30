Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4563E98998B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 05:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D1410E2C4;
	Mon, 30 Sep 2024 03:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.b="QeQhHvEv";
	dkim=permerror (0-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="XOZkiOAM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1257610E2C4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 03:39:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1727667521; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=GXjItPiKT9uG7F08yrY3tHL9cf8Iw+odIT+nD6SFQw0B3FbG0K2WjyW2mXZkytucHI
 YmWCoF/Pf49JrpvCPzXw5blvr/eXEoaGGQ7yR1M8offoMH+uuTe3xDcWe2EEpZAyf9ut
 nCLdk6mnBQKd6AYErEf1+yJ+j481u8vbpGF10+eeG//NojMnoafd7egaxkC/iF8kL1W1
 gIy0E444xaps5uCq4FAGUyZMPZDOmZCc+o4jwqZq1rkxQh14V39o2ug9VwSHykl8dpX9
 9hyfgxV910Xo5/MM62rf1h8rmdfqwRSnLrdvodF6cBtM8U99Ysx5gI92wwBYineVUuZz
 Ox/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1727667521;
 s=strato-dkim-0002; d=strato.com;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=vN/joSxsscuq8xTOS5QrFXVe/E83bOhifjrslcJewss=;
 b=EiP5bWNuYologHGOMgkBO2o2kmsv4Dlfo0ES4Lpdt02+0YO8vVpIQyNM8Se+w9QbOb
 mv9WPaXMmXijn4YFCb5vaC/8CRvea9TXTFaNrEXmudgDtQ/mjne91jXCdxlT4G9l85tk
 Svft+IbLrfwzzk7uv4DpQUdRUM1LsGPBKD4PNzIex2xxvXtLU5xAEOziWhFdkf4PM5bc
 PAC5r2lz656JGiN+761C0se9Yp5enpMQr0oy0wFTI4Mxm/XlIoBnBXo12HJwVYzzSAqi
 Fa6AAgeKlq9Kc0pedFwZoXAC51nlFI7TvBlTcfzcHFIsSwlMY4qGS7r86vRMHvd8jHF+
 4Vzw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1727667521;
 s=strato-dkim-0002; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=vN/joSxsscuq8xTOS5QrFXVe/E83bOhifjrslcJewss=;
 b=QeQhHvEvp0sPXfLgfyF1IahpjvVrn07IcpnAVPYy/+8Pi0jbk1xbKA4R653QTFdJfv
 nvoZsdlIbdSq6mTpQf/SI4cakwo7Def2B+ysg8570/LfXbyAvZqtVJ8nl3eLx1T0ux87
 35cndOEEZH1IYqNWo0v+kntB08Sg6ndUcjPuXnbDvI+eI3l1f0lDmAOjIrawKKoC/PGo
 geHt7bT1/ItXNtS2bMs2VO3mujyQzj1I8/xRq2KPcImmf1bd8mip1WKpYbcZmUi2B7Cc
 zz3UMUo9SQokQ662I1nen4LQ4iBbOfNh3M0dtclN/AtSa44KrSFjzI1yUpa1w9Vzps1z
 RWKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1727667521;
 s=strato-dkim-0003; d=xenosoft.de;
 h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
 From:Subject:Sender;
 bh=vN/joSxsscuq8xTOS5QrFXVe/E83bOhifjrslcJewss=;
 b=XOZkiOAMGkCw9o07aivF08eQOZLL0o169+3DkRZCkyYtYAo+sJbvdCxNZwOdultNWO
 9Hlkmw/7ciEFmIu41rBQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7Vpq0s3mSXHagypRTj2U+/aY7GigIdl/mSHO/"
Received: from smtpclient.apple by smtp.strato.de (RZmta 51.2.8 AUTH)
 with ESMTPSA id e0da1a08U3cePP6
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 30 Sep 2024 05:38:40 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-8C172D51-DE26-46A3-805D-358433D1E81B
Content-Transfer-Encoding: 7bit
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
Date: Mon, 30 Sep 2024 05:38:29 +0200
Message-Id: <EAA3868D-0DC5-438B-ACD6-11EE3ECCA63C@xenosoft.de>
References: <396DA24A-85A6-419B-8E90-9A05EF608C41@xenosoft.de>
Cc: Maling list DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Darren Stevens <darren@stevens-zone.net>, hypexed@yahoo.com.au,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <396DA24A-85A6-419B-8E90-9A05EF608C41@xenosoft.de>
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailer: iPhone Mail (22A3354)
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


--Apple-Mail-8C172D51-DE26-46A3-805D-358433D1E81B
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On 26 September 2024 at 6:38pm, Christian Zigotzky <chzigotzky@xenosoft.de=
> wrote:
>=20
> =EF=BB=BFOn 26 September 2024 at 5:50pm, Alex Deucher wrote:
>=20
> Can you attach your dmesg output?  There was a regression in the dma
> subsystem what was fixed by this commit:
>=20
> commit b348b6d17fd1d5d89b86db602f02be
> a54a754bd8
> Author: Leon Romanovsky <leon@kernel.org>
> Date:   Sun Sep 22 21:09:48 2024 +0300
>=20
>   dma-mapping: report unlimited DMA addressing in IOMMU DMA path
>=20
> Alex
>=20
> =E2=80=94=E2=80=94=E2=80=94-
>=20
> Hello Alex,
>=20
> This issue is gone.
>=20
> Thanks for the information,
>=20
> Christian

Unfortunately, the issue still exists.

dmesg: https://www.xenosoft.de/PuTTY_P5040_U-Boot.log=

--Apple-Mail-8C172D51-DE26-46A3-805D-358433D1E81B
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><blockquote type=3D"cite">On 26 September 2024 at 6:38pm, Christian Zigotzk=
y &lt;chzigotzky@xenosoft.de&gt; wrote:<br><br></blockquote></div><blockquot=
e type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On 26 September 2024 at 5:50=
pm, Alex Deucher wrote:</span><br><span></span><br><span>Can you attach your=
 dmesg output? &nbsp;There was a regression in the dma</span><br><span>subsy=
stem what was fixed by this commit:</span><br><span></span><br><span>commit b=
348b6d17fd1d5d89b86db602f02be</span><br><span>a54a754bd8</span><br><span>Aut=
hor: Leon Romanovsky &lt;leon@kernel.org&gt;</span><br><span>Date: &nbsp;&nb=
sp;Sun Sep 22 21:09:48 2024 +0300</span><br><span></span><br><span> &nbsp;&n=
bsp;dma-mapping: report unlimited DMA addressing in IOMMU DMA path</span><br=
><span></span><br><span>Alex</span><br><span></span><br><span>=E2=80=94=E2=80=
=94=E2=80=94-</span><br><span></span><br><span>Hello Alex,</span><br><span><=
/span><br><span>This issue is gone. </span><br><span></span><br><span>Thanks=
 for the information,</span><br><span></span><br><span>Christian</span></div=
></blockquote><br><div>Unfortunately, the issue still exists.</div><div><br>=
</div><div>dmesg:&nbsp;<a href=3D"https://www.xenosoft.de/PuTTY_P5040_U-Boot=
.log">https://www.xenosoft.de/PuTTY_P5040_U-Boot.log</a></div></body></html>=

--Apple-Mail-8C172D51-DE26-46A3-805D-358433D1E81B--
