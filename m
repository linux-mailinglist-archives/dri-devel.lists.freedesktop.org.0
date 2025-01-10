Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A714A09BA9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 20:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C71610E0B8;
	Fri, 10 Jan 2025 19:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HgGQTahj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2240E10E0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 19:15:57 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso2083327f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736536495; x=1737141295; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=V3N1ZpPns7Fa3RgTx3yqPY+qQKBkZdqHUlqSJD/Jo2c=;
 b=HgGQTahjetO4c6d0MwdXqkWtO2LYTJLlDEVPAPrYAbCI3+F8sdvzrM/LUqGWBvrW+k
 yzRYQDctNJBHFe0mn0WqA6Icith9fZicFAhyrk8vCNhnjiM8u+PJI54nazn/V293T9Go
 5zXwvduSAAd99r8O70DzEgJz4MI/pnLY19sn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736536495; x=1737141295;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V3N1ZpPns7Fa3RgTx3yqPY+qQKBkZdqHUlqSJD/Jo2c=;
 b=HByVuno2SfQRbYDTtk16zx0TGd0W3cs+37eL0fYXzDU/HOR9c13jm77DO/0RpPfIQ6
 cr9yyy5UQ/3Dw3O6xJRPZzgSMQbqs4mvTWrDSiFTr9YCOG3ByUS4Y942vKn0QQAS+74q
 rAWjuE2AQUUvR3d7GVanckg5fVwuYmHKTCyeyUsW127IXPYtvLXVLHpWKFqUD5XUyYCl
 G16nM3+aCesl4o0+ay9U4QEElj56EX/PGGbEBx9oZX+ZZW3uc+3TPh3W0bzB4fgkfbgT
 VNXfOcIke5rLR1w7hsKZByDLuneTsETFkyaH0y/3no7beecKKamDKqJNdSrjVx9b28NW
 qPFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdGp5ddnDzOpo156pZ24TILDpv6841XvHOGEtZh69AuOkaNP7XOW5AtCMRUpBpFRw/4uHhtyYaBpc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzzkg6rCk02168G9vaaugFXKym7JUwQ4cBiAGTGo2qJFsMzm50l
 QJB2OTwujwv8wZJQWoBVdIFFBV95Fna5DzPKYdL4uRdDAgQJrLxmKMFTk7yrD5w=
X-Gm-Gg: ASbGncvuZTAguijTxP/gM0nzATFrsJ2pswaonwpBHQh8sw60fjzPe8+iTKcvM7D0gJH
 MJnlhYOtUkdrbDcpQtPMAkr7bv+jM1pRYMNRASka+Ihct2bHiCELxIcvgzS/Nek96qxI+wn6X/X
 K+nE2Dmu2e2U56aV06sWPnM8agcOQ2I0dRWVC1H5WpdS1zoRWkiiQD7XoXCbuf02mQuiTPc8M5z
 5MUlQf83hq2ILTZkATRB0FRmtvB/lQhjUTKdUAKKNQrsYopUxWgVXhTwWd+G7YRqiYz
X-Google-Smtp-Source: AGHT+IGpAQzwoCEWiyaBm2Fgw1qyx4SVekZ56ijnemjvDpcbQLvVGNzltGT+tZigi3rj/YN39Zblmg==
X-Received: by 2002:a05:6000:1acb:b0:385:edd1:2249 with SMTP id
 ffacd0b85a97d-38a87316a81mr10630205f8f.50.1736536495151; 
 Fri, 10 Jan 2025 11:14:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b80b2sm5188388f8f.80.2025.01.10.11.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:14:54 -0800 (PST)
Date: Fri, 10 Jan 2025 20:14:52 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Simon Ser <contact@emersion.fr>,
 Manasi Navare <navaremanasi@google.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Simona Vetter <simona.vetter@intel.com>
Subject: Re: [PATCH] drm/atomic: clarify the rules around
 drm_atomic_state->allow_modeset
Message-ID: <Z4FxrNT2Ty1JRF9U@phenom.ffwll.local>
References: <20250108172417.160831-1-simona.vetter@ffwll.ch>
 <zvcs4tcizuel4ggpwd6coxesx7pcivtuoskwaa3cuvxmtmqigv@f4pj5y5ojt4m>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <zvcs4tcizuel4ggpwd6coxesx7pcivtuoskwaa3cuvxmtmqigv@f4pj5y5ojt4m>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Wed, Jan 08, 2025 at 08:34:28PM +0200, Dmitry Baryshkov wrote:
> On Wed, Jan 08, 2025 at 06:24:16PM +0100, Simona Vetter wrote:
> > msm is automagically upgrading normal commits to full modesets, and
> > that's a big no-no:
> > 
> > - for one this results in full on->off->on transitions on all these
> >   crtc, at least if you're using the usual helpers. Which seems to be
> >   the case, and is breaking uapi
> > 
> > - further even if the ctm change itself would not result in flicker,
> >   this can hide modesets for other reasons. Which again breaks the
> >   uapi
> > 
> > v2: I forgot the case of adding unrelated crtc state. Add that case
> > and link to the existing kerneldoc explainers. This has come up in an
> > irc discussion with Manasi and Ville about intel's bigjoiner mode.
> > Also cc everyone involved in the msm irc discussion, more people
> > joined after I sent out v1.
> > 
> > v3: Wording polish from Pekka and Thomas
> > 
> > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: Manasi Navare <navaremanasi@google.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> > Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> > ---
> >  include/drm/drm_atomic.h | 23 +++++++++++++++++++++--
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> > 
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Applied to drm-misc-next, thanks for pinging me about this one.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
