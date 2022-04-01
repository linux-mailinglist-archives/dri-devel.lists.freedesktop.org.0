Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDD34EEC21
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 13:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB6E10E074;
	Fri,  1 Apr 2022 11:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D98910E074
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 11:16:10 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id gb19so2154510pjb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 04:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OEhuS+fxsVCDNNS1MKILSv4OXms02eQi0iGfBJLmlCc=;
 b=Mx/784l+9YYlEEqw3tkMkrhp/CWEf9Pyp7wfMbV9tAivm7X2pHJ+motN03vf5CHEIo
 4tR3Fa1ZoNDkpcv0q5wF9OdG17Btvg/OaIzlM088QYylOEyxgvL1IoYBJn/n0hgdoLrn
 z/cUGx8kEvx1/cGPJj025ci8+sYK8KIX1vSv5uca0rE8R/BdzgOWpk7fEt2Cwbn30bf+
 nQJ6t9nm7UUaTVlukBVuzDQyE3vB2l6ZJiL9NobmJo3E3AH5xcQxyLXhmVVRxZuu3yt/
 WgBWLtUV2KvCUChEuwNOwVxp7TeF/GLs0xxeZoTj/Vmeo623jZIFREAwE/AdjmqFevGw
 tWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OEhuS+fxsVCDNNS1MKILSv4OXms02eQi0iGfBJLmlCc=;
 b=E52o4jNDF+hRC1BlJeRoPqqZT4V3NXLeU/ngigZr058hGScU1AdVPSjQ2Xa4ZVr17T
 ofyRh2V3UhSw0g7sbuPNDdsoPDlVwlE0vISqsAGNa5ZE40gdiD1DpoyHc12cntj958Mr
 A2IlGuXI6WrY1jzmgFPEZFUAcXQ9HWwShuBOqASgKnFG3m+24oL9Gl/dBzoa/ds1PlC1
 SKbF+aTWx+nAfBwv89Lmw+HLt4enRLtjoJ+RxxuD6a3us9FddjlhLMqX6y+N2avE9cKD
 4xT+SwW91VUBoaBoOhXxvYOpz5dvTJ+/HWEYMWy3Kgc2LCmZXiXW2rOwr6LuDmT3cL98
 DqJw==
X-Gm-Message-State: AOAM533neNBcnsjTJCBiC0K/jqlMy8Nc19zDcKTqC8/Yb87qx90I0r+t
 Lm6YNnzYLgvLq67sRO0evnkm5BT5SKNEoQ==
X-Google-Smtp-Source: ABdhPJwpyHXGvM/g750syQ26/sjrGpjqyb2Zau7YvEDNf2rjm603jlaKXSvvWieMHYcAR9JbF0mkAA==
X-Received: by 2002:a17:90b:4d08:b0:1c7:7567:9f6b with SMTP id
 mw8-20020a17090b4d0800b001c775679f6bmr11520261pjb.134.1648811770163; 
 Fri, 01 Apr 2022 04:16:10 -0700 (PDT)
Received: from ubuntu.huawei.com ([119.3.119.18])
 by smtp.googlemail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm13383703pjb.2.2022.04.01.04.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 04:16:09 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: patrik.r.jakobsson@gmail.com
Subject: Re: [PATCH 5/5] gma500: fix a missing break in psb_driver_load
Date: Fri,  1 Apr 2022 19:16:04 +0800
Message-Id: <20220401111604.8106-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMeQTsYcyk9vRO6OaBi-KsptBzJ1Jh-2bOa0UW1+F+JUnDwH=g@mail.gmail.com>
References: <CAMeQTsYcyk9vRO6OaBi-KsptBzJ1Jh-2bOa0UW1+F+JUnDwH=g@mail.gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yakui.zhao@intel.com, xiam0nd.tong@gmail.com,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Apr 2022 12:10:48 +0200, Patrik Jakobsson wrote:
> On Wed, Mar 30, 2022 at 2:03 PM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
> >
> > Instead of exiting the loop as expected when an entry is found, the
> > list_for_each_entry() continues until the traversal is complete. To
> > avoid potential executing 'ret = gma_backlight_init(dev);' repeatly,
> > add a break after the switch statement.
> >
> > Fixes: 5c49fd3aa0ab0 ("gma500: Add the core DRM files and headers")
> > Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> 
> This is incorrect. If we always break on the first iteration we will
> only run gma_backlight_init() if the first connector is LVDS or MIPI.
> This might not be the case and gma_backlight_init() will never run.
> The other loops you have been looking at have an "if (xxx != yyy)
> continue;" statement at the top which skips all the unwanted entries
> but this loop does not.
> 

Yes, your are correct. But it still need to break the loop when found it.
So it is better to add if(!ret) break; after the switch statment.
I will resend another patch if it is necessary.

> > ---
> >  drivers/gpu/drm/gma500/psb_drv.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> > index 65cf1c79dd7c..d65a68811bf7 100644
> > --- a/drivers/gpu/drm/gma500/psb_drv.c
> > +++ b/drivers/gpu/drm/gma500/psb_drv.c
> > @@ -398,6 +398,8 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
> >                         ret = gma_backlight_init(dev);
> >                         break;
> >                 }
> > +
> > +               break;
> >         }
> >
> >         if (ret)
> > --
> > 2.17.1
> >

--
Xiaomeng Tong
