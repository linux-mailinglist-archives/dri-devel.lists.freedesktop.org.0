Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E420070ECD1
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 07:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDD110E577;
	Wed, 24 May 2023 05:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEEC10E576
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 05:02:08 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5619032c026so7310787b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 22:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684904527; x=1687496527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3zOGAGWU8ppE8uxbVbBgAIQq2grz/vGUNZMK9IfgwSA=;
 b=K4nPhnP+9wbmRMbdOjtZWXDCxzzH9srO+WZqqeyUlfLLnOIamMeFuuPItq7vgVfpj2
 tD+GxTN9aBLMmBEG05HtjVEskMIi4zDIatdBKMWeLVtoQ2UDiXuvNIpIol8OI0U1ESuk
 FKeXhL6vybKHl1ON0xhGdeqC5jl4e1IDLWJ4dPXDPMWpIdID/EPAJ9o3XUhLEGW9ZgtX
 KYvMqQobm0rnn8W/6Pu713oqgFHVU+lWAknWerDXa2/joIQNIM+vR6/fOZ7jIZR7j+pW
 nCgh4DTfen/PxgHAxRBfer/lvJSRDfauTosykZ0RCXFO3Nf2IHnW65aGDgzhnddvNgit
 LTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684904527; x=1687496527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3zOGAGWU8ppE8uxbVbBgAIQq2grz/vGUNZMK9IfgwSA=;
 b=MzHTCOVphvq5ve9Lt/nXdUH3mMwxg+hWTZYVP3gYoTo26KN/Xnj+rSSvtSs38XIT8+
 zVW03V9YBzcTfTcE8w0yum4rOXJMrvz1+a8RgqR0OFffiC6tvREgW7QLOHKaO9gpH187
 jrKuLJP4wRNrsJ2ldmYM8x6faROt70e42pybDYGXENoY8lV+OpoglXQ84Y1ESSehqtUB
 cnAY1JKM6OSopNMQPN0bpE1q32dt+7SQ5ICnGA0kGzONJS1rgQihC2OqUCpcYcKFaXDa
 /99Ic1gLq0TzeWgxuLyEFk1PBBpaP8DUdWWqgQMj7tzqy7vepxAIPPFJPLki2ABgxcGm
 Vguw==
X-Gm-Message-State: AC+VfDykdPtb1EhWTaXkVcqg6SN0XcoabgKwNzsg8xYQoSPAyshsC3DH
 BAnTaSrgCSX74Hit/XDaFDlIZM5EhHHkZeE5Pbsiwg==
X-Google-Smtp-Source: ACHHUZ535Obk8h9GvFw5MrDYAprAzu0l7CAOlD5MBy6v/AqVn+TLZhofLV7m6WUlrlYoiw5TRnrlZEuVwgfwXvP2Km8=
X-Received: by 2002:a81:4e52:0:b0:561:a41d:aabb with SMTP id
 c79-20020a814e52000000b00561a41daabbmr17316168ywb.16.1684904527629; Tue, 23
 May 2023 22:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
 <20230521192230.9747-3-dmitry.baryshkov@linaro.org>
 <8268a40f-7605-207f-3a6c-8965a8a49b60@quicinc.com>
 <CAA8EJpoo_tYcu=j_CavcZK5S-vZCTQd+nyyKq0bMk1xoVRpFNA@mail.gmail.com>
 <21bc10b1-258d-e095-88d0-0e964f4c20ea@quicinc.com>
In-Reply-To: <21bc10b1-258d-e095-88d0-0e964f4c20ea@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 May 2023 08:01:56 +0300
Message-ID: <CAA8EJpo9aNCohaxvOH+d5n33vHrrOGitvOuA-QjgxydcFs3auA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: switch dpu_encoder to use
 drm_debugfs_add_file()
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 May 2023 at 03:10, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/23/2023 4:53 PM, Dmitry Baryshkov wrote:
> > On Wed, 24 May 2023 at 02:37, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 5/21/2023 12:22 PM, Dmitry Baryshkov wrote:
> >>> Use drm_debugfs_add_file() for encoder's status file. This changes the
> >>> name of the status file from encoder%d/status to just encoder%d.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>
> >> This patch depends on
> >> https://patchwork.freedesktop.org/patch/538294/?series=118079&rev=1 right?
> >
> > No, there is no dependency. I have sent that patch as we discussed it
> > earlier. But this one is a reimplementation of the previous idea.
> >
>
> In this patch you are also removing the early_unregister callback.
>
> .early_unregister = dpu_encoder_early_unregister
>
> Which we discussed was needed to balance the corner case we discussed.
> The DRM core patch fixes the corner case by calling debugfs_cleanup()
> even when drm_modeset_register_all() fails.
>
> So isnt there a dependency?

No. There is no remove counterpart for drm_debugfs_add_file(). DRM
subsystem handles everything internally.

