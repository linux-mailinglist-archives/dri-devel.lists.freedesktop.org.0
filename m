Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849F13625A6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 18:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B293E6EC6E;
	Fri, 16 Apr 2021 16:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE056EC6E;
 Fri, 16 Apr 2021 16:29:56 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id w23so27188045ejb.9;
 Fri, 16 Apr 2021 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TG7U5vc+zqJmhl+aoWVYWjnNSOUt4/Gdu+jEaFNsgMo=;
 b=ghOXTmw3uLi7VWudWHE/dw7eFX9dtqqmAYPAX4mH5H7Cc9+1SbinVkmTbKi2SOVSZy
 AjayH1NPtMQ8C6dQPP2G1nkA7vfWEseSM7rZyEYYD5DiVMjL/3ztPPxFkkf/fCc9+H1W
 v5EMDJNPNrCM+02p7Y4mEqp1SDdJK0WNAK74TP3VTxhncJJzm4xx47dTXKy+69BpPuP1
 qvGuNN1H1NfXuJ4bDnWL4WX9Z1Yz68oQwm8ra+zNQl8UEtZZE1pQXspKok9DbrfcN+oS
 8A/7Sr4lfr4DJubWhAlBZ1zma0ngdM2grElSF3GAxtQhnfVDW850KRKtujIdQv5v2LU3
 962Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TG7U5vc+zqJmhl+aoWVYWjnNSOUt4/Gdu+jEaFNsgMo=;
 b=eLFVa5woG6eTS3pujh0UgpUwFMBBIhY1L8FSY1D7Aeju/d9H9VUXHrZ1/uIbAPi7oa
 RaBnbss9K2C9fv96M/sOZOzfl6MhYLnb9qRcGIuxp0BB0G8U+92bUqV8BGAtyMMM5tHB
 bMkOGQ3DC3shfMl+VXJf/wcO7qLnVXRNQiYCob3Vg3R5qsCa6x6zKcMgUOs+EZ+z2jft
 Ws6s6JeZLg+kNG/EuNFhx6TyZdIHUc8qd/5K2B7aGV+EWufJAOMunFY2I7sglDZfwVID
 t9lXLwAE3MW6+1109C0q4unOFS3TGt4os6vngufainx5kIJI9TcLPbj0eZAiAQmFbysB
 Jffg==
X-Gm-Message-State: AOAM530aCf2KTTFwMgxwRwLbE14xjtHiHgt+ftJCYRB31ulTkg0kgWwq
 qGRH3h64CMlmfsa9mPKQQ4Ml1YTLH6UzNUInwHrhoUD5pgE=
X-Google-Smtp-Source: ABdhPJz7ATGTrcuTdiW0Eeg32hJEQMbMeOyWRE9NrTSDsQ10d41p7ntWaJ26wonQx2T7R9s0gst+sj1zqzvTPYTh0CE=
X-Received: by 2002:a17:906:c34d:: with SMTP id
 ci13mr8817928ejb.430.1618590593704; 
 Fri, 16 Apr 2021 09:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
In-Reply-To: <20210319210317.32369-1-mario.kleiner.de@gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Fri, 16 Apr 2021 18:29:41 +0200
Message-ID: <CAEsyxygq1k4pTT-8ASuJn=rSzHBXyhy5jRStoBVmniR2B_MrJg@mail.gmail.com>
Subject: Re: 16 bpc fixed point (RGBA16) framebuffer support for core and AMD.
To: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Friendly ping to the AMD people. Nicholas, Harry, Alex, any feedback?
Would be great to get this in sooner than later.

Thanks and have a nice weekend,
-mario

On Fri, Mar 19, 2021 at 10:03 PM Mario Kleiner
<mario.kleiner.de@gmail.com> wrote:
>
> Hi,
>
> this patch series adds the fourcc's for 16 bit fixed point unorm
> framebuffers to the core, and then an implementation for AMD gpu's
> with DisplayCore.
>
> This is intended to allow for pageflipping to, and direct scanout of,
> Vulkan swapchain images in the format VK_FORMAT_R16G16B16A16_UNORM.
> I have patched AMD's GPUOpen amdvlk OSS driver to enable this format
> for swapchains, mapping to DRM_FORMAT_XBGR16161616:
> Link: https://github.com/kleinerm/pal/commit/a25d4802074b13a8d5f7edc96ae45469ecbac3c4
>
> My main motivation for this is squeezing every bit of precision
> out of the hardware for scientific and medical research applications,
> where fp16 in the unorm range is limited to ~11 bpc effective linear
> precision in the upper half [0.5;1.0] of the unorm range, although
> the hardware could do at least 12 bpc.
>
> It has been successfully tested on AMD RavenRidge (DCN-1), and with
> Polaris11 (DCE-11.2). Up to two displays were active on RavenRidge
> (DP 2560x1440@144Hz + HDMI 2560x1440@120Hz), the maximum supported
> on my hw, both running at 10 bpc DP output depth.
>
> Up to three displays were active on the Polaris (DP 2560x1440@144Hz +
> 2560x1440@100Hz USB-C DP-altMode-to-HDMI converter + eDP 2880x1800@60Hz
> Apple Retina panel), all running at 10 bpc output depth.
>
> No malfunctions, visual artifacts or other oddities were observed
> (apart from an adventureous mess of cables and adapters on my desk),
> suggesting it works.
>
> I used my automatic photometer measurement procedure to verify the
> effective output precision of 10 bpc DP native signal + spatial
> dithering in the gpu as enabled by the amdgpu driver. Results show
> the expected 12 bpc precision i hoped for -- the current upper limit
> for AMD display hw afaik.
>
> So it seems to work in the way i hoped :).
>
> Some open questions wrt. AMD DC, to be addressed in this patch series, or follow up
> patches if neccessary:
>
> - For the atomic check for plane scaling, the current patch will
> apply the same hw limits as for other rgb fixed point fb's, e.g.,
> for 8 bpc rgb8. Is this correct? Or would we need to use the fp16
> limits, because this is also a 64 bpp format? Or something new
> entirely?
>
> - I haven't added the new fourcc to the DCC tables yet. Should i?
>
> - I had to change an assert for DCE to allow 36bpp linebuffers (patch 4/5).
> It looks to me as if that assert was inconsistent with other places
> in the driver where COLOR_DEPTH121212 is supported, and looking at
> the code, the change seems harmless. At least on DCE-11.2 the change
> didn't cause any noticeable (by myself) or measurable (by my equipment)
> problems on any of the 3 connected displays.
>
> - Related to that change, while i needed to increase lb pixelsize to 36bpp
> to get > 10 bpc effective precision on DCN, i didn't need to do that
> on DCE. Also no change of lb pixelsize was needed on either DCN or DCe
> to get > 10 bpc precision for fp16 framebuffers, so something seems to
> behave differently for floating point 16 vs. fixed point 16. This all
> seems to suggest one could leave lb pixelsize at the old 30 bpp value
> on at least DCE-11.2 and still get the > 10 bpc precision if one wanted
> to avoid the changes of patch 4/5.
>
> Thanks,
> -mario
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
