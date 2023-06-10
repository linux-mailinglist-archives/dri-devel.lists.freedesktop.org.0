Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE5B72AAE4
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 12:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0100510E17F;
	Sat, 10 Jun 2023 10:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847D410E17F
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 10:27:11 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-56974f42224so24796747b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 03:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686392829; x=1688984829;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=to8oZ7L4fC+T49c7O2RXAbP8nJvmZRdwodJiT0ePUgs=;
 b=VtfoIIBi2gjH8mp/MVxkQnvYC58lGIrKyL1oN9HdMV2QIktHsfiMb7nG1eK+hsPfAn
 c96AHXJCFWm4BYoTbUUw+s0mrnbCF0m4V1D4E1TAAUEdHPVBdztK+sR/B53Aeu3DA2WF
 bR5lRfV0MrgBcPEMC3yfPypP3eQswXm2ZNAfBVQg/Recb+MgBGw8THISDUfL3IROQF/h
 zi6pMuJO66v17QGaf9n6xOa6kIb5OkjVHwJODl23BlrrbGcSedvUm8WyAatcB5Qvfsp1
 DiGywfyCvuey04+bMIQJZYw3HaIpFrJmLVUafIO6QhGwZUv50Relfvjfkbo0XLyywpbY
 9CdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686392829; x=1688984829;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=to8oZ7L4fC+T49c7O2RXAbP8nJvmZRdwodJiT0ePUgs=;
 b=YVIYYiahWpDTTEythWG8X+yLPeNoy4fzqpzMbukjBJ1JU2AA0fotRBaSNDia3FreVW
 lO54ENaO0lw6MrvI2LopVxu48sLVsdEhM3WSg40HS3sdNotOi2vlf7MBZfU00wjPYaYH
 DQeqAhxN16ANLoMu+Zr4DBDCctB7qEZQMoakZXPYM8h64DTFs7CWX+pS+4d3VKKIsSbf
 E5Rj8ryXn0d8NaSHUjfsw/VUPBnu6W3kov41W2iZWBxmYFCT1swaXaA2KExTHtDMzXaG
 62N75DP/uI77p4xN19MjWHudW7YspyO9LW+0NW7tliuo9pca8WCJ1EHytj2Vg+yZy5n7
 j4bA==
X-Gm-Message-State: AC+VfDzftZfEGA0B0Nn22zmRpAiLDqZXvIM9OXayP/A36Wx9vGX9/sXm
 bhURBwSbrQXnCuyniQ81C2YfxTUimOHVcwQTAZWMZw==
X-Google-Smtp-Source: ACHHUZ6OSKyE7M/AKX5RnhMGNLiUXry/Ecu8iTy734i4jNpdrWoupgCkvkkVY50NCYi04PH1Fm8GCv9SFC9Tcqs5ltM=
X-Received: by 2002:a81:8841:0:b0:565:9a3d:a3f9 with SMTP id
 y62-20020a818841000000b005659a3da3f9mr3920231ywf.9.1686392829544; Sat, 10 Jun
 2023 03:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
 <1676286704-818-3-git-send-email-quic_kalyant@quicinc.com>
 <20230301082403.vm4ejqod3ba5wkzp@SoMainline.org>
In-Reply-To: <20230301082403.vm4ejqod3ba5wkzp@SoMainline.org>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Sat, 10 Jun 2023 18:26:58 +0800
Message-ID: <CAMSo37VmhB1-PUp1qu8gaxOXtu98eEYmWd71FOai+cwLb-JvSg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/msm/dpu: add DSPPs into reservation upon a CTM
 request
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 Amit Pundir <amit.pundir@linaro.org>, John Stultz <jstultz@google.com>,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Kalyan Thota

It seems this change caused some drm problems with the Android build.
I tested with one Android build that based on the ACK android-mainline
kernel[1], and there are the message printed like
    01-01 06:51:50.541   504   504 E         :
[drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]failed to get
dspp on lm 0
    01-01 06:51:50.551   504   504 E         :
[drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]failed to get
dspp on lm 0
    01-01 06:51:50.560   504   504 E         :
[drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]failed to get
dspp on lm 0
    01-01 06:51:50.570   504   504 E         :
[drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]failed to get
dspp on lm 0
    01-01 06:51:50.579   504   504 E         :
[drm:_dpu_rm_make_reservation] [dpu error]unable to find appropriate
mixers
    01-01 06:51:50.588   504   504 E         : [drm:dpu_rm_reserve]
[dpu error]failed to reserve hw resources: -119
For details, please check the link here: https://termbin.com/31lc

If I revert this commit, then the problem will be gone.
Could you please help check if there is any problem with this commit?

[1]: https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline

Thanks,
Yongqin Liu

On Wed, 1 Mar 2023 at 16:24, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-02-13 03:11:42, Kalyan Thota wrote:
> > Add DSPP blocks into the topology for reservation, if there
> > is a CTM request for that composition.
> >
> > Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>
> > ---
> > Changes in v1:
> > - Minor nits (Dmitry)
> >
> > Changes in v2:
> > - Populate DSPPs into the reservation only if CTM is requested (Dmitry)
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 ++++++---------
> >  1 file changed, 6 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 9c6817b..46d2a5c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -545,7 +545,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
> >  static struct msm_display_topology dpu_encoder_get_topology(
> >                       struct dpu_encoder_virt *dpu_enc,
> >                       struct dpu_kms *dpu_kms,
> > -                     struct drm_display_mode *mode)
> > +                     struct drm_display_mode *mode,
> > +                     struct drm_crtc_state *crtc_state)
> >  {
> >       struct msm_display_topology topology = {0};
> >       int i, intf_count = 0;
> > @@ -563,8 +564,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
> >        * 1 LM, 1 INTF
> >        * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> >        *
> > -      * Adding color blocks only to primary interface if available in
> > -      * sufficient number
> > +      * Add dspps to the reservation requirements if ctm is requested
> >        */
> >       if (intf_count == 2)
> >               topology.num_lm = 2;
> > @@ -573,11 +573,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
> >       else
> >               topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> >
> > -     if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> > -             if (dpu_kms->catalog->dspp &&
> > -                     (dpu_kms->catalog->dspp_count >= topology.num_lm))
> > -                     topology.num_dspp = topology.num_lm;
> > -     }
> > +     if (crtc_state->ctm)
> > +             topology.num_dspp = topology.num_lm;
> >
> >       topology.num_enc = 0;
> >       topology.num_intf = intf_count;
> > @@ -643,7 +640,7 @@ static int dpu_encoder_virt_atomic_check(
> >               }
> >       }
> >
> > -     topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
> > +     topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
> >
> >       /* Reserve dynamic resources now. */
> >       if (!ret) {
> > --
> > 2.7.4
> >



-- 
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
