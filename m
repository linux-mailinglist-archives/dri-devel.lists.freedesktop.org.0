Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89457456520
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 22:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29096E332;
	Thu, 18 Nov 2021 21:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DAD6E0E9;
 Thu, 18 Nov 2021 21:38:49 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id c4so14195102wrd.9;
 Thu, 18 Nov 2021 13:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Paeq4jMg8ODsYSzW3HtIkeD0Alg1sBZkg5RSqN9sV0U=;
 b=WvFUN9GDau86I0PZfLcHQ6+x3ZTFAC1qoFupEuJYivPkFVtnZ7D8e5/4nI60AddOOa
 bNpSb+nL2mBvqoH8oPjcP8qGrPB0CnP3PIKuKwZuocSa1dvsWDxiVIEk4GqKLvB9U/pk
 9eLWs0ThItxZ88EuZDfNVUyS5vH5+3Wkt6kwzReO2piJm6hQ9byXqSIHPddHvyZoAWBm
 H/uAyydjesP90rl4oZ1m5Bav8FaN03zoYEBBxRmUT6hbKniKErME3R2QpZdefxjEhaGw
 45hnX5o35lCQKV+QrOsfQYulJ+WgMs9wXK2/AbsRZXWGBIUWaM3foUOdmwriEIf16yGb
 PQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Paeq4jMg8ODsYSzW3HtIkeD0Alg1sBZkg5RSqN9sV0U=;
 b=2XfdirakV/ZQqSlPx6JUNL3/A87WeALH830ObuqYW2rsNboPrWEn50qjBwDKhwvY02
 kv4jf6i/ZyCIHKkIhgAZJBxXUgahJ6NqJggQOmLECuejvsI/67Of21nSVI3VxHe/OmcD
 0tol0C59b8gfu9KHculuaR/TwlKNxd8lU3qPT4YDb1hj9HnQ2LrvMnnYH682oZDJB3PF
 gWuyDfRfrg1gUeCzVJYRxyNPW8qBJh104n6Af8o6kSEMKQEloRg8PwvQMMlZPUx05cwc
 KkpDWBcBoqsKajMCr+x2yPi1SsngPuvaXhBUJccAdCwkbVrejpE644V2jOVIBfo2BmIm
 ZvxA==
X-Gm-Message-State: AOAM533X/fBNiyzx4KPAE8U/GFMqlr/W6mu8RvAPDDH49yTBgXj+g6yz
 nzTvuCkBZsRRi4ZeGlsbjUiIV8ev+QJemccUAP8=
X-Google-Smtp-Source: ABdhPJwxVZe9wo+vbA8/CVS9tNNW2d44JW4FPuPAaJhB537qwv8WQ+zWq80vhdkWuMqpv1KUTAU04HARo16rRM4DOe4=
X-Received: by 2002:adf:f947:: with SMTP id q7mr836747wrr.260.1637271527663;
 Thu, 18 Nov 2021 13:38:47 -0800 (PST)
MIME-Version: 1.0
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
 <20210930140002.308628-12-dmitry.baryshkov@linaro.org>
 <0a10e5b55f61e5ed8a02f75699c31f08@codeaurora.org>
 <CAA8EJpoomnh6ijFvc73-sicd-tryeSAghMEmT9qcosLyAsucmQ@mail.gmail.com>
