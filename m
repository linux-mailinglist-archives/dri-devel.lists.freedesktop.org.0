Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E558299711
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 20:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB5289E36;
	Mon, 26 Oct 2020 19:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1911189E36;
 Mon, 26 Oct 2020 19:34:37 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c16so13685805wmd.2;
 Mon, 26 Oct 2020 12:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dt4AWesHgq95MuA9noAsqgwDvEHb5guDweoxzfn9TuQ=;
 b=ua/skFVpbRauDrk7eU647JocRmuulattFN3tamwpD1R3kDFDul1hutbRR/NHpZZ4TR
 QOi9sR0tej5ewSmtacJVK/RSoeta5RBfVfqvleriesi6pvhQp2yqoHNgM/2JLOD5xsSu
 SFwtCTo5TYmVdyL75EcYwQo+6ROk+p0Al8X+CWVAoWDkxgsC7Pgcj+Lk8j8IbN8W2eJ+
 uJn8gMZkGofT8ifLHiVV6l5SEiAp3MfwQmhnRswrc5p/tmX8M+Fkvqek1phdIvOxk02O
 uV3lIfkgbFdyVEimgrwM8H3TCHAjSfgPXgQZQmJKhuHSxbqX1ZVYFNLJhYQdm8ellHs0
 GdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dt4AWesHgq95MuA9noAsqgwDvEHb5guDweoxzfn9TuQ=;
 b=bARGO+++Em3YQGlIQ6iboV+VAjp3lhUnjeBURSOrpaGSgP3cLKpfXJTZP0fSzx+z4e
 U7Pc2VLh3+aWh4/FJSDKv496QOOvsiaob/aZKI5ZqbH057mT5vLHrIdCeXQhD2642btn
 KWDHqCLkct785JR92bM1nh84KH1w5YdUiBv960wBqAPp9KyQ3txvoHH0RMzU+uPDrHp7
 k6zYefOWRTfYeKDnwpF66ZxvHWwdv800aDVJgALLD9ig8znlVFhlddsB6mU35zuiAjVC
 d+gsMGjETDWhzWWLC99agy0q1J59cf0I3GCP3vHuCE+P3AmJLOTjYuSaFvnRw+ru6TH9
 6KHA==
X-Gm-Message-State: AOAM533E2h7rNT8SXprsxlUxXR1Y9ywjMGfA3KEQaHNZrl1IaFgJQwbh
 tf7Kcn1KUjiWEwfxjtTJcecD3GWFE0ut6BG8EW0=
X-Google-Smtp-Source: ABdhPJx8VRcrhv9u5TFKRPzbWDC4InYcOACd443ZXQxhRMYnK4DNXUCXAYaxfxxQ6ex6FFNBDhBx6aM37v+/WXqsGi8=
X-Received: by 2002:a1c:6302:: with SMTP id x2mr17930983wmb.56.1603740875736; 
 Mon, 26 Oct 2020 12:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201023074656.11855-1-tiwai@suse.de>
 <1d3e22ef-a301-f557-79ca-33d6520bb64e@amd.com>
In-Reply-To: <1d3e22ef-a301-f557-79ca-33d6520bb64e@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Oct 2020 15:34:24 -0400
Message-ID: <CADnq5_OY8tRqs-bao9mkKxgcXC=305-_71U=04C5z9HM0+5MuQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/amd/display: Fix kernel panic by breakpoint
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yes, looks good to me as well.  Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>
I'll give the display guys a few more days to look this over, but if
there are no objections, I'll apply them.

Thanks!

Alex

On Fri, Oct 23, 2020 at 7:16 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> On 2020-10-23 03:46, Takashi Iwai wrote:
> > Hi,
> >
> > the amdgpu driver's ASSERT_CRITICAL() macro calls the
> > kgdb_breakpoing() even if no debug option is set, and this leads to a
> > kernel panic on distro kernels.  The first two patches are the
> > oneliner fixes for those, while the last one is the cleanup of those
> > debug macros.
>
> This looks like good work and solid. Hopefully it gets picked up.
>
> Regards,
> Luben
>
> >
> >
> > Takashi
> >
> > ===
> >
> > Takashi Iwai (3):
> >   drm/amd/display: Fix kernel panic by dal_gpio_open() error
> >   drm/amd/display: Don't invoke kgdb_breakpoint() unconditionally
> >   drm/amd/display: Clean up debug macros
> >
> >  drivers/gpu/drm/amd/display/Kconfig             |  1 +
> >  drivers/gpu/drm/amd/display/dc/gpio/gpio_base.c |  4 +--
> >  drivers/gpu/drm/amd/display/dc/os_types.h       | 33 +++++++++----------------
> >  3 files changed, 15 insertions(+), 23 deletions(-)
> >
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
