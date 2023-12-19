Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 236FB81939D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B477A10E1E8;
	Tue, 19 Dec 2023 22:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E7C10E1E8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:32:13 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5e745891a69so17932397b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 14:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703025132; x=1703629932; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7kzqVHsGetymNboFDCWrRPYQux0ZuU7Q/V2bhhYriNA=;
 b=POgpypVwxV9UezPVp9U9wgufg/sCtz64/VcHUzbiI7iOZqHPLc8+SgIo5KWsrguX1P
 XQd/MYIzEM5tI54xzddZ0dLCml54Uc2B/Lvm35qqb/9f6s2OEmhXfI3kJQJ15uEo9PZ7
 wCSDbesIkhSLAZjmcWoMCszr7hyy7Ap7/8vyDG+HH4o/a4E7HDm+6W+OpwOU9LavsNiC
 xVmH04BgOsQoSIty9/ifrOYLRDATV13lxYFYYv8mktW95MOulfqPHyF50AouslAYbEGg
 tdEhpeUQZImKJRXiGBd5l0//YbIzME7jkclPxTVXKeQvbA6Tf5rk8Ps97VuCoulyvpwx
 HcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703025132; x=1703629932;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7kzqVHsGetymNboFDCWrRPYQux0ZuU7Q/V2bhhYriNA=;
 b=GQ9Y4FJEMRwn2pj7f0c6UfDqZb4oRgwXFEY/8C30hKBL8jo0SKQB2PukMln8lQpLha
 jduqfl/Lirnjj+o1V+WDyRE0/uwqH9ZNaxER1R4oz1r7aX5yCTtXdB7JB82IpJINPDbO
 MYICornnx6OM2lzP22chMWWrh1b/Gvdhk9lgyYeedNhzBQslxK1l1HL3PnYHopxPtErf
 dZB5StsgZkB3lJoOEuLHHLhljYHLxCEEeYNmAxf+gwWTj0tZg0yF7addvtLCtvxPylKy
 NBOboEmIjbZ60Wli37cV4iEpou5wSr3JldlHM7C82YFU3WuIh0QFv2xTqxpsbN7nQx3W
 6aFw==
X-Gm-Message-State: AOJu0Yx1hpYLC8xa+JdcdDj+MROrs4Ww+5ngcuUkBf7HHbVGYObShTET
 T/TXU08J1y9rNYioGcHns7htdpygd4l0Lb4IwdIJ7g==
X-Google-Smtp-Source: AGHT+IH56xPDVpC/j81TPbRwvDDod+54PsYV0BD/YyJAYnNlpSdZFFYGqSlSDE/9OzgRCTmGob2qJJe2fPNJUOMKsl4=
X-Received: by 2002:a81:91c6:0:b0:5e7:5cd8:92b2 with SMTP id
 i189-20020a8191c6000000b005e75cd892b2mr2359027ywg.69.1703025132610; Tue, 19
 Dec 2023 14:32:12 -0800 (PST)
MIME-Version: 1.0
References: <1702580172-30606-1-git-send-email-quic_khsieh@quicinc.com>
 <a5ec8760-cdfe-b420-43c1-913b0095ba93@quicinc.com>
In-Reply-To: <a5ec8760-cdfe-b420-43c1-913b0095ba93@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 20 Dec 2023 00:32:01 +0200
Message-ID: <CAA8EJpoBiiTbc91E8hSK0seBOXAW++8V8yJzbGmCJJcXbZ3raQ@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dpu: improve DSC allocation
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
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Dec 2023 at 18:18, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Hi Dmitry,
>
> Anymore comments from you?

No, for some reason I missed this patch. Please excuse me.

