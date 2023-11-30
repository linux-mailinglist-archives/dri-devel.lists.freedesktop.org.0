Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8AE7FE7E5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 04:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D17C10E297;
	Thu, 30 Nov 2023 03:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B56910E297
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 03:57:31 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-daf7ed42ea6so437049276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 19:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701316650; x=1701921450; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NGWm3u9yYVotTkhg+4wnu73eBmCMgIje2MPFVUlA884=;
 b=T2k9N228O8bRgrZcLIk+25ZMF8Wsi8If0yoAuuBgP2qItTnuHU4USw3AP+HqgFHNGQ
 YEZPAeZHk1nsbD0/WiYdOb6LAcy3lEKfW8MnqDK9rjsKpJt05QUziDfP6D4CDnGnnxv8
 +iglo+D/p+J4fddZX7rjN110yoDJLMA6lJcr2jcVu/5lHgZXtipQGY0L6mNJw5YfV+Ic
 9tJbgKpP/k78hVggX2f/TEbcEihnou7J5rSnD1aw6CM1rdoOkhlPDQmVZhqW8uUJTGtA
 iQ+5yUy8eMn1qHOocX6DPSjBivb+3/x1dgf6YhiTZ+8eSZ5VN28bfWHrK2orW5UTp7TU
 SvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701316650; x=1701921450;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NGWm3u9yYVotTkhg+4wnu73eBmCMgIje2MPFVUlA884=;
 b=IjkhLmNtcw1rlhxgDxnhrtIhcVicRIVp1IMqA+ylyzPjhDNpP3LBt8yJUuAvYIFs/B
 HAnCOOteXEFnVpCBeiiv9qmitFXysOlIyC1vAbeIXfw/L78va4kQReDk1XGEHE+nYfJB
 JSJx916lnZJD6S7/p3XnI+b1yoN2BYzifgls4HufVbCe05582Ra9IssotgUsDKU2GGGu
 pZANPsnWPPzxq0sSJMKpuoVnlnHjoWrW9PIQHTZx6bc7yFCUwS3JJ5Pr4cqeVcMpt5T1
 n/IcAKknowLZGIHwGc9z41/80cnV/BBD07jt5JUwXkD5Olys8K2fAmFnW82yT2Dxb/8A
 m4IQ==
X-Gm-Message-State: AOJu0Yw2N7UOsGuSXoJQQeyC8MuZ98HS/9oROBbt5XEA4jToF0PMXIfb
 m4OPrwPLDe/wpdD5R9LknsgAPGsxPA9IL6ompkb8Kg==
X-Google-Smtp-Source: AGHT+IHP8cmKMSRlWXDU40883HCygxSwYOviecR5TtB5mbgCkaXhi1OzQryXhlndiX8Qzrf6Lr/w3YtOT7bwaWCpeLk=
X-Received: by 2002:a25:ab07:0:b0:db5:3cf7:ffe0 with SMTP id
 u7-20020a25ab07000000b00db53cf7ffe0mr192427ybi.45.1701316650319; Wed, 29 Nov
 2023 19:57:30 -0800 (PST)
MIME-Version: 1.0
References: <1701289898-12235-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1701289898-12235-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Nov 2023 05:57:19 +0200
Message-ID: <CAA8EJpqX0AWmLMrNo23cfsnU5q0ySDUkb1XTGwaxGt0eTPkLpg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm/dpu: improve DSC allocation
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

On Wed, 29 Nov 2023 at 22:31, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> A DCE (Display Compression Engine) contains two DSC hard slice encoders.
> Each DCE start with even DSC encoder index followed by an odd DSC encoder
> index. Each encoder can work independently. But Only two DSC encoders from
> same DCE can be paired to work together to support merge mode. In addition,
> the DSC with even index have to mapping to even pingpong index and DSC with
> odd index have to mapping to odd pingpong index at its data path. This patch
> improve DSC allocation mechanism with consideration of above factors.

