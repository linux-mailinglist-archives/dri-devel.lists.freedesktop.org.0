Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A738F2FE2A4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 07:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9516E8D9;
	Thu, 21 Jan 2021 06:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA5E6E8D8;
 Thu, 21 Jan 2021 06:22:36 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id kg20so530546ejc.4;
 Wed, 20 Jan 2021 22:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GW/oWN3oyD3njowlslhBX+P2nkMm3yPnHl9TOZ+Je2s=;
 b=vJgQFLlN27pu0HqdfQKoxyc/5F80Fo1UnauZgGw82RIjbaqcnj4fGj/XFUsgJrq9CU
 1IOtdX+THR0BWsPmrTiwJxx/brIqgmWH3rQpEgOwCEDLVs7rv51XUuVkqR2HMot1sIHV
 /9X2SK8Js14THdDobqZjp8evE5F/5YH9O46U0saaaeLWvL1m8DsHOuxbcEhR3lCKYL92
 d7HxQDVisi7Pvi6DT8nfHvMpbs8hZ+fhheK6vd76/UgNVZ3PeYstZKenscMKyIhaMlwx
 fv5PtFEHuqDKHSIOi5Jenvkg8Bi79oztPTcZ0usY/NWVeF1VhyFcx/uJPXQN5kCavFHo
 wGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GW/oWN3oyD3njowlslhBX+P2nkMm3yPnHl9TOZ+Je2s=;
 b=ocWLJD2j9iXeBYt3zSyYZq71gtuIptv1SWFxvcxc8YzA3Sw0QqaJSsZ0w9QOsnVg4I
 cW37s7Sl6Nwa6V+fhqYjuJjqxHJNtzrVLfNby/fsOHzx0/P1nvnBGa07QWJWic/4NoaL
 xi/UqUwBQQxxiyGf22I9h9jrQ0OA8FjWAX3shQTm1dt4tKILUadsCiQ/PAupENmOSBsk
 rj+tH/iTb6DP042IIOInsEiTliajlttW+VVkZt4WQ3XHM82XeyPeNtro5NIzsYVkK0dZ
 IYbugS4aye3jQCqn17gz2iceI2HTI9Skl/AAy+FeAgsSxJs+z2o3BRG1lFwnLhGGZvmZ
 zn8g==
X-Gm-Message-State: AOAM530SirErsyp9s3hGAJsLPdBBt7PmWi9qqwZWF6xrX2/hJOQuOX7F
 mUtfNy8QqA5sRkebiSZJgifIenetOhftC/ad0Ik=
X-Google-Smtp-Source: ABdhPJy5/0LBceTsjModKTDeluMXbpU1rmpDtJXeV6VP7azlkKLQbc2DmDNuMGCZ1+yd9dpc7GGdhx+RrLj4uZWNOjw=
X-Received: by 2002:a17:906:5958:: with SMTP id
 g24mr8032373ejr.377.1611210155701; 
 Wed, 20 Jan 2021 22:22:35 -0800 (PST)
MIME-Version: 1.0
References: <20201228185059.3949-1-mario.kleiner.de@gmail.com>
 <CADnq5_PwoHyoS=-Nc1EhBMRjwPwOfktgZr7RkeDSP9vBjSNUCQ@mail.gmail.com>
In-Reply-To: <CADnq5_PwoHyoS=-Nc1EhBMRjwPwOfktgZr7RkeDSP9vBjSNUCQ@mail.gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 21 Jan 2021 07:22:24 +0100
Message-ID: <CAEsyxyhHPaOGJJhPrUWPoXni-T0y23=Zqf82qJJVLqm=HaUOdw@mail.gmail.com>
Subject: Re: Enable fp16 display support for DCE8+, next try.
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 4, 2021 at 6:16 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Mon, Dec 28, 2020 at 1:51 PM Mario Kleiner
> <mario.kleiner.de@gmail.com> wrote:
> >
> > Hi and happy post-christmas!
> >
> > I wrote a patch 1/1 that now checks plane scaling factors against
> > the pixel-format specific limits in the asic specific dc_plane_cap
> > structures during atomic check and other appropriate places.
> >
> > This should prevent things like asking for scaling on fp16 framebuffers
> > if the hw can't do that. Hopefully this will now allow to safely enable
> > fp16 scanout also on older asic's like DCE-11.0, DCE-10 and DCE-8.
> > Patch 2/2 enables those DCE's now for fp16.
> >
> > I used some quickly hacked up of IGT test kms_plane_scaling, manually
> > hacking the src fb size to make sure the patch correctly accepts or
> > rejects atomic commits based on allowable scaling factors for rgbx/a
> > 8 bit, 10, and fp16.
> >
> > This fp16 support has been successfully tested with a Sea Islands /
> > DCE-8 laptop. I also confirmed that at least basic HDR signalling
> > over HDMI works for that DCE-8 machine with a HDR monitor. For this
> > i used the amdvlk driver which exposes fp16 since a while on supported
> > hw.
>
> Patches look good to me, but I'd like to get some feedback from the
> display folks as well.
>
> >
> > There are other bugs in DC wrt. DCE-8 though, which didn't prevent
> > my testing, but may be worth looking into. My DCE-8 machine scrambles
> > the video output picture somewhat under Vulkan (radv and admvlk) if the
> > output signal precision isn't 8 bpc, ie. on 6 bpc (eDP laptop panel)
> > and 10 bpc, 12 bpc (HDMI deep color on external HDR monitor).
> >
> > Another fun thing is getting a black screen if DC is enabled on at least
> > Linux 5.10+ (but not if i use the classic kms code in amdgpu-kms). If
> > i recompile the driver with a Ubuntu kconfig for Linux 5.9, the 5.10
> > kernel works, and the only obvious DC related difference is that DC's
> > new SI / DCE-6 asic support is disabled at compile time.
>
> Fixed here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6bdeff12a96c9a5da95c8d11fefd145eb165e32a
> Patch should be in stable for 5.10 as well.

Yes, in recent 5.10 stable these fix the problem I experienced.

Thanks Alex,
-mario


>
> Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
