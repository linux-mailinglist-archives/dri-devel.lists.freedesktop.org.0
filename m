Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7E8672737
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 19:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3140810E1F4;
	Wed, 18 Jan 2023 18:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B5C10E1F3;
 Wed, 18 Jan 2023 18:39:26 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id d16so17582342qtw.8;
 Wed, 18 Jan 2023 10:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hc8xSb6mvLFO0p8GBrdixp3f7/292PijsF4H07Tk3Kk=;
 b=FgGaYS3X0YH5pioDZfOfuh3a+w776MxTWj9YtUoFHjt/aAg/5QsOr4dpI04uboDxji
 MjEFzetNRBceikAp5GoXc/3nQswsW9YBdS0Q9IYpyZknurU/G2b1piJWe8JTwbP8dvmQ
 sLVd880x08golUMFnUcB2rupEzW23INoJvcNc/3v8vfi9rykX4MtotqcGf7IDvSWnnPT
 gkDTxnO8bNklkDof/SuQgQavS6/uFsFJD4N9rUQ2XFAgwaXc05h9WIH+E/XE/4shp4Oa
 9E7cSNjQR01J2OHHnq8LQhMbm7wd+ekbYhlSk8qbJU0GtAa3O+rswEb+I8aoWLEIF+b4
 5uCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hc8xSb6mvLFO0p8GBrdixp3f7/292PijsF4H07Tk3Kk=;
 b=ntqa6s1hydo+31JTcBYVc6/pzB9GpecK3111rznM86njpiJrJEsVrUa9LY07O+sKEt
 ybLdUZJiOQdtGo6V1CqgrZZxxt6a8l3jpZ5/mvqiqE0TSu9Y01UBbXQmhFrv30b5WRRF
 nKKz5LUT8sK2Et1/JxvL7dHeVZ/CwfG6JMtRdWm2Sxjgd6S1dPT7NkEAZ0rxhYneCkKY
 PDNRrtUtpXMYO8djae7LhwIN1v2HEwJRaraAoF6gGbIK+phwjXd72YdZLDfnwAwIF5gV
 9mSU476c+SgvTrgGSCB1eeJAUsNK9Y0314ymGfUaR70j7lzmnt9VqMC9XrsXemT0VHjw
 ifpg==
X-Gm-Message-State: AFqh2ko92Q4Ljl+WZIlgpkbHeO1fsMxnoMk3gIgJesXh0tVuGcg2wZkl
 FkBqfa2Ti92t0Q14Tk7IJlW0O31db0FanTaLduvsslk13Qc=
X-Google-Smtp-Source: AMrXdXtxyiwsWV5MU7fs9I4JfxCXt/gm2KY6oqDSdEl8priNKGwtzpSdpF1ztQEHRNo0WqhYgb8hSaGy6DlOEDf3pE8=
X-Received: by 2002:ac8:725a:0:b0:3a7:eb35:d177 with SMTP id
 l26-20020ac8725a000000b003a7eb35d177mr180217qtp.512.1674067165765; Wed, 18
 Jan 2023 10:39:25 -0800 (PST)
MIME-Version: 1.0
References: <20230118170624.9326-1-nirmoy.das@intel.com>
 <Y8g7zhs8DXmMZbSA@intel.com>
In-Reply-To: <Y8g7zhs8DXmMZbSA@intel.com>
From: Rodrigo Vivi <rodrigo.vivi@gmail.com>
Date: Wed, 18 Jan 2023 13:39:13 -0500
Message-ID: <CABVU7+vgzhtgDQbnL-2=0F9ppTQJuOh0mtONJJb4+PV-1ofxJg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Remove unused variable
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>
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
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 1:35 PM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> On Wed, Jan 18, 2023 at 06:06:24PM +0100, Nirmoy Das wrote:
> > Removed unused i915 var.
> >
> > Fixes: a273e95721e9 ("drm/i915: Allow switching away via vga-switcheroo if uninitialized")
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> and pushed to drm-misc-fixes.
>
> Thanks for the patch.

+dri-devel ml which was forgotten on the patch and on my reply.

sorry about that. just noticed after had hit sent in the email here...

>
> > ---
> >  drivers/gpu/drm/i915/i915_driver.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> > index 33e231b120c1..6469c7c1e154 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -1071,8 +1071,6 @@ static int i915_driver_open(struct drm_device *dev, struct drm_file *file)
> >   */
> >  static void i915_driver_lastclose(struct drm_device *dev)
> >  {
> > -     struct drm_i915_private *i915 = to_i915(dev);
> > -
> >       intel_fbdev_restore_mode(dev);
> >
> >       vga_switcheroo_process_delayed_switch();
> > --
> > 2.39.0
> >
