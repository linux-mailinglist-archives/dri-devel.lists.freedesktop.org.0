Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72732492F0F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 21:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2CD910E23E;
	Tue, 18 Jan 2022 20:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B3E10E227;
 Tue, 18 Jan 2022 20:13:51 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id w188so591505oiw.13;
 Tue, 18 Jan 2022 12:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XpoF/evSGX0quKC3ojWlZTaHsolih4rnXmKXZB109js=;
 b=n8WE+2ligzVvQw/ftNjaP0Jz2I1BoZsxvck3BbPbUE2kP5cwZAgXweL6E9LBtnJvJM
 1Z+RJvetEolqEgtBCwkmyNZ48Dog0SO60DM9dFkETYnmCh/xaeKp+fzwHVNyAqRLLemj
 tADuUkyCCcJF9iQFwMdF/H+JhaKN2HGHFsC0Lrrb/z9jS1Yf4Q0S1Z1+eIG0uoK+uvQP
 cCcvC6YIqQ0LRWQpCXPLkr3tCrYJUHYK4AiYcEkUXQUMOomxqNl5rupsd0ne7DWp4Hym
 lPUhAymAfQZHw0K887F/ecfeKL/1bSKmAffodTve5rE3R4E9fyHgU28XaLZco31L8wv8
 8YZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XpoF/evSGX0quKC3ojWlZTaHsolih4rnXmKXZB109js=;
 b=FBZrD8sVsx0fcVuYMmffcQdU+RVWLgDRlkT2w9uZDtgjD6ndzL7Su6+AJo5oJuuuY5
 CyPkoDfzLklcNVnWcSUFVEvwjpY9LFm67YvJhAbdmvttA/ee4BtEOITMrWi3el2HUj7g
 gOIwDLmK8F2StGJ1ArdSXTrb8jFWUaqN7SGXqxT7pDF8aoqA+ihVwdYug9ZXmOZLfEYI
 HQcASLPwBGmaMgnV8YLdXZbwO3fQQ0Mzhh5H/3ji0p1OMCCSwCeKt5AM7a4Y4DQMDblI
 azbNGvpFYKDz4ig9858lp/y5N4/8+T/oq5aX1JEdIni8R3fVAeeIxE+oc8UWDw90kqP+
 K9kQ==
X-Gm-Message-State: AOAM531oPaB9gCGE0SlyALSF4J5Y7Q7t5VgFf5bQi+g9jml9EX/GwR20
 EIf2CFeM5hjJqLWjmYVcl6dlzoO6vfZOt7+eOcs=
X-Google-Smtp-Source: ABdhPJxvYFNlS33t9IOQ2TLxkoGORZjhSHiI7VuLU21HAwY3nvkX4Ewt2BR5wBKsVHdRKvXiVgMiEuFSpuxy058YkGI=
X-Received: by 2002:a05:6808:68f:: with SMTP id k15mr176939oig.5.1642536830297; 
 Tue, 18 Jan 2022 12:13:50 -0800 (PST)
MIME-Version: 1.0
References: <1642507272-17545-1-git-send-email-lyz_cs@pku.edu.cn>
 <0ba294a9-1428-98cf-93b6-f9a195924a8f@amd.com>
In-Reply-To: <0ba294a9-1428-98cf-93b6-f9a195924a8f@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 18 Jan 2022 15:13:39 -0500
Message-ID: <CADnq5_M7SqB_OjKaYaqKvdC=8xAo=Zn4NFzAuPxZrKPEOJtU8w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Add missing pm_runtime_put_autosuspend
To: "Lazar, Lijo" <lijo.lazar@amd.com>
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
Cc: Tom St Denis <tom.stdenis@amd.com>, Jack Zhang <Jack.Zhang1@amd.com>,
 Yongzhi Liu <lyz_cs@pku.edu.cn>, Jingwen Chen <Jingwen.Chen2@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, Nirmoy Das <nirmoy.das@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Quan, Evan" <evan.quan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Strangely I can't seem to find this patch in my inbox or in
the dri-devel or amd-gfx archives.

Alex

On Tue, Jan 18, 2022 at 9:03 AM Lazar, Lijo <lijo.lazar@amd.com> wrote:
>
>
>
> On 1/18/2022 5:31 PM, Yongzhi Liu wrote:
> > pm_runtime_get_sync() increments the runtime PM usage counter even
> > when it returns an error code, thus a matching decrement is needed
> > on the error handling path to keep the counter balanced.
> >
> > Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
>
> Thanks!
>
> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > index 9aea1cc..4b950de 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > @@ -1120,8 +1120,10 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct file *f, char __user *buf,
> >               return -EINVAL;
> >
> >       r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
> > -     if (r < 0)
> > +     if (r < 0) {
> > +             pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> >               return r;
> > +     }
> >
> >       while (size) {
> >               uint32_t value;
> >
