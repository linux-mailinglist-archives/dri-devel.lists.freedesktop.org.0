Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E096C1E9638
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 10:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A8E89FA7;
	Sun, 31 May 2020 08:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59C789FA6;
 Sun, 31 May 2020 08:13:51 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id y11so2995966plt.12;
 Sun, 31 May 2020 01:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6uR+wd/weKraWD0vMBYS18dzk5u+Kj+FmTqA29PPa8A=;
 b=ahdGhBN/XSdHjOAjGB6Ws7NB7SrMve5vxOKpjuHzSLkHfamgJTzfpf6yHtC1v2HGv6
 MNRFxsu3zx8lWwu0rFFhYrFMsjd1GRccXNao5lsb1Kjrto3ht1nTWTEKIhSQBXLiIaZP
 fUdIX30Qe7mOBAEhhE1IqZO8dmTLsAH5pzHyw7IBpJCSDU2oAZCdSUm/Qqsxbb076atm
 Qy1FSVtX3CmldFt3Xxx5rtlzasbO+9P8JoCsqhlPgIW7Rt281DVy6B0+5Wej2dTP7bSb
 xXkT1hPVutUb1ak4mv9VNnmEoGBFjAYEhG/cFGZ3DoPUl1FC3xlmV74tviLvdDbR13ha
 ywDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6uR+wd/weKraWD0vMBYS18dzk5u+Kj+FmTqA29PPa8A=;
 b=SQI5jbCBbF1aw+HD7h6HxKmVF14T37yEiUffnx2LZuv+fDQAQDSNcdMSNi0oR+ijQQ
 1Vfc78A6fPzK1Odu71Wq5Cix77C9XILl+vAyLcDxSpvQ0dnmm0d9jjm1y2WtkXsUKMzf
 1kQcZG6MIKR87ozRKRE8Qg+mbX7BKBHwQm0Lvmrrs1u5AZeSS18jMeTw3qWVTK2AwT2l
 JqUOBoBzJ0u99O9WQn02BaBn+KEWCoAJozyr1oA1GbIe/yssA/UfYATqVj3ZX5FgyB7D
 x1LY6ivL83YMrcsvl33ORQcYyRVPrFi2nLXb/DRIF+L+kfHM7aY33zjlQZT1dcoyQ95E
 K72Q==
X-Gm-Message-State: AOAM533RVbCM6rnwpyzyKwzQofvho+dB8EBN+RlRLbcYIyserEAmUnwd
 wQIAc3cvEjlhFjPUBWm2EB0=
X-Google-Smtp-Source: ABdhPJySbQRsGNDNJDhaQFpVemfVXzSf4docfz/J8J61nW0SQJn99LqOETMcsyHd89D2TaZ0hpJhpQ==
X-Received: by 2002:a17:902:ee12:: with SMTP id
 z18mr14281390plb.308.1590912831140; 
 Sun, 31 May 2020 01:13:51 -0700 (PDT)
Received: from realwakka-Lenovo-IdeaPad-S340-14API ([61.83.141.141])
 by smtp.gmail.com with ESMTPSA id n21sm4094931pjo.25.2020.05.31.01.13.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 31 May 2020 01:13:50 -0700 (PDT)
Date: Sun, 31 May 2020 17:13:39 +0900
From: Sidong Yang <realwakka@gmail.com>
To: David Airlie <airlied@redhat.com>
Subject: Re: [PATCH] drm/qxl: Replace deprecated function in qxl_display
Message-ID: <20200531081339.GA16336@realwakka-Lenovo-IdeaPad-S340-14API>
References: <20200523160156.32511-1-realwakka@gmail.com>
 <CAMwc25pf=wmtQcog7D8GUJ6zz6ascFkExS+bsyA2E4chz-UcuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMwc25pf=wmtQcog7D8GUJ6zz6ascFkExS+bsyA2E4chz-UcuQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 spice-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 24, 2020 at 07:42:25AM +1000, David Airlie wrote:
