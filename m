Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E05701E6E
	for <lists+dri-devel@lfdr.de>; Sun, 14 May 2023 19:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C3510E0A5;
	Sun, 14 May 2023 17:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A3A10E05F
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 17:06:30 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-559f1819c5dso176311527b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 10:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684083989; x=1686675989;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n8w1zJbPSYp8ywdGrzUV5T9y2th6dzGmCJcXRZI0nLw=;
 b=Urx/l0f3VojAnloO1ed23eQh/LMZVcg/2OXhngr64V4nuUn5Q7nxC8GL5u9i5ZeSme
 AhN3c62Teooj8iCJqfe58ZZQIHvDErs1nWgIRbdfKf6FfUft7fyeH3hwr0nDfDX8Ebml
 AVETNSn+IOItbWDGuwE0t1hTC60FFanSLRzYkWdrviTs8ROGfmL2/k6xclSM0a8YGJNz
 6vdk82HyYtfYWjgFuWms7PSOgkLwuJvL3fZ1WJ6o/fir4AzT+wNOJJcJP4ybVUpP71gT
 a4+i6XiHhobZipMpB6XRoiTCV4mbQGs6TASLwcDZabNdKJIeOJkGrLnNcpGAtTy1ktmY
 AVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684083989; x=1686675989;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n8w1zJbPSYp8ywdGrzUV5T9y2th6dzGmCJcXRZI0nLw=;
 b=iTeroeaZQzwF2EFT86YhSQIjOAFGwUZsiI7bdlZYHKeKS+6AWroD6dgbTzTKzT6xyn
 PSE5JlTwp9yS3YGMni+VdSi6kSsZNlb2zpng7s/MnIGLChwHc6eLPYAC6hXcDeQopUBO
 +KczYVFdmyxN7Q92XO0YNXHRxc/U6AMqMlL03TM4ay97TUf70bKZL90MeNGgzUn4K6ti
 yxA+LreDhaZ7363P4jHd++dZaB9na7zCE0ud/8zvN3f1On4Muq8tFQVWzn3+tN1x+URP
 ekG+U3seKfZC/f1UzmR9si73NeZzEN6wvZQ5i1wKtlio8krUe8R0HHssOWLBunqL15Za
 ocFw==
X-Gm-Message-State: AC+VfDzwXmVVrSpINYUOBJX6wBV9jB5u6a5c4A3j02sf5aRTV5qb0mZ/
 TTa0FPi9UzbBxZVUZMt7GIDlfOr8HB3uWeju6cAJGA==
X-Google-Smtp-Source: ACHHUZ6slKUUHyi9+FUSqrnUBxRkuQgvWKdyQi4mRxqAsyARPswb71ngz9JDbICME5uaRc4tRsxaDNfCP+NVuQM9VE0=
X-Received: by 2002:a81:7754:0:b0:55d:c320:f5aa with SMTP id
 s81-20020a817754000000b0055dc320f5aamr26322507ywc.51.1684083989412; Sun, 14
 May 2023 10:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-6-dmitry.baryshkov@linaro.org>
 <a1ba90c2-8144-ccf3-b38e-0dbb549a7481@quicinc.com>
In-Reply-To: <a1ba90c2-8144-ccf3-b38e-0dbb549a7481@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 14 May 2023 20:06:18 +0300
Message-ID: <CAA8EJppAaXWpSNMMWTRKVa8=oNyAP7K1LcwusmEY4L-5-nqLow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 05/13] drm/msm/dpu: get rid of struct
 dpu_rm_requirements
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 13 May 2023 at 01:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> > The struct dpu_rm_requirements was used to wrap display topology and
> > hw resources, which meant INTF indices. As of commit ef58e0ad3436
> > ("drm/msm/dpu: get INTF blocks directly rather than through RM") the hw
> > resources struct was removed, leaving struct dpu_rm_requirements
> > containing a single field (topology). Remove the useless wrapper.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Irrespective of where we plan to have the topology, this change doesn't
> seem incorrect as such.
>
> The only thing I can think of is when we need more information to be
> passed to the RM to allocate the blocks in addition to the topology this
> struct could have been expanded.
>
> So one example I can think of is lets say I want to add CDM block
> support. Then that information is outside of topology today because I
> will use CDM if my output format is yuv. It has nothing to do with
> topology but that block still needs to come from RM.

I'd say, it is a part of the topology. CDM blocks are a part of the
pipeline, aren't they?

