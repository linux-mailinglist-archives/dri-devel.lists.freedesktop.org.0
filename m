Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682D5A1A282
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 12:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E7610E7CC;
	Thu, 23 Jan 2025 11:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M8ZlVrfZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2466310E286
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 11:04:37 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53f22fd6832so857573e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 03:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737630275; x=1738235075; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9Rj2GtJ6nzpZLgheHkg3rMzdXQplG/HNwyYcLI7b1CE=;
 b=M8ZlVrfZGJA/FcPk9XNnvGnQ2TSWjbixIUHOT7Blf+6XAZ/FN8VFrzibJGyP+4aaLI
 1F2gn15D759LSytaom5ZvaoeX/3wxlKh4tyc2ePwQFqq9geHBF+m4pr/pT/n+/UYyne8
 BPLtySN1dHVWs9uVUaq4D8CkLJ4NwCwyaY9BrXJvCCj1ixI8UWJgWjZLIm28Fk6LnfRy
 /DRX860VHgovI1BHSss9McEEQLU2HU783bu5bp0Xgc8vYayV1EK4U61evmhXvtR8h1Ll
 N3/63VJvXFJnf5UH6ZWQnQ0lDKXawtbIoyvWbqHniTmV4GkodVp5ps0TXvYESEBj9YsX
 HhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737630275; x=1738235075;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Rj2GtJ6nzpZLgheHkg3rMzdXQplG/HNwyYcLI7b1CE=;
 b=vbuI5kQzI+os70XOFld0nphCEwgBePeItJ+DAHyax0S8z+QSpVg2MzRArST1o1uLEw
 1wlASsAe2S/y5d5bX5L0iQEJTKlYDy6g16E9fHQTlEpsEZrLeG9OnIgqOWuriawSffXv
 2AF5J2UajDkD78XFyGcKKwVWFe5cErg+hIs1jTZFoU/5DkkP4GvFvTvIrmLKlPHTxi1U
 G5BKDtZSPYM0ovCFRGmEEcHOCTVEG3wawZH4lcamWnusA7e+uPyyaj789fGuRNp8wDyi
 dlN7LNJ2Pc4GRblBl/QuVMl5qeyQMnROQGOVKxYbwT5a75ODzaOVqGwixhDBNQlrS9pH
 A0vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUja4wdQj+O2rcZp2r2wOr9cmK5IEpBgUYVyyaC/bnxa1WoO2c21T5dI20aKq7SOrWgU7A0/ZqQH3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdQPWca6g3rFnm6F4Z83pfgXbsJTSseDghH0QBeVjUo6t4E7yv
 X8z24ExXRXZ9Qg9waOYy2+9UJ605Gn6Wg+oz/9JNgOR4HB1jFIt5xZBQZq4IXlQ=
X-Gm-Gg: ASbGncs1I6oJI5yPFW4ltNE0tXC7Yj8/pU9I0vMzhCB8Lr+MUfFhGzvCPmiqZ4afspk
 wLD1gc2lb0rkYynTeL+6yBH7FJZHZ/1eJbjaJ1Ay7SnPSGh5lGI7OKVj9TYbCKwamwUdBeQVo5E
 YE2X4KLq5XyzBHQ6YaYkm4JAeZVJrzGSxPCmHXHmDEauRr16pK/5MSDxfCAWe2Kaf75VXYdLsYi
 N54lkpUAmCUGImNd9kF5pJkcFsGVZYQuRDnd/xHmHb5MXEFNpfA8m7DmiS163o2Braxm/HFcsGE
 L96F5nwY2NiBJ9QAzsnmxbDfzKmHr5eSou5LB2CjbV+drONWvss7WxxbWDYw
X-Google-Smtp-Source: AGHT+IH+11R13avpIf+E+wXtNihIljAcxVa+BKIM6BqUk/yHYhwQQaLP/QAJaKwHxjFG+DRnlW/51g==
X-Received: by 2002:a05:6512:4029:b0:542:a763:4469 with SMTP id
 2adb3069b0e04-5439c246d06mr7384805e87.21.1737630275131; 
 Thu, 23 Jan 2025 03:04:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af06315sm2592507e87.36.2025.01.23.03.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 03:04:33 -0800 (PST)
Date: Thu, 23 Jan 2025 13:04:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 2/7] drm/display: dp: implement new access helpers
Message-ID: <oimolivajra4a7jmeloa5g4kuw2t54whmvy2gpeayo5htkcyb4@ryev34rq2m4j>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
 <20250117-drm-rework-dpcd-access-v1-2-7fc020e04dbc@linaro.org>
 <87o6zxn7vy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6zxn7vy.fsf@intel.com>
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

On Thu, Jan 23, 2025 at 12:26:25PM +0200, Jani Nikula wrote:
> On Fri, 17 Jan 2025, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > Existing DPCD access functions return an error code or the number of
> > bytes being read / write in case of partial access. However a lot of
> > drivers either (incorrectly) ignore partial access or mishandle error
> > codes. In other cases this results in a boilerplate code which compares
> > returned value with the size.
> >
> > Implement new set of DPCD access helpers, which ignore partial access,
> > always return 0 or an error code. Implement existing helpers using the
> > new functions to ensure backwards compatibility.
> >
> > Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c       | 42 +++++++-------
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 27 +++++----
> >  include/drm/display/drm_dp_helper.h           | 81 ++++++++++++++++++++++++++-
> >  include/drm/display/drm_dp_mst_helper.h       | 10 ++--
> >  4 files changed, 119 insertions(+), 41 deletions(-)
> >
> > +
> > +/**
> > + * drm_dp_dpcd_write() - write a series of bytes from the DPCD
> > + * @aux: DisplayPort AUX channel (SST or MST)
> > + * @offset: address of the (first) register to write
> > + * @buffer: buffer containing the values to write
> > + * @size: number of bytes in @buffer
> > + *
> > + * Deprecated wrapper around drm_dp_dpcd_write().
> > + * Returns the number of bytes transferred on success, or a negative error
> > + * code on failure.
> > + */
> > +static inline ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux,
> > +					unsigned int offset,
> > +					void *buffer, size_t size)
> > +{
> > +	int ret = drm_dp_dpcd_write_data(aux, offset, buffer, size);
> > +
> > +	if (ret < 0)
> > +		return ret;
> 
> I just realized this changes behaviour. This no longer returns the
> number of bytes transferred when it's less than size. It'll always be an
> error.
> 
> Now, if we were to accept this change, I wonder if we could do that as a
> standalone change first, within the current functions? Return either
> size or negative error, nothing between [0..size).
> 
> After that, we could change all the return checks for "!= size" or "<
> size" to "< 0" (because they would be the same thing). When all the
> places have been changed, we could eventually switch from returning size
> to returning 0 on success when nobody depends on it anymore, and keep
> the same function names.
> 
> I think this does have a certain appeal to it. Thoughts?

I thought about it while working on the series. There is an obvious and
huge problem: with the changed function names you actually have to
review usage patterns and verify that the return comparison is correct.
If the name is unchanged, it is easy to miss such usage patterns. For
example, i915 / amd / msm drivers are being developed in their own
trees. Even if we review those drivers at some point, nothing stops them
from adding new code points, checking for size instead of 0. Likewise
patches-in-flight also can't be properly reviewed if we just change the
return value.

Thus, I think, while the idea of keeping function names sounds
appealing, it doesn't help in a longer term and can potentially create
even more confusion.

-- 
With best wishes
Dmitry
