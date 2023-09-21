Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA797A9398
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 12:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E793510E5AB;
	Thu, 21 Sep 2023 10:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0BD10E5AB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 10:39:54 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c09673b006so6111245ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 03:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695292794; x=1695897594; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KWjgE64FXbMtpQjNRk3X7/IDUHdZZUKwN8Xv8RgnYfI=;
 b=P3kL+OKQ9OVLFKtQHmd+L0q8wXs/xNIryAnRwI89/sgj8Kl+TzW95sjjIoP4PJ3ZAN
 8HXa7MOtVdYTRi1dileeez2hadl07NcJUrx6dDBbCXb5+sFm+nSZeoZl47ITLukjPyQe
 BNBPv9aZooLQUKYdItcyNoEigovS4HWHMw3Kzltr6TpID5+Ydu6ERsMlmAPqw0JZjExL
 iPfO5UzQRyOA5RPdK76/T6ZmSCdijV7XrljVeVoUzOG9ATQHZYOaGrpVSIBi1zJZXEoW
 wLA/a47pAeodfiHWEIffYhwYy0v6MSu5pXpf5pcNJHHlogFr8qX/2y7qainJ9p7sgrGi
 Ks2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695292794; x=1695897594;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KWjgE64FXbMtpQjNRk3X7/IDUHdZZUKwN8Xv8RgnYfI=;
 b=EBktisLjd70296caOwjEHtJJJ9qIrlg7N7Gt2K+3d7rC5IpnIUx4i6JOmldqe+LRzu
 +thSj1EGKDPUMnXNIrzFRUtX68b9o92aHk0PGsnRpE02VYeIlPrW7ubEgV5y/B0Dpvux
 ysoQSv7UiCS161EgTZaNbO+X9hrhpCe7HiOZztaZTxoiAh8tvOiX+L7nwDTefjnkMJEi
 +OUCzc6eh3qfjAx+2Or/w52O9gvYk+fnvfJ5s8jS61N500SAF58u5546eZj4AK+pvciu
 LdJ881jdJCjeYvNqm6m4DkVeYs4gHM+ZRxXNWJbvjE0Xy3xSFbJVFy+nSXoaERkpn+1j
 SMBQ==
X-Gm-Message-State: AOJu0YyM7Wc7/HVTNKgzEJfZebDwMZtigDV4OMJqg367A4CG89/A1DuM
 4TmTEDkkD5t/QeruNe92YaY=
X-Google-Smtp-Source: AGHT+IHywJP3wF0zI2uf76M2aH0c/XRLkyoDwDsQ6aF/SadOTPY4tI0zY9ia+w33T6wf8amtnrSprA==
X-Received: by 2002:a17:902:c409:b0:1c4:4a4d:cda with SMTP id
 k9-20020a170902c40900b001c44a4d0cdamr5669955plk.15.1695292794057; 
 Thu, 21 Sep 2023 03:39:54 -0700 (PDT)
Received: from localhost (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 ju12-20020a170903428c00b001b87d3e845bsm1127698plb.149.2023.09.21.03.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 03:39:53 -0700 (PDT)
Date: Thu, 21 Sep 2023 12:39:48 +0200
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: MAINTAINERS: Update drm-misc entry to match all drivers
Message-ID: <x7oa5g4vnjgyh6pppwy5xre6nmnta73hug3f2qjl3lqr2t25ck@5kclm2ngpvqp>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>, 
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, 
 Paul Cercueil <paul@crapouillou.net>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel.vetter@intel.com>
References: <20230919131235.759959-1-mripard@kernel.org>
 <afc3da23-81ce-edcf-6ea6-8fd8711e17b0@loongson.cn>
 <enobmyvbv5rw5uvdlcznttqxnh4d5674agh4x6aqcbrlcxvryg@vbzdomlyleyx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <enobmyvbv5rw5uvdlcznttqxnh4d5674agh4x6aqcbrlcxvryg@vbzdomlyleyx>
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
Cc: suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 21, 2023 at 10:47:58AM +0200, Maxime Ripard wrote:
> Hi,
> 
> Adding Paul in Cc
> 
> On Thu, Sep 21, 2023 at 04:25:50PM +0800, suijingfeng wrote:
> > On 2023/9/19 21:12, Maxime Ripard wrote:
> > > We've had a number of times when a patch slipped through and we couldn't
> > > pick them up either because our MAINTAINERS entry only covers the
> > > framework and thus we weren't Cc'd.
> > > 
> > > Let's take another approach where we match everything, and remove all
> > > the drivers that are not maintained through drm-misc.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > > ---
> > >   MAINTAINERS | 23 ++++++++++++++++++++---
> > >   1 file changed, 20 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 90f13281d297..757d4f33e158 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -6860,12 +6860,29 @@ M:	Thomas Zimmermann <tzimmermann@suse.de>
> > >   S:	Maintained
> > >   W:	https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html
> > >   T:	git git://anongit.freedesktop.org/drm/drm-misc
> > > +F:	Documentation/devicetree/bindings/display/
> > > +F:	Documentation/devicetree/bindings/gpu/
> > >   F:	Documentation/gpu/
> > > -F:	drivers/gpu/drm/*
> > > +F:	drivers/gpu/drm/
> > >   F:	drivers/gpu/vga/
> > > -F:	include/drm/drm*
> > > +F:	include/drm/drm
> > >   F:	include/linux/vga*
> > > -F:	include/uapi/drm/drm*
> > > +F:	include/uapi/drm/
> > > +X:	drivers/gpu/drm/amd/
> > > +X:	drivers/gpu/drm/armada/
> > > +X:	drivers/gpu/drm/etnaviv/
> > > +X:	drivers/gpu/drm/exynos/
> > > +X:	drivers/gpu/drm/gma500/
> > > +X:	drivers/gpu/drm/i915/
> > > +X:	drivers/gpu/drm/imx/
> > > +X:	drivers/gpu/drm/ingenic/
> > > +X:	drivers/gpu/drm/kmb/
> > > +X:	drivers/gpu/drm/mediatek/
> > > +X:	drivers/gpu/drm/msm/
> > > +X:	drivers/gpu/drm/nouveau/
> > > +X:	drivers/gpu/drm/radeon/
> > > +X:	drivers/gpu/drm/renesas/
> > > +X:	drivers/gpu/drm/tegra/
> > >   DRM DRIVERS FOR ALLWINNER A10
> > >   M:	Maxime Ripard <mripard@kernel.org>
> > 
> > 
> > Nice patch!
> > 
> > Well, I'm just curious about why the drm/ingenic and drm/gma500 are not maintained through drm-misc?
> > 
> > As far as I know:
> > 1) the drm/ingenic driver don't have a "T" annotation (location of the link).
> 
> Yeah, I wasn't sure about that one indeed. I remained conservative since it's a
> sensitive topic for some.
> 
> Paul, is drm/ingenic supposed to be maintained through drm-misc? Either way,
> could you clarify which git tree is supposed to merge those patches in
> MAINTAINERS?
> 
> > 2) the "T" of drm/gma500 is "git git://github.com/patjak/drm-gma500", but the
>   code for this link is not up to date.
> 
> For gma500, I think it's mostly historical since it was there before drm-misc
> was a thing.

Yes, that's the reason. I used do PRs from my github before we had
drm-misc but now everything gma500 related goes through drm-misc.

> 
> > I think at least the drm/ingenic and drm/gma500 drivers are *actually*
> > maintained through drm-misc, So perhaps, these two drivers should not be
> > excluded. Am I correct?
> 
> It's likely :)
> 
> Either way, I think it can be solved/clarified later on
> 
> Maxime


