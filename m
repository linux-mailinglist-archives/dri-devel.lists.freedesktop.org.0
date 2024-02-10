Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CD28503BF
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 10:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A593112479;
	Sat, 10 Feb 2024 09:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GsXMyEgu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499FF112478
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 09:52:28 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6047a616bfeso16395887b3.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 01:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707558745; x=1708163545; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/rSrkLEnZ/NnQ2Np+XYCh7vhWSFNxT7YNWrrjOmWEs4=;
 b=GsXMyEguobHla/VsmD/EAoVZJEKSuh0ah572JdyH2sC5BscWOkItfDE6mILEnX0uqx
 yDWxfbn7DuMZdSv1r/JqGfNoYof7ifMjSJLWvIbSXUzMoHuKwAvgAYRGeevFv5zw5g+z
 0FheYt+JbqLu0FVriatJXW0y5sJSk9Hg1XUaVCS7QiCwIRUS7N+wYg3+3RLGWXh/zuS0
 hmOzFjFLmnA5DSckMjcSex2sVtcsf2OXfyUJM64Llqbo56im6eVVXJJ7vyyWe3L5hcyy
 7nCQDlY4jNQND/G02+UbZMDQvUN8XUUbEqYdyHXFMpcOMVySjzKpG9shLVNHMQeUGHRe
 wu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707558745; x=1708163545;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/rSrkLEnZ/NnQ2Np+XYCh7vhWSFNxT7YNWrrjOmWEs4=;
 b=CIwYy2XftZckbaOgMjnGNSik09o1B/ot7FYdP8xAuLXg//PB1E1LI/uUrq7OjLX1bZ
 FnicP18aCZEnYNvT/6nZ2mxSierMB6/GMWgS6M3HN5yEE3guwdcIe++PBD5vhZ9gE6Hu
 oJc5L7kC9jScty/kjruT3Q33+9ehNYqwrwI+cKFixiaaU3Hv0nlb1PHAgE7N0tonmTYJ
 fEhJTP2KFXerPygaV5gjwjS+Eb8UsmZaaM3w8nxcTXNUt8vQz0F0/TQ1CuUoCfBOjIYf
 MHJs0ZpEfo/uYr4ICi1U6rPwOPq4fzzp+PAf5AwFvi2iMVBUdzemqZ6kpQztnEQd83wT
 wx0A==
X-Gm-Message-State: AOJu0YwAs0r6Ht7RtF+3SzRB7IJdBh6wd9bYpQ2uter3u38UJzI6KSgt
 /jz0E3fzqupDjXfcLXbiEEiTJGpR78HMPbp1Yqc6bM8ZXBaJxioHHIvh2qHSj7RDbuTNuReGFYV
 RIpWIYqfowtvRq0NJlNuW/D08r1Ep4w8O24vnxA==
X-Google-Smtp-Source: AGHT+IEglTdZGiXWk/+m1AJcXQ0fjrneGALl1T3mcJqvkGKmXiD4oxFb+/K2jTdnhOFjYDnniCk51B2y0hARKWKhywY=
X-Received: by 2002:a05:6902:543:b0:dc7:4bab:c390 with SMTP id
 z3-20020a056902054300b00dc74babc390mr1113002ybs.61.1707558745587; Sat, 10 Feb
 2024 01:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-3-quic_parellan@quicinc.com>
 <CAA8EJponSr=EgVe6m-KBWxvjz1bL-0Tczj=fGKZZrevJ3DZzbQ@mail.gmail.com>
In-Reply-To: <CAA8EJponSr=EgVe6m-KBWxvjz1bL-0Tczj=fGKZZrevJ3DZzbQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:52:14 +0200
Message-ID: <CAA8EJppXmr3QAtv3kOj+VyGrxtBULQFJEFm-Yz+ERHkYN1SuUQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] drm/msm/dp: add an API to indicate if sink
 supports VSC SDP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 10 Feb 2024 at 11:37, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 10 Feb 2024 at 03:53, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >
> > YUV420 format is supported only in the VSC SDP packet and not through
> > MSA. Hence add an API which indicates the sink support which can be used
> > by the rest of the DP programming.
> >
> > Changes in v2:
> >         - Move VSC SDP support check API from dp_panel.c to
> >           drm_dp_helper.c
> >
> > Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 21 +++++++++++++++++++++
> >  include/drm/display/drm_dp_helper.h     |  1 +
> >  2 files changed, 22 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index d72b6f9a352c1..c6ee0f9ab5f8f 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -2917,6 +2917,27 @@ void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
> >  }
> >  EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
> >
> > +/**
> > + * drm_dp_vsc_sdp_supported() - check if vsc sdp is supported
> > + * @aux: DisplayPort AUX channel
> > + * @dpcd: DisplayPort configuration data
> > + *
> > + * Returns true if vsc sdp is supported, else returns false
> > + */
> > +bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> > +{
> > +       u8 rx_feature;
> > +
> > +       if (drm_dp_dpcd_readb(aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature) != 1) {
> > +               drm_dbg_dp(aux->drm_dev, "failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
> > +               return false;
> > +       }
> > +
> > +       return (dpcd[DP_DPCD_REV] >= DP_DPCD_REV_13) &&
> > +               !!(rx_feature & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);
>
> Nit: we don't even need  the `!!` here. I'll probably drop it while applying.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Also the prefix should be drm/display/dp, not drm/msm/dp.

Could you please send this patch separately to dri-devel, fixing the
prefix, dropping double inversion and adding Intel people to cc? We'd
need an ack from the drm core team to get this applied.

>
>
> > +}
> > +EXPORT_SYMBOL(drm_dp_vsc_sdp_supported);
> > +
> >  /**
> >   * drm_dp_get_pcon_max_frl_bw() - maximum frl supported by PCON
> >   * @dpcd: DisplayPort configuration data
> > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> > index 863b2e7add29e..948381b2b0b1b 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -100,6 +100,7 @@ struct drm_dp_vsc_sdp {
> >
> >  void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
> >                         const struct drm_dp_vsc_sdp *vsc);
> > +bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> >
> >  int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
> >
> > --
> > 2.39.2
> >
>
>
> --
> With best wishes
> Dmitry



-- 
With best wishes
Dmitry
