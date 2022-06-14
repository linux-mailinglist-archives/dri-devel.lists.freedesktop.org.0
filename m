Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3240A54B7E5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 19:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE39F10E1BA;
	Tue, 14 Jun 2022 17:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FC210E1BA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 17:46:09 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id x18so6642101qtj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 10:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=Xn5U6yTCivKcEB2CQHYVzvugp+BfiT1C9G92C8VTcFE=;
 b=613RfUCkNkGQMLtU7V2MbO04fhnH0mtvC5dKJO2n7m5TCcstyJMNMqLu5YY/jKx85W
 WqQMLAi27pfXea2pgAxcenjo+QPeoTl9CYin1epFcZK/vTqiQCqBD1EYkVVK5uDXlJOk
 /REj65VNDa+2mfoDGydpq55FH9UXhemjGynB7O4/KvsjpjTKj3iXzE5se/WNWb3HwcDQ
 Qm8tyvsIiyWLkoQC0YSKGsXgM6jbVZQWXTcSfHhc7xpqFpsgqnP3lP5KbJsA0tnl+2AB
 IlaRWg/QdubW8ftDo3KKzJL3UuG4GA8jNRl6v8rVtjb0Mt6ik6HtmbEE25xxiVEQixz1
 wZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=Xn5U6yTCivKcEB2CQHYVzvugp+BfiT1C9G92C8VTcFE=;
 b=iuJeTEGdeLfkeQfGj3WrFPzb3zKe6rTt/oAnxrl7qjuKfoygINitdeCHTBPEcjbC5D
 Ki8fIsQR9hb7zqTTAqZoedaJEaawPjFWT7nvIrrcwNe3FR9ehv9/m9ILUfTWKHhr/CoT
 fQJUjleQpNRVCkAzFn5sGNlp8Ubx3D8godKOTN+0Tq7NDesWPQJcAmROw6onhW7g7C8O
 uG76Izf+1oyNvYe/eZ5/ck3i35EyoXN941uTeayGHTV4Z/Xtl2gzPB0oLF5WiGNt2vVK
 Z0yOtHB2q5xV9m+iiKGPm8tbwmzEXGkYHErNxWYnkzREBk3B+K2CkxxIG5FohmS0ae6y
 KeyQ==
X-Gm-Message-State: AOAM531jUlZwiWLwJOJnAIJPkKGnHZFBgOcKHfnDiN9Uq2WD65c3ls0T
 lmZ5ZUE7YI6xF8QElzvFuYpuOA==
X-Google-Smtp-Source: ABdhPJyz6Dah76Tro/nBusft/e8MUMRJGJMekMTnnVzKmUelFUurRZI3FxaqFWMN0HWssy5n6ZNO1g==
X-Received: by 2002:ac8:5a42:0:b0:305:222b:8ec9 with SMTP id
 o2-20020ac85a42000000b00305222b8ec9mr5296612qta.214.1655228768303; 
 Tue, 14 Jun 2022 10:46:08 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net.
 [192.222.136.102]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05622a030c00b00304dd83a9b1sm8255216qtw.82.2022.06.14.10.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 10:46:07 -0700 (PDT)
Message-ID: <5316234cef174e49110f949991ef71c578a3478e.camel@ndufresne.ca>
Subject: Re: [PATCH v4, 0/3] add h264 decoder driver for mt8186
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tomasz
 Figa <tfiga@google.com>
Date: Tue, 14 Jun 2022 13:46:06 -0400
In-Reply-To: <edbb4605c9e30329d2f5a4ff738571acb6b91f1f.camel@ndufresne.ca>
References: <20220512034620.30500-1-yunfei.dong@mediatek.com>
 <edbb4605c9e30329d2f5a4ff738571acb6b91f1f.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le lundi 13 juin 2022 =C3=A0 16:10 -0400, Nicolas Dufresne a =C3=A9crit=C2=
=A0:
> Le jeudi 12 mai 2022 =C3=A0 11:46 +0800, Yunfei Dong a =C3=A9crit=C2=A0:
> > Firstly, add mt8186 compatible and private data, then add document for
> > compatible "mediatek,mt8186-vcodec-dec". For mt8186 is single core
> > architecture, need to add new interface for h264 hardware decoder.
>=20
> Would be nice to take the habit of sharing fluster score for this new HW,=
 I
> would expect no less then what the numbers you'd get from running over MT=
8195 or
> 92, remains nice to demonstrate that this was tested and document any oop=
s along
> the way.
> >=20
> > Patche 1 add mt8186 compatible and private data.
> > Patche 2 add mt8186 compatible document.
> > Patche 3 add h264 single core driver.
> > ---
> > This patch depends on "support for MT8192 decoder"[1]
> >=20
> > [1]  https://patchwork.kernel.org/project/linux-mediatek/cover/20220512=
021950.29087-1-yunfei.dong@mediatek.com/

I forgot earlier, but I suppose this will also depends on an scp.img firmwa=
re ?
If so, any linux-firmware submission to link to ?

> > ---
> > changed with v3:
> > - fix __iomem not reasonable, align share memory to dram.
> > changed with v2:
> > - fix sparse and smatch check fail for patch 3
> > changed with v1:
> > - rebase driver to the latest media_stage.
> > ---
> > Yunfei Dong (3):
> >   dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings for
> >     mt8186
> >   media: mediatek: vcodec: Support MT8186
> >   media: mediatek: vcodec: add h264 decoder driver for mt8186
> >=20
> >  .../media/mediatek,vcodec-subdev-decoder.yaml |   4 +-
> >  .../platform/mediatek/vcodec/mtk_vcodec_dec.h |   1 +
> >  .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |   4 +
> >  .../vcodec/mtk_vcodec_dec_stateless.c         |  19 ++
> >  .../vcodec/vdec/vdec_h264_req_multi_if.c      | 177 +++++++++++++++++-
> >  5 files changed, 203 insertions(+), 2 deletions(-)
> >=20
>=20

