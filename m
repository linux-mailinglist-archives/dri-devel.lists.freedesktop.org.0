Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAF281228B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 00:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAAA10E160;
	Wed, 13 Dec 2023 23:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C346110E160
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 23:00:37 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5e2eccf46ddso367147b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702508437; x=1703113237; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Cq6zR+jlHYAnapBNzjrKg2iVCLy0eSamSPNu3gL1qJE=;
 b=vyU9gwfQg1e2DwMHMpPzUmknVeoPLIopxER7NBxUT40+Z/69sMqaX4L/51BPcORcDd
 EjWOYbn5cRCwf6rl08Qe1W2TXBqr16kmk8hUHufIKZhp+t5e+UF7cBquaj0oGzzMqlGb
 dSeFleQb+7/rPFIrQ7FTHfXhSDGmHiz50I9IpTZtaGJFH32qTF3KcQJ/wkN3ksSv37D4
 XKG2vF93i+WMFJRRhPE6zMZPzAc3whqjrZ0WnojnoHBchowZi7VVK0tbn8SIjfTy+tkr
 +50LysN9ceoKnlpYMMhYjN8nyBFOiKXhn29c/5TW8eBuxXUbn6MtsrOI2/9xj806Rwit
 RCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702508437; x=1703113237;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cq6zR+jlHYAnapBNzjrKg2iVCLy0eSamSPNu3gL1qJE=;
 b=m6Hg1jnb6bDQfegCuJYzZsd8gjrdBIVLnYK0/vLQK2cXYFwNAN0LR0xZcoyO/vymfJ
 I2R92VjVN1dW5/rnXfKylDzXatAAajmQioa0GANV/yLQv25GgVnegmry4z2FI+Terl3m
 eAXATQhUAqUMwjLkKbNJTc9m09AMJtO1b98NBxbZMcWkSTIOUXoAEQO7Wovn3qpfSJHk
 aEjTkgrIF38MIFdWptTz+5iqwL0Nuw0pQn9DAYwkQ2j+DhKsdAXTDjOLkpqEJgzG9/ih
 eXYmd1NTr/aRvHD5YwnvjssgCqPwGu9rwI1TRLs/Jhz4+Re9HaVyt1VqWA5UPfeyKD+E
 h8KQ==
X-Gm-Message-State: AOJu0YxLDnJJxTdO+7EL8+LYyKPgxseBGV8docMKxzBERcKyiz2ffqUo
 vVcnVZSUM2Cn8L+hTXjB7rIfZlMfJYbU9gSAI224MmQKfGavoJxt2fc8uA==
X-Google-Smtp-Source: AGHT+IH7OxM8zsbMLlw3Tz7w8NQR+EpCvwFYDla0owejlgj1j7yMt2CoyVOacpI3RwEFByDKtK4hYopmrGFt8D1noPQ=
X-Received: by 2002:a0d:ffc7:0:b0:5e1:84d7:174d with SMTP id
 p190-20020a0dffc7000000b005e184d7174dmr3603843ywf.50.1702508436837; Wed, 13
 Dec 2023 15:00:36 -0800 (PST)
MIME-Version: 1.0
References: <1702493883-30148-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1702493883-30148-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 01:00:25 +0200
Message-ID: <CAA8EJppypE-0tUfVD-24YMOQ+3cP+_D1BZYju0K7qzaUE_RnKA@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dpu: improve DSC allocation
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

