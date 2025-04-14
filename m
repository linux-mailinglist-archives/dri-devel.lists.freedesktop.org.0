Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B95CA885BC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 16:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E534910E604;
	Mon, 14 Apr 2025 14:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="QIPaCnKG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7693510E604
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 14:51:56 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso31533775e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1744642315; x=1745247115; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gSZhmrO93TUdbr6L9mH0WCU3mN1KrdnBBJ3IftQ+Ywc=;
 b=QIPaCnKGgHj7kLgQbFPdT8lAeUYLD0OlY2YNTpY23SKmrOzIYwuf4go6D6Q5WYiXTR
 eZkrJ9Adh9FYCVAqWTjuOu2CVUh2aF2da1rL5fVUad7io5QT5yJ3crzwBvntFNIxp1a3
 dQ/YeaOj/1jEXDX9amdZNP3x4b9c+JhMtS7/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744642315; x=1745247115;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gSZhmrO93TUdbr6L9mH0WCU3mN1KrdnBBJ3IftQ+Ywc=;
 b=eR/ZfOVn43+kkVAbr30NL0p+SeHA654LVHPo0puJmYvJgbXWLlDWaHR5lfGTTHIPiT
 /tPjtVBLnw9HJGh18o2GNqIf7PVrXtTDDgrXX2XfhLdmw+dKIyiqbMdMnQutOVZb7nwx
 5dlQmOiVAZTrzS4dm7YNfU1PFKlH7aBkobqtYaKjK5GUmK5VLSxSTh3uMnKHICFo6/ks
 zwl+aV/RpaspdcIHx4CnZIfJE6URQPrLGj1m7YMT2uv+NSlszndh7+jcMtOsayV0jPrW
 jSe8CBTFbtfWt90KXDJHMuHrK/U1OJoLWC5+MlU7eise4nycCF1wqczK5apvftV5bqro
 mKYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbqtP+SVGkEbWQZ92RPVvVnWoK3NnE2ifUbgZcn2ZEIo2A378axP1khrfsOWNvSgmO8sEXAJl0bps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2qq6nU83rxObPIl4jNK1cIMEhlGZUwnFBEhRigl6hhtekHlQ5
 o+Iut4YdoNvzlDmAWDTCigQpfEfjYjY19CwL6p/0KvtWrwh0wj/jVMLRNWBlclY=
X-Gm-Gg: ASbGncsVRfi6l/2KOiL+YQPK5QOISkm/oKi3U/rMvpqqjQw0u7yUzDeQnUdTwei9FHz
 OJ2iHJYG8H8mPu2DJnvwy2tfBKJFyA6dg26hf4yA744qIp4HgPtqSciXZMNqTT4yDGfCbNNjW4q
 PMzCeH0QAlCMPyakRbnM4bCMnjxC0u03euwRgU7CWi6KM8WYdwQqkdN5iwe5V7easJ85zu2Hrol
 bS5cuyfr9f30359gthUMBwXoG5TVZ2SKRimB2hMsEo2Tquqq2iL712GH2Kp1Dvmh5z7ZVRztUKi
 2ixpMvPJcVQodMjeOCUJOT0fNVETrLQ8S++YXPDxUIQbfuVEJWZm
X-Google-Smtp-Source: AGHT+IE0sWvMWYqmwuHsujfQkfR1VBy9Yt2ird1c+kgyyyXdM3c3wPxc8xHFjwSVrdDl2DnGktkT/g==
X-Received: by 2002:a05:6000:2282:b0:399:7f2d:5d23 with SMTP id
 ffacd0b85a97d-39ea51f578emr10775506f8f.14.1744642314779; 
 Mon, 14 Apr 2025 07:51:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf445270sm11081240f8f.81.2025.04.14.07.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 07:51:54 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:51:52 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v2] drm/doc: document front-buffer rendering
Message-ID: <Z_0hCGs73eQsrjvx@phenom.ffwll.local>
References: <20250414085652.43904-1-contact@emersion.fr>
 <Z_0Nl9Z8GFoiaxTs@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_0Nl9Z8GFoiaxTs@intel.com>
X-Operating-System: Linux phenom 6.12.17-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 14, 2025 at 04:28:55PM +0300, Ville Syrjälä wrote:
> On Mon, Apr 14, 2025 at 08:56:56AM +0000, Simon Ser wrote:
> > Explain how to perform front-buffer rendering.
> > 
> > v2: apply Pekka's rewrite
> > 
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > ---
> >  drivers/gpu/drm/drm_blend.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> > index 6e74de833466..4e83f372ea51 100644
> > --- a/drivers/gpu/drm/drm_blend.c
> > +++ b/drivers/gpu/drm/drm_blend.c
> > @@ -75,6 +75,12 @@
> >   * 	the currently visible vertical area of the &drm_crtc.
> >   * FB_ID:
> >   * 	Mode object ID of the &drm_framebuffer this plane should scan out.
> > + *
> > + *	When a KMS client is perfoming front-buffer rendering, it should set
> > + *	FB_ID to the same front-buffer FB on each atomic commit. This implies
> > + *	to the driver that it needs to re-read the same FB again. Otherwise
> > + *	drivers which do not employ continuously repeated scanout cycles might
> > + *	not update the screen.
> 
> Should probably add a caveat that this needs to be a sync commit/flip.
> The way the async flip was specified for atomic explicitly requires the
> driver to ignore the plane when the fb doesn't change.
> 
> Also use dirtyfb instead if you don't want to get throttled to the
> vrefresh rate. Tthough I think with some drivers you might get
> throttled even with dirtyfb...

Half the userspace wants throttling, the other half wants it gone so
glxgears looks better. I don't think you want to recommend the dirtyfb
ioctl for that reason at all, because it's just a ymmv ioctl in what
exactly you get in terms of blocking.

It's funny.
-Sima

> 
> >   * CRTC_ID:
> >   * 	Mode object ID of the &drm_crtc this plane should be connected to.
> >   *
> > -- 
> > 2.49.0
> > 
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
