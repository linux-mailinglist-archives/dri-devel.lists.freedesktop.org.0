Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E84A5499AC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6067710E659;
	Mon, 13 Jun 2022 17:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01C110E659
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:19:55 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id x17so7982257wrg.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 10:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=v9wOSbkkFgoouudCT5M9ut11ttnj6LGZRsAbuaQUW4w=;
 b=AhRXQM/ukGy67WqPvSWEdkzh2PE+yy+GSFhlwgy+rjdEcBQcH5eTH7wmfvOFQZ2+2g
 S2NoTKCqKPCjaIsxjCSDZKihElHpfrXopMf0Gvr1nWl6qFzmc4Rc9R/OCX8XXiAnZ3z2
 3mMZ1tYsDbkbr+HujclIPj1SogBHfm7NDSF8qEzfkoEuxVDqnMvotCfqtMgGcOLnrt0C
 FNZiHc/RrEuV5NC0Wjh+Ib++wXt99f9T+4ntJIv7vi99j0/qXrAejs2G2swfZ3NBBBeS
 i7Xxq0fQR9Et8WY8Hl5XgxQuIs4n+t1h9QP85QyB0kf3CHBK1OLwHHO8Ifsq88iyH651
 YxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=v9wOSbkkFgoouudCT5M9ut11ttnj6LGZRsAbuaQUW4w=;
 b=Ltz3Ffm3/gIi3yeZ/Z7MbmCSOwiYAqUJhPJGDN9EowSx+Prj97bGv8f2HDLVjrSbHI
 ss5ZDo7nDgexd0gMuqG82AGBaOuaTA+/N0dKrCJvpfvt+jqqibFbL9Jhhu1GXPnTzjvA
 UTdCDg5ApeqrjrOoYMdNRUzxv1iamBnnimTcTEjeMW6QTlHvWwxUEhtR4NwNWTJawPQi
 l4QYqZKk3bgU4ePliJyTgIZhHBQlQrHD0KJYMKHviZCuitrC3CdAlgCu50L5l9cxBNeu
 P2YIhBtNMq7/HmpR871OmApyPEgyPjzJ07LoIxWepqLHTMZeITTVSsypigGoiEwLYbEF
 YC9Q==
X-Gm-Message-State: AJIora9/NEpZGPcnF2iXWTtbKsrKxNkrHjibi1lZapa9jnc/eMXPd8iM
 VmD2mfwL2CFk+QcK1pG5ISc=
X-Google-Smtp-Source: AGRyM1vK1IbbnFk2rcDMjgTifM9dW4eAfDBLjuP8C26mHS6Fg6KbDO8FnPheE0vldCzWcRT9Eblp7g==
X-Received: by 2002:a05:6000:1688:b0:218:47d6:5e46 with SMTP id
 y8-20020a056000168800b0021847d65e46mr785988wrd.699.1655140794288; 
 Mon, 13 Jun 2022 10:19:54 -0700 (PDT)
Received: from elementary ([94.73.36.128]) by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c424800b0039740903c39sm9879039wmm.7.2022.06.13.10.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:19:53 -0700 (PDT)
Date: Mon, 13 Jun 2022 19:19:51 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 1/3] drm/rect: Add DRM_RECT_INIT() macro
Message-ID: <20220613171951.GA132742@elementary>
References: <20220612161248.271590-1-jose.exposito89@gmail.com>
 <20220612161248.271590-2-jose.exposito89@gmail.com>
 <87pmjdyp62.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pmjdyp62.fsf@intel.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, dlatypov@google.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, davidgow@google.com, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 13, 2022 at 10:53:57AM +0300, Jani Nikula wrote:
> On Sun, 12 Jun 2022, José Expósito <jose.exposito89@gmail.com> wrote:
> > Add a helper macro to initialize a rectangle from x, y, width and
> > height information.
> >
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >  include/drm/drm_rect.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
> > index 6f6e19bd4dac..945696323c69 100644
> > --- a/include/drm/drm_rect.h
> > +++ b/include/drm/drm_rect.h
> > @@ -47,6 +47,18 @@ struct drm_rect {
> >  	int x1, y1, x2, y2;
> >  };
> >  
> > +/**
> > + * DRM_RECT_INIT - initialize a rectangle from x/y/w/h
> > + * @x: x coordinate
> > + * @y: y coordinate
> > + * @w: width
> > + * @h: height
> > + *
> > + * RETURNS:
> > + * A new rectangle of the specified size.
> > + */
> > +#define DRM_RECT_INIT(x, y, w, h) { (x), (y), (x) + (w), (y) + (h) }
> 
> Please use designated initializers.
> 
> It might help type safety if it also contained a (struct drm_rect) cast.

Thanks a lot for your review Jani, just emailed v3 with your suggested
changes.

Jose
 
> BR,
> Jani.
> 
> 
> > +
> >  /**
> >   * DRM_RECT_FMT - printf string for &struct drm_rect
> >   */
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
