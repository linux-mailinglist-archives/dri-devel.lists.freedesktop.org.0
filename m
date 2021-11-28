Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B683D460750
	for <lists+dri-devel@lfdr.de>; Sun, 28 Nov 2021 16:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EB572F3D;
	Sun, 28 Nov 2021 15:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADE172F3D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Nov 2021 15:57:40 +0000 (UTC)
X-UUID: a06df0059a734746a1cc6e4dd9453dbf-20211128
X-UUID: a06df0059a734746a1cc6e4dd9453dbf-20211128
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 283879108; Sun, 28 Nov 2021 23:57:35 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sun, 28 Nov 2021 23:57:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 28 Nov 2021 23:57:33 +0800
Message-ID: <ae29424d8121f8951cfb5fece114b6fcba90d351.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <PU1PR03MB306252A252139515F7EA9ABCB8659@PU1PR03MB3062.apcprd03.prod.outlook.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
 <20211117064158.27451-4-jason-jh.lin@mediatek.com>
 <YZXqz6XDChwscDC0@google.com>
 <PU1PR03MB306252A252139515F7EA9ABCB8659@PU1PR03MB3062.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Subject: Re: FW: [PATCH 3/3] drm/mediatek: add devlink to cmdq dev
Resent-From: Jason-JH Lin <jason-jh.lin@mediatek.com>
Resent-Cc: DRI Development <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "Linux
 ARM" <linux-arm-kernel@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fei
 Shao" <fshao@chromium.org>
Date: Sun, 28 Nov 2021 23:57:33 +0800
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: quoted-printable
X-MTK: N
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, ";
 David Airlie" <airlied@linux.ie>, "; Singo Chang
 =?UTF-8?Q?=28=E5=BC=B5=E8=88=88=E5=9C=8B=29?=" <Singo.Chang@mediatek.com>, "; 
 Jassi Brar" <jassisinghbrar@gmail.com>, "; dri-devel@lists.freedesktop.org;
 linux-mediatek@lists.infradead.org;	  linux-arm-kernel@lists.infradead.org;
 linux-kernel@vger.kernel.org;	  hsinyi@chromium.org; fshao@chromium.org;
 Nancy Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?="
 <Nancy.Lin@mediatek.com>, "; Matthias Brugger" <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Resent-Message-Id: <20211128155741.C4EB572F3D@gabe.freedesktop.org>
Resent-Date: Sun, 28 Nov 2021 15:57:41 +0000 (UTC)

Hi Tzung-Bi,

Thanks for the reviews.

> From: Linux-mediatek <linux-mediatek-bounces@lists.infradead.org> On
> Behalf Of Tzung-Bi Shih
> Sent: Thursday, November 18, 2021 1:55 PM
> To: Jason-JH Lin (=E6=9E=97=E7=9D=BF=E7=A5=A5) <Jason-JH.Lin@mediatek.com=
>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>; Philipp Zabel <
> p.zabel@pengutronix.de>; Matthias Brugger <matthias.bgg@gmail.com>;
> Jassi Brar <jassisinghbrar@gmail.com>; David Airlie <airlied@linux.ie
> >; Daniel Vetter <daniel@ffwll.ch>; dri-devel@lists.freedesktop.org;=20
> linux-mediatek@lists.infradead.org;=20
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;=20
> hsinyi@chromium.org; fshao@chromium.org; Nancy Lin (=E6=9E=97=E6=AC=A3=E8=
=9E=A2) <
> Nancy.Lin@mediatek.com>; Singo Chang (=E5=BC=B5=E8=88=88=E5=9C=8B) <Singo=
.Chang@mediatek.com>
> Subject: Re: [PATCH 3/3] drm/mediatek: add devlink to cmdq dev
>=20
> On Wed, Nov 17, 2021 at 02:41:58PM +0800, jason-jh.lin wrote:
> > @@ -158,6 +159,7 @@ static void mtk_drm_crtc_destroy(struct
> > drm_crtc *crtc)
> >  	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
> > =20
> >  	if (mtk_crtc->cmdq_client.chan) {
> > +		device_link_remove(mtk_crtc->drm_dev, mtk_crtc-
> > >cmdq_client.chan->mbox->dev);
> >  		mbox_free_channel(mtk_crtc->cmdq_client.chan);
> >  		mtk_crtc->cmdq_client.chan =3D NULL;
> >  	}
>=20
> [...]
> > @@ -956,6 +959,16 @@ int mtk_drm_crtc_create(struct drm_device
> > *drm_dev,
> >  	}
> > =20
> >  	if (mtk_crtc->cmdq_client.chan) {
> > +		struct device_link *link;
> > +
> > +		/* add devlink to cmdq dev to make sure suspend/resume
> > order is correct */
> > +		link =3D device_link_add(dev, mtk_crtc->cmdq_client.chan-
> > >mbox->dev,
> > +				       DL_FLAG_PM_RUNTIME |
> > DL_FLAG_STATELESS);
> > +		if (!link) {
> > +			dev_err(dev, "Unable to link dev=3D%s\n",
> > +				dev_name(mtk_crtc->cmdq_client.chan-
> > >mbox->dev));
> > +		}
> > +
>=20
> If device_link_add() failed, doesn't mtk_drm_crtc_create() need to
> return an error and exit?

OK, I'll add the return error at the next verion.
>=20
> OTOH, if device_link_add() failed, won't it bring any side effects to
> call device_link_remove()?
>=20

Because device_link_remove() will find the device_link of supplier and
consumer, then delete the device_link between them.
If device_link_add() failed, supplier and consumer won't create the
device_link.
So calling device_link_remove() won't do anything without deive_link
and won't bring any side effects.

Regards,
Jason-JH.Lin
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
>=20
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/lin=
ux-mediatek__;!!CTRNKA9wMg0ARbw!125dmOZ7xCLkwbIrzZf1VqVLQBbdT4RFHoMjR38U1Ge=
CxaTM6xvvB-mSr7sTc6BuY5IH$
> =20
--=20
Jason-JH Lin <jason-jh.lin@mediatek.com>

