Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67521804348
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 01:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9371610E452;
	Tue,  5 Dec 2023 00:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BFE10E452
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 00:24:00 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5c8c26cf056so56841987b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 16:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701735839; x=1702340639; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v0NP0jfMsyr98tpUvVX6lqxC4v77woduELRRX6RJhZw=;
 b=tH1m+A+6DT1+kUDOG5mIw2PL25dC6JcW9/IyJq2nL6M7TxsQInUUrmE6snwoo5SHAZ
 QCr/rLjdbzVUWTwvwP5+hEKEdPC0lIdq9RoNJFVNV9bTQDZOX7IOZU+Ni6iBNOd/Ty6n
 xFfF8FCst7c5C6LvJegBu29LOIKNsKHt9Pwfe3zHCrW+uHWJh+ybUjjURw3Zt7y+8a1r
 R+5G1TxPwLYC+KSLWfH7towM/O1WuYSyN9U8GhLPO0e4cUEMdjo3IhLCL7xavO93Qna0
 WABCGOxnYd5mrtp0j0ZwDN0TbA3rxiJDrE2pa8EuUNJHo0KpdjGfYaqiMe/RLhQ+SBAt
 t2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701735839; x=1702340639;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v0NP0jfMsyr98tpUvVX6lqxC4v77woduELRRX6RJhZw=;
 b=OD+T6NnWyI7qL0k439mQND7Qtdp9WTKzNOPmkzH/EG1SAPJWnL4ODup9RVxzBHfqLr
 8zNfvevycuYZdbcKHL6N01+d81tJrIWIpNAFIm8yDorkL5ThzMFqADybMfDTCpQs2ldp
 TM2ftGbL7nN3NFZv1kDbRWk9FZpzgtBcD87oi8LwbW2PV/YEfc86q8hzs7NpPWVSuAy2
 McjT2X2VyDb1RkflakHg7uHgiY/4WaUby8fSC2Aaz+4P09PHErN5YQanUvq/0rjKKOCY
 mWGjqrmkAfUnDjfYpYZhfjCX6AiUM41uhERDKXo22KZBW4m33LZQUkFSNIb3hz2OpSlv
 QA+g==
X-Gm-Message-State: AOJu0YzBq6pLCZ2D3qrRE2Q1ZyJo/8cu5nKyQUd1HzYGP7h9qsS5nuAU
 xsi0aW0zA6bW1t0wHYFyEii/D12BNTuNRc08y/TaYw==
X-Google-Smtp-Source: AGHT+IHMXI4RGZ1bAdcEfm7t00uhBMe9TrLZewoiKXhadhBndCCAjZKUf26WKJ3ffJhP/ABnN4I/z8AZJybaG46iWcI=
X-Received: by 2002:a0d:ce01:0:b0:5cd:9f20:966c with SMTP id
 q1-20020a0dce01000000b005cd9f20966cmr3613871ywd.45.1701735839431; Mon, 04 Dec
 2023 16:23:59 -0800 (PST)
MIME-Version: 1.0
References: <1701734134-7816-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1701734134-7816-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Dec 2023 02:23:48 +0200
Message-ID: <CAA8EJprgES1tA1E=17Bnrz8n7mX1COpkx=w-vhWge4ywZ1E0ZQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: improve DSC allocation
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 Dec 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> A DCE (Display Compression Engine) contains two DSC hard slice
> encoders. Each DCE start with even DSC encoder index followed by
> an odd DSC encoder index. Each encoder can work independently.
> But Only two DSC encoders from same DCE can be paired to work
> together to support merge mode. In addition, the DSC with even
> index have to mapping to even pingpong index and DSC with odd
> index have to mapping to odd pingpong index at its data path.
> This patch improve DSC allocation mechanism with consideration
> of above factors.
>
> Changes in V2:
> -- split _dpu_rm_reserve_dsc() into _dpu_rm_reserve_dsc_single() and
>    _dpu_rm_reserve_dsc_pair()

Please don't send the new iteration of the patch if the discussion is ongoing.

Quoting v1 review:

Are the limitations (odd:odd, allocation in pairs, etc) applicable to
v1.1 encoders?

