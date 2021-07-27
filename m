Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B603D721A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 11:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333EE6EB33;
	Tue, 27 Jul 2021 09:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D846EB33
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 09:35:39 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id g15so14416367wrd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 02:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yjgVLjcBZHkmlLdtSEvRiJPBi3o1kd828d/tUGrcbyE=;
 b=UnBrek7qZf+iYEh6AmVH7eUFkcaZxHm4RxwLhRY3cMVvQwipZN3LMp7nplV4/mzwGQ
 66vGkBYwCcgjNJKg0SJddYatlSHOT3Qi6OVarx5S60ivO6utnTHonvtnX4pmoVTCHsav
 wv/dpLG7ue1GpHL1ed1UQpf2xOYlwYh6zOfq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yjgVLjcBZHkmlLdtSEvRiJPBi3o1kd828d/tUGrcbyE=;
 b=Vrrt9oKF6ITK7FB3loXBQVodXd8yNuua8vq0gZI7TUtxUrC8/xFz0SGCWdWQ34Et89
 Pj83MxjEUz0F9uNa42bc9oNmASQgtb/I3Yp12m+xJX2IiiH82dyX8MEYVE5cg2t4sDX2
 FbjfyQ/4boo7Jjt2nGXdgMy9VdsigX0ckg/x/n6Eb6LiK6RCzl93osfSspOzGSbdLT+b
 arCNdDntm4j8dw+O2rvGOSlDaluDW8osL3jbepXdUZoaKfbIJ7aUTRMuRka8zC0TcCIv
 55F6v6Bao44zZ16zNFLBIm0vbNQZtLNIuf+odg912O1zArDNDZ7rzT/KsQPemv4R0+Cs
 J7pg==
X-Gm-Message-State: AOAM531iS7jZLylQIglp44A7lr32KVBzwidpZiE2owmzIrJnI3/m+b/7
 adbjHz0y4NI7/xIh4fAc5/mrdQ==
X-Google-Smtp-Source: ABdhPJz5UBO4JHhHhw/F7Hn081lqFQVJzcU4ElEFgPfM+H71lZvtUcZeLAELoIXQGHK/pfEvutK92A==
X-Received: by 2002:a5d:4e4e:: with SMTP id r14mr24393409wrt.251.1627378537645; 
 Tue, 27 Jul 2021 02:35:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r2sm2671161wrq.15.2021.07.27.02.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 02:35:37 -0700 (PDT)
Date: Tue, 27 Jul 2021 11:35:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 1/3] drm/loongson: Add DRM Driver for Loongson 7A1000
 bridge chip
Message-ID: <YP/TZ2VRqYsw+jQN@phenom.ffwll.local>
References: <20210723031251.200686-1-lichenyang@loongson.cn>
 <YPqElHRxMSvrzzqs@phenom.ffwll.local>
 <YPr65jnI2coEIY1j@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPr65jnI2coEIY1j@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Huacai Chen <chenhuacai@kernel.org>,
 dri-devel@lists.freedesktop.org, lichenyang <lichenyang@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, devel@linuxdriverproject.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 07:22:46PM +0200, Sam Ravnborg wrote:
> On Fri, Jul 23, 2021 at 10:57:56AM +0200, Daniel Vetter wrote:
> > On Fri, Jul 23, 2021 at 11:12:49AM +0800, lichenyang wrote:
> > > From: Chenyang Li <lichenyang@loongson.cn>
> > > 
> > > This patch adds an initial DRM driver for the Loongson LS7A1000
> > > bridge chip(LS7A). The LS7A bridge chip contains two display
> > > controllers, support dual display output. The maximum support for
> > > each channel display is to 1920x1080@60Hz.
> > > At present, DC device detection and DRM driver registration are
> > > completed, the crtc/plane/encoder/connector objects has been
> > > implemented.
> > > On Loongson 3A4000 CPU and 7A1000 system, we have achieved the use
> > > of dual screen, and support dual screen clone mode and expansion
> > > mode.
> > > 
> > > v9:
> > > - Optimize the error handling process.
> > > - Remove the useless flags parameter.
> > > - Fix some incorrect use of variables and constructs.
> > > 
> ...
> > 
> > Somehow this simple driver is at v9 and still not landed. Do you have
> > someone from the drm maintainers/committers who's guiding you through all
> > this? I'm not seeing you Cc: a specific person, without that there's good
> > chances your contribution gets lost. I'm swamped myself, which is why I've
> > ignored this and hope you'd fine someone else and stick to them.
> 
> Hi Chenyang,
> 
> Please cc: me on the next revision - then I will take a look.
> But I count on someone more familiar with atomic modesetting can also
> take a look. Thomas? Maxime?

I think the main thing is deciding whether this should use simple display
pipe helpers or not. Right now it looks like, and it would greatly trim
down the code.

The only other things I check is whether there's any hooks that can be
removed and whether an attempt to send out the event is made in all cases,
and that's good enough for me on the atomic front :-)

If it's not using simple display pipe helpers there's a bunch more things
to check, like whether the plane check function looks competent or fails
to reinvent what simple pipe helpers have.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
