Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1334C18A0EA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 17:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392C86E927;
	Wed, 18 Mar 2020 16:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945E66E927
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 16:53:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h6so10972028wrs.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 09:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=aeYeB3CANOqnObt2Bin2EEGlMMGDpXacO9WnKapSaKA=;
 b=NeTnpXGGHGa+LDQ3odBkmH8XgCu4vP8uAIprLGgGqv2QtxLAcJwWhqAtAr7VcXEt8I
 Ci+OaEJr91TwVj2Kw3wZ10uq7R96YpdTA0c28dspF+8eZWa9PO1i0PhuOW3ixM15mLdk
 w8fejndds4VLW7Zj+YwlpD7TQv2BaT0HzHWZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=aeYeB3CANOqnObt2Bin2EEGlMMGDpXacO9WnKapSaKA=;
 b=cnciJRIs6jCsrNzZILslKb+5yZEqZ7x87kmP7VFwcbLSbSl2uJ6JcLefzWjmEOdPye
 krR7d4jO73z9xlET9QcKSFHXg+h6usPpuIR1Vxap5+41MFceqa7z177Hmjz+ZaCa965V
 Nd8vs52zmqlzJzTp9E/fNmTpqMGKWAHkmVbAFmTOPtxsxRICB3j11G0IUoLRHCJEnSE5
 /dO4h1CdZLWrbCfiJcAuJQ6KZbLqw239pFhmr7auM8ggasQlhm6cbupnVqvZDXU9lBJZ
 H2ZrPXbEMArI009No4A6x89hw+v8fm8UqLs2tyq4s9ynxGTyCORY2rIRnrhdq8EVo286
 KiEA==
X-Gm-Message-State: ANhLgQ0s8yxdpKaZI1HuNC6Ez/PX8SIE9mJlK22HHBzQmRB+R0/tmcNL
 jYJ8Qg7stWEQAKTWG4PydZ81mQ==
X-Google-Smtp-Source: ADFU+vtcYeHhH9FydXIAf6eT5ZTQaTUtKOqGS0qBVL7DDqzoRzo3pE0LLtATqw5ydhtSupfkeFxxrQ==
X-Received: by 2002:adf:ed8a:: with SMTP id c10mr6775194wro.423.1584550404216; 
 Wed, 18 Mar 2020 09:53:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o23sm10472342wro.23.2020.03.18.09.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 09:53:23 -0700 (PDT)
Date: Wed, 18 Mar 2020 17:53:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Better regex for dma_buf|fence|resv
Message-ID: <20200318165321.GZ2363188@phenom.ffwll.local>
Mail-Followup-To: Sumit Semwal <sumit.semwal@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
 Joe Perches <joe@perches.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>
References: <20200317205643.1028398-1-daniel.vetter@ffwll.ch>
 <CAO_48GH1YkA4mvjyQ=88VRrDPc4Kh8fiFsm-MOaNFfWhhaxfbw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO_48GH1YkA4mvjyQ=88VRrDPc4Kh8fiFsm-MOaNFfWhhaxfbw@mail.gmail.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>, Joe Perches <joe@perches.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 09:16:17PM +0530, Sumit Semwal wrote:
> Hello Daniel,
> 
> Thanks for the patch.
> 
> On Wed, 18 Mar 2020 at 02:26, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > We're getting some random other stuff that we're not really interested
> > in, so match only word boundaries. Also avoid the capture group while
> > at it.
> >
> > Suggested by Joe Perches.
> >
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: Joe Perches <joe@perches.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Thanks for your ack, patch applied.
-Daniel

> > ---
> > v2: No single quotes in MAINTAINERS (Joe)
> > v3: Fix typo in commit message (Sam)
> > ---
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3005be638c2c..ed6088a01bfe 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5025,7 +5025,7 @@ F:        include/linux/dma-buf*
> >  F:     include/linux/reservation.h
> >  F:     include/linux/*fence.h
> >  F:     Documentation/driver-api/dma-buf.rst
> > -K:     dma_(buf|fence|resv)
> > +K:     \bdma_(?:buf|fence|resv)\b
> >  T:     git git://anongit.freedesktop.org/drm/drm-misc
> >
> >  DMA-BUF HEAPS FRAMEWORK
> > --
> > 2.25.1
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
