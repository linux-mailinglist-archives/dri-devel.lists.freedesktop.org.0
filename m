Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C7A76E3A4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4C610E5D9;
	Thu,  3 Aug 2023 08:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72ED610E5D9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:52:44 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-521caf0d7a6so191520a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1691052763; x=1691657563;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Cn0cLl3gGNWIyCVwa8rBi5Yd6oueHSEN6EFsNN/UTTY=;
 b=U4d9eLqC/hMSyDQxtWAP0hEsjDTC4AA9f7Iphglq7loBGmCnM4i08cE+rMbN/4Mhl1
 rBF6t5lLQTu8RqXY6N1/islVKoLsTQjpa9cWfHVl/C+Uz287LMIV3FB0qbahzAjEOBcF
 ZAIUYmJRSNRXnM92h3LZ0YFxbtgoaS3uS1sVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691052763; x=1691657563;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cn0cLl3gGNWIyCVwa8rBi5Yd6oueHSEN6EFsNN/UTTY=;
 b=K6JSn80bSKabYNtHV+ggJ0wRuDH4Ep7zWGy07XwlJ7q4DdJPvGEV7dynTRAPTfvMOu
 QD5yIFXf3gY6hezShv0igCPKI24D5y2uY/91nL/VzIg0hNSmREpEqFJDiEgQu+B13qKm
 8QySWxnxM3z9421nPFPrl+fu27N5FZjIqjmWxLwFrB5KgaDlOuVh0cgLucT5pTEyo4zv
 fzNNSQaFfj04lqlveK3ii0eOB1cngOrG1mtkNKrNOIqKztEu6+hc9RYBzGXqkSybVHS4
 WBscV6uEAGc9j//Ee+nChkOG+5UWead7J4mD60OrgIIAlZS2tQDShav6P+W8HiEEVaAi
 Hjxg==
X-Gm-Message-State: ABy/qLbGgEqIzI8hb1HhMR1fJbPShERg6zdBBpQhlth+bvN9tip9f1Al
 rgDpN/C9gckXHAASp4jNxMM1aA==
X-Google-Smtp-Source: APBJJlFlZjdIo145ZsuoyiR5X6oVNswQeQBdefA6vl2wvZ5BdU6o6TdY6tmPc92TXrgNqLmx3Za9WA==
X-Received: by 2002:a05:6402:4404:b0:522:e6b0:8056 with SMTP id
 y4-20020a056402440400b00522e6b08056mr5623245eda.4.1691052762855; 
 Thu, 03 Aug 2023 01:52:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 x4-20020aa7d6c4000000b0051e2cde9e3esm9879941edr.75.2023.08.03.01.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 01:52:42 -0700 (PDT)
Date: Thu, 3 Aug 2023 10:52:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: GUO Zihua <guozihua@huawei.com>
Subject: Re: [PATCH] fbcon: Make fbcon_registered_fb and
 fbcon_num_registered_fb static
Message-ID: <ZMtq2NtCIQxKRqPh@phenom.ffwll.local>
References: <20230803020939.491-1-guozihua@huawei.com>
 <ZMtoA/cYt6rtTpAD@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMtoA/cYt6rtTpAD@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.3.0-2-amd64 
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
Cc: dri-devel@lists.freedesktop.org, deller@gmx.de, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 03, 2023 at 10:40:35AM +0200, Daniel Vetter wrote:
> On Thu, Aug 03, 2023 at 10:09:39AM +0800, GUO Zihua wrote:
> > fbcon_registered_fb and fbcon_num_registered_fb is not referred outside
> > drivers/video/fbdev/core/fbcon.c, so make them static.
> > 
> > Signed-off-by: GUO Zihua <guozihua@huawei.com>
> 
> Applied both of your patches to drm-misc-next.

Correction, I dropped the agpgart patch again because amd gart x86 arch
code needs that symbol.

> -Daniel
> 
> > ---
> >  drivers/video/fbdev/core/fbcon.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > index 887fad44e7ec..976900d6893c 100644
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -102,8 +102,8 @@ enum {
> >  
> >  static struct fbcon_display fb_display[MAX_NR_CONSOLES];
> >  
> > -struct fb_info *fbcon_registered_fb[FB_MAX];
> > -int fbcon_num_registered_fb;
> > +static struct fb_info *fbcon_registered_fb[FB_MAX];
> > +static int fbcon_num_registered_fb;
> >  
> >  #define fbcon_for_each_registered_fb(i)		\
> >  	for (i = 0; WARN_CONSOLE_UNLOCKED(), i < FB_MAX; i++)		\
> > -- 
> > 2.17.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
