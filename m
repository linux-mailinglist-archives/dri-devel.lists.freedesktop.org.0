Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812666A5928
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EB510E69A;
	Tue, 28 Feb 2023 12:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1707410E4CA
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:36:04 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-536c02eea4dso267797307b3.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 04:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yz+ORWHU5fE0LcXMKfBg/65UfB8kg/c6Yy0zvTUFxIU=;
 b=oDXWDC8wIFYlgp8099VANYIxtcvcsvsFYU28Nggng8mIiQtEH1aJI4nEWxMIIQO+du
 02E2hTklpCJd8rfHas91ixzzL85KAxdA6KrPBVajt0WDgV6JS9tBge2i6DxjqeHZwCR8
 6VPgwikoRO9Vj+hPY0Fjje/PrU394RtGeyver2bf+KjKTRJJEaBDOR/+7sqY6x37Q8QS
 wzcj7D9BqL7qpTAXWDisctzMuz32aqVjjwtYY4BVhgzHGyLYMBnp+0r/32z5LTGKOvTm
 Rb8gklHHGcUKb1mXkPGU7I1mpWRYUWhKEhZ5zOY09fn2Kh5DafXt2lLx4Tumrn4GY2G7
 /rCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yz+ORWHU5fE0LcXMKfBg/65UfB8kg/c6Yy0zvTUFxIU=;
 b=16T3+2Wycqcufb0vm6eFLx7W6UDS5RDcNOePYTm5bsCVgXp4MUO2nGOWqh2S24ebTm
 95SS8++A+M0mRkk83N0/F8QksCDBWFgyesY4wkMY5U4v5NyL0VRTJvGQM4nrjtVTTC97
 DZQ/Xor1r8+WD+mrK+Ol1xlr+jdibEjYTyC5ewRlY78CqojdXKqJBvTMEl7skSxuV3Hf
 bOwFkUTT5ZATM08TNQAWSfmTUId/Peqso6bX1VV+52JiQ1JVpebMFeGGlIbgPumvX88l
 AHs+yOjJ6xalgmv+HdoJ3uQWcgsBQXuE1xr87mQZ351laNXIYuuafChQFxgwLTA8NCVZ
 9rUQ==
X-Gm-Message-State: AO0yUKWPErYWCytmKVfYKo9FuSX7I/ybFWhTIyAU8w3HjIP/wB81lLcb
 ME6XxCRgEO/PKV9hO4ClDmNzXzZJv+KGdfj3Dw78og==
X-Google-Smtp-Source: AK7set8WYjsgwU4khREQxWMW/wYopS8m2+eDBKBeEvK0IR/BYyGfHdCVSMqqL+ejqx12UDGZdbtAxfhkKOLTrlp0KfQ=
X-Received: by 2002:a81:ae0e:0:b0:534:7429:2eb4 with SMTP id
 m14-20020a81ae0e000000b0053474292eb4mr1549719ywh.3.1677587763202; Tue, 28 Feb
 2023 04:36:03 -0800 (PST)
MIME-Version: 1.0
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
 <20230228113342.2051425-3-dmitry.baryshkov@linaro.org>
 <87mt4yyo2s.fsf@intel.com>
In-Reply-To: <87mt4yyo2s.fsf@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 Feb 2023 14:35:52 +0200
Message-ID: <CAA8EJpoubQQjuUAs342TVYgx09nw9vENXcsiJiDOq0e0_q=6Fw@mail.gmail.com>
Subject: Re: [PATCH 02/10] drm/i915/dsc: move rc_buf_thresh values to common
 helper
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: linux-arm-msm@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Feb 2023 at 14:25, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Tue, 28 Feb 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > The rc_buf_thresh values are common to all DSC implementations. Move
> > them to the common helper together with the code to propagage them to
> > the drm_dsc_config.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_dsc_helper.c  | 37 +++++++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_vdsc.c | 24 +--------------
> >  include/drm/display/drm_dsc_helper.h      |  1 +
> >  3 files changed, 39 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
> > index c869c6e51e2b..ab8679c158b5 100644
> > --- a/drivers/gpu/drm/display/drm_dsc_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
> > @@ -270,6 +270,43 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_payload,
> >  }
> >  EXPORT_SYMBOL(drm_dsc_pps_payload_pack);
> >
> > +/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
> > +const u16 drm_dsc_rc_buf_thresh[] = {
> > +     896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
> > +     7744, 7872, 8000, 8064
> > +};
> > +EXPORT_SYMBOL(drm_dsc_rc_buf_thresh);
>
> This needs to be static, without exports.

