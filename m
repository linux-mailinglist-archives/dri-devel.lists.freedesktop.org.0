Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3E7871AF8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 11:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AEE1129EA;
	Tue,  5 Mar 2024 10:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1095 seconds by postgrey-1.36 at gabe;
 Tue, 05 Mar 2024 10:26:02 UTC
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AAD1129EA
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 10:26:01 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Tprj416Hlz6D8rK;
 Tue,  5 Mar 2024 18:02:48 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 593961404F5;
 Tue,  5 Mar 2024 18:07:44 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 5 Mar
 2024 10:07:43 +0000
Date: Tue, 5 Mar 2024 10:07:42 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
CC: Jonathan Cameron <jic23@kernel.org>, Nuno Sa <nuno.sa@analog.com>, "Vinod
 Koul" <vkoul@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Jonathan Corbet <corbet@lwn.net>, Paul Cercueil
 <paul@crapouillou.net>, Daniel Vetter <daniel@ffwll.ch>, Michael Hennerich
 <Michael.Hennerich@analog.com>, <linux-doc@vger.kernel.org>,
 <dmaengine@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v7 0/6] iio: new DMABUF based API
Message-ID: <20240305100742.00006a4c@Huawei.com>
In-Reply-To: <43787ce68f731b9267ee558c4c38d634acffe8b9.camel@gmail.com>
References: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
 <20240303174245.37efc0b0@jic23-huawei>
 <43787ce68f731b9267ee558c4c38d634acffe8b9.camel@gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
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

On Mon, 04 Mar 2024 08:59:47 +0100
Nuno S=E1 <noname.nuno@gmail.com> wrote:

> On Sun, 2024-03-03 at 17:42 +0000, Jonathan Cameron wrote:
> > On Fri, 23 Feb 2024 13:13:58 +0100
> > Nuno Sa <nuno.sa@analog.com> wrote:
> >  =20
> > > Hi Jonathan, likely you're wondering why I'm sending v7. Well, to be
> > > honest, we're hoping to get this merged this for the 6.9 merge window.
> > > Main reason is because the USB part is already in (so it would be nice
> > > to get the whole thing in). Moreover, the changes asked in v6 were si=
mple
> > > (even though I'm not quite sure in one of them) and Paul has no acces=
s to
> > > it's laptop so he can't send v7 himself. So he kind of said/asked for=
 me to
> > > do it. =20
> >=20
> > So, we are cutting this very fine. If Linus hints strongly at an rc8 ma=
ybe we
> > can sneak this in. However, I need an Ack from Vinod for the dma engine
> > changes first.
> >=20
> > Also I'd love a final 'looks ok' comment from DMABUF folk (Ack even bet=
ter!)
> >=20
> > Seems that the other side got resolved in the USB gadget, but last we h=
eard
> > form
> > Daniel and Christian looks to have been back on v5. I'd like them to co=
nfirm
> > they are fine with the changes made as a result.=20
> >  =20
>=20
> I can ask Christian or Daniel for some acks but my feeling (I still need,=
 at
> some point, to get really familiar with all of this) is that this should =
be
> pretty similar to the USB series (from a DMABUF point of view) as they ar=
e both
> importers.
>=20
> > I've been happy with the IIO parts for a few versions now but my abilit=
y to
> > review
> > the DMABUF and DMA engine bits is limited.
> >=20
> > A realistic path to get this in is rc8 is happening, is all Acks in pla=
ce by
> > Wednesday,
> > I get apply it and hits Linux-next Thursday, Pull request to Greg on Sa=
turday
> > and Greg
> > is feeling particularly generous to take one on the day he normally clo=
ses his
> > trees.
> >  =20
>=20
> Well, it looks like we still have a shot. I'll try to see if Vinod is fin=
e with
> the DMAENGINE stuff.
>=20

Sadly, looks like rc7 was at the end of a quiet week, so almost certain to =
not
be an rc8 in the end. Let's aim to get this in at the start of the next cyc=
le
so we can build on it from there.


Jonathan

> - Nuno S=E1
>=20
>=20