In-Reply-To: <CAA8EJpoomnh6ijFvc73-sicd-tryeSAghMEmT9qcosLyAsucmQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 18 Nov 2021 13:43:51 -0800
Message-ID: <CAF6AEGugTxC+F3OBq3DO6ruuFvOpPvg-EE=ZPGU-GUS4P9RpgQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 11/11] drm/msm/dpu: rip out debugfs support
 from dpu_plane
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 22, 2021 at 4:35 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi,
>
> On Fri, 22 Oct 2021 at 02:53, <abhinavk@codeaurora.org> wrote:
> >
> > On 2021-09-30 07:00, Dmitry Baryshkov wrote:
> > > In preparations of virtualizing the dpu_plane rip out debugfs support
> > > from dpu_plane (as it is mostly used to expose plane's pipe registers).
> > > Also move disable_danger file to danger/ debugfs subdir where it
> > > belongs.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > I am yet to review the second part of the virtual plane series to
> > understand why this removal
> > is necessary so I might be missing something.
>
> See below
>
> >
> > The plane's debugfs holds useful information to check a few things
> > rightaway.
> >
> > So if there is some misconfiguration or corruption in addition to the
> > plane state,
> > this is good to check.
> >
> > localhost /sys/kernel/debug/dri/1/plane35 # cat src_blk
> > [4000] 03000556 00000000 00000000 03000556
> > [4010] 00000000 00414000 00000000 0040e000
> > [4020] 00000000 00001600 00000080 00000000
> > [4030] 800236ff 03010002 80000001 00000000
> > [4040] 00000000 00000030 000c0087 00000707
> > [4050] 00000000 00000000 00000000 00000000
> > [4060] 0000ffff 00000000 00000000 00000001
> > [4070] 00000000 44556677 00112233 00000000
> > [4080] 00000000 00000000 00000000 00000000
> > [4090] 00000000 00000000 00000000 00000000
> > [40a0] 00000000 00414000 00000000 0040e000
> > [40b0] 00000000 00000000 00000000 00000000
> > [40c0] 00000000 00000000 00000000 00000000
> > [40d0] 0003f820 00000000 00000000 00000000
> > [40e0] 0003e2c4 00000000 00000000 00000000
> > [40f0] 000f000f 00010330 02e402e4 00000000
> > [4100] 00000000 00000000 03000556 00000000
> > [4110] 00000000 00000000 03000556 00000000
> > [4120] 00000000 00000000 03000556 00000000
> > [4130] 00000000 0000000f 00000000 0000000f
> > [4140] 00000000 00000000 00000000 00000000
> >
> > So I would like to keep this functionality unless there is some
> > compelling reason
> > to remove this.
>
> Ok, I'll take a look if I can keep it or rework somehow.
> The problem is that if you have the plane is virtual, there is no
> strong plane <-> sspp mapping. Consider wide planes, where you'd have
> two SSPPs per single plane.
>
> I think it would make sense to move src_blk to global namespace (as
> ssppN_src) and then add a file giving plane -> sspp relationship.

+1 for moving to per sspp debugfs files, decoupled from plane..

Also, we should implement atomic_print_state() so that we can see the
plane->sspp mapping in $debugfs/dri/N/state

BR,
-R

> >
> > BTW, are you going to submit the second half as a new series now that
> > most
> > of the first one has been reviewed?
> >
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   | 123 ++++++++--------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h   |  69 ---------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 171 +---------------------
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |   6 +
> > >  4 files changed, 69 insertions(+), 300 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > index ae48f41821cf..fe33273cdf57 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > @@ -101,84 +101,85 @@ static int dpu_debugfs_safe_stats_show(struct
> > > seq_file *s, void *v)
> > >  }
> > >  DEFINE_SHOW_ATTRIBUTE(dpu_debugfs_safe_stats);
> > >
> > > -static void dpu_debugfs_danger_init(struct dpu_kms *dpu_kms,
> > > -             struct dentry *parent)
> > > +static ssize_t _dpu_plane_danger_read(struct file *file,
> > > +                     char __user *buff, size_t count, loff_t *ppos)
> > >  {
> > > -     struct dentry *entry = debugfs_create_dir("danger", parent);
> > > +     struct dpu_kms *kms = file->private_data;
> > > +     int len;
> > > +     char buf[40];
> > >
> > > -     debugfs_create_file("danger_status", 0600, entry,
> > > -                     dpu_kms, &dpu_debugfs_danger_stats_fops);
> > > -     debugfs_create_file("safe_status", 0600, entry,
> > > -                     dpu_kms, &dpu_debugfs_safe_stats_fops);
> > > +     len = scnprintf(buf, sizeof(buf), "%d\n", !kms->has_danger_ctrl);
> > > +
> > > +     return simple_read_from_buffer(buff, count, ppos, buf, len);
> > >  }
> > >
> > > -static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
> > > +static void _dpu_plane_set_danger_state(struct dpu_kms *kms, bool
> > > enable)
> > >  {
> > > -     struct dpu_debugfs_regset32 *regset = s->private;
> > > -     struct dpu_kms *dpu_kms = regset->dpu_kms;
> > > -     void __iomem *base;
> > > -     uint32_t i, addr;
> > > -
> > > -     if (!dpu_kms->mmio)
> > > -             return 0;
> > > -
> > > -     base = dpu_kms->mmio + regset->offset;
> > > -
> > > -     /* insert padding spaces, if needed */
> > > -     if (regset->offset & 0xF) {
> > > -             seq_printf(s, "[%x]", regset->offset & ~0xF);
> > > -             for (i = 0; i < (regset->offset & 0xF); i += 4)
> > > -                     seq_puts(s, "         ");
> > > -     }
> > > -
> > > -     pm_runtime_get_sync(&dpu_kms->pdev->dev);
> > > -
> > > -     /* main register output */
> > > -     for (i = 0; i < regset->blk_len; i += 4) {
> > > -             addr = regset->offset + i;
> > > -             if ((addr & 0xF) == 0x0)
> > > -                     seq_printf(s, i ? "\n[%x]" : "[%x]", addr);
> > > -             seq_printf(s, " %08x", readl_relaxed(base + i));
> > > +     struct drm_plane *plane;
> > > +
> > > +     drm_for_each_plane(plane, kms->dev) {
> > > +             if (plane->fb && plane->state) {
> > > +                     dpu_plane_danger_signal_ctrl(plane, enable);
> > > +                     DPU_DEBUG("plane:%d img:%dx%d ",
> > > +                             plane->base.id, plane->fb->width,
> > > +                             plane->fb->height);
> > > +                     DPU_DEBUG("src[%d,%d,%d,%d] dst[%d,%d,%d,%d]\n",
> > > +                             plane->state->src_x >> 16,
> > > +                             plane->state->src_y >> 16,
> > > +                             plane->state->src_w >> 16,
> > > +                             plane->state->src_h >> 16,
> > > +                             plane->state->crtc_x, plane->state->crtc_y,
> > > +                             plane->state->crtc_w, plane->state->crtc_h);
> > > +             } else {
> > > +                     DPU_DEBUG("Inactive plane:%d\n", plane->base.id);
> > > +             }
> > >       }
> > > -     seq_puts(s, "\n");
> > > -     pm_runtime_put_sync(&dpu_kms->pdev->dev);
> > > -
> > > -     return 0;
> > >  }
> > >
> > > -static int dpu_debugfs_open_regset32(struct inode *inode,
> > > -             struct file *file)
> > > +static ssize_t _dpu_plane_danger_write(struct file *file,
> > > +                 const char __user *user_buf, size_t count, loff_t *ppos)
> > >  {
> > > -     return single_open(file, _dpu_debugfs_show_regset32,
> > > inode->i_private);
> > > -}
> > > +     struct dpu_kms *kms = file->private_data;
> > > +     int disable_panic;
> > > +     int ret;
> > >
> > > -static const struct file_operations dpu_fops_regset32 = {
> > > -     .open =         dpu_debugfs_open_regset32,
> > > -     .read =         seq_read,
> > > -     .llseek =       seq_lseek,
> > > -     .release =      single_release,
> > > -};
> > > +     ret = kstrtouint_from_user(user_buf, count, 0, &disable_panic);
> > > +     if (ret)
> > > +             return ret;
> > >
> > > -void dpu_debugfs_setup_regset32(struct dpu_debugfs_regset32 *regset,
> > > -             uint32_t offset, uint32_t length, struct dpu_kms *dpu_kms)
> > > -{
> > > -     if (regset) {
> > > -             regset->offset = offset;
> > > -             regset->blk_len = length;
> > > -             regset->dpu_kms = dpu_kms;
> > > +     if (disable_panic) {
> > > +             /* Disable panic signal for all active pipes */
> > > +             DPU_DEBUG("Disabling danger:\n");
> > > +             _dpu_plane_set_danger_state(kms, false);
> > > +             kms->has_danger_ctrl = false;
> > > +     } else {
> > > +             /* Enable panic signal for all active pipes */
> > > +             DPU_DEBUG("Enabling danger:\n");
> > > +             kms->has_danger_ctrl = true;
> > > +             _dpu_plane_set_danger_state(kms, true);
> > >       }
> > > +
> > > +     return count;
> > >  }
> > >
> > > -void dpu_debugfs_create_regset32(const char *name, umode_t mode,
> > > -             void *parent, struct dpu_debugfs_regset32 *regset)
> > > +static const struct file_operations dpu_plane_danger_enable = {
> > > +     .open = simple_open,
> > > +     .read = _dpu_plane_danger_read,
> > > +     .write = _dpu_plane_danger_write,
> > > +};
> > > +
> > > +static void dpu_debugfs_danger_init(struct dpu_kms *dpu_kms,
> > > +             struct dentry *parent)
> > >  {
> > > -     if (!name || !regset || !regset->dpu_kms || !regset->blk_len)
> > > -             return;
> > > +     struct dentry *entry = debugfs_create_dir("danger", parent);
> > >
> > > -     /* make sure offset is a multiple of 4 */
> > > -     regset->offset = round_down(regset->offset, 4);
> > > +     debugfs_create_file("danger_status", 0600, entry,
> > > +                     dpu_kms, &dpu_debugfs_danger_stats_fops);
> > > +     debugfs_create_file("safe_status", 0600, entry,
> > > +                     dpu_kms, &dpu_debugfs_safe_stats_fops);
> > > +     debugfs_create_file("disable_danger", 0600, entry,
> > > +                     dpu_kms, &dpu_plane_danger_enable);
> > >
> > > -     debugfs_create_file(name, mode, parent, regset, &dpu_fops_regset32);
> > >  }
> > >
> > >  static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor
> > > *minor)
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > index 323a6bce9e64..ab65c817eb42 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > > @@ -166,75 +166,6 @@ struct dpu_global_state
> > >  struct dpu_global_state
> > >       *__must_check dpu_kms_get_global_state(struct drm_atomic_state *s);
> > >
> > > -/**
> > > - * Debugfs functions - extra helper functions for debugfs support
> > > - *
> > > - * Main debugfs documentation is located at,
> > > - *
> > > - * Documentation/filesystems/debugfs.rst
> > > - *
> > > - * @dpu_debugfs_setup_regset32: Initialize data for
> > > dpu_debugfs_create_regset32
> > > - * @dpu_debugfs_create_regset32: Create 32-bit register dump file
> > > - * @dpu_debugfs_get_root: Get root dentry for DPU_KMS's debugfs node
> > > - */
> > > -
> > > -/**
> > > - * Companion structure for dpu_debugfs_create_regset32. Do not
> > > initialize the
> > > - * members of this structure explicitly; use
> > > dpu_debugfs_setup_regset32 instead.
> > > - */
> > > -struct dpu_debugfs_regset32 {
> > > -     uint32_t offset;
> > > -     uint32_t blk_len;
> > > -     struct dpu_kms *dpu_kms;
> > > -};
> > > -
> > > -/**
> > > - * dpu_debugfs_setup_regset32 - Initialize register block definition
> > > for debugfs
> > > - * This function is meant to initialize dpu_debugfs_regset32
> > > structures for use
> > > - * with dpu_debugfs_create_regset32.
> > > - * @regset: opaque register definition structure
> > > - * @offset: sub-block offset
> > > - * @length: sub-block length, in bytes
> > > - * @dpu_kms: pointer to dpu kms structure
> > > - */
> > > -void dpu_debugfs_setup_regset32(struct dpu_debugfs_regset32 *regset,
> > > -             uint32_t offset, uint32_t length, struct dpu_kms *dpu_kms);
> > > -
> > > -/**
> > > - * dpu_debugfs_create_regset32 - Create register read back file for
> > > debugfs
> > > - *
> > > - * This function is almost identical to the standard
> > > debugfs_create_regset32()
> > > - * function, with the main difference being that a list of register
> > > - * names/offsets do not need to be provided. The 'read' function
> > > simply outputs
> > > - * sequential register values over a specified range.
> > > - *
> > > - * Similar to the related debugfs_create_regset32 API, the structure
> > > pointed to
> > > - * by regset needs to persist for the lifetime of the created file.
> > > The calling
> > > - * code is responsible for initialization/management of this
> > > structure.
> > > - *
> > > - * The structure pointed to by regset is meant to be opaque. Please
> > > use
> > > - * dpu_debugfs_setup_regset32 to initialize it.
> > > - *
> > > - * @name:   File name within debugfs
> > > - * @mode:   File mode within debugfs
> > > - * @parent: Parent directory entry within debugfs, can be NULL
> > > - * @regset: Pointer to persistent register block definition
> > > - */
> > > -void dpu_debugfs_create_regset32(const char *name, umode_t mode,
> > > -             void *parent, struct dpu_debugfs_regset32 *regset);
> > > -
> > > -/**
> > > - * dpu_debugfs_get_root - Return root directory entry for KMS's
> > > debugfs
> > > - *
> > > - * The return value should be passed as the 'parent' argument to
> > > subsequent
> > > - * debugfs create calls.
> > > - *
> > > - * @dpu_kms: Pointer to DPU's KMS structure
> > > - *
> > > - * Return: dentry pointer for DPU's debugfs location
> > > - */
> > > -void *dpu_debugfs_get_root(struct dpu_kms *dpu_kms);
> > > -
> > >  /**
> > >   * DPU info management functions
> > >   * These functions/definitions allow for building up a 'dpu_info'
> > > structure
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > index d8018e664925..42bcde1ddd0f 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -108,13 +108,6 @@ struct dpu_plane {
> > >       bool is_virtual;
> > >       struct list_head mplane_list;
> > >       struct dpu_mdss_cfg *catalog;
> > > -
> > > -     /* debugfs related stuff */
> > > -     struct dentry *debugfs_root;
> > > -     struct dpu_debugfs_regset32 debugfs_src;
> > > -     struct dpu_debugfs_regset32 debugfs_scaler;
> > > -     struct dpu_debugfs_regset32 debugfs_csc;
> > > -     bool debugfs_default_scale;
> > >  };
> > >
> > >  static const uint64_t supported_format_modifiers[] = {
> > > @@ -1343,7 +1336,7 @@ static void dpu_plane_reset(struct drm_plane
> > > *plane)
> > >  }
> > >
> > >  #ifdef CONFIG_DEBUG_FS
> > > -static void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool
> > > enable)
> > > +void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool
> > > enable)
> > >  {
> > >       struct dpu_plane *pdpu = to_dpu_plane(plane);
> > >       struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> > > @@ -1355,168 +1348,8 @@ static void
> > > dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
> > >       _dpu_plane_set_qos_ctrl(plane, enable, DPU_PLANE_QOS_PANIC_CTRL);
> > >       pm_runtime_put_sync(&dpu_kms->pdev->dev);
> > >  }
> > > -
> > > -static ssize_t _dpu_plane_danger_read(struct file *file,
> > > -                     char __user *buff, size_t count, loff_t *ppos)
> > > -{
> > > -     struct dpu_kms *kms = file->private_data;
> > > -     int len;
> > > -     char buf[40];
> > > -
> > > -     len = scnprintf(buf, sizeof(buf), "%d\n", !kms->has_danger_ctrl);
> > > -
> > > -     return simple_read_from_buffer(buff, count, ppos, buf, len);
> > > -}
> > > -
> > > -static void _dpu_plane_set_danger_state(struct dpu_kms *kms, bool
> > > enable)
> > > -{
> > > -     struct drm_plane *plane;
> > > -
> > > -     drm_for_each_plane(plane, kms->dev) {
> > > -             if (plane->fb && plane->state) {
> > > -                     dpu_plane_danger_signal_ctrl(plane, enable);
> > > -                     DPU_DEBUG("plane:%d img:%dx%d ",
> > > -                             plane->base.id, plane->fb->width,
> > > -                             plane->fb->height);
> > > -                     DPU_DEBUG("src[%d,%d,%d,%d] dst[%d,%d,%d,%d]\n",
> > > -                             plane->state->src_x >> 16,
> > > -                             plane->state->src_y >> 16,
> > > -                             plane->state->src_w >> 16,
> > > -                             plane->state->src_h >> 16,
> > > -                             plane->state->crtc_x, plane->state->crtc_y,
> > > -                             plane->state->crtc_w, plane->state->crtc_h);
> > > -             } else {
> > > -                     DPU_DEBUG("Inactive plane:%d\n", plane->base.id);
> > > -             }
> > > -     }
> > > -}
> > > -
> > > -static ssize_t _dpu_plane_danger_write(struct file *file,
> > > -                 const char __user *user_buf, size_t count, loff_t *ppos)
> > > -{
> > > -     struct dpu_kms *kms = file->private_data;
> > > -     int disable_panic;
> > > -     int ret;
> > > -
> > > -     ret = kstrtouint_from_user(user_buf, count, 0, &disable_panic);
> > > -     if (ret)
> > > -             return ret;
> > > -
> > > -     if (disable_panic) {
> > > -             /* Disable panic signal for all active pipes */
> > > -             DPU_DEBUG("Disabling danger:\n");
> > > -             _dpu_plane_set_danger_state(kms, false);
> > > -             kms->has_danger_ctrl = false;
> > > -     } else {
> > > -             /* Enable panic signal for all active pipes */
> > > -             DPU_DEBUG("Enabling danger:\n");
> > > -             kms->has_danger_ctrl = true;
> > > -             _dpu_plane_set_danger_state(kms, true);
> > > -     }
> > > -
> > > -     return count;
> > > -}
> > > -
> > > -static const struct file_operations dpu_plane_danger_enable = {
> > > -     .open = simple_open,
> > > -     .read = _dpu_plane_danger_read,
> > > -     .write = _dpu_plane_danger_write,
> > > -};
> > > -
> > > -static int _dpu_plane_init_debugfs(struct drm_plane *plane)
> > > -{
> > > -     struct dpu_plane *pdpu = to_dpu_plane(plane);
> > > -     struct dpu_kms *kms = _dpu_plane_get_kms(plane);
> > > -     const struct dpu_sspp_cfg *cfg = pdpu->pipe_hw->cap;
> > > -     const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
> > > -
> > > -     /* create overall sub-directory for the pipe */
> > > -     pdpu->debugfs_root =
> > > -             debugfs_create_dir(plane->name,
> > > -                             plane->dev->primary->debugfs_root);
> > > -
> > > -     /* don't error check these */
> > > -     debugfs_create_xul("features", 0600,
> > > -                     pdpu->debugfs_root, (unsigned long
> > > *)&pdpu->pipe_hw->cap->features);
> > > -
> > > -     /* add register dump support */
> > > -     dpu_debugfs_setup_regset32(&pdpu->debugfs_src,
> > > -                     sblk->src_blk.base + cfg->base,
> > > -                     sblk->src_blk.len,
> > > -                     kms);
> > > -     dpu_debugfs_create_regset32("src_blk", 0400,
> > > -                     pdpu->debugfs_root, &pdpu->debugfs_src);
> > > -
> > > -     if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
> > > -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
> > > -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
> > > -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED4)) {
> > > -             dpu_debugfs_setup_regset32(&pdpu->debugfs_scaler,
> > > -                             sblk->scaler_blk.base + cfg->base,
> > > -                             sblk->scaler_blk.len,
> > > -                             kms);
> > > -             dpu_debugfs_create_regset32("scaler_blk", 0400,
> > > -                             pdpu->debugfs_root,
> > > -                             &pdpu->debugfs_scaler);
> > > -             debugfs_create_bool("default_scaling",
> > > -                             0600,
> > > -                             pdpu->debugfs_root,
> > > -                             &pdpu->debugfs_default_scale);
> > > -     }
> > > -
> > > -     if (cfg->features & BIT(DPU_SSPP_CSC) ||
> > > -                     cfg->features & BIT(DPU_SSPP_CSC_10BIT)) {
> > > -             dpu_debugfs_setup_regset32(&pdpu->debugfs_csc,
> > > -                             sblk->csc_blk.base + cfg->base,
> > > -                             sblk->csc_blk.len,
> > > -                             kms);
> > > -             dpu_debugfs_create_regset32("csc_blk", 0400,
> > > -                             pdpu->debugfs_root, &pdpu->debugfs_csc);
> > > -     }
> > > -
> > > -     debugfs_create_u32("xin_id",
> > > -                     0400,
> > > -                     pdpu->debugfs_root,
> > > -                     (u32 *) &cfg->xin_id);
> > > -     debugfs_create_u32("clk_ctrl",
> > > -                     0400,
> > > -                     pdpu->debugfs_root,
> > > -                     (u32 *) &cfg->clk_ctrl);
> > > -     debugfs_create_x32("creq_vblank",
> > > -                     0600,
> > > -                     pdpu->debugfs_root,
> > > -                     (u32 *) &sblk->creq_vblank);
> > > -     debugfs_create_x32("danger_vblank",
> > > -                     0600,
> > > -                     pdpu->debugfs_root,
> > > -                     (u32 *) &sblk->danger_vblank);
> > > -
> > > -     debugfs_create_file("disable_danger",
> > > -                     0600,
> > > -                     pdpu->debugfs_root,
> > > -                     kms, &dpu_plane_danger_enable);
> > > -
> > > -     return 0;
> > > -}
> > > -#else
> > > -static int _dpu_plane_init_debugfs(struct drm_plane *plane)
> > > -{
> > > -     return 0;
> > > -}
> > >  #endif
> > >
> > > -static int dpu_plane_late_register(struct drm_plane *plane)
> > > -{
> > > -     return _dpu_plane_init_debugfs(plane);
> > > -}
> > > -
> > > -static void dpu_plane_early_unregister(struct drm_plane *plane)
> > > -{
> > > -     struct dpu_plane *pdpu = to_dpu_plane(plane);
> > > -
> > > -     debugfs_remove_recursive(pdpu->debugfs_root);
> > > -}
> > > -
> > >  static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
> > >               uint32_t format, uint64_t modifier)
> > >  {
> > > @@ -1541,8 +1374,6 @@ static const struct drm_plane_funcs
> > > dpu_plane_funcs = {
> > >               .reset = dpu_plane_reset,
> > >               .atomic_duplicate_state = dpu_plane_duplicate_state,
> > >               .atomic_destroy_state = dpu_plane_destroy_state,
> > > -             .late_register = dpu_plane_late_register,
> > > -             .early_unregister = dpu_plane_early_unregister,
> > >               .format_mod_supported = dpu_plane_format_mod_supported,
> > >  };
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > > index 1ee5ca5fcdf7..9d51dad5c6a5 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> > > @@ -126,4 +126,10 @@ void dpu_plane_clear_multirect(const struct
> > > drm_plane_state *drm_state);
> > >  int dpu_plane_color_fill(struct drm_plane *plane,
> > >               uint32_t color, uint32_t alpha);
> > >
> > > +#ifdef CONFIG_DEBUG_FS
> > > +void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool
> > > enable);
> > > +#else
> > > +static inline void dpu_plane_danger_signal_ctrl(struct drm_plane
> > > *plane, bool enable) {}
> > > +#endif
> > > +
> > >  #endif /* _DPU_PLANE_H_ */
>
>
>
> --
> With best wishes
> Dmitry
