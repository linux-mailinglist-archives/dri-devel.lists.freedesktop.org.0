Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF20580A243
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 12:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3821C10EA6F;
	Fri,  8 Dec 2023 11:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D09E10EA6F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 11:33:21 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5c08c47c055so18672667b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702035200; x=1702640000; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/JU0Aix+3eTJLA5VTicLCCippJlTJve3gMl1qQImHXo=;
 b=fAlW5u47OSIycnAp25OMnkwrCpzL/F1j2jw5Yz6VbEfjUFueC+ocKzwUqpE/c5GJcw
 LiiQRcaa10p2UEmIsQvzQnEEN04KLUH+PTHukkicCMMrSiCY9gE/ok/34aLS28wKKacx
 ZUaGXCwZ2cajP4eKoLyw4yL5g3Ahq4SuDNn8+yUEJKngnj6G7eJ3sRhjrIZphOF+5hqw
 xUz3kw0mha3jdJHZ+wteGe7zl4SgxTdD8IFsP8Lo90Ucglmk38/AwCwj6FjTNTJWw/9f
 p+MDG/B1QZvtW05zD2CdaHDjWIow32etVjEilW9cUY2TSkPAugTpfVTPxeM3h5P35e7v
 QD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702035200; x=1702640000;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/JU0Aix+3eTJLA5VTicLCCippJlTJve3gMl1qQImHXo=;
 b=Iv1HLnWMfp2oq94LdLDs9FeDQNNShzMR5pkYleR0kTOcId8Is//6+M4I5G/zSnh0wk
 eqViarHMnOoJbuPsk06a/GSjfo8s/Pngj6Y14I/3WzqpWcTdmiKe5TWqfa8cO1A3X8oI
 4fioKEiNmdamVeF4keJ6JHc4siCaaXA8LfeS+ZmdOCyq9Sv1pjVMBxkr+FXVR9oMphgD
 S/1DKXLExfGVQDjlXFFLaUuJSQvG2fuRhuY2cgMt38JTx9TD2uq3ebbyH3TOD7sp5wtX
 d0dCj7vs4AsGwAnlTedMY2mQtLjySRJykCy0lYlv8CDi37L82xVNHl6dOmTmyMYAWlTQ
 kzSQ==
X-Gm-Message-State: AOJu0YzdBMg4129tc/zxdcH9PewpTB29wBLCydmpbfIzu+SQTVkObUMq
 hZ9S34dL05AJp5FI/S6Ib/zx4WAiW8B6Lqlv5QaEqw==
X-Google-Smtp-Source: AGHT+IG926dy16YwagP5QBNbXqNoptmJLvVLG6OqY9cTBrpxcxKQB+Y9cblTj14KWw6m6Na1tgvvMZHS3Hl9xYt898U=
X-Received: by 2002:a81:a605:0:b0:5d7:1940:53e1 with SMTP id
 i5-20020a81a605000000b005d7194053e1mr3952459ywa.89.1702035200621; Fri, 08 Dec
 2023 03:33:20 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-10-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-10-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:33:09 +0200
Message-ID: <CAA8EJpp0v0_0BRguZOskbtv69-OZ32uMtdnb7i4xLyhz=UR8og@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] drm/msm/dpu: add support to allocate CDM from RM
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Even though there is usually only one CDM block, it can be
> used by either HDMI, DisplayPort OR Writeback interfaces.
>
> Hence its allocation needs to be tracked properly by the
> resource manager to ensure appropriate availability of the
> block.
>
> changes in v2:
>         - move needs_cdm to topology struct
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 38 +++++++++++++++++++--
>  drivers/gpu/drm/msm/msm_drv.h               |  2 ++
>  4 files changed, 40 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 9db4cf61bd29..5df545904057 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -98,6 +98,7 @@ enum dpu_hw_blk_type {
>         DPU_HW_BLK_DSPP,
>         DPU_HW_BLK_MERGE_3D,
>         DPU_HW_BLK_DSC,
> +       DPU_HW_BLK_CDM,
>         DPU_HW_BLK_MAX,
>  };
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index df6271017b80..a0cd36e45a01 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -135,6 +135,7 @@ struct dpu_global_state {
>         uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
>         uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
>         uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
> +       uint32_t cdm_to_enc_id;
>  };
>
>  struct dpu_global_state
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 7ed476b96304..b58a9c2ae326 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -435,6 +435,26 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>         return 0;
>  }
>
> +static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
> +                              struct dpu_global_state *global_state,
> +                              struct drm_encoder *enc)
> +{
> +       /* try allocating only one CDM block */
> +       if (!rm->cdm_blk) {
> +               DPU_ERROR("CDM block does not exist\n");

Nit: maybe this should be an info or a warning instead?

> +               return -EIO;
> +       }
> +
> +       if (global_state->cdm_to_enc_id) {
> +               DPU_ERROR("CDM_0 is already allocated\n");
> +               return -EIO;
> +       }
> +
> +       global_state->cdm_to_enc_id = enc->base.id;
> +
> +       return 0;
> +}
> +
>  static int _dpu_rm_make_reservation(
>                 struct dpu_rm *rm,
>                 struct dpu_global_state *global_state,
> @@ -460,6 +480,14 @@ static int _dpu_rm_make_reservation(
>         if (ret)
>                 return ret;
>
> +       if (reqs->topology.needs_cdm) {
> +               ret = _dpu_rm_reserve_cdm(rm, global_state, enc);
> +               if (ret) {
> +                       DPU_ERROR("unable to find CDM blk\n");
> +                       return ret;
> +               }
> +       }
> +
>         return ret;
>  }
>
> @@ -470,9 +498,9 @@ static int _dpu_rm_populate_requirements(
>  {
>         reqs->topology = req_topology;
>
> -       DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
> +       DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d cdm: %d\n",
>                       reqs->topology.num_lm, reqs->topology.num_dsc,
> -                     reqs->topology.num_intf);
> +                     reqs->topology.num_intf, reqs->topology.needs_cdm);
>
>         return 0;
>  }
> @@ -501,6 +529,7 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>                 ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
>         _dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
>                 ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
> +       _dpu_rm_clear_mapping(&global_state->cdm_to_enc_id, 1, enc->base.id);
>  }
>
>  int dpu_rm_reserve(
> @@ -574,6 +603,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>                 hw_to_enc_id = global_state->dsc_to_enc_id;
>                 max_blks = ARRAY_SIZE(rm->dsc_blks);
>                 break;
> +       case DPU_HW_BLK_CDM:
> +               hw_blks = &rm->cdm_blk;
> +               hw_to_enc_id = &global_state->cdm_to_enc_id;
> +               max_blks = 1;
> +               break;
>         default:
>                 DPU_ERROR("blk type %d not managed by rm\n", type);
>                 return 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index a205127ccc93..1ebad634781c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -92,12 +92,14 @@ enum msm_event_wait {
>   * @num_intf:     number of interfaces the panel is mounted on
>   * @num_dspp:     number of dspp blocks used
>   * @num_dsc:      number of Display Stream Compression (DSC) blocks used
> + * @needs_cdm:    indicates whether cdm block is needed for this display topology
>   */
>  struct msm_display_topology {
>         u32 num_lm;
>         u32 num_intf;
>         u32 num_dspp;
>         u32 num_dsc;
> +       bool needs_cdm;
>  };
>
>  /* Commit/Event thread specific structure */
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
