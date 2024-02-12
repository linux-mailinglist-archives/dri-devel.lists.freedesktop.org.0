Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B010D851F76
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 22:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546CB10E705;
	Mon, 12 Feb 2024 21:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LWnumCJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC2210E665
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 21:20:49 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dc74e33fe1bso3607034276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707772848; x=1708377648; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iV9U9eXYCJcvJrj6H/0WsRlgw1HkWWp0lw6ZqsXTu3w=;
 b=LWnumCJzk1pToX8r4cU60U6CjKfYbPJW7fBP5g5EfPXqeTza0TjrwieQrVDYZeLsIa
 rGF2QmFOzPfVTZ6NVomkvJ4rX/iv9XAqpFgWGOyTo+pX5Jfppydfng6AAFvYnLR2Isv2
 a+DN4QdQHnFEHyG/fzcFzD6KTQyxip0f0iriHnDjbePi3btJb6zcgh+oSIbfIy19KCaZ
 7Ay4yLCgK1jGbASwPsOrhp1NyvAt1IqTXMDSxCkdrxt04VEOq4w0Zn9TXuRsAqEOBYRO
 KGcalWzv3jMjG+6LTxRx5dR12RH86imGl1Jta4NbNM8dsUBQDrqLCSXFlySgcVm9CWG4
 idnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707772848; x=1708377648;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iV9U9eXYCJcvJrj6H/0WsRlgw1HkWWp0lw6ZqsXTu3w=;
 b=u+VLn/enot+BA5nnCCx6NwF4quJYNrI3ACe5HX915shZDJQI2JVjXk+e/5aKXpa1f1
 TaDh3pF/6SikZ02xw/dHn5g4pWnAZFJGWMK+B70cYyQIS/oqUKiU54VyHyctf1rSkASL
 57cpx1RvKjod3QeWn43Rq9l2g7r7I9sszb9vY6jij1onmnesfnlbuePZDKqbCgZQc7Oh
 xYbGlaVdR/CSWm5drxXnSQDOcyCnd+gIuDd2VHP5GPSOmXKJgbQ48GNz01klNTk1ZBjr
 6THmtX3L40xKsUs7Mg0cz8AQVGO0zHVuM9po/76BK1jD/z0Bc0G1YLDVGH3u1iD+jOIs
 bN6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmcrsXSwd4vogQkEvFfiWX4SuRqVHgunBlNLh+m6h95OzQV5ELLzkYolU54ZfcZ1NYiD1Yb8HM3oYFov7PAVWkYAYXjRZrrglA/Q+sEubp
X-Gm-Message-State: AOJu0Yx/YX4sLkkAg3pBhqZGStAzrOwtg4/WsHS+ZmJNbkq/4ezM39Fq
 U7/Q8uYWCgkPNh9LkqMbxEIchzPY7mjFeFIgi3+1SqQ1smTyNgpeSnGNPleCcVaKn8BohMSpAMM
 eixCjd/eN9wViPmf/sp1Qnj5dVaHv2o5Z5rzH1Q==
X-Google-Smtp-Source: AGHT+IESmQ7wY2Dyevaw+NSSNF8ORzP3IV5t3PljHIorAJTXf9UszM0B7+uTaQmBATW5GJM+KBdolgUJ9P3K+CL8P/c=
X-Received: by 2002:a25:b11a:0:b0:dcc:32cb:cb3b with SMTP id
 g26-20020a25b11a000000b00dcc32cbcb3bmr657729ybj.44.1707772848660; Mon, 12 Feb
 2024 13:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-20-quic_parellan@quicinc.com>
 <CAA8EJpq15w_Gjx+rPzN8vBg5Z8PGzABAztqmLpfnafuvNVLmRw@mail.gmail.com>
 <56e521ab-ae57-9296-59a1-0bdbad60f882@quicinc.com>
 <CAA8EJprUeJvL_mP0x19YQCdTbErzy-RRF6GmSOK_eApsRiTALw@mail.gmail.com>
 <04df55f1-9430-727b-426b-81d762b3b2e6@quicinc.com>
In-Reply-To: <04df55f1-9430-727b-426b-81d762b3b2e6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 12 Feb 2024 23:20:33 +0200
Message-ID: <CAA8EJpqZT+Z-1oH6pRs05kZj16XdUyzi15ko3W3cS1DGC36pew@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] drm/msm/dp: allow YUV420 mode for DP connector
 when CDM available
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
 marijn.suijten@somainline.org, neil.armstrong@linaro.org
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

