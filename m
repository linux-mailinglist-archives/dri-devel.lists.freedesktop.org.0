Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A1B6B4A4E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 16:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D320210E976;
	Fri, 10 Mar 2023 15:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACC210E971;
 Fri, 10 Mar 2023 15:21:19 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id bh20so4482248oib.9;
 Fri, 10 Mar 2023 07:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678461678;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e9lMn6VV65uWfzjqWmmufolCWaaGVCVGPcfnBRvktiU=;
 b=pO23LVjRTOe/Pqi17BvQZxLyFh8oj6DcEb5OIH5ttExR/GXThc7CquNptfxFHVXWgZ
 ul8jRVwlPw9zx7yIkmmRypTjIqcuLU3Ty0MN4dlNNFmZSxqiybOcJlbFaBwBrCnO0YLv
 k151bi31IvRsJLooodKgjDmT2eY9eKy0OTYMhmw1ILIYhHEYyg4a1Zksfc4MK/ZLi+en
 jwKJhyJR55GKaAO0oak3RxlaVDsGUgPT163ZBmlmDluD7uMStDArT1tepifoyB4VT4Ce
 uV9JJrq/uJKMzvUqSDOJ6taUTeKOXIyx0ZQeLkgHosP9JMTByhisC9fz26YxrZ/VqN0N
 alVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678461678;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e9lMn6VV65uWfzjqWmmufolCWaaGVCVGPcfnBRvktiU=;
 b=xPX0sZc0cdU//5U1NYx1HMcwESE6fdEsm8q836PHA0gr/wIW3Kn5/V5TZi2zhOWT23
 qlK2zOJGsx6aoIPbTZsMf4ReWgZO6Ro3ndw0AM3jO7UgWLKyYDOnaOTrO6E1/pMbTaXn
 aYIbC13b96lqnfareHWZMXgBVCNUWeEYAUHT13u17TL68uYBRHvqWjAyk68kZoAxwOWu
 I4rEwWnaeUi/00Fknl7mKXps5qkCa3RzUMgiTkUFPa+t7on/9MDPXHFjKgSDIPfKOwOE
 wQAof2Xh+EOJC6xC9M1fHfK6gLALJBw4CuG3sT/aeJ7KnBEmOAi8tmYr1MufAXyktzlo
 GW+g==
X-Gm-Message-State: AO0yUKV/54BU5vFFBgWFkF35ZVQytm4H1FL2MYaSJxuO/o56kMobhYVk
 OV6N5dzLFkcvItYVfeP2aiDVq8x5G72g6up9WnAVTu7c
X-Google-Smtp-Source: AK7set/QNvrTKVBToHtiE+X4AER7ddGa4mlsjh2V+qz09csY1T7Jh2Eldr8lMW4bE6jaNMbgI25b1ciWyLOY4CxXG7A=
X-Received: by 2002:aca:230d:0:b0:383:d3ae:2ef4 with SMTP id
 e13-20020aca230d000000b00383d3ae2ef4mr7916358oie.8.1678461678504; Fri, 10 Mar
 2023 07:21:18 -0800 (PST)
MIME-Version: 1.0
References: <20230310074000.2078124-1-lizhenneng@kylinos.cn>
 <DM5PR12MB2469FEB1E81CA99C51E7DAF0F1BA9@DM5PR12MB2469.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB2469FEB1E81CA99C51E7DAF0F1BA9@DM5PR12MB2469.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Mar 2023 10:21:06 -0500
Message-ID: <CADnq5_OzDzi_LKeNdk4LNa2SwWg8Jpieci8omJye_ASDyjW3sA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: resove reboot exception for si oland
To: "Chen, Guchun" <Guchun.Chen@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Zhenneng Li <lizhenneng@kylinos.cn>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 10, 2023 at 3:18 AM Chen, Guchun <Guchun.Chen@amd.com> wrote:
>
>
> > -----Original Message-----
> > From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Zhenneng Li
> > Sent: Friday, March 10, 2023 3:40 PM
> > To: Deucher, Alexander <Alexander.Deucher@amd.com>
> > Cc: David Airlie <airlied@linux.ie>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> > linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org; Zhenneng Li
> > <lizhenneng@kylinos.cn>; amd-gfx@lists.freedesktop.org; Daniel Vetter
> > <daniel@ffwll.ch>; Koenig, Christian <Christian.Koenig@amd.com>
> > Subject: [PATCH] drm/amdgpu: resove reboot exception for si oland
> >
> > During reboot test on arm64 platform, it may failure on boot.
> >
> > The error message are as follows:
> > [    6.996395][ 7] [  T295] [drm:amdgpu_device_ip_late_init [amdgpu]]
> > *ERROR*
> >                           late_init of IP block <si_dpm> failed -22
> > [    7.006919][ 7] [  T295] amdgpu 0000:04:00.0: amdgpu_device_ip_late_init
> > failed
> > [    7.014224][ 7] [  T295] amdgpu 0000:04:00.0: Fatal error during GPU init
> > ---
> >  drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> > b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> > index d6d9e3b1b2c0..dee51c757ac0 100644
> > --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> > +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> > @@ -7632,9 +7632,6 @@ static int si_dpm_late_init(void *handle)
> >       if (!adev->pm.dpm_enabled)
> >               return 0;
> >
> > -     ret = si_set_temperature_range(adev);
> > -     if (ret)
> > -             return ret;
>
> si_set_temperature_range should be platform agnostic. Can you please elaborate more?
>

Yes.  Not setting this means we won't get thermal interrupts.  We
shouldn't skip this.

Alex


> Regards,
> Guchun
>
> >  #if 0 //TODO ?
> >       si_dpm_powergate_uvd(adev, true);
> >  #endif
> > --
> > 2.25.1
>
