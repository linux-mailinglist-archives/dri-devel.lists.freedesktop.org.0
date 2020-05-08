Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6576A1CA87F
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 12:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFC56EADC;
	Fri,  8 May 2020 10:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240286EADC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 10:45:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k1so1313687wrx.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 03:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FgTPoKshQV40rLJWMdUeDg1vb+1XePgzClvX1kYBbxs=;
 b=JgvO+jlQoKA79rJuUcx/5YaZ58YUgNoF5ZiZnL2KNY9R8qyqrDhh/5+CC4Z3S1oHe2
 p/avy/u/rCFS+yNo2tblMnO+Xnxs54zj17MyvTYogVnmS2H34lPhtw0d1wmrwe4zOLk9
 K3rwKtnHZ6ckRXo7r/VgRJl31TYzn4hjlNsXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FgTPoKshQV40rLJWMdUeDg1vb+1XePgzClvX1kYBbxs=;
 b=gTXjtpCJKJf9bMSfO+Ztg8MD6K9Jbi5/7EEtezrYlyQQv08wqxPvBn9ScSH0sJS31T
 15MNM8ppLchc8jZSxJjBic6b8gAXHLXWQHzrGzS+XppNFG8tfbPB4GhlXG5nkFkHpsxy
 PoAlprmk4/Gq5LVwMSRG2EP1yp4qHAsTF4CA0+wYJrfa/taffL+Pv2zNfbd09Tk4ouyr
 kCkl48pOjnpvPCW+MqsTr1HDeOMUMsSFPgYHcqocFD6F2+/mF/IhPmyQlDx2BziC4fcE
 V2kqcT/AH1fPpE++t5+VS0BU7DdkPwThr09lj7HDrOp0VBi8bHMsR1dksxlHH8NsQokn
 xmUg==
X-Gm-Message-State: AGi0PubS+i5Ap7JBUid3/ZQkcoguNkeuH4p/MH6fiIFOWPsA3MwsMLK6
 BZ63wnolbZczeluHBcDKPE52hA==
X-Google-Smtp-Source: APiQypLzxjuaCBiIRw7GTRO2/NWl7lhtzzzltuhRaEf6x18+wIfe8IYHoQL3QbHV/Jnlrm5v7XNv+Q==
X-Received: by 2002:adf:fac4:: with SMTP id a4mr2160311wrs.134.1588934738715; 
 Fri, 08 May 2020 03:45:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z11sm2294388wro.48.2020.05.08.03.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 03:45:37 -0700 (PDT)
Date: Fri, 8 May 2020 12:45:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 04/36] drm/doc: drop struct_mutex references
Message-ID: <20200508104535.GH1383626@phenom.ffwll.local>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-5-emil.l.velikov@gmail.com>
 <20200508062749.GC10381@phenom.ffwll.local>
 <CACvgo50XZqz=fTK45+-NFV3u8Fxycy4hBycHG5pw=bRQRTouog@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo50XZqz=fTK45+-NFV3u8Fxycy4hBycHG5pw=bRQRTouog@mail.gmail.com>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 08, 2020 at 11:07:00AM +0100, Emil Velikov wrote:
> On Fri, 8 May 2020 at 07:27, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, May 07, 2020 at 04:07:50PM +0100, Emil Velikov wrote:
> > > From: Emil Velikov <emil.velikov@collabora.com>
> > >
> > > There's little point in providing partial and ancient information about
> > > the struct_mutex. Some drivers are using it, new ones should not.
> > >
> > > As-it this only provides for confusion.
> > >
> > > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> >
> > I think a doc patch to add a big warning for drm_device.struct_mutex would
> > also be good. The current text is kinda unhelpful.
> 
> Would something like this be enough?
> 
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index a55874db9dd4..0988351d743c 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -146,6 +146,9 @@ struct drm_device {
>   * @struct_mutex:
>   *
>   * Lock for others (not &drm_minor.master and &drm_file.is_master)
> + *
> + * WARNING:
> + * Only drivers annotated with DRIVER_LEGACY should be using this.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Assuming you wrap it in some suitable commit and all that.
-Daniel

>   */
>   struct mutex struct_mutex;
> 
> -Emil

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