On Mon, 12 Feb 2024 at 23:13, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/10/2024 1:17 PM, Dmitry Baryshkov wrote:
> > On Sat, 10 Feb 2024 at 21:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/10/2024 3:33 AM, Dmitry Baryshkov wrote:
> >>> On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>>>
> >>>> All the components of YUV420 over DP are added. Therefore, let's mark the
> >>>> connector property as true for DP connector when the DP type is not eDP
> >>>> and when there is a CDM block available.
> >>>>
> >>>> Changes in v2:
> >>>>           - Check for if dp_catalog has a CDM block available instead of
> >>>>             checking if VSC SDP is allowed when setting the dp connector's
> >>>>             ycbcr_420_allowed parameter
> >>>>
> >>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +++-
> >>>>    drivers/gpu/drm/msm/dp/dp_display.c     | 4 ++--
> >>>>    drivers/gpu/drm/msm/dp/dp_drm.c         | 8 ++++++--
> >>>>    drivers/gpu/drm/msm/dp/dp_drm.h         | 3 ++-
> >>>>    drivers/gpu/drm/msm/msm_drv.h           | 5 +++--
> >>>>    5 files changed, 16 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>> index 723cc1d821431..beeaabe499abf 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >>>> @@ -565,6 +565,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> >>>>    {
> >>>>           struct drm_encoder *encoder = NULL;
> >>>>           struct msm_display_info info;
> >>>> +       bool yuv_supported;
> >>>>           int rc;
> >>>>           int i;
> >>>>
> >>>> @@ -583,7 +584,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> >>>>                           return PTR_ERR(encoder);
> >>>>                   }
> >>>>
> >>>> -               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
> >>>> +               yuv_supported = !!(dpu_kms->catalog->cdm);
> >>>
> >>> Drop parentheses please.
> >>>
> >>>> +               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder, yuv_supported);
> >>>>                   if (rc) {
> >>>>                           DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> >>>>                           return rc;
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> index ebcc76ef1d590..9b9f5f2921903 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> @@ -1471,7 +1471,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
> >>>>    }
> >>>>
> >>>>    int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>>> -                       struct drm_encoder *encoder)
> >>>> +                       struct drm_encoder *encoder, bool yuv_supported)
> >>>>    {
> >>>>           struct dp_display_private *dp_priv;
> >>>>           int ret;
> >>>> @@ -1487,7 +1487,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>>>                   return ret;
> >>>>           }
> >>>>
> >>>> -       dp_display->connector = dp_drm_connector_init(dp_display, encoder);
> >>>> +       dp_display->connector = dp_drm_connector_init(dp_display, encoder, yuv_supported);
> >>>>           if (IS_ERR(dp_display->connector)) {
> >>>>                   ret = PTR_ERR(dp_display->connector);
> >>>>                   DRM_DEV_ERROR(dev->dev,
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> >>>> index 46e6889037e88..ab0d0d13b5e2c 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> >>>> @@ -353,7 +353,8 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>>>    }
> >>>>
> >>>>    /* connector initialization */
> >>>> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> >>>> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
> >>>> +                                           bool yuv_supported)
> >>>>    {
> >>>>           struct drm_connector *connector = NULL;
> >>>>
> >>>> @@ -361,8 +362,11 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
> >>>>           if (IS_ERR(connector))
> >>>>                   return connector;
> >>>>
> >>>> -       if (!dp_display->is_edp)
> >>>> +       if (!dp_display->is_edp) {
> >>>>                   drm_connector_attach_dp_subconnector_property(connector);
> >>>> +               if (yuv_supported)
> >>>> +                       connector->ycbcr_420_allowed = true;
> >>>
> >>> Is there any reason to disallow YUV420 for eDP connectors?
> >>>
> >>>> +       }
> >>>>
> >>
> >> Major reason was certainly validation but thinking about it more
> >> closely, I need to check whether CDM over eDP is even possible.
> >>
> >> Historically, CDM could output only to HDMI OR WB using the bit we
> >> program while setting up CDM and the same HDMI path is being used by DP
> >> as well. But I need to check whether CDM can even output to eDP with the
> >> same DP path. I dont have any documentation on this part yet.
> >
> > I had the feeling that the DP / eDP difference on the chips is mostly
> > on the PHY and software side. So I assumed that it should be possible
> > to output YUV data to the eDP port in the same way as it is done for
> > the DP port.
> >
>
> This is true. I was not worried about DP / eDP controller but mostly
> whether eDP spec really allows YUV. From what I can read, it does.
>
> So this check shall remain only because CDM has not been validated with eDP.
>
> Do you need a TODO here and if we ever get a eDP panel which supports
> that, we can validate and relax this.

Just move it out of the eDP check.

-- 
With best wishes
Dmitry
