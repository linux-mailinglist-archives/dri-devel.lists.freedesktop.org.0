Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9D0470598
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 17:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647A210E39E;
	Fri, 10 Dec 2021 16:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE9210E338
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 16:25:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D072FB82885
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 16:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B90EC341C6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 16:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639153505;
 bh=m3sNyHFjcFUZW2r34fX9cAwltyg7xeL6h5eHyuCWzc4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oTfJhJOUTAsBCKpIzs5EEVOQRvq2WKh9BZ7BakywmxszBKxL2BNFJ2+htEX/S1Oc/
 UxGXda1J82C533DRcfqJjcjsulxxxuxorhL6iRd/KzTCpL47A9z4dTv3kW57ne/hLP
 0M6qfsGZCLz0xf9HX56TWCF0wy3BGle6yR/k0zPbGm/9CGMFjbyfLGxVqrHoE83eA7
 l7B3jv1ki8lX6Ye/vk2tilcgmjgtlG2AXqfjRQuFCT/1LYTei8duYupymD481k/8jU
 n443u74qAOwY5uJhj7dCg4JvhevZk5NYLMxoBMnUg7RgeVUbrKAQDNud23+cje1S0Q
 vMaqecyHtPF8g==
Received: by mail-ed1-f54.google.com with SMTP id x10so14247441edd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 08:25:05 -0800 (PST)
X-Gm-Message-State: AOAM530nQ23j260NRgZpsRr8e/SyJ6/niKHontIDiw9pLDvYQg3Ou8vm
 xaiWShRsZ62yzNT+QLDFhEg5gDfwOSs37NG0tg==
X-Google-Smtp-Source: ABdhPJxjCxliga8nYVwXlovtAcHvS7Ku6/w30eyy8A3Q8G61IMUB7ZV9QEDabmdc5s/EneEMAablKoa97VrdPvtzkX8=
X-Received: by 2002:a05:6402:5194:: with SMTP id
 q20mr40538337edd.250.1639153498690; 
 Fri, 10 Dec 2021 08:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
 <20210915223117.7857-2-jitao.shi@mediatek.com>
 <CAAOTY_8H=TE8574xB3FFcGVgN_fTb_83+FT8ei1CDuB4k4-Oew@mail.gmail.com>
 <ad925a6c1438b78f3c79b37fd0a545c9eb153a59.camel@mediatek.com>
In-Reply-To: <ad925a6c1438b78f3c79b37fd0a545c9eb153a59.camel@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 11 Dec 2021 00:24:47 +0800
X-Gmail-Original-Message-ID: <CAAOTY__hcWKT=DTkKyb6J1N2bnpuP1rpqUHivhg-syaetCgNBQ@mail.gmail.com>
Message-ID: <CAAOTY__hcWKT=DTkKyb6J1N2bnpuP1rpqUHivhg-syaetCgNBQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] drm/dsi: transer dsi hs packet aligned
To: Jitao Shi <jitao.shi@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, shuijing.li@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dave & Daniel:

This patch looks good to me, how do you think about it?

Regards,
Chun-Kuang.

Jitao Shi <jitao.shi@mediatek.com> =E6=96=BC 2021=E5=B9=B411=E6=9C=884=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8811:36=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Hi sirs
>
> Pls help to review this change.
>
> Best Regards
> Jitao.
>
> On Tue, 2021-10-05 at 07:53 +0800, Chun-Kuang Hu wrote:
> > Hi, Jitao:
> >
> > Jitao Shi <jitao.shi@mediatek.com> =E6=96=BC 2021=E5=B9=B49=E6=9C=8816=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=886:31=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > Some DSI devices reqire the hs packet starting and ending
> > > at same time on all dsi lanes. So use a flag to those devices.
> > >
> >
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> >
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > ---
> > >  include/drm/drm_mipi_dsi.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/include/drm/drm_mipi_dsi.h
> > > b/include/drm/drm_mipi_dsi.h
> > > index af7ba8071eb0..8e8563792682 100644
> > > --- a/include/drm/drm_mipi_dsi.h
> > > +++ b/include/drm/drm_mipi_dsi.h
> > > @@ -177,6 +177,7 @@ struct mipi_dsi_device_info {
> > >   * @lp_rate: maximum lane frequency for low power mode in hertz,
> > > this should
> > >   * be set to the real limits of the hardware, zero is only
> > > accepted for
> > >   * legacy drivers
> > > + * @hs_packet_end_aligned: transfer dsi hs packet ending aligned
> > >   */
> > >  struct mipi_dsi_device {
> > >         struct mipi_dsi_host *host;
> > > @@ -189,6 +190,7 @@ struct mipi_dsi_device {
> > >         unsigned long mode_flags;
> > >         unsigned long hs_rate;
> > >         unsigned long lp_rate;
> > > +       bool hs_packet_end_aligned;
> > >  };
> > >
> > >  #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
> > > --
> > > 2.25.1
