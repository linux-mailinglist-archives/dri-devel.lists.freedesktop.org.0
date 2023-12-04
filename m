Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7182803AB6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 17:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B91710E36A;
	Mon,  4 Dec 2023 16:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FAD10E36A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 16:47:28 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5d2d0661a8dso53054897b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 08:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701708448; x=1702313248; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3nepwvvRD/gfBaWMYXy5vN/GJrBOCZb1VaNVzHXVB1s=;
 b=f39nRPtxE8MGh7W07NYyzX9m+p8+8SeASDFCj2vMx0pM8h7GJz5IN82i6SefiAZFyn
 1S+zfYvxieSaJk63Ks/n2/rKtwxnIVRjrv50SaT82EdNvhQnzonabHXiuCnbAsCpGZc9
 Iq3QKRc7EIeOLiGgeGnUE9WJtVMx4pPe9SU9mNZA9retryVsqp6MfIAxBo3rc7v14bt4
 sRyv4a2by/Bpm1aD5J8I3hErVvDIASXbQ28m+SYc1b5vCbaW7UDLBZuoFKeiqgUehfHP
 Zdcsk/y3+4tGEBK9HMM22RjDErREEpavQ2GH7y7lEQdQ4uOKPKzQ6pA9es2TwuL2OU/y
 f/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701708448; x=1702313248;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3nepwvvRD/gfBaWMYXy5vN/GJrBOCZb1VaNVzHXVB1s=;
 b=gC7xTmoP6aLVWVq2393mujh2k/Na2KAQYKjcPoENdEgbk7SPdAS0pQxL2+hUvm0rDE
 jaUUjGYzwObEd0PTmC+CFdxNJ2MSckBCIhGotFb86BJWMKKEZgItZ6mjlFAshIZBc2F4
 WQp7wlx42pqe9vl+NDfoLdNWO4nEAnfiZzA43cZtEtWxlI3etn8r3076KkfJiuuSoBWj
 QY3HwtTfnrlN+eR2we8LxllwX0crRz62xw7ZR5iQucaBNg3i1KaDDqn71KDoW+g6z7g4
 ysGBBVlT13hndsXW8OYWNb52yPoXA070nVQjX66j3N29w/SGTwG1HfU22S9XVTyxCX87
 iorA==
X-Gm-Message-State: AOJu0YwYM2erHHATniJjpwuqR43CMjOZ4KwTPsriYDW3zalkMNISLEAJ
 fEZlH/gVivSigASGIJ8Jqc20dgwj2mkXaq9+VPRpag==
X-Google-Smtp-Source: AGHT+IHcFMkVwwmYMMqki+2Qc6dR02+fv6yJEbd0ifGsqlMUJ9h6kZC+DljYT4ID8A8TJWm7PVUVkQDg4bH96RGd4zo=
X-Received: by 2002:a81:ae0f:0:b0:5d7:1940:b36a with SMTP id
 m15-20020a81ae0f000000b005d71940b36amr3624983ywh.54.1701708448087; Mon, 04
 Dec 2023 08:47:28 -0800 (PST)
MIME-Version: 1.0
References: <1701289898-12235-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqX0AWmLMrNo23cfsnU5q0ySDUkb1XTGwaxGt0eTPkLpg@mail.gmail.com>
 <1086300a-2c8e-f897-a0d7-84d36276a6b6@quicinc.com>
In-Reply-To: <1086300a-2c8e-f897-a0d7-84d36276a6b6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 18:47:17 +0200
Message-ID: <CAA8EJpq_zE5J584smV=Gido9G-spo7hPYZyf-7vr8ki+r9Az9g@mail.gmail.com>
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

On Mon, 4 Dec 2023 at 18:37, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 11/29/2023 7:57 PM, Dmitry Baryshkov wrote:
> > On Wed, 29 Nov 2023 at 22:31, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> A DCE (Display Compression Engine) contains two DSC hard slice encoders.
> >> Each DCE start with even DSC encoder index followed by an odd DSC encoder
> >> index. Each encoder can work independently. But Only two DSC encoders from
> >> same DCE can be paired to work together to support merge mode. In addition,
> >> the DSC with even index have to mapping to even pingpong index and DSC with
> >> odd index have to mapping to odd pingpong index at its data path. This patch
> >> improve DSC allocation mechanism with consideration of above factors.
> > Is this applicable to old DSC 1.1 encoders?
> yes, this algorithm should work with V1 too

Are the limitations (odd:odd, allocation in pairs, etc) applicable to
v1.1 encoders?

I assume that at least 'allocate two consecutive DSC for DSC merge' is
not applicable, since there are no separate DCE units.

