Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091DA91C01A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 15:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9DE10E196;
	Fri, 28 Jun 2024 13:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k1NgNLNC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC2810E2A4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 13:57:54 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52cdf579dd2so698581e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 06:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719583073; x=1720187873; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lt9CFtU6VQjl5rQikn0RMmEwksOG2DhuVbtC+FM5Dq8=;
 b=k1NgNLNCbAIKBOuVGoSb/LuWCbc4mGFFMHM+9aABv6JrBTayTR/mDc2fl9Ep/nxjEe
 +i4bc6Ue4v7sU0kgGbQS3kdDiCvfX/Xz8ZJICjfMaSuEi2MnJSDK3fWnJjbC96aT8LB/
 Hz46D1lcS/EX0l0NDq97koduvU3/9XihXWr00pCf3XaQVJf4eVpPI0oY0yVMJIDxQCtW
 1z57/DuIVJvxkye4ToFupa+c+nKpIh70WOOk90rSPg3wZ49f1Obnb+EvtewWrF7XVOhR
 pjqOY87d8ffqJgLtM/AzqAT8qI3pOdoYpTXN/vcdG79ItsbeR9os7K/Hg8Kd14pO5FUz
 1syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719583073; x=1720187873;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lt9CFtU6VQjl5rQikn0RMmEwksOG2DhuVbtC+FM5Dq8=;
 b=f9gKBJMm2PPDd95cPhFcDQUp+tqIm4NU48cO2aEpyAeVj+2jWTHeJi0z/it+1l3i73
 44Wh9xl6K0p5s6F080cEQldg7nbX96QYWHBBwAMRMUCuzD5HA6Y+YYDTFwJAe2rkDVWW
 m+fuw9xDa0m0DV9Jvx55aFB0y8o24DYt4ixBhY7O5TGFgCYLHHaQydy6jTV8GQ46r9Fb
 msejBcgHBe+Ss3GuLNilOgbxjbG/UX20ooFYGjeIEu+wP3RsljIAFE7vxldADdRTo8P3
 vi5XWZmf9/YI0m3faQyEicrT8V8Ss04C1yeTmbDTHCh0Cr19FWizKWU50JCCyJISrxNL
 NUEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgHm75+s1AJmvcxOjvrOCHGkphOc75i+p//rsmiiOYQ0+nJLnxppuMYnjAabIQAJ47i1mQvYzKVe15pDWKU2mVKgjrBKwCrajgE5LTPHN7
X-Gm-Message-State: AOJu0YzE1CVULQ6X7t8fHrjOMF8IGFmsgdr0373U5HeHH++DAxeFtYgc
 IouWIr2vuiGak3f+Q4VZ09dcawGJBxN3Nac8TLkGq6dZYVOZEBQG
X-Google-Smtp-Source: AGHT+IF/NqMEU+y8hWP3NpUQFYLF4+7Vv+2H8/MUU3lKxcXQyxo//MvGoCXc6K8zeKDidYtxCSRYXQ==
X-Received: by 2002:a05:6512:1304:b0:52c:fd49:d42 with SMTP id
 2adb3069b0e04-52cfd490d9emr7491193e87.14.1719583072185; 
 Fri, 28 Jun 2024 06:57:52 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd784sm2435261f8f.7.2024.06.28.06.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 06:57:51 -0700 (PDT)
Date: Fri, 28 Jun 2024 15:57:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "mripard@kernel.org" <mripard@kernel.org>, 
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "jkardatzke@google.com" <jkardatzke@google.com>, 
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>, 
 Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= <youlin.pei@mediatek.com>,
 "logang@deltatee.com" <logang@deltatee.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Kuohong Wang =?utf-8?B?KOeOi+Wci+m0uyk=?= <kuohong.wang@mediatek.com>, 
 Jianjiao Zeng =?utf-8?B?KOabvuWBpeWnoyk=?= <Jianjiao.Zeng@mediatek.com>,
 "contact@emersion.fr" <contact@emersion.fr>, 
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "willy@infradead.org" <willy@infradead.org>, 
 "pavel@ucw.cz" <pavel@ucw.cz>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "tjmercier@google.com" <tjmercier@google.com>,
 "jstultz@google.com" <jstultz@google.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, 
 Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Message-ID: <fh37zowioui7hcabzrco7xqxttze2lufijq67wbzylah3e3ry6@ahwnr2rspt3l>
References: <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <ZnxWWtdShekGSUif@phenom.ffwll.local>
 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
 <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
 <w3xcvakoytubud6dw4wxr6ntbe6uvfrldihnd26vai6uyyto6j@vcq7gizxolag>
 <c96f82e3-bbd6-407e-a71b-3a794a56585b@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="reicrtljkywsfrhv"
Content-Disposition: inline
In-Reply-To: <c96f82e3-bbd6-407e-a71b-3a794a56585b@amd.com>
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


