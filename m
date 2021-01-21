Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A162FDFEF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 04:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBCE6E8BD;
	Thu, 21 Jan 2021 03:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC756E8BD
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 03:07:35 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id d189so661640oig.11
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 19:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BG1xLGWcnyY9xQR12boOLCRylQDrIp7cDoolAVHFjIY=;
 b=GcOMpy6ipAWgydQzaw2NMeLsPnmNTu8VU43mYpvLc+MvOT3YxULe4T31AL7VE0WZ7t
 PSwY2DegOZXBphfMoWMp+/qxtmymjpf9D6F+2fIBLyrjLabAzdDVlj38eRGXpJvsj+X7
 UTSlPMYRMCFLP7a4NDbbr8eqZT85YdppPZ2AqT74Pusow2p/onJOCdQWvuT9RjuYH//t
 q2wRZNTWgKOWwaGNqT/UUJSrg20+f4ItRlckLfSec8DWqq2fMM4L0BAMA4mEzkl375MB
 ULn7/qmE8pHD91XWdaWA1GsmTrlB5oNwj81Q44V3UCbnsGSLQt6GO24yCD8EDRMnLHPT
 p3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BG1xLGWcnyY9xQR12boOLCRylQDrIp7cDoolAVHFjIY=;
 b=Ip69T0HQeSDs/2EiYRzIA2Dadu2kFMmgrQG0IaPpcZvBdXuwBLzXQwHzcXhgeh4caS
 Gpkb+ooFI8TU4EVY74hTLhtmk/UZlf//KZLW5EV5lm5vTq/e988EEz/SJvt8Nlsrq4oC
 H/8OAHcsCIwrVVPpJxZcbB/hibwCqbQfPf0Qc2uY5olWP3XdoLoxj6uHobxRuwSEz0LS
 VOS6K5WrkCvTztAEUn8ylWDZ9tg7lNiC8G21FI0+WUPq58zczZLiGjastef1b+HH1bdH
 RkrWlUxaxuSoTiVigXZLq7gbMcW+LTzxdZf4VxDWxP1Pd/K8E7WRFgbvUn73KoD+37og
 xUkA==
X-Gm-Message-State: AOAM5329OPOSyLyi4RPfA3XDt30qtbQhbGFixmVhScYgGHEXfiWV12Sv
 AkiA3Ot5RM4OV2kZtTLPzYWR8IX88uIjNzkndQw=
X-Google-Smtp-Source: ABdhPJzLb2aGPpWZaLInDmWBYV6zXb9BIywLTNbMJZ2rVC4CBpAmeacPihmMLdnl1xm6+LBEpB3z9zH6KUEINwdM2Z0=
X-Received: by 2002:aca:1a17:: with SMTP id a23mr4749105oia.120.1611198454758; 
 Wed, 20 Jan 2021 19:07:34 -0800 (PST)
MIME-Version: 1.0
References: <20210115120014.4211dec6@canb.auug.org.au>
 <20210120171501.61aa0786@canb.auug.org.au>
 <20210121115341.012c1a55@canb.auug.org.au>
In-Reply-To: <20210121115341.012c1a55@canb.auug.org.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 Jan 2021 22:07:23 -0500
Message-ID: <CADnq5_PuH6RNpkAKfUD011rDEXCRd5-0_ad0Rv40k_2gqiQaYA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 20, 2021 at 7:53 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Wed, 20 Jan 2021 17:15:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Fri, 15 Jan 2021 12:00:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the amdgpu tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'dm_set_vblank':
> > > drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5380:33: warning: unused variable 'dm' [-Wunused-variable]
> > >  5380 |  struct amdgpu_display_manager *dm = &adev->dm;
> > >       |                                 ^~
> > >
> > > Caused by commit
> > >
> > >   98ab5f3513f9 ("drm/amd/display: Fix deadlock during gpu reset v3")
> >
> > I am still getting this warning.
>
> I now get this warning from the drm tree merge.

Bhawan sent out the fix today:
https://patchwork.freedesktop.org/patch/415092/

Alex

>
> --
> Cheers,
> Stephen Rothwell
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
