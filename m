Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 442152ED5B4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1DF6E4C5;
	Thu,  7 Jan 2021 17:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C416E4BB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 17:32:52 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c5so6426807wrp.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 09:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ns3knrCobRUeVGnustOcrOCTHp2ymD+OHw5Wwf+enN8=;
 b=Xh2I+dhrEkjrrM79DPTOC/+IIS9u4zL6yMPCdm4GAM6p8lWjzfT9jesKrXQwl4Yd6V
 zdZGL31IbutxG16PThQ5C9OJ18GW/VrFOelT5tL4XMGuJvnn9bvKaeqVA4PjrtUqICQM
 vuBijLR4L596mqSDl+GsZvWPq1VMqSuftXfRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ns3knrCobRUeVGnustOcrOCTHp2ymD+OHw5Wwf+enN8=;
 b=ZAAdRlX4z2e8pq+hzFV6M9+xumjIznPI/pj/mmuOF5Dm5tibl4jsHTXmhrFR/xrQHi
 KfSY/9QEUlkfjAKthGXHcs3h5FaZgBIugvbpdxQnNUc05HDjSD/zbQNb2iACkKTx9cQO
 dsRJmk8Jh+KXKAUKL2Jv7SfIDfY3ltb4RWYmcLZE+pi7VfIygwYZGiK8sTJIstw6FoUu
 ygif7TZLb2wnKpH5uBlNeYfENF3oxGuk6Eb/ZEmEDfykTbpw72TtTlfNDstZk1Zdkl56
 brT1fFkLEivHVrud5nVXye5qtXmO6nWvWaWpt9XC7E7UdkoOz3eDXuA2eggWIerRDDEP
 gkMw==
X-Gm-Message-State: AOAM533OZRk7jbVtZj/i9dHyT5bVQKRQlCwHP2Vp9mnORFBvbq7yeDYl
 oO4ovLAcvAHzGYKj4nut8iXMGA==
X-Google-Smtp-Source: ABdhPJyFFJJg8UFo8BWP9wmIXy5K3RkFEVYlehjNeRNizFdC4esnHO+39m2GeRVyiI6HvpG2gMKYnA==
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr10065029wrr.326.1610040771171; 
 Thu, 07 Jan 2021 09:32:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z63sm8991088wme.8.2021.01.07.09.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 09:32:49 -0800 (PST)
Date: Thu, 7 Jan 2021 18:32:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH v2] drm/amdgpu: Do not change amdgpu framebuffer format
 during page flip
Message-ID: <X/dFvzGu0lIK0mtT@phenom.ffwll.local>
References: <20201229211044.109020-1-zhan.liu@amd.com>
 <81e9467f-3498-2d6a-3822-902f2afb74c9@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81e9467f-3498-2d6a-3822-902f2afb74c9@gmail.com>
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
Cc: Stylon.Wang@amd.com, Zhan Liu <zhan.liu@amd.com>, Chao-kai.Wang@amd.com,
 dri-devel@lists.freedesktop.org, Nikola.Cornij@amd.com,
 amd-gfx@lists.freedesktop.org, Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 03, 2021 at 04:43:37PM +0100, Christian K=F6nig wrote:
> Am 29.12.20 um 22:10 schrieb Zhan Liu:
> > [Why]
> > Driver cannot change amdgpu framebuffer (afb) format while doing
> > page flip. Force system doing so will cause ioctl error, and result in
> > breaking several functionalities including FreeSync.
> > =

> > If afb format is forced to change during page flip, following message
> > will appear in dmesg.log:
> > =

> > "[drm:drm_mode_page_flip_ioctl [drm]]
> > Page flip is not allowed to change frame buffer format."
> > =

> > [How]
> > Do not change afb format while doing page flip. It is okay to check
> > whether afb format is valid here, however, forcing afb format change
> > shouldn't happen here.
> =

> I don't think this we can do this.
> =

> It is perfectly valid for a page flip to switch between linear and tiled
> formats on an I+A or A+A laptop.

It is, but that's not the bug here. struct drm_framebuffer.format is
supposed to be invariant over the lifetime of a drm_fb object, you need to
set it when the fb is created and never change it afterwards. So the patch
here isn't yet the real deal.

Also this means the implicit tiling information cannot be changed after a
fb is created for a given bo, but we've discussed this at length and that
limitation should be all ok.
-Daniel

> =

> Christian.
> =

> > =

> > Signed-off-by: Zhan Liu <zhan.liu@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > =

> > Thanks Nick and Bas. Here is my second patch for review.
> > =

> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_display.c
> > index a638709e9c92..8a12e27ff4ec 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > @@ -832,7 +832,8 @@ static int convert_tiling_flags_to_modifier(struct =
amdgpu_framebuffer *afb)
> >   			if (!format_info)
> >   				return -EINVAL;
> > -			afb->base.format =3D format_info;
> > +			if (!afb->base.format)
> > +				afb->base.format =3D format_info;
> >   		}
> >   	}
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
