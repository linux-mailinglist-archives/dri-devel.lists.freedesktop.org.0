Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 721104A4AA4
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 16:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6092B10E4B4;
	Mon, 31 Jan 2022 15:33:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C81B10E4B6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 15:33:18 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id u130so13162420pfc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 07:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cX5XYAJngFJIkj2tMMe8Nc34iEVYgEFYIFuQOpTXb2w=;
 b=SdxwxwtI9YLoBpUcmE8AxRvItfQWSWlS7uehIDO+jRhcow3zXSAEwYMsJN3NA8pMN7
 wsH13NbmKEOaif7xODnuexv5fybV+7VZVoFwa2S7bPcAP2UE8rZj7XBbQW8LHTcKlT/R
 oygb21l+VMBth2i7eWNRi2GvuHMFzSfMpxVmh6+XKo0NXpHDfX4UOTjHdQeZ0rcTnHBW
 j0e76DYs/bWa2SjSS35FpghJtuhtD9pBDu8BVbE0Qb4cwBXxCXIsMcwxQHxMPLYzVV/D
 pg3GNckAWEo8e6PLUue4kSm8dbyb0EG6Lktpkm+KL8ZbZ1pJ1ycIoRE/Xn6acRp3sove
 CD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cX5XYAJngFJIkj2tMMe8Nc34iEVYgEFYIFuQOpTXb2w=;
 b=TToBWoD9qTmOW0HTXZOMkLJb1L7KfnYtQmGueLpT9l6j0lJ15gub/nIdmPVBvPBb/+
 d7j37Zp9iuLWDUu7eBvZ03Ifh4bHOJeXhTrnY+1Tt2/BctfW+mvuNHzJJGP2Mfc/2Bk5
 C/m9m9ubQokOrmQruMqa0YR53GXdBTAO6/p60L/cBU1OsKpPz7FUBvwkEwDiHJ/VDuEc
 AtTRDndLjJWm/Ec3s2O2Ghu2mUsGwN8YfziHc+oIkLWHmnWFLMkeJ/X0z3dDDQr8YC3x
 r1rU8D8qfbqDbRHav5nlG80cnClY/kCYP00tv9fxuLf+Ru3sO+WW+VPSCP05lBwrTOdb
 GRfw==
X-Gm-Message-State: AOAM531romj2DyErdeJVxBaI/njpePL55rZbqwcTbwUg8l0p0Ixamp5m
 Fh+d7Xbj3B1XSzp6a4mH0hnIXY8crQKdlXQ/Z1q6sGTyAlLYEQ==
X-Google-Smtp-Source: ABdhPJxytOnJHsFkSdPNeJwRZFPhd92LCJImZFTLm2lwIOzkJoAcPVNOGM8FcsNI3RhXmy4nIjkITgpXDJvA+80soQY=
X-Received: by 2002:a63:610b:: with SMTP id v11mr17077460pgb.201.1643643197630; 
 Mon, 31 Jan 2022 07:33:17 -0800 (PST)
MIME-Version: 1.0
References: <Ye21tlZKRRe2vUzR@pendragon.ideasonboard.com>
 <1643008835-73961-1-git-send-email-lyz_cs@pku.edu.cn>
 <YfHw8WwDpnRXO07G@pendragon.ideasonboard.com>
In-Reply-To: <YfHw8WwDpnRXO07G@pendragon.ideasonboard.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 31 Jan 2022 16:33:06 +0100
Message-ID: <CAG3jFysi4aWGVOJ_Z2PinXyC1dfFWbP2nY-3Om-=PwZ6zbWWUA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: Add missing pm_runtime_put_sync
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: jonas@kwiboo.se, Yongzhi Liu <lyz_cs@pku.edu.cn>, airlied@linux.ie,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, a.hajda@samsung.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Jan 2022 at 02:10, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yongzhi,
>
> Thank you for the patch.
>
> On Sun, Jan 23, 2022 at 11:20:35PM -0800, Yongzhi Liu wrote:
> > pm_runtime_get_sync() will increase the rumtime PM counter
> > even when it returns an error. Thus a pairing decrement is needed
> > to prevent refcount leak. Fix this by replacing this API with
> > pm_runtime_resume_and_get(), which will not change the runtime
> > PM counter on error. Besides, a matching decrement is needed
> > on the error handling path to keep the counter balanced.
> >
> > Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  drivers/gpu/drm/bridge/nwl-dsi.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> > index 9282e61..30aacd9 100644
> > --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> > +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> > @@ -862,18 +862,19 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
> >       memcpy(&dsi->mode, adjusted_mode, sizeof(dsi->mode));
> >       drm_mode_debug_printmodeline(adjusted_mode);
> >
> > -     pm_runtime_get_sync(dev);
> > +     if (pm_runtime_resume_and_get(dev) < 0)
> > +             return;
> >
> >       if (clk_prepare_enable(dsi->lcdif_clk) < 0)
> > -             return;
> > +             goto runtime_put;
> >       if (clk_prepare_enable(dsi->core_clk) < 0)
> > -             return;
> > +             goto runtime_put;
> >
> >       /* Step 1 from DSI reset-out instructions */
> >       ret = reset_control_deassert(dsi->rst_pclk);
> >       if (ret < 0) {
> >               DRM_DEV_ERROR(dev, "Failed to deassert PCLK: %d\n", ret);
> > -             return;
> > +             goto runtime_put;
> >       }
> >
> >       /* Step 2 from DSI reset-out instructions */
> > @@ -883,13 +884,18 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
> >       ret = reset_control_deassert(dsi->rst_esc);
> >       if (ret < 0) {
> >               DRM_DEV_ERROR(dev, "Failed to deassert ESC: %d\n", ret);
> > -             return;
> > +             goto runtime_put;
> >       }
> >       ret = reset_control_deassert(dsi->rst_byte);
> >       if (ret < 0) {
> >               DRM_DEV_ERROR(dev, "Failed to deassert BYTE: %d\n", ret);
> > -             return;
> > +             goto runtime_put;
> >       }
> > +
> > +     return;
> > +
> > +runtime_put:
> > +     pm_runtime_put_sync(dev);
> >  }
> >
> >  static void

Applied to drm-misc-next.
