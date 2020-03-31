Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89153199962
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 17:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5449C6E84E;
	Tue, 31 Mar 2020 15:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6F66E84D
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 15:15:18 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z7so241950wmk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 08:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ipYWlIFq3tHRPQUnqZtBdxsK4/UyR731/H9eH9PnfT4=;
 b=KbvvbCuWTnx3deVUNXfh6ZH7/iir2HKLToXknDwo7In/7NB8wHWU62m7SbNHlQK15w
 NYMV8jhWujQQ7f0S6Ej7AT5Bn2gH8fg/ntDxAxG/2Ml3w1WIM8Eh5GxUxAw2z0TfpFML
 V4jsubaGezs2z+6lJKnB1kN6/No3ukTNiELuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ipYWlIFq3tHRPQUnqZtBdxsK4/UyR731/H9eH9PnfT4=;
 b=Ca8LJJpvTejWxJdl+nP3GKuSbA3PUCiaOTFj3pLPd4HD2kajS6BO6NBR5b4KVaKID3
 2rxkV/Lhq7QjUizUOQGmmamKqk448rLOOIL/4mxt7QGHiuCl6r92f1SDgbIMGyoE7FV/
 yevoIeYZaOVaI38NWULbpds26emDwfMmCeBv5gwthT+4iSZb8sVN/yS437WFIOndCBMd
 xC7O38VTdL3wVpbdF+LcSahJAd8K2+oIAoQNHVG4Vhesl47UnXZQLV27wPm3+IWgj1iR
 kxoRQOJPkBkj5/p85j1QoKRfhzCTtPhqgH9/molOaBMhzaNPlxgQzTFWkPLoO/5rybp5
 Qjbw==
X-Gm-Message-State: ANhLgQ0r40g/s/pys3kbgSRVrpnUIXKQ2t2MQe5viNaDLF5YazlLYNa/
 XqiZ+EGesnGZn7+5tYvwdazRGw==
X-Google-Smtp-Source: ADFU+vtAGfwopaPt/m4X2IibkfKMGh7X4KlgcFgCC08sXSkC7SEmBbQwoH17zK8HUyK6RhKgz0hjCQ==
X-Received: by 2002:a1c:63c4:: with SMTP id x187mr3935335wmb.124.1585667717161; 
 Tue, 31 Mar 2020 08:15:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v21sm4140105wmj.8.2020.03.31.08.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 08:15:16 -0700 (PDT)
Date: Tue, 31 Mar 2020 17:15:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [Xen-devel] [PATCH] drm/xen: fix passing zero to 'PTR_ERR' warning
Message-ID: <20200331151514.GO2363188@phenom.ffwll.local>
Mail-Followup-To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 Ding Xiang <dingxiang@cmss.chinamobile.com>,
 oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <1585562347-30214-1-git-send-email-dingxiang@cmss.chinamobile.com>
 <b4d43b05-8b30-749c-0b60-87b4cdd7b1dd@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4d43b05-8b30-749c-0b60-87b4cdd7b1dd@gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ding Xiang <dingxiang@cmss.chinamobile.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 05:50:10PM +0300, Oleksandr Andrushchenko wrote:
> On 3/30/20 12:59, Ding Xiang wrote:
> > Fix a static code checker warning:
> >      drivers/gpu/drm/xen/xen_drm_front.c:404 xen_drm_drv_dumb_create()
> >      warn: passing zero to 'PTR_ERR'
> > 
> > Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

merged to drm-misc-next-fixese.
-Daniel

> > ---
> >   drivers/gpu/drm/xen/xen_drm_front.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
> > index 4be49c1..3741420 100644
> > --- a/drivers/gpu/drm/xen/xen_drm_front.c
> > +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> > @@ -401,7 +401,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
> >   	obj = xen_drm_front_gem_create(dev, args->size);
> >   	if (IS_ERR_OR_NULL(obj)) {
> > -		ret = PTR_ERR(obj);
> > +		ret = PTR_ERR_OR_ZERO(obj);
> >   		goto fail;
> >   	}

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
