Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0BD26FCC5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 14:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1EA6EC16;
	Fri, 18 Sep 2020 12:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579646ECE2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 12:43:50 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x23so5189529wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 05:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=IQfmsBiXwX2Es8GDES7bQUFNVTPhBrL2A0QXzeBgz/I=;
 b=UDK3HdbI0cXRlxDUsemZ+pnULj6vEFVLk+iiN2KIdATS7YIWMLOXRnNd4xoGd3idMe
 I3XtsNxgNeh5qUVPfSshLfYMEvuXy5UR1rMR9kiuarIh3ygUwiehnKTt6dgOY1hDT9oV
 i7PavFuiplJdlVUf8kDYJ42VNvqCyEDjGjGZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=IQfmsBiXwX2Es8GDES7bQUFNVTPhBrL2A0QXzeBgz/I=;
 b=uZ7b9F6QKk29nkjfG0yQWymdlO/kUiMIUwxo8ATwdWi8gRtOJfAFtu8XGKiizf4BJd
 GXnZueXBdHS7RpHsQAlqVLkdyIcsnj8MhAmtn38/UrrzIoTkL0LnvPH7c+J67oxMyQBt
 +S2oE+ErXpGlMfYuBH01QGJJrfqc8dKkWgZCw+NYQg3sfpaplfoJ9BtKcbSvP4ZGi3bX
 B38UlGLgpW3MrhZOHZAGDIOBdSjyJvtvUP6MGBloR654NVBQIb74EtpZsd5Q5zpbC/wB
 +POZBdeqPhUNlUK4vCBrHzrXS0qLuGwh1xQNrtqW3FdyZYZX9PphxdvO6lj4jZmEk02E
 2uig==
X-Gm-Message-State: AOAM532YouU+O0X6gWqYm95flnkBf/MZrqDC+ZqsrOJVzixIPtfplHZu
 aoJZMVf7h34UEJXiVRMP5Fz+HQ==
X-Google-Smtp-Source: ABdhPJzhzhGMpyvkb890HEdyRSEQK5FynG/CTfFDdSBz/5TJ+zjC3MVLkcodfQHLYw1wf6ov1b18xQ==
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr15997863wmh.71.1600433028952; 
 Fri, 18 Sep 2020 05:43:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c25sm4808543wml.31.2020.09.18.05.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 05:43:48 -0700 (PDT)
Date: Fri, 18 Sep 2020 14:43:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
Subject: Re: [PATCH] fbcon: Remove the superfluous break
Message-ID: <20200918124346.GZ438822@phenom.ffwll.local>
Mail-Followup-To: Jing Xiangfeng <jingxiangfeng@huawei.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 b.zolnierkie@samsung.com, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, ndesaulniers@google.com,
 natechancellor@gmail.com, george.kennedy@oracle.com,
 peda@axentia.se, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200917131515.147029-1-jingxiangfeng@huawei.com>
 <86015b42-1f87-9f0c-cb34-9d30e8da98a4@embeddedor.com>
 <5F6404B2.3080602@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5F6404B2.3080602@huawei.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 daniel.vetter@ffwll.ch, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, george.kennedy@oracle.com,
 gregkh@linuxfoundation.org, natechancellor@gmail.com, jirislaby@kernel.org,
 peda@axentia.se
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 08:52:02AM +0800, Jing Xiangfeng wrote:
> 
> 
> On 2020/9/18 2:52, Gustavo A. R. Silva wrote:
> > 
> > 
> > On 9/17/20 08:15, Jing Xiangfeng wrote:
> > > Remove the superfuous break, as there is a 'return' before it.
> > > 
> > > Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> > 
> > Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > 
> > Also, the following Fixes tag should be included in the changelog text:
> > 
> > Fixes: bad07ff74c32 ("fbcon: smart blitter usage for scrolling")
> 
> OK, I'll send a v2 with this tag.

Please also collect all the r-b tags you received so I can just apply
everything.
-Daniel

> 
> > 
> > Thanks
> > --
> > Gustavo
> > 
> > > ---
> > >   drivers/video/fbdev/core/fbcon.c | 2 --
> > >   1 file changed, 2 deletions(-)
> > > 
> > > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > > index 0b49b0f44edf..623359aadd1e 100644
> > > --- a/drivers/video/fbdev/core/fbcon.c
> > > +++ b/drivers/video/fbdev/core/fbcon.c
> > > @@ -1727,7 +1727,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
> > >   				    vc->vc_video_erase_char,
> > >   				    vc->vc_size_row * count);
> > >   			return true;
> > > -			break;
> > > 
> > >   		case SCROLL_WRAP_MOVE:
> > >   			if (b - t - count > 3 * vc->vc_rows >> 2) {
> > > @@ -1818,7 +1817,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
> > >   				    vc->vc_video_erase_char,
> > >   				    vc->vc_size_row * count);
> > >   			return true;
> > > -			break;
> > > 
> > >   		case SCROLL_WRAP_MOVE:
> > >   			if (b - t - count > 3 * vc->vc_rows >> 2) {
> > > 
> > .
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
