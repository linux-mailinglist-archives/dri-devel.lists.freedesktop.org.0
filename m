Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8B24BEFCB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 04:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0524E10E5CF;
	Tue, 22 Feb 2022 03:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCE410E5C0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 03:12:06 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id n6so37591292qvk.13
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 19:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gQ7tL9yE1YjTlYy7IejJ8wI93X2uR0MQXXmiDoUIMcA=;
 b=widGmEJ6an//elEa8rev0M6RF+QC8ehjwvQe1U0C2Wrcne672GyJ+RJLdDOwhjuhNI
 UcpbRuelVUJcEQeRZNccQxmvsGXx0/Fd3M75o3+Q/PjT9dNMDogeWaeKTngkwiAbahkI
 rO7hqsUL8KQDoja4dZt9RRb0eEnAic9/jYh1S02Cahb1RbwmEw2SjyTAB0VfHf45i4rV
 +rQ33Q+YIHM9JvYOzg6C8lIkwoqps9FfRTuQ4F/Ek+WEwIluRTJZxNWyHfZ4nEgJ8RW3
 tZBgXSK+dkrG5cGAASx4asZ4ILaDTwUozxHNINhLjAk5cJvAHfBa8yU+VPwsOSdfVQZz
 lH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gQ7tL9yE1YjTlYy7IejJ8wI93X2uR0MQXXmiDoUIMcA=;
 b=vpHwZkZ+T3PIv7M7q188Y+RLbF/Ot0lyMfoRizqBL4hc3xhehpm3kMmXWr8fAe2mcn
 eow/C/1WGlSFShyy44Autm0L2J3khF/gcSUDP8pIdSfbbLbl852QF4Xoa/2lnyFlEqR/
 kOitzoB0YIaDOwSxxAg/wtSrknvMabiqMJ8xCQqRTR6IJZZp/OM1DqfsQP9UoyaL5o6R
 3S9IGYopRuWeMPWFz/coPvAYBhJzbGPW1AtUtZt066CYjyr5fK1dJPsw0ZceOGps30zk
 0NM9OScGyizIXpyeJO4drGKR9qFEcRlcJKlSVDDJ5x2+TmdNYnZqVoqVcaCaUk7K/pki
 UBVQ==
X-Gm-Message-State: AOAM530w7wgbtEv26Z+tNEfnWgSWN97BMFKsgp78oAU8yPKDKs8MqHSR
 viPx0YzQMr+bO8c5GtcfHF/l7WxBgxkpmsspqTdb8l89dYQ=
X-Google-Smtp-Source: ABdhPJw7BO2C1PYECTEtc3I5iKBeb2Gxkis1DlKuq3jNu0GdzNbF3pLixIt7A3UygUGnJxqtVPwf14/05FmYSwMt0Qs=
X-Received: by 2002:a05:6214:400a:b0:431:7f6c:98fc with SMTP id
 kd10-20020a056214400a00b004317f6c98fcmr8728971qvb.122.1645499525424; Mon, 21
 Feb 2022 19:12:05 -0800 (PST)
MIME-Version: 1.0
References: <1645455086-9359-1-git-send-email-quic_vpolimer@quicinc.com>
 <1645455086-9359-4-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1645455086-9359-4-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 22 Feb 2022 05:26:42 +0300
Message-ID: <CAA8EJpq1U6ZdZu42vg0qpMUxJao+s58ZJfcNh_F-4SBH_E=MJg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/disp/dpu1: use atomic enable/disable
 callbacks for encoder functions
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, dianders@chromium.org, sam@ravnborg.org,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, quic_vproddut@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
 seanpaul@chromium.org, thierry.reding@gmail.com, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 at 17:52, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> Use atomic variants for encoder callback functions such that
> certain states like self-refresh can be accessed as part of
> enable/disable sequence.
>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Changes in v2:
> - As per review suggestion by Dmitry.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1e648db..6eac417 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1138,7 +1138,8 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *drm_enc)
>         mutex_unlock(&dpu_enc->enc_lock);
>  }
>
> -static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
> +static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc,
> +                               struct drm_atomic_state *state)
>  {
>         struct dpu_encoder_virt *dpu_enc = NULL;
>         int ret = 0;
> @@ -1176,7 +1177,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
>         mutex_unlock(&dpu_enc->enc_lock);
>  }
>
> -static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
> +static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc,
> +                               struct drm_atomic_state *state)
>  {
>         struct dpu_encoder_virt *dpu_enc = NULL;
>         struct msm_drm_private *priv;
> @@ -2094,8 +2096,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
>
>  static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>         .mode_set = dpu_encoder_virt_mode_set,
> -       .disable = dpu_encoder_virt_disable,
> -       .enable = dpu_encoder_virt_enable,
> +       .atomic_disable = dpu_encoder_virt_disable,
> +       .atomic_enable = dpu_encoder_virt_enable,
>         .atomic_check = dpu_encoder_virt_atomic_check,
>  };
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
