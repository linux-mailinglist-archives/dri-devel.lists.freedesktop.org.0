Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 614881D76C1
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 13:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5106E14C;
	Mon, 18 May 2020 11:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F856E14C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:22:23 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id w65so2653680vsw.11
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 04:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tHuAEzfw9tuYOSZHCyAU4yXSLfdz7ow6WkHkmLGW/Hc=;
 b=VW6T08EVdGp2wmc8Bw6D4Kq5WtPvvCn5aG8vjo/80e6pzxbH/1PAQiWiBzmAEd+fU6
 gnjoBy2IgqAxPTy0d4Y9+QhUTR4c3+XWIdgsDAKsrC69jLmWZUmssXWvFXZh8bh2o6T7
 DIeiCMcN0aQ5SD0V6haW96B5yJaFEZNEZ4NUs+t6WhA2WVWFn0L+5vjsvK0oOCNBCkc7
 mGEJbbNKXH3hfFf0+0tmvoUV4AXD09678KhXTZJXKug8DR5eO8wWHmZ2EW4jV2kHT3DQ
 KpxUwIYArjCb25SjIFcbOe9+XLk/Kbem7hg3MZm+Y0euul5/ZaUePHUl4ycTUEFG3DvZ
 oQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tHuAEzfw9tuYOSZHCyAU4yXSLfdz7ow6WkHkmLGW/Hc=;
 b=S1RzP/E/K958TKFSVtxmX9zh6ACyfP3goJsx6WoRl/ZU/hT9nE3iKXOcqKK1vmFphc
 BZ18ASG2lkaIkQS+hTEeeutB6XoZ+d3RdDeRdX7kq+Xw4fx6NUFFRCzJsf6I4YsInpuR
 DOgklCNexqbchVQnP44a+3PGqf9Hr8iSebd9NJRYClRJbzdNaPqBPTAMZ+AGoailZOJj
 Gccqu1tq2uTYLcpvuB0uYX+qvmy0sdxVVH/9yelFSbVQkQjjPwPOHf7bFitYi3kqplwh
 GtdvZAbYGqHcbo6cscnwrQP6n44QT7pbrLhhGSoGQu5VjmW6t+R49aYlhUFX5BD5KUpV
 0D8w==
X-Gm-Message-State: AOAM530XhkETfMVZE/yoRqU9EuIYzNMF/W70mm5o7zLy8SwX1yIShc2Z
 CCLJF/jti0Fxm6wGSvyHlb/FV+b6R1MHXmDvPI0=
X-Google-Smtp-Source: ABdhPJy/95uwpzVKDDKLorM+Bwxwmm1+wCZJM69Wfw0Un1EZjqct2LY7TJtYdyJhNEaEoDULsUYGR7hGLpw3Pi5+nro=
X-Received: by 2002:a67:de0a:: with SMTP id q10mr10729227vsk.138.1589800942959; 
 Mon, 18 May 2020 04:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com>
 <87d071aedu.fsf@mpe.ellerman.id.au>
In-Reply-To: <87d071aedu.fsf@mpe.ellerman.id.au>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 18 May 2020 12:19:32 +0100
Message-ID: <CACvgo53uWVmhwon4+Fn5=_4HPXSciqNrf1MSJjt1kA3G2wyECw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

On Mon, 18 May 2020 at 08:30, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Emil Velikov <emil.l.velikov@gmail.com> writes:
> > As mentioned in earlier commit, the riva and nvidia fbdev drivers have
> > seen no love over the years, are short on features and overall below par
> >
> > Users are encouraged to switch to the nouveau drm driver instead.
> >
> > v2: Split configs to separate patch, enable nouveau (Bartlomiej)
> >
> > Cc: Antonino Daplas <adaplas@gmail.com>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: linux-fbdev@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v1)
> > ---
> > Hi all unless, there are objections I would prefer to merge this via
> > the drm tree.
>
> Have you tested that the resulting kernels work on the relevant
> hardware?
>
Sadly, no I haven't. I'm updating the defconfigs as requested by the
fbdev maintainer.

> The old drivers may be crufty but they presumably have been tested by
> people and at least somewhat work.
>
> So I'd be inclined to leave the defconfigs alone until someone can test
> that the new driver works at all.
>
Works for me.

> I gave it a quick spin on a G5 I have access to and dmesg has a bunch of
> errors in it (see below). I can't actually tell if the display is
> working because the machine is remote, and I can't go and check it at
> the moment because the office is closed.
>

From what I can see, there seems to be three bits:
 - attempted out-of-bound attempts to read the vbios
Genuine concern or noise? Likely using the bios from open firmware,
check any of the other options - see NvBios in [1]
 - cannot figure out the timer input frequency
No idea
 - the TV1 EDID is empty
Is there an actual TV connected to the device, check with another cable

Regardless of the patches, reporting [2] the above would be a nice move.

Thanks
Emil
[1] https://nouveau.freedesktop.org/wiki/KernelModuleParameters/
[2] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