--reicrtljkywsfrhv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 02:34:24PM GMT, Christian K=C3=B6nig wrote:
> Am 28.06.24 um 13:47 schrieb Thierry Reding:
> > [SNIP]
> > > > The reason I ask is that encryption here looks just like another pa=
rameter
> > > > for the buffer, e.g. like format, stride, tilling etc..
> > > >=20
> > > > So instead of this during buffer import:
> > > >=20
> > > > mtk_gem->secure =3D (!strncmp(attach->dmabuf->exp_name, "restricted=
", 10));
> > > > mtk_gem->dma_addr =3D sg_dma_address(sg->sgl);
> > > > mtk_gem->size =3D attach->dmabuf->size;
> > > > mtk_gem->sg =3D sg;
> > > >=20
> > > > You can trivially say during use hey this buffer is encrypted.
> > > >=20
> > > > At least that's my 10 mile high view, maybe I'm missing some extens=
ive key
> > > > exchange or something like that.
> > > That doesn't work in all cases, unfortunately.
> > >=20
> > > If you're doing secure video playback, the firmware is typically in
> > > charge of the frame decryption/decoding, and you'd get dma-buf back t=
hat
> > > aren't accessible by the CPU (or at least, not at the execution level
> > > Linux runs with).
> > Can you clarify which firmware you're talking about? Is this secure
> > firmware, or firmware running on the video decoding hardware?
> >=20
> > > So nobody can map that buffer, and the firmware driver is the one who
> > > knows that this buffer cannot be accessed by anyone. Putting this on =
the
> > > userspace to know would be pretty weird, and wouldn't solve the case
> > > where the kernel would try to map it.
> > Doesn't userspace need to know from the start whether it's trying to do
> > secure playback or not? Typically this involves more than just the
> > decoding part. You'd typically set up things like HDCP as part of the
> > process, so userspace probably already does know that the buffers being
> > passed around are protected.
> >=20
> > Also, the kernel shouldn't really be mapping these buffers unless
> > explicitly told to. In most cases you also wouldn't want the kernel to
> > map these kinds of buffers, right? Are there any specific cases where
> > you expect the kernel to need to map these?
> >=20
> > I've been looking at this on the Tegra side recently and the way it
> > works on these chips is that you basically get an opaque carveout region
> > that has been locked down by secure firmware or early bootloaders, so
> > only certain hardware blocks can access it. We can allocate from that
> > carveout and then pass the buffers around.
> >=20
> > It may be possible to use these protected carveout regions exclusively
> > from the DRM/KMS driver and share them with multimedia engines via DMA-
> > BUF, but I've also been looking into perhaps using DMA-BUF heaps to
> > expose the carveout, which would make this a bit more flexible and allow
> > either userspace to allocate the buffers or have multiple kernel drivers
> > share the carveout via the DMA-BUF heap. Though the latter would require
> > that there be in-kernel APIs for heaps, so not too sure about that yet.
>=20
> Yeah as far as I can see that would be a perfectly valid use case for
> DMA-Buf heaps.
>=20
> One question here: How does the HDCP setup work on Tegra? From your comme=
nt
> I guess you pass most of the information through userspace as well.

Well, we don't currently support HDCP at all. I do have proof-of-concept
patches from a long time ago and, yes, judging by that we'd need to
control all of this from userspace. The way I imagine that this would
work is that userspace needs to first set the "Content Protection" and
"HDCP Content Type" properties and wait for the state change. Once that
has happened it can go and allocate the protected memory and start
decoding into it and then scan out from these buffers.

> Or is there any info inside the DMA-buf for this? In other words would you
> also need to know if a buffer is then allocated from this special carveou=
t?

I don't think so. It's possible to scan out an unprotected buffer with
HDCP enabled. It may also be possible to scan out a protected buffer
even if HDCP wasn't enabled, though you would obviously want to prevent
that somehow. Not sure if there's a common way to do this, but I guess
in end-user devices you'd need a fully trusted boot chain to do that in
a compliant way.

It's been a long time since I looked at this, but I seem to recall that
at the time all software that could do DRM-protected playback on Linux
was proprietary for reasons like these.

Thierry

--reicrtljkywsfrhv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+wVoACgkQ3SOs138+
s6FYRg//ZUUMosKJeOf/03Cgop+FIjgV4O7IqRtSAfEN/qoxOIEVEe0GYmr4XT07
XmvxGHLuPu+uMb/mJneL/1i/GUcgJCas5qtVNZvMTieifqhIl4CzoCIu+HLNgotN
HmEAxVC84SG/nLpogfy5FRz2qnP1vZb7G+8pJADjqqmCj//6p+/xFEZM04iaM5aQ
RAX47cvOq8t/d83lphT3oexDkBmVA5yOnTptGf0+TCyjDp3mrFqECDMSNKDysqqc
t2HrGUIsG+hpoAXxDrMSRSPwWaFXJwHqXOzoCRWY5eFpL6+3aVeYag00D3rhHaF5
E3J6HOq0UXftdkH9sb2dnqJhWb8zi8GVx0EsVhH2j6xXC0d6Afd+y8JxhWebkjp1
yuASrgIzvoh3PAsXWDs54MA+0q/QEDFwX3ePC4XKTVhR7XD3h7TkQ/i8dRH6mu89
tY7FUN2p/Yr3EIviljnSkwqgEe/3aH3rgHyTCHjSYOY1coQgSf8c5gs/J95G5FYD
Y7ccQGGfiAYxvHlxkZSRVNpGLyrKeQYr2GvWE1fPnEtEGINdXa3UNXM+N01CoUlv
ch2icB9764M1/Eh1Tso3ymqdwVRq7bfoE15/efyLBb5bW+UChZTs9f1F6PSGb0sJ
pppVGYLhBLuMSb2NSRud/tly7J6Wz8gcD8V0FnbJ03hjIRRTR3w=
=Ib2U
-----END PGP SIGNATURE-----

--reicrtljkywsfrhv--
