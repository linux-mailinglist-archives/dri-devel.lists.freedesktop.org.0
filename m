Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD13C1D363A
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 18:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C966EB83;
	Thu, 14 May 2020 16:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518D66EB84
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 16:17:30 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id a11so1325546uah.12
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OqjZEsENiuJ7Z2+zCW9pzRm/SY0vcINZf6TSPb9wFL8=;
 b=T5HS0B1fvJofutv3NJqUrbAvHVxEP8Z/4pbg8rWnyUbriguTHHrLowQ8XSkvu1D4nb
 CKxxadhSnrOhka8fhDtg4GRuLt/M9djey/HD7gL8AniRdx98Ev//amZicIk25BLCfDDp
 gSMyC2uil/ZYl+myPhupP0IWuS1OqIEI9X8ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OqjZEsENiuJ7Z2+zCW9pzRm/SY0vcINZf6TSPb9wFL8=;
 b=qGyPquw4dgJyVHmXXSbz/5KaLEFhsot23zJD5myyZesS9/PYsb0XmoPbDGRz/o2AM7
 KZPq+3DGp+txpSkAG1ImIOVwzGb6t9qQDQIpxoWazRnOfeGN5xVL1Om/SiLX7xaKKLXQ
 cHJCjIykMy9oeiTSd/kHszMchOs1qgeuVG5gc2yFML2mkNNNm2tK8C4JLof+898YZP9t
 O+o2oBNVEl3RNuLSLHLA+66Icda8U8eBD/8Rxg0la3fiF9SD51uJexRRXPLwLMmI+nfP
 AXRG3EHaukzlFIlkRRWW0G9LE3ZplPoJi7CIEwUPTgga3SKGTjVcJrttLN3VPJdrzkkh
 8WGg==
X-Gm-Message-State: AOAM5331NHO1tqalDLmE4h3/juy1iXU1PutcyTBUKZxGxac1KpnKORZ0
 dPPzPinzjdUwXtjh5O2IPWsl9/HBygQ=
X-Google-Smtp-Source: ABdhPJyQnwGNYIMtiakBmkCC02ry1SUVqrjP1VfWk3RtrUgH2cq1AGymxxYeqf1OuGBchOJ4TVYTzQ==
X-Received: by 2002:ab0:56:: with SMTP id 80mr4495827uai.65.1589473048632;
 Thu, 14 May 2020 09:17:28 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com.
 [209.85.221.176])
 by smtp.gmail.com with ESMTPSA id k184sm818636vke.42.2020.05.14.09.17.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 09:17:27 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id o8so908308vkd.12
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 09:17:27 -0700 (PDT)
X-Received: by 2002:a1f:9605:: with SMTP id y5mr4360665vkd.75.1589473046623;
 Thu, 14 May 2020 09:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <1588339863-1322-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1588339863-1322-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 May 2020 09:17:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UJGivCyp=t0J++1DbSFDVf+5zSCcXgh83VZtssBmavjg@mail.gmail.com>
Message-ID: <CAD=FV=UJGivCyp=t0J++1DbSFDVf+5zSCcXgh83VZtssBmavjg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, travitej@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 1, 2020 at 6:31 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> "The PM core always increments the runtime usage counter
> before calling the ->suspend() callback and decrements it
> after calling the ->resume() callback"
>
> DPU and DSI are managed as runtime devices. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend was not getting called
> and it kept the clocks on which resulted in target not
> entering into XO shutdown.
>
> Add changes to force suspend on runtime devices during pm sleep.
>
> Changes in v1:
>  - Remove unnecessary checks in the function
>     _dpu_kms_disable_dpu (Rob Clark).
>
> Changes in v2:
>  - Avoid using suspend_late to reset the usagecount
>    as suspend_late might not be called during suspend
>    call failures (Doug).
>
> Changes in v3:
>  - Use force suspend instead of managing device usage_count
>    via runtime put and get API's to trigger callbacks (Doug).
>
> Changes in v4:
>  - Check the return values of pm_runtime_force_suspend and
>    pm_runtime_force_resume API's and pass appropriately (Doug).
>
> Changes in v5:

Can you please put the version number properly in your subject?  It's
really hard to tell one version of your patch from another.


>  - With v4 patch, test cycle has uncovered issues in device resume.
>
>    On bubs: cmd tx failures were seen as SW is sending panel off
>    commands when the dsi resources are turned off.
>
>    Upon suspend, DRM driver will issue a NULL composition to the
>    dpu, followed by turning off all the HW blocks.
>
>    v5 changes will serialize the NULL commit and resource unwinding
>    by handling them under PM prepare and PM complete phases there by
>    ensuring that clks are on when panel off commands are being
>    processed.

I'm still most definitely not an expert in how all the DRM pieces all
hook up together, but the solution you have in this patch seems wrong
to me.  As far as I can tell the "prepare" state isn't supposed to be
actually doing the suspend work and here that's exactly what you're
doing.  I think you should find a different solution to ensure
ordering is correct.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
