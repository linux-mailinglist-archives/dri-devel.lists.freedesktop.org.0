Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBEE2E9BCF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 18:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB97C6E042;
	Mon,  4 Jan 2021 17:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBDF89C89;
 Mon,  4 Jan 2021 17:16:31 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id s19so6440265oos.2;
 Mon, 04 Jan 2021 09:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5jbZpSQhxdUbbMTL4dgvaaFMlciLivGcWgSqMngJ8Eg=;
 b=f6GsoGo0PTGq65kiH2FLh2K7AxuOFNTbfqSWLRxeyxFW3IPiGWfBw0Xpv1lFekT+zn
 6W10rI7GjMXjc5IfDhWyjJ1u05MWb39o109tJztF+tXw+xAix0JDg4ShAq4CgDLH+W2h
 EHwat7M0lqn1pTpw+EayfFYMAvcl4tUfo7rFZMnkMjqIGzAjg3+cwEI3UzQ50O9WKMMx
 330qAO4aY0bTjxsX3YNHGKccne5n/e0BKLRkRmvLFrq2jVY3tZuYhmSYD2IWfMJWXxyT
 BZqupH4bsWg6WvuFEK/VeXFo3IVDB7s7hywc1Efx6qrNx2ygOyR7/pXl+SNvovu+DitX
 /UqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5jbZpSQhxdUbbMTL4dgvaaFMlciLivGcWgSqMngJ8Eg=;
 b=GX/mcPMIruzEFs6Oc4oNBGSpRtz6oM7+TADxoZobTdoMT8U/OlOOhGlZxy0qnnDLlW
 3mhAi4ZjkpjA0FDdxOW8/Qs8++FJjgDGhGC4wTuAJSyAvV58av/fOVS2JhZsT6fccWAI
 NvfK8HkjtUUyUabzcBJzf2e1EhOuhDcOTvKl5u44s8Brh8DbHxRKzanp3Wgh5cxdPWW2
 I7OlTIO2Wxyu5Adkt6hTQwZBu/LEKCmbhRddlQ4l0bi16ILTOGckrtdbbV52cdAKa0gJ
 x3XBXlgM0ubUN2HY4hckfVm44/aQseCWZiU4qEMkCQOCzTyyH7nmj4bkT3JgVVNw/KLc
 vy5w==
X-Gm-Message-State: AOAM533T4lTxZdrmBww/6ZLSpqygMjYuzfzLmEUy3J1il/aoIzX2W1V3
 Ve6kGGlKHtlXubICrqeSj1kui8etd/WNw21tJBA=
X-Google-Smtp-Source: ABdhPJyuMOxv4cXfgD2hnCz8nCBqP10l8peU5RXHwRDs0UkfvkqMh6jtMV5jIkqK/NQWHVEwcHEza9Lwl8vapdmzl7c=
X-Received: by 2002:a4a:a2c5:: with SMTP id r5mr49224601ool.72.1609780590635; 
 Mon, 04 Jan 2021 09:16:30 -0800 (PST)
MIME-Version: 1.0
References: <20201228185059.3949-1-mario.kleiner.de@gmail.com>
In-Reply-To: <20201228185059.3949-1-mario.kleiner.de@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Jan 2021 12:16:19 -0500
Message-ID: <CADnq5_PwoHyoS=-Nc1EhBMRjwPwOfktgZr7RkeDSP9vBjSNUCQ@mail.gmail.com>
Subject: Re: Enable fp16 display support for DCE8+, next try.
To: Mario Kleiner <mario.kleiner.de@gmail.com>
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

On Mon, Dec 28, 2020 at 1:51 PM Mario Kleiner
<mario.kleiner.de@gmail.com> wrote:
>
> Hi and happy post-christmas!
>
> I wrote a patch 1/1 that now checks plane scaling factors against
> the pixel-format specific limits in the asic specific dc_plane_cap
> structures during atomic check and other appropriate places.
>
> This should prevent things like asking for scaling on fp16 framebuffers
> if the hw can't do that. Hopefully this will now allow to safely enable
> fp16 scanout also on older asic's like DCE-11.0, DCE-10 and DCE-8.
> Patch 2/2 enables those DCE's now for fp16.
>
> I used some quickly hacked up of IGT test kms_plane_scaling, manually
> hacking the src fb size to make sure the patch correctly accepts or
> rejects atomic commits based on allowable scaling factors for rgbx/a
> 8 bit, 10, and fp16.
>
> This fp16 support has been successfully tested with a Sea Islands /
> DCE-8 laptop. I also confirmed that at least basic HDR signalling
> over HDMI works for that DCE-8 machine with a HDR monitor. For this
> i used the amdvlk driver which exposes fp16 since a while on supported
> hw.

Patches look good to me, but I'd like to get some feedback from the
display folks as well.

>
> There are other bugs in DC wrt. DCE-8 though, which didn't prevent
> my testing, but may be worth looking into. My DCE-8 machine scrambles
> the video output picture somewhat under Vulkan (radv and admvlk) if the
> output signal precision isn't 8 bpc, ie. on 6 bpc (eDP laptop panel)
> and 10 bpc, 12 bpc (HDMI deep color on external HDR monitor).
>
> Another fun thing is getting a black screen if DC is enabled on at least
> Linux 5.10+ (but not if i use the classic kms code in amdgpu-kms). If
> i recompile the driver with a Ubuntu kconfig for Linux 5.9, the 5.10
> kernel works, and the only obvious DC related difference is that DC's
> new SI / DCE-6 asic support is disabled at compile time.

Fixed here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6bdeff12a96c9a5da95c8d11fefd145eb165e32a
Patch should be in stable for 5.10 as well.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
