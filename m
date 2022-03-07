Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46814D03F2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 17:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABD210E073;
	Mon,  7 Mar 2022 16:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3964A10E073
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 16:21:50 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id g19so2735978pfc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 08:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DX8hA92+6ojNQWZyZJ93a2d+MptqiD4L/B2wjvepiII=;
 b=cO5GUvnTabLpBSlGKWjF2eN0C9yQMpR3JuOgJJZuvDx98QUvYd9jUXTE+3XAtvil0L
 rmsj+ZmNfC0Yh3XFdBdpiOlm7Z68eHV4A4bt//ONM7xiXQvlENsb6ryLHDZWBwCbUyGe
 cweFJ9rBIEqcJVCB9p5kBrLMlnuJEBL1mXQbvaL9byOtrTsodftEL+1R3t6WjkDfEHG4
 KKFufEMpxkrGAH4QRRPdYb1JthSz5NVfU9kNObsrkrlFoxcq27GRbeK5aLgnYTN31AtK
 wsjnyb57dubvt3gDCiYP3PWUsDB6Df2H6Zzu041sbP5GYM+1y+/dH/aV3ljtIBUSGdCz
 EEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DX8hA92+6ojNQWZyZJ93a2d+MptqiD4L/B2wjvepiII=;
 b=BhO1dJ8h6r3NHRQj7NenGgIZJwaT2mH73JqYG7qXdWP72H/uv2gCOhZWZx1wTiiN3y
 5sFQbIIqLcpvcMkD2aH6NciPfBKXkACShnF3Vo+Z7zCxznqFDv/xcLAVq3CTFlkXebMK
 DWlw9bke/x2zIadv3LtXDb6TCSJSaym4W8k9sskquaVHBQ8iecZN+80CTxdOMUyqCKLD
 CNPya8nbzFQi5OC2c2Xu8k2+hcDSnpLmn/qziyW0MT0dlqAe+/Id2+qrilvutxyCTBzl
 eeLeLBVwaJVqZCb2rWGktUz6loNjAbQSJqsqES+rVnoEt4XGNxisDXv+OXi9SKmClLLV
 GFlA==
X-Gm-Message-State: AOAM531CvnMjfBDqSixf5KfSIkWcWY0tR1rPNDo1S3IdazQTI1aJM1p7
 3esMIF/8+OFROstGOIHEKF06IvBVBRt1F+T9Tf+3LKmm
X-Google-Smtp-Source: ABdhPJyM8Trc8TL4KWxYM+x/fJTfjVjF1oUmRC/8yEvTZxR5pfNqDGpeJG8ydTMNgdMX8zofOqe4tJLc5QD926YUIRs=
X-Received: by 2002:a05:6a00:24c5:b0:4d1:65bf:1fe0 with SMTP id
 d5-20020a056a0024c500b004d165bf1fe0mr13448612pfv.0.1646670109780; Mon, 07 Mar
 2022 08:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20220306203619.22624-1-tzimmermann@suse.de>
In-Reply-To: <20220306203619.22624-1-tzimmermann@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 7 Mar 2022 17:21:37 +0100
Message-ID: <CAMeQTsY2xdMxSCcOtnNuNPUdUkj8LHrmoYkqLLgJU+ta=m9xUw@mail.gmail.com>
Subject: Re: [PATCH 00/10] drm/gma500: Various cleanups to GEM code
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 6, 2022 at 9:36 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Refactor and simplify various parts of the memory management. This
> includes locking, initialization and finalizer functions, and code
> organization.
>
> Tested on Atom N2800 hardware.

Hi Thomas, nice cleanups!

All patches are:
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

>
> Thomas Zimmermann (10):
>   drm/gma500: Remove struct psb_gem_object.npage
>   drm/gma500: Acquire reservation lock for GEM objects
>   drm/gma500: Move GTT locking into GTT helpers
>   drm/gma500: Remove struct psb_gtt.sem sempahore
>   drm/gma500: Move GTT setup and restoration into helper funtions
>   drm/gma500: Move GTT resume logic out of psb_gtt_init()
>   drm/gma500: Cleanup GTT uninit and error handling
>   drm/gma500: Split GTT init/resume/fini into GTT and GEM functions
>   drm/gma500: Inline psb_gtt_restore()
>   drm/gma500: Move GEM memory management functions to gem.c
>
>  drivers/gpu/drm/gma500/gem.c         | 161 ++++++++++++++++--
>  drivers/gpu/drm/gma500/gem.h         |  13 +-
>  drivers/gpu/drm/gma500/gma_display.c |   8 +-
>  drivers/gpu/drm/gma500/gtt.c         | 239 +++++++++++++--------------
>  drivers/gpu/drm/gma500/gtt.h         |   8 +-
>  drivers/gpu/drm/gma500/power.c       |   5 +-
>  drivers/gpu/drm/gma500/psb_drv.c     |  13 +-
>  drivers/gpu/drm/gma500/psb_drv.h     |   1 -
>  8 files changed, 296 insertions(+), 152 deletions(-)
>
>
> base-commit: 710a019ad85e96e66f7d75ee7f4733cdd8a2b0d0
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: 6e1032c6302461624f33194c8b8f37103a3fa6ef
> --
> 2.35.1
>
