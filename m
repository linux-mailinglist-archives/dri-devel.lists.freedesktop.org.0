Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8332D4F7007
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 03:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE6810E155;
	Thu,  7 Apr 2022 01:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27A010E155
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 01:15:27 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id b13so4128097pfv.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 18:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=67SY53azgMzssWukWO6AXIcinf82Rf3nAPDHa+IqhlQ=;
 b=MAChzFYtQNICmdqrAExZPki5u6vHj8GTdTxZag/4bzDo5W0JLbWW6l6+FFUu0DfxUv
 FKfiuSO1uStfSFwNQeE0B+UVoKFkVi/m+lLYyALFmpro8YhHsZf94gaxcRRObJHuAtjd
 SomWigjKFA8Gpnwv2dXshTTEgFoNSEldpEsZz69sqt8HhjJptP+BLWIQZyaLxrnXj9Uq
 8e8PXhkO3wmyz51WzhtR+A8a2wCmhqk+G9xi2qYckCHDEfYKu25n6a8D10zhaRrPKdtX
 DFIjVVhyHhoJO/oHc+Q+6Hrce3hc22q7eUHm5LivJrvIjwpaAAFfKV4WfINKMgSzQpqJ
 I/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=67SY53azgMzssWukWO6AXIcinf82Rf3nAPDHa+IqhlQ=;
 b=SWMPu8iRwtR/FVOWPsBDhkOiwJmwOiIS0ksgLzKdKDhdxlUVwigkgedGLcb1F0LIqg
 E9mDVSf+oUTMNVcV4e6bUGZK7fJbwF+DKfUCfpLiI6vnsifSlYiQ8+RM6q45uPzB5xLO
 s4JK77i5mzSu8SUnTeWIs9afo50spPzUG5kCSLUQlIZAM1eIAyMkoGdS+LQrrqh2rcsL
 xXgt5xRl2xMsCH4Q1rd8K4pfFfUjJ5sSosDy/s/eMrWz4rrwFQHUYneXr5gjpiBryuJG
 QXUsNHzd1x7krh8T1Jb6dVuaF+2r+Qih8OV+e7cjClfaFcj8rARfompLb9CA3paYyiqp
 mj4A==
X-Gm-Message-State: AOAM531UTiacvHiFj8PhW32XJFQSonwPMcr/32HuAQ8+5b5UsJRh2rzg
 1ZHZXVAVDVAd9DEmhNGbPzA=
X-Google-Smtp-Source: ABdhPJwMtjvF2nONDR+8O7Bl75hwcWR5WOrYWpJ3XCFloXajc6Ermx4Tgo5BXGtkU1c535Vprd9R4w==
X-Received: by 2002:a63:3d4b:0:b0:386:322:ff8c with SMTP id
 k72-20020a633d4b000000b003860322ff8cmr9472270pga.385.1649294126189; 
 Wed, 06 Apr 2022 18:15:26 -0700 (PDT)
Received: from localhost.localdomain ([119.3.119.18])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a63af10000000b0039953dfaa19sm6842108pge.20.2022.04.06.18.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 18:15:25 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: patrik.r.jakobsson@gmail.com
Subject: Re: [PATCH] drm/gma500: fix a missing break in psb_driver_load
Date: Thu,  7 Apr 2022 09:15:19 +0800
Message-Id: <20220407011519.13951-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMeQTsbK+Akk0m3UUCx-U9F6ju_OVM0R6uZN5KB-Gu6C6Do1pw@mail.gmail.com>
References: <CAMeQTsbK+Akk0m3UUCx-U9F6ju_OVM0R6uZN5KB-Gu6C6Do1pw@mail.gmail.com>
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
Cc: airlied@linux.ie, xiam0nd.tong@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Apr 2022 09:27:19 +0200, Patrik Jakobsson wrote:
> On Fri, Apr 1, 2022 at 1:58 PM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
> >
> > Instead of exiting the loop as expected when an entry is found, the
> > list_for_each_entry() continues until the traversal is complete. To
> > avoid potential executing 'ret = gma_backlight_init(dev);' repeatly,
> > break the loop when the entry is found.
> >
> > Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> > ---
> >  drivers/gpu/drm/gma500/psb_drv.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> > index 2aff54d505e2..b61a8b0eea38 100644
> > --- a/drivers/gpu/drm/gma500/psb_drv.c
> > +++ b/drivers/gpu/drm/gma500/psb_drv.c
> > @@ -402,6 +402,9 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
> >                         ret = gma_backlight_init(dev);
> >                         break;
> >                 }
> > +
> > +               if (!ret)
> > +                       break;
> 
> Hi,
> We cannot do it like this either. If the first connector isn't LVDS or
> MIPI we would just break out of the iteration because ret is
> presumably 0 at start and gma_backlight_init() would never run.
> 
> -Patrik

Yes, you are correct. I have sent a v2 patch[1]: just goto out; when found.
Please check it, thank you very much.

[1]: https://lore.kernel.org/all/20220406113143.10699-1-xiam0nd.tong@gmail.com/

--
Xiaomeng Tong
 
> 
> >         }
> >         drm_connector_list_iter_end(&conn_iter);
> >
> > --
> > 2.17.1
