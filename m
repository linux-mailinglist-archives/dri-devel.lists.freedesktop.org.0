Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8695D8ACB9E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 13:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDAA10F5AF;
	Mon, 22 Apr 2024 11:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Iky/XuzD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B8410F5AF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 11:06:20 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-51967f75763so4976661e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 04:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713783978; x=1714388778; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YpQrXbEcCU95VEbn1ht9SCgCeWNIV1UG30wM8nT8/HA=;
 b=Iky/XuzDU939TRD0uKh9pae4sLOsmNllVURQBSupkQecrzOisYuV5bSSASeeis7+h6
 3Yx2eRT5RNuWzc4S6SXmguch4GAun+n57oAgVzHHm47IIBc6dvmm91f6fukMwO3ydQGk
 a+tk6+zfzcFip1LWPSKflz1r7Fc8KnesjTHH9a0lRxpqAuSSk4fsnoIuA2/GNn4qmayD
 pp8ofj2Os5XxRBG9v5ShuIegizTztagYcKWWbdKCq5C7ATSgEND+c3ReqqJQGCWqtL6j
 j0fdA68YBRrnpIqZNEiQrGdyFCY0CFZCikuMJoXCVFGtTqt0QaQSTMFcA8SqUsgzUJgU
 yYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713783978; x=1714388778;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YpQrXbEcCU95VEbn1ht9SCgCeWNIV1UG30wM8nT8/HA=;
 b=Q4JQmTtu8e9IdbsWquJvUxNWwR35zOBRv6Vz/21Hvzb1/hQN4TOPbIPbcIBVdIVdjE
 L9a9+TQL9h+ajdAgj4y2UeGRkvlUWO6TAzNA9DjkLa39h5FjwzGmgO+0hKZa6nBuFFs3
 7BtrjeqohTX7jhkBuUdxB4jPV7cTXkXtZggk5TsCUGEd5Vr0HXbeAy9f25o8tqoHjlOM
 KSVUBVprjkwec/53ixEek8n3DXnHGdM4OKFWpG2LJAj/hJ46b76Ief4hd8DGc2zaWQVP
 LnbSdJsMGwbzhqpZiP0QjWyiA+HnRV8I3n4fNYPRgdbR6wkIjP4qWmcK5spJkAVfauCK
 Ta3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkzcuFw5zGwqBZyBR28od8hiWcw5NKB4Vt2Fcdb3/Qg8vsDgasOGy4DYF4PdhOHhH2zJDPspMv8jFxQyNTqpPaU4+4b0iOsq+2FrbvCpF+
X-Gm-Message-State: AOJu0YwfJKH2vXXZKqYJ/GFXo1T1tk2f3rF7Wdvvz4FkB712D0yd56yV
 kb/PZYG47eMY/SxeVWRM88xzQ/EqHWHXMNfxZW0WrmK8hM8GYsewdIfCLTt31YJcAsLO6MnJMyu
 K
X-Google-Smtp-Source: AGHT+IGvMJPnVtav8C7a9RvZzJ6oUxfqmZc0E21ejXxuWH9bYRI8cN0vx9XysiMv+sjyZIgD4/s9rw==
X-Received: by 2002:ac2:4182:0:b0:518:dae6:d0ec with SMTP id
 z2-20020ac24182000000b00518dae6d0ecmr5805319lfh.4.1713783978031; 
 Mon, 22 Apr 2024 04:06:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z4-20020ac24184000000b0051589cc26afsm1707031lfh.72.2024.04.22.04.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 04:06:17 -0700 (PDT)
Date: Mon, 22 Apr 2024 14:06:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm/msm/dpu: drop dpu_format_check_modified_format
Message-ID: <wpc7hzr2xol6mz6j4se2a3j7u52fvs6rpikcbpzet7ebz24dbf@g7rlhiz72q46>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-1-d0fe6bf81bf1@linaro.org>
 <9c2f5f63-291c-c2b5-41a1-d2004055cf7a@quicinc.com>
 <ccgx5mjsxf2asvadithitzl7shkboj6ipcg6onfawa5pskchgd@etighi5usone>
 <c3021397-5d2e-c331-663f-eb3803cfc0e0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3021397-5d2e-c331-663f-eb3803cfc0e0@quicinc.com>
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

On Fri, Apr 19, 2024 at 07:32:35PM -0700, Abhinav Kumar wrote:
> 
> 
> On 4/19/2024 6:26 PM, Dmitry Baryshkov wrote:
> > On Fri, Apr 19, 2024 at 04:43:20PM -0700, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 3/19/2024 6:21 AM, Dmitry Baryshkov wrote:
> > > > The msm_kms_funcs::check_modified_format() callback is not used by the
> > > > driver. Drop it completely.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 45 -----------------------------
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 15 ----------
> > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 -
> > > >    drivers/gpu/drm/msm/msm_kms.h               |  5 ----
> > > >    4 files changed, 66 deletions(-)
> > > > 
> > > 
> > > I think in this case, I am leaning towards completing the implementation
> > > rather than dropping it as usual.
> > > 
> > > It seems its easier to just add the support to call this like the attached
> > > patch?
> > 
> > Please don't attach patches to the email. It makes it impossible to
> > respond to them.
> > 
> 
> I attached it because it was too much to paste over here.
> 
> Please review msm_framebuffer_init() in the downstream sources.
> 
> The only missing piece I can see is the handling of DRM_MODE_FB_MODIFIERS
> flags.

I checked and I don't like this approach.

