Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC1C38C071
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 09:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4286E051;
	Fri, 21 May 2021 07:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBE16E051
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 07:10:16 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c14so18166948wrx.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 00:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=pXr3oFzANmcGgyCrUaaQgcSjUAbiwbF7giTakGIiEpQ=;
 b=uMzGQMRfihuosCJL97x9+ScHvFGXK5Es7iO3ThAwSGj+dccNs7f16EBz1+5itartBe
 N4jgLnyrfsDsTJGONdqYNWtNG7I9iLYo/qpotCMlX7b4fsp+TxY+DOe8W5pYWzLnixEE
 X9iuT4a8vOwbTKs2fp0QSnWD2M7+Z9OZHkgBOjPB4cZrS6Zt1jeWbGLQUIWaHGaT8fR+
 dJSRb7Sb1gvjPgqzGhuOAdi2mGGcjBGPfS6VZNGsRmtUX3sQXt16WM7shCU5Ib5diGNW
 DhYEb6f2R6qxgOX4HFblfhga1IkaaR0NYGPvLQ7m3/WysqvBum6fmmFPcbyYnF8BYSuq
 BxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pXr3oFzANmcGgyCrUaaQgcSjUAbiwbF7giTakGIiEpQ=;
 b=RI1VuhEcuUsP4ChXazuNJKg4FlADbxT3xDtATs9arr5g8qPvr7L3Xkqju/SrlYa4W9
 +tUP/JMSdqkRDkh4vvQhWykGCSVie00dW5fBaRCGrW3DYr2qxt6CKQYvdtJ5/Yned9SY
 /4SgM9XGCMo4aBc0hLDyVqWzMddI1U4Bs/h4VWOK7ciCMF1EDIb1FPPXqfSS10f33ClG
 Uv8Qep5l3aal54W+UdUiDzcd5kmIZFQln7bk3qcmWzP8o6nsqW6zoI55ajvSroWoVsG1
 HoCDad1xhqo3vjxZFEPY5JvERZ6D0kTmyBIbtUhyrCat6ML+oOT+kD4vk6o0T//hIS2d
 AKZg==
X-Gm-Message-State: AOAM533sb5KDEkI9c97rxQ5MTiKELCrVyWq1qdHsUqrsEDTW+rNpFmfo
 ZbbNivsT1ZRlO+bf7CvXwiBJuw==
X-Google-Smtp-Source: ABdhPJwE0viepO5e4IIyz1lTctOknX7d+QtwA8ta4C51lrclzTdniX/yTH1dNb4HCvL+/+JfzBTJZQ==
X-Received: by 2002:adf:f5c5:: with SMTP id k5mr704324wrp.81.1621581014981;
 Fri, 21 May 2021 00:10:14 -0700 (PDT)
Received: from dell ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id a11sm949666wrx.38.2021.05.21.00.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 00:10:14 -0700 (PDT)
Date: Fri, 21 May 2021 08:10:12 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 38/38] drm/amd/amdgpu/smuio_v13_0: Realign
 'smuio_v13_0_is_host_gpu_xgmi_supported()' header
Message-ID: <20210521071012.GT2549456@dell>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
 <20210520120248.3464013-39-lee.jones@linaro.org>
 <CADnq5_NLnfGYuoz8+1z=q1Y90Re_XCkDHREoMZW2so0gk-hwwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_NLnfGYuoz8+1z=q1Y90Re_XCkDHREoMZW2so0gk-hwwA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 May 2021, Alex Deucher wrote:

> Applied.  Thanks!

Thanks again Alex.

> On Thu, May 20, 2021 at 8:03 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > Fixes the following W=1 kernel build warning(s):
> >
> >  drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c:99: warning: expecting prototype for smuio_v13_0_supports_host_gpu_xgmi(). Prototype was for smuio_v13_0_is_host_gpu_xgmi_supported() instead
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c b/drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c
> > index 3c47c94846d6d..39b7c206770f6 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/smuio_v13_0.c
> > @@ -106,7 +106,7 @@ static u32 smuio_v13_0_get_socket_id(struct amdgpu_device *adev)
> >  }
> >
> >  /**
> > - * smuio_v13_0_supports_host_gpu_xgmi - detect xgmi interface between cpu and gpu/s.
> > + * smuio_v13_0_is_host_gpu_xgmi_supported - detect xgmi interface between cpu and gpu/s.
> >   *
> >   * @adev: amdgpu device pointer
> >   *
> >

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
