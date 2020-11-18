Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C052B810D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 16:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19476E446;
	Wed, 18 Nov 2020 15:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D2C6E444;
 Wed, 18 Nov 2020 15:47:46 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c17so2612574wrc.11;
 Wed, 18 Nov 2020 07:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YJpTSJsL9moVZsBZji+qYlimshdtftJObIcujQ/7f3I=;
 b=qvKkyEszF9bvQyIp8KuS6pTbQ5AUDFADd3r5741U3zdxwGmmcPm4w8vxW0KK7glcz4
 d2w6CoLAFVKKnTyta/6mho7GqdCTyN7/3g+XCiKcyhtClStjVFemIFk5dMO8hpEijFIn
 te6se+GmjKACvvBlwuaLd+6RgeDOHa8ERYKQae6Uur1iFfoGtdVmYE4zZ3JmTk+OiXrv
 7btfl3QZfzl9hfKTQ8n5X6kkX37rYzH1bdaQmSs8HbhJEwhLS+5Yk/0Eg3jSKDWsLM8r
 OvsOAGJA9scIFTlvJyUPN6yCbTEh3dak3xPA95o7jM8Doqeu2ZVR15TeAtooJXSzFGTR
 vFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YJpTSJsL9moVZsBZji+qYlimshdtftJObIcujQ/7f3I=;
 b=X6y8MtA419juaxVaJ04RQFV0JVljjVqAT4MLC5bzampz1qVSCEdw0ZSZXTQIJYQVfK
 U/gHu53Mo1jBzwmTcatVB//ahidw4il0u7VL67bpNq0fd9kHl7dyaaBTyzerYEM/rQka
 tXesicSfjlLKIJdxQdns2dHXNruevFxy9hoQ/EbAJZ/YFdArjFIVJENYWmXhtjb2Hg+t
 Sx6b+6Kcj0s/NV0kH3bLj9AV/MNRnOjvsYrF6BTkeBBIFRpRuzedHyhJcbqJ9Qe/xAdg
 ZaXbCdPrt1dw9zXYo3AYIkx/knNv9o2v/R0l2OfxbrIIEJWREulwYCKaZOuW/hGxnmsA
 eWXg==
X-Gm-Message-State: AOAM532kXGGrlSGV6yOtkyYoSchFKbFQNsPYuffu9c7vhWnDfjPaUxK8
 UFx7SDM5kvxxV9F0dUn5BN/zbDAae1QUygyoJa8=
X-Google-Smtp-Source: ABdhPJyCgGodENbiW6qRPwGh0bJqiogtkj2ctSrQugr1iQqxGDiQPrRTc+Ni8ZY+fWOB4URpKdFConwkoBpwKS1ULR4=
X-Received: by 2002:adf:f04b:: with SMTP id t11mr5098446wro.147.1605714464802; 
 Wed, 18 Nov 2020 07:47:44 -0800 (PST)
MIME-Version: 1.0
References: <20201117172608.2091648-1-swboyd@chromium.org>
 <71aebca216babf4010c92d4d1ce9a9b4@codeaurora.org>
 <160565358127.60232.4382778730228368993@swboyd.mtv.corp.google.com>
In-Reply-To: <160565358127.60232.4382778730228368993@swboyd.mtv.corp.google.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 18 Nov 2020 07:49:31 -0800
Message-ID: <CAF6AEGsDyvFVxAME1_VUprPKdrpEGdvP9XrQEG_-=1mRRcRBow@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Remove chatty vbif debug print
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 2:53 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting abhinavk@codeaurora.org (2020-11-17 12:34:56)
> > On 2020-11-17 09:26, Stephen Boyd wrote:
> > > I don't know what this debug print is for but it is super chatty,
> > > throwing 8 lines of debug prints in the logs every time we update a
> > > plane. It looks like it has no value. Let's nuke it so we can get
> > > better logs.
> > >
> > > Cc: Sean Paul <sean@poorly.run>
> > > Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> >
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 3 ---
> > >  1 file changed, 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> > > index 5e8c3f3e6625..5eb2b2ee09f5 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> > > @@ -245,9 +245,6 @@ void dpu_vbif_set_qos_remap(struct dpu_kms
> > > *dpu_kms,
> > >       forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl,
> > > true);
> > >
> > >       for (i = 0; i < qos_tbl->npriority_lvl; i++) {
> > > -             DPU_DEBUG("vbif:%d xin:%d lvl:%d/%d\n",
> > > -                             params->vbif_idx, params->xin_id, i,
> > > -                             qos_tbl->priority_lvl[i]);
> >
> > Instead of getting rid of this print, we should optimize the caller of
> > this.
>
> Does the print tell us anything? Right now it prints 8 lines where it
> feels like it could be trimmed down:
>
>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:0/3
>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:1/3
>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:2/4
>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:3/4
>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:4/5
>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:5/5
>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:6/6
>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:7/6
>
> maybe one line that combines the index into values?
>
>            [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 [3 3 4 4 5 5 6 6]
>

or possibly convert to a tracepoint (so it doesn't spam the drm_trace buffer)

BR,
-R

> But again I have no idea if this print is really useful. Maybe we can
> print it only if the value changes from what was already there?
> Basically move the print into dpu_hw_set_qos_remap() and then skip out
> early if nothing changed or print and modify the register.
>
> > This is what
> > we are doing in downstream. So we need to update the property only if we
> > are switching from a RT client
> > to non-RT client for the plane and vice-versa. So we should try to do
> > the same thing here.
> >
> >         is_rt = sde_crtc_is_rt_client(crtc, crtc->state);
> >         if (is_rt != psde->is_rt_pipe) {
> >                 psde->is_rt_pipe = is_rt;
> >                 pstate->dirty |= SDE_PLANE_DIRTY_QOS;
> >         }
> >
> >
> >         if (pstate->dirty & DPU_PLANE_DIRTY_QOS)
> >                 _dpu_plane_set_qos_remap(plane);
> >
>
> Sounds great! Can you send the patch?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