Exported this to let other drivers use it, while skipping the
drm_dsc_set_rc_buf_thresh(). For example amdgpu driver sets buffer
thresholds on the interim structure, so the helper is not directly
applicable. See _do_calc_rc_params().

>
> > +
> > +/**
> > + * drm_dsc_set_rc_buf_thresh() - Set thresholds for the RC model
> > + * in accordance with the DSC 1.2 specification.
> > + *
> > + * @vdsc_cfg: DSC Configuration data partially filled by driver
> > + */
> > +void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg)
> > +{
> > +     int i = 0;
>
> Unnecessary initialization.

My bad.

>
> > +
> > +     for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
>
> Please use ARRAY_SIZE(). Maybe add BUILD_BUG_ON() for DSC_NUM_BUF_RANGES
> vs. ARRAY_SIZE(). (Yes, we should've used ARRAY_SIZE() in i915.)

Ack

>
> > +             /*
> > +              * six 0s are appended to the lsb of each threshold value
> > +              * internally in h/w.
> > +              * Only 8 bits are allowed for programming RcBufThreshold
> > +              */
> > +             vdsc_cfg->rc_buf_thresh[i] = drm_dsc_rc_buf_thresh[i] >> 6;
> > +     }
> > +
> > +     /*
> > +      * For 6bpp, RC Buffer threshold 12 and 13 need a different value
> > +      * as per C Model
> > +      */
> > +     if (vdsc_cfg->bits_per_pixel == 6 << 4) {
> > +             vdsc_cfg->rc_buf_thresh[12] = 7936 >> 6;
> > +             vdsc_cfg->rc_buf_thresh[13] = 8000 >> 6;
> > +     }
> > +}
> > +EXPORT_SYMBOL(drm_dsc_set_rc_buf_thresh);
> > +
> >  /**
> >   * drm_dsc_compute_rc_parameters() - Write rate control
> >   * parameters to the dsc configuration defined in
> > diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
> > index d080741fd0b3..b4faab4c8fb3 100644
> > --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> > @@ -36,12 +36,6 @@ enum COLUMN_INDEX_BPC {
> >       MAX_COLUMN_INDEX
> >  };
> >
> > -/* From DSC_v1.11 spec, rc_parameter_Set syntax element typically constant */
> > -static const u16 rc_buf_thresh[] = {
> > -     896, 1792, 2688, 3584, 4480, 5376, 6272, 6720, 7168, 7616,
> > -     7744, 7872, 8000, 8064
> > -};
> > -
> >  struct rc_parameters {
> >       u16 initial_xmit_delay;
> >       u8 first_line_bpg_offset;
> > @@ -474,23 +468,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
> >       vdsc_cfg->bits_per_pixel = compressed_bpp << 4;
> >       vdsc_cfg->bits_per_component = pipe_config->pipe_bpp / 3;
> >
> > -     for (i = 0; i < DSC_NUM_BUF_RANGES - 1; i++) {
> > -             /*
> > -              * six 0s are appended to the lsb of each threshold value
> > -              * internally in h/w.
> > -              * Only 8 bits are allowed for programming RcBufThreshold
> > -              */
> > -             vdsc_cfg->rc_buf_thresh[i] = rc_buf_thresh[i] >> 6;
> > -     }
> > -
> > -     /*
> > -      * For 6bpp, RC Buffer threshold 12 and 13 need a different value
> > -      * as per C Model
> > -      */
> > -     if (compressed_bpp == 6) {
> > -             vdsc_cfg->rc_buf_thresh[12] = 0x7C;
> > -             vdsc_cfg->rc_buf_thresh[13] = 0x7D;
> > -     }
> > +     drm_dsc_set_rc_buf_thresh(vdsc_cfg);
> >
> >       /*
> >        * From XE_LPD onwards we supports compression bpps in steps of 1
> > diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
> > index 8b41edbbabab..706ba1d34742 100644
> > --- a/include/drm/display/drm_dsc_helper.h
> > +++ b/include/drm/display/drm_dsc_helper.h
> > @@ -14,6 +14,7 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
> >  int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
> >  void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
> >                             const struct drm_dsc_config *dsc_cfg);
> > +void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
> >  int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
> >
> >  #endif /* _DRM_DSC_HELPER_H_ */
>
> --
> Jani Nikula, Intel Open Source Graphics Center



-- 
With best wishes
Dmitry
