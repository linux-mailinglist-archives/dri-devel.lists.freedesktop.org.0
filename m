Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABAB86FB2B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 08:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBD310FDEB;
	Mon,  4 Mar 2024 07:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FEVCwF70";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB8410FDEC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 07:56:24 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a45606c8444so41621466b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Mar 2024 23:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709538983; x=1710143783; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JU7B4JEXTqNDcYf4cw4oV1wq3naZdiA7hXrTs7ex2DA=;
 b=FEVCwF70sGBhNyINwNnT8YqbseZ5n0/dQJ0JgdNajkOOTQU1ND1O59AgEKXoMEAn+C
 5F+EcMAhEtkmgO1XFqKjNQ3+MTON4jGu4Dgudfg9ZwGypheSoKQldf2hSVUWdZFPzSRt
 hUqDlyxnHLyjxi2GB7gZlyqXU/qkcL/tx58QjISLQlH2n5UAo9Q/QquzjGlmEz4H6zJC
 TKFsIIcztETaUIt0oiCQw6jEUJX6z1R2DTuXxy7ePP0B8k5Jv5TNes2/hxDBR5IRbKRY
 MXlUzcosjhGYCpze/k66Js08kI3EcoEiKNeXd8TYDrH17G2+OFkVSM0Gqe+qt7s9p7tm
 g1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709538983; x=1710143783;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JU7B4JEXTqNDcYf4cw4oV1wq3naZdiA7hXrTs7ex2DA=;
 b=itoY6OE5sQuJCulpDI84xiaMZpemnSDURdYa18TQVbzM7DF5ME3sGvoY0UAjqKIG1d
 qdmnwYnlOJMEZzeQEyJGTg/yZYH/mY+cOc3JEP9b94L4SwsuWdDnIZC8PthzJLZidWXl
 1aheLhPODEn4P8GyQJNldHsw1m/8cZp0rYd0Hipo0DWc6qjO4nuuZhVQs1mehdUBdVOg
 PXPY/+UtWj4uCorpPrM2wRgjEs5iaS7Db+J3WMKl1M9HtTBmvLz+KoTrnIqIe69YcGPN
 ASM2KwVls0HC7wAAkWnuja8/2/JyGGqjWujVvAzSzcI5h+B0JU3QrFN6TctswPDFYtBA
 1GWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUexm2yszmj/9OXZcqjSxqivE+D+kwPBCLxjFprEaL8eyrfJC1luEzs3uUcA/4r7BXRqPKZJ25+hBpO/0EAO/du9c7HGd/VvqcrKhVb8TTk
X-Gm-Message-State: AOJu0YxdVD7s3YvV9dxoKQb07OzEqu7KwCVngCfAQw/MpBtcG+AodVl8
 TvU4NckBWFbLgH9aTlcfxKJmkITNsgKEbc5qOd5XkngGFuI6y+Z+
X-Google-Smtp-Source: AGHT+IFDGr7vFAQ+PxmjQk9WiX9JA+Bj/agAwF6Fti3FyVIMSz4fL7PwqOI0+GiLNxiumrzfSC6zRg==
X-Received: by 2002:a17:906:f293:b0:a45:1fa8:3850 with SMTP id
 gu19-20020a170906f29300b00a451fa83850mr1753968ejb.58.1709538982788; 
 Sun, 03 Mar 2024 23:56:22 -0800 (PST)
Received: from ?IPv6:2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47?
 (p200300f6ef1b2000944ccbc71e1c2c47.dip0.t-ipconnect.de.
 [2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a1709063b4400b00a433f470cf1sm4402055ejf.138.2024.03.03.23.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 23:56:22 -0800 (PST)
Message-ID: <43787ce68f731b9267ee558c4c38d634acffe8b9.camel@gmail.com>
Subject: Re: [PATCH v7 0/6] iio: new DMABUF based API
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, Nuno Sa <nuno.sa@analog.com>
Cc: Vinod Koul <vkoul@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>,  Jonathan Corbet <corbet@lwn.net>, Paul
 Cercueil <paul@crapouillou.net>, Daniel Vetter <daniel@ffwll.ch>, Michael
 Hennerich <Michael.Hennerich@analog.com>,  linux-doc@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
Date: Mon, 04 Mar 2024 08:59:47 +0100
In-Reply-To: <20240303174245.37efc0b0@jic23-huawei>
References: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
 <20240303174245.37efc0b0@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
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

On Sun, 2024-03-03 at 17:42 +0000, Jonathan Cameron wrote:
> On Fri, 23 Feb 2024 13:13:58 +0100
> Nuno Sa <nuno.sa@analog.com> wrote:
>=20
> > Hi Jonathan, likely you're wondering why I'm sending v7. Well, to be
> > honest, we're hoping to get this merged this for the 6.9 merge window.
> > Main reason is because the USB part is already in (so it would be nice
> > to get the whole thing in). Moreover, the changes asked in v6 were simp=
le
> > (even though I'm not quite sure in one of them) and Paul has no access =
to
> > it's laptop so he can't send v7 himself. So he kind of said/asked for m=
e to
> > do it.
>=20
> So, we are cutting this very fine. If Linus hints strongly at an rc8 mayb=
e we
> can sneak this in. However, I need an Ack from Vinod for the dma engine
> changes first.
>=20
> Also I'd love a final 'looks ok' comment from DMABUF folk (Ack even bette=
r!)
>=20
> Seems that the other side got resolved in the USB gadget, but last we hea=
rd
> form
> Daniel and Christian looks to have been back on v5. I'd like them to conf=
irm
> they are fine with the changes made as a result.=20
>=20

I can ask Christian or Daniel for some acks but my feeling (I still need, a=
t
some point, to get really familiar with all of this) is that this should be
pretty similar to the USB series (from a DMABUF point of view) as they are =
both
importers.

> I've been happy with the IIO parts for a few versions now but my ability =
to
> review
> the DMABUF and DMA engine bits is limited.
>=20
> A realistic path to get this in is rc8 is happening, is all Acks in place=
 by
> Wednesday,
> I get apply it and hits Linux-next Thursday, Pull request to Greg on Satu=
rday
> and Greg
> is feeling particularly generous to take one on the day he normally close=
s his
> trees.
>=20

Well, it looks like we still have a shot. I'll try to see if Vinod is fine =
with
the DMAENGINE stuff.

- Nuno S=C3=A1

