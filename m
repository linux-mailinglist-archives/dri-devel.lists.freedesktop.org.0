Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CB136625F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 01:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2B86E910;
	Tue, 20 Apr 2021 23:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971E06E910
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 23:11:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id n2so60694861ejy.7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 16:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FVqDM5y+W5f3EH16t1Ahlx8M+BW0BiUiCd9Lvd/IGQM=;
 b=nXPqfbhuSr9Vo44E8+E80cteavqc9jdiJMcShe0Kmh1JZig6Jv04+G37tFIc4AVzjW
 2oJlyKPlKE1VZ1WxQoqenhZB4ntRQm37Cjna01MF6al7iQWEVqg7HSoJqwha0K76QO6S
 qo23HfHfHH4JJ01PiZ9VzXZzf+kdEqcJTP0UXTr4t2e0RGOYXRDZmgFDTpkDZHGlVAzS
 Mmf8x73Hr688qvyNQ+0g7oLDgEzN4RlV6mik1tQZdrOoE2fhF6KDEoGOmAm3LdE4zs5K
 trC6PpCZXSH7b1JZBs0kPo4/6gf/PADCQ2svX6P8JBA1//sgyhiIioip9UwmxDTi3tjE
 ERTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FVqDM5y+W5f3EH16t1Ahlx8M+BW0BiUiCd9Lvd/IGQM=;
 b=PdXbgDT3q/ivJrOBCGzmE0P7toNn5J2tZAumxnclnyTLfpPbYwFpHt4Dlw+2TgmSV7
 8Xod0HXbDfEccH95W/J/ec/tPDN4W2Bwk+i310mqb9B/sXJo2kFwMCFy75BWn42NEXu2
 yjolug4gPhtULl0+05IZg0Wj5qfzScHoqyI+nKimM7bufgMzQ4EgxtlCb3WszBva2sCI
 sz3QQJLnUV8HCvpQQjjRWGgQt1EQXxrqjAbDNJcFdfF0+Ydpax872rP8F8FSYspYyjPT
 2uRx2Gj5uhBRQTynQzBq8aEsCKqV8msSyZLyD+H/B1VJuHDFZZcMDey1sbUHzaKaWX8m
 +Xeg==
X-Gm-Message-State: AOAM531wu54Ju1rFokEPp719kQAb25pdc0xl6iDcg9jVE+Sx55b7ltFb
 v1kwwRx3O4wkKN/2fnOZu3dTW3nIhr2tiXJo/Z0x3Q==
X-Google-Smtp-Source: ABdhPJw/Z3Q7nVvXszDBarriiKrARjTdV8bEsc9N8g0Vsk+qAbaH/iHuKC4G+y8Z4rXsGLi8te3AkAH0pc6LlyRSBcQ=
X-Received: by 2002:a17:906:1c98:: with SMTP id
 g24mr30359655ejh.457.1618960275097; 
 Tue, 20 Apr 2021 16:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <a28f2wvjsZ0pMcKjyC4C5DgvT59Bn32JORf1DdTei3818_ZXYRGV19m5IpaWqELPeDNPSj2SRbMznfuCrCYmO0mLtpaxN5MprB3QRk3Isww=@emersion.fr>
 <CAPj87rO_DJtq6_XO400FK2u97CWXDo5Px21Q+svAPg8r+WEuCg@mail.gmail.com>
In-Reply-To: <CAPj87rO_DJtq6_XO400FK2u97CWXDo5Px21Q+svAPg8r+WEuCg@mail.gmail.com>
From: Eric Anholt <eric@anholt.net>
Date: Tue, 20 Apr 2021 16:11:04 -0700
Message-ID: <CADaigPVePfkYvVrmSAf59GycCfngW6eW2Z0DKL0N-_aYL-vE+Q@mail.gmail.com>
Subject: Re: Split render/display SoCs, Mesa's renderonly,
 and Wayland dmabuf hints
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 3:18 AM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi,
>
> On Mon, 19 Apr 2021 at 13:06, Simon Ser <contact@emersion.fr> wrote:
>>
>> I'm working on a Wayland extension [1] that, among other things, allows
>> compositors to advertise the preferred device to be used by Wayland
>> clients.
>>
>> In general, compositors will send a render node. However, in the case
>> of split render/display SoCs, things get a little bit complicated.
>>
>> [...]
>
>
> Thanks for the write-up Simon!
>
>>
>> There are a few solutions:
>>
>> 1. Require compositors to discover the render device by trying to import
>>    a buffer. For each available render device, the compositor would
>>    allocate a buffer, export it as a DMA-BUF, import it to the
>>    display-only device, then try to drmModeAddFB.
>
>
> I don't think this is actually tractable? Assuming that 'allocate a buffer' means 'obtain a gbm_device for the render node directly and allocate a gbm_bo from it', even with compatible formats and modifiers this will fail for more restrictive display hardware. imx-drm and pl111 (combined with vc4 on some Raspberry Pis) will fail this, since they'll take different allocation paths when they're bound through kmsro vs. directly, accounting for things like contiguous allocation. So we'd get false negatives on at least some platforms.
>
>>
>> 2. Allow compositors to query the render device magically opened by
>>    kmsro. This could be done either via EGL_EXT_device_drm, or via a
>>    new EGL extension.
>
>
> This would be my strong preference, and I don't entirely understand anholt's pushback here. The way I see it, GBM is about allocation for scanout, and EGL is about rendering. If, on a split GPU/display system, we create a gbm_device from a KMS display-only device node, then creating an EGLDisplay from that magically binds us to a completely different DRM GPU node, and anything using that EGLDisplay will use that GPU device to render.
>
> Being able to discover the GPU device node through the device query is really useful, because it tells us exactly what implicit magic EGL did under the hood, and about the device that EGL will use. Being able to discover the display node is much less useful; it does tell us how GBM will allocate buffers, but the user already knows which device is in use because they supplied it to GBM. I see the display node as a property of GBM, and the GPU node as a property of EGL, even if EGL does do (*waves hands*) stuff under the hood to ensure the two are compatible.

I guess if we're assuming that the caller definitely knows about the
display device and is asking EGL for the render node in order to do
smarter buffer sharing between display and render, I can see it.  My
objection was that getting the render node in that discussion was
apparently some workaround for other brokenness, and was going to
result in software that didn't work on pl111 and vc4 displays because
it was trying to dodge kmsro.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
