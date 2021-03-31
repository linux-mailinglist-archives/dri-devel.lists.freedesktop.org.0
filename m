Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E311350ADA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 01:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7866EBA1;
	Wed, 31 Mar 2021 23:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7A66EBA1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 23:33:49 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id q3so499427qkq.12
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 16:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ryw7Sly4csIxLLkV0t8RVlRi+I4oygJP2r682A3Ebsg=;
 b=XSlzP164vpMabm8VK7gOUDGLcC28VMJkHMTe3WUhvTPmB2LjegZ4XUUKpBnAI+VfX/
 VRJtqvfUH0LXbIQVHPaQmE2CVoSwf73vC7/C2yAl6xriPwSE1pIYCMVoqb6ADYKZtt1H
 ma9YyWtCHNW6GLqQqFMelk3JxyalMU266gNcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ryw7Sly4csIxLLkV0t8RVlRi+I4oygJP2r682A3Ebsg=;
 b=VHeiPFUCIZGMJdFMyKiW7fE60LOg1AxceFUXTb7iCovsYbfu7/Ke7U2HS4HYO1G4Wa
 7vavG65+YSFH2xdiFw5KhvWVRUOnByC3cqiWaoLeVJ1IsNRAEveqbAKXJijzleQudg9L
 fEEekdeIbOuaUchNEf/DinI7mlLi7QcK8W8TQI5mQbokrjfYhB1AGky376oRvUdn7NOF
 0fnS1OGJOX2+qbXfnjpBi0Yj/x4Hkgc2ycyc1ZkourgVULEvX2cav0lS8K0RDYsMSutM
 hyjmNkE+OVzOsqWxQyU4bDd4U7QA1aOZcgl7yetAomZOIngVnJf4mhVbXW2+PJrgP4kr
 22Ew==
X-Gm-Message-State: AOAM531piTK3p3qE4FUu3iMSr6/Xl5qCWfqNtL04MBm5oCWWRuQa7IoX
 K+22hC4AommtC40KnuioQ+v01BCfw/Thhw==
X-Google-Smtp-Source: ABdhPJzbQXLi+BwiUJERsKLS88zpqx8MLe+vCU1zifb3t8kIHZr+Roc7AmTYQf4kXeCMbwpWaAkdZA==
X-Received: by 2002:a05:620a:c0e:: with SMTP id
 l14mr5331680qki.91.1617233628548; 
 Wed, 31 Mar 2021 16:33:48 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169])
 by smtp.gmail.com with ESMTPSA id j18sm2480594qtl.83.2021.03.31.16.33.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 16:33:47 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id l15so23068403ybm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 16:33:47 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr8190661ybp.476.1617233627357; 
 Wed, 31 Mar 2021 16:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210331221630.488498-5-robdclark@gmail.com>
In-Reply-To: <20210331221630.488498-5-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Mar 2021 16:33:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UXoE-UsbfS1zOoKyaiVXPUBAnOr7T2ON4m6-i_43Dm6A@mail.gmail.com>
Message-ID: <CAD=FV=UXoE-UsbfS1zOoKyaiVXPUBAnOr7T2ON4m6-i_43Dm6A@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm: Improved debugfs gem stats
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 31, 2021 at 3:14 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The last patch lost the breakdown of active vs inactive GEM objects in
> $debugfs/gem.  But we can add some better stats to summarize not just
> active vs inactive, but also purgable/purged to make up for that.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_fb.c  |  3 ++-
>  drivers/gpu/drm/msm/msm_gem.c | 31 ++++++++++++++++++++++++-------
>  drivers/gpu/drm/msm/msm_gem.h | 11 ++++++++++-
>  3 files changed, 36 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index d42f0665359a..887172a10c9a 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -33,6 +33,7 @@ static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
>  #ifdef CONFIG_DEBUG_FS
>  void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
>  {
> +       struct msm_gem_stats stats = {{0}};

nit: instead of "{{0}}", can't you just do:

struct msm_gem_stats stats = {};

...both here and for the other usage.

Other than that this seems good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