> On Sun, May 24, 2020 at 2:02 AM Sidong Yang <realwakka@gmail.com> wrote:
> >
> > Hi, Dave.
> >
> > I'm a newbie kernel developer interested in qxl driver. And I want to participate in
> > contributing for QXL module.
> > I wrote some simple patch for refactoring task found in todos in gpu documentation.
> > I want to know it's okay to contribute and write some patch for qxl module.
> > If this patch is wrong, please give me some advice for me.
> > Or if you have some simple task for me, I'll be glad to do it.
> > Thanks.
> 
> Hi Sidong,
> 
> The best way to start is probably to email dri-devel list rather than
> just me, there are a few more people there who can help with
> onboarding and accepting patches.
> 
> For QXL, Gerd Hoffmann (kraxel@redhat.com) is also worth cc'ing as he
> is mostly maintaining it at the moment.
> 
> Dave.
>

Thanks so much for advice Dave.
I'll add cc for qxl maintainer and dri-devel in next patch.

Sidong.
> 
> >
> > Sincerely,
> > Sidong.
> >
> > Replace deprecated function drm_modeset_lock/unlock_all with
> > helper function DRM_MODESET_LOCK_ALL_BEGIN/END.
> >
> > Signed-off-by: Sidong Yang <realwakka@gmail.com>
> > ---
> >  drivers/gpu/drm/qxl/qxl_display.c | 21 +++++++++++----------
> >  1 file changed, 11 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
> > index 1082cd5d2fd4..07e164cee868 100644
> > --- a/drivers/gpu/drm/qxl/qxl_display.c
> > +++ b/drivers/gpu/drm/qxl/qxl_display.c
> > @@ -162,7 +162,8 @@ static void qxl_update_offset_props(struct qxl_device *qdev)
> >  void qxl_display_read_client_monitors_config(struct qxl_device *qdev)
> >  {
> >         struct drm_device *dev = &qdev->ddev;
> > -       int status, retries;
> > +       struct drm_modeset_acquire_ctx ctx;
> > +       int status, retries, ret;
> >
> >         for (retries = 0; retries < 10; retries++) {
> >                 status = qxl_display_copy_rom_client_monitors_config(qdev);
> > @@ -183,9 +184,9 @@ void qxl_display_read_client_monitors_config(struct qxl_device *qdev)
> >                 return;
> >         }
> >
> > -       drm_modeset_lock_all(dev);
> > +       DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
> >         qxl_update_offset_props(qdev);
> > -       drm_modeset_unlock_all(dev);
> > +       DRM_MODESET_LOCK_ALL_END(ctx, ret);
> >         if (!drm_helper_hpd_irq_event(dev)) {
> >                 /* notify that the monitor configuration changed, to
> >                    adjust at the arbitrary resolution */
> > @@ -403,18 +404,17 @@ static int qxl_framebuffer_surface_dirty(struct drm_framebuffer *fb,
> >         struct qxl_device *qdev = to_qxl(fb->dev);
> >         struct drm_clip_rect norect;
> >         struct qxl_bo *qobj;
> > +       struct drm_modeset_acquire_ctx ctx;
> >         bool is_primary;
> > -       int inc = 1;
> > +       int inc = 1, ret;
> >
> > -       drm_modeset_lock_all(fb->dev);
> > +       DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE, ret);
> >
> >         qobj = gem_to_qxl_bo(fb->obj[0]);
> >         /* if we aren't primary surface ignore this */
> >         is_primary = qobj->shadow ? qobj->shadow->is_primary : qobj->is_primary;
> > -       if (!is_primary) {
> > -               drm_modeset_unlock_all(fb->dev);
> > -               return 0;
> > -       }
> > +       if (!is_primary)
> > +               goto out_lock_end;
> >
> >         if (!num_clips) {
> >                 num_clips = 1;
> > @@ -430,7 +430,8 @@ static int qxl_framebuffer_surface_dirty(struct drm_framebuffer *fb,
> >         qxl_draw_dirty_fb(qdev, fb, qobj, flags, color,
> >                           clips, num_clips, inc, 0);
> >
> > -       drm_modeset_unlock_all(fb->dev);
> > +out_lock_end:
> > +       DRM_MODESET_LOCK_ALL_END(ctx, ret);
> >
> >         return 0;
> >  }
> > --
> > 2.17.1
> >
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
