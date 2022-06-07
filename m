Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5C453F404
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 04:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9851010E68C;
	Tue,  7 Jun 2022 02:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D2A10E68C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 02:45:00 +0000 (UTC)
X-UUID: e7a56f64fb5a4d8a84f6971b420cd71c-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:466f59a2-2175-4f7b-b1b1-71b4631e0cf4, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:526fdce4-2ba2-4dc1-b6c5-11feb6c769e0,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: e7a56f64fb5a4d8a84f6971b420cd71c-20220607
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 632121357; Tue, 07 Jun 2022 10:44:55 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 7 Jun 2022 10:44:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 7 Jun 2022 10:44:54 +0800
Message-ID: <88f99e3feac6fc897de2aa0911908d3878cc2cc2.camel@mediatek.com>
Subject: Re: [PATCH v10 03/21] drm/edid: Convert cea_sad helper struct to
 kernelDoc
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Guillaume Ranquet
 <granquet@baylibre.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, "Vinod
 Koul" <vkoul@kernel.org>, Helge Deller <deller@gmx.de>, CK Hu
 <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>
Date: Tue, 7 Jun 2022 10:44:54 +0800
In-Reply-To: <652139e639c7e80795e01b3b4f88ba03b85d66c5.camel@gmail.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-4-granquet@baylibre.com>
 <652139e639c7e80795e01b3b4f88ba03b85d66c5.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-05-23 at 12:57 +0200, Matthias Brugger wrote:
> On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > 
> 
> We need a commit message here.
> 

Hello Matthias,

ok, I will add commit message in next version.

Thanks.

BRs,
Bo-Chen

> > ---
> >  include/drm/drm_edid.h | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index 144c495b99c4..37c420423625 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -359,12 +359,18 @@ struct edid {
> >  
> >  #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1]
> > << 8))
> >  
> > -/* Short Audio Descriptor */
> > +/**
> > + * struct cea_sad - Short Audio Descriptor.
> > + * @format: See HDMI_AUDIO_CODING_TYPE_*.
> > + * @channels: max number of channels - 1.
> > + * @freq: See CEA_SAD_FREQ_*.
> > + * @byte2: meaning depends on format.
> > + */
> >  struct cea_sad {
> >         u8 format;
> > -       u8 channels; /* max number of channels - 1 */
> > +       u8 channels;
> >         u8 freq;
> > -       u8 byte2; /* meaning depends on format */
> > +       u8 byte2;
> >  };
> >  
> >  struct drm_encoder;
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