>
> >>
> >> What is wrong with having a per encoder directory and reading from
> >> there? It gives room for expanding this to dump more encoder specific
> >> information.
> >>
> >> At the moment it looks light because we have only status but better to
> >> have a directory per encoder right?
> >
> > I started writing that I can not imagine additional per-encoder data,
> > but then I found the generic enough piece: bridge chain enumeration.
> > I'll give it additional thought and maybe I'll refactor this patch
> > further.
> >
>
> Ack,
> >>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 40 ++++++---------------
> >>>    1 file changed, 11 insertions(+), 29 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> index af34932729db..0ac68f44ec74 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> >>> @@ -14,6 +14,7 @@
> >>>
> >>>    #include <drm/drm_atomic.h>
> >>>    #include <drm/drm_crtc.h>
> >>> +#include <drm/drm_debugfs.h>
> >>>    #include <drm/drm_file.h>
> >>>    #include <drm/drm_probe_helper.h>
> >>>
> >>> @@ -142,7 +143,6 @@ enum dpu_enc_rc_states {
> >>>     * @crtc_kickoff_cb:                Callback into CRTC that will flush & start
> >>>     *                          all CTL paths
> >>>     * @crtc_kickoff_cb_data:   Opaque user data given to crtc_kickoff_cb
> >>> - * @debugfs_root:            Debug file system root file node
> >>>     * @enc_lock:                       Lock around physical encoder
> >>>     *                          create/destroy/enable/disable
> >>>     * @frame_busy_mask:                Bitmask tracking which phys_enc we are still
> >>> @@ -186,7 +186,6 @@ struct dpu_encoder_virt {
> >>>        struct drm_crtc *crtc;
> >>>        struct drm_connector *connector;
> >>>
> >>> -     struct dentry *debugfs_root;
> >>>        struct mutex enc_lock;
> >>>        DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
> >>>        void (*crtc_frame_event_cb)(void *, u32 event);
> >>> @@ -2091,7 +2090,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
> >>>    #ifdef CONFIG_DEBUG_FS
> >>>    static int _dpu_encoder_status_show(struct seq_file *s, void *data)
> >>>    {
> >>> -     struct dpu_encoder_virt *dpu_enc = s->private;
> >>> +     struct drm_debugfs_entry *entry = s->private;
> >>> +     struct dpu_encoder_virt *dpu_enc = entry->file.data;
> >>>        int i;
> >>>
> >>>        mutex_lock(&dpu_enc->enc_lock);
> >>> @@ -2110,48 +2110,31 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
> >>>        return 0;
> >>>    }
> >>>
> >>> -DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
> >>> -
> >>> -static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
> >>> +static void _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
> >>>    {
> >>>        struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> >>> -
> >>> -     char name[12];
> >>> +     char *name;
> >>>
> >>>        if (!drm_enc->dev) {
> >>>                DPU_ERROR("invalid encoder or kms\n");
> >>> -             return -EINVAL;
> >>> +             return;
> >>>        }
> >>>
> >>> -     snprintf(name, sizeof(name), "encoder%u", drm_enc->base.id);
> >>> +     name = devm_kasprintf(drm_enc->dev->dev, GFP_KERNEL, "encoder%u", drm_enc->base.id);
> >>>
> >>> -     /* create overall sub-directory for the encoder */
> >>> -     dpu_enc->debugfs_root = debugfs_create_dir(name,
> >>> -                     drm_enc->dev->primary->debugfs_root);
> >>> -
> >>> -     /* don't error check these */
> >>> -     debugfs_create_file("status", 0600,
> >>> -             dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
> >>> -
> >>> -     return 0;
> >>> +     drm_debugfs_add_file(drm_enc->dev, name, _dpu_encoder_status_show, dpu_enc);
> >>>    }
> >>>    #else
> >>> -static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
> >>> +static void _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
> >>>    {
> >>> -     return 0;
> >>>    }
> >>>    #endif
> >>>
> >>>    static int dpu_encoder_late_register(struct drm_encoder *encoder)
> >>>    {
> >>> -     return _dpu_encoder_init_debugfs(encoder);
> >>> -}
> >>> -
> >>> -static void dpu_encoder_early_unregister(struct drm_encoder *encoder)
> >>> -{
> >>> -     struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
> >>> +     _dpu_encoder_init_debugfs(encoder);
> >>>
> >>> -     debugfs_remove_recursive(dpu_enc->debugfs_root);
> >>> +     return 0;
> >>>    }
> >>>
> >>>    static int dpu_encoder_virt_add_phys_encs(
> >>> @@ -2380,7 +2363,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
> >>>    static const struct drm_encoder_funcs dpu_encoder_funcs = {
> >>>                .destroy = dpu_encoder_destroy,
> >>>                .late_register = dpu_encoder_late_register,
> >>> -             .early_unregister = dpu_encoder_early_unregister,
> >>>    };
> >>>
> >>>    int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
> >
> >
> >



-- 
With best wishes
Dmitry
