Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A9C38CA12
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 17:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6DC6E0E3;
	Fri, 21 May 2021 15:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EFE6E0E3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 15:27:09 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j14so19725817wrq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ZVSedFrP+0tpxLZ8F7Yf3PCmIz+TOL1d4BZ3SCIGqFE=;
 b=P2NuhRay4VNswk6R+Mre8cDLI1JTeYXs84jE3PUeuJ9FEjGEy44+eU3AsPhsymn0Y1
 b32L5+CXT9AlhdAFPHq0dTdVjFREUTaNPlay2EoCyebUZE7mS2xazPPpTsLDNYWPZP0c
 fVdScbzLPZLzwbByZaWmThuHDrIQDGkbZ3bbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZVSedFrP+0tpxLZ8F7Yf3PCmIz+TOL1d4BZ3SCIGqFE=;
 b=SlSGYyHtCbpygvauIwdjfpznoK/IJw5MZ+l3hXupBOcQqprTIIkNhkSO3EhMX/6+3b
 IpTId5iQdIvl5MzrW69oEsR1XHrsZz+wNa7jv5G2a6OuUwNfTUVkcEdnsyUoDNHI1xSF
 wseoceU9yvE1u2GtkwvYC9hO40YoiJZ1EiCvdqi2HhOvSriBZ0MWAlZYLp1ZqDp1EuNF
 uTwQ4j97p2QG71DnnQEf0wA1w3ofZL9qMlGZVeGkIP6KDjKDpWuOjHVcR0jX4uFIrC58
 TfbAprH3oXyEOesb2ncjY3kguGd+mAhtvzsHkN4Fe+o0mbIQgaBMy19l0vbLuYJy6EZw
 nttA==
X-Gm-Message-State: AOAM530z84sU05EeGM/sv8Na4Yk/u6YONwX3xn0nk3vGKTtZJoKjLnf8
 59IrDc05Cgo3raUjsy/rIgWajw==
X-Google-Smtp-Source: ABdhPJxp5JhtTYd5Eu2lgi4XdHMzE1uuhrrmpFYMpAYZzEYZ74t1J5SVaMxTD3OGi8zkWgSqYJrzZw==
X-Received: by 2002:adf:e50c:: with SMTP id j12mr10249245wrm.418.1621610828056; 
 Fri, 21 May 2021 08:27:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m7sm2487624wrv.35.2021.05.21.08.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 08:27:07 -0700 (PDT)
Date: Fri, 21 May 2021 17:27:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/doc: Includ fence chain api
Message-ID: <YKfRSaG2x6FcrKOL@phenom.ffwll.local>
References: <20210521082457.1656333-1-daniel.vetter@ffwll.ch>
 <b8cfff00-2545-8a09-1591-f2f162e2adb7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8cfff00-2545-8a09-1591-f2f162e2adb7@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 10:26:28AM +0200, Christian König wrote:
> Am 21.05.21 um 10:24 schrieb Daniel Vetter:
> > We have this nice kerneldoc, but forgot to include it.
> 
> Well I didn't forgot it, I just didn't had time to double check that it is
> bug free :)

It does seem to generate decent looking output and no new warnings.

> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks for taking a look, applied to drm-misc-next.
-Daniel

> 
> > ---
> >   Documentation/driver-api/dma-buf.rst | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> > index 7f37ec30d9fd..7f21425d9435 100644
> > --- a/Documentation/driver-api/dma-buf.rst
> > +++ b/Documentation/driver-api/dma-buf.rst
> > @@ -178,6 +178,15 @@ DMA Fence Array
> >   .. kernel-doc:: include/linux/dma-fence-array.h
> >      :internal:
> > +DMA Fence Chain
> > +~~~~~~~~~~~~~~~
> > +
> > +.. kernel-doc:: drivers/dma-buf/dma-fence-chain.c
> > +   :export:
> > +
> > +.. kernel-doc:: include/linux/dma-fence-chain.h
> > +   :internal:
> > +
> >   DMA Fence uABI/Sync File
> >   ~~~~~~~~~~~~~~~~~~~~~~~~
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