On Wed, 13 Dec 2023 at 20:58, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> At DSC V1.1 DCE (Display Compression Engine) contains a DSC encoder.
> However, at DSC V1.2 DCE consists of two DSC encoders, one has an odd
> index and another one has an even index. Each encoder can work
> independently. But only two DSC encoders from same DCE can be paired
> to work together to support DSC merge mode at DSC V1.2. For DSC V1.1
> two consecutive DSC encoders (start with even index) have to be paired
> to support DSC merge mode.  In addition, the DSC with even index have
> to be mapped to even PINGPONG index and DSC with odd index have to be
> mapped to odd PINGPONG index at its data path in regardless of DSC
> V1.1 or V1.2. This patch improves DSC allocation mechanism with
> consideration of those factors.
>
> Changes in V5:
> -- delete dsc_id[]
> -- update to global_state->dsc_to_enc_id[] directly
> -- replace ndx with idx
> -- fix indentation at function declaration
> -- only one for loop at _dpu_rm_reserve_dsc_single()
>
> Changes in V4:
> -- rework commit message
> -- use reserved_by_other()
> -- add _dpu_rm_pingpong_next_index()
> -- revise _dpu_rm_pingpong_dsc_check()
>
> Changes in V3:
> -- add dpu_rm_pingpong_dsc_check()
> -- for pair allocation use i += 2 at for loop
>
> Changes in V2:
>     -- split _dpu_rm_reserve_dsc() into _dpu_rm_reserve_dsc_single() and
>        _dpu_rm_reserve_dsc_pair()
>
> Fixes: f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in RM")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 162 +++++++++++++++++++++++++++++----
>  1 file changed, 146 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f9215643..7c7a88f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -461,29 +461,159 @@ static int _dpu_rm_reserve_ctls(
>         return 0;
>  }
>
> -static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> -                              struct dpu_global_state *global_state,
> -                              struct drm_encoder *enc,
> -                              const struct msm_display_topology *top)
> +static int _dpu_rm_pingpong_next_index(int start,
> +                                      uint32_t enc_id,
> +                                      uint32_t *pp_to_enc_id,
> +                                      int pp_max)
>  {
> -       int num_dsc = top->num_dsc;
>         int i;
>
> -       /* check if DSC required are allocated or not */
> -       for (i = 0; i < num_dsc; i++) {
> -               if (!rm->dsc_blks[i]) {
> -                       DPU_ERROR("DSC %d does not exist\n", i);
> -                       return -EIO;
> -               }
> +       for (i = start; i < pp_max; i++) {
> +               if (pp_to_enc_id[i] == enc_id)
> +                       return i;
> +       }
> +
> +       return -ENAVAIL;
> +}
> +
> +static int _dpu_rm_pingpong_dsc_check(int dsc_idx, int pp_idx)
> +{
> +

CHECK: Blank lines aren't necessary after an open brace '{'
#85: FILE: drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:481:

> +       /*
> +        * DSC with even index must be used with the PINGPONG with even index
> +        * DSC with odd index must be used with the PINGPONG with odd index
> +        */
> +       if ((dsc_idx & 0x01) != (pp_idx & 0x01))
> +               return -ENAVAIL;
> +
> +       return 0;
> +}
> +
> +static int _dpu_rm_reserve_dsc_single(struct dpu_rm *rm,
> +                                     struct dpu_global_state *global_state,
> +                                     uint32_t enc_id,
> +                                     const struct msm_display_topology *top)
> +{
> +       int num_dsc = 0;
> +       uint32_t *pp_to_enc_id = global_state->pingpong_to_enc_id;
> +       uint32_t *dsc_enc_id = global_state->dsc_to_enc_id;
> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> +       int pp_idx;
> +       int dsc_idx;
> +       int ret;
> +
> +       for (dsc_idx = 0; dsc_idx < ARRAY_SIZE(rm->dsc_blks) &&
> +                         num_dsc < 1; dsc_idx++) {

The condition is wrong here. Also it is misaligned.

> +               if (!rm->dsc_blks[dsc_idx])
> +                       continue;
> +
> +               if (reserved_by_other(dsc_enc_id, dsc_idx, enc_id))
> +                       continue;
> +
> +               pp_idx = _dpu_rm_pingpong_next_index(0, enc_id,

And this is wrong too. You should start relatively to your previous PP index.

> +                                                    pp_to_enc_id, pp_max);
> +               if (pp_idx < 0)
> +                       return -ENAVAIL;
> +
> +               ret = _dpu_rm_pingpong_dsc_check(dsc_idx, pp_idx);
> +               if (ret)
> +                       return -ENAVAIL;
> +
> +               dsc_enc_id[dsc_idx] = enc_id;
> +               num_dsc++;
> +       }
> +
> +       if (!num_dsc) {
> +               DPU_ERROR("DSC allocation failed num_dsc=%d\n", num_dsc);
> +               return -ENAVAIL;
> +       }
>
> -               if (global_state->dsc_to_enc_id[i]) {
> -                       DPU_ERROR("DSC %d is already allocated\n", i);
> -                       return -EIO;
> +       return 0;
> +}
> +
> +static int _dpu_rm_reserve_dsc_pair(struct dpu_rm *rm,
> +                                   struct dpu_global_state *global_state,
> +                                   uint32_t enc_id,
> +                                   const struct msm_display_topology *top)
> +{
> +       int num_dsc = 0;
> +       uint32_t *pp_to_enc_id = global_state->pingpong_to_enc_id;
> +       uint32_t *dsc_enc_id = global_state->dsc_to_enc_id;

No need for these anymore. Please inline them. Or simply pass
global_state to _dpu_rm_pingpong_next_index().
Other functions in dpu_rm.c don't define local variables for these
arrays. I don't see why this patch should deviate from that.

> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> +       int start_pp_idx = 0;
> +       int dsc_idx, pp_idx;
> +       int ret;
> +
> +       /* only start from even dsc index */
> +       for (dsc_idx = 0; dsc_idx < ARRAY_SIZE(rm->dsc_blks) &&
> +                         num_dsc < top->num_dsc; dsc_idx += 2) {

Misaligned

> +               if (!rm->dsc_blks[dsc_idx] ||
> +                   !rm->dsc_blks[dsc_idx + 1])
> +                       continue;
> +
> +               /* consective dsc index to be paired */
> +               if (reserved_by_other(dsc_enc_id, dsc_idx, enc_id) ||
> +                   reserved_by_other(dsc_enc_id, dsc_idx + 1, enc_id))
> +                       continue;
> +
> +               pp_idx = _dpu_rm_pingpong_next_index(start_pp_idx, enc_id,
> +                                                    pp_to_enc_id, pp_max);
> +               if (pp_idx < 0)
> +                       return -ENAVAIL;
> +
> +               ret = _dpu_rm_pingpong_dsc_check(dsc_idx, pp_idx);
> +               if (ret) {
> +                       pp_idx = 0;
> +                       continue;
>                 }
> +
> +               pp_idx = _dpu_rm_pingpong_next_index(pp_idx + 1, enc_id,
> +                                                    pp_to_enc_id, pp_max);
> +               if (pp_idx < 0)
> +                       return -ENAVAIL;

Fresh pp_idx has to be checked against dsc_idx + 1.

Let me also have a suggestion for you. The pp_max is a constant. You
don't have to pass it to _dpu_rm_pingpong_next_index() at all! Also if
you change the function to accept enum dpu_pingpong, you can start
with PINGPONG_NONE and move +1 into the function, making the callers
simpler, removing the need or start_pp_idx (which I asked to do in v4)
etc.

> +
> +               dsc_enc_id[dsc_idx] = enc_id;
> +               dsc_enc_id[dsc_idx + 1] = enc_id;
> +               num_dsc += 2;
> +
> +               start_pp_idx = pp_idx + 1;      /* start for next pair */
>         }
>
> -       for (i = 0; i < num_dsc; i++)
> -               global_state->dsc_to_enc_id[i] = enc->base.id;
> +       if (num_dsc < top->num_dsc) {
> +               DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> +                                               num_dsc, top->num_dsc);

Misaligned

> +               return -ENAVAIL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> +                              struct dpu_global_state *global_state,
> +                              struct drm_encoder *enc,
> +                              const struct msm_display_topology *top)
> +{
> +       uint32_t enc_id = enc->base.id;
> +
> +       if (!top->num_dsc || !top->num_intf)
> +               return 0;
> +
> +       /*
> +        * Facts:
> +        * 1) DSCs ouput to an interface

WARNING: 'ouput' may be misspelled - perhaps 'output'?

Also, what does it bring to us?

> +        * 2) no pingpong split (two layer mixers shared one pingpong)
> +        * 3) DSC pair start from even index, such as index(0,1), (2,3), etc

starts

> +        * 4) even PINGPONG connects to even DSC
> +        * 5) odd PINGPONG connects to odd DSC
> +        * 6) pair: encoder +--> pp_idx_0 --> dsc_idx_0
> +        *                  +--> pp_idx_1 --> dsc_idx_1
> +        */
> +
> +       /* num_dsc should be either 1, 2 or 4 */
> +       if (top->num_dsc > top->num_intf)       /* merge mode */
> +               return _dpu_rm_reserve_dsc_pair(rm, global_state, enc_id, top);
> +       else
> +               return _dpu_rm_reserve_dsc_single(rm, global_state, enc_id, top);
>
>         return 0;
>  }
> --
> 2.7.4
>

Kuogee, we value your patches. But could you please fix your editor
settings to properly align C statements? E.g. Vim has the "set
cino=(0" setting, which does most of the work. I suspect that your
code editor should also have a similar setting. Also could you please
establish a practice of using checkpatch.pl at least until we stop
hitting obvious issues there?

-- 
With best wishes
Dmitry
