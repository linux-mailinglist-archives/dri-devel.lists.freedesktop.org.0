Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF1935163A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 17:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B516E233;
	Thu,  1 Apr 2021 15:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878E06E03A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 15:34:42 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id g8so1198537qvx.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 08:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bgQ3XZ5ITKRGojF0eSgHx7BZvQ88/ghBhXwnDbKAV2I=;
 b=YhJ7jkjScY7JdQhF/7Tt22mZk21tl8MbMM81VDTVwMeS/bumy1w9WGLvBQENfwcpeB
 2ljIOmE/0b06jnmE6dkboTDAy94ze0X9i8gyWwaN4XMFw6NveMfupfnjzjWCFGiD4kIO
 Z5Pg/KYuMKdSJP55scpo50bf+0976bJPooquI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bgQ3XZ5ITKRGojF0eSgHx7BZvQ88/ghBhXwnDbKAV2I=;
 b=uTb+/rMCzGBztwgV3VYib6BZvckKbKYqnJ1Jv0Np3VyiMOmGPKN3TpedPPf5KyqdQ6
 2TfKltVBgslOINhR8gDMPP20XEZW86I3yrAyRNAC9TqLTjAyZOn9/HuCygLfO5LPBiOI
 OFJIINysFRufscuG7EK+SpOzN19QQSotDaLGXXgYuP/2SfxneZoXwrFmoqG3mimNhpHI
 GQKphSQUNZnXPWUssE0Dqz/dti7aPSCCymIMRZTkMyPUEMRBHder/KFNhZYtYc/Mxys0
 5qxeY8keFh5dIA2MLZMgD63pAAWMEa3Om6v5G0Yh36EtcRuRNgvttkzygKWUi7jl+nmz
 qXIg==
X-Gm-Message-State: AOAM533YCTj20U6r5wXcDV3TX4c43uYGUb2Dwt0lHbHLDpide/mQ1lxH
 TOjPdRRy6ccu2h1u2pFXFiAklhbn4g7uMg==
X-Google-Smtp-Source: ABdhPJxHImRzUsaqs2Z9zp7NbStjLYGrIWz+EsBY4/YA+lrC6TkjKZWx1ysMMlWj7UuBHsxYN0UTbg==
X-Received: by 2002:ad4:4aa8:: with SMTP id i8mr8913678qvx.22.1617291281146;
 Thu, 01 Apr 2021 08:34:41 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169])
 by smtp.gmail.com with ESMTPSA id f8sm4215895qkk.23.2021.04.01.08.34.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 08:34:40 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 8so2172504ybc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 08:34:40 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr12794123ybp.476.1617291280047; 
 Thu, 01 Apr 2021 08:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210401012722.527712-1-robdclark@gmail.com>
 <20210401012722.527712-2-robdclark@gmail.com>
In-Reply-To: <20210401012722.527712-2-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 Apr 2021 08:34:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1QUHYw-QkZO-bn+sS_K=KYRe83DfSqVow2RGFXu6nqg@mail.gmail.com>
Message-ID: <CAD=FV=V1QUHYw-QkZO-bn+sS_K=KYRe83DfSqVow2RGFXu6nqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/msm: Remove unused freed llist node
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

On Wed, Mar 31, 2021 at 6:23 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Unused since commit c951a9b284b9 ("drm/msm: Remove msm_gem_free_work")
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.h | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
