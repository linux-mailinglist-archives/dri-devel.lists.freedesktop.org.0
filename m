Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EB82E0971
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 12:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4906E852;
	Tue, 22 Dec 2020 11:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9FA6E857
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 11:18:15 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d13so14107896wrc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 03:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KcTszvw0IXEVkh+Vzq3cs8FER8HOOVXIQxKTwZmoycE=;
 b=kmULFIXdbcRTyxU0mHwJfgCxsJpF2QnJ20Z0OaLP4j9SdM+dGYLVi8Pb3E0vhxYLq7
 WKXvCeLj9buHQ6U0popXAvMsRrwXSbSPTc8kvnwYBNVCc8fPwwTKj/jKdJop8JfI/CTe
 PNBlIQfFKji52i1maoVp0Z9WS3ChZioHvtI2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KcTszvw0IXEVkh+Vzq3cs8FER8HOOVXIQxKTwZmoycE=;
 b=eTTAj5SDtsAqRJTxo2c+mI4dxd+Ljqnr1FTus7DMUQ58t2ws9cMgg/NggO52115CcX
 SB1mleoaKRFAmxpdVB8EvdxpTm6hVXpQVum3/tHGDxr9U/lOykSqQwk6hiAGyrNIZ+RU
 QvJuIdmt3gkMZzxsuKyqa+y+Feq2nN/HEGsHg43WrQsK0C+RGUANWN1VRvRE+TTzxqiq
 YHn9WQIIc7JVeSG7ZYY04zPqAh9GjmaqQaEpKnkCuQW0ZhliDzeOGOXeknDitKST7Yod
 mGKq050tC8d+ypydoHv5IJ7Msmfmx6ydKuwnQORsEAfY3dmVGVmcYIs+9vAPYLRqdYpm
 2bdQ==
X-Gm-Message-State: AOAM531AM7aj1un86yjvmL8pumCPnMmOARPBkEWvfJu31mtauoqhoL4/
 b/c/lTdj+istTvxbvUOkTWZ2Zg==
X-Google-Smtp-Source: ABdhPJxM2xUqLs7Ob6GlbQZ3bW8Ne+y51Zo41+z4luf9CpHxqTRF4PgI84VTsCSyOs8xzDzE9RnYcg==
X-Received: by 2002:a05:6000:143:: with SMTP id
 r3mr23592577wrx.331.1608635893926; 
 Tue, 22 Dec 2020 03:18:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u66sm26875422wmg.30.2020.12.22.03.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 03:18:13 -0800 (PST)
Date: Tue, 22 Dec 2020 12:18:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/2] drm/fb-helper: Add a FIXME that generic_setup is
 very confusing
Message-ID: <X+HV87rIWe5jIpK7@phenom.ffwll.local>
References: <20201211161113.3350061-1-daniel.vetter@ffwll.ch>
 <20201211161113.3350061-2-daniel.vetter@ffwll.ch>
 <X+G0gDNlSCGLyjGK@phenom.ffwll.local>
 <ELmh1-LEs7frTA_s1mAofp1qBikYytSKjZi5fc36z41QdFuETpsx0qO-nUlvvsbJ2Xt6VrHYv8u9_1eNIqkUullDFmjPIsxIUMTxujYhktM=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ELmh1-LEs7frTA_s1mAofp1qBikYytSKjZi5fc36z41QdFuETpsx0qO-nUlvvsbJ2Xt6VrHYv8u9_1eNIqkUullDFmjPIsxIUMTxujYhktM=@emersion.fr>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 22, 2020 at 09:00:43AM +0000, Simon Ser wrote:
> On Tuesday, December 22nd, 2020 at 9:55 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Fri, Dec 11, 2020 at 05:11:13PM +0100, Daniel Vetter wrote:
> > > I tried to fix this for real, but it's very sprawling and lots of
> > > drivers get this mildly wrong one way or the other.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> >
> > Anyone feeling like an ack on this one?
> 
> From my limited understanding of fbdev, this FIXME sounds correct to me.
> 
> Acked-by: Simon Ser <contact@emersion.fr>

Thanks for taking a look, patch pushed to drm-misc-next.
-Daniel

> 
> > > ---
> > >  drivers/gpu/drm/drm_fb_helper.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > > index 596255edf023..27deed4af015 100644
> > > --- a/drivers/gpu/drm/drm_fb_helper.c
> > > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > @@ -2494,6 +2494,11 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
> > >  		return;
> > >  	}
> > >
> > > +	/*
> > > +	 * FIXME: This mixes up depth with bpp, which results in a glorious
> > > +	 * mess, resulting in some drivers picking wrong fbdev defaults and
> > > +	 * others wrong preferred_depth defaults.
> > > +	 */
> > >  	if (!preferred_bpp)
> > >  		preferred_bpp = dev->mode_config.preferred_depth;
> > >  	if (!preferred_bpp)
> > > --
> > > 2.29.2

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
