Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9E144D094
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 05:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6816E8F6;
	Thu, 11 Nov 2021 04:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7156E8F6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 04:00:47 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id 1so9411255ljv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 20:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yH8ja7VP8p1VDclBmMvhEHUQneOCn8LZqdo+2OSyMiI=;
 b=eIzx/Cbomp+USxMUIAGgS7bftEgwznfBZbwgi6p4YI3FRo9gi/vdaBoUWKoHxfuyPB
 mw/y2pXpzxA6+5/d3+P7aH4bDsvbQSASCDLhGn5I2TrT5CpqK6ecRSNkPQN28wcFGADP
 9k8FnQxcE8jpHpctExcK3AVkY4qB7d6gviJy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yH8ja7VP8p1VDclBmMvhEHUQneOCn8LZqdo+2OSyMiI=;
 b=2kB0ziSazpe1p+r3BCMuD/V4BlciiA0sRm9Yjr7l2q7FsN2G9bnJUpIMOjRWS1Ea3p
 ZgWyIdX39N38lWUame9Y3BtRxIw0ZHLSLxx9agpROpKCuKviviByNn3rUJknm2cgNKOP
 7T7+SUDCZhqDe+OEvsbfXhgiUjG76RqKs3lR49Pat6b5mcQHqf54IojhiqTJokdHE98n
 6RgfXTqk88VTyisFqJUNKpqJVRVU33ZzjpIT3QZ12Ao5yHqWc9caj4GrVrryKF53ICZ7
 uYoTwYpaW5a+3XZ6P3V/h3h3HDhGbFjILIC9cs6hM5GpfVRs50JX7N1tm9kaXinIFkjI
 PbCg==
X-Gm-Message-State: AOAM531oadyesE3fBtjIw6hT9+p8PVGiml+CUYN9TlWbLLsr5pwFVzTT
 M/3rRfqOIkiksGsVRWIeQ2hJZta5XuFZUoBNCjFR7w==
X-Google-Smtp-Source: ABdhPJxlV4gGg9kn82P4bK9eQigBUtH7JDNyQemvY5ujecR55RWBtQDaP9XzaDlfxT0NgRx3QJkfO5CE0wqzHMnZrAc=
X-Received: by 2002:a2e:9ed3:: with SMTP id h19mr4294059ljk.392.1636603245859; 
 Wed, 10 Nov 2021 20:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com>
 <20211109125030.26299-7-yunfei.dong@mediatek.com>
 <CA+Px+wXSFkK1o__7YWntGwFXtfWKH65VoSq=783fEPoEH-MwGw@mail.gmail.com>
 <19a4cb1cc774f98bd79a1b3e4d25acfbd190ae28.camel@mediatek.com>
In-Reply-To: <19a4cb1cc774f98bd79a1b3e4d25acfbd190ae28.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 11 Nov 2021 12:00:34 +0800
Message-ID: <CAGXv+5GYLSxrmqMEpDx0aE1N1Wp7vHdDFDp9Ly0c=2f+njVpGQ@mail.gmail.com>
Subject: Re: [PATCH v9,
 06/19] media: mtk-vcodec: Manage multi hardware information
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tzung-Bi Shih <tzungbi@google.com>, Fritz Koenig <frkoenig@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@chromium.org>, Tomasz Figa <tfiga@google.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 11:49 AM yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
>
> Hi Tzung-Bi,
>
> Thanks for your suggestion.
> On Wed, 2021-11-10 at 18:30 +0800, Tzung-Bi Shih wrote:
> > On Tue, Nov 09, 2021 at 08:50:17PM +0800, Yunfei Dong wrote:
> > > Manage each hardware information which includes irq/power/clk.
> > > The hardware includes LAT0, LAT1 and CORE.
> >
> > The commit message doesn't explain the code.  Could you provide some
> > explanations about how the async mechanism works?  (e.g. A bitmap for
> > all sub-devices' readiness ...)
> >
> add more detail description for commit message.
> > > Reported-by: kernel test robot <lkp@intel.com>
> >
> > Apparently wrong tag.
> >
> Remove
> > > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > index b7a51e96d4ba..eb2af42aa102 100644
> > > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > > @@ -18,19 +18,49 @@
> > >
> > >  #include "mtk_vcodec_drv.h"
> > >  #include "mtk_vcodec_dec.h"
> > > +#include "mtk_vcodec_dec_hw.h"
> > >  #include "mtk_vcodec_dec_pm.h"
> > >  #include "mtk_vcodec_intr.h"
> > > -#include "mtk_vcodec_util.h"
> >
> > Why does mtk_vcodec_util.h need to remove?
> >
> Put #include "mtk_vcodec_util.h" in mtk_vcodec_dec_hw.h.

If this file directly uses anything from that header file, it should
include it directly, instead of depending on some transitive inclusion.

This would avoid having to deal with breakage if/when the includes from
header files change beneath you.


ChenYu
