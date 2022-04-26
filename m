Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FF751044A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903EC10E8AF;
	Tue, 26 Apr 2022 16:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2052210E8AE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 16:48:18 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-deb9295679so19973017fac.6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 09:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/9+L1bD8GO2iPBuObOEB4z68+3Sfat/RrLBb6eqV/V0=;
 b=lBNxBWbqO16PHPt92QnCVAsCamewM9w4IaIYrjQ91P552kBF3MdXxI9WUasA3xmWci
 4obO3GuaBMZohB1TIXIpTSrJPacqX5UD2iuNGuhaywB3Qr5WRl7kZv+3u3eO42Ah80lQ
 agbut9Qlme7epMpw97SYKKYViOO4LplkQKPfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/9+L1bD8GO2iPBuObOEB4z68+3Sfat/RrLBb6eqV/V0=;
 b=cC2YcI7LEj79KFx9QvPTy8OF4om52kHPihA1impLS31nnr4/g1q+jbifhJRlOILcMa
 BI79TVqEzKZyRwELtwB+wqdVcXOk82UWteZFkV9Xo6KdhCd5wm8YXD0jgoeWYlCpE11v
 1amgp18ro0NmZTC+Ps2N8UWUU7wejEEfc3A6lICFUDXQKukeNyUVAdfMlAIBy8tkwyqQ
 qo1Sqnokok2qSkBH/eJbCsbh+MFmrVYk0sQHYT0zXdR+bTTKbtwPwFmHFjLd+FcMpAA3
 uaT3kpI8zLyW4mPLVOI/5sc4941ZI5MFuIwjichhOwlpVNkwzwU2Ja0YZSIaD0FHAwWK
 st2A==
X-Gm-Message-State: AOAM5319VOt+WfJHgs8VLfdr2yKRYd9kw6JqhLdxyJ9nIZ56rpMhcOQA
 5mdFeJwGdU12msK3uqBKmddNO8EjYSkOhlCNYh0S5w==
X-Google-Smtp-Source: ABdhPJxKHFjbu3FrMhvJFwVaDlybrC6id9HpmZhkaJInJh5R8/wMLvQcBeQHVCW+y3mQUUlmP+wKOuJqFWvO6XBDj0U=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr9917250oao.63.1650991697400; Tue, 26
 Apr 2022 09:48:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Apr 2022 09:48:16 -0700
MIME-Version: 1.0
In-Reply-To: <1650932213-19162-3-git-send-email-quic_khsieh@quicinc.com>
References: <1650932213-19162-1-git-send-email-quic_khsieh@quicinc.com>
 <1650932213-19162-3-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 26 Apr 2022 09:48:16 -0700
Message-ID: <CAE-0n53NJ68H4DD6uE5p2Dhmb9QxGOVXenhdG2=A2_T6Fp520g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/dp: do not stop transmitting phy test
 pattern during DP phy compliance test
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-04-25 17:16:53)
> At normal operation, transmit phy test pattern has to be terminated before
> DP controller switch to video ready state. However during phy compliance
> testing, transmit phy test pattern should not be terminated until end of
> compliance test which usually indicated by unplugged interrupt.
>
> Only stop sending the train pattern in dp_ctrl_on_stream() if we're not
> doing compliance testing. We also no longer reset 'p_level' and
> 'v_level' within dp_ctrl_on_link() due to both 'p_level' and 'v_level'
> are acquired from link status at previous dpcd read and we like to use
> those level to start link training.
>
> Changes in v2:
> -- add more details commit text
> -- correct Fixes
>
> Fixes: 2e0adc765d88 ("drm/msm/dp: do not end dp link training until video is ready")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

One comment.

> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 193cc1a..f99e173 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1839,6 +1831,13 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>                 return 0;
>         }
>
> +       if (!dp_ctrl_channel_eq_ok(ctrl)) {
> +               dp_ctrl_link_retrain(ctrl);
> +       }

Drop unnecessary braces.
