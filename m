Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0371D39ADFF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 00:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3502A6F53A;
	Thu,  3 Jun 2021 22:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666B06F53A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 22:28:21 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 c31-20020a056830349fb02903a5bfa6138bso7290136otu.7
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 15:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NRaH6xYMOH9GBGnTmQ420f8rw11U6mdSQMJDfrz+ZTs=;
 b=C+n0G5uElXJr/WoVIEjsjtoL5nhie/oOvw86cte9R2nu8k55JrzLfXqOqJYfxmCPPQ
 KPBLShW5gurS0IURrM6OflTCHWf3Rx3LLsMewCI4nfKSb0xLsu7fX7lKZCGtfodTgwAm
 O+/NjRH1wKXHX8+1RtyOD6J2noJdQ4wfqX+Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NRaH6xYMOH9GBGnTmQ420f8rw11U6mdSQMJDfrz+ZTs=;
 b=kLiraiwRSW8R5x6xbdi/3E00byujNAeaWfpHnAkASTlRRMMyRPvs91lrh1mvpFpPfG
 mBnsYITpgTt7YDvo14gP6YbJMS40KUVRTyn09RMIjoEMbzdxwDuZhXJcbSe1Ksx6tQu5
 gQHARyxbITJFmxhPvj0/prBFHUze1ad5MaojpB9cwdujpOBg3gukpA9ZPqwYm/aCET2g
 6eHS7/USphNQS7pCNJlRAt4P+/kgCILi8s5IVzyv/j0GqXsgRpMDoPVgF6vtVgMAOse/
 EqWCsrXRWtPyjqkLwK3a9rl5+kUTBARh3wPnoxha/BnRvVffaNsJSJpRmTek8TDLQ/3I
 nYXg==
X-Gm-Message-State: AOAM532yzkx0C3AX6+HF0Wv+NOvUMU0H7LUfMYBb2yHj89nqC/qPKYof
 5apmd6rDs2OJf1bYNAcY18Q7RguciyZgxlgY8Lha8Q==
X-Google-Smtp-Source: ABdhPJwngIQHqkXr8tNBFZq9yhVmK+A8kDiQKemQ82pD6xIk2L4DEDRbNLEodp7oRyr6RrAt7a2pPXoLvBYoMWvohMM=
X-Received: by 2002:a05:6830:1155:: with SMTP id
 x21mr1243547otq.303.1622759300667; 
 Thu, 03 Jun 2021 15:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210603215819.3904733-1-keescook@chromium.org>
In-Reply-To: <20210603215819.3904733-1-keescook@chromium.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 4 Jun 2021 00:28:09 +0200
Message-ID: <CAKMK7uGbGSw-hDSq7+RM-LzdKeNcaf1Fn6SRfo=4WMJPXyA7rg@mail.gmail.com>
Subject: Re: [PATCH] drm/pl111: Actually fix CONFIG_VEXPRESS_CONFIG depends
To: Kees Cook <keescook@chromium.org>
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
 dri-devel <dri-devel@lists.freedesktop.org>, Emma Anholt <emma@anholt.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 11:58 PM Kees Cook <keescook@chromium.org> wrote:
>
> VEXPRESS_CONFIG needs to either be missing, built-in, or modular when
> pl111 is modular. Update the Kconfig to reflect the need.
>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Fixes: 4dc7c97d04dc ("drm/pl111: depend on CONFIG_VEXPRESS_CONFIG")
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/gpu/drm/pl111/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> index c5210a5bef1b..b84879ca430d 100644
> --- a/drivers/gpu/drm/pl111/Kconfig
> +++ b/drivers/gpu/drm/pl111/Kconfig
> @@ -2,7 +2,8 @@
>  config DRM_PL111
>         tristate "DRM Support for PL111 CLCD Controller"
>         depends on DRM
> -       depends on VEXPRESS_CONFIG
> +       depends on ARM || ARM64 || COMPILE_TEST
> +       depends on !VEXPRESS_CONFIG || VEXPRESS_CONFIG=DRM

Hm I thought the canonical way to express optional depdencies was


>         depends on COMMON_CLK
>         select DRM_KMS_HELPER
>         select DRM_KMS_CMA_HELPER
> --
> 2.25.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
