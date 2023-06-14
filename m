Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9814872F6D5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 09:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD7C10E41A;
	Wed, 14 Jun 2023 07:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30D810E42B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 07:50:10 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-51878f8e541so1998377a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 00:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686729009; x=1689321009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sru9jI8swiI5mQD6xpMUSIyIvcjQuQVuFa9Dm0VJBKk=;
 b=yOj1QwtZviIzc3neOxEF4d7ffVpV4NbIjsxfbo9yS69Z4mopAHxa8MMV3Rq5s3WA/u
 bh0Dz0saElTq2zBU0FnsybzGqtAmmZFJJGVaPv8DjILx1u73EEFs+GvP+PxjKXHT4VX3
 QKxCTHt8pTEvdRdtiblk8yGXnajBHamOOOFHctL2ow9X7VHh8orN9NW5zqF/7aJ5Ytv6
 XwM0OphMl6gT5w4E2zU9OcKeWH5o5x36NEMSfSjyHWArDIDINEyfqjSnfGP3h+R439x8
 /ogCjl043aK7kSrW63t29sdCXApwhuk2VQv0tADzOLX8fd/FXRsSaSbrQZL2aHxo2lTl
 Z5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686729009; x=1689321009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sru9jI8swiI5mQD6xpMUSIyIvcjQuQVuFa9Dm0VJBKk=;
 b=l/lfgxw0GZwflmSlY4OIzbsYCMgJi5oQ3pOFhbS3aj54CfOvoMakvygG4ybGiu0ZSL
 /Tdcevu3pmUgtR7To/5mg49K4AbwYMgk5iWa2gsJ7LHMTgl2m1ecaabWxLP2jDMvN6RM
 DCdBEXjQEGlu59KbmztF5uqC0AIY9hu8ukxmqGJW7FwyZlaHg488G2H2FKEDZz4zQNyu
 5E90ftxusIPfQNqobkfCXP3OgYVNtaTPiBrOI0MuQzbOCaZhf8RYxSRo9w3EAPz6QAeM
 Cz8sfIiDc5KsebDyFZPIpcwVbHaNjQHQGyiriVuSWe9i3JSK5bqbqnJ7TOodF4tlo9HV
 cIAA==
X-Gm-Message-State: AC+VfDxJNx6VsyoBeSROXZXG3F4owYyzQxtPBKGrT3w4QENo+8KAYIta
 Wba4NO5vaqvfco4SZxwDpLM1aX+HOc5kymAeYRuktw==
X-Google-Smtp-Source: ACHHUZ7KPipBj0TX5KOt2MeLEl+x5dcPbU8f4JfnNXuUM1vyec01U3CUmNXeQiG0oup/RYKMHTBPlKHBprxqns59q08=
X-Received: by 2002:aa7:d691:0:b0:514:9e26:1f51 with SMTP id
 d17-20020aa7d691000000b005149e261f51mr8488936edr.24.1686729008860; Wed, 14
 Jun 2023 00:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 14 Jun 2023 13:19:57 +0530
Message-ID: <CAO_48GHQ7eu37rnPRz4eN2XsBUEznngz04EZcEPFu5w6ujkLGA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu: do not enable
 color-management if DSPPs are not available
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Yongqin Liu <yongqin.liu@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Jun 2023 at 23:55, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> We can not support color management without DSPP blocks being provided
> in the HW catalog. Do not enable color management for CRTCs if num_dspps
> is 0.
>
> Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu=
 driver")
> Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Thanks for your patch, Dmitry. LGTM.

Please feel free to add:
Reviewed-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_crtc.c
> index 6e684a7b49a1..1edf2b6b0a26 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1463,6 +1463,8 @@ static const struct drm_crtc_helper_funcs dpu_crtc_=
helper_funcs =3D {
>  struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane =
*plane,
>                                 struct drm_plane *cursor)
>  {
> +       struct msm_drm_private *priv =3D dev->dev_private;
> +       struct dpu_kms *dpu_kms =3D to_dpu_kms(priv->kms);
>         struct drm_crtc *crtc =3D NULL;
>         struct dpu_crtc *dpu_crtc =3D NULL;
>         int i, ret;
> @@ -1494,7 +1496,8 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *d=
ev, struct drm_plane *plane,
>
>         drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
>
> -       drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> +       if (dpu_kms->catalog->dspp_count)
> +               drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
>
>         /* save user friendly CRTC name for later */
>         snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base=
.id);
> --
> 2.39.2
>


--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