If you prefer, we can rename msm_display_topology to dpu_rm_requirements itself.

> I know that usually I have lost on these type of discussions saying that
> if the code is not there yet, it should be dropped but I do have a plan
> to add that support soon probably by the next cycle. That time we will
> need some sort of wrapper to hold the topology and "extra" information
> to allocate the blocks.
>
> One alternative ofcourse is to expand dpu_rm_reserve() to accept
> something like "needs_cdm" but this is not scalable.
>
> Thoughts?
>
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 69 +++++++--------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 +-
> >   3 files changed, 23 insertions(+), 50 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 4ee708264f3b..a2cb23dea0b8 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -638,7 +638,7 @@ static int dpu_encoder_virt_atomic_check(
> >
> >               if (!crtc_state->active_changed || crtc_state->enable)
> >                       ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> > -                                     drm_enc, crtc_state, topology);
> > +                                     drm_enc, crtc_state, &topology);
> >       }
> >
> >       trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index f4dda88a73f7..952e139c0234 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -24,15 +24,6 @@ static inline bool reserved_by_other(uint32_t *res_map, int idx,
> >       return res_map[idx] && res_map[idx] != enc_id;
> >   }
> >
> > -/**
> > - * struct dpu_rm_requirements - Reservation requirements parameter bundle
> > - * @topology:  selected topology for the display
> > - * @hw_res:     Hardware resources required as reported by the encoders
> > - */
> > -struct dpu_rm_requirements {
> > -     struct msm_display_topology topology;
> > -};
> > -
> >   int dpu_rm_destroy(struct dpu_rm *rm)
> >   {
> >       int i;
> > @@ -329,14 +320,13 @@ static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
> >    *      mixer in rm->pingpong_blks[].
> >    * @dspp_idx: output parameter, index of dspp block attached to the layer
> >    *      mixer in rm->dspp_blks[].
> > - * @reqs: input parameter, rm requirements for HW blocks needed in the
> > - *      datapath.
> > + * @topology:  selected topology for the display
> >    * Return: true if lm matches all requirements, false otherwise
> >    */
> >   static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
> >               struct dpu_global_state *global_state,
> >               uint32_t enc_id, int lm_idx, int *pp_idx, int *dspp_idx,
> > -             struct dpu_rm_requirements *reqs)
> > +             struct msm_display_topology *topology)
> >   {
> >       const struct dpu_lm_cfg *lm_cfg;
> >       int idx;
> > @@ -361,7 +351,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
> >       }
> >       *pp_idx = idx;
> >
> > -     if (!reqs->topology.num_dspp)
> > +     if (!topology->num_dspp)
> >               return true;
> >
> >       idx = lm_cfg->dspp - DSPP_0;
> > @@ -383,7 +373,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
> >   static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> >                              struct dpu_global_state *global_state,
> >                              uint32_t enc_id,
> > -                            struct dpu_rm_requirements *reqs)
> > +                            struct msm_display_topology *topology)
> >
> >   {
> >       int lm_idx[MAX_BLOCKS];
> > @@ -391,14 +381,14 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> >       int dspp_idx[MAX_BLOCKS] = {0};
> >       int i, j, lm_count = 0;
> >
> > -     if (!reqs->topology.num_lm) {
> > -             DPU_ERROR("invalid number of lm: %d\n", reqs->topology.num_lm);
> > +     if (!topology->num_lm) {
> > +             DPU_ERROR("invalid number of lm: %d\n", topology->num_lm);
> >               return -EINVAL;
> >       }
> >
> >       /* Find a primary mixer */
> >       for (i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
> > -                     lm_count < reqs->topology.num_lm; i++) {
> > +                     lm_count < topology->num_lm; i++) {
> >               if (!rm->mixer_blks[i])
> >                       continue;
> >
> > @@ -407,7 +397,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> >
> >               if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
> >                               enc_id, i, &pp_idx[lm_count],
> > -                             &dspp_idx[lm_count], reqs)) {
> > +                             &dspp_idx[lm_count], topology)) {
> >                       continue;
> >               }
> >
> > @@ -415,7 +405,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> >
> >               /* Valid primary mixer found, find matching peers */
> >               for (j = i + 1; j < ARRAY_SIZE(rm->mixer_blks) &&
> > -                             lm_count < reqs->topology.num_lm; j++) {
> > +                             lm_count < topology->num_lm; j++) {
> >                       if (!rm->mixer_blks[j])
> >                               continue;
> >
> > @@ -428,7 +418,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> >                       if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
> >                                       global_state, enc_id, j,
> >                                       &pp_idx[lm_count], &dspp_idx[lm_count],
> > -                                     reqs)) {
> > +                                     topology)) {
> >                               continue;
> >                       }
> >
> > @@ -437,7 +427,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> >               }
> >       }
> >
> > -     if (lm_count != reqs->topology.num_lm) {
> > +     if (lm_count != topology->num_lm) {
> >               DPU_DEBUG("unable to find appropriate mixers\n");
> >               return -ENAVAIL;
> >       }
> > @@ -446,7 +436,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
> >               global_state->mixer_to_enc_id[lm_idx[i]] = enc_id;
> >               global_state->pingpong_to_enc_id[pp_idx[i]] = enc_id;
> >               global_state->dspp_to_enc_id[dspp_idx[i]] =
> > -                     reqs->topology.num_dspp ? enc_id : 0;
> > +                     topology->num_dspp ? enc_id : 0;
> >
> >               trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
> >                                        pp_idx[i] + PINGPONG_0);
> > @@ -539,44 +529,30 @@ static int _dpu_rm_make_reservation(
> >               struct dpu_rm *rm,
> >               struct dpu_global_state *global_state,
> >               struct drm_encoder *enc,
> > -             struct dpu_rm_requirements *reqs)
> > +             struct msm_display_topology *topology)
> >   {
> >       int ret;
> >
> > -     ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, reqs);
> > +     ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, topology);
> >       if (ret) {
> >               DPU_ERROR("unable to find appropriate mixers\n");
> >               return ret;
> >       }
> >
> >       ret = _dpu_rm_reserve_ctls(rm, global_state, enc->base.id,
> > -                             &reqs->topology);
> > +                                topology);
> >       if (ret) {
> >               DPU_ERROR("unable to find appropriate CTL\n");
> >               return ret;
> >       }
> >
> > -     ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
> > +     ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, topology);
> >       if (ret)
> >               return ret;
> >
> >       return ret;
> >   }
> >
> > -static int _dpu_rm_populate_requirements(
> > -             struct drm_encoder *enc,
> > -             struct dpu_rm_requirements *reqs,
> > -             struct msm_display_topology req_topology)
> > -{
> > -     reqs->topology = req_topology;
> > -
> > -     DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
> > -                   reqs->topology.num_lm, reqs->topology.num_dsc,
> > -                   reqs->topology.num_intf);
> > -
> > -     return 0;
> > -}
> > -
> >   static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
> >                                 uint32_t enc_id)
> >   {
> > @@ -608,9 +584,8 @@ int dpu_rm_reserve(
> >               struct dpu_global_state *global_state,
> >               struct drm_encoder *enc,
> >               struct drm_crtc_state *crtc_state,
> > -             struct msm_display_topology topology)
> > +             struct msm_display_topology *topology)
> >   {
> > -     struct dpu_rm_requirements reqs;
> >       int ret;
> >
> >       /* Check if this is just a page-flip */
> > @@ -625,13 +600,11 @@ int dpu_rm_reserve(
> >       DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
> >                     enc->base.id, crtc_state->crtc->base.id);
> >
> > -     ret = _dpu_rm_populate_requirements(enc, &reqs, topology);
> > -     if (ret) {
> > -             DPU_ERROR("failed to populate hw requirements\n");
> > -             return ret;
> > -     }
> > +     DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
> > +                   topology->num_lm, topology->num_dsc,
> > +                   topology->num_intf);
> >
> > -     ret = _dpu_rm_make_reservation(rm, global_state, enc, &reqs);
> > +     ret = _dpu_rm_make_reservation(rm, global_state, enc, topology);
> >       if (ret)
> >               DPU_ERROR("failed to reserve hw resources: %d\n", ret);
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > index d62c2edb2460..f05697462856 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > @@ -71,7 +71,7 @@ int dpu_rm_reserve(struct dpu_rm *rm,
> >               struct dpu_global_state *global_state,
> >               struct drm_encoder *drm_enc,
> >               struct drm_crtc_state *crtc_state,
> > -             struct msm_display_topology topology);
> > +             struct msm_display_topology *topology);
> >
> >   /**
> >    * dpu_rm_reserve - Given the encoder for the display chain, release any



-- 
With best wishes
Dmitry
