Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572AC2B77D4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4F56E419;
	Wed, 18 Nov 2020 08:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92076E158
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 22:53:03 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id u2so11097142pls.10
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 14:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=Ce5mdOiUnXdpgxCp5xEN1C00ke4lV/R4t5KP7C9QieU=;
 b=lpuXNOnoMJPZCqJXzeKrt0bjw4/lBl9bLgEmGMpS9SlE6ATrhwz3JE00zeefPVNRyE
 SmBlnlNZNbh0M/9eC1gsvbObC5dvzN8ha7DagBcePbYJwkaNToAum5xcWOWe4M9GJVUH
 MjjJWm6VpC2Z1Ato6DZxLnyIxWJllMJ8w39a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=Ce5mdOiUnXdpgxCp5xEN1C00ke4lV/R4t5KP7C9QieU=;
 b=gSP0ZvIzyIw1NT7u9zAQoOEw02iZZv2g2MOd6QtFJwaXFRXczZCNeO1qKOKJdhGXJy
 RIft4PD7Kpsa+HJY1cKNul0cjD9dQ+vi/49GAfzrDAQ+V419MePFsYvrFf9TXczXjJhZ
 Gns7cwOD00OKWsResCv0ONJCp5JmV+0QxJwsq9XY9CdfgZmZhsMUqJezY/w7lNrdi+UE
 HsS/aIu6e2LWxHheWRZ8Oy1b4bhB6btjb9IxL4Gs515IyHT9x/AuJu4ZMzSLmyWtSo3E
 /ijo7cNeTbiGrHe6P29fHONmU3kuKhTLV4t6kZILbNKN34Qixdo95AmVxmhLccbdTzrm
 u1qA==
X-Gm-Message-State: AOAM5333NYNaxG+apm+fv61Kxxu4wDcLI6vq4F9Gy/UOZJhbUhGx8Zxr
 GtYgBvdE0rRIzGV5cJrjnJE82Q==
X-Google-Smtp-Source: ABdhPJyjPQ5ZJcnbca+0zpUp5+RhAj0mYPzGqNb46PCd3r24FPJ1Ddl2hsvuztEftWzQK9r9fBJuPw==
X-Received: by 2002:a17:90a:d486:: with SMTP id
 s6mr1202521pju.115.1605653583407; 
 Tue, 17 Nov 2020 14:53:03 -0800 (PST)
Received: from chromium.org ([100.99.132.239])
 by smtp.gmail.com with ESMTPSA id p7sm12688384pfn.83.2020.11.17.14.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 14:53:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <71aebca216babf4010c92d4d1ce9a9b4@codeaurora.org>
References: <20201117172608.2091648-1-swboyd@chromium.org>
 <71aebca216babf4010c92d4d1ce9a9b4@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Remove chatty vbif debug print
From: Stephen Boyd <swboyd@chromium.org>
To: abhinavk@codeaurora.org
Date: Tue, 17 Nov 2020 14:53:01 -0800
Message-ID: <160565358127.60232.4382778730228368993@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kalyan_t@codeaurora.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting abhinavk@codeaurora.org (2020-11-17 12:34:56)
> On 2020-11-17 09:26, Stephen Boyd wrote:
> > I don't know what this debug print is for but it is super chatty,
> > throwing 8 lines of debug prints in the logs every time we update a
> > plane. It looks like it has no value. Let's nuke it so we can get
> > better logs.
> > 
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> > index 5e8c3f3e6625..5eb2b2ee09f5 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> > @@ -245,9 +245,6 @@ void dpu_vbif_set_qos_remap(struct dpu_kms 
> > *dpu_kms,
> >       forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, 
> > true);
> > 
> >       for (i = 0; i < qos_tbl->npriority_lvl; i++) {
> > -             DPU_DEBUG("vbif:%d xin:%d lvl:%d/%d\n",
> > -                             params->vbif_idx, params->xin_id, i,
> > -                             qos_tbl->priority_lvl[i]);
> 
> Instead of getting rid of this print, we should optimize the caller of 
> this.

Does the print tell us anything? Right now it prints 8 lines where it
feels like it could be trimmed down:

           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:0/3
           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:1/3
           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:2/4
           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:3/4
           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:4/5
           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:5/5
           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:6/6
           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 lvl:7/6

maybe one line that combines the index into values?

           [drm:dpu_vbif_set_qos_remap] vbif:0 xin:0 [3 3 4 4 5 5 6 6]

But again I have no idea if this print is really useful. Maybe we can
print it only if the value changes from what was already there?
Basically move the print into dpu_hw_set_qos_remap() and then skip out
early if nothing changed or print and modify the register.

> This is what
> we are doing in downstream. So we need to update the property only if we 
> are switching from a RT client
> to non-RT client for the plane and vice-versa. So we should try to do 
> the same thing here.
> 
>         is_rt = sde_crtc_is_rt_client(crtc, crtc->state);
>         if (is_rt != psde->is_rt_pipe) {
>                 psde->is_rt_pipe = is_rt;
>                 pstate->dirty |= SDE_PLANE_DIRTY_QOS;
>         }
> 
> 
>         if (pstate->dirty & DPU_PLANE_DIRTY_QOS)
>                 _dpu_plane_set_qos_remap(plane);
> 

Sounds great! Can you send the patch?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
