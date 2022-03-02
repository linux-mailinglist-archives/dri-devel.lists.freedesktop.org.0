Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319F64CA5A6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 14:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A932410EB97;
	Wed,  2 Mar 2022 13:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988D310EB97
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 13:13:03 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id f38so3298532ybi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 05:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iFzdXtEzQ/C71Rve7zBflg7ThV86ZkzCxCmfW7T42tw=;
 b=AMAOABWANU8dJtCSDqHudLvUJKMvPmZCh6uSOOTfcN8gTsmKY4epdjVCB5mzkdZuEL
 A5WgMtmVLqyggWiG/EwmIoPNC9OTB1Vcsf85fLUVIe4wCOeFoMFIJ/Xq9uR4ulyXHNcC
 /v0qIoj/YGhDSC8XUdeo2+Fn14EH+BrxRngjYdxaKr9yxum0WXZ+Jvor6C+TJqJhLUZJ
 UPtZsclHm6UV5HNVbCG4czs+ZYmxws6zuAlCiixIJgEz2nuA3NlpGSzIVnop5ccz7Yqq
 MQQQmR+8XhXI0L+CNN+JOc8XZkTfBMSzG4sLKna+gVByGuSav30sXqbxJyAr/o53o5v2
 z3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iFzdXtEzQ/C71Rve7zBflg7ThV86ZkzCxCmfW7T42tw=;
 b=rN7dMLu1FSGGd+5Pvmm8aWd/NizYBgH+QsTWntE1gGubuzj9Z+r6WHrw6u9Olpmg4c
 cDlBEm/fJc7B3qBd0XOpZFhcoMbJkHHx3PtbyTf8T98NpwcpDLvjXIJJ0Se72ugIGJMi
 Aw5/sKA7UbMbocueFm7XNU6C0hl2tOJe6P7J2798GqrU/gp5rb/LEhs81t3vNC2bjO9O
 UtPchebcfm1uo6nzF4yyecSQmAQiHxUDyrIriRiSUb7XCXIPWZJ9bRx4ys1ihYLahJTt
 VONXlmOHsU0tsXrok284c3r63NXcImcBbmAN2Uwf+Ko1Htngq5doevDuVydNRtoXzaZ5
 dfgA==
X-Gm-Message-State: AOAM531oDOZmFT/HajDkBUuQ8w3LIHQybH9+pgEOaWh13tlzXnNhIKfj
 TqFBt5VLbLUffwv3aB1A//vZWlq8YuEl3YTdq3JK0Q==
X-Google-Smtp-Source: ABdhPJwcMptwYIJ+0vGUlCqUAHmZayhDR+qWANhFtDiip1jgFhh8aMHAyiF0m7wtaCH/vy8kjU9d2FJ8z+vO4S/dFm4=
X-Received: by 2002:a25:296:0:b0:623:a267:ab94 with SMTP id
 144-20020a250296000000b00623a267ab94mr28901467ybc.430.1646226782705; Wed, 02
 Mar 2022 05:13:02 -0800 (PST)
MIME-Version: 1.0
References: <20220216085842.1973868-1-victor.liu@nxp.com>
 <Yh9WYZ5pA/MUyZFx@qwark.sigxcpu.org>
In-Reply-To: <Yh9WYZ5pA/MUyZFx@qwark.sigxcpu.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 2 Mar 2022 14:12:51 +0100
Message-ID: <CAG3jFyu8mzG07MUg_-0O4Ew=CM6xDX=9e47e2t7dc88K9seycQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: nwl-dsi: Remove superfluous write to
 NWL_DSI_IRQ_MASK register
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
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
Cc: Liu Ying <victor.liu@nxp.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Mar 2022 at 12:35, Guido G=C3=BCnther <agx@sigxcpu.org> wrote:
>
> Hi Liu,
> On Wed, Feb 16, 2022 at 04:58:42PM +0800, Liu Ying wrote:
> > To initialize register NWL_DSI_IRQ_MASK, it's enough to write it
> > only once in function nwl_dsi_init_interrupts().
> >
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >  drivers/gpu/drm/bridge/nwl-dsi.c | 14 +++++---------
> >  1 file changed, 5 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/=
nwl-dsi.c
> > index af07eeb47ca0..fcc4a2889ad4 100644
> > --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> > +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> > @@ -333,17 +333,13 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi=
)
> >
> >  static int nwl_dsi_init_interrupts(struct nwl_dsi *dsi)
> >  {
> > -     u32 irq_enable;
> > -
> > -     nwl_dsi_write(dsi, NWL_DSI_IRQ_MASK, 0xffffffff);
> > -     nwl_dsi_write(dsi, NWL_DSI_IRQ_MASK2, 0x7);
> > -
> > -     irq_enable =3D ~(u32)(NWL_DSI_TX_PKT_DONE_MASK |
> > -                         NWL_DSI_RX_PKT_HDR_RCVD_MASK |
> > -                         NWL_DSI_TX_FIFO_OVFLW_MASK |
> > -                         NWL_DSI_HS_TX_TIMEOUT_MASK);
> > +     u32 irq_enable =3D ~(u32)(NWL_DSI_TX_PKT_DONE_MASK |
> > +                             NWL_DSI_RX_PKT_HDR_RCVD_MASK |
> > +                             NWL_DSI_TX_FIFO_OVFLW_MASK |
> > +                             NWL_DSI_HS_TX_TIMEOUT_MASK);
> >
> >       nwl_dsi_write(dsi, NWL_DSI_IRQ_MASK, irq_enable);
> > +     nwl_dsi_write(dsi, NWL_DSI_IRQ_MASK2, 0x7);
>
> Works fine here. I thought it was due to some hw quirk but can't find
> any note in it so:
>
> Reviewed-by: Guido G=C3=BCnther <agx@sigxcpu.org>
>
> Thanks,
>  -- Guido

Applied to drm-misc-next
