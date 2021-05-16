Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EAA382563
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 09:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED1B6E8DD;
	Mon, 17 May 2021 07:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41196E471;
 Sun, 16 May 2021 01:21:54 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id h20so1349151plr.4;
 Sat, 15 May 2021 18:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SoLXbgYZkv5FkSbOBiV8Z96V28Oxq+j8zJYbMXZmMqc=;
 b=hN/SsP40Kve4+YaC6v+UM3BsAdoWfzF2EK9+FFS91evn7T9gTIavtbi8+itbSj/TH3
 mQcWwk3qUYsQTY7dU6wyVgk6b517rHM+B8d+fOGXm4+hNkG1l6RFpUOm/AfndPQ1ov48
 TnErTfcMhsxacNL6+8/X+3gGoBG4bZDn0FjHANMnAyZcmXZTblf4STcixI4rtL1RSc1A
 QSLpu5AodvH81M2HsHngW81wOG3eAhk55PTYf3buMPWPPk2me17SsDjWqFKNIgfCVxks
 YcZhna/E2jrIVTUy1vDnRU4EZ0ByaMizDVKSC3U/KjUO91g1ttw4FOTD7T0RyWHGj302
 QP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SoLXbgYZkv5FkSbOBiV8Z96V28Oxq+j8zJYbMXZmMqc=;
 b=qhm+7v5U75MOvI9136ylgi+Pua96fsCdp8hXM4daIRHGr+i+pkgb26DaFEM0KPh2px
 qw+i6aa+qxSTQasNFmKFfadoBC+qdpiuENvzztcF1MsaxlWlXsY1La1e+O+ElMjkhfoT
 ucmx6DCselNrfwXnybbHQs8aw9zc6DQ4FqNPP3jMfGXzqtQC7wn8/SL9tLbkOsV562LY
 gvne3tfF4H1oz5e4feWmOI/i/25fE0EgRqx2DviD2PzSEkktXdMrmJVkWv6CN2AUfjTo
 nfzTHnxkJ1QDGlYlU3HAThEKJebBwTMOsWBpyQ5PBMh72eRrf4AOOrFMeDH1qG8nZqXp
 KCAw==
X-Gm-Message-State: AOAM530Z1o5SfuEIoLP2r5mkbuavM+bSOWQhf7EmWfRVVh8FZDcJ3qHH
 FRQsfdwocrvhzicVEHO2dCZdBkEddSAmSVuBOJg=
X-Google-Smtp-Source: ABdhPJxefDnsWO+LVGNiOiMX/uOXtRC6O8nz0TZcq0ZLx81BswlnwyHgiJCj6DwkzPdHqhCRA77OjRPdybJtCLDVt6Q=
X-Received: by 2002:a17:90b:224e:: with SMTP id
 hk14mr15006501pjb.29.1621128114379; 
 Sat, 15 May 2021 18:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
 <20210515225757.1989955-6-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210515225757.1989955-6-dmitry.baryshkov@linaro.org>
From: Arnaud Vrac <rawoul@gmail.com>
Date: Sun, 16 May 2021 03:21:43 +0200
Message-ID: <CAN5H-g7hWgyqtFbUpzesyKXmWr=FtFtXBKDSbCKx+1dUjxP10w@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 5/6] drm/msm/dpu: drop unused lm_max_width
 from RM
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 17 May 2021 07:32:15 +0000
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Le dim. 16 mai 2021 =C3=A0 00:58, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> a =C3=A9crit :
>
> No code uses lm_max_width from resource manager, so drop it.

I have a pending patch which uses this value to properly determine the
number of LMs to use in the topology. Currently the code uses a
hardcoded value of MAX_HDISPLAY_SPLIT (1080), but in reality I believe
it should be the lm max width (typically 2560). This will avoid using
two LMs to render resolutions like 1280x720 or 1920x1080.

I haven't managed to make hdmi work yet on DPU (testing on MSM8998) so
I'm not ready to send the patch yet, but it doesn't seem to trigger
any error.

-Arnaud


>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  4 ----
>  2 files changed, 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm=
/disp/dpu1/dpu_rm.c
> index c36700a06ff2..ec4387ad1182 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -88,18 +88,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>                         goto fail;
>                 }
>                 rm->mixer_blks[lm->id - LM_0] =3D &hw->base;
> -
> -               if (!rm->lm_max_width) {
> -                       rm->lm_max_width =3D lm->sblk->maxwidth;
> -               } else if (rm->lm_max_width !=3D lm->sblk->maxwidth) {
> -                       /*
> -                        * Don't expect to have hw where lm max widths di=
ffer.
> -                        * If found, take the min.
> -                        */
> -                       DPU_ERROR("unsupported: lm maxwidth differs\n");
> -                       if (rm->lm_max_width > lm->sblk->maxwidth)
> -                               rm->lm_max_width =3D lm->sblk->maxwidth;
> -               }
>         }
>
>         for (i =3D 0; i < cat->ctl_count; i++) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm=
/disp/dpu1/dpu_rm.h
> index ee90b1233430..0c9113581d71 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -17,14 +17,10 @@ struct dpu_global_state;
>   * struct dpu_rm - DPU dynamic hardware resource manager
>   * @mixer_blks: array of layer mixer hardware resources
>   * @ctl_blks: array of ctl hardware resources
> - * @lm_max_width: cached layer mixer maximum width
> - * @rm_lock: resource manager mutex
>   */
>  struct dpu_rm {
>         struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
>         struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
> -
> -       uint32_t lm_max_width;
>  };
>
>  struct dpu_kms;
> --
> 2.30.2
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
