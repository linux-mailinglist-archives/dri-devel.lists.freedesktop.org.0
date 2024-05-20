Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385138C9BFD
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 13:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F44F10E2FB;
	Mon, 20 May 2024 11:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TPXRIKxo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC7D10E2FB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 11:13:19 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-de462979e00so2640317276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 04:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716203598; x=1716808398; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O5jh8Q3/PtVQ/wHNrcuIbE1MuAYfpZQK0CvL7Pv+jlo=;
 b=TPXRIKxoBq0tr5EyEx01Ssg9L9WQGTKZraQIcXXaCh9cYrrMSMd/mKoRWb89gH9qVQ
 Yk+h76WMCZZBVQax3L3kX/DsQ/IQalvKJolvAqWWsXbTWEVujDbmGApvmuJ39GyuVJD4
 v5dJxIctcztddDkaTqZ3Wqn7dfjgRvwUd1ohNiuphGuNALTi4YhK+n7vu/cZJBVcgCn1
 i9UWHdiHqvWNcouDJSLBGxweLkZuXNySbqvG7SECNa3pJLYEJtnjSFAZR8TmS1p/ZiTn
 k92DuvrxRQqXKS8W3sZmC/RRJzqaZxPc+f+6Dbp2wyfn2YMoEvQ5XlKWrOi+NKHMxy6j
 7FOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716203598; x=1716808398;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O5jh8Q3/PtVQ/wHNrcuIbE1MuAYfpZQK0CvL7Pv+jlo=;
 b=NDbJj2M5RxRtwmnLiB06gXfVldRSdqHs6uyshEN0BdNFa3ho205UgN4Kc0mdM1yR8R
 0ICcrQfPDPI3opDR5j1xE+5mpC/cuROLJ1T0yPe1Iq7XUGFcujRZgrgPxrUxbAHOfPMI
 Yr+uw4BmU7cJrVQCRpC5Ugaldja2xz3egxdeJnddOEeEdAJuk2YeLT11iRzmNo2LNTZA
 Em42xXY4b0sxlcZ6Og9bAW2qYJeKVyFTU12YnX66OHLUUqgblXH5b/IYrn/OUjs3mNOA
 FAJWYBzNXmtPl+4qW2JNaiSiP8uCDqhYLk0BKeXLnw+PnGO5JtzyGRQwvymhseVlGgrL
 W/ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4318X3MPdTAlQ/SnkGHuOBwe7GqmVFulC9NxpxiyC+tcQQQwDt9s4os+sORRq5FXiGqI9JpOiogeu4J9Y8nNfg0DET1OXFRsMXw1xVdFv
X-Gm-Message-State: AOJu0YyKmX0ZNYdLEpKIRc4gIAYypso38cK4i01HzhFJl3p0/qhKz8u+
 QTYP7FayOAI/dBb7g1BHQChQ0GmRJzBkSZsTvPqneGlKHe3LP2jWO+ohABzrcyhWjNjF4z64xqj
 Zu85wGWuEIw947fR6VmDnDtPho4QzPwn97cB+TQ==
X-Google-Smtp-Source: AGHT+IHgw3R2VDG3/RcUEiQCjrLCQ2HYddtsmPFqDCMLDMd5M1yfaM/WnZRHZJBTrNeCwPZKpwSj4dE7NBwdkz/lREo=
X-Received: by 2002:a25:ae18:0:b0:dee:607c:3528 with SMTP id
 3f1490d57ef6-dee607c3793mr25911507276.3.1716203598470; Mon, 20 May 2024
 04:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240516101006.2388767-1-victor.liu@nxp.com>
 <evnxopqt5be56vxuxqdj4l3mcd5nrrvucio7jhwgg4emraai3t@gherubdynyip>
 <e2d4e8b4-bab4-448f-8b67-21f2902fdcd2@linux.dev>
In-Reply-To: <e2d4e8b4-bab4-448f-8b67-21f2902fdcd2@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 14:13:07 +0300
Message-ID: <CAA8EJppH1rYQ5pzkGP+V-=cOPBYMWm=ZK2Ei1ttjOiN6GRDP+w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Exit interrupt handling when
 necessary
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, biju.das.jz@bp.renesas.com, 
 u.kleine-koenig@pengutronix.de, aford173@gmail.com, jani.nikula@intel.com, 
 bli@bang-olufsen.dk
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 May 2024 at 14:11, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
> On 5/20/24 06:11, Dmitry Baryshkov wrote:
> > On Thu, May 16, 2024 at 06:10:06PM +0800, Liu Ying wrote:
> >> Commit f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> >> fails to consider the case where adv7511->i2c_main->irq is zero, i.e.,
> >> no interrupt requested at all.
> >>
> >> Without interrupt, adv7511_wait_for_edid() could return -EIO sometimes,
> >> because it polls adv7511->edid_read flag by calling adv7511_irq_process()
> >> a few times, but adv7511_irq_process() happens to refuse to handle
> >> interrupt by returning -ENODATA.  Hence, EDID retrieval fails randomly.
> >>
> >> Fix the issue by checking adv7511->i2c_main->irq before exiting interrupt
> >> handling from adv7511_irq_process().
> >>
> >> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >> index 6089b0bb9321..2074fa3c1b7b 100644
> >> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >> @@ -479,7 +479,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
> >>              return ret;
> >>
> >>      /* If there is no IRQ to handle, exit indicating no IRQ data */
> >> -    if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> >> +    if (adv7511->i2c_main->irq &&
> >> +        !(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> >>          !(irq1 & ADV7511_INT1_DDC_ERROR))
> >>              return -ENODATA;
> >
> > I think it might be better to handle -ENODATA in adv7511_wait_for_edid()
> > instead. WDYT?
> >
>
> I think this is may deserve another patch.

My point is that the IRQ handler is fine to remove -ENODATA here,
there is no pending IRQ that can be handled. So instead of continuing
the execution when we know that IRQ bits are not set, it's better to
ignore -ENODATA in the calling code and go on with msleep().

-- 
With best wishes
Dmitry
