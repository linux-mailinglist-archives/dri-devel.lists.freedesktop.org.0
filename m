Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11BF41DCA0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 16:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31726EC0C;
	Thu, 30 Sep 2021 14:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B108908E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 14:43:57 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q2so622841wrc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 07:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=D4LJ+owkLswgJ20gCzd6tp1V3h8/LNZfO9A5z6cidMw=;
 b=LT+1OS+sGl80LiUmrgbw74fiUhIUa1Grd7avwhLUnTNpteviGMWKcj46/PglbVfdME
 rEC+PrloUKMnWkgkkPzisvQsy53WCB7F5ixYqtF34UMzOKhS3jy8/ExdwqS+pYSTeB2Z
 tJ47gra7cuGJnECYyH8tGvgOIY1Ts6HGD8lGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D4LJ+owkLswgJ20gCzd6tp1V3h8/LNZfO9A5z6cidMw=;
 b=fvEtncTjptioZKMLS7Zi6Dle+yWp2lJGDw/oFhFFL9NOfA0L2cANBsCe+Qr8tFF7N0
 9osxt/AynLAveLLgnz6/8yvhgMExhYRl50YE8sH+cjGeX++GqjYekBJYduHfPczLYHk8
 MORf7CpyqJ/q9itcWoZVXwE3OOcxzPwhZ/HXT8ueBUwZvehbCMYuJBZUh+WpEF013d+T
 x5Sb6EC1OxXmfIO/vjh/nE4SYcUt2BhZL+FslhpqbG2o9GZCDgkIL7ccqr25Nqi3J3za
 disvBFWyVgTzL9IgWQY2lL/BvuPOFRLUO58pOnRzcReE6qzFloT0Ck/J0WXaSXJxFHXW
 najw==
X-Gm-Message-State: AOAM531M8PTyGzCRPXxEC6JX6A9hDTkXzGYkrwFiZoCX+lnGXOqKkN7K
 +5TCvbzk0jrS2pC/862+2l1dSQ==
X-Google-Smtp-Source: ABdhPJzsApN8aYCrO6yvf8mhIvwSxDITxAYmSeY6sG+OdYL6TsDagfRViI3mXfJNa+JNUXt1/neSQA==
X-Received: by 2002:a05:6000:1544:: with SMTP id
 4mr3112920wry.370.1633013036275; 
 Thu, 30 Sep 2021 07:43:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r6sm3149027wrp.41.2021.09.30.07.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 07:43:55 -0700 (PDT)
Date: Thu, 30 Sep 2021 16:43:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: document pre-multiplied assumptions
Message-ID: <YVXNKtADKNNOFE8X@phenom.ffwll.local>
References: <20210929095357.49984-1-contact@emersion.fr>
 <20210929160701.2bf6d8c9@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929160701.2bf6d8c9@eldfell>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 29, 2021 at 04:07:01PM +0300, Pekka Paalanen wrote:
> On Wed, 29 Sep 2021 09:54:14 +0000
> Simon Ser <contact@emersion.fr> wrote:
> 
> > When a plane is missing the "alpha blend mode" property, KMS drivers
> > will use the pre-multiplied mode.
> > 
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_blend.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> > index ec37cbfabb50..eebb32ba84d7 100644
> > --- a/drivers/gpu/drm/drm_blend.c
> > +++ b/drivers/gpu/drm/drm_blend.c
> > @@ -185,6 +185,9 @@
> >   *		 plane does not expose the "alpha" property, then this is
> >   *		 assumed to be 1.0
> >   *
> > + *	When a plane is missing this property, the plane uses the
> > + *	"Pre-multiplied" equation.
> > + *
> >   * Note that all the property extensions described here apply either to the
> >   * plane or the CRTC (e.g. for the background color, which currently is not
> >   * exposed and assumed to be black).
> 
> Hi Simon,
> 
> thank you! :-D
> 
> I have no idea if that's correct though, but also nothing against it,
> and it does help with what I ranted about in
> https://lists.freedesktop.org/archives/wayland-devel/2021-September/041993.html
> so is it appropriate to offer my
> 
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

I think if it's not correct we can add an immutable prop like Ville
suggested for that driver.
-Daniel

> 
> ?
> 
> 
> Thanks,
> pq



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
