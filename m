Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE50B26ADF0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 21:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BCB6E177;
	Tue, 15 Sep 2020 19:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AC06E177;
 Tue, 15 Sep 2020 19:47:07 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e17so638772wme.0;
 Tue, 15 Sep 2020 12:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8+w8MCZQVwLOcsa3UrmLYJYKtPwxj8ft1SlgJbNyeA8=;
 b=JPTHDc7rYypOSzSp9W0qxKhrmv41dRTmrYY14fVmDhwlD3/oajrz9G9KpUZo079VL7
 44ro9qC0vm+IFhW6kvfynC5gW5sZOVFn62xnR0MW2kRWXOgTXsONiaLKWQw2TvM74oN0
 bddr5mBHqv6u2Fwi4BxoXGT3pTGY7CZFqETQHqzzqDe0M4sBgKsPKLGUavapLbB/uG0J
 QscIdNzW1iPSM/Ew+iCZwez5CSOGmDPkc+fFT3SuzOV1wCenDCuzVtofmYTFwvSdX7Fk
 jEvvloxSTgv5Ggd6z1QPAYR7sjJjpf29BVYSGtfbpECtVKit9tZtJgfIxyD25NoET+HC
 Klnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8+w8MCZQVwLOcsa3UrmLYJYKtPwxj8ft1SlgJbNyeA8=;
 b=lc3sc9H6wiw35BFxLTZ9tUlMuI00Wq4DitKAqYsp9UBWZE/td+4nS9bCa3y0A1rfwa
 zly2ceDrYNN+1jyOyY2wL06yQOA7wegGswyNJipvTZ+AKDA1M9dXMtfex/Flk2+yWQQw
 JQJjRrqM1CY63mfSfyg3tnC2Q2ZKoiuinNvqipYGlSFNrNYztgpItjS83qTK3JMadR2Q
 xoCdT20uSahoS5lgJXm9Mqi2BJQe2iOE3DYC3KFCl6ReHY+6eI1SGmbRpZAPEd7uYXhz
 gdwYvZVdtzSvCugroNv8TwJTqcVWR74/dr3SqDq7lFcxxFwTT1BcAsw1KDzBNiFwj/KI
 cTrw==
X-Gm-Message-State: AOAM5330tvg6ow4V/h5tAdPon/RJXDBuFR8ScOoWdITSLxpevrsFMaKT
 7KYdzdWyC0FklBuyx0sIXFhbCSgge23mD2yOZuw=
X-Google-Smtp-Source: ABdhPJx6Ivzd0nNSmmhbl1IKKhrcmi1LfG3GKuvvOAz6Uz7/Pbfr0luVZDBYbgMVE1u+QTxYjK6nyw1fk30RGkoVDDs=
X-Received: by 2002:a7b:c141:: with SMTP id z1mr953211wmi.79.1600199226000;
 Tue, 15 Sep 2020 12:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200910031352.39992-1-yuehaibing@huawei.com>
 <dcdc327c-c0d1-85cb-28fa-5b7cb5d4e555@amd.com>
In-Reply-To: <dcdc327c-c0d1-85cb-28fa-5b7cb5d4e555@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Sep 2020 15:46:54 -0400
Message-ID: <CADnq5_O4zWOoWu5HggTJNhqLCgasX-BerJKzd9UgrL3s09R6nA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Create trigger_hotplug entry
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Eryk Brol <eryk.brol@amd.com>, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 YueHaibing <yuehaibing@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>, "Lipski,
 Mikita" <mikita.lipski@amd.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Sep 10, 2020 at 11:35 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2020-09-09 11:13 p.m., YueHaibing wrote:
> > Add trigger_hotplug debugfs entry.
> >
> > Fixes: 6f77b2ac6280 ("drm/amd/display: Add connector HPD trigger debugfs entry")
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> > index 94fcb086154c..83da24aced45 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> > @@ -2098,6 +2098,7 @@ static const struct {
> >       const struct file_operations *fops;
> >   } dp_debugfs_entries[] = {
> >               {"link_settings", &dp_link_settings_debugfs_fops},
> > +             {"trigger_hotplug", &dp_trigger_hotplug_debugfs_fops},
> >               {"phy_settings", &dp_phy_settings_debugfs_fop},
> >               {"test_pattern", &dp_phy_test_pattern_fops},
> >   #ifdef CONFIG_DRM_AMD_DC_HDCP
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
