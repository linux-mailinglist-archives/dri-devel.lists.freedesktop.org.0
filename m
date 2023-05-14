Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B198701E5F
	for <lists+dri-devel@lfdr.de>; Sun, 14 May 2023 19:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421C910E098;
	Sun, 14 May 2023 17:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35C610E098
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 17:02:49 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-55a26b46003so178358797b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 14 May 2023 10:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684083768; x=1686675768;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4HemADSWG6TbTWJTVcnnzd18/y0jetxsoQACmcYyLEA=;
 b=ZUyOmZTzMm8ibiR+r9wArf5nURp7oGX95YU93GkqfiPa+tcBaLg4MgplXdvCWySa/5
 HIeIPOy/7Aso7A16FrO0rzlOLnYADrJCcvg8LyUQdKlpV8Gdunl6H7lFIy28ZiahbEtn
 J7FiK67mDBcPRI1AoXTC8wy9ll73EPAyfFYe3RIMYmkItKMRIsoypIMjWGhOgmAzQ5Rz
 9bKgaCAfwA1+2Lay2AjeMxityHFAPADOh2IL4IT4e7EoDe/yHEVrJF4HN0ryuLc4A+M0
 c1iBCrbj89SrKl7jEyPxJPiE4ZHP/fO5yQZRLpp+eDWp2FLQCdk+0WjsZcHd1n8vOiNm
 vfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684083768; x=1686675768;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4HemADSWG6TbTWJTVcnnzd18/y0jetxsoQACmcYyLEA=;
 b=BkURzLd5bfd5PZbEQHBpik1y1F2ToR70Jn1EdrtzFRnA5o8nUEpPU0a6X+bmFIIN8c
 1n315Sh4ZYJs/FsvLN+61Lzvp3Iibxw8VsgZ6vYH5JF8Vi4wrTArTM/QCnp5DtszAZjG
 EZP3Xz+x2oq31nAIjwFhLTWJwYA+VDOtb8RkJXr0El1svrS7xsGktI4kwTNxxmpgEqCC
 T99k1ndP/Pmn8/hgAqDU24/9KC+EjsABazkRmIsswDUZCuAWdzrWBouQDrug+vbgkVSC
 UeUGrWI6DaVzpK/x8JpIWAppR0TkrQfjgQnnvo8r8cNXQxPzLNF32PvjTQhA/t0bXZ9E
 JYig==
X-Gm-Message-State: AC+VfDx3Om4bb60umE1NrESfAX+Yaa3mcgIZw8G8Q7FEmrIKHMX47JQl
 etLtgFfck2eVsfKr6J7v9HNoJSHkpYg4VR5FA7dSSUFh9U5n0jnJHknVpw==
X-Google-Smtp-Source: ACHHUZ5DaioK1TXRd33tj9Kq922BXwIOeOuZeQ+C1hGTFrXRYbkZdsBOYes41MZx10122HrPjXThSxAGXdK/gwcjNqk=
X-Received: by 2002:a0d:e6d5:0:b0:55a:30f5:3d65 with SMTP id
 p204-20020a0de6d5000000b0055a30f53d65mr31086924ywe.41.1684083768354; Sun, 14
 May 2023 10:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-4-dmitry.baryshkov@linaro.org>
 <47ade353-a46a-9f10-f712-4d5502e03ce1@quicinc.com>
In-Reply-To: <47ade353-a46a-9f10-f712-4d5502e03ce1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 14 May 2023 20:02:37 +0300
Message-ID: <CAA8EJprczWqZ9uDPujw0JbOVW6A5+NcF_isnzDmheomRg3MQjw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/13] drm/msm/dpu: encoder: simplify debugfs
 handling
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

On Sat, 13 May 2023 at 01:18, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
> > As the debugfs is fully cleared on drm device removal, drop the
> > encoder-specific cleanup function, remove debugfs_root from dpu_encoder
> > struct and also remove phys_encoder late_register() ops which has been
> > unused since the driver being added.
> >
>
> Agreed, late_register of encoder_phys is unused, so we can drop that.
>
> For the other two things which this patch does:
>
> 1) remove debugfs_root from dpu_encoder
> 2) remove early_unregister of dpu_encoder
>
> I think this has been posted separately here
> https://patchwork.freedesktop.org/patch/534802/?series=117150&rev=1 for
> which I had given my feedback about why it cant be removed