> On 12/14/2023 10:56 AM, Kuogee Hsieh wrote:
> > At DSC V1.1 DCE (Display Compression Engine) contains a DSC encoder.
> > However, at DSC V1.2 DCE consists of two DSC encoders, one has an odd
> > index and another one has an even index. Each encoder can work
> > independently. But only two DSC encoders from same DCE can be paired
> > to work together to support DSC merge mode at DSC V1.2. For DSC V1.1
> > two consecutive DSC encoders (start with even index) have to be paired
> > to support DSC merge mode.  In addition, the DSC with even index have
> > to be mapped to even PINGPONG index and DSC with odd index have to be
> > mapped to odd PINGPONG index at its data path in regardless of DSC
> > V1.1 or V1.2. This patch improves DSC allocation mechanism with
> > consideration of those factors.
> >
> > Changes in V6:
> > -- rename _dpu_rm_reserve_dsc_single to _dpu_rm_dsc_alloc
> > -- rename _dpu_rm_reserve_dsc_pair to _dpu_rm_dsc_alloc_pair
> > -- pass global_state to _dpu_rm_pingpong_next_index()
> > -- remove pp_max
> > -- fix for loop condition check at _dpu_rm_dsc_alloc()
> >
> > Changes in V5:
> > -- delete dsc_id[]
> > -- update to global_state->dsc_to_enc_id[] directly
> > -- replace ndx with idx
> > -- fix indentation at function declaration
> > -- only one for loop at _dpu_rm_reserve_dsc_single()
> >
> > Changes in V4:
> > -- rework commit message
> > -- use reserved_by_other()
> > -- add _dpu_rm_pingpong_next_index()
> > -- revise _dpu_rm_pingpong_dsc_check()
> >
> > Changes in V3:
> > -- add dpu_rm_pingpong_dsc_check()
> > -- for pair allocation use i += 2 at for loop
> >
> > Changes in V2:
> >      -- split _dpu_rm_reserve_dsc() into _dpu_rm_reserve_dsc_single() and
> >         _dpu_rm_reserve_dsc_pair()
> >
> > Fixes: f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in RM")
> > Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 154 +++++++++++++++++++++++++++++----
> >   1 file changed, 139 insertions(+), 15 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

See below for minor nit.

> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index f9215643..0ce2a25 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -461,29 +461,153 @@ static int _dpu_rm_reserve_ctls(
> >       return 0;
> >   }
> >
> > -static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> > -                            struct dpu_global_state *global_state,
> > -                            struct drm_encoder *enc,
> > -                            const struct msm_display_topology *top)
> > +static int _dpu_rm_pingpong_next_index(struct dpu_global_state *global_state,
> > +                                    int start,

I'd still prefer to see `enum dpu_pingpong` as a parameter here
instead of just an index, but this is just my taste.

> > +                                    uint32_t enc_id)
> >   {
> > -     int num_dsc = top->num_dsc;
> >       int i;
> >
> > -     /* check if DSC required are allocated or not */
> > -     for (i = 0; i < num_dsc; i++) {
> > -             if (!rm->dsc_blks[i]) {
> > -                     DPU_ERROR("DSC %d does not exist\n", i);
> > -                     return -EIO;
> > +     for (i = start; i < (PINGPONG_MAX - PINGPONG_0); i++) {
> > +             if (global_state->pingpong_to_enc_id[i] == enc_id)
> > +                     return i;
> > +     }
> > +
> > +     return -ENAVAIL;
> > +}
> > +
> > +static int _dpu_rm_pingpong_dsc_check(int dsc_idx, int pp_idx)
> > +{
> > +     /*
> > +      * DSC with even index must be used with the PINGPONG with even index
> > +      * DSC with odd index must be used with the PINGPONG with odd index
> > +      */
> > +     if ((dsc_idx & 0x01) != (pp_idx & 0x01))
> > +             return -ENAVAIL;
> > +
> > +     return 0;
> > +}
> > +
> > +static int _dpu_rm_dsc_alloc(struct dpu_rm *rm,
> > +                          struct dpu_global_state *global_state,
> > +                          uint32_t enc_id,
> > +                          const struct msm_display_topology *top)
> > +{
> > +     int num_dsc = 0;
> > +     int pp_idx = 0;
> > +     int dsc_idx;
> > +     int ret;
> > +
> > +     for (dsc_idx = 0; dsc_idx < ARRAY_SIZE(rm->dsc_blks) &&
> > +          num_dsc < top->num_dsc; dsc_idx++) {
> > +             if (!rm->dsc_blks[dsc_idx])
> > +                     continue;
> > +
> > +             if (reserved_by_other(global_state->dsc_to_enc_id, dsc_idx, enc_id))
> > +                     continue;
> > +
> > +             pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, enc_id);
> > +             if (pp_idx < 0)
> > +                     return -ENAVAIL;
> > +
> > +             ret = _dpu_rm_pingpong_dsc_check(dsc_idx, pp_idx);
> > +             if (ret)
> > +                     return -ENAVAIL;
> > +
> > +             global_state->dsc_to_enc_id[dsc_idx] = enc_id;
> > +             num_dsc++;
> > +             pp_idx++;
> > +     }
> > +
> > +     if (num_dsc < top->num_dsc) {
> > +             DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> > +                        num_dsc, top->num_dsc);
> > +             return -ENAVAIL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
> > +                               struct dpu_global_state *global_state,
> > +                               uint32_t enc_id,
> > +                               const struct msm_display_topology *top)
> > +{
> > +     int num_dsc = 0;
> > +     int dsc_idx, pp_idx = 0;
> > +     int ret;
> > +
> > +     /* only start from even dsc index */
> > +     for (dsc_idx = 0; dsc_idx < ARRAY_SIZE(rm->dsc_blks) &&
> > +          num_dsc < top->num_dsc; dsc_idx += 2) {
> > +             if (!rm->dsc_blks[dsc_idx] ||
> > +                 !rm->dsc_blks[dsc_idx + 1])
> > +                     continue;
> > +
> > +             /* consective dsc index to be paired */
> > +             if (reserved_by_other(global_state->dsc_to_enc_id, dsc_idx, enc_id) ||
> > +                 reserved_by_other(global_state->dsc_to_enc_id, dsc_idx + 1, enc_id))
> > +                     continue;
> > +
> > +             pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, enc_id);
> > +             if (pp_idx < 0)
> > +                     return -ENAVAIL;
> > +
> > +             ret = _dpu_rm_pingpong_dsc_check(dsc_idx, pp_idx);
> > +             if (ret) {
> > +                     pp_idx = 0;
> > +                     continue;
> >               }
> >
> > -             if (global_state->dsc_to_enc_id[i]) {
> > -                     DPU_ERROR("DSC %d is already allocated\n", i);
> > -                     return -EIO;
> > +             pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx + 1, enc_id);
> > +             if (pp_idx < 0)
> > +                     return -ENAVAIL;
> > +
> > +             ret = _dpu_rm_pingpong_dsc_check(dsc_idx + 1, pp_idx);
> > +             if (ret) {
> > +                     pp_idx = 0;
> > +                     continue;
> >               }
> > +
> > +             global_state->dsc_to_enc_id[dsc_idx] = enc_id;
> > +             global_state->dsc_to_enc_id[dsc_idx + 1] = enc_id;
> > +             num_dsc += 2;
> > +             pp_idx++;       /* start for next pair */
> >       }
> >
> > -     for (i = 0; i < num_dsc; i++)
> > -             global_state->dsc_to_enc_id[i] = enc->base.id;
> > +     if (num_dsc < top->num_dsc) {
> > +             DPU_ERROR("DSC allocation failed num_dsc=%d required=%d\n",
> > +                        num_dsc, top->num_dsc);
> > +             return -ENAVAIL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
> > +                            struct dpu_global_state *global_state,
> > +                            struct drm_encoder *enc,
> > +                            const struct msm_display_topology *top)
> > +{
> > +     uint32_t enc_id = enc->base.id;
> > +
> > +     if (!top->num_dsc || !top->num_intf)
> > +             return 0;
> > +
> > +     /*
> > +      * Facts:
> > +      * 1) no pingpong split (two layer mixers shared one pingpong)
> > +      * 2) DSC pair starts from even index, such as index(0,1), (2,3), etc
> > +      * 3) even PINGPONG connects to even DSC
> > +      * 4) odd PINGPONG connects to odd DSC
> > +      * 5) pair: encoder +--> pp_idx_0 --> dsc_idx_0
> > +      *                  +--> pp_idx_1 --> dsc_idx_1
> > +      */
> > +
> > +     /* num_dsc should be either 1, 2 or 4 */
> > +     if (top->num_dsc > top->num_intf)       /* merge mode */
> > +             return _dpu_rm_dsc_alloc_pair(rm, global_state, enc_id, top);
> > +     else
> > +             return _dpu_rm_dsc_alloc(rm, global_state, enc_id, top);
> >
> >       return 0;
> >   }



-- 
With best wishes
Dmitry
