Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F105476B0
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 18:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBDC10EB44;
	Sat, 11 Jun 2022 16:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890B710EAE6
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 16:57:16 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id v25so2434262eda.6
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 09:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W83l/pLxbVmfdY4Bh3kAV9FBhPiwp545eDF2N1BjQ/0=;
 b=QZFxcEKrwiT/RpVaiTi05b84+BOEJXjGP0UMn3IqGzce/BDk93ukoGPtqbDYlqaeML
 WwwEbRGvqg0gN2HFDwZCwSPNECNvzPHHpYwbsRW/PpLrRQpmpYITmQ292c5X/16X6nAB
 XC3OXxSNmfDTBC0Q369g5kF7e+6gGX27oEtkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W83l/pLxbVmfdY4Bh3kAV9FBhPiwp545eDF2N1BjQ/0=;
 b=3L/ic7xf+polNTe6tFt/GQyKeH9Jp8/33+q49il7SpPxiKMQsVWJA2tbXQDc2ZbfIV
 VTvvt+vxtzFBgoE0PJVJjBZkZs4SbnWaY02udWOq2GgKs+hqeWy6D4opiFNmEOhJ6Jrp
 WOPxJlitS181r3U8jwIGeZHlztmSUP/crkeTBingxu0AxT3R0Frwa13d/so1cGLlRKb7
 Uhzj/kxdoDffpAzqilt/o9MDGDguA4G2epwlxxPz9bLLy1LfRwWzDfWooXoX/BL9vWnV
 pde3syS8XmmkfFHIewZcPSQO4yNzhek4pb2UR/AMg21a9s63FQp8dypYzAKL+5zszEfn
 2xzA==
X-Gm-Message-State: AOAM53112EyYq6RLtUHMTquyjQj6U2fSNGAUANPa7490V4fpwNd/Cwt9
 56b24VSyEouqzgG2lh4d3r8L5nW129G/OI47SQQ=
X-Google-Smtp-Source: ABdhPJw+uMFfjoVwDqq5vgBLnskDbLR7b+E2c5OI4iXK6VQeufifXuwNoUi71OGBQ6ySER3z777UbQ==
X-Received: by 2002:a05:6402:401f:b0:433:406a:82c2 with SMTP id
 d31-20020a056402401f00b00433406a82c2mr14979929eda.289.1654966634749; 
 Sat, 11 Jun 2022 09:57:14 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 n2-20020a17090695c200b006fe99b66198sm1254686ejy.60.2022.06.11.09.57.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 09:57:14 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id e5so929012wma.0
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 09:57:13 -0700 (PDT)
X-Received: by 2002:a05:600c:591:b0:39c:4544:b814 with SMTP id
 o17-20020a05600c059100b0039c4544b814mr5603093wmd.118.1654966633270; Sat, 11
 Jun 2022 09:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220611182119.4e115fba@canb.auug.org.au>
In-Reply-To: <20220611182119.4e115fba@canb.auug.org.au>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 11 Jun 2022 09:57:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X2cwr_s3bQJk0hOb88-zPrZR-2fKxP8yKSAy9vuKFtzQ@mail.gmail.com>
Message-ID: <CAD=FV=X2cwr_s3bQJk0hOb88-zPrZR-2fKxP8yKSAy9vuKFtzQ@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Jun 11, 2022 at 1:21 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced these warnings:
>
> Documentation/gpu/drm-kms-helpers:241: include/drm/display/drm_dp_helper.h:377: WARNING: Unexpected indentation.
> Documentation/gpu/drm-kms-helpers:241: include/drm/display/drm_dp_helper.h:378: WARNING: Block quote ends without a blank line; unexpected unindent.
>
> Introduced by commit
>
>   69ef4a192bba ("drm: Document the power requirements for DP AUX transfers")

Thanks for the report. Fixed by:

https://lore.kernel.org/r/20220611095445.1.I534072d346b1ebbf0db565b714de9b65cbb24651@changeid

I'll plan to land it as soon as I see a Reviewed-by.

-Doug
