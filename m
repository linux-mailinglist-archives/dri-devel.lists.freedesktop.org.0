Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 716E541EF18
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB696E523;
	Fri,  1 Oct 2021 14:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16506ED02
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:06:42 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id p1so9395896ilg.10
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 07:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z+a+OAnbn2I7NAN9np3zYA/hAsmt4Me5zaOYy7w4mjw=;
 b=fL+vUmI833aN0BEMvBL5ZwKKDoN1QrgN1cHfhwoWs/4cdOQsYyYpCCKmP0+dulwt+9
 cLBLX1dkN5SoCTiYF4Q7NbcUq8nKBq0DcP6u4YlmnWrBQpSSSmNeQzdSo/jbfVfLxQBJ
 CHoBAz7eXc2VYpCudViIqjCfvFGXT6iywZjOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+a+OAnbn2I7NAN9np3zYA/hAsmt4Me5zaOYy7w4mjw=;
 b=087iv256eI8z3ffLweW8dFixIRZStpgYT5Kyh61VM+oasS1loVaAWhs5zn3L7XnNo0
 qplXcG2CZ0cSVAte6cC3NPRI5enXA4I2hL+KD4OtRz/1nc4tYneh3oGOzA0N1pM/sAF/
 2Y/tyDUtnO7AntxtH+PYNLtQc35Os50ARMnbAjSok734RXobZVL6eloY++yCb6+MCO9E
 jiEDcrQsDzmOoj8dHwIDI4+bDr/2Iev/TNqpov7YA4tSLUuWM4Csig3RRdR2DfRI9hlF
 vB+eaFg3aROwJMpNKeWxDGRRwPuPZXe5qJwjEI+j2iDjkRHVuY2BFhb4vqsGKPv2Ohqy
 vWBQ==
X-Gm-Message-State: AOAM532pty+3DQ1z/vrVzpsMsNqmP+RBcNhQF+viFpU+fCk6Ii3H3J4n
 LkUECu2z/aW6+AQLMGCRpXTLKRn/zXrWjg==
X-Google-Smtp-Source: ABdhPJwVixoRct27OLHRzGgx8zNw+6g6Hz+0L3cIfuc11X2NYuLugCaQb2TOwUCUbxkdHi2L6/3JQg==
X-Received: by 2002:a05:6e02:1c4d:: with SMTP id
 d13mr8955547ilg.49.1633097201929; 
 Fri, 01 Oct 2021 07:06:41 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id y2sm3673593ioj.12.2021.10.01.07.06.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 07:06:41 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id q6so10663100ilm.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 07:06:41 -0700 (PDT)
X-Received: by 2002:a05:6e02:19cb:: with SMTP id
 r11mr8741064ill.120.1633096741727; 
 Fri, 01 Oct 2021 06:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-4-bjorn.andersson@linaro.org>
 <CAE-0n52YaQXQ4-=bR5ffMHOMp7CyFnCS-u9a2pddvaRUQhLrog@mail.gmail.com>
In-Reply-To: <CAE-0n52YaQXQ4-=bR5ffMHOMp7CyFnCS-u9a2pddvaRUQhLrog@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Oct 2021 06:58:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWu4CBC8S8C9P7r=q+F=JqWMzTVAPyzWb+AT4QHbULZQ@mail.gmail.com>
Message-ID: <CAD=FV=UWu4CBC8S8C9P7r=q+F=JqWMzTVAPyzWb+AT4QHbULZQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/msm/dp: Support up to 3 DP controllers
To: Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hi,

On Thu, Aug 26, 2021 at 10:20 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Bjorn Andersson (2021-08-25 16:42:31)
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 2c7de43f655a..4a6132c18e57 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -78,6 +78,8 @@ struct dp_display_private {
> >         char *name;
> >         int irq;
> >
> > +       int id;
> > +
> >         /* state variables */
> >         bool core_initialized;
> >         bool hpd_irq_on;
> > @@ -115,8 +117,19 @@ struct dp_display_private {
> >         struct dp_audio *audio;
> >  };
> >
> > +
> > +struct msm_dp_config {
> > +       phys_addr_t io_start[3];
>
> Can this be made into another struct, like msm_dp_desc, that also
> indicates what type of DP connector it is, i.e. eDP vs DP? That would
> help me understand in modetest and /sys/class/drm what sort of connector
> is probing. dp_drm_connector_init() would need to pass the type of
> connector appropriately. Right now, eDP connectors still show up as DP
> instead of eDP in sysfs.

I'm not convinced that's the right way to do it. I think the right way
forward here is to look at whether drm_of_find_panel_or_bridge() finds
a panel. If it finds a panel then we're eDP. If it doesn't then we're
DP. That matches roughly what Laurent was planning to do for
ti-sn65dsi86:

https://lore.kernel.org/all/20210322030128.2283-11-laurent.pinchart+renesas@ideasonboard.com/

I know technically an eDP and DP controller can have different sets of
features but I think what we really are trying to communicate to
modetest is whether an internal panel or external display is
connected, right?


-Doug
