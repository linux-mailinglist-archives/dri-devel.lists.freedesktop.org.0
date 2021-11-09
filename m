Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7683144B3DE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 21:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663506E0D6;
	Tue,  9 Nov 2021 20:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C20D6E1AA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 20:21:35 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id bi29so327260qkb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 12:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=koMbe5cQdoL2M8hKeOCX2QG0+PW4fTs1S2rI3yitKSg=;
 b=SkkdRpJnHAc1qzpwx2VCb0Qh3XyD5q9N5PtJZX9ApO42i/mTDOEgJMo3iJfr1Xbtv5
 465aoxNQxAzlbccacMD2ryImwfYujP/zS0X05LGtUZ6opNcS6aHCdk4EgsDYpEuhgxrv
 397+siHcO3UvqrYpVBOxyBO9v1CLfWf18aZM7xivy4QioWIjiEmoj6aG+KV5oG1aDSo5
 /SsQ9eg6RWg2Bva4/ivsB937S3r8/PuIeAgTS8G+yqrwtR5MWoh/+w5es0xL/8o3Og7+
 /X1ADPUuYptCRWj0wJh4reGGcgot7Ftr/MGmmVBC0acZap6omdtVtowjx/mqu6BRosTZ
 5EHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=koMbe5cQdoL2M8hKeOCX2QG0+PW4fTs1S2rI3yitKSg=;
 b=GLH9SsseLP4GhMJcXFMZZRKS57nAXfDVMNh2AX5gBro7xiyJmkm0qzRthlvkFpd7nR
 yEkyUgT92fZHBkDa3IMyU17zsnwgUQ44FCqNIMwpZCdIAuzL2BiBD8izN+o2zxWZlfsA
 v9l6GFY+0YUuFk0njD5/WBOIGz6zbycDdVViPPLRZnLxCBQdUxKghbQsviAgTUQDJVBP
 aL3coPw41V1jZ/i94pQ9421xLqrAjk6jTjZ+OVA32it6krPae+BLVlM+nQf4/hkc9W3l
 JF3tnImIBSLO0biMDEHnaeRY0/bTcxUjH1Kq22sH1XwzBQFzct8DSjSgfPO4cgkglmdS
 FRWA==
X-Gm-Message-State: AOAM533+qyu+EfLeqYaL+kZTsENvNCurzOBATDnCAe9ZDHZuTN9xt9s0
 aF3LC5nAYa/nxiyqk7ZL3xga7RNPU9GF2qWfUrhl0w==
X-Google-Smtp-Source: ABdhPJxkEYFDHFdvCi0LFtrUlgQyV5/BYKVCtZlrc+EZt+YNcBcc9bsqXLFA6YLOsvEP4AmllcJybt8MqYFUkydLM28=
X-Received: by 2002:a05:620a:3197:: with SMTP id
 bi23mr8132296qkb.478.1636489294644; 
 Tue, 09 Nov 2021 12:21:34 -0800 (PST)
MIME-Version: 1.0
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
 <20210705012115.4179824-17-dmitry.baryshkov@linaro.org>
 <3a48e580272ceb9d5d499455d8f35630@codeaurora.org>
In-Reply-To: <3a48e580272ceb9d5d499455d8f35630@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Nov 2021 23:21:23 +0300
Message-ID: <CAA8EJpoKiu32oqGLpus-W8Z1ifKKVyAyOOp9kPF6NnxRLS6+fw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 16/22] drm/msm/dpu: do not limit the zpos
 property
To: abhinavk@codeaurora.org
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 9 Nov 2021 at 23:15, <abhinavk@codeaurora.org> wrote:
>
> On 2021-07-04 18:21, Dmitry Baryshkov wrote:
> > Stop limiting zpos property values, we use normalized_zpos anyway. And
> > nothing stops userspace from assigning several planes to a single zpos
> > (it is a userspace bug, but the kernel is forgiving about it).
>
> Userspace assigning several planes to a single zpos was intended to
> identify
> cases where src split can be used. Downstream does not use normalized
> zpos,
> hence it did not come across as a bug but mostly as a way to identify
> when
> usermode needs src split to be enabled based on the composition
> strategy.
>
> We can talk about that more in the rest of the patches of this series.
>
> For this one, I only have a couple of questions:
>
> 1) Across different vendors, some have gone with limiting the zpos and
> some have gone with
> the max, so is there an issue with sticking with the max_blend_stages
> limit?
>
> 2) If there is no hard reason to make this change, I think its better to
> keep it the way it is.

Short answer to both questions: we want to have more planes than the
max_blend_stages. So we should remove the limit.

Consider this to be a unification with MDP5, which uses 255 here.

>
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 11 +----------
> >  1 file changed, 1 insertion(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 8ed7b8f0db69..3850f2714bf3 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -44,7 +44,6 @@
> >  #define DPU_NAME_SIZE  12
> >
> >  #define DPU_PLANE_COLOR_FILL_FLAG    BIT(31)
> > -#define DPU_ZPOS_MAX 255
> >
> >  /* multirect rect index */
> >  enum {
> > @@ -1374,7 +1373,6 @@ struct drm_plane *dpu_plane_init(struct
> > drm_device *dev,
> >       struct dpu_plane *pdpu;
> >       struct msm_drm_private *priv = dev->dev_private;
> >       struct dpu_kms *kms = to_dpu_kms(priv->kms);
> > -     int zpos_max = DPU_ZPOS_MAX;
> >       uint32_t num_formats;
> >       int ret = -EINVAL;
> >
> > @@ -1412,14 +1410,7 @@ struct drm_plane *dpu_plane_init(struct
> > drm_device *dev,
> >
> >       pdpu->catalog = kms->catalog;
> >
> > -     if (kms->catalog->mixer_count &&
> > -             kms->catalog->mixer[0].sblk->maxblendstages) {
> > -             zpos_max = kms->catalog->mixer[0].sblk->maxblendstages - 1;
> > -             if (zpos_max > DPU_STAGE_MAX - DPU_STAGE_0 - 1)
> > -                     zpos_max = DPU_STAGE_MAX - DPU_STAGE_0 - 1;
> > -     }
> > -
> > -     ret = drm_plane_create_zpos_property(plane, 0, 0, zpos_max);
> > +     ret = drm_plane_create_zpos_property(plane, 0, 0, 255);
> >       if (ret)
> >               DPU_ERROR("failed to install zpos property, rc = %d\n", ret);



-- 
With best wishes
Dmitry