I assume that at least 'allocate two consecutive DSC for DSC merge' is
not applicable, since there are no separate DCE units.

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 171 ++++++++++++++++++++++++++++++---
>  1 file changed, 156 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 17ecf23..dafe1ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -470,33 +470,174 @@ static int _dpu_rm_reserve_ctls(
>         return 0;
>  }
>
> -static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> +static int _dpu_rm_reserve_dsc_single(struct dpu_rm *rm,
>                                struct dpu_global_state *global_state,
> -                              struct drm_encoder *enc,
> +                              uint32_t enc_id,
>                                const struct msm_display_topology *top)
>  {
> -       int num_dsc = top->num_dsc;
> -       int i;
> +       int num_dsc = 0;
> +       int i, pp_idx;
> +       int dsc_idx[DSC_MAX - DSC_0];
> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> +
> +       for (i = 0; i < DSC_MAX - DSC_0; i++)
> +               dsc_idx[i] = 0;
> +
> +       /* fill working copy with pingpong list */
> +       memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, sizeof(pp_to_enc_id));
> +
> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >= top->num_dsc; i++) {
> +               if (!rm->dsc_blks[i])
> +                       continue;
>
> -       /* check if DSC required are allocated or not */
> -       for (i = 0; i < num_dsc; i++) {
> -               if (!rm->dsc_blks[i]) {
> -                       DPU_ERROR("DSC %d does not exist\n", i);
> -                       return -EIO;
> +               if (global_state->dsc_to_enc_id[i])     /* used */
> +                       continue;
> +
> +               /*
> +                * find the pingpong index which had been reserved
> +                * previously at layer mixer allocation
> +                */
> +               for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
> +                       if (pp_to_enc_id[pp_idx] == enc_id)
> +                               break;
>                 }
>
> -               if (global_state->dsc_to_enc_id[i]) {
> -                       DPU_ERROR("DSC %d is already allocated\n", i);
> -                       return -EIO;
> +               /*
> +                * dsc even index must map to pingpong even index
> +                * dsc odd index must map to pingpong odd index
> +                */
> +               if ((i & 0x01) != (pp_idx & 0x01))
> +                       continue;
> +
> +               dsc_idx[num_dsc++] = i + 1;     /* found, start from 1 */
> +       }
> +
> +       if (num_dsc < top->num_dsc) {
> +               DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> +                                               num_dsc, top->num_dsc);
> +               return -ENAVAIL;
> +       }
> +
> +       /* reserve dsc */
> +       for (i = 0; i < top->num_dsc; i++) {
> +               int j;
> +
> +               j = dsc_idx[i];
> +               if (j)
> +                       global_state->dsc_to_enc_id[j-1] = enc_id;
> +       }
> +
> +       return 0;
> +}
> +
> +static int _dpu_rm_reserve_dsc_pair(struct dpu_rm *rm,
> +                              struct dpu_global_state *global_state,
> +                              uint32_t enc_id,
> +                              const struct msm_display_topology *top)
> +{
> +       int num_dsc = 0;
> +       int i, pp_idx;
> +       int dsc_idx[DSC_MAX - DSC_0];
> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> +
> +       for (i = 0; i < DSC_MAX - DSC_0; i++)
> +               dsc_idx[i] = 0;
> +
> +       /* fill working copy with pingpong list */
> +       memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, sizeof(pp_to_enc_id));
> +
> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >= top->num_dsc; i++) {
> +               if (!rm->dsc_blks[i])
> +                       continue;
> +
> +               if (global_state->dsc_to_enc_id[i]) {   /* used */
> +                       /* consective dsc index to be paired */
> +                       if (num_dsc) {  /* already start pairing, re start search */
> +                               num_dsc = 0;
> +                               /* fill working copy with pingpong list */
> +                               memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id,
> +                                                               sizeof(pp_to_enc_id));
> +                       }
> +                       continue;
> +               }
> +
> +               /* odd index can not become start of pairing */
> +               if (i & 0x01 && !num_dsc)
> +                       continue;
> +
> +               /*
> +                * find the pingpong index which had been reserved
> +                * previously at layer mixer allocation
> +                */
> +               for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
> +                       if (pp_to_enc_id[pp_idx] == enc_id)
> +                               break;
>                 }
> +
> +               /*
> +                * dsc even index must map to pingpong even index
> +                * dsc odd index must map to pingpong odd index
> +                */
> +               if ((i & 0x01) != (pp_idx & 0x01))
> +                       continue;
> +
> +               /*
> +                * delete pp_idx so that next pp_idx can be paired with
> +                * next dsc_idx
> +                */
> +               pp_to_enc_id[pp_idx] = 0xffff;
> +
> +               dsc_idx[num_dsc++] = i + 1;     /* found, start from 1 */
>         }
>
> -       for (i = 0; i < num_dsc; i++)
> -               global_state->dsc_to_enc_id[i] = enc->base.id;
> +       if (num_dsc < top->num_dsc) {
> +               DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> +                                               num_dsc, top->num_dsc);
> +               return -ENAVAIL;
> +       }
> +
> +       /* reserve dsc */
> +       for (i = 0; i < top->num_dsc; i++) {
> +               int j;
> +
> +               j = dsc_idx[i];
> +               if (j)
> +                       global_state->dsc_to_enc_id[j-1] = enc_id;
> +       }
>
>         return 0;
>  }
>
> +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> +                              struct dpu_global_state *global_state,
> +                              uint32_t enc_id,
> +                              const struct msm_display_topology *top)
> +{
> +       if (!top->num_dsc || !top->num_intf)
> +               return 0;
> +
> +       /*
> +        * Truth:
> +        * 1) every layer mixer only connects to one pingpong
> +        * 2) no pingpong split -- which is two layer mixers shared one pingpong
> +        * 3) each DSC engine contains two dsc encoders
> +        *    -- index(0,1), index (2,3),... etc

Does this apply to v1.1 encoders?

> +        * 4) dsc pair can only happens with same DSC engine
> +        * 5) odd pingpong connect to odd dsc
> +        * 6) even pingpong connect to even dsc
> +        * 7) pair: encoder +--> pp_idx_0 --> dsc_idx_0
> +                           +--> pp_idx_1 --> dsc_idx_1
> +        */
> +
> +       /* num_dsc should be either 1, 2 or 4 */
> +       if (top->num_dsc > top->num_intf)       /* merge mode */
> +               return _dpu_rm_reserve_dsc_pair(rm, global_state, enc_id, top);
> +       else
> +               return _dpu_rm_reserve_dsc_single(rm, global_state, enc_id, top);
> +}
> +
>  static int _dpu_rm_make_reservation(
>                 struct dpu_rm *rm,
>                 struct dpu_global_state *global_state,
> @@ -518,7 +659,7 @@ static int _dpu_rm_make_reservation(
>                 return ret;
>         }
>
> -       ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
> +       ret  = _dpu_rm_reserve_dsc(rm, global_state, enc->base.id, &reqs->topology);
>         if (ret)
>                 return ret;
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
