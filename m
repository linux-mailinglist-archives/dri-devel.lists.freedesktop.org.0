Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEFC9FCADB
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 13:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A935F10E045;
	Thu, 26 Dec 2024 12:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iieaJYY2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF4F10E045
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 12:10:51 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-38633b5dbcfso6206738f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 04:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735214990; x=1735819790; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4yE0d6/fT2fHAjzAIYMLLWaXzKg6hYqakVFryoy6JvQ=;
 b=iieaJYY2CsLjdCc7/QLURDOjLPWQbiT9BsMn1GBf/YUGsxntQjc7WPMDtyBhUorG2E
 TA1wLo7Ruz6fiOLYHiVfpCYyZiSqnaAiODAW1kAsuGcihmLCAT9GJIyqDlTzZerl/L6V
 G0fHFZDMea7eDe2jT+xzWcBvZw7GfyDjEmZV0iCndjUKlCyJbkYdpjKhe1pQXbgb7Qg+
 yfiRO2Jn2YdDoEWk3fEjnke0gxNjG50f+9VGPmpNGs64YLIqrkc8amL5j1bvjME1VmYT
 nLzmSYnSkw2bhTV3gAf5t5j0d2M2O/qT7ISUqfLVeKQ9JvArJ7M/eLUjofzztN8AjrEd
 b/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735214990; x=1735819790;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4yE0d6/fT2fHAjzAIYMLLWaXzKg6hYqakVFryoy6JvQ=;
 b=TIaNlfzmEbc+5EqELnQoN1vvmUBHIBPGzqRmgDcMEUH41c4eLV1Se7HvagjGoEE4nd
 tF2S+yXB0MjWwXILxb3UJ83w/8NW9+MJhliUGOGWecX8rhXxs3K6FBkG4+swBQq1H+0v
 P14zeLHQlG1e/CQLC2h1J36ZUQd8EQ2WGZgq/6Ma9NfT9RH9GX/WbRS+vSz2UO+J/ueZ
 Y8jRewLGfOIkZaPJzfdCm+yvOPyRbYhv+Ip+2K4gWergF1Xym8nrqjDT/LpDw5zNy6l0
 I2efkgfi991bioGvQ8588SNcQ159VtEWsmM9cURBqDLDywatISI+MbVDAnj0t+N+vlIw
 tE8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUZn9UPHCEDlpEYWA1URENCeW0MXjC7fY8f6+BMxOW4lcfaWVRId0uPB+//JbmeQ+3NBO2Fs4cyME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMSz0e52vWjjrHSixLiVbIoORxNTJmrVjImnUb9xJ/x3D6QgfP
 X6poTAraRZof0az5YuOSTm6+HYCS3dPUORB+ACgPq/+fBS1kS06+u9a7zeeohtc=
X-Gm-Gg: ASbGncup65fM6s3fWPTLfJWPzn2lXUrL3VIETXW2h9GARFOxnoU2gKDWXpnu+/dFdZQ
 PuYy0sMKZJ8CAuism4E1YbUU3EVUC0KU6oJrTK8DiUB+SGrgmnKU1GwQroHWIsMrIs5u68sE0Ql
 dB7GdEKQNUYzCAoQAZChD48Cn6+H/QfhtW8rz3s2KO+h4d+IhLlpgau/YyV4MA+e/fBl8/G3cs1
 v35na3TgP+T47CC60Ut4iSqzKWP0vaOhWABXgLInljUG7lANiVNJJg=
X-Google-Smtp-Source: AGHT+IE7Mzk62uTd4yycH28u5xCSB39eiD96qbQg0fIjJMfiTxkRYB+ECRA3AUQrSJ8HACLT9c1tFw==
X-Received: by 2002:a05:6000:400b:b0:385:ee3f:5cbf with SMTP id
 ffacd0b85a97d-38a221eab74mr22082237f8f.20.1735214990215; 
 Thu, 26 Dec 2024 04:09:50 -0800 (PST)
Received: from linaro.org ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e1cesm19043982f8f.64.2024.12.26.04.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2024 04:09:48 -0800 (PST)
Date: Thu, 26 Dec 2024 14:09:46 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z21HimmBvwwA7/KD@linaro.org>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <o6xcm7jdcay77b6kltj7zownk6je6umqlmxsuscbbubw4jlr5v@w4zuusufajwx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <o6xcm7jdcay77b6kltj7zownk6je6umqlmxsuscbbubw4jlr5v@w4zuusufajwx>
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

On 24-12-11 21:22:00, Dmitry Baryshkov wrote:
> On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
> > According to the DisplayPort standard, LTTPRs have two operating
> > modes:
> >  - non-transparent - it replies to DPCD LTTPR field specific AUX
> >    requests, while passes through all other AUX requests
> >  - transparent - it passes through all AUX requests.
> > 
> > Switching between this two modes is done by the DPTX by issuing
> > an AUX write to the DPCD PHY_REPEATER_MODE register.
> > 
> > Add a generic helper that allows switching between these modes.
> > 
> > Also add a generic wrapper for the helper that handles the explicit
> > disabling of non-transparent mode and its disable->enable sequence
> > mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> > to move this handling out of the vendor specific driver implementation
> > into the generic framework.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 50 +++++++++++++++++++++++++++++++++
> >  include/drm/display/drm_dp_helper.h     |  2 ++
> >  2 files changed, 52 insertions(+)
> > 
> 
> 
> > +/**
> > + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> > + *
> > + * @aux: DisplayPort AUX channel
> > + * @lttpr_count: Number of LTTPRs
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> > +{
> > +	if (!lttpr_count)
> > +		return 0;
> > +
> > +	/*
> > +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> > +	 * non-transparent mode and the disable->enable non-transparent mode
> > +	 * sequence.
> > +	 */
> > +	drm_dp_lttpr_set_transparent_mode(aux, true);
> > +
> > +	if (lttpr_count > 0 && !drm_dp_lttpr_set_transparent_mode(aux, false))
> > +		return 0;
> > +
> > +	/*
> > +	 * Roll-back to tranparent mode if setting non-tranparent mode failed or
> > +	 * the number of LTTPRs is invalid
> > +	 */
> > +	drm_dp_lttpr_set_transparent_mode(aux, true);
> 
> This means that if lttpr_count < 0, then there will be two requests to
> set LTTPRs to a transparent mode. Is that expected?

Yes, exactly. If counting the LTTPRs (see drm_dp_lttpr_count) results in an
invalid number (e.g. more than 8), then according to the DP standard,
we need to roll back to transparent mode.

Do you think I need to re-word the comment above more to make it more
clearer?

> 
> > +
> > +	return -EINVAL;
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_init);
> > +
> 
> -- 
> With best wishes
> Dmitry

Thanks for reviewing,
Abel