With the generic formats database in place, there should be no
driver-specific code that handles formats. Moreover, I think this should
be handled by the generic code in framebuffer_check() if msm driver
implements a proper get_format_info() callback. Please consider sending
a patch that does it. For now I can only consider the function in
question to be a dead code which should be dropped.

> 
> I am unable to trace back why this support was not present.
> 
> > Anyway, what are we missing with the current codebase? Why wasn't the
> > callback / function used in the first place?
> > 
> > > 
> > > WDYT?
> > > 
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > > > index e366ab134249..ff0df478c958 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> > > > @@ -960,51 +960,6 @@ int dpu_format_populate_layout(
> > > >    	return ret;
> > > >    }
> > > > -int dpu_format_check_modified_format(
> > > > -		const struct msm_kms *kms,
> > > > -		const struct msm_format *msm_fmt,
> > > > -		const struct drm_mode_fb_cmd2 *cmd,
> > > > -		struct drm_gem_object **bos)
> > > > -{
> > > > -	const struct drm_format_info *info;
> > > > -	const struct dpu_format *fmt;
> > > > -	struct dpu_hw_fmt_layout layout;
> > > > -	uint32_t bos_total_size = 0;
> > > > -	int ret, i;
> > > > -
> > > > -	if (!msm_fmt || !cmd || !bos) {
> > > > -		DRM_ERROR("invalid arguments\n");
> > > > -		return -EINVAL;
> > > > -	}
> > > > -
> > > > -	fmt = to_dpu_format(msm_fmt);
> > > > -	info = drm_format_info(fmt->base.pixel_format);
> > > > -	if (!info)
> > > > -		return -EINVAL;
> > > > -
> > > > -	ret = dpu_format_get_plane_sizes(fmt, cmd->width, cmd->height,
> > > > -			&layout, cmd->pitches);
> > > > -	if (ret)
> > > > -		return ret;
> > > > -
> > > > -	for (i = 0; i < info->num_planes; i++) {
> > > > -		if (!bos[i]) {
> > > > -			DRM_ERROR("invalid handle for plane %d\n", i);
> > > > -			return -EINVAL;
> > > > -		}
> > > > -		if ((i == 0) || (bos[i] != bos[0]))
> > > > -			bos_total_size += bos[i]->size;
> > > > -	}
> > > > -
> > > > -	if (bos_total_size < layout.total_size) {
> > > > -		DRM_ERROR("buffers total size too small %u expected %u\n",
> > > > -				bos_total_size, layout.total_size);
> > > > -		return -EINVAL;
> > > > -	}
> > > > -
> > > > -	return 0;
> > > > -}
> > > > -
> > > >    const struct dpu_format *dpu_get_dpu_format_ext(
> > > >    		const uint32_t format,
> > > >    		const uint64_t modifier)
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> > > > index 84b8b3289f18..9442445f1a86 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> > > > @@ -54,21 +54,6 @@ const struct msm_format *dpu_get_msm_format(
> > > >    		const uint32_t format,
> > > >    		const uint64_t modifiers);
> > > > -/**
> > > > - * dpu_format_check_modified_format - validate format and buffers for
> > > > - *                   dpu non-standard, i.e. modified format
> > > > - * @kms:             kms driver
> > > > - * @msm_fmt:         pointer to the msm_fmt base pointer of an dpu_format
> > > > - * @cmd:             fb_cmd2 structure user request
> > > > - * @bos:             gem buffer object list
> > > > - *
> > > > - * Return: error code on failure, 0 on success
> > > > - */
> > > > -int dpu_format_check_modified_format(
> > > > -		const struct msm_kms *kms,
> > > > -		const struct msm_format *msm_fmt,
> > > > -		const struct drm_mode_fb_cmd2 *cmd,
> > > > -		struct drm_gem_object **bos);
> > > >    /**
> > > >     * dpu_format_populate_layout - populate the given format layout based on
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > > index a1f5d7c4ab91..7257ac4020d8 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > > @@ -969,7 +969,6 @@ static const struct msm_kms_funcs kms_funcs = {
> > > >    	.complete_commit = dpu_kms_complete_commit,
> > > >    	.enable_vblank   = dpu_kms_enable_vblank,
> > > >    	.disable_vblank  = dpu_kms_disable_vblank,
> > > > -	.check_modified_format = dpu_format_check_modified_format,
> > > >    	.get_format      = dpu_get_msm_format,
> > > >    	.destroy         = dpu_kms_destroy,
> > > >    	.snapshot        = dpu_kms_mdp_snapshot,
> > > > diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> > > > index 0641f6111b93..b794ed918b56 100644
> > > > --- a/drivers/gpu/drm/msm/msm_kms.h
> > > > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > > > @@ -96,11 +96,6 @@ struct msm_kms_funcs {
> > > >    	const struct msm_format *(*get_format)(struct msm_kms *kms,
> > > >    					const uint32_t format,
> > > >    					const uint64_t modifiers);
> > > > -	/* do format checking on format modified through fb_cmd2 modifiers */
> > > > -	int (*check_modified_format)(const struct msm_kms *kms,
> > > > -			const struct msm_format *msm_fmt,
> > > > -			const struct drm_mode_fb_cmd2 *cmd,
> > > > -			struct drm_gem_object **bos);
> > > >    	/* misc: */
> > > >    	long (*round_pixclk)(struct msm_kms *kms, unsigned long rate,
> > > > 
> > 

-- 
With best wishes
Dmitry
