Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B9E242AFF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 16:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564406E125;
	Wed, 12 Aug 2020 14:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D5C6E125
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 14:11:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x5so1916080wmi.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TydYFMefyVh1KPudA4+DQ2jk9sD/f15l4y32PkQDdqw=;
 b=ECQa6sfG5K1RafxYb3fRlxEIbM3fDTmoh0P3mx6tgqjlqlYt6ryPAc8EpogNnKf6TZ
 s531xeP8pYRCFxeB7If8Ddvnutxoq23HHvLZqfv4bzOXFJIAFIOj/k9L2FFomkjc5geH
 NqvG7vOK7oL8aOXMJ7Z8PB7/MZRKHDJ4JiUfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TydYFMefyVh1KPudA4+DQ2jk9sD/f15l4y32PkQDdqw=;
 b=IvSZRXAayC8BGDzaF0yfiSwcS9QhQLIIhCWJ9F0iDGW5ksg+W/F46F+LlFylSpTQqn
 vTArrSfnBHN4F2iO5K1dyFQTEx9EsovnGvg3WGlHzq262j72NCjGgpslgfYOAI0IX4hY
 C4KYYtY45RkTHswufkFtNyHK5vPDsfUAkxfTbserNCagqEjxdC0/NTyYXjK3a5Q8ARcg
 MvCidJ06Na2NxQTSc7kXKEGpVhjNmoRfriKDHN+Fv1w8Y23sTvtGJ4fxP2LHheHsJbhj
 v9qCO+HVtM84sSbgNzwp2bnv8tTQdFh9BL4DLpaGqPcqcS5Hob0r+0y4K8YbZ04A03Bo
 aQ/w==
X-Gm-Message-State: AOAM533Oy0/Qftw/LKWW06XNaYhanDkYEpwUq5vzsyc5za98PiN+yerb
 p47mXyxrOxJa47Ib7QiOQGm7Pg==
X-Google-Smtp-Source: ABdhPJw1jfxV4cQZuqQJzHbNQcYtLiTcsfM5U1rvdezxh0i/i0VwK/WdxIbGxBCgtu7GE+xHEtQEXw==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr9235847wml.106.1597241500333; 
 Wed, 12 Aug 2020 07:11:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s8sm3913149wmc.1.2020.08.12.07.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 07:11:39 -0700 (PDT)
Date: Wed, 12 Aug 2020 16:11:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drm/rockchip: Require the YTR modifier for AFBC
Message-ID: <20200812141137.GH2352366@phenom.ffwll.local>
References: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
 <20200812063154.GB1300894@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812063154.GB1300894@kroah.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 stable@vger.kernel.org, andrzej.p@collabora.com,
 linux-rockchip@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-arm-kernel@lists.infradead.org, daniels@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 08:31:54AM +0200, Greg KH wrote:
> On Tue, Aug 11, 2020 at 04:26:31PM -0400, Alyssa Rosenzweig wrote:
> > The AFBC decoder used in the Rockchip VOP assumes the use of the
> > YUV-like colourspace transform (YTR). YTR is lossless for RGB(A)
> > buffers, which covers the RGBA8 and RGB565 formats supported in
> > vop_convert_afbc_format. Use of YTR is signaled with the
> > AFBC_FORMAT_MOD_YTR modifier, which prior to this commit was missing. As
> > such, a producer would have to generate buffers that do not use YTR,
> > which the VOP would erroneously decode as YTR, leading to severe visual
> > corruption.
> > 
> > The upstream AFBC support was developed against a captured frame, which
> > failed to exercise modifier support. Prior to bring-up of AFBC in Mesa
> > (in the Panfrost driver), no open userspace respected modifier
> > reporting. As such, this change is not expected to affect broken
> > userspaces.
> > 
> > Tested on RK3399 with Panfrost and Weston.
> > 
> > Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > ---
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop.h | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> > index 4a2099cb5..857d97cdc 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> > @@ -17,9 +17,20 @@
> >  
> >  #define NUM_YUV2YUV_COEFFICIENTS 12
> >  
> > +/* AFBC supports a number of configurable modes. Relevant to us is block size
> > + * (16x16 or 32x8), storage modifiers (SPARSE, SPLIT), and the YUV-like
> > + * colourspace transform (YTR). 16x16 SPARSE mode is always used. SPLIT mode
> > + * could be enabled via the hreg_block_split register, but is not currently
> > + * handled. The colourspace transform is implicitly always assumed by the
> > + * decoder, so consumers must use this transform as well.
> > + *
> > + * Failure to match modifiers will cause errors displaying AFBC buffers
> > + * produced by conformant AFBC producers, including Mesa.
> > + */
> >  #define ROCKCHIP_AFBC_MOD \
> >  	DRM_FORMAT_MOD_ARM_AFBC( \
> >  		AFBC_FORMAT_MOD_BLOCK_SIZE_16x16 | AFBC_FORMAT_MOD_SPARSE \
> > +			| AFBC_FORMAT_MOD_YTR \
> >  	)
> >  
> >  enum vop_data_format {
> > -- 
> > 2.28.0
> > 
> 
> <formletter>
> 
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree.  Please read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> for how to do this properly.

Greg's bot wants a cc: stable on the commit (i.e. in the commit message),
otherwise it's lost since it doesn't track what's all submitted to it
before it's merged.
-Daniel

> 
> </formletter>

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
