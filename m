Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D73C1B47
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 23:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3146E924;
	Thu,  8 Jul 2021 21:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB386E927
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 21:57:49 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id gb6so12292162ejc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 14:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ka8971iLGVECeIiGATZdT+8iLbrcD8PBA/lItxvX5l4=;
 b=W3TLErmbWYAqAGbJqGZ7cSRLWFchLr+JEt8MkyR2LZMmD+LHUsPOnJDISaD0Pvm9Y4
 yKuuQAWZOYnaWgnXLb8Z+YEte1ax/SiwgLPTHMc7l06ttTVvPfkfaUtylJdjhl3c4jkM
 sPEdn5fGPtIv+AdWO+yf05RH4Kre9mkBeCoPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ka8971iLGVECeIiGATZdT+8iLbrcD8PBA/lItxvX5l4=;
 b=lKEI5HAk1XInIVdJquhatJ8F616xSOcuLrppK7nNxMBpeHLl2yHESY9dmCfClqh9xa
 e/+RkVDTzwlOhZzLFXiRchWghHpzRNRXyYwBJconxwqIP1gwdvXRJSK26yANN3YV+F53
 K0P9ohT66uCV4bbsu9BGL1LWH+9Oj4FT6WSlHI0XZM6RoFauVlyhYuZ1qLKXHPoMjs5Y
 EZzWlC4O+e++2Z3wq5D1T/Uo1wiWbt1v9l00XLjOTcbqt0cURTZL/maiebqzoupbLbM+
 VhRoBdkIxPr5cV83bTCZYFdulvk6hhFiPqAQrxoweqZhPvLpZxhBsdpV/nqQTGMmVxQX
 +3Ww==
X-Gm-Message-State: AOAM531hFDcuFWJeRMBfmsvEGaxn576clakqs4o1xU8RKNgYGVfY9xAn
 wiCvMy5BZq7z0kvOXxAbmuuC2zTy01LdWw==
X-Google-Smtp-Source: ABdhPJyOWl3koK9YHneli0WvaIWl33viTfApPkeR6GW4pU7kjiaz4f3nFR7chxcXN/a0HGgNiPv+1Q==
X-Received: by 2002:a17:906:b201:: with SMTP id
 p1mr32861759ejz.30.1625781468324; 
 Thu, 08 Jul 2021 14:57:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id ja13sm1472284ejc.82.2021.07.08.14.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 14:57:47 -0700 (PDT)
Date: Thu, 8 Jul 2021 23:57:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Roberto Sassu <roberto.sassu@huawei.com>
Subject: Re: [PATCH] drm/qxl: add NULL check for bo->resource
Message-ID: <YOd02qH1t5u+MfXt@phenom.ffwll.local>
References: <20210708114710.8186-1-christian.koenig@amd.com>
 <9aae31dac09b4430918f39b9c5d79c27@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9aae31dac09b4430918f39b9c5d79c27@huawei.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 08, 2021 at 12:10:25PM +0000, Roberto Sassu wrote:
> > From: Christian König [mailto:ckoenig.leichtzumerken@gmail.com]
> > Sent: Thursday, July 8, 2021 1:47 PM
> > When allocations fails that can be NULL now.
> > 
> > Signed-off-by: Christian König <christian.koenig@amd.com>
> > Reported-by: Daniel Bristot de Oliveira <bristot@kernel.org>
> > Tested-by: Daniel Bristot de Oliveira <bristot@kernel.org>
> 
> Hi Christian
> 
> thanks, it worked.
> 
> Tested-by: Roberto Sassu <roberto.sassu@huawei.com>

Doesn't this need a

Fixes: bfa3357ef9ab ("drm/ttm: allocate resource object instead of embedding it v2")

With that:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Roberto
> 
> HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
> Managing Director: Li Peng, Li Jian, Shi Yanli
> 
> > ---
> >  drivers/gpu/drm/qxl/qxl_ttm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> > index 19fd39d9a00c..37a1b6a6ad6d 100644
> > --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> > +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> > @@ -127,7 +127,7 @@ static void qxl_bo_move_notify(struct
> > ttm_buffer_object *bo,
> >  	struct qxl_bo *qbo;
> >  	struct qxl_device *qdev;
> > 
> > -	if (!qxl_ttm_bo_is_qxl_bo(bo))
> > +	if (!qxl_ttm_bo_is_qxl_bo(bo) || !bo->resource)
> >  		return;
> >  	qbo = to_qxl_bo(bo);
> >  	qdev = to_qxl(qbo->tbo.base.dev);
> > --
> > 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