Is this applicable to old DSC 1.1 encoders?

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 94 +++++++++++++++++++++++++++++-----
>  1 file changed, 82 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f9215643..427d70d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -466,24 +466,94 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>                                struct drm_encoder *enc,
>                                const struct msm_display_topology *top)
>  {
> -       int num_dsc = top->num_dsc;
> -       int i;
> +       int num_dsc = 0;
> +       int i, pp_idx;
> +       bool pair = false;
> +       int dsc_idx[DSC_MAX - DSC_0];
> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> +
> +       if (!top->num_dsc || !top->num_intf)
> +               return 0;
> +
> +       /*
> +        * Truth:
> +        * 1) every layer mixer only connects to one pingpong
> +        * 2) no pingpong split -- two layer mixers shared one pingpong
> +        * 3) each DSC engine contains two dsc encoders
> +        *    -- index(0,1), index (2,3),... etc
> +        * 4) dsc pair can only happens with same DSC engine except 4 dsc
> +        *    merge mode application (8k) which need two DSC engines
> +        * 5) odd pingpong connect to odd dsc
> +        * 6) even pingpong connect even dsc
> +        */
> +
> +       /* num_dsc should be either 1, 2 or 4 */
> +       if (top->num_dsc > top->num_intf)       /* merge mode */
> +               pair = true;
> +
> +       /* fill working copy with pingpong list */
> +       memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, sizeof(pp_to_enc_id));
> +
> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks); i++) {

&& num_dsc < top->num_dsc

> +               if (!rm->dsc_blks[i])   /* end of dsc list */
> +                       break;

I'd say, it's `continue' instead, let's just skip the index.

>
> -       /* check if DSC required are allocated or not */
> -       for (i = 0; i < num_dsc; i++) {
> -               if (!rm->dsc_blks[i]) {
> -                       DPU_ERROR("DSC %d does not exist\n", i);
> -                       return -EIO;
> +               if (global_state->dsc_to_enc_id[i]) {   /* used */
> +                       /* consective dsc index to be paired */
> +                       if (pair && num_dsc) {  /* already start pairing, re start */
> +                               num_dsc = 0;
> +                               /* fill working copy with pingpong list */
> +                               memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id,
> +                                                               sizeof(pp_to_enc_id));
> +                       }
> +                       continue;
>                 }
>
> -               if (global_state->dsc_to_enc_id[i]) {
> -                       DPU_ERROR("DSC %d is already allocated\n", i);
> -                       return -EIO;
> +               /* odd index can not become start of pairing */
> +               if (pair && (i & 0x01) && !num_dsc)
> +                       continue;

After looking at all conditions, can we have two different helpers?
One which allocates a single DSC and another one which allocates a
pair. For the pair you can skip odd indices at all and just check if
DSC_i and DSC_i+1 are free.

> +
> +               /*
> +                * find the pingpong index which had been reserved
> +                * previously at layer mixer allocation
> +                */
> +               for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
> +                       if (pp_to_enc_id[pp_idx] == enc->base.id)
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
> +                * delete pp_idx so that it can not be found at next search
> +                * in the case of pairing
> +                */
> +               pp_to_enc_id[pp_idx] = NULL;
> +
> +               dsc_idx[num_dsc++] = i;
> +               if (num_dsc >= top->num_dsc)
> +                       break;
>         }
>
> -       for (i = 0; i < num_dsc; i++)
> -               global_state->dsc_to_enc_id[i] = enc->base.id;
> +       if (num_dsc < top->num_dsc) {
> +               DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> +                                               num_dsc, top->num_dsc );
> +               return -ENAVAIL;
> +       }
> +
> +       /* reserve dsc */
> +       for (i = 0; i < top->num_dsc; i++) {
> +               int j;
> +
> +               j = dsc_idx[i];
> +               global_state->dsc_to_enc_id[j] = enc->base.id;
> +       }
>
>         return 0;
>  }
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
