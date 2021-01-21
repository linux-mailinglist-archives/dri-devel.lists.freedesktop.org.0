Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD55A2FE50A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2FF6E51D;
	Thu, 21 Jan 2021 08:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCF96E51D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 08:33:01 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id g69so568977oib.12
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 00:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uX11i9ntHKvjXSr2VUaKfVVivjbrt/oL5DMR5Av1mfQ=;
 b=Waj5/Hh9QiVwxjR4nEz5y7b01uPWEmRMy/6wqmXtXcfpKDHMGBiKtBZRZfHBNYRvsS
 8G1lfiJ1/4cmnM3eKji6pjpCYGh9STOXBBPHdEQmT3Q3g3wWwmGnWDoYL56mbi1XU2iI
 bpUQccinaAKzE9oQk31XcfFtfv6GDskoDLYNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uX11i9ntHKvjXSr2VUaKfVVivjbrt/oL5DMR5Av1mfQ=;
 b=EhE99YrcaUbh05cxaQrVmnSX1rEciHNhD57AUPtVXQJBoa5ZaATyTTWXqgnu2Eb6q9
 MZVMJu8oGYfWAZZNT9zAIknr935b50kRsWOB3MouQJcvn3W1ey9fPGZk0PZJTvnLRM5o
 k1DOCYKddQh6X1UcFIiFtKu//PuecRgKQI4X90dJVKFUS9spjAJ1V4+hFY+8Hu9cgfVd
 J+V7GOWSk8lbzJF0bJgD4nSViZ7dLG/iguvIoFYzpTR2t63jfLNh51GtpSnEEC/2GE/p
 Pm5IowSxWRasB/8pqKHfDMS6++4JOIoY5XPXqq0pbn2ahNz2iYojhBxzBf0VNgrP0z/7
 +IRw==
X-Gm-Message-State: AOAM532MfLkmXmwv/pyOwXSFZPHZ1zS5vm4HjAxRzyzycwQNWsT1QbXZ
 +R3O2XeSwZJUzv9btc9dEOIsTgWGTJwDhab1deiueg==
X-Google-Smtp-Source: ABdhPJw+4IsAgRHo2MtvXqtNHIi15f7EcB4J/2s7VVzDrmrcmIIQo+1zUjeULyIuUrzgvFuyBO2o90wnLGPb4+F9yEY=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr5164573oia.14.1611217981254; 
 Thu, 21 Jan 2021 00:33:01 -0800 (PST)
MIME-Version: 1.0
References: <20210115120014.4211dec6@canb.auug.org.au>
 <20210120171501.61aa0786@canb.auug.org.au>
 <20210121115341.012c1a55@canb.auug.org.au>
 <CADnq5_PuH6RNpkAKfUD011rDEXCRd5-0_ad0Rv40k_2gqiQaYA@mail.gmail.com>
In-Reply-To: <CADnq5_PuH6RNpkAKfUD011rDEXCRd5-0_ad0Rv40k_2gqiQaYA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 21 Jan 2021 09:32:50 +0100
Message-ID: <CAKMK7uF8U8X54DFjRpovw1UO6B2xv16nzBrX1t2HQ6bZOmskcw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 4:07 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Jan 20, 2021 at 7:53 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > On Wed, 20 Jan 2021 17:15:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > On Fri, 15 Jan 2021 12:00:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > >
> > > > After merging the amdgpu tree, today's linux-next build (x86_64
> > > > allmodconfig) failed like this:
> > > >
> > > > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'dm_set_vblank':
> > > > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5380:33: warning: unused variable 'dm' [-Wunused-variable]
> > > >  5380 |  struct amdgpu_display_manager *dm = &adev->dm;
> > > >       |                                 ^~
> > > >
> > > > Caused by commit
> > > >
> > > >   98ab5f3513f9 ("drm/amd/display: Fix deadlock during gpu reset v3")
> > >
> > > I am still getting this warning.
> >
> > I now get this warning from the drm tree merge.

Drat, I missed that when merging.

> Bhawan sent out the fix today:
> https://patchwork.freedesktop.org/patch/415092/

Applied directly to drm-next, thanks.
-Daniel

>
> Alex
>
> >
> > --
> > Cheers,
> > Stephen Rothwell
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
