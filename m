Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDEB257A99
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 15:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2566089AC3;
	Mon, 31 Aug 2020 13:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7093898B6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 13:39:08 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id e33so619214pgm.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 06:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kBIx7FcbMM1t3uG1zvrmHZlG3XrQ9BDEQ6YDhG9R5jo=;
 b=ulyPKe7hsfCv7vGuf4GZjBv3JdbiSnDFtZRhoE1JCXhD51IM3GnUEUOviZnSGujp0U
 cetpSeeRNMzLcfWAXN7q/Zq918qpPuXWnaDTfoVC+UFnNPjGj9+aO4CxlYM/rylStv3v
 OEaLWBoXFuxqAcz5qorfbTj5a9z8eFiKaDvZLxLn1EX3hzpWC1LPtbKI3OjvcHrKsD6j
 eGNrKgi46Y+Hs/6HYCCiytsahM60uHkan05SbLnNLq/rh4ByFGrmGQsN48l1TStaYiLh
 zZ3HRYnvio+EHyaRVOOLXIv0MBquM67C9kKCzUFSMkloRT7o/eymsZwMNSubz8SmKuW+
 YwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kBIx7FcbMM1t3uG1zvrmHZlG3XrQ9BDEQ6YDhG9R5jo=;
 b=kmQR10HmsFk07ZNJJlHW/T6safIJjiWrBtdft8rZ46Gzuzt1Ah87gq6KyHmiMEAUoT
 vMySl33jZRR8GDlV0WhttVCJ2ZZc0kd5Lsv9RimIRhvTSZ+6Tsrc9zsL8WOBhtqDb5vf
 LI6ULvbAQbcrAUMHZ1tFjaKPnc3Gg5YVb3ey5ISd8LVGs5Z/E7M7YpoqT5leaB8TBTEU
 OfFRDpG72KB4G9ZJXFe3VtNX9xfxdoh/djGd1w8uDBW9gQXhAdpbXmm6TIBcgCckd3ao
 zv2bUk3xAnSJRzq61FX3fWXHCgF5m16LVfxFMZGwLavS+0Uf+KcaKftKJOu3jOhbuVwO
 FFWA==
X-Gm-Message-State: AOAM531echMpqA/vLZX0twhZh2qIrOp95SLizRJgnpo0v7nmJhyVik+K
 c4oqwKeMFw9Xt7NuiBX8utY=
X-Google-Smtp-Source: ABdhPJzIAQxzBjxsLTwl35Dy79erM0keXcL3kWzXwYd+S4wNrrBm+BEMLAtjX8K7mWRL5Jt98yApww==
X-Received: by 2002:a63:c551:: with SMTP id g17mr1219918pgd.399.1598881148355; 
 Mon, 31 Aug 2020 06:39:08 -0700 (PDT)
Received: from realwakka ([61.83.141.80])
 by smtp.gmail.com with ESMTPSA id w3sm8307421pff.56.2020.08.31.06.39.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 31 Aug 2020 06:39:07 -0700 (PDT)
Date: Mon, 31 Aug 2020 13:38:58 +0000
From: Sidong Yang <realwakka@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/vkms: add support for gamma_set interface
Message-ID: <20200831133858.GA9280@realwakka>
References: <20200829140647.7626-1-realwakka@gmail.com>
 <UeJwFKvmNgKdZY_icN0-nrFly9R1vbzaMZ-TiyxIIPBcdl278uZsK6YdTTdRl6rFukBAmN-eyCFpnfsIB-El9QpyYiutdcpgJg64n4tsRRc=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <UeJwFKvmNgKdZY_icN0-nrFly9R1vbzaMZ-TiyxIIPBcdl278uZsK6YdTTdRl6rFukBAmN-eyCFpnfsIB-El9QpyYiutdcpgJg64n4tsRRc=@emersion.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 31, 2020 at 11:39:10AM +0000, Simon Ser wrote:
> On Saturday, August 29, 2020 4:06 PM, Sidong Yang <realwakka@gmail.com> wrote:
> 
> > Currently vkms module doesn't support gamma function for userspace. so igt
> > subtests in kms_plane(pixel-format-pipe-A-plan) failed for calling
> > drmModeCrtcSetGamma().
> 

Hi, Simon.
Thanks for review.

> It doesn't seem like this IGT test's goal is to exercise support for
> gamma LUTs. Does the test just tries to reset the gamma LUT to linear?
> If so, I think the IGT test should be fixed to ignore "I don't support
> gamma" errors.

It seems like that IGT test pixel-format is to make gamma lut like below.

for (i = 0; i < lut_size; i++)
	lut[i] = (i * 0xffff / (lut_size - 1)) & mask;

And set this table to drm driver. and test begins. It's the test about pixel 
format. I think you're right. It's not about gamma lut.
> 
> > This patch set gamma_set interface in vkms_crtc_funcs for
> > support gamma function. With initializing crtc, added calls for setting gamma
> > size. it pass the test after this patch.
> >
> > Cc: Daniel Vetter<daniel@ffwll.ch>
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> >
> > Signed-off-by: Sidong Yang <realwakka@gmail.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_crtc.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > index ac85e17428f8..643435fb2ee6 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -160,6 +160,7 @@ static const struct drm_crtc_funcs vkms_crtc_funcs = {
> >  	.get_crc_sources	= vkms_get_crc_sources,
> >  	.set_crc_source		= vkms_set_crc_source,
> >  	.verify_crc_source	= vkms_verify_crc_source,
> > +	.gamma_set		= drm_atomic_helper_legacy_gamma_set,
> 
> Why does VKMS need to use a legacy helper?

drm_crtc_enable_color_mgmt() enables properties about gamma/degamma lut. And 
legacy helper just saves lut data from userspace to drm property blob. It seems 
that it's convenient way to implement .gamma_set.

> It seems like this patch just advertises support for gamma LUTs, but
> ignores any value set by user-space. If VKMS advertises support for
> gamma LUTs, it needs to take the LUT into account when blending planes.

Yes, This patch doesn't use gamma lut passed by user. lut should be used for 
calculating pixel value. For vkms, Maybe lut will be used in making crc value?
If so, I'll try to write next patch for it.

Thanks,
-Sidong

> 
> >  };
> >
> >  static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
> > @@ -275,6 +276,13 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> >  		return ret;
> >  	}
> >
> > +	ret = drm_mode_crtc_set_gamma_size(crtc, 256);
> > +	if (ret) {
> > +		DRM_ERROR("Failed to set gamma size\n");
> > +		return ret;
> > +	}
> > +	drm_crtc_enable_color_mgmt(crtc, 0, false, 256);
> > +
> >  	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
> >
> >  	spin_lock_init(&vkms_out->lock);
> > --
> > 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