Sure. And this patch predates your feedback.

>
> So these 2 parts have to be kept till we sort out that feedback
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 22 +++----------------
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  3 ---
> >   2 files changed, 3 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 97d8d777f178..28729c77364f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -142,7 +142,6 @@ enum dpu_enc_rc_states {
> >    * @crtc_kickoff_cb:                Callback into CRTC that will flush & start
> >    *                          all CTL paths
> >    * @crtc_kickoff_cb_data:   Opaque user data given to crtc_kickoff_cb
> > - * @debugfs_root:            Debug file system root file node
> >    * @enc_lock:                       Lock around physical encoder
> >    *                          create/destroy/enable/disable
> >    * @frame_busy_mask:                Bitmask tracking which phys_enc we are still
> > @@ -186,7 +185,6 @@ struct dpu_encoder_virt {
> >       struct drm_crtc *crtc;
> >       struct drm_connector *connector;
> >
> > -     struct dentry *debugfs_root;
> >       struct mutex enc_lock;
> >       DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
> >       void (*crtc_frame_event_cb)(void *, u32 event);
> > @@ -2134,7 +2132,7 @@ DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
> >   static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
> >   {
> >       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > -     int i;
> > +     struct dentry *debugfs_root;
> >
> >       char name[DPU_NAME_SIZE];
> >
> > @@ -2146,18 +2144,12 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
> >       snprintf(name, DPU_NAME_SIZE, "encoder%u", drm_enc->base.id);
> >
> >       /* create overall sub-directory for the encoder */
> > -     dpu_enc->debugfs_root = debugfs_create_dir(name,
> > +     debugfs_root = debugfs_create_dir(name,
> >                       drm_enc->dev->primary->debugfs_root);
> >
> >       /* don't error check these */
> >       debugfs_create_file("status", 0600,
> > -             dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
> > -
> > -     for (i = 0; i < dpu_enc->num_phys_encs; i++)
> > -             if (dpu_enc->phys_encs[i]->ops.late_register)
> > -                     dpu_enc->phys_encs[i]->ops.late_register(
> > -                                     dpu_enc->phys_encs[i],
> > -                                     dpu_enc->debugfs_root);
> > +             debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
> >
> >       return 0;
> >   }
> > @@ -2173,13 +2165,6 @@ static int dpu_encoder_late_register(struct drm_encoder *encoder)
> >       return _dpu_encoder_init_debugfs(encoder);
> >   }
> >
> > -static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
> > -{
> > -     struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
> > -
> > -     debugfs_remove_recursive(dpu_enc->debugfs_root);
> > -}
> > -
> >   static int dpu_encoder_virt_add_phys_encs(
> >               struct msm_display_info *disp_info,
> >               struct dpu_encoder_virt *dpu_enc,
> > @@ -2406,7 +2391,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
> >   static const struct drm_encoder_funcs dpu_encoder_funcs = {
> >               .destroy = dpu_encoder_destroy,
> >               .late_register = dpu_encoder_late_register,
> > -             .early_unregister = dpu_encoder_early_unregister,
> >   };
> >
> >   int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > index 1d434b22180d..9e29079a6fc4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > @@ -63,7 +63,6 @@ struct dpu_encoder_phys;
> >   /**
> >    * struct dpu_encoder_phys_ops - Interface the physical encoders provide to
> >    *  the containing virtual encoder.
> > - * @late_register:           DRM Call. Add Userspace interfaces, debugfs.
> >    * @prepare_commit:         MSM Atomic Call, start of atomic commit sequence
> >    * @is_master:                      Whether this phys_enc is the current master
> >    *                          encoder. Can be switched at enable time. Based
> > @@ -93,8 +92,6 @@ struct dpu_encoder_phys;
> >    */
> >
> >   struct dpu_encoder_phys_ops {
> > -     int (*late_register)(struct dpu_encoder_phys *encoder,
> > -                     struct dentry *debugfs_root);
> >       void (*prepare_commit)(struct dpu_encoder_phys *encoder);
> >       bool (*is_master)(struct dpu_encoder_phys *encoder);
> >       void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,



-- 
With best wishes
Dmitry
