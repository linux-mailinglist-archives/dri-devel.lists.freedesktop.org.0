Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C1248B930
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 22:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED64210E38D;
	Tue, 11 Jan 2022 21:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0105E10E45A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 21:11:59 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a5so565290wrh.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 13:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2/9bRBuKz2DFJdR8uWugFKUUoxgtrd0TGMh5j7M2oHA=;
 b=GZ/TTMqplqsPO89lCvhQQA6UQuN/c18AygMUQd75PIAQn0vFpYmKW10t/NEGzo9CUP
 3D+MT1XjNONe0NClkpV079yUvtYjLbRjQebGAXfvQQykL0Tx3fKyGDhk6Mn7Yid1QPLu
 11jMNndgyWeC7R4ibehnnPlDUaA3TO7oRwq5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2/9bRBuKz2DFJdR8uWugFKUUoxgtrd0TGMh5j7M2oHA=;
 b=uQhfjwv7KnI/DKZIWfIZTx8UWxDFI2USqUyFzisLEy90Awkof/PXzdn7nlS6rS1Ajh
 L5ePpFhrXz/JZiQq3U39gU0EOzEgBBgn7qUEmQWaPkDd/VWSwhwiDkKtZcjV0rGEOvr0
 fEO6G3ehuDf68eacpTS7yogV1MvFMNTKT8ju/n3qfJotluo5/qt+MjfDP1kzGvRVgF86
 E1gr+9/fop94l5cdgxsZD2eRhiG52/fT715h8uAyCXfgqrHjkMpwjeOeqxu8/QdHvX0O
 k0AmM0z9eRJDGr0ZLrjp1AMQuUfr5KMm/ZbUfHbwwtKO3zNT9QCKx7H+DkgfhIRu85tH
 crng==
X-Gm-Message-State: AOAM532/vraivGBkw/HeDdN8djNAAQXPwRkrb23Vq9fcS65oNh7d7zYE
 9OhezexVXw2SLaFvsNjH+z5ldA==
X-Google-Smtp-Source: ABdhPJzzV/FH0VXTa7ZCIN/IEQB8f4qax6iFyVI1es9RQTWH+dmWmNwQQvAAc7v3ffiQ7KM8BzQF9A==
X-Received: by 2002:adf:f5ca:: with SMTP id k10mr5590643wrp.36.1641935518467; 
 Tue, 11 Jan 2022 13:11:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x8sm6408634wru.102.2022.01.11.13.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 13:11:57 -0800 (PST)
Date: Tue, 11 Jan 2022 22:11:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/doc: overview before functions for drm_writeback.c
Message-ID: <Yd3ynHDre3MpDTLc@phenom.ffwll.local>
References: <20220111202714.1128406-1-daniel.vetter@ffwll.ch>
 <Yd3qCiGixOwlHl0q@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yd3qCiGixOwlHl0q@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 11, 2022 at 10:35:22PM +0200, Laurent Pinchart wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> On Tue, Jan 11, 2022 at 09:27:14PM +0100, Daniel Vetter wrote:
> > Otherwise it's really hard to link to that, which I realized when I
> > wanted to link to the property definitions for a question on irc.
> > 
> > Fix it.
> > 
> > Fixes: e2d7fc20b3e2 ("drm/writeback: wire drm_writeback.h to kernel-doc")
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Cc: Brian Starkey <brian.starkey@arm.com>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for the quick rb, patch pushed.
-Daniel

> 
> > ---
> >  Documentation/gpu/drm-kms.rst | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> > index d14bf1c35d7e..6f9c064fd323 100644
> > --- a/Documentation/gpu/drm-kms.rst
> > +++ b/Documentation/gpu/drm-kms.rst
> > @@ -423,12 +423,12 @@ Connector Functions Reference
> >  Writeback Connectors
> >  --------------------
> >  
> > -.. kernel-doc:: include/drm/drm_writeback.h
> > -  :internal:
> > -
> >  .. kernel-doc:: drivers/gpu/drm/drm_writeback.c
> >    :doc: overview
> >  
> > +.. kernel-doc:: include/drm/drm_writeback.h
> > +  :internal:
> > +
> >  .. kernel-doc:: drivers/gpu/drm/drm_writeback.c
> >    :export:
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
