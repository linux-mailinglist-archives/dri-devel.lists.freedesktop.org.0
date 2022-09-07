Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B965B0A3E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 18:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1505B10E7D2;
	Wed,  7 Sep 2022 16:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3CA10E7D2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 16:38:48 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id gh9so9755390ejc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 09:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=YAkbTq0Km2g4br/CBUKYRJkCnvbrj1sCaD/ouhzx1Cw=;
 b=BzZe6rN1X2ukb36sIPuvdKSFr0bm6eRWqMo3jke4nSxCtR4UUGKhslq6q8U9VYzrtj
 UV4HUxR399B4zYAh6FkWbcpiC82k4jL1iz8f8qfXayumFrw+hcaf+ZLUmgP+OlfZSiGV
 cPf6jcj3/MRCpjE56JdG1rRp+WiFV6bhMeUsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=YAkbTq0Km2g4br/CBUKYRJkCnvbrj1sCaD/ouhzx1Cw=;
 b=rmpecoU0HkQGDy5xOt9XbZIpQYz7XHfHwiL8+WOS8giZcsAEKR0K9kGZvtrrAm9F6E
 Qb5eiB2EO5kM9uAB2gJRJvXS3GINtQ3nl45BmK5laG9oxtXHgFJIcHMTs1bSVnylRDLz
 8uEmMmtBTaPK4ENZP53Rg99vjtLT83SzlesQBnVDZ/dXUOo4nBEaFP7VBDAQnhpfwiyS
 /LjE7jlPO4noD1zlLQooimnCt7Bj2gOVuTTMNVHeKxYkNjZvtXaCo+b/1qUsD623wS4C
 f1Ymqr5Z4mqEQuXbA5ODc/z9XFs6t11uHZ5mQKD/SoY70DHJMycYp4m/Y/AA/hQrxKgz
 rvrQ==
X-Gm-Message-State: ACgBeo3lIrd/H0vJ4cMEIzMsV0g4fWfchuFsG0IdSYeVBNFIrSX3vBcj
 VZbzfrE3ZZPpWUj6T4kQHWmBEVsFka0mZg==
X-Google-Smtp-Source: AA6agR41npVIE6817MBOanKZ6mLYXYH+NkuTLR60ly7Nayt2kbeySJ55h6sCKcv+4JeN+qBAg3+HJg==
X-Received: by 2002:a17:907:7b95:b0:731:113a:d7a2 with SMTP id
 ne21-20020a1709077b9500b00731113ad7a2mr2777896ejc.377.1662568726639; 
 Wed, 07 Sep 2022 09:38:46 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 b13-20020a17090630cd00b0073de0506745sm8688300ejb.197.2022.09.07.09.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 09:38:45 -0700 (PDT)
Date: Wed, 7 Sep 2022 18:38:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/udl: Enable damage clipping
Message-ID: <YxjJExmVL1y3gsqg@phenom.ffwll.local>
References: <20220728074756.6108-1-tzimmermann@suse.de>
 <Yxeg/X7RNOpa58gg@phenom.ffwll.local>
 <a659a499-1afd-aec2-01da-bb79c11d0ba2@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a659a499-1afd-aec2-01da-bb79c11d0ba2@suse.de>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: airlied@linux.ie, airlied@redhat.com, sean@poorly.run,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 07, 2022 at 08:59:17AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 06.09.22 um 21:35 schrieb Daniel Vetter:
> > On Thu, Jul 28, 2022 at 09:47:56AM +0200, Thomas Zimmermann wrote:
> > > Call drm_plane_enable_fb_damage_clips() and give userspace a chance
> > > of minimizing the updated display area.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > >   drivers/gpu/drm/udl/udl_modeset.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> > > index e67c40a48fb4..ce427128f034 100644
> > > --- a/drivers/gpu/drm/udl/udl_modeset.c
> > > +++ b/drivers/gpu/drm/udl/udl_modeset.c
> > > @@ -479,6 +479,7 @@ int udl_modeset_init(struct drm_device *dev)
> > >   					   format_count, NULL, connector);
> > >   	if (ret)
> > >   		return ret;
> > > +	drm_plane_enable_fb_damage_clips(&udl->display_pipe.plane);
> > 
> > I'm assuming this passes with all the igts we have (I hope those finally
> > landed) and a damage-capable compositor doesn't go boom either?
> > 
> > Either way patch lgtm. Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > Also I wonder whether we should have a check in the damage helpers to make
> > sure drivers don't forget to call this function to set up the uapi ...
> 
> It warns, but you can ignore that.

Yeah that's as good as it gets, we can't crash the driver :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
