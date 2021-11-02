Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C89442BD7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 11:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395BA6E96F;
	Tue,  2 Nov 2021 10:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646886E96F
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 10:48:52 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id t38so1062216pfg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 03:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hJF/dHyk/3IQlaukmeK0wLdUdqN/AGJrVLVkId2ki2M=;
 b=xHwLcaZIYZgTQBtnYpAy69BmDS6ZJvi7f1usoT6wyQxHgK0mVnzvc5qCgCu7DAbzaC
 xE0kTXGb37fSqYGVxBcDw21xo/uVjZGDMqbbn31XJfY7jytObUST+tboLp30x4xIa1Xh
 15lKWjmSHswtL5SfilbBPVoxUKUhw4TRr3gRKwpeK1dPbX6Z531pzSRqG8xPfxgg1wEE
 Vf9lHPNEzERIhxj3nxhWPUOMWShJGybMzpciCQT0xSu8L/oeX1s5ZJmLAoWyWAB9L4IH
 MaA5NnVfx4PGjzFwQLq6iRN2l7Bqe23cdNIuI4Jh8q+vvKvsIw0TZnrecvu3Q5g/qZSI
 9UCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hJF/dHyk/3IQlaukmeK0wLdUdqN/AGJrVLVkId2ki2M=;
 b=XC2GPbCN+P7F0MCujk+vNTzJH+lYfK5jSeIiHZN4h8aQoom/TsfYVHB1gHucjOdYtK
 zL6EtaizQ2Mmjl1NB+Letx/vnl1HNI3kAp8AeJF+9Fqqp/4MsgNu2CKXBQRQ7zXgowwa
 1dPf03BrvsSazWHZ68XUlPIN0qSW7SfJlScn7/mPOmig1abHgjXifJvtZQwy4atcrOSz
 sM0ryFQIHiPpkM3MEsK1QbyDP5m8EuiAc47JMo3N3dyj7lHmH2JrFcz87q5anrbMwyPl
 uo62+3TQOLnoWrz4aFX+Qk5ChLBHB3MW7dtFee/hhPFxkav3TGH6rVOoRBmMstq+ef6W
 ZGWQ==
X-Gm-Message-State: AOAM5302pFm8GtWo1kMG4dgh+zZpWu/99hdffT/L4qmDdpOHGuFX5rte
 TfT4K6rL/GLGrmqmHjMx0657gzkF6Expbl6ae7yzuA==
X-Google-Smtp-Source: ABdhPJxf7ODLAmRwZb/6gWx5MMwlIfSbftXWQI/+7QaNqZg+PvaL+AL65TDTHnzYCihEIh32pgIL0MF/oUcUsHDaS10=
X-Received: by 2002:a63:6c43:: with SMTP id h64mr21356842pgc.306.1635850131950; 
 Tue, 02 Nov 2021 03:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
 <20210915223117.7857-4-jitao.shi@mediatek.com>
 <a16150b6b10dca4bf961b8e02b5e4d940b98468c.camel@mediatek.com>
 <20211102015631.GA2248315@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20211102015631.GA2248315@anxtwsw-Precision-3640-Tower>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 2 Nov 2021 11:48:40 +0100
Message-ID: <CAG3jFyvBRSDHkiVx--H84eoeDvDXYQN4YRvsLhfX7_M+15KVmA@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] drm/bridge: anx7625: config hs packets end aligned
 to avoid screen shift
To: Xin Ji <xji@analogixsemi.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, stonea168@163.com,
 Jitao Shi <jitao.shi@mediatek.com>, shuijing.li@mediatek.com,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2 Nov 2021 at 02:56, Xin Ji <xji@analogixsemi.com> wrote:
>
> On Mon, Nov 01, 2021 at 11:16:15AM +0800, Jitao Shi wrote:
> > Hi Xin,
> >
> > Please help to review the changes in anx7625.c
> >
> > On Thu, 2021-09-16 at 06:31 +0800, Jitao Shi wrote:
> > > This device requires the packets on lanes aligned at the end to fix
> > > screen shift or scroll.
> > >
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index 14d73fb1dd15..d76fb63fa9f7 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -1327,6 +1327,7 @@ static int anx7625_attach_dsi(struct
> > > anx7625_data *ctx)
> > >             MIPI_DSI_MODE_VIDEO_SYNC_PULSE  |
> > >             MIPI_DSI_MODE_NO_EOT_PACKET     |
> > >             MIPI_DSI_MODE_VIDEO_HSE;
> > > +   dsi->hs_packet_end_aligned = true;
>
> Looks good, it's OK for me.
> Reviewed-by: Xin Ji <xji@analogixsemi.com>

Acked-by: Robert Foss <robert.foss@linaro.org>