> >
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 94 +++++++++++++++++++++++++++++-----
> >>   1 file changed, 82 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> index f9215643..427d70d 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> >> @@ -466,24 +466,94 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> >>                                 struct drm_encoder *enc,
> >>                                 const struct msm_display_topology *top)
> >>   {
> >> -       int num_dsc = top->num_dsc;
> >> -       int i;
> >> +       int num_dsc = 0;
> >> +       int i, pp_idx;
> >> +       bool pair = false;
> >> +       int dsc_idx[DSC_MAX - DSC_0];
> >> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> >> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
> >> +
> >> +       if (!top->num_dsc || !top->num_intf)
> >> +               return 0;
> >> +
> >> +       /*
> >> +        * Truth:
> >> +        * 1) every layer mixer only connects to one pingpong
> >> +        * 2) no pingpong split -- two layer mixers shared one pingpong
> >> +        * 3) each DSC engine contains two dsc encoders
> >> +        *    -- index(0,1), index (2,3),... etc
> >> +        * 4) dsc pair can only happens with same DSC engine except 4 dsc
> >> +        *    merge mode application (8k) which need two DSC engines
> >> +        * 5) odd pingpong connect to odd dsc
> >> +        * 6) even pingpong connect even dsc
> >> +        */
> >> +
> >> +       /* num_dsc should be either 1, 2 or 4 */
> >> +       if (top->num_dsc > top->num_intf)       /* merge mode */
> >> +               pair = true;
> >> +
> >> +       /* fill working copy with pingpong list */
> >> +       memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, sizeof(pp_to_enc_id));
> >> +
> >> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks); i++) {
> > && num_dsc < top->num_dsc
> >
> >> +               if (!rm->dsc_blks[i])   /* end of dsc list */
> >> +                       break;
> > I'd say, it's `continue' instead, let's just skip the index.
> >
> >> -       /* check if DSC required are allocated or not */
> >> -       for (i = 0; i < num_dsc; i++) {
> >> -               if (!rm->dsc_blks[i]) {
> >> -                       DPU_ERROR("DSC %d does not exist\n", i);
> >> -                       return -EIO;
> >> +               if (global_state->dsc_to_enc_id[i]) {   /* used */
> >> +                       /* consective dsc index to be paired */
> >> +                       if (pair && num_dsc) {  /* already start pairing, re start */
> >> +                               num_dsc = 0;
> >> +                               /* fill working copy with pingpong list */
> >> +                               memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id,
> >> +                                                               sizeof(pp_to_enc_id));
> >> +                       }
> >> +                       continue;
> >>                  }
> >>
> >> -               if (global_state->dsc_to_enc_id[i]) {
> >> -                       DPU_ERROR("DSC %d is already allocated\n", i);
> >> -                       return -EIO;
> >> +               /* odd index can not become start of pairing */
> >> +               if (pair && (i & 0x01) && !num_dsc)
> >> +                       continue;
> > After looking at all conditions, can we have two different helpers?
> > One which allocates a single DSC and another one which allocates a
> > pair. For the pair you can skip odd indices at all and just check if
> > DSC_i and DSC_i+1 are free.
> >
> >> +
> >> +               /*
> >> +                * find the pingpong index which had been reserved
> >> +                * previously at layer mixer allocation
> >> +                */
> >> +               for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
> >> +                       if (pp_to_enc_id[pp_idx] == enc->base.id)
> >> +                               break;
> >>                  }
> >> +
> >> +               /*
> >> +                * dsc even index must map to pingpong even index
> >> +                * dsc odd index must map to pingpong odd index
> >> +                */
> >> +               if ((i & 0x01) != (pp_idx & 0x01))
> >> +                       continue;
> >> +
> >> +               /*
> >> +                * delete pp_idx so that it can not be found at next search
> >> +                * in the case of pairing
> >> +                */
> >> +               pp_to_enc_id[pp_idx] = NULL;
> >> +
> >> +               dsc_idx[num_dsc++] = i;
> >> +               if (num_dsc >= top->num_dsc)
> >> +                       break;
> >>          }
> >>
> >> -       for (i = 0; i < num_dsc; i++)
> >> -               global_state->dsc_to_enc_id[i] = enc->base.id;
> >> +       if (num_dsc < top->num_dsc) {
> >> +               DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> >> +                                               num_dsc, top->num_dsc );
> >> +               return -ENAVAIL;
> >> +       }
> >> +
> >> +       /* reserve dsc */
> >> +       for (i = 0; i < top->num_dsc; i++) {
> >> +               int j;
> >> +
> >> +               j = dsc_idx[i];
> >> +               global_state->dsc_to_enc_id[j] = enc->base.id;
> >> +       }
> >>
> >>          return 0;
> >>   }
> >> --
> >> 2.7.4
> >>
> >



-- 
With best wishes
Dmitry
